Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B363CDBB7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 04:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789880167; cv=none; b=Y9K6Y5ViQXgABIAoTIo+rL68Ogd43ZCtTKQI+zP4yxvzHeMOuEBTuVpZHYZL7CSMnCmfVJ0oIyUkey/3q8J+atxr+rtkj7G4pY32xEqwtbRYA+st820ee2RlvBiNSAdo665ll+NYX57dDVARU552clY/3Ga/ILElfG5j7GV0MSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789880167; c=relaxed/simple;
	bh=o6Mmzyd7BRwU9H5C74qoe+G2Tq+aI/IRIDM1u7th/B4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PBpbvfLCu0WdoObof+h2+9L41F+36q6Y9reYXMuQZYga+XtuLyH3hP4uUDx6ndsoxKCnc6nhYqxYmZXoEbRkZsWw2G6glimPgC42bQ4e37Re4NkLYhZQP95fC8HabBTveFSDScJwymWGHhcjg9FjBDk4Q301VfcqrvWt35Yfzds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hpw+OhY/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hpw+OhY/"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747eb79f7so13408645ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789880165; x=1790484965; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=Hpw+OhY/r9qvfCb/v6ZNx2vv7z/yuQFjsE2BS4T1tHtgfPZvUs14GJb+sdbYRrSRnT
         RrlcgQBZNSYqMuVZvSZMin1wDbW1vS9Kg/WHL8SmBXbXPSbBKNuCN26cX3r7R0besBB9
         +cSqmZ0XOswAcUPuyU889PYF/GGNi1//waRVmmxOBnHqEaAC89oCIvpsvn/UzYdInEJK
         Q8ZILiMZKRFgx1OeGeddk2RYiVoTVoJ4V6iZ7veXo9xISPii8pbyr0CACWhJ3RZL0T0P
         wwOI/tYJ7vR/jnT8E23DAvSQZ6+dyE0CMKwCjg/GVcJJOwxIKVpO4OgsMtmCtGbAOfAX
         +fcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789880165; x=1790484965;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MoZTcxnKczPWM7o1mzqY2ipongGCpZ7IBnK4RjYvUM=;
        b=Ivc8wOl+PvbHYdrWr4TZkPkJZLnqifYK6NP64evnCmXY9HD3gMYNbH4r6KvD1+6DFj
         az5lXRqN4EFTUhg5IVsUAdfZM7JC6ht8Zglf2jl8v6QecsakcwzJpDNs40+qZ97+3bVg
         aSMiTtPgHKJSuYev7hmios3a5Ox86X+j4qG+S3/+MPFX3yB5Rjmxxj3tCkEk0RdqV4R5
         MxtU7xjsNaxmapo6oOQ0Z90NrklC5kdd0b7/AcotUJXkhid7d8khI1Y5QBuqSmyvp09q
         6QxCMhmRL0kV53GIWDk6jPjR+3TvDQNkoj8A3gOTJO2vOEO1GB2YtkzMStzEORKhAIjb
         OyEQ==
X-Forwarded-Encrypted: i=1; AKwUvBywA2m9jIbIuP3VnqNJdsKAGyGntRK3BHiqmBHNlWzLehr18PF/0rc5jIc69CcsdrKdP0w+IXDr7sxYnfA=@vger.kernel.org
X-Gm-Message-State: AFuF++mJaUSm9weHX20CDRd+tEpZhPLySD1Woppf5L1P+6i7Fr0K3Z27
	mQHkWJqP3ke1H/WTcsRHSM+G5CJD55wsyA67+yQq0zc1TzI0q7DD/eSE
