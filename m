Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579587;
	b=MrZJ49ML0JIoc8ba6rwauYel99GJkiEwYbUNtXDLAodBNtEX6d96hOnCHnRN8nS2Ojmz
	 TJeHKQv/gAQOiwLMV9VsotOI9pGrqG+v8RK4HWjJxi5u+hYBcwvCIWvJ6pMGn9WHoWjcX
	 hqWkGPsBSOQoDTaVCOzuzBg0ukFAP+KQQEo7Sl0d7O9KgRFLHCxNuI2upipzq/BgmLwKU
	 XE5cwJhRZwUA+lfAvW+k71/NIWYXgghRtcQJUUl7B/64EBbhw/vMTGmVV49pGKTkHTqzb
	 GcuHA/hBn1ExQSod5iUpACdZQKWGQ7yc8k0WYZH0BB5bFgT3e1jHJYiWi8WGFp+KICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579587;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=5RDpGdIQgah5Ixw1/c0g00ovk2fg3mXUZdinV9742ak=;
	b=4ibn9c1TDP90FVnEYx/r/0LUVR+gwchMOW5fi5y/E5UNyXddq885l/9MWzpwPfBnH84+
	 r16G44qNdl7/hfq4bnQsUnTFiD4CbuvU5/+x2kdiFjYH6hdH0JEae/N2eiSyEJX/g5M95
	 T0HOEAZTQCQ1mlzgM3PegylrFWkbAdwauHJuKdHZXzpme8Mcjx4pN1RWPUj1JLOeoA1r4
	 hfmMNScD4Wnr9TxwbOoYjQGDW0Rcr8Uh8iagbKy1QpBqMgi26dqkYP10IQPVKPEwRcx1v
	 STxNyWmvssHObNRbngu36R9tofbbVSpQUMNEX1c0rEuYyTYWg+yNXp6cgwrDcEmTIHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=pLNxjPNW;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72B5E606A32E;
	Mon,  2 Nov 2026 00:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72B5E606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=pLNxjPNW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579584; x=1794184384; i=arc@gmx.li;
	bh=5RDpGdIQgah5Ixw1/c0g00ovk2fg3mXUZdinV9742ak=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=pLNxjPNWYYyJ+IZroE6eatU8Fmoi9eL0k5pbPGYTYcYPOposegLpn0Gx/34+Zw9d
	 PbF9Zd/Rk5EzkQ+0o2+PqDxafZ2JccbOJ32wxgpHDoCtcl0iQfeYl7kI/4VbN+60M
	 rov0LI3tuo1ZjGfMv9XyRn0yjrPlLoGRbnqIaMTHgXV/UOz9kAVCVO+7UjyHbFJXg
	 gMocfPCUBIpPFxUPrcRGgLVwu6otqH+XfEItLGwDkzRIc96xYvlKbqXVKkGyjH5Mt
	 xovKTgsKesP8wYdeJTQrEzV8zlHcCYJU+OMwhGIbG3xpP08fNtOGhHvVYDNUiAjiG
	 4brplVBMQzCogdRJyg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhjF-1wamYr1Mtl-016hgU; Mon, 02
 Nov 2026 01:33:04 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 05/11] ALSA: mixer_audient: make USB control transfer size configurable
Date: Mon,  2 Nov 2026 01:32:51 +0100
Message-ID: <20261102003257.10134-6-arc@gmx.li>
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
X-Provags-ID: V03:K1:y/X2g8u69sMWQgct0zzZAKC/keBGG9XeWXQi6rP3HkYiLFs3KJo
 KzIN2lNtAU0M1RaYBxvlCZAyUgr6/Xow7HcP0SGmL1BD0an8GRvzipijvYA7mwJTV+2SXGf
 K3VvTZELFHeItXXHbJJCwQaAjSBN743QRAnD8EOPr2JjjK0sbWqnssCYzLZW2uPuSKGWjnU
 78hChnA50QBXZkhxIDxCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:339T9ioDznE=;K8FjCW5jqkHw/+ArWpygIlbX562
 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

Previously, the USB transfer size was hardcoded in the datatype get/set
functions. Make it configurable in the ctype structure in preparation of
new control types for the id14.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 131 ++++++++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 47 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 1f3744a7c10a..57d856d25271 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -12,6 +12,8 @@
 #include <linux/usb.h>
 #include <linux/usb/audio-v2.h>
 #include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/bitops.h>
 #include <sound/core.h>
 #include <sound/control.h>
 #include <sound/tlv.h>
@@ -35,8 +37,12 @@ enum snd_audient_type {
 /* Mixer matrix: -128dB (mute) to +6dB */
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
+#define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
+	unsigned long flags;
+	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
 	bool invert;
 	union {
 		int integer;
@@ -50,6 +56,7 @@ static const struct snd_audient_ctrl_type {
 } snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] =3D {
 	[SND_AUDIENT_TYPE_MONITOR] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.len =3D 2,
 		.min.integer =3D 0,
 		.max.integer =3D 127,
 		.unit =3D 0x38,
@@ -59,6 +66,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D false,
+		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.unit =3D 0x3A,
@@ -67,6 +75,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
+		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.unit =3D 0x3A,
@@ -75,6 +84,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE_OUT] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
+		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.unit =3D 0x3B,
@@ -82,6 +92,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.len =3D 2,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
 		.unit =3D 0x3C,
@@ -236,44 +248,91 @@ static inline u16 snd_audient_kctl_channels(struct s=
nd_kcontrol *kctl)
 #define U8_U8(HI, LO) ((((u16)(HI)) << 8) | ((LO) & 0xFF))
=20
 static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
-				      const u8 unit, const u8 sel,
-				      const u8 cidx,
-				      void *const buf, const size_t len)
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, void *const buf)
 {
 	struct usb_device *const dev =3D mixer->chip->dev;
-	const u16 value =3D U8_U8(sel, cidx);
-	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
+	const u16 value =3D U8_U8(ctype->sel, cidx);
+	const u16 index =3D U8_U8(ctype->unit,
+				mixer->hostif->desc.bInterfaceNumber);
=20
 	const int ret =3D snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-					value, index, buf, len);
