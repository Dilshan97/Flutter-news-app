import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/common/colors.dart';

class CategoryItem extends StatefulWidget {
  final String categoryName;
  final int index;
  final int activeCategory;
  final Function onClick;

  const CategoryItem({
    super.key,
    required this.categoryName,
    required this.index,
    required this.activeCategory,
    required this.onClick,
  });

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => widget.onClick(),
      child: Container(
        width: 130,
        decoration: BoxDecoration(
          border: Border.all(
            color: widget.activeCategory == widget.index
                ? AppColors.black
                : AppColors.lighterBlack,
            width: widget.activeCategory == widget.index ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        alignment: Alignment.center,
        margin: const EdgeInsets.only(
          left: 5,
          right: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            widget.categoryName[0].toUpperCase().toString() +
                widget.categoryName.substring(1).toString(),
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: widget.activeCategory == widget.index
                    ? AppColors.black
                    : AppColors.lighterBlack,
                fontWeight: widget.activeCategory == widget.index
                    ? FontWeight.w600
                    : FontWeight.w500,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
