Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316564;
	b=M0H+gIMlIMre7r049sUzwcNFwySLihpB+/hFl7/2L7jquWiNvCgQuV0fSCQMtmxpOazv
	 DyrcGUBw6CAP/5493RbY2Fe25O6XcLh9UG8wORdfxdZ9RD8lSWnEUEPRc1c5w5cBb40Sj
	 H4MYkm5+ILvRoLN2JqmJ/n/39PwLjLglQnaTJr2ywamylJ+GkbwhcHMqGwwSugH/+JRw/
	 2tdMUwLNCTHkaNYghvKHxTXk/qHnnNHS/MqjOWMhKyqbbAh0nbzPERojTU11tocwILbxj
	 mu1bQAexH5azk/Td8XQjBpKvEouTFJ1mGicmqdDNDqE4W89c0n6FXlFU15qPnw/3mlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316564;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
	b=SFKH2LYC92qmTzMH+BBvoOXiR/y0yXL/xc5jFPe7X+g9F0WWOmcQtRh/gZTTIqw7yELB
	 Mt/kQFiCk+OpBg46vpce+ZppoMr02nPxgBt+MtKTErHW1ttym29gVDQtMTgDGxi0+6LHx
	 GmDif7NGgvwa9c5ZXuBYBOukEM/a5xclov0HyTv72ZAHdAl1/J4qAN9xQ7hcojVzl8c1e
	 pihsldtUPQKMrVpw5fJt95XVkGQaJCuWIUR+d1wjF1ttXOPd9/kxDQ/wVFudx81paYRSn
	 +EzIRwxQwoAaEsyRlm4nGptOvQQzUBCuEfWOwgTWN61tja9d8xj3SyKNIQ5+nNORTDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwtTOuk+;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F3160A263B
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:16:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41F3160A263B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cwtTOuk+
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0a519049aso1316847a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:16:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316563; x=1794921363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=cwtTOuk+6xgyf6G9J7gkaWOMI+dOo5JpGD9h+viPFQLnb3n1dujfrVMHhzk2tDfZqm
         MbMYkEUIzcozLznCqWQKPdjhglfEZ53B/1wrUcbJbVAaKOCsmwFWfKK919xWQUac8O6b
         VeY8TItOjRbz6jDHujqbr97BIsklZQn7sncvV3M9Gt3AqziDa9K1ZFf5tPAW0hl4ySuN
         noxGIDZW5ZwBXycT8ngQ71wuiznDBdsAZPCIZKXuq4AldCaFtdrV0KSVQVD0IuuvgvYX
         kF4gqrL5cRje0xNJ6jDNIw0E0UtjXQE7L85QuoP0yT0Ix6MVIpPmZXDpXTNQyCZIDy7D
         skXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316563; x=1794921363;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5xprZt5NhCzwKafxuBKE8lrYdP4CbowwmixO5skWSc=;
        b=UrrvAef3Z7y+VMc3jLvIo4+gcvWSabPmSTydk6JARHi5ATLCyK3W5ej4q691Ol2J46
         8o64daalyr++XT3lQ5c0X35QIXT6wubE4qbOam4bFnd7jdjVAp9K7iKf6fGW6+C4zScK
         huLEvUakzkEuQpBr0XlTRB/GHZfTIoZJrKb9BowxQdn/b7TX/8d4vBxz0IhRxjMk+166
         C8qhcsWfWHGWznV7I8OuiShxPHtxfxhH9ayBZxJ0Sg1EF4aW937VOvpXXYtDQwxVPrhB
         omppzmI2GMrJyxQdw7+OFvg3xG0o7ib/cBtzENAlUuSPZGdVVXVcmJBBspVays+0VUee
         yavQ==
X-Forwarded-Encrypted: i=1; AL+hErHpZ84y1Yyv2eLzKi4KpaE0pnes4Xfnfnv9nzR6EQQoHe8tnWbH48pS5+0bLM3dZuD2f6hkL92yH0mCBhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z85mV1Z+JbsCJUyc4G42cZvavoj8voo0RD1pSV5XvJg7mnGI4Au
	kYB/sNqBQ0R1cvb1FLvh6W3HUiO6g9svfCl3UZPlzXE4V8eryo0zIp3g
X-Gm-Gg: AYBFou0VnrKBq0bXTCMPu+Gq/OyyNU9VVDQSvFiIxT/eQApcmAUn41ogYogOR49/zx/
	36qVbQkI8xUa5RIobcBolVcQHtyh1OymkbE1s3XMNJUHOWj5GVu1mdxEPwCoHY7v43d2YOSDF43
	+EivUby0Ts3T/+o9Ey7u3CztPTrkB0+LJBpQSsvk/ujB8+5U3Bag0gUX9KLUKJibeEikWjTe3GM
	xeaqZT4P5VSKXTq9ruyDzWpP0X4tjqdVWxir+ObXayKxTkrsH2Y+drt4e7x+tbon1t4Y7PIYX16
	pPt1dc9XwBxyRT9ssNOfEwW/Znn7v6a7q7aeH5yxROc7Zz261OLe+/srtUj/fFw2xcdK1b9/i+o
	ruz/zQNCwh1M26bs86cS9lGZH7jrM129qPWqGqasvZy/CoL4VeqtGles2QH0H/iek6Vn9ZHaHK8
	OucwGFxxTCUKoTdeqRscqEA5T6iBoET8pwetDRfs9oo4V12FQmmLi3CI0kETodAB/1a1js62tLv
	lq/CgK+iFqtlUiv2WInhv00XkIvl/SUJivOFkAiqRuKfUL7LZ/a7OQeeDiy6SFEuAXyUAoBE7hL
	KmG3S3nRhvTa2NeN1NMU73nvdmtXzcvt
