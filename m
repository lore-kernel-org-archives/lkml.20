Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ECF51DE03;
	Mon,  5 Oct 2026 17:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220721; cv=none; b=WoYctxBdOoICNADbd9mkyZ3Euwc/Ios5hNR0wjwJDXHgIpsOfYK+XtflmC6AAcrnBiZePpbv5UrFbDlRtk2Zkkb6Z5yOXXs5CGd7Lxy9XFamP6PZyR/4IVJqnCM0FOlnnEY0fuqi/OjYC75dLZYpuZLhxscwBwVSAJMG4BFyBFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220721; c=relaxed/simple;
	bh=YHpGbzn0vVGmRYPPCe2SLgd7PKw+FxWKnKr6yNyn8M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qhAshW0DUiWGKOQlWYYadtlNep6UCk2ucfAa/y/xrOfjkXhSucGzYfBvN+GqALbNMVCRhOZC8U646rch/o1cA4CjOjQUAh1vDtyaaP71jRtfLjGBJ6Cejo4s0y+cOvezc14/Wmuu/fCQyZV8vIqUXmRH+vIrwNz+GIPQbnJNHpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgkJZxBs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgkJZxBs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2241F00893;
	Mon,  5 Oct 2026 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220719;
	bh=YA+bwCBeC80tApAQMZG0oM9YlKnPfIL2aczGoT+SQT8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=ZgkJZxBscRybehCEFOnAo/+t7uyz9+4YF2WsrKr340CssJY8ko1wen1O3/i7F2VQ2
	 mvK+egax0vNhdsP7U0qm+RhZGeuUzZ3CbdrcMU5DYT/63ncHkPSYo8XgwmS2Zchk6V
	 k/fl4Id8ZTbg6QHAc52dxNto6tyg4BFzRa9c1+PTEeN8airOcc7yO7zzIeGE/LO/yd
	 Uea84fjan+OrLPFD0AXT8hoxlCsPAIAGLvZgn3EEodT/rAf4AFlvip0tHdIhK+c9DX
	 vNa3FtJv+j6bElEEHWCdyMXEVfSCeHUyj8EPm3z1IEBTBeRG2JX8sUN6db9D6aB6UT
	 efq8hd4agfjxQ==
From: bod@kernel.org
Date: Mon, 05 Oct 2026 19:14:20 +0200
Subject: [PATCH 50/74] media: qcom: camss: vfe: Pass the completion info to
 vfe_buf_done()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-50-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4858; i=bod@kernel.org;
 h=from:subject:message-id; bh=GEuOtQlJldjcXQ8NCmH8PD9m9pajptqhnS98Tt+uwwI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9skNqNqHvEQvoRqg5kExaZmcptXmg9HatZbT
 Ej3HJK6NweJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbJAAKCRAicTuzoY3I
 Oj5BEADAhp2oXH4BT09lCmzRTh88yN2ck0GJbBs8NfuwHMzLVF+RV896/dIpieXSdYKfiCoXhCK
 pZPkLDPyo73cGUDZWL0ombYAXDJtC4EU2/UEbkAsgYXku/Uz8Q/tbGKwBLcCdkO/GHr9XU42TnC
 c4jyXNdR5fePUTGw5PQqVmBVqsZrtkb3Qas1SgRmmFDfshcOUcIpfl5pBRqu/ayCwPhdYaaYVGz
 YcuXJ/qJqoP3aEBF/hwVLHOrmCHbyZM0N2D6zbksnAWYfGrMWH2YfUq7jwgMBKosqsMeSR4WUqf
 u9KLHYjry9w7K87CfFVU2sKstqQGXbu/aEsrLRFG4vLVtNxwDUgBGR2I83Z7Yw9qLVDTUlo581w
 q29yo3Tn7FuxNT47MgNkIdQIBvAvYMh/UHgfUPTLBBGvuADiI3w7NjnMW5wxJhgqdS6bVeJMqJ9
 KSZwJEznSrCJ1Gmyf78Njyhc38ygPlgcOFJ/LDROxqSUWflteTnT/1XV0dQxAlgr7LSVgTxsyqR
 Bge9Kb/Fg/L1M2oKlha8Wl17QURe/Y/2ZeAJM1uEZP9tzW4TwMSsCLcW0rvQSSJIx7LQXNvpLSn
 /j41ci/1MXNufA7zd6aQT0RXj//3d9+1Jg7+7/qyMZybfxjta0q0lCKvvhoTutvO+XDYjfXxXGz
 FEnh5sE7XChLI0w==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

