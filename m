Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450941;
	b=rYBGjT/EJqD8b5u6BJSzHRe6znyY/x00pd3WkCjNQTg9JakcB7Pgj1WtT4ihK2giNhI4
	 ObV3ilbkmno8aKuWseuAbNGhq7vZWE9oef2T66hPr1Sc9/+ycTT1mYr7bZpjrr6pQZluK
	 s0lOtekqn2ZwKZZdP6WyG179PMB6UpGvukflDnhOnfP+sDjmLbpNCvSyOwvR0l5x4koOt
	 0T4UKYjjKv6dauET3aqvGpFWYaAVTIE6RIeDazOOJgC6gNsf+YscASeu1Ta8J65oTZnix
	 hVY7EUQ0yfYC2Sfh4fWKKUlzZyICU9XMT4A2j7NT2rY1FWJFXxmP4Hf9M1Z3N7yJ7Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+wB+opXLZBnzXpHBZAbJVPm4+IVuh89t5flsJUrwfNA=;
	b=B8vbv9ldwit7kJ8mJomzkWHy3TuW5Iv2eXHg7mX4UAcpB1ubtYNYAHhN+zzgZ2+cJQk1
	 g8jFivFDvn8bJdFuHfcdF42v6NkuxToj0UhldS63SEagXonHhCibN70U67Qq25G3H/yjI
	 +bT+vHl/RJlZKdPpmrFriCXpAYD2oQpKWrQuXwZIFpGlok6bt4mLlyzEc91FJmtvmvZ5V
	 fXmdMK4W+0dI+bEvjk2CxbhTMXMxnFLmbCAjAd92IyiYLCB/qRv8O+b1XFRV/3stk4EYT
	 gfuUH2XK+7uIy9jU1CKJ7BkEcBuDUTteGYfd7+GQKsE/5BvNgYlUagpWin2JVKBhPyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qV3hb8Px;
	arc=none smtp.remote-ip=209.85.160.42
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF20606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:02:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAF20606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qV3hb8Px
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-490d838b425so1582407fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450940; x=1793055740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+wB+opXLZBnzXpHBZAbJVPm4+IVuh89t5flsJUrwfNA=;
        b=qV3hb8PxA3KhrbtkJWdJ0Zuxk/4T517Q0l3sgDd8BbjOa04lkUFcfdzmHJsPVy2qf8
         5HKucjb/0i4nNkvTXv2q7N1TnV+SrGOTXWnSxWqcChfFXwOcD4hvCswSEEPDk0Bv5y3R
         wI5fbjRrLsKQ8UH72Mg7/zyCCMQDDlFsXQBocSUppu5ps7nr/ZvRQAfBzybOmQV0mX8F
         oYPbLdDfpI3MKgsJi1UEf7cFGdnWaEhcPHJ9qRy4xLX3rwy9gYkj6tfBFIF8I5f1+z0+
         AkhJDRH/zKOaMXOjJ4EwYHiaGa9EH8iB+UlZkAmOLrDl9mJ/F2YEMDoPNli/V/ZrXMNs
         SWbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450940; x=1793055740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+wB+opXLZBnzXpHBZAbJVPm4+IVuh89t5flsJUrwfNA=;
        b=mO+Scs0PwYUXnzyK8ixs/UYAU4OnmPrskV9FACVlCkVdXER/IxFGgEk/HHZhL6l+cQ
         iQF422poZyPRIW/64HdrM49eHyp72GlkykF4fSgMQXjCW7c8MBpgsUkpf1XXcUzZTqcl
         +Z+SY7QxehwVr2E+D9za1NvvHVGvbVbXW6YkNTEu4J71fihSD+4OWDJoKnsBUdmlYlfT
         KxpiHaJIOIuH5smngUMH6t9Ej2wBRpn04mbq6zCEny1ldP9SWP4h0EVxsAi8GlYTGZBA
         y/pOU5HtYkhg7lY/wnubUtzrwHHfmBCQiW0ne9BA64Oj01EnbDPdJukDhHQH4cH79Lwq
         Twtw==
