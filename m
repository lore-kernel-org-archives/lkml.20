Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513C34825BE
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251735; cv=none; b=rC+VmeklBOQyLueLT0t6Jdq+TWUjsdrzcGdTffpW0g+sNGIMxpbJnjPOkMGPXifS+Uv96XN/8PpghV/V2aeKqrqNbJvYRJ0GQSWDf6XTfvUIoP0c/AoeAClP3m7y4q16xN9lPM8G++5IIJtNTxtD1KQTh4fmC8FSUTjCym9LIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251735; c=relaxed/simple;
	bh=R+sa37Lfp9ZhGnL08+LTmFtDPjfO1VmCypsEThPMfME=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NTF2794kaUNK7EUJ7WQ3h7tRLjH44zHBuhENlfE5sidiPWA9dnxejPs06//2jQoydQ0K0INDsvtjgfRqX3rhLgBMHL0b7p2uOKJq/TgW6r3Dpdl8fTdvWnkAi63QTlqj/5gJe3qOVZs76M2csG7A11shhTupXtWvw/9uzsqAPrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WNMQPHWE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/WReC5G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WNMQPHWE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/WReC5G"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4vdZ803993
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9PWjAwHkd2fIpK+WJk2FO4ElGGZUOCTPP5oU6C/yT+Y=; b=WNMQPHWElJtDhu0f
	IDIHMOq4wHKpUKyFYxvE7wbENVqTHcZTLl2achEvevUeOifMjrd6CPh8/kFpRKia
	CCLN+5RVLWqQhKkxFt1LUBfFiGe/u4FxuwMDoZOzxBuWc4h8JoaU/RvFUncRI4oa
	F/37WVxjUtJHQ5o7W3VAX9Q2gk7HZ7WzSZn2OXcqhX2OPZJqvfiB24lGEAokBkaJ
	gDU+cG004nmBGPNfNGZ5fvBoKF6hG+iJaM0Oy3CNEfNS+QGCW8qZVCQaiHMVoy8y
	y4eDs3vaT4iFcRedrQo+Ugy4bBRNF3UTl/Ow9qV001mTpjrkP8dSJy7/3on1EbQw
	exhcdw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc8f85-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78d25a8ff32so616481137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:08:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251733; x=1790856533; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9PWjAwHkd2fIpK+WJk2FO4ElGGZUOCTPP5oU6C/yT+Y=;
        b=d/WReC5Gsd20yhU1EK6wA5VN91k+BaJ8eR1fj9HSE7rNsx4ZUdPz6oCTL/c7ahF7rb
         blodPKIvB30xYVTvJfhmgOPhuOWbim58lmii0MUhlA1qMkTZgSWBYiTI5WFiJmTI7sZ0
         3ZEG+UsgkmpDE0wybh0vO9aLIJBF4R7Or4xY6HIEkpc7YoO2J1i94DRZAUsB9NEmJbSO
         dMV1fa6wbCiFJZzCovl/SlFXfC9qK66Gn3+RhGqSQP1HDYdmGU8bwUZ4x4+lYDKoyBLN
         Gm2cF0IOhr1ugoBkO5w84enyQxbx39bY2c6lk3cWAscrP7fC6jFXF/fPWGnRWLujcCyZ
         OYwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251733; x=1790856533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9PWjAwHkd2fIpK+WJk2FO4ElGGZUOCTPP5oU6C/yT+Y=;
        b=jCudl2oqeYPe0oMTYW1pfl6UyArtDsrJzdS1pr8kuOI8xAv8tdy0b5R8k+1nNEfPn1
         qb+9EMyXxfLxIgyD4HinlmQDDI/U1mew3ijHw3aVAMCCtQ4YgElCIVRzknZrTGDWx4/X
         DRj2DO9qj7Y15AbaZiHdWzpYoE14WVEf47CwBmloT6MldesW6V1cRucqt7chgIF2KcLN
         EJlIl1UtIr2ZgShrX1wbv4j1xW7+PZN+xvAnUxR+4G1DqJz3EVRoqcVzlKQeExc7C3qj
         oR0uLpuhWvDTuoNxmyAwvllwxP8VMp3FfR+OgNKtwzmywigXe40I11Ky7zI/QuSOeml1
         mMBA==
X-Forwarded-Encrypted: i=1; AKwUvByufAuTDtxCBYW4gmyzmAg5W1SzL+6phTwgZ6dFNS6b5acAkfUbiE3J5GjMyjxa0ukTTrYIFLZo+qxn6Dg=@vger.kernel.org
X-Gm-Message-State: AFuF++l7M9EdR5EvO/OOLUSGOv1hcopGCqrJO2WjHnP0NEAFP3e7PtvN
	2a9hpJnfARiUY0bFRsWUmzRanRZbgtkECn02wQ5QFtCYjgGlBnT5/Kts2ZMdvh5DNdX9EOc0zdP
	AYalm0zaf60PSQ/158rSAnaaSYEoFWXIkmfPlPycb85/s46uGYzgIajNctCxg+JKmyik=
