Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794839173;
	b=lKIt3sqt7tenJ9Ccxf2ujeCdZfbxByQ70Kh3NcywxqjTnXffFJyyuraBwzquAUgOmMqn
	 uqz1AMrr7sSwiVnnz72C0OA7eSA2x455lduwTYXEATw7BD6xCyP93PehGn0JY0nnUfGdq
	 FuY7rMx8dNxzKYVyeD6WL/XVWDEMSujFcl6s9cJEJvF4PJhBHwOYCba7OMmTjKrhV/271
	 zNyi28amR2W5w/+2zNa96s9Qf79eMq1HBvbBF1DPZwUDk+4bNEgTu2G+VsPCdCWYk+RWX
	 BaTXnL6WyMhfu6lxEd/buzMVqGx2ZEm1JdfUAqUer2T3NCIEGVpyOgcjhpev/eRBGhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794839173;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=4oxKujtqx5IgmdP1CS1qJ3X/KUwSuoYjTR+SbgKHxNs=;
	b=lHQOd12tlpKTcXXAzZH3WvtMPwgQOP2nE0CG6yN3nIhun9jhwMjDTBxuxfKUM2Fextib
	 +KFXk2jkTCQmNBaUwfCOJ5FVYmQtpmuQRZgOtqwxsqRFl37y5Ad8ppoy7hGJbhA3ctp2y
	 IrlnesIAl3LfrtY1eXA1aP34LU9KhhrK9IqsVTkAFcSxhS6+P9Tf0iEvIVQHfkU/RG4y7
	 ksiBYnb70jMJZlWbUQEt17cs2BXIuUTkpjjUSHzx6QUvy/lr276+j1Z9V2bzXiGlHcOQf
	 6DxhV+rstHAYUvA/pRGtThW9xCMOvWO2JmdYYq6O7kUQClTv43r7UPJ0P73aLrUIXDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nl7eOqVE;
	arc=none smtp.remote-ip=109.224.244.123
