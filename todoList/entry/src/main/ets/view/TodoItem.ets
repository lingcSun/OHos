import CommonConstants from '../common/constants/CommonConstant';
@Component
export default struct TodoItem{
  private content?: string;
  @State isComplete : boolean = false;
  build(){
    Row(){
     Image(this.isComplete? $r('app.media.ic_ok'):$r('app.media.ic_default'))
       .objectFit(ImageFit.Contain)
       .width($r('app.float.checkbox_width'))
       .height($r('app.float.checkbox_width'))
       .margin($r('app.float.checkbox_margin'))

      Text(this.content)
        .fontWeight(CommonConstants.FONT_WEIGHT)
        .fontSize($r('app.float.item_font_size'))
        .opacity(this.isComplete?CommonConstants.OPACITY_COMPLETED:CommonConstants.OPACITY_DEFAULT)
        .decoration({type:this.isComplete?TextDecorationType.LineThrough:TextDecorationType.None})
    }
    .borderRadius(CommonConstants.BORDER_RADIUS)
    .backgroundColor($r('app.color.start_window_background'))
    .width(CommonConstants.LIST_DEFAULT_WIDTH)
    .height($r('app.float.list_item_height'))
    .onClick(()=>{
      this.isComplete = !this.isComplete;
    })
  }
}