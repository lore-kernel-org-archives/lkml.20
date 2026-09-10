Received: from smtpbgau2.qq.com (smtpbgau2.qq.com [54.206.34.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B28311C15;
	Thu, 10 Sep 2026 03:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.206.34.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789011311; cv=none; b=qaVXHPVwWtkDs3CHY1T89yXUhhEKQ2WaGRa61c/tvNLQccakyUchgy87+TiCFpJPPui6dkLHbzWvkPaHntK4+iPdFu0aqz4w6y8WLL/FN1tZ6B/J34CJ3lk82NXiZ04WZw3snEZtCV/oS+P9yzpNc7R0TzAMvKXniHiWcSzlmgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789011311; c=relaxed/simple;
	bh=uwbLdH4JlMUhHwB9Ehu4aTO25qAW+UrPjFrmpWTCWMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=kELMnwW+IFfxB/yqt/78b6orWuAV6gz+wWtVDY9lYbRjxJ8RFaVLMBWdzmW42icP+pML7wfToMs3C0gV9p0kx3Q8WxRpCsstnFE1TAOCkjXlwD/U1R42dpbsQJViGHqCpoJp/Lh75ZS6xGQs17Xn0XQ/iaseloTR0geEKqI8Op8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com; spf=pass smtp.mailfrom=radxa.com; arc=none smtp.client-ip=54.206.34.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1789011270ta45063a6
X-QQ-Originating-IP: mzJpXuLuvAHubzsSSmDTo7/IgQ5p7XcdOadsdYhpsIM=
Received: from [192.168.30.32] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 10 Sep 2026 11:34:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 6148723628812340598
EX-QQ-RecipientCnt: 9
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 10 Sep 2026 11:34:24 +0800
Subject: [PATCH] media: iris: Add SC8280XP platform data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-sc8280xp-hfi-gen2-v1-1-ea51d0386fdf@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ5FMBCF4VeRWZukGprWq4gFvYOxKOkgEvHue
 ll+Jzn/BUKRSaDOLoh0sPASEoo8Az91YSTkXzJopY1yhULxVlt1rjgNjCMFjc5U3pRlWq2D9Fs
 jDXy+zab9LHs/k9/+IbjvB+19/t11AAAA
X-Change-ID: 20260910-sc8280xp-hfi-gen2-965c64428089
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4474; i=sophon@radxa.com;
 h=from:subject:message-id; bh=uwbLdH4JlMUhHwB9Ehu4aTO25qAW+UrPjFrmpWTCWMM=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmLVB37N4s//3Y6dV7H97iVdpNbnd87HbxoY7L8xOs0F
 qtlF547d5SyMIhxMciKKbIoxDPMZa/MvfZUrFQPZg4rE8gQBi5OAZjIt1sM/8za/qaY3uc4r8nd
 x+Z1wLK5ZJ9mz+xoxY9Zxzl/uk6ceY+RoatJ7fwP7sT+i7kr+hyrZ3+79FXHkidwvaT+F95N29f
 dYwcA
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: M9t1NOw+1P4Gxc7+Av82q/rWjdR0s8eOgMQ8d3wCBYQvXefDu0daImds
	U63W/4ynV96W3Qh6gu5vz3WW0Cyoc35cHxqtoRi6jrYrmbTAtlE0sJ2yRVHRxZlFRcTudCe
	szApwQQThCGTjzAP3IQg7Z9+rKS4UdPFT1kLWKIgezBlVSI8a82BLQ1mkSspz1fDZBpjHz3
	H5png+fx1oOXY2/xgkJoS4GzJ2OxigRMpEQrIodPn/dSlGfgSZqv2OASHMDaOevRzhG7PAw
	Sz9lFG8ZTdxQ4NXPFeA+X794yO8Os5MTzTgzqs32XTLjk51YFPbX+cYi+0ItCya8jha8HBC
	jvrhUvcC8Wkj0iQhGKL6Cl8Zht9BwCz86GAmwaRBYFo/dwntnIADIEqcbcDmv1DLW4+Fbab
	Bb64HRsEFkilyoN0EuvhBI8ADyd6UPYmTBB1F4emraIdFpRzs5Q9re3PA0/E17WyjSZy0pd
	Ci5h5dRqHphREzQgXLfSi20gvn8mH42oE9VwE5HGNndCP9iZuM1MU1d2to2ySi0k9I9s5op
	BWbH3SUvZFQCJhwEDRUWc+Z0ZeQF+7Ni0wcIZAz/jm+H23bI+nJJ8MozapJOMmnVarUyG7J
	XctVKegCg94ifeb01C7GBiKjB3KOTYZ9id3gtvyAS+WdmiaZw1cjV+o+TGFJX/KLL6ngrg4
	pJtrjT+cMJE5Q9vbYNGoTTyQGLQJiPeFB7lmNlZjK0PmfjmPW40ukBUzPFU7gd2fYVKb8k1
	xYHwdg6MKUnHdiHy0rFzPaj6JGgsycLvyuZoCm6VmWwClPfWqMmJhg2Xd9OzYtT/Xqxk89n
	h6ARzzVucXababCr/NUNYk02Nfd4n/G4cxP/FYvG/QHx0vwUayE/HuBcmW304NLisUFwVz+
	FtUXZqwNUhgzQEV05mkraZoh55uTeUjgLj9s6XsnjoRpH8APFTnE4DFt/bY0aKAdP1ZHAHi
	caQNFcGVpuqNS5ztQOSNlmkQMKb7T8gKcuE+hk5Tzq9HhWq3o3SrwW3r1VvuSd70jzefydO
	fvU8w39fvtLID5ACsJsCkYBlD/wS9rtv1oE9KzDw==
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0

Add platform data for the Iris VPU on SC8280XP and hook up the
qcom,sc8280xp-iris compatible.

SC8280XP uses the VPU2 programming model, but can run the newer HFI Gen2
firmware.  Describe both the legacy Gen1 firmware and the Gen2 firmware
so the driver can select the available firmware at runtime.

Set up the SC8280XP clocks, resets, power domains, bandwidth tables,
format list, capabilities and DMA address limit needed by the Iris driver.

Signed-off-by: Xilin Wu <sophon@radxa.com>
---
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_vpu2.c  | 36 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 +++
 3 files changed, 41 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 974809509146..5b5306dcd69f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -57,6 +57,7 @@ extern const struct iris_firmware_data iris_hfi_milos_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
+extern const struct iris_platform_data sc8280xp_data;
 extern const struct iris_platform_data sm8250_data;
 extern const struct iris_platform_data sm8550_data;
 extern const struct iris_platform_data sm8650_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index bbdbf21961d7..e0cca55c0873 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -41,6 +41,12 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 	.fwname = "qcom/vpu/vpu20_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu20_p4_gen2_s6_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu33_buf_size,
+	.fwname = "qcom/vpu/vpu20_p4_gen2_s6.mbn",
+};
+
 static const u32 iris_fmts_vpu2_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -135,6 +141,36 @@ const struct iris_platform_data sc7280_data = {
 	.max_core_mbps = 4096 * 2176 / 256 * 60,
 };
 
+const struct iris_platform_data sc8280xp_data = {
+	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
+	.firmware_desc_gen2 = &iris_vpu20_p4_gen2_s6_desc,
+	.vpu_ops = &iris_vpu2_ops,
+	.icc_tbl = iris_icc_info_vpu2,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu2),
+	.clk_rst_tbl = iris_clk_reset_table_vpu2,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_clk_reset_table_vpu2),
+	.bw_tbl_dec = sm8250_bw_table_dec,
+	.bw_tbl_dec_size = ARRAY_SIZE(sm8250_bw_table_dec),
+	.pmdomain_tbl = iris_pmdomain_table_vpu2,
+	.pmdomain_tbl_size = ARRAY_SIZE(iris_pmdomain_table_vpu2),
+	.opp_pd_tbl = sm8250_opp_pd_table,
+	.opp_pd_tbl_size = ARRAY_SIZE(sm8250_opp_pd_table),
+	.clk_tbl = sm8250_clk_table,
+	.clk_tbl_size = ARRAY_SIZE(sm8250_clk_table),
+	.opp_clk_tbl = sm8250_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xe0000000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu2_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu2_dec),
+	.inst_caps = &platform_inst_cap_vpu2,
+	.tz_cp_config_data = tz_cp_config_vpu2,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
 const struct iris_platform_data sm8250_data = {
 	.firmware_desc_gen1 = &iris_vpu20_p4_gen1_desc,
 	.vpu_ops = &iris_vpu2_ops,
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e4acf4a74f94..5986a5e77986 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -368,6 +368,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,sc7280-venus",
 		.data = &sc7280_data,
 	},
+	{
+		.compatible = "qcom,sc8280xp-iris",
+		.data = &sc8280xp_data,
+	},
 	{
 		.compatible = "qcom,sm8250-venus",
 		.data = &sm8250_data,

---
base-commit: df2908090cda368b01ff43709f51890076c56157
change-id: 20260910-sc8280xp-hfi-gen2-965c64428089

Best regards,
--  
Xilin Wu <sophon@radxa.com>