Received: from mail-244123.protonmail.ch (mail-244123.protonmail.ch [109.224.244.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9B4606A332
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 14:26:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E9B4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=protonmail2 header.b=nl7eOqVE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1794839170; x=1795098370;
	bh=4oxKujtqx5IgmdP1CS1qJ3X/KUwSuoYjTR+SbgKHxNs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=nl7eOqVE5wmcUEY6QOOWyWpGH2kGgwbYegHLeh5wEoAl8oAX6kiX1ysshZcnXDu4+
	 NesWGebKNLSLPTOvDYh6Q7fIQ0oGzCWZjgatxhxl7zVfgxwCKHn+n4TzU3rxniiyLy
	 CtJxd+y1oSvJepFLpaWbqYShiBEVVAKOwA8C2VJd/MpU6gV9OYbBABnXif5SbrmHQO
	 OQK0tig6s+ukKqDIff+um0DDyqnKO6sJwNI8L7K1uu7eT0iWo2QWRCJ1NBHUoQluY8
	 d+9gbSj3NKEM58bVpJ7h4Z175upZUIzDK3b9biZlz7JM7OMGZtoUZ7pmhIiNDqxKeR
	 XaLXB7sZHGHkA==
Date: Mon, 16 Nov 2026 14:26:03 +0000
To: tiwai@suse.de, Devin Christensen <dchristensen8@proton.me>
From: Devin Christensen <dchristensen8@proton.me>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, rafael@gexdigital.net
Subject: [PATCH 2/2] ALSA: hda/ca0132: Add Sound BlasterX AE-5 on-card RGB LED support
Message-ID: <20261116142542.4178770-3-dchristensen8@proton.me>
In-Reply-To: <20261116142542.4178770-1-dchristensen8@proton.me>
References: <20261116140237.4137662-1-dchristensen8@proton.me> <87qzgkyi5l.wl-tiwai@suse.de> <20261116142542.4178770-1-dchristensen8@proton.me>
Feedback-ID: 45895322:user:proton
X-Pm-Message-ID: 7eac2773c3782d640315739678fb217841e4cace
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

The Sound BlasterX AE-5 and AE-5 Plus feature 5 on-board APA102
(DotStar) RGB LEDs providing logo and shroud accent illumination.
These LEDs are driven directly by CA0113 bridge GPIO pin 2 (data)
and pin 3 (clock) mapped through PCIe BAR2 at MMIO offset 0x320.

Expose the on-board LEDs through a volatile card control element:

  "AE-5 On-Card LEDs"  (RW, BYTES): 15-byte RGB payload representing
                       the 5 on-board LEDs (3 bytes per LED).

Writes bit-bang the 32-bit start frame, 5 APA102 LED frames (8-bit
brightness and 24-bit BGR color), and 32-bit end frame over GPIO
pins 2 and 3, and leave the pins idle low. Access is serialized
using spec->ae5_strip_mutex to prevent concurrent MMIO register
access with the external LED strip, and codec power is managed
via CLASS(snd_hda_power_pm, pm)(codec).

This allows userspace RGB lighting controllers (such as OpenRGB) to
drive both the on-card LEDs and the external strip purely through
standard ALSA card control devices (/dev/snd/controlC*) without
requiring /dev/mem, PCIe resource sysfs mmap, or root privileges.

Signed-off-by: Devin Christensen <dchristensen8@proton.me>
---
 sound/hda/codecs/ca0132.c | 97 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 96 insertions(+), 1 deletion(-)

diff --git a/sound/hda/codecs/ca0132.c b/sound/hda/codecs/ca0132.c
index b127fe50f..b7c97a079 100644
--- a/sound/hda/codecs/ca0132.c
+++ b/sound/hda/codecs/ca0132.c
@@ -1062,6 +1062,7 @@ enum dsp_download_state {
  */
=20
 #define AE5_STRIP_MAX_LEDS 100
+#define AE5_ONCARD_LEDS 5
=20
 struct ca0132_spec {
 =09struct hda_gen_spec gen;
@@ -1167,10 +1168,11 @@ struct ca0132_spec {
 =09bool use_alt_controls;
=20
 #if IS_ENABLED(CONFIG_SND_HDA_DSP_LOADER)
-=09/* AE-5 WS2812 strip control */
+=09/* AE-5 WS2812 strip and on-card LED control */
 =09struct mutex ae5_strip_mutex;
 =09u32 ae5_strip_cur_colors[AE5_STRIP_MAX_LEDS];
 =09int ae5_strip_cur_num_leds;
+=09u8 ae5_oncard_cur_colors[AE5_ONCARD_LEDS * 3];
 #endif
 };
=20
@@ -8690,6 +8692,90 @@ static int ae5_strip_num_leds_put(struct snd_kcontro=
l *kcontrol,
 =09return 1;
 }
=20
+static void ae5_oncard_write_bit(struct ca0132_spec *spec, bool bit)
+{
+=09writew(bit ? 0x102 : 0x002, spec->mem_base + 0x320);
+=09writew(0x103, spec->mem_base + 0x320);
+=09writew(0x003, spec->mem_base + 0x320);
+}
+
+/*
+ * Caller must hold spec->ae5_strip_mutex.
+ */
+static void ae5_oncard_send_frame(struct hda_codec *codec, const u8 *rgb_c=
olors)
+{
+=09struct ca0132_spec *spec =3D codec->spec;
+=09int i, bit;
+
+=09if (!spec || !spec->mem_base)
+=09=09return;
+
+=09lockdep_assert_held(&spec->ae5_strip_mutex);
+=09CLASS(snd_hda_power_pm, pm)(codec);
+
+=09/* Start frame: 32 zeroes */
+=09for (i =3D 0; i < 32; i++)
+=09=09ae5_oncard_write_bit(spec, false);
+
+=09/* 5 APA102 LEDs: 8-bit brightness (0xFF), Blue, Green, Red */
+=09for (i =3D 0; i < AE5_ONCARD_LEDS; i++) {
+=09=09u8 r =3D rgb_colors[i * 3 + 0];
+=09=09u8 g =3D rgb_colors[i * 3 + 1];
+=09=09u8 b =3D rgb_colors[i * 3 + 2];
+=09=09u32 val =3D 0xff000000 | ((u32)b << 16) | ((u32)g << 8) | (u32)r;
+
+=09=09for (bit =3D 31; bit >=3D 0; bit--)
+=09=09=09ae5_oncard_write_bit(spec, (val >> bit) & 1);
+=09}
+
+=09/* End frame: 32 ones */
+=09for (i =3D 0; i < 32; i++)
+=09=09ae5_oncard_write_bit(spec, true);
+
+=09/* Return GPIO pins 2 (data) and 3 (clock) to idle low */
+=09ca0113_mmio_gpio_set(codec, 2, false);
+=09ca0113_mmio_gpio_set(codec, 3, false);
+}
+
+static int ae5_oncard_ctl_info(struct snd_kcontrol *kcontrol,
+=09=09=09       struct snd_ctl_elem_info *uinfo)
+{
+=09uinfo->type =3D SNDRV_CTL_ELEM_TYPE_BYTES;
+=09uinfo->count =3D AE5_ONCARD_LEDS * 3;
+=09return 0;
+}
+
+static int ae5_oncard_ctl_get(struct snd_kcontrol *kcontrol,
+=09=09=09      struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09memcpy(ucontrol->value.bytes.data, spec->ae5_oncard_cur_colors,
+=09       AE5_ONCARD_LEDS * 3);
+=09return 0;
+}
+
+static int ae5_oncard_ctl_put(struct snd_kcontrol *kcontrol,
+=09=09=09      struct snd_ctl_elem_value *ucontrol)
+{
+=09struct hda_codec *codec =3D snd_kcontrol_chip(kcontrol);
+=09struct ca0132_spec *spec =3D codec->spec;
+=09bool change;
+
+=09guard(mutex)(&spec->ae5_strip_mutex);
+=09change =3D memcmp(spec->ae5_oncard_cur_colors, ucontrol->value.bytes.da=
ta,
+=09=09=09AE5_ONCARD_LEDS * 3) !=3D 0;
+=09if (!change)
+=09=09return 0;
+
+=09memcpy(spec->ae5_oncard_cur_colors, ucontrol->value.bytes.data,
+=09       AE5_ONCARD_LEDS * 3);
+=09ae5_oncard_send_frame(codec, spec->ae5_oncard_cur_colors);
+=09return 1;
+}
+
 static const struct snd_kcontrol_new ae5_strip_ctls[] =3D {
 =09{
 =09=09.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
@@ -8709,6 +8795,15 @@ static const struct snd_kcontrol_new ae5_strip_ctls[=
] =3D {
 =09=09.get =3D ae5_strip_num_leds_get,
 =09=09.put =3D ae5_strip_num_leds_put,
 =09},
+=09{
+=09=09.iface =3D SNDRV_CTL_ELEM_IFACE_CARD,
+=09=09.name =3D "AE-5 On-Card LEDs",
+=09=09.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE |
+=09=09=09  SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+=09=09.info =3D ae5_oncard_ctl_info,
+=09=09.get =3D ae5_oncard_ctl_get,
+=09=09.put =3D ae5_oncard_ctl_put,
+=09},
 };
=20
 static int ae5_add_strip_controls(struct hda_codec *codec)
--=20
2.56.0


