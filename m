Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491249;
	b=YEgVFLuCB3Vw+uGGn1sJktMGeL6GO5YXqul1H/KCbUb+tFh45pYEJOtL7PB7Xhb7fgwG
	 ccm9DDGGbkrMwU2P4Xib5auqZ2G7dJgvvQS6IdnN+D30Rm/3EZq45kEYKsGQrbJnigjFF
	 r8Y8KnlJwdMiUpJVCNx3yukDe29TXWj1vHTcqEHgE4cqvvp3zb4/g0CwHga7yFFAHmMVG
	 0DNGKIL97Q03kuCLv9t1KkpDJEKbOSWRQbEFaQVwf+f5mIM4Jc6W4GwjnwB5qbrZ3wc3t
	 uz1UIA7e0GqsW+QN8NYY5MxRTi/ib4VvpZYIaS8XgPl9nQ/O7kxV1BvncaOwvdQUsuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491249;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=v7272B/KrvkPHDQxFYbN1c3GXRO4w697fEk6JkI2fMo=;
	b=Xmflx/IhjxDyo+QgX9KOyHEEe+FVI6f12SUWHXCOdcWss1YUdVs69KF4t3eb2/gWGuYi
	 VUxcOKL4eMHIBL1AmTWdBD8xTuSMzaqiVUa04uvFQOYFec4rh/ryDEXT6RCt4bNn5dQ3K
	 q+o40OvkoDf5bKeWyB+RW0i3iKB1p0HhW7qMuS9c/miY6QPrVFxbK6T7ieoRVdoTJijsJ
	 aHn+Et2eyYmO0V6MHLwQ86LLTZBDEt5IavZhz92J3A0UtdZIH6KxIhw0+nRO6rwTPC0po
	 tlPKRBLLk5wNKb5rzdFku2rWQa/YIHbaAQxrZzyd89Siaw4OdNbDsej2LLORb7fwIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=eHE1BJT4;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780CB606A31D;
	Sun,  1 Nov 2026 00:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 780CB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=eHE1BJT4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491246; x=1794096046; i=arc@gmx.li;
	bh=v7272B/KrvkPHDQxFYbN1c3GXRO4w697fEk6JkI2fMo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=eHE1BJT4auAibEoYnrbQfwWW0dViVyl4idnzU/ZjAx1eOdIWT5TU+sx90XtqNlwy
	 34WkGzMidEcoCnL71VB8Pt6JkaYV32DgFDTGL1A4WGV8RbeQlDEkCen2SjWHzOUos
	 PGPsJYLYz2JdIROMae2qiqhIrzGEC5R8Noir23nqWohXoOYwaj9j+8GRbZ04bRP0Z
	 WmMEGQZlAvQGRZ2LUdZiqw25q/9kXHukHBIp+F1OgRy3q4+34cfrFuZONiMdCYEVW
	 ZRZWEAt3QMTKKTo49uWU7VINq7RAeWDsqEDURsKxBNCmlqTVeWVXM5vgchhSAHLWb
	 4TOG5w67Lwnur3BmHg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5wPb-1xTenF19b9-001E2O; Sun, 01
 Nov 2026 01:00:46 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 07/11] ALSA: mixer_audient: Add integer range checks
Date: Sun,  1 Nov 2026 01:00:09 +0100
Message-ID: <20261101000013.11880-8-arc@gmx.li>
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
X-Provags-ID: V03:K1:In5b/OZSVy7H4w1iTQDyFJlkiIUjhv/3a9jkx07s8Ed/HSytsvX
 eTbB2j0/CZ8OpowT2cu/QLyr2kIvux03rNW2dyFtOZa2Suvru3j6xu5c9UxdW/4B1HQUKl7
 V9RXcviuyxkEKLhwxiwMX+acbMTXiht4smQTH2RizGtz8h2LtysewMAzDIsDB9c4PUNMDWA
 4AmJSyhykq4F6TSJT5Psw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:njOtbJR9Y20=;55Yoi1OnT4OowE0AiF99ylxvxvR
 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

Add range checks to integer parameters to improve error management:
- Reject out-of-range write attempts with -EINVAL
- Prune out-of-range values returned by the device to the range limits

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 6352aee0fb5e..2f1b332859c9 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -42,10 +42,10 @@ static const struct snd_audient_ctrl_type {
 	unsigned long flags;
 	size_t len;
 	union {
-		int integer;
+		long integer;
 	} min;		/* for booleans holds physical int value for false */
 	union {
-		int integer;
+		long integer;
 	} max;		/* for booleans holds physical int value for true */
 	const unsigned int *tlv;
 	u8 unit;
@@ -424,6 +424,12 @@ static int snd_ctl_audient_integer_get(struct snd_kco=
ntrol *kctl,
 		if (ret < 0)
 			return ret;
=20
+		if (val < ctype->min.integer)
+			val =3D ctype->min.integer;
+
+		if (val > ctype->max.integer)
+			val =3D ctype->max.integer;
+
 		ctl_val->value.integer.value[i] =3D val;
 	}
=20
@@ -447,6 +453,13 @@ static int snd_ctl_audient_integer_set(struct snd_kco=
ntrol *kctl,
 	int changed =3D 0;
 	int i;
=20
+	for (i =3D 0; i < hwchan; i++) {
+		long val =3D ctl_val->value.integer.value[i];
+
+		if ((val < ctype->min.integer) || (val > ctype->max.integer))
+			return -EINVAL;
+	}
+
 	CLASS(snd_usb_lock, pm)(mixer->chip);
 	if (pm.err < 0)
 		return pm.err;
=2D-=20
2.56.0

