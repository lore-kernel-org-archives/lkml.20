Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792450945;
	b=RRRi5Gm4VujelIRx5hodfYQRJnF2lIA3nv0Z7YWaueR5PedvtGzmCb8NJPOiwHpA6VEa
	 s2Ypkx2lWcLuqMy8PVh16IHjD/dPewAPH3a+67dRA9P/nYpdWhood2Fjwp3kILmtQ8rWB
	 RCu11SNYrP77XqmYNxGI1NmFcOIPO6rZN/2gXUpDg0W7KKWAIdI+GktDCtHdcsvXltXJH
	 EmfGUhS/dx9fmTP/ymgMuxjqcGEphgxt75sC06bfvE/VOxnSCDH+ujMxU6Ay/y8nk1/FQ
	 VLgHNyfSqj26JVqwxtPpf36byDQHKmEPxuAVO1Ht8+JBHB4uWqJ09c4ZDHgWf/gCMmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792450945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YMfXJxODms2+O2PZQAEWJu9meH7NzdZRMPqpLmqisyQ=;
	b=qMkCpafxt6W0oGSRgX20EEey+xCf1SqRbwCogkb1ndiq0izSs3NaAy6neOTx+R7GYJDM
	 4ScDS+fMdnXeg2oBOJL9N683KaO960Tl1mW+J/s+rWPdcln3DlEqSoJwisEpJK1P4PevF
	 fj4NYOATQJOZajnR6nx7r41RCRhKwveNiAwYWk0hlW6XgyS0gcH2R9npUHzU6HnbgFG/o
	 6B0DZDb7a8tQtLjD8bGHvM6a/QMbOg7ARNgX6ei3P1nhEiWAA2heE2gIPuB29sDBvwtlz
	 6Sa+aunZNxBw2BGHzqBTDVpbHfpem6C/j/0nb9TkBpgxYRwJxZnq12SyuJWA4UrPNCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIlCv+6F;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A42606A324
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 23:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06A42606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HIlCv+6F
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4949f037131so1598280fac.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 16:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792450944; x=1793055744; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMfXJxODms2+O2PZQAEWJu9meH7NzdZRMPqpLmqisyQ=;
        b=HIlCv+6F6NY1gjaaD9dm0im+IGRDoL8KSo9nVlQnUKMrAFTOOBoyUvKaL4H4GE4Uwh
         tcxiP4EVJ5LFIafPVqC+njRiOoj6kdRGmA+F4y4q4LrSkQAi4Qry6IEE17VStBKlVzqx
         ucpwkGv847HuYwsrBklDZQsNiS0LRpICqBP+Q3RtpCHOsaMax1LyNvMrutojqs8VbmWr
         8QsI8aTsSd5c2hM0CTVNd4pEWg7fs+c+IVf/Klr9u7lRGzD4SKtcPJ3UfF5kg1nxAIwf
         9jSxwKY1E64O4fH9ul39v6gHq7/w/f7L+clHHkObyQkbl9qWmmz/8C3R65jmV4qxSsHQ
         idog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792450944; x=1793055744;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMfXJxODms2+O2PZQAEWJu9meH7NzdZRMPqpLmqisyQ=;
        b=aQ8w4i+41Lhz+pPcDotzE7b6NIeEnWGGcUCYsXGbqORHRPtdaBT/2p3QNCWgh4TQa/
         z6sGhS/PputlA22khsExoAYXSAcF3piNIniurMruIjmViHm8zKTKxW75lGi0tDhA8FfN
         7rXo228xObe/HaI/I6h43URQ/8GWNK5iI4S40y9fu3kup5bQNBSQGT0Fy0j9BFQTHe3c
         VroqGkf8FmxuleTAyF9m5yBSOepBjZbOjMh70JEg+IvZ93ddJl8WIDkOPvnq1n5TC/mR
         61n8UFsFDGvfJvObPWvPGyehCVTULMX437qLwQq1TRb+4TW/pUIoNOKVqwS+BQQop0Hn
         1q5Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQiNymMyvOceEZVPDnyyB3NMZ71XRGyf7vZst++sQyLw85RvZxpwioIGl1eWyUlVQ7PG6ZMYRnOxZeSn8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLzyayTiItqt0yDqgJ4T12cdaGVPpdYYdxJmA3k4m6CQmsdU9IG
	mdb79ztk5eXzjkQhdALccGK3PG0lgZRfxRvTT8iRH+TBPQkbdFw2pQWoUfdHWNZo
