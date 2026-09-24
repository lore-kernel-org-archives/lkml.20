Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24076497B8C
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251750; cv=none; b=bzhA4GvTWKrM9yjRBwbWsdakOAtxe7BpCNFy2NdQvS91PpMBebuYAoUTTambS5G/KwYTBytbCt2iFhbl4uOGBvay3H/9KGxvTW1urpo4EXlWlK8u1v0Fsj6MQ1C6rJ/7RUQh4IRHvJCndeZzrpTEyUBiDdqhVw4uM0g5gqGS9lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251750; c=relaxed/simple;
	bh=LAioNN1IDG6WlUHJDv8W/X17kNzAhU+Jnw7JDkfH6Rk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XOtMqhFEd8nBkJ2YSeewjIqqc+2otJ3IK2lRtC2Lf3Z2XS90yCbOH/GG1JeTd+6g8qADgTIrpTuxZ3Y9RqZEcmvG8yzlxoERp+WMrkJnxcW4TQp2eD1MLEtN0AyD09aXsU0om7IqYdUpO4C1YNgjz+pqopi15RSZesPILWHa0II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aTeXCvky; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KRvBgLPz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aTeXCvky";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KRvBgLPz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4b1Y3134162
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lt4it/SW6Uq8rX/R/noJ33j3tUYVR8IVNYB4olxOXog=; b=aTeXCvkyarCSBiLb
	ralAOtEwB86cu6QkTMbEm8GYn9lWP+DC5EQAZgoD0BOY/DI23Sz/JDVzAKa/wPBk
	RqBMYsKdVH2tprWLGfv7UUCnHqex4WZHlnOerveg8Go+3+YcGGDVr/ByRBGX+zQ0
	PZY0rnA7GB+dkiNIqiVaoKOJ66ibEdOx6IfIkNtBLdnCdyBwi8R9SGahSLDrmxje
	fkqZdI0PtpNHTLJxhnNoiOww3EWxFZI+0pTMMyvOzvIMvJLdpoGIULI5JABK4MYI
	J08YOXzHXolSZic3blTbqoMPEbPqf+/GdwnHpwU513UYrSJaWQjCOoOXwe06Z5I4
	r6bVhw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1raggpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:08 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e768af628so1578951241.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251747; x=1790856547; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lt4it/SW6Uq8rX/R/noJ33j3tUYVR8IVNYB4olxOXog=;
        b=KRvBgLPz1HFbt5daKxc/ARi8mewGt5ALWM2x4TqpOHd1FDswYmB571w2zeqfowey7C
         gVaxZwUhOXZ3OcS+zWD6iuXXXFwe4/lWLmq+bpzK2vvvLfWjHn8r8ys5IiHvjgekGv5C
         lGE1nHVVw5qs5GuByMyQ2lhvw6yJF+qEQBsWPT0t6M6lFOjipeDKyMekF1rS2Sv4frJ0
         7Az5n1JiZoHly53tokrJlS3rU4tmK3nlbaj8O61S0ywgaCw9LWbrCdDb5Iw8V/r0s5YZ
         EBeVYN2y4MUrZb6X9tKoPOp1j9rBb3V4jLIzfKAt6rDiTEF+BHFWyOmLqNgFriQz40B1
         i1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251747; x=1790856547;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lt4it/SW6Uq8rX/R/noJ33j3tUYVR8IVNYB4olxOXog=;
        b=tZk2DzCQp8qByzXwuCnGob4PQX1A6Swvrn8sufAwwSYrKC/XkiUQNeXAgYaDn9Q4+y
         EVZHNB64OBMX8nz2K+UvDlGtaKKMDaZbkRAlH6XiHVrYE+Aue60frJ4SL7OqMyt056zx
         qL8tJDS4UX0aK1aPY70szpZHHNDXabjlYBMeHAxcoVXJ5SfbcXn9VZiQtFVE3X6sgEx6
         SQnKkxJHaT5EoBMpL95iDHUI8Kd2wQ+gYR8vguwx18WzBzH5DGEQMp1qx4V+2h0Ma5PZ
         21IORwXgpUJ6RT8Li0gTenYCgo+h/FnkyC0rQ9kE7+lTQNKAKisDIZXJ3dhpamXkSpga
         /8nA==
X-Forwarded-Encrypted: i=1; AKwUvBwtuai6E/twGVdsSZ+rO+DF1WKwwA5QTx6BNBHyaOp1WVsvHDNplUj5B0+HWiPN00+IEbiGUZUrMcMPAVs=@vger.kernel.org
X-Gm-Message-State: AFuF++mPSxRq8aeoWLq8dUl1RG3eJwA7VGwJ2vDzoE+Jo0K6kn2J/VrJ
	q86CjnLCxdPyfnwQzMyjsS/YaWO46s/AR9wtF0TbsxSCPMsORYamhZxaQjMRZbFK2sdTwiFU+LS
	893/XsZ2FlMEDP953OwcOcSOI9hVUuRBbPSWw9FQqsu4TgNJDTlybUTkbHtDMnkKd54M=
