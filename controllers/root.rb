post '/translate' do
  content_type :json
  # puts params

  # 组织请求参数
  slug = params[:slug]
  title = params[:title]
  desc = params[:desc]
  keywords = params[:keywords]
  meta = params[:meta]
  title_tag = params[:title_tag]
  support_lang = params[:to]
  apartment_id = params[:apartment_id]

  # 翻译
  translate_result = EasyTranslate.translate([slug,title,desc,keywords,meta,title_tag],:to=>support_lang)

  puts translate_result

  # 组织相应参数
  res_slug = translate_result[0]
  res_title = translate_result[1]
  res_desc = translate_result[2]
  res_keywords = translate_result[3]
  res_meta = translate_result[4]
  res_title_tag = translate_result[5]

  # 数据库写入
  tr = Translate.new
  tr.apartment_id = apartment_id
  tr.locale = support_lang
  tr.result = translate_result.to_s
  tr.save

  hash = {'slug'=>res_slug,'title'=>res_title,'desc'=>res_desc,'keywords'=>res_keywords,'meta'=>res_meta,'title_tag'=>res_title_tag}.to_json
  puts hash

  return hash
end