X-Gm-Gg: AYBFou1BQpRB76Kr632nPP4YBsdya6g+Iy242fcLvxWZY3ZvNwkdSuYONs81DWzu8j2
	4CLXx0C+y14d2F4hPWdsx6VKbwpWngnW7/X1mUvYdH7+aDEonumO1Y8vK8epljx+X4Rv4zEhm+c
	WK6cE89JCkFo7KzfXWbXVpDkANpdrHZ+knUPGfKNSbI1CQTTuODjI+4GSws46yCJhSbqIi1ozzM
	qMgqNKEuZVavGw8RYTKXAxWeSWRZ8DZ2r2NPZscejkxCCejh9wgZvu8wBL8/iZaZWN/ucJ3N/mz
	jCGW5l+cCiBOsFn4Ej3Fhlr9KYasmVZgMbDhrGqOEoZ5Cdd5h4VWcAgjGfpQNj+8pMy/y3Xnvn9
	eGRgHjb8g
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr994215137.17.1790251732374;
        Thu, 24 Sep 2026 05:08:52 -0700 (PDT)
X-Received: by 2002:a05:6102:41a9:b0:7a6:b18e:6d5a with SMTP id ada2fe7eead31-7af1e4f6363mr994196137.17.1790251731765;
        Thu, 24 Sep 2026 05:08:51 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:49 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:44 +0300
Subject: [PATCH v2 32/48] clk: qcom: gcc-sm8550: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-32-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3461;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=R+sa37Lfp9ZhGnL08+LTmFtDPjfO1VmCypsEThPMfME=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJgpIBZVCFgwFgGC1sL2LQ2A5ZBdfZjxrv2/
 1nsA7faXoeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSYAAKCRAbX0TJAJUV
 Vu8kD/0SvAzIswWMbPOgjJ42QiltEQ4oraXFhOqLVBNGqGKVXVXX7I3Ge49bPrWz5AwxVrMKoYD
 Q9VOHF+NMaVZ67eHYTCvgII0lLJOYhnc/KefvvuOuDz7Zywm1YLgv+ouMYUd0wXlwhVOe7slYZj
 +ZzCKzsiWzQUa2O7yOsAZeBVzsecR/w6PigMK+AsEXeJycfZgbVBaNCUz5EtklLPYOvYvYc7Xj6
 XOOyTI3eq7J/ZlhnbwTs34WQTigU/STtFY/gj0SGwFq0OLGjlNmeQKd9Tju+NCy8DErLWveouDj
 H9DGW1nMoMbuhS6tP+uazqCPacp6lWvbjhhPVqISdqJtr39jjgcgd83kZ4bBjH7EMZ6TIaRCHJn
 zfBnbDse2UgVmXZCySDLRQBCxXBJbK2bthW+A9dQP1wJ+T622P+zmZDYe1tcOnkJDMGlEQ9US7f
 9FjKro3CZ3K/9FcF4/x2NqI+8mku8FAIoBBySLXr0QH7iT9o6r313FTCoN7sFcO3aPITrL494c2
 2HH8bKvH4yGNgVGXa0EnIqQ2jpDwv0lEPkGSdngiA4RXTH/3MHW3n1/B3g1N+kWL3udDIsZegY0
 xrsW4aHojI9gXkuW20Y+ZXytYLy7hpw6brvfIdIdpKRgcvdv6sbtviltIYZbgNsJNsJagIsBlHH
 WZ3gI+Kkb4eQVkg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FvyMCq5RXXk-J3QyB3I5uVDuyACgzKUJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXysMvQoRiB8Bo
 kToncVf+vTHaAZXyBCds2TrK4myN5KEM+CXdN4Ax8rYryDwMHzAgd62wrtXHtv+XpYz3Mb7gs+B
 9kZ7zDfGDnbDj/YL73gh5uW2wQ5vtGxrr3nC7mYJ/Y4l5VZD0j07TXjI/7AWOZHEkEjCFlWuUHw
 hjK8CiK7+B0gUuLAPimCOtLclYrPyQQlQzjr455lvp0FIRTYS7lS9UG848SffPCfYhBSdDdSrzZ
 S0vIsHiM3BoznR0puwrdUYU8oK1EL85zvy9JSe5sNJ8rvG09excvH+mdWUHy2yQkv29un+B4aje
 ZhcBA477O97vrIZyo+23FxBUAZqgQiYY4xnoh18zarfYDeDvpDrjOuFjJZlaL2BcXB/JPFKa9Qy
 M237bmBA9oXMamkrUbxnP0o5A3qRSgsM7s+3AQDiIlEhT3gC9ZjPz9AlJsuTTqh/GAWSaxmO9qt
 XhUo/le8QyvgtzZz0Mg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6a+4GaQryXvt
 CbkfCQtTh3NfOOzSyr53H01duNg1xh/vkXtyBUn4vdcEiY277Cu+B8VoB+nFQQVUGOPRpD8PnWw
 0dF5ASpsUPaykQOA7WuINLm04Nrn2a8=
X-Proofpoint-ORIG-GUID: FvyMCq5RXXk-J3QyB3I5uVDuyACgzKUJ
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab512d5 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index d83a7bb5356b..2bcb37f27025 100644
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

