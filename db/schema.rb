# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_07_31_151447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "account_emailaddress", id: :serial, force: :cascade do |t|
    t.string "email", limit: 254, null: false
    t.boolean "verified", null: false
    t.boolean "primary", null: false
    t.integer "user_id", null: false
    t.index ["email"], name: "account_emailaddress_email_03be32b2_like", opclass: :varchar_pattern_ops
    t.index ["email"], name: "account_emailaddress_email_key", unique: true
    t.index ["user_id"], name: "account_emailaddress_user_id_2c513194"
  end

  create_table "account_emailconfirmation", id: :serial, force: :cascade do |t|
    t.datetime "created", null: false
    t.datetime "sent"
    t.string "key", limit: 64, null: false
    t.integer "email_address_id", null: false
    t.index ["email_address_id"], name: "account_emailconfirmation_email_address_id_5b7f8c58"
    t.index ["key"], name: "account_emailconfirmation_key_f43612bd_like", opclass: :varchar_pattern_ops
    t.index ["key"], name: "account_emailconfirmation_key_key", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "auth_group", id: :serial, force: :cascade do |t|
    t.string "name", limit: 150, null: false
    t.index ["name"], name: "auth_group_name_a6ea08ec_like", opclass: :varchar_pattern_ops
    t.index ["name"], name: "auth_group_name_key", unique: true
  end

  create_table "auth_group_permissions", id: :serial, force: :cascade do |t|
    t.integer "group_id", null: false
    t.integer "permission_id", null: false
    t.index ["group_id", "permission_id"], name: "auth_group_permissions_group_id_permission_id_0cd325b0_uniq", unique: true
    t.index ["group_id"], name: "auth_group_permissions_group_id_b120cbf9"
    t.index ["permission_id"], name: "auth_group_permissions_permission_id_84c5c92e"
  end

  create_table "auth_permission", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "content_type_id", null: false
    t.string "codename", limit: 100, null: false
    t.index ["content_type_id", "codename"], name: "auth_permission_content_type_id_codename_01ab375a_uniq", unique: true
    t.index ["content_type_id"], name: "auth_permission_content_type_id_2f476e4b"
  end

  create_table "auth_user", id: :serial, force: :cascade do |t|
    t.string "password", limit: 128, null: false
    t.datetime "last_login"
    t.boolean "is_superuser", null: false
    t.string "username", limit: 150, null: false
    t.string "first_name", limit: 30, null: false
    t.string "last_name", limit: 150, null: false
    t.string "email", limit: 254, null: false
    t.boolean "is_staff", null: false
    t.boolean "is_active", null: false
    t.datetime "date_joined", null: false
    t.index ["username"], name: "auth_user_username_6821ab7c_like", opclass: :varchar_pattern_ops
    t.index ["username"], name: "auth_user_username_key", unique: true
  end

  create_table "auth_user_groups", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "group_id", null: false
    t.index ["group_id"], name: "auth_user_groups_group_id_97559544"
    t.index ["user_id", "group_id"], name: "auth_user_groups_user_id_group_id_94350c0c_uniq", unique: true
    t.index ["user_id"], name: "auth_user_groups_user_id_6a12ed8b"
  end

  create_table "auth_user_user_permissions", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "permission_id", null: false
    t.index ["permission_id"], name: "auth_user_user_permissions_permission_id_1fbb5f2c"
    t.index ["user_id", "permission_id"], name: "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq", unique: true
    t.index ["user_id"], name: "auth_user_user_permissions_user_id_a95ead1b"
  end

  create_table "bilans_bilan", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.date "date", null: false
    t.float "total_emissions_co2", null: false
    t.float "total_employees", null: false
    t.float "total_scope_1", null: false
    t.float "total_scope_2", null: false
    t.float "total_scope_3", null: false
    t.float "total_offset_co2", null: false
    t.float "total_reduction_co2", null: false
  end

  create_table "bilans_bilancompany", id: :serial, force: :cascade do |t|
    t.integer "bilan_id", null: false
    t.integer "company_id", null: false
    t.integer "community_calculator_id"
    t.index ["bilan_id"], name: "bilans_bilancompany_bilan_id_key", unique: true
    t.index ["community_calculator_id"], name: "bilans_bilancompany_community_calculator_id_a8d79f4d_uniq", unique: true
    t.index ["company_id"], name: "bilans_bilancompany_company_id_8464d012"
  end

  create_table "bilans_emissiondriver", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "segment", limit: 50, null: false
    t.text "description"
    t.integer "type_of_emission_id", null: false
    t.index ["type_of_emission_id"], name: "bilans_emissiondriver_type_of_emission_id_9670b844"
  end

  create_table "bilans_emissionquantity", id: :serial, force: :cascade do |t|
    t.float "quantity_t_co2", null: false
    t.integer "bilan_id", null: false
    t.integer "driver_of_emission_id", null: false
    t.index ["bilan_id"], name: "bilans_emissionquantity_bilan_id_be3d0242"
    t.index ["driver_of_emission_id"], name: "bilans_emissionquantity_driver_of_emission_id_fddce097"
  end

  create_table "bilans_emissiontype", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description", null: false
  end

  create_table "calculator_calculator", id: :serial, force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_date"
    t.boolean "is_finished", null: false
    t.datetime "terminated_date"
    t.float "total_co2", null: false
    t.string "country", limit: 2, null: false
    t.string "name", limit: 100
    t.boolean "diet_step_completed", null: false
    t.boolean "energy_step_completed", null: false
    t.boolean "household_step_completed", null: false
    t.boolean "plane_step_completed", null: false
    t.boolean "transport_step_completed", null: false
    t.boolean "bilan_step_completed", null: false
    t.index ["user_id"], name: "calculator_calculator_user_id_0c53d7df"
  end

  create_table "calculator_car", id: :serial, force: :cascade do |t|
    t.string "type_of_car", limit: 200
    t.float "km_per_month"
    t.integer "transport_id", null: false
    t.float "total_co2", null: false
    t.index ["transport_id"], name: "calculator_car_transport_id_65954e6d"
  end

  create_table "calculator_communitycalculator", id: :serial, force: :cascade do |t|
    t.datetime "created_date"
    t.string "name", limit: 100
    t.datetime "terminated_date"
    t.float "household_emissions", null: false
    t.float "energy_emissions", null: false
    t.float "transport_emissions", null: false
    t.float "plane_emissions", null: false
    t.float "diet_emissions", null: false
    t.integer "community_id", null: false
    t.float "total_co2", null: false
    t.index ["community_id"], name: "calculator_communitycalculator_community_id_cb6fad25"
  end

  create_table "calculator_communitycalculatorlink", id: :serial, force: :cascade do |t|
    t.integer "calculator_id", null: false
    t.integer "community_calculator_id", null: false
    t.index ["calculator_id"], name: "calculator_communitycalculatorlink_calculator_id_5e3f7dbc"
    t.index ["community_calculator_id"], name: "calculator_communitycalcul_community_calculator_id_7cb201cc"
  end

  create_table "calculator_countryemission", id: :serial, force: :cascade do |t|
    t.string "country", limit: 2, null: false
    t.float "avg_emission", null: false
    t.float "avg_home_size", null: false
    t.index ["country"], name: "calculator_countryemission_country_b1efe142_like", opclass: :varchar_pattern_ops
    t.index ["country"], name: "calculator_countryemission_country_key", unique: true
  end

  create_table "calculator_diet", id: :serial, force: :cascade do |t|
    t.string "diet", limit: 100, null: false
    t.integer "calculator_id", null: false
    t.float "total_co2", null: false
    t.index ["calculator_id"], name: "calculator_diet_calculator_id_69a6f64d_uniq", unique: true
  end

  create_table "calculator_electricbike", id: :serial, force: :cascade do |t|
    t.float "km_per_month"
    t.integer "transport_id", null: false
    t.float "total_co2", null: false
    t.index ["transport_id"], name: "calculator_electricbike_transport_id_d9fa178b"
  end

  create_table "calculator_energy", id: :serial, force: :cascade do |t|
    t.float "monthly_invoice"
    t.boolean "monthly_invoice_unknown", null: false
    t.string "energy_type", limit: 200, null: false
    t.float "renewable_energy", null: false
    t.integer "calculator_id", null: false
    t.float "total_co2", null: false
    t.index ["calculator_id"], name: "calculator_energy_calculator_id_1f8b2825_uniq", unique: true
  end

  create_table "calculator_household", id: :serial, force: :cascade do |t|
    t.string "home_type", limit: 100, null: false
    t.integer "home_size", limit: 2, null: false
    t.integer "calculator_id", null: false
    t.float "total_co2", null: false
    t.index ["calculator_id"], name: "calculator_household_calculator_id_f5e0fc7e_uniq", unique: true
  end

  create_table "calculator_motorcycle", id: :serial, force: :cascade do |t|
    t.string "power", limit: 20
    t.float "km_per_month"
    t.integer "transport_id", null: false
    t.float "total_co2", null: false
    t.index ["transport_id"], name: "calculator_motorcycle_transport_id_1813845b"
  end

  create_table "calculator_plane", id: :serial, force: :cascade do |t|
    t.float "hours_per_year", null: false
    t.integer "calculator_id", null: false
    t.float "total_co2", null: false
    t.index ["calculator_id"], name: "calculator_plane_calculator_id_36f618bd_uniq", unique: true
  end

  create_table "calculator_transport", id: :serial, force: :cascade do |t|
    t.integer "km_per_month_train", limit: 2
    t.integer "km_per_month_bus", limit: 2
    t.integer "km_per_month_subway", limit: 2
    t.integer "km_per_month_tram", limit: 2
    t.integer "km_per_month_bike", limit: 2
    t.integer "km_per_month_walk", limit: 2
    t.integer "calculator_id", null: false
    t.float "total_co2", null: false
    t.index ["calculator_id"], name: "calculator_transport_calculator_id_8377762b_uniq", unique: true
  end

  create_table "captcha_captchastore", id: :serial, force: :cascade do |t|
    t.string "challenge", limit: 32, null: false
    t.string "response", limit: 32, null: false
    t.string "hashkey", limit: 40, null: false
    t.datetime "expiration", null: false
    t.index ["hashkey"], name: "captcha_captchastore_hashkey_cbe8d15a_like", opclass: :varchar_pattern_ops
    t.index ["hashkey"], name: "captcha_captchastore_hashkey_key", unique: true
  end

  create_table "carbon_report_activitydata", id: :serial, force: :cascade do |t|
    t.float "total_emission"
    t.float "value", null: false
    t.string "unit", limit: 100, null: false
    t.float "uncertainty", null: false
    t.integer "category_id", null: false
    t.integer "emission_factor_id", null: false
    t.integer "report_id", null: false
    t.index ["category_id"], name: "carbon_report_activitydata_category_id_bb2d9b06"
    t.index ["emission_factor_id"], name: "carbon_report_activitydata_emission_factor_id_fe3328c4"
    t.index ["report_id"], name: "carbon_report_activitydata_report_id_164ef9ab"
  end

  create_table "carbon_report_category", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "integer", limit: 2, null: false
    t.string "scope", limit: 50, null: false
    t.integer "driver_id", null: false
    t.index ["driver_id"], name: "carbon_report_category_driver_id_fd7716cf"
  end

  create_table "carbon_report_driver", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
  end

  create_table "carbon_report_emissionfactor", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "year", null: false
    t.float "uncertainty", null: false
    t.float "value", null: false
    t.string "decomposition", limit: 50, null: false
    t.string "particularity", limit: 50
    t.string "source", limit: 200
    t.date "valid_from"
    t.date "valid_to"
    t.string "location", limit: 100
    t.string "unit", limit: 100
    t.integer "emission_familiy_id"
    t.index ["emission_familiy_id"], name: "carbon_report_emissionfactor_emission_familiy_id_0179c7a9"
  end

  create_table "carbon_report_emissionfamily", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
  end

  create_table "carbon_report_report", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.date "date", null: false
    t.integer "company_id", null: false
    t.integer "number_of_employees_office", null: false
    t.integer "number_of_employees_warehouse", null: false
    t.integer "surface_area_office", null: false
    t.integer "surface_area_warehouse", null: false
    t.index ["company_id"], name: "carbon_report_report_company_id_f1faa84b"
  end

  create_table "cms_aliaspluginmodel", primary_key: "cmsplugin_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "plugin_id"
    t.integer "alias_placeholder_id"
    t.index ["alias_placeholder_id"], name: "cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a"
    t.index ["plugin_id"], name: "cms_aliaspluginmodel_plugin_id_9867676e"
  end

  create_table "cms_cmsplugin", id: :serial, force: :cascade do |t|
    t.integer "position", limit: 2, null: false
    t.string "language", limit: 15, null: false
    t.string "plugin_type", limit: 50, null: false
    t.datetime "creation_date", null: false
    t.datetime "changed_date", null: false
    t.integer "parent_id"
    t.integer "placeholder_id"
    t.integer "depth", null: false
    t.integer "numchild", null: false
    t.string "path", limit: 255, null: false
    t.index ["language"], name: "cms_cmsplugin_language_bbea8a48"
    t.index ["language"], name: "cms_cmsplugin_language_bbea8a48_like", opclass: :varchar_pattern_ops
    t.index ["parent_id"], name: "cms_cmsplugin_parent_id_fd3bd9dd"
    t.index ["path"], name: "cms_cmsplugin_path_4917bb44_like", opclass: :varchar_pattern_ops
    t.index ["path"], name: "cms_cmsplugin_path_4917bb44_uniq", unique: true
    t.index ["placeholder_id"], name: "cms_cmsplugin_placeholder_id_0bfa3b26"
    t.index ["plugin_type"], name: "cms_cmsplugin_plugin_type_94e96ebf"
    t.index ["plugin_type"], name: "cms_cmsplugin_plugin_type_94e96ebf_like", opclass: :varchar_pattern_ops
  end

  create_table "cms_globalpagepermission", id: :serial, force: :cascade do |t|
    t.boolean "can_change", null: false
    t.boolean "can_add", null: false
    t.boolean "can_delete", null: false
    t.boolean "can_change_advanced_settings", null: false
    t.boolean "can_publish", null: false
    t.boolean "can_change_permissions", null: false
    t.boolean "can_move_page", null: false
    t.boolean "can_view", null: false
    t.boolean "can_recover_page", null: false
    t.integer "group_id"
    t.integer "user_id"
    t.index ["group_id"], name: "cms_globalpagepermission_group_id_991b4733"
    t.index ["user_id"], name: "cms_globalpagepermission_user_id_a227cee1"
  end

  create_table "cms_globalpagepermission_sites", id: :serial, force: :cascade do |t|
    t.integer "globalpagepermission_id", null: false
    t.integer "site_id", null: false
    t.index ["globalpagepermission_id", "site_id"], name: "cms_globalpagepermission_globalpagepermission_id__db684f41_uniq", unique: true
    t.index ["globalpagepermission_id"], name: "cms_globalpagepermission_sites_globalpagepermission_id_46bd2681"
    t.index ["site_id"], name: "cms_globalpagepermission_sites_site_id_00460b53"
  end

  create_table "cms_page", id: :serial, force: :cascade do |t|
    t.string "created_by", limit: 255, null: false
    t.string "changed_by", limit: 255, null: false
    t.datetime "creation_date", null: false
    t.datetime "changed_date", null: false
    t.datetime "publication_date"
    t.datetime "publication_end_date"
    t.boolean "in_navigation", null: false
    t.boolean "soft_root", null: false
    t.string "reverse_id", limit: 40
    t.string "navigation_extenders", limit: 80
    t.string "template", limit: 100, null: false
    t.boolean "login_required", null: false
    t.integer "limit_visibility_in_menu", limit: 2
    t.boolean "is_home", null: false
    t.string "application_urls", limit: 200
    t.string "application_namespace", limit: 200
    t.boolean "publisher_is_draft", null: false
    t.string "languages", limit: 255
    t.integer "xframe_options", null: false
    t.integer "publisher_public_id"
    t.boolean "is_page_type", null: false
    t.integer "node_id", null: false
    t.index ["application_urls"], name: "cms_page_application_urls_9ef47497"
    t.index ["application_urls"], name: "cms_page_application_urls_9ef47497_like", opclass: :varchar_pattern_ops
    t.index ["in_navigation"], name: "cms_page_in_navigation_01c24279"
    t.index ["is_home"], name: "cms_page_is_home_edadca07"
    t.index ["limit_visibility_in_menu"], name: "cms_page_limit_visibility_in_menu_30db6aa6"
    t.index ["navigation_extenders"], name: "cms_page_navigation_extenders_c24af8dd"
    t.index ["navigation_extenders"], name: "cms_page_navigation_extenders_c24af8dd_like", opclass: :varchar_pattern_ops
    t.index ["node_id", "publisher_is_draft"], name: "cms_page_node_id_publisher_is_draft_c1293d6a_uniq", unique: true
    t.index ["node_id"], name: "cms_page_node_id_c87b85a9"
    t.index ["publication_date"], name: "cms_page_publication_date_684fabf7"
    t.index ["publication_end_date"], name: "cms_page_publication_end_date_12a0c46a"
    t.index ["publisher_is_draft"], name: "cms_page_publisher_is_draft_141cba60"
    t.index ["publisher_public_id"], name: "cms_page_publisher_public_id_key", unique: true
    t.index ["reverse_id"], name: "cms_page_reverse_id_ffc9ede2"
    t.index ["reverse_id"], name: "cms_page_reverse_id_ffc9ede2_like", opclass: :varchar_pattern_ops
    t.index ["soft_root"], name: "cms_page_soft_root_51efccbe"
  end

  create_table "cms_page_placeholders", id: :serial, force: :cascade do |t|
    t.integer "page_id", null: false
    t.integer "placeholder_id", null: false
    t.index ["page_id", "placeholder_id"], name: "cms_page_placeholders_page_id_placeholder_id_ab7fbfb8_uniq", unique: true
    t.index ["page_id"], name: "cms_page_placeholders_page_id_f2ce8dec"
    t.index ["placeholder_id"], name: "cms_page_placeholders_placeholder_id_6b120886"
  end

  create_table "cms_pagepermission", id: :serial, force: :cascade do |t|
    t.boolean "can_change", null: false
    t.boolean "can_add", null: false
    t.boolean "can_delete", null: false
    t.boolean "can_change_advanced_settings", null: false
    t.boolean "can_publish", null: false
    t.boolean "can_change_permissions", null: false
    t.boolean "can_move_page", null: false
    t.boolean "can_view", null: false
    t.integer "grant_on", null: false
    t.integer "group_id"
    t.integer "page_id"
    t.integer "user_id"
    t.index ["group_id"], name: "cms_pagepermission_group_id_af5af193"
    t.index ["page_id"], name: "cms_pagepermission_page_id_0ae9a163"
    t.index ["user_id"], name: "cms_pagepermission_user_id_0c7d2b3c"
  end

  create_table "cms_pageuser", primary_key: "user_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "created_by_id", null: false
    t.index ["created_by_id"], name: "cms_pageuser_created_by_id_8e9fbf83"
  end

  create_table "cms_pageusergroup", primary_key: "group_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.integer "created_by_id", null: false
    t.index ["created_by_id"], name: "cms_pageusergroup_created_by_id_7d57fa39"
  end

  create_table "cms_placeholder", id: :serial, force: :cascade do |t|
    t.string "slot", limit: 255, null: false
    t.integer "default_width", limit: 2
    t.index ["slot"], name: "cms_placeholder_slot_0bc04d21"
    t.index ["slot"], name: "cms_placeholder_slot_0bc04d21_like", opclass: :varchar_pattern_ops
  end

  create_table "cms_placeholderreference", primary_key: "cmsplugin_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.integer "placeholder_ref_id"
    t.index ["placeholder_ref_id"], name: "cms_placeholderreference_placeholder_ref_id_244759b1"
  end

  create_table "cms_staticplaceholder", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, null: false
    t.string "code", limit: 255, null: false
    t.boolean "dirty", null: false
    t.string "creation_method", limit: 20, null: false
    t.integer "draft_id"
    t.integer "public_id"
    t.integer "site_id"
    t.index ["code", "site_id"], name: "cms_staticplaceholder_code_site_id_21ba079c_uniq", unique: true
    t.index ["draft_id"], name: "cms_staticplaceholder_draft_id_5aee407b"
    t.index ["public_id"], name: "cms_staticplaceholder_public_id_876aaa66"
    t.index ["site_id"], name: "cms_staticplaceholder_site_id_dc6a85b6"
  end

  create_table "cms_title", id: :serial, force: :cascade do |t|
    t.string "language", limit: 15, null: false
    t.string "title", limit: 255, null: false
    t.string "page_title", limit: 255
    t.string "menu_title", limit: 255
    t.text "meta_description"
    t.string "slug", limit: 255, null: false
    t.string "path", limit: 255, null: false
    t.boolean "has_url_overwrite", null: false
    t.string "redirect", limit: 2048
    t.datetime "creation_date", null: false
    t.boolean "published", null: false
    t.boolean "publisher_is_draft", null: false
    t.integer "publisher_state", limit: 2, null: false
    t.integer "page_id", null: false
    t.integer "publisher_public_id"
    t.index ["has_url_overwrite"], name: "cms_title_has_url_overwrite_ecf27bb9"
    t.index ["language", "page_id"], name: "cms_title_language_page_id_61aaf084_uniq", unique: true
    t.index ["language"], name: "cms_title_language_50a0dfa1"
    t.index ["language"], name: "cms_title_language_50a0dfa1_like", opclass: :varchar_pattern_ops
    t.index ["page_id"], name: "cms_title_page_id_5fade2a3"
    t.index ["path"], name: "cms_title_path_c484314c"
    t.index ["path"], name: "cms_title_path_c484314c_like", opclass: :varchar_pattern_ops
    t.index ["publisher_is_draft"], name: "cms_title_publisher_is_draft_95874c88"
    t.index ["publisher_public_id"], name: "cms_title_publisher_public_id_key", unique: true
    t.index ["publisher_state"], name: "cms_title_publisher_state_9a952b0f"
    t.index ["slug"], name: "cms_title_slug_4947d146"
    t.index ["slug"], name: "cms_title_slug_4947d146_like", opclass: :varchar_pattern_ops
  end

  create_table "cms_treenode", id: :serial, force: :cascade do |t|
    t.string "path", limit: 255, null: false
    t.integer "depth", null: false
    t.integer "numchild", null: false
    t.integer "parent_id"
    t.integer "site_id", null: false
    t.index ["parent_id"], name: "cms_treenode_parent_id_59bb02c4"
    t.index ["path"], name: "cms_treenode_path_6eb22885_like", opclass: :varchar_pattern_ops
    t.index ["path"], name: "cms_treenode_path_key", unique: true
    t.index ["site_id"], name: "cms_treenode_site_id_d3f46985"
  end

  create_table "cms_urlconfrevision", id: :serial, force: :cascade do |t|
    t.string "revision", limit: 255, null: false
  end

  create_table "cms_usersettings", id: :serial, force: :cascade do |t|
    t.string "language", limit: 10, null: false
    t.integer "clipboard_id"
    t.integer "user_id", null: false
    t.index ["clipboard_id"], name: "cms_usersettings_clipboard_id_3ae17c19"
    t.index ["user_id"], name: "cms_usersettings_user_id_key", unique: true
  end

  create_table "community_community", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "community_code", limit: 100, null: false
    t.text "description", null: false
    t.integer "company_id"
    t.string "logo", limit: 100
    t.index ["community_code"], name: "community_community_community_code_b272690a_like", opclass: :varchar_pattern_ops
    t.index ["community_code"], name: "community_community_community_code_key", unique: true
    t.index ["company_id"], name: "community_community_company_id_bc1cb349"
  end

  create_table "community_communitymember", id: :serial, force: :cascade do |t|
    t.integer "community_id"
    t.integer "individual_id", null: false
    t.index ["community_id"], name: "community_communitymember_community_id_baac9ba5"
    t.index ["individual_id"], name: "community_communitymember_individual_id_94a9fbf8"
  end

  create_table "community_individual", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 200
    t.string "last_name", limit: 200
    t.string "email", limit: 200
    t.string "phone_number", limit: 200
    t.string "function", limit: 200
    t.string "profile_picture", limit: 100
    t.boolean "profile_completed", null: false
    t.integer "company_id"
    t.integer "user_id", null: false
    t.date "date_of_birth"
    t.string "cover_picture", limit: 100
    t.string "customer_stripe_id", limit: 100
    t.index ["company_id"], name: "community_individual_company_id_136d65d0"
    t.index ["user_id"], name: "community_individual_user_id_key", unique: true
  end

  create_table "companies_company", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "organization_type", limit: 200
    t.text "description"
    t.string "logo", limit: 100
    t.string "profile_picture", limit: 100
    t.string "first_name", limit: 200
    t.string "last_name", limit: 200
    t.string "email", limit: 254
    t.string "address_line_1", limit: 120
    t.string "address_line_2", limit: 120
    t.string "city", limit: 120
    t.string "country", limit: 120
    t.string "state", limit: 120
    t.string "postal_code", limit: 120
    t.string "number_of_employees", limit: 200
    t.string "turnover", limit: 200
    t.integer "user_id"
    t.boolean "profile_completed", null: false
    t.boolean "general_company_info_completed", null: false
    t.string "job_function", limit: 200
    t.string "facebook_url", limit: 300
    t.string "instagram_url", limit: 300
    t.string "linkedin_url", limit: 300
    t.string "twitter_url", limit: 300
    t.float "t_co2_compensated", null: false
    t.float "t_co2_avg_employees", null: false
    t.float "eur_per_t_co2", null: false
    t.string "slug", limit: 100
    t.string "company_website", limit: 300
    t.text "short_description"
    t.boolean "active", null: false
    t.boolean "flag_project", null: false
    t.string "referral", limit: 200
    t.boolean "has_carbon_report", null: false
    t.string "industry", limit: 100
    t.boolean "has_sbti", null: false
    t.string "bce_link", limit: 300
    t.string "nace_code", limit: 100
    t.integer "referral_year", null: false
    t.boolean "is_demo", null: false
    t.index ["slug"], name: "companies_company_slug_cddc66aa_like", opclass: :varchar_pattern_ops
    t.index ["slug"], name: "companies_company_slug_key", unique: true
    t.index ["user_id"], name: "companies_company_user_id_key", unique: true
  end

  create_table "companies_company_sector", id: :serial, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "sector_id", null: false
    t.index ["company_id", "sector_id"], name: "companies_company_sector_company_id_sector_id_7b7ccb9c_uniq", unique: true
    t.index ["company_id"], name: "companies_company_sector_company_id_6fdc8870"
    t.index ["sector_id"], name: "companies_company_sector_sector_id_8e1afde2"
  end

  create_table "companies_companysdg", id: :serial, force: :cascade do |t|
    t.integer "company_id", null: false
    t.integer "sdg_id", null: false
    t.index ["company_id"], name: "companies_companysdg_company_id_ff53e541"
    t.index ["sdg_id"], name: "companies_companysdg_sdg_id_af55789a"
  end

  create_table "companies_contact", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 100
    t.string "last_name", limit: 100
    t.string "email", limit: 254, null: false
    t.datetime "created_date"
    t.integer "added_by_id", null: false
    t.integer "company_id", null: false
    t.string "profile_picture", limit: 100
    t.string "role", limit: 100
    t.index ["added_by_id"], name: "companies_contact_added_by_id_cafc9547"
    t.index ["company_id"], name: "companies_contact_company_id_f5a47284"
  end

  create_table "companies_displaysectioncompany", id: :serial, force: :cascade do |t|
    t.boolean "display_sbt", null: false
    t.boolean "display_sdg", null: false
    t.boolean "display_projects", null: false
    t.boolean "display_recap", null: false
    t.boolean "display_employee_emissions", null: false
    t.integer "company_id", null: false
    t.boolean "display_scope_3", null: false
    t.boolean "display_main_infos", null: false
    t.boolean "display_scope_1", null: false
    t.boolean "display_scope_2", null: false
    t.boolean "show_page", null: false
    t.boolean "display_measure_offset_reduce", null: false
    t.boolean "display_climate_in_a_blink", null: false
    t.boolean "display_CO2_id", null: false
    t.boolean "carbon_accounting_boundaries", null: false
    t.boolean "display_emissions_by_source", null: false
    t.boolean "emission_per_driver_overview", null: false
    t.boolean "implemented_solutions", null: false
    t.boolean "display_key_figures", null: false
    t.boolean "display_benchmark", null: false
    t.boolean "display_tangible_comparison", null: false
    t.boolean "display_impact_team", null: false
    t.boolean "display_carbon_report", null: false
    t.boolean "display_site_comparison", null: false
    t.boolean "display_year_on_year", null: false
    t.index ["company_id"], name: "companies_displaysectioncompany_company_id_6ab97b33_uniq", unique: true
  end

  create_table "companies_documentcompany", id: :serial, force: :cascade do |t|
    t.string "document", limit: 100, null: false
    t.string "name", limit: 100, null: false
    t.string "category", limit: 20, null: false
    t.integer "company_id", null: false
    t.datetime "timestamp"
    t.index ["company_id"], name: "companies_documentcompany_company_id_c44b0f1e"
  end

  create_table "companies_googlesheetcompany", id: :serial, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.string "url", limit: 300, null: false
    t.datetime "date", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "companies_googlesheetcompany_company_id_a195444d"
  end

  create_table "companies_linksdg", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "link_url", limit: 200, null: false
    t.integer "sdg_id"
    t.index ["sdg_id"], name: "companies_linksdg_sdg_id_90ffba94"
  end

  create_table "companies_offsetinvest", id: :serial, force: :cascade do |t|
    t.float "total_emissions", null: false
    t.float "percentage_offset", null: false
    t.float "quantity_offset", null: false
    t.float "total_price", null: false
    t.datetime "created_date"
    t.boolean "is_paid", null: false
    t.integer "company_id", null: false
    t.integer "project_selected_id", null: false
    t.datetime "date"
    t.float "emissions_scope_1", null: false
    t.float "emissions_scope_2", null: false
    t.float "emissions_scope_3", null: false
    t.index ["company_id"], name: "companies_offsetinvest_company_id_2f3f6beb"
    t.index ["project_selected_id"], name: "companies_offsetinvest_project_selected_id_7887ebee"
  end

  create_table "companies_prospect", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 200
    t.string "last_name", limit: 200
    t.string "phone_number", limit: 200
    t.string "email", limit: 200, null: false
    t.text "message"
    t.string "company", limit: 200
    t.string "country", limit: 200
    t.string "subject", limit: 200
    t.boolean "newsletter_subscribed", null: false
  end

  create_table "companies_sbt", id: :serial, force: :cascade do |t|
    t.string "url_link", limit: 300
    t.string "target_classification", limit: 200, null: false
    t.string "status", limit: 200, null: false
    t.date "date_of_commitment", null: false
    t.text "target"
    t.integer "company_id", null: false
    t.string "target_title", limit: 300
    t.index ["company_id"], name: "companies_sbt_company_id_dbca04a8"
  end

  create_table "companies_sdg", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "number", limit: 2, null: false
    t.string "color", limit: 18, null: false
    t.text "description", null: false
    t.string "logo", limit: 100
    t.string "infografic", limit: 100
    t.text "fact"
    t.text "short_description"
    t.text "target"
  end

  create_table "companies_sector", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "logo", limit: 100
  end

  create_table "connections", force: :cascade do |t|
    t.integer "connecting_id"
    t.integer "connecter_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "course_roadmaps", force: :cascade do |t|
    t.string "status"
    t.bigint "course_id", null: false
    t.bigint "roadmap_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "order"
    t.index ["course_id"], name: "index_course_roadmaps_on_course_id"
    t.index ["roadmap_id"], name: "index_course_roadmaps_on_roadmap_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "provider"
    t.string "title"
    t.integer "cost"
    t.integer "duration"
    t.text "provider_url"
    t.integer "hourse_per_week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "topic_id"
    t.index ["topic_id"], name: "index_courses_on_topic_id"
  end

  create_table "demo_democompany", id: :serial, force: :cascade do |t|
    t.integer "company_id"
    t.index ["company_id"], name: "demo_democompany_company_id_key", unique: true
  end

  create_table "demo_mockupfeature", id: :serial, force: :cascade do |t|
    t.string "page", limit: 100, null: false
    t.string "image", limit: 100
    t.integer "democompany_id", null: false
    t.integer "order", limit: 2, null: false
    t.index ["democompany_id"], name: "demo_mockupfeature_democompany_id_95787538"
  end

  create_table "django_admin_log", id: :serial, force: :cascade do |t|
    t.datetime "action_time", null: false
    t.text "object_id"
    t.string "object_repr", limit: 200, null: false
    t.integer "action_flag", limit: 2, null: false
    t.text "change_message", null: false
    t.integer "content_type_id"
    t.integer "user_id", null: false
    t.index ["content_type_id"], name: "django_admin_log_content_type_id_c4bce8eb"
    t.index ["user_id"], name: "django_admin_log_user_id_c564eba6"
  end

  create_table "django_content_type", id: :serial, force: :cascade do |t|
    t.string "app_label", limit: 100, null: false
    t.string "model", limit: 100, null: false
    t.index ["app_label", "model"], name: "django_content_type_app_label_model_76bd3d3b_uniq", unique: true
  end

  create_table "django_migrations", id: :serial, force: :cascade do |t|
    t.string "app", limit: 255, null: false
    t.string "name", limit: 255, null: false
    t.datetime "applied", null: false
  end

  create_table "django_session", primary_key: "session_key", id: :string, limit: 40, force: :cascade do |t|
    t.text "session_data", null: false
    t.datetime "expire_date", null: false
    t.index ["expire_date"], name: "django_session_expire_date_a5c62663"
    t.index ["session_key"], name: "django_session_session_key_c0390e0f_like", opclass: :varchar_pattern_ops
  end

  create_table "django_site", id: :serial, force: :cascade do |t|
    t.string "domain", limit: 100, null: false
    t.string "name", limit: 50, null: false
    t.index ["domain"], name: "django_site_domain_a2e37b91_like", opclass: :varchar_pattern_ops
    t.index ["domain"], name: "django_site_domain_a2e37b91_uniq", unique: true
  end

  create_table "djangocms_text_ckeditor_text", primary_key: "cmsplugin_ptr_id", id: :integer, default: nil, force: :cascade do |t|
    t.text "body", null: false
  end

  create_table "employees_bilanallemployee", id: :serial, force: :cascade do |t|
    t.date "date", null: false
    t.float "mean_emissions_country", null: false
    t.float "emissions_energy", null: false
    t.float "emissions_diet", null: false
    t.float "emissions_transport", null: false
    t.float "emissions_household", null: false
    t.float "total_emissions_employees", null: false
    t.float "percentage_renewable_energy", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "employees_bilanallemployee_company_id_655b60cf"
  end

  create_table "engage_apps_engageapp", id: :serial, force: :cascade do |t|
    t.string "url_name", limit: 200, null: false
    t.string "name", limit: 200, null: false
    t.string "icon_name", limit: 200, null: false
    t.text "description", null: false
    t.boolean "active", null: false
    t.boolean "active_only_for_demo", null: false
  end

  create_table "founders_sprintfeedback", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "sprint_statistic_id", null: false
    t.integer "user_id", null: false
    t.index ["sprint_statistic_id"], name: "founders_sprintfeedback_sprint_statistic_id_840cd794"
    t.index ["user_id"], name: "founders_sprintfeedback_user_id_f106ce22"
  end

  create_table "founders_sprintstatistic", id: :serial, force: :cascade do |t|
    t.datetime "timestamp", null: false
    t.string "goal_of_the_week", limit: 300, null: false
    t.string "improvement_of_the_week", limit: 300, null: false
    t.integer "points_target", limit: 2, null: false
    t.integer "points_reached", limit: 2, null: false
    t.string "forcing_function", limit: 300
    t.integer "total_amount_of_clients", limit: 2, null: false
    t.integer "facebook_followers", limit: 2, null: false
    t.integer "linkedin_followers", limit: 2, null: false
    t.float "estimated_ca", null: false
    t.float "estimated_cost", null: false
    t.integer "instagram_followers", limit: 2, null: false
    t.integer "business_points_reached", limit: 2, null: false
    t.integer "business_points_target", limit: 2, null: false
    t.float "mrr", null: false
    t.float "mrr_target", null: false
  end

  create_table "gotapio_faq", id: :serial, force: :cascade do |t|
    t.text "question"
    t.text "answer"
  end

  create_table "gotapio_press", id: :serial, force: :cascade do |t|
    t.string "name", limit: 300, null: false
    t.string "logo", limit: 100
    t.string "article_link", limit: 300
    t.text "description"
    t.text "quote"
  end

  create_table "impact_team_member", id: :integer, default: -> { "nextval('impact_team_impacter_id_seq'::regclass)" }, force: :cascade do |t|
    t.string "first_name", limit: 200
    t.string "last_name", limit: 200
    t.string "photo", limit: 100
    t.string "role", limit: 200
    t.integer "company_id", null: false
    t.integer "user_id", null: false
    t.boolean "active", null: false
    t.boolean "is_admin", null: false
    t.string "email", limit: 254, null: false
    t.index ["company_id"], name: "impact_team_impacter_company_id_36d79856"
    t.index ["user_id"], name: "impact_team_impacter_user_id_key", unique: true
  end

  create_table "menus_cachekey", id: :serial, force: :cascade do |t|
    t.string "language", limit: 255, null: false
    t.integer "site", null: false
    t.string "key", limit: 255, null: false
  end

  create_table "messages", force: :cascade do |t|
    t.text "content"
    t.string "reaction"
    t.bigint "user_id", null: false
    t.bigint "connection_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["connection_id"], name: "index_messages_on_connection_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "network_excelcompany", id: :serial, force: :cascade do |t|
    t.string "excel", limit: 100, null: false
    t.string "file_name", limit: 30, null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "network_excelcompany_company_id_key", unique: true
  end

  create_table "network_invitationmail", id: :serial, force: :cascade do |t|
    t.text "content"
    t.string "subject", limit: 150, null: false
    t.boolean "default", null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "network_invitationmail_company_id_38d02dc7"
  end

  create_table "network_partnerconnexion", id: :serial, force: :cascade do |t|
    t.string "relation_type", limit: 50, null: false
    t.string "status", limit: 50, null: false
    t.integer "core_company_id", null: false
    t.integer "sub_company_id", null: false
    t.boolean "invited", null: false
    t.string "data_collection_status", limit: 50, null: false
    t.index ["core_company_id"], name: "network_partnerconnexion_core_company_id_32acdf74"
    t.index ["sub_company_id"], name: "network_partnerconnexion_sub_company_id_3b274fc1"
  end

  create_table "projects_project", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description"
    t.string "main_picture", limit: 100
    t.string "address_line_1", limit: 120
    t.string "address_line_2", limit: 120
    t.string "city", limit: 120
    t.string "country", limit: 120
    t.date "creation_date"
    t.string "email", limit: 254
    t.string "first_name", limit: 200
    t.string "last_name", limit: 200
    t.float "latitude"
    t.float "longitude"
    t.string "phone_number", limit: 200
    t.string "postal_code", limit: 120
    t.string "registery_link", limit: 200
    t.text "short_description"
    t.string "state", limit: 120
    t.float "surface", null: false
    t.integer "project_type_id"
    t.float "issued_carbon", null: false
    t.text "co_benefice"
    t.float "project_price", null: false
    t.bigint "stripe_product_id"
    t.string "website_url", limit: 300
    t.string "region_country", limit: 100
    t.index ["project_type_id"], name: "projects_project_project_type_id_ee10af0f"
    t.index ["stripe_product_id"], name: "projects_project_stripe_project_id_id_86cc4d8b"
  end

  create_table "projects_projectimage", id: :serial, force: :cascade do |t|
    t.string "image", limit: 100, null: false
    t.integer "project_id", null: false
    t.index ["project_id"], name: "projects_projectimage_project_id_618ded0e"
  end

  create_table "projects_projectsdg", id: :serial, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "sdg_id", null: false
    t.index ["project_id"], name: "projects_projectsdg_project_id_7db6e058"
    t.index ["sdg_id"], name: "projects_projectsdg_sdg_id_00549cb9"
  end

  create_table "projects_projectstandard", id: :serial, force: :cascade do |t|
    t.integer "project_id", null: false
    t.integer "standard_id", null: false
    t.index ["project_id"], name: "projects_projectstandard_project_id_3ee641c4"
    t.index ["standard_id"], name: "projects_projectstandard_standard_id_84f1a371"
  end

  create_table "projects_projecttype", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "logo", limit: 100
  end

  create_table "projects_standard", id: :serial, force: :cascade do |t|
    t.string "name", limit: 120, null: false
  end

  create_table "prospects", force: :cascade do |t|
    t.string "first_name"
    t.string "email"
    t.string "profession"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "reductions_category", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "description"
    t.string "logo", limit: 100
    t.integer "reduction_driver_id"
    t.integer "category_number", limit: 2
    t.string "scope", limit: 10
    t.index ["reduction_driver_id"], name: "reductions_category_reduction_driver_id_10e43f30"
  end

  create_table "reductions_certification", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "image", limit: 100
  end

  create_table "reductions_leadconnection", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.integer "company_id", null: false
    t.integer "solution_id", null: false
    t.index ["company_id"], name: "reductions_leadconnection_company_id_361e4af8"
    t.index ["solution_id"], name: "reductions_leadconnection_solution_id_3576ca45"
  end

  create_table "reductions_likesolution", id: :serial, force: :cascade do |t|
    t.integer "solution_id", null: false
    t.integer "user_id", null: false
    t.string "status", limit: 20, null: false
    t.index ["solution_id"], name: "reductions_likesolution_solution_id_72150381"
    t.index ["user_id"], name: "reductions_likesolution_user_id_cb63c07e"
  end

  create_table "reductions_matchsolutioncompany", id: :serial, force: :cascade do |t|
    t.boolean "implemented", null: false
    t.float "reduction_potential"
    t.integer "company_id", null: false
    t.integer "solution_id", null: false
    t.float "relevance"
    t.index ["company_id"], name: "reductions_matchsolutioncompany_company_id_9824ec00"
    t.index ["solution_id"], name: "reductions_matchsolutioncompany_solution_id_cfdd8155"
  end

  create_table "reductions_reductiondriver", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
  end

  create_table "reductions_solution", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "short_description", null: false
    t.text "description"
    t.float "facteur_emission", null: false
    t.string "logo", limit: 100
    t.string "website_url", limit: 200
    t.integer "provider_id"
    t.string "image", limit: 100
    t.boolean "for_companies", null: false
    t.boolean "for_individuals", null: false
    t.boolean "is_free", null: false
    t.string "code_promo", limit: 200
    t.boolean "validated", null: false
    t.integer "suggested_by_id"
    t.float "emission_reduction"
    t.boolean "display_on_general_solution_page", null: false
    t.string "company_name", limit: 200
    t.string "location", limit: 200
    t.string "maturity", limit: 200
    t.string "image_url", limit: 400
    t.boolean "has_carbon_report", null: false
    t.string "country", limit: 2
    t.boolean "tapio_client", null: false
    t.string "logo_url", limit: 200
    t.index ["code_promo"], name: "reductions_solution_code_promo_5080b86c_like", opclass: :varchar_pattern_ops
    t.index ["code_promo"], name: "reductions_solution_code_promo_key", unique: true
    t.index ["provider_id"], name: "reductions_solution_company_id_1d6fbc42"
    t.index ["suggested_by_id"], name: "reductions_solution_suggested_by_id_d7923d9b"
  end

  create_table "reductions_solution_categories", id: :serial, force: :cascade do |t|
    t.integer "solution_id", null: false
    t.integer "category_id", null: false
    t.index ["category_id"], name: "reductions_solution_categories_category_id_16c53e19"
    t.index ["solution_id", "category_id"], name: "reductions_solution_cate_solution_id_category_id_9d4bd839_uniq", unique: true
    t.index ["solution_id"], name: "reductions_solution_categories_solution_id_53798640"
  end

  create_table "reductions_solution_certification", id: :serial, force: :cascade do |t|
    t.integer "solution_id", null: false
    t.integer "certification_id", null: false
    t.index ["certification_id"], name: "reductions_solution_certification_certification_id_f283b517"
    t.index ["solution_id", "certification_id"], name: "reductions_solution_cert_solution_id_certificatio_f958a2ac_uniq", unique: true
    t.index ["solution_id"], name: "reductions_solution_certification_solution_id_2d050bef"
  end

  create_table "reductions_solution_reduction_driver", id: :serial, force: :cascade do |t|
    t.integer "solution_id", null: false
    t.integer "reductiondriver_id", null: false
    t.index ["reductiondriver_id"], name: "reductions_solution_reduct_reductiondriver_id_df535e20"
    t.index ["solution_id", "reductiondriver_id"], name: "reductions_solution_redu_solution_id_reductiondri_f5f76fd3_uniq", unique: true
    t.index ["solution_id"], name: "reductions_solution_reduction_driver_solution_id_962c5127"
  end

  create_table "reductions_solution_sdgs", id: :serial, force: :cascade do |t|
    t.integer "solution_id", null: false
    t.integer "sdg_id", null: false
    t.index ["sdg_id"], name: "reductions_solution_sdgs_sdg_id_b8ab9e53"
    t.index ["solution_id", "sdg_id"], name: "reductions_solution_sdgs_solution_id_sdg_id_48bbfe11_uniq", unique: true
    t.index ["solution_id"], name: "reductions_solution_sdgs_solution_id_b73dbdb9"
  end

  create_table "reports_benchmark", id: :serial, force: :cascade do |t|
    t.string "name", limit: 300, null: false
    t.float "scope_1", null: false
    t.float "scope_2", null: false
    t.float "scope_3", null: false
    t.float "total_emissions", null: false
    t.float "turnover", null: false
    t.integer "employees", null: false
  end

  create_table "reports_benchmarkcompany", id: :serial, force: :cascade do |t|
    t.integer "benchmark_id", null: false
    t.integer "company_id", null: false
    t.index ["benchmark_id"], name: "reports_benchmarkcompany_benchmark_id_f58683c4"
    t.index ["company_id"], name: "reports_benchmarkcompany_company_id_2eef4fe0"
  end

  create_table "reports_investment", id: :serial, force: :cascade do |t|
    t.float "equity_stake", null: false
    t.date "start_date", null: false
    t.date "end_date"
    t.integer "fund_invest_id", null: false
    t.integer "investment_id", null: false
    t.index ["fund_invest_id"], name: "reports_investment_fund_invest_id_6a8c4bde"
    t.index ["investment_id"], name: "reports_investment_investment_id_c4204681"
  end

  create_table "reports_releventdata", id: :serial, force: :cascade do |t|
    t.string "unit", limit: 200, null: false
    t.integer "company_id"
    t.boolean "flag_data", null: false
    t.index ["company_id"], name: "reports_releventdata_company_id_dc4edb29"
  end

  create_table "reports_releventdatavalue", id: :serial, force: :cascade do |t|
    t.float "value", null: false
    t.integer "relevent_data_id", null: false
    t.integer "report_id"
    t.index ["relevent_data_id"], name: "reports_releventdatavalue_relevent_data_id_d523e3a2"
    t.index ["report_id"], name: "reports_releventdatavalue_report_id_e279b760"
  end

  create_table "reports_report", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.text "data", null: false
    t.integer "site_id", null: false
    t.date "date"
    t.integer "employees", null: false
    t.integer "turnover", limit: 2, null: false
    t.text "hypothesis"
    t.boolean "is_global_report", null: false
    t.index ["site_id"], name: "reports_report_site_id_e97bb1a0"
  end

  create_table "reports_site", id: :serial, force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.integer "company_id", null: false
    t.index ["company_id"], name: "reports_site_company_id_f3a336c9"
  end

  create_table "reports_tangiblecomparison", id: :integer, default: -> { "nextval('reports_benchmark_id_seq'::regclass)" }, force: :cascade do |t|
    t.float "emission_per_unit", null: false
    t.string "unit_title", limit: 300, null: false
    t.string "icon", limit: 100
  end

  create_table "reports_target", id: :serial, force: :cascade do |t|
    t.date "date", null: false
    t.float "scope_1", null: false
    t.float "scope_2", null: false
    t.float "scope_3", null: false
    t.integer "site_id", null: false
    t.index ["site_id"], name: "reports_target_site_id_b6459eca"
  end

  create_table "roadmap_topics", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "roadmap_id"
    t.bigint "topic_id"
    t.index ["roadmap_id"], name: "index_roadmap_topics_on_roadmap_id"
    t.index ["topic_id"], name: "index_roadmap_topics_on_topic_id"
  end

  create_table "roadmaps", force: :cascade do |t|
    t.boolean "privacy_option"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.integer "duration"
    t.index ["user_id"], name: "index_roadmaps_on_user_id"
  end

  create_table "socialaccount_socialaccount", id: :serial, force: :cascade do |t|
    t.string "provider", limit: 30, null: false
    t.string "uid", limit: 191, null: false
    t.datetime "last_login", null: false
    t.datetime "date_joined", null: false
    t.text "extra_data", null: false
    t.integer "user_id", null: false
    t.index ["provider", "uid"], name: "socialaccount_socialaccount_provider_uid_fc810c6e_uniq", unique: true
    t.index ["user_id"], name: "socialaccount_socialaccount_user_id_8146e70c"
  end

  create_table "socialaccount_socialapp", id: :serial, force: :cascade do |t|
    t.string "provider", limit: 30, null: false
    t.string "name", limit: 40, null: false
    t.string "client_id", limit: 191, null: false
    t.string "secret", limit: 191, null: false
    t.string "key", limit: 191, null: false
  end

  create_table "socialaccount_socialapp_sites", id: :serial, force: :cascade do |t|
    t.integer "socialapp_id", null: false
    t.integer "site_id", null: false
    t.index ["site_id"], name: "socialaccount_socialapp_sites_site_id_2579dee5"
    t.index ["socialapp_id", "site_id"], name: "socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq", unique: true
    t.index ["socialapp_id"], name: "socialaccount_socialapp_sites_socialapp_id_97fb6e7d"
  end

  create_table "socialaccount_socialtoken", id: :serial, force: :cascade do |t|
    t.text "token", null: false
    t.text "token_secret", null: false
    t.datetime "expires_at"
    t.integer "account_id", null: false
    t.integer "app_id", null: false
    t.index ["account_id"], name: "socialaccount_socialtoken_account_id_951f210e"
    t.index ["app_id", "account_id"], name: "socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq", unique: true
    t.index ["app_id"], name: "socialaccount_socialtoken_app_id_636a42d7"
  end

  create_table "tasks_task", id: :serial, force: :cascade do |t|
    t.string "title", limit: 200, null: false
    t.string "subtitle", limit: 200, null: false
    t.text "description", null: false
    t.string "category", limit: 100, null: false
    t.string "target_url", limit: 300, null: false
  end

  create_table "tasks_taskassignment", id: :serial, force: :cascade do |t|
    t.text "comment", null: false
    t.date "assigned_date", null: false
    t.date "due_date", null: false
    t.string "status", limit: 100, null: false
    t.integer "company_id", null: false
    t.integer "task_id", null: false
    t.integer "task_owner_id"
    t.integer "member_id"
    t.index ["company_id"], name: "tasks_taskassignment_company_id_851c374e"
    t.index ["member_id"], name: "tasks_taskassignment_member_id_074b6761"
    t.index ["task_id"], name: "tasks_taskassignment_task_id_6281ef9c"
    t.index ["task_owner_id"], name: "tasks_taskassignment_task_owner_id_7ad7d704"
  end

  create_table "tasks_taskowner", id: :serial, force: :cascade do |t|
    t.string "first_name", limit: 200, null: false
    t.string "last_name", limit: 200, null: false
    t.string "email", limit: 254, null: false
    t.string "color", limit: 18, null: false
    t.string "photo", limit: 100
    t.string "role", limit: 200
    t.integer "company_id", null: false
    t.index ["company_id"], name: "tasks_taskowner_company_id_acb20561"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "budget"
    t.integer "timeframe"
    t.string "current_role"
    t.string "current_industry"
    t.string "future_role"
    t.string "future_industry"
    t.integer "available_hrs_per_week"
    t.string "status"
    t.string "location"
    t.text "motivation"
    t.string "satisfaction"
    t.text "journey_experience"
    t.text "advice"
    t.string "img_url"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "account_emailaddress", "auth_user", column: "user_id", name: "account_emailaddress_user_id_2c513194_fk_auth_user_id"
  add_foreign_key "account_emailconfirmation", "account_emailaddress", column: "email_address_id", name: "account_emailconfirm_email_address_id_5b7f8c58_fk_account_e"
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "auth_group_permissions", "auth_group", column: "group_id", name: "auth_group_permissions_group_id_b120cbf9_fk_auth_group_id"
  add_foreign_key "auth_group_permissions", "auth_permission", column: "permission_id", name: "auth_group_permissio_permission_id_84c5c92e_fk_auth_perm"
  add_foreign_key "auth_permission", "django_content_type", column: "content_type_id", name: "auth_permission_content_type_id_2f476e4b_fk_django_co"
  add_foreign_key "auth_user_groups", "auth_group", column: "group_id", name: "auth_user_groups_group_id_97559544_fk_auth_group_id"
  add_foreign_key "auth_user_groups", "auth_user", column: "user_id", name: "auth_user_groups_user_id_6a12ed8b_fk_auth_user_id"
  add_foreign_key "auth_user_user_permissions", "auth_permission", column: "permission_id", name: "auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm"
  add_foreign_key "auth_user_user_permissions", "auth_user", column: "user_id", name: "auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id"
  add_foreign_key "bilans_bilancompany", "bilans_bilan", column: "bilan_id", name: "bilans_bilancompany_bilan_id_eec539c5_fk_bilans_bilan_id"
  add_foreign_key "bilans_bilancompany", "calculator_communitycalculator", column: "community_calculator_id", name: "bilans_bilancompany_community_calculator_a8d79f4d_fk_calculato"
  add_foreign_key "bilans_bilancompany", "companies_company", column: "company_id", name: "bilans_bilancompany_company_id_8464d012_fk_companies_company_id"
  add_foreign_key "bilans_emissiondriver", "bilans_emissiontype", column: "type_of_emission_id", name: "bilans_emissiondrive_type_of_emission_id_9670b844_fk_bilans_em"
  add_foreign_key "bilans_emissionquantity", "bilans_bilan", column: "bilan_id", name: "bilans_emissionquantity_bilan_id_be3d0242_fk_bilans_bilan_id"
  add_foreign_key "bilans_emissionquantity", "bilans_emissiondriver", column: "driver_of_emission_id", name: "bilans_emissionquant_driver_of_emission_i_fddce097_fk_bilans_em"
  add_foreign_key "calculator_calculator", "auth_user", column: "user_id", name: "calculator_calculator_user_id_0c53d7df_fk_auth_user_id"
  add_foreign_key "calculator_car", "calculator_transport", column: "transport_id", name: "calculator_car_transport_id_65954e6d_fk_calculator_transport_id"
  add_foreign_key "calculator_communitycalculator", "community_community", column: "community_id", name: "calculator_community_community_id_cb6fad25_fk_community"
  add_foreign_key "calculator_communitycalculatorlink", "calculator_calculator", column: "calculator_id", name: "calculator_community_calculator_id_5e3f7dbc_fk_calculato"
  add_foreign_key "calculator_communitycalculatorlink", "calculator_communitycalculator", column: "community_calculator_id", name: "calculator_community_community_calculator_7cb201cc_fk_calculato"
  add_foreign_key "calculator_diet", "calculator_calculator", column: "calculator_id", name: "calculator_diet_calculator_id_69a6f64d_fk_calculato"
  add_foreign_key "calculator_electricbike", "calculator_transport", column: "transport_id", name: "calculator_electricb_transport_id_d9fa178b_fk_calculato"
  add_foreign_key "calculator_energy", "calculator_calculator", column: "calculator_id", name: "calculator_energy_calculator_id_1f8b2825_fk_calculato"
  add_foreign_key "calculator_household", "calculator_calculator", column: "calculator_id", name: "calculator_household_calculator_id_f5e0fc7e_fk_calculato"
  add_foreign_key "calculator_motorcycle", "calculator_transport", column: "transport_id", name: "calculator_motorcycl_transport_id_1813845b_fk_calculato"
  add_foreign_key "calculator_plane", "calculator_calculator", column: "calculator_id", name: "calculator_plane_calculator_id_36f618bd_fk_calculato"
  add_foreign_key "calculator_transport", "calculator_calculator", column: "calculator_id", name: "calculator_transport_calculator_id_8377762b_fk_calculato"
  add_foreign_key "carbon_report_activitydata", "carbon_report_category", column: "category_id", name: "carbon_report_activi_category_id_bb2d9b06_fk_carbon_re"
  add_foreign_key "carbon_report_activitydata", "carbon_report_emissionfactor", column: "emission_factor_id", name: "carbon_report_activi_emission_factor_id_fe3328c4_fk_carbon_re"
  add_foreign_key "carbon_report_activitydata", "carbon_report_report", column: "report_id", name: "carbon_report_activi_report_id_164ef9ab_fk_carbon_re"
  add_foreign_key "carbon_report_category", "carbon_report_driver", column: "driver_id", name: "carbon_report_catego_driver_id_fd7716cf_fk_carbon_re"
  add_foreign_key "carbon_report_emissionfactor", "carbon_report_emissionfamily", column: "emission_familiy_id", name: "carbon_report_emissi_emission_familiy_id_0179c7a9_fk_carbon_re"
  add_foreign_key "carbon_report_report", "companies_company", column: "company_id", name: "carbon_report_report_company_id_f1faa84b_fk_companies"
  add_foreign_key "cms_aliaspluginmodel", "cms_cmsplugin", column: "cmsplugin_ptr_id", name: "cms_aliaspluginmodel_cmsplugin_ptr_id_f71dfd31_fk_cms_cmspl"
  add_foreign_key "cms_aliaspluginmodel", "cms_cmsplugin", column: "plugin_id", name: "cms_aliaspluginmodel_plugin_id_9867676e_fk_cms_cmsplugin_id"
  add_foreign_key "cms_aliaspluginmodel", "cms_placeholder", column: "alias_placeholder_id", name: "cms_aliaspluginmodel_alias_placeholder_id_6d6e0c8a_fk_cms_place"
  add_foreign_key "cms_cmsplugin", "cms_cmsplugin", column: "parent_id", name: "cms_cmsplugin_parent_id_fd3bd9dd_fk_cms_cmsplugin_id"
  add_foreign_key "cms_cmsplugin", "cms_placeholder", column: "placeholder_id", name: "cms_cmsplugin_placeholder_id_0bfa3b26_fk_cms_placeholder_id"
  add_foreign_key "cms_globalpagepermission", "auth_group", column: "group_id", name: "cms_globalpagepermission_group_id_991b4733_fk_auth_group_id"
  add_foreign_key "cms_globalpagepermission", "auth_user", column: "user_id", name: "cms_globalpagepermission_user_id_a227cee1_fk_auth_user_id"
  add_foreign_key "cms_globalpagepermission_sites", "cms_globalpagepermission", column: "globalpagepermission_id", name: "cms_globalpagepermis_globalpagepermission_46bd2681_fk_cms_globa"
  add_foreign_key "cms_globalpagepermission_sites", "django_site", column: "site_id", name: "cms_globalpagepermis_site_id_00460b53_fk_django_si"
  add_foreign_key "cms_page", "cms_page", column: "publisher_public_id", name: "cms_page_publisher_public_id_d619fca0_fk_cms_page_id"
  add_foreign_key "cms_page", "cms_treenode", column: "node_id", name: "cms_page_node_id_c87b85a9_fk_cms_treenode_id"
  add_foreign_key "cms_page_placeholders", "cms_page", column: "page_id", name: "cms_page_placeholders_page_id_f2ce8dec_fk_cms_page_id"
  add_foreign_key "cms_page_placeholders", "cms_placeholder", column: "placeholder_id", name: "cms_page_placeholder_placeholder_id_6b120886_fk_cms_place"
  add_foreign_key "cms_pagepermission", "auth_group", column: "group_id", name: "cms_pagepermission_group_id_af5af193_fk_auth_group_id"
  add_foreign_key "cms_pagepermission", "auth_user", column: "user_id", name: "cms_pagepermission_user_id_0c7d2b3c_fk_auth_user_id"
  add_foreign_key "cms_pagepermission", "cms_page", column: "page_id", name: "cms_pagepermission_page_id_0ae9a163_fk_cms_page_id"
  add_foreign_key "cms_pageuser", "auth_user", column: "created_by_id", name: "cms_pageuser_created_by_id_8e9fbf83_fk_auth_user_id"
  add_foreign_key "cms_pageuser", "auth_user", column: "user_ptr_id", name: "cms_pageuser_user_ptr_id_b3d65592_fk_auth_user_id"
  add_foreign_key "cms_pageusergroup", "auth_group", column: "group_ptr_id", name: "cms_pageusergroup_group_ptr_id_34578d93_fk_auth_group_id"
  add_foreign_key "cms_pageusergroup", "auth_user", column: "created_by_id", name: "cms_pageusergroup_created_by_id_7d57fa39_fk_auth_user_id"
  add_foreign_key "cms_placeholderreference", "cms_cmsplugin", column: "cmsplugin_ptr_id", name: "cms_placeholderrefer_cmsplugin_ptr_id_6977ec85_fk_cms_cmspl"
  add_foreign_key "cms_placeholderreference", "cms_placeholder", column: "placeholder_ref_id", name: "cms_placeholderrefer_placeholder_ref_id_244759b1_fk_cms_place"
  add_foreign_key "cms_staticplaceholder", "cms_placeholder", column: "draft_id", name: "cms_staticplaceholder_draft_id_5aee407b_fk_cms_placeholder_id"
  add_foreign_key "cms_staticplaceholder", "cms_placeholder", column: "public_id", name: "cms_staticplaceholder_public_id_876aaa66_fk_cms_placeholder_id"
  add_foreign_key "cms_staticplaceholder", "django_site", column: "site_id", name: "cms_staticplaceholder_site_id_dc6a85b6_fk_django_site_id"
  add_foreign_key "cms_title", "cms_page", column: "page_id", name: "cms_title_page_id_5fade2a3_fk_cms_page_id"
  add_foreign_key "cms_title", "cms_title", column: "publisher_public_id", name: "cms_title_publisher_public_id_003a2702_fk_cms_title_id"
  add_foreign_key "cms_treenode", "cms_treenode", column: "parent_id", name: "cms_treenode_parent_id_59bb02c4_fk_cms_treenode_id"
  add_foreign_key "cms_treenode", "django_site", column: "site_id", name: "cms_treenode_site_id_d3f46985_fk_django_site_id"
  add_foreign_key "cms_usersettings", "auth_user", column: "user_id", name: "cms_usersettings_user_id_09633b2d_fk_auth_user_id"
  add_foreign_key "cms_usersettings", "cms_placeholder", column: "clipboard_id", name: "cms_usersettings_clipboard_id_3ae17c19_fk_cms_placeholder_id"
  add_foreign_key "community_community", "companies_company", column: "company_id", name: "community_community_company_id_bc1cb349_fk_companies_company_id"
  add_foreign_key "community_communitymember", "community_community", column: "community_id", name: "community_communitym_community_id_baac9ba5_fk_community"
  add_foreign_key "community_communitymember", "community_individual", column: "individual_id", name: "community_communitym_individual_id_94a9fbf8_fk_community"
  add_foreign_key "community_individual", "auth_user", column: "user_id", name: "community_individual_user_id_4d648d72_fk_auth_user_id"
  add_foreign_key "community_individual", "companies_company", column: "company_id", name: "community_individual_company_id_136d65d0_fk_companies"
  add_foreign_key "companies_company", "auth_user", column: "user_id", name: "companies_company_user_id_175c2d31_fk_auth_user_id"
  add_foreign_key "companies_company_sector", "companies_company", column: "company_id", name: "companies_company_se_company_id_6fdc8870_fk_companies"
  add_foreign_key "companies_company_sector", "companies_sector", column: "sector_id", name: "companies_company_se_sector_id_8e1afde2_fk_companies"
  add_foreign_key "companies_companysdg", "companies_company", column: "company_id", name: "companies_companysdg_company_id_ff53e541_fk_companies"
  add_foreign_key "companies_companysdg", "companies_sdg", column: "sdg_id", name: "companies_companysdg_sdg_id_af55789a_fk_companies_sdg_id"
  add_foreign_key "companies_contact", "companies_company", column: "company_id", name: "companies_contact_company_id_f5a47284_fk_companies_company_id"
  add_foreign_key "companies_contact", "impact_team_member", column: "added_by_id", name: "companies_contact_added_by_id_cafc9547_fk_impact_team_member_id"
  add_foreign_key "companies_displaysectioncompany", "companies_company", column: "company_id", name: "companies_displaysec_company_id_6ab97b33_fk_companies"
  add_foreign_key "companies_documentcompany", "companies_company", column: "company_id", name: "companies_documentco_company_id_c44b0f1e_fk_companies"
  add_foreign_key "companies_googlesheetcompany", "companies_company", column: "company_id", name: "companies_googleshee_company_id_a195444d_fk_companies"
  add_foreign_key "companies_linksdg", "companies_sdg", column: "sdg_id", name: "companies_linksdg_sdg_id_90ffba94_fk_companies_sdg_id"
  add_foreign_key "companies_offsetinvest", "companies_company", column: "company_id", name: "companies_offsetinve_company_id_2f3f6beb_fk_companies"
  add_foreign_key "companies_offsetinvest", "projects_project", column: "project_selected_id", name: "companies_offsetinve_project_selected_id_7887ebee_fk_projects_"
  add_foreign_key "companies_sbt", "companies_company", column: "company_id", name: "companies_sbt_company_id_dbca04a8_fk_companies_company_id"
  add_foreign_key "course_roadmaps", "courses"
  add_foreign_key "course_roadmaps", "roadmaps"
  add_foreign_key "courses", "topics"
  add_foreign_key "demo_democompany", "companies_company", column: "company_id", name: "demo_democompany_company_id_e570dfc6_fk_companies_company_id"
  add_foreign_key "demo_mockupfeature", "demo_democompany", column: "democompany_id", name: "demo_mockupfeature_democompany_id_95787538_fk_demo_demo"
  add_foreign_key "django_admin_log", "auth_user", column: "user_id", name: "django_admin_log_user_id_c564eba6_fk_auth_user_id"
  add_foreign_key "django_admin_log", "django_content_type", column: "content_type_id", name: "django_admin_log_content_type_id_c4bce8eb_fk_django_co"
  add_foreign_key "djangocms_text_ckeditor_text", "cms_cmsplugin", column: "cmsplugin_ptr_id", name: "djangocms_text_ckedi_cmsplugin_ptr_id_946882c1_fk_cms_cmspl"
  add_foreign_key "employees_bilanallemployee", "companies_company", column: "company_id", name: "employees_bilanallem_company_id_655b60cf_fk_companies"
  add_foreign_key "founders_sprintfeedback", "auth_user", column: "user_id", name: "founders_sprintfeedback_user_id_f106ce22_fk_auth_user_id"
  add_foreign_key "founders_sprintfeedback", "founders_sprintstatistic", column: "sprint_statistic_id", name: "founders_sprintfeedb_sprint_statistic_id_840cd794_fk_founders_"
  add_foreign_key "impact_team_member", "auth_user", column: "user_id", name: "impact_team_impacter_user_id_569a7d79_fk_auth_user_id"
  add_foreign_key "impact_team_member", "companies_company", column: "company_id", name: "impact_team_impacter_company_id_36d79856_fk_companies"
  add_foreign_key "messages", "connections"
  add_foreign_key "messages", "users"
  add_foreign_key "network_excelcompany", "companies_company", column: "company_id", name: "network_excelcompany_company_id_8a786d8b_fk_companies"
  add_foreign_key "network_invitationmail", "companies_company", column: "company_id", name: "network_invitationma_company_id_38d02dc7_fk_companies"
  add_foreign_key "network_partnerconnexion", "companies_company", column: "core_company_id", name: "network_partnerconne_core_company_id_32acdf74_fk_companies"
  add_foreign_key "network_partnerconnexion", "companies_company", column: "sub_company_id", name: "network_partnerconne_sub_company_id_3b274fc1_fk_companies"
  add_foreign_key "projects_project", "projects_projecttype", column: "project_type_id", name: "projects_project_project_type_id_ee10af0f_fk_projects_"
  add_foreign_key "projects_projectimage", "projects_project", column: "project_id", name: "projects_projectimag_project_id_618ded0e_fk_projects_"
  add_foreign_key "projects_projectsdg", "companies_sdg", column: "sdg_id", name: "projects_projectsdg_sdg_id_00549cb9_fk_companies_sdg_id"
  add_foreign_key "projects_projectsdg", "projects_project", column: "project_id", name: "projects_projectsdg_project_id_7db6e058_fk_projects_project_id"
  add_foreign_key "projects_projectstandard", "projects_project", column: "project_id", name: "projects_projectstan_project_id_3ee641c4_fk_projects_"
  add_foreign_key "projects_projectstandard", "projects_standard", column: "standard_id", name: "projects_projectstan_standard_id_84f1a371_fk_projects_"
  add_foreign_key "reductions_category", "reductions_reductiondriver", column: "reduction_driver_id", name: "reductions_category_reduction_driver_id_10e43f30_fk_reduction"
  add_foreign_key "reductions_leadconnection", "companies_company", column: "company_id", name: "reductions_leadconne_company_id_361e4af8_fk_companies"
  add_foreign_key "reductions_leadconnection", "reductions_solution", column: "solution_id", name: "reductions_leadconne_solution_id_3576ca45_fk_reduction"
  add_foreign_key "reductions_likesolution", "auth_user", column: "user_id", name: "reductions_likesolution_user_id_cb63c07e_fk_auth_user_id"
  add_foreign_key "reductions_likesolution", "reductions_solution", column: "solution_id", name: "reductions_likesolut_solution_id_72150381_fk_reduction"
  add_foreign_key "reductions_matchsolutioncompany", "companies_company", column: "company_id", name: "reductions_matchsolu_company_id_9824ec00_fk_companies"
  add_foreign_key "reductions_matchsolutioncompany", "reductions_solution", column: "solution_id", name: "reductions_matchsolu_solution_id_cfdd8155_fk_reduction"
  add_foreign_key "reductions_solution", "companies_company", column: "provider_id", name: "reductions_solution_provider_id_1c31a7ba_fk_companies"
  add_foreign_key "reductions_solution", "companies_company", column: "suggested_by_id", name: "reductions_solution_suggested_by_id_d7923d9b_fk_companies"
  add_foreign_key "reductions_solution_categories", "reductions_category", column: "category_id", name: "reductions_solution__category_id_16c53e19_fk_reduction"
  add_foreign_key "reductions_solution_categories", "reductions_solution", column: "solution_id", name: "reductions_solution__solution_id_53798640_fk_reduction"
  add_foreign_key "reductions_solution_certification", "reductions_certification", column: "certification_id", name: "reductions_solution__certification_id_f283b517_fk_reduction"
  add_foreign_key "reductions_solution_certification", "reductions_solution", column: "solution_id", name: "reductions_solution__solution_id_2d050bef_fk_reduction"
  add_foreign_key "reductions_solution_reduction_driver", "reductions_reductiondriver", column: "reductiondriver_id", name: "reductions_solution__reductiondriver_id_df535e20_fk_reduction"
  add_foreign_key "reductions_solution_reduction_driver", "reductions_solution", column: "solution_id", name: "reductions_solution__solution_id_962c5127_fk_reduction"
  add_foreign_key "reductions_solution_sdgs", "companies_sdg", column: "sdg_id", name: "reductions_solution_sdgs_sdg_id_b8ab9e53_fk_companies_sdg_id"
  add_foreign_key "reductions_solution_sdgs", "reductions_solution", column: "solution_id", name: "reductions_solution__solution_id_b73dbdb9_fk_reduction"
  add_foreign_key "reports_benchmarkcompany", "companies_company", column: "company_id", name: "reports_benchmarkcom_company_id_2eef4fe0_fk_companies"
  add_foreign_key "reports_benchmarkcompany", "reports_benchmark", column: "benchmark_id", name: "reports_benchmarkcom_benchmark_id_f58683c4_fk_reports_b"
  add_foreign_key "reports_investment", "companies_company", column: "fund_invest_id", name: "reports_investment_fund_invest_id_6a8c4bde_fk_companies"
  add_foreign_key "reports_investment", "companies_company", column: "investment_id", name: "reports_investment_investment_id_c4204681_fk_companies"
  add_foreign_key "reports_releventdata", "companies_company", column: "company_id", name: "reports_releventdata_company_id_dc4edb29_fk_companies"
  add_foreign_key "reports_releventdatavalue", "reports_releventdata", column: "relevent_data_id", name: "reports_releventdata_relevent_data_id_d523e3a2_fk_reports_r"
  add_foreign_key "reports_releventdatavalue", "reports_report", column: "report_id", name: "reports_releventdata_report_id_e279b760_fk_reports_r"
  add_foreign_key "reports_report", "reports_site", column: "site_id", name: "reports_report_site_id_e97bb1a0_fk_reports_site_id"
  add_foreign_key "reports_site", "companies_company", column: "company_id", name: "reports_site_company_id_f3a336c9_fk_companies_company_id"
  add_foreign_key "reports_target", "reports_site", column: "site_id", name: "reports_target_site_id_b6459eca_fk_reports_site_id"
  add_foreign_key "roadmap_topics", "roadmaps"
  add_foreign_key "roadmap_topics", "topics"
  add_foreign_key "roadmaps", "users"
  add_foreign_key "socialaccount_socialaccount", "auth_user", column: "user_id", name: "socialaccount_socialaccount_user_id_8146e70c_fk_auth_user_id"
  add_foreign_key "socialaccount_socialapp_sites", "django_site", column: "site_id", name: "socialaccount_social_site_id_2579dee5_fk_django_si"
  add_foreign_key "socialaccount_socialapp_sites", "socialaccount_socialapp", column: "socialapp_id", name: "socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc"
  add_foreign_key "socialaccount_socialtoken", "socialaccount_socialaccount", column: "account_id", name: "socialaccount_social_account_id_951f210e_fk_socialacc"
  add_foreign_key "socialaccount_socialtoken", "socialaccount_socialapp", column: "app_id", name: "socialaccount_social_app_id_636a42d7_fk_socialacc"
  add_foreign_key "tasks_taskassignment", "companies_company", column: "company_id", name: "tasks_taskassignment_company_id_851c374e_fk_companies"
  add_foreign_key "tasks_taskassignment", "impact_team_member", column: "member_id", name: "tasks_taskassignment_member_id_074b6761_fk_impact_te"
  add_foreign_key "tasks_taskassignment", "tasks_task", column: "task_id", name: "tasks_taskassignment_task_id_6281ef9c_fk_tasks_task_id"
  add_foreign_key "tasks_taskassignment", "tasks_taskowner", column: "task_owner_id", name: "tasks_taskassignment_task_owner_id_7ad7d704_fk_tasks_tas"
  add_foreign_key "tasks_taskowner", "companies_company", column: "company_id", name: "tasks_taskowner_company_id_acb20561_fk_companies_company_id"
end