X-Forwarded-Encrypted: i=1; AKwUvBwRkPYBwncxmKuJEqsaUMs6I+hFG1gtOwMznHBQm3tIOZ5jTHd1laYcg/h8xm7GeYWyDswS3ZS2wQnBL3s=@vger.kernel.org
X-Gm-Message-State: AFq9FYIw5NLZw3mJXR22Gz61apE7ShN865FyZGYck1FuH0Tfh496nqj8
	EWjODoOUA/zXeOCSu4JMMgiZ3vhjby81exF1elUmkUajg0bWARzMR+KY
X-Gm-Gg: AYBFou0U0fW0Xsg50kpE9gyb8Q+BGjXsD1QbanITS2sNLi+oDIoB3V0IYRoVauhGf4I
	nzktDIOZ1MXv9PvhHKvCcUAVn1qrspl2hiGyUAfgopTRFv6oXEcngu6fZrOs7OiDwbM/M+A4KYE
	eYUh1ZBSJUJTohuoXLxoqLFdr5T1cq5jqD/rHs1fTt/gdKU7EAxVQRpGxED/fAO0BeeecpU1/wS
	JulAYYgpLMN81L8VQ2e8UoJu6W5DGB4m/btszB2NFJXKQ/UqLEWyCbdl7F+lxGir3atBYceTAok
	RER1fLT6ifyE/tcLBocRLjwhfcux9G+gHaPFARVGiBkfqNCy1BynvSv8GrveT+yf8CyiiVewBJh
	Ro26y/J0golo8n0YLYvjZ5Z8rYYe/WicjoxWdJgVoBOhoBkpctBvGzEPjohwzFp/vxmXK8FKTs2
	wTb2JgWqV4P9IItFJ3r+I95qPQM+jfXomr51OBCIStQISy5V4HX6oewXIAGU1/uA0yESJG5X0OP
	1l+XTzOUx4JOi0=
X-Received: by 2002:a05:6871:8902:b0:494:396:1205 with SMTP id 586e51a60fabf-4a7578d8fb6mr8477024fac.14.1792450939595;
        Mon, 19 Oct 2026 16:02:19 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:17 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 2/5] ALSA: usb-audio: Add Audient iD14 MkI monitor and routing controls
Date: Mon, 19 Oct 2026 18:01:56 -0500
Message-ID: <20261019230159.834954-3-mrwillporter@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261019230159.834954-1-mrwillporter@gmail.com>
References: <20261019230159.834954-1-mrwillporter@gmail.com>
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

The iD14 MkI keeps three groups of controls where the generic driver
cannot discover them:
- the monitor controller, on Audient extension unit 54
- the headphone level, on feature unit 10, whose descriptor declares
  no controls
- the output routing, on extension unit 51

So Linux users cannot change the routing. The MkI powers up with every
output on DAW Thru: the USB stream goes straight to the output and
bypasses the volume knob.

Add mixer_audient_id.c with these controls:

- Monitor Speaker Playback Volume and Switch (speaker level and cut)
- Monitor Dim Playback Switch, Monitor Dim Level Playback Volume
- Monitor Mono Playback Switch, Monitor Mono Mode Playback Enum
- Monitor Polarity Invert Playback Switch
- Monitor Headphone Playback Volume and Switch (FU 10, channels 3-4)
- Talkback Playback Switch
- Main Out L/R Source Playback Enum, Headphone L/R Source Playback Enum:
  "Main Mix", "Cue Mix" or "DAW Thru (full scale)"

Every get reads the device, because the volume knob changes the speaker
and headphone levels. The volumes are 0-128 in 1 dB steps: 0 is -128 dB
(mute) and 128 is 0 dB. The driver converts them to the device's s16 in
1/256 dB.

