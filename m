Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794472251;
	b=3q26EqNf877sRHko8yysZQkGX8DjuNsMtKHUttLylXWQN+a7D6HTYxYNYb5xMP9TeyGP
	 MTgOW5s8BM5lPiWujxh8SaVxLD+x8AynX1qJYw1XK1WpTpOHyyo1BBb1FM+OJNJKMzL+o
	 SEu4nn/ehv4Umg+r5ln+vnXYn6QjNjd3CVnVnL1tNQxK0Lzo7/qpMkGVms4Srfq3ZsnW8
	 V/Ty0hGBe+6YzVwm2VTKrXif8D5dZXfPqZgO8NEVIULojfx31TpEMsMfTs42q3XTqu3jH
	 QHw0hDLBhrU72g+gz9/tP84qsheUCYPasRzcTiuA7/6/WS7wxa44hHpXC6dSHivkQ5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794472251;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QpAYTWbxPTJiwAg9uksDt4YdNa7tLRzkcnDNwQG+9Is=;
	b=sKT7rqefili0LO3QZEGBt+xY80q9GuTZ8IrKMX5/XfcAw3FnmnD6F4QF+A6FBGiWQrkG
	 xgijWPzD5K6GQs9Hu36NcR8s/QXolE0CmrVeL62U7TxceEdg/a/LWjnR+EdjreCWA8Z4h
	 nt9HIZu9jnR5mh93+CJNzDARl3n3d0CMl25N7tXtxGfPudZpDo3WuEOkeVmglzqd+tXua
	 d0goa5GPV3wKu1W+J/NhCeL0NDP5Enk96QKplHWUnXFmJCjAb1GllNR5L/X6l6V0phSBW
	 b8/BNHe920BvALCF+ZGr3ZhFu2V6uIAuPzec353PN5aGuqw70nwggNcPDCrrg9j7+gQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7eQxUQP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEE2606A8AB;
	Thu, 12 Nov 2026 08:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=U7eQxUQP
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794472251;
	b=MQuBWzs/QLQE2Ttnmn24jeZqHJg6qocThyIgWm9M1CHKcGhGW0EJpZkm8SBTv6mcSq1h
	 XmdtnoNaAdElqob8BiYOcA5ouHkNTNUcG2GuAcBPnWO330ppCID7QpK3KNGeh0FYVWAIs
	 y/Bs9XKmUwSfN2w/vWtaupKd4J90HDjpxiby/3mS0VdsK6D5Bra0QLJgDgNuzEFxka9Ss
	 EO9BrFGAZE/UAZ25Nf8Pr27B+VQAWSdMLX6S2vC9W0j6TG9LHCqgjeEYc/vZgvA7ZyWlu
	 R5XOklFR1AymWz3g/MdDNonGBODcg750cBNirto4caBUGSfsjITKYX12zHGkfoIgjUA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794472251;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=QpAYTWbxPTJiwAg9uksDt4YdNa7tLRzkcnDNwQG+9Is=;
	b=ntGtxFU2n7E4Zkq+sJ6ZdU81CKrTfkds8dNm8GupaoPGh2CRbWfz4iSexUgzm1ENgMf3
	 duOTY9SRrqlXGzriMdrVJN+Gyc4YBvl03vPz0lnuDb/tI05l2be5KbV8XLrvoYjLlYZIm
	 B2LGomrhZVHCpi6khxBIZLBPZdCSbG8qvgFJg+Q2a2QCZal/MU5DXuMoWSp4kS1HiBSpq
	 4cARKuwyTzk4kL1GJyOXii9V/npQMX32cYs9tQLFQqaHoLd94qtPFKAjq/XwgDLmNBQG1
	 M/JSBPULeltSVH2JZK83r9jmfEVD2aGas5dkxcroWgdqu0spqqs+7n9njicT/M1jEYg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E2EF01F00A05;
	Thu, 12 Nov 2026 08:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794472251;
	bh=QpAYTWbxPTJiwAg9uksDt4YdNa7tLRzkcnDNwQG+9Is=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=U7eQxUQPIgtxeNk0Bn+Btj0Yuxc8826btc97x/8yKuTqfdIC+Po4AUZ7UJ4Svm/FC
	 SzJ6Vwl8kVKvibocn4xFovzGWYTwd+e1HgfsR6l0IRbZOGhlaz+iNzJROGEgSI/xuN
	 ja5gDuLulau1MwEMnXP9ZdiQeFHz7ppBsDt1YBSckYr+cOnlnRlDPwAw/gH4tvTH6P
	 mvcC9ZiT4gASZbi222WlzegH3INzNNtp/ehbeD6H7gyQcf2gOcV/5Qlf4+s5JdAu6y
	 X46Y7iFkMcMvgwooOhjwkDIdve/ExGu5ztprddDxfOhnU7IDX0pa45GJR52up86E6c
	 BqVOPeOgtGHvg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 49C7949389;
	Thu, 12 Nov 2026 08:30:48 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:30:51 +0000