X-Gm-Gg: AYBFou3lk9+f/blgQDSOT3HnBGgLLAQNRtoOiie0FiUVDbtpYYJcu9P48opPfLRqalo
	QM43zUaqPFbxEusMSmCKOv94KqYvA0oIDJkB0KNWNEDycquFnZwsOqsqj1VYToZbrBrHe4gniz+
	stg+5hz2ye+UhO16U+XTyXu9XUMh70CYvIzxh3jdpKx5GWvK3IV67eLaeoot4g4ifJcm1ysAYPn
	ZG54wgcq417OxTYn8mqRpclt2nk1zS7/zArmKPqYEkACW8+bl6JxFdOjAR0z0HhrHzghz3oixtV
	UR5uru1oMXqllxk7ugEwxw42k6QPPrgC+sRFxGDbRD6CqoDU4ZPfhBU4ANclEiyq5/71ogX5mMz
	YR/OSD9FNupyEZdGMYt6v8aEaTGCpu68VRyR3USXzhGJZwGn/ZmF14SNVmrreJBUMGVeaiwxMxU
	eHTc5sYxVy0pFa5V5xH4KTvrazoBbft0MVf9AYhzWssom9rr/vRb/8ZMyoDqA3rvXZuG+YtliwJ
	meOBmml5CDhmStvdgpKVkK0oxzoqFMCao8rJrk7LmMYJu+WXFEPvp+42vU5IWfauIxsqYBU
X-Received: by 2002:a05:6870:d213:b0:485:d1ab:7933 with SMTP id 586e51a60fabf-4a7578ad126mr7356387fac.20.1792450943756;
        Mon, 19 Oct 2026 16:02:23 -0700 (PDT)
Received: from localhost.localdomain ([2600:1702:4ff0:baa0:5054:ff:fe3d:4ddb])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a73b6d7e0csm9327797fac.12.2026.10.19.16.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 16:02:23 -0700 (PDT)
From: Will Porter <mrwillporter@gmail.com>
To: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>
Subject: [PATCH 4/5] ALSA: usb-audio: Add Audient iD14 MkI write-only controls
Date: Mon, 19 Oct 2026 18:01:58 -0500
Message-ID: <20261019230159.834954-5-mrwillporter@gmail.com>
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

Some MkI controls cannot be read back:
- GET stalls for the input gain boost and polarity (feature unit 11),
  the iD key function and the digital input mode.
- GET of the talkback source answers 0, whatever value a SET wrote.

For FU 11 the generic driver creates "Input Gain Control" and "Phase
Inverter Control" and logs "cannot get min/max values".

Add:
- Mic 1/2 Boost Capture Switch (+10 dB)
- Mic 1/2 and Digi 1/2 Polarity Invert Capture Switch
- iD Key Function Playback Enum (ScrollControl, Mono, Mono + Polarity,
  Dim, Talkback)
- Talkback Source Capture Enum (None, Mic 1-2, Digi 1-8)
- Digital In Mode Capture Enum (ADAT, S/PDIF)

and hide the generic FU 11 controls in the MkI map. The named polarity
switches replace the ten values of "Phase Inverter Control". The
controls follow Audient's iD application. It offers gain boost on the
Mic inputs only, and polarity on the Mic and Digi inputs. The device
refuses polarity on Digi 3-8 with EPIPE, in ADAT and in S/PDIF mode
(no ADAT signal connected). So Digi 3-8 have no polarity control.

These controls show the last value the device accepted. Every put sends
its value, also an unchanged one, so that a restore reaches a device
that was reset. At probe the driver sets each control once, so that the
value it shows is true:
- boost and polarity off, iD key ScrollControl, talkback source None:
  the defaults of the iD application and the manual
- S/PDIF: the MkI's measured power-on mode

If that write fails, the control reads "Unknown" (or off) until a put
succeeds. alsactl store saves that value.

The probe write replaces any value the device kept. The device keeps
its values across a module reload or a rebind. On mains power it also
keeps them across a replug. In each of these cases the controls return
to the probe values (for example from ADAT to S/PDIF) until alsactl
restore runs.