The routing controls are mono enums, as in mixer_scarlett2.c. Thus one
output on DAW Thru cannot hide behind its pair. The "... Playback Enum"
names follow the same driver. A source outside the list reads as an
extra item, "Other". A put rejects "Other", but alsactl store saves it.
A restore of it then fails for that control only, or for the card with
--pedantic. The restore cannot recreate the original source. So after a
replug on bus power, that output stays on its power-on source, DAW Thru.

The file is named for the iD family and keeps model data in per-model
tables, as mixer_scarlett2.c does. Only the iD14 MkI is supported. Other
iD models keep the generic driver.

The driver writes nothing at probe. User space sets the launch state of
Audient's iD application (all outputs on Main Mix).

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  and the complete driver (this commit and the later ones)

Results:
- routing: listening tests (Main Mix and Cue Mix, left and right) and
  read-back
- dim, by ear: host switch and iD key
- talkback, by ear (a later commit adds the talkback source control)
- alsactl store and restore across a replug
- an out-of-list routing byte (0x13) reads as "Other"

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/Makefile           |   1 +
 sound/usb/mixer_audient_id.c | 407 +++++++++++++++++++++++++++++++++++
 sound/usb/mixer_audient_id.h |   7 +
 sound/usb/mixer_quirks.c     |   4 +
 4 files changed, 419 insertions(+)
 create mode 100644 sound/usb/mixer_audient_id.c
 create mode 100644 sound/usb/mixer_audient_id.h

diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 2e842dcc7..7e4e6553d 100644
--- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -11,6 +11,7 @@ snd-usb-audio-y := 	card.o \
 			helper.o \
 			implicit.o \
 			mixer.o \
+			mixer_audient_id.o \
 			mixer_evo.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