Subject: [PATCH v2 5/6] media: verisilicon: Reinitialize the IOMMU after
 resetting an encoder core
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
Message-Id: <20261112-hantro-robust-v2-5-18561fd48838@gmail.com>
References: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
In-Reply-To: <20261112-hantro-robust-v2-0-18561fd48838@gmail.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, 
 Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Sergei Khomenkov <shomenkow@gmail.com>, 
 Tharit Tangkijwanichakul <tharitt97@gmail.com>, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794472247; l=7393;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=ug53bBEhtldGWmykGaH4aLW7VhPZXSyCeiIkngRLlDk=;
 b=AY65mUPJqk8mih/9y9oLkJlDgvMUAqOHk6qJ66zAdqJpIpbg3I7hDkjToC1TdqcT6qRmegieG
 Gz8MoKFQVM/B9g+lm5UwnElZSMKVgwaQE7fxCzl5P6+VTKGsaJcWRlR
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A Rockchip encoder core that faulted on an unmapped IOVA leaves its
IOMMU with the fault pending, and pulsing the reset lines of the core,
as the previous patch does, can leave the IOMMU out of sync with what
its driver expects. The IOMMU is only reinitialized when it runtime
suspends and resumes, which doesn't happen between back-to-back jobs,
so the next jobs can run with a broken IOMMU.

Do like rkvdec: allocate an empty paging domain at probe, and after the
reset pulse attach it and detach it again, which returns the device to
its default DMA domain. The IOMMU driver reinitializes the IOMMU on each
domain change (on Rockchip: stall, force reset, program the directory
table and enable paging), and the default domain keeps all the existing
mappings. This runs in the watchdog work, right after the core was
stopped and reset, while the timed out job still holds the runtime PM
reference.

Only do it there, where the core is known to be idle, and only for a
device with reset lines whose current domain is a DMA domain, the one
the detach returns to: not with an identity domain or with the ARM32
DMA mapping domains. If the attach fails, the IOMMU driver may leave the
IOMMU without translation (rockchip-iommu falls back to its identity
domain), so refuse all further jobs of the device instead of letting
the core access memory with untranslated addresses.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro.h        |  5 ++
 drivers/media/platform/verisilicon/hantro_drv.c    | 73 ++++++++++++++++++++++
 drivers/media/platform/verisilicon/hantro_hw.h     |  1 +
 .../media/platform/verisilicon/rockchip_vpu_hw.c   |  6 +-
 4 files changed, 84 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..e3881ca21c56 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -193,6 +193,9 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			shared with interrupt handlers.
  * @variant:		Hardware variant-specific parameters.
  * @watchdog_work:	Delayed work for hardware timeout handling.
