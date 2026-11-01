Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793491252;
	b=EhpaNUf0s+wN12fTNp3AhopHAaShaYuIGX0lEZ2vbJU2+6aymngOctlJdaerfv6d+itr
	 DSF+j0OO+BEajtREriBrsu0WgTUXn+otUMGd9hlwcNjE8GtNtbr9dyx/Nz5wXbKq/kiY2
	 RBk+1dOtXIiV8DyNtqJ5wfLrCFk7ReB7c60eEJ+//Q9ijKG9HU2reT7g6wkJ2bhgfNl8j
	 YY3B0yrkEETxJ3IhW1+CBYpk+eweN2qBku/fi7M+QYbTHZ1Lgtmc5luy6Xer5TEgC7Xz8
	 54ir81oswxSL5jAPPRFHHi7bXEpx68Iq/VRZLuLNJ9X9v+9xnIdDaENGJQ85v6uIRqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793491252;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=yWmoFI/FYmDTzO9s0w/vnEoLkyl1rYJ4nO46f9HQ4Tc=;
	b=xNH0gKwpVUJ7ENrEYqCmcN4nCLVN38EaXM5GfeXumESb37Z40aYxf5mkq7rHJrDRs3ZZ
	 2PEMTKuouHFhaE6HwpVYK7/UhnzhF5i7v2zoVqRBjWxWLB/03sDnR4bsdz1tKLMjn48DH
	 5mqowMEglP+1uHjHbZvhSsaRbqU1XAcFQyWjpsGgiDGibqbsmM1nwMCsgVkzwhDU9oC6W
	 ARz1CKRNTQKezKTWVmx0jE+Z00Q4f1pb6ZswpLDwuCjCJWl+RXqJhVp9hMd5LNzgTrASx
	 6dN32F1OG5uUd9W/Eh7QdSCGo6M+ZCjna/IKjxAZ+XKW1/I05/BUx8utpnxeLLvm/ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qwjdW8oq;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE8606A323;
	Sun,  1 Nov 2026 00:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1BCE8606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qwjdW8oq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793491242; x=1794096042; i=arc@gmx.li;
	bh=yWmoFI/FYmDTzO9s0w/vnEoLkyl1rYJ4nO46f9HQ4Tc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qwjdW8oq4P5a1TSi6YtxaBxQaTWr55fyAFSa3QFl0ZlK7+3KfYbY/84U1E9ccdbW
	 tg6vJCbVb4lSpMa9mBI3CmHFLTxtTOLtgX2JTbDxYTV9xtvm3rDgi+iNnU6nFRkmU
	 Zhd/Je2CVl17XT78yoyombvgvf5x8Zt1vyPWcuO/psKPU8sy70Uruo/mEUM1kFV1r
	 xZj6kBtqFgaSFW4wvD4LF+e1eNMkjIyNi+jkVckCWTaOlUVuOxtEebJHevjbQVyRH
	 EcryfBqzpiwFP90hbFEuX0f9jBpKTcEAtZqEWSKm8h+0q69x5DCTwGzzC7NAvD+p+
	 6SHR1J0dKo3jK7iNrQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MTzfG-1wwSk73aGA-00KSKU; Sun, 01
 Nov 2026 01:00:41 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC PATCH 02/11] ALSA: mixer_audient: explicitly define full control names
Date: Sun,  1 Nov 2026 01:00:04 +0100
Message-ID: <20261101000013.11880-3-arc@gmx.li>
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
X-Provags-ID: V03:K1:u5gBZUBHJZ5dlrPe0Pp3TC8d8ewNs7MLBLybUmJpWdSJXY/H/WZ
 vA/xYqDg4i2/e1QO2qAd5W1cQY1S620UBi/gXyAMSNkcV94pjuoHlqaaP0+MrYWmmkGSuBa
 cxLFXhHdU7xiWJdeIkIQosqhTEijCW/kGh/JOZXbJj4QGg34esyH2yosjYeq0mWn/Qye8PV
 nhFJnryp8E/vhSEHanfQg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ZI7aDu3FnDs=;YxuASIhZijxuTxeUSD/3xWSRYcY
 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

Previously, control names were dynamically created depending if the
control was an input or an output, a volume or a switch. Get rid of this
logic by simply defining the full name in the control structure.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_audient.c | 50 +++++++++++----------------------------
 1 file changed, 14 insertions(+), 36 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 8c1524c9b165..917b5bc53869 100644
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

