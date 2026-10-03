Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 598C039A4D6
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018160; cv=none; b=QCto/yiOjMyRCyHWxJYztbDy3YNxXhi0iFupoODsU2wvefKLKr0bCiyuzKyCon0VYFLXIeB1PtMNWIyWOc8qui8jX8l07Fv43KubhbVvVhp59miM168PygfS+0JgmPx9cQL02eU+l+FDTmZODQt95zbIdDVAbkl2EL5my9Jpuqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018160; c=relaxed/simple;
	bh=CBTZPH5nNqRbSIFimjVHiKTwtWtEsPK6VMai+/nUPtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avOffzX/SqVmTh/IyXSXNm7eclmsMo7+MCtjR++cWnXEC4SNKL5ofJmc7iRlT1HP3f9Sg9YavT3sbTex0RK2q9s0Q96NUQ7L6XEusHX5NCZLbbpj30MKIxYl38Bx5sbquIb+Ms68kWOgE7XKxdXoLACHG1YYNSP1UxMYEML6dnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ouYizifQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OeuZGvxA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ouYizifQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OeuZGvxA"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933IUtA3629076
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zGGWlPUDb3bfeHhoicMWJRnksmpfuUxoNxOSlwcoEWE=; b=ouYizifQY+9BxdYy
	D35sLXnO9O7DWS7mmw5zMVKK7lWHnDM5nsotex3uuaSghvrW1T/RwuV28D02yJRY
	2I10MbiyUF5zsVMHXYmBe0yiidOPZtCCsM0NtYdKfIK+v6qc/nWrT7dwSrGNtrex
	WiqA/n22xd6BABrLWzkPLmEyaU80Anw6ms7Y5mdoJZ6shzCIXqdhKBtT3q29672/
	kL1yULrDA3GHuSweToRMaV+8mlJnGBesDxZaNWirlNx3R07FrnXJn1LwREieu9ti
	UGxoc7/kbJoCl3au+7CYhRWNn4zOSwg/XTaatmOp+t6L27LiPvMYj7KVJQ3aK4YJ
	fjJPcQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2spa0h6y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:35 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso152483eec.1
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018155; x=1791622955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zGGWlPUDb3bfeHhoicMWJRnksmpfuUxoNxOSlwcoEWE=;
        b=OeuZGvxAe/BuQxsC0+6CyW2cPwnAxnTVyO9cvud09CUFYga554i0RNwnphk9XKuFsB
         2XoolVe+oc0cxdFP138Cea+oEqapn/1RxSI8dRJmuHd8y8SrzS82ov4XMcLcIATGF0k5
         zKormIwXXd66seWtrC21IZh4X/6OD5RMevcF9q90lNQHdrAOvILQ6cHQbruPVzYD9GZu
         luROLvQ2YNTzXE1qZGhq16kpodYM1nMI4u0V3e5tnrT/NgI3WWi31ywRMTM2zN2F3j99
         mwPMBHILduutA7YcjPZtbrB9ByEju3WJjC5yWI0OLoCjIeqyhTD5OJtppl9/cCFwQlWG
         E7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018155; x=1791622955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zGGWlPUDb3bfeHhoicMWJRnksmpfuUxoNxOSlwcoEWE=;
        b=wWHXwa4lQIqdUqzZ/GjaHWrJ56DBW0ZxUQ15TSFJaJkJ3SQCOodXPeXWVmBvMfATmO
         6nJhNxkV9S6SMqp6VAlD8UlzinHMQtsPS1G8NKySf1kWlQjr9ssWCebGfTxQBRV3ME+1
         FgHc4JQzyHZCos8T7Wy5VmJJ1VHyL/gzmiBqdQ+9nc2QCATl3iniZE9FjNWW+C3t6T8r
         Yoev38mfHwkwTnv2odBFrmk1LJuxZIF+Hh9xPEoExmvwv3RbeDQs6WwA2xnBo8N1Osc4
         Pfy5kV2SuWkHfYOrwKOn23tCqhmSjJGNvQ7GFlQGZXF0dKoo6stXlbA1AkKJaItUC6qb
         QBzg==