Test setup:
- iD14 MkI, firmware 1.1.1
- Bazzite 44, kernel 7.2.9-ogc3.1.fc44
- snd-usb-audio built out of tree from the v7.2.9 sound/usb sources
  and the complete driver (this commit and the later ones)

Results:
- a loopback cable measured the gain boost (+10.0 dB) and the Mic
  polarity
- listening tests: the iD key set to Dim, talkback from Mic 2
- alsactl restored the controls across a replug
- the optical power-on mode, read on macOS 27.0.1 with no Audient
  software running: S/PDIF
- the device accepts the Digi 1/2 polarity request. Its effect was not
  measured.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Will Porter <mrwillporter@gmail.com>
---
 sound/usb/mixer_audient_id.c | 144 +++++++++++++++++++++++++++++++----
 sound/usb/mixer_maps.c       |   1 +
 2 files changed, 129 insertions(+), 16 deletions(-)

diff --git a/sound/usb/mixer_audient_id.c b/sound/usb/mixer_audient_id.c
index 5b38590ce..47e16e572 100644
--- a/sound/usb/mixer_audient_id.c
+++ b/sound/usb/mixer_audient_id.c
@@ -19,8 +19,10 @@
  * The protocol comes from Audient's iD application (version 4.4.5 for
  * macOS). USB captures of the application confirmed it.
  *
- * The controls read the device on every get: the front panel changes
- * several of them.
+ * Most controls read the device on every get. Controls whose GET cannot
+ * report the current state show the last value the device accepted.
+ * Every put to these controls sends the value, even when unchanged, so
+ * that alsactl restore also reaches a device that was reset.
  *
  * Get and put need no lock of their own: the control core runs put with
  * card->controls_rwsem held for writing and get with it held for reading.
@@ -40,12 +42,17 @@
 #include "mixer_audient_id.h"
 
 /* Unit IDs */
+#define ID14_IT_DIGITAL		0x01	/* input terminal: optical and coaxial inputs */
 #define ID14_FU_OUT		0x0a	/* feature unit before the outputs */
+#define ID14_FU_IN		0x0b	/* feature unit on the inputs: CN 1-2 Mic, 3-10 Digi */
 #define ID14_ROUTE		0x33	/* routing XU: CN = destination */
 #define ID14_MON		0x36	/* monitor controller XU */
 #define ID14_MIXER		0x3c	/* mixer unit: 14 inputs x 4 outputs */
 
 /* Control selectors */
+#define ID14_IT_OPTICAL_MODE	0x00	/* u32: 0 ADAT, 1 S/PDIF */
+#define ID14_IN_BOOST		0x0b	/* s16: 0x0a00 = +10 dB, 0 = off */
+#define ID14_IN_POLARITY	0x0d
 #define ID14_ROUTE_SOURCE	0x06	/* u8: source of the destination */
 #define ID14_MON_MONO		0x00
 #define ID14_MON_MONO_MODE	0x01
@@ -54,6 +61,8 @@
 #define ID14_MON_DIM		0x05
 #define ID14_MON_DIM_LEVEL	0x06	/* s16, 1/256 dB */
 #define ID14_MON_TALKBACK	0x07
+#define ID14_MON_TALKBACK_SRC	0x08	/* GET always returns 0 */
+#define ID14_MON_ID_KEY		0x10	/* u16: the selector the iD key toggles */
 #define ID14_MON_VOLUME		0x12	/* s16, 1/256 dB; the knob also sets it */
 
 /*
@@ -68,6 +77,7 @@ enum id_kind {
 	ID_BOOL,	/* u8: 1 = on */
 	ID_BOOL_INV,	/* u8: 1 = cut or mute, shown as a switch that is off */
 	ID_VOL,		/* s16 in 1/256 dB; control value 0 ... ID_VOL_MAX, 1 dB steps */
+	ID_BOOST,	/* s16: on = +10 dB */
 	ID_ENUM,	/* item list with device values (struct id_enum) */
 };
 
@@ -78,6 +88,8 @@ struct id_enum {
 	u8 len;		/* bytes on the wire */
 };
 
