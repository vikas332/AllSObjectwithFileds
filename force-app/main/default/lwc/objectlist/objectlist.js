import { LightningElement, api, track ,wire} from 'lwc';
import  getAccounts from '@salesforce/apex/objList_2.objdata';
import  getfileds from '@salesforce/apex/objList_2.filedsdata';


export default class objectList extends LightningElement {
    
    @track accOptions =[];
    @track filedsOptons =[];
    parameter ="";
   
    connectedCallback(){
        getAccounts()
        .then(result=>{
          
            this.accOptions = result;
        })
    }

        onchange(event){
        this.value = event.detail.value;
        this.parameter = this.value;

      
        getfileds({ObjectName : this.parameter})
        .then(fieldsresult=>{
         
        this.filedsOptons =  fieldsresult;
        })
        
        
        }
        
            
        onchange1(event){
                this.value = event.detail.value;
          }
            
         
          
            
    }