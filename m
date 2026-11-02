Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579588;
	b=D1AUVtyIsFG8f6HNth/leggqaSnOh/AAmb5ZyRtU2d+bhaC4RXYA+Gwr8ApDznzXRdtU
	 8gPMEErrJagRS1ZzbN6pzIMyZVVjk4gU15ocd4OXMshGbQbIWsQithRdlA0DggbUtF/SQ
	 ccW95uJU2I9fXUb+0PyhkMFdXh8g6J/6aTRR1qsQyUeKALz+pFpO0JA23o2sRIdx3eh93
	 yt7uOV7NsYZqZory89SXHaKaIvlZ2WlFtGpk7Zwappp40qkglfISvI8wqU1uagSRvHcKJ
	 Y2WI2P6vIA0IYA5wVtcR4+O4E2Ur2UH7zIre7mmPu8Lo5f7WymTdQWr6zqRkTVLrDiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579588;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=yq6nLQK+/wzyzQIn8ZHRUGgF7t9E0o8PePjdLePpJOo=;
	b=UJPZuFGiXgTXWB9MvSNk9ao9m4xNjbqyH/8yxnCh6fP6F8YRtO7snKCfOg8DwKBcZbYo
	 0cgLqnqAajokL6R096rbUE8i5nI8vVafpIRBu7Ii23YRZN270fclxrSpcPLzinvwasr6w
	 uTzFIdCbCIa58R6KWavKMv78jcRMAC08g1GGyTgL9I0LFI781pvVs3dgMjXIKjDiS4yNK
	 u/WvhwTzhi6EcpW58BXcEs6aSwBeo0TAdL6oL7A8cCTWxS0G+LlWTDyr6Wz6j0UfSk/1m
	 SQKlCIEh3QPHxq2Gdyv2Qvxx6q9mmVZEyv4a2TF69wQtSV4zW0iftalZkatiQAQtwgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=awX7CGHO;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67655606A32D;
	Mon,  2 Nov 2026 00:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67655606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=awX7CGHO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579582; x=1794184382; i=arc@gmx.li;
	bh=yq6nLQK+/wzyzQIn8ZHRUGgF7t9E0o8PePjdLePpJOo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=awX7CGHO/WEOqWWT02B751eIUyOzsCw9ztSewKlTov1rVq54Ec/fJcRnaGu5m/PX
	 FQ/YrMpDxNJBXt4JhXIxLaaIYvkZcigtdyrIx1TkEp/JmqU5pPSN2qjsCICOBX/UC
	 u/tFK6QvXjwDNJC79pFGVFKzWe7HMfl3OpJV5IC3DS14lOSFN8QfSFjUGevF0an3F
	 Wk3dj8TLeh14rS8+jB9C7tv4Y0WX9TkgNn9zTrLkpuhaaK5PUH73hcDgXfIWdMrHm
	 eeZeok1mxC6PPdxU1h9IAaLooZxt//BsjWsnvagNuh+5KCCBKrkJ5+YbcWXO9ZzBZ
	 3ZkFj/FO8VH+FTex9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1xGHBN1wol-00EMuS; Mon, 02
 Nov 2026 01:33:02 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 03/11] ALSA: mixer_audient: clarify USB control message definition
Date: Mon,  2 Nov 2026 01:32:49 +0100
Message-ID: <20261102003257.10134-4-arc@gmx.li>
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
X-Provags-ID: V03:K1:gscm+zEWgLdpgF62hHV/XorZ3b3SP+934Kz6qX9yVdGwGhMIxfG
 42o0XS7+Dg3O/kKvr5eblEwo3QHuDMwBJJefKkp0m3WEL9FJRaV1It082wbUEzqc8Lu5L44
 D33BmueqdH7NF3EUVGdfns7j6Jos+UcD1mbugG9qlHkh+MetWZi0jAqDtP2NBq+spGh3m8x
 GNqkKACBbfeeSKUcAVMGQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:N4o5uBMtJWM=;2B/nZYaCkBPI3ZtwLPtXcWgHrq7
 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

Previously, base values for wIndex and wValue were directly given in the
control type. Construct them from a unit ID and selector for clarity.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 76 +++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 2afef52a12d9..63714d00592c 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -45,15 +45,15 @@ static const struct snd_audient_ctrl_type {
 		int integer;
 	} max;
 	const unsigned int *tlv;
-	u16 wValue;
-	u16 wIndex;
+	u8 unit;
+	u8 sel;
 } snd_audient_ctypes[SND_AUDIENT_TYPE_NCTYPES] =3D {
 	[SND_AUDIENT_TYPE_MONITOR] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer =3D 0,
 		.max.integer =3D 127,
-		.wValue =3D 0x0000,
-		.wIndex =3D 0x3800,
+		.unit =3D 0x38,
+		.sel =3D 0x00,
 		/* no TLV here because we can't describe the cross-fader */
 	},
 	[SND_AUDIENT_TYPE_PHANTOM] =3D {
@@ -61,31 +61,31 @@ static const struct snd_audient_ctrl_type {
 		.invert =3D false,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
-		.wValue =3D 0x0000,
-		.wIndex =3D 0x3A00,
+		.unit =3D 0x3A,
+		.sel =3D 0x00,
 	},
 	[SND_AUDIENT_TYPE_MUTE] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
-		.wValue =3D 0x0200,
-		.wIndex =3D 0x3A00,
+		.unit =3D 0x3A,
+		.sel =3D 0x02,
 	},
 	[SND_AUDIENT_TYPE_MUTE_OUT] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
 		.invert =3D true,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
-		.wValue =3D 0x0100,
-		.wIndex =3D 0x3B00,
+		.unit =3D 0x3B,
+		.sel =3D 0x01,
 	},
 	[SND_AUDIENT_TYPE_MIXER] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_INTEGER,
 		.min.integer =3D -128 * 256,
 		.max.integer =3D 6 * 256,
