Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B86FE36B911
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 21:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791581523; cv=none; b=fFNb/ezYhAD+IZqbcq91J5HphOX/d2AeBJSLhXWRti9naRcfS+IH2h5ItLOjd2vvkAJtCNoCFC4sQzxMcLWUdPKbX2BdMgdwWX9b9vUAzyQwVtFdmcZoXnjy5vlJtV43XGW7uWjI6rsW3V2ukIOTtLAk8jTZuDnAkfoFvJ5f4ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791581523; c=relaxed/simple;
	bh=U7CHoprC3QQbDmNB8jOMv1v+21yCj4nz+/4HUgBxpEY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QOYByESei716LTEMJf8o6wQqblyB7h1/z9bXdaLjqlgVJ1TUgGxiKDGuEMDYGF1LbvCYj45TWiLdCcsxguF9bK/Uf3TTPItTUMXafaE7Dtb3f9GrJRhLuIEIkJ4puM2djMaA2N3goBxRPz69jjP8s3+DSMBYKcLKWtHbQ0K8cYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wn3mDYdi; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wn3mDYdi"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-85377c8bc96so62243b3a.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 14:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791581520; x=1792186320; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vUayDUdYs1sE6mgk+Qs00q/sRaaDnD8utq+2SxLgtEM=;
        b=Wn3mDYdilqhLRacIPOx0sdnNxs3Goytu+XEH5kIHayYkx+s2rZnmVZPqsY2SjcQpaU
         zMyPWfn7xicOOD5Tihe3nnuMVuvrU/exqnbBOHK7f9B8tkier+VuxuSyQf3K0onHDEla
         fRIAtCucXPT1pUFrB2VKPn3U7rrL5FwWFkDcJ4ujAii+yKdpyu5EYNJG+ti/MX+DIbIj
         AYvNN92rADyzTthBIgIfZuLFfhR1jcAspZoMZxuzqCIPobO5UmnWSmH+LDAETlFYUoVg
         qdQlZd/q0XATj+vUhS2y1ldp1DJolJU3bQrm8cq3BVt4Xu+CxaUmwoFdngYm3FfNgeOI
         uxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791581520; x=1792186320;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vUayDUdYs1sE6mgk+Qs00q/sRaaDnD8utq+2SxLgtEM=;
        b=xFJ+Iy+y+7IMYP82TUIbbxnZ/7Jocrv4siH1lPSEkzJMG7Vne/h3rBu3REpRH2ri+G
         Cd8KHc6IQPzgByDdSkh7BypSyh6GXgJ9zKDjuP6O3Bk/iPTMCgifbpJp0WRaFcc/Gj66
         4ZAkgCe2hcJGUH0FJNw/+60OyAYo7DI/QcfOXGNBi8biCSdv9lZO5HYN7Wxm/y9f4Izq
         fhoGRe/W/NzReZ4jBjVxptZMuNl0v5q8FLy6yl27DN/KjdXmi9yO+FL/3gxRTzHhI5vE
         HvjpVX/Ppba91ZjDKQiSFj25EVn+fMeJqT3CYQs3f6/jSxoAASwbj6LORJzYIa+7qK5U
         GmEA==
X-Gm-Message-State: AFq9FYIayILrKyESVscllYKu0W+9QtrR6+LgdCgWYH3dVE7yCxlWyEAy
	YgPgNKbtJ5wA7jOWTXdYz+2RTwRrimgXF0BgXSlAwDDcMJBPgp2wOE8dCIdGqA6g
X-Gm-Gg: AYBFou3krfkniIoLMq6rX6efXYaegUoN/d+7CtZmKs//AjkNIMRADbDi5aeJLNCE9LZ
	Nzsf+JLIiWyC6dpKZTcksx/7dTNib7Q8Ro7N4Nz3yWKCsg+1dFS24PKpJJV4/M2jcIDAwKoCwKr
	2bNn8/gPb/GU7vTo1P4TRCGdwfTKYIGV/dywKVkuvi1ORw8oqXfMfB7dTcGWRN5w/RCQNBwkp8W
	DeA/XgfczPmhOnKWiwFzDcj6AVeAkBb0QRA31RhseF9g6hUwDrqWKz29fy1aZNReVKFWESsJXGG
	oXiDBjSIB+Gt1w26zkPmOopmOSUBLjijAsg1sFgSQNMRvR9j85wbJAv3rJNpjXtkadHcyKywGow
	poPTpjJH9rKCbZoTp1vEanU0H235l+7baRkD4E7j7LznkjnpLk0yOH01E4Xv6D7PCXrqmW2QXyH
	DNZaEKh8pUH0MGBsMCkwK80AT6sGK+pKNH4I7GnpBdIzAYNSOim6cWHKbYK5Vw+JMgbUZ3P3sOA
	nwghauqRLB6+oH89in27W/81peHw/y4c4oZadOD0JLofK1mIFlq8EZLCToaL8x9eaTnqAzZ0wwN
	XAhra5vLSofXT8NxAbhu32TxbReWsREnZnZzyPw4mgxIMBMR0AJuHN7S/8U=
