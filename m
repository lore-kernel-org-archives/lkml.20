Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316626;
	b=g8umdT8IVkrHEd2v60AK2CZ20MO0boTjdK4VkopilidOoHd+KfFiAtY0h077Bi/fBU1V
	 LJUQ2ePFiA1VkYFFvJHGFd7HAza3veQG0qt4qZ/16S0Kf+KfUp+OOr6pRepHO0ClyZ/zr
	 PF9K3fd2k2SI7vnghjosVK65nvf7ejSvQmInFq7q68nFiDeXx6D00fUVZTKhP9kldcDhM
	 3lO4Fwa1PG15gAzeUWWqQYTUhecBb5qke67YVILgY6M3AhK5FwQshi/2eU2ozBn2hXxs4
	 svzXt7xMD1T+gwMjyJsHvbWXOfa+JLlPeuWkKAvSE+7v8K2NJpxzsoDEWpvvE+XFjUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
	b=qPo3AROj3GJG9jIDDfUIsLastWt72qmL9i/AF7nRZErdZ6D6xwxyIe1ZTD+tH1sX+sOn
	 g5S+m8uv4b2gsHi4Lxgf7F2RnW/SzwtsAOo1bDv6159BpZu+gg8sbF7ccvdLmoScsvBWR
	 POuISQu1VoamRpN3ihwn/+utjkjsa9Q1rLHkC5YmpQJ4sM5XEXrIH/myN8GUdZ9mbEQbd
	 G1A5Je2MPbyJ1jlDI4fwftEw0sx8eJQnM/HHp9TPocns2wV0tvdfpYwgUeXNZFnQrfd5a
	 mdYj1IM/mKvpYPIuXsb0mY7Aa3D4AWP9/CRSZlbcD1zjlrjqK/xXocloi73L7s+9Yvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeLyIY68;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C41D26070783
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C41D26070783
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GeLyIY68
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b16896b8ceso461653a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316625; x=1794921425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
        b=GeLyIY680n5wyd98VzItZSPFhXMUnGdWCfjgn9tcV8+ZVZN2feBGHT4rWqw2+lDauf
         ZL7oxHXE4Eh0PxkKpunqWsKm/HAdD91k/0O1/rC9mV8jrWuuPnIrd2+Hl2k55lgAWGB8
         kDTNa4ADeevKTdVnzSb1cPtYe4niHx4+CMZL1h248GWMj+++xDeEPxWDipBdYsmnP+b5
         JHt3CF8hg6Wuvo+02hjmcuXHEfFDzIVW2Zai4DDFNOHYH6Y9qiqIJsQMpVvbjIX0rqxn
         q05i25zyVgPvlQlas7WXwtDvcCBKZzrpwWDvKifvlIV13KK4vlXXSvqyiHgSsPLCCZpA
         9scA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316625; x=1794921425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=UDGEeIGl4cmMHqxG8jYaVJEd+wCk+Kc7q5Dy4Q/P2n8=;
        b=QdcQifTN5QiIYl8NucQ/umN1QpvmtTMQkmEIE6hef8SBZcDNUcuAWxocZYzijuBLOH
         ArDplUiMepmzuAcXRNS9CHKBj89PjGH5mhF6slGluVJcexaR7NZlrCvnxoItdj+535Bp
         8nJksi/fOsgGnPZDCVkqbsDjH9JJjIT0ub8eYEqpUNv99ReG64lCch6GSpIMyJGyZTaQ
         bQ4bnGrMtFkHhIhk/VltgyFKefjkKjmmDvseuC2hwwWT9vnpO0rayMQKggAvwjpzIp4K
         96khLOF7VORzFfet+exGXwTKPgmIYaeE1crlP+7f6OivzvPM8VTdylBN9lyg25I4oG1B
         ICHQ==
X-Forwarded-Encrypted: i=1; AL+hErExC03hzuyjzqbtSOYpwY+nSHL7tXf27mssR/AJWvQBcXp9lfOeU4hKDqxZMnRZkX+jhV3LwskD5u5QWvk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/u1CwJJR9VXpzsVh9DWcpY4uc3iTXHEO2pGWgxDbEFBzKxOoMU
	oTE95Z09em8Kq+gVVyalwTmw+XNnpnKEMzEwQi32bFbs4/AeqrnE3GX1
X-Gm-Gg: AYBFou29n2aTfNBc16VbBKFUF+j7kqQWfFBySgtT9lN0mtI23uru552LuU0m539eQ4Z
	5ggp/bRdnKIpQB/TMFd400AhAoaHrAM7B5JeBXN5Lu5exvsXHynrfAePcG7t4vCFnzopB+cz1S2
	VrLKYmd6W9FlQrX1KecM5S72U4DUTEKrq7g6sy8YXDnXer3nhONL6i8MOJ3dralRHuFXX8y9En0
	9i6AChIuV5vdriAVz7iNP/gHTPx6odRNv6V64jrJXT0w9X3bceLCDr9gioWguLuhiccgrc5jRnh
	3bxKzi5TUOPMN4At3O5qaqSfX98w1PG3kHHm97XKuOHDH2+Gfx/f7Mv4mv25tgbtgWMrs7ChBcv
	/1l98AD2/Sd0q8hunGGk/I7PAb43t9vID8uCLupS8Ig1inAy4fjYE5Yk0n9ZU2xaj4QYHRaBdmQ
	y7fDP2F6XlZ8VIO/1WECswi6MQOU2tb0jHWB4SjENek4Up/M+whzgCLRiDwbmKXpGJrcBY8PSfZ
	rg5QyeiT37TiVv4nMiF1JKohpT49Gm9nnBay+s7o/kq4NypBFdyzZG/Y4kkhDd6WggLt5pTo56Z
	YkKtgXIaVT3dbolFOUewwfSQjB5kb3o=
