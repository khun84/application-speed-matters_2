module PaginationHelper

    class Paginate
        def initialize(records: nil, selected_page: nil, page_per_block: 10, per_page:10)
            @total_record = records.unscope(:limit).unscope(:offset).count
            @selected_page = selected_page
            @page_per_block = page_per_block
            @per_page = records.first.class.per_page

        end

        def per_page
            unless @per_page.nil?
                @per_page
            else
                10
            end
        end

        def page_per_block
            @page_per_block
        end

        def selected_page
            if @selected_page > total_page
                total_page
            else
                @selected_page
            end
        end

        def total_page
            (@total_record.to_f / per_page).ceil
        end

        def total_block
            (total_page.to_f / page_per_block).ceil
        end

        def get_current_block
            if selected_page > total_page
                return 'no such page'
            end

            # return the block number of the pagination
            if selected_page % page_per_block == 0
                (selected_page/page_per_block.to_f).floor
            else
                (selected_page/page_per_block.to_f).floor + 1
            end
        end

        def get_start_page
            current_block = get_current_block

            (current_block - 1) * page_per_block + 1
        end

        def get_end_page
            current_block = get_current_block
            end_page = current_block * page_per_block
            if end_page > total_page
                end_page = total_page
            end

            end_page
        end

        def previous_class
            if self.get_current_block == 1
                'disabled'
            else
                ''
            end
        end

        def next_class
            if self.get_current_block == self.total_block
                'disabled'
            else
                ''
            end
        end

        def active_class(page)
            if self.selected_page == page
                'active'
            else
                ''
            end
        end
    end
end

# codes below are for testing purpose
# include PaginationHelper
# paginate = Paginate.new records: (1..198).to_a, selected_page: 21, page_per_block: 10, per_page: 10
# puts "current block: #{paginate.get_current_block}"
# puts "selected page: #{paginate.selected_page}"
# puts "start page: #{paginate.get_start_page}"
# puts "end page: #{paginate.get_end_page}"