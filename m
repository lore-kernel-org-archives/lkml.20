Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793982760;
	b=kMDDMiqwXo9fUqqH1H3HywyaYWJ/URdoUIQ6fnXwKL0MhfX0jqGLUh7Emgwau0hzwaZ1
	 xph/CUi/u63n23HzWwnXfw7yjGFdfKWBMzfRchSj935BT43mcvPm1RAwlEpuyh898Fy9c
	 cReu0bZe4EeWo2W1u6wvsOQxxG5YImGTsom/1G9n/xSPorui6b7sIOUCWbNIrbTCDiqz8
	 5SLjAGuhFr1NXwcnaFWwjQ6PE4aXENdBAsBD4kSbEL2wyc/qJAv7kVIl+JkAp9f2VZw7Z
	 XiBf03rFjtsYsVZ5E+ACYIy/aZHporLRw7Sf/baQFIDkcsrhve/WoxNHOCU4NIxcZGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793982760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PTCEk0rfYN30ii+10AUcyxUW4Jq3hxAmbF7RdINEsBE=;
	b=SQ0Ed3HrdIvJzBfKnn/Frh00fWUMHcIA8OWBPNwmuoFyszgUULB8ZcofADhKhTNXJdEL
	 2Xmo/FY4B9NVmGc0FAwQ7H1KOweC0rrxoLRh6G1WhLLXiJcFEhOzox7T81oR/5hruFfY7
	 Gja4owzXKggtDsZDDtew6QPTUQBX5VW0n3RMEnV9rD8pBMbMTVfFt06v4DXYgwYPG/Rz8
	 mVBG10RX6ywxgFhNQHodHBY+8Zt8pBxmugmZ1gGNslo0dnbiES6bAqhK/YjEiV1TJZPBp
	 mJ8pBeZvg6W7I4l+3tOGCKv1oxsAQqKVRfSBbCyQAa4XmmMKVHtOjGlbMf5traHL2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="eHa2E8/s";
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048146082BEB
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:32:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 048146082BEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=eHa2E8/s
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-8256106635eso383388a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793982759; x=1794587559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PTCEk0rfYN30ii+10AUcyxUW4Jq3hxAmbF7RdINEsBE=;
        b=eHa2E8/s9JAHk59lLH90gGZ3tT6Asov3+gw4fKR1GntTpy2mlrrATIwAZI1U1RQPWa
         cMW2C53ij3XdXidoItg3B+9raPVaCjTj7iPFX0Z5sWpcVCpI+D/RPfKhbwmrKlVgqSGU
         d90czgCQM+wTy7w+hN1zBjGSCPunh/ekhUXV5PAys6I1ik5geSgbD+mLZX9BXbOnsLIl
         oY/+Ef5T66RL6CJZXrXMsNhCAyPAZxj1az+qPFQjUObwsWf0uA1V5aVAe9Z+VJ+/CLsA
         IlTfZuJFEOW6xc/WVqgMAzIgGKAXe52HKhzyZ7I71Lcb4NHHcABMa5IIxVAxob/plTco
         KQEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793982759; x=1794587559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PTCEk0rfYN30ii+10AUcyxUW4Jq3hxAmbF7RdINEsBE=;
        b=sK7zMVcF9x7Xu4J0j2iqQWCvCMMBwwdvIm3bwZ3jkbj9J5voev6g4tzOSQmNrDTimS
         VZUPInCIP1eovc4f9W1aaO8uB4L83hX/YPaUIT6Ky7Ji7yn6oXlJ0jd5Ukd/DoMzmEqv
         5eUeLDa93A3z264w6lQCaMmrlySnsw3vNn5jVAf49vIyWri0qApEds6JYriZgB2eFvdt
         8BzPmmcuv5GxqAOw4BIso/tzmHGIeQ2znI5k5vhArE5URjfuzxUzoHw76wOoFYWxIanL
         A4wCHTPQH/llRisJ3x9NyIGf7j1l4eT2AUiLQ52PTu0/GxrtsLTaWQ7Rb7dy45jOu6N9
         5N3w==
