Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779027;
	b=yYzXNVM4MvT5PKrl/uCV74YoHIYM6R61Earv1Z+5CtoLGfcpc4QDhEuHdDaZHETP4FfT
	 6u0t6fFoD/7l6NbO4Xud0KnqfO0Q0J+w9voiJ8EBLG6UnUqjNlNGwEUVxysim4mNzyN0e
	 K3gbORi11kQIzTQ6gNY0PfRrNTolGIgWHD5/oTw8vfSsyb7e/UUS/HLBJVtAyWJp0+5Jo
	 JoB2StwUeZAkIrp9g3J1MAzjCg5eMyezVEyXJBMMd3Wa3gfLX75reQIXLeOp19ACO3cxq
	 QuYV1iR9gEcprQEURhR6hc7VwjPijhfj9juzvfJhhV7EKZAoqx7V1uqPBHskrFbBTeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779027;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=N9B0vPKiwHC6unPL1I7OYpnAWJjMnynIFSlFKGQ+PXs=;
	b=HV+uyI21irSh+uE6RIZaOdbjoo1+pyHx6UyaIe6BGsmuFQMA1aCyRQfATTgf3wNyy7Pz
	 tw2Yo3uIsHtEtsHXfPpbxJ6AzRxJRMK8ursHxX9IB3601VIYlmhObLz/QbH4TLeDd1fkK
	 raq5zLV8h4ict8Hywb/KWQx+38TMhhpbKlkIkHZBrRK1DCjb0M5vMS7K2azyAtKFR1EMx
	 TxdX8nVS1tTWGDdAWb98bybVrZzZlJg8u/lTbwnTcOCijIDlbUQ8R0QHfowLnTnI0HQ4L
	 2Woo8MiynPB9nW78M6E2n/v6E0ke3QHPPvJMm8p8nzPACbUsr16ODrB5dYsykI3HvNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=INQzo9Q8;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2DC7606A336
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D2DC7606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=INQzo9Q8
DKIM2-Signature:  i=1; m=1; t=1794779025;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:UETjYFI/OD/7tpOIo3iwFMmVGoLx
   IJgQwiatVy8tv+s0V7pcacTUuvM+sIwiDUkmc1i+LUsik+4sOvAFQ2kOyB5bvZ2BShe/mUQoWB5
   4UIIjJccpoATHgGe1zKVAkrkEyrnq75SPP4jLW4GJCKdXeqJRUijq8aYCsh26GoBIrCL+NrxxCT
   WxbpzVmSDfSfbysjtmmeItGMYxegl64H6ymT4EOECjK1mYPHTj0vIjtH+9xFtknMEbvMQA38ivA
   ak6QCRWuLDlL9Qn5ZYvPyvfzIk04z0cIUnIiLLnapxTIOm32dENarTHzIXVpXvKIETem6b9etKs
   18D4G3xbUZVUZw==;
Message-Instance:  m=1;
 h=sha256:
   +qM4ytAUSBbXvUFeMHfajy8T421ZFQnSdbMR6fVMwqE=:
   KlbEFiawU5jJjumrhSafGyZva3DDYkf6CXDvTRgD2Cs=,
  sha512:
   9uB7Vez2gq6sjl4jCZ5ZGJZfzuxw7RH+anOZcPDdSxBfFL4FdUskMkvZraaozbnQcrB6X/WAhWM3maRIdNMchg==:
   H18gyP4V9UlDRwLtxPQDLtk3O2q5yWjrATJOjVChlADf+k7YdSvxpbalPSej87XF+brDLpv9sPxlmfkXCiahNA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779024; x=1795383824; i=arc@gmx.li;
	bh=N9B0vPKiwHC6unPL1I7OYpnAWJjMnynIFSlFKGQ+PXs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=INQzo9Q8y+5pYZtv04ri9ORipBYfKj4e0cIBzgF8FAS9STL4ZOmtw1KKVULHVuFm
	 uA6HFoDpXZ7gELbzO+onu1Bp3GZnLPXyOJ9BqLQfxMqyUQ4Ji8Ag4LZgYiX3CPU5M
	 nOi1ay99dphdt6ZtLQ/Eg1jpQdgf0lxxi+tQGj1ZXtphmB3hQ0/qUZjnaW/4heOfh
	 XmFFCkDRtR0rAhLjBZpdc1RqYkyjLoCX/Blbjp2XCTISsPdcr+uJahOQBOfsJ7WXd
	 b3uMRdBaPxWzgyp859WeZxxAU5NKLkxEd1AjD8612Igjzit1CWcJg6twGizHdD9t4
	 PmwILor+jjhH2Vsl+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MulmF-1wbq8x0wOB-00sX3l; Sun, 15
 Nov 2026 22:43:44 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 05/19] ALSA: mixer_audient: make USB control transfer size configurable
Date: Sun, 15 Nov 2026 22:43:22 +0100
Message-ID: <20261115214336.17917-6-arc@gmx.li>
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
X-Provags-ID: V03:K1:ruJlh11IVjPFNxs3UEaKuNcrFn28y9S3y/j+AtiMXjm+dxcmpbu
 x/yB6eaiX4aIw3Ji83rFu8gco4v73tRLNwLMXlBr97p7TBU1DAbxDzVtval8ilTcD+A8zwv
 XOvgsQuD1U3XtFyOt/+3mcDVyBgjnT137vlJ05tarSnS+VsYNPoIjb73tHwKmIxljWof1KX
 gWTqyYHhZm5Q/aV/xcNPA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:M6eIdPwB128=;LNLsQdEhXxoFqgIVkgC4hBqAuwc
 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

Previously, the USB transfer size was hardcoded in the datatype get/set
functions. Make it configurable in the ctype structure in preparation of
new control types for the id14.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
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
2.56.1

