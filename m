Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779058;
	b=U8ehzf7c886yYotOzQkkvcF1V/XnJ2BAyCbqzpI8tFSOEOr6izMfW7ji8qYBK6/+b/Yv
	 RJ5EGKBbP16JzBXzGljtSUvYkZIzlmqCGwPrObB6vNap7ae0W9Endx3F1RLXgap3/61Do
	 fFUc9idgUchpqeHZrRxP9YJX2npYX2m6Vl/cKcyocal9O2B/B/+ofTf0I9zv6k2qZjP/r
	 ZG8Ozmldl9JgP7AVVBCtkLsGocZ5a82O3XuhojUjGdfwueN8DaL7x73XL4BPYO7KZASp0
	 19ixWDFV7tvsEUZpC5MEsR0syN4icvxNRdlf5ZRHcw4TksAzHlHum3iCF5FehwmL5CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779058;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=i77gF2HbipJum7QiR9NOzjZb4VBQt+OOfO+2hvHBy8w=;
	b=Kcq+VyWFGVn7VYX6eK10yEs/ZXHGTknq+IQAehrXXHX9Dvhj/6Urc0WGn9Hu9axSSDES
	 N7YRHv0fFUwBq0dNrUo2yLVVtEQZUXWkhnyDSD97Gnp7anUoSM8rmkE1/KD8Hq4cFyOSF
	 xtQVR9OY4tGrovbWBRNhO29WkRJYS6FzBrYSm5vZ/42snf75sTaBXXkDATA/1LeOu3mlo
	 Umz2e6OmuK+9O0/CRLuyLSsfaVtGrVa+2GA/LyXwltsYVrwOw8AmM9qBmL3A3Q2CTaA8J
	 4o/ZYL4jizeENdMt55sCzOnTVh4S63StgytIFoD8mWYCOF60fhAtDIVGTVR1dBiHdfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Ph35nxP+;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8691B606A89B
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8691B606A89B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Ph35nxP+
DKIM2-Signature:  i=1; m=1; t=1794779055;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:pV4KsBBOc+OYIDBcQSx8dHvdikLd
   l7SH2kEIZgdtLRLTz5GHArN4cwBy81VRFvLJmxmCoFurfc9G58b9D5ivkh0Fh//j28PWAo4u6Ug
   Prt844qO9gJLwOZQYd9pobdqrB0Aa7JTyQBT8HGDlYULS4LeREgR42TYrIFUOoekY5hvhdEFHFL
   XPEwm6TpioLY3Cj3tcC/IZQs+u15euztdIhe94cMOEtI/wK3fDR4VY+r691BEr68zjLUEgruGgq
   hljUH+1DfWZzGDZv26tsiROfsnKcHr7GMj1uUEbk4WTuqsjItFzz/JlTOQvxgv6nZmTKDw8JsFn
   yp9h+cJEbpFTyA==;
Message-Instance:  m=1;
 h=sha256:
   Zg+i9dFMQxrijAVFsuYjhxPeHTXtkmS1ZOOgv1O399c=:
   H9aShWI79KN9+/qZOMThUZ0ry5p3zcKXwKw12Q7tS80=,
  sha512:
   WJfTAw5QKFI5SLAibFBvs+tadlFFoSq23WrLeLgVHVtycgU5uJaXE08wxCk0JAuEeLjAUuP9tUCbMY1yJOj2oQ==:
   UioEQH+BeBsiyf/kNhZLPwR/mD+H6ltN1O8BnbgZkbJOXQaHkut5vk2Xrr9SyJqC1Dn5BWM3883P83d+n9vynA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779033; x=1795383833; i=arc@gmx.li;
	bh=i77gF2HbipJum7QiR9NOzjZb4VBQt+OOfO+2hvHBy8w=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ph35nxP+PAUiredfjl3WuxFWMkFAdRtTLQjs2qjKArhYlWEqChsZ4NHfiBSqqe3Y
	 xFLJX3qUBgSzhUVzdCigvzFI38DwTFIseCEJzPXlEdLWtKOGdP6eQfm5p8pMboNpU
	 0P3ClQRTXovYpKqAa73BgjztaPh0r62euwx1Xp/JxhTRRxteSW9XQRBVVPMxPqijn
	 v8IcFOiBGF8pA2lYmCFTtwgV8M2MtXx6RqbAFU/VmNyaZ4wIE2/oQ9Woouhu7J0aA
	 NL8E9pM+7UMuBqD3T20LwZ9ZQp4aZSPw3cr+WNWvEGLNqh0+4Rw4l+WXVS5voBKFs
	 5wKT/i6j+4Kl4dAdiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFbVu-1xDqRb1VNu-00GPCE; Sun, 15
 Nov 2026 22:43:53 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 15/19] ALSA: mixer_audient: Add Audient iD14 MkI controls