X-Gm-Gg: AYBFou3hYHFvjEO6lHKlseNQVBTabQKNIcoHG9ovDbe0i9AKhKh9yR3LADvH39CyNcw
	CLzAKzrvT/B+SV8GZoA1/lGZcWrd0XPUX99YCJ/jVKGtv7oITdK29hDImNxAZI7Tm2/c7J5edxa
	lmGBCTsWJEduNYa6gTzR08n/hbSzGvFb2ciY1CXyDj2rvVEsCMc7edmpGdB71kvthq85Cs0pyeH
	ovQ+krEI60YCViIyB1LtYISyXIo7tJIkaObJgqq2sGSukOumdjHdafsDBFxajPI0B+euwUzYLJ2
	PgcDr458XwIDNTkzJMxsO/rpvvI1T1GDoGaj0V3sDLvkIVMgcHQYQi3pjkRroJAGlJaOZ49CpZO
	m829xB0cMRO3+YieRVFr5/6uRRhU6L5Vu2dykrMpbha/hTMBYVJ7dECNMJPCM9PwUQz636FEVDH
	q9cX3ji6RcyqVwlx36UJ0sXZVzGmdtJ8lq8O5bFZgb3h0NPbRJsDqPa9cAN2p5ouF6jfZZWYxn1
	H4bNVzgLaLxw1p8n7BmFOtF5CT1oXoFJaBXU8GmF4j6ParbLFF/ru7za4u6khLz1RgPoB2+SsNw
	8gQeTL4DfeTkkgNpRyZ4vgJsTPD7CEJHh0nKVNI9kMfXUIQ=
X-Received: by 2002:a17:903:fa5:b0:2dd:c053:82f1 with SMTP id d9443c01a7336-2ddc053841bmr56459515ad.40.1789880164957;
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17d712dsm16026765ad.64.2026.09.19.21.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 21:56:04 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 20 Sep 2026 14:53:45 +1000
Subject: [PATCH 06/28] ALSA: dmaengine: Always terminate DMA when a PCM is
 closed
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-macaudio-v1-6-741cc20a74e5@gmail.com>
References: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
In-Reply-To: <20260920-macaudio-v1-0-741cc20a74e5@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Ulf Hansson <ulfh@kernel.org>, Amit Kucheria <amit.kucheria@linaro.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Vinod Koul <vkoul@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
 James Calligeros <jcalligeros99@gmail.com>, 
 James Schulman <james.schulman@cirrus.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com, 
 Takashi Iwai <tiwai@suse.de>, linux-mediatek@lists.infradead.org, 
 Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1367;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=zGb+++j8iUZe/cn0Z0nFJK8T6VZ7UceNkKMJL+0HzLM=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFnr0+UNCs+tnF8jm/Fr9rnD+qaz/5/MlJvafvnEpdXpu
 SeWZM6J65jIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1kxJGhmuLz9eF5142Xp283+/t0Rc/gw80iqvZZe94zfXn23/Xh9UM/2yWb2j
 yPuE6S9JqBqt0gZDlkrU7xeS3e7Hc+lrDvndKKxsA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

When a PCM is suspended, we pause the DMA. If the PCM is then closed
while in this state, it does not receive the STOP trigger (as it is not
running). In this case, we fail to properly terminate the DMA, calling
dmaengine_synchronize() nonetheless, which is undefined behavior.

Make sure we always call dmaengine_terminate_async() on PCM close,
regardless of whether it has been called previously or not in the
trigger callbacks.

Fixes: bc0e7345168c ("ALSA: pcm_dmaengine: Properly synchronize DMA on shutdown")
Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/core/pcm_dmaengine.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index 1306b04be171..e59b561b849d 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -355,6 +355,11 @@ static void __snd_dmaengine_pcm_close(struct snd_pcm_substream *substream,
 	if (status == DMA_PAUSED)
 		dmaengine_terminate_async(prtd->dma_chan);
 
+	/*
+	 * The PCM might have been closed while suspended, which would
+	 * skip the STOP trigger. Make sure we terminate.
+	 */
+	dmaengine_terminate_async(prtd->dma_chan);
 	dmaengine_synchronize(prtd->dma_chan);
 	if (release_channel)
 		dma_release_channel(prtd->dma_chan);

-- 
2.55.0

