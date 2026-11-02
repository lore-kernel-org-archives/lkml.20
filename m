Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579596;
	b=npA0MzpRuB6h3AY74AEoqLjjSH+PFMbYZMXbqEaKJjAd6WGdRrNBaVBqn/wdNmPtcZ5i
	 /NLvKYQYtPKwUt7+1YE0/nf41uD9AGQr1Z4dJON5136cNUHqYvXJGJO7IClM30p5m5zEP
	 MZ9D2A3ui+nRuhVSpVLGPl/XkzU5zkoqOkQu5hP5ylM2/xeBPyRavs6V0Pak2qaACvub8
	 RrLhjTpttaafci5vQUFWZ+EIVFaEpQLFFNR3Zp9OW0M0RwSKKvMirM9k85/OCKap1CaJw
	 JlESweuQToSzCE4SZ9I4Seh5WXtZnz0lkGbteKxVufPcZXCIyuQD+BgInZ1poauE8Cw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579596;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=Hkm6u8Yqfw+OLusaMB8zYufy0QaX8srrkxgCT9hh7j8=;
	b=SyPqLgb0M0M4q5ac1KQIypQ6yLR/xyTvJTo83n9V1geh8yxdFQ+fmO8KNj3SPsAqcvir
	 sbnRHF7jhsrOANzf/G7HPlccuHnQpmTAtj1VvblZvx68dkHdgVUZ4vr1TzngdW4ZZnhVv
	 7PQ7SObr6PXIFXr8Hgfc7I7bHqUGuhHKczK7YTiVCvGj7krJ4hN8Ai4a1Yu+CE38BxKdm
	 7/LFKAnJ406R4A1BT8p9N+piAXxeglCvQNnsHVDLNecBKfyURZvvru/DcQ4MelgH4c2W0
	 CWb12ZeF0H3TD405DgVNcg34Gf6DDEY/2R8+oasHMTNEkrL9GSgQ6BH2juna87wa5Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qDNfhLDo;
	arc=none smtp.remote-ip=212.227.17.21
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58C2606A333;
	Mon,  2 Nov 2026 00:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D58C2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qDNfhLDo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579590; x=1794184390; i=arc@gmx.li;
	bh=Hkm6u8Yqfw+OLusaMB8zYufy0QaX8srrkxgCT9hh7j8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qDNfhLDoRPtDR8kVl+VT+Wp8ox/BvESjaTuJBxQc4NQjBph/IiaKtBw2epRlv3Ix
	 i4BOPzzyfQwXHtA6lEn+1KISKTGvIyZybvztGtKWRTwooY5Qnge2dltVb/6EqpQoA
	 YpE2E2t/dZQ1YBxYR49bwQIHoL0UiN8VpfmDOhWdWSTQzMxS/um4aAA7NaXs3dkkd
	 LfiUOtLExH6NQDlRGDprheQEgI3oFlUONxpEy/nt/4rzGY111O73gMMC0hADq7RIZ
	 JLqc0caNbp84QTxywXiq1VcY1iE9ch83jiPsNpsTNkYgsp6mjNItEQjseSHK80Ah0
	 ImsOjsds7LlfbX6New==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0oBx-1wZgdE3xnZ-017niF; Mon, 02
 Nov 2026 01:33:10 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 11/11] ALSA: mixer_audient: Create matrix programmatically
Date: Mon,  2 Nov 2026 01:32:57 +0100
Message-ID: <20261102003257.10134-12-arc@gmx.li>
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
X-Provags-ID: V03:K1:2xFIGsTMns02VY6egAp6jOBF0skGw0lREWhzGXrBG18eBREQh71
 X9kBUWB27sZfEeZaMazapCYkA2kl2cwdLXUebkjSrZdOH/x7lMDzh2l2274Ip4+rXxZK5Od
 Inmq79n5rw5EmFyiOhR3EA3geIxzZpnUdjxBJi9gVzWEx+qpTeF1AKYxgn5hA4LI2P+fKOq
 x127PcmdPgyn7hcX5PceA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:6mhTtaN+gFM=;e/46KWIW1vzamuk8FiS2c+tR9uF
 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
 7C+3bpq8nUHlFQjbRWw==

Most Audient devices seem to have a similar mixer matrix with many
identical channels. The only difference between devices seems to be
the matrix' dimension. Create it programmatically in a loop rather
than from the controls table.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
=2D--
 sound/usb/mixer_audient.c | 77 +++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 43 deletions(-)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 856fb669af3f..483ab8fe6109 100644
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
@@ -693,6 +665,8 @@ int snd_audient_controls_create(struct usb_mixer_inter=
face *mixer)
 	const struct audient_devinfo *info;
 	const struct snd_audient_ctrl *ctrl;
=20
+	int i;
+
 	for (info =3D audient_devinfo; info->controls; info++)
 		if (info->usb_id =3D=3D mixer->chip->usb_id)
 			break;
@@ -707,5 +681,22 @@ int snd_audient_controls_create(struct usb_mixer_inte=
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
2.56.0

