Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316560;
	b=WrWyVWVXOIxVkxf12D0vHXDvdtW3SmSQcQVfS4qEyEsk3E4UbgJ8KiR4ApGy5NazQsKm
	 9tY7iKyaSMbsAuTqX8g9CP9t7AGi6zdkobVLWv8wS8puYWcXC1BWJPvUxGCIeE9JE/7b1
	 QGRkpaBYC1Wllcjpp+1xg7cU98po5uOjxD/0tgQRufVeblMbcdTSCM6tfyummPeUFq5b4
	 3baP6ReHnAbH0x8HGqfUoJHmpdeQ+ktJMFaOT4y3tMdEoJI+OqQvGxlMl9c+LAGSAQgoS
	 yBj2b7enqlmy9ARbMFXVKRasE+MoTlKg6sQibaG8vsBtL89KjIvt9vAIZ2kIme6cByA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Aoy2iWfB7hqjW4B4DNGdsqEpTmVd+l4psP9CnQFUpAs=;
	b=rLcZ62sQr+G2XlMOJ4jc+LiuktA3C6AE7OiO5jPlVA+h4pEfF/Q08fHj2kQpSi34t67w
	 IJ9WoF5N0HUP6aepg9kTfxvMvILoxHRevQmm1Ys3TZqw+mkmCMtAov512sCHSFt+1X6oh
	 7D/iQWecZiAcxSD7OdY8qGHIaqRB/vpODPTF7xt4nz3bbMxVLuoP2j6LwCRA5mxBfTQ0D
	 871/WGZTtrAp+SCnRkdch+HcwNM5/ErFEMxWhg/+GM5VvKaH9fcyscwq+PsqamH/sGqUF
	 NqlDMewdNkj8AbsThu7pd2wFTAtG/eetE798lw19YLJgV9AG1LpF0PbSqhXipzknmUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4G4eHWN;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2959560A262F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2959560A262F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S4G4eHWN
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b094e649d3so1241142a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316559; x=1794921359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aoy2iWfB7hqjW4B4DNGdsqEpTmVd+l4psP9CnQFUpAs=;
        b=S4G4eHWNhSfVg1jQj/xBgFkVxBYbeeoiaXJ5uFYwQQmOJBLmLXdnjs5YRzKwNkeLLW
         nJ1ZhbKslLfmsrE+sL/8hnRkmyexnjHVsbVIFZ4tHB6/oveAuPCgbVML/0kIiMbSt24Y
         bk0UvujzfeKoBMjGo7WyAsAWthBiitWH4Z1RDRNXlygQuOBpU5mRoKF7Em7pV1AYE2Qs
         zRxAjFKjg7PRDqLG0ZYqpVfZ+w4k5NpBNWtLMqXTxZguuQzWwY8yUohFgMHiMtZR6ghb
         E9PuaGVZn2MWZJx7bS7frB2mbavP/rKIQheXFWt55V8gIUjvfzxjaNxDc9JUsxljetr0
         Wqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316559; x=1794921359;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aoy2iWfB7hqjW4B4DNGdsqEpTmVd+l4psP9CnQFUpAs=;
        b=jOu3Slhukb7itk7shMBz/IMz+hbjTJQC0nwn/Nc7g6pXnuw/0cAZnh+zGAu8zyrZiK
         hBqBN6+Ec1CWxjeriSCzQwdQoyAxU2awEhGOYwNyZcGVJx8q84hyk5qnuEh9JHvk573q
         BIpcYvKAfTtTb6AlhhRrUrq7EgnG3ZuC5N1a9Sd90T55+EZgFnxrYRj7AtEyrWqvrUUj
         1LMGLPbsMHaPMY/kN7O5Se4gIgULRO8Ah8vUjfbjHKudOLwgjP8Hl39nWKsEI8fvgzTw
         ebaFccAM7Nn/PRw8nf7DjWt0zPNGB3Yy7ZWUu+qCUF7Gd1GckYVtmE4Riv6VfCyN1tdK
         Y2ww==
X-Forwarded-Encrypted: i=1; AL+hErFTxKIwY/HuIRE5p5lgn7+tP70Qj2rrVZll6dqPJA4sou0H+WC8i2UW35YxnpKy/nleyLL8RfSQcCZNGRc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/NF5vaptPe1Kv+cKhqRQp6IsJoc9urB/XKlMroXGRisjxoGytz
	a56KdQ0/Z6LBs7ux4iwYbIDLcIlMMYxIKq1vtqAC6tGeRtvnY9J89xX1
