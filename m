Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793579595;
	b=BNLdzW5zGW94691fa2/YAztchKpc3jfHCgkdU5ojtB8WZ2Jg7dQFkydu2ac2YXQjZ1x+
	 QdSqvOz5Tyn4ODADWhL6RZ1kDhcIVcpSec7KumeeIACYE1rxAnZh6Fl2dSiXnDP4a2jCS
	 qTmQmeHu5vJ8FjiczN21u5BYDNrv8/Ek9MSaYkt6FepqxpwQ/fUynAK9advOEOdfIE4/H
	 x26LARajF4Lqgmm/iwvi7qM2ltmxMyvcYBpqOaugVbAjzYYuNxGBF0RGfJIaBBD7dbSZS
	 HidKDkpmH5Ky/W91l6F62eJ0Xoym0+RUyd7CREof+D4Ey71R+pvBOOOyLin6LqWy8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793579595;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=X6/xBWc3IOkSOjX1iILjw8zkPm6Pn7QHMjC5wIPbUEo=;
	b=lMgQF831yGxZIPfiZAMJk1yAxSUJQZPYgdVkSZce2UhdA5t6/GzuORuXQjtUC+/eqRjD
	 x0ezBlkgLO7tdlGtmhS8DPCJnUfUf2S8ROw3HtNO26JwswrPwpU8O/CictXZEkHrZBf93
	 7WfRXMUxzi0skCpujgfj5x4uMEQ1w9EJ2/VgC/GSIwGWDhS1wWDXiXU1qhxnKnWA/YYZF
	 2Uo8EX/GBt8E/8RHIRgDrVgXse1y/8bwLrwDjgpmcnwNyk+NR9+pewGQi92MzERfbB4vp
	 KI0fzn2AzSQ+5rf5GjNcmH96oUTDPgHJIpYlvJvy4ir6sQbX6LCyY032ZxN7E9k7Aiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.li;
	spf=pass smtp.mailfrom=gmx.li;
	dkim=pass header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qgaRrZNQ;
	arc=none smtp.remote-ip=212.227.17.22
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA8D606A337;
	Mon,  2 Nov 2026 00:33:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DA8D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.li
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.li
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.li header.i=arc@gmx.li header.a=rsa-sha256 header.s=s31663417 header.b=qgaRrZNQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.li;
	s=s31663417; t=1793579587; x=1794184387; i=arc@gmx.li;
	bh=X6/xBWc3IOkSOjX1iILjw8zkPm6Pn7QHMjC5wIPbUEo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=qgaRrZNQpLhcG80lQRVuHdSKH9oLtzwXKtWxYpRPwLQMgDEg+ZBWH/xlssw4dcW7
	 DVKJ/dwlWTY38hQ/b/DTiFTFTXH0vfoO+DeEjlCC0aGKICYYvaKALAJ3sZXDxX24r
	 IGcUuyUwjokIPvKF6tYx1bmisvKDS7Uhmy3LAwT4up/48Wefq5abmiYsZWjQcLE/e
	 qZ07h4Kl42TLVQayIU+uScytizLfBHzl693X/uFTqasibKx4/RmeZuFJbmbWdmnyS
	 uQAtsP7pKYkUR7ac5o1+Ru+Zf4TZPyAd/QsW1c42EWHeyESzLmF7XeHwywQlVGgL0
	 D5xRz7wJMUxdsLeh+g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mel3t-1wmyJy0luv-00li0M; Mon, 02
 Nov 2026 01:33:07 +0100
From: Christian Ruppert <arc@gmx.li>
To: Will Porter <mrwillporter@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Andrews <neil@androos.io>,
	Christian Ruppert <arc@gmx.li>
Subject: [RFC V2 PATCH 08/11] ALSA: mixer_audient: Add control initialization at probe
Date: Mon,  2 Nov 2026 01:32:54 +0100
Message-ID: <20261102003257.10134-9-arc@gmx.li>
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
X-Provags-ID: V03:K1:Q7YP+iJCocuXK6jEUsurKn166jBlqZOMejR2RQvAvEQMB/9RQra
 HmjxWWcK7cnPz2lGUUom0z/oGB1can7/Wt4SsjGDT0RYEL2d61PQfJhlRhAG9lgwnHwueFH
 zydp+P1D8HEEYWvd12JOaK3XJ959ZOk+re0JQ0ZOeolOTlRkoOQSNYN4NX5HflFc4x5PRxN
 Ny3oT/Q+hjmi9rMkrcl+w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GvZZaobhNfs=;4ggWyCMLhu1rV4gcmytylR9JQVv
 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
 9jI1t+FcXQVTpJjjvRw==

Add the possibility to initialize certain control types to known values at
probe time. This is particularly useful for controls which initially read
wrong values and for controls which cannot be read at all.

Signed-off-by: Christian Ruppert <arc@gmx.li>
Co-developed-by: Will Porter <mrwillporter@gmail.com>
Signed-off-by: Will Porter <mrwillporter@gmail.com>
Assisted-by: Claude:claude-opus-5-5
=2D--
 sound/usb/mixer_audient.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/sound/usb/mixer_audient.c b/sound/usb/mixer_audient.c
index 433bb5479d8e..70ec3274a5e4 100644
=2D-- a/sound/usb/mixer_audient.c
+++ b/sound/usb/mixer_audient.c
@@ -38,6 +38,7 @@ enum snd_audient_type {
 static const DECLARE_TLV_DB_MINMAX_MUTE(snd_audient_tlv_mixer, -12800, 60=
0);
=20
 #define SND_AUDIENT_CTYPE_FLAGS_SIGNED		BIT(0)
+#define SND_AUDIENT_CTYPE_FLAGS_INIT_HW		BIT(1)
=20
 static const struct snd_audient_ctrl_type {
 	snd_ctl_elem_type_t type;
@@ -49,6 +50,7 @@ static const struct snd_audient_ctrl_type {
 	union {
 		long integer;
 	} max;		/* for booleans holds physical int value for true */
+	u32 init;
 	const unsigned int *tlv;
 	u8 unit;
 	u8 sel;
@@ -533,6 +535,20 @@ static int snd_audient_add_ctrl(struct usb_mixer_inte=
rface *mixer,
 		return -EINVAL;
 	}
=20
+	if (ctype->flags & SND_AUDIENT_CTYPE_FLAGS_INIT_HW) {
+		int i;
+
+		for (i =3D 0; i < ctrl->hwchannels; i++) {
+			int ret =3D snd_audient_raw_set_one(mixer, ctype,
+							  ctrl->val_offs + i,
+							  ctype->init);
+			if (ret < 0)
+				usb_audio_warn(mixer->chip,
+					       "%s: cannot set channel %d (%d)\n",
+					       ctrl->name, i, ret);
+		}
+	}
+
 	elem =3D kzalloc_obj(*elem);
 	if (!elem)
 		return -ENOMEM;
=2D-=20
2.56.0

