Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C06AE2989B5
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621321; cv=none; b=KAtecAZMIdJaS5XC4r7/73WqpwE2PB7eEeKTSl6iB8HZymil1mwcRVF/kbBwP60FVJNzYOTueyi2ryHq1hWsmaG5aBSUJFtg1NdYAIW8whnYr2wblXMcRxgk+UsL917OEMAkLs0Pg70AsM8+ctwZzLtKkEApWNGQOeY+I++fWIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621321; c=relaxed/simple;
	bh=1kRF5VOmfeAPBhGf6I8e3OR35yHYRa7vHOBMANSzLvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KgnMtm11qC4HYdYcRoVIt8/7/bROD0lEmWSf6JSWDNE+q6vSGm2R2wzo318Sf2ePT+i2x5XFuWdappVXHoQQBz6WSCMmWxR3S+DwZWIuhfGJuR+243XIevI9tVDL13uUTdIMAJPku8VrFL4uxkrDc7tDM7QqOrX0QZ7iRZGgK7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aayushk.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-33c2520ad38so949736eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621318; x=1792226118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vd6PvYub55DkYTK4Z2RMOKatSjX+x4KShfXJLN8v41I=;
        b=Y/t7ztiA5BpK+M6hLOQo1jiLKApECkUqka6XvJ8Fw/q/PlCPuNZuBuxFOuXLLs4zXf
         eShivEUeB/Lj842Lc0wS/+cEjQDIgf6yoe0zbJrAu5i6+KMbq00VaLV4QwNuo5+OYj44
         ngAyvzIeM6QiyqL43K9Hy+uOSaSpNS246ef5IdXXKNPIUaBgpPwrA41rpnn9gaH1szOY
         9KJPYdkcCw61pwUZrishgCjznP/zH/2IiawllFsBCUPwLQ5np8dL+tQ4l2FOKW0WQzgq
         gd2m5XYzkUIvhwhUvt+hQX3lVARg4UyXT+gm3+hSP0BiIEhXkMuH7EKpC//kjBkNTDJL
         TMIw==
X-Forwarded-Encrypted: i=1; AKwUvByk8ip6U6rWnSq3OlvYGGcTdXRe2H0gBjpdNLemLAg25rgCu1FfVroqe+jZBtppYvm1JaX76n6dPuVEC0o=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ0n/qmjoZCj/bFAnUdXLEchJvjHbknYp7YDjQpxUu+YJqhFsEc
	MQH3zFmKWLQjiRBnlbPj2YIbKfiPYfOaA7K3xVK4WaN2bof+z2V6OJXj
X-Gm-Gg: AYBFou2Ba7d7pnlS5Z50O0B5nUBhtwK/U5XzGekGoqGBySo/qLyocEkzaKIGjyjowVq
	givp3eMnc/qGtR8VT/50r3tpWYc6AwNFa7T15L0lQhdOCdMVm0S6rBg/YScGC8KHtCQFnSfQTg3
	4urgYwqEc3/V6YLjP98JxSLYKlEY5fQL2kxo+u6fvz4+s3uQPEBRwLi8+5ePTK3wVT7wHKek7fS
	a7SPB98ZnTjwZZy9ndJcAnL4xI96SzmO3GojzZJhSKh9dHHWGLpj/klmLJABy86nKCcK4URzTXg
	gBY8zSpiThD/Ci+gPw4NSm6lzt/FN9VtWBoTiAxZ0iMjRJEYt1eJboMin+/UI72SKyIcP+UgHrE
	6bvLgiAHbGevZ/vkMwsIHDQq1/CzbnBlJ1B7i7/Wkgzq1LH1yYEtzNItRCr2ok4O3vGFWwtDvt3
	DJxqiQJRi5G8JMnBH9+M8Wl/jqp2FaeL02Eovqil8IUH9FIx5eUZMRaHIB398=
X-Received: by 2002:a05:7301:1629:b0:356:9345:9da6 with SMTP id 5a478bee46e88-3569345a800mr3369002eec.2.1791621317730;
        Sat, 10 Oct 2026 01:35:17 -0700 (PDT)
Received: from linmach ([182.156.30.23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm12689858eec.4.2026.10.10.01.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 01:35:17 -0700 (PDT)
From: Aayush Kumar <code@aayushk.dev>
To: Mark Brown <broonie@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aayush Kumar <aayushkmx@gmail.com>
Subject: [PATCH v2 2/3] spi: omap2-mcspi: Use snprintf() instead of sprintf()
Date: Sat, 10 Oct 2026 14:05:03 +0530
Message-ID: <20261010083504.26261-3-code@aayushk.dev>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261010083504.26261-1-code@aayushk.dev>
References: <20261010083504.26261-1-code@aayushk.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Aayush Kumar <aayushkmx@gmail.com>

Use snprintf() instead of sprintf() to avoid potential buffer
overflows when formatting DMA channel names.

Signed-off-by: Aayush Kumar <aayushkmx@gmail.com>
---
 drivers/spi/spi-omap2-mcspi.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-omap2-mcspi.c b/drivers/spi/spi-omap2-mcspi.c
index a3355147f..311ee0ca9 100644
--- a/drivers/spi/spi-omap2-mcspi.c
+++ b/drivers/spi/spi-omap2-mcspi.c
@@ -1544,8 +1544,10 @@ static int omap2_mcspi_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	for (i = 0; i < ctlr->num_chipselect; i++) {
-		sprintf(mcspi->dma_channels[i].dma_rx_ch_name, "rx%d", i);
-		sprintf(mcspi->dma_channels[i].dma_tx_ch_name, "tx%d", i);
+		snprintf(mcspi->dma_channels[i].dma_rx_ch_name,
+			 sizeof(mcspi->dma_channels[i].dma_rx_ch_name), "rx%d", i);
+		snprintf(mcspi->dma_channels[i].dma_tx_ch_name,
+			 sizeof(mcspi->dma_channels[i].dma_tx_ch_name), "tx%d", i);
 
 		status = omap2_mcspi_request_dma(mcspi,
 						 &mcspi->dma_channels[i]);
-- 
2.56.0