+#define ID_WO		BIT(0)	/* write-only: GET stalls or does not report writes */
+
 struct id_ctl {
 	const char *name;
 	enum id_kind kind;
@@ -85,12 +97,15 @@ struct id_ctl {
 	u8 cs;
 	u8 cn;		/* first channel number */
 	u8 channels;
+	u8 flags;
+	int init;	/* ID_WO: value written at probe */
 	const struct id_enum *e;
 };
 
 /*
  * The texts have one item more than the values. A put cannot select the last
- * item, "Other": it shows a device value outside the list.
+ * item: a readable control shows it for a device value outside the list
+ * ("Other"), a write-only control while its value is not known ("Unknown").
  */
 #define ID_ENUM_TEXTS(name, texts_, len_, ...)					\
 	static const u32 name##_values[] = { __VA_ARGS__ };			\
@@ -102,11 +117,35 @@ struct id_ctl {
 	ID_ENUM_TEXTS(name, name##_texts, len_, __VA_ARGS__);			\
 	static_assert(ARRAY_SIZE(name##_texts) == ARRAY_SIZE(name##_values) + 1)
 
+/*
+ * iD key function: the value is the monitor-controller selector the key
+ * toggles. ScrollControl (0xffff) toggles nothing: the knob then scrolls
+ * through the HID interface.
+ */
+static const char *const id14_id_key_texts[] = {
+	"ScrollControl", "Mono", "Mono + Polarity", "Dim", "Talkback", "Unknown",
+};
+
+ID_ENUM_DEF(id14_id_key, 2, 0xffff, ID14_MON_MONO, ID14_MON_POLARITY, ID14_MON_DIM,
+	    ID14_MON_TALKBACK);
+
 /* Mono mode: one-speaker sum (Left, Right) or phantom centre. */
 static const char *const id14_mono_mode_texts[] = { "Left", "Centre", "Right", "Other" };
 
 ID_ENUM_DEF(id14_mono_mode, 1, 1, 0, 2);
 
+/* Talkback source: the routing source of the input; none = 0xff. */
+static const char *const id14_talkback_texts[] = {
+	"None", "Mic 1", "Mic 2", "Digi 1", "Digi 2", "Digi 3", "Digi 4", "Digi 5", "Digi 6",
+	"Digi 7", "Digi 8", "Unknown",
+};
+
+ID_ENUM_DEF(id14_talkback, 1, 0xff, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13);
+
+static const char *const id14_optical_texts[] = { "ADAT", "S/PDIF", "Unknown" };
+
+ID_ENUM_DEF(id14_optical, 4, 0, 1);
+
 /*
  * Routing sources for each destination. DAW Thru plays the USB stream
  * directly and bypasses the volume knob: full scale. Main Mix is 0x14/0x15
@@ -122,6 +161,16 @@ ID_ENUM_TEXTS(id14_route_hl, id14_route_texts, 1, 0x18, 0x10, 0x02);
 ID_ENUM_TEXTS(id14_route_hr, id14_route_texts, 1, 0x19, 0x11, 0x03);
 static_assert(ARRAY_SIZE(id14_route_texts) == ARRAY_SIZE(id14_route_ml_values) + 1);
 
+/*
+ * The iD application offers polarity on the Mic and Digi strips, not on
+ * DAW. The MkI accepts it on Digi 1-2 only: CN 5-10 stall in both optical modes
+ * (tested without an ADAT signal).
+ */
+#define ID14_DIGI_POLARITY(n)							\
+	{ .name = "Digi " #n " Polarity Invert Capture Switch", .kind = ID_BOOL,	\
+	  .unit = ID14_FU_IN, .cs = ID14_IN_POLARITY, .cn = 2 + (n), .channels = 1,	\
+	  .flags = ID_WO, .init = 0 }
+
 static const struct id_ctl id14_mk1_ctls[] = {
 	{ .name = "Monitor Speaker Playback Volume", .kind = ID_VOL, .unit = ID14_MON,
 	  .cs = ID14_MON_VOLUME, .channels = 1 },
@@ -152,6 +201,26 @@ static const struct id_ctl id14_mk1_ctls[] = {
 	  .cs = ID14_ROUTE_SOURCE, .cn = 2, .channels = 1, .e = &id14_route_hl },
 	{ .name = "Headphone R Source Playback Enum", .kind = ID_ENUM, .unit = ID14_ROUTE,
 	  .cs = ID14_ROUTE_SOURCE, .cn = 3, .channels = 1, .e = &id14_route_hr },
+	/* Write-only: GET stalls. The probe writes the iD application defaults. */
+	{ .name = "Mic 1 Boost Capture Switch", .kind = ID_BOOST, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_BOOST, .cn = 1, .channels = 1, .flags = ID_WO, .init = 0 },
+	{ .name = "Mic 2 Boost Capture Switch", .kind = ID_BOOST, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_BOOST, .cn = 2, .channels = 1, .flags = ID_WO, .init = 0 },
+	{ .name = "Mic 1 Polarity Invert Capture Switch", .kind = ID_BOOL, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_POLARITY, .cn = 1, .channels = 1, .flags = ID_WO, .init = 0 },
+	{ .name = "Mic 2 Polarity Invert Capture Switch", .kind = ID_BOOL, .unit = ID14_FU_IN,
+	  .cs = ID14_IN_POLARITY, .cn = 2, .channels = 1, .flags = ID_WO, .init = 0 },
+	ID14_DIGI_POLARITY(1), ID14_DIGI_POLARITY(2),
+	{ .name = "iD Key Function Playback Enum", .kind = ID_ENUM, .unit = ID14_MON,
+	  .cs = ID14_MON_ID_KEY, .channels = 1, .flags = ID_WO, .init = 0, .e = &id14_id_key },
+	/* Write-only: GET returns 0 whatever was written. */
+	{ .name = "Talkback Source Capture Enum", .kind = ID_ENUM, .unit = ID14_MON,
+	  .cs = ID14_MON_TALKBACK_SRC, .channels = 1, .flags = ID_WO, .init = 0,
+	  .e = &id14_talkback },
+	/* Write-only: GET stalls. The probe writes the power-on mode, S/PDIF. */
+	{ .name = "Digital In Mode Capture Enum", .kind = ID_ENUM, .unit = ID14_IT_DIGITAL,
+	  .cs = ID14_IT_OPTICAL_MODE, .channels = 1, .flags = ID_WO, .init = 1,
+	  .e = &id14_optical },
 	{ }
 };
 
@@ -159,6 +228,8 @@ static const struct id_ctl id14_mk1_ctls[] = {
 struct id_elem {
 	struct usb_mixer_elem_list list;
 	const struct id_ctl *ctl;
+	long val[2];	/* ID_WO: the last value the device accepted */
+	u8 valid;	/* ID_WO: bit per channel, set when val[] is that value */
 };
 
 /* 0 = -128 dB (mute), 1 dB per step: ID_VOL_MAX = 0 dB. */
@@ -192,6 +263,7 @@ static int id_len(const struct id_ctl *c)
 	case ID_ENUM:
 		return c->e->len;
 	case ID_VOL:
+	case ID_BOOST:
 		return 2;
 	default:
 		return 1;
@@ -203,11 +275,12 @@ static bool id_valid(const struct id_ctl *c, long val)
 	switch (c->kind) {
 	case ID_BOOL:
 	case ID_BOOL_INV:
+	case ID_BOOST:
 		return val == 0 || val == 1;
 	case ID_VOL:
 		return val >= 0 && val <= ID_VOL_MAX;
 	case ID_ENUM:
-		return val >= 0 && val < c->e->items;	/* never "Other" */
+		return val >= 0 && val < c->e->items;	/* never "Other" or "Unknown" */
 	}
 	return false;
 }
@@ -234,6 +307,9 @@ static int id_read(struct usb_mixer_interface *mixer, const struct id_ctl *c,
 	case ID_BOOL_INV:
 		*val = !buf[0];
 		break;
+	case ID_BOOST:
+		*val = raw != 0;
+		break;
 	case ID_VOL:
 		/* the knob moves in whole dB; round anything else to the nearest step */
 		*val = clamp_t(long, DIV_ROUND_CLOSEST(raw, ID_DB(1)) + ID_VOL_MAX,
@@ -262,6 +338,9 @@ static int id_write(struct usb_mixer_interface *mixer, const struct id_ctl *c,
 	case ID_BOOL_INV:
 		buf[0] = !val;
 		break;
+	case ID_BOOST:
+		put_unaligned_le16(val ? ID_DB(10) : 0, buf);
+		break;
 	case ID_VOL:
 		put_unaligned_le16(ID_DB(val - ID_VOL_MAX), buf);
 		break;
@@ -319,9 +398,14 @@ static int id_get(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 	int err;
 
 	for (i = 0; i < c->channels; i++) {
-		err = id_read(e->list.mixer, c, i, &val);
-		if (err < 0)
-			return err;
+		if (c->flags & ID_WO) {
+			/* No last value (the probe write failed): "Unknown", or off. */
+			val = e->valid & BIT(i) ? e->val[i] : c->kind == ID_ENUM ? c->e->items : 0;
+		} else {
+			err = id_read(e->list.mixer, c, i, &val);
+			if (err < 0)
+				return err;
+		}
 		id_set_value(c, v, i, val);
 	}
 	return 0;
@@ -346,15 +430,25 @@ static int id_put(struct snd_kcontrol *kctl, struct snd_ctl_elem_value *v)
 
 	for (i = 0; i < c->channels; i++) {
 		val = id_get_value(c, v, i);
-		err = id_read(mixer, c, i, &cur);
-		if (err < 0)
-			return err;
-		if (cur == val)
-			continue;
-		changed = 1;
+		if (c->flags & ID_WO) {
+			/* Always send: the device may have been reset since the last write. */
+			if (!(e->valid & BIT(i)) || e->val[i] != val)
+				changed = 1;
+		} else {
+			err = id_read(mixer, c, i, &cur);
+			if (err < 0)
+				return err;
+			if (cur == val)
+				continue;
+			changed = 1;
+		}
 		err = id_write(mixer, c, i, val);
 		if (err < 0)
-			return err;
+			return err;	/* a write-only channel keeps its last accepted value */
+		if (c->flags & ID_WO) {
+			e->val[i] = val;
+			e->valid |= BIT(i);
+		}
 	}
 	return changed;
 }
@@ -364,15 +458,19 @@ static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
 	struct snd_kcontrol_new knew = {
 		.iface = SNDRV_CTL_ELEM_IFACE_MIXER,
 		.name = c->name,
-		/* The front panel changes values: user space must not cache them. */
-		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE | SNDRV_CTL_ELEM_ACCESS_VOLATILE,
+		.access = SNDRV_CTL_ELEM_ACCESS_READWRITE,
 		.info = id_info,
 		.get = id_get,
 		.put = id_put,
 	};
 	struct snd_kcontrol *kctl;
 	struct id_elem *e;
+	unsigned int i;
+	int err;
 
+	/* The front panel changes readable values: user space must not cache them. */
+	if (!(c->flags & ID_WO))
+		knew.access |= SNDRV_CTL_ELEM_ACCESS_VOLATILE;
 	if (c->kind == ID_VOL) {
 		knew.access |= SNDRV_CTL_ELEM_ACCESS_TLV_READ;
 		knew.tlv.p = id_vol_tlv;
@@ -385,6 +483,20 @@ static int id_add_ctl(struct usb_mixer_interface *mixer, const struct id_ctl *c)
 	e->list.id = c->unit;
 	e->ctl = c;
 
+	/* A write-only control needs a known value. On failure it reads "Unknown" (or off). */
+	if (c->flags & ID_WO) {
+		for (i = 0; i < c->channels; i++) {
+			err = id_write(mixer, c, i, c->init);
+			if (err < 0) {
+				usb_audio_warn(mixer->chip, "iD14: cannot set '%s' (%d)\n",
+					       c->name, err);
+				continue;
+			}
+			e->val[i] = c->init;
+			e->valid |= BIT(i);
+		}
+	}
+
 	kctl = snd_ctl_new1(&knew, e);
 	if (!kctl) {
 		kfree(e);
diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index e147c1a48..63a77f3eb 100644
--- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -528,6 +528,7 @@ static const struct usbmix_name_map audient_id14_map[] = {
 
 /* Audient iD14 MkI: model-specific control map. */
 static const struct usbmix_name_map audient_id14_mk1_map[] = {
+	{ 11, NULL },			/* FU, see mixer_audient_id.c */
 	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
 	{ 60, NULL },			/* MU, see mixer_audient_id.c */
 	{}
-- 
2.47.3

