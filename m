Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3C852B1F3;
	Mon,  5 Oct 2026 17:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220746; cv=none; b=tCMIEDGWgnTHHuvFiEh2tWoI7owdylBLOS8MAtNw+UsklzbqgQ4tNyTXIiqxUlOhJ+J0+z4Mk0Dg1kByT/ONzhToxpif2dz7EFB4q/u+YssOZBD9WyRknW6c03QVnSHCi1UsM7Ri0qTtkKk4ZpSFH7Jk2KKioWJkw/c53wS2CuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220746; c=relaxed/simple;
	bh=YQx2E24H37KHDCZWq3kcW+vkv3CzCm02vcX7KBHxvR4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cZ200SVLdWLotMLoPtuIXPPqKt+C3N8cEGKbp0t6R2G+DXI1RGZukwdRYoH7E/nRA7Y4eo5/6cCXrklWuG23Xk/SfE5zZaZBh7PTlvsG4lmnijPUgUeb15sL+7seSFt5eRKfzBE3JBz5KbDQ6HWFweee2WW8Y7YIhk02dJT+Jls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrkna4Kx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrkna4Kx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4661F00898;
	Mon,  5 Oct 2026 17:19:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220744;
	bh=51Ai9kuTC5+JqhZ0IWJmbPWs6ZuiO4hmUWCBfN+ANNg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=lrkna4KxyYToFSsiKuPxh+ePRd/H/JCEfABldNNn92HI3JSaZon87X2p787Q3zYrc
	 LOB1Zordn4E3HJgqCxWwC/XkOG9YxDixJPl+idwUSSskQFbxKAjzG9H6d3TkqO+bGu
	 W18SpAgjl3xI9cXBYGCUrhxuI1YJ3haMKVFXUkUk9ppAqv02/pdrBYefAJQJipVU99
	 AFYm+WiN7v2kN+v+NHnYrF3w8Y3svMIBJ5tzH45zezrRlIxzJA6c1RrgK0zJt7LsG8
	 X8MMu1WqaE73E09A9vTvI5iY6CEZqNLYVl76G6viVIbAy/9uH6W1Ciov8FFNUin7YI
	 NrBGyCTK9vZhA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:27 +0200
Subject: [PATCH 57/74] media: qcom: camss: vfe-780: Add full-resolution YUV
 on the PIX line
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-57-ed985aefd611@kernel.org>
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, Keke Li <keke.li@amlogic.com>, 
 Richard Acayan <mailingradian@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Gjorgji Rosikopulos <quic_grosikop@quicinc.com>, 
 Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>, 
 Robert Foss <rfoss@kernel.org>, Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6778; i=bod@kernel.org;
 h=from:subject:message-id; bh=Cc9lnPzj6JfHuHhXlmK3Jm2qviH9y+NkaE364HdIFJM=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9spBzvdoFX1WKDlDw2NC+O5pk2D3xZF8iN9r
 w9RaR6d2/KJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbKQAKCRAicTuzoY3I
 Ont/D/9z67K+EiLIPwuXTNO6YhWVFG21D0Pct+ECohTptekIJdvMN9eBcDUEVoXO/4K8HJszn1v
 LZNbDaq124YNg8E4QsMjLXjbO7nqgsNHX3Co5g2b0qWXSSz3T5wnqhLbiSshrXoDZ9l6HGG82VF
 UdsoBWPQ5rJ8+x2/b/UtUkRBDZV71Xsa9nKyy9y4tUf5tSn03JhY3EZXz/XFgDO0GXoeqQg8dBj
 LdGpH7KEN85h0yNh5LeXatspSk243Ur/L0Njttq3z+SLBZoWF4srukJNY7/6Y1YR1U4zoqm6y6p
 IzTb901Ini+VdRlxgKbLB+duiI29j0tg78HD/GgQi/75Qrn1Neo/UG0KhWnJr6Ze8ANRXWA+Z4K
 0TZE90/ss7+m+kTibIuAbtQ2dI3YSBO6yivGvi06GZk+3TUVVWdov/N4cX1v8PXLFIFCPkBBcI7
 i/hKgHW39C8BLrKsreRWJla+UvGJ7gdab9KIV4Zh9r3Y4H03TGr9XLqeeLjpsH4C66osLzbbVzP
 zxVNiolCeQzeQBt2A6Tmn+zXapySMpSM//ygxQzraxjIaR9kpa5/jkSb1+FDupbfzoC8IgyQtMM
 5I/Hqj9FOM69zGhbVKKgeyUz88oMXKFFWlbCwmJh982RZq/N9LuUWEiez9SzD85zmD+mtltaXJs
 R4fDCc2kUX/nj4w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Stream NV12 from the PIX line, with the pixel pipe at its static
