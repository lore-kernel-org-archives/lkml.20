Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793036680;
	b=391faMcGVaea9yUUFrqSEaORyG0ZTPULkobhEBjliKlD9JT5Egs/nnkvsdm5gTSL25S7
	 l3JaI8WbS4KFwajEktCHG8xox+5lT5QKB31uSgz/f+gLs3K3wH1iSH/81GMles6meaLk/
	 eVfYCeUvmI32SsXRLAl3HJvaZtunCXfCS2Ia8sMVVoHintOd9nqxJDxDPWRbcDcyjCoMk
	 Mx4TLEpym08ntOAXjPKxGD9I09yXdjUHSJIVEIFHHNaoJlmQ84gx7s7bB0eGFWOhHNzXb
	 UJ4l5AWNVrEwVLtSUV7nwJzw1Qs1wzDS64zYmPmxl371wbtxBXHUxLiGZ3kQWhSLxMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793036680;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0HhI1S7oQe9xPEmugHaX5Hfp+047sl3T0dBOi/05gmk=;
	b=XEcZQYcgDygTTGsO2FA54vM8xxFfNuW89+N/Jw8J/BPOFb2OIt7WNtosH2gZ3aRbiKvc
	 0E2dMnSVI77gbSrMYeW6V1s4phwFcEBgS97kpN1biXEOuw/atAKC5hOhpBLM2MmkneCly
	 h7OwZiYZyAy12dLLH2fplcg7bJzQhTmj9aGJEjdD627qeE2qmz+oB/N2P2+FgQz4pQvbX
	 P9lUM8V5IrktmP36HYgvhNMqGrs94SfaUlivorZg1hA18Imh4TQHoyOjIOZLc0UlWsBRK
	 duEQbXEpR4/QrgNyZeF4MSWIl3eGuYlbpiow0JyU+26Q6XYl1oehUG7/jxxLiuuoiBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=tG7cHpK9;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E9160A260C;
	Mon, 26 Oct 2026 17:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22E9160A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=tG7cHpK9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793036676; x=1793641476; i=arc@gmx.li;
	bh=0HhI1S7oQe9xPEmugHaX5Hfp+047sl3T0dBOi/05gmk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=tG7cHpK9hWlsn+jRz6lrK/CAgBCdcqr4TXQvSbDN2WwE3JMp7Kd7QM/nTK6EmvrY
	 KMcoqlACR1anBJHt3UK0+g+haOyUgK//r0ESp49fc2xFFt7GA96JoC2RuwRxSdddq
	 6YhtlrTHfYst+npfmhiN1P82+S4/gzfOpTjK5BGShLfySdyuQu0LrqGrFwUvfMoVx
	 DJYXjzZB9J0hV2vamp7bK+j4EPLjjH7SrGR2T3amTczIKnKKeJXk2qXkYvMfTqu/k
	 qIMWwnsGfiBNAeizNZFV4Pk7xhoodiVhTognxc2NHJ3RPGgyupuJ5lWzTpGn6PGDe
	 ibHuo6mt9PpWWUfyQg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mdvqg-1wkQ2H42NC-00dVOJ; Mon, 26
 Oct 2026 18:44:36 +0100
From: Christian Ruppert <arc@gmx.li>
To: perex@perex.cz,
	tiwai@suse.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: arc@gmx.li,
	mrwillporter@gmail.com
Subject: [PATCH 4/4] ALSA: mixer_evo: Add tlv for mixer channels
Date: Mon, 26 Oct 2026 18:44:26 +0100
Message-ID: <20261026174427.24947-5-arc@gmx.li>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026174427.24947-1-arc@gmx.li>
References: <20261026174427.24947-1-arc@gmx.li>
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
X-Provags-ID: V03:K1:IiPivy1k282sqeCT64Q2/1HHr//1vACCHpsvlpLeYb+aEvvEAjG
 WSHNtYGtzg2m4IuUOOnBQ08oi3GnWwkRB08jpJ4gaWQK3btgnzgJ+i6pUFmq6KRqK+r8YBi
 A2+ofT33lu1F3PvWcK3kge5W7nDyoij6s7WiVeWdkHLU9jRzq+bCdzwaoe7wJ1SOXaMePxH
 gT+7Hcl8+l8p8uW9kR1CQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:I9dxUJIHqs4=;pjnPClp/nHF+zqhONqv0RlOoAVS
 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

