Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491250;
	b=n3kbenDlmt5+Q6LwvsU/eYxpiGtiefZu0x3Omh6aPdP2FgJ7g/iYRueeQWqwGLTIhvpq
	 oH7crN/JiuZCqPQ/Bk7KAdI5lw8UZj7A7ZD27Vkf83fqYqTUk/o8vgwRdUxXkyPU/OWoa
	 K0Z3yYWJN+Xcsla4i/IlAAiVbLYzEr3E4CsOVA7Ro1oBbQ6dltOumU0QWNmOYIjjtU/O/
	 XTIqn6Buki8oEi5Zma2o5GeeSWrMZ/SDmF8Wsp9FSbnXEVt1Ug5ucWiXqM4rEVg/ukR1q
	 gFrc6QEXt5aMsvwJnPm4gKxyxR2608SR6KEiiE0ZOhsXCzrtolBEc5cQEDUyKsAfk4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491250;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=118ctAdzAUR3nBoFmrAnMruRCCpPxjM/SkschAu5B0I=;
	b=adLB8mwS8mWNs0aHnwJ/htXM8c51ZlmwixbfmKBwjoz0Kqxnb+wz13OGZYQOzfg3+937
	 9XSW+w9NsDuvlqzx2gDf136T3qLDQuS+f9m6IFZI7BJHgXXr7ENvNisMPEO8y8ijrSmjo
	 Dy9WYBwX7xl87YqxAyhfynQLGf2Z1SfAB6JlPjmB9MxZX3+5i/wJoYTnlMXrIMPynaxEg
	 +4rZMF0l5tF73TuZA2AN7sOVNVpsQldfLZs1HKIx3fM+CpyR+pG4yTmyMvL07wLaT5nN6
	 pBns6s4XhP1ijYpIe4dykveQTsAKidkeNSuJBmO+FNF+6JTtP0g6aOeESjO83zVHXTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=HTvMuvJz;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3AF4606A320;
	Sun,  1 Nov 2026 00:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3AF4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=HTvMuvJz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491241; x=1794096041; i=arc@gmx.li;
	bh=118ctAdzAUR3nBoFmrAnMruRCCpPxjM/SkschAu5B0I=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=HTvMuvJzZ/38fA9VTg8S8T/0y5adVP0XhBv7n/lpe6J8D3oUbjAPpa2Wo2k5IDIZ
	 7aONWnGciPfLc1C4qx1h8g/GOIUix76gsdFV09LM14ZEcGB5YMzu7AZkFOwwBt21t
	 o1T6br4UVyXljSYpaD9HnnAUV6m0LpLeF4BBHW0FZdl60/NOc5Y/7K4vTtCYF9uxC
	 tB1EUJpkZ/Urg+G/puXlZz8i9dq4ipSG4sihZCk6W732gUSDam1Ndw5Vtg2w51b29
	 0AMNCtTvoB2T1dhedysFR2UtOk9M/VUuD9t81fY6ucaQa69PJi1SNHuGVYu25H24x
	 Ta/l6UxqXzNHVBpR7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M89L1-1xRRs32uHb-003R2n; Sun, 01
 Nov 2026 01:00:40 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 01/11] ALSA: rename mixer_evo to mixer_audient
Date: Sun,  1 Nov 2026 01:00:03 +0100
Message-ID: <20261101000013.11880-2-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261101000013.11880-1-arc@gmx.li>
References: <CAMZ8TEw=rmc=H3L60j-o_wa0fNc9eOhG7ZY0SdttFf+p-qUfkQ@mail.gmail.com>
 <20261101000013.11880-1-arc@gmx.li>
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
X-Provags-ID: V03:K1:MR8E53igR4lQvMCBXM+2aKXsPRX4aA8ZrgxOnBbud1q9RcFsudJ
 YDag0NOZV5BTd2AGzz4vVbfTBm6JwH5qCelExfLlTvQJGR5i9UJL5000LRzlEOJLe32v6F9
 kcbtwZaziZtRtKj1ydJXA/Vw4D7WLomID1VyhxVFNQLHi9Fdj+MjHG271fKc6Jm5C3swXis
 uA4G+8r/Uu75HpvApgEpA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Rjb33C5l1ok=;oJTyhFMG9JYlaGQ48BLE5Zp8TyH
 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

