Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559404E1C73;
	Wed, 30 Sep 2026 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790781190; cv=none; b=Ik3OEf0Z9Y/Xw/N8+v2QDgJjWr7GaNFhhr1W98GMa9acVpMODBx+dr5jRrL2JjJuamF0cv0PSsKDBePK0RVJAUrAXtQ11mbhPnInhhlNNSG3/AJEQQwDhSdb44J1fcP54Jo3IojFLnCT9OlYyoNKhPvZaWpC/Z6bK52gmNB14X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790781190; c=relaxed/simple;
	bh=tElqHsQAF81nSVcFmZVlrfQ5KqZwzfeG/qXHFWZj4kM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=beX6lD7Gfjs0+oqeCUTBsWLUgM57j8uXY4ZkeT1KRdWN9q/YTzRnMeiQCXPfk4+7ORiLSJnHPEjbflqZUVUv45L6qgBSpjiYRgM81v4cbVze4md/LCIzcBc3EJ8zh0L0osiKeCQ+vNu0TOWov112Y1/1DxD/CbK9QsQ12gbLgss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=C37Dy2Wa; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="C37Dy2Wa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790781168;
	bh=tElqHsQAF81nSVcFmZVlrfQ5KqZwzfeG/qXHFWZj4kM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C37Dy2Wad9G62e0t9nbuSy6sfbTWxrv7qVmlZ9CUkOM3J9SjaPtXxwWrWXB/isdcc
	 QQ8xOCZsxEpEPcrSnLDnCkGwTWiobf959eDy7zWkZKGHHHexI3TqvEnRWnQyWVivyZ
	 e+KFwQUj1d2pmtFRWgJGjgcxOjzsCcAUaY3t+9uWVuKaWeMfPG3/Pqo2PM5tecprRx
	 dnSAoZT8u+USM/rgbptmj+EuSFRL/uH7nUgowZLoSu6CUoHRbZ8oy7dKahOiUzeaIr
	 ryUXRJNGPTtirYKjpPy0NR8XKeEAWYhx5FVTCkOafoDy2YClj3fRVoqW9PTCGlC9aD
	 0IXLLRRUE3g2g==
Received: from benjamin-XPS-13-9310.home (unknown [100.64.1.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C80417E0D5D;
	Wed, 30 Sep 2026 17:12:48 +0200 (CEST)
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	conor@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v6 3/3] media: verisilicon: Remove useless internal fields
Date: Wed, 30 Sep 2026 17:12:41 +0200
Message-ID: <20260930151241.58233-4-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
References: <20260930151241.58233-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

No more variants are using multiple registers regions so rename
reg_bases to reg_base.

Remove the useless fields and simplify driver code.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/verisilicon/hantro.h   | 10 ++--------
 .../media/platform/verisilicon/hantro_drv.c   | 20 +++++--------------
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..f85035a98b28 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -72,8 +72,6 @@ struct hantro_irq {
  * @num_irqs:			number of irqs in the array
  * @clk_names:			array of clock names
  * @num_clocks:			number of clocks in the array
- * @reg_names:			array of register range names
- * @num_regs:			number of register range names in the array
  * @double_buffer:		core needs double buffering
  * @legacy_regs:		core uses legacy register set
  * @late_postproc:		postproc must be set up at the end of the job
@@ -97,8 +95,6 @@ struct hantro_variant {
 	int num_irqs;
 	const char * const *clk_names;
 	int num_clocks;
-	const char * const *reg_names;
-	int num_regs;
 	unsigned int double_buffer : 1;
 	unsigned int legacy_regs : 1;
 	unsigned int late_postproc : 1;
@@ -184,10 +180,9 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			dev_ macros.
  * @clocks:		Array of clock handles.
  * @resets:		Array of reset handles.
- * @reg_bases:		Mapped addresses of VPU registers.
+ * @reg_base:		Mapped address of VPU registers.
  * @enc_base:		Mapped address of VPU encoder register for convenience.
  * @dec_base:		Mapped address of VPU decoder register for convenience.
- * @ctrl_base:		Mapped address of VPU control block.
  * @vpu_mutex:		Mutex to synchronize V4L2 calls.
  * @irqlock:		Spinlock to synchronize access to data structures
  *			shared with interrupt handlers.
@@ -204,10 +199,9 @@ struct hantro_dev {
 	struct device *dev;
 	struct clk_bulk_data *clocks;
 	struct reset_control *resets;
-	void __iomem **reg_bases;
+	void __iomem *reg_base;
 	void __iomem *enc_base;
 	void __iomem *dec_base;
-	void __iomem *ctrl_base;
 
 	struct mutex vpu_mutex;	/* video_device lock */
 	spinlock_t irqlock;
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 12c804dcc669..6e3a24156a69 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -1080,7 +1080,6 @@ static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
 	struct hantro_dev *vpu;
-	int num_bases;
 	int i, ret;
 
 	vpu = devm_kzalloc(&pdev->dev, sizeof(*vpu), GFP_KERNEL);
@@ -1128,21 +1127,12 @@ static int hantro_probe(struct platform_device *pdev)
 	if (IS_ERR(vpu->resets))
 		return PTR_ERR(vpu->resets);
 
-	num_bases = vpu->variant->num_regs ?: 1;
-	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
-				      sizeof(*vpu->reg_bases), GFP_KERNEL);
-	if (!vpu->reg_bases)
-		return -ENOMEM;
+	vpu->reg_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(vpu->reg_base))
+		return PTR_ERR(vpu->reg_base);
 
-	for (i = 0; i < num_bases; i++) {
-		vpu->reg_bases[i] = vpu->variant->reg_names ?
-		      devm_platform_ioremap_resource_byname(pdev, vpu->variant->reg_names[i]) :
-		      devm_platform_ioremap_resource(pdev, 0);
-		if (IS_ERR(vpu->reg_bases[i]))
-			return PTR_ERR(vpu->reg_bases[i]);
-	}
-	vpu->enc_base = vpu->reg_bases[0] + vpu->variant->enc_offset;
-	vpu->dec_base = vpu->reg_bases[0] + vpu->variant->dec_offset;
+	vpu->enc_base = vpu->reg_base + vpu->variant->enc_offset;
+	vpu->dec_base = vpu->reg_base + vpu->variant->dec_offset;
 
 	/**
 	 * TODO: Eventually allow taking advantage of full 64-bit address space.
-- 
2.53.0

