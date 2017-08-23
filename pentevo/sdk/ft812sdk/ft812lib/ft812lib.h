#pragma once// ft812dl.cu32 ft_AlphaFunc(u8 func, u8 ref);u32 ft_Begin(u8 prim);u32 ft_BitmapHandle(u8 handle);u32 ft_BitmapLayout(u8 format, u16 linestride, u16 height);u32 ft_BitmapLayoutH(u8 linestride, u8 height);u32 ft_BitmapLayoutX(u16 linestride, u16 height);u32 ft_BitmapSize(u8 filter, u8 wrapx, u8 wrapy, u16 width, u16 height);u32 ft_BitmapSizeH(u8 width, u8 height);u32 ft_BitmapSizeX(u16 width, u16 height);u32 ft_BitmapSource(u32 addr);u32 ft_BitmapTransformA(s32 a);u32 ft_BitmapTransformB(s32 b);u32 ft_BitmapTransformC(s32 c);u32 ft_BitmapTransformD(s32 d);u32 ft_BitmapTransformE(s32 e);u32 ft_BitmapTransformF(s32 f);u32 ft_BlendFunc(u8 src, u8 dst);u32 ft_Call(u16 dest);u32 ft_Cell(u8 cell);u32 ft_Clear(u8 c, u8 s, u8 t);u32 ft_ClearAll();u32 ft_ClearColorA(u8 alpha);u32 ft_ClearColorRGB(u8 red, u8 green, u8 blue);u32 ft_ClearColorRGB32(u32 rgb);u32 ft_ClearStencil(u8 s);u32 ft_ClearTag(u8 s);u32 ft_ColorA(u8 alpha);u32 ft_ColorMask(u8 r, u8 g, u8 b, u8 a);u32 ft_ColorRGB(u8 red, u8 green, u8 blue);u32 ft_ColorRGB32(u32 rgb);u32 ft_Display(void);u32 ft_End(void);u32 ft_Jump(u16 dest);u32 ft_LineWidth(u16 width);u32 ft_Macro(u8 m);u32 ft_PaletteSource(u32 addr);u32 ft_PointSize(u16 size);u32 ft_RestoreContext(void);u32 ft_Return(void);u32 ft_SaveContext(void);u32 ft_ScissorSize(u16 width, u16 height);u32 ft_ScissorXY(u16 x, u16 y);u32 ft_StencilFunc(u8 func, u8 ref, u8 mask);u32 ft_StencilMask(u8 mask);u32 ft_StencilOp(u8 sfail, u8 spass);u32 ft_Tag(u8 s);u32 ft_TagMask(u8 mask);u32 ft_Vertex2f(s16 x, s16 y);u32 ft_Vertex2ii(u16 x, u16 y, u8 handle, u8 cell);u32 ft_VertexFormat(u8 f);u32 ft_VertexTranslateX(s32 v);u32 ft_VertexTranslateY(s32 v);// ft812func.cu16 ft_rd16(u16 a);u8 ft_rd8(u16 a);void ft_cmd(u8 a);void ft_cmdp(u8 a, u8 v);void ft_finish_write(void *addr, u16 size);void ft_init(u8 m);void ft_start_write(u32 a);void ft_swap();void ft_wait_int();void ft_wr16(u16 a, u16 v);void ft_wr8(u16 a, u8 v);void ft_write(u32 ft_addr, void *addr, u16 size);void ft_write_dl(void *addr, u16 size);extern const FT_MODE ft_modes[];// ft812math.cs16 rcos(s16 r, u16 th);s16 rsin(s16 r, u16 th);extern const u16 sintab[];