Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793814815;
	b=K2gGfy5wg8a01YQvzbHJTH89pyPKJjc5XwXRi2VTpEOHvQQa+MkuZnf/mJ9JJzkG4CCx
	 J3wIsOZ4eiHEdRT1CzuWiv/ZSksgvsdtHalNNpwR4/RZYfM04O51arsUOpLOCTUCuO001
	 sWyxwfAq8X1tQ1B68J1xSR4Sny6wau9IDNL9TLUtibrbQKp3veIngj3OSloLHbQ7/oC/p
	 NPuXCObXphrbMLzvFJFA1KKrxDsnssZd1O4Q2pnFcUMHz9bx8EqMefBjQOtUdwGB5L3Xw
	 fk2YJ5ysw2i/lKJCLGrBdHXLbkCE0qVYeNA3DG4j44uZZQBA4BDeEj1M3lhzAnOVXVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793814815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=nzrMeoX+0unzTNhRa/szxB/nypWquuAzb94RbOq3TGY=;
	b=TkWr13Ju28vm0+b92SgMxSsxpnR5wEdneBiZgHPIatyCIWZZTIjQAIhBVojysNWuFwD4
	 6bcta3fbqaWvHX955W07yQVLZ2on1Ej2eYOblXZSxjVpxRanKtR4UcboG5fHTQyPn217P
	 0ozlEA4QWBbsN96FFUQ13Q9J0uMfLDnW8O8jZjiIB0+f2djD07ToqZsUeZvRGjNRsIyGC
	 CTO8V46S6SCZMN0zzJ1dWoTvPD2jHQaLwxNRvuZDBHNPfEWXq8p9vNF0ddHTjPE90ZVCh
	 2H+8KLiKidO3SPhM6kbw9W8ZK8GctiGxSgBdhzCcFktorya+zCBjldyobvEfaCJIsaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Vz9cMfK;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42199606B23B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 17:53:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42199606B23B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0Vz9cMfK
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33fb4680717so1712553eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 09:53:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793814814; x=1794419614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nzrMeoX+0unzTNhRa/szxB/nypWquuAzb94RbOq3TGY=;
        b=0Vz9cMfK8u6moTgXlMIY5a/rImfB5jFn6ckY0QBHKq8XwbZej4c/T1mgzge41Uib4f
         n3bPRZs9GHvRA1B4MslwpX2y0hCqjtJkWz5ayBYoaJkmksPtzkSVGhyxAkiZS/tlpQyq
         QGuRflrCsD175W927B+wa0jWsXdX7GHKG5QzqrWr9US4+WJW9EYc5cgxfw1h5/Nfx0rj
         vTxwtuf0QFWVP+6DQFqjn4EEasQfVj6a4n0lKI/MfgNuntckkAJ6fkSD9kIRE4SUwrkZ
         DuJ52cCsEJ/xy04/xMzdCkRUcPV9Wc3GwqmW4pnpUPDQXE2VaM+pVvUMa3ETZ5YMr6KM
         F+hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793814814; x=1794419614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nzrMeoX+0unzTNhRa/szxB/nypWquuAzb94RbOq3TGY=;
        b=CH9vpXhSzQl+Ltcv5eeW6WIFMvQDZnS0kVJHariDIvm1+nE0XN9rxYak162M58IdQZ
         vU7BvqVFZ89Q3s1SMHiiTjhPornYnDmR8Wbd9pmik+WQrMDjFIwylNioQP1wrvCwU+6u
         33HrSaUDP05On/cJquRP+QdmEATzFrI4vecl8g0duHAMzKGsYNLNlRGSF+gnVWg3h62B
         OlFTIzkQudWj6gZhXnq+mwr3xwmkMlnf2ZyY5Suratrn34BtP08e1FrSGJV/wiNkIF1K
         AQJzPX9gmSZV7zWS+NlPSkJLCWOQYJ/cbMCUg1xh8W1F9gsnICWh3UXdk1RzLuybzd1j
         25Xg==
