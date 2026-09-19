Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00EE02EEE76;
	Sat, 19 Sep 2026 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789831147; cv=none; b=lERZJwHQHexqw/776fxltXu2v4ROpa47c8d+X7stMmkIURj72PfC5UIg5tc9BlLyehRrnHQf+DSuR4KAp8JlJpguvYj26m1Cdw9WtZ1CI4aJl3YrDePr2E6MWZxrUpLiaxbR1MvOrjDj811oy4RemWm3jAJWhHtZRki2gMq7u2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789831147; c=relaxed/simple;
	bh=H2TRv5GUDrJOgYFHG0jG5u85F80UTNHMaLW5I8eHOv4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gb6RUrswzlc2+99Yk/puWWjDLqAg7GP39IoEUIth78uoHx1GE/03Ai/0BUt626t8WNaJTZwaKnAQ41kll3qgu+JJ3gIuM/LjZYQKJcixzz9W5HkLBFhM5gth29r2vuEIm6oQe6g+tR0H0UFrUaS1XGOAFk69ocCnSFe7LjBgp/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li; spf=pass smtp.mailfrom=gmx.li; dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b=OqG6nA+h; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.b="OqG6nA+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1789831137; x=1790435937; i=arc@gmx.li;
	bh=taIdo+PqbwTQh9kVociZXgOj82BRUkrICStCYDlLnw4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=OqG6nA+hYS/6IPDW8belcPpPhBhTPoDwcnfhzDHiP9fttwzORgFsE3c87dDDLMBP
	 vhehBEM4HSAZjULv0Fbb0xvxyAZ4znRRK8oserqc0EFH0g/XVOMQR8gZZ2+gN/uIr
	 hchh6MzDTY9iociwp75Cw4wS3a7g0JcJu0jGw9pu0JURraaZFV2BIfJ25Ib02AXr/
	 +/yXjXFQ5Wo34+/2iwzBsbwqWCqMyWh/y1KI2jN2cJWxgnkPlA615mPEVePEzHHPn
	 srMXGfmmzluTP5ArvlgABlrM300GuemmQ6y7MTOUJdnbTlixKmY5ZtzYo6w5f/5Jn
	 CiMw8gqw8DGJJhGplQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFKGZ-1x1c772rMX-00DaMB; Sat, 19
 Sep 2026 17:18:56 +0200
From: Christian Ruppert <arc@gmx.li>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Christian Ruppert <arc@gmx.li>,
	Will Porter <mrwillporter@gmail.com>,
	Peter Drabik <drabik.p@gmail.com>,
	Neil Andrews <neil@androos.io>
Subject: [PATCH 2/3] Add Audient EVO4 mixer quirks
Date: Sat, 19 Sep 2026 17:18:39 +0200
Message-ID: <20260919151840.24371-3-arc@gmx.li>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260919151840.24371-1-arc@gmx.li>
References: <20260919151840.24371-1-arc@gmx.li>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oLa8EwVX6cihb1ox8Sw15bN+p26aKfLXR1IF5PA65GGo3Nd3b+a
 FxdRdWRfx7CaRMLWEp+ZpXJgiANw07a2BNDLCKu4XutdlcvCvwNCUVH7beYNyV3rK42UaiM
 hGCLpOP55D8fAEqepGdDigtdCe6KIAeBb4rGYY1qTLj33D4u7PhxZFFrzhbGO7KU/Gl8YoD
 8AC1uN5QLZ8Ec2+lfQ9Lg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:V+4cIP35wxc=;nfRhEMQ68agSyb3WMW6XQqrlOVv
 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
 pRLd0/Oq9rwmqGbhQY8hQP/96SB+amPZQbg==

The controls enumerated by the Audient EVO4 are incomplete. Add missing
controls for
  * channel muting
  * the cross-fader
  * the recording mixer
  * phantom power

The driver is structured so that it should be trivial to extend it to the
EVO8 (and potentially other Audient devices) but we need a kind soul who
has access to that hardware to correctly map the control names and test
everything.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 MAINTAINERS              |   7 +
 sound/usb/Makefile       |   1 +
 sound/usb/mixer_evo.c    | 505 +++++++++++++++++++++++++++++++++++++++
 sound/usb/mixer_evo.h    |  12 +
 sound/usb/mixer_quirks.c |   5 +
 5 files changed, 530 insertions(+)
 create mode 100644 sound/usb/mixer_evo.c
 create mode 100644 sound/usb/mixer_evo.h

