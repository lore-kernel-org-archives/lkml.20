Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779026;
	b=pCxQQ3JbnZgvQZNSbZgiJJzSxfHqUdpJCgnsKFC1xeK06OR+Sz5//v8ltg9dBe04J/mN
	 IBTChqrIcaBIIqKUDYI8XpYpSQ6YK6sOta1EY/cIjbtSVznpigKj3kM1RHgsdnWuIKWMU
	 fFplMsgkUT2PD6Nc8kbBGb1GrHu0JMUZWswlCD2LfGziJahtK+6YibOO5jT1ArqrRYEhe
	 vwT4H7OZ8hyOMx7Nz5OK7m6hjexa+19Rq8fZNmfCOhhtZWA2t8oBwzQRnWUI4KkzrsO5d
	 DNpWYbZ7qwwJy0/VPbMawJLuubM5rTMtlUD13uj6pTbKUgmhcBuUtDcOSGb04seVodA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779026;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=W+VThi8Rusfdx+0CJ9wD8chF9Eu8CTPUL0BMOzzTMDs=;
	b=2yvQ8eP1H53XhO6NVnydH9wSGR9VGas6f1fBOw3uSKJ/bf3yc7PpIyw/e4yOCMB2XoG5
	 mPb4xY8MfQ2En0NxvQ4hpfvDExgD5vB7+6GHz00gnLuqiz8AhwKhowe1SZ/+MWnjrqllW
	 ijXEcmDGU1+EZ6TkkBvLYkEjkHwphr6sHzos+VVNtaiiSk6L6LMnfby9fLDig2AtXPYrI
	 /ljMUbvjNgqDvi8AH+9K4VV/ge7r/UNWP3N3q//Tru9HLo6U5DUb6tmKk8yp426LijZ2x
	 QhXJHmU4aw3xrdbKiHY1c/7om0VGSG7zs+bF7ZNifrS+CRDyZXOk+UvGIjB/uEDDrTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=XcE78TBJ;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B29606A31F
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5B29606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=XcE78TBJ
DKIM2-Signature:  i=1; m=1; t=1794779022;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:a2ChxUVfH63+ePig/Lgt1UFn6oBb
   y+oRtj+kjeQN2L6W/ADMbK0Lc7zDAVI5FnB17Zz47rwEQzAupTf8sG40xsaN1noTLgDfQ20RaTK
   hdOTFixd58ruxf4l9JoneOQq7UteQ8TDg4fIyH9uJZEdSsWDFzvyTdd71RVLrdmNbGc8WGo8bVb
   9IpgOODr5xxlG19AZ175KdElXqM63q+aP97eFAt/s6JYak8bvv243590O6gxX+Lka4B4QiDCJDi
   CMqfbPwl+5kjZCdNMfgXL9kf3xOYrkzbk7D53ml8+XIGfFwVOsP5dxk3uE4Yo/XQb3+LlLDeXp3
   Ex48vh63zRtdTA==;
Message-Instance:  m=1;
 h=sha256:
   1CNDLZlTVIrnt/64g6+BmIXHTn7TY7UJJjB7sE3HuDc=:
   CBf+nygyTgOXrKvZt1U5MkxObnbxxfGc8+XO/BlYrcY=,
  sha512:
   NYVSC+IPiWZslTTXYXFFP19aydMye4RUXgnWt7qNfUv8aQSaaoAjVjzGVfGLI/mqGOjfm+VXNQZ/OvxG7oGIqg==:
   D/2spxP7kBNLEDt4P9Tt3nsprTX0ZC+exvmDh+0cwEFioRcPH4qzj8G25xYrdWyirfP5WA022EzurNBSTrmAMg==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779022; x=1795383822; i=arc@gmx.li;
	bh=W+VThi8Rusfdx+0CJ9wD8chF9Eu8CTPUL0BMOzzTMDs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=XcE78TBJqo1onVAHkzq/ArXkVIpirpkS4hzvd6S4/gE5I4uA0bP7gn4kD+nSUhFe
	 EdAndu2dWxaKQDFku/Y28tT2wWnfdBUaF5KknBbd/zEib5YeRGNJPepF0t8uREKmP
	 G3tMLwapccrB70sDWq2M3nrjHrQZu+3YKNyPAoLSXmRM+IGRL2SANIBOJgkVO2Gl9
	 H9kIMZKPJ8Obonf4jq8vL4eYcDFfWt2IRuOgBkFIoLb200DRSOzHtfcNPpjTswHKx
	 Qg93n5CiDVMqX+7gzMHdkNgyCkhhNNmnJW42f961w1UbCNQrLiIiU+QDSevc2hgha
	 loYxnK3kmbtrjpvnXA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MBm1U-1xImOI28PE-00BTjF; Sun, 15
 Nov 2026 22:43:42 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 03/19] ALSA: mixer_audient: clarify USB control message definition
Date: Sun, 15 Nov 2026 22:43:20 +0100
Message-ID: <20261115214336.17917-4-arc@gmx.li>
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
X-Provags-ID: V03:K1:76hfSppWptMK+zRjl05SjYEdaXeqTb0z6awLIVrz+zbn//cmNnJ
 gyYbl7xkoMIS2p9DF1RHxrBJkrv+rZM+7eqepNGAaKk28QCSiq+FQlFj1x2Mc8CilA0wQSr
 lOG9dxTHnParrUPKxsjd5nm0rwYSxga0fj+GZMKBceZGKWEcQn+gf20iT61nXCdAeDVKt+X
 QRoNZJe0uJtl0DQsbPzTQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L5rYAVGDqx8=;496EiwDhX/HRSYqydej1sCNtGd7
 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

Previously, base values for wIndex and wValue were directly given in the
control type. Construct them from a unit ID and selector for clarity.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
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
2.56.1

