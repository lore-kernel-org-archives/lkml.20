Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579589;
	b=ntTksJTxTy+eZ3rO82d/9jKha8vfnt5f/+cAG1hJmUGGFNAxHE+ohPofTTMJzPmfTUWI
	 3RCXv//dWq06V6kM40wdn/Mt+WGHwQ4NrPdaZgLjjHU8+pFhzYURWF3s3ythQWHWS+pU5
	 E882mpJ8jnknZCoUdFeItxz8cOaUAGZltEvc1PMXpjfP178BIX3HeaIdfidpItGnBs19M
	 7SDmECdLNGGzswpMygDfdKa/H0TNQem1geCmKGYyzq+aLCHvTxxyLXUJYUkAuRkNoDKAc
	 AFNHY+TzpAt3Gr/wY++t67uNYpTSuqh6xFvwgpgG+W4L6dhFmo0A9PgVXY4uzJnOU4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579589;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=awaCMx7TnH1NPs2afeKqmosGsBZtklejAf+Y0Z5LRsU=;
	b=mZ5GxT4GYXguMhiVhhoTGbzLLDg453R2ooh5dPdD9rt/BW1zIvqMoeSzjpMAzGaN3hub
	 sisodi5P5I4hCPPV20k60/xuXczMkyB2mVoRzlJpkyxCf2qFOHooRLuR9FhXTV7B5XjJr
	 T49MH+BGfHMrwpZhlkuz3tOf/ARwZQQmCDQpdenpbTfVKjYavY49BMHgdwmdqqtaswfyt
	 XHar4VaFcVl3z9q7uUUda8kWafJw/8gcrup2Bc8+t2F5qP/iwh9aUFZmEsu5+Zh1BMHWR
	 A9tCFiDSyUsH48NbPu/PAYPowtKO7AsxTQ4IMm347MJI9K/NPe4hY++voYMRxfQQoYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=azElMurQ;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09190606A33A;
	Mon,  2 Nov 2026 00:33:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09190606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=azElMurQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579585; x=1794184385; i=arc@gmx.li;
	bh=awaCMx7TnH1NPs2afeKqmosGsBZtklejAf+Y0Z5LRsU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=azElMurQqQLU1iOTq9q5A696ds5cil5n8TWZuEqPI4p0e5SdPbovNzHIVRjbo+Sw
	 q3WadxoZsdfZusx3OpjIrmEyDjfOWguf38VOymk16AD+R9zcvA0jAVA+P/n4p6YaI
	 XIxOG+7Wkk8XC+lhsBedRCXgyvh1k32nORaGv2p3HlIBgbPzM+X1393lXy5Svoiv7
	 ATsPAVA7DLb1hR0t+EQXV+YWiG+3EUZxvAU8moASSmL+2ORHirpBtkpRXnO2QLVZP
	 8Gu0eGdffaNGpnjHkIma0hu5V0YoixW39S8N97PG8uAgz8CWcfsf/v7sjXciK1cTp
	 cYZHZ6IX+JnzHZPX1g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N9Mtg-1wRCBp1tfo-00ykq2; Mon, 02
 Nov 2026 01:33:05 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 06/11] ALSA: mixer_audient: Allow arbitrary boolean control values
Date: Mon,  2 Nov 2026 01:32:52 +0100
Message-ID: <20261102003257.10134-7-arc@gmx.li>
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
X-Provags-ID: V03:K1:qosncrjdVNrYb93KNzmus6JArzUwvSF3g0JgBetf+G+O8WYTB25
 StBjolcbeERKEqcXg9lfo+EPyXeJE+c0bCuX1vUf8a6nuQ3AhnP6GMK8qPY0d9bnookR8mZ
 mW8AvMQB0YkfNEzQ5DOym5EIJSrIGyDPmKO7gct4ecAzuHFWwYBbLWZRv70/6bj+v5X6bqU
 4CcuqNn3k9JLGSwvdxMOA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qLmQTuIh/Cs=;1O+vD4IRL0/mhW+c6j8bCIxeviY
 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
 1OBA+GfGnmI/x+

In preparation of id14 support, allow arbitrary values for true and false
of boolean switches. This also rids us of the tedious invert flag.

Signed-off-by: Christian Ruppert <arc@gmx.li>
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
2.56.0

