Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48963EC823
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791582820; cv=none; b=H3RocgiuBJBD5J0DVva236v7Her03e7sG9CRlOKk+9IVSSePNKueOCCIDgETFPBsGjNS6Oyg12Q/8a9P8fxvksUbJU5OK/mUFNYpSZddaRkicXkcIaej1RN5AsXCqiGBJWInx0JwSPtlVbp/3/ALtNAthlzr6AR3gujbk9/WIHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791582820; c=relaxed/simple;
	bh=ztKly8O3PZB8aAkpQFUTpMl7aJlRj2pCEVMdyfpePfE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IU/HfBRpSW+T8/iZeNh7ZTk1a03XXL4myjJkvoTK1S7pUYjg428moNz1tIramjbHOAiBLfyz2iZPXdqO6DLb6s9FuEohePM/lr/m44IrYG4tj1Z4SRyDZX0b8Wg4ooekobIM3emGN4kJGitWqFnmgzy6mLBERbB5cWHkZ4+dZdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7ahVv3n; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7ahVv3n"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so1599655e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791582817; x=1792187617; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ljd0ZUR6ThdiIUyn6+JdIS/RYq8gLbsRca66lkivvkI=;
        b=Y7ahVv3nFrndQ516tSo4TU9bNd8h2g1inEP3if6X1az4N6ovCDObRpgwRjaN+ricJY
         T/vyENGJA3ebCG4w3u09FQPCcy/Zf0Did4bgE+vANNURPrd3flZqyoK73KcMX2YFLRig
         zIK4kpJOurw/ss3FMLGXVKUA395rDQ7rXJeaN3NH3XRhatqYN3pNBKADRiWw1OSK8p03
         moHZPeyjlcuVOGxWgr9bTvnSnhQqBeeNIUBIE2uwW4QjcJLMxO2G65kHrcOn4h8M2rVs
         OYWWc0j9twMRiIItL5X8x7rTC/+BPgTTy5xrIvJYKD4a0jFtRXScD6CM4HjNMDstt+x8
         omog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791582817; x=1792187617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ljd0ZUR6ThdiIUyn6+JdIS/RYq8gLbsRca66lkivvkI=;
        b=NJw/BNgI1hkr4IXAz5V0XBzsFphEoHD4Og8vEtFYl5EqyOQ4eswYVkRrVCW/7B0/lR
         o4qiP+SOaUBf4XDO8dybTB/erH8BgEAJTDnxmW55RkWdGaenCP2T1IZlKdBBUIo7lwsc
         4f4ebGu7DkByuc78xxShj12Re5ef/BFIiAAlXo9OR4jXABRNnEx5iEBCkj0/sRzAjYuC
         1au+OMeye08/z9ayrEF+nMlqtuY45kTJYJn54SWzj8CJl5nylpRPPnHgps9Y2xkPMhci
         +41GJQSGAaIjcs9pPbrEevtmqTPQqQmr730rpYUbOlgzNOsv2Bl4HJZ6Nrscgd5bMoZQ
         P/yg==
X-Forwarded-Encrypted: i=1; AKwUvBxdXv1lK794sxBI1CR+WRp7kw5aqS1hg0QeT+aEpFCEDMHnORZbXqYRD+mcoq7DxcKFUq4pVIuJw1C/p7o=@vger.kernel.org
X-Gm-Message-State: AFq9FYK4R34NWUYrnIMcRZeTmVQw7BRZ7HPhgRgzD6XVcF86mtxaIoGJ
	y9jmFDziBrH9312LnueQ9xU5l6WSL/fHzaRkqdXdZZIk3qf1PWe7bV3L6cXV0paS
X-Gm-Gg: AYBFou36mJJQ/YyUmt4cFiVAbinRHrym6jqoI8B/IT0C6Ozu+kmwcq1JwxMYU0CODXM
	PsLlq3POfkWy7UWhr2mMYTZ+BdaICjUb5MYbEXGJF4wAG/EQq+ogbPT6BIKIKSPpskajohkBaVR
	zuo2UgkLHhvGxVVUoKycRaWFWz2WBRVVHZSj7YOHq9Cuu5jresFs/7rZ7rBrjM04biN2NpyIogk
	FOc507l6aziTaS22pkftEa/ZY82w1xRthUqBkAI6xxoG3/P2bwehO7shli4oDBez7KY7uVFxRwN
	R+htRAD6bE6V0aCB9VLG14DU2/Ol1cPl94l+t0v+xXRWlN9IWL76r8V1O94KmCK0yWhWh4Rsz/N
	7e3JaMjbKI7IiaTO0m2qula6IXPbe3ItIig+EBnqYotrv6fkmPcRZ9styGNU9JxQsXVJhuy+wNf
	FxL3k+VA+D3vcdp0PKamQIdQzkZnH8ctQ4h5Of0/LfWwklJZM022gYgBXbkNiEOY0WS6kP+ZFhP
	NzDMNbSM2Wv/CIMH9Lnk0BtWFLL3n1Nc0b81gu7BOU8w8Pp13l+CA==
X-Received: by 2002:a05:600c:821a:b0:4a1:7ba9:da34 with SMTP id 5b1f17b1804b1-4a18e3ee7afmr60802705e9.0.1791582816772;
        Fri, 09 Oct 2026 14:53:36 -0700 (PDT)
Received: from localhost.localdomain (pd9556620.dip0.t-ipconnect.de. [217.85.102.32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190344032sm60793895e9.15.2026.10.09.14.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:53:36 -0700 (PDT)
From: D_de_Vliegh <taoyi.sh.cn@gmail.com>
To: tiwai@suse.com,
	perex@perex.cz
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	D_de_Vliegh <taoyi.sh.cn@gmail.com>
Subject: [PATCH] ALSA: usb-audio: Enable native DSD for MOONDROP DAWN PRO2
Date: Fri,  9 Oct 2026 23:53:22 +0200
Message-ID: <20261009215322.8223-1-taoyi.sh.cn@gmail.com>
X-Mailer: git-send-email 2.47.3
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
Signed-off-by: D_de_Vliegh <taoyi.sh.cn@gmail.com>
---
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

