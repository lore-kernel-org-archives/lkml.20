Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706354CB8D9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554590; cv=none; b=b+XjoLmTNzErU0asODo6R0vQ2yZP7qTXvTIIkGhyRdC9JTBtoJeZpT1K8qAopsX3BdyEPrZf7Rsa4bWNAusonSBYKmHUedLY1CC8HcRMwlyjfCbXYu3028+lojJjjayo63pyYf7r2I/NECkK8VNN0JyKiiIo8Ma4sci3yl7owXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554590; c=relaxed/simple;
	bh=rJL1L+iwp51yuk4Imk2Pp+gUtXaREErqbRDD6Zpuq00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M7MI4pjttX+Ke4IAHtHRWyxMv6lC5LjnOVlBVleTlJDrIMGt798qud1xED5D4AbYBpbPjpYN2TEgZMCOB78hkq/6RWQrmw+yNWArAEuRQxh6VVZifuXV6i6G4EIcJI+x6hGLTD0F+XpI6K1NIBrEgT9WrrluRXWSsPiYqx0GMaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R4j8zPxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fgaFSlOI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R4j8zPxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fgaFSlOI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G932k51587054
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxMbCdaVL+Fc2ZqDAOPg/IOPnkFKbfFO/T/ZmAWxmAk=; b=R4j8zPxuDg6fGwFv
	83CXfA8phrYSWNawk6BiTkeP9Z8LqQyASdXHcZE4+YHDpbS6z6GmcCbIzz3pmRMR
	e0K+JxXpH3IJJGrp6UYmkqGuuGNX3KPfCArHX5kILE/nzTBq2F5Keszf0+x+IPXb
	+0043CgxOyBs+innnEmY/MULfjqsPrlej/XHzq4SSpNHI04VHu5FCvKVf+ZtrImW
	6JdRe3hdZuBYXRiRPpb4UNRpEqhKgvIEiO8JQ1RtXvcOOcmmkaU91/Qp+7v3Vmqs
	QEkCVYMXS3LAfiShBwleKLfdWNVh290cvfkutCf5X+xvLAsoZIAggCM/gtyY/b9n
	qVcZJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqageksbe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:28 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so26638885a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554568; x=1790159368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxMbCdaVL+Fc2ZqDAOPg/IOPnkFKbfFO/T/ZmAWxmAk=;
        b=fgaFSlOIftmzoSE6YEswOGSf/Z21QlDUyi5fVP4r5Tb5WF4rvEAXoTM4c5M2SdaqQq
         RxRpBfHwKz3MBUNInl8WlDfMzEP5/K/zR42xYTy0m35aAG3NENlzHYAsuRrM2XDhI/On
         ARc6ahFOqjCOhiIbx4kVZBLSZW/PMCYju0iN2QPRVqYm1ILACA693q7TzT0WCu0tXSx1
         SXs41i1/77JZJsO8+4cD8fdTready1yr4N2kgjgMRF0OiTcVc2yVhgBoaB6DTA4dsISf
         H/nVkbs5nVVi4ywsuAGlyZFgDZqvaxnooH6te2qu5mCyjcsDa3zKwN9K5Z+0kcz3gtlC
         Qtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554568; x=1790159368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxMbCdaVL+Fc2ZqDAOPg/IOPnkFKbfFO/T/ZmAWxmAk=;
        b=hcIXlvptW6sAmIq53k+U1pjXdKz4VR+UC2dX8c2dXem3TkWZBrqEoYeFym6rtsQSi5
         RbdM+Vql5GLxVGakYRa4y6NP4wCfTGH0Cy7iudVQEqTSgD7GHUOJbR251yUel/sAuEww
         CG6/ndt4tK9DK0JW94TxiQfQpFkapCQSggqUKLodol5rqw/paz6wWwFrXUCTby27EzlM
         4FxkhMwwUiEv3DnxAb5+z0e/Vatxr1JHeEhT/RgR9smGPFewQW0Yvb6DmyXyBrAusgQR
         5ax9btQaIy+AlhVtPwH/c71vGc6+SVeNiKwhjye/6aaCKJGv/R6ujb0HlVKHVvrzJ1XI
         XTRg==
