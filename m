Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779060;
	b=zEcZgmhwcyS1JusyWyolbL/iXr+bjR0rjUAochGYF7Uye6Y+G7JjrTCllCcjeY18mdfT
	 skkwEPCoIao98cKERWl8tdKRhXOfo/tfm411ndwVO7vM/MH38GOVgQVthNCnU6krZieZU
	 tptuWqBZdbqT9D+FZdpIDl/kAl6ceoItpbP71il9MskO8Wc6hpoggY7uprCO1gceHBZMd
	 lq4myfk7G/y+soGZkxandZ6frlD9negDYorG1K/SzJ+Zsxc8A+MjjPp3XT0zRceBqnb98
	 CYSUW8sSnoptdkueml4ZZSCHZBhAl+eUZz7FVTZjGsPPcDjIb8GgDkAHkugzc1gP8Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779060;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=lTUq/hzrw8M8IHlLvI7YipJykdXFLSWs3sx6wTWyHKY=;
	b=fqc9I6fA+J9iPWnIXj/o/tA3x5oP6ZvbBcEU8l8lfTxk3AbD0k2jBPz2Ia1RlEpqzp9D
	 TSCdXtoAVWBQzmLKv7H/BzSsImDDOZSPoDIWr5G+mbGUrQQpIf1Tyvi8ilIeWbQPOa51O
	 V3W3Otbulf7NWjk7LbyG+vj+KgKdeA8GIVXbyiG616Jc444Y2Nrlzfc4NeSOKh6egq/eH
	 KmO//lBTte4bk3Cz/qqhFQqAUtlJvxSHRhEp+Jgx00QR3hxNW2MZMpluA9kHq7MQ+7TSK
	 L0L7yxBGwzH8gzBtsKyFkHajKzToS5iquJ2cfIJAMEAMpxZYJXi1RxrN9CFtaGat8Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=SRJMr64e;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FE3606A8AE
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00FE3606A8AE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=SRJMr64e
DKIM2-Signature:  i=1; m=1; t=1794779057;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:ovy7+0piTvpwsC5GOeYoWQKtNiSi
   vPgV9UORwnveeXL2IEaRWkpNae3H2df5EUU3vka6EayS87Pz2u/h1RF4/14bszugOLzhYeipFPo
   xO1jUL23gFVR7bXSSlYmY6dVfJjGqVCLCb4MPqUDhIvK1w4gSENOMGfGAq4PWZk/+4y2W2TSjCX
   HW6YzjFwKN74TYn4wGQLCqY0ggpPCLOtbXIeID1jxpd8wJdUxxSQB/kqXnkXNpEvEPeUYeZ4/ll
   /VUNhWybrDcmoYZkyI3os7kSIhJd5JoGfoRphFJkQ54Dbw0Y/yynF3nbii1a7PZt3g/IbnCxVMI
   lRh5hbwoYpKvpw==;
Message-Instance:  m=1;
 h=sha256:
   TFFItN2BP3EPAXy1y9krifLBB0khL/DtDcRC72PGyW0=:
   Odjoos8Qz45AysfPzR1HikpAWW9dfsftAaSvUxZRRAI=,
  sha512:
   ZU+MHzkVsiKrpEM7K6AUpINBfMwvyqYvdI0Eho71zdEsZt353u8jrk6f6z8PUOQ4LJqBkpyOZGO/0CqbFIQAJw==:
   SOMNuvdmx2r9Mw5VXzTedCykWOPy/Yp4d37XXUiKUKxSjPWcdiT4LPyctnJuQ+VKt9SQ4sIqjlAc6Z0ZyF8dtg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779021; x=1795383821; i=arc@gmx.li;
	bh=lTUq/hzrw8M8IHlLvI7YipJykdXFLSWs3sx6wTWyHKY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=SRJMr64e43qfuH6T/LjY7mt1Yl1Qw9Q4zo3V+UP7S/PEh/VZpo6nqyKf68A3z3zT
	 KAiXq4q+h5tjzO4n7n8w6/y3ou+yP+UIlp73p4xhQLaHez6K4F2P9KkWxC0WeOmdi
	 2KVwrQf0gIexKu35UCcAdOI74ufLxIqEtIkwDT0ayz9jIdeXXh6yeKpuSzM9J6HWL
	 R4htlBi4HfuFWkJSHiT7N5I/aWkS8ifsD/Of8Sh62MEcye3i0UANjqqxRioGZ4yEE
	 qN8ZvnmLZUK/hAfoZcnIZnqJnqHm1svL/82MEVLvm72O5dwrpT9Fi2yObOmf+JhxY
	 ReDW+y08HAJGFAFFYA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAfYm-1xHgSi2jQu-00CZoC; Sun, 15
 Nov 2026 22:43:40 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 01/19] ALSA: rename mixer_evo to mixer_audient
Date: Sun, 15 Nov 2026 22:43:18 +0100
Message-ID: <20261115214336.17917-2-arc@gmx.li>
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
X-Provags-ID: V03:K1:YAxvrvV1UHSU7O3a5XbNNXRq7kpfPOJ+t2tGctKOo/XLqe4eAbr
 C3O/ZhthZMFHHtsw0+7DNdMWkFYEUHJfzeuJ+5NfgXmDFlzyiFVGvPuTMCEq8l7MOUf/Tl/
 RDZJvMrB3qQaKCG8QpjZ9NBb8O7co2yxnlgmfNAGDchVUlUZupCeIXe4I3dYmUPFwhhh4xN
 Cl7tSElFm+1UK6EIVzQag==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:giJzUocXs04=;nzb8JmfXLdseTEEjHcqhWKRI65V
 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

Rename mixer_evo files and functions to *_audient in preparation of a more
generic driver for audient devices.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
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
index 222b7fc2c3aa..94a594e17498 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4448,12 +4448,13 @@ F:	drivers/net/ieee802154/at86rf230.h
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
index 4c7d68311f20..c250ebea5af5 100644
=2D-- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -39,7 +39,7 @@
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
-#include "mixer_evo.h"
+#include "mixer_audient.h"
 #include "helper.h"
 #include "fcp.h"
=20
@@ -4781,7 +4781,7 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mixe=
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
2.56.1

