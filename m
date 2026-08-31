Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FA773AFCE8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788212863; cv=none; b=LQUYhGs+qg0/+3kYkp9PA7Ac2AjxhgUPGsnyzcqLQPb4BJeLtfl/vzznwmajqXWiztMasFpsaRLs1H1XoFbMqSxlK5EF5kpMUYTw7RAX+8l4YY4FK2+9wpL2lCIdI1qxAg82nUUh4Ttm/Tbr5E8+5CbBqQy5Bu2JlSihM2l0sB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788212863; c=relaxed/simple;
	bh=ckWizvcSwZhlI6rKng/yD9FrZW5unymXwuDsJRPA9Hg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hXrXFa+Bl7qCWXP6TyZ4f/hCo06t+Tfx33BYylJKow8TaNGaeArlt7PFih0cIq56sdFw/x1AF0PEIQXwk1V2uL4+2Gj3+SsoCtAQ/NNiSl9zfglohgfWZum5Dm9AJtnxMlKJH6Dmo2FMMv0uIZN8R3Zuefz62Eg3ktv66DQq+a0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y75VVkyl; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y75VVkyl"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a1f628b0afso1054851fa.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788212858; x=1788817658; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=Y75VVkyl1s95jn8r6NyLTecyJgok43xfG2CaDQzHOaAcLl2Xmvp+bPwEG31shmuApo
         0Yew1aVNPlBJdjUpyy2I2rA4ywe+zdieXezEGJo/XQTXjSyyf2zUVlSWM29zI8E4PQSG
         zavdO2uaM48rRLtNGEMlmbi+a23XhemTc8qPH5p3F7Lp6fV2u49jKfxCTO/xRfk2gqtZ
         yzDAdFsOgQkGkU+3rQZ023hTjkC3U3mxklAkm8s/ti6RiItA4SgD9NtfTxyHgTCGaCdw
         EYtd12bE5TxdIJzMpgBvPuh7WZyTetfaiDv/b/hZEN4FM/VJ6E/RSupUHYj/5lLV73r3
         Q0MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788212858; x=1788817658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=T+2f2XHv+af68YmdwG7YdmU8mGG4BCpNERxEZlAskTc=;
        b=c93GzgG3C7pp6cjLN4Fid0ibpLAefBmZHXW8cIdxM4RAlGkiqzXq7WeLoGcb5qbxcq
         KApIEcweUPgq9D6JUeWdDOMI8OpmCftyEJ68G7FzK9Xhs2N9XOIcAe8Av1IEAnGzuBFr
         m+mtXfNGOmofZ4ziYh6iINif9/LHfPt+CHB1oZiISz5VEi4ZkhEwGeIby9I5gVLl7kbi
         WAko3amKG/ub210XY2327mTE9M1q63GbMP8iknKBEfddTtqjreFZhovGUuNXBfkHplZV
         706m+VKiUEHnNpCp5ZW2/AZ0uNGoRMjLLYRcK4+9pm/f9C5TeWm2GCq6n7AauRjN2gK7
         XPJA==
X-Forwarded-Encrypted: i=1; AKwUvBwRimyzPFx91ytwxOnv502SghLp6TAIVJvQiVFvts1qyXCadie75RLES2HJE5yY41g3uowchsOEZPWqPiQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n1oFx5B1AT6/Y/UspFjUysUf9iDRLJrUB/FWo6KjDVVu4h4iyd
	KL6ebsFC1Yo+VXsT/OGmBQ4nBJjT5mbtCPAwkY3ORlKWDwcU+f4eMIg=
X-Gm-Gg: AYBFou0t3otoyAVx99XT+qSwCFc1GmJ/wa2NGu/YReAPVuWU1r2+Rh2C0q+M8Adn8nO
	jldlJcVXeoVew/b4VSthXhj7vj5hhna6D2oQrqhcPFQeGxrWtagBf1GeUWCBVJ8Nmu44jwrPn6M
	JOaDZ1dS5+29UpU0LgrEYPP1jyZCzBMIOANRkWEBtHDIldhb8/M5V8lODl1LWf/ZsCXgbXNzB90
	lr722a26ibmhHsVi7zcw1yXjZDmymTecmJF2qYLuHK1aYaxU/81U/0nYtiXSw/811JAXEU1KB3V
	P5N7/LFLH9U+8Fn6yXQZbjO33EWbooFo7n8ALtfzLWgCawCfzeCCTrlwyDW7R0bxdarWdeUHXH7
	kdgE1ZiIi+lyUBsgZ0rSOCPf70Hiau/Wr7UF6teQNFn1VRk1ZWgLoyxnYXucWEaVs6WpNmAgovY
	LPvOrEKNBZ/An0mWr7+pmZt+IhnzFBH/z0JrssbZHdyOttdb13mw==
X-Received: by 2002:a05:651c:325a:b0:394:1254:10d2 with SMTP id 38308e7fff4ca-3a30175f2aamr61513991fa.0.1788212857793;
        Mon, 31 Aug 2026 14:47:37 -0700 (PDT)
Received: from fedora ([92.36.9.2])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a31550cefbsm18299201fa.9.2026.08.31.14.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:47:37 -0700 (PDT)
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
Subject: [PATCH net v2 1/3] net: airoha: handle RX_NO_CPU_DSCP interrupt, not just RX_DONE
Date: Tue,  1 Sep 2026 00:46:59 +0100
Message-ID: <20260831234701.206021-2-sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260831234701.206021-1-sochnev.v.74@gmail.com>
References: <20260830095717.37218-1-sochnev.v.74@gmail.com>
 <20260831234701.206021-1-sochnev.v.74@gmail.com>
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

