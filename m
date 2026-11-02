Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579587;
	b=VL7K9JkMqfj5yNjaYVtSEQPkDxAJv4NzvEd+yUhNfKOWaA7SVKXgcpzWQewQ7BXBF06l
	 +mITYnLTuVW/iXptlVeblZUkXgtumhrPyolb6u035+vSDkcZfC5WCsjW9GZNLVFbhYHKn
	 nx/SGPaTx9EfMfwqXMdXvG8brx48Nrs6UAfDxVI0Z6zBrpWGZHxUAn45xvoTCGuK0RGoW
	 h1jRWFtB79pqlCXYyVC0TGNSCQfCDyVCRDra7faaH8nlN6cLhCga09WvLoW4GMLbjzS0E
	 nimeVWE9lfirfTVyO0VLXANdfvLfdMCmw89zfwtdBXTEL4M47B/mAmk4l1aoIt6avBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579587;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=nLfHXLsE/CQrtwXX676L/dC6rl4Ph2nVaeD3ikAcQA8=;
	b=Tk60yX2kD60KO2SsZENieo4fsEQpVgAHlFrXf65pjNix5aX+V71V1BRgZ/W4QqajI8X3
	 Wi+MvZalJx/EkX8zoILXdH0T9zl7H8y2jGgMfVTOUZRsff0+n+Q9gyZGmlkU5DZbqiKrz
	 VQhV7nT/4Ur+KGXE7DuftBDX2YOLWru0ZoEObk8DiJSZgcO0CxIq8m7VUhw0ZfOiHGkJi
	 baDYralml9X6Kvfy2wzkWgamstzBgiVYNWnCD9Mo7aWK5k6aMHoeaeVHTRQxKibU+P1E+
	 gCjD8ZOuz/hZAjYTiNnwzV27u5EYIBtgJChd/GCimQQb61sxdBojK0bFTpsdWAcNESQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=r3NAD810;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27B0606A32C;
	Mon,  2 Nov 2026 00:33:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E27B0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=r3NAD810
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579583; x=1794184383; i=arc@gmx.li;
	bh=nLfHXLsE/CQrtwXX676L/dC6rl4Ph2nVaeD3ikAcQA8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=r3NAD8107gLHmx0eDf7XNaN2P0eZchgfJsgViBkOT8fgiDkZ57tvBj0I6EE24kaY
	 avjYCW1azCAXjkG939LzlFwkcyeZCb0pjzGPRGNN/DnOf3uCUi2+zycjN87TPdUyL
	 JZ0JAtDcPkC/FCzAig+K0hqIZ5hi7I171M4chDT6RSLM5mKFASmj7LXE90slD8rkJ
	 BaT8SUHdjfBmcuMeRrj316UmTcUGgtfTwL05rsPz3WawXSCur92wrCWmCLEReNyhb
	 Kb4f+8ffRIz5Kz4KiKZqT2SlgoJI7hYWfjf8Mqy2iopWWS64ybWDvqGcph3BIDp91
	 Vsj6gN91bfoshmKAKA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MEm6F-1xKetY1UNv-009z7J; Mon, 02
 Nov 2026 01:33:03 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 04/11] ALSA: mixer_audient: Add length check to USB transfer
Date: Mon,  2 Nov 2026 01:32:50 +0100
Message-ID: <20261102003257.10134-5-arc@gmx.li>
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
X-Provags-ID: V03:K1:5vKcZVxz4EFJxzcxmCuevZsBDHaWWOp1jQ+2UDllc0G8+IOzv7S
 ZSVj8hJYZQu3fn2vZ4BdxA55z9lOqytfFfA8kDYyOnnLRU7kA0kNkaayEjYBnEIYDcmVHwW
 Urss9tjK6MtgjFXg886sSKX4KKV7AlJmGmbcaNsKR89HclxgISyq30TySkHulMwoxdf1vgT
 pBiCXoOcu1jQagfU1RkMA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:F2nF3W5Ew0g=;3q1zG7p3xw4TepXbQvTV1LFj9zu
 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

Check USB control transfers not only for errors but also for expected
length and return -EIO in case of error.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 63714d00592c..1f3744a7c10a 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -244,9 +244,14 @@ static inline int snd_audient_get_cur(struct usb_mixe=
r_interface *mixer,
 	const u16 value =3D U8_U8(sel, cidx);
 	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
=20
-	return snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
-			       value, index, buf, len);
+	const int ret =3D snd_usb_ctl_msg(dev, usb_rcvctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_GET,
+					value, index, buf, len);
+
+	if ((ret >=3D 0) && (ret !=3D len))
+		return -EIO;
+
+	return ret;
 }
=20
 static inline int snd_audient_set_cur(struct usb_mixer_interface *mixer,
@@ -258,9 +263,14 @@ static inline int snd_audient_set_cur(struct usb_mixe=
r_interface *mixer,
 	const u16 value =3D U8_U8(sel, cidx);
 	const u16 index =3D U8_U8(unit, mixer->hostif->desc.bInterfaceNumber);
=20
-	return snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
-			       UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
-			       value, index, buf, len);
+	const int ret =3D snd_usb_ctl_msg(dev, usb_sndctrlpipe(dev, 0),
+					UAC2_CS_CUR, AUDIENT_REQTYPE_SET,
+					value, index, buf, len);
+
+	if ((ret >=3D 0) && (ret !=3D len))
+		return -EIO;
+
+	return ret;
 }
=20
=20
=2D-=20
2.56.0