-		.wValue =3D 0x0100,
-		.wIndex =3D 0x3C00,
+		.unit =3D 0x3C,
+		.sel =3D 0x01,
 		.tlv =3D snd_audient_tlv_mixer,
 	},
 };
@@ -209,7 +209,7 @@ const struct snd_audient_ctrl_type *snd_audient_kctl_t=
ype(struct snd_kcontrol
 	return &snd_audient_ctypes[kctl->private_value & 0xFF];
 }
=20
-static __always_inline u16 snd_audient_kctl_valoffs(struct snd_kcontrol *=
kctl)
+static __always_inline u16 snd_audient_kctl_cidxoffs(struct snd_kcontrol =
*kctl)
 {
 	return (kctl->private_value >> 8) & 0xFF;
 }
@@ -233,11 +233,16 @@ static inline u16 snd_audient_kctl_channels(struct s=
nd_kcontrol *kctl)
 #define AUDIENT_REQTYPE_GET (USB_DIR_IN  | USB_TYPE_CLASS \
 					 | USB_RECIP_INTERFACE)
=20
+#define U8_U8(HI, LO) ((((u16)(HI)) << 8) | ((LO) & 0xFF))
+
 static inline int snd_audient_get_cur(struct usb_mixer_interface *mixer,
-				      u16 value, u16 index,
-				      void *buf, size_t len)
+				      const u8 unit, const u8 sel,
+				      const u8 cidx,
+				      void *const buf, const size_t len)
 {
 	struct usb_device *const dev =3D mixer->chip->dev;
+	const u16 value =3D U8_U8(sel, cidx);
+	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
=20
 	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
 			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
@@ -245,10 +250,13 @@ static inline int snd_audient_get_cur(struct usb_mix=
er_interface *mixer,
 }
=20
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
-				      u16 value, u16 index,
-				      void *buf, size_t len)
+				      const u8 unit, const u8 sel,
+				      const u8 cidx,
+				      void *const buf, const size_t len)
 {
 	struct usb_device *const dev =3D mixer->chip->dev;
+	const u16 value =3D U8_U8(sel, cidx);
+	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
=20
 	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
 			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
@@ -266,8 +274,7 @@ static int snd_ctl_audient_boolean_get(struct snd_kcon=
trol *kctl,
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index =3D ctype->wIndex;
+	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
=20
 	int i;
=20
@@ -279,8 +286,8 @@ static int snd_ctl_audient_boolean_get(struct snd_kcon=
trol *kctl,
 		u32 buf;
 		int ret;
=20
-		ret =3D snd_audient_get_cur(mixer, value + i, index,
-					  &buf, sizeof(buf));
+		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
=20
@@ -307,8 +314,7 @@ static int snd_ctl_audient_boolean_set(struct snd_kcon=
trol *kctl,
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index =3D ctype->wIndex;
+	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
=20
 	int changed =3D 0;
 	int i;
@@ -325,15 +331,16 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
ontrol *kctl,
 		if (ctype->invert)
 			buf ^=3D cpu_to_le32(0x1);
=20
-		ret =3D snd_audient_get_cur(mixer, value + i, index,
-				      &rbuf, sizeof(rbuf));
+		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
=20
 		if (rbuf !=3D buf) {
 			changed =3D 1;
=20
-			ret =3D snd_audient_set_cur(mixer, value + i, index,
+			ret =3D snd_audient_set_cur(mixer, ctype->unit,
+						  ctype->sel, base + i,
 						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
@@ -353,8 +360,7 @@ static int snd_ctl_audient_integer_get(struct snd_kcon=
trol *kctl,
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index =3D ctype->wIndex;
+	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
=20
 	int i;
=20
@@ -367,8 +373,8 @@ static int snd_ctl_audient_integer_get(struct snd_kcon=
trol *kctl,
 		s16 val;
 		int ret;
=20
-		ret =3D snd_audient_get_cur(mixer, value + i, index,
-					  &buf, sizeof(buf));
+		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &buf, sizeof(buf));
 		if (ret < 0)
 			return ret;
=20
@@ -391,8 +397,7 @@ static int snd_ctl_audient_integer_set(struct snd_kcon=
trol *kctl,
 	const unsigned int hwchan =3D snd_audient_kctl_hwchannels(kctl);
 	const struct snd_audient_ctrl_type *const ctype
 						=3D snd_audient_kctl_type(kctl);
-	const u16 value =3D ctype->wValue + snd_audient_kctl_valoffs(kctl);
-	const u16 index =3D ctype->wIndex;
+	const u8 base =3D snd_audient_kctl_cidxoffs(kctl);
=20
 	int changed =3D 0;
 	int i;
@@ -406,15 +411,16 @@ static int snd_ctl_audient_integer_set(struct snd_kc=
ontrol *kctl,
 		s16 buf =3D cpu_to_le16(ctl_val->value.integer.value[i]);
 		int ret;
=20
-		ret =3D snd_audient_get_cur(mixer, value + i, index,
-					  &rbuf, sizeof(rbuf));
+		ret =3D snd_audient_get_cur(mixer, ctype->unit, ctype->sel,
+					  base + i, &rbuf, sizeof(rbuf));
 		if (ret < 0)
 			return ret;
=20
 		if (rbuf !=3D buf) {
 			changed =3D 1;
=20
-			ret =3D snd_audient_set_cur(mixer, value + i, index,
+			ret =3D snd_audient_set_cur(mixer, ctype->unit,
+						  ctype->sel, base + i,
 						  &buf, sizeof(buf));
 			if (ret < 0)
 				return ret;
=2D-=20
2.56.0