Rename mixer_evo files and functions to *_audient in preparation of a more
generic driver for audient devices.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 MAINTAINERS                                |   7 +-
 sound/usb/Makefile                         |   2 +-
 sound/usb/{mixer_evo.c =3D> mixer_audient.c} | 247 +++++++++++----------
 sound/usb/mixer_audient.h                  |  12 +
 sound/usb/mixer_evo.h                      |  12 -
 sound/usb/mixer_quirks.c                   |   4 +-
 6 files changed, 147 insertions(+), 137 deletions(-)
 rename sound/usb/{mixer_evo.c =3D> mixer_audient.c} (54%)
 create mode 100644 sound/usb/mixer_audient.h
 delete mode 100644 sound/usb/mixer_evo.h

diff --git a/MAINTAINERS b/MAINTAINERS
index fee9d090b280..a1139ae3404d 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4354,12 +4354,13 @@ F:	drivers/net/ieee802154/at86rf230.h
 F:	drivers/net/ieee802154/atusb.c
 F:	drivers/net/ieee802154/atusb.h
=20
-AUDIENT EVO MIXER DRIVER
+AUDIENT MIXER DRIVER
 M:	Christian Ruppert <arc@gmx.li>
+M:	Will Porter <mrwillporter@gmail.com>
 L:	linux-sound@vger.kernel.org
 S:	Maintained
-F:	sound/usb/mixer_evo.c
-F:	sound/usb/mixer_evo.h
+F:	sound/usb/mixer_audient.c
+F:	sound/usb/mixer_audient.h
=20
 AUDIT SUBSYSTEM
 M:	Paul Moore <paul@paul-moore.com>
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index 2e842dcc73de..44f4e4c820fb 100644
=2D-- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -11,7 +11,7 @@ snd-usb-audio-y :=3D 	card.o \
 			helper.o \
 			implicit.o \
 			mixer.o \
-			mixer_evo.o \
+			mixer_audient.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
 			mixer_scarlett2.o \
diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_audient.c
similarity index 54%
rename from sound/usb/mixer_evo.c
rename to sound/usb/mixer_audient.c
index c1e0332232f2..8c1524c9b165 100644
=2D-- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_audient.c
@@ -3,7 +3,7 @@
  * Audient EVO driver for ALSA
  * Copyright (C) 2026 Christian Ruppert <arc@gmx.li>
  *
- * Based on the work of Ivan Hazucha for audient-evo-py.
+ * EVO4 support is based on the work of Ivan Hazucha for audient-evo-py.
  * https://github.com/vanzaho/audient-evo-py/
  */
=20
@@ -20,22 +20,22 @@
 #include "mixer.h"
 #include "mixer_quirks.h"
 #include "helper.h"