The CSID reports which completion groups finished in the info it passes
to camss_buf_done(). Hand it on to the VFE: the vfe_buf_done() hw op and
the generic vfe_buf_done() take the struct camss_buf_done_info, and the
VFEs that see their own completions, vfe-340 and vfe-480, pass an empty
one.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 7 +++++--
 drivers/media/platform/qcom/camss/camss-vfe-480.c | 9 ++++++---
 drivers/media/platform/qcom/camss/camss-vfe.c     | 2 +-
 drivers/media/platform/qcom/camss/camss-vfe.h     | 6 ++++--
 drivers/media/platform/qcom/camss/camss.c         | 2 +-
 5 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 87f3e8f2ff539..493c4b2e64162 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -203,8 +203,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 		}
 
 		for (i = 0; i < TFE_SUBGROUP_NUM; i++) {
-			if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i))
-				vfe_buf_done(vfe, __subgroup_to_line(i));
+			if (bus_status & TFE_BUS_IRQ_MASK_BUF_DONE(i)) {
+				struct camss_buf_done_info info = {};
+
+				vfe_buf_done(vfe, __subgroup_to_line(i), &info);
+			}
 		}
 
 		if (bus_status & TFE_BUS_IRQ_MASK_0_CONS_VIOL)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe-480.c b/drivers/media/platform/qcom/camss/camss-vfe-480.c
index 6edbd8119aa7d..75dc73eadd6d0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-480.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-480.c
@@ -209,8 +209,11 @@ static irqreturn_t vfe_isr(int irq, void *dev)
 
 		/* Loop through all WMs IRQs */
 		for (i = 0; i < MSM_VFE_IMAGE_MASTERS_NUM; i++) {
-			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i)))
-				vfe_buf_done(vfe, i);
+			if (status & BUS_IRQ_MASK_0_COMP_DONE(vfe, RDI_COMP_GROUP(i))) {
+				struct camss_buf_done_info buf_done_info = {};
+
+				vfe_buf_done(vfe, i, &buf_done_info);
+			}
 		}
 	}
 
@@ -272,7 +275,7 @@ static void vfe_violation_read(struct vfe_device *vfe)
 	/* nop */
 }
 
-static void vfe_buf_done_480(struct vfe_device *vfe, int port_id)
+static void vfe_buf_done_480(struct vfe_device *vfe, int port_id, struct camss_buf_done_info *info)
 {
 	/* nop */
 }
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 6ee9b5024447d..896e8d8e8d8a0 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -621,7 +621,7 @@ u32 vfe_hw_version(struct vfe_device *vfe)
  * @vfe: VFE Device
  * @wm: Write master id
  */
-void vfe_buf_done(struct vfe_device *vfe, int wm)
+void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *buf_done_info)
 {
 	struct vfe_line *line = &vfe->line[vfe->wm_output_map[wm]];
 	const struct vfe_hw_ops *ops = vfe->res->hw_ops;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.h b/drivers/media/platform/qcom/camss/camss-vfe.h
index 06bdc337f4d83..4e99a2c5b33af 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.h
+++ b/drivers/media/platform/qcom/camss/camss-vfe.h
@@ -159,6 +159,7 @@ struct vfe_line {
 };
 
 struct vfe_device;
+struct camss_buf_done_info;
 
 struct vfe_hw_ops {
 	void (*enable_irq)(struct vfe_device *vfe);
@@ -182,7 +183,8 @@ struct vfe_hw_ops {
 			     struct vfe_line *line);
 	void (*vfe_wm_stop)(struct vfe_device *vfe, u8 wm,
 			    struct vfe_line *line);
-	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id);
+	void (*vfe_buf_done)(struct vfe_device *vfe, int port_id,
+			     struct camss_buf_done_info *buf_done_info);
 	void (*vfe_wm_update)(struct vfe_device *vfe, u8 wm, u32 addr,
 			      struct vfe_line *line);
 
@@ -357,7 +359,7 @@ int vfe_enable_v2(struct vfe_line *line);
  * @vfe: VFE Device
  * @wm: Write master id
  */
-void vfe_buf_done(struct vfe_device *vfe, int wm);
+void vfe_buf_done(struct vfe_device *vfe, int wm, struct camss_buf_done_info *buf_done_info);
 
 /*
  * vfe_get_output_v2 - Get vfe output line
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 065d14a872526..123df1d2591e9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5040,7 +5040,7 @@ void camss_buf_done(struct camss *camss, struct camss_buf_done_info *info)
 	if (info->hw_id < camss->res->vfe_num) {
 		vfe = &camss->vfe[info->hw_id];
 
-		vfe->res->hw_ops->vfe_buf_done(vfe, info->port_id);
+		vfe->res->hw_ops->vfe_buf_done(vfe, info->port_id, info);
 	}
 }
 

-- 
2.55.0

