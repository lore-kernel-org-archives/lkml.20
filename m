Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886067;
	b=Ucs0BbYXRHmU3CCHomBwbZKy9nOQsi799RQeqEveKErwj7rYyPl08CDLqosXOgdoUoFu
	 lUXHC/AMW9pbShCelrZKnwpY6Ryt00FM9dJfT+/qPhEypLaWNNDzMg7A4eo2g2x3bM2if
	 NQwUpS5/Yjrlhw0VwKA7Vwv21sdM50ewDJYGK0lP1Xe+88MnSrurQEfSjoQ3r/foJiPKi
	 oKKPl4WYBisqvr33CYyEU70btnHPtfiRKy/oHDtuSOhlL9HdhZ6aPSb0EcmdEd2f6lM0o
	 0rHT/DgP9jeDug/YnrKqA6FiimZM2zrB+j3qOekvbjM6gPA2U++0p0rylwy6OGo4xmA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886067;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hp6UnAz42BYtWNNKJvUUuqRoOotKOANhhbOdLXq6OJQ=;
	b=cmVEsKNfUQxLTFbsO9r+AeqkP7mgjSYlGt0URzwttMgx+b2WJokDJjP/LAmLZU4jJcdZ
	 r4rEDGbQZrK7D+Sh6vHufxaRt6K++6IqHpd5DkY/7CTqJZ6KHgjxdN5JOAFCRwdU3IGJR
	 ghstXfbI9jx/1bhkHyPce0xGG5pekplJfXV3pR4gpnf9cEgp77xXk0D2Jdgptp8WG6Ejk
	 N/3GJOQtNbEinXL19OUC9d4Wi4pxCdj6ZofCICUH9d1t3eeXtXW4+JXwbkZ7bs8k7UJ7X
	 XQwH3lk5BzdJEjkiZck0vwtzrEal35kb+5/IKgWhZTuA7eF2ytRTaWoC8z8PslJoDqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ok3bum+k;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47D6606A326
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C47D6606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ok3bum+k
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a20a37703bso14181805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793886065; x=1794490865; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hp6UnAz42BYtWNNKJvUUuqRoOotKOANhhbOdLXq6OJQ=;
        b=Ok3bum+kYvQiNNVPVy7x8MhzFunyBfvADRAhnTB7+cwO6+tugOJ5xnDLLZ00Z/OrAv
         x2Ov0Z3BIhC+y54oNNHHdjxPDHGTaOu0dDuCLDwwRYlpAbhrAcq6dFE3gf6mL5fUDg8k
         8ealx2J5YgdeV2VsojZOo50+pz4krGWNKLR2i8ZJ1t+CJdU8D2sec5z6MSsy+vSnWbiO
         V3sU+/tkhsBax7Yn2j58u3JPx12C37ybV16YgzMQk4wg3LgtWX4DKieZmDdRI3s2S+xQ
         9FtVVf0ZRrb653tAUV7bkLTGC/H+5Pu62VBqeY6peUn03Qk2O1/huQUJNsj6tyB8399H
         WFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886065; x=1794490865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hp6UnAz42BYtWNNKJvUUuqRoOotKOANhhbOdLXq6OJQ=;
        b=NvE3DyHDzcedPqj0/3ZtotTVDkEyg+c0XRnd13PY7M79T0iFArS45Et144KlScqI46
         2Dm+JjZ20dH2elx7y96MFUebpyNUq6WnHX6TNTkb/YZRcEfUjJ5asiEUTGmb+aQV0zsW
         Or5/tQGAHNCz5fv1vy0cK0OA5k0kaKFw+F2aC07M1WByzbfke7vqO6S+y9ZVo6YkMcLH
         XvhUPOXb6tXf8YtKnbLMsXMgUWVKFy1tY6A9tkAGfjq1O41uftdxHSI1IlO8nwQD3Mpe
         aZJnV5eaGhqLd6/R4Cqk44xQ/JmMIqdzTLQTa3nC9ZKjwF6etEa+Ny6ZxdzXnvY1p0Sh
         UQUA==
