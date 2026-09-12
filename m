Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA1F4A35
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 19:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789239674; cv=none; b=YxqpPM8gex1hvnx8NCzDhYAOwXEqA/abLak2DA9MbfuSIE8GpuWITeEa5dM7c2St94Z7GNSKtenGB+jDy6BY9ehVvIeRpW7nnYtq61mzyBvtDSKFurFl2BhdrzDVAIeborDowEo+dIRo0jcGSlILDucYQYe3JAwt4lXypCz7Tug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789239674; c=relaxed/simple;
	bh=QEiGJeMuvavZArZLMqWA5QCTEdLv23+ne1fNLdnSNTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KGJgJfBrVnbzyimz6PedUUrAdriG06KDgbn4VE+qdN8Y+j9aRtUwOHatQSWyGn7s3demfL3w2lyPXf/x08mczmKoWBJcrhcm1S3atuSEaNdixRoOv7p9/t6rAHljcUyY0Vmau0JvOfDxE5j/TF+AsHDTuSronj4v+q0M1GYkRFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VmG1xvic; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VmG1xvic"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcb5cb1so10795386d6.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 12:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789239666; x=1789844466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4AaS2W86AtkX5bjhTKY8jGngBhIYNaOT+HF7QmT5cMk=;
        b=VmG1xvic+ter6OxihUf2c3lDrx3zR6SKG108MXIqEtMmgnehkcplKI9/oDAMoEE9Ak
         LwUN3zQIeNefAtEKqqRAInu6r1nD6r9JVcMT7LMd5eSKJyZedVAtJD6taV4WPaalSF4N
         sB+ZFXINYDJZRr9Jj7wcpJguSUxGacN8BHH6a1Nhtq0zWBzNT0BY2PXgrZhW5T/p/M30
         HX8T9eOTuIJtEFWtCHncj9KNXHrnaDgXXQwSl4/E9bImaz8CNYIw80sjjOl+exLVcnGC
         oaDz3I3XKVeinPoF+6ovP+gXxuU8Olg45KBP8YPpX7X5MRLnJRO5Z7sQ05ncyCy7pxl8
         xKxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789239666; x=1789844466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4AaS2W86AtkX5bjhTKY8jGngBhIYNaOT+HF7QmT5cMk=;
        b=Yd1vOR+P8YrFmruUtx+obh3AA15DHgZWwRDT4yLWdAIBMECaYk7WJQDyA9IkHr3Hvy
         0alI7Mkw4WrdAxV+5sAThHXjRWQlXefHmaoj2gRrTnDZUrCYQWuEm2kbVCs7IU2w7UxA
         8B29CMS//1xfQtVwffow/Q6DkFrSr6PBwlkT/Fb84pqRlFdp2WWrZ4/JhnknmdvI17oT
         HFgV5nfKPmL4L4c2HIgcxHzzhIeCMn6jLpnoqwB6EY+VD4ndxj57WE/xwqurLB9ZS+ze
         y68Pr4WeR2RvjXrqVq68dUC1HvyJTz4MB/qnuOzeh6pRRZ9xVkP7RJdWk4aFMxDfUwYc
         jt9g==
X-Forwarded-Encrypted: i=1; AKwUvBwoUsa9KkRSrCN/UL4aq8+gTRATlzzBf6WwI/KgpTGUgrO62vPvuNJr66UUx5RKvCOg/tjYziYN1KFqNl8=@vger.kernel.org
X-Gm-Message-State: AFuF++lxFx61vrVQsKCImoX7n2emLVcle3I8DlHAXs+vqBrh2+hEMLMX
	EH4MKknzp8/Tz5kltHg+bmJHWJqPtWv3ZeqkAnWBl8K6ksAhVsHfQ0M=
X-Gm-Gg: AYBFou2Wc4d+ElB14PwFle6JMZSRb3Q6yfrxREbhvKin8ga9l++6UYq8oKcNWl6AMP0
	bS6chuh+FpDXHaNzFWBfW0su+ypME9I7eSSJTxVnU8eYFWyL+Lw3NJRwEiGwuiq7d8OU6oRdim1
	Qrv59tXgnRWcCbA4Rc+SCPZYbKdG6QlY96OgriQ4S4a27n5CxOuZMmzZyY5DDnBBkM+/9aNnwxh
	ABjka7ZgyxfxRAoZVy0glKKiC1eK/rOspQtxXol9EaFr1st3qkTaVjZkl1OCaiSnaaQ1IFD0qKu
	Qy4mhZqdRkoSLY9QRIITYjZNCIIpkvERDB8OzsEdaT1Vw654jX0cvXfYbGMf11aUhCebHPJd3Xv
	rvO5qIrXqVJoaJXEb/Kr4aO+GdC6MokI6wY917fCsmUEpO7LeAvKgmOm47OADZF7qeA9RAdqzvn
	I3al/EQobxR9+QrpjmZ1udiIcPCTh/4QMwrfcMIywy+ubJVnvTn+ExzPH1itqjo96GS9LpEBftE
	hr6g/R6PzsZhWJYT5f8ZBid+iilwmdSTsb+sKQnK7RsVv+r/biV/q5mNdXdpEXVWLHy/tRctB0h
	pjfeqf/XsJfvTPepjzE0U/SzVBcg2nD8Ig==
X-Received: by 2002:a05:6214:3983:b0:90e:96a9:4c5d with SMTP id 6a1803df08f44-9121d91c1famr77743116d6.15.1789239665588;
        Sat, 12 Sep 2026 12:01:05 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45f1fdsm52597396d6.16.2026.09.12.12.01.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 12 Sep 2026 12:01:04 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v2] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Date: Sat, 12 Sep 2026 15:00:56 -0400
Message-ID: <20260912190056.42192-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aqRM17TZ0-5pd6Y0@sirena.org.uk>
References: <aqRM17TZ0-5pd6Y0@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

With rockchip,sfc-no-dma, probe skips allocating and mapping the transfer
buffer. However, controller registration failure and driver removal still
call dma_unmap_single() for that nonexistent mapping.

Guard the DMA mapping and buffer cleanup with use_dma. Keep the existing
cleanup for allocation and mapping failures on the DMA path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ee795e82e101 ("spi: rockchip-sfc: Fix DMA-API usage")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
Changes in v2:
- Guard the cleanup calls directly instead of jumping between error labels,
  as suggested by Mark Brown.

 drivers/spi/spi-rockchip-sfc.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 662a994da60beca33358dc6af09017e88771d017..bc5537aee449e0c33c2d6ecf9d57205d432ec7b6 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -719,10 +719,12 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	return 0;
 err_register:
-	dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
-			 DMA_BIDIRECTIONAL);
+	if (sfc->use_dma)
+		dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
+				 DMA_BIDIRECTIONAL);
 err_dma_map:
-	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
+	if (sfc->use_dma)
+		free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
 err_dma:
 	pm_runtime_get_sync(dev);
 	pm_runtime_put_noidle(dev);
@@ -743,9 +745,11 @@ static void rockchip_sfc_remove(struct platform_device *pdev)
 	struct spi_controller *host = sfc->host;
 
 	spi_unregister_controller(host);
-	dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
-			 DMA_BIDIRECTIONAL);
-	free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
+	if (sfc->use_dma) {
+		dma_unmap_single(&pdev->dev, sfc->dma_buffer, sfc->max_iosize,
+				 DMA_BIDIRECTIONAL);
+		free_pages((unsigned long)sfc->buffer, get_order(sfc->max_iosize));
+	}
 
 	clk_disable_unprepare(sfc->clk);
 	clk_disable_unprepare(sfc->hclk);
-- 
2.53.0