Date: Sun, 15 Nov 2026 22:43:32 +0100
Message-ID: <20261115214336.17917-16-arc@gmx.li>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261112023720.1503814-1-mrwillporter@gmail.com>
References: <20261112023720.1503814-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fmiprXVAKqbQzSiHcOeZyhnmt4F58/Txo0wsByorsoS5TxhL2uz
 GsUfB0qPVuFqBkUr0j3Jdtr0vK4UrwB0GHUzzuSJyaxhKXzQKl468rCI3GaWnrkuOAi6ik6
 k90DkDeWnyiGEdh4Yry3Bcx0TZdEDXtDkCVGLzMXbRH8fe5JYMYTlksys+shgwQYKiizQ7J
 MicoDgj4uW0eiPVP7bWHA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Y5RkLZwLWoM=;am4qKiTnGHyuEvpGwyJhJMQmQrJ
 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
 j8mk=

From: Will Porter <mrwillporter@gmail.com>

The iD14 MkI (2708:0002) has its monitor controller on extension unit
54 and its output routing on extension unit 51. The headphone level is
on feature unit 10 (CN 3-4, which the descriptor does not declare).
The mixer is mixer unit 60. The generic driver cannot find the vendor
controls and creates wrong controls for mixer unit 60 and feature unit
11. Add the MkI as a device with these tables. Apart from the tables
and their macros, the patch adds the device ID, its case in
mixer_quirks.c and the map entries that hide the generic controls.

Monitor and routing controls: speaker volume, cut, dim, dim level,
mono, mono mode, polarity, talkback, headphone volume and mute, and
one routing selector per output channel. All of them read the device
on every get: the front panel knob changes the volumes and the cut and
mute states.

The volumes are s16 values in 1/256 dB from -128 to 0 dB, in the 1 dB
steps of the knob. -128 dB does not mute the headphones, so the TLV
does not declare a mute.

DAW Thru plays the USB stream past the monitor controller, so the main
output selectors name it "DAW Thru (full scale)". The headphone volume
and mute still act on every headphone source, so the headphone
selectors name it "DAW Thru".

Mixer matrix: mixer unit 60 mixes 14 inputs (Mic 1-2, Digi 1-8, DAW
1-4) into four outputs (Main L/R, Cue L/R), CN =3D input * 4 + output.
GET RANGE reports -127 to 0 dB in 1 dB steps, so the generic driver
creates four "Analogue 4 Volume" controls with values from 0 to 127.
The crosspoints take -128 dB (mute) to +6 dB in 1/256 dB steps, as on
the EVO4, so they use the same control type. Add one stereo control
per input and output pair: "Mix Main <input> Playback Volume" and "Mix
Cue <input> Playback Volume". Hide the generic controls in the MkI
map. The driver reads each crosspoint at probe and writes nothing to
the mixer.

Write-only controls: some MkI controls cannot be read back:
- GET stalls for the input gain boost and polarity (feature unit 11),
  the iD key function and the digital input mode.
- GET of the talkback source answers 0, whatever value a SET wrote.

For FU 11 the generic driver creates "Input Gain Control" and "Phase
Inverter Control" and logs "cannot get min/max values". Add:
- Mic 1/2 Boost Capture Switch (+10 dB)
- Mic 1/2 and Digi 1/2 Polarity Invert Capture Switch
- iD Key Function Playback Enum (ScrollControl, Mono, Mono + Polarity,
  Dim, Talkback)
- Talkback Source Capture Enum (None, Mic 1-2, Digi 1-8)
- Digital In Mode Capture Enum (ADAT, S/PDIF)