mixer_evo didn't declare tlv for the recording mixer matrix which seems to
confuse some userland programs. Add tlv definitions to fix this.

We still do not add tlv for the crossfader (generally labelled "mixer")
because there doesn't seem to be a way to declare this so that userland
programs just keep it as linear as it is and should be.

Signed-off-by: Christian Ruppert <arc@gmx.li>
=2D--
 sound/usb/mixer_evo.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/sound/usb/mixer_evo.c b/sound/usb/mixer_evo.c
index 867d083953ba..c1e0332232f2 100644
=2D-- a/sound/usb/mixer_evo.c
+++ b/sound/usb/mixer_evo.c
@@ -14,6 +14,7 @@
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/control.h>
+#include <sound/tlv.h>
=20
 #include "usbaudio.h"
 #include "mixer.h"
@@ -31,6 +32,9 @@ enum snd_evo_type {
 	SND_EVO_TYPE_NCTYPES
 };
=20
+/* Mixer matrix: -128dB (mute) to +6dB */
+static const DECLARE_TLV_DB_MINMAX_MUTE(snd_evo_tlv_mixer, -12800, 600);
+
 static const struct snd_evo_ctrl_type {
 	snd_ctl_elem_type_t type;
 	bool invert;
@@ -40,6 +44,7 @@ static const struct snd_evo_ctrl_type {
 	union {
 		int integer;
 	} max;
+	const unsigned int *tlv;
 	u16 wValue;
 	u16 wIndex;
 } snd_evo_ctypes[SND_EVO_TYPE_NCTYPES] =3D {
@@ -49,6 +54,7 @@ static const struct snd_evo_ctrl_type {
 		.max.integer =3D 127,
 		.wValue =3D 0x0000,
 		.wIndex =3D 0x3800,
+		/* no TLV here because we can't describe the cross-fader */
 	},
 	[SND_EVO_TYPE_PHANTOM] =3D {
 		.type =3D SNDRV_CTL_ELEM_TYPE_BOOLEAN,
@@ -80,6 +86,7 @@ static const struct snd_evo_ctrl_type {
 		.max.integer =3D 6 * 256,
 		.wValue =3D 0x0100,
 		.wIndex =3D 0x3C00,
+		.tlv =3D snd_evo_tlv_mixer,
 	},
 };
=20
@@ -431,8 +438,6 @@ static int snd_ctl_evo_info(struct snd_kcontrol *kctl,
 	const struct snd_evo_ctrl_type *const ctype =3D snd_evo_kctl_type(kctl);
=20
 	uinfo->type =3D ctype->type;
-	uinfo->access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
-			| SNDRV_CTL_ELEM_ACCESS_VOLATILE;
 	uinfo->count =3D snd_evo_kctl_channels(kctl);
 	uinfo->value.integer.min =3D ctype->min.integer;
 	uinfo->value.integer.max =3D ctype->max.integer;
@@ -454,6 +459,10 @@ static int snd_evo_add_ctrl(struct usb_mixer_interfac=
e *mixer,
 	knew.info =3D snd_ctl_evo_info;
 	knew.private_value =3D snd_evo_kctl_priv(ctrl->type, ctrl->val_offs,
 					       ctrl->hwchannels);
+	knew.tlv.p =3D ctype->tlv;
+	knew.access =3D SNDRV_CTL_ELEM_ACCESS_READWRITE
+			| SNDRV_CTL_ELEM_ACCESS_VOLATILE
+			| (ctype->tlv ? SNDRV_CTL_ELEM_ACCESS_TLV_READ : 0);
=20
 	switch (ctype->type) {
 	case SNDRV_CTL_ELEM_TYPE_INTEGER:
=2D-=20
2.56.0

