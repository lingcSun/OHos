export class RankData {
  name: Resource;
  vote: string;
  id: String;

  constructor(id: string, name: Resource, vote: string) {
    this.id = id;
    this.name = name;
    this.vote = vote;
  }
}