and hide the generic FU 11 controls in the MkI map. The device refuses
polarity on Digi 3-8 with EPIPE, in ADAT and in S/PDIF mode, so Digi
3-8 have no polarity control.

These controls use the cache, init and force-set flags: they show the
last value written, every put sends its value, and the probe writes
each one once so that the value shown is true:
- boost and polarity off, iD key ScrollControl, talkback source None
- S/PDIF: the MkI's measured power-on mode

If a probe write fails, the card still registers: the control shows
"Unknown" (or off) until a put succeeds.

The probe write replaces any value the device kept. On mains power the
device keeps its values across a replug, so the controls return to the
probe values until alsactl restore runs.

Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 311 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |   1 +
 sound/usb/mixer_maps.c    |   2 +
 sound/usb/mixer_quirks.c  |   3 +
 4 files changed, 317 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 2e1d4809645f..30e1309cec3a 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -3,6 +3,10 @@
  * Audient driver for ALSA
  * Copyright (C) 2026 Christian Ruppert <arc@gmx.li>
  *
+ * Supported models: EVO4 (2708:0006), iD14 MkI (2708:0002).
+ * The iD14 MkII and other iD models keep the generic driver: their units
+ * may differ.
+ *
  * EVO4 support is based on the work of Ivan Hazucha for audient-evo-py.
  * https://github.com/vanzaho/audient-evo-py/
  */
@@ -10,6 +14,7 @@
=20
 #include <asm/byteorder.h>
 #include <linux/usb.h>
+#include <linux/usb/audio.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/slab.h>
 #include <linux/types.h>
@@ -31,6 +36,25 @@ enum snd_audient_type {
 	SND_AUDIENT_TYPE_MUTE,
 	SND_AUDIENT_TYPE_MUTE_OUT,
 	SND_AUDIENT_TYPE_MIXER,
+	SND_AUDIENT_TYPE_ID14_MON_VOLUME,
+	SND_AUDIENT_TYPE_ID14_MON_CUT,
+	SND_AUDIENT_TYPE_ID14_MON_DIM,
+	SND_AUDIENT_TYPE_ID14_MON_DIM_LEVEL,
+	SND_AUDIENT_TYPE_ID14_MON_MONO,
+	SND_AUDIENT_TYPE_ID14_MON_MONO_MODE,
+	SND_AUDIENT_TYPE_ID14_MON_POLARITY,
+	SND_AUDIENT_TYPE_ID14_MON_TALKBACK,
+	SND_AUDIENT_TYPE_ID14_HP_VOLUME,
+	SND_AUDIENT_TYPE_ID14_HP_MUTE,
+	SND_AUDIENT_TYPE_ID14_ROUTE_MAIN_L,
+	SND_AUDIENT_TYPE_ID14_ROUTE_MAIN_R,
+	SND_AUDIENT_TYPE_ID14_ROUTE_HP_L,
+	SND_AUDIENT_TYPE_ID14_ROUTE_HP_R,
+	SND_AUDIENT_TYPE_ID14_IN_BOOST,
+	SND_AUDIENT_TYPE_ID14_IN_POLARITY,
+	SND_AUDIENT_TYPE_ID14_MON_ID_KEY,
+	SND_AUDIENT_TYPE_ID14_MON_TALKBACK_SRC,
+	SND_AUDIENT_TYPE_ID14_OPTICAL_MODE,
 	SND_AUDIENT_TYPE_NCTYPES
 };
