module ProductsHelper
    def time_left(end_time)
        end_time = DateTime.parse(end_time)
        now = DateTime.now
        tl = (end_time - now).to_i # tl for Time Left
        if tl >= 2
            return "#{tl} days"
        end
    end

    def listed_on(start_date)
        start = DateTime.parse(start_date)
        start.strftime("%b %e, '%y")
    end

    def listing_expires(end_date)
        end_date = DateTime.parse(end_date)
        end_date.strftime("%A %B %e, %Y at %l:%M %p")
    end
end
