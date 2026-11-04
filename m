Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793807977;
	b=nefqpmwqg+tFw0SDYoRHBwuuH6o7loJ1ZR2GZwVkugF+FryWHBesU4wPX7fGdO3XRJ/z
	 82m6B9K/X22LmAuXsS+LLSMlqRciLfoqa3P+T0xYHVH9y7Pp0QN1ZoGKHrMggBnl34Mz7
	 79fbiGey4gUqmHGPbTjU9gz/xDesTtRhsOltAxMyUQWwqYhCCtji/5jXLrc0dsqN5R2ZO
	 yLRHls0aiI8vbLgoI5mhTfKK2BHyxDcqiXkq1CP7Wvq2t2BZNtDEdElriNb0x5HWhNpnr
	 sBcnzF+eOpG20LBtPxl5HDyzc8nr/pppTfguZVnjazXAa62SJVt2XbtFkWB57L0/jiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793807977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yDFM3OH9coPHnXLmm96GcIlRNTlI+YDQ+IxTXn6YrWs=;
	b=wnWk9dPA4k81GaBfi5qz0vPIByOly/S7ejnKYR9soedZRNOUB9SiB4yQYQsNBJHquFeM
	 zrg3iRYirgaQDBG3dEWH53+btKYHqPQ81wvEzgMRCXAmhAa4fq6WTjqFIa6KUWZeqopId
	 +asdXVP+1+qbJXVcWHZ2AbYlM89izAtH5Eka+sH6bLtdduxz0U1M+uiboGhf8Ey6/mUht
	 hMA9PrSEn7k4H1wjHWLVrAvWZrmbRoAuD8uRKUk0hwBbbCeOSzXrm77CRHChMwRRymZve
	 Fx4O8f3nzlfMW02dffjn6iGwT3HzFahOxMn4ZDO6W6IdyjkngAOH9yNdij28PyRzhuw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urUMiGWt;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38D7606A33F
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 15:59:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E38D7606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=urUMiGWt
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a208d93758so9621835e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 07:59:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793807975; x=1794412775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yDFM3OH9coPHnXLmm96GcIlRNTlI+YDQ+IxTXn6YrWs=;
        b=urUMiGWt1Hr8PhqWhR3fsS9H9vVLI5GgS7YP7e4IUiqEbNnvhuLfzyR0ahOqODdVm8
         77J1mn9vMPZjXcGIn0ZmYk+mpPk4ZskWXKitEjx2fEs3bHbpTOjE8G66n12NHv1GGCkF
         HVjeJpUawL7YnP9t6vVLkangul8UMaAjSmn7n8tEP/QiIZ42+ZtJLfIIKZLYvDuBIpeu
         71NgQ0ikE1zpKpqYMb35Io1cjdJNgq0inoB8MWnprvW/WsQ59awibX9BMNVta8jwxXOf
         KsfoUva4ws+mDhK5pZbFCcGtiWQbmelBFP7lwNL8mZUFHzsk8FLo5EUkpTYkZIy92JBt
         JVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793807975; x=1794412775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yDFM3OH9coPHnXLmm96GcIlRNTlI+YDQ+IxTXn6YrWs=;
        b=fUG3HchjhfJKGhjAqdt5L2qUMEwfQdV0Q24nVKMjaheibKoaJdmd8e5VMee3oSQAAv
         s0KOAe9fWkYItG3dEVJlOLG3YOPFZAwYRdYl2U24Ds4IQlruXM+/WeZBl18F4/UgBdC9
         znTXiLqXgLqWIALv2PIU21B8iLmxma1tfKchQFW/8A2rx+fLf4LpVBJiasPxuMbQRl1R
         BEEpoRJ64jMYDgoRh1n/h87kqd19mgRXeOmg7EIBER1BVvqJc51onzYgZ1MlOr7rLMyU
         xYxMLBWMCVjn6QvKivAUgpavnJjelNs+7mJT6ffdQvtRzK7vmuIAQMp53cnufPPSL4j1
         Ukhw==
X-Gm-Message-State: APuU4Z+ZFF4/5S7zw+2aeCP9jSjaiDC7JjYxGkjZtOZlSLE1nKdeC7ec
	ivbGE6Rd8AGTo26dXt89r31Sgi+UuMH9Pp+Q5FVmifSe1RfbUCZNKzusnjTFFA==