defaults:

- vfe_line_prepare() programs the pixel pipe for NV12 through
  vfe_880_setup_pixel_pipe(), outside output_lock and ahead of the write
  masters
- the PIX output's write masters, FULL Y and FULL C, are programmed per
  plane from the output descriptor: CbCr at half height and the same
  stride, frame based, no frame drop
- buffer addresses are written per plane, addr[1] being the CbCr plane
  camss-video derives for NV12
- the PIX line's reg update goes through the CSID IPP port
  (CSID_780_CUSTOM_PORT_ID_IPP0), and the RDIs through their own ports
  as before

RDI outputs take the one-write-master, plane-0 case of the same stop and
update loops.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 87 +++++++++++++++++++----
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index d70e829524fdf..1d00a3656d7c3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -10,7 +10,9 @@
 #include <linux/iopoll.h>
 
 #include "camss.h"
+#include "camss-csid-gen3.h"
 #include "camss-vfe.h"
+#include "camss-vfe-880-pp.h"
 
 typedef enum {
 	VFE_WM_VIDEO_FULL_Y = 0,
@@ -67,6 +69,7 @@ typedef enum {
 #define VFE_BUS_WM_FRAME_INCR(n)	(BUS_REG_BASE + 0x208 + (n) * 0x100)
 #define VFE_BUS_WM_IMAGE_CFG_0(n)	(BUS_REG_BASE + 0x20c + (n) * 0x100)
 #define		WM_IMAGE_CFG_0_DEFAULT_WIDTH	(0xFFFF)
+#define VFE_BUS_WM_IMAGE_CFG_1(n)	(BUS_REG_BASE + 0x210 + (n) * 0x100)
 #define VFE_BUS_WM_IMAGE_CFG_2(n)	(BUS_REG_BASE + 0x214 + (n) * 0x100)
 #define		WM_IMAGE_CFG_2_DEFAULT_STRIDE	(0xFFFF)
 #define VFE_BUS_WM_PACKER_CFG(n)	(BUS_REG_BASE + 0x218 + (n) * 0x100)
@@ -79,6 +82,38 @@ typedef enum {
 #define VFE_BUS_WM_MMU_PREFETCH_CFG(n)		(BUS_REG_BASE + 0x260 + (n) * 0x100)
 #define VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(n)	(BUS_REG_BASE + 0x264 + (n) * 0x100)
 
+/* One write master per plane of the PIX output: Y, then CbCr at half height */
+static void vfe_wm_start_pix(struct vfe_device *vfe, struct vfe_line *line)
+{
+	struct vfe_output *output = &line->output[0];
+	struct v4l2_pix_format_mplane *pix = &output->video_out.active_fmt.fmt.pix_mp;
+	unsigned int i;
+
+	for (i = 0; i < output->wm_num; i++) {
+		u8 wm = output->wm[i].bus_client;
+		u8 plane = output->wm[i].plane;
+
+		writel((pix->height >> plane) << 16 | pix->width,
+		       vfe->base + VFE_BUS_WM_IMAGE_CFG_0(wm));
+		writel(0, vfe->base + VFE_BUS_WM_IMAGE_CFG_1(wm));
+		writel(pix->plane_fmt[0].bytesperline,
+		       vfe->base + VFE_BUS_WM_IMAGE_CFG_2(wm));
+		writel(0x3, vfe->base + VFE_BUS_WM_PACKER_CFG(wm));
+
+		/* no dropped frames, one irq per frame */
+		writel(0, vfe->base + VFE_BUS_WM_FRAMEDROP_PERIOD(wm));
+		writel(1, vfe->base + VFE_BUS_WM_FRAMEDROP_PATTERN(wm));
+		writel(0, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PERIOD(wm));
+		writel(1, vfe->base + VFE_BUS_WM_IRQ_SUBSAMPLE_PATTERN(wm));
+
+		writel(1, vfe->base + VFE_BUS_WM_MMU_PREFETCH_CFG(wm));
+		writel(0xFFFFFFFF, vfe->base + VFE_BUS_WM_MMU_PREFETCH_MAX_OFFSET(wm));
+
+		/* frame based */
+		writel(WM_CFG_EN, vfe->base + VFE_BUS_WM_CFG(wm));
+	}
+}
+
 static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
 	struct v4l2_pix_format_mplane *pix =
@@ -91,6 +126,11 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 	writel(0x0, vfe->base + VFE_BUS_WM_TEST_BUS_CTRL);
 
+	if (line->is_pix) {
+		vfe_wm_start_pix(vfe, line);
+		return;
+	}
+
 	writel(ALIGN(pix->plane_fmt[0].bytesperline, 16) * pix->height >> 8,
 	       vfe->base + VFE_BUS_WM_FRAME_INCR(wm));
 
@@ -114,36 +154,58 @@ static void vfe_wm_start(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 
 static void vfe_wm_stop(struct vfe_device *vfe, u8 wm, struct vfe_line *line)
 {
-	wm = line->output[0].wm[0].bus_client;
-	writel(0, vfe->base + VFE_BUS_WM_CFG(wm));
+	struct vfe_output *output = &line->output[0];
+	unsigned int i;
+
+	for (i = 0; i < output->wm_num; i++)
+		writel(0, vfe->base + VFE_BUS_WM_CFG(output->wm[i].bus_client));
 }
 
 static void vfe_wm_update(struct vfe_device *vfe, u8 wm, struct camss_buffer *buffer,
 			  struct vfe_line *line)
 {
-	u32 addr = buffer->addr[0];
+	struct vfe_output *output = &line->output[0];
+	unsigned int i;
 
-	wm = line->output[0].wm[0].bus_client;
+	/* camss-video sets addr[1] = addr[0] + bytesperline * height for NV12 */
+	for (i = 0; i < output->wm_num; i++) {
+		u32 addr = buffer->addr[output->wm[i].plane];
 
-	writel((addr >> 8), vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
+		wm = output->wm[i].bus_client;
+		writel(addr >> 8, vfe->base + VFE_BUS_WM_IMAGE_ADDR(wm));
 
-	dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
-		wm, addr);
+		dev_dbg(vfe->camss->dev, "wm:%d, image buf addr:0x%x\n",
+			wm, addr);
+	}
 }
 
-static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+/* The PIX line is latched through the CSID's IPP path, RDIs through their own */
+static int vfe_reg_update_port(struct vfe_device *vfe, enum vfe_line_id line_id)
 {
-	int port_id = line_id;
+	return vfe->line[line_id].is_pix ? CSID_780_CUSTOM_PORT_ID_IPP0 : line_id;
+}
 
-	camss_reg_update(vfe->camss, vfe->id, port_id, false);
+static void vfe_reg_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	camss_reg_update(vfe->camss, vfe->id, vfe_reg_update_port(vfe, line_id), false);
 }
 
 static inline void vfe_reg_update_clear(struct vfe_device *vfe,
 					enum vfe_line_id line_id)
 {
-	int port_id = line_id;
+	camss_reg_update(vfe->camss, vfe->id, vfe_reg_update_port(vfe, line_id), true);
+}
+
+/*
+ * Program the pixel pipe outside output_lock, before the write masters and
+ * the IPP reg update that latches both.
+ */
+static void vfe_line_prepare(struct vfe_line *line)
+{
+	struct v4l2_pix_format_mplane *pix = &line->output[0].video_out.active_fmt.fmt.pix_mp;
 
-	camss_reg_update(vfe->camss, vfe->id, port_id, true);
+	if (line->is_pix && pix->pixelformat == V4L2_PIX_FMT_NV12)
+		vfe_880_setup_pixel_pipe(to_vfe(line), pix->width, pix->height);
 }
 
 static const struct camss_video_ops vfe_video_ops_780 = {
@@ -209,6 +271,7 @@ const struct vfe_hw_ops vfe_ops_780 = {
 	.subdev_init = vfe_subdev_init,
 	.vfe_disable = vfe_disable,
 	.vfe_enable = vfe_enable_v2,
+	.vfe_line_prepare = vfe_line_prepare,
 	.vfe_halt = vfe_halt,
 	.vfe_wm_start = vfe_wm_start,
 	.vfe_wm_stop = vfe_wm_stop,

-- 
2.55.0

