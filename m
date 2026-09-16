Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03454F55CE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554642; cv=none; b=nA9aSTi7bUtJ+M7btQkskyJibOCSHC7xLAkNJwEeA4ZsTojj5aJ4qTA6fgbzMUVdj9snbpde+zx6KiBXhDOHs3V3pVokCCjiWe7gIii1Byy6Ltf6UdhAjdxbz7J9vC805d2xvcCWwgq6s0VCdvpE+kf13dfjp1rQ1JwZHFjyUfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554642; c=relaxed/simple;
	bh=QChgSQqvnf6c/lIB4mn0G+lFoP91Je7jvpkAWsYg9KI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=osDHz3ITuEU8NrYOtKJKlr27fo1pB4qeQyOmT+57CGSf8Z/Uk1R3TswfiEOJ9TLjSMdTib8KHwSCWmMluuF2utO/F1bUmmcfssO5NEtN+qqxf9hB7I8oRD6RPVWgzeEFeBDyMlUymm8GuQ51jlZfVdIMCzgeTr2C8i0gQyr9d6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWIUT/Ah; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fCm5XR3+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWIUT/Ah";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fCm5XR3+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92vT01721238
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWKFqRYP1BXZSJYeZ9+388TaOWZejTGN2ObzubjSvaE=; b=hWIUT/Ah+4aVZwDv
	7TQOxZ0+4HYSwRMfmKxpn7092coc/Y8BkHBINikRtwvhylWyGPyPGKLYR1lPz4fB
	/PanSPV8/jgnqJBKZ2HWfjG01fY2R+DD+wxd5x1qYXzsIY4Cc/vcYGHeinfAcaSp
	oCDJii280lyb0cWPRJgvHMcxiJb531HNOFietJ2kYWF61iNd8n7ktqFZ8aSG1Q6v
	EiM+sEl6sVu0BANnuYUDz8DmONNt2pxKuG9PEDa+KPZIyqlOL2WNvdAREDdWbGff
	6mPcqwmDNRNU6JpeQObdwM/7tubGcfuIwbIg2uLpgZvgpxzCe7x1Kp27fo57AtTh
	QGl5Tw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkbyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso835005985a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554616; x=1790159416; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWKFqRYP1BXZSJYeZ9+388TaOWZejTGN2ObzubjSvaE=;
        b=fCm5XR3+HDfqp6qjgqISw4FviPK7V2O93J85p7rjh4XmIl6iaOGffXHIoJb4+Ev5tN
         imHaJXvwcJcBRnZr1K7uqSV+mJ4Kf4KWD/mGbHzOGS8h//uAxNn1wDfSJHmdEYNPUi0Z
         4puCOlJTHtRtqutAXXrelMnP2dU0mpz8Az8u6vqb/P0K+OFqRjho3bBp20u5lRDKsixM
         9oRqIWui0R9eyyLWaQf8IYJ5x9oMdk7L1p+GnIB0QNsgAXTnwY1PUByBM1RBmQVpYrhp
         1gqXPRhUBzYI6NT5slW1gGqipIayQaETd3O66NcTkDLRDXDJRit7K9+0X1mbSbZvIk/G
         af3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554616; x=1790159416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWKFqRYP1BXZSJYeZ9+388TaOWZejTGN2ObzubjSvaE=;
        b=gWXXj3T3TIgTc6NOpdxVPjNn5oynXlrmzbZLVp0uDwCY1nRDeCvKJqZ1bD7y5BaECq
         fKxm1iZeMk5WXQ/mH66CQsj7FATvsSjPsnCPmtX62+q6psn56YDDnnDpRoP+pHSkJmrA
         /5tYSYWvJ4MTG2c822v3SxFsY7xlyOiwgU0TR7TKjPug97KKdpjMVWkJfvaxrekGwAvz
         /hsszYCiDNCaGSBzRN4bljpXuC3ZfeEFCw7xe1OeuTGWsdswc+oI2+DH4D+QYGB9dLsM
         B6q57eNRfA3l54dYVVVaM1IOnHZkce2KOtpfw6zm9BKpiIkOfnSMU6M4hvWu5hD/cOHH
         KghQ==
X-Forwarded-Encrypted: i=1; AKwUvBwTOIsSq3PpetGCqD1tpFx2udYHb1wEPM5xKcHRBYdbb7AXBaSQcLLwws1lVqyp2Ohtpgy0IoeK8dbiYkg=@vger.kernel.org
X-Gm-Message-State: AFuF++nPswFhzGTmTXZMbhEt2+MtdOVrWOnh5bf8U5v6FmoUOQNcjNPd
	YP1x2Lc7VC3XzuXQK6WX42q7+MJaHq5US2qx8xfZ5VSWNGHMsE0uGr/fgXrgrf5s2B4fQtR1ivk
	QxYeYtEVEELoO8eBHzY3JFkcFTKrlov7FUIXyujqLA6owcEQOqhHTsqulmDdHrfvyeP4=
X-Gm-Gg: AYBFou2LLf63OyVNQvZgmJOUhkbeozrBDIU8uOc0B5pBv4bYXTl/MeKFKqtUjDHSCTH
	P9R3P+M6cJnz+/YUjFRiTqAC69DFuHqRN2RZuajkv4pJ8E51bOpikxHG6xhkldIvI9OGY8vthSY
	iLgjH/iv7o1LBIWgOr6talLA091P/FzP3+1ZosYrMzGV+6pbDSPRx6Kp+rb+37BGvSAqTzud2hJ
	ZWGKK/Lp9bnT/ABDpaUAEHCNB912kM9QyAeTgPRKBvTI1S6RVvy2ZTXlNDnBYVTLv47dGY1POfc
	gfW5mxW+zmuEu9vi+mFahNBCmp6pwfHtezJwa3UVvLTQhigtcX94x23SbDaTiKR7/i05GPiTwqk
	T/0N6xaY=
