Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67D7D484238
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 21:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788902771; cv=none; b=pULBltQhQTzuF1pL8eAU7BKkeJDVXGA0GvEDlLcymhp6FM7WLR++mSf96Ug28YWt6yqZTVdRNtzaY7jFzyZjGrAaugH3dFGqIK4sQQzhA4Gdg/IaAUC4j1gOI3T/NifVqBbxl0tD5Mqp/wt0KomXN7HsGHQ8bcL10ANYAKRwxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788902771; c=relaxed/simple;
	bh=qyn0WpBG9QU6QYmxMj4iS4kAntpbN2q9wDmeElZcpKU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iB4vkiC+MSBViZ+SxdNOXMhfpTxJxRKAjsSA+AWaIz21w53yIDKapb8R8lGPk4WVcxrmtZzPx1oiIsgBl0vLY96M9a4pQX/YuyRTAWelseMHucrLguHtgzi5Y66EF1yewQvl1mZwC4xX1dIXveZHQDAFReKBrKf4Ltbt5fvKsxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qR18Tn7L; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qR18Tn7L"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cebad4afso318081a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 14:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788902770; x=1789507570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=;
        b=qR18Tn7LA2/7Je//faL+GvGfPYXY9Vf8GbZMWbnRTMKuJJWdi22VZk2mbh/Qoup9De
         cp69cNoaGwR54JbVka5qhv7WBap6Xtg5DrICw5RwXVLrJ6oIkUVbZOLgBc0tUztA1v/Q
         rfK/1mvq3Yizs39ymCluurotQpboYmkoFr9oHMmFL5Lmyh2B8kAlSx/y4aHFqgxcachY
         g5yFCJOWuo/0Gy1kiBFeXVOJfUydhsg4gslrZxsV44M2jikdZc+nQaO+vDyx6w2RQrVM
         ejoA5i1bS6OnGn3byvF7zO70E20g1jnPATa3+9FXEMWeUgcrGky80CQT7tiBapQ75bcm
         GzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788902770; x=1789507570;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFbylBrZDIAgIOQuj/sws9qSGB10wS55ldz6AYSO0mU=;
        b=KAyseAZVXjH4JA6R9ZuXdVC+Sm1BGd84YFJcc60TKGT/64VwyNHL73WNPJxBANYB2/
         3v8NvSn2d59zyHgD8oqtULCsm3TqqfJ1oHK7Ejo77596a7xhoRvJM7phpd73rbqB1oqt
         aNESIZAcHX7CQ5hwd1eSV7M7KD8hsO0KWo0oPX7lmMwZ9iIcCRO5KoDLv4LP5+dlyAyz
         V4KM1edWvID6rQ0XT1nyQCH1lOQC4U6vfKlrr9xj7+Yc4K0Wx3WlaD6u0DhB373865Gs
         mkGiQ6sklL4nFKRaQVRh6MbvwqK8OW4cLKWLN9tkuI+MuqmB3PEidNKpOxtbGgu3lwnP
         PUXA==
X-Forwarded-Encrypted: i=1; AKwUvBwWooZuCqtmn6pIkvm6YfzlECUw+3E02ngRs43px5jTv+SCe6x2Z8AB7uzCiSpsK0MDmzwIe2oMIItd0Fc=@vger.kernel.org
X-Gm-Message-State: AFuF++mY0UlW7onYrlUwet0iRfjM7mY/9KvBcqDjNZwIzhlGT8+kkf0H
	1blHdyzaI7X2mayz0oCuHdFjiLvCgNFq6V19YicC+LWCCq7Oz/lMaxeRZM9lew==
