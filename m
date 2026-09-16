Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01E4D2EC4
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554591; cv=none; b=Zo+3CAoVJTAhczUnCzlRwZ+Ud31mRVkHS/yRn9Do1PF3wtN/Mo78YsjgRagGOC935CI7uYSQ0idRYY1r/1R0/3Sc3+yPCZLFmccqJNbF+ogqW0scH4Tt1GqcGKPna2q/IgaM7XCU4v+Uo/NrzqbE7pmQ2VFs+U3eDZjE66UdPxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554591; c=relaxed/simple;
	bh=J8ELAhoIpjnImVTW8DOoahvNct88sOBJ3fkgSfxEmuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Je8IUQiTFc0PwRS3osQ/OJf1BSgnVGZtHkjn554XHFRZSNpqnnE+Bk1UWdM5GlC5V+lFc1n/J4pKqf6vr0hs7J3N1/Phpg9fnEPyBN15cLAYp8YoVjMAuCBNWI8Qh8DrWBWckO/WkQJvd1xb8s8I9Fksj6NBTez4p+kgOhVCd24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hjeDK2er; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ELGEEedg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hjeDK2er";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ELGEEedg"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G930Ib2822773
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=; b=hjeDK2erWxCC6aYw
	gWqKX9PoHtlR9Y/2nkEW3nDa7H04kwUBrSjN6rDSFVo56h+v18biQIr90FYy8Xm4
	jT/eWhQWmVwzLmhy1dlMg8hnLx/kiVf6JTlIxwCgmDV/Q91F5D/veIXNX67KOhkZ
	dnJySJQk2NpXzuctX+KAcLL1UBOIh5dg1gn83QMBlK1lF7P0+/CC3HnR0Zt071IV
	jGZcBGfDvhlUZOO7K1uLpnRWzK+98W/IFu42X4vKwrXrs41uN7Vosx+Ljw0xTdLq
	Odo0rW8FdKNohZWGy8AY9D15YGYcNd7vRDxZgai06rCoPVSA5tsDURBaHY2Xv7Kn
	NaPuXA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqfvfjb94-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:29:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9393ac4961fso658923485a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554584; x=1790159384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=;
        b=ELGEEedgugdcEijt/Z0YcBz6LeANepoNcC1z4aIaL/RuxX6VmPZ5+V9h63yzvhHpU6
         zui8NZ1Ob87/AZvQnRTJxVbZ3o6GAIXRVUjRBBt+3+LjrvajYU7TCkbqC9qM0O1AFzgV
         qY6OXvL/XnP7uG3pV0+YIvJmRhWi+dx9rNZ9AGvJQqFtyOQfdEtHqdqSF45sex4ih7e4
         PODkkzP1xLEDPlumrTnzn0G0TVEFJ2mnBDNi6EPYNAbd8w+7Qxq4hEXlPMOMemGrwcV1
         gV05GuosOpxB+EeKjJ0/jE4l14mT95beMNjLDCkRgeZydM+rH1DHEUfj7y0e57XIMYB7
         KBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554584; x=1790159384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F9LDF97B2phcH9cg/WCxnzSZjo0ODbK2XBNEqzipB0g=;
        b=TWR38Or5ViGxKdo1jXGdgJOFtjkiqzCru8aPXcA3JgI5pqKpE0Gmf2uo0QMR8gZcXs
         Xi8nE+o2lhyOmjn7EyNq/gBEp33yZ9RktjrylZNrtiejBhdA2fXeLfAnNnwOcxcAKzPI
         v7KIfU9DzAIkXGurvHkVM1txqLfV47Kq/x0PC2KeyWIukNkuOT6ZxBL0EbfD+Cmaal3u
         LHm9Pfa//Ct2bH2yju4gxXyiHw9RstXnpaNG738eWlGTp+DgpFLu1hhEcu4kocHRqosC
         QHAva1Ek1Y0xXm5FzNPkkNXw+ipqDDWWxbJBbGYg8sPSPo0duFq3vSH3QcMYFOQUPFhX
         2ebQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK1slaNKIuRTfLPNCYWD/BYCNyspy0IEDhS8QxhkaYcvntrBiV0xi3Nd0Kso4Y5Nwv23l717sYi5wUYVY=@vger.kernel.org
X-Gm-Message-State: AFuF++kj4oXLrZ36+9CydlwtQeUlyqB5xdb11OPWHpXcv7IuEDxNx7Qe
	BLdLLsJr/15UmjRp4vkytFx9aIiyLichZYD6ETT1IZrB8Eqpon5uJ5GFeKyfG1oKOUZh9ml9O4Q
	FuIOzZvc0u+ooBk7v9VzRb86QBOq9/D31NQzKd3oBjSBf4h1NGWt2VYyLd7qQWNgzhAY=
X-Gm-Gg: AYBFou0/QbmUCn9Wv948anxaLk7NGDAseMWmUZpM+DZxmvA60UCtfTpXqG2ov2BBKtY
	Y9oZF5pPVrhZmAg8hXtJ/qxABJFErUJ05TEoF7SHRW1IiRJ8LT5H7pnJXY+D+N6iHZQW9GoqkrG
	s+cfiLHpBfThXkBBnNii1wURdX3ICVpHk74zjBC9S53W+75kw0XWY0L1hcJoS0cWqNOsgyLHiM/
	82wC3vP3WTlX1yBxe9lrBz2HeLBv5rqPEVPxi/KVGW2IID2OTL5KALC8CLzBHYIDgb/mw+QG9Jt
	wNUJjZETNPnlbLz5dX5S/cZ+9oUhjBwUnBsI9lyO0Ook+ghLAKjuHzn+iYN35xPVjB3M51RtUAd
	PuGOvn4o=
