Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C47051EDE0;
	Mon,  5 Oct 2026 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220717; cv=none; b=qcreco4eF39cyuJ33Nlf6S5Ohe/ZP7vM3bej4RVpAu7lEgnbLiltcaCqpN7H/4DuDSnW8HF7JrL9phDecmYCCStalJTl2IBA5zoEX0/2vDImblpW1E57psR+Xg6ceUp3R88gQiHIRKqIbKtposPYEYpyEsMKPDRNVoQoAEbv3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220717; c=relaxed/simple;
	bh=FEJxnt28ogvPsoRHFCLN5aRtkNaGj0rurUTKI9UiDG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUqmSMP1lmHMah9ejqU9EBHEovOisF4/TKhrtAz093/4j/CD5lJSdVBHmv/39rAhMbJ6r7/ZZCQSfYSNfulxqQjhaWAwLDVCVtp4ABIbo67/a1l1vNPxc3JScp8vX8RWP4rH+bkhm+0S8uWmzzm97+pc5XCSCzZBgwfeNThYVUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I962Ev0q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I962Ev0q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2F7D1F000FF;
	Mon,  5 Oct 2026 17:18:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220716;
	bh=B0I0XELEZagj1KgKafmUUQXQG8QLknWeTli+aSzE54M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=I962Ev0qkY9VsLgvbgr6mdKgw989+3sAShtqgorO6XM7lqMWbckXWYWAvNh4CiDV5
	 fRNY0aR3aE+1AAzEtPjkeE77GAAyEOwigFiCeDA4lwn2weBQ+/aG6Ru5HMeix97fte
	 m/QjICaAuN26YZ9HX9DHFfLwWJb3KRijFUrVLKqNrruDX9Ua5NF2cXgw1n5ubwAtLA
	 53nmY0mI9pORTpuD9NhmT9o6Okae7Fl+VRvubp+RhYu7AGltCsx/xAcBmt8YvHmXRY
	 YiGlIZDp/uZkdbXoVglMZLx+z6jNmUp3GjTR4rTfxLhSK9wwk7mrJ9vUJTc9iDp+uo
	 BD5DrpWVhecDA==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:19 +0200
Subject: [PATCH 49/74] media: qcom: camss: csid-gen3: Enable the IPP path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-49-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7557; i=bod@kernel.org;
 h=from:subject:message-id; bh=kwBfmFMSnIY5ZATHxz4eMvxBYhIVFVC3TZhUDbUgkqI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sj3ldZ7jqbZuD9UKSNa8miN9G984/66IAfl
 RypQ0BWJlqJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbIwAKCRAicTuzoY3I
 OuDzD/9GVHwWgUiK9MmCmUeWAnrMWCLacwYkCcpa3CxIfOG+agRJUvG0dOyrQdn1O86WiYS95Jh
 fDUOcZ+YWSUgOGQM11vh1aUVO7QScqntKzsxu4sCnu2TG7a0LAMJc/ipYmxTaE+I/DKK3wrgG7v
 m+v+bzxkkgKymBQyfdb2dM2bp5bhEzgQeG3ubnOcaebHbe5Jdg4+ephu/rffyIV1jSm7c2Entrw
 YgmUdcgeOBMyiMewMHihOnzp8Vg8BrFkiXhvY+TT7KDJT6g2231qQBk0Nti8v9KUXrewb8vqxBR
 mUwrL8sJVYPCHBRzLMqceiu4Zm3uJrU/1uioY1o/qhJ6EY/7i2q7oOKrGWgwMXZUYOAuNLJqW3V
 C6MDnH1hic7a2dsTawyhN5a9INenBO6NCGv5TM4IvecKrL+DLRccr7jadXvVpEi/C0VM4VMCRwd
 bZ8mw445omkwQyUAWCU75XjYk76lTJ9GsG+IfiiN0FhM0k3nsY9r8xJcJuVDrihuTvEwDDyCF+I
 dXzfh+r9mHxo9k+KbTmQMiR7I3P9yD8RRWVjpT8QFPxLBl9KHYbHEdrbdsu4W8xt/uhgbViy9bt
 pZ4/HtK1gtNyS/Nr9pQgcGOSRsdRsSKkCAkTlDrq4HdazAUHP2d3JcV7BwaK+xhCfKCGfCxhEQe
 S/fTBmZLSObc3CQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c    | 135 +++++++++++++++++----
 1 file changed, 112 insertions(+), 23 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 3a48bd072e0df..f8406c1fa45a5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -44,6 +44,10 @@
 #define CSID_CSI2_RX_IRQ_MASK		0xA0
 #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
 #define CSID_CSI2_RX_IRQ_SET		0xA8
