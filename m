Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677A5480DE9
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 16:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280417; cv=none; b=WoOB1kQLGhWaHaq1vPLQWNQy9ndOdBqaOkpm8YB+Y5758nF2m2CI4XLpkyakr+Eo+g8ZERoAAGQD9rQRkrYXDnwr3tw7VX+qVWjt4Vyxc1TecgUJ1o7h/wWaap+jVA/NVJCsg4kdFCCotk9udqqJZDUVVJ7vWNSbcWL7cGaMK9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280417; c=relaxed/simple;
	bh=ckWizvcSwZhlI6rKng/yD9FrZW5unymXwuDsJRPA9Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VuI1MIZ4RbrOT/240IFIxbHCxcVGvpb4+WzjrE2fZbxjaD+YiQBOhMg8Am4tt+9lLlRaIi123sMf88GWOZAurR5PJwdv05Zdid2A9o/wwOXq31b8jdRhZsxKN++SdlQo7wkT4+JbhwnStbGjjdsc99Ksq7beLr6IYqUyiy3RhHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzDO6CGt; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzDO6CGt"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-39c74c469e8so298811fa.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 09:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280413; x=1788885213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=SzDO6CGtm6sO9n38ZJUTexwllFyYxnWnAri9Urk/8URoOoaZtNBxp6r36zeOXJfyHz
         HDHJ9N459Gd66A8B35LWH6cA1sYrar92wYUjYdBnrbc9xdTFDB3q6uUNSwKwONKOYmlf
         HzwW5EyiyME3NAPc6cmgkFC01d+H+UJK/WNE7X3qB+n+b5ge897gQ/QtuGcSyDNkh17C
         k/DVr5GfoHkejAmcXEOhYJqo/6r3REJ2njS0qzYXBmg4faHR99iC2wHk6+HlgMr2HbPN
         aOJnlAhyNrSHVCCM/vcftkddKA+6eVp0KDVRUvtjZPz0QbcM+f0g3f+k8tsPlQb9iT1f
         cdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280413; x=1788885213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=swaavN3jWxYUB2FgajWYnBFsquVqHudkU68cpvO/LEJn9aDjatfWFzB7t1LOWzvUsj
         hKer9ArpWfUQ6r64nyO50XgzCMzOd3Yw5LxnBadow/K5NUiQe/oGRvXf/fzERPe4wCM8
         RheAOoAY/iWmFaPtmWMH8GRo9uLr63N3Q7zoqXsopyhNIlQhylUDJh6HkSKwNs2EdleU
         qh5YsWogYyruW3Qv048Oy6qhOjgWou7fjGZMugj0C4+albrmMLoeyetwLe7u4NgDfZPh
         SnhiKPQdw1CF8Hx55432snIfmCp6hFVStP4EJqj2GRXRtb6VIkNaXH60jw/UmvCUDfEI
         iexg==
X-Forwarded-Encrypted: i=1; AKwUvByDxTP1rmrb85qlV1t5WQQ9GWEjGWdtn0QFzKh74cQICUtwG02bnDIKLh4Ubb6V1CJm24m78wQi5Ujnzyc=@vger.kernel.org
X-Gm-Message-State: AFuF++lbwORm72fyTAw3YhSVvgcJb5e737md2z8oGV6OHIcQUBfbyM1S
	ANOI9TBn1ngqa4GPLLgnUiaVAg/+nVDswyzRNCER/f5ysOpGnaP0S9g=
X-Gm-Gg: AYBFou2uvqG065wy1hYZksbt2CQTzURJ1vWhZFj1YzoJk7NzwrAZoNhgp6Z55lOuMbG
	xrnNhg2DvU2hFAkKW2h9qIb7lL5JpH4dU22zureKsNeqzwuCtz1wGS8AiDZjdxW5MMU5I/QM+Rb
	9VBb+NYu681/ifAs/NCR3eEgo59KN36/kPzMYBoW4il39pm8YsMEEWqqji0X4h5GzZkX6+1akdq
	l57s2ba8ZjzbjDhaxFLD2aDaLaXzuwlJ2pBxNqkkTmbbSElMmvQcrDG1nVKzjJ7mpMbuzxIb8i3
	UCQYSAZK6S/qRhlm9ewHUA4afevXCpags98Xl5WKU/AclpmzV9HFHrwQyTnmAfxmL0M+QywaV/O
	bEvnCPM6mzGunW7Oi//BUTQwDhSgYR3YnGIBcGdpt4alsvR5wlyaP9O3yPB4b7XbZeOe4l4SHtk
	1oRqoUxK2PaHY2al8psnltxXfZ+GkgwChHEGDK9XWW5y0y+dE29nq1
X-Received: by 2002:a05:651c:41d8:b0:39d:b5b9:f0f4 with SMTP id 38308e7fff4ca-3a301abb820mr82093501fa.10.1788280412821;
        Tue, 01 Sep 2026 09:33:32 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8ed967sm678251fa.7.2026.09.01.09.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:33:32 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v3 1/2] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Tue,  1 Sep 2026 19:32:53 +0100
Message-ID: <17f1beec505b87a4acf16557386a978c98f94b97.1788286284.git.sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788286284.git.sochnev.v.74@gmail.com>
References: <20260831234701.206021-1-sochnev.v.74@gmail.com> <cover.1788286284.git.sochnev.v.74@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

airoha_qdma_hw_init() unmasks the per-ring NO_CPU_DSCP interrupt, which
fires when an RX ring runs out of free CPU descriptors, but
airoha_irq_handler() only extracts the RX_DONE bits from the same status
word. The NO_CPU_DSCP bits are acknowledged and dropped.

