puts "Inserting middleware mmunicdoe"
Rails.application.config.middleware.insert_before(ActionDispatch::ParamsParser,Mmunicode::RackMmunicode)