+					value, index, buf, ctype->len);
=20
-	if ((ret >=3D 0) && (ret !=3D len))
+	if ((ret >=3D 0) && (ret !=3D ctype->len))
 		return -EIO;
=20
 	return ret;
 }
=20
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
-				      const u8 unit, const u8 sel,
-				      const u8 cidx,
-				      void *const buf, const size_t len)
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, void *const buf)
 {
 	struct usb_device *const dev =3D mixer->chip->dev;
-	const u16 value =3D U8_U8(sel, cidx);
-	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
+	const u16 value =3D U8_U8(ctype->sel, cidx);
+	const u16 index =3D U8_U8(ctype->unit,
+				mixer->hostif->desc.bInterfaceNumber);
=20
 	const int ret =3D snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-					value, index, buf, len);
+					value, index, buf, ctype->len);
=20
-	if ((ret >=3D 0) && (ret !=3D len))
+	if ((ret >=3D 0) && (ret !=3D ctype->len))
 		return -EIO;
=20
 	return ret;
 }
=20
=20
+static int snd_audient_raw_get_one(struct usb_mixer_interface *const mixe=
r,
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, u32 *const value)
+{
+	int ret;
+	__le32 buf =3D 0;
+	s32 val;
+
+	ret =3D snd_audient_get_cur(mixer, ctype, cidx, &buf);
+	if (ret < 0)
+		return ret;
+
+	val =3D le32_to_cpu(buf);
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_SIGNED)
+		val =3D sign_extend32(val, 8 * ctype->len - 1);
+
+	*value =3D val;
+
+	return ret;
+}
+
+static int snd_audient_raw_set_one(struct usb_mixer_interface *const mixe=
r,
+			const struct snd_audient_ctrl_type *const ctype,
+			const u8 cidx, const u32 value)
+{
+	int ret;
+	u32 val;
+
+	ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &val);
+	if (ret < 0)
+		return ret;
+
+	if (val !=3D value) {
+		__le32 buf =3D cpu_to_le32(value);
+
+		ret =3D snd_audient_set_cur(mixer, ctype, cidx, &buf);
+		if (ret < 0)
+			return ret;
+
+		return 1;
+	}
+
+	return 0;
+}
+
+
 static int snd_ctl_audient_boolean_get(struct snd_kcontrol *kctl,
 				       struct snd_ctl_elem_value *ctl_val)
 {
@@ -296,12 +355,11 @@ static int snd_ctl_audient_boolean_get(struct snd_kc=
ontrol *kctl,
 		u32 buf;
 		int ret;
=20
-		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &buf, sizeof(buf));
+		ret =3D snd_audient_raw_get_one(mixer, ctype, base + i, &buf);
 		if (ret < 0)
 			return ret;
=20
-		ctl_val->value.integer.value[i] =3D le32_to_cpu(buf) ? 1 : 0;
+		ctl_val->value.integer.value[i] =3D buf ? 1 : 0;
=20
 		if (ctype->invert)
 			ctl_val->value.integer.value[i] ^=3D 0x1;
@@ -334,27 +392,18 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
ontrol *kctl,
 		return pm.err;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		u32 rbuf;
-		u32 buf =3D cpu_to_le32(ctl_val->value.integer.value[i] ? 1 : 0);
+		u32 buf =3D ctl_val->value.integer.value[i] ? 1 : 0;
 		int ret;
=20
 		if (ctype->invert)
-			buf ^=3D cpu_to_le32(0x1);
+			buf ^=3D 0x1;
=20
-		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &rbuf, sizeof(rbuf));
+		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, buf);
 		if (ret < 0)
 			return ret;
=20
-		if (rbuf !=3D buf) {
+		if (ret)
 			changed =3D 1;
-
-			ret =3D snd_audient_set_cur(mixer, ctype->unit,
-						  ctype->sel, base + i,
-						  &buf, sizeof(buf));
-			if (ret < 0)
-				return ret;
-		}
 	}
=20
 	return changed;
@@ -379,16 +428,13 @@ static int snd_ctl_audient_integer_get(struct snd_kc=
ontrol *kctl,
 		return pm.err;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		u16 buf;
-		s16 val;
+		s32 val;
 		int ret;
=20
-		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &buf, sizeof(buf));
+		ret =3D snd_audient_raw_get_one(mixer, ctype, base + i, &val);
 		if (ret < 0)
 			return ret;
=20
-		val =3D le16_to_cpu(buf);
 		ctl_val->value.integer.value[i] =3D val;
 	}
=20
@@ -417,24 +463,15 @@ static int snd_ctl_audient_integer_set(struct snd_kc=
ontrol *kctl,
 		return pm.err;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		s16 rbuf;
-		s16 buf =3D cpu_to_le16(ctl_val->value.integer.value[i]);
+		s32 val =3D ctl_val->value.integer.value[i];
 		int ret;
=20
-		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
-					  base + i, &rbuf, sizeof(rbuf));
+		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, val);
 		if (ret < 0)
 			return ret;
=20
-		if (rbuf !=3D buf) {
+		if (ret)
 			changed =3D 1;
-
-			ret =3D snd_audient_set_cur(mixer, ctype->unit,
-						  ctype->sel, base + i,
-						  &buf, sizeof(buf));
-			if (ret < 0)
-				return ret;
-		}
 	}
=20
 	return changed;
=2D-=20
2.56.0

