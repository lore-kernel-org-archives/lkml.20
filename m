Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491271;
	b=hqImj3MP8WVJ0eME9vr2SIxh6Aa8JNnoW5XjkBXEdE/FioVsO1OQqZCaCGUzIa9R2xKJ
	 7kiIMkbY+hAEFFByRLsGonIeZCBKPqDVS9hEiMjmTO7QoY9apH8P79GQGPJGltqiPwupt
	 EVeLNX8ARXLnjfOoyaVQnKVgW4diUlYysJ2AJw40aC+lOLC1/JSJ/xyXvqvJqKZXmU1SE
	 dfdrDrkLb4WlBqMU4L003uIw1W4SJPFaQt9zeFrpjUtSX0BiYaSCH2QlphUWAc8y/AjAn
	 TDHbBxZj6S2oZOCOALDb24Sij88Qni5prTdgIT/VqACKCd07FastTzlX0qD8Pa14Agw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491271;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=VJIlOSXeux6DEJS/6tinp0XuTiY7wcuLZiqSlK0m7rs=;
	b=DBbZF94JQQdrA50/9KHBqEzU+DKdGIbwX/iVAjfQu8/jxwCiWBSWqP3EPy0eJPrHfz4z
	 0VSCVwfbz7JaKf+AvFmI4MBqJuJ2cQrNp9Oicu4klC+TOjAM0znTjII0BO8h5T/u9Xfl3
	 rUvWcIUM+HraO88iKXj2Txcf/DGqGXBH2CfJSLm3U7FfWDjcaAwyXb92flYx/I7Xo+Iee
	 mUTMmhfLGLdbv90zJ+dHr7uZh4gf3v4lk4HGeECn9HAHPoXXvemH1splYPPLLG+WcPh1u
	 vIuA+nGg4fet3LqT7V1VrrVC/naSYHuuL52eVyrbzqAeiLg8PuCcut0vD3ljdF+NvVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Rsp7bA2p;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCD860A380B;
	Sun,  1 Nov 2026 00:00:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCD860A380B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Rsp7bA2p
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491248; x=1794096048; i=arc@gmx.li;
	bh=VJIlOSXeux6DEJS/6tinp0XuTiY7wcuLZiqSlK0m7rs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Rsp7bA2pZjjKUPH2m9Z4zzQDwhxJ7l+Mnq85Uf/Yd+Yom5uFCl8V1F7wEcyq4Rte
	 Ncc1UVHII6mYpkVAelMu7dyXAAc5Bc07TTX36IKJkZUX8PwPKYr0A4uFf5CK2lcDB
	 7ORf7t5HMvGTUPoD0Uz7dtToD7KgmLjmpbszKZuNv9+iGo9fzqt3hrlS7iuA/fAju
	 GAP4WINJQ26nyByJp1IA3mqO1E8Frr2HvQkQSlRBiKBzf4parr+ruZlzOLa3VrRAZ
	 WPbcwijo7KyCUEnYo5fLRU3YFLZDkbLLNUAcrcG7rm9Ng01Mx2G9n6VfBmpd7EJLK
	 wCB0HV0KnLluQRhJ2w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MiJVG-1wqkCc0Jok-00bwYE; Sun, 01
 Nov 2026 01:00:48 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 09/11] ALSA: mixer_audient: Add readback-free parameter set
Date: Sun,  1 Nov 2026 01:00:11 +0100
Message-ID: <20261101000013.11880-10-arc@gmx.li>
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
X-Provags-ID: V03:K1:YVO4sKCWKymonULUxh/AAwzSwCcFr+qPjQ+rwDAxkV2LrKmseqf
 8mvPwNKRyZU/ZtsAL24+fCLaZnc8zH76abKtPJDCYQhiWPNnTZuv99Cmk1wBQI2W27/xg+W
 1s9tRFRhXHgRv8peHMzR5iHYHGy+zEcVc55XJz3Uhf+CvDQ2TYbywmSfybaIksHGk5W521Y
 jI2fnjZnncC9zCcip2rlw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZLmh8OyU97k=;BcWKm2bsYSTaB0Iv6/ztrUY/xa3
 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
 FvURsVz0vvYs5fxEcnw==

Add a flag to systematically force parameter writing without prior readbac=
k
to certain control types. In preparation of the id14 driver.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 803487ced997..7cb8245a64d0 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -37,6 +37,7 @@ static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_=
mixer, -12800, 600);
=20
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		(1L <<  0)
 #define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		(1L <<  1)
+#define SND_AUDIENT_CTYPE_FLAGS_FORCE_SET	(1L <<  2)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -313,9 +314,13 @@ static int snd_audient_raw_set_one(struct usb_mixer_i=
nterface *const mixer,
 	int ret;
 	u32 buf;
=20
-	ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &buf);
-	if (ret < 0)
-		return ret;
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_FORCE_SET) {
+		buf =3D !value;		/* just make it different */
+	} else {
+		ret =3D snd_audient_raw_get_one(mixer, ctype, cidx, &buf);
+		if (ret < 0)
+			return ret;
+	}
=20
 	if (buf !=3D value) {
 		buf =3D cpu_to_le32(value);
=2D-=20
2.56.0