X-Gm-Gg: AYBFou2LvrgKsccdAhn0CfmhwAAut8/1tqA+OZo4LorCL6iWHlJqogVZIAlhZjD/vc0
	xfvb9/ZW/jMBvlCzn5RjiRSb9p+O3RdQcNd9ygEGjyftWECsP+9hP5abn04RIWSV/ax5C7YzNt2
	yY3ruimmJzjHQv7y6zkVCvI10Bues0l5+DJLBwsKUr5iFrK4cWsUPfvvJjQikrva4w0z0OejwhN
	xYRNUdsXI7iCrU0rAeO9QSCZi6/SbQSI4a/J7hrWLm5GuEDc3It+b9J5T9ZuF0fnkg75RBAj6kh
	9un2e5E39SPxXXMUsXRId1PyIzOPRGZleg0y7pVGmKmWtZoNc+VSYcrlXUVZa0u67klu0/KoXFd
	xgz8XQIdH7eHcxoi68Gc2GZgYInfq5qs4Nc6vbiIf3GYlAbJN3TeQkAdDa6jux6C2qfCPock1Ve
	GFPT7MhUJroh1RObeCtUE83MKuHNYa8okcSNZPiMP8PjZNbxml8aUwd1TOt/dAT53Mod0yuPQfn
	vRaz1BamQ2Ks9Pm7pxAFX9KZ7rnGHVm7aZ1pTFeyE1hOlLI/XMlHKMkood8qmU9/SplFjt8TuaF
	xNbWbAFkcqCzo/ezd5DbIflLhd4KToY1q0Bw/CvuCjwBAUVXK7+WPupZiIyuZBO/Nu0lngduL5a
	X4bJXdpIXI170SLb1IIIVenarmJ3D0M5/F6PaEofOdcK7zjtEo2O/
X-Received: by 2002:a05:600c:1d29:b0:4a5:5fb9:5d35 with SMTP id 5b1f17b1804b1-4ac187a7678mr398465925e9.21.1793807974840;
        Wed, 04 Nov 2026 07:59:34 -0800 (PST)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2aae24b32sm140069925e9.12.2026.11.04.07.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:59:34 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Linus Walleij <linusw@kernel.org>,
	Kees Cook <kees+treewide@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	patches@opensource.cirrus.com
Subject: [PATCH v1 1/1] ASoC: wm8904: Enable FLL when switching an active SYSCLK to FLL
Date: Wed,  4 Nov 2026 16:58:32 +0100
Message-ID: <20261104155832.57738-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

When switching SYSCLK from MCLK to FLL, DAPM may keep SYSCLK powered
and skip the PRE_PMU event that normally enables the FLL. This leaves
SYSCLK sourced from a disabled FLL and can cause playback to fail.

Enable FLL_OSC_ENA and FLL_ENA before selecting FLL as the SYSCLK
source when WM8904_CLK_SYS_ENA is already set.

On VAR-SOM-MX8X, playing audio at 48 kHz followed immediately by
8 kHz reproduced an I/O error when switching from MCLK to FLL.
With this change, playback succeeds.

Co-developed-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Alexander Herfurtner <alexander.h@variscite.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 sound/soc/codecs/wm8904.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 96d2e54a2c6a..efa108544927 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -338,6 +338,20 @@ static int wm8904_configure_clocking(struct snd_soc_component *component)
 		dev_dbg(component->dev, "Using %dHz FLL clock\n",
 			wm8904->fll_fout);
 
+		/* The SYSCLK may already be on; if source changes to FLL, ensure
+		 * FLL is enabled before selecting it as SYSCLK source.
+		 */
+		if (clock2 & WM8904_CLK_SYS_ENA) {
+			snd_soc_component_update_bits(component,
+						      WM8904_FLL_CONTROL_1,
+						      WM8904_FLL_OSC_ENA,
+						      WM8904_FLL_OSC_ENA);
+			snd_soc_component_update_bits(component,
+						      WM8904_FLL_CONTROL_1,
+						      WM8904_FLL_ENA,
+						      WM8904_FLL_ENA);
+		}
+
 		clock2 |= WM8904_SYSCLK_SRC;
 		rate = wm8904->fll_fout;
 		break;
-- 
2.47.3

