Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04F148662E
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251687; cv=none; b=CFUODfLg7mn55qPS1kBZtH+Y8qQaTyGKbNx6V8FHE3OqXymDppfjtChqSZ1KyBVnJLvoCUsDthO5jKjDTgiFxFyWEnQ/5ws3TSw/8KHns+p2J7vkwLjff7ImE2Vl5EFZAaGnZxtv8jd1RrYgAj9FYW3gIJhFGkTJ60hx7CT4saA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251687; c=relaxed/simple;
	bh=CQXJofXOmMw3cH+dS3fdFOgmgQjockpxZA9akNR6TvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cmWHAGIfVlvPQThwmaOdlcXq+gtouKcdKJid5SjgB1/hRixzUCTvuCBCPqhSVA7bZGmzrgABmePbLcXLlwm1CPiramaBhbdpSB5oLiVEK/eRp7PiTmJIqW9b7vQFUmyV/mdBPqmDGsDrV68upW2VxMjcNhbGIA4fzKwRhTIb1wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bCJZGym9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hp9JcKti; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bCJZGym9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hp9JcKti"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4gi91437135
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=; b=bCJZGym9ZJXX8NO0
	9JoZJHuapsmSf0516wZ+cQSu1ltEH4yVVTEpzfCYAKhrpXMv7e6IxgsmsDFRO5Ya
	z0MgOG3TbmmOnCs31sowgwP2QVQM5R0wUyHc+QJfz0LfEaObcE9bIm/hEqR0lswE
	r6RXKBQJE2w09JcP4ROezVELTYbEjOBwvAxZitBkndMUsgr5xkiXRmrhy7Iyr/6W
	dN1YeyjMHY3tE2ErtrYQzTVwFtVkhNQB+8drZW4jI4sMgxdXAycBK/xJO8BMU+Pt
	R2bVCwB0W6rYMrnGAPGA78DHYSsRs84chYiL5cRsMZ5JKcP6iU/T9ksypB5GIxA8
	LLmGBw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1t7rep0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:58 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-790de8f0cecso559484137.2
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:07:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251678; x=1790856478; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=;
        b=hp9JcKtiQuclGs+oeGhubfjJptWNVY5XPFqVAAC1qdFr8Dr2YAKaM+cpL13DUuuJX0
         wDQwYeOA3FhZPaeYBu/UkGGsfwXAQLTKE43xnP/LT5dQkzYMEvKZNsrBEjLEmhEvSqvW
         17AMo3S6swejmuNmWQbu6dpCCUVkn25i5cti9W1bZukSc0sPqnc6soWFFfwC9761FChq
         NawsNqu5uRkBpTQQNYP2xXJgXrUrSCsXkq+qcQVm1UTg8flH19HSLIl/194o5Nas+QwT
         y361ZkdBBqlRj6mPn19EnwO1V0WsA2kANUriWwYLMgHJLfMMwj2slkuShCvIpblxmO6O
         EJsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251678; x=1790856478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ID/czw8MMUTt+UZF4aIlgMGUS18e0Go/4J1TeukaYX8=;
        b=gLxR/CibKtSd0Y2i8IqhiDw5Lx1d4uBR9U5RQi+SalljG7LPzYDlhXjsweoKFufatU
         xQFeHfJoECdgroSDsntzT6hdWqzWltJZkjxxxeJQPv4xzPGXZx03Ajw8ncj64ebfO2wQ
         Z2yD61NLXBWl1vVuPf4noIJB3E+ux7PcZZJUCNFlg+bkgCFF2M7m5bbRCFrRkU4Jlv7i
         nFhiY8SPgS1SVg4tIZzh5EOT8ftbp3pZBSf3U7p7SlmrI3gu4+iiQUM2aVxvGNVdtiUz
         ncZ2y23HweRNtKuRDK8Z4pLTbfn4zQ0Gjd4FDYdtgQnNcrh9G679MWEi4KcVqarGAj4n
         tIZg==
X-Forwarded-Encrypted: i=1; AKwUvBzPdqvOkcaigd8MzS93ynjThDeZUN4Q6zTDAjUxu6Zdq2skCBNYekd32Royp7HT9dzeVhJq1eVjhRq5qJc=@vger.kernel.org
X-Gm-Message-State: AFuF++lXQnlkmsOvgZ9RATzSJAeIC7sGHTPPeKs7CwZE7EzdfrcFBSZv
	6FI7myMJCq9fKS/LDqrWf5pESGEIXPR06e2ckLh9iG+Ism6sjBryHy0OaytkVqBitwOEwqwzu0e
	feEd9N77MGLp4u9B+8ZkVYgje2Lemg1viLPK6UZqEyYLeFd5/53jcF73oe8wx71EsPjA=
X-Gm-Gg: AYBFou0QpndtMa9x0YCStMmWHxz36e8Zv5O6MYSSHjF1RQ6xOUUnYYIbCWpBReXidRW
	+P0O8tAnTIWSmp1FcqsN3KI9M+QlXNL+jZK9bwyf+O4rX5YU4VjKB8pMaAPvb8wSdThi2Gp4XQu
	G8yY+oMTpEl+pHqnS7MrG6RggavZOmipN+wNlrIBslqHmglOcPtD4Sis7VPhMGvKJHyBLfsHAOS
	zAwvK94lqRtG5i5UM/0/HFz+KjoAJRHvcvWufYENoxaufNj0DoLWOJ+1asCCaP1RDwWuBqN3wGt
	y4mWoWkBIzhTe+spuz04hynLAyi85hn/isBxwSY1vnCpikYKPrXiQtnhotagt6TYpT2W3HaqbTo
	xbfBFRZt7
