Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 012343921CD
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788076691; cv=none; b=YoY2jRTtf/bEFLQFgWj1FfSJ8/PF0a44oziBTzWF/0V+tEBsVM5VM7qrRnOee6VLcSEtUBB9EFFx5WfzNB+jFyyMxtfXlVdG2IcGXQ8du9VUOs5oBP4PWZ3yijsO9L88D2RLshCxzo9pab/vDEBFMz+Md29QCKZ43CKAu1kgSQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788076691; c=relaxed/simple;
	bh=QPzvEd+OiJWLrw1OvP16PqVcJmY7BMYLmGhlwyLx5kw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCqP7Yc0VCRwv8DDJNDDz6FMWHAdEce3QXED+Nwa1RPS6lQS7mi0P8YrgQT88d0PoM1x5ybDXtlsQcqYh1VHRHMiI6Vvko557dVwlXcQnOuvHb61sMj0ovTocU33Sv1s7nlFTXqDcrdqRQqeWAh551b7GUdaatvnSJvgemTKWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D67UlqSP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D67UlqSP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so23284105e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788076677; x=1788681477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q7KBSEmc46+2bR21q/TsshXTy+Zk9y7NLL/izGkQXcU=;
        b=D67UlqSPDGckdO5W/I36gA8D5OaYNu1cBIezAazZA/hLF1qf23AhN8roYqnULoOkJg
         zGcuZm6dw+wpWRhPbnedOhkdbh+xAdoT8jeKA7Dt0JUnjIqzHviJbEhRVtuFbUih0p9G
         KEcN+EfvXB9JFVkxv0D0pZ4zLOMD1pPe1eURblnueJndMAnRhwFc2UOWHoU4iIlS/1Yx
         4tNi+mjy0SHDqbku6cue4OMfh4NFm57h4u7kCapBHYrVVLZix8Y+qxXG5pqeL64hSDNl
         LtOMwyDXKUM7v35dzNx+I7WnAjd4rDiC6yH34XanbxBuPs7XU80EcbbKKChzK/a63tFs
         HvRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788076677; x=1788681477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q7KBSEmc46+2bR21q/TsshXTy+Zk9y7NLL/izGkQXcU=;
        b=lUYyZV6hN3I13YhI1qZJXU/kAXgvG91h9Yq4vMIVXIICDy98Mzqow/RWuIA3P8KVrZ
         kSNhiAAc865bFq8zc7U6FwY7gcKH3amjnEbY0Rc4oCzSaE8qU2Y0hJrvFvTCQzWKtGPA
         /eIUtlWUoPsCY0OoQrALXQIIOBh0kaIUVl5A53gRmu4YTAgyd1ezHDQhHcH3wmObt/nQ
         Yxtyav01QOJBQk2rJB8elJEDYm2qddHQ+YVCqRIq/iAWOvpeERJAH4JwGkdX96HAIoYK
         6AhDJ0AM2WLHwcpRV4u6Bh1H5/It+ufZN4v6sfbSe/WfTA5QfelP/N0glMgsbnakO7ZL
         qWiw==
X-Forwarded-Encrypted: i=1; AHgh+RpE+Gzkl1aesRSnO59ZO9wCICWVogND1sVa1SIkitb4om/llK8naJVfyO+2ryZG3c+vxBppH1tEGc+3cl4=@vger.kernel.org
X-Gm-Message-State: AFuF++nmclSG4mppeJmUlVTPayona3s1I6X9CxX91S1fm3wtkcnN7Zm4
	xiPyjl94Lsk+gUDXyTN+4CvEZ8lEc4/ngABu20kFjBrPxKcWJ76u51g=
