Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579586;
	b=2IAV4+TrsbDD3ShiGOR/qeFzJa42VwJbP5NnFYH6p8KHfTn9owHcWRPB0gxVFOaGKV9R
	 OMOhHWdqYKjfrSDijAubbKrDKvQuWEyd38bZp8/IFVW+M2Kzzc6tDZ0bvndkNtlaI2DO2
	 2uUCZqLe8BC5GJdXlrP8csPKPDsv4Au9soXj81p49fKwZ1Xa/7JjHPiZK8G9BC7wn4B9O
	 BO+LiaV6UnWLzjWVGec9OdLF7ggUdCKC9F/HI0u1VFohfBbMyk9MXkpOWzTFrneTVIGKw
	 sb+ko2ha+35j+q4tbZMhqyw+6tDzf4s0s6FOrwTitXaoD35qPAVCkSaw+B2j2nimo+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579586;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=6jBMR7rS22aADUglfFVOrbu1utV7ydiWQpkLb3G5y1Y=;
	b=qXM0MjJjkCLovQH4cTMmAb2knDlCdteSbkptldPFV152AbDb2iGMs2gfcdaGlRWsulcZ
	 RFDVtWxTlsfvDequHGfv6PpfudKAOaVuA5/fnGUL0h+LxYIgVF1IYMwaCTd1YSQclPopv
	 9H0h7gdxTBUjXaCtC+u4ZuM2vhIgUJf5IQDLovdMuO46vsyyN/6Vnh9oNGITyO/K+TeDj
	 vf6PIghkckwbaOiqRLKGdCSPwNE+JDq7dw5fZdEetwFy4pQE65qXBb8Fxwi1h1mmPkZ52
	 J/do8JyUdqwAyO1raztt3iG8PieJFrGRB1awyXnj9A8JstlguCY+yAffI02Xum3GHrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=A9M7ZEaA;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46BBA606A329;
	Mon,  2 Nov 2026 00:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46BBA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=A9M7ZEaA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579581; x=1794184381; i=arc@gmx.li;
	bh=6jBMR7rS22aADUglfFVOrbu1utV7ydiWQpkLb3G5y1Y=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=A9M7ZEaAI8bOfozmIvskbXlW34YunEaHuQvas19UzzfQbFLhh1S9kEolTpaw4cnN
	 e2xYxWypQ7hN+xtVvWrhHshDUo0ga3aTrTutjAn1ux7amPOUzeGtyV9v4tisjf9dA
	 xVJtembn1OHXlj3u/J/3tYrYra+VVGRtS7o/5b0JGpBeixxVZvJVAdk7Q/yS76XQs
	 qawOInP07kXRM+8T26w7vnzLkFZ42UKHIjrCvqk7wvMoBrpGRh9GufyMILSwc6RrM
	 E4PZx3p1PgA8YCd8lKPmhV6xEekSSU480Mbkc5aaF3/cQy1UotPJ/b/ju2c7hF4td
	 yS30o2OIHYJdUX89tA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MFsUp-1xJYxu2IGd-006Nmu; Mon, 02
 Nov 2026 01:33:01 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 02/11] ALSA: mixer_audient: explicitly define full control names
Date: Mon,  2 Nov 2026 01:32:48 +0100
Message-ID: <20261102003257.10134-3-arc@gmx.li>
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
X-Provags-ID: V03:K1:MgW0w9BtNKjBkbKP/7hVNaZiY2K9wVjb4q9SKQcxup9ol9828p7
 LRIqTcp9zbJkk0PyXNBgewNXKJeG2bsRQAQ5K4Sh9T6VgfSPp+FLVtevj1xWmfkwB9lAH6G
 eRAOwrKI3zP0ZLrDtYtUqfNEV3oIeT19wbn1zrHVrbJ5S803/4Z29DSMvx1UFv+hCvFq2tH
 LJw1lJOc6Uosrw96otOkA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:eKxFfMQDlu0=;BscM9htAvVOkQddChnqiM9FGfEo
 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
 MpFob0H89RJ2lY3Q0EA==

Previously, control names were dynamically created depending if the
control was an input or an output, a volume or a switch. Get rid of this
logic by simply defining the full name in the control structure.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 50 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index e2700b08cf80..2afef52a12d9 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -90,107 +90,92 @@ static const struct snd_audient_ctrl_type {
 	},
 };