diff --git a/MAINTAINERS b/MAINTAINERS
index c2414447892c..5f8df442b1a5 100644
=2D-- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4346,6 +4346,13 @@ F:	drivers/net/ieee802154/at86rf230.h
 F:	drivers/net/ieee802154/atusb.c
 F:	drivers/net/ieee802154/atusb.h
=20
+AUDIENT EVO MIXER DRIVER
+M:	Christian Ruppert <arc@gmx.li>
+L:	linux-sound@vger.kernel.org
+S:	Maintained
+F:	sound/usb/mixer_evo.c
+F:	sound/usb/mixer_evo.h
+
 AUDIT SUBSYSTEM
 M:	Paul Moore <paul@paul-moore.com>
 M:	Eric Paris <eparis@redhat.com>
diff --git a/sound/usb/Makefile b/sound/usb/Makefile
index e62794a87e73..2e842dcc73de 100644
=2D-- a/sound/usb/Makefile
+++ b/sound/usb/Makefile
@@ -11,6 +11,7 @@ snd-usb-audio-y :=3D 	card.o \
 			helper.o \
 			implicit.o \
 			mixer.o \
+			mixer_evo.o \
 			mixer_quirks.o \
 			mixer_scarlett.o \
 			mixer_scarlett2.o \
diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_evo.c
new file mode 100644
index 000000000000..c327b82c8d2d
=2D-- /dev/null
+++ b/sound/usb/mixer_evo.c
@@ -0,0 +1,505 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Audient EVO driver for ALSA
+ * Copyright (C) 2026 Christian Ruppert <arc@gmx.li>
+ *
+ * Based on the work of Ivan Hazucha for audient-evo-py.
+ * https://github.com/vanzaho/audient-evo-py/
+ */
+
+
+#include <asm/byteorder.h>
+#include <linux/usb.h>
+#include <linux/usb/audio-v2.h>
+#include <linux/slab.h>
+#include <sound/core.h>
+#include <sound/control.h>
+
+#include "usbaudio.h"
+#include "mixer.h"
+#include "mixer_quirks.h"
+#include "helper.h"
+#include "mixer_evo.h"
+
+
+enum snd_evo_type {
+	SND_EVO_TYPE_MONITOR =3D 0,
+	SND_EVO_TYPE_PHANTOM,
+	SND_EVO_TYPE_MUTE,
+	SND_EVO_TYPE_MUTE_OUT,
+	SND_EVO_TYPE_MIXER,
+	SND_EVO_TYPE_NCTYPES
+};
+
+static const struct snd_evo_ctrl_type {
+	snd_ctl_elem_type_t type;
+	bool invert;
+	union {
+		int integer;
+	} min;
+	union {
+		int integer;
+	} max;
+	u16 wValue;
+	u16 wIndex;
+} snd_evo_ctypes[SND_EVO_TYPE_NCTYPES] =3D {
+	[SND_EVO_TYPE_MONITOR] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.min.integer =3D 0,
+		.max.integer =3D 127,
+		.wValue =3D 0x0000,
+		.wIndex =3D 0x3800,
+	},
+	[SND_EVO_TYPE_PHANTOM] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.invert =3D false,
+		.min.integer =3D 0,
+		.max.integer =3D 1,
+		.wValue =3D 0x0000,
+		.wIndex =3D 0x3A00,
+	},
+	[SND_EVO_TYPE_MUTE] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.invert =3D true,
+		.min.integer =3D 0,
+		.max.integer =3D 1,
+		.wValue =3D 0x0200,
+		.wIndex =3D 0x3A00,
+	},
+	[SND_EVO_TYPE_MUTE_OUT] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
+		.invert =3D true,
+		.min.integer =3D 0,
+		.max.integer =3D 1,
+		.wValue =3D 0x0100,
+		.wIndex =3D 0x3B00,
+	},
+	[SND_EVO_TYPE_MIXER] =3D {
+		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.min.integer =3D -128 * 256,
+		.max.integer =3D 6 * 256,
+		.wValue =3D 0x0100,
+		.wIndex =3D 0x3C00,
+	},
+};
+
+#define SND_EVO_FLAGS_DIRECTION (1L<<0)
+#define SND_EVO_FLAGS_CAPTURE (1L<<0)
+#define SND_EVO_FLAGS_PLAYBACK (0L<<0)
+
+struct snd_evo_ctrl {
+	char *basename;
+	enum snd_evo_type type;
+	unsigned int channels;
+	unsigned int hwchannels;
+	unsigned int val_offs;
+	unsigned long flags;
+};
+
+static const struct snd_evo_ctrl evo4_controls[] =3D {
+	{
+		.basename =3D "Master",
+		.type =3D SND_EVO_TYPE_MUTE_OUT,
+		.channels =3D 1,
+		.hwchannels =3D 1,
+		.val_offs =3D 0,
+		.flags =3D SND_EVO_FLAGS_PLAYBACK,
+	},
+	{
+		.basename =3D "Mic",
+		.type =3D SND_EVO_TYPE_MUTE,
+		.channels =3D 4,
+		.hwchannels =3D 2,
+		.val_offs =3D 0,
+		.flags =3D SND_EVO_FLAGS_PLAYBACK,
+	},
+	{
+		.basename =3D "Monitor",
+		.type =3D SND_EVO_TYPE_MONITOR,
+		.channels =3D 1,
+		.hwchannels =3D 1,
+		.val_offs =3D 0,
+		.flags =3D SND_EVO_FLAGS_PLAYBACK,
+	},
+	{
+		.basename =3D "Mic 1",
+		.type =3D SND_EVO_TYPE_MIXER,
+		.channels =3D 2,
+		.hwchannels =3D 2,
+		.val_offs =3D 0,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Mic 2",
+		.type =3D SND_EVO_TYPE_MIXER,
+		.channels =3D 2,
+		.hwchannels =3D 2,
+		.val_offs =3D 2,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Master Left",
+		.type =3D SND_EVO_TYPE_MIXER,
+		.channels =3D 2,
+		.hwchannels =3D 2,
+		.val_offs =3D 4,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Master Right",
+		.type =3D SND_EVO_TYPE_MIXER,
+		.channels =3D 2,
+		.hwchannels =3D 2,
+		.val_offs =3D 6,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Loopback Left",
+		.type =3D SND_EVO_TYPE_MIXER,
+		.channels =3D 2,
+		.hwchannels =3D 2,
+		.val_offs =3D 8,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Loopback Right",
+		.type =3D SND_EVO_TYPE_MIXER,
+		.channels =3D 2,
+		.hwchannels =3D 2,
+		.val_offs =3D 10,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Mic 1 Phantom",
+		.type =3D SND_EVO_TYPE_PHANTOM,
+		.channels =3D 1,
+		.hwchannels =3D 1,
+		.val_offs =3D 0,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{
+		.basename =3D "Mic 2 Phantom",
+		.type =3D SND_EVO_TYPE_PHANTOM,
+		.channels =3D 1,
+		.hwchannels =3D 1,
+		.val_offs =3D 1,
+		.flags =3D SND_EVO_FLAGS_CAPTURE,
+	},
+	{ 0 }, /* sentinel */
+};
+
+static const struct evo_devinfo {
+	u32 usb_id;
+	const struct snd_evo_ctrl *controls;
+} evo_devinfo[] =3D {
+	{
+		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
+		.controls =3D evo4_controls,
+	},
+	{
+		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
+		.controls =3D NULL,
+	},
+	{ 0 } /* sentinel */
+};
+
+
+static inline unsigned long snd_evo_kctl_priv(enum snd_evo_type type,
+					      u8 valoffs, u8 hwchannels)
+{
+	unsigned long type_l =3D type & 0xFF;
+	unsigned long valoffs_l =3D valoffs & 0xFF;
+	unsigned long hwchannels_l =3D hwchannels & 0xFF;
+
+	return (hwchannels_l << 16) | (valoffs_l << 8) | type_l;
+}
+
+static __always_inline
+const struct snd_evo_ctrl_type *snd_evo_kctl_type(struct snd_kcontrol *kc=
tl)
+{
+	return &snd_evo_ctypes[kctl->private_value & 0xFF];
+}
+
+static __always_inline u16 snd_evo_kctl_valoffs(struct snd_kcontrol *kctl=
)
+{
+	return (kctl->private_value >> 8) & 0xFF;
+}
+
+static __always_inline u16 snd_evo_kctl_hwchannels(struct snd_kcontrol *k=
ctl)
+{
+	return (kctl->private_value >> 16) & 0xFF;
+}
+
+static inline u16 snd_evo_kctl_channels(struct snd_kcontrol *kctl)
+{
+	struct usb_mixer_elem_info *info =3D kctl->private_data;
+
+	return info->channels;
+}
+
+
+#define EVO_REQ_CUR (0x01)
+#define EVO_REQTYPE_SET (USB_DIR_OUT | USB_TYPE_CLASS | USB_RECIP_INTERFA=
CE)
+#define EVO_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS | USB_RECIP_INTERFA=
CE)
+
+static inline int snd_evo_get_cur(struct usb_mixer_interface *mixer,
+				  u16 value, u16 index,
+				  void *buf, size_t len)
+{
+	struct usb_device *const dev =3D mixer->chip->dev;
+
+	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+			       EVO_REQ_CUR, EVO_REQTYPE_GET,
+			       value, index, buf, len);
+}
+
+static inline int snd_evo_set_cur(struct usb_mixer_interface *mixer,
+				  u16 value, u16 index,
+				  void *buf, size_t len)
+{
+	struct usb_device *const dev =3D mixer->chip->dev;
+
+	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+			       EVO_REQ_CUR, EVO_REQTYPE_SET,
+			       value, index, buf, len);
+}
+
+
+static int snd_ctl_evo_boolean_get(struct snd_kcontrol *kctl,
+				   struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_list *const list =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D list->mixer;
+
+	const unsigned int nchan =3D snd_evo_kctl_channels(kctl);
+	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
+	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const u16 index =3D ctype->wIndex;
+
+	int i;
+
+	for (i =3D 0; i < hwchan; i++) {
+		u32 buf;
+		int ret;
+
+		ret =3D snd_evo_get_cur(mixer, value + i, index,
+				      &buf, sizeof(buf));
+		if (ret < 0)
+			return ret;
+
+		ctl_val->value.integer.value[i] =3D le32_to_cpu(buf) ? 1 : 0;
+
+		if (ctype->invert)
+			ctl_val->value.integer.value[i] ^=3D 0x1;
+	}
+
+	for (; i < nchan; i++)
+		ctl_val->value.integer.value[i] =3D ctype->invert
+							? ctype->max.integer
+							: ctype->min.integer;
+
+	return 0;
+}
+
+static int snd_ctl_evo_boolean_set(struct snd_kcontrol *kctl,
+				   struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer =3D list->mixer;
+
+	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
+	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const u16 index =3D ctype->wIndex;
+
+	int changed =3D 0;
+	int i;
+
+	for (i =3D 0; i < hwchan; i++) {
+		u32 rbuf;
+		u32 buf =3D cpu_to_le32(ctl_val->value.integer.value[i] ? 1 : 0);
+		int ret;
+
+		if (ctype->invert)
+			buf ^=3D 0x1;
+
+		ret =3D snd_evo_get_cur(mixer, value + i, index,
+				      &rbuf, sizeof(rbuf));
+		if (ret < 0)
+			return ret;
+
+		if (rbuf !=3D buf) {
+			changed =3D 1;
+
+			ret =3D snd_evo_set_cur(mixer, value + i, index,
+					      &buf, sizeof(buf));
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return changed;
+}
+
+static int snd_ctl_evo_integer_get(struct snd_kcontrol *kctl,
+				   struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_list *const list =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *const mixer =3D list->mixer;
+
+	const unsigned int nchan =3D snd_evo_kctl_channels(kctl);
+	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
+	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const u16 index =3D ctype->wIndex;
+
+	int i;
+
+	for (i =3D 0; i < hwchan; i++) {
+		u16 buf;
+		s16 val;
+		int ret;
+
+		ret =3D snd_evo_get_cur(mixer, value + i, index,
+				      &buf, sizeof(buf));
+		if (ret < 0)
+			return ret;
+
+		val =3D le16_to_cpu(buf);
+		ctl_val->value.integer.value[i] =3D val;
+	}
+
+	for (; i < nchan; i++)
+		ctl_val->value.integer.value[i] =3D ctype->min.integer;
+
+	return 0;
+}
+
+static int snd_ctl_evo_integer_set(struct snd_kcontrol *kctl,
+				   struct snd_ctl_elem_value *ctl_val)
+{
+	struct usb_mixer_elem_list *list =3D snd_kcontrol_chip(kctl);
+	struct usb_mixer_interface *mixer =3D list->mixer;
+
+	const unsigned int hwchan =3D snd_evo_kctl_hwchannels(kctl);
+	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
+	const u16 value =3D ctype->wValue + snd_evo_kctl_valoffs(kctl);
+	const u16 index =3D ctype->wIndex;
+
+	int changed =3D 0;
+	int i;
+
+	for (i =3D 0; i < hwchan; i++) {
+		s16 rbuf;
+		s16 buf =3D cpu_to_le16(ctl_val->value.integer.value[i]);
+		int ret;
+
+		ret =3D snd_evo_get_cur(mixer, value + i, index,
+				      &rbuf, sizeof(rbuf));
+		if (ret < 0)
+			return ret;
+
+		if (rbuf !=3D buf) {
+			changed =3D 1;
+
+			ret =3D snd_evo_set_cur(mixer, value + i, index,
+					      &buf, sizeof(buf));
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	return changed;
+}
+
+static int snd_ctl_evo_info(struct snd_kcontrol *kctl,
+			    struct snd_ctl_elem_info *uinfo)
+{
+	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
+
+	uinfo->type =3D ctype->type;
+	uinfo->access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
+			| SNDRV_CTL_ELEM_ACCESS_VOLATILE;
+	uinfo->count =3D snd_evo_kctl_channels(kctl);
+	uinfo->value.integer.min =3D ctype->min.integer;
+	uinfo->value.integer.max =3D ctype->max.integer;
+	return 0;
+}
+
+
+static int snd_evo_add_ctrl(struct usb_mixer_interface *mixer,
+			    const struct snd_evo_ctrl *ctrl)
+{
+	const struct snd_evo_ctrl_type *ctype =3D &snd_evo_ctypes[ctrl->type];
+	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
+	struct snd_kcontrol_new knew =3D { 0 };
+	struct snd_kcontrol *kctl;
+	struct usb_mixer_elem_info *elem;
+
+	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
+	knew.name =3D name;
+	knew.info =3D snd_ctl_evo_info;
+	knew.private_value =3D snd_evo_kctl_priv(ctrl->type, ctrl->val_offs,
+					       ctrl->hwchannels);
+
+	switch (ctype->type) {
+	case SNDRV_CTL_ELEM_TYPE_INTEGER:
+		knew.get =3D snd_ctl_evo_integer_get;
+		knew.put =3D snd_ctl_evo_integer_set;
+		break;
+	case SNDRV_CTL_ELEM_TYPE_BOOLEAN:
+		knew.get =3D snd_ctl_evo_boolean_get;
+		knew.put =3D snd_ctl_evo_boolean_set;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
+		 ((ctrl->flags & SND_EVO_FLAGS_DIRECTION)
+			=3D=3D SND_EVO_FLAGS_CAPTURE) ? "Capture" : "Playback",
+		 (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN)
+			? "Switch" : "Volume");
+
+	elem =3D kzalloc_obj(*elem);
+	if (!elem)
+		return -ENOMEM;
+
+	elem->head.mixer =3D mixer;
+	elem->channels =3D ctrl->channels;
+
+	kctl =3D snd_ctl_new1(&knew, elem);
+	if (!kctl) {
+		kfree(elem);
+		return -ENOMEM;
+	}
+
+	kctl->private_free =3D snd_usb_mixer_elem_free;
+
+	return snd_usb_mixer_add_control(&elem->head, kctl);
+}
+
+
+/* called from mixer_quirks.c */
+int snd_evo_controls_create(struct usb_mixer_interface *mixer)
+{
+	const struct evo_devinfo *info;
+	const struct snd_evo_ctrl *ctrl;
+
+	for (info =3D evo_devinfo; info->controls; info++)
+		if (info->usb_id =3D=3D mixer->chip->usb_id)
+			break;
+
+	if (!info->controls)
+		return -ENODEV;
+
+	for (ctrl =3D info->controls; ctrl->basename; ctrl++) {
+		const int ret =3D snd_evo_add_ctrl(mixer, ctrl);
+
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
diff --git a/sound/usb/mixer_evo.h b/sound/usb/mixer_evo.h
new file mode 100644
index 000000000000..7fe7e197185c
=2D-- /dev/null
+++ b/sound/usb/mixer_evo.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __USB_MIXER_EVO_H
+#define __USB_MIXER_EVO_H
+
+#include "mixer.h"
+
+#define USB_AUDIENT_VID (0x2708)
+#define USB_EVO4_PID (0x0006)
+
+int snd_evo_controls_create(struct usb_mixer_interface *mixer);
+
+#endif /* __USB_MIXER_EVO_H */
diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index fc622eb95dc5..1e266fdbbb8e 100644
=2D-- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -38,6 +38,7 @@
 #include "mixer_scarlett2.h"
 #include "mixer_us16x08.h"
 #include "mixer_s1810c.h"
+#include "mixer_evo.h"
 #include "helper.h"
 #include "fcp.h"
=20
@@ -4539,6 +4540,10 @@ int snd_usb_mixer_apply_create_quirk(struct usb_mix=
er_interface *mixer)
 		err =3D snd_fcp_init(mixer);
 		break;
=20
+	case USB_ID(USB_AUDIENT_VID, USB_EVO4_PID): /* Audient EVO 4 */
+		err =3D snd_evo_controls_create(mixer);
+		break;
+
 	case USB_ID(0x041e, 0x323b): /* Creative Sound Blaster E1 */
 		err =3D snd_soundblaster_e1_switch_create(mixer);
 		break;
=2D-=20
2.55.0

