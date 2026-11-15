Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779028;
	b=WfYaEfQ4OMGoTiRPZ8pOGl2xODt67Z2Yrj0C9pt2mYGHOqHpMbf66mex2JyweaJYvtgt
	 Q5dUdtGBKpT9q38gSKiJITCsJh7XdlXN0XtyL5cP9fMk/rBtQC77BZJhN9r+I+3jbJZCG
	 q4FBBe8673C9VNTlz5XJksFuL0EB2BgBRZlsK1+r4CyyvZBuIfanqKTPMMb4ubk7BhpOU
	 /KXZz3i1kNkF613akdN9ev2kEEonzihRrVp7IlmiUwO1akO8LpdEb3LC4gCDUjvvHBxzk
	 gK1bXyju8Ry7gk/Lai+uhmqEYGchow1rJrpTVAHQ4ZA8FfadnJNrGpM16QeKOhjUusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779028;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=46aBFxNPj7s3aeXKZnvA4miVLI+SestfN9q099agD7g=;
	b=KGqqXizQESPK/CZVj3/FvVE9z7TG1Fkmvq8IwtLragfXETB5Ragbd4kOxZhlXNL8Oh41
	 f0PXXgv2klupxPbSazna7OnTm1pe0Gq39WDlaDNMASZ6U49B5hpz1/AiVG9TEkNs7Xu4M
	 X/A2TjNn8nPED2Un9n13wwI5TT+I/jWmomlHcYpVPgtMuPI/imOS26bi6hvKERlG102CD
	 BNtlTCptP9M3t9xprzC8FYudMAv6G3RQxpt2Se2VRSRY7XpCzf1xoIzN2OzjufcrCAKHN
	 LD67v8+S7FyA5oQj9sBXR3tIXOu4xoOmmeaSxmxzqdfLTpzUm1b6oe8za118yDpv0Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=KOX9FEQh;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3697606A886
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3697606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=KOX9FEQh
DKIM2-Signature:  i=1; m=1; t=1794779025;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:PMnUXHTCH7jluU8qwL3tUSRGrqQO
   yG2qJgOZ9EIdfkJFyiTrAgAtvTaQywgkhV5bkEPF9WGHC5L01lYiODfoD2U3ig8pwOutg22WpMg
   kQqFsKLR5WdLNsYtYh3JlYfDQ+T42UCAUzp5RQpivEHxucTV44wK9x1JX9avqsvo6pym7PhWfsZ
   J2x19ja62TeEnxP46C907V5ZE3SD7mjrO8LroMl1w65CA/DL5PY7hO1HxPAlnWcG5k3eSqmK8pN
   3rD3WGBavFYoSb22I3bkd4/RzQsBXwp0aU6420yj0Iq5XdxNPVk3FIii+5fIhw6jjd+rQqUHR8P
   ywIkE3YKaqWYdQ==;
Message-Instance:  m=1;
 h=sha256:
   xWPuQerdwQeSJCYhX0a+k1a4/uqUAf6Sa4Bl+Z4w6ms=:
   sWWzPfhPFiT2IoMHppdSPwjXoBIueApy/c00c4V68Bs=,
  sha512:
   GExIbOlt5q7xkVMDwbuTfWZ7B8miKE2oBjil+qglL4AhX/1A+fFNSSR5u01WX5dDc8LV6g8yz/2g7Cp1/UTq8g==:
   b1A2iOBarIhO/78+G7c9b0D4ZnLdGSFAj2kBQZA7P8wS0+QljDLQWaMXRxbjEWODv58jWamw2M8L9lPcb+KgjA==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779025; x=1795383825; i=arc@gmx.li;
	bh=46aBFxNPj7s3aeXKZnvA4miVLI+SestfN9q099agD7g=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=KOX9FEQhxz76IKbYA/6LytCtXi+OjHtAlLF5jILxTxUMiF5xu1WkPMDDbsg4508z
	 xygFYP5aBO6JNBs6ETr2KLR/F1mNwDiQ5jrCaryEXmLemQnsZfpKpi4A+n0pY83wt
	 jKOB5gDCtL3BU2DtcW6l0hvqI7eMc8UrVSHokHXYOt6QBJfbP8V75YC0ncIbZA9XW
	 +MFsSMUFhLQtUAg8i15r5Q0jCaz1u0IeMXCfFU0LZWhij18J/mZq4o6O2XLDjRWaY
	 yyEWJFKSUrxMDnZu493ICdZFms19ogwt4TEDlV+0GZRoIwFHQn6TjNcrTTzWbNcSb
	 d46lOSPVSqlKaAaktA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mplbx-1wfbtE0SHl-00ZT7X; Sun, 15
 Nov 2026 22:43:45 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 06/19] ALSA: mixer_audient: Allow arbitrary boolean control values
