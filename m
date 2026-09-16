Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 835894F0535
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554646; cv=none; b=EQOMIp+787/FNmyd7D01NELJp4/fht49oIBmloC9PRULduZFOz0/1Tp8oHI6knmM5aHr7CpJnuk8kR9V6TAIJxRn85q4sX15HoEmMcndqLW+0mXkJciWEhIilKU1PgEsEdJ1j3oXbff0L3TQevBC3fkaABwxx0PxTjXyg4jcujI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554646; c=relaxed/simple;
	bh=2UaU7R3Klsyvl2wWmbPnmjteeasW2un+bpN/PVjJb6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CSAYLhQSGaQGj80qjcNIj/Uan0Ab0YQApOIwDFBRrNuVGvFNQ7Uhr+1XTwEE2BUIctAIvYShpgZJC1SZ5yHKWZJfwgqdYG8EIjKAZn+LASmSh8UY2tL9saq2twFj/IbxClQfn/09aWq/0hY+u07o02rJKlrlaK6+zmTWvi3BJdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEd6gRct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiKfnHt1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEd6gRct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiKfnHt1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93AOe2658235
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1Sf97NFKUaUqW6VmDXtLv92KAWnBnsE42F8yV4CgO4=; b=DEd6gRctHCbTpgrU
	9y22YIuK5oDurM/X90Nfm/M8p0c6LYabztYeFHWI7IrzZ5GiDR21ZVG3s9PXKHRr
	6rMhO40mSvT//L/rH3GovP1lygqyLdRS5Bvbcl9tHvGAsqcF2ELqpT/OW8ufd1/s
	2cCBKc8PJNllOx4rZAa+OvTtIUxYDcMhznUiDQaRN2nQj6YnyWxUn73ub+fO2FHh
	eIcZV//KYrRiFGZ8iGU9LYiaV9pau9I5zPbHXH7mkZ9kQEgkoJmoSysKHM1pNXUC
	QYoawUTX30J4nO+unrKqh444VwTuiEITV/4OO4FdCAdjfXpxNfCGAFu2A/CgQrjD
	g4slrw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqftujas2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:22 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936708f129aso835024185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554622; x=1790159422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1Sf97NFKUaUqW6VmDXtLv92KAWnBnsE42F8yV4CgO4=;
        b=YiKfnHt17S2PJ8BcBbL8ZIFnQy+yQSY0CWKkNpsmK3+X9ydvcPe5QtGp9RcvI1ekRM
         hy9dqnwngCvotfKico1gbhaef6zeIE6udYOJ1IcDGp5lGpn49iU9kPNgY3NXdkJrx632
         C2SyBUpuJvlMSCtxmm9r5yo1bO/DAPSH/ARz4w6QAOrK/MNg+lRBZx+uY0XWHFDMqzX8
         xjsQPVhCdwAeTWySbSXnNChcJ0zISnYQcxgE4+ExKc9YUzjcmjUKaQLKbtaF58LaU+pK
         pTieApPENRXDD9NALuIyVIDedAk+BDJaM4Gjm0ehLStoh2cWCXWoUe0znNrVl8euGNkm
         awpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554622; x=1790159422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1Sf97NFKUaUqW6VmDXtLv92KAWnBnsE42F8yV4CgO4=;
        b=Hi7i3OPK7iifOi4K1YWVZIJoRP/PZ+Eq7MBm+aiL3KKB+pvOjdb48njVRt5Ql2u5i4
         o58z7XtGTxRtpcrYLuU04ocRKn3ew1MJkn6kX8mO3hmflIk9i9lmqxw/0sZ7JmgFG7M4
         wNN2oKCbOUVUDvGPFxxxJUcyu5HLOCFSKVniIt/qFTnL+BP+ALdyYRbxTsN1kKsr3zQG
         cSysQKAOXPvoGYHO1U/lXJS68mShGdDJpAIu1uRbCkxT61kaTfE/DT2zWjtod6SV+x9C
         Up7bg0f8QIeDv7V/5LQG2Rfgb/65LmK7obBikcqUEdevsV3SfFQycpf6Nv71woxA3mD1
         dvgA==
X-Forwarded-Encrypted: i=1; AKwUvBzVIG9LbudRLFlAnfcMxybUs/mbbGstOU/xark576PlCGPJPUOE2S7LlH7yjJp+opOgPbIURG/Vr3Cl6rc=@vger.kernel.org
X-Gm-Message-State: AFuF++nSOxiV8wtQkMxmFNVAS08Oy/8kK/DeTb9ipAWnJEbgQqYBEUkA
	kfXrGftOjxaBncNm+TgNHEY8au9zBaCkt8fWaeZk8IJEIhQqcir7hemETIFMPIlvUaH5QyR4sjb
	Edd7050OJFJZhmLVGFEpwEbLUyR45Yb9SFMzF5Miq63mV/tSG9ZGqCcBK90iBkD83f7Q=
X-Gm-Gg: AYBFou1thi/L/Tw7nlb4BNgX9HNDmMJVCtxgb5k/S8iskBydr2t2hDw0HxyGgAAH0dX
	LCOxmsCL2QBPtNaPTWi0CPQ2GhfvxTYF3DwisM7HPQPuiVn6qsR26lE4yC7Ts8Q4LbRLjHdmlr7
	j0kNFhA+OLKKpR4lKsaAScBlIzT+nLQnKtQecT4kimEhbMmQer3LG5s87ww0T5eBd2M4UgrZebJ
	Rr06+Mlq3jEL48aPvonkyrLO+VoV1zpB3WAxwI+bkDyo8ckONrRy2fxDxtCzf76eDFIWECLTVfz
	l8oE+jxIMJXDHmTTCkNdqaEoejGJi4kjNLxGM2KZqhWhZ6h4xB/B3lrtGF1JPeinJ/N0w1y4DC3
	xciIKBs8=