+ * @empty_domain:	Empty IOMMU domain, used to reinitialize the IOMMU after
+ *			a reset of the core. NULL if not needed.
+ * @iommu_lost:		The IOMMU couldn't be reinitialized, no job can run.
  */
 struct hantro_dev {
 	struct v4l2_device v4l2_dev;
@@ -213,6 +216,8 @@ struct hantro_dev {
 	spinlock_t irqlock;
 	const struct hantro_variant *variant;
 	struct delayed_work watchdog_work;
+	struct iommu_domain *empty_domain;
+	bool iommu_lost;
 };
 
 /**
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 4542322dba71..6d027c277038 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -112,6 +113,35 @@ void hantro_irq_done(struct hantro_dev *vpu,
 	}
 }
 
+/*
+ * Pulsing the reset lines of a core can also reset its IOMMU, behind the back
+ * of the IOMMU driver. Attach the empty domain and detach it again to return
+ * to the default DMA domain: the IOMMU driver then fully reinitializes the
+ * IOMMU, and the default domain keeps all its mappings. Called after the core
+ * was reset, so the IOMMU can be stalled.
+ *
+ * If the IOMMU can't be attached to the empty domain, its driver may leave it
+ * without translation. Refuse all later jobs then, rather than let the core
+ * access memory with untranslated addresses.
+ */
+void hantro_iommu_restore(struct hantro_dev *vpu)
+{
+	int ret;
+
+	if (!vpu->empty_domain)
+		return;
+
+	ret = iommu_attach_device(vpu->empty_domain, vpu->dev);
+	if (ret) {
+		dev_err(vpu->dev, "Failed to reinitialize the IOMMU (%d), refusing further jobs\n",
+			ret);
+		vpu->iommu_lost = true;
+		return;
+	}
+
+	iommu_detach_device(vpu->empty_domain, vpu->dev);
+}
+
 void hantro_watchdog(struct work_struct *work)
 {
 	struct hantro_dev *vpu;
@@ -174,6 +204,11 @@ static void device_run(void *priv)
 	src = hantro_get_src_buf(ctx);
 	dst = hantro_get_dst_buf(ctx);
 
+	if (unlikely(vpu->iommu_lost)) {
+		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
+		return;
+	}
+
 	ret = pm_runtime_resume_and_get(vpu->dev);
 	if (ret < 0) {
 		hantro_job_finish_no_pm(ctx, VB2_BUF_STATE_ERROR);
@@ -1069,6 +1104,40 @@ static struct v4l2_m2m_dev *hantro_get_v4l2_m2m_dev(struct hantro_dev *vpu)
 	return v4l2_m2m_init(&vpu_m2m_ops);
 }
 
+static void hantro_free_empty_domain(void *data)
+{
+	iommu_domain_free(data);
+}
+
+static int hantro_alloc_empty_domain(struct hantro_dev *vpu)
+{
+	struct iommu_domain *domain;
+
+	/*
+	 * Only needed if the core can be reset, and only possible with a DMA
+	 * domain to return to.
+	 */
+	if (!vpu->resets)
+		return 0;
+
+	domain = iommu_get_domain_for_dev(vpu->dev);
+	if (!domain || !iommu_is_dma_domain(domain))
+		return 0;
+
+	domain = iommu_paging_domain_alloc(vpu->dev);
+	if (IS_ERR(domain)) {
+		/* Not fatal, the IOMMU just won't be restored after a reset. */
+		dev_warn(vpu->dev, "Failed to allocate an empty IOMMU domain: %pe\n",
+			 domain);
+		return 0;
+	}
+
+	vpu->empty_domain = domain;
+
+	return devm_add_action_or_reset(vpu->dev, hantro_free_empty_domain,
+					domain);
+}
+
 static int hantro_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match;
@@ -1130,6 +1199,10 @@ static int hantro_probe(struct platform_device *pdev)
 	if (IS_ERR(vpu->resets))
 		return PTR_ERR(vpu->resets);
 
+	ret = hantro_alloc_empty_domain(vpu);
+	if (ret)
+		return ret;
+
 	num_bases = vpu->variant->num_regs ?: 1;
 	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
 				      sizeof(*vpu->reg_bases), GFP_KERNEL);
diff --git a/drivers/media/platform/verisilicon/hantro_hw.h b/drivers/media/platform/verisilicon/hantro_hw.h
index 13e573f1f19d..aa610dd5beef 100644
--- a/drivers/media/platform/verisilicon/hantro_hw.h
+++ b/drivers/media/platform/verisilicon/hantro_hw.h
@@ -427,6 +427,7 @@ extern const struct hantro_postproc_ops rockchip_vpu981_postproc_ops;
 extern const u32 hantro_vp8_dec_mc_filter[8][6];
 
 void hantro_watchdog(struct work_struct *work);
+void hantro_iommu_restore(struct hantro_dev *vpu);
 void hantro_irq_done(struct hantro_dev *vpu,
 		     enum vb2_buffer_state result);
 void hantro_start_prepare_run(struct hantro_ctx *ctx);
diff --git a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
index 114010d6a5c9..309b39ca70da 100644
--- a/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
+++ b/drivers/media/platform/verisilicon/rockchip_vpu_hw.c
@@ -492,8 +492,12 @@ static void rockchip_vpu_enc_hw_reset(struct hantro_dev *vpu)
 	udelay(5);
 
 	ret = reset_control_deassert(vpu->resets);
-	if (ret)
+	if (ret) {
 		dev_err(vpu->dev, "Failed to deassert resets: %d\n", ret);
+		return;
+	}
+
+	hantro_iommu_restore(vpu);
 }
 
 static void rockchip_vpu1_enc_reset(struct hantro_ctx *ctx)

-- 
2.55.0


