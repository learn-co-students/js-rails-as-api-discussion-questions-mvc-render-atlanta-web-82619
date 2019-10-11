class ResponsesController < ApplicationController
  require 'csv'

  # for each of the controller actions,
  # render the data according to the name of the action
  def plain
    data = "Early bird gets the worm. But cookie taste better than worm. So me sleep in. - Cookie Monster"
    # send_data data, disposition: 'attachment';
    render plain: data;
  end

  def html
    data = "<html>
              <body>
                <q>Early bird gets the worm. But cookie taste better than worm. So me sleep in.</q>
                <cite>Cookie Monster</cite>
              </body>
            </html>".html_safe
    
    # render html:data
    # send_data(data, {type: })
  end

  def json
    data = {
      author: "Cookie Monster",
      quote:"Early bird gets the worm. But cookie taste better than worm. So me sleep in.",
    }
  end

  def xml
    data = "<quote>
    <author>Cookie Monster</author>
    <text>Early bird gets the worm. But cookie taste better than worm. So me sleep in.</text>
    </quote>"
  end

  def csv
    data =  CSV.generate do |csv|
      csv << ["author", "name"]
      csv << ["Cookie Monster", "Early bird gets the worm. But cookie taste better than worm. So me sleep in."]
    end

    # you'll need to use send_data instead of render
    # if you want the file to have a particular filename, pass the filename: parameter
  end

  def png
    filename = "public/data.png"

    # you'll need to use send_file instead of render
    # if you want the image to show inline, use disposition: :inline
  end
end