X-Received: by 2002:a17:90b:4a87:b0:3a8:c0cd:57fb with SMTP id 98e67ed59e1d1-3b166cbd030mr2853475a91.42.1794316562378;
        Tue, 10 Nov 2026 05:16:02 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:16:01 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 08/33] dmaengine: imx-dma: flip per-chan tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:08 -0800
Message-ID: <bb9ba66250d97a83048c5bcce45b20a1ea6ca6af.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/imx-dma.c | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/dma/imx-dma.c b/drivers/dma/imx-dma.c
index ca1d08e90a06..a9d05b2e2205 100644
--- a/drivers/dma/imx-dma.c
+++ b/drivers/dma/imx-dma.c
@@ -145,7 +145,6 @@ struct imxdma_channel {
 	struct imxdma_engine		*imxdma;
 	unsigned int			channel;
 
-	struct tasklet_struct		dma_tasklet;
 	struct list_head		ld_free;
 	struct list_head		ld_queue;
 	struct list_head		ld_active;
@@ -344,8 +343,8 @@ static void imxdma_watchdog(struct timer_list *t)
 
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(channel));
 
-	/* Tasklet watchdog error handler */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* BH watchdog error handler */
+	dmaengine_schedule_bh(&imxdmac->chan);
 	dev_dbg(imxdma->dev, "channel %d: watchdog timeout!\n",
 		imxdmac->channel);
 }
@@ -390,8 +389,8 @@ static irqreturn_t imxdma_err_handler(int irq, void *dev_id)
 			imx_dmav1_writel(imxdma, 1 << i, DMA_DBOSR);
 			errcode |= IMX_DMA_ERR_BUFFER;
 		}
-		/* Tasklet error handler */
-		tasklet_schedule(&imxdma->channel[i].dma_tasklet);
+		/* BH error handler */
+		dmaengine_schedule_bh(&imxdma->channel[i].chan);
 
 		dev_warn(imxdma->dev,
 			 "DMA timeout on channel %d -%s%s%s%s\n", i,
@@ -448,8 +447,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 			imx_dmav1_writel(imxdma, tmp, DMA_CCR(chno));
 
 			if (imxdma_chan_is_doing_cyclic(imxdmac))
-				/* Tasklet progression */
-				tasklet_schedule(&imxdmac->dma_tasklet);
+				/* BH progression */
+				dmaengine_schedule_bh(&imxdmac->chan);
 
 			return;
 		}
@@ -462,8 +461,8 @@ static void dma_irq_handle_channel(struct imxdma_channel *imxdmac)
 
 out:
 	imx_dmav1_writel(imxdma, 0, DMA_CCR(chno));
-	/* Tasklet irq */
-	tasklet_schedule(&imxdmac->dma_tasklet);
+	/* Schedule the IRQ BH */
+	dmaengine_schedule_bh(&imxdmac->chan);
 }
 
 static irqreturn_t dma_irq_handler(int irq, void *dev_id)
@@ -592,9 +591,10 @@ static int imxdma_xfer_desc(struct imxdma_desc *d)
 	return 0;
 }
 
-static void imxdma_tasklet(struct tasklet_struct *t)
+static void imxdma_tasklet(struct dma_chan *chan)
 {
-	struct imxdma_channel *imxdmac = from_tasklet(imxdmac, t, dma_tasklet);
+	struct imxdma_channel *imxdmac = container_of(chan, struct imxdma_channel,
+						      chan);
 	struct imxdma_engine *imxdma = imxdmac->imxdma;
 	struct imxdma_desc *desc, *next_desc;
 	unsigned long flags;
@@ -1142,7 +1142,7 @@ static int __init imxdma_probe(struct platform_device *pdev)
 		INIT_LIST_HEAD(&imxdmac->ld_free);
 		INIT_LIST_HEAD(&imxdmac->ld_active);
 
-		tasklet_setup(&imxdmac->dma_tasklet, imxdma_tasklet);
+		dmaengine_init_bh(&imxdmac->chan, imxdma_tasklet);
 		imxdmac->chan.device = &imxdma->dma_device;
 		dma_cookie_init(&imxdmac->chan);
 		imxdmac->channel = i;
@@ -1211,7 +1211,7 @@ static void imxdma_free_irq(struct platform_device *pdev, struct imxdma_engine *
 		if (!is_imx1_dma(imxdma))
 			disable_irq(imxdmac->irq);
 
-		tasklet_kill(&imxdmac->dma_tasklet);
+		dmaengine_kill_bh(&imxdmac->chan);
 	}
 }
 
-- 
2.43.0

