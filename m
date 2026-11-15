Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794779035;
	b=4op5RCvGdqiOJ5Bb5WSbsCIYdkcFi8V30cGwjuZoMC8ntwVSUcN/UZBNCYVzIcmpNF8B
	 rBNIZ1bep0EHxbVOQWB/IWHjGHQQ7+CZkhScWaB6X+MDwQwgH4XzSuJ0c45opfN0eFZBx
	 o/TKnBI9JajVIPhXz8Vl8tD05rd3QHAp9D+5P8f73XnIMgnEiPEtsilsk83h3pQa0j7Pk
	 SVrDfNIBpIUsO6WuiY+uFQ9Z8wK7G29gZih6OD5jQGRw0l/2re9abL+cY9QSWLdHCB8ok
	 sagG65yKypD7aGpjc1hR5xGJG0bMAXtti5w7KD1sg9knRGyhPF9yg6OXZCKEBP7XElw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794779035;
	h=DMARC-Filter:DKIM2-Signature:Message-Instance:DKIM-Signature:
	 X-UI-Sender-Class:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0HpcK+dbXKJnTVFKJY+VliJwiKsH2Fc9HzNIbQnSCHs=;
	b=xacQlqwuICn+md/ebcG0TjruqEGe9p3tCjg6KIBvwen4apliq86WYt0PQMbLUdJDQSvO
	 ucIUXUGvLXwLNE90QFiVJVTnEHUz02he+lnzg91KX5y2T76hkADD5EhEH2Au1khK8lqiJ
	 3dYfvhAfHOH13nWYjiwA548bfWRuHpszbmqCZUtHDL1iqdyAnU1aAly01/fQkrsY0M4cS
	 ot1W1mqkj9EeZnfmxpUGvQvfyjxMY2RNriIVQbyEdhXnJK9FqbbYYQqjnxPa6x4QyQYS1
	 ci222IeHdgaseYn9hwtf5GMlEDRrxN9S9Sxgb22NXfbxNaAse8A6FvMwI7UQfHQnYQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=azevcZbe;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1D9606A323
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 21:43:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6A1D9606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=azevcZbe
DKIM2-Signature:  i=1; m=1; t=1794779032;
 mf=PGFyY0BnbXgubGk+;
 rt=PGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+;
 d=gmx.li;
 s=s31663417:rsa-sha256:TKOQ8YYSdn3Zmxou8KwIpiIVj7DU
   NvxNiG3oKpRo4Kjklk/7ojx50OEgjr744yYGQt76yLl7cD7qL4h2WGTCjS8hQX0IF+Mf7y5oc85
   rqXjWtXu7eEVsaAfHpQ5OmpFKIPpo+BAx5MNuLTb5szMO9qP+TgSBWgAa4TYjfGiVCFy3sfhO6Y
   VWqwn8DkEdb3KIHCpkFBNIa8KEOL31TFSDsyrjDzM1kaDPMthKSGxBVpKXLhacPSy5ssHAONY+3
   SHhoM6rRKs2RYeE8cSV0Dh0b5vqitZ+DHtxiVrPBZJxBjjFeHFK3Cvd/8AwTu0wlyn/QH2rnzUu
   pb8X74sF2ooN2Q==;
