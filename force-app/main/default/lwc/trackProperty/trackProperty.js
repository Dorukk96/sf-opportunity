import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {

    @track location = {
        city: "Houston",
        country: "United States",
        postalCode: "11223"
    };


    cityHandler(event) {
        this.location.city = event.detail.value; 
    }

}