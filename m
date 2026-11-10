Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794295054;
	b=RCMH39LOvO2lCADWT4Nzaq4Lv9OB3RuXtH47NxHDTia3eFN7EMgGF/noTbzqctP2wtvn
	 A2oePSj3jCGlIy8iyeKW62vFN6Iy2EMLEZUnd2GwRcrVOkP+gwYzsHbGk7/y3RSfY3Tdz
	 2DnPTfkfxev1RwrF5pSzz5yq13J7Dctkn5ricpTRsL7jpQRr1/P2rdDkYvEYY0kuTXb3b
	 zi46juM+ZNPiXlkVRMWGght6xuDIfVRYN4gOjSPyh8U2FMux27wnbTw2YNqXWqcz2PNQE
	 a59DHLo1g8ZqUC9AIbeRJMOeIc8Mt2sTBxvARXG7X3y1jYXafePkBE/tR+3qhJrciXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794295054;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9cen0hjvP2q281Ce+/zcVg5OuInh93Lhmmh8eLYQSf8=;
	b=EfZ6ncRD9+YbvSFiob9hIqerIxk+JJNuNMIcomYtdmxDh+Tu2UX4dkcqSbBMHap2JtKM
	 SN5lVx8sTy60m1Zz6oqXcXbCEHAj6IBMPVM8nHZkKSCfvwM0WuL7p2okrdnZAuM+3L/c/
	 0S2TcYzmJ/XVeb37qbt/NhECPUZPraZWNOKbZ/u5mvLV6sjeovQqNWkmck1SJrQRVT52q
	 zlK+sGDUBKbvce5HoigAXlmMTwK6Th2hIDexoQuASLd/FpqUsZWO/R8+W+ZmssQ/todyP
	 vGafssDYG+CKMuNHO/uK0v1frh8JTljtAgbGsKs+iC9bmS6Z0tUSM2Cj9WtcnbpjYaw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBmZ9xRW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE58606A33A;
	Tue, 10 Nov 2026 07:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=TBmZ9xRW
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794295053;
	b=NBbKfI+1PKETOwpEXsSyI9HsKfnssZ/+KST9v+T0cNERAhduhnM5bFEtZHtIaF4QeGr3
	 rlJY7gydHml4sj1xWo1k+K7zX2PUZVUvaw3Te9WXUDtDhXjydqZyDlTb+nX3Ac+B3+xLk
	 WfbNTbdeQZSjmLs3twKTRYmLvkYjmfYcVcrri5p4Rdqml/zDiZFLcVM5SW4L4dP5Vj6cV
	 3XLcP9nRyW/CaZW5x5OrMF2EhtkCIGPms2O4vy1la+W4Jr5S9kysBwTEkPQPQBSRnWMTb
	 mr6vpDy0I12IYyxRgIuDzOz6afvsrDHm0z3lOWp4/2qulWpHCI4upbdUxHTfqomtylQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794295053;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9cen0hjvP2q281Ce+/zcVg5OuInh93Lhmmh8eLYQSf8=;
	b=AK8dAMiaeYAK+dlbUAWZxQpIZ05Yx3yKW3iztWTmSh2T4XfTdd6boOJ5fCcCqQuqpWat
	 QrhjeiiFFKWCmg6hi4J+/k/6Zn2F18JKRtXYHi4HMtSjVQHd1gHTu2ME1qpRpQJ91RL/R
	 8JLAfJ68bb5gJB62T2JqOnjuzcYy9cicLG5UkCwlbTCK8PspQ25VaNc3qzmkE5Ec1pTPJ
	 f/HfAuMfbxdfiWFU3REEfXdX8krY/IDhPfojcT7TxFsF6KaA5im10ckgbTbPFYKLkbnFY
	 5tmoObcUPie0o+brROP81jFrOSSGc4j1uSZaSs/So4yBWjZEhSpfYFn0t8WRrY81eRg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 2CDAC1F008A4;
	Tue, 10 Nov 2026 07:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794295053;
	bh=9cen0hjvP2q281Ce+/zcVg5OuInh93Lhmmh8eLYQSf8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=TBmZ9xRW8dQpTThpcFa1hqfSd8cM2PgfVNyRUO7hQcbU/H6bAbUHXZXY+Bvl3hwkS
	 nSU2KoNQRhVbLOSmPp6og6tvAmPNEU4fQZKCHUZLgpRHmApCfKtDtQRbS63Wk4OIbt
	 wT5NHKeLJNkXz/Ntm64/bToWIAJFj8ZajsbYOHiPnyumXDakvBPaxDEGXhCzGHw2Dw
	 vrziObOJnwmBINa9gDTiRFbehjStFmUWKFezljWja+LyoY8CnncYUJ2lBqBJdg/uXw
	 UHAUJhvLJ7Sjym9FnolZKo2fuQt+e6S60jb/C9ubGbHduIOvy5qBI9m4WL5IX/TXES
	 inT0wymEpLanw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id A956C48982;
	Tue, 10 Nov 2026 07:17:31 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:17:34 +0000
