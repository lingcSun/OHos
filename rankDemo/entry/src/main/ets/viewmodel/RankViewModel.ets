import { RankData } from './RankData';
import { rankData1,rankData2 } from '../model/DataModel';

export class RankViewModel {
  loadDataSource1():RankData[]{
   return rankData1;
}
  loadDataSource2():RankData[]{
    return rankData2;
  }
}