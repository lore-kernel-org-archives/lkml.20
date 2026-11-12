Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794471785;
	b=GKBed3hAnKahE/pRMFu84bHOUTmjNyh0VMxrVJBle+hXGBC9aFQJUQM1HQ5YtkLC1aNv
	 KRoWd2BHVc0zUpzsbrCuoikQgkC8r3xiyeo4DAMaPjecL+EBfdXgtfh555MJWgMCnrba2
	 XOs8of2diJ1uZIXZ+kB/ljDNn1nOHNhAfQqG2MwM50AgkCWt4itoPD8m0B0yY/elZpS8D
	 KK4JmX0yoTvjvweN8JRhCw5H6mkd8KJyaabou2RonXCCDFvmbi7nUoPsMCodAa2XeogO0
	 rnqTM3P3gxcHAhw8aJjC2EoCIMC4lRJlcoQUXRzAl+v9SVDTx8EAK2lwAVdNh5ODkDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794471785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
	b=2J7cQv3Lddq+/zTeUd6FJ4E89/TYdCUmUIQT3WoneUYDFFUMCv+loCZSI8G6GI0NUbhA
	 tEFClqx7qodRS4ZYO7VdEmFAnazIhZdEcvwSDtQgKwMcXuYH6YAoRDfvqjuUsWX3EpEXl
	 +Gf1Jliswaj+7HjzYwKqt09j07CvjMlJjqA1auqaW+DebAHI5ETLzN1NEuJgYqE4TUSJX
	 Xi+OcQJt9ZPmQiBXyl1dKySwtrDp/kFdcZvht9GdPnpFkD3A4s9UlTbHH9PDD8pWfHAhj
	 z+2uxe0PqaJs307kfPCBCfMHnmYJgZ/JZTyByu3wOqlnhxHnJ5nQvA7diUmwB/BwB5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJYeJzA1;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75DE606A883
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:23:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C75DE606A883
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OJYeJzA1
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-499f20c7054so1945542fac.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 00:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794471784; x=1795076584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=OJYeJzA1bPu9N5OdOgPqFCAMx9AewTZLtz/IuI2ooVcSSifmQdSaHg5jVZTKwwtnmN
         e68BqCRgWN9EWb3JRSJE/QIsbDOHRlOf0pNjM/bkwin/MBBSZJ/EBXiK0KHAznP5x20O
         Mc2tpeXls9/9L/5ZZ6qos2ooWFX5PQN2BrR7E5Pa/okDKP7sJyy95EzqssLS8J77fin4
         y0Iww423Tv9ZHPEJNR4Rped9BMs8KKxM5ajtEg6JdL/ssmp6+qq3TCtrCSwe4MCxgQ+y
         13e72Jb+cHBmY3gvgDuF0X3K3VM/6QwTUfp3gtjrwJpcf37lgdKsZKnK3kmG4f3YHlQX
         vBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794471784; x=1795076584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8RGDeXbdt83hUd3Brk6p8Eodv6wi4lD1lBh2U2cXcg4=;
        b=t3HOOJwFOBBKv+p3xVwBNpzyCcNcTtGRaKwv3cvdvZdMJ/zG5ZD3i7cr56Lmm+JhpW
         ny9L4q4FcGcp7Z7HhMPZc9EilrXo5KvBc18uIvbVyU29G517CzU8BPzGKLpwDy6LcF5v
         SWWrwBC33TvUr5DvHjx5DzB+2b+9pmLLqsWET87w/lJHXqR5kovIn9V84uXdBRsMQgoQ
         d/XPU+TvQaaRAiP4Xzr8lDx+iun5WrFB2Y395+PsFX+k9w3vag6hp/VRBa77hRYKhSe7
         82fRvCcSaOSH07drg4BEcjV4MQTh5714CH0+yYo4OiBwR37RDbhbFFcocdsYMgJ8bwv/
         5Fpw==
X-Forwarded-Encrypted: i=1; AL+hErE59vnYLKHiKpL0/T607LauWL7vvp64J5I6f4bVPeayLE5kYs1rK6xWPO0XCTGIdrvY9VzD1q2KvRgoN/U=@vger.kernel.org
X-Gm-Message-State: APuU4Z8ieI261abQ1TGjX1aMEANMuNSQriljkGBFYZY7dghMTtt/b9wH
	E3IoAq0w9j54wY2zzHIss3nee+p9HwMK+2fPpxPLjOHrvZhJfINqzK0P
X-Gm-Gg: AYBFou0xW8QRQcZTo16y+QD+YXI/JtNlZYfg5kNkaGSNGzOjFk9yJyzbaeDB4NzfPpG
	BHXXxTKO18ygSrqT9palhefHld5fI0YWYxIA/j6FJtPoBqQxbymPErv1xUPAgTA3ozWzeDBjUEw
	YhcNa+XqlwFIS4L4ApAeVqEuF5b0nuwnY7eOSCO69uUFn+t9XeU9nGgcmncrW0lsn7Yn+TompXU
	gDMJCGZmognMxEMQ65MHlRFLxD82b+I9tow0WmCp7vev8uxmdbiJEUcmKPKt0C3NNiR3nWbuaWY
	CnfiMnKJStN20supEss/WQScQ/wmKqI9p4dt+J78ttw6XEJU+MHlebzliDHNTr/Mf3gOkJMLikG
	jj820dLT1oKXDMuM4lPmISydtovn1sXze1QeJhE3c5VnitiRLiWqjhflRwp8o0U4m6+knSd/M5o
	nt9pFVReAxemZr92jOdYmHo6+X6/1vBAIhllaVr99YpxaesGQAU+kAd/d0HMl410S3hRiDdKEpn
	5Q76kEmTa8FoxHhmkiwCh6fDuo7h0J4O2+Ij+yEqaUBoCGs8QMpCFre7U0AoBStHtp1T0iYU4oH
	xnod3ooIu8sc3kvp3CgF7Cc0MLoX6Jlwb6j3bvsf3pXmjdaiMJjjvR2zLk35bpuLVWldP2DDyT5
	xWTQsfJiVHnqHLrMfjZRQ2rglsiNYoPU/YMS8H8mv79GQDHswGCg5k5Qa1YUDEevG0wfHBPsKLt
	NdbOAaa/3S+RRx5ouM9hCICovMx+vG4T7LajotjGxBX0fm188gsRQ=
