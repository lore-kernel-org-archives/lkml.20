Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794866355;
	b=1/GaJlu4Qxi7b7eOAmbTblQUuhZ85hpJklfUoQCHHwKYOKy1x6iwHXgl1Q18yUPddgh9
	 r2uhskQPd4sIWrCjklDwfhdiuni/07EGXPsFdfrV6wEDPbc0hT6jgFUGEjuyVvYxkwClw
	 P4MpZ196F2pqkaVo12gxXuLmV2hrDKDUtkrv3Sr4tIzULoHa3Llzt3eZsmKbZDahXy0RM
	 gbpI3niE89sybGZaZ2WR3NUu41KwIgKgLCd+IgLR1Wd9ritRETuJaflxuZGw++egWTSW8
	 R/tSe6OdWMiqFJmm/J9T4P1pg7EMBTNRHRGgBk5YNXVZ+zsmFeM4f4BAtcW3J915mDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794866355;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cDCmA76uVbC0tSHJSrf5hfj6GqNREL83/eNFtSmoII0=;
	b=1b0zjp3MmmxgDQ7yWWUX5HqXKIHulJX3WHfeyiOvKkKzHWzpo58JyeCQaRBrvp36VjEM
	 9APk3N/piniwukDqa1jExt3UmLGo6PoAbGjiLfysYBVbf6NmKXeZeAVUf6DjXBsMoj4AM
	 H/4r+CKvl3UlUWN2awHnZrSkGitlkcaLK1U71OIfmrycFqRBOTb11oywGjfr4qDtp6sp8
	 jZCWLdDH+0CunyR/WoL1Jota66H9v8EsF0HZfOvSXKfDj/KpRST36s1thow0eUElg4YGI
	 cXYZS18upwSys0wsnsmzC5shC56RN8+BYWMEQ/cRYdE7YCi7deH+AJfmvr65bXvMuNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.175
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11852606A31C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 21:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11852606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso39571827b3.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 13:59:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794866354; x=1795471154;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cDCmA76uVbC0tSHJSrf5hfj6GqNREL83/eNFtSmoII0=;
        b=qBaL+sTxyCLs1+PKn4xunPZO/QhilN2J9Sgw3cKBscxW7G+CsC2vBJRqOMo7v+tNB2
         4E0A/gw2BGlGh58mUD5nGU6zFLYLcoXTVPG49pTalND9JgkWje5v/C42n0nMPepX8Ut3
         lm9lVSXYSdZhwJFR3zbk0v0MhFQTITtqxprJIfs0w+ta4+Ddft+dVqkcstVf/hTS8G6K
         2glDhlCarGQPi6zLpyBaL+EXlH5hR7jtnUVyJ1EXFJAmazqIpY3HO7QcGFCr/+QpTisN
         3g23kHONV4FvO/h4wGKWROeRv//ed8Gk/YqLH4aN+r4lR6rJ2RdKBZ4A7QFPVD1kzW7S
         MI0A==
X-Forwarded-Encrypted: i=1; AL+hErEVxm4puILt1oJMBMWqlWyeA5JDHKmBSxY9iQut0pKMCHQn08rV52yrMMZLmlgiujIG+l1Kn3EtsejHchA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+klmdqIpOoDizJhE6ksQWm/CKBxPy191RsM+YrhMXHFm4SXpW7
	gYk1orHOYaJScLKE6Yohxiz3tEk1U+ujLBEmNXvFjfFeeFfZ5tCioV6U
X-Gm-Gg: AZFdTZepu/gLiC22e6Rpat2O7jpf78vbBS691/D2suIv4ps+aiLguRChtwbmb7/nQBR
	lOTH/ZTjDN+NPhkQVbUGNKMunQ2hjkW3FXpXtLZczEcRNFtyfGtCc9oBXGotv0y6pEBW4rSb6KS
	mI78vCeVCh9noa3QB4mbxFGT12tQJPRrTRXip+aAk8mFEkjU7WrNmYy+8j/01AaoQrQSgparvU/
	IU6skcL9viwBAh6QyzC5jOBNfiFEZtUwAaNYUy6UP0rlf0xFbhfMLMtIwc7tPmkHMLi+/mE+wR0
	8C5cZExubtqcj5JaCgs1P7kLz2G6e0zOne8SpBGDfZe0NM6+42L9iqFIH5spY31HRjOeT4WrXNi
	f9aOAt9fP77INR31w4iT9+uXi/YGI8nXP7yQ9dTBVmX9kBu3qCn2x6P+neY508UAAlkAkQkHrh8
	DkJpLdsTs9MOGRE6SymYdoci1Xx9fskUz/B32FeG28BawDcTfgrmGUsfmFPt2q1q/GC8k8Jx0Wk
	7eqNBfKrmJg7TdB9WYiahltQ76EqrLe/rQpKsWYrmlLMdZq3r1GWeHywYOJPUwjpOk1KqtUbBfa
	GUNEIxBFFlze1aLKZsIy3VVDLS2aD+ibYEUYj8osWmfC9iETtFrlDNJV3J/RaBkOXt19UnB6Lut
	g0vvrlFuqZ9VkMko0Yj/Gx5wncnYP/8SoCw==
