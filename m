Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4904E50C0;
	Mon,  5 Oct 2026 17:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791220700; cv=none; b=dQEICH1hNShFcUpKAptzqYmt7l/2DbLNjFQoKJmnd65ha2FWInukovBkBPSEQJohU/7Yr3/nFMVm8B+r10CC12QWZ9xGPzShjM07/mR3adTHaxvXIuSbtpXtwzpf07mihDwBoDCBl2lCGlKtHdBCm8pFi4dh03xavTYdqBrJnlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791220700; c=relaxed/simple;
	bh=JlZSrFO+wLr4epdqKNW8DMWumfuM0UHKZYfTWrEy2Ao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aSypPpENCgZ354QxdWONuA3l5hmkrN+hXXp50XNC8wqo5nQI7RmVw6Za3OA8YUDXpfq37E797uisu5P4NMsor63quWbtvzFvRArVjGYnIdjFPXk44sdo6fhGvp363Kogi3cZ9n3mXOH8WqdqkpHHFzA1azNdsFdGx/b2rAsq/ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8pYrRlD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8pYrRlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 823C91F00893;
	Mon,  5 Oct 2026 17:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791220698;
	bh=MUVeNMPz6Rq1V975CopaA/fCUUS36WTgtzCKgk/QIN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=l8pYrRlD3sGTjgBnhFqCebPIfEe7IBuSblXLV+0OyNNsoPDPotV1EbW0hZgu26ldH
	 xZuiIf7ved4HWpLucNxN0YDe7QsJIGov99njzKA1QY2VFLiUR8dC6xNBw+CVKzGnUf
	 IGWR8NraYX65IRfxkJQRmW4VcBSxlPfDYUcvGwL5tV1mWy0pQ4zgR0NWUlpjKUOaNt
	 lOrTwVws2L+FxjG1W8r0e546Bf8NQfBb4QuPc7sEjBFjKMYXwf65b4LO03LrDK5LqN
	 97aawHNLqbAPyppBORRWVvtGzLq1PjTEr3yJeUMBi8SogdWHcEBZdE65vopPwQAvQV
	 wVeUPycR9jnEA==
From: Bryan O'Donoghue <bod@kernel.org>
Date: Mon, 05 Oct 2026 19:14:14 +0200
Subject: [PATCH 44/74] media: qcom: camss: vfe-780: Switch on YUV pix path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-44-ed985aefd611@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2323; i=bod@kernel.org;
 h=from:subject:message-id; bh=JlZSrFO+wLr4epdqKNW8DMWumfuM0UHKZYfTWrEy2Ao=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqw9sgq0N2QRHzXHzP5+tRQQGDA5B6vTYmcdg3S
 qAzv+b2tdCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCasPbIAAKCRAicTuzoY3I
 Ou/nD/9EzwEp6X/RCsGlFM30JoyGrYa5hMXngYiuBedgsg+QA1Xb5SLpKoEm89PmEirr7mbAsow
 /zsssvLJITwkvgTq+Py0ONyb0Nkq9PxOZOvzDkxk8zd4zW8wi97+3jNkgJKxAs8Tr0RbnpXPCQC
 OjZPzP2MndhqrmkutGwpm47jjhlBCHZVBt7bH6e5dG0MYX5YTH2RgMl/W7iNzs9h22jhhPlyhfY
 NIC2LXgceGpbXn2/9cWSpdkDhqSfyIZStjqt1Usrbox5timGkVRWnBzTSYKuz8jFphpTEu332zk
 DA8bUd4ZdNGwBV5aGTqsytvtR2yrqc94RKgdqKLE+bbTXRckVS5GuxbVilT8kpJFdJiscekIRZJ
 LjszA4R41kZjMSVmWW9pJzIVAQ/IdjI13RFH05bRYJUitCnhfpz3iU9otZIT+P3mHXUOrMg7K3d
 UkRDAUGdpF9lIrS4B7Y4vZ10ZrFUDwlFKmBJKhH/8AS+M1iwe7e36R2b03IIA6U+Gtt9Ts41olc
 eBb23l+Y67id3pFP9WXEDMSYTv5oBrK1OvsTNHYMmSuSSCngNr6EfIS5QjI/qnf+99K10QYC/74
 EQguyb6zD6F9rGSxMsl29/HEqQ6xzqQdl/oF3tD3PUIOfMG2OTxLCewqywtL15d5Ug1bg44yyP9
 llhP3BDvexH4how==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
---
 drivers/media/platform/qcom/camss/camss-vfe-780.c | 10 ++++++++++
 drivers/media/platform/qcom/camss/camss.c         |  6 +++---
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-780.c b/drivers/media/platform/qcom/camss/camss-vfe-780.c
index 381d053dd9c15..9c20bb8d2e45f 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-780.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-780.c
@@ -178,6 +178,16 @@ static void vfe_subdev_init(struct device *dev, struct vfe_device *vfe)
 	/* RDI2 */
 	vfe_add_rdi(&vfe->line[VFE_LINE_RDI2], VFE_WM_RDI2, VFE_V3_COMP_GRP_16);
 
+	/* PIX YUV: FULL Y + C, one plane each, group 0 */
+	vfe->line[VFE_LINE_PIX].is_pix = true;
+	vfe->line[VFE_LINE_PIX].output[0].wm_num = 2;
+	vfe->line[VFE_LINE_PIX].output[0].wm[0].bus_client = VFE_WM_VIDEO_FULL_Y;
+	vfe->line[VFE_LINE_PIX].output[0].wm[0].plane = 0;
+	vfe->line[VFE_LINE_PIX].output[0].wm[1].bus_client = VFE_WM_VIDEO_FULL_C;
+	vfe->line[VFE_LINE_PIX].output[0].wm[1].plane = 1;
+	vfe->line[VFE_LINE_PIX].output[0].comp_group = VFE_V3_COMP_GRP_0;
+	vfe->line[VFE_LINE_PIX].output[0].type = VFE_OUTPUT_TYPE_PIXEL_YUV;
+
 	return;
 }
 
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 66aa665848fe8..2551f0dfa37bb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3530,7 +3530,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.reg = { "vfe0" },
 		.interrupt = { "vfe0" },
 		.vfe = {
-			.line_num = 3,
+			.line_num = 4,
 			.has_pd = true,
 			.pd_name = "ife0",
 			.hw_ops = &vfe_ops_780,
@@ -3557,7 +3557,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.reg = { "vfe1" },
 		.interrupt = { "vfe1" },
 		.vfe = {
-			.line_num = 3,
+			.line_num = 4,
 			.has_pd = true,
 			.pd_name = "ife1",
 			.hw_ops = &vfe_ops_780,
@@ -3584,7 +3584,7 @@ static const struct camss_subdev_resources vfe_res_sm8650[] = {
 		.reg = { "vfe2" },
 		.interrupt = { "vfe2" },
 		.vfe = {
-			.line_num = 3,
+			.line_num = 4,
 			.has_pd = true,
 			.pd_name = "ife2",
 			.hw_ops = &vfe_ops_780,

-- 
2.55.0

