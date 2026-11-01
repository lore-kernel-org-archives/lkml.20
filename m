Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491260;
	b=41zioMrMBYPHzwkjoaF+ejb4qFOODhL+34fB6GvSenlMjAx65vM+enArqBWnszETFp8m
	 uiFwbfm8zndGiAmmjsEM+lIAbkDMyLuPorPBsFYzMYesIXmbIOjJrNVjRyQrn70J92BlV
	 th+cgkFxp6K4PDVwsJ/E8sM4/Cyp0IGbiLTdb3xgTB2BTHldghcf9FuHrbZuU2jYNXPk3
	 H5Gm01Yj+QrgP/UpQ2nlpkcuFb92vS855QIjtcHXvvcntvyJ+qrXTDjj2fXOTv3tFmIV/
	 BG7et35Dfj+yPnOhKWpWHKL+64MMWaG9c9aBlG0owNtc6DxVsq/fTHx+aOwnBEuMl/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491260;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=BAhz05B++Id+TDMLVM7vHkBCyxbalsqGhT7vM1RkIUE=;
	b=U64dynZnmPkP4jJkGmv3QxuO7YUEpN9LIsjJ+YoApTGZd9Pi0gCgFY0Ams+ZorJ2imy2
	 TdDpnYrZ3Id/5flZw5hXsT7AIgjKMPmAeEotat/zSr1TpJn9CM51aixahxhUW9VZmy+9A
	 ZO38slv8B+a0PMcKXovqrU4l0eZJ8u8P0J3Gq+AshtLVUGS1ZgxGuHNsyXUCwwW4+fdJi
	 tXVzx/cbF+ldzNfd5OLmwlKWzSDR0iC54Emor2rGSnLbsx2oEFxcoIgRo2UCD0fKoxqDa
	 LkEoGxCEhbyY10iq40LpCCHXBILh2ZnvFTufEkKYd5hqp9juE9F0uBicR7V1R1RDrTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=gnhqTtRJ;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4789D60A2602;
	Sun,  1 Nov 2026 00:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4789D60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=gnhqTtRJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491250; x=1794096050; i=arc@gmx.li;
	bh=BAhz05B++Id+TDMLVM7vHkBCyxbalsqGhT7vM1RkIUE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gnhqTtRJrExnb+zZGKJ3tzHUFp0LLih+rrwbcBypAsrue8PgUgAjNlEtxmlrf0Wh
	 p7yFYsXUbWpzXWGOfLdeNMGKR2PBgnqUoIPd844NMP3+3hRr5fX8BkALNTJGnO1xS
	 YJlV3sB9iSdNgRSDY7uNLAEpg9RV9ZK2BdA3pgkbW8CILwbA/tZFXKTgaQWzgb5fc
	 VCDKmhDzE+0gTG2IFEJpLw3+duaBjBjj5xjX0pXLCbN53B5gIPuSKXSvBSktzZQ2y
	 DLd09ex8yT2gYlqBL0LrMVAcc2SolUD8LkkH8ZZwYfIBRI08RDCTH1zCQQ8HBR3UR
	 jgwX3hkeZwh4O+cgSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MY6Cb-1x2oX63CE1-00QyFi; Sun, 01
 Nov 2026 01:00:49 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 11/11] ALSA: mixer_audient: Create matrix programmatically
Date: Sun,  1 Nov 2026 01:00:13 +0100
Message-ID: <20261101000013.11880-12-arc@gmx.li>
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
X-Provags-ID: V03:K1:qu9GsG0pm9MFFc9r0mS8SltqWLX+Y12IU9C5YKZZXBJRmOkOn1h
 x4ZeC6X6vs1XqBIieFJqQnOu4gX6iLJGRtz9oSmXYKItzkU6Wh5z+4dFhThTId4xSELhIdi
 D3O36yzLc4JeekE6H4TbGo1VN1Jy1CDThira7XEYL30sQf9Tyei0lJkSsqwBrSN3FroDE4o
 SLG6MhhXeQxMKmeiRUP5w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:47OjOBgTp40=;mm263q84ufXTKi1JxPOCvRRqNXn
 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

