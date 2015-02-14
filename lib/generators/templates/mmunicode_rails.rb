puts 'Inserting middleware mmunicode'
Rails.application.config.middleware.insert_before(ActionDispatch::ParamsParser,
                                                  MmunicodeRails::RackMmunicode)
