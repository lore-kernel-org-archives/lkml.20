Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316660;
	b=iRra5j85nFfPc2vVBjm/5xN9boyVd1ZNh9dT3+Klad3aHEJ65/lc1Ls8eIFrbL4phDmV
	 oSOn1ZGils1T5blyHHTMH60rF7hMTNX//1XcbZpr/AXZLLzEX6sk3ryscA/JMhvIwaCp/
	 WAyQVBi1EPhLXr4uqlLW2SQqwPXAWz7Q9I1ZyeeJxRwVh0yBttEbRUdezVAYT1nmDwU8f
	 s1riX6qWT43ru1LpdQQqVSPpYSteKHNJ1nMqEhLDHj5QLer/qS4Dx/SuC/9xRsLX6cG6T
	 HCUbYY9fZMnV3b8GNYADDk23SzUERfY7j+cS/UqoFc6Zm+c9eUK7VY7ljB/jpjcXbUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1ZQe4ZEx+yAdgmqarlo9rAFQ6pOj0pg3LDUb//64KOo=;
	b=AkpZgWg/GbHGtENfxjEoFHdJXZYEnWbM8HZMXKXBTHiRYwe+Oi3bLllzgSCOd5msKLnp
	 tiwfU1bN1SJT3FGIJh81LfmL88oaP6LG2DJfHqW4kSbfJe93vr6CsmXbXlMCEcw5moQV+
	 Zsq/pyQJ1Ka2M/V7DsSME/to4fET4ppmDBf965jEcGFjCihE143AYcOHRJGa1Hwqr+6Bb
	 De4tyLBmoAJL4R2wwH3yR48AiIMXPJ/LwSaYt5O8Pk3y7U1l7J78Tgf9hXs6dv81nxl0+
	 rkg83Tk+WqcOkDo5w0dMhZs6jpyquk0xMRZLHF0rL9dQm0VcTjx97/O6GhBsk+i7Z9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFaAkY;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFD9606B2C2
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EFD9606B2C2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GwyFaAkY
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso995135a91.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316660; x=1794921460; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ZQe4ZEx+yAdgmqarlo9rAFQ6pOj0pg3LDUb//64KOo=;
        b=GwyFaAkYkQ+iXObJwQRiVIeWXFOaGVVEiQl7OQX0eBpgVvTp4gleCubPwbaChzzqLa
         WF5YCTdlFX4+z2Q39DAlsnNajIwsvyiJEkE3bpqAl0TxBDef3lxV267U1h8KVloKrN7Z
         1cu6ECVZAPOKN8Rttqk8llnpODT1gfPqxZpzMEMIvxcrV8LnzvxkuOVsu5fZsWK9dar8
         HDg2jXcPnP2WhQ13Oys+2VGvzXZddpeILje2pCwEop8t9ilXWYnb8PoyoKU9yOXIj/L9
         RMeX7i5cmk6ClidQO+JiEdcJUNfBclwQDO7D6huKjLUw0YqwNK+npQGU/pvxxzCwvNRk
         GNhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316660; x=1794921460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ZQe4ZEx+yAdgmqarlo9rAFQ6pOj0pg3LDUb//64KOo=;
        b=EYFjXIB3nr/Q5dyr7BxQZl/vB/8s9Z6D1Ane/TPfrey9MJuygSkuh4y0oKmZASvErR
         6PKaklKhNgnH5ny5TTw6rgEaKauKCnOj8VoeIcHtvt0lCu/6lUWSrE8bjDlfqqChDJcA
         k4XVNkzxS2wOdIll0a3gnrVuEW/n/+evCWOiKZBND9BQQShplcFwCilE84Tf8TZN/7N7
         HYyE3xJPPEfQgrKLTKEFfRbvqeNmet8E8p2DVG/qCxs8h4DltLlZhlQ2f2uwws83k0Gf
         UgaK3zmubo8AeKH9Oixx7p/LmXFu5vtvIFcLMGKWjRMXqEmomWRjW0S0swOmZBwNAiNq
         rcYw==
X-Forwarded-Encrypted: i=1; AL+hErEpjaZUt0a4u6Bjl3Ld0OZTp/LQMz3T7ty2TuIjnF5rXMusxZu5Tl0Cg1AiZRdGN4s9k+3vZm+H+Iu5krU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Shr/P1DIDUuzSfu2P/aFTv1BNgtHxV0rqQWrIKyfh7/PqeIc8
	1Ws23Ro1++zvJNUIZVsJu270LVcBKRWkIhVFgcufJtuGp5PiC19cwlTD
