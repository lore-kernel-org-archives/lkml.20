Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A42F3264CF;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788121184; cv=none; b=YFayaru6QaYy1Vq2A+oqNiDLabCyY5dMYtTPajm4er+fxfC7VnxknHsN2Qr9G5tZsq4DdLPwb4QGw0HjEq8Y+WkOoLo0y7HTfpLEvOyDLFK0AcSQRkr6/kDbH2+z4G2LDmGJtoAP/aXdYdUMnavGKtJO6rafk8ylZgUF/4Y3Sw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788121184; c=relaxed/simple;
	bh=5XX7FpDBpIyvJfx+M3LmY3siJAf3LFS0+gQqxSzs9eQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pj0SWL1i1OfBe9bUpGE5DBxRjfzDfTt1UBQskKEfjw6+aotRpbXiygKWBBM7/oN4FG089mWD9IcYSneMW9a62ZCUNkZZLPCezifEZuCo0paCxK4GOT47UmOWxsImaqAim5+qq9BXevsEL6J10nbmD5hNEV1cyX19C7LtV6LdGAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzO2/9BC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzO2/9BC"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 663F6C2BD00;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=5XX7FpDBpIyvJfx+M3LmY3siJAf3LFS0+gQqxSzs9eQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VzO2/9BCbD0HayC+lwIiI5cb2upvxMlSY/WL/8cFVNpDTkz8IVDoA2rwM5HzPrw0o
	 TRp1ogue9EibcxGcYXyjQeVH4H6+KfPg5IW6UmHLmCI1FyAP5j9n4W+Kuzlf8Ofh23
	 UMil8d8IUfcBRCw1xRZ26+n7quqJS8VZN0Wfw1XgXw5FWEbZJPsX+MFnlhplCszSyj
	 dV1H9rDNS+EWXJ1vtGaAyGg42KTvwO4plIAq7a23rwDNn7eCx9RLzE2lcH1lt1LgKu
	 SmXq/MpWiVzuEEKgx9zZDdsojiH+8fowQbNbY+MxdixJ5iE/sDchcbg50Pm+80y0sx
	 27H6i+w3GNsuA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53EDFC61DD9;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:28 +0200
Subject: [PATCH 10/19] thunderbolt: Make the ring register layout
 configurable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-10-44bc9348683c@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4811; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=5XX7FpDBpIyvJfx+M3LmY3siJAf3LFS0+gQqxSzs9eQ=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCeHxR9omvpN+LLff5LeTgbhkdt65J7JRi/o3F3qqv
 hONCnjUUcrCIMbFICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZhITTvDH95VrWt0Ncu/1atW
 3lD8MslyX9Tt6mkhduePLLxx+Mi1TxKMDH+VAq0cZH+Z9b2K21erMOHT+6n3ehqssj0FLq3Y9GC
 qKAMA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407

The ring descriptor and options registers are laid out differently on
the Apple NHI. Describe their offsets and strides with a
tb_nhi_ring_layout struct that NHI drivers can override.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/thunderbolt/nhi.c   | 30 ++++++++++++++++++++++++------
 drivers/thunderbolt/nhi.h   | 18 ++++++++++++++++++
 include/linux/thunderbolt.h |  3 +++
 3 files changed, 45 insertions(+), 6 deletions(-)

diff --git a/drivers/thunderbolt/nhi.c b/drivers/thunderbolt/nhi.c
index fc54ff7edfb9..3a3d334e69fd 100644
--- a/drivers/thunderbolt/nhi.c
+++ b/drivers/thunderbolt/nhi.c
@@ -176,19 +176,32 @@ void nhi_disable_interrupts(struct tb_nhi *nhi)
 
 /* ring helper methods */
 