X-Forwarded-Encrypted: i=1; AKwUvBzgAhKifdJ5QGZ1nxNrDOpMWqBY94lXth/9WQJwEWUhuaTtkg5gYD/7rc+i5KNhvXmUg/3hz/HKfOAl5lc=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XQL9xxChA8kTppU5M2OcHtbHP5CiYTeY/XAThirjCj8lghwHJ
	Qz+1Ynky5P6FIQnpcLWMrsB2EOzrPBGKM8IdGU9w+r5ke0LsOAV7qWqt
X-Gm-Gg: AYBFou3x/hQPnsOVPsAT8zE4/Ouu0YsFcB6snSlfz9B43WDG7bpqrs1jO6rNbTuGVM3
	xX7OzTfd02Dn3lSXTrxd5YxQFVQdmGPjuKBUfUfEYP2XV5GHlyAb8vQ8of2DtUAhX+37wozEZbi
	yzeinaltOBuo2X1hm/PoW+Vv0ETsb1xEUwoH8b0J8JtWNmCT1O8HG9oJBVwlAlliPNCAhQXax/O
	bbqcBnC4JhQ3fIN0U7lPv95ayphvD1Z9Vo/Mb7xwz+MfapFE/hhETAwSrIOTiL0HWfzkW9O2Uzz
	Zw+jXsRxvy0VnNain1SSjXSxaOmykC3Rd71Snfjpf2YYOLlH5TUZwkh5oy15Rz8jLHMNtf8bLx/
	K5YeBo5cHf0zS6GaPlrmsURaaCrfLcWpe5fx909gSra8lHrweMidc9J2TpCzq6djzdSSLWo2B4W
	O/LKsvlbQTs8hBcxiiK7pUat9+IRCzVx0wFOfZ1xBmHgpqXvdaRMK4qHlG3ohCIW+ggLS8DoXaA
	HcVHhimm1wwD4A87m9PqKOtiZk+au3EG2evvkS/spls1NCfra77EUnhtkoajA81SPb9EQTCRuJb
	rlED+P+gzNLfANU23MBobpHMiMEkVFJEh6UcvkMiZeEfBHaVc1kBOyH/w2bkFHfTd50=
X-Received: by 2002:a05:6830:3116:b0:819:28cc:637f with SMTP id 46e09a7af769-85f1cb6d060mr3670346a34.0.1793982758711;
        Fri, 06 Nov 2026 08:32:38 -0800 (PST)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1de8f066sm2244780a34.23.2026.11.06.08.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:32:38 -0800 (PST)
From: Will Porter <mrwillporter@gmail.com>
To: Christian Ruppert <arc@gmx.li>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>
Subject: [RFC PATCH 15/16] ALSA: mixer_audient: Add Audient iD14 MkI controls
Date: Fri,  6 Nov 2026 10:31:28 -0600
Message-ID: <20261106163129.1006907-16-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261106163129.1006907-1-mrwillporter@gmail.com>
References: <aupn1wwW7w08M3gu@khmer.arcnet>
 <20261106163129.1006907-1-mrwillporter@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
1-4) into four outputs (Main L/R, Cue L/R), CN = input * 4 + output.
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

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient.c | 313 ++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient.h |   1 +
 sound/usb/mixer_maps.c    |   2 +
 sound/usb/mixer_quirks.c  |   3 +
 4 files changed, 319 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 3e6cd8981b4f..ad39d17c0b5e 100644
--- a/sound/usb/mixer_audient.c
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
 