X-Received: by 2002:a05:6808:10ce:b0:4c3:ebb:63d6 with SMTP id 5614622812f47-56b97503626mr4350951b6e.39.1794471783661;
        Thu, 12 Nov 2026 00:23:03 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905d3bab2sm7411157b6e.12.2026.11.12.00.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 00:23:03 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 12 Nov 2026 01:22:50 -0700
Subject: [PATCH v4 1/5] dmaengine: dw-axi-dmac: keep cyclic mode in the
 descriptor
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-1-3ebc24b243db@gmail.com>
References: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
In-Reply-To: <20261112-submit-dw-axi-dma-stop-pause-v1-v4-0-3ebc24b243db@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Sergey Khimich <serghox@gmail.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Sia Jee Heng <jee.heng.sia@intel.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2

dw_axi_dma_chan_prep_cyclic() sets chan->cyclic before allocating all the
hardware descriptors and leaves it set when preparation fails. The flag
also survives cyclic transfer errors and channel resource release. A
subsequent noncyclic transfer then takes the cyclic completion path,
leaving its cookie incomplete and its descriptor on the issued list.
Its zero period_len can also cause a division by zero.

Resetting the flag on failure or channel allocation is not sufficient:
preparing cyclic work while an ordinary transfer is active changes how
that transfer's completion interrupt is handled.

Store the mode in each descriptor and use the completed descriptor's
mode in the interrupt handler. Cyclic preparation sets only its own
descriptor's flag, while the zero-initialized noncyclic descriptors keep
it clear. Error recovery and channel reuse then use the next descriptor's
mode without relying on channel-wide cleanup.

Fixes: 1deb96c0fa58 ("dmaegine: dw-axi-dmac: Support device_prep_dma_cyclic()")
Closes: https://lore.kernel.org/r/sashiko-outbox-208213@kernel.org/
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c | 35 ++++++++++++--------------
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h          |  2 +-
 2 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index 7520c78f55cc..6dae63024721 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -801,7 +801,7 @@ dw_axi_dma_chan_prep_cyclic(struct dma_chan *dchan, dma_addr_t dma_addr,
 
 	chan->direction = direction;
 	desc->chan = chan;
-	chan->cyclic = true;
+	desc->cyclic = true;
 	desc->length = 0;
 	desc->period_len = period_len;
 
@@ -1117,25 +1117,23 @@ static void axi_chan_block_xfer_complete(struct axi_dma_chan *chan)
 		goto out;
 	}
 
-	if (chan->cyclic) {
-		desc = vd_to_axi_desc(vd);
-		if (desc) {
-			llp = lo_hi_readq(chan->chan_regs + CH_LLP);
-			for (i = 0; i < count; i++) {
-				hw_desc = &desc->hw_desc[i];
-				if (hw_desc->llp == llp) {
-					axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
-					hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
-					desc->completed_blocks = i;
-
-					if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
-						vchan_cyclic_callback(vd);
-					break;
-				}
+	desc = vd_to_axi_desc(vd);
+	if (desc->cyclic) {
+		llp = lo_hi_readq(chan->chan_regs + CH_LLP);
+		for (i = 0; i < count; i++) {
+			hw_desc = &desc->hw_desc[i];
+			if (hw_desc->llp == llp) {
+				axi_chan_irq_clear(chan, hw_desc->lli->status_lo);
+				hw_desc->lli->ctl_hi |= cpu_to_le32(CH_CTL_H_LLI_VALID);
+				desc->completed_blocks = i;
+
+				if (((hw_desc->len * (i + 1)) % desc->period_len) == 0)
+					vchan_cyclic_callback(vd);
+				break;
 			}
-
-			axi_chan_enable(chan);
 		}
+
+		axi_chan_enable(chan);
 	} else {
 		/* Remove the completed descriptor from issued list before completing */
 		list_del(&vd->node);
@@ -1204,7 +1202,6 @@ static int dma_chan_terminate_all(struct dma_chan *dchan)
 
 	vchan_get_all_descriptors(&chan->vc, &head);
 
-	chan->cyclic = false;
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 
 	vchan_dma_desc_free_list(&chan->vc, &head);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
index d8dd07efe60f..3c86e5d468ea 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac.h
@@ -50,7 +50,6 @@ struct axi_dma_chan {
 	struct axi_dma_desc		*desc;
 	struct dma_slave_config		config;
 	enum dma_transfer_direction	direction;
-	bool				cyclic;
 	/* these other elements are all protected by vc.lock */
 	bool				is_paused;
 };
@@ -105,6 +104,7 @@ struct axi_dma_desc {
 	u32				length;
 	u32				period_len;
 	u32				nr_hw_descs;
+	bool				cyclic;
 };
 
 struct axi_dma_chan_config {

-- 
2.53.0