X-Gm-Gg: AYBFou2ZARLxU211egBw28vODG1UELhG+/sCggvwVqngEpoWBUSz2ObW9kOra3Pbpr0
	61f1ogAW0wn41Yoa6ZCCaYoYFjysBmCJgg8K/oGRlkmn+aBv+2kcOXkIP1YS58SjiTu8f1dHr13
	ze0CMc4iUHCIvV6FmMBovI1KGJtv932LVPGXQ5OkraPDjeBb3XS58q0vCZyiO+8/7+zVpUjr7Mt
	rn4RJMdpTkVMFc+7jvE7X202bKDWDI/NAWXqVm1R4cfU3OpQKvqQaVYdOfsMg4V18l9SoQLboMy
	+cQXxSRtq/2SvtCa1Aivdl/zh2WjsWbc1APZADQL2jLBdW75f8oGFGegXvLkaxe8Jk+MHQ3eSzJ
	xoELFeQxl
X-Received: by 2002:a05:6102:c53:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7af1d6c4296mr1188578137.18.1790251747399;
        Thu, 24 Sep 2026 05:09:07 -0700 (PDT)
X-Received: by 2002:a05:6102:c53:b0:7a1:f7c3:3a45 with SMTP id ada2fe7eead31-7af1d6c4296mr1188566137.18.1790251746775;
        Thu, 24 Sep 2026 05:09:06 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:04 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:51 +0300
Subject: [PATCH v2 39/48] clk: qcom: gpucc-sm4450: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-39-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=LAioNN1IDG6WlUHJDv8W/X17kNzAhU+Jnw7JDkfH6Rk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJntAdyrGG4ORat9hhIwYHpYsmAML/7qM2LA
 L/WXVt0lV+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZwAKCRAbX0TJAJUV
 VvKYEADI5rVwpr3PKuujNpfkhG4OHvGmc3LY0yJ2E1F8YlTiKiD3qXF1AhZEUZIcOO9Tu3h6ZMj
 ChtmT+W1Fh5nUsIa5ZRhzlMWJJsbzX2vCCIkNC+239mSZ4mTcIJJxD9EgyrQo0ldOMTC8Lf2NUP
 JJXpxSd2zMGnJfSbx0oKQLo8YglWDcrcFnCS2upDcjwoQA4pYPMA2AC92wNVZ82L+pu09Pl5l/A
 4Km2T77EIXF4aFiQM/+5HzEw1v/RB/pFqY+hTREL5r1JFy+h/fbn4CQJUsDqkb4tA6xvtbp86xN
 Plzk7he33lpo17+vTEsv5MUlwE4H+BoRJObhhqUpBohMfUHbQy3ucZqSbiomAuOcJg88nuaY294
 awQVmoAX52x5F5ULQyaCYu2BIRzVD1jCA/f+owSJpNwW8jgMn2eA08uEdPgHwcvzKEEgaXNkWGi
 BOjtIEw6SePCtIyIO1XqHi8uhNJes46f/7q6Haihx5cxoPW2bdeU4+wg36czrOy98mZtX8y1+YO
 sNcXutTHpvAhR5UNc+XBykvg8IqlELWCgKWcc82LG9ZDo0Z/2WGx4Ez1I8GwxwZS+d79GhsBH8s
 I4LDZFeyqX621PD9Uqs1qHHGnB7bb+uEDQMploDWS46n942EvB25nGc3GWJMqUjMIJ5RWp8rRz8
 2jzlgGlp/ac3bqw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX98OhBX5yVoI/
 zDUuQNqr6yl1nS5w9qp4ez47aeZs+6Lfym0wkKdcxUgmFWy1lqJ8W04KVHeH2g6KX5/PS/UJCpp
 3jZoITZpvlRvDP0MRRcDEylWU/w2TGwqD8s4gLMrx4sEBo1JhwUSvUjU9tP69eoWpPq1dJyxRrO
 1kZ87kFCwX5BKjhpPFWZ8EyjFbKCyMEW47gLgSPLoLDzUxGWeuY++jLzUf46zLQqzsuu0KY2elI
 xV+be9UYm6hGFOWCFJgfRT5EAEeWp1bdXLQ+boY2J2dYVU9rVHdBZc0S5tn3HrtYftbpcQtXZpE
 qSiLqaXXPvHqre/dquOPvIKSIHLSqzSBiFhFmyul8vxPuE1qY+UOsfCX4GbrkS9apo+vOf6TbtP
 vxVlQkiYkPfhOELHId5slzb/JT55gDws9D0wMM+PlzfhvQjI3sOtLoMA40WHK0UxM2ZVutV3/PJ
 gSPqPtit77Lok1JrwVA==
X-Proofpoint-ORIG-GUID: KQ9iPVezaZJYwtnlecmpYgD9bwj7o0dq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXzA3tnXTiXjPF
 6q9pUQD4qc9LHtPaiALAnExrQJW/WmeCXuxizGUsaw6jw/TM/6E+7ZTVzeJ3zHgQPnUsLMCfDnS
 oAV1xVpHRnD2ATP0dP84GYnAm/af/Vo=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab512e4 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: KQ9iPVezaZJYwtnlecmpYgD9bwj7o0dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm4450.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index 808b1eaa59d1..bd0f3fc2b726 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -754,7 +754,19 @@ static const struct regmap_config gpu_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm4450_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm4450_driver_data = {
+	.clk_cbcrs = gpu_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm4450_desc = {
+	.driver_data = &gpu_cc_sm4450_driver_data,
 	.config = &gpu_cc_sm4450_regmap_config,
 	.clks = gpu_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm4450_clocks),
@@ -781,11 +793,6 @@ static int gpu_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