@@ -63,6 +87,151 @@ struct snd_audient_enum {
 	};								\
 	static_assert(ARRAY_SIZE(texts_) == ARRAY_SIZE(name##_values) + 1)
 
+/*
+ * iD14 MkI units. The monitor controller, output routing, headphone level,
+ * input options and the mixer sit on extension units and on feature units
+ * whose descriptors declare no controls; the generic driver cannot find them.
+ */
+#define ID14_IT_DIGITAL		0x01	/* input terminal: optical and coaxial */
+#define ID14_FU_OUT		0x0a	/* before the outputs: CN 3-4 headphones */
+#define ID14_FU_IN		0x0b	/* inputs: CN 1-2 Mic, 3-10 Digi */
+#define ID14_FU_MIX		0x0c	/* after the mixer: CN 1-2 Main, 3-4 Cue */
+#define ID14_ROUTE		0x33	/* routing XU: CN = destination */
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
+#define ID14_IN_BOOST		0x0b	/* s16: 0x0a00 = +10 dB, 0 = off */
+#define ID14_IN_POLARITY	0x0d
+#define ID14_IT_OPTICAL_MODE	0x00	/* u32: 0 ADAT, 1 S/PDIF */
+
+#define ID14_ROUTE_SOURCE	0x06	/* u8: source of the destination */
+
+/*
+ * iD14 volumes: s16 in 1/256 dB, -128 ... 0 dB, in the 1 dB steps of the
+ * front panel knob. Control value 0 is -128 dB, 128 is 0 dB. -128 dB is not
+ * a mute: on the headphones the level stops falling at a small residual.
+ */
+static const DECLARE_TLV_DB_SCALE(snd_audient_tlv_id14_vol, -12800, 100, 0);
+
+/* Mono mode: one-speaker sum (Left, Right) or phantom centre */
+static const char *const snd_audient_id14_mono_mode_texts[] = {
+	"Left", "Centre", "Right", "Other",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_mono_mode,
+		 snd_audient_id14_mono_mode_texts, 1, 0, 2);
+
+/*
+ * Output routing. Main Mix is 0x14/0x15 on the main outputs and 0x18/0x19
+ * on the headphones; DAW Thru on destination n plays DAW n + 1. DAW Thru
+ * bypasses the monitor controller (speaker volume, cut and dim), so the
+ * main outputs play the USB stream at full scale. The headphone volume and
+ * mute still act on every headphone source.
+ */
+static const char *const snd_audient_id14_route_main_texts[] = {
+	"Main Mix", "Cue Mix", "DAW Thru (full scale)", "Other",
+};
+static const char *const snd_audient_id14_route_hp_texts[] = {
+	"Main Mix", "Cue Mix", "DAW Thru", "Other",
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
+ * through the HID interface. The last item of a write-only enum shows a
+ * value that is not known.
+ */
+static const char *const snd_audient_id14_id_key_texts[] = {
+	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback",
+	"Unknown",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_id_key, snd_audient_id14_id_key_texts,
+		 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
+		 ID14_MON_TALKBACK);
+
+/* Talkback source: the routing source number of the input; none = 0xff */
+static const char *const snd_audient_id14_talkback_texts[] = {
+	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4",
+	"Digi 5", "Digi 6", "Digi 7", "Digi 8", "Unknown",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_talkback, snd_audient_id14_talkback_texts,
+		 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
+
+static const char *const snd_audient_id14_optical_texts[] = {
+	"ADAT", "S/PDIF", "Unknown",
+};
+SND_AUDIENT_ENUM(snd_audient_id14_optical, snd_audient_id14_optical_texts,
+		 0, 1);
+
+/*
+ * Write-only: GET stalls or does not report writes. Show the last value
+ * written, write the init value at probe, and send every put.
+ */
+#define ID14_WO	(SND_AUDIENT_CTYPE_FLAGS_CACHE		\
+		 | SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	\
+		 | SND_AUDIENT_CTYPE_FLAGS_INIT_HW)
+
+#define ID14_BOOL(unit_, sel_)				\
+	{						\
+		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,	\
+		.len = 1,				\
+		.min.integer = 0,			\
+		.max.integer = 1,			\
+		.unit = (unit_),			\
+		.sel = (sel_),				\
+	}
+
+/* 1 = cut or mute: shown as a switch that is off */
+#define ID14_BOOL_INV(unit_, sel_)			\
+	{						\
+		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,	\
+		.len = 1,				\
+		.min.integer = 1,			\
+		.max.integer = 0,			\
+		.unit = (unit_),			\
+		.sel = (sel_),				\
+	}
+
+#define ID14_VOLUME(unit_, sel_)			\
+	{						\
+		.type = SNDRV_CTL_ELEM_TYPE_INTEGER,	\
+		.flags = SND_AUDIENT_CTYPE_FLAGS_SIGNED,	\
+		.len = 2,				\
+		.min.integer = -128 * 256,		\
+		.max.integer = 0,			\
+		.res = 256,				\
+		.tlv = snd_audient_tlv_id14_vol,	\
+		.unit = (unit_),			\
+		.sel = (sel_),				\
+	}
+
+#define ID14_ENUM(unit_, sel_, len_, enum_)		\
+	{						\
+		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,	\
+		.len = (len_),				\
+		.enumeration = &(enum_),		\
+		.unit = (unit_),			\
+		.sel = (sel_),				\
+	}
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
@@ -124,6 +293,88 @@ static const struct snd_audient_ctrl_type {
 		.sel = 0x01,
 		.tlv = snd_audient_tlv_mixer,
 	},
+	[SND_AUDIENT_TYPE_ID14_MON_VOLUME] =
+		ID14_VOLUME(ID14_MON, ID14_MON_VOLUME),
+	[SND_AUDIENT_TYPE_ID14_MON_CUT] =
+		ID14_BOOL_INV(ID14_MON, ID14_MON_CUT),
+	[SND_AUDIENT_TYPE_ID14_MON_DIM] =
+		ID14_BOOL(ID14_MON, ID14_MON_DIM),
+	[SND_AUDIENT_TYPE_ID14_MON_DIM_LEVEL] =
+		ID14_VOLUME(ID14_MON, ID14_MON_DIM_LEVEL),
+	[SND_AUDIENT_TYPE_ID14_MON_MONO] =
+		ID14_BOOL(ID14_MON, ID14_MON_MONO),
+	[SND_AUDIENT_TYPE_ID14_MON_MONO_MODE] =
+		ID14_ENUM(ID14_MON, ID14_MON_MONO_MODE, 1,
+			  snd_audient_id14_mono_mode),
+	[SND_AUDIENT_TYPE_ID14_MON_POLARITY] =
+		ID14_BOOL(ID14_MON, ID14_MON_POLARITY),
+	[SND_AUDIENT_TYPE_ID14_MON_TALKBACK] =
+		ID14_BOOL(ID14_MON, ID14_MON_TALKBACK),
+	[SND_AUDIENT_TYPE_ID14_HP_VOLUME] =
+		ID14_VOLUME(ID14_FU_OUT, UAC_FU_VOLUME),
+	[SND_AUDIENT_TYPE_ID14_HP_MUTE] =
+		ID14_BOOL_INV(ID14_FU_OUT, UAC_FU_MUTE),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_MAIN_L] =
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_main_l),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_MAIN_R] =
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_main_r),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_HP_L] =
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_hp_l),
+	[SND_AUDIENT_TYPE_ID14_ROUTE_HP_R] =
+		ID14_ENUM(ID14_ROUTE, ID14_ROUTE_SOURCE, 1,
+			  snd_audient_id14_route_hp_r),
+	/* the documented boost is a fixed +10 dB */
+	[SND_AUDIENT_TYPE_ID14_IN_BOOST] = {
+		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.flags = ID14_WO,
+		.len = 2,
+		.min.integer = 0,
+		.max.integer = 10 * 256,
+		.init = 0,
+		.unit = ID14_FU_IN,
+		.sel = ID14_IN_BOOST,
+	},
+	[SND_AUDIENT_TYPE_ID14_IN_POLARITY] = {
+		.type = SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.flags = ID14_WO,
+		.len = 1,
+		.min.integer = 0,
+		.max.integer = 1,
+		.init = 0,
+		.unit = ID14_FU_IN,
+		.sel = ID14_IN_POLARITY,
+	},
+	[SND_AUDIENT_TYPE_ID14_MON_ID_KEY] = {
+		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,
+		.flags = ID14_WO,
+		.len = 2,
+		.init = 0xffff,		/* ScrollControl */
+		.enumeration = &snd_audient_id14_id_key,
+		.unit = ID14_MON,
+		.sel = ID14_MON_ID_KEY,
+	},
+	[SND_AUDIENT_TYPE_ID14_MON_TALKBACK_SRC] = {
+		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,
+		.flags = ID14_WO,
+		.len = 1,
+		.init = 0xff,		/* None */
+		.enumeration = &snd_audient_id14_talkback,
+		.unit = ID14_MON,
+		.sel = ID14_MON_TALKBACK_SRC,
+	},
+	/* the power-on mode is S/PDIF */
+	[SND_AUDIENT_TYPE_ID14_OPTICAL_MODE] = {
+		.type = SNDRV_CTL_ELEM_TYPE_ENUMERATED,
+		.flags = ID14_WO,
+		.len = 4,
+		.init = 1,		/* S/PDIF */
+		.enumeration = &snd_audient_id14_optical,
+		.unit = ID14_IT_DIGITAL,
+		.sel = ID14_IT_OPTICAL_MODE,
+	},
 };
 
 