Date: Sun, 15 Nov 2026 22:43:23 +0100
Message-ID: <20261115214336.17917-7-arc@gmx.li>
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
X-Provags-ID: V03:K1:lSOD8DntnNq8b0x2BF7HtGNjP+967mkz5twsME6DcxYnviXAw1r
 XSRjANV62fLIf9hSk/QQYim35Zi1KIyAoy2oY1UNk+4Zo0J1y9tPinpIR8P/Pdl74npQzaa
 l2j37L86RSGd1UzAl5ew7yNR7W96HdewbroSUTrLH/lJlA7kQZuTPFdSwkynKhLVfdSRGuN
 BbWUmKiH/EuCiDNAnZGew==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:mFukpzEW3cw=;XbrWVtEITwDmuowgkiD4Eft5r+T
 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

In preparation of id14 support, allow arbitrary values for true and false
of boolean switches. This also rids us of the tedious invert flag.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 43 ++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 57d856d25271..4b20db9a82e2 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -43,13 +43,12 @@ static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
-	bool invert;
 	union {
 		int integer;
-	} min;
+	} min;		/* for booleans holds physical int value for false */
 	union {
 		int integer;
-	} max;
+	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -65,7 +64,6 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D false,
 		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
@@ -74,19 +72,17 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_MUTE] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D true,
 		.len =3D 4,
-		.min.integer =3D 0,
-		.max.integer =3D 1,
+		.min.integer =3D 1,
+		.max.integer =3D 0,
 		.unit =3D 0x3A,
 		.sel =3D 0x02,
 	},
 	[SND_AUDIENT_TYPE_MUTE_OUT] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D true,
 		.len =3D 4,
-		.min.integer =3D 0,
-		.max.integer =3D 1,
+		.min.integer =3D 1,
+		.max.integer =3D 0,
 		.unit =3D 0x3B,
 		.sel =3D 0x01,
 	},
@@ -359,16 +355,12 @@ static int snd_ctl_audient_boolean_get(struct snd_kc=
ontrol *kctl,
 		if (ret < 0)
 			return ret;
=20
-		ctl_val->value.integer.value[i] =3D buf ? 1 : 0;
-
-		if (ctype->invert)
-			ctl_val->value.integer.value[i] ^=3D 0x1;
+		ctl_val->value.integer.value[i] =3D (buf =3D=3D ctype->min.integer)
+						  ? false : true;
 	}
=20
 	for (; i < nchan; i++)
-		ctl_val->value.integer.value[i] =3D ctype->invert
-							? ctype->max.integer
-							: ctype->min.integer;
+		ctl_val->value.integer.value[i] =3D 0;
=20
 	return 0;
 }
@@ -392,12 +384,10 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
ontrol *kctl,
 		return pm.err;
=20
 	for (i =3D 0; i < hwchan; i++) {
-		u32 buf =3D ctl_val->value.integer.value[i] ? 1 : 0;
+		u32 buf =3D ctl_val->value.integer.value[i] ? ctype->max.integer
+							  : ctype->min.integer;
 		int ret;
=20
-		if (ctype->invert)
-			buf ^=3D 0x1;
-
 		ret =3D snd_audient_raw_set_one(mixer, ctype, base + i, buf);
 		if (ret < 0)
 			return ret;
@@ -485,8 +475,15 @@ static int snd_ctl_audient_info(struct snd_kcontrol *=
kctl,
=20
 	uinfo->type =3D ctype->type;
 	uinfo->count =3D snd_audient_kctl_channels(kctl);
-	uinfo->value.integer.min =3D ctype->min.integer;
-	uinfo->value.integer.max =3D ctype->max.integer;
+
+	if (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN) {
+		uinfo->value.integer.min =3D 0;
+		uinfo->value.integer.max =3D 1;
+	} else {
+		uinfo->value.integer.min =3D ctype->min.integer;
+		uinfo->value.integer.max =3D ctype->max.integer;
+	}
+
 	return 0;
 }
=20
=2D-=20
2.56.1