X-Gm-Gg: AR+sD10yM6y0siFi3HgJxfrC8YWNXj1SRVm7VATIQTmdbNqMOuJxheu17JnVLHG42em
	zmSMZl/RcMJAL3pDhIxV1GtawOoD9zCB5Kaukzs7ze7h5oz17dDoyrgUx7ZQyevXIUmZ8RaVGJn
	23IlK0WJHyC0HzpQqnF+xr0bmOmDcxa81sEx9GcoQzxFhrds5jK44XYZ2jI8vXiau1JxahGMb5r
	Pt88jPohM4wQOeLZbWmFQkWr/PB7xUscVM/HD/6u9FSQDKJsN38KH0Ay5rrdQNQOlLJsOVjS/4M
	5WMzDf3gOn8kqzF+Yzd3/xzutZ6G/5DgcDNWfMOAWqQogEyGzdsPISrKmUxFjHOI4j/G1358Uwz
	GFkr1jcUf+aW/FszfYskqijQ+flTyjZUhje+STne1HQT4PK4jbvYAs6/e7myXOLBYaHSY8veAKp
	aM/zh5sDXHagaLi1kspC4s1QaZqJPhxlwO9jV9UrUtyGhn7E8Qc6M=
X-Received: by 2002:a05:600c:81ca:b0:49b:47b3:d6d with SMTP id 5b1f17b1804b1-49b91c3b7c4mr283650335e9.10.1788076676788;
        Sun, 30 Aug 2026 00:57:56 -0700 (PDT)
Received: from fedora ([46.8.219.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm14757875e9.13.2026.08.30.00.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:57:56 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net 1/4] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Sun, 30 Aug 2026 10:57:14 +0100
Message-ID: <20260830095717.37218-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260830095717.37218-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The QDMA hardware raises a dedicated interrupt (NO_CPU_DSCP, one bit
per ring in QDMA_CSR_INT_ENABLE2/3) when an RX ring runs out of free
CPU descriptors. airoha_qdma_hw_init() already unmasks this interrupt
for every ring (INT_RX1_MASK()/INT_RX2_MASK() OR it together with the
RX_DONE bits before writing the enable register), but
airoha_irq_handler() only ever extracts the RX_DONE bits from the same
status word - the NO_CPU_DSCP bits are read and acknowledged (cleared)
along with everything else at the top of the handler, then silently
dropped.

This matters because once a ring is genuinely drained to zero posted
descriptors, no further RX_DONE interrupt can fire for it: hardware
has nothing left to receive a frame into, so NAPI is never rescheduled
and airoha_qdma_fill_rx_queue() (which reposts descriptors) is never
called again. The ring is stuck until the interface is brought down
and back up.

This is most visible on rings that carry low, bursty volumes of
protocol control traffic, in particular RX ring 4, to which
airoha_fe_vip_setup() force-routes ~15 unrelated VIP-classified
protocols (BOOTP, PPPoE Discovery, ISAKMP, DHCPv6, SIP, LLDP, PPP
LCP/IPCP/CHAP/PAP/IPv6CP, ...) via PATN_FCPU_EN_MASK, all sharing the
same RX_DSCP_NUM() default of 16 descriptors. A short burst on that
ring (e.g. a DHCP lease renewal exchange, or the LCP/IPCP/CHAP/PAP
negotiation that follows a PPPoE PADO) can drain it faster than the
CPU reposts descriptors, after which every one of those protocols
silently stops being received on that device until it is reconfigured
- with no error, warning, or netdev/ethtool counter indicating why.

Fix airoha_irq_handler() to treat NO_CPU_DSCP the same as RX_DONE for
the purpose of scheduling NAPI: airoha_qdma_rx_process() already calls
airoha_qdma_fill_rx_queue() unconditionally at the end of every poll,
even when zero descriptors were reaped, so scheduling NAPI in response
to NO_CPU_DSCP is sufficient to make an emptied ring recover on its
own. airoha_qdma_rx_napi_poll() is updated to re-enable the
NO_CPU_DSCP bit alongside RX_DONE when napi_complete() runs, mirroring
the existing disable/enable dance so the interrupt isn't left masked
after its first use.

One open question worth flagging explicitly: if the underlying
no-free-descriptor condition re-latches this bit immediately after the
ack write (rather than only on the next empty->non-empty transition),
a ring that airoha_qdma_fill_rx_queue() genuinely cannot repost into
(e.g. page_pool_dev_alloc_frag() returning NULL under memory pressure)
would turn this into a self-reasserting interrupt storm on the hard
IRQ path: mask -> napi_schedule() -> poll reaps 0, refills 0 ->
napi_complete() -> unmask -> NO_CPU_DSCP fires again immediately. I
don't have documentation confirming which behavior this bit actually
has. Regardless of the answer, masking NO_CPU_DSCP until a refill
actually succeeds - the natural-looking alternative - is worse: a
fully memory-starved ring can never fire RX_DONE either (nothing was
posted for hw to complete), so that would leave it permanently dead
once the memory pressure clears rather than self-healing. A bounded
storm tied to genuine memory pressure, if that's what this is, seems
preferable to a ring with no way back either way.

Fixes: 23290c7bc190 ("net: airoha: Introduce Airoha NPU support")
Link: https://github.com/openwrt/openwrt/issues/24715
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 28 +++++++++++++++++++-----
 1 file changed, 23 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64619e9a704d..a3e5aaeb75b3 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -784,13 +784,15 @@ static int airoha_qdma_rx_napi_poll(struct napi_struct *napi, int budget)
 		int i, qid = q - &qdma->q_rx[0];
 		int intr_reg = qid < RX_DONE_HIGH_OFFSET ? QDMA_INT_REG_IDX1
 							 : QDMA_INT_REG_IDX2;
+		u32 bit = qid % RX_DONE_HIGH_OFFSET;
 
 		for (i = 0; i < ARRAY_SIZE(qdma->irq_banks); i++) {
 			if (!(BIT(qid) & RX_IRQ_BANK_PIN_MASK(i)))
 				continue;
 
 			airoha_qdma_irq_enable(&qdma->irq_banks[i], intr_reg,
-					       BIT(qid % RX_DONE_HIGH_OFFSET));
+					       BIT(bit) |
+					       BIT(bit + RX_NO_CPU_DSCP_LOW_OFFSET));
 		}
 	}
 
