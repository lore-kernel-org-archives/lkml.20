Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794263927;
	b=VvqM04wsXxoNx2b23wzFTCVmclU8AOuNAEOb51edqA6hXrItSeygqMGWf2uBPRgGX7Ra
	 twSCQBQKMy9kzo8sYHBb6s+uQoPCJH646fpTtz3VRzs1c4EN7MvNvZ523nE6REV0jm6ZD
	 Afbt8uANAi4nB1W5HPVYnbQcOHXUId7GgQbr/udKiKWEo4cThKzwioH+jr0GPtSP6HsRX
	 zMEcNSqTA1/YsGYXDsAeeemADT1gthIp2x9A5Bu/AdWdGvurgcdZWaOVB+7ntFVmWL5Ex
	 6UB1tp0YUJGtupueYS9b74to/1fDLvzVSyKqHRvnHM23gVPg1AkzkEJ73fZNKDwv/vg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794263927;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nhoHj9wxKOWE0684qQSTtyjmkkOXGorTgPJgBZKFxRM=;
	b=Xqpq6QMp5Sf4XZmZJRxS428FiJep/n/8vBR2XyLBXqtsmc6vKWygHkvn2G4GdRUd27su
	 oEfa8rHbyHyyaauFE/ImGija8stQDERuPUgerz6ekYoLbqHq6bgdG0t4O56sCymk2l9OO
	 yAvzRSkDGyQljEHjjxOEfZ/0W18V8oo8seCbfyMV3mHMBQDaMpSrC5Z4p/rKEWO63aH/X
	 GP0QOV9fH+X9adwN4wCXgXrqoRJhG+pWA5xCMhiy6iGZOTOYZvdl+a8Hb7RAvjY7fkS+I
	 KKf6xzjQuMPGRin0F8wZl7EMSmEGX8Oa473CAwZBR8pUPsrbW8QL2vt6tQw9g5ICu/g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlXOrYtt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84527606A338;
	Mon,  9 Nov 2026 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MlXOrYtt
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794263927;
	b=rU2Ox3KkkQaKYnzfzz6Q1LhAZ0U35ZGeSQKQpxxOoHMG4AHv6zaJnB8dkbqbIoVjIQZl
	 0o7tLKCSL/K7sMCPqEDYGOQ4XXEv5jU6bGE+PKjOyPdRwByB1dspic9FYXylgqhRUvR7/
	 HI8hrcW3h+OUE/OJZcjRfmKx96BIyX1l0Djqsq1RKB1tg/uj758iupSiATarpX1LFzrTI
	 wnEkZ2kAyi8zJwYAeTS9WttLlqgoK4kedWFGAPdUyXfRO9fOoWUuNx51gnRwUZGR6WVQ4
	 8S71YA2i9V7dkz9FFNmK9aOJDV1L/m6g/tcBv3mRmfgyjgsryhYBsI9Z/JBVdpIl5RA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794263927;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=nhoHj9wxKOWE0684qQSTtyjmkkOXGorTgPJgBZKFxRM=;
	b=YhMwNZIS4+oVXHw4rYOa/Wvs4hrL4sRUWre4Pv4fPwnIDDzqlZRMv4rT3op+RiPgMgK3
	 bGWlJ5yuP2n/QeNsN7CDUqmdYpVtc5VDqTWgJc7kEq+NPDtSNZUKAEE8FrEcbyTrJkfn4
	 y9FoDrY4oIqZ9OqAGAcFfs/dAop6u/VQ/PigFjV4if7gEpAeEta+po3N9iwNr8ITZ7UIl
	 oLd3SJfI+F2qTtnOJfStBCJyoRCPN1UvgzaxYT2Pgkj5hqrfUKqWTvsWpAp+glbVEyIYI
	 ACiXE6Vf/ZIXlLjfkIoUOaXKZTw7C4GhOXFa/PsgSPmog9JG4H2P9Nmrm294yJOA8lQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AA15E1F008A2;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794263927;
	bh=nhoHj9wxKOWE0684qQSTtyjmkkOXGorTgPJgBZKFxRM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=MlXOrYttLyy/rfvlDgy9nxF8AuLZJQHm6a3Gt6oonaueRKBFkom8tkKn7BB7Xd7XN
	 +BRxAPzMCL95YSmRYGaD2ujHsmH1NFk9QA5gYPlMmEhglETyq9J3z4t2gtjE0gkgkz
	 lkv858hw6xUrFCDdpOPLUMK7whR5OS30uA9xcWGeKGxUpSr9UWe24YJcedSKqrQ5kP
	 LzgsrDyckF+podwy87ZfmkMQMrK7NvqG3SdKABcyy2fpD83ixzW60Se2KlPiyT4S3W
	 Wq0FRYqPcZX2WRcaoySRlqRel+Ei3h09+eLNeEoQINywNq8LUQvyWpE36HH/xvnOgH
	 L8HpTFkCa9IOw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 31EB9486C7;
	Mon,  9 Nov 2026 22:38:43 +0000 (UTC)