X-Forwarded-Encrypted: i=1; AKwUvBwKQG40vJMxwCWIW7Cfa0agU+otSWiHz0/slCZfxHUY/7TnLX2fz3h6/LASIZJ3Nc3Prd8Z3dy3KcPSeMo=@vger.kernel.org
X-Gm-Message-State: AFuF++kWYJh0sSPhv4tafXxwfOZ4BH7er7VCNjPYWJwCbyp2It1w2QFs
	DGQp/mVtKFNnvZNmb87CXTvQ9JSUAmGYb9a0fp0hcvTJQVsMAlJYeAwfBISac4sEu76gq6PqabM
	BOe9JOZEaE9cmkNqhU7hqS8pD71ME2iaGpvYdPogPlS11Jhzw0mLpUkpBMWVNs7UCrLA=
X-Gm-Gg: AYBFou0ksUD6JAs8p7nUjeV9vOtC5DOapozRPbdieNZevTMBQXVffupw5eZ9IV/r8Gn
	fSMfQjmhPAzH5hTJMNmVboHSARg5DVQdo+Csw1jsKdNQSDOgRffZZCHH3X5Tv3yMV5qWIJli0FP
	oGifkBUZSkkRyKdX/JHduoLZjcFc0rAhmQKULgF5DfOxwWdz9B8pHeYLXodRbqk1+9DzZ4ot9dR
	njMLuo9GK6kGmcD82hUqheEc96Ilyvpvk5kB11QzhkwAxZpNSbdnVUyH13WfcNMpO4MPhteLc1d
	bK3eTiY8UsFA8YHhfRuPfnwMigRa6QjKqQOs2ktdxAE1xVXXkgj12w3p0ddQgi1p1YLz1JkZG3H
	aTQT1FWo=
X-Received: by 2002:a05:620a:4409:b0:939:6de8:43db with SMTP id af79cd13be357-93bb79487e0mr296748085a.47.1789554568167;
        Wed, 16 Sep 2026 03:29:28 -0700 (PDT)
X-Received: by 2002:a05:620a:4409:b0:939:6de8:43db with SMTP id af79cd13be357-93bb79487e0mr296744685a.47.1789554567693;
        Wed, 16 Sep 2026 03:29:27 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:26 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:22 +0300
