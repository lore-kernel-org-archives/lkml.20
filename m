Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491246;
	b=Zf5tgDzPjdMEFnMK94hvEgpD3tnvqYCthNY3+ZRxxxNeqL2Yv8k1zp5ihjMBlICB3v63
	 VCj+06QaQwYMjaYm317hzuYZXBhKQxO8HriQpZmpugB5Vu7SXNlLJdEw7Y68NfgjfrsPV
	 1AEj7GSD8uBqp8gYE0o7uloHfV1xXzoyuAA3K2T4nUXRRqVn3VdVoP2+A+XKwwFIlAxuJ
	 u6CsuoCoa/mQRzFlKlnuFD0XOfhJs+D2SkhDVrt4ciQb10oXhFcrmUpS1y7Zh1CMdWqKq
	 zgqC/uiBTUZeXmJjIWKw1xkRQh89OQbFOfQhcMHu+IyzqVKHvgDKfdZ+4NqfxyjOcvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491246;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=J49ioOGgck7cMrobV4lxIfWFl2KdReQYxIKnzDekBVQ=;
	b=kuTsTjAKmkKpjJAXoAL5J6r1tSa/9W7dzUj4Pde3hEm620oUBJ6J6lHr6o+p+u6/oeEg
	 /+f8yUsD0G6z5jgfDUD9eTFoAq48rsNdX8ajTHYjlhuoWDCje40L8wZrUYNEo5EVy4VSC
	 +Xc+c2pfhub5Z8aCiwrxhByqx3xkZAK61NwHYshRlAxl2Vze3OO36FlviZLFM3nDDpYqv
	 Mnh7ghBy4X6Bpme2+Zi9LYHDQA26x7GvUaPw8i63Cx6VeTP6wuVecpeQzeRdvrtNUQ590
	 8Yv7wkVluw6XnVHmrVfYXnc6H7gwaoDeHFKsS0DubPxCt8GndmgYVPXrPod1aRn6B+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=gQRo+TJ7;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D601606A31C;
	Sun,  1 Nov 2026 00:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D601606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=gQRo+TJ7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491242; x=1794096042; i=arc@gmx.li;
	bh=J49ioOGgck7cMrobV4lxIfWFl2KdReQYxIKnzDekBVQ=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gQRo+TJ7LVt9tPbdTzw2sIhFStXxCCtCt4cocomKqpy4J3+HG60Kdr/A9ZU0lpnX
	 3h4GAVRLoqLFYOzg+yK1KdymPYQIdJKiyO2Vdrl5pFVTTzdeJG3I5BtP5LiLtqPgx
	 0Vg5F0VFaog8u48bl9itx2fHJwGOPF4fmpc2PWj2vxUDhKwcfhbXsnZ4THhHy2HGB
	 2O53z5Spb2S6yoL/FrkFSHAhCfjyaWrkY3BoI5hp3C3EmRFfEw1Yf05TiSbqyD/P4
	 F/oyUkZFyUrHAB6U7gdquETpWdJ8yvfVramuFjBVCPCXRrBIdXbznDcSf322rsXWC
	 RKrNbhX+3V4VHXakTg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQv8x-1x8p5h2rIt-00Z1Xy; Sun, 01
 Nov 2026 01:00:42 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 03/11] ALSA: mixer_audient: clarify USB control message definition
Date: Sun,  1 Nov 2026 01:00:05 +0100
Message-ID: <20261101000013.11880-4-arc@gmx.li>
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
X-Provags-ID: V03:K1:+geFtdOaECzaXcbjyAudT1pzCohu1QOvzQjQBObx3UgKb63aQMc
 5UEFVryKBgLhRfidbpCio2ZajBCcfPo7RuJOAEUP/nCdJRoNzLahsDAKokXs3qxSJ51mM+M
 yaruCWzrovOdYPP6K50IFTJl1rNFC63zxTTGfpVNARbJXXy6Bww8tMsBiCBE8kSMOLrD7Zh
 uJsz2x7IJdPzqwsRdK+Vg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7nilbbiHYW8=;2LcfmtIHbTx3bQWLpjEyoVrDA/y
 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

Previously, base values for wIndex and wValue were directly given in the
control type. Construct them from a unit ID and selector for clarity.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 76 +++++++++++++++++++++------------------
 1 file changed, 41 insertions(+), 35 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 917b5bc53869..82591c32140f 100644
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