X-Received: by 2002:a05:6102:3ed1:b0:7a7:79c5:d465 with SMTP id ada2fe7eead31-7af1973816amr1126118137.0.1790251678151;
        Thu, 24 Sep 2026 05:07:58 -0700 (PDT)
X-Received: by 2002:a05:6102:3ed1:b0:7a7:79c5:d465 with SMTP id ada2fe7eead31-7af1973816amr1126101137.0.1790251677583;
        Thu, 24 Sep 2026 05:07:57 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:27 +0300
Subject: [PATCH v2 15/48] clk: qcom: dispcc1-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-15-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1985;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CQXJofXOmMw3cH+dS3fdFOgmgQjockpxZA9akNR6TvM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJQy5ONo70EP64WXP3iFcC24rUeNgy+70UOL
 qaUpPGrSEGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUAAKCRAbX0TJAJUV
 Vjy5EACb6acFzFedBqO2kT8nPcKyzUgODZu38TyD0NDJevhgdbIuqkwqWTsRBpSJbbKbmF2jkGA
 cZVK/EPsR4QaA/CivWCyeCPCyFIpvmQH4itELw/QqI+6eA55K3wVmo192gp7VYw3f7nsKT3M8qI
 0SBVBAddI5ZQg5mV1b5hUd+vDlcqh6hRUfju43B3i6FGmLWbyTMCOtArvQvtMa5FGpvXNxpuJhJ
 HwcmHxkrwtY6zBTwPtToI5U6TRYP+Ipan91+mSbXLvdL6+z/Pa1Qti2rYc7nxfc+y1yGvGZtKYj
 rzDOCwWKb1Yy0veR1UO3h9yVCiCS/Dn4byJwPkyZoNlY0tAPKvR6ap17yHDh0IPo3UdGm78NB6E
 J+k5FTV25IFViabvnjyPgxUw2z7Ppm3TsTLkQkIbsAUl+9GaGGDQzHs8o9YknscNRbjm5Y4fOiN
 wZFi/YE82KOHb1xriI/wMYoR+GKp+fgbd334SKfLbP+1NWhN6ATjYETQpfSFf7SZ6tNyWb5ye8A
 jVH47IxCGLD37G/NQi8IhZ+2uY3+0IgEFehas9iR5STdqWx6tyLfJ1WT8KLAbq9MLTVlxTptKNF
 Tm4bwM/+puWBTVM50wZKJQQJLmFkLvzbAq5wU7wUbN9HH9HHHuSkG6DMidBNLHOJlHN/8KV4+tz
 HMHXJxj6IKo9kvQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: IveicaauT9ST3cQAMJF85q13gbW56zg1
X-Authority-Analysis: v=2.4 cv=U/MHnuru c=1 sm=1 tr=0 ts=6ab5129e cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=xG6gKK67fXx6DpdPwiUA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0SXlGg6W3bK9
 duAZNbW+m9aQ+onuDh/ygz2AVfN3VxS65fx7saDKX6hnTeyW7BUWH8onLW0UQUeKinvr7JmtiwF
 iYdJx5+Rvc4rECb8kYlqHvaq81sEB2n7U9fQooZpqb/SAV8I/b6sCZg7ZKF/C956jxuVa7wSYcz
 zt2qgpbFIKE+4N5pBqtOF842Dkb1EMoz3fqswlQbObDAUHNrLNOcTrT/eXBlaO97usWq7qyT9Ur
 CkW+3QcF0cZqx7HgyctTjumGb1OUhM138qqaXFB8fd/gzOGfRBtcQKGcJ3nQdmORVQ9heyBu6lA
 2KBr+F5pbmzB2mltzQTVt1AZBoyMHcgs+qeEI0Fvh0QbJqzbbgUVDTW4/JWK+w3G+/thHn39sxT
 3Rl9SvpH975Uh22CRXHipQylKfv5ZZj9mSAJ9AXVkXqtvJ5KSgVXxHvst1uNiwwFeqtqt1+SJ1K
 8tD9OirzoV0I5ROPFLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1JGbtVcuie1I
 5M+vfhyHQ4lYiMLLI1QrnGiUTtS+z6Jh2NJgz1dUjyIyWOcy2LI2wT9PD7kQBNdzPnmlW6gMKTS
 WIP1z7X0AfNdKLfCGJUOH+WBJ+IAPto=
X-Proofpoint-ORIG-GUID: IveicaauT9ST3cQAMJF85q13gbW56zg1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc1-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc1-sa8775p.c b/drivers/clk/qcom/dispcc1-sa8775p.c
index 58008c1afc76..330d953b5e9e 100644
--- a/drivers/clk/qcom/dispcc1-sa8775p.c
+++ b/drivers/clk/qcom/dispcc1-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_1_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_1_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_1_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_1_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_1_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_1_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_1_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_1_sa8775p_desc = {
+	.driver_data = &disp_cc_1_sa8775p_driver_data,
 	.config = &disp_cc_1_sa8775p_regmap_config,
 	.clks = disp_cc_1_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_1_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_1_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll0, regmap, &mdss_1_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_1_disp_cc_pll1, regmap, &mdss_1_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_1_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_1_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_1_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