+#define CSID_CSI2_IPP_IRQ_STATUS	0xAC
+#define CSID_CSI2_IPP_IRQ_CLEAR		0xB4
+#define		CSID_RUP_AUP_IPP	(BIT(0) | BIT(16))
+#define		CSID_RUP_AUP_MUP	BIT(28)
 
 #define IS_CSID_690(csid)	((csid->camss->res->version == CAMSS_8775P) \
 				 || (csid->camss->res->version == CAMSS_8300))
@@ -73,6 +77,18 @@
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
 #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
 
+#define CSID_IPP_CFG0			0x300
+#define		IPP_CFG0_TIMESTAMP_EN		BIT(6)
+#define		IPP_CFG0_DECODE_FORMAT		12
+#define		IPP_CFG0_DT			16
+#define		IPP_CFG0_VC			22
+#define		IPP_CFG0_DT_ID			27
+#define		IPP_CFG0_EN			BIT(31)
+#define CSID_IPP_CTRL			0x304
+#define		IPP_CTRL_START_CMD		BIT(0)
+#define CSID_IPP_CAMIF_FRAME_CFG	0x330
+#define		IPP_CAMIF_PIXEL_PATTERN		24
+
 #define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
 					(0x300 + 0x100 * (rdi)) :\
 					(0x500 + 0x100 * (rdi)))
@@ -157,6 +173,43 @@ static void __csid_configure_wrapper(struct csid_device *csid)
 	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
 }
 
+static bool csid_port_is_ipp(struct csid_device *csid, u8 port)
+{
+	if (csid_is_lite(csid))
+		return false;
+
+	return port == VFE_LINE_PIX;
+}
+
+static void __csid_configure_ipp_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+{
+	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
+	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
+								   csid->res->formats->nformats,
+								   input_format->code);
+	u32 val;
+
+	writel(0, csid->base + CSID_IPP_CTRL);
+
+	/* The IPP decodes pixels for the pixel pipe: real decode format */
+	val = IPP_CFG0_TIMESTAMP_EN;
+	val |= format->decode_format << IPP_CFG0_DECODE_FORMAT;
+	val |= format->data_type << IPP_CFG0_DT;
+	val |= vc << IPP_CFG0_VC;
+	val |= 0 << IPP_CFG0_DT_ID;
+	if (enable)
+		val |= IPP_CFG0_EN;
+	writel(val, csid->base + CSID_IPP_CFG0);
+
+	writel(csid_ipp_bayer_pattern(input_format->code) << IPP_CAMIF_PIXEL_PATTERN,
+	       csid->base + CSID_IPP_CAMIF_FRAME_CFG);
+}
+
+static void __csid_ctrl_ipp(struct csid_device *csid, int resume)
+{
+	writel(resume ? IPP_CTRL_START_CMD : 0, csid->base + CSID_IPP_CTRL);
+}
+
 static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
 {
 	u32 val;
@@ -219,6 +272,8 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	writel(val, csid->base + CSID_RDI_CFG0(port));
 }
 
+static int csid_reset(struct csid_device *csid);
+
 static void csid_configure_stream(struct csid_device *csid, u8 enable)
 {
 	u8 i;
@@ -228,9 +283,16 @@ static void csid_configure_stream(struct csid_device *csid, u8 enable)
 	/* Loop through all enabled ports and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i, 0);
-			__csid_configure_rx(csid, &csid->phy, 0);
-			__csid_ctrl_rdi(csid, enable, i);
+			if (csid_port_is_ipp(csid, i)) {
+				/* the VFE has programmed the pixel pipe in its s_stream */
+				__csid_configure_ipp_stream(csid, enable, i, 0);
+				__csid_configure_rx(csid, &csid->phy, 0);
+				__csid_ctrl_ipp(csid, enable);
+			} else {
+				__csid_configure_rdi_stream(csid, enable, i, 0);
+				__csid_configure_rx(csid, &csid->phy, 0);
+				__csid_ctrl_rdi(csid, enable, i);
+			}
 		}
 }
 
