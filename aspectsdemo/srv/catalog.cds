using { sodemo.db as so } from '../db/aspectsdemo';

service SOSrv {

    entity SOSet as projection on so.SO;

}