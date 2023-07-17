
import 'package:flutter/material.dart';
import 'package:note_app_frontend/domain/entities/note.dart';
import 'package:provider/provider.dart';

import '../../../config/theme/app_theme.dart';
import '../../../infrastructure/models/note_model.dart';
import '../../providers/note/note_provider.dart';
import '../../screens/note/noteList_screen.dart';
import 'menu_item.dart';

class LastNoteWidget extends StatelessWidget {
  const LastNoteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    final noteProvider = context.watch<NoteProvider>();
    final countNote = noteProvider.notes.length;
    noteProvider.getNotes();

    

    return Container(
        decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        color:AppTheme.white,
      ),
      child: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 18,vertical: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            (countNote != 0) ? 
           FindedLastNote(note: noteProvider.notes[0]) : const NoteNotFound()
          
          ],
        ),
      ),
    );
  }
}

class NoteNotFound extends StatelessWidget {
  const NoteNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children:  [ 
        const SizedBox(height: 10),
         //Imagen Nombre App
          Image.asset("assets/note-empty.png",
                  width: 140,
                  fit: BoxFit.cover,
                ),
        
        const SizedBox(height: 20),
        const Text('No se encontro alguna nota', style:  TextStyle(fontWeight: FontWeight.w500,fontSize: 18,color: Color.fromARGB(255, 23, 23, 23))), 
        const Text('Crear una nota en el boton de más'),

      ],
    );
  }
}

class FindedLastNote extends StatelessWidget {

  final NoteEntity note;
  
  const FindedLastNote({
    super.key, required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

          const SizedBox(
          height: 10,
        ), 
           const Text('Tu última nota                                                     ' , style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,)),
          
          const SizedBox(
          height: 10,
        ), 
      
          HomeItem(title: note.tituloNota,    bodyText: note.descriptionNota , color: AppTheme.note_1, icon: Icons.edit_note,               onPressed: () {final route = MaterialPageRoute(builder: (context) => const NoteListScreen());  Navigator.pushReplacement(context, route); },),      
        
      ],
    );
  }
}