=20
@@ -61,6 +85,149 @@ struct snd_audient_enum {
 	};								\
 	static_assert(ARRAY_SIZE(texts_) =3D=3D ARRAY_SIZE(name##_values))
=20
+/*
+ * iD14 MkI units. The monitor controller, output routing, headphone leve=
l,
+ * input options and the mixer sit on extension units and on feature unit=
s
+ * whose descriptors declare no controls; the generic driver cannot find =
them.
+ */
+#define ID14_IT_DIGITAL		0x01	/* input terminal: optical and coaxial */
+#define ID14_FU_OUT		0x0a	/* before the outputs: CN 3-4 headphones */
+#define ID14_FU_IN		0x0b	/* inputs: CN 1-2 Mic, 3-10 Digi */
+#define ID14_FU_MIX		0x0c	/* after the mixer: CN 1-2 Main, 3-4 Cue */
+#define ID14_ROUTE		0x33	/* routing XU: CN =3D destination */
+#define ID14_MON		0x36	/* monitor controller XU */
+
+/* Monitor controller selectors */
+#define ID14_MON_MONO		0x00
+#define ID14_MON_MONO_MODE	0x01
+#define ID14_MON_POLARITY	0x03
+#define ID14_MON_CUT		0x04
+#define ID14_MON_DIM		0x05
+#define ID14_MON_DIM_LEVEL	0x06	/* s16, 1/256 dB */
+#define ID14_MON_TALKBACK	0x07
+#define ID14_MON_TALKBACK_SRC	0x08	/* GET always returns 0 */
+#define ID14_MON_ID_KEY		0x10	/* u16: the selector the iD key toggles */
+#define ID14_MON_VOLUME		0x12	/* s16, 1/256 dB; the knob also sets it */
+
+#define ID14_IN_BOOST		0x0b	/* s16: 0x0a00 =3D +10 dB, 0 =3D off */
+#define ID14_IN_POLARITY	0x0d
+#define ID14_IT_OPTICAL_MODE	0x00	/* u32: 0 ADAT, 1 S/PDIF */
+
+#define ID14_ROUTE_SOURCE	0x06	/* u8: source of the destination */
+
+/*
+ * iD14 volumes: s16 in 1/256 dB, -128 ... 0 dB, in the 1 dB steps of the
+ * front panel knob. Control value 0 is -128 dB, 128 is 0 dB. -128 dB is =
not
+ * a mute: on the headphones the level stops falling at a small residual.
+ */
+static const DECLARE_TLV_DB_SCALE(snd_audient_tlv_id14_vol, -12800, 100, =
0);
+
+/* Mono mode: one-speaker sum (Left, Right) or phantom centre */
+static const char *const snd_audient_id14_mono_mode_texts[] =3D {
+	"Left", "Centre", "Right",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
+		 snd_audient_id14_mono_mode_texts, 1, 0, 2);
+
+/*
+ * Output routing. Main Mix is 0x14/0x15 on the main outputs and 0x18/0x1=
9
+ * on the headphones; DAW Thru on destination n plays DAW n + 1. DAW Thru
+ * bypasses the monitor controller (speaker volume, cut and dim), so the
+ * main outputs play the USB stream at full scale. The headphone volume a=
nd
+ * mute still act on every headphone source.
+ */
+static const char *const snd_audient_id14_route_main_texts[] =3D {
+	"Main Mix", "Cue Mix", "DAW Thru (full scale)",
+};
+static const char *const snd_audient_id14_route_hp_texts[] =3D {
+	"Main Mix", "Cue Mix", "DAW Thru",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_route_main_l,
+		 snd_audient_id14_route_main_texts, 0x14, 0x10, 0x00);
+SND_AUDIENT_ENUM(snd_audient_id14_route_main_r,
+		 snd_audient_id14_route_main_texts, 0x15, 0x11, 0x01);
+SND_AUDIENT_ENUM(snd_audient_id14_route_hp_l,
+		 snd_audient_id14_route_hp_texts, 0x18, 0x10, 0x02);
+SND_AUDIENT_ENUM(snd_audient_id14_route_hp_r,
+		 snd_audient_id14_route_hp_texts, 0x19, 0x11, 0x03);
+
+/*
+ * iD key function: the value is the monitor controller selector the key
+ * toggles. ScrollControl (0xffff) toggles nothing: the knob then scrolls
+ * through the HID interface.
+ */
+static const char *const snd_audient_id14_id_key_texts[] =3D {
+	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
+		 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
+		 ID14_MON_TALKBACK);
+
+/* Talkback source: the routing source number of the input; none =3D 0xff=
 */
+static const char *const snd_audient_id14_talkback_texts[] =3D {
+	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4",
+	"Digi 5", "Digi 6", "Digi 7", "Digi 8",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_talkback, snd_audient_id14_talkback_tex=
ts,
+		 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
+
+static const char *const snd_audient_id14_optical_texts[] =3D {
+	"ADAT", "S/PDIF",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts=
,
+		 0, 1);
+
+/*
+ * Write-only: GET stalls or does not report writes. Show the last value
+ * written, write the init value at probe, and send every put.
+ */
+#define ID14_WO	(SND_AUDIENT_CTYPE_FLAGS_CACHE		\
+		 | SND_AUDIENT_CTYPE_FLAGS_GET_BROKEN	\
+		 | SND_AUDIENT_CTYPE_FLAGS_INIT_HW)
+
+#define ID14_BOOL(unit_, sel_)				\
+	{						\
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,	\
+		.len =3D 1,				\
+		.min.integer =3D 0,			\
+		.max.integer =3D 1,			\
+		.unit =3D (unit_),			\
+		.sel =3D (sel_),				\
+	}
+
+/* 1 =3D cut or mute: shown as a switch that is off */
+#define ID14_BOOL_INV(unit_, sel_)			\
+	{						\
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,	\
+		.len =3D 1,				\
+		.min.integer =3D 1,			\
+		.max.integer =3D 0,			\
+		.unit =3D (unit_),			\
+		.sel =3D (sel_),				\
+	}
+
+#define ID14_VOLUME(unit_, sel_)			\
+	{						\
+		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,	\
+		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED,	\
+		.len =3D 2,				\
+		.min.integer =3D -128 * 256,		\
+		.max.integer =3D 0,			\
+		.res =3D 256,				\
+		.tlv =3D snd_audient_tlv_id14_vol,	\
+		.unit =3D (unit_),			\
+		.sel =3D (sel_),				\
+	}
+
+#define ID14_ENUM(unit_, sel_, len_, enum_)		\
+	{						\
+		.type =3D SNDRV_CTL_ELEM_TYPE_ENUMERATED,	\
+		.len =3D (len_),				\
+		.enumeration =3D &(enum_),		\
+		.unit =3D (unit_),			\
+		.sel =3D (sel_),				\
+	}
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
@@ -122,6 +289,88 @@ static const struct snd_audient_ctrl_type {
 		.sel =3D 0x01,
 		.tlv =3D snd_audient_tlv_mixer,
 	},
+	[SND_AUDIENT_TYPE_ID14_MON_VOLUME] =3D
+		ID14_VOLUME(ID14_MON, ID14_MON_VOLUME),
+	[SND_AUDIENT_TYPE_ID14_MON_CUT] =3D
+		ID14_BOOL_INV(ID14_MON, ID14_MON_CUT),
+	[SND_AUDIENT_TYPE_ID14_MON_DIM] =3D
+		ID14_BOOL(ID14_MON, ID14_MON_DIM),
+	[SND_AUDIENT_TYPE_ID14_MON_DIM_LEVEL] =3D
+		ID14_VOLUME(ID14_MON, ID14_MON_DIM_LEVEL),
+	[SND_AUDIENT_TYPE_ID14_MON_MONO] =3D
+		ID14_BOOL(ID14_MON, ID14_MON_MONO),
+	[SND_AUDIENT_TYPE_ID14_MON_MONO_MODE] =3D
+		ID14_ENUM(ID14_MON, ID14_MON_MONO_MODE, 1,
+			  snd_audient_id14_mono_mode),
+	[SND_AUDIENT_TYPE_ID14_MON_POLARITY] =3D
+		ID14_BOOL(ID14_MON, ID14_MON_POLARITY),
+	[SND_AUDIENT_TYPE_ID14_MON_TALKBACK] =3D
+		ID14_BOOL(ID14_MON, ID14_MON_TALKBACK),
+	[SND_AUDIENT_TYPE_ID14_HP_VOLUME] =3D
+		ID14_VOLUME(ID14_FU_OUT, UAC_FU_VOLUME),
+	[SND_AUDIENT_TYPE_ID14_HP_MUTE] =3D
+		ID14_BOOL_INV(ID14_FU_OUT, UAC_FU_MUTE),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_MAIN_L] =3D
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_main_l),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_MAIN_R] =3D
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_main_r),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_HP_L] =3D
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_hp_l),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_HP_R] =3D
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_hp_r),
+	/* the documented boost is a fixed +10 dB */
+	[SND_AUDIENT_TYPE_ID14_IN_BOOST] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.flags =3D ID14_WO,
+		.len =3D 2,
+		.min.integer =3D 0,
+		.max.integer =3D 10 * 256,
+		.init =3D 0,
+		.unit =3D ID14_FU_IN,
+		.sel =3D ID14_IN_BOOST,
+	},
+	[SND_AUDIENT_TYPE_ID14_IN_POLARITY] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.flags =3D ID14_WO,
+		.len =3D 1,
+		.min.integer =3D 0,
+		.max.integer =3D 1,
+		.init =3D 0,
+		.unit =3D ID14_FU_IN,
+		.sel =3D ID14_IN_POLARITY,
+	},
+	[SND_AUDIENT_TYPE_ID14_MON_ID_KEY] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_ENUMERATED,
+		.flags =3D ID14_WO,
+		.len =3D 2,
+		.init =3D 0xffff,		/* ScrollControl */
+		.enumeration =3D &snd_audient_id14_id_key,
+		.unit =3D ID14_MON,
+		.sel =3D ID14_MON_ID_KEY,
+	},
+	[SND_AUDIENT_TYPE_ID14_MON_TALKBACK_SRC] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_ENUMERATED,
+		.flags =3D ID14_WO,
+		.len =3D 1,
+		.init =3D 0xff,		/* None */
+		.enumeration =3D &snd_audient_id14_talkback,
+		.unit =3D ID14_MON,
+		.sel =3D ID14_MON_TALKBACK_SRC,
+	},
+	/* the power-on mode is S/PDIF */
+	[SND_AUDIENT_TYPE_ID14_OPTICAL_MODE] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_ENUMERATED,
+		.flags =3D ID14_WO,
+		.len =3D 4,
+		.init =3D 1,		/* S/PDIF */
+		.enumeration =3D &snd_audient_id14_optical,
+		.unit =3D ID14_IT_DIGITAL,
+		.sel =3D ID14_IT_OPTICAL_MODE,
+	},
 };