Most Audient devices seem to have a similar mixer matrix with many
identical channels. The only difference between devices seems to be
the matrix' dimension. Create it programmatically in a loop rather
than from the controls table.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 75 +++++++++++++++++----------------------
 1 file changed, 32 insertions(+), 43 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 24b594fb1bc7..30f2f20b1dbb 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -103,7 +103,7 @@ static const struct snd_audient_ctrl_type {
=20
=20
 struct snd_audient_ctrl {
-	char *name;
+	const char *const name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
@@ -132,48 +132,6 @@ static const struct snd_audient_ctrl snd_audient_evo4=
_controls[] =3D {
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
 	},
-	{
-		.name =3D "Mic 1 Capture Volume",
-		.type =3D SND_AUDIENT_TYPE_MIXER,
-		.channels =3D 2,
-		.hwchannels =3D 2,
-		.val_offs =3D 0,
-	},
-	{
-		.name =3D "Mic 2 Capture Volume",
-		.type =3D SND_AUDIENT_TYPE_MIXER,
-		.channels =3D 2,
-		.hwchannels =3D 2,
-		.val_offs =3D 2,
-	},
-	{
-		.name =3D "Master Left Capture Volume",
-		.type =3D SND_AUDIENT_TYPE_MIXER,
-		.channels =3D 2,
-		.hwchannels =3D 2,
-		.val_offs =3D 4,
-	},
-	{
-		.name =3D "Master Right Capture Volume",
-		.type =3D SND_AUDIENT_TYPE_MIXER,
-		.channels =3D 2,
-		.hwchannels =3D 2,
-		.val_offs =3D 6,
-	},
-	{
-		.name =3D "Loopback Left Capture Volume",
-		.type =3D SND_AUDIENT_TYPE_MIXER,
-		.channels =3D 2,
-		.hwchannels =3D 2,
-		.val_offs =3D 8,
-	},
-	{
-		.name =3D "Loopback Right Capture Volume",
-		.type =3D SND_AUDIENT_TYPE_MIXER,
-		.channels =3D 2,
-		.hwchannels =3D 2,
-		.val_offs =3D 10,
-	},
 	{
 		.name =3D "Mic 1 Phantom Capture Switch",
 		.type =3D SND_AUDIENT_TYPE_PHANTOM,
@@ -191,13 +149,27 @@ static const struct snd_audient_ctrl snd_audient_evo=
4_controls[] =3D {
 	{ 0 }, /* sentinel */
 };
=20
+static const char *const snd_audient_evo4_matrix[] =3D {
+	"Mic 1 Capture Volume",
+	"Mic 2 Capture Volume",
+	"Master Left Capture Volume",
+	"Master Right Capture Volume",
+	"Loopback Left Capture Volume",
+	"Loopback Right Capture Volume",
+	NULL
+};
+
 static const struct audient_devinfo {
 	u32 usb_id;
 	const struct snd_audient_ctrl *controls;
+	const char *const *const matrix_names;
+	const unsigned int matrix_channels;
 } audient_devinfo[] =3D {
 	{
 		.usb_id =3D USB_ID(USB_AUDIENT_VID, USB_EVO4_PID),
 		.controls =3D snd_audient_evo4_controls,
+		.matrix_names =3D snd_audient_evo4_matrix,
+		.matrix_channels =3D 2,
 	},
 	{ 0 } /* sentinel */
 };
@@ -626,6 +598,8 @@ int snd_audient_controls_create(struct usb_mixer_inter=
face *mixer)
 	const struct audient_devinfo *info;
 	const struct snd_audient_ctrl *ctrl;
=20
+	int i;
+
 	for (info =3D audient_devinfo; info->controls; info++)
 		if (info->usb_id =3D=3D mixer->chip->usb_id)
 			break;
@@ -640,5 +614,20 @@ int snd_audient_controls_create(struct usb_mixer_inte=
rface *mixer)
 			return ret;
 	}
=20
+	for (i =3D 0; info->matrix_names[i]; i++) {
+		const struct snd_audient_ctrl c =3D {
+			.name =3D info->matrix_names[i],
+			.type =3D SND_AUDIENT_TYPE_MIXER,
+			.channels =3D info->matrix_channels,
+			.hwchannels =3D info->matrix_channels,
+			.val_offs =3D i * info->matrix_channels,
+		};
+
+		const int ret =3D snd_audient_add_ctrl(mixer, &c);
+
+		if (ret < 0)
+			return ret;
+	}
+
 	return 0;
 }
=2D-=20
2.56.0

