Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEDA84E1C8D
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 13:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552991; cv=none; b=eDeKus1VnRZ4fGdU0k9Rf/5TbXCwu+s9aZXhP7/1dXAvTjWw7TTYuMRnKw/GjUubYV4/maDvOyJTgE1ePc6Uv2EHr1TltndeK2IxcNAywz9hSkVyt6w7053zF7UZwcIWgDzYfc8exubTe17ssMYZRyOJHJ4wRTo6Mvx3YCo3W9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552991; c=relaxed/simple;
	bh=NHe5P8xaZMYon8Yt3xMtARUagvmOi+SVhipWZIQ7y0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFU7Khu2PuuJo5KLpd+F/6+fjCv2YfPUpme0h4sdv71ZIkdQ/bITbzvjZEG1XIhJKmB2IlqjgbPWxpgYhIciU4N3yt87pN4BoN/pvBk5PJIq+4v7jC6cvVPrHTsp/nKNgOY6Smua8mRJRR1mHUeGbKQSjt3Ehy1H/LLJgiAzGCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso39657565ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 06:36:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791552988; x=1792157788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AqvUHDbEtMERdIpHzV9HikVjBgNvbJTmZWz286oPhCY=;
        b=CfYSOyGUiRs6U4MRnwbeZR4qmfky9tg+agM+QGoP4nMtnHc/0ITX7x+GYODSmMZiZl
         6veqt9sy20m1dHH/qP/yqzBrDZZWttUP54FUBJQXRhMegnMJgXuWdwB9Tp6+ww8DBdTF
         /8pBTz26aXmSF6njwXSaVHuu/HU756Kbdt7klbW5+GorMOeTxGuCmwTWVjAOJclMYYrN
         4ZSYLMS0nYwNTFAurHZwmwqJ8fbUjSPFdzEu4oH/IXKo38oICf6gKSUoAHhwX300HxVv
         s5vH1uBDnYKZMxWUXLRsfEI44gkMN8ToFSObRpWAp+CoJ5L2qJPAFLxnljJbD2XF67k4
         GySg==
X-Forwarded-Encrypted: i=1; AKwUvBwrmMP7bh6p6ipIeWmaNcxlUP6HejrEWvYsmAlNO8mcfQ/8RO8VDqV9vHabLNVTjS3rqDatyt7XT6UowII=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/hChP7Uix/MWP2gDlZCk2PJU/C1Kxlo3977SiGfQvVlHHUAwv
	A+3MFB3Xlnl5NRu6W/7j32YaryDVJf9ktzCzjtGWiFN89p+aMS3PZuFY
X-Gm-Gg: AYBFou1jxDLGdWWWwfjaCWO9S+XAhbcO00GTA/BbeYs6TFwYwaSseny/LmxbExzPv2A
	8gH9s/iJhvmau5oVOe83cDngZ1O6HM3rgeen8YiyfzGuTVYbB+2k2pEM+dV7vwPho6wpwcdYRo3
	U4aMxn7QnmAD7CXnBqs+wpgpk9x41lRXCpdd153yGTrD4oz2PpKYtkPwnwA/8lj0xkjfvmmdnpw
	/2kqFxs+2Gg6J8KmmBhaHfrHxTbySyjo0qH184rTglB6rko+8KLhGzOK6Q3evm7BVYEHA3vJPms
	8zTbPhDpylZ+l/JQrmUltSO9JoRcwXxXaMx0c+XJOEM5ivxYvC9LzlnDPhNqNXXPQfymYHCjiyf
	d9Oc45ttArWWwzPN2AmcCgElqku2wBNMTd6Bu6gHFYeZLodrEjPPkHEQiQfFknsNzAmPOB9NL8z
	LJHjN6ifYQ+jFglq8Rpqa6+SANQIDhMN9wLuujhkAqJcPN+0N3NoI2ArOUIf8=
X-Received: by 2002:a17:903:19cf:b0:2e5:41dc:9ac7 with SMTP id d9443c01a7336-2e842bc7708mr17655435ad.24.1791552988157;
        Fri, 09 Oct 2026 06:36:28 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8484c1641sm7656985ad.15.2026.10.09.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 06:36:27 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: broonie@kernel.org
Cc: linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <code@aayushk.dev>
Subject: [PATCH 5/5] spi: s3c64xx: Use snprintf() instead of sprintf()
Date: Fri,  9 Oct 2026 19:06:09 +0530
Message-ID: <20261009133609.579046-6-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261009133609.579046-1-code@aayushk.dev>
References: <20261009133609.579046-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use snprintf() instead of sprintf() to avoid potential buffer
overflows when formatting the clock name.

Signed-off-by: Aayush Kumar <code@aayushk.dev>
---
 drivers/spi/spi-s3c64xx.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-s3c64xx.c b/drivers/spi/spi-s3c64xx.c
index 8d4120cf9..8195bf376 100644
--- a/drivers/spi/spi-s3c64xx.c
+++ b/drivers/spi/spi-s3c64xx.c
@@ -1331,7 +1331,8 @@ static int s3c64xx_spi_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sdd->clk),
 				     "Unable to acquire clock 'spi'\n");
 
-	sprintf(clk_name, "spi_busclk%d", sci->src_clk_nr);
+	snprintf(clk_name, sizeof(clk_name), "spi_busclk%d",
+		 sci->src_clk_nr);
 	sdd->src_clk = devm_clk_get_enabled(&pdev->dev, clk_name);
 	if (IS_ERR(sdd->src_clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(sdd->src_clk),
-- 
2.56.0

