require "acitverecord_mmunicode/version"

module AcitveRecordMmunicode

	module ClassMethods
	     def mm_unicodify(*fields)
	     	fields.each do |field|
	     		field_type = self.columns_hash[field.to_s].type
	     		unless field_type == :string || field_type == :text then
	     			raise NotSupportedForNonStringTypesError.new(field_type),"#{field_type} is not supported.Supported types are :string and :text" 
	     		end
	     	end
	        before_save do
	          fields.each do|field|
	            zg = self.send(field.to_sym)
	            self.send("#{field}=".to_sym,zg12uni51(zg))
	          end
	        end
	     end
	end
  
	module InstanceMethods
	    def uni512zg1(input_text)
	      return input_text unless detect_font(input_text) == :uni
	      output_text = input_text
	      output_text = output_text.gsub(/\u104e\u1004\u103a\u1038/ ,"\u104e")
	      output_text = output_text.gsub(/\u102b\u103a/ ,"\u105a")
	      output_text = output_text.gsub(/\u102d\u1036/ ,"\u108e")
	      output_text = output_text.gsub(/\u103f/ ,"\u1086")
	      output_text = output_text.gsub(/(?<=\u102f)\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u102f\u1036)\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u1030)\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u1030\u1036)\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u1014)\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u1014[\u103a\u1032])\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u103b)\u1037/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=\u103b[\u1032\u1036])\u1037/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=\u103d)\u1037/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=\u103d[\u1032])\u1037/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c\u103d])\u102f/ ,"\u1033")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c\u103d][\u102d\u1036])\u102f/ ,"\u1033")
	      output_text = output_text.gsub(/(?<=(\u1039[\u1000-\u1021]))\u102f/ ,"\u1033")
	      output_text = output_text.gsub(/(?<=(\u1039[\u1000-\u1021])[\u102d\u1036])\u102f/ ,"\u1033")
	      output_text = output_text.gsub(/(?<=[\u100a\u100c\u1020\u1025\u1029])\u102f/ ,"\u1033")
	      output_text = output_text.gsub(/(?<=[\u100a\u100c\u1020\u1025\u1029][\u102d\u1036])\u102f/ ,"\u1033")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u103d])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u103e])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u102d\u1036])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u103d][\u103e])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u103d][\u102d\u1036])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u103e][\u102d\u1036])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u103b\u103c][\u103d][\u103e][\u102d\u1036])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=(\u1039[\u1000-\u1021]))\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=(\u1039[\u1000-\u1021])[\u102d\u1036])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u100a\u100c\u1020\u1025\u1029])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=[\u100a\u100c\u1020\u1025\u1029][\u102d\u1036])\u1030/ ,"\u1034")
	      output_text = output_text.gsub(/(?<=\u103c)\u103e/ ,"\u1087")
	      output_text = output_text.gsub(/\u1009(?=[\u103a])/ ,"\u1025")
	      output_text = output_text.gsub(/\u1009(?=\u1039[\u1000-\u1021])/ ,"\u1025")
	      output_text = output_text.gsub(/([\u1000-\u1021\u1029])((?:\u1039[\u1000-\u1021])?)((?:[\u103b-\u103e\u1087]*)?)\u1031/ ,"\u1031\\1\\2\\3")
	      output_text = output_text.gsub(/([\u1000-\u1021\u1029])((?:\u1039[\u1000-\u1021\u1000-\u1021])?)(\u103c)/ ,"\\3\\1\\2")
	      output_text = output_text.gsub(/\u1004\u103a\u1039/ ,"\u1064")
	      output_text = output_text.gsub(/(\u1064)((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u102d/ ,"\\2\\3\\4\u108b")
	      output_text = output_text.gsub(/(\u1064)((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u102e/ ,"\\2\\3\\4\u108c")
	      output_text = output_text.gsub(/(\u1064)((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u1036/ ,"\\2\\3\\4\u108d")
	      output_text = output_text.gsub(/(\u1064)((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])/ ,"\\2\\3\\4\u1064")
	      output_text = output_text.gsub(/\u100a(?=[\u1039\u102f\u1030])/ ,"\u106b")
	      output_text = output_text.gsub(/\u100a/ ,"\u100a")
	      output_text = output_text.gsub(/\u101b(?=[\u102f\u1030])/ ,"\u1090")
	      output_text = output_text.gsub(/\u101b/ ,"\u101b")
	      output_text = output_text.gsub(/\u1014(?=[\u1039\u103d\u103e\u102f\u1030])/ ,"\u108f")
	      output_text = output_text.gsub(/\u1014/ ,"\u1014")
	      output_text = output_text.gsub(/\u1039\u1000/ ,"\u1060")
	      output_text = output_text.gsub(/\u1039\u1001/ ,"\u1061")
	      output_text = output_text.gsub(/\u1039\u1002/ ,"\u1062")
	      output_text = output_text.gsub(/\u1039\u1003/ ,"\u1063")
	      output_text = output_text.gsub(/\u1039\u1005/ ,"\u1065")
	      output_text = output_text.gsub(/\u1039\u1006/ ,"\u1066")
	      output_text = output_text.gsub(/(?<=[\u1001\u1002\u1004\u1005\u1007\u1012\u1013\u108f\u1015\u1016\u1017\u1019\u101d])\u1066/ ,"\u1067")
	      output_text = output_text.gsub(/\u1039\u1007/ ,"\u1068")
	      output_text = output_text.gsub(/\u1039\u1008/ ,"\u1069")
	      output_text = output_text.gsub(/\u1039\u100f/ ,"\u1070")
	      output_text = output_text.gsub(/\u1039\u1010/ ,"\u1071")
	      output_text = output_text.gsub(/(?<=[\u1001\u1002\u1004\u1005\u1007\u1012\u1013\u108f\u1015\u1016\u1017\u1019\u101d])\u1071/ ,"\u1072")
	      output_text = output_text.gsub(/\u1039\u1011/ ,"\u1073")
	      output_text = output_text.gsub(/(?<=[\u1001\u1002\u1004\u1005\u1007\u1012\u1013\u108f\u1015\u1016\u1017\u1019\u101d])\u1073/ ,"\u1074")
	      output_text = output_text.gsub(/\u1039\u1012/ ,"\u1075")
	      output_text = output_text.gsub(/\u1039\u1013/ ,"\u1076")
	      output_text = output_text.gsub(/\u1039\u1014/ ,"\u1077")
	      output_text = output_text.gsub(/\u1039\u1015/ ,"\u1078")
	      output_text = output_text.gsub(/\u1039\u1016/ ,"\u1079")
	      output_text = output_text.gsub(/\u1039\u1017/ ,"\u107a")
	      output_text = output_text.gsub(/\u1039\u1018/ ,"\u107b")
	      output_text = output_text.gsub(/\u1039\u1019/ ,"\u107c")
	      output_text = output_text.gsub(/\u1039\u101c/ ,"\u1085")
	      output_text = output_text.gsub(/\u100f\u1039\u100d/ ,"\u1091")
	      output_text = output_text.gsub(/\u100b\u1039\u100c/ ,"\u1092")
	      output_text = output_text.gsub(/\u1039\u100c/ ,"\u106d")
	      output_text = output_text.gsub(/\u100b\u1039\u100b/ ,"\u1097")
	      output_text = output_text.gsub(/\u1039\u100b/ ,"\u106c")
	      output_text = output_text.gsub(/\u100e\u1039\u100d/ ,"\u106f")
	      output_text = output_text.gsub(/\u100d\u1039\u100d/ ,"\u106e")
	      output_text = output_text.gsub(/\u1009(?=\u103a)/ ,"\u1025")
	      output_text = output_text.gsub(/\u1025(?=[\u1039\u102f\u1030])/ ,"\u106a")
	      output_text = output_text.gsub(/\u1025/ ,"\u1025")
	      output_text = output_text.gsub(/\u103a/ ,"\u1039")
	      output_text = output_text.gsub(/\u103b\u103d\u103e/ ,"\u107d\u108a")
	      output_text = output_text.gsub(/\u103d\u103e/ ,"\u108a")
	      output_text = output_text.gsub(/\u103b/ ,"\u103a")
	      output_text = output_text.gsub(/\u103c/ ,"\u103b")
	      output_text = output_text.gsub(/\u103d/ ,"\u103c")
	      output_text = output_text.gsub(/\u103e/ ,"\u103d")
	      output_text = output_text.gsub(/\u103a(?=[\u103c\u103d\u108a])/ ,"\u107d")
	      output_text = output_text.gsub(/(?<=\u100a(?:[\u102d\u102e\u1036\u108b\u108c\u108d\u108e]))\u103d/ ,"\u1087")
	      output_text = output_text.gsub(/(?<=\u100a)\u103d/ ,"\u1087")
	      output_text = output_text.gsub(/\u103b(?=[\u1000\u1003\u1006\u100f\u1010\u1011\u1018\u101a\u101c\u101e\u101f\u1021])/ ,"\u107e")
	      output_text = output_text.gsub(/\u107e([\u1000-\u1021\u108f])(?=[\u102d\u102e\u1036\u108b\u108c\u108d\u108e])/ ,"\u1080\\1")
	      output_text = output_text.gsub(/\u107e([\u1000-\u1021\u108f])(?=[\u103c\u108a])/ ,"\u1082\\1")
	      output_text = output_text.gsub(/\u103b([\u1000-\u1021\u108f])(?=[\u102d\u102e\u1036\u108b\u108c\u108d\u108e])/ ,"\u107f\\1")
	      output_text = output_text.gsub(/\u103b([\u1000-\u1021\u108f])(?=[\u103c\u108a])/ ,"\u1081\\1")
	      output_text = output_text.gsub(/(?<=\u1014)\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u1014[\u103a\u1032])\u1037/ ,"\u1094")
	      output_text = output_text.gsub(/(?<=\u1033)\u1094/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=\u1033[\u1036])\u1094/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=\u1034)\u1094/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=\u1034[\u1036])\u1094/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=[\u103c\u103d\u108a])\u1037/ ,"\u1095")
	      output_text = output_text.gsub(/(?<=[\u103c\u103d\u108a][\u1032])\u1037/ ,"\u1095")
	      # "return" is not necessary but it"s there to prevent "end" from auto-indent
	      return output_text
	    end

	    def zg12uni51(input_text)
	      return input_text unless detect_font(input_text) == :zawgyi
	      output_text = input_text
	      output_text = output_text.gsub(/\u106a/ ,"\u1009")
	      output_text = output_text.gsub(/\u1025(?=[\u1039\u102c])/ ,"\u1009")
	      output_text = output_text.gsub(/\u1025\u102e/ ,"\u1026")
	      output_text = output_text.gsub(/\u106b/ ,"\u100a")
	      output_text = output_text.gsub(/\u1090/ ,"\u101b")
	      output_text = output_text.gsub(/\u1040/ ,"\u1040")
	      output_text = output_text.gsub(/\u108f/ ,"\u1014")
	      output_text = output_text.gsub(/\u1012/ ,"\u1012")
	      output_text = output_text.gsub(/\u1013/ ,"\u1013")
	      output_text = output_text.gsub(/[\u103d\u1087]/ ,"\u103d")
	      output_text = output_text.gsub(/\u103c/ ,"\u103d")
	      output_text = output_text.gsub(/[\u103b\u107e\u107f\u1080\u1081\u1082\u1083\u1084]/ ,"\u103c")
	      output_text = output_text.gsub(/[\u103a\u107d]/ ,"\u103b")
	      output_text = output_text.gsub(/\u103d\u103b/ ,"\u103b\u103d")
	      output_text = output_text.gsub(/\u108a/ ,"\u103d\u103d")
	      output_text = output_text.gsub(/\u103d\u103d/ ,"\u103d\u103d")
	      output_text = output_text.gsub(/((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u1064/ ,"\u1064\\1\\2\\3")
	      output_text = output_text.gsub(/((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u108b/ ,"\u1064\\1\\2\\3\u102d")
	      output_text = output_text.gsub(/((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u108c/ ,"\u1064\\1\\2\\3\u102e")
	      output_text = output_text.gsub(/((?:\u1031)?)((?:\u103c)?)([\u1000-\u1021])\u108d/ ,"\u1064\\1\\2\\3\u1036")
	      output_text = output_text.gsub(/\u105a/ ,"\u102b\u103a")
	      output_text = output_text.gsub(/\u108e/ ,"\u102d\u1036")
	      output_text = output_text.gsub(/\u1033/ ,"\u102f")
	      output_text = output_text.gsub(/\u1034/ ,"\u1030")
	      output_text = output_text.gsub(/\u1088/ ,"\u103d\u102f")
	      output_text = output_text.gsub(/\u1089/ ,"\u103d\u1030")
	      output_text = output_text.gsub(/\u1039/ ,"\u103a")
	      output_text = output_text.gsub(/[\u1094\u1095]/ ,"\u1037")
	      output_text = output_text.gsub(/([\u1000-\u1021])([\u102c\u102d\u102e\u1032\u1036]){1,2}([\u1060\u1061\u1062\u1063\u1065\u1066\u1067\u1068\u1069\u1070\u1071\u1072\u1073\u1074\u1075\u1076\u1077\u1078\u1079\u107a\u107b\u107c\u1085])/ ,"\\1\\3\\2")
	      output_text = output_text.gsub(/\u1064/ ,"\u1004\u103a\u1039")
	      output_text = output_text.gsub(/\u104e/ ,"\u104e\u1004\u103a\u1038")
	      output_text = output_text.gsub(/\u1086/ ,"\u103f")
	      output_text = output_text.gsub(/\u1060/ ,"\u1039\u1000")
	      output_text = output_text.gsub(/\u1061/ ,"\u1039\u1001")
	      output_text = output_text.gsub(/\u1062/ ,"\u1039\u1002")
	      output_text = output_text.gsub(/\u1063/ ,"\u1039\u1003")
	      output_text = output_text.gsub(/\u1065/ ,"\u1039\u1005")
	      output_text = output_text.gsub(/[\u1066\u1067]/ ,"\u1039\u1006")
	      output_text = output_text.gsub(/\u1068/ ,"\u1039\u1007")
	      output_text = output_text.gsub(/\u1069/ ,"\u1039\u1008")
	      output_text = output_text.gsub(/\u106c/ ,"\u1039\u100b")
	      output_text = output_text.gsub(/\u1070/ ,"\u1039\u100f")
	      output_text = output_text.gsub(/[\u1071\u1072]/ ,"\u1039\u1010")
	      output_text = output_text.gsub(/[\u1073\u1074]/ ,"\u1039\u1011")
	      output_text = output_text.gsub(/\u1075/ ,"\u1039\u1012")
	      output_text = output_text.gsub(/\u1076/ ,"\u1039\u1013")
	      output_text = output_text.gsub(/\u1077/ ,"\u1039\u1014")
	      output_text = output_text.gsub(/\u1078/ ,"\u1039\u1015")
	      output_text = output_text.gsub(/\u1079/ ,"\u1039\u1016")
	      output_text = output_text.gsub(/\u107a/ ,"\u1039\u1017")
	      output_text = output_text.gsub(/\u107b/ ,"\u1039\u1018")
	      output_text = output_text.gsub(/\u107c/ ,"\u1039\u1019")
	      output_text = output_text.gsub(/\u1085/ ,"\u1039\u101c")
	      output_text = output_text.gsub(/\u106d/ ,"\u1039\u100c")
	      output_text = output_text.gsub(/\u1091/ ,"\u100f\u1039\u100d")
	      output_text = output_text.gsub(/\u1092/ ,"\u100b\u1039\u100c")
	      output_text = output_text.gsub(/\u1097/ ,"\u100b\u1039\u100b")
	      output_text = output_text.gsub(/\u106f/ ,"\u100e\u1039\u100d")
	      output_text = output_text.gsub(/\u106e/ ,"\u100d\u1039\u100d")
	      output_text = output_text.gsub(/(\u103c)([\u1000-\u1021])((?:\u1039[\u1000-\u1021])?)/ ,"\\2\\3\\1")
	      output_text = output_text.gsub(/(\u103d)(\u103d)([\u103b\u103c])/ ,"\\3\\2\\1")
	      output_text = output_text.gsub(/(\u103d)([\u103b\u103c])/ ,"\\2\\1")
	      output_text = output_text.gsub(/(\u103d)([\u103b\u103c])/ ,"\\2\\1")
	      output_text = output_text.gsub(/(?<=([\u1000-\u101c\u101e-\u102a\u102c\u102e-\u103d\u104c-\u109f]))(\u1040)(?=\s)?/ ,"\u101d")
	      output_text = output_text.gsub(/(?<=(\u101d))(\u1040)(?=\s)?/ ,"\u101d")
	      output_text = output_text.gsub(/(?<=([\u1000-\u101c\u101e-\u102a\u102c\u102e-\u103d\u104c-\u109f\s]))(\u1047)/ ,"\u101b")
	      output_text = output_text.gsub(/(\u1047)(?=[\u1000-\u101c\u101e-\u102a\u102c\u102e-\u103d\u104c-\u109f\s])/ ,"\u101b")
	      output_text = output_text.gsub(/((?:\u1031)?)([\u1000-\u1021])((?:\u1039[\u1000-\u1021])?)((?:[\u102d\u102e\u1032])?)([\u1036\u1037\u1038]{0,2})([\u103b-\u103d]{0,3})((?:[\u102f\u1030])?)([\u1036\u1037\u1038]{0,2})((?:[\u102d\u102e\u1032])?)/ ,"\\2\\3\\6\\1\\4\\9\\7\\5\\8")
	      output_text = output_text.gsub(/\u1036\u102f/ ,"\u102f\u1036")
	      output_text = output_text.gsub(/(\u103a)(\u1037)/ ,"\\2\\1")
	      # "return" is not necessary but it"s there to prevent "end" from auto-indent
	      return output_text
	    end

	    def detect_font(input_text)     
	        whitespace = "[\s\t\n]"
	        priorities = {zawgyi: 2, uni: 1, eng: 3}
	             #Font Detecting Library
	        detect = {
	            uni: [
	              "ှ", "ဿ", "ည်", "န်", "င်", "ေး", "ော",
	              "်း", "ဵ", "[ၐ-ၙ]", "^([က-အ]ြ|[က-အ]ေ)"
	            ],
	            zawgyi: [
	              "ာ္", "်ာ", whitespace+"(ျ|ေ|[ၾ-ႄ])[က-အ]",
	              "^(ျ|ေ|[ၾ-ႄ])[က-အ]", "[က-အ]္[^က-အ]", "ဥ္",
	              "္း" ,"[ါ-ူေ်း](ျ|[ၾ-ႄ])[က-အ]" ,"ံု",
	              "[က-အ]္ေ" , "ၤ","္"+whitespace, "ာေ",
	              "[ါ-ူ်း]ေ[က-အ]", "ေေ", "ုိ", "္$"
	            ],
	            eng: ["A-Za-z0-9"]
	        }
	        # With codepoints
	        # detect = {
	        #     unicode: [
	        #         "\\u103e", "\\u103f", "\\u100a\\u103a", "\\u1014\\u103a", "\\u1004\\u103a", "\\u1031\\u1038", "\\u1031\\u102c",
	        #         "\\u103a\\u1038", "\\u1035", "[\\u1050-\\u1059]", "^([\\u1000-\\u1021]\\u103c|[\\u1000-\\u1021]\\u1031)"
	        #     ],
	        #     zawgyi: [
	        #         "\\u102c\\u1039", "\\u103a\\u102c", whitespace+"(\\u103b|\\u1031|[\\u107e-\\u1084])[\\u1000-\\u1021]","^(\\u103b|\\u1031|[\\u107e-\\u1084])[\\u1000-\\u1021]", "[\\u1000-\\u1021]\\u1039[^\\u1000-\\u1021]", "\\u1025\\u1039","\\u1039\\u1038" ,"[\\u102b-\\u1030\\u1031\\u103a\\u1038](\\u103b|[\\u107e-\\u1084])[\\u1000-\\u1021]" ,"\\u1036\\u102f","[\\u1000-\\u1021]\\u1039\\u1031" , "\\u1064","\\u1039"+whitespace, "\\u102c\\u1031","[\\u102b-\\u1030\\u103a\\u1038]\\u1031[\\u1000-\\u1021]", "\\u1031\\u1031", "\\u102f\\u102d", "\\u1039"
	        #     ]
	        # };

	          match = input_text.match(/[\u1000-\u1097]/);

	          return nil unless match       

	          result = []
	          detect.each_key do|font_name|
	              count = 0
	              detect[font_name].each do|rule|
	                match_data = input_text.match(/#{rule}/).to_a
	                count += match_data.count if match_data
	              end
	              result.push({name: font_name, count: count,priority: priorities[font_name]})
	          end
	          result.sort_by! {|p| [p[:count],p[:priority]]}.reverse!
	          result.first[:name]
	    end
	end

	class NotSupportedForNonStringTypesError < StandardError 
		def initialize(object)
		    @object = object
		end
	end
  
    def self.included(receiver)
	    receiver.extend         ClassMethods
	    receiver.send :include, InstanceMethods
    end
    if defined?(Rails::Railtie)
      class Railtie < Rails::Railtie
        initializer 'acitverecord_mmunicode.insert_into_active_record' do
          ActiveSupport.on_load :active_record do
            ActiveRecord::Base.send(:include, AcitveRecordMmunicode)
          end
        end
      end
    else
      ActiveRecord::Base.send(:include, AcitveRecordMmunicode) if defined?(ActiveRecord)
    end
end

 