X-Received: by 2002:a17:90b:1812:b0:3ad:3e8:12 with SMTP id 98e67ed59e1d1-3b166d1e0eamr2281998a91.48.1794316625094;
        Tue, 10 Nov 2026 05:17:05 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:04 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Golla Nagendra <nagendra.golla@amd.com>,
	Abin Joseph <abin.joseph@amd.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Kees Cook <kees@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 21/33] dmaengine: zynqmp-dma: switch completion tasklet to dmaengine BH
Date: Tue, 10 Nov 2026 05:13:21 -0800
Message-ID: <6b2f74549b23746ca0bdb99d7ae77181071c4f21.1794315350.git.allen.lkml@gmail.com>
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
 drivers/dma/xilinx/zynqmp_dma.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/dma/xilinx/zynqmp_dma.c b/drivers/dma/xilinx/zynqmp_dma.c
index bc85dca47412..aca32eb175bc 100644
--- a/drivers/dma/xilinx/zynqmp_dma.c
+++ b/drivers/dma/xilinx/zynqmp_dma.c
@@ -205,7 +205,6 @@ struct zynqmp_dma_desc_sw {
  * @dev: The dma device
  * @irq: Linux IRQ number, or -1 when not registered
  * @is_dmacoherent: Tells whether dma operations are coherent or not
- * @tasklet: Cleanup work after irq
  * @idle: Channel status
  * @desc_size: Size of the low level descriptor
  * @err: Channel has errors
@@ -230,7 +229,6 @@ struct zynqmp_dma_chan {
 	struct device *dev;
 	int irq;
 	bool is_dmacoherent;
-	struct tasklet_struct tasklet;
 	bool idle;
 	size_t desc_size;
 	bool err;
@@ -743,7 +741,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	writel(isr, chan->regs + ZYNQMP_DMA_ISR);
 	if (status & ZYNQMP_DMA_INT_DONE) {
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		ret = IRQ_HANDLED;
 	}
 
@@ -752,7 +750,7 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 	if (status & ZYNQMP_DMA_INT_ERR) {
 		chan->err = true;
-		tasklet_schedule(&chan->tasklet);
+		dmaengine_schedule_bh(&chan->common);
 		dev_err(chan->dev, "Channel %p has errors\n", chan);
 		ret = IRQ_HANDLED;
 	}
@@ -768,11 +766,12 @@ static irqreturn_t zynqmp_dma_irq_handler(int irq, void *data)
 
 /**
  * zynqmp_dma_do_tasklet - Schedule completion tasklet
- * @t: Pointer to the ZynqMP DMA channel structure
+ * @c: Pointer to the ZynqMP DMA channel structure
  */
-static void zynqmp_dma_do_tasklet(struct tasklet_struct *t)
+static void zynqmp_dma_do_tasklet(struct dma_chan *c)
 {
-	struct zynqmp_dma_chan *chan = from_tasklet(chan, t, tasklet);
+	struct zynqmp_dma_chan *chan = container_of(c,
+			struct zynqmp_dma_chan, common);
 	u32 count;
 	unsigned long irqflags;
 
@@ -823,7 +822,7 @@ static void zynqmp_dma_synchronize(struct dma_chan *dchan)
 {
 	struct zynqmp_dma_chan *chan = to_chan(dchan);
 
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 }
 
 /**
@@ -899,7 +898,7 @@ static void zynqmp_dma_chan_remove(struct zynqmp_dma_chan *chan)
 
 	if (chan->irq >= 0)
 		devm_free_irq(chan->zdev->dev, chan->irq, chan);
-	tasklet_kill(&chan->tasklet);
+	dmaengine_kill_bh(&chan->common);
 	if (!list_empty(&chan->common.device_node))
 		list_del(&chan->common.device_node);
 }
@@ -951,7 +950,7 @@ static int zynqmp_dma_chan_probe(struct zynqmp_dma_device *zdev,
 
 	chan->is_dmacoherent = of_dma_is_coherent(node);
 	zdev->chan = chan;
-	tasklet_setup(&chan->tasklet, zynqmp_dma_do_tasklet);
+	dmaengine_init_bh(&chan->common, zynqmp_dma_do_tasklet);
 	spin_lock_init(&chan->lock);
 	INIT_LIST_HEAD(&chan->active_list);
 	INIT_LIST_HEAD(&chan->pending_list);
-- 
2.43.0