Subject: [PATCH 4/5] media: verisilicon: Reinitialize the IOMMU after a
 timeout
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
Message-Id: <20261110-hantro-robust-v1-4-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
In-Reply-To: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
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
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794295050; l=5083;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=1ILVc0XxI2PCAfgk0ngwYRC2RkfgL6hHoTl0K6AyZXI=;
 b=/vXdujryk4/fhNdDurtKbtU0Mls3+jpCuWaYnmlCPGnFOykuvqaa3ssG3OMSgEjBPcivukbcn
 tyZ4STiUmTKCsmAqnbu7Kpjlg08zMIgaPK+1+GlXdgPzkAcId1Vlpxy
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

A job that times out can leave the IOMMU of the VPU in a bad state: a
core that faulted on an unmapped IOVA leaves the IOMMU with a page fault
pending, and resetting the core can leave the IOMMU out of sync with
what its driver expects. The IOMMU is only reinitialized when it runtime
suspends and resumes, which doesn't happen between back-to-back jobs, so
the next jobs run with a broken IOMMU and time out as well.

Do like rkvdec: allocate an empty paging domain at probe, and after a
timeout attach it and detach it again, which returns the device to its
default DMA domain. The IOMMU driver disables the IOMMU and fully
reinitializes it on each domain change (on Rockchip: stall, force reset,
program the directory table and enable paging), and the default domain
keeps all the existing mappings. This is done from the watchdog work,
in process context, after the codec reset operation stopped the core
and while the job still holds the runtime PM reference, so the IOMMU is
powered.

Devices without an IOMMU, and IOMMUs that can't allocate a paging
domain, are left alone.

Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/media/platform/verisilicon/hantro.h     |  3 ++
 drivers/media/platform/verisilicon/hantro_drv.c | 57 +++++++++++++++++++++++++
 2 files changed, 60 insertions(+)

diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/platform/verisilicon/hantro.h
index 0353de154a1e..51bc40668c6f 100644
--- a/drivers/media/platform/verisilicon/hantro.h
+++ b/drivers/media/platform/verisilicon/hantro.h
@@ -193,6 +193,8 @@ hantro_vdev_to_func(struct video_device *vdev)
  *			shared with interrupt handlers.
  * @variant:		Hardware variant-specific parameters.
  * @watchdog_work:	Delayed work for hardware timeout handling.
+ * @empty_domain:	Empty IOMMU domain, used to reinitialize the IOMMU after
+ *			a timeout. NULL if the VPU isn't behind an IOMMU.
  */
 struct hantro_dev {
 	struct v4l2_device v4l2_dev;
@@ -213,6 +215,7 @@ struct hantro_dev {
 	spinlock_t irqlock;
 	const struct hantro_variant *variant;
 	struct delayed_work watchdog_work;
+	struct iommu_domain *empty_domain;
 };
 
 /**
diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/media/platform/verisilicon/hantro_drv.c
index 702d878c7b50..c85c8f07db34 100644
--- a/drivers/media/platform/verisilicon/hantro_drv.c
+++ b/drivers/media/platform/verisilicon/hantro_drv.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/iommu.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
@@ -112,6 +113,31 @@ void hantro_irq_done(struct hantro_dev *vpu,
 	}
 }
 
+/*
+ * A job that timed out can leave the IOMMU stalled, for instance on a page
+ * fault the core never recovered from, and a hardware reset of the core can
+ * leave the IOMMU state out of sync with its driver. Attach the empty domain
+ * and detach it again to return to the default DMA domain: the IOMMU driver
+ * then disables and fully reinitializes the IOMMU, which keeps all the
+ * mappings of the default domain.
+ */
+static void hantro_iommu_restore(struct hantro_dev *vpu)
+{
+	int ret;
+
+	if (!vpu->empty_domain)
+		return;
+
+	ret = iommu_attach_device(vpu->empty_domain, vpu->dev);
+	if (ret) {
+		dev_warn(vpu->dev, "Failed to attach the empty IOMMU domain: %d\n",
+			 ret);
+		return;
+	}
+
+	iommu_detach_device(vpu->empty_domain, vpu->dev);
+}
+
 void hantro_watchdog(struct work_struct *work)
 {
 	struct hantro_dev *vpu;
@@ -124,6 +150,7 @@ void hantro_watchdog(struct work_struct *work)
 		vpu_err("frame processing timed out!\n");
 		if (ctx->codec_ops->reset)
 			ctx->codec_ops->reset(ctx);
+		hantro_iommu_restore(vpu);
 		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
 	}
 }
@@ -1085,6 +1112,32 @@ static void hantro_reset_assert(struct hantro_dev *vpu)
 	reset_control_assert(vpu->resets);
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
+	if (!iommu_get_domain_for_dev(vpu->dev))
+		return 0;
+
+	domain = iommu_paging_domain_alloc(vpu->dev);
+	if (IS_ERR(domain)) {
+		/* Not fatal, the IOMMU just won't be restored on timeouts. */
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
@@ -1146,6 +1199,10 @@ static int hantro_probe(struct platform_device *pdev)
 	if (IS_ERR(vpu->resets))
 		return PTR_ERR(vpu->resets);
 
+	ret = hantro_alloc_empty_domain(vpu);
+	if (ret)
+		return ret;
+
 	num_bases = vpu->variant->num_regs ?: 1;
 	vpu->reg_bases = devm_kcalloc(&pdev->dev, num_bases,
 				      sizeof(*vpu->reg_bases), GFP_KERNEL);

-- 
2.55.0