Message-Instance:  m=1;
 h=sha256:
   CwrlQ1KB6iv2v2Y+4kVvNFLagSvIt03KER7Xkk6RPTI=:
   txVxRmLJGWGZl2aWYreoSNwD3GyQU3a8mwSq7CMqN9c=,
  sha512:
   j7VNbH37S1RrwM1frP6lqNT+qu+jJ+QjJtEIg3Bxjji5kLLx7KM/3GwOdVF93i9EYjJKexNsMpHLwaI3mEA+2g==:
   OeZ/tUjjX+1x16MwvhxoWc4vMgNCxo51hMuMKgKf3mZDlVl3M4aopJZ/8CWVefmqAIjrv/LUG1v+1T/Mr1DtQw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1794779030; x=1795383830; i=arc@gmx.li;
	bh=0HpcK+dbXKJnTVFKJY+VliJwiKsH2Fc9HzNIbQnSCHs=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=azevcZbe/ATisZhC1y0clCozzWl4zErIlzaPK6OOHYj1BF2pEeq7a9M7I9thWb05
	 uQriSvxH/zHp6TUL19q4WIS12oqueTyvJCc2xw8H52XwLMSb3+o08TShHXpUGZeYe
	 Ld64XPrM8SaZUC2Er0XrfPo3UXX5IecmaOSMfwUTUxCH5qpp81kf+Fbv1l4yXuqmf
	 vdzvNPF8iZzNa2Srv6VtDUY2QQTGb4u0teMAp37YJiQkOnw1JTwOv7qlyoQY58YAc
	 JwE0ZgQUYeGHngAStoQch99XIkBlTRKBZ4LcNyVoPAjaFVJBtxJ5ybBS7Fx6zN+2j
	 mkxos+SPvMcpw9YEXg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV63q-1x2tAh3YOc-00P3qz; Sun, 15
 Nov 2026 22:43:49 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V4 PATCH 11/19] ALSA: mixer_audient: Create matrix programmatically
Date: Sun, 15 Nov 2026 22:43:28 +0100
Message-ID: <20261115214336.17917-12-arc@gmx.li>
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
X-Provags-ID: V03:K1:hiQHlwJdOuq3ir+xsSD5Jx9kisonxt/b5hdChbBS9GJjzbao6in
 VdsbP0eji3Do3jRxHtECwWuROvnQig/XlsJuX6+BTogdujOwDTedO+0I+/Ys4i7nuSjxKwX
 HMqVhc+oRpGuCcz7OILAY0T6l+aLAe6nUuYOe/4brdWqG9Q1Yy/XOFj9w8I9TgMm8PAfZEn
 X4GPV30SOGCGwzCNJiZLw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:tiqMjM5kZjU=;HLJPTngfdBW+8ZzIUyochah/5p2
 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

Most Audient devices seem to have a similar mixer matrix with many
identical channels. The only difference between devices seems to be
the matrix' dimension. Create it programmatically in a loop rather
than from the controls table.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
=2D--
 sound/usb/mixer_audient.c | 77 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 33c5e0a8f0e0..8a858860033d 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -105,7 +105,7 @@ static const struct snd_audient_ctrl_type {
=20
=20
 struct snd_audient_ctrl {
-	char *name;
+	const char *const name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
@@ -134,48 +134,6 @@ static const struct snd_audient_ctrl snd_audient_evo4=
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
@@ -193,13 +151,27 @@ static const struct snd_audient_ctrl snd_audient_evo=
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
@@ -645,6 +617,8 @@ int snd_audient_controls_create(struct usb_mixer_inter=
face *mixer)
 	const struct audient_devinfo *info;
 	const struct snd_audient_ctrl *ctrl;
=20
+	int i;
+
 	for (info =3D audient_devinfo; info->controls; info++)
 		if (info->usb_id =3D=3D mixer->chip->usb_id)
 			break;
@@ -659,5 +633,22 @@ int snd_audient_controls_create(struct usb_mixer_inte=
rface *mixer)
 			return ret;
 	}
=20
+	if (info->matrix_names) {
+		for (i =3D 0; info->matrix_names[i]; i++) {
+			const struct snd_audient_ctrl c =3D {
+				.name =3D info->matrix_names[i],
+				.type =3D SND_AUDIENT_TYPE_MIXER,
+				.channels =3D info->matrix_channels,
+				.hwchannels =3D info->matrix_channels,
+				.val_offs =3D i * info->matrix_channels,
+			};
+
+			const int ret =3D snd_audient_add_ctrl(mixer, &c);
+
+			if (ret < 0)
+				return ret;
+		}
+	}
+
 	return 0;
 }
=2D-=20
2.56.1