Subject: [PATCH 06/48] clk: qcom: dispcc-sc8280xp: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-6-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rJL1L+iwp51yuk4Imk2Pp+gUtXaREErqbRDD6Zpuq00=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9QBuI67EondQQlWsSA5YKz3g8vmaGns+xeo
 pGSxXnMcnKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvUAAKCRAbX0TJAJUV
 Vs6xD/9U3b++Vm5F8gT8kvjfdeFYr/rh5MdHnwmTd71mRvmnd5NWDjMDMiRTVHKoaNKMFKOpGzu
 2f6OTI2zYU3RTv58ur+W8tiF+xE8wTuRwVddPHr+vdM16xDPG0OsQQOHIZLBSBLETyuqwUqQIvS
 g/QAJzu+e28GpTWMClKcyLF3N4koo0DC50jeBSnpRljWABac64INh0Sxgao4dy0jCoTO6I4X3v/
 jW/NdPcIwX552XaDdTXrTuHATKM1O3OvMW2AFjEXQAeDANrBsLoioIgf3MJxBURGPiH94YTlKLS
 IMsTIt/X/S1ndLLBkR8Y59jyJmAcH9zMlHxSoij/LApiEv3pc9ns2M+zM15Z7BrTQ55UELhEvjn
 mg3gdCm/uHuGoJMOdmTumx05y32haHXKIz4DzhxdH8wbJ3tKm1Hry/zjwm6ayUdwQ3oxWHRHeW8
 RdZ29NvYYg912SvkLU+rdLXxmmr/tGbNpRzTMLCUtBbnzCRqogUmAk2J66c8zPCrwixLz03z4pw
 WJbjKZl/sU13X9iwHrS61jJIok8cyxyikXQiliEkErN60XNjB2t0BSufs9C/VEcmfq9U3XjCl5o
 RyQ8jBhy8HXGvjIMtPZCQXWkgQpXweO09QvtHQR5+o3MZ65h/4qwj4fV0Jh7Pr3vG4PoC9h2P0z
 uCetdPHzTC4xFkg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+v8waxqr2EFw
 6bj/cJKxkUdettf+KZNxGErdg6yLv6VshWK6Y4lRZfugJjKfx65A2rTQTS3eBF3rkQv/CDQfP4Z
 ao14UHW3YttcN5etBvPgO0NXvLDX20I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4afKIUDnLyCj
 VYcUEJR/Hb40oOyV7lamtuO0uZwGI9Cy8Js/s51sHc/zHKeC+MlmdeG80ntFG9XZNJV9Nln802+
 i+NhTrVxQ5cAGP4oSNItolOrVgb49U+YFr0dhBZppNcvW33KOVRPs46vgp/mFA1BYCDi9HmaYf7
 LxdJz4FiFfhI52QYQTO4OTW8thHrb2Xo9Ro/Y17KCMO6ELw880SLdOxl/pZS5r2oVsuSWKcIPjS
 4k8k+VjW3A+t4VWccHj16ZHXrM21HpOat2YiqvWK+89/DMT+uxVU92Nmh33t59395BB28Y5vg6R
 1ge1XSDNzAlCld0GReXx9glBVYQFYkYgV8t+9mhI1TnxzB5L7wDhF+ajx8wNOi7GdleZCeAeS7L
 vRNQSMBkgWT/8Pl8HPMvM/tnvd1ibXkuB7Dy96g8hd7CgixNvxEKos5dtvmAZQLdUL1FYM6v2kU
 l38hjgjB2blYFpqTgrw==
X-Proofpoint-GUID: CF9ig8wzv9wAjkEla4BH3EYjQLXgqu1F
X-Proofpoint-ORIG-GUID: CF9ig8wzv9wAjkEla4BH3EYjQLXgqu1F
X-Authority-Analysis: v=2.4 cv=PcZqFShd c=1 sm=1 tr=0 ts=6aaa6f88 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JaSVaRig_KI77aDXWKAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Share the CBCR data between the two display controller descriptors. The
XO branch is now enabled by the common probe before clock registration.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sc8280xp.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
index 96609bd5233f..96b3e5505279 100644
--- a/drivers/clk/qcom/dispcc-sc8280xp.c
+++ b/drivers/clk/qcom/dispcc-sc8280xp.c
@@ -3108,7 +3108,17 @@ static const struct regmap_config disp_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sc8280xp_critical_cbcrs[] = {
+	0x605c, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = disp_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp0_cc_sc8280xp_desc = {
+	.driver_data = &disp_cc_sc8280xp_driver_data,
 	.config = &disp_cc_sc8280xp_regmap_config,
 	.clks = disp0_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(disp0_cc_sc8280xp_clocks),
@@ -3119,6 +3129,7 @@ static const struct qcom_cc_desc disp0_cc_sc8280xp_desc = {
 };
 
 static const struct qcom_cc_desc disp1_cc_sc8280xp_desc = {
+	.driver_data = &disp_cc_sc8280xp_driver_data,
 	.config = &disp_cc_sc8280xp_regmap_config,
 	.clks = disp1_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(disp1_cc_sc8280xp_clocks),
@@ -3167,13 +3178,8 @@ static int disp_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(clkr_to_alpha_clk_pll(desc->clks[DISP_CC_PLL2]), regmap, &disp_cc_pll2_config);
 
 	ret = qcom_cc_really_probe(&pdev->dev, desc, regmap);
-	if (ret) {
+	if (ret)
 		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x605c); /* DISP_CC_XO_CLK */
 
 out_pm_runtime_put:
 	pm_runtime_put_sync(&pdev->dev);

-- 
2.54.0

