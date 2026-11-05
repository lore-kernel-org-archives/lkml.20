Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873029;
	b=JLaTV8bDc7jBKxN2wyTsZCBhlni9KmkC92wrZc3Z8fu2Ai9GEWBsM3GoGqu4gaiGdO26
	 Vtamwr2NPK8cblUQRqRlWFdvMYd3jcjMcP3VfrVkksympu++uACdpEUdLu8oCl9R824Iw
	 NZVGf3xvVAusY90ue3L6IWbrXCTvYO4PVmmO5tTy/TUEEdc75GLMfxaDD3Oaj06S4ms1q
	 TpAQ7dF5BiFAHRp3S2Vaoy0oLgFkIz/K8upIYBhlsEKhuR2SdVBMPM67CVkTt1RCCUwKz
	 OF6Me94sW3SH9OhSd1x5d/+51P5HCr8kq8YEMUczRAWHZetoqGsrjnbo0fcCihKyccg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873029;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=obVgseqllJp+RhoG7Gft1OnXkOIDVqHcrqcH9dUcNao=;
	b=YSG+Ckfyo1aPb6kxA/T1zwOdgM8bFHx/A/A7iOIAMfqO+bQmYjXIXVps3OGTPocOqIw9
	 SEYb2I7zaPWNMkTlcks7q5GcTnOFjz3QZ+Nu9SVBgljExr81FkngNhjOKalt/ZOZMuBwg
	 FB9wgG/HtTSxAw0bA2uD9SxADu78BBE/G2HO4jfMUhcaQTDpr1HsVzwsZZshQFdhe984M
	 13uTz2d0uxcnj1iYN8heC2QGKYAbd9DFecdSrzsuz+jvGNRpAfo3O3Y9w+bx817htOJIw
	 ox9SLV9nz3hdQkHqgXwc0C2jvJCTLuyZLvOOd5CLp7FaOIX5Ccz831zdIZf3K7xZGLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXKFyooY;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FBF9606D814
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 10:03:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6FBF9606D814
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YXKFyooY
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8a05f2d5cd3so814257b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 02:03:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793873029; x=1794477829; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=obVgseqllJp+RhoG7Gft1OnXkOIDVqHcrqcH9dUcNao=;
        b=YXKFyooYIHFb4nWIyXpsVayURWHLrLNvt64X0CSc8Oj2vnRyMxz30CedCuXh3hGKyr
         J35/OzOzEdTv9GCtMhtL1bz3x0lLmAfy+tc0EKZvPp3wORSNQlSTvi2qfpuhHud2zdES
         UQx6jo216w9klQIA5USuLifgSA7WzPsXzjmVMUH9MIMQw41gDEP/dan67OgLw0gUfEna
         sl719yH/1TxT2YN1GqIkvwtZlpgIxlUrHq9Eupe57rsJ2GIC2Ew/9LcCIJv3Z4FcjvWv
         /FvlNEjdFa/QRTBGp4iEA43H9cpfV+621vn6e8rdPBkdTZS3RStPI54nXJZxuu4Lob2d
         EhBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873029; x=1794477829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=obVgseqllJp+RhoG7Gft1OnXkOIDVqHcrqcH9dUcNao=;
        b=1/2oluy5k1r7TtC2F1U78TBCFgM5BOJf7Irxp63zdG5iHOh22l8feQLtgpfS024BNy
         9rEewqS2Q8NROXbDUCkbI33mtDsovrUocflnFby7hiYFkWlo6WwGkOsaSkkLx8SbKXD2
         VgSBOFrJMfT+zRDHItssh4L89E7u3jbKkyuFBROq6CVmE/hDp/OizGvr6tmnXk5Cw9CM
         w7cl9fqunhd43JLfl/yL8i91MOYRugfez30v0c4go0thky3JfTx/FbVFmSC5T0iOkAoI
         Gm0XGXYUrDE8cAX2qsarouQYCbS+aiPNEvwrTDR2QKGM3SL0GhwseSB+r2unL4z0VWsv
         N8gg==
X-Forwarded-Encrypted: i=1; AKwUvBzGvH90NggEo+NhrpFy95/4q9kccL3O9f2yAdjIIR/6V3SGNeyYUN5oxe49ZtLHIVCH1r2ZjnfvuFgARS0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eVqGJS3pvIjYPuKASXbfrpbm1NbbhEU6ULFu7HCogRj9NJpmt
	ymfjqmnqJs5WPAv06m3OUHOD09H3aaE5QpMZax3HnAVfTfp6qHgDhpU=
