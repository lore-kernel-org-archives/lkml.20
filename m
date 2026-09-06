Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE9A3CF1F4;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=bNPWSb7uZCx6CHb/LiO0WNDlIhDOCXpVVat/thRO2RG04KfHOVGuZPqWYdGgL+/kGCJZwQssYj+jsDuQGSeR3f6Xkc6U9J7k8QlZRdGN1j+Xez8gVNt9P1AIiMDfY4krps/Y+cBnwoWTYlHpnNqr8A3JJ1M/d99y66idSKXyhCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=WVMy1qg0prw15BOC/1aO59pKjAwSsJirT8ivotx4wRA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I02yT3NaGjffDXg87nw2x52r0loUqpuuwExl7m10rXRvQyE6lLeaN4/pBdSUO2Crzyf7iu/qo3LKBVQCBrtmeq6RcDsaSn8GKG7ZAir2Cn6Th9w4VCoan5UlOmxZxnyYVIp3Wz7NdgTqYKkPHYmaP+Hz32DuvN/OjWu9DB9uwdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwkuQW73; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwkuQW73"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30F7DC2BCFD;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=WVMy1qg0prw15BOC/1aO59pKjAwSsJirT8ivotx4wRA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mwkuQW73Fy8sG3hVWSMxPGoAB18W7BBGfwpG/GRL+AXkQxVUeHYKEvGScNZs/91qT
	 Pp+N9ul8f0GF7lf+pthV2UmHLzR4UfFLGVaZXi/9uAsM1V5GQQHsdlkteJxHDU2Xmx
	 lMVtmSH/JnhuSSA5jM4VD4p5SGL/OmyOmtGeqXLSJRUKMUWV9Nt3M0/dQkbEbvhqWY
	 d8HHhtDih3W5NiN5NH9YpD8S2NnPDT/Y954oWv4n/saqPJ44jXBhensaMiW6qULDdU
	 gCK2oJiK9EXXxqmgH3q0j2coQRlTyhoWCr8GIvFimNJcFoS1zeCE8qWphK+rAh3jDu
	 O9Ht2JKFw4uzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E747C79F85;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:38 +0200
Subject: [PATCH v2 15/22] thunderbolt: Add ring_configure to tb_nhi_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-15-1f80085f93fb@kernel.org>
References: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
In-Reply-To: <20260906-b4-apple-soc-tbt-v2-0-1f80085f93fb@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4518; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=WVMy1qg0prw15BOC/1aO59pKjAwSsJirT8ivotx4wRA=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTUel/SJz/2/Un5uyeW9eiMTBq65LT0XWhi1IT3r2t
 GLf3CbZjlIWBjEuBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEtk1l+Ct+wfOL91PHi7H+
 Zp9rZM/+a/WqbTqTtink5/MfFWx5eiUM/3Rjo2bNNFP4dvP0m6jyAq6sKstc5hNvGZWWHtSWTU1
 p4gEA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Apple NHI also uses a separate register range for the receive ring
PDF masks. Add an optional tb_nhi_ops hook for it which falls back to
the standard USB4 NHI method when it is not set.

For the standard method also just write E2E flow control at the same
time the rest of the configuration is written.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c | 48 +++++++++++++++++++++++++++--------------------
 drivers/thunderbolt/nhi.h |  4 ++++
 2 files changed, 32 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 4ef86e7c0285..2d622b365c4f 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -244,6 +244,24 @@ static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
 	iowrite32(value, nhi_ring_options_base(ring) + offset);
 }
 
+static void ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flags)
+{
+	if (ring->is_tx)
+		ring_iowrite32options(ring, 0, 4);
+	else
+		ring_iowrite32options(ring, ring->sof_mask << 16 | ring->eof_mask, 4);
+
+	ring_iowrite32options(ring, flags | e2e_flags, 0);
+}
+
+static void nhi_ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flags)
+{
+	if (ring->nhi->ops->ring_configure)
+		ring->nhi->ops->ring_configure(ring, flags, e2e_flags);
+	else
+		ring_configure(ring, flags, e2e_flags);
+}
+
 static bool ring_full(struct tb_ring *ring)
 {
 	return ((ring->head + 1) % ring->size) == ring->tail;
@@ -699,6 +717,7 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
  */
 void tb_ring_start(struct tb_ring *ring)
 {
+	u32 e2e_flags = 0;
 	u16 frame_size;
 	u32 flags;
 
@@ -722,30 +741,13 @@ void tb_ring_start(struct tb_ring *ring)
 		flags = RING_FLAG_ENABLE | RING_FLAG_RAW;
 	}
 
-	ring_iowrite64desc(ring, ring->descriptors_dma, 0);
-	if (ring->is_tx) {
-		ring_iowrite32desc(ring, ring->size, 12);
-		ring_iowrite32options(ring, 0, 4);
-		ring_iowrite32options(ring, flags, 0);
-	} else {
-		u32 sof_eof_mask = ring->sof_mask << 16 | ring->eof_mask;
-
-		ring_iowrite32desc(ring, (frame_size << 16) | ring->size, 12);
-		ring_iowrite32options(ring, sof_eof_mask, 4);
-		ring_iowrite32options(ring, flags, 0);
-	}
-
-	/*
-	 * Now that the ring valid bit is set we can configure E2E if
-	 * enabled for the ring.
-	 */
 	if (ring->flags & RING_FLAG_E2E) {
 		if (!ring->is_tx) {
 			u32 hop;
 
 			hop = ring->e2e_tx_hop << REG_RX_OPTIONS_E2E_HOP_SHIFT;
 			hop &= REG_RX_OPTIONS_E2E_HOP_MASK;
-			flags |= hop;
+			e2e_flags |= hop;
 
 			dev_dbg(ring->nhi->dev,
 				"enabling E2E for %s %d with TX HopID %d\n",
@@ -755,10 +757,16 @@ void tb_ring_start(struct tb_ring *ring)
 				RING_TYPE(ring), ring->hop);
 		}
 
-		flags |= RING_FLAG_E2E_FLOW_CONTROL;
-		ring_iowrite32options(ring, flags, 0);
+		e2e_flags |= RING_FLAG_E2E_FLOW_CONTROL;
 	}
 
+	ring_iowrite64desc(ring, ring->descriptors_dma, 0);
+	if (ring->is_tx)
+		ring_iowrite32desc(ring, ring->size, 12);
+	else
+		ring_iowrite32desc(ring, (frame_size << 16) | ring->size, 12);
+	nhi_ring_configure(ring, flags, e2e_flags);
+
 	if (!(ring->flags & RING_FLAG_NO_INTERRUPT))
 		nhi_ring_interrupt_active(ring, true);
 	ring->running = true;
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index ca3eddf862e0..e4964772a442 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -62,6 +62,9 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @ring_interrupt_mask: NHI specific hook to mask/unmask the interrupt of a
  *			 single ring. If not set the standard USB4 NHI
  *			 registers are used.
+ * @ring_configure: NHI specific hook to program the ring options registers
+ *		    and enable the ring with the given flags. If not set
+ *		    the standard USB4 NHI registers are used.
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -81,6 +84,7 @@ struct tb_nhi_ops {
 	void __iomem *(*ring_options_base)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
+	void (*ring_configure)(struct tb_ring *ring, u32 flags, u32 e2e_flags);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);

-- 
2.55.0


