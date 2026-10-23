Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792725307;
	b=gqbl4a+sDDRs3CFxrUPBwnbbZggYRCbCnN4f6Vu9FlncmqjbOLJuqU1bno3bDaTX6PvE
	 i9HWWTKUqMjtC7e6o3PQViZB1NOnIaj+jgrHCUeEhstWDfMSzndLsm87w09npL43yvLhT
	 jZXt8qEfPkug3FW4b7pFjiFCWbiNRdn1RYjs3by0dNMpn0x2HZr2AxiUSL5s9QKhECSmH
	 GsXDTGXoZjJsgVPY6ttxX9dD1HhnyopeI3Eo0VFUfovtDvmxoGmvTsBEGMVMK6DC5YslR
	 oNvnelrBV1NPbd33gSWLqSIAWXIFbU8Ukg4k/5F29AiKWCiW1ro7tEd2bjOMFq2XzXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792725307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
	b=B/V144bUykCjZhznufpIIoSSa1UZGxwWtOYpaIf75Ws/Pm7bsHKcOmAOpoZe1r9JqJPO
	 yzDSkkbt4D0jUqhXBx9HAzkv50HbTUKiGCV+BbO6cVQO+0qx993O5In2/oE93lyZHcM2P
	 2/lUBeMtpYrAKh1DyDn/xaYfYNQ14IwR/BMze9GKTmtoS/7vPpveZIdb1vPT1r5Vom5IJ
	 MzUkCaZxVDmkiMP6wPE6waS6mtBOIXrXa5qQFWXc8SaE7+aKnhL3lzGVQECWqp5HQxBk0
	 2+B7tFwW7J+XopMdlC2pSdk/IGDxohXbkAdZqDPMNzmYX5zxyBAZwXdQK93ys8o9ycQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VPOF8c3u;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452B606A331
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8452B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VPOF8c3u
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-8490a7d6696so224984a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792725306; x=1793330106; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=VPOF8c3uG/vsbusufMKR/t8KqgMk8CFRuyCz01PDthlpk482ax5edQeaoE0j0XqJdj
         AIPWO7Kows4IDIa2LKREkCgFw7/0gX8c+FyFJb1n+41EBFce/4jJ97mqz6qW8+xOAWCE
         DV5dK+ncEB0N9dDx35nkLDTXLGBT9MsO7owpv+NtzvmLEA006rYOUC484KTWJcmxnOTz
         T32aJJID3e9xSFuyXq0fD70ZpbRMMQuuUKJjv11lh0+lxDwvIhQAy+E8Wml4YwoBOOAV
         l41DzfCPAfsVUuFBsb/dBTiZLuxOTF0AeN2fs2+DKeMfVUgAnPDl4en580rqsZSRLbGI
         aI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792725306; x=1793330106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CYdgjPfv0+4Wy+FKCquHpiCKWW+PI9qvviL25EIL1ZY=;
        b=ojn7iP/tZGZIvS9y8jdUu/tjt2DgXy3nBnr0Xtgl8xhwVFWblRF+X/d88ZAkKtBiJx
         JJ7RK6nB24VqtCYWFKsBRgg16zW77mRsXD+pt/4+vDfgNzS3c4+Ya8Ijjtx4yIsl6WSB
         Io1PHTq1z6MKgXyxqjeEuQxkBVok6G22aYUrJHerKaW+OQZQEfcizR/550+7wnGzIoxe
         jNKyMxCKpu7xP53ixqbnv5xZlXv5bSGolTsizz19X9BxvA2OnIRPIQDb5aPsxufqPFKS
         MIjZLD4DMU5RwL0kWuUZDHa74o8kwX4jEMUrzpbLbktjj7FbzDC3E4w+FKXjosRMwKTB
         j5yw==
X-Forwarded-Encrypted: i=1; AKwUvBywxHhh0gmri94Y/ZLIUJ9Pk7szdEQ/DBa3YCqddrIjlddXobeB1Z8TKSDJp4GoyR8ftMRn4n7X53TISnc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKQJlwaFw5qEVp65P5RHrUwQ66DDeQSwHappuQvRsLPacc2f07i
	4yhxaU8iOHl/Ur5ONL8D6W5ScLprzaH2JfzH+l4EYPpMNcQ63+eaFxbU
X-Gm-Gg: AYBFou19n9LjTE0cn1/6U4XqNAo+EVkXKcXCalA+dfq6RTDpWveO/bFxpx/hDpsHyY6
	Ewnm5cfOWVEMDsW7MlbKmmFRRCHaKynCDTxReGQKZ/GrtaAtR6rIap7CQDsvcFOdgc5MlhkCH02
	3E0YbsD8WyN/PXv7b6yvg0XPn7tzauhn5hVxiSnUGGzQoj9if520mAYUzpj1Akd19J5jp31TU/l
	lnd718PakLwi1eKLe6rl+t3BjmEmiy2W72yUFJNFjkExn6/sJrGrxryiQiDNVAwzEiqIyF2iplP
	QTzjc9Uf7M/mP8wUjCgNsfUFN2AQwdVizJFqeDzbkPugLnXQMnPQQX7FRROLLCkGjTmViRtSfnr
	zBZz6DDdueMfWY0yyfihPjUKWQakXUkHrtIbhl8DXNXH5siTfLXEd5ALiSRFebzbMOtpZwEbOdC
	btczRc0blHGvTTnoZObi63Sa3ikswGjuAdmjn3thRa7j5ERzg1uuvQWFhVBLjPD92EsDdHCU6lv
	Y7KD1K8xitLA5UCQ2WgSmQBfJtNLWqcGiR7OJdfwVarTPdnHqJIm8s7wRBER5TkwUODXWtihqGc
	vY6luPsBXoSSi0FzgqvRwL2/3cfBBlntLwDaZXwzmk6EjBL3nv8zUWwDrg9+IQwcqw6uLYAiu/1
	avP4oRVl6mIbnSiY1S+kk32FAqxH2SRvSWFAErS12gSZCNJ4YDwEON6rFZdmRdJTOYZGtITQiw9
	+g+rA7