Once a ring is drained to zero posted descriptors no further RX_DONE can
fire for it - nothing is left for hw to receive into - so NAPI is never
rescheduled, airoha_qdma_fill_rx_queue() is never called again, and the
ring stays dead until the interface is reconfigured.

This is reachable on RX ring 4, which airoha_fe_vip_setup() force-routes
~15 VIP-classified protocols onto (BOOTP, PPPoE Discovery, ISAKMP,
DHCPv6, SIP, LLDP, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ...) while it sits on
the 16-descriptor RX_DSCP_NUM() default. A DHCP renewal or a PPPoE
negotiation burst drains it faster than the CPU reposts, after which all
of those protocols silently stop being received.

Treat NO_CPU_DSCP like RX_DONE for scheduling NAPI:
airoha_qdma_rx_process() already calls airoha_qdma_fill_rx_queue()
unconditionally at the end of every poll, so scheduling NAPI is enough
to make an emptied ring refill itself. Re-enable the bit alongside
RX_DONE in airoha_qdma_rx_napi_poll() so it is not left masked after
first use.

Whether NO_CPU_DSCP re-latches while the ring is still empty is not
documented. If it does, a ring that cannot be refilled (page_pool
returning NULL) keeps reasserting it. Masking it until a refill succeeds
is worse: a starved ring never fires RX_DONE either, so it would stay
dead after the memory pressure clears.

Fixes: f252493e1835 ("net: airoha: Enable multiple IRQ lines support in airoha_eth driver.")
Link: https://github.com/openwrt/openwrt/issues/24715
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.c  | 16 +++++++++++-----
 drivers/net/ethernet/airoha/airoha_regs.h |  2 ++
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 64619e9a704d..c59201aded26 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -784,13 +784,16 @@ static int airoha_qdma_rx_napi_poll(struct napi_struct *napi, int budget)
 		int i, qid = q - &qdma->q_rx[0];
 		int intr_reg = qid < RX_DONE_HIGH_OFFSET ? QDMA_INT_REG_IDX1
 							 : QDMA_INT_REG_IDX2;
+		u32 irq_id = qid % RX_DONE_HIGH_OFFSET;
+		u32 intr_mask = BIT(irq_id) |
+				BIT(irq_id + RX_NO_CPU_DSCP_LOW_OFFSET);
 
 		for (i = 0; i < ARRAY_SIZE(qdma->irq_banks); i++) {
 			if (!(BIT(qid) & RX_IRQ_BANK_PIN_MASK(i)))
 				continue;
 
 			airoha_qdma_irq_enable(&qdma->irq_banks[i], intr_reg,
-					       BIT(qid % RX_DONE_HIGH_OFFSET));
+					       intr_mask);
 		}
 	}
 
@@ -1468,16 +1471,19 @@ static irqreturn_t airoha_irq_handler(int irq, void *dev_instance)
 	if (!test_bit(DEV_STATE_INITIALIZED, &qdma->eth->state))
 		return IRQ_NONE;
 
-	rx_intr1 = intr[1] & RX_DONE_LOW_INT_MASK;
+	rx_intr1 = intr[1] & (RX_DONE_LOW_INT_MASK | RX_NO_CPU_DSCP_LOW_INT_MASK);
 	if (rx_intr1) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX1, rx_intr1);
-		rx_intr_mask |= rx_intr1;
+		rx_intr_mask |= (rx_intr1 & RX_DONE_LOW_INT_MASK) |
+				RX_NO_CPU_DSCP_INT_RX1_MASK(rx_intr1);
 	}
 
-	rx_intr2 = intr[2] & RX_DONE_HIGH_INT_MASK;
+	rx_intr2 = intr[2] & (RX_DONE_HIGH_INT_MASK | RX_NO_CPU_DSCP_HIGH_INT_MASK);
 	if (rx_intr2) {
 		airoha_qdma_irq_disable(irq_bank, QDMA_INT_REG_IDX2, rx_intr2);
-		rx_intr_mask |= (rx_intr2 << 16);
+		rx_intr_mask |= ((rx_intr2 & RX_DONE_HIGH_INT_MASK) <<
+				 RX_DONE_HIGH_OFFSET) |
+				(rx_intr2 & RX_NO_CPU_DSCP_HIGH_INT_MASK);
 	}
 
 	for (i = 0; rx_intr_mask && i < ARRAY_SIZE(qdma->q_rx); i++) {
diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethernet/airoha/airoha_regs.h
index 442b48c9b991..bde3d599d8b7 100644
--- a/drivers/net/ethernet/airoha/airoha_regs.h
+++ b/drivers/net/ethernet/airoha/airoha_regs.h
@@ -549,6 +549,8 @@
 #define INT_RX1_MASK(_n)							\
 	((((_n) << RX_NO_CPU_DSCP_LOW_OFFSET) & RX_NO_CPU_DSCP_LOW_INT_MASK) |	\
 	 (RX_DONE_LOW_INT_MASK & (_n)))
+#define RX_NO_CPU_DSCP_INT_RX1_MASK(_n)					\
+	(((_n) & RX_NO_CPU_DSCP_LOW_INT_MASK) >> RX_NO_CPU_DSCP_LOW_OFFSET)
 
 /* QDMA_CSR_INT_ENABLE3 */
 #define RX31_NO_CPU_DSCP_INT_MASK	BIT(31)
-- 
2.55.0

