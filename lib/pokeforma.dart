class Pokeforma {
    Pokeforma({
        required this.formName,
        required this.formNames,
        required this.formOrder,
        required this.id,
        required this.isBattleOnly,
        required this.isDefault,
        required this.isMega,
        required this.name,
        required this.names,
        required this.order,
        required this.pokemon,
        required this.sprites,
        required this.types,
        required this.versionGroup,
    });

    final String? formName;
    final List<dynamic> formNames;
    final int? formOrder;
    final int? id;
    final bool? isBattleOnly;
    final bool? isDefault;
    final bool? isMega;
    final String? name;
    final List<dynamic> names;
    final int? order;
    final Pokemon? pokemon;
    final Sprites? sprites;
    final List<Type> types;
    final Pokemon? versionGroup;

    factory Pokeforma.fromJson(Map<String, dynamic> json){ 
        return Pokeforma(
            formName: json["form_name"],
            formNames: json["form_names"] == null ? [] : List<dynamic>.from(json["form_names"]!.map((x) => x)),
            formOrder: json["form_order"],
            id: json["id"],
            isBattleOnly: json["is_battle_only"],
            isDefault: json["is_default"],
            isMega: json["is_mega"],
            name: json["name"],
            names: json["names"] == null ? [] : List<dynamic>.from(json["names"]!.map((x) => x)),
            order: json["order"],
            pokemon: json["pokemon"] == null ? null : Pokemon.fromJson(json["pokemon"]),
            sprites: json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
            types: json["types"] == null ? [] : List<Type>.from(json["types"]!.map((x) => Type.fromJson(x))),
            versionGroup: json["version_group"] == null ? null : Pokemon.fromJson(json["version_group"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "form_name": formName,
        "form_names": formNames.map((x) => x).toList(),
        "form_order": formOrder,
        "id": id,
        "is_battle_only": isBattleOnly,
        "is_default": isDefault,
        "is_mega": isMega,
        "name": name,
        "names": names.map((x) => x).toList(),
        "order": order,
        "pokemon": pokemon?.toJson(),
        "sprites": sprites?.toJson(),
        "types": types.map((x) => x.toJson()).toList(),
        "version_group": versionGroup?.toJson(),
    };

}

class Pokemon {
    Pokemon({
        required this.name,
        required this.url,
    });

    final String? name;
    final String? url;

    factory Pokemon.fromJson(Map<String, dynamic> json){ 
        return Pokemon(
            name: json["name"],
            url: json["url"],
        );
    }

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };

}

class Sprites {
    Sprites({
        required this.backDefault,
        required this.backFemale,
        required this.backShiny,
        required this.backShinyFemale,
        required this.frontDefault,
        required this.frontFemale,
        required this.frontShiny,
        required this.frontShinyFemale,
    });

    final String? backDefault;
    final dynamic backFemale;
    final String? backShiny;
    final dynamic backShinyFemale;
    final String? frontDefault;
    final dynamic frontFemale;
    final String? frontShiny;
    final dynamic frontShinyFemale;

    factory Sprites.fromJson(Map<String, dynamic> json){ 
        return Sprites(
            backDefault: json["back_default"],
            backFemale: json["back_female"],
            backShiny: json["back_shiny"],
            backShinyFemale: json["back_shiny_female"],
            frontDefault: json["front_default"],
            frontFemale: json["front_female"],
            frontShiny: json["front_shiny"],
            frontShinyFemale: json["front_shiny_female"],
        );
    }

    Map<String, dynamic> toJson() => {
        "back_default": backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny,
        "front_shiny_female": frontShinyFemale,
    };

}

class Type {
    Type({
        required this.slot,
        required this.type,
    });

    final int? slot;
    final Pokemon? type;

    factory Type.fromJson(Map<String, dynamic> json){ 
        return Type(
            slot: json["slot"],
            type: json["type"] == null ? null : Pokemon.fromJson(json["type"]),
        );
    }

    Map<String, dynamic> toJson() => {
        "slot": slot,
        "type": type?.toJson(),
    };

}