X-Forwarded-Encrypted: i=1; AKwUvBwuRaw+H3WipOX3wPnZnTjYA9sMa2EZfDKuLhXuMXXM2Ai+9V6Um5IuHdkP2tPuPcNLuKsEoMxNkyjcR6c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+WWaU3w58SnPypYWG/nIuxHXiQ8Apf9q6nsmBPVLDEF3FqEf4K
	1N9io4xqALjbszIOrKFC8KgbuSZBzeAV7ohc8VGP58xbb40DhoaiIb8Amx/11kKV
X-Gm-Gg: AYBFou3IBU/bvYTAs8PbwZD2rWwx4idAmVL6oT8rudiQjr9tXwVN8MH+T5gNITIL1BS
	jmlycbQK9d53duBe5WiYx6iwRkznYDe7/Et9FoI9GUMD9ZRXB/Z69KWhVZuzEMqhFmAHdzzQCux
	B+rtlOjGXGagrSk4kNlHbaczneENxS1G5l0vEhse6riz7PJq6nPh+h0Nl/YXZdfiTfUhFl90JO/
	QEMCkvExXQd5yTsdj3R3tqnFl78znmMGvFaLmZgO/PUo3yrEmo1ny3IaEoeuRBL3XlRdueuMs0W
	5WIMl2qid9OZgpWuEq+CBehn7gxbcwaBfRcZPfOyDlNctEneKjSfO3ofGkVaK3z72vh6mUNkxrg
	gs/n5JmkzCzZ8n9ljT1aRatYWQcqzEf4h9qeMRZWJKmpJH0ea6uSSlpJWA3ADWgr/JjgXueNNBI
	ZqV1hrDWBt4kLb8oA93i/wjPOTeH6rUY4JbmYuEJ78OG6xFzaWSnlFUXVbPDxlHzhBPXrVEGNQc
	Ag0/4qxjuzZDloBS0zfx9KivI4AFrM8+z+j+4ASN0N/G4km/Fzc9hZAO1T0B5ijsPYh/DFXKJko
	lUyqsq28JDM8dgqL72RbZVOxE+r21xC6Ckop69y730+v
X-Received: by 2002:a05:600c:6095:b0:49e:7c8c:361d with SMTP id 5b1f17b1804b1-4ac182dc30fmr374890485e9.22.1793886064798;
        Thu, 05 Nov 2026 05:41:04 -0800 (PST)
Received: from localhost.localdomain ([46.188.59.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b64809c39csm13472965e9.4.2026.11.05.05.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:41:04 -0800 (PST)
From: Sergey Matsievskiy <matsievskiysv@gmail.com>
X-Google-Original-From: Sergey Matsievskiy <s.matsievskiy@yadro.com>
To: dmaengine@vger.kernel.org
Cc: lars@metafoo.de,
	vkoul@kernel.org,
	Frank.Li@kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Matsievskiy <matsievskiysv@gmail.com>
Subject: [PATCH] dmaengine: axi-dmac: add reset deassert logic
Date: Thu,  5 Nov 2026 16:40:40 +0300
Message-ID: <20261105134040.315317-1-s.matsievskiy@yadro.com>
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

From: Sergey Matsievskiy <matsievskiysv@gmail.com>

Add optional shared reset deassert logic, sometimes required for
communication with the device.

Signed-off-by: Sergey Matsievskiy <matsievskiysv@gmail.com>
---
 drivers/dma/dma-axi-dmac.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index d47ff27e1408..98aaccd26a26 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -24,6 +24,7 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 
 #include <dt-bindings/dma/axi-dmac.h>
@@ -1211,10 +1212,16 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	struct axi_dmac *dmac;
 	struct clk *clk;
 	struct regmap *regmap;
+	struct reset_control *rstc;
 	unsigned int version;
 	u32 irq_mask = 0;
 	int ret;
 
+	rstc = devm_reset_control_get_optional_shared_deasserted(&pdev->dev, NULL);
+	if (IS_ERR(rstc))
+		return dev_err_probe(&pdev->dev, PTR_ERR(rstc),
+				     "failed to deassert reset\n");
+
 	dmac = devm_kzalloc(&pdev->dev, sizeof(*dmac), GFP_KERNEL);
 	if (!dmac)
 		return -ENOMEM;
-- 
2.47.3