X-Gm-Gg: AYBFou13fPP9zZ6hgh4K8ywHmeLNrqfMM4IG1gSBJtOHZBqzDapg3SXe3fCs/S0W+V/
	rhReSmTyToIO4m0mb+Vuq47TKVNrGcLhJaqpX7nlTT5BY6lDyCNqVPp8L3qAvumznrNYFKG5jJz
	nfbLMFYFbvvoCTGY3jPMvfznrh3/ZoS+yja4DfphbjDeDIFdndGJMQ4hnTmqT0uVDscuFuM21qR
	IBfdiwVLZwJ5uiSwha7YRVVMz28mTLEhzlf2dEbgmSZtdM1IanHVTAunZsWnvLM60dK/92bZxLt
	tvJHmkIn41G4DZyut1cltIQuxp5g5mMzAteEA9b9aN10WQjgvnaTN0k/w5O8qe1o17UgVY9Zgbv
	ME2+dbZX8BNZcHfGH46uGCLWwKH8A4K0ikAyNfzOTwhgwnvmzFjllDv32CDbr9z/woD3ZBYHPxt
	hV1YdxjZeio9WKjc/u73T/G9WB6z+H5LA1blhTuuIn4eXrgOIV+yRfP6qq9YMyccxT3UTMBigHz
	OTrDxz1cWViBpIN0PAyQsMveYCWSHJzUOXHqTfy23fQla/yg24fUqMU81dgdZn/Ngv9+YMu3Ak4
	1OZc9FROaqXOWBDooeRD0/d0BxH4l+s9cFv8GmRp2u9lvsgR
X-Received: by 2002:a05:6a20:9187:b0:3d3:adad:f177 with SMTP id adf61e73a8af0-3dabb2ec0famr2238273637.25.1788902769542;
        Tue, 08 Sep 2026 14:26:09 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4640bc66bsm4782413a12.10.2026.09.08.14.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 14:26:08 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-arm-kernel@lists.infradead.org (moderated list:MICROCHIP AT91 DMA DRIVERS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: at_hdmac: use devm_clk_get_enabled()
Date: Tue,  8 Sep 2026 14:26:07 -0700
Message-ID: <20260908212607.590224-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the devm_clk_get() + clk_prepare_enable() pair with
devm_clk_get_enabled(), which handles enable/disable and the
unprepare on driver detach automatically.  This lets us drop the
err_irq cleanup label and the clk_disable_unprepare() calls in
probe error paths and at_dma_remove().

Assisted-by: opencode:big-pickle
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/at_hdmac.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index f4d0c72787d1..cae26ea890fa 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1994,20 +1994,16 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	atdma->dma_device.cap_mask = plat_dat->cap_mask;
 	atdma->all_chan_mask = (1 << plat_dat->nr_channels) - 1;
 
-	atdma->clk = devm_clk_get(&pdev->dev, "dma_clk");
+	atdma->clk = devm_clk_get_enabled(&pdev->dev, "dma_clk");
 	if (IS_ERR(atdma->clk))
 		return PTR_ERR(atdma->clk);
 
-	err = clk_prepare_enable(atdma->clk);
-	if (err)
-		return err;
-
 	/* force dma off, just in case */
 	at_dma_off(atdma);
 
 	err = request_irq(irq, at_dma_interrupt, 0, "at_hdmac", atdma);
 	if (err)
-		goto err_irq;
+		return err;
 
 	platform_set_drvdata(pdev, atdma);
 
@@ -2126,8 +2122,6 @@ static int __init at_dma_probe(struct platform_device *pdev)
 	dma_pool_destroy(atdma->lli_pool);
 err_desc_pool_create:
 	free_irq(irq, atdma);
-err_irq:
-	clk_disable_unprepare(atdma->clk);
 	return err;
 }
 
@@ -2145,8 +2139,6 @@ static void at_dma_remove(struct platform_device *pdev)
 	at_dma_cleanup_channels(atdma);
 	dma_pool_destroy(atdma->memset_pool);
 	dma_pool_destroy(atdma->lli_pool);
-
-	clk_disable_unprepare(atdma->clk);
 }
 
 static void at_dma_shutdown(struct platform_device *pdev)
-- 
2.55.0