X-Received: by 2002:a05:620a:1726:b0:939:7f14:ebc6 with SMTP id af79cd13be357-93bb76bb193mr292577085a.3.1789554622015;
        Wed, 16 Sep 2026 03:30:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:939:7f14:ebc6 with SMTP id af79cd13be357-93bb76bb193mr292569185a.3.1789554621405;
        Wed, 16 Sep 2026 03:30:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:48 +0300
Subject: [PATCH 32/48] clk: qcom: gcc-sm8550: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-32-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3400;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2UaU7R3Klsyvl2wWmbPnmjteeasW2un+bpN/PVjJb6I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9pRzt6zcSHKcFZCSTUWhXZf6Nk0cg6V8EDu
 5lGQGsJvqmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvaQAKCRAbX0TJAJUV
 VkeXD/9ehP+Lz5BOO2Njg9IIymYBBm/k+XyNrFwd3mxET/HLz4wVgYqyBzxZBZ3Y0PW6s7+Ht0g
 kTWVYbZ/ljJiihojDM8xZ+uv2xc7b/uyQ1Tf7XEKzzFtSqaGZKMQO6yoJ6We4PQUwuhrx6pGU4F
 vbnqeRuWCWLY7hy1AP60uvgGvcxsyHIDQjuDoRfUAivU9TOhjOfp4iMP8ZzcuHdo848aamSBinf
 /VHcyahw6woVIN6g1VqRLxYVNzikYx7/V4g7GYQHwuK3z5tKZtnF8IseE0GhTeCvzDVqCv9ZAwx
 le8gBpXRun9Juhc+u7sLk+3ODJDesqaKbMm/BQ8Fec0herBbh3r/xT/h1KWErgxu7Oc+CcFpp1i
 NDjIqmF2Is0M9c4zCdDIqSNwQtG/EOLSo1+Ckyx+V5gWcZxPDkZWRCjydyZlE1KnsLpIGDkDf49
 jC9+XNwubYbcu9I/Ujj7ocksB7kjv2PS6Hwo4OdAQdk1CgAvIbTmm1b/A0S5GROOzLbvJLvfE/U
 jw7e5zZIkRJypdqoxyI0ozDifK4s3KBdtop7NrKW0qBjOH0sp4Y98gx+So9hqahRnOej5izOguH
 d4YwNljnLviU3da/p372P9dsriDT++cje4ZDzAvd2COqyz5feiJ99H1z+jeG2KR3/TZiPkzIPkh
 KIniaY1DOs5rUOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0FzJujmXLWLW
 v3vxt03AKXBjQnPtnIRBnk/EJ1nE7EHJrxVAP5BEO6MFXXXUeRrEKCzbDFMjNg9t3tWmF9i3c84
 q+Pqz2zZseJ0YgGHNe2Itqy1N6cKcuIBlhDyIAN0xVVzbfathgnCyliYQ7n4j7/QVcIVuYsv9MA
 oMJKqKccOJTemqFc3Jn9wV8UgjEAklQzjqJeRXAvuNCfa9LXuF0SXwijmXE1dyE0cf8f8h8OrNh
 v9thPwr3CQi5giBptPlD2k1uQrnpGSSsypJkVTGXTgWFWFt9fZc7mSMzpLdYOVEaQTjSo03gI5D
 eyvfJMmXV5ENUDNCfr5Mzd+TnUxJOyI/EB6JpsW27KZtNJKCS3JWWfWh83up5XtLN69tOW/zS7z
 SEvAZXvGQv/X8R32gmW2PbLJ4t/YE7jjaBKQ+ooIZ1bRtML38MRTcmKywAFbT/fQ7f7t9AtgwqU
 yZ2basAFEmaw58St0yg==
X-Authority-Analysis: v=2.4 cv=a5ulZkSF c=1 sm=1 tr=0 ts=6aaa6fbe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3kJtn2BENb1c
 Td4xMsQ7qJ5Vo8oW6eXEj0pV9NP/hT9xb8I0bXG+bE3PSZwRcsoj3iWkO290+p6GMrpusLipZN1
 g4p3zLK2762I864vAyfaAU4CQpjhwUM=
X-Proofpoint-GUID: WqJpxYHk7w_o9KBYl9f7xkzV4e7XyjTG
X-Proofpoint-ORIG-GUID: WqJpxYHk7w_o9KBYl9f7xkzV4e7XyjTG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..8a8c541ccc10 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3319,7 +3319,35 @@ static const struct regmap_config gcc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8550_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8550_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52024, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8550_driver_data = {
+	.clk_cbcrs = gcc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8550_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8550_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8550_desc = {
+	.driver_data = &gcc_sm8550_driver_data,
 	.config = &gcc_sm8550_regmap_config,
 	.clks = gcc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8550_clocks),
@@ -3337,34 +3365,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8550_match_table);
 
 static int gcc_sm8550_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8550_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52024, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8550_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8550_desc);
 }
 
 static struct platform_driver gcc_sm8550_driver = {

-- 
2.54.0

