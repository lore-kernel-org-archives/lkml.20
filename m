Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8414BA1D1;
	Tue, 15 Sep 2026 17:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789494116; cv=none; b=ovY6kuuJkrldaAN/rHXh5/0igl29qGlVqJy5np4C6s5NocSDMoKN3otTcpEPkrqAnWovoAuWCTcpeqXC2V7k7MLZBRG9tqrDYSTOcjcr0EUGbLKoL2uB7t3aiynGjmbTX86JJ310jzNhCDOGSuA911PMa3nCX434n7vsOzCRz3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789494116; c=relaxed/simple;
	bh=ckm5YErl8YuS5dn6xT8IvqcyZmcJHSVF6vVUUsLRAUc=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=G8xe4ElK0gVdR/BF72hoZi2oR4Qk+9LgK1lHPWCGB/1jgP1u+HsQmgN1oVDOWY7Zq1ekNa6A4jEeM7mkGlOg4/6mbnYxIPFHZMRA2KMdKlo9QGe8eUPLvM024OInaTv7YU4XMaVRpeXJJ4lSLUgtP1X1JRKNrd7bUgVjiI+Ug/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=LPDkFeI2; arc=none smtp.client-ip=185.70.43.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="LPDkFeI2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1789494105; x=1789753305;
	bh=2Z+GGqqxoNHhbn4tzCjicToeuuKyYpgbyqVA//Q9Hd8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=LPDkFeI2PdKqRhs2rvoa1q23+sfpghIMI36dZ2KzQZMkp9kgoWRdPUId/Xp8zofA5
	 LgIAWXNsSEtOXM6NRGbyRf1/WA5em6BHpNQSndRCX9mJl/ldKrchZfSlULchQv68el
	 i7yn1i5BYo2KNGk1+BN3FRnaM4sDQosXcv2iwnk9N0iki9v9kFiRf9+01M3MwFdmT1
	 6YhMn7AFkW2/iZp+iozYyWG4Uu50D33ajDX8i8OJb0zHuEOkD/9UVDdRU8fXt+a0jl
	 Y7mlN8QW0aabbEp6kOoGx6ePApCfH9wmnqChesft/bNL5LJ9RYWlEV1E4xKIQ0IFSX
	 C6BWfMMMxUyZQ==
Date: Tue, 15 Sep 2026 17:41:36 +0000
To: linux-sound@vger.kernel.org
From: patryk.dankow@protonmail.com
Cc: =?utf-8?Q?Patryk_Da=C5=84k=C3=B3w?= <patryk.dankow@protonmail.com>, perex@perex.cz, tiwai@suse.com, zhangheng@kylinos.cn, dnaim@cachyos.org, damien.dagorn29@gmail.com, kailang@realtek.com, habilerenturker@hotmail.com, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ALSA: hda/realtek: Add mute LED support for ASUS PM3406CKA
Message-ID: <20260915174110.67871-3-patryk.dankow@protonmail.com>
In-Reply-To: <20260915174110.67871-1-patryk.dankow@protonmail.com>
References: <20260915174110.67871-1-patryk.dankow@protonmail.com>
Feedback-ID: 221603438:user:proton
X-Pm-Message-ID: dbf11fb6ef013e63489214ee355fda125ceae26b
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Patryk Da=C5=84k=C3=B3w <patryk.dankow@protonmail.com>

Enable vmaster mute LED handling for the PM3406CKA while retaining
the existing CS35L41 I2C fixup by chaining the new fixup to it.

Tested on ASUS ExpertBook PM3406CKA.

Signed-off-by: Patryk Da=C5=84k=C3=B3w <patryk.dankow@protonmail.com>
---
 sound/hda/codecs/realtek/alc269.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/realtek/alc269.c b/sound/hda/codecs/realtek/a=
lc269.c
index 3abee617e86e..d1f0c2752624 100644
--- a/sound/hda/codecs/realtek/alc269.c
+++ b/sound/hda/codecs/realtek/alc269.c
@@ -180,6 +180,15 @@ static void alc_enable_headset_jack_key(struct hda_cod=
ec *codec)
 =09}
 }
=20
+static void alc_fixup_pm3406cka_vmaster_led(struct hda_codec *codec,
+=09=09=09=09=09    const struct hda_fixup *fix, int action)
+{
+=09struct alc_spec *spec =3D codec->spec;
+
+=09if (action =3D=3D HDA_FIXUP_ACT_PRE_PROBE)
+=09=09spec->gen.vmaster_mute_led =3D 1;
+}
+
 static void alc_fixup_headset_jack(struct hda_codec *codec,
 =09=09=09=09    const struct hda_fixup *fix, int action)
 {
@@ -4383,6 +4392,7 @@ enum {
 =09ALC287_FIXUP_YOGA9_14IAP7_BASS_SPK_PIN_HEADSET,
 =09ALC285_LENOVO_DAC_RENAME,
 =09ALC287_FIXUP_YOGA9_SPEAKER2_TO_DAC1,
+=09ALC_FIXUP_PM3406CKA_VMASTER_LED,
 };
=20
 /* A special fixup for Lenovo C940 and Yoga Duet 7;
@@ -7129,6 +7139,12 @@ static const struct hda_fixup alc269_fixups[] =3D {
 =09=09.chained =3D true,
 =09=09.chain_id =3D ALC287_FIXUP_TXNW2781_I2C,
 =09},
+=09[ALC_FIXUP_PM3406CKA_VMASTER_LED] =3D {
+=09=09.type =3D HDA_FIXUP_FUNC,
+=09=09.v.func =3D alc_fixup_pm3406cka_vmaster_led,
+=09=09.chained =3D true,
+=09=09.chain_id =3D ALC287_FIXUP_CS35L41_I2C_2,
+=09},
 };
=20
 static const struct hda_quirk alc269_fixup_tbl[] =3D {
@@ -7786,7 +7802,7 @@ static const struct hda_quirk alc269_fixup_tbl[] =3D =
{
 =09SND_PCI_QUIRK(0x1043, 0x13b0, "ASUS Z550SA", ALC256_FIXUP_ASUS_MIC_NO_P=
RESENCE),
 =09SND_PCI_QUIRK(0x1043, 0x1427, "Asus Zenbook UX31E", ALC269VB_FIXUP_ASUS=
_ZENBOOK),
 =09SND_PCI_QUIRK(0x1043, 0x1433, "ASUS GX650PY/PZ/PV/PU/PYV/PZV/PIV/PVV", =
ALC285_FIXUP_ASUS_I2C_HEADSET_MIC),
-=09SND_PCI_QUIRK(0x1043, 0x1454, "ASUS PM3406CKA", ALC287_FIXUP_CS35L41_I2=
C_2),
+=09SND_PCI_QUIRK(0x1043, 0x1454, "ASUS PM3406CKA", ALC_FIXUP_PM3406CKA_VMA=
STER_LED),
 =09SND_PCI_QUIRK(0x1043, 0x1460, "Asus VivoBook 15", ALC256_FIXUP_ASUS_MIC=
_NO_PRESENCE),
 =09SND_PCI_QUIRK(0x1043, 0x1463, "Asus GA402X/GA402N", ALC285_FIXUP_ASUS_I=
2C_HEADSET_MIC),
 =09SND_PCI_QUIRK(0x1043, 0x1473, "ASUS GU604VI/VC/VE/VG/VJ/VQ/VU/VV/VY/VZ"=
, ALC285_FIXUP_ASUS_HEADSET_MIC),
--=20
2.55.0


