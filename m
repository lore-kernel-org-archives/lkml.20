Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A817D39281F
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789147638; cv=none; b=TGBbiPKBiPi9m3phy77m8CPyC+R80o04PTQ5DXM+hNeYb7JMywz49O2VbMDalPO7yAh6P7RC9Y3nRAoP3HWO2RyvGdQhMP/1GSulpHGZfcPE9uAz/oSNpFtDMe4pzlwGXdfG8xEfbXD6ZpnN4svKQfDigLBetgGnAU0tnSUAbtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789147638; c=relaxed/simple;
	bh=FRSDum/Oo394nb2f9OHKy+YZd8mrcHCFr1QQGlRFCXw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X8wL0/6ASWSXEz/i4BXGY9Qzw1QfWkQlOiVQfV1UcceEshnD3cC+GAkkY+OXP3ALYE9xhUhlWKQhjZ/j2vnUPSNTM/2VGG2iU84m/onA23idicnyyWK3df8duoJR0CqLON8vYgtiNfj3EBI2/K//j2p6Ta1mOu/SYpSZlTnVHvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZ2bNYa9; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZ2bNYa9"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-783d429d0cfso783654137.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789147635; x=1789752435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BChxo31Ip5SB1VJHGoub4TIPtDJvGI/MxbOnDeYS06A=;
        b=ZZ2bNYa9Rw2tLJjD/Udz9I5B48eZgGKO2E2Wya22dP4UHq6nztA62g9Cn0svIXf0aS
         TrgALGXPZvlHeQwi6o93+R4Ec9vy8fVQtt+EThY3yAvX9KYd9krWca9JnH3zcz1jxp/N
         GAsdfK0nWmNBaAyUMaHpw6psyZfRykDHpzXWKINldRFbTAE9zp5Fiyxe6u8bEIKYWKwR
         KUH/+L+KXitlc6wUIAyQ1fW8BQQX48rgLkE3a2jITg2Kql/nRNNxtXM08KeBD7BZGav2
         yFzicBSsURUmLzktCWeL19Tx1dsgeoWBqZZP7Xx7vc2fkLVyksgdcEPfmN/3/kp4REld
         zAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789147635; x=1789752435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BChxo31Ip5SB1VJHGoub4TIPtDJvGI/MxbOnDeYS06A=;
        b=ZI5js3S0hezmW5vQhnUCSO3r8BBwTPPQKBH72ZfhehGI/1a4/siIy8Z3vgIOEXJ43g
         i70nQROsdCXPPF/dBxNPwEueznXp5MoU4YkFF/xk1WcT6+5EKAI4yPwq2xwqWOLollX+
         VTWAnDTLBIkbOQpvCSJLgEXwJEI6MsG+QI+s1cFBGtnw2LMM7WBiGmPKdtwGzgXCI+AH
         sDPUfvASR3DnOCrwIN8bzfmuePJUyirf0/8wED3WoWiElmzvW8O4yp/QvayysNzP+yCy
         DyAyAbiUiqIW752ObIo2tWm6PIrrzD8AeXlzF9j/NHec+dQ7Nrmy9UEWgW5pbDxIPvkL
         iKqg==
X-Forwarded-Encrypted: i=1; AKwUvBxeVpwdRT2l693AO5w71cswBp4blmViKkWwekmx3NYYh8UeuyHe5BlSjXW53ayJ4+lB74w/rlPVvIYAFsg=@vger.kernel.org
X-Gm-Message-State: AFuF++ktNJMslVtV8+/d2Q9HyTbvRajhfI43lLEllo/BeIpUMO7adof7
	2FWSbBjgcQcEF5t5mF77CShxC89CCk9qlI6ZSMkI9AeG2imNhbVgHqQ=
X-Gm-Gg: AYBFou2yvkEE1UTUcjdv/xR0AoDv8qef3TOjrz1vFfKzqFFpcTDw2bhC9pLlmuNTqwA
	Xd9R0o2iEYSwLexcdPRrsSMtYuQex+SY9H8oKShPfIsNAVz+CCbebDLn0gIuEZ4567pTjKOXjkt
	q/svZYee1b91sqFhV7ThpFbRPENz+0dTIZCMF5lYGy2k97WaN62pUAAtTqC3be5unnosAprNDLJ
	ofIMYs/tvX5aqQh9/v4IC5JjtP939snx+EyW6WQ2+JkmPcik7QlCz7k71T3CibCJOK0GT3KDW48
	zGCwsyn1l0VwSsbcaOXxfFEFTZmjMqRfRS/jX4WTwWBM2b/2K1IPxhPyaiCpgje0Xf+sM+8SJVc
	CUoVy1dpcigAUM5s3req7h/OQR8ckkKJj3rxt2x7bTbUfUPXkK1J9iJbWZvbdh75cisNCTnnXTw
	2A9ZPjp+oJUhV/a2cTn9qyUIXQcFIoI+FFo2mm3gdiwbC9ddzhNTCe4E7FkeAuanmzO65RjMSv9
	zxvYBy60ySod3xt+qFk9DC+ystO+jpDM+EvD1AhxxKUm7dQX/07X5aKJkIHFyTwk1TDNphbPAO4
	f3Gl15/1LFxPKoFQ6J+cXEep4sizsmcjyA==
X-Received: by 2002:a67:cd84:0:b0:791:8f69:b7f3 with SMTP id ada2fe7eead31-792a4fc8bd1mr5864944137.5.1789147635238;
        Fri, 11 Sep 2026 10:27:15 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f478bf1sm25569566d6.25.2026.09.11.10.27.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 10:27:14 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] spi: rockchip-sfc: skip DMA cleanup in PIO mode
Date: Fri, 11 Sep 2026 13:27:01 -0400
Message-ID: <20260911172701.58177-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Skip the DMA cleanup on registration failure when DMA is disabled, and
guard the buffer cleanup in remove with use_dma. Keep the existing
cleanup for allocation and mapping failures on the DMA path.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: ee795e82e101 ("spi: rockchip-sfc: Fix DMA-API usage")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/spi/spi-rockchip-sfc.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi-rockchip-sfc.c b/drivers/spi/spi-rockchip-sfc.c
index 662a994da60beca33358dc6af09017e88771d017..21bd2e52d3989e3b371cf5c9ec8e4a22e22f17ed 100644
--- a/drivers/spi/spi-rockchip-sfc.c
+++ b/drivers/spi/spi-rockchip-sfc.c
@@ -719,6 +719,8 @@ static int rockchip_sfc_probe(struct platform_device *pdev)
 
 	return 0;
 err_register:
+	if (!sfc->use_dma)
+		goto err_dma;
 	dma_unmap_single(dev, sfc->dma_buffer, sfc->max_iosize,
 			 DMA_BIDIRECTIONAL);
 err_dma_map:
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