X-Forwarded-Encrypted: i=1; AKwUvByVh+dVwUdkjxtyLBrCn5wdXvi9A602RrjMXIPL6I14YYwGKFECZHlzIqxXK7gDtTqYE5ne3tOF3JWQbyM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJp1mFWKiVVVjauppGrGG8FNVw+NAKuqgeGF6CmUmKsxLvAacTp
	qO87DrR0Qi9HumlcwqF9kOuQfzQuUX1mZKAEdrgfw5Enp84NPB9+1a8/qzF60/YpcEIC9HXZy5x
	BHvsqIRYCCxhEkmYP6M2Yytwj8Qud+pNJPYEYD6lJWu7TCXy5EkX7G1qE0mr2EbYr6u4=
X-Gm-Gg: AYBFou2YJtRXy4D9MWiqltNl18FxmXzZsNs+K8qoxKF6BTothKCJ4sma9zUrwUOsiFD
	VYjwK/4kUtxUc9gm3Ab+7vGpbdlU9OZ03d/WOeUceiavk8nSUBPadni++2FgwPKqXVbe4Dc/GiH
	jouiSxn38pJQtnaiJD23lKBlyoZIwEC3DdbCWaZVRYm8ERj/SrAvQxPqp4MUGX0rgnKetqd5qjO
	hEzFhqo1bahAUmaBW+gLgD3EIZMVMACZUoXrMemTN+zTOYieeHL8yo/7En4KXh/HbRQEcuYbdA6
	Ivk/RbF0/5ffPCI+vZdpUr6qZEG8QEiHbcDBf/2RM8QUs3m8KFF5drMKOxjczy82AHsKz1ntY9l
	kiJLXDEtm49H+GXBlG0alXvLH4qM35NaeU/wTmc5SocQPENMmmJ32jyeH3/R6JmUXXYtT1YhDlR
	GwKAx08RJbTw==
X-Received: by 2002:a05:7301:1885:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34f150eeca0mr4897689eec.24.1791018154320;
        Sat, 03 Oct 2026 02:02:34 -0700 (PDT)
X-Received: by 2002:a05:7301:1885:b0:339:7572:7b2b with SMTP id 5a478bee46e88-34f150eeca0mr4897648eec.24.1791018153703;
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:33 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:16 -0700
Subject: [PATCH v18 05/11] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-5-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX5vJNGUgnIoQo
 SeaoouGNaDHudo/aLZ2cQFrvJ4bwlJFNb7t1zt6tsvERiwUPMsl260b44if4uuICnlcAsiveGWg
 MxCwmbDZWy8imps9Xg4m3bmqDlNh94Mx62i473wjelSVIb0AnSE+oZm6J9jo9SKcb9Ghm/QrnkZ
 yDj1fnSgk3RloqzOtMyCpd0lUwB0qQ2HdCXWbGhJnxfTsirkFs0b6DBejd4caGNCCeFV6HLPBST
 PrzxLXVMnSvsneeXqieuS2qiZA8eFNT3oGKKVba7NVxC2K5ecd6qupnB7e/2ucuxApdqOAhY5Wd
 resLBaugyRHfxr3rfGTDsKogsN4GxjNmsayFDxJ1BfD5ry0AIC8mfL00Fv9UlFbAhorvbNYrgpA
 QDAyQSTb4ZlYlSPOfpoN+2wBRvZvHN8rJdrgqDvByZ6dav/gtW4LIg/52jwAbZA+SyLs6WwxdXG
 jAhuTWuaxdGEwbd3KsA==
X-Authority-Analysis: v=2.4 cv=b7MncdGx c=1 sm=1 tr=0 ts=6ac0c4ab cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: XZ_1AMENnsmEz1HDZn-UTQpaO81-Vwbj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX8sdW1xvWgHTM
 fnZceVrTslsbgpfnahyd/gEZTSMX/e5LDKDrdGO+met3NcgjQhLthC5Z/b5WJE0R90O6PVHBhES
 z0yju35eIC6G43f+L08716lK+7X1cU0=
X-Proofpoint-GUID: XZ_1AMENnsmEz1HDZn-UTQpaO81-Vwbj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610030035

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index fca3de214a92..9bd0dc7a7f9e 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,57 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5593,8 +5644,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

