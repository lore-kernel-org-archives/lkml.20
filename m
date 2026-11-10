Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316636;
	b=OS1XXL6u0PTBc0YpaoqDae8oxEYRadVje2nwF+ZSMjowtC5ZUT6gzQvd4fxIIoHpgHXi
	 XK7xVP85bqI6W0KvHvsBpEPKklK9rwtc9ipZRQPd5UFd1RWPkk0n4fAvcM1+c4O5WJTtT
	 A9eiFKtKC3ETCtP7Bk/SBNOxIXVispg+7i0rys0rkeYBOyv8qzir41I0aIStF8pqQFijX
	 RwiXvwFk7g+SXMIuOhYaYC1vMQui0kiFnoMzi27LMmCwjiKqLArA+KzNQS3PDW83mQ6BB
	 63JbR+Zo/vj2VlBElOUK/NXV2GZhScNj7dZnIMZr7vXj/585TRlHoN+SaXtYsndZy/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316636;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=l1pi1XUDschNZw5wd/NqRDLF/PgSvJCjkj/LDlLiJKI=;
	b=f2RFOJK1mTdeZUwIjzZRsBgyIYuK1LBYostU1mGCQ5AVO8ZZO2uJ8LB8tBsGlvM++rcH
	 a0Mn6jkZPhfI/ywyEgbUR53wTVomcS8MEotXAI4p4nPCVlDgd/AWSZ9xYooYpFv4PB1XA
	 bkgCFwKMUshnho5wMrI0xMHeYgu4E8xms0wUrLfQ9erBjHWjg7hjTBJ4KbMMnWlqVfsQn
	 N2WvcXZI6cZSX7VzhVTwW3dFiNMew+E6pZ0QDnhxRCtCX/Ukpvo+5M5hHNYOvWGnkqGE1
	 nbVf+fRr4v0IYtU97Mn69flSFLtbD8f//IRgXBNfKQfoUAoWyiXndsGkWuvszxM8O6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mh3cCAsf;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A338E606ACD2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A338E606ACD2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Mh3cCAsf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b0e0e65adbso1003049a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316635; x=1794921435; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l1pi1XUDschNZw5wd/NqRDLF/PgSvJCjkj/LDlLiJKI=;
        b=Mh3cCAsfNJiZEfERkAPdueKxjidLed2is4jMSorEMT8iWHNviGCAjbPOmNc4+92vD1
         4HxIAaH87KC94BVFEOdeSDmVo4+5c0Ls6t34Z/LxDBvhorHB5a/Lw/XfkURu8WrZmY7/
         3W6yLIdNTkljMtm2IvPT3NSy6Zw5YSOJI1o+CUb3F4tVffGchMVS//f0KmJ0YSrJ9Wcw
         1+YRNJCH7xxNm2ubZ51tbJBlgbB5CIqTmgt/lqV9K6tBKEvBDXM+l6+UhpXd2+CDTJka
         jE8H+ooaLKf1T5E+nYBvpi4pePf7mxOdM7P+0pUHeoG91tBnHsVWaGYwvu/wbxqytsob
         KTtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316635; x=1794921435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l1pi1XUDschNZw5wd/NqRDLF/PgSvJCjkj/LDlLiJKI=;
        b=tcU6EWU615EmcyjX1oLVgfP8RgaKmce3sCER/u/DEeaCZtgMvMbbZtPuB6EDsGSEyS
         tP7MrlEtu2RN2WJ7bA3bzOJlC6L/yDwtkpiIfLK9h4JqQEeIQlxsI5ywPF9/vMaqJQL0
         Vuc6LRkIji4dHsuPyW4oyhhvQ4G6+AVqG0Xytq7aaf8P/N/lIp7T0Z93/N7/LUlzTcSo
         oFylgu90AiAAef+3LrUtxLLrttN+Lv4Z+LbUBhehhALeewLzF8hm573aR8gM8BcN1w3h
         0sFFSntIZwQBVKIpN6Wg4XeAzq0zNn5d4kV2p5IwN/IVSzJ9XNh9tkMDPSBsVqd5332P
         oAYA==
X-Forwarded-Encrypted: i=1; AL+hErGlvGJvHK7qESi0B2qzyun5JiE+98ddCvwjkYgse66BR6z4BBzPkMJWtgI+Srh+b/8G4TBeXKKdMs+nQXI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/r/9UO/w2NElEDt5Y5j2Ad2U9AJQg177JUzAwVw8lDhere2hhp
	l8+uJJH7T8VvaWJEYOrffdwTIz1nDjs5xs9Jn0teLNhQ/UgrHDZCKr2n