@@ -184,6 +435,62 @@ static const char *const snd_audient_evo4_matrix[] = {
 	NULL
 };
 
+#define ID14_CTRL(name_, type_, offs_, chans_)		\
+	{						\
+		.name = (name_),			\
+		.type = SND_AUDIENT_TYPE_ID14_##type_,	\
+		.channels = (chans_),			\
+		.hwchannels = (chans_),			\
+		.val_offs = (offs_),			\
+	}
+
+static const struct snd_audient_ctrl snd_audient_id14_mk1_controls[] = {
+	ID14_CTRL("Monitor Speaker Playback Volume", MON_VOLUME, 0, 1),
+	ID14_CTRL("Monitor Speaker Playback Switch", MON_CUT, 0, 1),
+	ID14_CTRL("Monitor Dim Playback Switch", MON_DIM, 0, 1),
+	ID14_CTRL("Monitor Dim Level Playback Volume", MON_DIM_LEVEL, 0, 1),
+	ID14_CTRL("Monitor Mono Playback Switch", MON_MONO, 0, 1),
+	ID14_CTRL("Monitor Mono Mode Playback Enum", MON_MONO_MODE, 0, 1),
+	ID14_CTRL("Monitor Polarity Invert Playback Switch", MON_POLARITY, 0, 1),
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
+ * iD14 MkI mixer: unit 60, 14 inputs x 4 outputs, CN = input * 4 + output
+ * (outputs Main L, Main R, Cue L, Cue R). Each input has a Main and a Cue
+ * pair, so with 2 channels per element, element n starts at CN 2 * n.
+ */
+#define ID14_MIX(in) "Mix Main " in " Playback Volume",	\
+		     "Mix Cue " in " Playback Volume"
+
+static const char *const snd_audient_id14_mk1_matrix[] = {
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
@@ -196,6 +503,12 @@ static const struct audient_devinfo {
 		.matrix_names = snd_audient_evo4_matrix,
 		.matrix_channels = 2,
 	},
+	{
+		.usb_id = USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID),
+		.controls = snd_audient_id14_mk1_controls,
+		.matrix_names = snd_audient_id14_mk1_matrix,
+		.matrix_channels = 2,
+	},
 	{ 0 } /* sentinel */
 };
 
