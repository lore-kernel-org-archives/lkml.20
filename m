Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316593;
	b=dvrW0KPkSwX9sHZbntVwAfIjymYeqnvKgVYQo21fEtFOq7qjlZbT9yQkSV6iDLgyqx1v
	 jwhZnXcLgqV8scKt5icRKvQlqkGf//1c759kja/w5Q8bQ4mkgFqqDPKahSVklSKCb4DUe
	 /BHtvYU5I/GRiMla75Fg2ZzQyOieGeP/8jtMTWWGsBtoY1R42MJ8fS/UcxIEeaK3c6fxo
	 k2S3EQ1MC/zyXCCsHEDrS1mLGenCFI74xWrNWhaiA5mbC/o2xK2fAzgr/HxLOtaGy7Pqo
	 7suc/gEdfIdLzgz+ZSjsA897uChhp5hIUh6ZOi4YlpGbZh/r+o4Z37CIPsYv64JwRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316593;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=qZHEEp/WhvMUT8kDbFYbUxr4m+LgX5e52LejEHQRlsU=;
	b=SuWjNxT+bvh8LkcGZmN8VBmfZxtgTvJpCRovDaTsFK9XTGyqE6UFsblizUIXHV40HuMu
	 Dx9hsji+xcx8qVgTvi3YvcrYVbSPV4RpLByK03SJBBZqX1jlP966tnX8wYt1eXaXFaYUz
	 kZb7baUFhieZ4QbIKiLTriYslbUZ+AZp467BXZMDN++8TK4/F0vJeqdEWrC557mBP7aBw
	 XGmWxEt/viSiLoTceZgELh0fJp2O4aGpotnUbN5AH/9nBCGVNKbZajdHTwDuumTnT4EUz
	 YWHGmUXIHQhZbM/MWkBNmfwGM8JyF8YeuuKd9wiLabQ4cDRWNRhF8FXs8qwerPVFTLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRJJ8rK;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 713B3606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 713B3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jHRJJ8rK
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso814709a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316593; x=1794921393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZHEEp/WhvMUT8kDbFYbUxr4m+LgX5e52LejEHQRlsU=;
        b=jHRJJ8rKAgO6YRkN44UOmVIERzAKm0mfzJm0H3BzCfUBc+9WYNXXdBm76G5ZwLoFFj
         XZI5c8V3Hc8CJq1rylu7wVKiyucvanSb1sr7ar+PmI9fG+p1fxbyhCrymC5Q/xzXvZCl
         19hv9EXpBvtjyz2eh2suqyz+4pYY9r+UcPTK8qsEdBi61o947ME9TWM6NVcy5hk83Cwx
         qtIHb6NgFGmZsye+KXE0Ifzo/4vIJeiu/rrT74O6dBXBs7ZICy3tZRo4c3qveYMt/M4P
         mqFBSsbz+w4Ey1Vc+21owlgCIimTzHRC9kKLLwOTjOul0o0f1OrJtbMfY4pOawhr2RWq
         SgeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316593; x=1794921393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZHEEp/WhvMUT8kDbFYbUxr4m+LgX5e52LejEHQRlsU=;
        b=t8LPqjTH3YWDq+Eog8yMcIrFAuBuGDGz4XkhEkwQeWyDoVeSmgktGawPdNzytnrT5V
         PSPewBCNa+aCTVXQ71e1ErEHFfkzcNbOy97kXmnU3UbYmHtoNg6PxTktfGr54228MX+o
         Dl6ewsc8iHN/IgjC1HKlKL9hgMsB0YBy8t8sR/x6XcEyPW11ew5ZlHSFJRQLnwOaup35
         +J8KjcRXB7inaJBbmyPBKDKwXpx5aQU52btKTXdKCSlY1WBOukObh3jAjFtATtzGc1E6
         QpkxW84FMqdhaHDUWByRNxQtOo6ld82ALaCW60O1w9xliU9qqdZKEKP9J79CZRdDCLOT
         qpBw==
X-Forwarded-Encrypted: i=1; AL+hErGdONggcVBsjYX/G01bELpH0KHVSgnfWSIresAaScN0W1iSggx6b8dmvXNwh1KYepwNfLRjF4ZSColmWyw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+0F+zbz9ej5WU+Y3AGjocV4TJBWuA6TZH+hWaxrVdZjeT+0en
	hLPCdVGTOJB8ya4q0BXNowVl1Ld6UyzYKtiZMzXXqFmvGYiOVDHUTWKx