@@ -1468,16 +1470,32 @@ static irqreturn_t airoha_irq_handler(int irq, void *dev_instance)
 	if (!test_bit(DEV_STATE_INITIALIZED, &qdma->eth->state))
 		return IRQ_NONE;
 
-	rx_intr1 = intr[1] & RX_DONE_LOW_INT_MASK;
+	/* A ring can also raise NO_CPU_DSCP when it runs out of free RX
+	 * descriptors (e.g. a burst of VIP-classified control traffic
+	 * forced onto a small ring). Once a ring is fully drained no more
+	 * RX_DONE interrupts can fire for it, since there are no free
+	 * descriptors left for hardware to receive into, so without this
+	 * NAPI is never rescheduled and the ring never gets refilled again.
+	 * Treat NO_CPU_DSCP the same as RX_DONE for scheduling NAPI:
+	 * airoha_qdma_rx_process() unconditionally calls
+	 * airoha_qdma_fill_rx_queue() at the end of every poll, even when
+	 * zero descriptors were reaped, so this alone is enough to recover
+	 * the ring.
+	 */
+	rx_intr1 = intr[1] & (RX_DONE_LOW_INT_MASK | RX_NO_CPU_DSCP_LOW_INT_MASK);
 	if (rx_intr1) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX1, rx_intr1);
-		rx_intr_mask |= rx_intr1;
+		rx_intr_mask |= (rx_intr1 & RX_DONE_LOW_INT_MASK) |
+				((rx_intr1 & RX_NO_CPU_DSCP_LOW_INT_MASK) >>
+				 RX_NO_CPU_DSCP_LOW_OFFSET);
 	}
 
-	rx_intr2 = intr[2] & RX_DONE_HIGH_INT_MASK;
+	rx_intr2 = intr[2] & (RX_DONE_HIGH_INT_MASK | RX_NO_CPU_DSCP_HIGH_INT_MASK);
 	if (rx_intr2) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX2, rx_intr2);
-		rx_intr_mask |= (rx_intr2 << 16);
+		rx_intr_mask |= ((rx_intr2 & RX_DONE_HIGH_INT_MASK) |
+				 ((rx_intr2 & RX_NO_CPU_DSCP_HIGH_INT_MASK) >>
+				  RX_NO_CPU_DSCP_LOW_OFFSET)) << 16;
 	}
 
 	for (i = 0; rx_intr_mask && i < ARRAY_SIZE(qdma->q_rx); i++) {
-- 
2.55.0