X-Received: by 2002:a05:620a:4385:b0:939:b482:d474 with SMTP id af79cd13be357-93bb79096femr296785085a.35.1789554616021;
        Wed, 16 Sep 2026 03:30:16 -0700 (PDT)
X-Received: by 2002:a05:620a:4385:b0:939:b482:d474 with SMTP id af79cd13be357-93bb79096femr296775085a.35.1789554615301;
        Wed, 16 Sep 2026 03:30:15 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:14 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:45 +0300
Subject: [PATCH 29/48] clk: qcom: gcc-sm8250: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-29-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3657;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=QChgSQqvnf6c/lIB4mn0G+lFoP91Je7jvpkAWsYg9KI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9nGW/po7DlXDbCnzMFWHg/wPB4Zbavnq/u9
 bvyjjfG4AGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvZwAKCRAbX0TJAJUV
 VsQfD/9ZkYJOlhePKgXiN+F4WttNdw4OPOMEnv0X4HsZHUoovdo3SJVkcbnJ/C/Tkk43nKWIm/k
 aPy51rYrOkwNjl6XhkkDshPN+degCNT6GgJJxrW+jhlLSDmbQsf7yTeua6MDMfstp+oR3J5cUZJ
 /6mk0gWd8ZE1HaAeJhcVWjIm2iCKKQC+GLeH2Xf+t/IdqIz2cEItKcaG79jfGirQ+aZcMpFqkfO
 79KrkeW95i2NUp8UNc9Ymy5NNLR/aFlQXnczC9ML8CV+ed8RS4aCFbwUaTcCsjaIzfyH0fVzqZ9
 VQSVsxJxBN/RVaqnuYPqqSGUIPm12TjeQbcJXDsH+kypVhhIAzCuOP27Jc42OexksNTExlKkpXF
 BZl3GMzchVUGirL1EK6DJez5YuOze/eep4+7A12jYYoOn5I0suCTGet5GWv7XIzgG98Zf3OH+q1
 pXF4xnAu+X7Fbe9Go7CoN2RR3O1BxrJitrrb/0dQMyG2Fm/L2rs0S5apFjhC69qpDFLKVzc73UY
 hgLs1V0Q+HV0ltwzDLXWNchQhvqma5esJfI9FsN0YKYbmNZcAiijy3Ah03IKFUFPzhYdbJ/Lelz
 tY+x7WB3wPiRCZu+K+4rb9CbTyMfc/vICFVk845cBze44CvyRs0tT63b7B/pXRavd5oWR2xzqBu
 PjXQbc9Mt91LHWA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fb9 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3uTQJPPpvvnQ
 CQL3ACAunpwIsceQfpBOtH3bXnkWNYxvPxcwHMWayHc8NdXQnez731elP6godKUTdjcXZRyBSQD
 Bov2Bp7ARcLf6eM7feOqaOiOdUfy8kD0nSpfpMCHsM5HvkHbiIHcHAZOFLHBuTymxJhErl+btV0
 Sjvbal6wzPz4WWDTVs84+aczZm8tNJ1zGKge9iLfrupqdm9A0eSffmi9eOO147q/XnHmaUEcgL3
 Bs0zwZOyFUHr8i3ZuVK3u5iyJnliQE+kvCGuoBbttlUCvyKbakdpqOZkkcB7tUu36qetnCY2P2L
 jOne0y/f6qYk0UpEf8q4N2rUDYtfsLZloDblJ30VGpxvCr9rYwUVxssUr8bgAQVnz+dHB6OMQIt
 C0SgIbAX6n+7PC9bw/BGYujXUbPs3d3MUoBzhi7tNHgXU99wtzpZWKCTW/cFNjLMmqY/qRmkhPY
 gP9jYT7HSNvYF/mi/FA==
X-Proofpoint-GUID: 3E2v7wQSecQYxcULGRHr_-4pBB2Y5JtQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3IcZ9iw3V8wC
 f1ISfnR7V34okHqMiDBSbbFPKe3gQ3MrQk/YbA/gksiowNpHqOIXSYJdvQTS3T3sjduNfYgGDTy
 lQDQSMWZ4lbc4I1yXaBIuWfrJD4uDfs=
X-Proofpoint-ORIG-GUID: 3E2v7wQSecQYxcULGRHr_-4pBB2Y5JtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
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
 drivers/clk/qcom/gcc-sm8250.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 1c59d70e0f96..f6ce572261bb 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3603,6 +3603,15 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s5_clk_src),
 };
 
+static const u32 gcc_sm8250_critical_cbcrs[] = {
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x4818c, /* GCC_CPUSS_DVM_BUS_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x52000, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
 static const struct regmap_config gcc_sm8250_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3611,6 +3620,24 @@ static const struct regmap_config gcc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+static void gcc_sm8250_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Disable the GPLL0 active input to NPU and GPU
+	 * via MISC registers.
+	 */
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8250_driver_data = {
+	.clk_cbcrs = gcc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8250_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8250_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.config = &gcc_sm8250_regmap_config,
 	.clks = gcc_sm8250_clocks,
@@ -3619,6 +3646,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
+	.driver_data = &gcc_sm8250_driver_data,
 };
 
 static const struct of_device_id gcc_sm8250_match_table[] = {
@@ -3629,34 +3657,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8250_match_table);
 
 static int gcc_sm8250_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8250_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to NPU and GPU
-	 * via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x4818c); /* GCC_CPUSS_DVM_BUS_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x52000); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8250_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8250_desc);
 }
 
 static struct platform_driver gcc_sm8250_driver = {

-- 
2.54.0

