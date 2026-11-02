Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579584;
	b=K7PXk4icQrQZba4YKE4mbzJaKiji3vsTlRGawsVT7nAFjz3hnm8cw/Uv2KdXu2mZZVJh
	 Mze1mQSuHe8bJ88GIZCmSP6WHc4q6ffuas9uPduBm25PLzOW0FYsOuvN0RhipeX33kCm8
	 c47KiJX90lzADsNxFNq+YZQRsGC3iPhw93xs1XpM1MEJPawxO271Qcg6WtamEjD/1Kne3
	 qkxGMyY9KBw2FupGWD3dl386pu+1yB0oBFcB7H8Mg51pOL6MX5GSf4IaUp1GJ+w2FNNeu
	 efw87viLarwJWxrwq472lCbMT5aQ3WmLFg4QccC5xi7bUoaDJjWR4w5VtnLDwnYMKLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579584;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=IlZAX+oZemDhfAJMX5tUYL4RQ9Hvn2pIBrCC1NEUag4=;
	b=UKVrAzFQd4v+pfb/vmngG84UVrHg1YmO3xrdOZvIWWxgONszMm/a6OJG1Z9F2UkULXur
	 9TqxkVVTSJYpcN6Eu7Tf3JI1tDvuO4lyuqAA84GLmQGG6oaScZVdq1KgWQzv2sWqa0HVl
	 rIGhils9oKngDEBbkEUPqaN1TVq4qrBUiatlaOrGbtLi+ejkBvSxszyfnLRZg+beCXeTQ
	 3YNEQO+JJbs5MaDraksptuPjsq6raEj74vKJQLIz4TXcBHTjtHAj4bpeLZ69yasRyWQ9R
	 c+PpxSJv34lPSRkPmFUd8USO0wR2Z5AP3ms1jyFDU2LhKsxy81Jn8i1Tr1CtXtNeosQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=RdezI5YP;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC3D606A324;
	Mon,  2 Nov 2026 00:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCC3D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=RdezI5YP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579580; x=1794184380; i=arc@gmx.li;
	bh=IlZAX+oZemDhfAJMX5tUYL4RQ9Hvn2pIBrCC1NEUag4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=RdezI5YP3t3DuItxokQkC8VyIBG5P+0uFXQ5nJvh8ZaK6QaBx0d/9vrKWgizFcBt
	 zordgnHWiFNoR9JKu2bbxDyduygEh2Rwv/2VbGjyAWKhYbDvmCcWUwmgEINEoHsxg
	 BNg5Y4eFcU+cWI/GsUdGh+Go7RGdw+O0w4/nfIDeFQEqYTuHoVQ9ydijGQHTABCRz
	 3JYTJz+eq3nZazd0ynP5Oy7IFZm2WtGLwohi7ZH19sOuVpWZIStMc9JXRT50TL4Mx
	 DB7pEEYRywiQ40lWWDlY9BFtxvgdTD25cyRR8GZOiTZb+B882S/xiw74fBIbMLP99
	 Ep66aN02WzpeBFWNUw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1xG0Su2MKC-0018z7; Mon, 02
 Nov 2026 01:33:00 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 01/11] ALSA: rename mixer_evo to mixer_audient
Date: Mon,  2 Nov 2026 01:32:47 +0100
Message-ID: <20261102003257.10134-2-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102003257.10134-1-arc@gmx.li>
References: <20261101173557.221869-1-mrwillporter@gmail.com>
 <20261102003257.10134-1-arc@gmx.li>
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
X-Provags-ID: V03:K1:tVOVm76sPe/7F7DqsopgKpkSbAv23QR1OZ52kJUxeBpf/OI8a7l
 jRvMze7BPcRVaV5KsKiuV82aLWcxYmouAX2eSg2OilxX/3C/nv2oEvdiOi23lO9k2dVrDaR
 gUinbaHjECG3Fc7NBMv51pfT11JcvjDCgS0WbRpqOzXU3P8gv1QLjQu4GrTEYjdNF1q7NLN
 ns9hYDVhNHiflXFgEEJkw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Xnm79NQHDMQ=;SYbrf+jkOodFazLZonIy0nafZuH
 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

Rename mixer_evo files and functions to *_audient in preparation of a more
generic driver for audient devices.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 MAINTAINERS                                |   7 +-
 sound/usb/Makefile                         |   2 +-
 sound/usb/{mixer_evo.c =3D> mixer_audient.c} | 249 +++++++++++----------
 sound/usb/mixer_audient.h                  |  12 +
 sound/usb/mixer_evo.h                      |  12 -
 sound/usb/mixer_quirks.c                   |   4 +-
 6 files changed, 148 insertions(+), 138 deletions(-)
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
index c1e0332232f2..e2700b08cf80 100644
=2D-- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_audient.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Audient EVO driver for ALSA
+ * Audient driver for ALSA
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