+static const struct tb_nhi_ring_layout nhi_default_ring_layout = {
+	.tx_desc_base = REG_TX_RING_BASE,
+	.rx_desc_base = REG_RX_RING_BASE,
+	.desc_stride = 16,
+	.tx_options_base = REG_TX_OPTIONS_BASE,
+	.rx_options_base = REG_RX_OPTIONS_BASE,
+	.options_stride = 32,
+};
+
 static void __iomem *ring_desc_base(struct tb_ring *ring)
 {
+	const struct tb_nhi_ring_layout *layout = ring->nhi->ring_layout;
 	void __iomem *io = ring->nhi->iobase;
-	io += ring->is_tx ? REG_TX_RING_BASE : REG_RX_RING_BASE;
-	io += ring->hop * 16;
+
+	io += ring->is_tx ? layout->tx_desc_base : layout->rx_desc_base;
+	io += ring->hop * layout->desc_stride;
 	return io;
 }
 
 static void __iomem *ring_options_base(struct tb_ring *ring)
 {
+	const struct tb_nhi_ring_layout *layout = ring->nhi->ring_layout;
 	void __iomem *io = ring->nhi->iobase;
-	io += ring->is_tx ? REG_TX_OPTIONS_BASE : REG_RX_OPTIONS_BASE;
-	io += ring->hop * 32;
+
+	io += ring->is_tx ? layout->tx_options_base : layout->rx_options_base;
+	io += ring->hop * layout->options_stride;
 	return io;
 }
 
@@ -215,8 +228,10 @@ static void ring_iowrite32desc(struct tb_ring *ring, u32 value, u32 offset)
 
 static void ring_iowrite64desc(struct tb_ring *ring, u64 value, u32 offset)
 {
-	iowrite32(value, ring_desc_base(ring) + offset);
-	iowrite32(value >> 32, ring_desc_base(ring) + offset + 4);
+	void __iomem *base = ring_desc_base(ring);
+
+	iowrite32(value, base + offset);
+	iowrite32(value >> 32, base + offset + 4);
 }
 
 static void ring_iowrite32options(struct tb_ring *ring, u32 value, u32 offset)
@@ -1253,6 +1268,9 @@ int nhi_probe(struct tb_nhi *nhi)
 	if (!nhi->ops->init_interrupts)
 		return dev_err_probe(dev, -EINVAL, "missing required NHI ops\n");
 
+	if (!nhi->ring_layout)
+		nhi->ring_layout = &nhi_default_ring_layout;
+
 	nhi->hop_count = ioread32(nhi->iobase + REG_CAPS) & 0x3ff;
 	dev_dbg(dev, "total paths: %d\n", nhi->hop_count);
 
diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
index 4884c3f5a2b2..035cee433a3c 100644
--- a/drivers/thunderbolt/nhi.h
+++ b/drivers/thunderbolt/nhi.h
@@ -40,6 +40,24 @@ void nhi_reset_interface(struct tb_nhi *nhi);
 
 extern const struct dev_pm_ops nhi_pm_ops;
 
+/**
+ * struct tb_nhi_ring_layout - Layout of the ring registers in the NHI MMIO space
+ * @tx_desc_base: Offset of the descriptor registers of the first TX ring
+ * @rx_desc_base: Offset of the descriptor registers of the first RX ring
+ * @desc_stride: Stride between the descriptor registers of neighboring rings
+ * @tx_options_base: Offset of the options registers of the first TX ring
+ * @rx_options_base: Offset of the options registers of the first RX ring
+ * @options_stride: Stride between the options registers of neighboring rings
+ */
+struct tb_nhi_ring_layout {
+	u32 tx_desc_base;
+	u32 rx_desc_base;
+	u32 desc_stride;
+	u32 tx_options_base;
+	u32 rx_options_base;
+	u32 options_stride;
+};
+
 /**
  * struct tb_nhi_ops - NHI specific optional operations
  * @init: NHI specific initialization
diff --git a/include/linux/thunderbolt.h b/include/linux/thunderbolt.h
index d48623fda79b..7c2717bd2945 100644
--- a/include/linux/thunderbolt.h
+++ b/include/linux/thunderbolt.h
@@ -503,6 +503,8 @@ void tb_service_properties_changed(struct tb_service *svc);
  *	  interrupt_work when dispatching interrupts to individual rings.
  * @dev: Device associated with this NHI instance
  * @ops: NHI specific optional ops
+ * @ring_layout: Layout of the ring registers inside @iobase. If not set
+ *		 the default layout from the USB4 specification is used.
  * @iobase: MMIO space of the NHI
  * @tx_rings: All Tx rings available on this host controller
  * @rx_rings: All Rx rings available on this host controller
@@ -524,6 +526,7 @@ struct tb_nhi {
 	spinlock_t lock;
 	struct device *dev;
 	const struct tb_nhi_ops *ops;
+	const struct tb_nhi_ring_layout *ring_layout;
 	void __iomem *iobase;
 	struct tb_ring **tx_rings;
 	struct tb_ring **rx_rings;

-- 
2.55.0


