import router from '@ohos.router';
@Entry
@Component
struct SecondPage {
  @State message: string = 'second page';
  src:string = router.getParams()?.['src'];
  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        Text(this.src)
          .fontSize(15)
          .fontWeight(FontWeight.Lighter)
        Button('back').onClick(()=>{
          router.back()
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}