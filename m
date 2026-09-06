Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341BA3CC7EB;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788719828; cv=none; b=Tzka8XHQ+mgCfY9+DBOqCSQbpMdI+7lvab7M0GcN15Y4s8wxOEhtvUVc4h5b1JoT+1HYKt2w3t8zq7NYJUaJZmlDp+ozCXJVUS/cirgtWjRafmOXUMiXNq2MXFRoar2OfBUHQsW8RdlneW4KbR4oCYgUSXOOkG5JGTr61/TlXsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788719828; c=relaxed/simple;
	bh=XzwUrv8QkEnw2nIL7r4TaOTvzfuNbqBbIbkln6OG5pQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ABEYWvtt6c3AD0Z73HN1FkTLIVxET1GNWHPSLVsBPPuhwlA8tnIf7JS5cCETYD5nAb07G24a172ntnGd8qAVWhsvNoJNm0bl131DDk922JOoe8xfZlX1gc3140CiqdnDLtMXtWEZ3mIdcM4c9f9wYQMPOavYH5rasvHK+yOTJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ba5kwVu7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ba5kwVu7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 133B1C32781;
	Sun,  6 Sep 2026 18:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788719828;
	bh=XzwUrv8QkEnw2nIL7r4TaOTvzfuNbqBbIbkln6OG5pQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ba5kwVu7y6VLFD41n4xRuj2Ao5acq5FgjSpwQorMztwD262l+nPYoz26/N4DYoIvQ
	 blK87Fv30k8Cg++FWTjyGxGkL7DpHJi+zu0PUdwf+lHsgvPeioqRB0cDxhdHIKhJ7n
	 8r8w7mSYcKqiKMAmiWQvVVgsIROw2m3k3zKxffiI3q/ro2nO05SoSza3at1k+XyJ17
	 +NDV1/M9i2Ynj0xC4fs6SggzXoZ4BabrCFEv//8pA35UO2UhqWvzy2denbgMMp5W+d
	 JDL4CAPzuBLuh/yvv5usOJd9qHyiGS7RqHKJ/Iwk5Tf2DX6InUuiUHZkXz2VwC3kxE
	 /Q8vqBaRq6O1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38EAC79FA1;
	Sun,  6 Sep 2026 18:37:07 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 06 Sep 2026 20:36:36 +0200
Subject: [PATCH v2 13/22] thunderbolt: Add ring register accessors to
 tb_nhi_ops
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-b4-apple-soc-tbt-v2-13-1f80085f93fb@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4323; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=XzwUrv8QkEnw2nIL7r4TaOTvzfuNbqBbIbkln6OG5pQ=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9bcTYd2HZoox/5JV2THtMBpEr6T8lP8Mnomd0yekCSfq
 N3zRvlLRykLgxgXg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAis5QZ/vAcYFXJZkl7WrKA
 Vclct8A7QFf88n43mw87OnY/mVnNcIHhf6RvsKon99cp3jPkjt+J2sIj9Xjx6bTMaz8mpHkfOHL
 iLhcA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The ring descriptor and options registers are laid out differently on
the Apple NHI. Add optional tb_nhi_ops hooks for their base addresses
which fall back to the standard USB4 register layout when they are not
set.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c | 32 ++++++++++++++++++++++++++------
 drivers/thunderbolt/nhi.h |  6 ++++++
 2 files changed, 32 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index fc54ff7edfb9..1b1e4a12c744 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -179,19 +179,37 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
 static void __iomem *ring_desc_base(struct tb_ring *ring)
 {
 	void __iomem *io = ring->nhi->iobase;
+
 	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
 	io += ring->hop * 16;
 	return io;
 }
 
+static void __iomem *nhi_ring_desc_base(struct tb_ring *ring)
+{
+	if (ring->nhi->ops->ring_desc_base)
+		return ring->nhi->ops->ring_desc_base(ring);
+
+	return ring_desc_base(ring);
+}
+
 static void __iomem *ring_options_base(struct tb_ring *ring)
 {
 	void __iomem *io = ring->nhi->iobase;
+
 	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
 	io += ring->hop * 32;
 	return io;
 }
 
+static void __iomem *nhi_ring_options_base(struct tb_ring *ring)
+{
+	if (ring->nhi->ops->ring_options_base)
+		return ring->nhi->ops->ring_options_base(ring);
+
+	return ring_options_base(ring);
+}
+
 static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
 {
 	/*
@@ -199,29 +217,31 @@ static void ring_iowrite_cons(struct tb_ring *ring, u16 cons)
 	 * are ignored by the hardware so we can save one ioread32() by
 	 * filling the read-only bits with zeroes.
 	 */
-	iowrite32(cons, ring_desc_base(ring) + 8);
+	iowrite32(cons, nhi_ring_desc_base(ring) + 8);
 }
 
 static void ring_iowrite_prod(struct tb_ring *ring, u16 prod)
 {
 	/* See ring_iowrite_cons() above for explanation */
-	iowrite32(prod << 16, ring_desc_base(ring) + 8);
+	iowrite32(prod << 16, nhi_ring_desc_base(ring) + 8);
 }
 
 static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
 {
-	iowrite32(value, ring_desc_base(ring) + offset);
+	iowrite32(value, nhi_ring_desc_base(ring) + offset);
 }
 
 static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
 {
-	iowrite32(value, ring_desc_base(ring) + offset);
-	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
+	void __iomem *base = nhi_ring_desc_base(ring);
+
+	iowrite32(value, base + offset);
+	iowrite32(value >> 32, base + offset + 4);
 }
 
 static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
 {
-	iowrite32(value, ring_options_base(ring) + offset);
+	iowrite32(value, nhi_ring_options_base(ring) + offset);
 }
 
 static bool ring_full(struct tb_ring *ring)
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 4884c3f5a2b2..3a963b0b5b46 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -52,6 +52,10 @@ extern const struct dev_pm_ops nhi_pm_ops;
  * @post_nvm_auth: hook to run after Thunderbolt 3 NVM authentication
  * @request_ring_irq: NHI specific interrupt retrieval hook
  * @release_ring_irq: NHI specific interrupt release hook
+ * @ring_desc_base: NHI specific hook returning the ring descriptor registers.
+ *		    If not set the standard USB4 NHI registers are used.
+ * @ring_options_base: NHI specific hook returning the ring option registers.
+ *		       If not set the standard USB4 NHI registers are used.
  * @ring_interrupt_active: NHI specific hook to activate/deactivate the
  *			   interrupt of a single ring. If not set the
  *			   standard USB4 NHI registers are used.
@@ -70,6 +74,8 @@ struct tb_nhi_ops {
 	void (*post_nvm_auth)(struct tb_nhi *nhi);
 	int (*request_ring_irq)(struct tb_ring *ring, bool no_suspend);
 	void (*release_ring_irq)(struct tb_ring *ring);
+	void __iomem *(*ring_desc_base)(struct tb_ring *ring);
+	void __iomem *(*ring_options_base)(struct tb_ring *ring);
 	void (*ring_interrupt_active)(struct tb_ring *ring, bool active);
 	bool (*is_present)(struct tb_nhi *nhi);
 	int (*init_interrupts)(struct tb_nhi *nhi);

-- 
2.55.0