X-Gm-Gg: AYBFou1YdQW3CfBsOm55ZGUKYO4h3/mOZMxbip1p0SnhgEZKtRkB2aTGG5gzkqLebd7
	etjvIPnsCkfBAf54FcZl085iMxsFak50fKunNcghx/2dMsYBlzNI6KdjjXhTLC21TyFmse3vpog
	O9317wh5M+MU5fV+bIp6kSahHp84b6h4mSxb1/UIdKUHmeWzzrXuR2YAqQHC3109zdIO8iskx61
	xhdIwowe88isq3XhSP7wWvU2uv69AQC83R59hXNF2Zznao/JV+yvhRjHsJ00kZilTRjDf07IPnK
	CdNkC6l9hMlYhUKQy/M0rfdVhSrcTBscm5huVFpYf1vwJfXSfuAx5A1/c4ca8RHEsAuEGtsW3aq
	FFEMw38lZiBShFZjUmNbAbJkC9oH2bMNEviLTngovE1//u/5CZ2LQ/maAVvH0eAqINjnslAqBHv
	eOP/H5Jupm2FFyoD7IWZe4AB1GLL+TzP4TIuweHF2MnRGSYdRSrxoeJL72D38XErvIF7xQHpjvU
	bEIeCOL5pvqs1wZBfT5unubNTsNtHbIkvvxsTxHfyPEYVV1GogmG7y1ikljVYZ9/aqbX4rIvsXr
	EnBcslzsPnvXQnpk5UbVU9Nvp4TFqAE9
X-Received: by 2002:a17:90b:5485:b0:3ac:8527:3fc5 with SMTP id 98e67ed59e1d1-3b166b4157dmr2728930a91.3.1794316659586;
        Tue, 10 Nov 2026 05:17:39 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:39 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Logan Gunthorpe <logang@deltatee.com>,
	Kelvin Cao <kelvin.cao@microchip.com>,
	Frank Li <Frank.Li@kernel.org>
Subject: [PATCH v4 33/33] dmaengine: switchtec: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:33 -0800
Message-ID: <7b1ffe42093c54956a295bde752c3663d1284f37.1794315350.git.allen.lkml@gmail.com>
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

Replace the per-channel descriptor completion tasklet with the shared
dmaengine BH helpers. Client callbacks remain in softirq context while
using the common scheduling and teardown mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/switchtec_dma.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/dma/switchtec_dma.c b/drivers/dma/switchtec_dma.c
index a386c3a284e6..21b281ea7cd7 100644
--- a/drivers/dma/switchtec_dma.c
+++ b/drivers/dma/switchtec_dma.c
@@ -133,8 +133,6 @@ struct switchtec_dma_chan {
 	/* Serialize hardware control register access */
 	spinlock_t hw_ctrl_lock;
 
-	struct tasklet_struct desc_task;
-
 	/* Serialize descriptor preparation */
 	spinlock_t submit_lock;
 	bool ring_active;
@@ -584,6 +582,7 @@ static void switchtec_dma_synchronize(struct dma_chan *chan)
 
 	int rc;
 
+	dmaengine_kill_bh(chan);
 	switchtec_dma_abort_desc(swdma_chan, 1);
 
 	rc = enable_channel(swdma_chan);
@@ -820,9 +819,10 @@ static int switchtec_dma_resume(struct dma_chan *chan)
 	return ret;
 }
 
-static void switchtec_dma_desc_task(unsigned long data)
+static void switchtec_dma_desc_task(struct dma_chan *chan)
 {
-	struct switchtec_dma_chan *swdma_chan = (void *)data;
+	struct switchtec_dma_chan *swdma_chan =
+		container_of(chan, struct switchtec_dma_chan, dma_chan);
 
 	switchtec_dma_cleanup_completed(swdma_chan);
 }
@@ -832,7 +832,7 @@ static irqreturn_t switchtec_dma_isr(int irq, void *chan)
 	struct switchtec_dma_chan *swdma_chan = chan;
 
 	if (swdma_chan->comp_ring_active)
-		tasklet_schedule(&swdma_chan->desc_task);
+		dmaengine_schedule_bh(&swdma_chan->dma_chan);
 
 	return IRQ_HANDLED;
 }
@@ -1060,6 +1060,7 @@ static void switchtec_dma_free_chan_resources(struct dma_chan *chan)
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	switchtec_dma_chan_stop(swdma_chan);
+	dmaengine_kill_bh(chan);
 	switchtec_dma_abort_desc(swdma_chan, 0);
 	switchtec_dma_free_desc(swdma_chan);
 
@@ -1086,8 +1087,6 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
 	spin_lock_init(&swdma_chan->hw_ctrl_lock);
 	spin_lock_init(&swdma_chan->submit_lock);
 	spin_lock_init(&swdma_chan->complete_lock);
-	tasklet_init(&swdma_chan->desc_task, switchtec_dma_desc_task,
-		     (unsigned long)swdma_chan);
 
 	swdma_chan->mmio_chan_fw =
 		swdma_dev->bar + SWITCHTEC_DMAC_CHAN_CFG_STS_OFFSET +
@@ -1135,6 +1134,7 @@ static int switchtec_dma_chan_init(struct switchtec_dma_dev *swdma_dev,
 	chan = &swdma_chan->dma_chan;
 	chan->device = dma;
 	dma_cookie_init(chan);
+	dmaengine_init_bh(chan, switchtec_dma_desc_task);
 
 	list_add_tail(&chan->device_node, &dma->channels);
 
@@ -1157,7 +1157,7 @@ static int switchtec_dma_chan_free(struct pci_dev *pdev,
 	spin_unlock_bh(&swdma_chan->complete_lock);
 
 	pci_free_irq(pdev, swdma_chan->irq, swdma_chan);
-	tasklet_kill(&swdma_chan->desc_task);
+	dmaengine_kill_bh(&swdma_chan->dma_chan);
 
 	switchtec_dma_chan_stop(swdma_chan);
 
-- 
2.43.0