X-Received: by 2002:a05:620a:172a:b0:93b:6113:21c with SMTP id af79cd13be357-93bb772b093mr287588285a.10.1789554583568;
        Wed, 16 Sep 2026 03:29:43 -0700 (PDT)
X-Received: by 2002:a05:620a:172a:b0:93b:6113:21c with SMTP id af79cd13be357-93bb772b093mr287584185a.10.1789554583028;
        Wed, 16 Sep 2026 03:29:43 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:42 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:30 +0300
Subject: [PATCH 14/48] clk: qcom: dispcc0-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-14-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1924;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=J8ELAhoIpjnImVTW8DOoahvNct88sOBJ3fkgSfxEmuQ=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9YtvMIg/QuEFt4BcIAGXva9SUvsaeSRly0R
 HPZD9so9vaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvWAAKCRAbX0TJAJUV
 VkndD/48DNEa4rYbbZQ/jhhA/k9SVne4CZDHVRHhBJ4tHSRJsblzuvducvphq2zFfyW0Or0Q++M
 QLw0RnOZn5Swv1mf29GTCxOxg3M8s+W6sUwtpJOBVRS0BypWUV/gGRlkhbV5/GyvawKSJ2x9qRO
 A6fOJCBeEJFzUVD3+8fAi3BlyphtKyMlgYIRgt6CrHfE+6qgPrHa4Lxn8OCGdph3Srd9+2hFQ2z
 azMlH8BHQjsHMxOs3gBmYUwCQhKCF/8swFCmXfWe6n2ynMSzJrxAiFqF/5xt7hQs2QZmmk2Ukxp
 qpfqQ5x4x9wvo80hsWxN8Q4t0+J0kSME8fTceyeRLJNAC1JyNinzKkPV81/+J5wKv9fPKZLKxst
 qBOJ5LqSjqEpPIi0c/wpalt+haYEWh6DbW+Qd0o35LksbgaAyLZN2HYgS6+MRyAiEe0+T67qUkY
 UcQBHoQ0NNGH+hPnHlgeVgqhZ7vvu8zsp5xh60AmhvhcdF0Uv+n5g86oIxLzeBV+Fn3Tx42fYfA
 JEfRqTc6Mwol1QFnPmH5Ighj0PeA4a3geNjoOmTscFL6qT1u8qxsy+rNk3C50Li2IgUc5U2d/Ht
 BwSvR41owPTYehMED3oZYXf6X87rPcWodPdQFGiIwMi5/JSckPZq+L8emRpwogYmCeCpI4VYpsy
 hh3CaByVp0YVRXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=JYkpPkKV c=1 sm=1 tr=0 ts=6aaa6f98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=15gMRk_Tn8l8Lfg2mfgA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX1CAPoXguBxxP
 ArDkPdPwX5t+Qo5K6h91R6TyrQ6Uuu8IcnOWeTJddcJHPJr/fL4s7qTIS2ZVYjHUSfB+FyKWQ8p
 KrMWE+IuVlvIz+X13rrwZD+pNDKhdfW0wkGNG3Ticp2akS+UpXZdISx/38sxWVMOK/i6zReAucW
 jrPPz+Lt7GT7zqJKJlvMA4+o8871BMhM8mJKwOSGgvQc8cXeo2kObPhT1mtTWLYV5i10ugUfeM1
 /hwlgLsrtbzF322O7DyIVx+Tduvs0I6JMqGMW059fIGSL3QFvMlk/Cuu6sZsK8j/cr8rRInXMNS
 X3BKg4hpndBaleum6gZclW8+w7y4/8ZcZx4QQ4wBJ/3vJ5fHUq2xj45ITIk0WQr1IJw9d7BDOt6
 mK/ryaSoE95uwWZzRSkZBgOxhTdAmU/2zGdrUR32arTZyib7FfhVEm96O0OLxHsoIkzHLG8TAky
 x6D8G9SivOxr6JRk+zQ==
X-Proofpoint-GUID: X6YZUvoI2OrMZsxO8vgOWq3YGmXdSsa7
X-Proofpoint-ORIG-GUID: X6YZUvoI2OrMZsxO8vgOWq3YGmXdSsa7
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXxJ3Ll8lT+iXv
 R7XPwidHyOT1qp2No7lEWSKdjpTAxKeBoEORdtkUAL3UqC4iDSjBzvHuXJ2EDeAQ0ySL7wexQFw
 lgNPqcna7uRL4dQS2yQkwn92n03Ts0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc0-sa8775p.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc0-sa8775p.c b/drivers/clk/qcom/dispcc0-sa8775p.c
index 0e976442834a..a1861cc8343e 100644
--- a/drivers/clk/qcom/dispcc0-sa8775p.c
+++ b/drivers/clk/qcom/dispcc0-sa8775p.c
@@ -1414,7 +1414,18 @@ static const struct regmap_config disp_cc_0_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_0_sa8775p_critical_cbcrs[] = {
+	0xc070, /* MDSS_0_DISP_CC_SLEEP_CLK */
+	0xc054, /* MDSS_0_DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_0_sa8775p_driver_data = {
+	.clk_cbcrs = disp_cc_0_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_0_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_0_sa8775p_desc = {
+	.driver_data = &disp_cc_0_sa8775p_driver_data,
 	.config = &disp_cc_0_sa8775p_regmap_config,
 	.clks = disp_cc_0_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_0_sa8775p_clocks),
@@ -1452,10 +1463,6 @@ static int disp_cc_0_sa8775p_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll0, regmap, &mdss_0_disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&mdss_0_disp_cc_pll1, regmap, &mdss_0_disp_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xc070); /* MDSS_0_DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc054); /* MDSS_0_DISP_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_0_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