-#include "mixer_evo.h"
+#include "mixer_audient.h"
=20
=20
-enum snd_evo_type {
-	SND_EVO_TYPE_MONITOR =3D 0,
-	SND_EVO_TYPE_PHANTOM,
-	SND_EVO_TYPE_MUTE,
-	SND_EVO_TYPE_MUTE_OUT,
-	SND_EVO_TYPE_MIXER,
-	SND_EVO_TYPE_NCTYPES
+enum snd_audient_type {
+	SND_AUDIENT_TYPE_MONITOR =3D 0,
+	SND_AUDIENT_TYPE_PHANTOM,
+	SND_AUDIENT_TYPE_MUTE,
+	SND_AUDIENT_TYPE_MUTE_OUT,
+	SND_AUDIENT_TYPE_MIXER,
+	SND_AUDIENT_TYPE_NCTYPES
 };
=20
 /* Mixer matrix: -128dB (mute) to +6dB */
-static const DECLARE_TLV_DB_MINMAX_MUTE(snd_evo_tlv_mixer, -12800, 600);
+static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
-static const struct snd_evo_ctrl_type {
+static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	bool invert;
 	union {
@@ -47,8 +47,8 @@ static const struct snd_evo_ctrl_type {
 	const unsigned int *tlv;
 	u16 wValue;
 	u16 wIndex;
-} snd_evo_ctypes[SND_EVO_TYPE_NCTYPES] =3D {
-	[SND_EVO_TYPE_MONITOR] =3D {
+} snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] =3D {
+	[SND_AUDIENT_TYPE_MONITOR] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer =3D 0,
 		.max.integer =3D 127,
@@ -56,7 +56,7 @@ static const struct snd_evo_ctrl_type {
 		.wIndex =3D 0x3800,
 		/* no TLV here because we can't describe the cross-fader */
 	},
-	[SND_EVO_TYPE_PHANTOM] =3D {
+	[SND_AUDIENT_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D false,
 		.min.integer =3D 0,
@@ -64,7 +64,7 @@ static const struct snd_evo_ctrl_type {
 		.wValue =3D 0x0000,
 		.wIndex =3D 0x3A00,
 	},
-	[SND_EVO_TYPE_MUTE] =3D {
+	[SND_AUDIENT_TYPE_MUTE] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
 		.min.integer =3D 0,
@@ -72,7 +72,7 @@ static const struct snd_evo_ctrl_type {
 		.wValue =3D 0x0200,
 		.wIndex =3D 0x3A00,
 	},
-	[SND_EVO_TYPE_MUTE_OUT] =3D {
+	[SND_AUDIENT_TYPE_MUTE_OUT] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
 		.min.integer =3D 0,
@@ -80,135 +80,135 @@ static const struct snd_evo_ctrl_type {
 		.wValue =3D 0x0100,
 		.wIndex =3D 0x3B00,
 	},
-	[SND_EVO_TYPE_MIXER] =3D {
+	[SND_AUDIENT_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
 		.wValue =3D 0x0100,
 		.wIndex =3D 0x3C00,
-		.tlv =3D snd_evo_tlv_mixer,
+		.tlv =3D snd_audient_tlv_mixer,
 	},
 };
=20
-#define SND_EVO_FLAGS_DIRECTION (1L<<0)
-#define SND_EVO_FLAGS_CAPTURE (1L<<0)
-#define SND_EVO_FLAGS_PLAYBACK (0L<<0)
+#define SND_AUDIENT_FLAGS_DIRECTION (1L<<0)
+#define SND_AUDIENT_FLAGS_CAPTURE (1L<<0)
+#define SND_AUDIENT_FLAGS_PLAYBACK (0L<<0)
=20
-struct snd_evo_ctrl {
+struct snd_audient_ctrl {
 	char *basename;
-	enum snd_evo_type type;
+	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
 	unsigned int val_offs;
 	unsigned long flags;
 };
=20
-static const struct snd_evo_ctrl evo4_controls[] =3D {
+static const struct snd_audient_ctrl snd_audient_evo4_controls[] =3D {
 	{
 		.basename =3D "Master",
-		.type =3D SND_EVO_TYPE_MUTE_OUT,
+		.type =3D SND_AUDIENT_TYPE_MUTE_OUT,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_EVO_FLAGS_PLAYBACK,
+		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
 		.basename =3D "Mic",
-		.type =3D SND_EVO_TYPE_MUTE,
+		.type =3D SND_AUDIENT_TYPE_MUTE,
 		.channels =3D 4,
 		.hwchannels =3D 2,
 		.val_offs =3D 0,
-		.flags =3D SND_EVO_FLAGS_PLAYBACK,
+		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
 		.basename =3D "Monitor",
-		.type =3D SND_EVO_TYPE_MONITOR,
+		.type =3D SND_AUDIENT_TYPE_MONITOR,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_EVO_FLAGS_PLAYBACK,
+		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
 		.basename =3D "Mic 1",
-		.type =3D SND_EVO_TYPE_MIXER,
+		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 0,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Mic 2",
-		.type =3D SND_EVO_TYPE_MIXER,
+		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 2,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Master Left",
-		.type =3D SND_EVO_TYPE_MIXER,
+		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 4,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Master Right",
-		.type =3D SND_EVO_TYPE_MIXER,
+		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 6,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Loopback Left",
-		.type =3D SND_EVO_TYPE_MIXER,
+		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 8,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Loopback Right",
-		.type =3D SND_EVO_TYPE_MIXER,
+		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 10,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Mic 1 Phantom",
-		.type =3D SND_EVO_TYPE_PHANTOM,
+		.type =3D SND_AUDIENT_TYPE_PHANTOM,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
 		.basename =3D "Mic 2 Phantom",
-		.type =3D SND_EVO_TYPE_PHANTOM,
+		.type =3D SND_AUDIENT_TYPE_PHANTOM,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 1,
-		.flags =3D SND_EVO_FLAGS_CAPTURE,
+		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{ 0 }, /* sentinel */
 };
=20
-static const struct evo_devinfo {
+static const struct audient_devinfo {
 	u32 usb_id;
-	const struct snd_evo_ctrl *controls;
-} evo_devinfo[] =3D {
+	const struct snd_audient_ctrl *controls;
+} audient_devinfo[] =3D {
 	{
 		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
-		.controls =3D evo4_controls,
+		.controls =3D snd_audient_evo4_controls,
 	},
 	{ 0 } /* sentinel */
 };
=20
=20
-static inline unsigned long snd_evo_kctl_priv(enum snd_evo_type type,
-					      u8 valoffs, u8 hwchannels)
+static inline unsigned long snd_audient_kctl_priv(enum snd_audient_type t=
ype,
+						  u8 valoffs, u8 hwchannels)
 {
 	unsigned long type_l =3D type & 0xFF;
 	unsigned long valoffs_l =3D valoffs & 0xFF;
@@ -218,22 +218,24 @@ static inline unsigned long snd_evo_kctl_priv(enum s=
nd_evo_type type,
 }
=20
 static __always_inline
-const struct snd_evo_ctrl_type *snd_evo_kctl_type(struct snd_kcontrol *kc=
tl)
+const struct snd_audient_ctrl_type *snd_audient_kctl_type(struct snd_kcon=
trol
+							  *kctl)
 {
-	return &snd_evo_ctypes[kctl->private_value & 0xFF];
+	return &snd_audient_ctypes[kctl->private_value & 0xFF];
 }
=20
-static __always_inline u16 snd_evo_kctl_valoffs(struct snd_kcontrol *kctl=
)
+static __always_inline u16 snd_audient_kctl_valoffs(struct snd_kcontrol *=
kctl)
 {
 	return (kctl->private_value >> 8) & 0xFF;
 }
=20
-static __always_inline u16 snd_evo_kctl_hwchannels(struct snd_kcontrol *k=
ctl)
+static __always_inline
+u16 snd_audient_kctl_hwchannels(struct snd_kcontrol *kctl)
 {
 	return (kctl->private_value >> 16) & 0xFF;
 }
=20
-static inline u16 snd_evo_kctl_channels(struct snd_kcontrol *kctl)
+static inline u16 snd_audient_kctl_channels(struct snd_kcontrol *kctl)
 {
 	struct usb_mixer_elem_info *info =3D kctl->private_data;
=20
@@ -241,43 +243,45 @@ static inline u16 snd_evo_kctl_channels(struct snd_k=
control *kctl)
 }
=20
=20
-#define EVO_REQ_CUR (0x01)
-#define EVO_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFA=
CE)
-#define EVO_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS | USB_RECIP_INTERFA=
CE)
+#define AUDIENT_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS \
+					 | USB_RECIP_INTERFACE)
+#define AUDIENT_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS \
+					 | USB_RECIP_INTERFACE)
=20
-static inline int snd_evo_get_cur(struct usb_mixer_interface *mixer,
-				  u16 value, u16 index,
-				  void *buf, size_t len)
+static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
+				      u16 value, u16 index,
+				      void *buf, size_t len)
 {
 	struct usb_device *const dev =3D mixer->chip->dev;
=20
 	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       EVO_REQ_CUR, EVO_REQTYPE_GET,
+			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
 			       value, index, buf, len);
 }
=20
-static inline int snd_evo_set_cur(struct usb_mixer_interface *mixer,
-				  u16 value, u16 index,
-				  void *buf, size_t len)
+static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
+				      u16 value, u16 index,
+				      void *buf, size_t len)
 {
 	struct usb_device *const dev =3D mixer->chip->dev;
=20
 	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			       EVO_REQ_CUR, EVO_REQTYPE_SET,
+			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
 			       value, index, buf, len);
 }
=20
=20
-static int snd_ctl_evo_boolean_get(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
+				       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *const list =3D snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer =3D list->mixer;
=20
-	const unsigned int nchan =3D snd_evo_kctl_channels(kctl);
-	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
+	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index =3D ctype->wIndex;
=20
 	int i;
@@ -290,8 +294,8 @@ static int snd_ctl_evo_boolean_get(struct snd_kcontrol=
 *kctl,
 		u32 buf;
 		int ret;
=20
-		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &buf, sizeof(buf));
+		ret =3D snd_audient_get_cur(mixer, value + i, index,
+					  &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
=20
@@ -309,15 +313,16 @@ static int snd_ctl_evo_boolean_get(struct snd_kcontr=
ol *kctl,
 	return 0;
 }
=20
-static int snd_ctl_evo_boolean_set(struct snd_kcontrol *kctl,
-				   struct snd_ctl_elem_value *ctl_val)
+static int snd_ctl_audient_boolean_set(struct snd_kcontrol *kctl,
+				       struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer =3D list->mixer;
=20
-	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index =3D ctype->wIndex;
=20
 	int changed =3D 0;
@@ -335,7 +340,7 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol=
 *kctl,
 		if (ctype->invert)
 			buf ^=3D cpu_to_le32(0x1);
=20
-		ret =3D snd_evo_get_cur(mixer, value + i, index,
+		ret =3D snd_audient_get_cur(mixer, value + i, index,
 				      &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
@@ -343,8 +348,8 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontrol=
 *kctl,
 		if (rbuf !=3D buf) {
 			changed =3D 1;
=20
-			ret =3D snd_evo_set_cur(mixer, value + i, index,
-					      &buf, sizeof(buf));
+			ret =3D snd_audient_set_cur(mixer, value + i, index,
+						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
 		}
@@ -353,16 +358,17 @@ static int snd_ctl_evo_boolean_set(struct snd_kcontr=
ol *kctl,
 	return changed;
 }
=20
-static int snd_ctl_evo_integer_get(struct snd_kcontrol *kctl,
+static int snd_ctl_audient_integer_get(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *const list =3D snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *const mixer =3D list->mixer;
=20
-	const unsigned int nchan =3D snd_evo_kctl_channels(kctl);
-	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int nchan =3D snd_audient_kctl_channels(kctl);
+	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index =3D ctype->wIndex;
=20
 	int i;
@@ -376,8 +382,8 @@ static int snd_ctl_evo_integer_get(struct snd_kcontrol=
 *kctl,
 		s16 val;
 		int ret;
=20
-		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &buf, sizeof(buf));
+		ret =3D snd_audient_get_cur(mixer, value + i, index,
+					  &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
=20
@@ -391,15 +397,16 @@ static int snd_ctl_evo_integer_get(struct snd_kcontr=
ol *kctl,
 	return 0;
 }
=20
-static int snd_ctl_evo_integer_set(struct snd_kcontrol *kctl,
+static int snd_ctl_audient_integer_set(struct snd_kcontrol *kctl,
 				   struct snd_ctl_elem_value *ctl_val)
 {
 	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
 	struct usb_mixer_interface *mixer =3D list->mixer;
=20
-	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
-	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
 	const u16 index =3D ctype->wIndex;
=20
 	int changed =3D 0;
@@ -414,16 +421,16 @@ static int snd_ctl_evo_integer_set(struct snd_kcontr=
ol *kctl,
 		s16 buf =3D cpu_to_le16(ctl_val->value.integer.value[i]);
 		int ret;
=20
-		ret =3D snd_evo_get_cur(mixer, value + i, index,
-				      &rbuf, sizeof(rbuf));
+		ret =3D snd_audient_get_cur(mixer, value + i, index,
+					  &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
=20
 		if (rbuf !=3D buf) {
 			changed =3D 1;
=20
-			ret =3D snd_evo_set_cur(mixer, value + i, index,
-					      &buf, sizeof(buf));
+			ret =3D snd_audient_set_cur(mixer, value + i, index,
+						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
 		}
@@ -432,23 +439,25 @@ static int snd_ctl_evo_integer_set(struct snd_kcontr=
ol *kctl,
 	return changed;
 }
=20
-static int snd_ctl_evo_info(struct snd_kcontrol *kctl,
+static int snd_ctl_audient_info(struct snd_kcontrol *kctl,
 			    struct snd_ctl_elem_info *uinfo)
 {
-	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
+	const struct snd_audient_ctrl_type *const ctype
+						=3D snd_audient_kctl_type(kctl);
=20
 	uinfo->type =3D ctype->type;
-	uinfo->count =3D snd_evo_kctl_channels(kctl);
+	uinfo->count =3D snd_audient_kctl_channels(kctl);
 	uinfo->value.integer.min =3D ctype->min.integer;
 	uinfo->value.integer.max =3D ctype->max.integer;
 	return 0;
 }
=20
=20
-static int snd_evo_add_ctrl(struct usb_mixer_interface *mixer,
-			    const struct snd_evo_ctrl *ctrl)
+static int snd_audient_add_ctrl(struct usb_mixer_interface *mixer,
+			    const struct snd_audient_ctrl *ctrl)
 {
-	const struct snd_evo_ctrl_type *ctype =3D &snd_evo_ctypes[ctrl->type];
+	const struct snd_audient_ctrl_type *ctype
+					=3D &snd_audient_ctypes[ctrl->type];
 	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new knew =3D { 0 };
 	struct snd_kcontrol *kctl;
@@ -456,9 +465,9 @@ static int snd_evo_add_ctrl(struct usb_mixer_interface=
 *mixer,
=20
 	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
 	knew.name =3D name;
-	knew.info =3D snd_ctl_evo_info;
-	knew.private_value =3D snd_evo_kctl_priv(ctrl->type, ctrl->val_offs,
-					       ctrl->hwchannels);
+	knew.info =3D snd_ctl_audient_info;
+	knew.private_value =3D snd_audient_kctl_priv(ctrl->type, ctrl->val_offs,
+						   ctrl->hwchannels);
 	knew.tlv.p =3D ctype->tlv;
 	knew.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
 			| SNDRV_CTL_ELEM_ACCESS_VOLATILE
@@ -466,20 +475,20 @@ static int snd_evo_add_ctrl(struct usb_mixer_interfa=
ce *mixer,
=20
 	switch (ctype->type) {
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
-		knew.get =3D snd_ctl_evo_integer_get;
-		knew.put =3D snd_ctl_evo_integer_set;
+		knew.get =3D snd_ctl_audient_integer_get;
+		knew.put =3D snd_ctl_audient_integer_set;
 		break;
 	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
-		knew.get =3D snd_ctl_evo_boolean_get;
-		knew.put =3D snd_ctl_evo_boolean_set;
+		knew.get =3D snd_ctl_audient_boolean_get;
+		knew.put =3D snd_ctl_audient_boolean_set;
 		break;
 	default:
 		return -EINVAL;
 	}
=20
 	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
-		 ((ctrl->flags & SND_EVO_FLAGS_DIRECTION)
-			=3D=3D SND_EVO_FLAGS_CAPTURE) ? "Capture" : "Playback",
+		 ((ctrl->flags & SND_AUDIENT_FLAGS_DIRECTION)
+			=3D=3D SND_AUDIENT_FLAGS_CAPTURE) ? "Capture" : "Playback",
 		 (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN)
 			? "Switch" : "Volume");
=20
@@ -503,12 +512,12 @@ static int snd_evo_add_ctrl(struct usb_mixer_interfa=
ce *mixer,
=20
=20
 /* called from mixer_quirks.c */
-int snd_evo_controls_create(struct usb_mixer_interface *mixer)
+int snd_audient_controls_create(struct usb_mixer_interface *mixer)
 {
-	const struct evo_devinfo *info;
-	const struct snd_evo_ctrl *ctrl;
+	const struct audient_devinfo *info;
+	const struct snd_audient_ctrl *ctrl;
=20
-	for (info =3D evo_devinfo; info->controls; info++)
+	for (info =3D audient_devinfo; info->controls; info++)
 		if (info->usb_id =3D=3D mixer->chip->usb_id)
 			break;
=20
@@ -516,7 +525,7 @@ int snd_evo_controls_create(struct usb_mixer_interface=
 *mixer)
 		return -ENODEV;
=20
 	for (ctrl =3D info->controls; ctrl->basename; ctrl++) {
-		const int ret =3D snd_evo_add_ctrl(mixer, ctrl);
+		const int ret =3D snd_audient_add_ctrl(mixer, ctrl);
=20
 		if (ret < 0)
 			return ret;
diff --git a/sound/usb/mixer_audient.h b/sound/usb/mixer_audient.h
new file mode 100644
index 000000000000..db4f31e02b5e
=2D-- /dev/null
+++ b/sound/usb/mixer_audient.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __USB_MIXER_AUDIENT_H
+#define __USB_MIXER_AUDIENT_H
+
+#include "mixer.h"
+
+#define USB_AUDIENT_VID (0x2708)
+#define USB_EVO4_PID (0x0006)
+
+int snd_audient_controls_create(struct usb_mixer_interface *mixer);
+
+#endif /* __USB_MIXER_AUDIENT_H */
diff --git a/sound/usb/mixer_evo.h b/sound/usb/mixer_evo.h
deleted file mode 100644
index 7fe7e197185c..000000000000
=2D-- a/sound/usb/mixer_evo.h
+++ /dev/null
@@ -1,12 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __USB_MIXER_EVO_H
-#define __USB_MIXER_EVO_H
-
-#include "mixer.h"
-
-#define USB_AUDIENT_VID (0x2708)
-#define USB_EVO4_PID (0x0006)
-
-int snd_evo_controls_create(struct usb_mixer_interface *mixer);
-
-#endif /* __USB_MIXER_EVO_H */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 01210cc3fae7..af53c5c20e65 100644
=2D-- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -38,7 +38,7 @@
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
-#include "mixer_evo.h"
+#include "mixer_audient.h"
 #include "helper.h"
 #include "fcp.h"
=20
@@ -4541,7 +4541,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixe=
r_interface *mixer)
 		break;
=20
 	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
-		err =3D snd_evo_controls_create(mixer);
+		err =3D snd_audient_controls_create(mixer);
 		break;
=20
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
=2D-=20
2.56.0