X-Gm-Gg: AYBFou2ugC6TShXPMP+h+FbUwrJ7dBvG1P04Slu/MFw7yvgVXdkHRhlXsH8QXjuEvkU
	v6Sn0O+Al12p9Lwi1y6KX+6NXWeul/kxG/3UoRkEY99mDPzfH+V9PUGvfXihhEfespCYEJn8b8g
	Ixldp7XmqJMzZlZ6cuYLrd2smMboVqtmCKufHNBFUWsuGTmPS19JhbWMfNR54lJO0U07ahCtWY7
	iyL4gLrvgugi2wnYuHShI+2IAzCKu0c/IJjYkBfiL5s1Uki9QSoXNwMc4Ugl7sc+pT1FRIbExgF
	WvrieeirMiugaVMdNAIwofU0gfAoIIayC6C98N/Koh0Enga3JP7ZMvbOgIzIBtqJ0eEj5cmHG9W
	Q8aNLSrRyOBb2w5GdkxOELlToeLIsMwKw7t9JEP1qX00yPFBSmRZbNAHWI6CETebF+zSddzxAKw
	zCj5mLaqMEgv0L9t9vba27ZL3nUg8pIX7ogkIT04HO7+O4P2Ntqni9OCPqTmIAblKAigEwSo2qq
	+dvvUEfYazoiCq5ZlUuqXS8D3hvF198+JRm+WuLmo0aMQNi6G6tnGwShXdC+0PLM3Ap/QbvKBDA
	nOdHwRPZRL03DSWu5V5o5xoQZAQgVnw+
X-Received: by 2002:a17:90b:3ec1:b0:3ab:189b:6981 with SMTP id 98e67ed59e1d1-3b166cde7b8mr2780267a91.48.1794316634965;
        Tue, 10 Nov 2026 05:17:14 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:14 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 25/33] dmaengine: mv_xor_v2: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:25 -0800
Message-ID: <4ea53128f001eba3e96a6e0ecebc0651d918a155.1794315350.git.allen.lkml@gmail.com>
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

Replace the device tasklet with the per-channel BH helper so descriptor
callbacks run through dmaengine_*_bh.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/mv_xor_v2.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/dma/mv_xor_v2.c b/drivers/dma/mv_xor_v2.c
index 1920dcd5886e..3c8d7b065d3f 100644
--- a/drivers/dma/mv_xor_v2.c
+++ b/drivers/dma/mv_xor_v2.c
@@ -139,7 +139,6 @@ struct mv_xor_v2_descriptor {
  * @reg_clk: reference to the 'reg' clock
  * @dma_base: memory mapped DMA register base
  * @glob_base: memory mapped global register base
- * @irq_tasklet: tasklet used for IRQ handling call-backs
  * @free_sw_desc: linked list of free SW descriptors
  * @dmadev: dma device
  * @dmachan: dma channel
@@ -158,7 +157,6 @@ struct mv_xor_v2_device {
 	void __iomem *glob_base;
 	struct clk *clk;
 	struct clk *reg_clk;
-	struct tasklet_struct irq_tasklet;
 	struct list_head free_sw_desc;
 	struct dma_device dmadev;
 	struct dma_chan	dmachan;
@@ -290,8 +288,8 @@ static irqreturn_t mv_xor_v2_interrupt_handler(int irq, void *data)
 	if (!ndescs)
 		return IRQ_NONE;
 
-	/* schedule a tasklet to handle descriptors callbacks */
-	tasklet_schedule(&xor_dev->irq_tasklet);
+	/* schedule a bottom half to handle descriptors callbacks */
+	dmaengine_schedule_bh(&xor_dev->dmachan);
 
 	return IRQ_HANDLED;
 }
@@ -346,8 +344,8 @@ mv_xor_v2_prep_sw_desc(struct mv_xor_v2_device *xor_dev)
 
 	if (list_empty(&xor_dev->free_sw_desc)) {
 		spin_unlock_bh(&xor_dev->lock);
-		/* schedule tasklet to free some descriptors */
-		tasklet_schedule(&xor_dev->irq_tasklet);
+		/* schedule bottom half to free some descriptors */
+		dmaengine_schedule_bh(&xor_dev->dmachan);
 		return NULL;
 	}
 
@@ -553,10 +551,10 @@ int mv_xor_v2_get_pending_params(struct mv_xor_v2_device *xor_dev,
 /*
  * handle the descriptors after HW process
  */
-static void mv_xor_v2_tasklet(struct tasklet_struct *t)
+static void mv_xor_v2_tasklet(struct dma_chan *chan)
 {
-	struct mv_xor_v2_device *xor_dev = from_tasklet(xor_dev, t,
-							irq_tasklet);
+	struct mv_xor_v2_device *xor_dev =
+		container_of(chan, struct mv_xor_v2_device, dmachan);
 	int pending_ptr, num_of_pending, i;
 	struct mv_xor_v2_sw_desc *next_pending_sw_desc = NULL;
 
@@ -760,7 +758,7 @@ static int mv_xor_v2_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_msi_irqs;
 
-	tasklet_setup(&xor_dev->irq_tasklet, mv_xor_v2_tasklet);
+	dmaengine_init_bh(&xor_dev->dmachan, mv_xor_v2_tasklet);
 
 	xor_dev->desc_size = mv_xor_v2_set_desc_size(xor_dev);
 
@@ -868,7 +866,7 @@ static void mv_xor_v2_remove(struct platform_device *pdev)
 
 	platform_device_msi_free_irqs_all(&pdev->dev);
 
-	tasklet_kill(&xor_dev->irq_tasklet);
+	dmaengine_kill_bh(&xor_dev->dmachan);
 }
 
 #ifdef CONFIG_OF
-- 
2.43.0