=20
-#define SND_AUDIENT_FLAGS_DIRECTION (1L<<0)
-#define SND_AUDIENT_FLAGS_CAPTURE (1L<<0)
-#define SND_AUDIENT_FLAGS_PLAYBACK (0L<<0)
=20
 struct snd_audient_ctrl {
-	char *basename;
+	char *name;
 	enum snd_audient_type type;
 	unsigned int channels;
 	unsigned int hwchannels;
 	unsigned int val_offs;
-	unsigned long flags;
 };
=20
 static const struct snd_audient_ctrl snd_audient_evo4_controls[] =3D {
 	{
-		.basename =3D "Master",
+		.name =3D "Master Playback Switch",
 		.type =3D SND_AUDIENT_TYPE_MUTE_OUT,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename =3D "Mic",
+		.name =3D "Mic Playback Switch",
 		.type =3D SND_AUDIENT_TYPE_MUTE,
 		.channels =3D 4,
 		.hwchannels =3D 2,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename =3D "Monitor",
+		.name =3D "Monitor Playback Volume",
 		.type =3D SND_AUDIENT_TYPE_MONITOR,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_PLAYBACK,
 	},
 	{
-		.basename =3D "Mic 1",
+		.name =3D "Mic 1 Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Mic 2",
+		.name =3D "Mic 2 Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 2,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Master Left",
+		.name =3D "Master Left Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 4,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Master Right",
+		.name =3D "Master Right Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 6,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Loopback Left",
+		.name =3D "Loopback Left Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 8,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Loopback Right",
+		.name =3D "Loopback Right Capture Volume",
 		.type =3D SND_AUDIENT_TYPE_MIXER,
 		.channels =3D 2,
 		.hwchannels =3D 2,
 		.val_offs =3D 10,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Mic 1 Phantom",
+		.name =3D "Mic 1 Phantom Capture Switch",
 		.type =3D SND_AUDIENT_TYPE_PHANTOM,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 0,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{
-		.basename =3D "Mic 2 Phantom",
+		.name =3D "Mic 2 Phantom Capture Switch",
 		.type =3D SND_AUDIENT_TYPE_PHANTOM,
 		.channels =3D 1,
 		.hwchannels =3D 1,
 		.val_offs =3D 1,
-		.flags =3D SND_AUDIENT_FLAGS_CAPTURE,
 	},
 	{ 0 }, /* sentinel */
 };
@@ -458,13 +443,12 @@ static int snd_audient_add_ctrl(struct usb_mixer_int=
erface *mixer,
 {
 	const struct snd_audient_ctrl_type *ctype
 					=3D &snd_audient_ctypes[ctrl->type];
-	char name[SNDRV_CTL_ELEM_ID_NAME_MAXLEN];
 	struct snd_kcontrol_new knew =3D { 0 };
 	struct snd_kcontrol *kctl;
 	struct usb_mixer_elem_info *elem;
=20
 	knew.iface =3D SNDRV_CTL_ELEM_IFACE_MIXER;
-	knew.name =3D name;
+	knew.name =3D ctrl->name;
 	knew.info =3D snd_ctl_audient_info;
 	knew.private_value =3D snd_audient_kctl_priv(ctrl->type, ctrl->val_offs,
 						   ctrl->hwchannels);
@@ -486,12 +470,6 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
 		return -EINVAL;
 	}
=20
-	snprintf(name, sizeof(name), "%s %s %s", ctrl->basename,
-		 ((ctrl->flags & SND_AUDIENT_FLAGS_DIRECTION)
-			=3D=3D SND_AUDIENT_FLAGS_CAPTURE) ? "Capture" : "Playback",
-		 (ctype->type =3D=3D SNDRV_CTL_ELEM_TYPE_BOOLEAN)
-			? "Switch" : "Volume");
-
 	elem =3D kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
@@ -524,7 +502,7 @@ int snd_audient_controls_create(struct usb_mixer_inter=
face *mixer)
 	if (!info->controls)
 		return -ENODEV;
=20
-	for (ctrl =3D info->controls; ctrl->basename; ctrl++) {
+	for (ctrl =3D info->controls; ctrl->name; ctrl++) {
 		const int ret =3D snd_audient_add_ctrl(mixer, ctrl);
=20
 		if (ret < 0)
=2D-=20
2.56.0