@@ -239,12 +301,21 @@ static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
 	return 0;
 }
 
+#define CSID_780_CUSTOM_PORT_ID_IPP0	0x100 /* TODO: bod don't like this too much */
+
 static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool clear)
 {
+	u32 val;
+
+	if (port_id == CSID_780_CUSTOM_PORT_ID_IPP0)
+		val = BIT(0) | BIT(16) | BIT(28);	/* RUP_IPP0 | AUP_IPP0 | MUP */
+	else
+		val = CSID_RUP_AUP_RDI(port_id);
+
 	if (clear) {
-		csid->reg_update &= ~CSID_RUP_AUP_RDI(port_id);
+		csid->reg_update &= ~val;
 	} else {
-		csid->reg_update |= CSID_RUP_AUP_RDI(port_id);
+		csid->reg_update |= val;
 		writel(csid->reg_update, csid->base + CSID_RUP_AUP_CMD);
 	}
 }
@@ -258,7 +329,6 @@ static void csid_subdev_reg_update(struct csid_device *csid, int port_id, bool c
  */
 static irqreturn_t csid_isr(int irq, void *dev)
 {
-	struct camss_buf_done_info info;
 	struct csid_device *csid = dev;
 	u32 val, buf_done_val;
 	u8 reset_done;
@@ -274,27 +344,43 @@ static irqreturn_t csid_isr(int irq, void *dev)
 	buf_done_val = readl(csid->base + CSID_BUF_DONE_IRQ_STATUS);
 	writel(buf_done_val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
 
-	/* Read and clear IRQ status for each enabled RDI channel */
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
+	/* Read and clear IRQ status for each enabled port */
+	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+		u32 done;
+
+		if (!(csid->phy.en_vc & BIT(i)))
+			continue;
+
+		if (csid_port_is_ipp(csid, i)) {
+			val = readl(csid->base + CSID_CSI2_IPP_IRQ_STATUS);
+			writel(val, csid->base + CSID_CSI2_IPP_IRQ_CLEAR);
+			/* the pixel and statistics completion groups sit below the first RDI bit */
+			done = buf_done_val & (BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET) - 1);
+		} else {
 			val = readl(csid->base + CSID_CSI2_RDIN_IRQ_STATUS(i));
 			writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR(i));
+			done = buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i);
+		}
 
-			if (val & RUP_DONE_IRQ_STATUS)
-				/* clear the reg update bit */
-				csid_subdev_reg_update(csid, i, true);
-
-			if (buf_done_val & BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i)) {
-				/*
-				 * For Titan Gen3, bus done and RUP IRQ have been moved to
-				 * CSID from VFE. Once CSID received bus done, need notify
-				 * VFE of this event. Trigger VFE to handle bus done process.
-				 */
-				info.hw_id = csid->id;
-				info.port_id = i;
-				camss_buf_done(csid->camss, &info);
-			}
+		if (val & RUP_DONE_IRQ_STATUS)
+			/* clear the reg update bit */
+			csid_subdev_reg_update(csid, i, true);
+
+		if (done) {
+			struct camss_buf_done_info info = {
+				.hw_id = csid->id,
+				.port_id = i,
+				.status = done,
+			};
+
+			/*
+			 * For Titan Gen3, bus done and RUP IRQ have been moved to
+			 * CSID from VFE. Once CSID received bus done, need notify
+			 * VFE of this event. Trigger VFE to handle bus done process.
+			 */
+			camss_buf_done(csid->camss, &info);
 		}
+	}
 
 	val = IRQ_CMD_CLEAR;
 	writel(val, csid->base + CSID_IRQ_CMD);
@@ -346,6 +432,9 @@ static int csid_reset(struct csid_device *csid)
 		return -EIO;
 	}
 
+	writel_relaxed(~0u, csid->base + CSID_TOP_IRQ_MASK);
+	writel_relaxed(~0u, csid->base + CSID_BUF_DONE_IRQ_MASK);
+
 	return 0;
 }
 

-- 
2.55.0