X-Forwarded-Encrypted: i=1; AKwUvByHN8QE09Hwav33ZtxlGF/82JgaDQ6vvJ/8Z9s3MO0wpiyNE8WqMNXn9H8wAXonD0o0Cq3pCchuKevcIUo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/qkkvJFtam5f5C9VKVJanXCU7rYk0TMTrUndSu06RnKPXZEKKZ
	WTgexFvqrJb+m5NMW/VqH/7FtVtVU6yfI4Bvb2gBby2KloJ6pqBJ3a0=
X-Gm-Gg: AYBFou3CNg2sHACaAX8yKDrSxfNigkcFACba/7EAjjUaw7CNDAelCjnbwIUPXM3QSfg
	X08vnSN9vYZ6Xd2KaYSMO+RibnF8c111fF5MwyVTuX9LG6d5hcRiHUu4an9cpUQ9Tk6JPuhf7eD
	Osj6rMbRggaZyty4AO8lJeQWG7s2wQI9T3VgleexY5tJ9YC5H1Obh2fxwzg8MuC2wzWLWEP/kgK
	wM8S3ksjggEuJv9PXks5RlSrA4Qo6+/xAS70CoW/cPnr3/fOA2cqtHmyFf+F1UdvmOeuyX2Ks79
	FCmLwMDPFalcbEb6whKccPd50rh+jUC8NBfKZRIq3q46tdpspLgcM/5ya6+M3Ky2e2afRK5Q2+j
	OAeO23GaC/LdsAp41pjYa+tbJpVVxE5KNPSduQbnyxx5XRxyuRrzwasEHKYEfa0k14kzD0qz3ZM
	6++P/RBb+HYgitAuAnmC2rBBEcb4UMAzousqXw0tIBWQB/EM4J70CJjtf3WG8/VbpZia9J79SZN
	HzsUiTEX/+waOZdz8pJ282zhIKiqsg7qoXQM0GSHNDkhk7wDsUJ67VRKJnBxsW4PfafyUb3Z/AL
	fLu4EGXtnCvKKSlaaJWzrzj8fN+GrPT9vOdOedCsy6bQ6vp+np0SkkNS3rIEKY2wgaqp6g==
X-Received: by 2002:a05:7300:fa17:b0:36c:3b8a:8089 with SMTP id 5a478bee46e88-36c3b8a8474mr7678595eec.36.1793814813579;
        Wed, 04 Nov 2026 09:53:33 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca394f297sm10458939eec.21.2026.11.04.09.53.31
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 09:53:33 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-sound@vger.kernel.org
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH] ASoC: cpcap: use the platform OF node setter
Date: Thu,  5 Nov 2026 01:53:26 +0800
Message-ID: <rc-review-20261103-28-afc55c614a25@gmail.com>
X-Mailer: git-send-email 2.50.1
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

cpcap_codec_probe() gets the audio-codec child node and assigns it
only to dev.of_node. Platform device release now puts dev.fwnode,
so the acquired node reference is never returned.

Use platform_device_set_of_node() to synchronize both fields and
give the device its own reference, then put the local lookup
reference. The device keeps the node until it is replaced or the
platform device is released; a probe retry also drops the old
device-owned reference.

Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and patched target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance: Codex (LLM) for ownership analysis, code and changelog.

 sound/soc/codecs/cpcap.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/codecs/cpcap.c b/sound/soc/codecs/cpcap.c
index eaaf141dea57..eda72fe830ae 100644
--- a/sound/soc/codecs/cpcap.c
+++ b/sound/soc/codecs/cpcap.c
@@ -1761,7 +1761,8 @@ static int cpcap_codec_probe(struct platform_device *pdev)
 	if (!codec_node)
 		return -ENODEV;
 
-	pdev->dev.of_node = codec_node;
+	platform_device_set_of_node(pdev, codec_node);
+	of_node_put(codec_node);
 
 	cpcap = devm_kzalloc(&pdev->dev, sizeof(*cpcap), GFP_KERNEL);
 	if (!cpcap)

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
