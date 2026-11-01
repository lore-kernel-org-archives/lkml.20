Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491254;
	b=Zy406iZFtFgk+esxCc1HsQtWGraWa0h1na95Id/FhD4Fey0Vq021Gh34D20agLNXKqK8
	 XfhTIAEaTD7ONDSoLwFpZGkbu8syfKY/mKzN1QpFWnJUtO4kBR6L/KlGFHMEFMR3iBoHx
	 Yak+UBh7GMbVy5IiKaitJZVLEdl3zlgipsBQpEbv3gLLYgLvXurHeEsHkkz7boZwUINPb
	 io4k+K6mdE0N1rv3vcQV098gJyy2CJXUXzTbXokRwjz4beslDh04gkshC8bY8SKmJ77R2
	 UL339jrVbUpNGXb1WvdfL+8YOIwMPXOEpGt36zGZpa66JVAeCyuU17eiq+9B7hmkOsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491254;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=yjc91m2oXSXOJ8o6wSe8GCN1uh3OK41xtjW7RpsAgvo=;
	b=JrRqIfIFzk/NTfJRIuDOTCgXKSxgAI5VF5gl3YDTptzNOxcoKzKZUdO+7Xxr/F52x6v+
	 aOK/LZAQMvVP/BFRbR5dZyy2NBBVP2IMYI29k0pzrg4+YlA21/uhNuG9yPkpvu7T2kP11
	 fEJFGSxPZSZa7Zs8gsXa9VofE6SSZcU28BTMMTV3oLKM861LBQJ3HNLTzuU0iVsPFJtWV
	 aexF9zd71YxmAzq+Pw2c6SInzhv2tQzq+8uYklF0snTxk9QrRFCNrejJXkJyRc4BN7+2Y
	 LlSzhKKGgg1O2hAarIob9waA/o7x+4biMWfUfby0XQ4wWMlXRljTtaMwhHMw9mBQPVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=M6yJ7qzM;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEB2606A336;
	Sun,  1 Nov 2026 00:00:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCEB2606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=M6yJ7qzM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491245; x=1794096045; i=arc@gmx.li;
	bh=yjc91m2oXSXOJ8o6wSe8GCN1uh3OK41xtjW7RpsAgvo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=M6yJ7qzMWqp2InlsTql5GzKozteNZldWtZqeiavAJ+B5vE/HPSFKSP0WxWSGtwFr
	 78hTYE0Tvpv+1/mzQVOVSHFcXKdd4zdmzwnhtOt+YUkyJbW9he22WQTMYstwdeeA7
	 4G8iSMwsFX8Xsznxu2RXug5NSdlPGie5hiLNyZhpuOIoTGEknvy60I2bX/kgA2TVf
	 QAJ1UiDfnN8JJTkGqzWU3nTa4go04ALPCJM7c1/yR7QT3aE8yLonv9hSWwjwSkhpR
	 qIETWkOJNZSGbvojFiX8QphMfSXHjC5tUJaE7PAh9Lqwe60RgkplykuaWZiOhOACl
	 dxwK+vTrGvJg4/imgQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N33ET-1wP3vk1MZZ-00sQbJ; Sun, 01
 Nov 2026 01:00:45 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 06/11] ALSA: mixer_audient: Allow arbitrary boolean control values
Date: Sun,  1 Nov 2026 01:00:08 +0100
Message-ID: <20261101000013.11880-7-arc@gmx.li>
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
X-Provags-ID: V03:K1:pilNr7wMDyUk2gV8f+DH4nXlhJPfPOHUAcD2G3y/p+/QJefJnbX
 cPZuImX5pWtBjx7VAiBTqPnCY2yjd2yi3ercfDU8ZQOTql9TSjPLozWPNUd7+BSdIUNEQny
 GlLzOFEHpLOSssYi9GTgOqbVv47hgu/nTwXHjd7QnT2MgbytWuLoQlNfzGzz/tfEgUWHlZ/
 BrfTzBdS3+5DM2xfMLFiQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:T2AkP0UkVuc=;YFPgZCS5eer1a7dCt1dgnPowlWn
 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
 eKH2SwifVqUXyMZd4HJTYGt0kBg==

In preparation of id14 support, allow arbitrary values for true and false
of boolean switches. This also rids us of the tedious invert flag.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 43 ++++++++++++++++++---------------------
 1 file changed, 20 insertions(+), 23 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 1438cc192d34..6352aee0fb5e 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -41,13 +41,12 @@ static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
 	unsigned long flags;
 	size_t len;
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
@@ -63,7 +62,6 @@ static const struct snd_audient_ctrl_type {
 	},
 	[SND_AUDIENT_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
-		.invert =3D false,
 		.len =3D 4,
 		.min.integer =3D 0,
 		.max.integer =3D 1,
@@ -72,19 +70,17 @@ static const struct snd_audient_ctrl_type {
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
@@ -358,16 +354,12 @@ static int snd_ctl_audient_boolean_get(struct snd_kc=
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
@@ -391,12 +383,10 @@ static int snd_ctl_audient_boolean_set(struct snd_kc=
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
@@ -484,8 +474,15 @@ static int snd_ctl_audient_info(struct snd_kcontrol *=
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
2.56.0

