Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB634CC600
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554640; cv=none; b=PFGFxksE4MJ4niK1TgnJtxg/S+ZPpIKdcbKRTSEVHue5TDyNnGFw1SsU+RY6nRHcwN3miM7zAuZdFGiL3Xch51omsKk0budQX4b7FzYq6Ve81to+iC8YT76Sv44KNCIoF9NmIv8O2PPhcAHdn+jt54o6V89aDjAEneHoV8NUsTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554640; c=relaxed/simple;
	bh=98qvKFowCzLFQ+OL+70mkncTytIHj+yglPqQLHeXZvQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iyCypPvI/aasC02pQMHi1deQ/DX3uhzQMu9pCFHXpWnoATqVd/Thk1wNCygufT7sRfRBAo26PwNc9CUR0rN++Vs6ryC1CtzJViwdX1v4UKOgb2Pb0V7vG2fUDwebEk4CFlIHH1HOtgTXm04IDhwPnIx4CkJ1fZLh5fvVCNvz97o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYHlT6ue; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0symaWH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYHlT6ue";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0symaWH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92ti42122651
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uabcToqzU7G8MyF/ZyucZ5HGCRyjcYDOkFYtchesHt0=; b=jYHlT6ueMCiGUqgs
	FXnJcwF+9OUe7OZSvXXI8c2zDegDyqpKQVOgRQF+ZPa5u/uEcMm2XAhZrEFikHHH
	PgEl50pjb6clXEhMoMLUgjT9a/bEhLCutyIzIcS1zZHMVRRhmuoLZqWcWMzXyKw3
	/G0xIyRiW/ABMtMjKNH2z/TDJkj8oBNlQpmNjA+5tV8/2EiS50Sbq6lelcuyWidt
	nKk6EhrhNS+ixtJfOC8r2sb5XTmUSubZ01VOvxu5JN7orh2p0/5Grl3cJyLU34eB
	5nfNMEd0kTndsEMaXQmpuB4Ps4lp2Av0EfPciTCX6t0gT9OoM2XdzmSC0YFweXgs
	qENpGQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqkv7hhrx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f925ba4eso19957985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554595; x=1790159395; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uabcToqzU7G8MyF/ZyucZ5HGCRyjcYDOkFYtchesHt0=;
        b=L0symaWHJiHvH6yB7omsv7c6XAgG2pQTXFP+1JcsYfOaOx4rNKwxSlEKrQC5cumfpD
         qCYAaHfXb9d9n8l+kNJ55dopV6NfgG/J7rvtuhhTqVlRODfTbQeHX0htv4DtXIz+18d4
         /8PniCjX/vXGrtUkkh6uDsIU11OpqEbuZ7kq1AW1fbph0+1stK0spwvxzatPWONyti34
         s5UYiE3dhpI5QDmlUWIvyoEkrFnDJlN3bCubY5qEL38BCCzsifPcHoascT2y28PkASDI
         tG5Ltzu2+c5ABwcZ6k/34PFQL4sT2M6ffoifh9Nstm7n+cP3mQF1hGh961qb/jCRxpCh
         IZWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554595; x=1790159395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uabcToqzU7G8MyF/ZyucZ5HGCRyjcYDOkFYtchesHt0=;
        b=lcGUjBwvAtAyHRoHy1BGabqQKYVCqynWCbMLoKCC9ctkTha5Zdvig1I0TGjZShdfA5
         0CsDV2wvxvX1Rc9T7ynhHnmLZxT3F5tozPmtghZmGilQrTbeWVDzIv1NEZmWfgoJlUNT
         irwpE2US9wyhuBvk/nTIL1EILdx5e1qxww3SaQRO9Du9sQE27WyWb9ZLaTcnQcdF/AV5
         aPRHnnWxCXEyyvTKGVdItVW+Dptb8Xd8i4cMhXg/4AWGMP+7xd5JMMVppX5X4w4IUOda
         dtDoVzCJT7qP7ecuJArknw5jD4l6ioDAMBRNbf+HoBsJhxgjqr42Wrx0Z9r+yNcRe+JM
         Hq0Q==
X-Forwarded-Encrypted: i=1; AKwUvBx4X8E2zQK7DmOuCgcbzjppUKp62jMQcQbxayfzSi9a+GIDFDtKnyzweKKu4nGg7ZYSXwJsB/00h3ouk3s=@vger.kernel.org
X-Gm-Message-State: AFuF++lN6EaI2NLXgYsGM+PhdXuyN3w1YZ8UOKJrWJhLIWIRAOhptMlf
	BlSgWls0VRz1Z+FwUbJ4J0s4c2XoNZYm3cLwq8v/APA/g34f5E7SeMXAia2ox+EmQ7AI1H8Jelu
	RFvX6Z6v19eOXRylHbmNLIU2OkmNmW27XoZ8rX1lo2lYiqf+/CY6HJQ/E8A7KmCEZtX8=
X-Gm-Gg: AYBFou1J4llcsZeMIo4YEslp9HB+imaei/VdeXA40h8M/wCCxvB3twZfV1KEmm75fei
	sjEmXJp+Nbax3876QOfKE7RLEnWbiXB6ugehuIA3G5SQN0hj2G2Ok6vPesVoBWDmUThc4BUR/JS
	KDLaa8epPmeHo70oGl4AwOJ3l+RtHEC/OY4+yexUf/kprwqImokQRBuktvElabOQDwa9Vm5dgUA
	eTs3o3rRtcG1FLSOR2CtB54ow4AyFmJaD2Y6CCBLkhzBNhspNHsGeBtXOGp/Dufh5BiCOa5mHEq
	7AswdSWI7pmwg+FtkvDtimm+blOG/FAz9+4Mx7qXgwrwNF0TKcoLgPSGeSMFjuT1EkmfxDdoZZT
	6cXVkFAI=
