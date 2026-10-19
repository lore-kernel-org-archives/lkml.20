Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792441157;
	b=ZkaRZoEKRfyUp4VFJzeXcx7zbe1C3W15LXqLeNEuuVhRe9E6hl4s+d3OVHIFEc5r/gxn
	 hCWuOepYwTZqOuczNsiWgzyDkbDv0I6zM5K9PhHnCMJP6mpmscwqp6AdfERqU8TmfUt4G
	 H+Cj88ae44Qppjzk/gwTDfSjQRiU++PYAIDOATVchmQ8cNbCcp/4wgCKwg6VLqaozzaIt
	 XkHgaLgfJ+YHv8GDudIGhu/nkWzjzMrkOI7Bika/JeXQeRVNW3xt0xPdxlM0bsij0k7EX
	 rRxnun+gete0uLjTPRfOscEkqD2UiEj/hy9Ng1cmrVlxtYb9/aqlhIqD0H5ZJ4FzfRQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792441157;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-ZohoMailClient;
	bh=4y2MuAUYuz785FG6IKdKgNPIRDSZ8uzR2aajtFs+O54=;
	b=Vh/UDL5rQ1MNPT0hloCA7WdsrY3SMeiUhohrBqV7LOBAJVHiVlVx3if++VEnKW1MSPOr
	 VNQCeCOXMDTVq5SVlVhsv6/X/yUOHTVuuATOqHuzKnZt68CmJKB+CMIcsDjrPbL0uu1Dp
	 d4rR8bgNnLaKw2coDjOWxquo6XpCoGk/9pqUjts2YXtEByNvaWOth4/O0jzf38/JO3Wbg
	 SsZoI+LCXY/+w+QbwqMpH8SmrmHvCAYv9aJ7KaLdaMMoRaR2HMBODcAJb2mlYnlLFEIbm
	 /1KxR1fPVOPuDxZuOZ/kKMdxthG/Q5hqct7fruycn3nME8Fj3+puzRYx3VWS6OI5u8g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rong.moe;
	spf=pass smtp.mailfrom=rong.moe;
	dkim=pass header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=GkI6mabF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=136.143.188.112
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41154606A319;
	Mon, 19 Oct 2026 20:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41154606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rong.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rong.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rong.moe header.i=i@rong.moe header.a=rsa-sha256 header.s=zmail2048 header.b=GkI6mabF
ARC-Seal: i=1; a=rsa-sha256; t=1792441125; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kvyJiUxVx44knwl5lJRnq9yfBe9C9Qlu82cCWcI88RLhx4UnGIey7i+PFA5iTMEiv4SC2vToR0M7ewFlIwDMYW5ovteR17dnHkgpo8vkJzb0Ptf3cojFe8nISveYL79ickiz5m/9y/sFYAeenmQ+lB+rwbbsTOTgR0QxnbB0WIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792441125; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4y2MuAUYuz785FG6IKdKgNPIRDSZ8uzR2aajtFs+O54=; 
	b=d2q7MYc5DhUeOmf1w/uW12BIA7ozpq3TpO11HFKl6C37Az4gZ2m9z1Y7FF9dnARXSH/0DIjXSISey6KauGHxmjPifkw4Qfc5YvpCV+ROSTVHhbaYgL6kj5w67ZMZgXMp/bZlJknel6y23l5lYFoJUO5fqfadB5gM8ArFWiG0OBA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=rong.moe;
	spf=pass  smtp.mailfrom=i@rong.moe;
	dmarc=pass header.from=<i@rong.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792441125;
	s=zmail2048; d=rong.moe; i=i@rong.moe;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=4y2MuAUYuz785FG6IKdKgNPIRDSZ8uzR2aajtFs+O54=;
	b=GkI6mabF5UqPWbtUUVjUt64KM4Mgc8Tq+We/zIPuGe8kA0R2lOTJ3ZdcA/ZrEQ1K
	73EMTAIgyrUt9WPUXCXoa8dS4f+2luLFgdDlNOOwHHI8kEqE+957byrvGt47klpfU2g
	yFXaVV0OVD+bRbU0t061Xp3eHJeiyHEaor/NwZu39qsBRPp7MoVABWYtRT3YXPT4mqo
	0MTP2TVmVyUjuIG1SLp46PkNZHW1GdyqvQ+2+m/z9cjGp2a3IgAblm07a2OsCprn6xa
	dcUc9XCWnUHQFIiGhzVRsI5BYma1oXsuaGI5GKLXaPM3X6gMuFgZnujqlaCNkzAfhNM
	bn/utGarQw==
Received: by smtp.zohomail.com with SMTPS id 1792441122463982.9102243246947;
	Mon, 19 Oct 2026 13:18:42 -0700 (PDT)
From: Rong Zhang <i@rong.moe>
Date: Tue, 20 Oct 2026 04:18:23 +0800
Subject: [PATCH 2/4] ALSA: usb-audio: Apply MV-SILICON linear volume quirk
 per mixer
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-b4-uac-ya-audio-v1-2-2d6e053b7f50@rong.moe>
References: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
In-Reply-To: <20261020-b4-uac-ya-audio-v1-0-2d6e053b7f50@rong.moe>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.de>, Rong Zhang <i@rong.moe>
X-Mailer: b4 0.17-dev-6be7c
X-ZohoMailClient: External

The snd_usb_mv_silicon_quirks() tries to apply both
MIXER_PLAYBACK_LINEAR_VOL and MIXER_CAPTURE_LINEAR_VOL on the device at
the same time, as long as one of the mixers fulfills val == 0/4096/1.
IOW, even if only one of them matches the control values, the linear
volume quirk applies to all mixers.

Apply the quirk by calling snd_usb_mixer_fu_quirk_linear_scale()
directly, so that the MV-SILICON quirk becomes mixer-wise. The existing
quirk flags are also checked to respect conflicting quirks.

Fixes: dfd4b0d46e77 ("ALSA: usb-audio: Apply linear volume quirk on MV-SILICON devices")
Signed-off-by: Rong Zhang <i@rong.moe>
---
 sound/usb/mixer_quirks.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index e2f7ca4252e2..7e2cfb176348 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -4753,13 +4753,11 @@ static void snd_usb_mv_silicon_quirks(struct usb_mixer_interface *mixer,
 		/* The final effects will be printed later. */
 		usb_audio_info(mixer->chip, "applying MV-SILICON quirks (0/4096/1 variant)\n");
 
-		/* Respect MIN_MUTE set by module parameters. */
-		if (!(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE))
-			mixer->chip->quirk_flags |= QUIRK_FLAG_MIXER_PLAYBACK_LINEAR_VOL;
-		if (!(mixer->chip->quirk_flags & QUIRK_FLAG_MIXER_CAPTURE_MIN_MUTE))
-			mixer->chip->quirk_flags |= QUIRK_FLAG_MIXER_CAPTURE_LINEAR_VOL;
+		if (deconflict_playback_tlv_quirks(mixer, kctl) ||
+		    deconflict_capture_tlv_quirks(mixer, kctl))
+			snd_usb_mixer_fu_quirk_linear_scale(mixer, cval, kctl);
 	} else {
-		usb_audio_dbg(mixer->chip, "not applying MV-SILICON quirks on unknown variant");
+		usb_audio_dbg(mixer->chip, "not applying MV-SILICON quirks on unknown variant\n");
 	}
 }
 

-- 
2.55.0

