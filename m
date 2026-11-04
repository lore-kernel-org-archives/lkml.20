Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793815769;
	b=o1SFLsr/P+0oGcpJUZll8k9k8k92G4/Ymn2FY3w6nddGRylqD7pPfmPDuswkMwtT5hjS
	 6Wek5NL/JcslyOY2RVr5tjJbBRdTOZAIKtfrXwObqD2tb6QuUUjpw41t8lPty0/9lEwdu
	 PltvG4NhEY6vp015kNGJ9KE5pE4Os/ty5LusZY3dSKHAlRF4bUy1nHI8DWLzAyXaO1SnH
	 0ErQhCOwTH1+cBmplEtQt1QWYDOQreJXJDOdoKZour+9cVgzCHp52zHSZOjx9QiYYrkMu
	 iyBaEoKQV1ntsXKuGZK/F9ZB/RzyWWa8Q//vtmWrOCNPkVF1DyDdlmykzuNk74Tcucg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793815769;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DH/X7CMoJzB+4JmKHL44grMTACQz+/uV7R5OQnv1UX0=;
	b=kksbuMUlDeh0gdG0PCsep5zPH0Hqr5OU71jJls4WhHbNAfdC+sCSQx7DXO9CakhQoMat
	 vDqzH5lL+qro00Aa0RROp92IJkFQ96QaCiW5aTiM+DI1Neu0wE+TAlcMeX5/jCVe5+rCo
	 cqsu6GsZwTBb6Ykm5wlugBsR/MFf+kKPxnU9S1Oanc0KFmeLSNbZjDlW0FTP5k+DXDGDk
	 ajBJdgj47W5RLRqhB9dy28n+vmoRTdEiEmTtdhEnZCChmz94kF4WULXAJjjvQpWx4W4tn
	 +tb3pDDm/HcKT58mP/wI4C5oWVPEpF6bbXWX53WjHRxu2bbWakRpSDOTEBoD3Ow0h6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHqs5X6v;
	arc=none smtp.remote-ip=209.85.210.179
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB69D606B094
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 18:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB69D606B094
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wHqs5X6v
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8a9f9473029so852774b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 10:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793815768; x=1794420568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DH/X7CMoJzB+4JmKHL44grMTACQz+/uV7R5OQnv1UX0=;
        b=wHqs5X6vVUnGEpJvTUOo0ekn4zze1KQ/yexR0K86n+jNdB9UcRVSIh527k+OlQHxK0
         Gr0FM7d2zKRqmzksrdtCRiZypy/CGsfH3ohIUrjiVtVhuTsHWnwEpFKgeN159V3uYpp7
         +fSH44XpSRlctHmW55L12/k/PZMM3l5dhT3+l5d1ols6yJtVElxY2zD3oImflivJW5qf
         zCP5+O8F46j2dRPTvN9x2AJJU0OH/6P3XoQyqf2jwtAdoL2AU5C+FS1bHLCPYRzt4514
         Dub+USGFAHTP1B85QdI/bxV9nbR2j82R4C4mzxHOhb5OhLE3k40eolHn9UWwUSZ7v/US
         GMkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793815768; x=1794420568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DH/X7CMoJzB+4JmKHL44grMTACQz+/uV7R5OQnv1UX0=;
        b=WzhXkpdh1+CgPiywVTSi9oElae13HBVaHWfiaeoIVRL4YEajIEQlYpTejbUytGdq62
         6XFTDWeFVmkJGfjdYqbt5tYscyUCkOB1wr5X5l2sW4pTE8e1/bEYyWHnUGUocEYtuvt+
         NJMnNtdljA4AdQ9hrBy8OaE+SoU4HuCEPVZs4cdsOlCmXqe6YepiroVE2BlN41So/UHT
         o8ZdkFr12gVfNEpC373OEjvf8VyrOdHBjCrUNrEJogWkF7Gc/0hFT07yt99Lpj/2KcN6
         sVFuLM7wRpMAT5b+frhbKFaRsA60A08Olm0iwihZES1BXO2eBBS3D1YksXQ5pVd4Xlo+
         dVLQ==
