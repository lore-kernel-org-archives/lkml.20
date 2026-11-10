Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316643;
	b=bdh95uqXWAqE2UnA1FKgZI7IDWnacvReVFJsA44a+4pgvK2xBqR0fCez6htJHTJFDcdX
	 wq7Zzg8gi0DyNZni6FPNAYbl2OuMoNRRgbKbxOxiYIODirkN3r1agKGnnFzoxgXlzdfBM
	 LwR8Aov5zJIn1QMdRrXw/89vD39de1M2uQSL/jBC7/ag003ZIRS4UoLNE7/MJ1xoFAxh3
	 K1rTIGmZimnTih2dltrVcjMohua8KYpFVGNZRmyJhPF8aRnLrpUdOvJFoq+OMWcuZuqBH
	 pna37D7JWu9XEXkvzJMM4gtcRDx1nsf5vZPfh6LUzDj0Vz6NpYEDtVsARs0CkGNh2Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316643;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
	b=n/8VGP3k0fc6nDeODNPUvqPPXsQj0WOT/ltQgXWQKDp0UESAwQ4tLvSgKzr90Db9e72C
	 SKhz1U9wOTlkCn/FLwcSLmw0yjUkMSsaBnVWmlYyZvx0RbEpCPQ06jgx1yNeq7vLaFz3f
	 /6GEILMgI1tF6jJfpMVeH8sFO/6ca/xe2MOmSe+NZNwlhounYOkcY8W/exAJ17s1TInGQ
	 xcD6kIPZXxDaBn+Fx+2mQOtXBtEBWVG6d4C5tMsWrhsAUm/3M65R+cWTEo3IRxtwZ58GZ
	 iqqWIX/fzANbPUE3x8gynCDAO9Id6gfURCJchInue+MtID1hAtc27QfIo5Gd9uKxAfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giNnwQEf;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFA2606ACFB
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 13:17:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFFA2606ACFB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=giNnwQEf
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b08a162d4bso1127405a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316642; x=1794921442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
        b=giNnwQEflUToyyLtq/59cQqoXFJz3maGvZr6eRUrUItqVzcS9xhHzN7Xr6sfibDPa1
         p8V4dm6BRiUD1OHQaISuwb306Cuhw98jw963v/n8Z4p9agA3gPFG2IORMAu3AdPn/mL8
         mrWO2/UH8CKX1H0i4KFjJjLXyZmGhpi9EHG1GpDLL9TKImskwzcDSZ6XGNST0LlozPpj
         DLBR/8OxDE9JbZxP7dINJv52Akywoj1zPLdsklNPnPaVcvy9Q5nnh7Pjkl7iCHzCAlmJ
         YkslGx3p2jagY83WiA1d0VsoIoA+xmrg4pwn5JNtUTQ86vjME9xJxY4fjPGjVID5Zao4
         Tafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316642; x=1794921442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ml3zJxxV6zteBKfYjRhx0ricvuNkb6CeX/qUwgIXjIs=;
        b=R3JeSoU1lD1QN7HIkNKdc4U5g36rT+qZeKddDtk5XuNSSXBSRSLdRjKH5mIvSteqcE
         J1J+dwXnEA+hUQThqBgN7v31b1eTBe2qSKC4bTJ7XdLmsP92DxTNBj5uUYe5ZqEyMFtg
         pxGcDUQJg6I/JFAcKZDU7tQd59wUL7OmoUuNpv04IhhpK2BWGyQpLEbwgnva5mrpU7G1
         uyTcOgc4HY6TzLi78qdxjf2Jb1JKAbaRHKw2tFxY4IsjOH15iuyxQumGRaUSqRrZJs44
         J3pywaOb7VewgB2ppbX1YHpgeMqBvFyABoTBcvq80l3YG7IhhB706qux5wFreoUdYDig
         +KyQ==
X-Forwarded-Encrypted: i=1; AL+hErHkdO6bHe3ymDXNJGFEYmk5r3JbUQHa114xNhlgpVZIYhQdfL5wDDOPcA1oIcfPmAVJxfzUMMeoo53WFlE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gHj1WgsNiG/cVqp3CbFXoofovZiP4mpwntoApJndEHc3j8U+W
	7F8VRASXznfUA0GWl41ZVA3t8EPfMLSKRoM4hsf7kGS0NBDQbmNSRJ4g