X-Received: by 2002:a05:6830:640c:b0:829:2866:3106 with SMTP id 46e09a7af769-84fb2712b6cmr633959a34.21.1792725306519;
        Thu, 22 Oct 2026 20:15:06 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-84fbda584d9sm938638a34.13.2026.10.22.20.15.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:15:05 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 22 Oct 2026 21:14:57 -0600
Subject: [PATCH 6/6] dmaengine: sun6i: keep cyclic state with the prepared
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
Message-Id: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-6-01085f684c9f@gmail.com>
References: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
In-Reply-To: <20261022-submit-sun6i-dma-lifetime-next-v1-v1-0-01085f684c9f@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Arnd Bergmann <arnd@arndb.de>, 
 Maxime Ripard <mripard@kernel.org>, Jens Kuske <jenskuske@gmail.com>, 
 Jean-Francois Moine <moinejf@free.fr>
Cc: Hongling Zeng <zenghongling@kylinos.cn>, 
 Chengfeng Ye <cyeaa@connect.ust.hk>, 
 Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, 
 dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

Preparing a cyclic transfer sets vchan->cyclic before the descriptor is
submitted. A finite transfer on that channel can then select package
interrupts and take the cyclic callback path instead of completing its
cookie. Merely preparing an unrelated future transfer must not change
the active transfer or the meaning of queued descriptors.

Store the flag in sun6i_desc and consult the active descriptor when
selecting interrupts, completing a transfer and terminating it. Finite
descriptors retain their zero-initialized flag. This also makes callback
retirement depend on the descriptor whose lifetime is being ended.

The shared state was identified during the H616 cyclic UART RX review.

Fixes: a90e173f3faf ("dmaengine: sun6i: Add cyclic capability")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/sun6i-dma.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f807d9386939..5fac3a991314 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -191,6 +191,7 @@ struct sun6i_desc {
 	struct virt_dma_desc	vd;
 	dma_addr_t		p_lli;
 	struct sun6i_dma_lli	*v_lli;
+	bool			cyclic;
 };
 
 struct sun6i_pchan {
@@ -208,7 +209,6 @@ struct sun6i_vchan {
 	struct sun6i_pchan	*phy;
 	u8			port;
 	u8			irq_type;
-	bool			cyclic;
 	bool			paused;
 };
 
@@ -509,7 +509,7 @@ static int sun6i_dma_start_desc(struct sun6i_vchan *vchan)
 			     (DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
 			     (irq_offset * DMA_IRQ_CHAN_WIDTH));
 
-	vchan->irq_type = vchan->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
+	vchan->irq_type = pchan->desc->cyclic ? DMA_IRQ_PKG : DMA_IRQ_QUEUE;
 
 	irq_val = sun6i_read_irq_en(sdev, irq_reg);
 	irq_val &= ~((DMA_IRQ_HALF | DMA_IRQ_PKG | DMA_IRQ_QUEUE) <<
@@ -606,7 +606,7 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 			vchan = pchan->vchan;
 			if (vchan && (status & vchan->irq_type)) {
 				spin_lock(&vchan->vc.lock);
-				if (vchan->cyclic) {
+				if (pchan->desc->cyclic) {
 					vchan_cyclic_callback(&pchan->desc->vd);
 				} else {
 					vchan_cookie_complete(&pchan->desc->vd);
@@ -906,7 +906,7 @@ static struct dma_async_tx_descriptor *sun6i_dma_prep_dma_cyclic(
 
 	prev->p_lli_next = txd->p_lli;		/* cyclic list */
 
-	vchan->cyclic = true;
+	txd->cyclic = true;
 
 	return vchan_tx_prep(&vchan->vc, &txd->vd, flags);
 
@@ -995,13 +995,12 @@ static int sun6i_dma_terminate_all(struct dma_chan *chan)
 		struct virt_dma_desc *vd = &pchan->desc->vd;
 
 		/* A cyclic callback may still hold this descriptor outside vc.lock. */
-		if (vchan->cyclic)
+		if (pchan->desc->cyclic)
 			vchan_terminate_vdesc(vd);
 		else
 			list_add_tail(&vd->node, &head);
 	}
 
-	vchan->cyclic = false;
 	vchan->paused = false;
 	/* Leave terminated cyclic descriptors for the sleepable synchronize. */
 	list_splice_tail_init(&vchan->vc.desc_allocated, &head);

-- 
2.53.0

