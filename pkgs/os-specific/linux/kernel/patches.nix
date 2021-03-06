{ stdenv, fetchurl }:

let

  realtimePatch =
    { branch
    , kversion
    , pversion
    , url ? "https://www.kernel.org/pub/linux/kernel/projects/rt/${branch}/older/patch-${kversion}-${pversion}.patch.xz"
    , sha256
    }:
    { name  = "rt-${kversion}-${pversion}";
      patch = fetchurl {
        inherit url sha256;
      };
    };

in rec {

  realtimePatch_3_14 = realtimePatch
    { branch = "3.14";
      kversion = "3.14.73";
      pversion = "rt78";
      sha256 = "0fxqh4vdgzkl5jfc231lh7zmqy6s1ygx8brxw0ja7v4hh09rfshz";
    };

  realtimePatch_3_18 = realtimePatch
    { branch = "3.18";
      kversion = "3.18.36";
      pversion = "rt38";
      sha256 = "051bc6cyy3l6wkvnzss7rdm87mldlv1rsncd45s25h5qf55gjimc";
    };

  realtimePatch_4_1 = realtimePatch
    { branch = "4.1";
      kversion = "4.1.27";
      pversion = "rt31";
      sha256 = "1dhmq9ml78w62pjaxyrq8k2h2wywy5wv2rj6l7gh51px20kgzdd2";
    };

  realtimePatch_4_4 = realtimePatch rec
    { branch = "4.4";
      kversion = "4.4.15";
      pversion = "rt23";
      sha256 = "1i58dibdd8lv7gmap55px9kkv32xzxkh8mml28v9r97kl32dr9da";
    };

  realtimePatch_4_6 = realtimePatch rec
    { branch = "4.6";
      kversion = "4.6.7";
      pversion = "rt11";
      sha256 = "1ny3d6648rbm5lg5fi4gix7an6pa9jwa30sh2djp3mg29lzpivs9";
    };
}