X-Gm-Gg: AYBFou3E1uGf7Qq90b5xyxzJkkkgcttUJ2X48EdP52pyyjczdAKkWBvLSPORxAZafIQ
	YkMfjGbeYyJ8NQoFn+1IH3FK1dox7K+dXo6P9T6pMXzmcXD04BVbAuGDU9DpFnlBFJqAW00KoY5
	xJ3Z/y1A/k91etd2CV5Jiww7TtHXZz+4kV0s3ZVG1QVIfYrfblmnyMIBEKBkwM5AotoLKb8bc/d
	cvEal4Zkmq+4bFKULVVEU85+RSCKplERWmiwjfFjMeBoD9DzT+pGwdr3Wqr6ufwpl0Z9M8U1XU0
	jDiGULj8GQBAvO8NJtZjMwPwx6/AppBPbezLBCeBBMRchAF9DmAZyc8RA4JcHgbWqF0ds8OWQDr
	DwUlAeOwqt7ifwQNcW0huaZORYog896RpO3Z7p0t7MKfcdGhdmp7NeM7hXrGa2WEpyS6aU0JIgF
	19vDCDyoZ4g+yx5xKFo896rz/X9VzIuWBSOGA2VSHsEopw6kSsvmQRu3N7o//pFQGARpMTx4Ckl
	3VNQxltdbyq76MK2rGYMkmpqKMum9YXEMjyh4+OlwfyzE5uo1dt2pTxPIFFgaIXnZjPU/gJE5+q
	A3TsHkAH4tuw1iiM3ABb8yAmTwil6kSqLFd15Se6UWszAXQF6esl
X-Received: by 2002:a05:6a20:c98d:b0:3e2:86b6:9be9 with SMTP id adf61e73a8af0-3e928d4687fmr15100367637.28.1793873028571;
        Thu, 05 Nov 2026 02:03:48 -0800 (PST)
Received: from localhost.localdomain ([202.51.247.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09ae9d26csm1867523b3a.27.2026.11.05.02.03.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 05 Nov 2026 02:03:48 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <brgl@kernel.org>,
	WenTao Liang <vulab@iscas.ac.cn>
Subject: [PATCH v2] regulator: as3722: use the platform OF node setter
Date: Thu,  5 Nov 2026 18:03:41 +0800
Message-ID: <20261105100342.34730-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
References: <rc-review-20261103-19-ee1e37733b2e@gmail.com> <brzyrqnyrayxdpnyginamtdewj6cp3odhndlstjp6kupnr4q3e@rt73ebxxvbms>
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
give the device its own reference. Use __free(device_node) to release
the local lookup reference when the function returns. This keeps
the node valid for regulator matching and the platform device
lifetime, while also replacing the previous device-owned reference
on a probe retry.

Fixes: 7b5b51b2b05c ("driver core: platform: count references to all kinds of firmware nodes")
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Use __free(device_node) for the local lookup reference, as suggested
  by Bartosz Golaszewski, instead of an explicit of_node_put().
- Remove the Assisted-by trailer; keep the disclosure below.

Based on linux-next next-20261102 (2637bdec0535).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
Baseline and v2 target objects built from this exact base.
No full kernel/module-link, hardware or runtime test was performed.
AI assistance was used for analysis and patch preparation.

The earlier dangling-node fix is already present in this base.

 drivers/regulator/as3722-regulator.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/as3722-regulator.c b/drivers/regulator/as3722-regulator.c
index 85e2aaa1a06b..ffcefd72316a 100644
--- a/drivers/regulator/as3722-regulator.c
+++ b/drivers/regulator/as3722-regulator.c
@@ -585,18 +585,18 @@
 static int as3722_get_regulator_dt_data(struct platform_device *pdev,
 		struct as3722_regulators *as3722_regs)
 {
-	struct device_node *np;
 	struct as3722_regulator_config_data *reg_config;
 	u32 prop;
 	int id;
 	int ret;
 
-	np = of_get_child_by_name(pdev->dev.parent->of_node, "regulators");
+	struct device_node *np __free(device_node) =
+		of_get_child_by_name(pdev->dev.parent->of_node, "regulators");
 	if (!np) {
 		dev_err(&pdev->dev, "Device is not having regulators node\n");
 		return -ENODEV;
 	}
-	pdev->dev.of_node = np;
+	platform_device_set_of_node(pdev, np);
 
 	ret = of_regulator_match(&pdev->dev, np, as3722_regulator_matches,
 			ARRAY_SIZE(as3722_regulator_matches));

base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