diff --git a/sound/usb/mixer_audient.h b/sound/usb/mixer_audient.h
index db4f31e02b5e..5d705ffe2cfa 100644
--- a/sound/usb/mixer_audient.h
+++ b/sound/usb/mixer_audient.h
@@ -6,6 +6,7 @@
 
 #define USB_AUDIENT_VID (0x2708)
 #define USB_EVO4_PID (0x0006)
+#define USB_ID14_MK1_PID (0x0002)
 
 int snd_audient_controls_create(struct usb_mixer_interface *mixer);
 
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 7795a5fbe382..30673bbbf762 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -528,7 +528,9 @@ static const struct usbmix_name_map audient_id14_map[] = {
 
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] = {
+	{ 11, NULL },			/* FU, see mixer_audient.c */
 	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{ 60, NULL },			/* MU, see mixer_audient.c */
 	{}
 };
 
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index af53c5c20e65..41d559d639d2 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4543,6 +4543,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
 		err = snd_audient_controls_create(mixer);
 		break;
+	case USB_ID(USB_AUDIENT_VID, USB_ID14_MK1_PID): /* Audient iD14 MkI */
+		err = snd_audient_controls_create(mixer);
+		break;
 
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
 		err = snd_soundblaster_e1_switch_create(mixer);
-- 
2.47.3

