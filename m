Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491257;
	b=sr0ZkxH9tS+Tbu/xFYV9gyxskYGioiLu4/xyBaQcbi6OouTDhj922YYrxjCOQWuHGDXO
	 QsyY/krdIsUXtDbT21YeotDl2CuoobsqgHJMCTKYZH3ESt1q27muQUplP0H3bGipL0lQE
	 WQ4pKOo8NPjNtTDo5mjtNCsVq38zzfpzWbBSEnf0C4uu1+vZmCKS1kDSVrtmOWnaZkjxu
	 Posnd8MHoxqgdTnnlULDLhM37izRGVN3ONOjqir9zbHJGoFR6lO6UfZ/g1kQTZp6OxeQ7
	 mmxO0oB+1py1TwHgUUFeIGYbyXtbQJF+GzfaWqOzKGsRcc+pdxGzU2bb+qfHtuUz3yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491257;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=1b5yNXqrTTdMWlumVzsUGlcUeBRGRHcScfZNzvYjUP0=;
	b=OW0SHCZdluAUqt3dWn9bxAlk0JeuRdcT4SVugg6DEIS/zR5/IFxDqyxZ+/i/pIDqJ0GV
	 oZnQOUcQMtEogOiR9k9e0Y3nl0qh55YlrJMilQblChaILV3IGAqpOd54h/lEYLL+a3w50
	 FwgC+kmEDS0dQwDa43IbraZWphDragLXsSe70GvtyKYBz+9qyYq/ZmOL6+h7mhVbZgsks
	 bLDiBMFEPByf4rGn3TQZe84/duTCwrbGu1RoS3K1wjXM/GWz50NzKN1YUuxsluDVo+Tup
	 7HdHcIcKN0F+YFWGGaN38yDMULdr3nsnDhHYOkkKjJcJvyQwrFxi3K9Fjbt9A8fycrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Z05JCFbK;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6FEF60A2624;
	Sun,  1 Nov 2026 00:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6FEF60A2624
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Z05JCFbK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491244; x=1794096044; i=arc@gmx.li;
	bh=1b5yNXqrTTdMWlumVzsUGlcUeBRGRHcScfZNzvYjUP0=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Z05JCFbKAVc4FR4OdK6I5xKed5/8bBKAiJam6gze9xfoY6bZpk5f6XQEFXgRxR/i
	 JZglo8zX+kRSOo7DT9PP1/NsSrF+YtIGAlmHrHL5pXeaEeQvKjZ2neAGfBybkmEOS
	 cSc9mwbbwEJ+Ta/MBVHKhku7urDdxUsKVM/T3G6me42WL2se92xNBFSeW5pwrzfpQ
	 y2QamM2EXRo83pVOoxVs/skSgu6oh4YrtM1lamUFPNtKiQ4qNpXtbHdgdZAGOcUBp
	 DEFd5TJ8uF8b7drf5p1awhv3mXNifcWmhQBo5oqoVqAWQtTCcYJsCxwn5tzJeqifW
	 5FiX8Yv6G2tt3gryZw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M72oB-1xSYrb1ncl-00F9S4; Sun, 01
 Nov 2026 01:00:44 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 05/11] ALSA: mixer_audient: make USB control transfer size configurable
Date: Sun,  1 Nov 2026 01:00:07 +0100
Message-ID: <20261101000013.11880-6-arc@gmx.li>
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
X-Provags-ID: V03:K1:we73wlisR5pxI+oYZy7Y0OMkVSFIaQ5DAvtQrVE24Ua+EA66ASR
 R8HJICV7SlMPIWTyoifvqJdu3U4QPIdkNEKlsRxns5szXw5/Y8wAxX/+AdDCdiRXOqmo5D1
 dreMA+T3GHdMQ1+sLn73vUY6ezXLBnF1x6x656611P+FkKcG+AtLA1oolcfXEXashPL4UA8
 Dg/Y7Mla04/ji5MzuHh1A==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:8NHpaAc8hu8=;g7kCCkoNc2bxD9LrAd86ax9WmlV
 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

Previously, the USB transfer size was hardcoded in the datatype get/set
functions. Make it configurable in the ctype structure in preparation of
new control types for the id14.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 130 ++++++++++++++++++++++++--------------
 1 file changed, 83 insertions(+), 47 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 24d2f7a0bdc2..1438cc192d34 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -35,8 +35,12 @@ enum snd_audient_type {
 /* Mixer matrix: -128dB (mute) to +6dB */
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
+#define SND_AUDIENT_CTYPE_FLAGS_SIGNED		(1L <<  0)
+
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
+	unsigned long flags;
+	size_t len;
 	bool invert;
 	union {
 		int integer;
@@ -50,6 +54,7 @@ static const struct snd_audient_ctrl_type {
 } snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] =3D {
 	[SND_AUDIENT_TYPE_MONITOR] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.len =3D 2,
 		.min.integer =3D 0,
 		.max.integer =3D 127,
 		.unit =3D 0x38,
@@ -59,6 +64,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D false,
+		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.unit =3D 0x3A,
@@ -67,6 +73,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
+		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.unit =3D 0x3A,
@@ -75,6 +82,7 @@ static const struct snd_audient_ctrl_type {
 	[SND_AUDIENT_TYPE_MUTE_OUT] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
+		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
 		.unit =3D 0x3B,
@@ -82,6 +90,8 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
+		.flags =3D SND_AUDIENT_CTYPE_FLAGS_SIGNED,
+		.len =3D 2,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
 		.unit =3D 0x3C,
@@ -236,44 +246,92 @@ static inline u16 snd_audient_kctl_channels(struct s=
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
+	s32 buf =3D 0;
+
+	ret =3D snd_audient_get_cur(mixer, ctype, cidx, &buf);
+	if (ret < 0)
+		return ret;
+
+	buf =3D le32_to_cpu(buf);
+
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_SIGNED) {
+		const unsigned int sh =3D 32 - 8 * ctype->len;
+
+		buf =3D (buf << sh) >> sh;
+	}
+
+	*value =3D buf;
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
+	u32 buf;
+
+	ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &buf);
+	if (ret < 0)
+		return ret;
+
+	if (buf !=3D value) {
+		buf =3D cpu_to_le32(value);
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
@@ -296,12 +354,11 @@ static int snd_ctl_audient_boolean_get(struct snd_kc=
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
@@ -334,27 +391,18 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
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
@@ -379,16 +427,13 @@ static int snd_ctl_audient_integer_get(struct snd_kc=
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
@@ -417,24 +462,15 @@ static int snd_ctl_audient_integer_set(struct snd_kc=
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