From: Gaurav Suman via B4 Relay <devnull+gauravsuman007.gmail.com@kernel.org>
Date: Mon, 09 Nov 2026 22:38:20 +0000
Subject: [PATCH 2/8] media: qcom: camss: Add SM8150 support
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
Message-Id: <20261109-sm8150-camera-v1-2-3d2e7b407516@gmail.com>
References: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
In-Reply-To: <20261109-sm8150-camera-v1-0-3d2e7b407516@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gaurav Suman <gauravsuman007@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794263921; l=14748;
 i=gauravsuman007@gmail.com; s=default; h=from:subject:message-id;
 bh=6ZQ6VviKYnXXWuPKJK9iWwrOXNoI2mwR3OpcvUWhR2w=;
 b=ADsdxAM5TmoPbkLKSXi4zjOfyJi1kLgIx9m8Zzc9gDPQ3jIMiOvMKjMIVEyNqbKedTDcBEK5O
 Cfg9SAKqWX6D29DMsWimtSfNdkMxaBldvf+i9A/79kbXvoVJhx8tfZq
X-Developer-Key: i=gauravsuman007@gmail.com; a=ed25519;
 pk=lnUC0mQfc0KyA0LE73pQ4+QWYVRaCD8Sd3XWxLZO+JY=
X-Endpoint-Received: by B4 Relay for gauravsuman007@gmail.com/default with
 auth_id=1467
X-Original-From: Gaurav Suman <gauravsuman007@gmail.com>
Reply-To: gauravsuman007@gmail.com
Content-Transfer-Encoding: 7bit

From: Gaurav Suman <gauravsuman007@gmail.com>

Add the SM8150 (Titan 175) camera subsystem. The CSID, VFE and bus
blocks are the same as on SM6150/SDM845 (Titan 17x), so the gen2 CSID
and VFE 17x code is reused, but SM8150 needs its own resources:

 - four CSIPHYs, four CSIDs and four VFEs (two of each are lite),
 - clock rates from the SM8150 camera clock controller tables,
 - camnoc_axi at 400 MHz. At its 19.2 MHz boot rate the VFE gets a
   start of frame and one reg update but never a buffer done,
 - the CSIPHY v1.1 lane settings (downstream cam_csiphy_1_1_hwreg.h).
   The SM6150 entry uses the QCM2290 v1.2 table; with it the sensor
   streams but the CSID never sees data.

Tested on an LG G8x ThinQ with three sensors on CSIPHY0, 1 and 2 (4
lanes each, up to 1190 Mbps per lane): 30 fps RAW10 through CSID0
and VFE0 RDI0, with libcamera's simple pipeline handler.

This was written and tested with the help of an AI coding assistant
(Claude Opus 5.5, Anthropic); I reviewed the change and the results.

