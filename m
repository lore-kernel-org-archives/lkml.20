Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679C6442FA4
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 09:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791625307; cv=none; b=THS8Xew3xT38LpXiQLgHjlRDm8hW07wEWv127Ahd77vIeLTpbhhjmO1F5x5ehy34yUhEsW+woFuAMI7pc1zL46NnaGe7qXBrdvJTLcizJfQXsmCOWMC9Ap9rUOQLmpvLX0+B599Ltcg5rcRHIYn/5LNF/pfty35CWe/zCkerHnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791625307; c=relaxed/simple;
	bh=xBeqqLT7elWi58n41kulxhhvAG5qnuXRXLnSEyY7YR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wu2wrmOwUv9hI7H/C/Kl3n0Kuvbn1dOwfHUrfzgqIaMulcj231gu9s2dcVa39FGfLCSu+bIIn2dXUSWiYAJgy3oDrbI4+pEuWgZllddNwgYSJJmS6DTrA2X7F/PPd1CMv4USjHGL/xmO4kTRJJs7PIQe5ONkGbdcpW+Nn8y+oKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c0VLvsAr; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c0VLvsAr"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-486e8faff03so222941f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:41:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791625302; x=1792230102; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kowwCp3jFUT2VWOfhdrYm2xKuy8ZY6nma+3X6Op/3n0=;
        b=c0VLvsArDMISzvY68D4l+iraNdGQy8fH5/IqGxRnFMtTd7FdvfiGjFOqOm6lt5Fiyy
         EaO2rBFgjRNwEkiziDLavxL1gDjCzvshpxFPVBZNL1VzWNAkvckQH4fN/VweCd2qzjOn
         zZnjYHiHto2eirMNcEfzH6XBD9u8xhJ9gDWJQbteX90z9X27VOGxQ1Mcc9V63yZCYt6d
         fvuiCTlU3rvXkzS3E0eo7ySjMSqbp/GC0M+VF9PBynWnMSP0nAA5ynNX3NLF4vjQWVF/
         GD4WhNeX384loR8U9Dk8o+X6OhY5b8AooEnafeWwVqBbkooqewtyVGxyf0heZrgXrJvU
         GlAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791625302; x=1792230102;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kowwCp3jFUT2VWOfhdrYm2xKuy8ZY6nma+3X6Op/3n0=;
        b=CQkkIzglbv0f6G447iF1ZdwCrzOm1iK7s/Br1eX3qybTHelkgKgRoAtJJES2UluMkJ
         HvLebFsC+x+WDhDF2MHnV9e6/E9CE1q8b11gjca+v06/gvMXUxuLEWxouMZkSaiA8FdH
         4NMSdBKgKVCqJvx/I9UTmWhoe662bv4GVyI974O72QTEHIyCofXvBp0Po/ml7t1CbH66
         J4uI5avGcMjqj8tiY3jjneIN9TwYUU53WoXQfugFJ+OesXgY0rACCatnj1oCFIl/55c9
         /vfyIJubYSfkfzZcOOPLwfhOpTdLRCf65AmQzFs8PcAIaPLqW+KICZwLoSXYFh5RJ9/9
         ZtBg==
X-Forwarded-Encrypted: i=1; AKwUvBw8q9nAysYt2C1ScUIQ7I1X+Q/xc/4bRaGUyHMIGfTigljKFn74m2X1Tbze1fjq3Kg0qMd15FhPNCQiSr0=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVpXs+qSd6c6PYvvHFryDkgxPKABq0Va3y6dfzK+pcFVuF3hXM
	2JjXhbzVoZ/31ug4hvR0tknTzBpkRv8Li0bhLqiNrAHo+zV5qehBPThf