X-Received: by 2002:a05:6a00:228d:b0:892:1396:6a85 with SMTP id d2e1a72fcca58-897c79ddc12mr2742507b3a.47.1791581519858;
        Fri, 09 Oct 2026 14:31:59 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3eca287sm1612478b3a.37.2026.10.09.14.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 14:31:58 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-kernel@vger.kernel.org,
	f.fainelli@gmail.com,
	Christoph Hellwig <hch@lst.de>,
	Linus Walleij <linusw@kernel.org>
Cc: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Paul Burton <paulburton@kernel.org>,
	linux-wireless@vger.kernel.org (open list:BROADCOM SPECIFIC AMBA DRIVER (BCMA))
Subject: [PATCH] bcma: use the SoC device for DMA on MIPS
Date: Fri,  9 Oct 2026 14:31:56 -0700
Message-ID: <20261009213156.109965-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The MIPS BCM47xx code allocates a struct device for the SoC, sets a
32-bit DMA mask on it and passes it to bcma in struct bcma_soc. bcma
never uses it: bus->dev stays NULL for the MIPS SoC host, so cores fall
back to doing DMA through their own struct device, whose
coherent_dma_mask is 0. Since
commit f8c55dc6e828 ("MIPS: use generic dma noncoherent ops for simple noncoherent platforms")
coherent allocations then fail:

  bgmac_bcma bcma0:2: Allocation of TX ring 0x200 failed
  bgmac_bcma bcma0:2: Unable to alloc memory for DMA
  bgmac_bcma: probe of bcma0:2 failed with error -12

Set bus->dev from the SoC device and do DMA through it, as the ARM SoC
host already does. Every SoC host now has a bus device, so drop the
fallback that pointed a core's dma_mask at its coherent_dma_mask.

This addresses the review of the earlier postings: the cores' DMA masks
are no longer touched at all.

Tested on an ASUS RT-N16 (BCM4718): bgmac probes and passes traffic.

Fixes: f8c55dc6e828 ("MIPS: use generic dma noncoherent ops for simple noncoherent platforms")
Link: https://patchwork.kernel.org/project/linux-wireless/patch/20190121101121.24555-1-zajec5@gmail.com/
Link: https://lore.kernel.org/linux-mips/20220107041744.2388470-1-f.fainelli@gmail.com/
Suggested-by: Rafał Miłecki <rafal@milecki.pl>
Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/bcma/host_soc.c | 2 ++
 drivers/bcma/main.c     | 7 +------
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/bcma/host_soc.c b/drivers/bcma/host_soc.c
index 411cfbf53f7b..6150e1588af5 100644
--- a/drivers/bcma/host_soc.c
+++ b/drivers/bcma/host_soc.c
@@ -188,6 +188,8 @@ int __init bcma_host_soc_register(struct bcma_soc *soc)
 
 int __init bcma_host_soc_init(struct bcma_soc *soc)
 {
+	soc->bus.dev = soc->dev;
+
 	return bcma_bus_early_register(&soc->bus);
 }
 
diff --git a/drivers/bcma/main.c b/drivers/bcma/main.c
index 72f045e6ed51..3498d5419c19 100644
--- a/drivers/bcma/main.c
+++ b/drivers/bcma/main.c
@@ -251,12 +251,7 @@ void bcma_prepare_core(struct bcma_bus *bus, struct bcma_device *core)
 		core->irq = bus->host_pci->irq;
 		break;
 	case BCMA_HOSTTYPE_SOC:
-		if (IS_ENABLED(CONFIG_OF) && bus->dev) {
-			core->dma_dev = bus->dev;
-		} else {
-			core->dev.dma_mask = &core->dev.coherent_dma_mask;
-			core->dma_dev = &core->dev;
-		}
+		core->dma_dev = bus->dev;
 		break;
 	case BCMA_HOSTTYPE_SDIO:
 		break;
-- 
2.56.0