X-Gm-Gg: AYBFou3MA5AZoAhjAufgXwnExUdEs24OA/RVEII1/AJITyhaHyEySuCE5KXZkyVZrbS
	nwizk4fjICrxS0gIK5HH+lQJOwZiZFnMvGVM1+iXCqpXHcznmPZgdCYjs7gzhLiz2Wuk/zU9uGH
	G2ftaKNSe1XbsNNtSCmSSs4MH6mEUva4VUu6sd0i72Qga32Qj90IZn9JfiC8Gh7jY/5RlVEB1ej
	qkigKivcTBrSNKDRuLcOQMEA+80qRj8TyhAngdQxk5BNk4Rta5c2ZDx0NE5afg54j3L/LcwxMei
	sfxbZyqaNQDkaP8C+6zoXR8R2N6xqJa+8l+AqmcA1An4KzKEZl8XMdHZtfeaDob8Tzocd0ZsVGh
	f0Rvag5zYNw+SFoOEczpNiu/46iAh4kbEbPOi/WCLPbThgnDQRkkjuddjZRrmUadrlbDRHOKK4N
	iqO5DQ4uQo2iIX9yj3LLwhe6xf4j07esC5KHLf4hRY8s0bgwV/zzCOW1amOy7O/kEti8kZ33Sgy
	rN48gYgNdsTcZZBjaREsgQBR95R6ZBEQaoemdU+5CA0aI4sSiNZTkXibF1jAGkBXF6KIERoQr9F
	Ado0k+t1ntA7NNPljyD1V50tISfXki0=
X-Received: by 2002:a17:90b:4a50:b0:3a7:f4d:b23d with SMTP id 98e67ed59e1d1-3b166d30739mr2698856a91.52.1794316641976;
        Tue, 10 Nov 2026 05:17:21 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:21 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Frank Li <Frank.Li@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v4 28/33] dmaengine: sf-pdma: route error callbacks through channel BH
Date: Tue, 10 Nov 2026 05:13:28 -0800
Message-ID: <25d7826e0e6738356657f523e6f6cf3450e4b26c.1794315350.git.allen.lkml@gmail.com>
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

virt-dma now dispatches completion callbacks through per-channel BH work,
but SF-PDMA invokes the client callback directly from its error tasklet
after exhausting its retries. That descriptor is never actually
completed: it stays on the issued list and in chan->desc, the cookie is
never advanced, and the channel does not move on to the next transfer.

Complete the failed descriptor through virt-dma instead, mirroring what
the done tasklet does for a successful transfer: unlink it from the
issued list, mark it DMA_TRANS_ABORTED with the untransferred size as
residue, hand it to vchan_cookie_complete() so the client callback runs
from the channel BH, and start the next issued descriptor if there is
one. Reset the retry budget at the same point, as the done tasklet does
after a successful retry, so the next descriptor does not inherit an
exhausted retry count.

During removal, kill the producer tasklets before the channel BH so they
cannot enqueue callback work after it has been drained.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/sf-pdma/sf-pdma.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index ca60fb46ade0..992f9f103702 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -326,9 +326,21 @@ static void sf_pdma_errbh_tasklet(struct tasklet_struct *t)
 
 	spin_lock_irqsave(&chan->lock, flags);
 	if (chan->retries <= 0) {
-		/* fail to recover */
+		/* fail to recover: abort this descriptor and move on */
+		chan->retries = MAX_RETRY;
+		chan->xfer_err = false;
 		spin_unlock_irqrestore(&chan->lock, flags);
-		dmaengine_desc_get_callback_invoke(desc->async_tx, NULL);
+
+		spin_lock_irqsave(&chan->vchan.lock, flags);
+		list_del(&desc->vdesc.node);
+		desc->vdesc.tx_result.result = DMA_TRANS_ABORTED;
+		desc->vdesc.tx_result.residue = desc->xfer_size;
+		vchan_cookie_complete(&desc->vdesc);
+
+		chan->desc = sf_pdma_get_first_pending_desc(chan);
+		if (chan->desc)
+			sf_pdma_xfer_desc(chan);
+		spin_unlock_irqrestore(&chan->vchan.lock, flags);
 	} else {
 		/* retry */
 		chan->retries--;
@@ -601,9 +613,9 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
+		dmaengine_kill_bh(&ch->vchan.chan);
 	}
 
 	if (pdev->dev.of_node)
-- 
2.43.0

