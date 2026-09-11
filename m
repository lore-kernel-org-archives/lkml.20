Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BF83EB7FB;
	Fri, 11 Sep 2026 03:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789097313; cv=none; b=tl30K0R2R1O53aZdyPKOjFaZyt4kT4Z22KNuL1knnvqilZYaTnTd5kSSIxSmc6ZwTt07ptoV8gLNxphgQQQkvJuIrB2pSNS0jwmPd4YfkUShvNNoCEIS/5g61hd0MpPHbBghlzHZKqKfKWAH8NTR8+ozUKovW1zUoId1VmXFHxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789097313; c=relaxed/simple;
	bh=pkryGunVAs4cfHiSV/nJ61BSB4eD034VA6dMqSR9jxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJZPjW9dfCvhQABRqbojpINhyAHSJGMhT/F62fwbJrjMmY31fXbANJacSVNHaAJfHW4I8226XnlrrHRxmn543bokEchxv850ZSYsxyGWMr6YFX5m0VFA/cfXrqrGMXK/CF/kxQah9N2XzAt9pGOI16BwU3fhR6JSetWNicyfEts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KNRZ9go1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KNRZ9go1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A6EA1F00893;
	Fri, 11 Sep 2026 03:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789097311;
	bh=JqgSoIBESDHLyR7I67daLRSr3Iyho5ADiCyaj7jEfiU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KNRZ9go1qR8L7JRb9Xn3RhWpeR8GUiFEVCXwjQ82DsyIfAayNiE8/5RN45cUt1Zqi
	 8OMUYuVX/CpqposqTctGjdM+wf+x1T/6rysS/QuaBbfqLiA8bXNNK1odnylHZReKX9
	 A6q1lNPCitZ97TLfkNkQIEAznSUwT8V3IQ6m/OTLVFZFkYuu+LcUWju489LHfveTY0
	 ZiQz31TI+rPNLUBXmBvB+OXL7u/IfV+WdkytlAJosNU0dPl2z5bJW1unnvAPGyb9iJ
	 mKe3jw3PIVq6Fm6Pde8OTQzYqgxNfrS+8gJBm9xjKDmIcFOQLeBcR16N4oItKnShAX
	 RiCd0Oj1cQbrg==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 11 Sep 2026 03:27:14 +0000
Subject: [PATCH v2 6/6] media: mtk-vpu: rename IPI_MAX to IPI_VPU_MAX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-ipi_max-v2-6-a77826ff189e@kernel.org>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
In-Reply-To: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Nathan Chancellor <nathan@kernel.org>, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0

The last enumerator of this driver's firmware IPI id list is a bound
for the VPU mailbox protocol, not a generic host IPI limit. Follow the
existing naming in this header: IPI_VPU_INIT already carries a VPU
prefix, so the terminator should match.

The same convention is used by the SCP IPI enum, which ends with a
prefixed SCP_IPI_MAX rather than a bare IPI_MAX.

Rename IPI_MAX to IPI_VPU_MAX and update the descriptor table bounds
and range checks. No functional change.

Link: https://lore.kernel.org/linux-riscv/20260908222349.GA2324870@ax162
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 12 ++++++------
 drivers/media/platform/mediatek/vpu/mtk_vpu.h |  4 ++--
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 8d8319f0cd22..b3e9f8c4ab7a 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -211,7 +211,7 @@ struct mtk_vpu {
 	struct vpu_regs reg;
 	struct vpu_run run;
 	struct vpu_wdt wdt;
-	struct vpu_ipi_desc ipi_desc[IPI_MAX];
+	struct vpu_ipi_desc ipi_desc[IPI_VPU_MAX];
 	struct share_obj __iomem *recv_buf;
 	struct share_obj __iomem *send_buf;
 	struct device *dev;
@@ -221,7 +221,7 @@ struct mtk_vpu {
 	struct mutex vpu_mutex; /* for protecting vpu data data structure */
 	u32 wdt_refcnt;
 	wait_queue_head_t ack_wq;
-	bool ipi_id_ack[IPI_MAX];
+	bool ipi_id_ack[IPI_VPU_MAX];
 };
 
 static inline void vpu_cfg_writel(struct mtk_vpu *vpu, u32 val, u32 offset)
@@ -296,7 +296,7 @@ int vpu_ipi_register(struct platform_device *pdev,
 		return -EPROBE_DEFER;
 	}
 
-	if (id < IPI_MAX && handler) {
+	if (id < IPI_VPU_MAX && handler) {
 		ipi_desc = vpu->ipi_desc;
 		ipi_desc[id].name = name;
 		ipi_desc[id].handler = handler;
@@ -319,7 +319,7 @@ int vpu_ipi_send(struct platform_device *pdev,
 	unsigned long timeout;
 	int ret = 0;
 
-	if (id <= IPI_VPU_INIT || id >= IPI_MAX ||
+	if (id <= IPI_VPU_INIT || id >= IPI_VPU_MAX ||
 	    len > sizeof(send_obj->share_buf) || !buf) {
 		dev_err(vpu->dev, "failed to send ipi message\n");
 		return -EINVAL;
@@ -748,7 +748,7 @@ static void vpu_ipi_handler(struct mtk_vpu *vpu)
 	s32 id = readl(&rcv_obj->id);
 
 	memcpy_fromio(data, rcv_obj->share_buf, sizeof(data));
-	if (id < IPI_MAX && ipi_desc[id].handler) {
+	if (id < IPI_VPU_MAX && ipi_desc[id].handler) {
 		ipi_desc[id].handler(data, readl(&rcv_obj->len),
 				     ipi_desc[id].priv);
 		if (id > IPI_VPU_INIT) {
@@ -934,7 +934,7 @@ static int mtk_vpu_probe(struct platform_device *pdev)
 #ifdef CONFIG_DEBUG_FS
 	debugfs_remove(vpu_debugfs);
 #endif
-	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_MAX);
+	memset(vpu->ipi_desc, 0, sizeof(struct vpu_ipi_desc) * IPI_VPU_MAX);
 vpu_mutex_destroy:
 	mutex_destroy(&vpu->vpu_mutex);
 disable_vpu_clk:
diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.h b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
index 3951547e9ec5..44ab631ec904 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.h
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.h
@@ -49,7 +49,7 @@ typedef void (*ipi_handler_t) (void *data,
  *			 handle VP8 video encoder job,, and vice versa.
  * @IPI_MDP:		 The interrupt from vpu is to notify kernel to
  *			 handle MDP (Media Data Path) job, and vice versa.
- * @IPI_MAX:		 The maximum IPI number
+ * @IPI_VPU_MAX:	 The maximum VPU IPI number
  */
 
 enum ipi_id {
@@ -60,7 +60,7 @@ enum ipi_id {
 	IPI_VENC_H264,
 	IPI_VENC_VP8,
 	IPI_MDP,
-	IPI_MAX,
+	IPI_VPU_MAX,
 };
 
 /**

-- 
2.43.0