=20
=20
@@ -182,6 +431,62 @@ static const char *const snd_audient_evo4_matrix[] =
=3D {
 	NULL
 };
=20
+#define ID14_CTRL(name_, type_, offs_, chans_)		\
+	{						\
+		.name =3D (name_),			\
+		.type =3D SND_AUDIENT_TYPE_ID14_##type_,	\
+		.channels =3D (chans_),			\
+		.hwchannels =3D (chans_),			\
+		.val_offs =3D (offs_),			\
+	}
+
+static const struct snd_audient_ctrl snd_audient_id14_mk1_controls[] =3D =
{
+	ID14_CTRL("Monitor Speaker Playback Volume", MON_VOLUME, 0, 1),
+	ID14_CTRL("Monitor Speaker Playback Switch", MON_CUT, 0, 1),
+	ID14_CTRL("Monitor Dim Playback Switch", MON_DIM, 0, 1),
+	ID14_CTRL("Monitor Dim Level Playback Volume", MON_DIM_LEVEL, 0, 1),
+	ID14_CTRL("Monitor Mono Playback Switch", MON_MONO, 0, 1),
+	ID14_CTRL("Monitor Mono Mode Playback Enum", MON_MONO_MODE, 0, 1),
+	ID14_CTRL("Monitor Polarity Invert Playback Switch", MON_POLARITY, 0, 1)=
,
+	ID14_CTRL("Monitor Headphone Playback Volume", HP_VOLUME, 3, 2),
+	ID14_CTRL("Monitor Headphone Playback Switch", HP_MUTE, 3, 2),
+	ID14_CTRL("Talkback Playback Switch", MON_TALKBACK, 0, 1),
+	ID14_CTRL("Main Out L Source Playback Enum", ROUTE_MAIN_L, 0, 1),
+	ID14_CTRL("Main Out R Source Playback Enum", ROUTE_MAIN_R, 1, 1),
+	ID14_CTRL("Headphone L Source Playback Enum", ROUTE_HP_L, 2, 1),
+	ID14_CTRL("Headphone R Source Playback Enum", ROUTE_HP_R, 3, 1),
+	ID14_CTRL("Mic 1 Boost Capture Switch", IN_BOOST, 1, 1),
+	ID14_CTRL("Mic 2 Boost Capture Switch", IN_BOOST, 2, 1),
+	ID14_CTRL("Mic 1 Polarity Invert Capture Switch", IN_POLARITY, 1, 1),
+	ID14_CTRL("Mic 2 Polarity Invert Capture Switch", IN_POLARITY, 2, 1),
+	/* Digi 3-8 refuse polarity (CN 5-10 stall) */
+	ID14_CTRL("Digi 1 Polarity Invert Capture Switch", IN_POLARITY, 3, 1),
+	ID14_CTRL("Digi 2 Polarity Invert Capture Switch", IN_POLARITY, 4, 1),
+	ID14_CTRL("iD Key Function Playback Enum", MON_ID_KEY, 0, 1),
+	ID14_CTRL("Talkback Source Capture Enum", MON_TALKBACK_SRC, 0, 1),
+	ID14_CTRL("Digital In Mode Capture Enum", OPTICAL_MODE, 0, 1),
+	{ 0 }, /* sentinel */
+};
+
+/*
+ * iD14 MkI mixer: unit 60, 14 inputs x 4 outputs, CN =3D input * 4 + out=
put
+ * (outputs Main L, Main R, Cue L, Cue R). Each input has a Main and a Cu=
e
+ * pair, so with 2 channels per element, element n starts at CN 2 * n.
+ */
+#define ID14_MIX(in) "Mix Main " in " Playback Volume",	\
+		     "Mix Cue " in " Playback Volume"
+
+static const char *const snd_audient_id14_mk1_matrix[] =3D {
+	ID14_MIX("Mic 1"), ID14_MIX("Mic 2"),
+	ID14_MIX("Digi 1"), ID14_MIX("Digi 2"),
+	ID14_MIX("Digi 3"), ID14_MIX("Digi 4"),
+	ID14_MIX("Digi 5"), ID14_MIX("Digi 6"),
+	ID14_MIX("Digi 7"), ID14_MIX("Digi 8"),
+	ID14_MIX("DAW 1"), ID14_MIX("DAW 2"),
+	ID14_MIX("DAW 3"), ID14_MIX("DAW 4"),
+	NULL
+};
+
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
@@ -194,6 +499,12 @@ static const struct audient_devinfo {
 		.matrix_names =3D snd_audient_evo4_matrix,
 		.matrix_channels =3D 2,
 	},
