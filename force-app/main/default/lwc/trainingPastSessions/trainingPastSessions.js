import { LightningElement, wire } from 'lwc';
import getPastTrainings from '@salesforce/apex/TrainingSessionController.getPastTrainings';

export default class TrainingPastSessions extends LightningElement {

    allPastTrainings = [];

    @wire(getPastTrainings)
    pastTrainingHandler({ data, error }) {
        if(data) {
            console.log('Past Trainings ', data);
            this.allPastTrainings = data;

            if(this.allPastTrainings.length == 0) {
                this.allPastTrainings = undefined;
            }
        }
        if(error) {
            console.error(error);
        }
    }
}