Signed-off-by: Gaurav Suman <gauravsuman007@gmail.com>
---
 .../platform/qcom/camss/camss-csiphy-3ph-1-0.c     |  80 +++++++
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 250 +++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h          |   1 +
 4 files changed, 333 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index dac8d2ecf79957dc05c5524dc439791ce097c785..3d8992d5dbc7bfd1f7447303f44386e67d90b830 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -144,6 +144,81 @@ csiphy_lane_regs lane_regs_sa8775p[] = {
 	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+/* SM8150 (Titan 175): CSIPHY v1.1, 2-phase lane settings */
+static const struct
+csiphy_lane_regs lane_regs_sm8150[] = {
+	{0x0004, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x002C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0034, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x001C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0014, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0028, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x003C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0000, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0008, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x000C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0010, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0038, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0060, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0064, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0704, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x072C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0734, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x071C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0714, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0728, 0x04, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x073C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0700, 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0708, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x070C, 0xA5, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0710, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0738, 0x1F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0760, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0764, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0204, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x022C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0234, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x021C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0214, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0228, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x023C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0200, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0208, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x020C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0210, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0238, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0260, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0264, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0404, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x042C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0434, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x041C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0414, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0428, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x043C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0400, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0408, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x040C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0410, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0438, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0460, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0464, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0604, 0x0C, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x062C, 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0634, 0x0F, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x061C, 0x0A, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0614, 0x60, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0628, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x063C, 0xB8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0600, 0x90, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0608, 0x0E, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{0x060C, 0x00, 0x00, CSIPHY_DNP_PARAMS},
+	{0x0610, 0x52, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0638, 0xFE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0660, 0x00, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x0664, 0x7F, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
 /* GEN2 1.0 2PH */
 static const struct
 csiphy_lane_regs lane_regs_sdm845[] = {
@@ -1131,6 +1206,7 @@ static bool csiphy_is_gen2(u32 version)
 	switch (version) {
 	case CAMSS_2290:
 	case CAMSS_6150:
+	case CAMSS_8150:
 	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
@@ -1221,6 +1297,10 @@ static int csiphy_init(struct csiphy_device *csiphy)
 		regs->lane_regs = &lane_regs_sdm845[0];
 		regs->lane_array_size = ARRAY_SIZE(lane_regs_sdm845);
 		break;
+	case CAMSS_8150:
+		regs->lane_regs = &lane_regs_sm8150[0];
+		regs->lane_array_size = ARRAY_SIZE(lane_regs_sm8150);
+		break;
 	case CAMSS_2290:
 	case CAMSS_6150:
 		regs->lane_regs = &lane_regs_qcm2290[0];
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..4f89e8901d530410b243581d3953b6b023a8c7c3 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -343,6 +343,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_660:
 	case CAMSS_2290:
 	case CAMSS_6150:
+	case CAMSS_8150:
 	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8x96:
@@ -2004,6 +2005,7 @@ static int vfe_bpl_align_rdi(struct vfe_device *vfe)
 
 	switch (vfe->camss->res->version) {
 	case CAMSS_6150:
+	case CAMSS_8150:
 	case CAMSS_6350:
 	case CAMSS_7280:
 	case CAMSS_8250:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a98fc6a20fdb8e0f9f8e61bc41058..bda61bf1f573965e662c00545bc207f5a30867b9 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5699,6 +5699,255 @@ static const struct camss_resources sdm845_resources = {
 	.vfe_num = ARRAY_SIZE(vfe_res_845),
 };
 
+static const struct camss_subdev_resources csiphy_res_sm8150[] = {
+	/* CSIPHY0 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy0" },
+		.interrupt = { "csiphy0" },
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY1 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy1" },
+		.interrupt = { "csiphy1" },
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY2 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy2", "csiphy2_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy2" },
+		.interrupt = { "csiphy2" },
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+	/* CSIPHY3 */
+	{
+		.regulators = {
+			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 35000 },
+			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 5000 }
+		},
+		.clock = { "csiphy3", "csiphy3_timer" },
+		.clock_rate = { { 400000000 },
+				{ 300000000 } },
+		.reg = { "csiphy3" },
+		.interrupt = { "csiphy3" },
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		}
+	},
+};
+
+static const struct camss_subdev_resources csid_res_sm8150[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "vfe0_cphy_rx", "vfe0_csid" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000, 600000000 } },
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "vfe1_cphy_rx", "vfe1_csid" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000, 600000000 } },
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite0_cphy_rx", "vfe_lite0_csid" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000, 600000000 } },
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "vfe_lite1_cphy_rx", "vfe_lite1_csid" },
+		.clock_rate = { { 400000000 },
+				{ 400000000, 480000000, 600000000 } },
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen2,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
+static const struct camss_subdev_resources vfe_res_sm8150[] = {
+	/* VFE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+			   "vfe0", "vfe0_axi" },
+		.clock_rate = { { 0 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 558000000, 637000000, 847000000, 950000000 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+			   "vfe1", "vfe1_axi" },
+		.clock_rate = { { 0 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 400000000, 558000000, 637000000, 847000000, 950000000 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+			   "vfe_lite0" },
+		.clock_rate = { { 0 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 320000000, 400000000, 480000000, 600000000 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.regulators = {},
+		.clock = { "gcc_axi_hf", "camnoc_axi", "cpas_ahb", "slow_ahb_src",
+			   "vfe_lite1" },
+		.clock_rate = { { 0 },
+				{ 400000000 },
+				{ 0 },
+				{ 0 },
+				{ 320000000, 400000000, 480000000, 600000000 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.hw_ops = &vfe_ops_170,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+};
+
+static const struct resources_icc icc_res_sm8150[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 38400,
+		.icc_bw_tbl.peak = 76800,
+	},
+	{
+		.name = "hf_0",
+		.icc_bw_tbl.avg = 2097152,
+		.icc_bw_tbl.peak = 2097152,
+	},
+};
+
+static const struct camss_resources sm8150_resources = {
+	.version = CAMSS_8150,
+	.pd_name = "top",
+	.csiphy_res = csiphy_res_sm8150,
+	.csid_res = csid_res_sm8150,
+	.vfe_res = vfe_res_sm8150,
+	.icc_res = icc_res_sm8150,
+	.icc_path_num = ARRAY_SIZE(icc_res_sm8150),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_sm8150),
+	.csid_num = ARRAY_SIZE(csid_res_sm8150),
+	.vfe_num = ARRAY_SIZE(vfe_res_sm8150),
+};
+
 static const struct camss_resources sm6150_resources = {
 	.version = CAMSS_6150,
 	.pd_name = "top",
@@ -5824,6 +6073,7 @@ static const struct of_device_id camss_dt_match[] = {
 	{ .compatible = "qcom,sdm845-camss", .data = &sdm845_resources },
 	{ .compatible = "qcom,sm6150-camss", .data = &sm6150_resources },
 	{ .compatible = "qcom,sm6350-camss", .data = &sm6350_resources },
+	{ .compatible = "qcom,sm8150-camss", .data = &sm8150_resources },
 	{ .compatible = "qcom,sm8250-camss", .data = &sm8250_resources },
 	{ .compatible = "qcom,sm8550-camss", .data = &sm8550_resources },
 	{ .compatible = "qcom,sm8650-camss", .data = &sm8650_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7dc2fd9f03e0dc2ded8e4a603d6cfec4d8e6a62b..74d8cc2921be9da7673494cd0785c8f9b90b4a3e 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -89,6 +89,7 @@ enum camss_version {
 	CAMSS_8x39,
 	CAMSS_8x53,
 	CAMSS_8x96,
+	CAMSS_8150,
 	CAMSS_8250,
 	CAMSS_8280XP,
 	CAMSS_8300,

-- 
2.49.1