+	{
+		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID),
+		.controls =3D snd_audient_id14_mk1_controls,
+		.matrix_names =3D snd_audient_id14_mk1_matrix,
+		.matrix_channels =3D 2,
+	},
 	{ 0 } /* sentinel */
 };
=20
diff --git a/sound/usb/mixer_audient.h b/sound/usb/mixer_audient.h
index db4f31e02b5e..5d705ffe2cfa 100644
=2D-- a/sound/usb/mixer_audient.h
+++ b/sound/usb/mixer_audient.h
@@ -6,6 +6,7 @@
=20
 #define USB_AUDIENT_VID (0x2708)
 #define USB_EVO4_PID (0x0006)
+#define USB_ID14_MK1_PID (0x0002)
=20
 int snd_audient_controls_create(struct usb_mixer_interface *mixer);
=20
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 31f8d0253437..b88244b12a98 100644
=2D-- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -542,7 +542,9 @@ static const struct usbmix_name_map audient_id14_map[]=
 =3D {
=20
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] =3D {
+	{ 11, NULL },			/* FU, see mixer_audient.c */
 	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{ 60, NULL },			/* MU, see mixer_audient.c */
 	{}
 };
=20
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index c250ebea5af5..f06839b89fe1 100644
=2D-- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4783,6 +4783,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixe=
r_interface *mixer)
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
 		err =3D snd_audient_controls_create(mixer);
 		break;
+	case USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID): /* Audient iD14 MkI */
+		err =3D snd_audient_controls_create(mixer);
+		break;
=20
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
 		err =3D snd_soundblaster_e1_switch_create(mixer);
=2D-=20
2.56.1