X-Forwarded-Encrypted: i=1; AKwUvBzyHV8cwvKVX1QAqKU3fE2k0W7m39sf11eTuiDRGBbQorEe9QHIVPc7ZafUQQeXadA95FWx7ZzWx7Gijos=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DWeKNKU2IQ8G+gAznCNVQ1jA1QaIbqgeae9f74Y960liueUPb
	efY8APZ4bSvQXnpFhGCEqL9A9KpLT7UruXPzoPsJlkODxQGzaH4+1GTOJum77/c=
X-Gm-Gg: AYBFou0qMTVg/15qZ1vK6LdIwKB+DelVtkzTC/nIO61W4S/R6vE0K0f5O2juHxL9BeF
	kWKJt2uETRbrwJs2Tf9S+UJV+5YvvQpzdlXMcBfmq+xCvttMo78KFvgEhnT6p9aLxLGGORXp1da
	towbcO6nDUEQDt712grrALF94lkSVqE0ZW6bHD4yU8RF1aUpfl9sZv9QOO3PA1Z6N6qW6nL+JYr
	LqX1x3JU0l/95IwbpUK2FfOtgOIG6Es8v11b8Af3q+rAmxVZv6JPj4FEyFxunjD9MmaMhIMn7Tr
	nH4/pLYC99eXHjcC+T4KsCmDRbn20qyt8pSmcuUYakjkLVYfvl809VxIXm/mxKtCdjjRKvJdLdA
	tdsaiFK35L36Y1jxE6N+/XOVvkaj0tnhfc04k+fO3Oi57fSi7oKMQKeqXqQ3y6NQpuueP9/QIjv
	XZG7gGUW5/HlNtJZsJGj7ic396u9EvyFz/KCvXH0xyK95TXC5bje1Vdho7AdZsfJVWx5XKZZKVv
	ggWmO3gr7nFvEOarE5N04FAgH/0/y9USi1paqAWQFBThaq4DLzlJ7gM32w3Ica5tF8hu8E+eCAp
	7yZ98aSbb1n0Me9KNBMa6OJdDGM3Lt5lPZY6zv6oDnue31ew9c2KxL73iYvliUtf1pP2
X-Received: by 2002:a05:6a00:a229:b0:8a0:76ea:36e1 with SMTP id d2e1a72fcca58-8a9ba229da4mr14780695b3a.7.1793815768128;
        Wed, 04 Nov 2026 10:09:28 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:a599:d119:deec:193f])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b097fdf387sm1245111b3a.5.2026.11.04.10.09.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 10:09:27 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	WenTao Liang <vulab@iscas.ac.cn>
Subject: [PATCH] regulator: as3722: use the platform OF node setter
Date: Thu,  5 Nov 2026 02:09:20 +0800
Message-ID: <rc-review-20261103-19-ee1e37733b2e@gmail.com>
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

as3722_get_regulator_dt_data() gets the regulators child node and
assigns it only to dev.of_node. Platform device release now puts
dev.fwnode, leaving the acquired node reference unreleased.

Use platform_device_set_of_node() to synchronize both fields and
give the device its own reference, then put the local lookup
reference. This keeps the node valid for regulator matching and
the platform device lifetime, while also replacing the previous
device-owned reference on a probe retry.

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

The earlier dangling-node fix is already present in this base.

 drivers/regulator/as3722-regulator.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/as3722-regulator.c b/drivers/regulator/as3722-regulator.c
index 85e2aaa1a06b..9bf28e4b9821 100644
--- a/drivers/regulator/as3722-regulator.c
+++ b/drivers/regulator/as3722-regulator.c
@@ -596,7 +596,8 @@ static int as3722_get_regulator_dt_data(struct platform_device *pdev,
 		dev_err(&pdev->dev, "Device is not having regulators node\n");
 		return -ENODEV;
 	}
-	pdev->dev.of_node = np;
+	platform_device_set_of_node(pdev, np);
+	of_node_put(np);
 
 	ret = of_regulator_match(&pdev->dev, np, as3722_regulator_matches,
 			ARRAY_SIZE(as3722_regulator_matches));

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
