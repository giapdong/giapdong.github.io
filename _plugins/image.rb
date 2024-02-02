module Jekyll
	class ImageTag < Liquid::Tag

		def initialize(tag_name, markup, tokens)
			super

			@attributes = {}
			@attributes['src'] = '';
			@attributes['caption'] = '';

			if markup =~ /(#{Liquid::QuotedFragment}+)?/
				# Parse parameters
				# Source: https://gist.github.com/jgatjens/8925165
				markup.scan(Liquid::TagAttributes) do |key, value|
					@attributes[key] = Liquid::Expression.parse(value)
				end
			else
				raise SyntaxError.new("Bad options")
			end
		end


		def render(context)

			mediaurl = context.registers[:site].config['mediaurl']

			# If already using fully url or using embed url => Keep origin
			matchData = @attributes['src'].match(/^https:\/\//)
			if matchData != nil
				imageurl = @attributes['src']
			else
				imageurl = "#{mediaurl}/#{@attributes['src']}"
			end

			%Q{
				<figure>
					<img src="#{imageurl}">
					<figcaption>#{@attributes["caption"]}</figcaption>
				</figure>
			}
		end
	end
end

Liquid::Template.register_tag('image', Jekyll::ImageTag)