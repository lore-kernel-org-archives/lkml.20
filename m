Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA27F32B9BB;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121184; cv=none; b=mYS4WbwS5qwi8Bjne8VRy+aakbE+iqCElGPMM6o0deHMSWuSxqE2rrmW7uYJBXFsYpDcAgGRU7v+OP1yE9IAGh9Bem+iA2EVgc1WR+HSHb+lUwbmwWLuvUOiWc7+AD8tDuFdopufS9uZtkKte20DZP4N2byY52Rzx4xCdCdxn7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121184; c=relaxed/simple;
	bh=bjN1NTiSvc6/6RtUd8MUWugBmdf1TrTNf6e7OfieaZY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C/IgSbFaqSeWkP5X5XiSgHevy/DBrWMfSjNFZght65Nxy3e90k7PQVPd+dHakMuk+IhO0MxS9GdEj6Zzqiu+3fFddAieXkxmq6WKbYWSVbzEM04090fRwjK6YlUvpeBbuFWb8O+8Txr0LIYfsVAJrRag9DS3HD84NHpMwJ45daA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sBxHG/y7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sBxHG/y7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89811C4AF1C;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=bjN1NTiSvc6/6RtUd8MUWugBmdf1TrTNf6e7OfieaZY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sBxHG/y7+E6JC7LuaiPSJ3+NeCFvwKHwGCYuO2NElXJW51LmYeeI2VWtc+Wxd/s1w
	 lrsePCkLTtOaHx/zK3tmlDyY8IJnsyEcIhDxi1rFm6tY90GEgg29s46bAWW0QMj8Fx
	 JFgssiWQ0Hm3o6o1Dq41kpj9WUPXqMJz8uv22C25lzOCOAEGSDh9BnDCY2XhNV+7K3
	 +x6RdT4WEhTM5S2pleBs1xoS8UvUmGJu6NveMHcb0+lqI+uD/3k13pYh9mYFSmuBM2
	 VePDeOxdLA7EO41zQZNgXKvA/l01ZClbrEKCVvnp59JRE8SFZab52GbTaHZzWWSXT1
	 Mro23Qhv6mVaw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73059C61DE2;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:30 +0200
Subject: [PATCH 12/19] thunderbolt: Add ring_configure to tb_nhi_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-12-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4597; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=bjN1NTiSvc6/6RtUd8MUWugBmdf1TrTNf6e7OfieaZY=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCRGb7y9IvDeVK3KSiYFpxoEfsc4HqxmXntyjaagmf
 yRQbEZGRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAir1YzMpzSj7SPu/RBwvxf
 lbBpvc+a6mBDu4LtrcH83uU184xrSxgZbi3cLN/E9OBG0Zqtb9yntJi8UnvbmbIlPm6p7k1vP9V
 /PAA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The Apple NHI has to configure and enable each ring with a single write
and uses a separate register range for the receive ring PDF masks. Add
an optional tb_nhi_ops hook for it which falls back to the standard USB4
NHI method when it is not set.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c | 55 ++++++++++++++++++++++++++++++-----------------
 drivers/thunderbolt/nhi.h |  4 ++++
 2 files changed, 39 insertions(+), 20 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index 3cb69deec63e..696da52abff6 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -239,6 +239,31 @@ static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
 	iowrite32(value, ring_options_base(ring) + offset);
 }
 
+static void ring_configure(struct tb_ring *ring, u32 flags, u32 e2e_flags)
+{
+	if (ring->is_tx)
+		ring_iowrite32options(ring, 0, 4);
+	else
+		ring_iowrite32options(ring, ring->sof_mask << 16 | ring->eof_mask, 4);
+
+	ring_iowrite32options(ring, flags, 0);
+
+	/*
+	 * Now that the ring valid bit is set we can configure E2E if
+	 * enabled for the ring.
+	 */
+	if (e2e_flags)
+		ring_iowrite32options(ring, flags | e2e_flags, 0);
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
@@ -694,6 +719,7 @@ EXPORT_SYMBOL_GPL(tb_ring_alloc_rx);
  */
 void tb_ring_start(struct tb_ring *ring)
 {
+	u32 e2e_flags = 0;
 	u16 frame_size;
 	u32 flags;
 
@@ -717,30 +743,13 @@ void tb_ring_start(struct tb_ring *ring)
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
@@ -750,10 +759,16 @@ void tb_ring_start(struct tb_ring *ring)
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
index 5f70d7ddc2e2..670b48efeec5 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -76,6 +76,9 @@ struct tb_nhi_ring_layout {
  * @ring_interrupt_mask: NHI specific hook to mask/unmask the interrupt of a
  *			 single ring. If not set the standard USB4 NHI
  *			 registers are used.
+ * @ring_configure: NHI specific hook to program the ring options registers
+ *		    and enable the ring with the given flags. If not set
+ *		    the standard USB4 NHI registers are used.
  * @is_present: Whether the device is currently present on the parent bus
  * @init_interrupts: NHI specific interrupt initialization hook
  * @reset_interface: Resets the host interface
@@ -93,6 +96,7 @@ struct tb_nhi_ops {
 	void (*release_ring_irq)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	void (*ring_interrupt_mask)(struct tb_ring *ring, bool mask);
+	void (*ring_configure)(struct tb_ring *ring, u32 flags, u32 e2e_flags);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);
 	void (*reset_interface)(struct tb_nhi *nhi);

-- 
2.55.0


