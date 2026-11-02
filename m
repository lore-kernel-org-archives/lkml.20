Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579589;
	b=cjUqBq0O6nnygnu5Nmm4t4z2rOg0XCDmLKyPZnmAklbAMSDlGctKlrEEJgU8pNrSAXu3
	 98UMlUE09XFISbMSYB0nz+aIhkAMiSGfUsBKCVS+Zm+u5p7zhvV1VnW+Woc92g99qqUHU
	 r+XQ68kO1N3cWdGi7vpJdYKCSAWgGiaVKk5V5asWULXU21/SQUubd3SuR8+t0FCwPx8yx
	 l0r7fghhi1lIUqpnXSSZQJxACnlrTi9UeFuGqr9iNz/sw/ZhHNrEHimCE1tX3pvQSJT5a
	 jWilVTHifi7L+rKbARq5ylzBh67l8x3PnY2OeInS0fNlElNTERNrV1W3clqoYwBcCzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579589;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=UVZh/9wQ/mCPZH1au59SX6OlG9Ds5IKal4+s52cl/tE=;
	b=GAAGsFnpJfmrYm11oKUhBM+lFM6AcwvO5MK7lYaIDOOVLTFqZBImkIylKcq9OcG+lHFI
	 RKsCl5q0MU64vYxMJWryvh2Our3vgrpgZXk5Qn03aVd5JQPL1V9ar139Z2JsEVOgelzKw
	 MNCjkFg5/hoy+JIgf4w9alZLKPmvN4Jyl/T0Ygb6fkp1v4kepG711xy/A7YcdipM/FEO8
	 WiT9I9TfJRzVNEYdLs+boUoyirZVmyc7XHfg9mZZbHKN9HqESaLTFAL0n4H2ozbmenRtF
	 uTwTqk3/elEJV9959rvCWY2eGOVgflIBZprahwc+hrugxCu8SxjuJ0Dc2XTJ/uAqdVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b="Zo/pY3nU";
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703EF60A2601;
	Mon,  2 Nov 2026 00:33:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 703EF60A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Zo/pY3nU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579586; x=1794184386; i=arc@gmx.li;
	bh=UVZh/9wQ/mCPZH1au59SX6OlG9Ds5IKal4+s52cl/tE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Zo/pY3nU2dcvdt/dsCPWAhtCmmcPTZyen2HexfoOKk2Bi+6JuJWhn9SNkeKBnvDA
	 YWuUy49n2OTxMbejKfuqoDm3eAtqysgSK+M4iySHHSoBeczun1cSq3y02BFW2utPK
	 /nuFBQ0hiIQgoplWGQpOaMAnHww+CuE3vFqqJgi7OeDUmT+nKeBpg6/YM40RFLEaZ
	 lON5738UnT08ihtcUDYhHzW+IZ3AD4lBZ85PeTCw+N+KFZdCOFtpMKNlo7OqJveW7
	 E9qYb9B95ssMpYQrJqtSEHeMF5r6PG2e8AOGOKUaG91sf1gErAGsYcqxDA7mFJSwf
	 +YYTE7xsN9ZFp3JOVg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MF3DM-1xLU8g1RO4-00AoRq; Mon, 02
 Nov 2026 01:33:06 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 07/11] ALSA: mixer_audient: Add integer range checks
Date: Mon,  2 Nov 2026 01:32:53 +0100
Message-ID: <20261102003257.10134-8-arc@gmx.li>
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
X-Provags-ID: V03:K1:5EfO5i+gUWNHTZ8lSdBm6DIawVEniluy41x9spabE3AbL3qpktZ
 933dPC7mHoRH7sZGADnv6b8DA9UfFS6j6/jp1Sf6tOXe7/MZdM3XdrRtT4nEghtnfilGixz
 voI3v/0QRXPdPzMKwZs8WiO/NBTR9mI6egzlle4XlJFN24c5/we9UV205n0U5d1sa8h8VNB
 R4lD/GuG/qH6Yn5eU01ug==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+AKRPiy3sSY=;FOZh8wS1V/WmIf746NmQfmkHgsm
 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

Add range checks to integer parameters to improve error management:
- Reject out-of-range write attempts with -EINVAL
- Prune out-of-range values returned by the device to the range limits

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 4b20db9a82e2..433bb5479d8e 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -44,10 +44,10 @@ static const struct snd_audient_ctrl_type {
 	unsigned long flags;
 	size_t len;		/* datatype size, can be 1, 2 or 4 bytes */
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
@@ -425,6 +425,12 @@ static int snd_ctl_audient_integer_get(struct snd_kco=
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
@@ -448,6 +454,13 @@ static int snd_ctl_audient_integer_set(struct snd_kco=
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