X-Gm-Gg: AYBFou2gXpC9aormBWsrWE5v0g6E/WuueXkTsKMNDpY+t74hQil+bDSU9/NkFtGveKP
	UqZza59xp7YpuvcSRfybd2jES2qUF0jo96aZ1iLILCJoYYcZJhQhMcHijLPmZ/DueCu9SQz/3D5
	j2cixLiAZj5NyuMLGukGUcmH8ul3x/Znd7VkOz8DALaj/Elptd2S1LDAPCtMpnRmNWJe12rvauu
	iB040obpsL2YWvpVWVB4HBnzTyC9jsXXbJQ8RShXNKWfJvWHLhJEdLNe+3bzMHqtmSYv3GNebiL
	fx1reo3vw2pBd+r7o5aaMPAMVq3ScF8TAu8jxP3nYTE3ELoR2IlWdzV4CT95gf4RS8JWLT2GpmR
	aIQrCQNFfBw57flJ2uQJ2bIyWShjo5NHO9Kp3Tz5bPLCspElnAw2in9xnPqdff4ki/0bFsUHfNI
	Str/jM4C0m7WN0zg1RfT7VIcTv2yQ+0cPO78QStLh/Fu62b5S6L+cSfm400qSOvp7QPgv7LAu5S
	JHg6cQFJ+Jyqli767dMWnXn5zncWWlCEwMzepF5MrU=
X-Received: by 2002:a05:6000:2285:b0:48b:119e:dc71 with SMTP id ffacd0b85a97d-48dba7816d1mr8309124f8f.5.1791625302084;
        Sat, 10 Oct 2026 02:41:42 -0700 (PDT)
Received: from localhost.localdomain (pd9556620.dip0.t-ipconnect.de. [217.85.102.32])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9462ebcsm8902358f8f.8.2026.10.10.02.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 02:41:41 -0700 (PDT)
From: Yi Tao <taoyi.sh.cn@gmail.com>
To: tiwai@suse.com
Cc: perex@perex.cz,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yi Tao <taoyi.sh.cn@gmail.com>
Subject: [PATCH v2] ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2
Date: Sat, 10 Oct 2026 11:40:55 +0200
Message-ID: <20261010094055.49308-1-taoyi.sh.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
References: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The MOONDROP DAWN PRO2 (USB ID 35d8:011d) exposes a UAC2 RAW_DATA
playback altsetting, but ALSA reports it as SPECIAL without the
DSD_RAW quirk, preventing native DSD playback.

Add the device to the raw DSD quirk table. With the quirk enabled,
ALSA exposes DSD_U32_BE and MPD 0.24.4 outputs stereo DSD256 through
USB altsetting 4 at 352800 frames/s, instead of converting to PCM.

Tested using snd-usb-audio quirk_flags=35d8:011d:DSD_RAW on
Linux 7.2.6+deb13-amd64 (Debian 13).

Assisted-by: LLM
Signed-off-by: Yi Tao <taoyi.sh.cn@gmail.com>
---
v2:
- Use full real name for author and Signed-off-by, as requested.

 sound/usb/quirks.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/usb/quirks.c b/sound/usb/quirks.c
index 3afc495..3652765 100644
--- a/sound/usb/quirks.c
+++ b/sound/usb/quirks.c
@@ -2554,6 +2554,8 @@ static const struct usb_audio_quirk_flags_table quirk_flags_table[] = {
 		   QUIRK_FLAG_MIXER_PLAYBACK_MIN_MUTE),
 	DEVICE_FLG(0x3443, 0x930d, /* NexiGo N930W 60fps Webcam */
 		   QUIRK_FLAG_GET_SAMPLE_RATE | QUIRK_FLAG_MIC_RES_16),
+	DEVICE_FLG(0x35d8, 0x011d, /* MOONDROP DAWN PRO2 */
+		   QUIRK_FLAG_DSD_RAW),
 	DEVICE_FLG(0x36f9, 0xc009, /* XIBERIA K03S */
 		   QUIRK_FLAG_FORCE_IFACE_RESET | QUIRK_FLAG_IFACE_DELAY),
 	DEVICE_FLG(0x3c20, 0x3d21, /* AB13X USB Audio */
-- 
2.47.3

