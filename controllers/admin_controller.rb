post '/index' do
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

  # 翻译
  translate_result = EasyTranslate.translate([slug,title,desc,keywords,meta,title_tag],:to=>support_lang)

  puts translate_result

  # 组织相应参数
  slug = translate_result[0]
  title = translate_result[1]
  desc = translate_result[2]
  keywords = translate_result[3]
  meta = translate_result[4]
  title_tag = translate_result[5]

  return {'slug'=>slug,'title'=>title,'desc'=>desc,'keywords'=>keywords,'meta'=>meta,'title_tag'=>title_tag}.to_json
end