diff --git a/sound/usb/mixer_audient_id.c b/sound/usb/mixer_audient_id.c
new file mode 100644
index 000000000..b4d1e1697
--- /dev/null
+++ b/sound/usb/mixer_audient_id.c
@@ -0,0 +1,407 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Audient iD mixer controls
+ *
+ * Supported models:
+ * - iD14 MkI (2708:0002)
+ *
+ * Other Audient iD models keep the generic driver. Their units may differ,
+ * and this code does not cover them. As in mixer_scarlett2.c, a later
+ * model can add its own control tables to this file. Unit IDs, tables and
+ * functions named id14_* are for the iD14 MkI only. The id_* helpers take
+ * a table.
+ *
+ * The iD14 MkI (2708:0002) has its monitor controller, output routing,
+ * headphone level, input options and a 14 x 4 mixer on Audient extension
+ * units and on feature units whose descriptors declare no controls. The
+ * generic driver cannot discover these. This file adds them.
+ *
+ * The protocol comes from Audient's iD application (version 4.4.5 for
+ * macOS). USB captures of the application confirmed it.
+ *
+ * The controls read the device on every get: the front panel changes
+ * several of them.
+ *
+ * Get and put need no lock of their own: the control core runs put with
+ * card->controls_rwsem held for writing and get with it held for reading.
+ */
+
+#include <linux/slab.h>
+#include <linux/unaligned.h>
+#include <linux/usb.h>
+#include <linux/usb/audio.h>
+#include <linux/usb/audio-v2.h>
+#include <sound/control.h>
+#include <sound/tlv.h>
+
+#include "usbaudio.h"
+#include "mixer.h"
+#include "helper.h"
+#include "mixer_audient_id.h"
+
+/* Unit IDs */
+#define ID14_FU_OUT		0x0a	/* feature unit before the outputs */
+#define ID14_ROUTE		0x33	/* routing XU: CN = destination */
+#define ID14_MON		0x36	/* monitor controller XU */
+
+/* Control selectors */
+#define ID14_ROUTE_SOURCE	0x06	/* u8: source of the destination */
+#define ID14_MON_MONO		0x00
+#define ID14_MON_MONO_MODE	0x01
+#define ID14_MON_POLARITY	0x03
+#define ID14_MON_CUT		0x04
+#define ID14_MON_DIM		0x05
+#define ID14_MON_DIM_LEVEL	0x06	/* s16, 1/256 dB */
+#define ID14_MON_TALKBACK	0x07
+#define ID14_MON_VOLUME		0x12	/* s16, 1/256 dB; the knob also sets it */
+
+/*
+ * Volumes are the device's s16 in 1/256 dB; the knob and the iD application
+ * use 1 dB steps. The controls show the steps: 0 (-128 dB, mute) ... 128 (0 dB).
+ */
+#define ID_DB(db)		((db) * 256)
+#define ID_VOL_MAX		128		/* control value for 0 dB */
+
+enum id_kind {
+	ID_BOOL,	/* u8: 1 = on */
+	ID_BOOL_INV,	/* u8: 1 = cut or mute, shown as a switch that is off */
+	ID_VOL,		/* s16 in 1/256 dB; control value 0 ... ID_VOL_MAX, 1 dB steps */
+	ID_ENUM,	/* item list with device values (struct id_enum) */
+};
+
+struct id_enum {
+	const char *const *texts;
+	const u32 *values;
+	unsigned int items;
+	u8 len;		/* bytes on the wire */
+};
+
+struct id_ctl {
+	const char *name;
+	enum id_kind kind;
+	u8 unit;
+	u8 cs;
+	u8 cn;		/* first channel number */
+	u8 channels;
+	const struct id_enum *e;
+};
+
+/*
+ * The texts have one item more than the values. A put cannot select the last
+ * item, "Other": it shows a device value outside the list.
+ */
+#define ID_ENUM_TEXTS(name, texts_, len_, ...)					\
+	static const u32 name##_values[] = { __VA_ARGS__ };			\
+	static const struct id_enum name = {					\
+		.texts = texts_, .values = name##_values,			\
+		.items = ARRAY_SIZE(name##_values), .len = len_,		\
+	}
+#define ID_ENUM_DEF(name, len_, ...)						\
+	ID_ENUM_TEXTS(name, name##_texts, len_, __VA_ARGS__);			\
+	static_assert(ARRAY_SIZE(name##_texts) == ARRAY_SIZE(name##_values) + 1)
+
+/* Mono mode: one-speaker sum (Left, Right) or phantom centre. */
+static const char *const id14_mono_mode_texts[] = { "Left", "Centre", "Right", "Other" };
+
+ID_ENUM_DEF(id14_mono_mode, 1, 1, 0, 2);
+
+/*
+ * Routing sources for each destination. DAW Thru plays the USB stream
+ * directly and bypasses the volume knob: full scale. Main Mix is 0x14/0x15
+ * on the main outputs and 0x18/0x19 on the headphones.
+ */
+static const char *const id14_route_texts[] = {
+	"Main Mix", "Cue Mix", "DAW Thru (full scale)", "Other",
+};
+
+ID_ENUM_TEXTS(id14_route_ml, id14_route_texts, 1, 0x14, 0x10, 0x00);
+ID_ENUM_TEXTS(id14_route_mr, id14_route_texts, 1, 0x15, 0x11, 0x01);
+ID_ENUM_TEXTS(id14_route_hl, id14_route_texts, 1, 0x18, 0x10, 0x02);
+ID_ENUM_TEXTS(id14_route_hr, id14_route_texts, 1, 0x19, 0x11, 0x03);
+static_assert(ARRAY_SIZE(id14_route_texts) == ARRAY_SIZE(id14_route_ml_values) + 1);
+
+static const struct id_ctl id14_mk1_ctls[] = {
+	{ .name = "Monitor Speaker Playback Volume", .kind = ID_VOL, .unit = ID14_MON,
+	  .cs = ID14_MON_VOLUME, .channels = 1 },
+	{ .name = "Monitor Speaker Playback Switch", .kind = ID_BOOL_INV, .unit = ID14_MON,
+	  .cs = ID14_MON_CUT, .channels = 1 },
+	{ .name = "Monitor Dim Playback Switch", .kind = ID_BOOL, .unit = ID14_MON,
+	  .cs = ID14_MON_DIM, .channels = 1 },
+	{ .name = "Monitor Dim Level Playback Volume", .kind = ID_VOL, .unit = ID14_MON,
+	  .cs = ID14_MON_DIM_LEVEL, .channels = 1 },
+	{ .name = "Monitor Mono Playback Switch", .kind = ID_BOOL, .unit = ID14_MON,
+	  .cs = ID14_MON_MONO, .channels = 1 },
+	{ .name = "Monitor Mono Mode Playback Enum", .kind = ID_ENUM, .unit = ID14_MON,
+	  .cs = ID14_MON_MONO_MODE, .channels = 1, .e = &id14_mono_mode },
+	{ .name = "Monitor Polarity Invert Playback Switch", .kind = ID_BOOL, .unit = ID14_MON,
+	  .cs = ID14_MON_POLARITY, .channels = 1 },
+	/* The descriptor declares no controls on FU 10; the headphones are CN 3-4. */
+	{ .name = "Monitor Headphone Playback Volume", .kind = ID_VOL, .unit = ID14_FU_OUT,
+	  .cs = UAC_FU_VOLUME, .cn = 3, .channels = 2 },
+	{ .name = "Monitor Headphone Playback Switch", .kind = ID_BOOL_INV, .unit = ID14_FU_OUT,
+	  .cs = UAC_FU_MUTE, .cn = 3, .channels = 2 },
+	{ .name = "Talkback Playback Switch", .kind = ID_BOOL, .unit = ID14_MON,
+	  .cs = ID14_MON_TALKBACK, .channels = 1 },
+	{ .name = "Main Out L Source Playback Enum", .kind = ID_ENUM, .unit = ID14_ROUTE,
+	  .cs = ID14_ROUTE_SOURCE, .cn = 0, .channels = 1, .e = &id14_route_ml },
+	{ .name = "Main Out R Source Playback Enum", .kind = ID_ENUM, .unit = ID14_ROUTE,
+	  .cs = ID14_ROUTE_SOURCE, .cn = 1, .channels = 1, .e = &id14_route_mr },
+	{ .name = "Headphone L Source Playback Enum", .kind = ID_ENUM, .unit = ID14_ROUTE,
+	  .cs = ID14_ROUTE_SOURCE, .cn = 2, .channels = 1, .e = &id14_route_hl },
+	{ .name = "Headphone R Source Playback Enum", .kind = ID_ENUM, .unit = ID14_ROUTE,
+	  .cs = ID14_ROUTE_SOURCE, .cn = 3, .channels = 1, .e = &id14_route_hr },
+	{ }
+};
+
+/* Per-control state; the usb_mixer_elem_list must come first (snd_usb_mixer_elem_free). */
+struct id_elem {
+	struct usb_mixer_elem_list list;
+	const struct id_ctl *ctl;
+};
+
+/* 0 = -128 dB (mute), 1 dB per step: ID_VOL_MAX = 0 dB. */
+static const DECLARE_TLV_DB_SCALE(id_vol_tlv, -12800, 100, 1);
+
+static int id_xfer(struct usb_mixer_interface *mixer, bool set,
+		   u8 unit, u8 cs, u8 cn, void *buf, int len)
+{
+	struct snd_usb_audio *chip = mixer->chip;
+	struct usb_device *dev = chip->dev;
+	int err;
+
+	CLASS(snd_usb_lock, pm)(chip);
+	if (pm.err < 0)
+		return pm.err;
+	err = snd_usb_ctl_msg(dev,
+			      set ? usb_sndctrlpipe(dev, 0) : usb_rcvctrlpipe(dev, 0),
+			      UAC2_CS_CUR,
+			      USB_TYPE_CLASS | USB_RECIP_INTERFACE |
+			      (set ? USB_DIR_OUT : USB_DIR_IN),
+			      cs << 8 | cn, unit << 8 | mixer->hostif->desc.bInterfaceNumber,
+			      buf, len);
+	if (err < 0)
+		return err;
+	return err == len ? 0 : -EIO;	/* a short transfer is not a value */
+}
+
+static int id_len(const struct id_ctl *c)
+{
+	switch (c->kind) {
+	case ID_ENUM:
+		return c->e->len;
+	case ID_VOL:
+		return 2;
+	default:
+		return 1;
+	}
+}
+
+static bool id_valid(const struct id_ctl *c, long val)
+{
+	switch (c->kind) {
+	case ID_BOOL:
+	case ID_BOOL_INV:
+		return val == 0 || val == 1;
+	case ID_VOL:
+		return val >= 0 && val <= ID_VOL_MAX;
+	case ID_ENUM:
+		return val >= 0 && val < c->e->items;	/* never "Other" */
+	}
+	return false;
+}
+
+/* Read channel i. An item outside the list reads as the extra last item. */
+static int id_read(struct usb_mixer_interface *mixer, const struct id_ctl *c,
+		   unsigned int i, long *val)
+{
+	u8 buf[4] = { 0 };
+	unsigned int item;
+	s16 raw;
+	u32 dev;
+	int err;
+
+	err = id_xfer(mixer, false, c->unit, c->cs, c->cn + i, buf, id_len(c));
+	if (err < 0)
+		return err;
+	raw = get_unaligned_le16(buf);
+
+	switch (c->kind) {
+	case ID_BOOL:
+		*val = !!buf[0];
+		break;
+	case ID_BOOL_INV:
+		*val = !buf[0];
+		break;
+	case ID_VOL:
+		/* the knob moves in whole dB; round anything else to the nearest step */
+		*val = clamp_t(long, DIV_ROUND_CLOSEST(raw, ID_DB(1)) + ID_VOL_MAX,
+			       0, ID_VOL_MAX);
+		break;
+	case ID_ENUM:
+		dev = get_unaligned_le32(buf);
+		for (item = 0; item < c->e->items; item++)
+			if (c->e->values[item] == dev)
+				break;
+		*val = item;	/* c->e->items: "Other" */
+		break;
+	}
+	return 0;
+}
+
+static int id_write(struct usb_mixer_interface *mixer, const struct id_ctl *c,
+		    unsigned int i, long val)
+{
+	u8 buf[4] = { 0 };
+
+	switch (c->kind) {
+	case ID_BOOL:
+		buf[0] = val;
+		break;
+	case ID_BOOL_INV:
+		buf[0] = !val;
+		break;
+	case ID_VOL:
+		put_unaligned_le16(ID_DB(val - ID_VOL_MAX), buf);
+		break;
+	case ID_ENUM:
+		put_unaligned_le32(c->e->values[val], buf);
+		break;
+	}
+	return id_xfer(mixer, true, c->unit, c->cs, c->cn + i, buf, id_len(c));
+}
+
+static int id_info(struct snd_kcontrol *kctl, struct snd_ctl_elem_info *uinfo)
+{
+	struct id_elem *e = snd_kcontrol_chip(kctl);
+	const struct id_ctl *c = e->ctl;
+
+	switch (c->kind) {
+	case ID_ENUM:
+		return snd_ctl_enum_info(uinfo, c->channels, c->e->items + 1, c->e->texts);
+	case ID_VOL:
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
+		uinfo->value.integer.min = 0;
+		uinfo->value.integer.max = ID_VOL_MAX;
+		break;
+	default:
+		uinfo->type = SNDRV_CTL_ELEM_TYPE_BOOLEAN;
+		uinfo->value.integer.min = 0;
+		uinfo->value.integer.max = 1;
+		break;
+	}
+	uinfo->count = c->channels;
+	return 0;
+}
+
+static void id_set_value(const struct id_ctl *c, struct snd_ctl_elem_value *v,
+			 unsigned int i, long val)
+{
+	if (c->kind == ID_ENUM)
+		v->value.enumerated.item[i] = val;
+	else
+		v->value.integer.value[i] = val;
+}
+
+static long id_get_value(const struct id_ctl *c, const struct snd_ctl_elem_value *v,
+			 unsigned int i)
+{
+	return c->kind == ID_ENUM ? v->value.enumerated.item[i] : v->value.integer.value[i];
+}
+
+static int id_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
+{
+	struct id_elem *e = snd_kcontrol_chip(kctl);
+	const struct id_ctl *c = e->ctl;
+	unsigned int i;
+	long val;
+	int err;
+
+	for (i = 0; i < c->channels; i++) {
+		err = id_read(e->list.mixer, c, i, &val);
+		if (err < 0)
+			return err;
+		id_set_value(c, v, i, val);
+	}
+	return 0;
+}
+
+static int id_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
+{
+	struct id_elem *e = snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer = e->list.mixer;
+	const struct id_ctl *c = e->ctl;
+	unsigned int i;
+	long cur, val;
+	int err, changed = 0;
+
+	for (i = 0; i < c->channels; i++)
+		if (!id_valid(c, id_get_value(c, v, i)))
+			return -EINVAL;
+
+	CLASS(snd_usb_lock, pm)(mixer->chip);
+	if (pm.err < 0)
+		return pm.err;
+
+	for (i = 0; i < c->channels; i++) {
+		val = id_get_value(c, v, i);
+		err = id_read(mixer, c, i, &cur);
+		if (err < 0)
+			return err;
+		if (cur == val)
+			continue;
+		changed = 1;
+		err = id_write(mixer, c, i, val);
+		if (err < 0)
+			return err;
+	}
+	return changed;
+}
+
+static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
+{
+	struct snd_kcontrol_new knew = {
+		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
+		.name = c->name,
+		/* The front panel changes values: user space must not cache them. */
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.info = id_info,
+		.get = id_get,
+		.put = id_put,
+	};
+	struct snd_kcontrol *kctl;
+	struct id_elem *e;
+
+	if (c->kind == ID_VOL) {
+		knew.access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
+		knew.tlv.p = id_vol_tlv;
+	}
+
+	e = kzalloc_obj(*e);
+	if (!e)
+		return -ENOMEM;
+	e->list.mixer = mixer;
+	e->list.id = c->unit;
+	e->ctl = c;
+
+	kctl = snd_ctl_new1(&knew, e);
+	if (!kctl) {
+		kfree(e);
+		return -ENOMEM;
+	}
+	kctl->private_free = snd_usb_mixer_elem_free;
+	return snd_usb_mixer_add_list(&e->list, kctl, false, true);
+}
+
+/* called from mixer_quirks.c */
+int snd_audient_id14_mk1_controls_create(struct usb_mixer_interface *mixer)
+{
+	const struct id_ctl *c;
+	int err;
+
+	for (c = id14_mk1_ctls; c->name; c++) {
+		err = id_add_ctl(mixer, c);
+		if (err < 0)
+			return err;
+	}
+	return 0;
+}
diff --git a/sound/usb/mixer_audient_id.h b/sound/usb/mixer_audient_id.h
new file mode 100644
index 000000000..c456353ed
--- /dev/null
+++ b/sound/usb/mixer_audient_id.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __USB_MIXER_AUDIENT_ID_H
+#define __USB_MIXER_AUDIENT_ID_H
+
+int snd_audient_id14_mk1_controls_create(struct usb_mixer_interface *mixer);
+
+#endif /* __USB_MIXER_AUDIENT_ID_H */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 01210cc3f..478e6152c 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -34,6 +34,7 @@
 #include "usbaudio.h"
 #include "mixer.h"
 #include "mixer_quirks.h"
+#include "mixer_audient_id.h"
 #include "mixer_scarlett.h"
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
@@ -4609,6 +4610,9 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixer_interface *mixer)
 	case USB_ID(0x03f0, 0x0269): /* HP TB Dock G2 */
 		err = hp_dock_mixer_create(mixer);
 		break;
+	case USB_ID(0x2708, 0x0002): /* Audient iD14 MkI */
+		err = snd_audient_id14_mk1_controls_create(mixer);
+		break;
 	}
 
 	return err;
-- 
2.47.3

