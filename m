Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779040;
	b=rojomyZLFvxvcpsQhLdqph91gwYaiYnCMJhCMHvctuzh1YCvihiRjlx2cIwXdUMW8vry
	 GE2Z0tt2I6tB0/sF1FTT9jhEPgihdf3JoOF2W8IFN2S50nxfBxkPSQ75P/tqQReknj/ri
	 7BtT0eMj8f+Kbm23GiCAsoBys37AJJTvSqfKxQ5Dery1svm/90ziYjM8ilVKhwDA+IK5K
	 pQHQAFI7wE32GGn42+Xk4w4eE77AyBGN5I/9P86buuM83PX8stsvAbxW3kPCO0lM8aqJQ
	 BPGOUAS2O/49awjjUpgj25x5OkAcKsAzFTfJ3oHekepvBq6nhZrnAZjBmk0cnmeEOfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779040;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=tjhwvZLlmJPPQ9wrsceJZHWpANSxZd/aodFfxUCC+Vo=;
	b=skf8D5InKoYSoeE6/1FTgBlfOHVstWR8sVRigqLftrwD+SO9d9/H2WJ1N4KYhrqin0CU
	 DVR3u7ZfioOll/pvEK+OCJ4x5ieTP1sPXWgfGkfo9sgYCTl2TI8eCqjpJsFh/ttoiaCIe
	 /g6cOsTSAIwXWIEn8YV2JpWryip3tWOg4DoFNBWW+Vhg8lL6wn+pk1pho17LB3l0Ic14h
	 Vz0e6gUp2K6ML7kE26uBAEeY9SCffinCRlfIfcbd/V3aS/uVWfAv5IRy5g+ISj0NvuMwM
	 4hXsco0g6rUavootbgiFzoHMj4GGMbX5YmrkTMdCHIAM6xUuvmHW0XZPIZRjLJX65OQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Ga4WmR0l;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922CF60A3824
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 922CF60A3824
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=Ga4WmR0l
DKIM2-Signature:  i=1; m=1; t=1794779037;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:k6MYTZbihFUJli0omLrouxePPTKI
   H/DZqehgX5/XAMKp9AuLZJHEUIasKfDbeH4hxSrOj6LCX51VtBzw9vyH3yf6nTQ6vWyb8mPGb+3
   dOugJeW2aJKsH11cYlP3P8/b4/4LKoT2j6ZdzsUcwe9QywjP2GI7LC98gMOJPGbih52ia6zg9zp
   Y8R0F9Uf1bARgEdlCEyviOhvgfY/wFBO4ddlTxVXfNG3Pa4v3v6TXWZ2dAViHyKCRgi7BckaIk9
   QF8vU/ZBPUkoT/QdoKu+GSj3SxjNK60RWgp9YyB5/TIGlAOfQCuTf2ZEQis+3AwllKPhIG9X5yi
   PQfSKhJrOy8PKg==;
Message-Instance:  m=1;
 h=sha256:
   2sRDM1BYyQ8XY7ksWtTxhoVt7OL5PM8NeMCRSVtwxAI=:
   /+/Blf0Vxpiqcd7esZfnTzMvWeUPPeAR63n1Z20PZ7E=,
  sha512:
   dThbXhxplsTMqZgR07fpeCoeFsdwzk+FaJ51WPAcUPja/NimGz4pc6fhtegIDWe7GSxqcuflPieG5A9PVzghMA==:
   qZ0ztZXOCGPZfZir2PorrVDxccKAURYVBl6FS4AAhN8pVuKULUzp4eutjnOzzTi8zD7JVYRw6YBusgoJ8hiO8w==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779032; x=1795383832; i=arc@gmx.li;
	bh=tjhwvZLlmJPPQ9wrsceJZHWpANSxZd/aodFfxUCC+Vo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Ga4WmR0lj6DCfAGl7PWjR9xaCyVIdFdStr5+oc9d1rc+4yyM2dOpEXNUsoCa4vDJ
	 Vbif6UeW2pxTdhtGlcxNu0vSlzot90uByzFzbMABj6zSdYPyLNWwYEDQdGp79MJUn
	 vxp1mZ/YwKD4b0znq9DUEP4cy+t3BP7/ke1I0vkOqFj7ZobAZKI7vuGNrwBYM4cLU
	 owFmAsR8toKMZMpNdxapgOKLadwmZlyCt7wjcv80dp+B+sXb0mYZPoFsN+BN1daQl
	 efEOWvDN4PInYvyuK7QwLnmx8usrdacQ/FbUhLBfLiLXNzHoX4eM052INLhEa3YEi
	 5xCs291zjGkhoiAljw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fjb-1xP8yV1p9b-0055RF; Sun, 15
 Nov 2026 22:43:52 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 14/19] ALSA: usb-audio: Give the Audient iD14 MkI its own mixer map
Date: Sun, 15 Nov 2026 22:43:31 +0100
Message-ID: <20261115214336.17917-15-arc@gmx.li>
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
X-Provags-ID: V03:K1:qDfLs0ngxW9OlI4iQvJumPa5aXtnQPkPD7XTcES1NVHRYBaPTUe
 8f5xVChGoah4Pml4VtEGZtf60lBTUYIvCpjFTt5NypG7uRG8wCMott4lIvYY2U/7LFOWQOC
 pKn0rppVACcCivkqtfs9QulgEgJys1sfr70W+S4BkSR+4ipNSjVWJTOZZGa8boZcU3ZRM4N
 5j6uaaKw3x/N3UGP4krWA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:1qJnEq+eqto=;pKALqBoi2e4UpvBGtXer4/n/jbU
 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
 v1ASBBznMMBslp7XlO49pdGhzBmEFY=

From: Will Porter <mrwillporter@gmail.com>

The iD14 MkI (2708:0002) and MkII (2708:0008) share audient_id14_map.
Later commits add MkI vendor controls that replace some of the generic
MkI controls. The MkII keeps the generic controls. Give the MkI its own
copy of the map.

No functional change.

Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_maps.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/sound/usb/mixer_maps.c b/sound/usb/mixer_maps.c
index 9218ca6314ad..31f8d0253437 100644
=2D-- a/sound/usb/mixer_maps.c
+++ b/sound/usb/mixer_maps.c
@@ -540,6 +540,12 @@ static const struct usbmix_name_map audient_id14_map[=
] =3D {
 	{}
 };
=20
+/* Audient iD14 MkI: model-specific control map. */
+static const struct usbmix_name_map audient_id14_mk1_map[] =3D {
+	{ 12, "Monitor Mix Playback" },	/* FU, partial coverage */
+	{}
+};
+
 /*
  * Audient iD24: feature unit 12 ("Speaker Playback Volume") sits in the
  * monitor-mixer branch and does not apply volume to all of its channels;
@@ -652,7 +658,7 @@ static const struct usbmix_ctl_map usbmix_ctl_maps[] =
=3D {
 	{
 		/* Audient iD14 MkI */
 		.id =3D USB_ID(0x2708, 0x0002),
-		.map =3D audient_id14_map,
+		.map =3D audient_id14_mk1_map,
 	},
 	{
 		/* Audient EVO4 MkI */
=2D-=20
2.56.1