X-Received: by 2002:a05:690c:6e83:b0:8b4:ccfc:e38b with SMTP id 00721157ae682-8b4ccfce9afmr29883057b3.24.1794866354031;
        Mon, 16 Nov 2026 13:59:14 -0800 (PST)
Received: from josephs-mac-mini.local ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4ec064db9sm9656117b3.27.2026.11.16.13.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:59:13 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Mon, 16 Nov 2026 16:58:59 -0500
Subject: [PATCH] drm/bridge: adv7511: Accept S32_LE I2S samples
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
Message-Id: <20261116-adv7511-s32-v1-1-40ae8228db42@telaak.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0NT3cSUMnNTQ0PdYmMjXVOLFKPkZEOTpMQkAyWgjoKi1LTMCrBp0bE
 QfnFpUlZqcgnICKXaWgA/ed7CbwAAAA==
X-Change-ID: 20261115-adv7511-s32-58d2cc14bab0
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

Commit 7c3127e4814c ("drm: bridge: adv7511: remove s32 format from i2s
capabilities") dropped S32_LE, which adv7511_hdmi_audio_prepare()
rejected, as the ADV7511 takes at most 24 bits per I2S sample.

A CPU DAI whose only format wider than 16 bits is S32_LE, and that puts
no padding between words, then has no format for 32-bit slots. As
hdmi-codec's I2S_FORMATS comment says, a 32-bit format gives such DAIs
24-bit precision. Advertise S32_LE again and program it like S24_LE: in
I2S and left-justified modes the ADV7511 takes the top 24 bits of the
slot, and hdmi-codec reports 24 significant bits. Right-justified it
would take the low 24 bits, so a 32-bit sample is still refused there.

Tested only on an ADV7513 fed 2 x 32-bit I2S slots by an OMAP3630
McBSP, where a left-only and a right-only S32_LE tone at 44.1 kHz both
play at full level.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
Found while adding set_tdm_slot to omap-mcbsp, posted separately to
linux-sound. omap-mcbsp offers only S16_LE and S32_LE.
---
 drivers/gpu/drm/bridge/adv7511/adv7511_audio.c | 4 +++-
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c   | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
index 87e7e820810a..8e38b936ef6c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_audio.c
@@ -105,7 +105,9 @@ int adv7511_hdmi_audio_prepare(struct drm_bridge *bridge,
 		len = ADV7511_I2S_SAMPLE_LEN_20;
 		break;
 	case 32:
-		if (fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
+		/* Right-justified takes the low 24 bits of a 32-bit slot */
+		if (fmt->fmt == HDMI_RIGHT_J &&
+		    fmt->bit_fmt != SNDRV_PCM_FORMAT_IEC958_SUBFRAME_LE)
 			return -EINVAL;
 		fallthrough;
 	case 24:
diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index d3964adbb106..0cff81a6c086 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -1351,6 +1351,7 @@ static int adv7511_probe(struct i2c_client *i2c)
 						  SNDRV_PCM_FMTBIT_S20_3LE |
 						  SNDRV_PCM_FMTBIT_S24_3LE |
 						  SNDRV_PCM_FMTBIT_S24_LE |
+						  SNDRV_PCM_FMTBIT_S32_LE |
 						  SNDRV_PCM_FMTBIT_IEC958_SUBFRAME_LE),
 	adv7511->bridge.hdmi_audio_spdif_playback = 1;
 	adv7511->bridge.hdmi_audio_dai_port = 2;

---
base-commit: 17a180572ca50c8d38f3aa47d6fc81ce7c5594da
change-id: 20261115-adv7511-s32-58d2cc14bab0

Best regards,
--  
Joseph Telaak <joseph@telaak.dev>