X-Gm-Gg: AYBFou13pVjQ+TwWI/Yky/yVt7o6ShbwGSaAs2jYqr1d9fLY5c6lgZVPC3bf8FQC/1z
	o/CMQLVIEc6RDGoIOywsuicEeL2srr07ef2CTHKfOQn3/Nr6q8zW4BnftTITmneNRUN0QpAWQE6
	8mT9p9N0rj642tCO0DrKCJ8eaCxAR2RvjOQvnTnLMnhW73WCMNotpGA8MJ6jipi8qHi6+9PlU3Y
	OntqUdAVgb6mar0mUBsFSs2yl7Ojp5Yn+CSqcsxkx4LmlXy3VPH+jcBHBg0jGHnTbvNFfysqbiu
	oWH6hHcEZSIPYBK+edN0dNaZPH4jByB0wMxE18zram5KpykYloJnmCxI+S7d5+6GsA/CehUco4Y
	nI9gUa2tuWsg8Z26EO04FtP9nUE9rJL4lsxshKhJmeaAecTYPrySqyspsXF02daRSUq0WAjxzci
	4KnQGiF0unNeO0HQboVTlIztf25UnRUEZ7UOcmVwGNKnU+KKxrAj9s+YgmXcoChQYu8yDfrCii3
	t/cB5eQ106LB+++E9pt9nEp4AKy6duMSOr0nLAPTTUfqyTKM1M8vEBS4YqTqmM9AvLsdTReSWKM
	3xjgbp9fqDmTQ4wuEkNZOMAZ1vWUaJ0=
X-Received: by 2002:a17:90a:e7c8:b0:3ac:da41:ef7e with SMTP id 98e67ed59e1d1-3b166d1a008mr2743472a91.52.1794316559290;
        Tue, 10 Nov 2026 05:15:59 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:59 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 07/33] dmaengine: fsl_raid: run completions via dmaengine BH
Date: Tue, 10 Nov 2026 05:13:07 -0800
Message-ID: <f4a0692d25545a81a8f47f9fef1661ed4013c7f0.1794315350.git.allen.lkml@gmail.com>
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
---
 drivers/dma/fsl_raid.c | 11 ++++++-----
 drivers/dma/fsl_raid.h |  1 -
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsl_raid.c b/drivers/dma/fsl_raid.c
index fbfd3b6fa586..26c6c84619ec 100644
--- a/drivers/dma/fsl_raid.c
+++ b/drivers/dma/fsl_raid.c
@@ -155,9 +155,10 @@ static void fsl_re_cleanup_descs(struct fsl_re_chan *re_chan)
 	fsl_re_issue_pending(&re_chan->chan);
 }
 
-static void fsl_re_dequeue(struct tasklet_struct *t)
+static void fsl_re_dequeue(struct dma_chan *chan)
 {
-	struct fsl_re_chan *re_chan = from_tasklet(re_chan, t, irqtask);
+	struct fsl_re_chan *re_chan = container_of(chan, struct fsl_re_chan,
+						   chan);
 	struct fsl_re_desc *desc, *_desc;
 	struct fsl_re_hw_desc *hwdesc;
 	unsigned long flags;
@@ -235,7 +236,7 @@ static irqreturn_t fsl_re_isr(int irq, void *data)
 	/* Clear interrupt */
 	out_be32(&re_chan->jrregs->jr_interrupt_status, FSL_RE_CLR_INTR);
 
-	tasklet_schedule(&re_chan->irqtask);
+	dmaengine_schedule_bh(&re_chan->chan);
 
 	return IRQ_HANDLED;
 }
@@ -678,7 +679,7 @@ static int fsl_re_chan_probe(struct platform_device *ofdev,
 	snprintf(chan->name, sizeof(chan->name), "re_jr%02d", q);
 
 	chandev = &chan_ofdev->dev;
-	tasklet_setup(&chan->irqtask, fsl_re_dequeue);
+	dmaengine_init_bh(&chan->chan, fsl_re_dequeue);
 
 	ret = request_irq(chan->irq, fsl_re_isr, 0, chan->name, chandev);
 	if (ret) {
@@ -852,7 +853,7 @@ static int fsl_re_probe(struct platform_device *ofdev)
 
 static void fsl_re_remove_chan(struct fsl_re_chan *chan)
 {
-	tasklet_kill(&chan->irqtask);
+	dmaengine_kill_bh(&chan->chan);
 
 	dma_pool_free(chan->re_dev->hw_desc_pool, chan->inb_ring_virt_addr,
 		      chan->inb_phys_addr);
diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
index adbfede330a7..3bc11b12fa37 100644
--- a/drivers/dma/fsl_raid.h
+++ b/drivers/dma/fsl_raid.h
@@ -275,7 +275,6 @@ struct fsl_re_chan {
 	struct dma_chan chan;
 	struct fsl_re_chan_cfg __iomem *jrregs;
 	int irq;
-	struct tasklet_struct irqtask;
 	u32 alloc_count;
 
 	/* hw descriptor ring for inbound queue*/
-- 
2.43.0

