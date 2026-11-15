Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779026;
	b=0f1h24/mZ2Ue00sOQWmkV6kM3nNFwNQOG8zE/YXWuRCmeOBy6Ks/hrGQFb/F6NBVNWlk
	 YHv55hus9e0a7ljl0Et4mXsUrjjmU2ngWipWesgIfKkaTLvnPeW3HurpyMg0gNDgNPXHP
	 TEizkRydCiaMRhl9LBr4hJnkoSRTeFe/AufpXWb45bPnH3FtcOrsoEAG+kTRBv4hqPksi
	 B3xtMrGcYKOssc6a8LQpxaQAul5t16jEnVYQ3wKtL3/2VNzLNlwnnslcTFxK+nnJ/O0CK
	 JK+HO856bgkRGT2T1pxqeIBaenRYORRg7U1xJPXblVoww++DjNC1iti8HU4cNT8PXZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779026;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Soea9LEeF2A5QOATz+8W29vajaPqD12SEF2TlHFk/EY=;
	b=YPHvdqMrLJAFPMU2aFpbWyd0vwWwskyCdyS2I+iW/ugKT3FK4fAJnuqAnEPRpDNfysW7
	 IZTExI/8L+2iMSqBp2Zf2sxSyXMfervv0R6XLTzQJk+RiZun+v7HHfDLLXFvfX3zQIJRx
	 SDVccUt/f05W/HREj2QdC3FDhyho0dkiH9TGnlyopHiI80nk/RSvaqJ2tU1nMlsuNQIhM
	 RBNnDzjANfRaXifmYKRQafvYypy8bjUC5iBCstZjiopxH79sP+oIGO4OsrtMHIvL4j8an
	 NExLMlDuopX6yjmj+Wmm47uGVQKfmTCYh36x/AsGVEll6GHmEIfNAJVAK/kHn8mSSfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=DCabgrDv;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1633606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1633606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=DCabgrDv
DKIM2-Signature:  i=1; m=1; t=1794779023;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:UD42SXG6xLHRkjovql8ObMa1CdJx
   8S/jO7iVIo37cy4rEXm0IBINnqhMmfqxeAr/g4ogvmzMbo6qhTLRhLf3bmYmvXXksfGGvlyD7u2
   N+5A8/a/jyD9m2WK2ZAJL3qGUsiL4dLxTOHUxG+ddXVNQdiYhCEUffE6vSu6oxlF9wRehR4Phri
   xb/qU0WKEWkTyc0xxge4Azf7p/iWWmCK0Wb/BgjPdpEqvAV0rKRBjcUWhgmcFZ5njOIJAVTURn/
   +NN3SR2br1M2M0AyyQjXxMbQV3jHmsg5eU4sJXRqcNSKGw7y2RVdKo97UiEwqIEoermGrVTC8v/
   4sbXgBCxLo1jGw==;
Message-Instance:  m=1;
 h=sha256:
   WfRKXFOdWtT0AglbyxUaT+dm+yE5ElEo/LYn5zAozlA=:
   vYD3y90nwRE3ibc8dcsPhyvSZOu+u169b1bg01xV3i0=,
  sha512:
   j8DLOuQrmhtNaPf67vpRMTmUKcjklmZlIj7XygXTzMyNmiY6tBEFtsz4cbi9NWrxQFpP7wL/c4Ik3NKhZYzvNQ==:
   gIrQ342nceN9QIHdO8vKtq4K4rUG3twoSl4hBThj1JJ0Z+nZdoMMo57NxL8N6049z5cBv+0jqJIQsHhl6YAFxQ==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779023; x=1795383823; i=arc@gmx.li;
	bh=Soea9LEeF2A5QOATz+8W29vajaPqD12SEF2TlHFk/EY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DCabgrDvHHKkqB9X8tFMrqFIJ6rp5m/eAJ/yEmxqeQwnqtGHfOSBqf0k44lp+K/R
	 LuPfFl9K18iSO7w6+NyZuflqF0mUd7VzwdpMsC748VT+mkWnTz52PiaC7tBFkQDVf
	 v1/KoFeBBKDwFl5F8taBb7PflfvEqqTsXxxNwE3JEHOzfAjbTB88i3Z8d/GynHJ4R
	 WHJZwmiF1gh63r74fFb0My3dh8McTyPSJ8HLlKtB5r4T3NGyLt4bVnMfnBQBW7ZA+
	 3lU/iN/XqS2mmf8hCcQYZN7D5hTRyc7nxaUZXGXARw5df3gR1ZMUpmCsPxVxwcRqa
	 ZQMTD911JqooziAHBw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mwwdf-1wVGZI1aot-011UYD; Sun, 15
 Nov 2026 22:43:43 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 04/19] ALSA: mixer_audient: Add length check to USB transfer
Date: Sun, 15 Nov 2026 22:43:21 +0100
Message-ID: <20261115214336.17917-5-arc@gmx.li>
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
X-Provags-ID: V03:K1:XVHc+Si17/HRyDPV6BYDWyxX6zjBVOQUgLiJAOAf8dN2/UpznXm
 6MDHUjUdE2gVfkg4LYW+46JDr37CIXJdnbgmhDq4ORUggqJ/zad04lOPUep+WqpIWH1A/sU
 ps3VzJGGrTyYLjUamtIpKE/ZIa9Tt9zHVmC/EgBd+6Pzt6liGef4bRsLZsYdrPQ2GNhNPO9
 o4DI9xLvJ68zDwoMJmdNA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:kh7p8Pjc70E=;Y7u9itxzbWx9gRdxNnX2RQRWliQ
 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
 Q==

Check USB control transfers not only for errors but also for expected
length and return -EIO in case of error.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
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
2.56.1