X-Received: by 2002:a05:620a:1711:b0:939:e650:c80 with SMTP id af79cd13be357-93bb78f24e9mr282379885a.39.1789554595191;
        Wed, 16 Sep 2026 03:29:55 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:939:e650:c80 with SMTP id af79cd13be357-93bb78f24e9mr282375785a.39.1789554594641;
        Wed, 16 Sep 2026 03:29:54 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:53 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:36 +0300
Subject: [PATCH 20/48] clk: qcom: gcc-sc7180: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-20-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=98qvKFowCzLFQ+OL+70mkncTytIHj+yglPqQLHeXZvQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9eZunXfqqoTv/+m9u1H682q4890hsdU4Uhl
 MyZS2XpxcqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvXgAKCRAbX0TJAJUV
 VuYAD/kB5+JRTlHJWxaDs4owOZPuyFU40Lf0Nmwo5xuyE9PxFCYJjFAttruJhuCZMjGNymr80Rr
 Qa6KC9IT3A6j95HwDDqgLKkLMQMMM7NK7bsDkQB148Rmwqw9BdSrilYvzwJrRLTM5cGEeAUzR8q
 6K6Wq3wFI+lFtmCNof1TqbOXTRhKa/Onl1LNRnGa6Joe6GpIpmHAuPcfLZbItOD7HRRJCxxp4Y/
 INadloZ6UboHsiuTzuxEwH/LYrvIPPNLAFZIs34CrE4lcIGEeJp+qSpPodC2iiWZ6Vk+4Y2Na91
 jVeingaDBCT0MEf70bNQwCcvjL4DDoY0Mneqvos4NBoRrokWLbCoRrbrc+QwJzRkr3qG5o5eYni
 8PgaX0saTKrr8u3LBWjBZRx8uFF7zlcWYBU5bmGkZeut/JbWRf1IBy2NyHsm31CcKgWddmoMjfX
 jIysKJTbgSIPSTHP4bhNE3Cq8QBSvE1/P4Rm6XEdkAsgWGue9CaZVzzmV9QVv4kV8A28ECgu/EX
 mXw8yfwmTLHdFI6lLptQXbJAq7YQQLX5mIxLoOl26/W3w5CrGE+feRWJDmsKJR+v26FjFQaoUQq
 C/qZIY/2Dz2shJJbzvLnK5/Fad5Pn62lB3njDV1MlWbZNs3AcQIY+prgNYpkHfAIoRPaH7uNhte
 m6SKL26FhBeNZMA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: E3A3hQl4ydlNHvI7_xPUTaLtsiKxj99A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX76boqnsFIhTM
 QoxjXIbfTdtHmOFMVxR8Hn3XUuSx8qkc1MnoejitU42qg28CdQ2gufTuxnMh8ABBDlrYnRmjMB4
 VTRrF8hnpIe8eeB4BaEBIRPcpYC40pjmkDupC2Ksz94sLG4Zfmdix+IZPXiIJcPN4yDs3+AXIaH
 RxsMjgNzHym9XG2mITh3Sxnu3/sELg2hoq2tY7/3diF+/jiP77PrFlxuw3ktovmWwQYFR2bvMik
 fqR8y69FXZgJ5/vbiTE9K1PFfeyXi4al/BkEz6Bqcl97Lm3nfUWKPqkYn0wR0ZBHi0/lmKlgkJS
 TVi4yacaz3EuB5pbGtpDzIkOXC7cMtvi0q1roFzVUB+1tlhx8YvhbUyg/eiCYMRny/w7gwMaygl
 Is02Rvu61fZvyKtGkG8n2/195Le0P7olyzMQx2wA2crogr5OnbP0zs9yv956ApDiaOwNSGJd6up
 7lybJWtFedCT71aKozQ==
X-Authority-Analysis: v=2.4 cv=eKmGH3p1 c=1 sm=1 tr=0 ts=6aaa6fa3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX2iuTfsGE1JJ+
 1bfzQ0pdbOMrxvLyDr73Sil9fOlYw6ZwzcW8E0AbTWOw3jLqX0yKmW4lXTnDinEBHg5lXrvK06F
 UT4NdlF1I75usKSGnnOa28K8GJK8wZc=
X-Proofpoint-GUID: E3A3hQl4ydlNHvI7_xPUTaLtsiKxj99A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
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
 drivers/clk/qcom/gcc-sc7180.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
index 4a49ad7a9e5b..6d9ee31044a5 100644
--- a/drivers/clk/qcom/gcc-sc7180.c
+++ b/drivers/clk/qcom/gcc-sc7180.c
@@ -2408,7 +2408,35 @@ static const struct regmap_config gcc_sc7180_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc7180_critical_cbcrs[] = {
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x0b02c, /* GCC_CAMERA_XO_CLK */
+	0x0b028, /* GCC_VIDEO_XO_CLK */
+	0x0b030, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sc7180_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks, NPU and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sc7180_driver_data = {
+	.clk_cbcrs = gcc_sc7180_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc7180_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sc7180_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sc7180_desc = {
+	.driver_data = &gcc_sc7180_driver_data,
 	.config = &gcc_sc7180_regmap_config,
 	.clk_hws = gcc_sc7180_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_sc7180_hws),
@@ -2428,37 +2456,7 @@ MODULE_DEVICE_TABLE(of, gcc_sc7180_match_table);
 
 static int gcc_sc7180_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sc7180_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to MM blocks, NPU
-	 * and GPU via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b02c); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b030); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-					ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sc7180_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sc7180_desc);
 }
 
 static struct platform_driver gcc_sc7180_driver = {

-- 
2.54.0