X-Gm-Gg: AYBFou2N21LYz/MoZo+OknZdzGOHiwYN7QZ/sJXUZJ3Fwqdv9xejl66j0XAeYNixI3R
	5Fsyxfly/wV1nePvfdaGhOVqZedeaPGmOqWjt8xlzzuzkQxmKOpRlbuJhgn9vX3tF2zGFessdDg
	7YUlr54z+VWFiINfpkFWZAgyWaGjSaOKeopiAKG7FyvROA1vHybcq8qI91aDiUcQ3PFPhPEGE5W
	lBAWF1MeKHocp7DzaETYFUsAq5jlR+pyve/ZyCN0AfJ8GxpNCmUFhnPMM+jj7CkIFHJtSw98IO1
	J3Ik8vNJEQXmVIH1S2a1hF40tj3M9lHFiFh0kM4ls6NFnEIhlAMGWyXaNDGfVtSuIiRr6J6j3ah
	0j5VCdnZLwl5gQA9WPo6GtxuwUF+buO+S+JZp48aQhzyd9CBiee7R5F5uBGllzC/Pp+mJlKiTVa
	E5J6d7P4X8rQ+h4sRCkq4xeSXz5SHCzS4yNloHnlzpTK6GGu86+mjgScWnWpjBBnwgPnrflM1nV
	qqACQMkNSDoCu04eSYRpRtfe6YpTQQDFAKba9OwRtanpIfo5bj3/EfJ9BypWK6OId6PQC8064qM
	vDnAIZgC3uhyc4LtG8RoMgIUbzQsbtw=
X-Received: by 2002:a17:90b:1c88:b0:3b0:9f53:e8a8 with SMTP id 98e67ed59e1d1-3b166ce1cbdmr2477769a91.52.1794316592783;
        Tue, 10 Nov 2026 05:16:32 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:32 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 15/33] dmaengine: pch_dma: convert tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:15 -0800
Message-ID: <f6df749807fe5f285ecf4b90411440fe24583e67.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel tasklet with the shared dmaengine BH helper.
The handler continues to run in softirq context while dmaengine owns
the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/pch_dma.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/dma/pch_dma.c b/drivers/dma/pch_dma.c
index 88baf7ffec37..28d5e25d904b 100644
--- a/drivers/dma/pch_dma.c
+++ b/drivers/dma/pch_dma.c
@@ -91,7 +91,6 @@ struct pch_dma_chan {
 	struct dma_chan		chan;
 	void __iomem *membase;
 	enum dma_transfer_direction dir;
-	struct tasklet_struct	tasklet;
 	unsigned long		err_status;
 
 	spinlock_t		lock;
@@ -660,9 +659,10 @@ static int pd_device_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void pdc_tasklet(struct tasklet_struct *t)
+static void pdc_tasklet(struct dma_chan *c)
 {
-	struct pch_dma_chan *pd_chan = from_tasklet(pd_chan, t, tasklet);
+	struct pch_dma_chan *pd_chan = container_of(c, struct pch_dma_chan,
+						    chan);
 	unsigned long flags;
 
 	if (!pdc_is_idle(pd_chan)) {
@@ -702,7 +702,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts0 & DMA_STATUS0_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dmaengine_schedule_bh(&pd_chan->chan);
 				ret0 = IRQ_HANDLED;
 			}
 		} else {
@@ -710,7 +710,7 @@ static irqreturn_t pd_irq(int irq, void *devid)
 				if (sts2 & DMA_STATUS2_ERR(i))
 					set_bit(0, &pd_chan->err_status);
 
-				tasklet_schedule(&pd_chan->tasklet);
+				dmaengine_schedule_bh(&pd_chan->chan);
 				ret2 = IRQ_HANDLED;
 			}
 		}
@@ -872,7 +872,7 @@ static int pch_dma_probe(struct pci_dev *pdev,
 		INIT_LIST_HEAD(&pd_chan->queue);
 		INIT_LIST_HEAD(&pd_chan->free_list);
 
-		tasklet_setup(&pd_chan->tasklet, pdc_tasklet);
+		dmaengine_init_bh(&pd_chan->chan, pdc_tasklet);
 		list_add_tail(&pd_chan->chan.device_node, &pd->dma.channels);
 	}
 
@@ -925,7 +925,7 @@ static void pch_dma_remove(struct pci_dev *pdev)
 					 device_node) {
 			pd_chan = to_pd_chan(chan);
 
-			tasklet_kill(&pd_chan->tasklet);
+			dmaengine_kill_bh(&pd_chan->chan);
 		}
 
 		dma_pool_destroy(pd->pool);
-- 
2.43.0

