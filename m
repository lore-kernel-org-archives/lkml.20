Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 746DF4FB9D8
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554660; cv=none; b=XRFFJt+urKr3PeAQ0T0Kt07Tz8unZN41oNaA+qF5Aa5L1odO/D3jy57c5DVvrxU7rmmw+gsDsSWPPKn8C9Zhm42yE31Dzq8UE3S+l76Er/4J5LMVoVWlx2igdYP6t5oC1k0Xa+NBXXz2kfbv5QfQj/QvkxVpAhcRf89cv3K6SDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554660; c=relaxed/simple;
	bh=U+9VQRVM4S7Z8VJMwjV5ugP/YnxuxuAFNy2XnC0w9rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OB7IPuUCbjlPWcdB2kA/8q7ZNx3FB/4C4e6SHojBQi+PEgWRDxiH2ck3e8oFblpbh6otAR62LvsiEgqP1xCZYlTjr/0G5aqmGEePX1o0DQe8fB4qYdOmodvmHHQwHFkgQ9jtGMpCBGwpRDjmEKvpxu99Pm9wJY2IZGmsWWfsrQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijOEB+xU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/vUmvpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijOEB+xU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/vUmvpV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92uhV1721215
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=; b=ijOEB+xUc1ldJsYD
	8n+G+Yw4K/CXadTfC1v2d9tDp8YkHjYJgzAUKGv1GfciAQlybUDzrdzK/wJBJ0Cv
	A3oo3mgPZDn2NoDxgOrONE0lQ0IkQiJ7GACLcqZUPhoujCVbGFDkjBjQCsh5vEeJ
	LfA7BhlCn+KXms+Yv2TjouIVY3nd6p1s7sF/aRdETkjVk15Fx/v1mGuC0t65jG3s
	PLGtaMUzCHUr5CzA8LMW423dEDnveU8VkTLTKTBJjIjv5SvR/uUI/52pcnpN7j82
	605Wtxls8vBgUR0aRxa+Fn38+FsBdh2fAjbSdIYX2ZtFI+j/b/ou4W9Y1NCM8rxr
	9zBGbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqbmnkc10-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:30:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso835078085a.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554637; x=1790159437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=;
        b=d/vUmvpVJAFt9w8anmnXkKWUTPYE1wymokPmvNupDtXQkljok/bzgHFalA3KOFPjL1
         1hvSWD+5pKJdpuHgKmkqyRitrYP6+QrpoUftYOO3hIL5A9cWss5aG+aY92JVjJdid3fI
         WIXXy1V6YUlrB4y9rQSo13p5pZ8pT7R3Ks6LkAHuoaJrpCQDuE76CV/P9ZYz/QFmR5yy
         ZryMJ9U8wY2R7MRhcXrMjIDC4T2x8VkzXUj9AFdZnGXaCYRby+YMZ57KysER/3ZyLw+n
         pDdLpClr7frLOu58QudYlQuU63L/HEuRk2aPs00wSbCgw/YfJA6iViU45ZHztvrUmsB2
         i1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554637; x=1790159437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=;
        b=dmMLZRXJfSUhryMKAgk0QiIJihG4XyB9bJZKqnC9Lmg01hq92mC/tYN9pD9yA/lJRQ
         UVbZ40s8oxRHRV6SzCMV2M8ZCc/HyO36ctmbrxv+N4KDEdI6vX+0CTqn1i9dQQr8oM0r
         WgQmCv7imEVjqjxIqtF2tGR2SDcVYB8zEwgs6hXyJMIBt2YdRgMODeec+ueqIsXP1eJi
         4hS7TN1O19mjaBPGad9KtMhVov2IhWn5A2BYdr1e0O6KwN4Pe+YAjkg0+YiOu9lkclhf
         FeAmen52nab/xySUudcn7Sff01v3yj7MaYD4dhVPXQJQkBkF2pn+1VgZvmT0wfLZWv5B
         xs6w==
X-Forwarded-Encrypted: i=1; AKwUvBwZ/ImTVmSfO1swu9HOUvKqEVeo+9/S3hmlyM7CMyUMKxio6zb8sdg10EKrvgjQe5F+CrWg0oblm7wSXX0=@vger.kernel.org
X-Gm-Message-State: AFuF++luNrEqBIYSPyBT38zu6xlm8vDUVF6XeNJ0EQ05BTuqNau+XMdj
	+4RPXXCPIokvjM6MZVMs0IvzIjoFO+62qL7rBv24jeEzltyPn2E7QP9OXrJfur1rsAj9HqSu83k
	axH4AnueH7VlwR9F7waZnDziEkd5OsTYNhCdqAZucLKj7MjEMnKaLGFgIYvJiMYAtgs8=
X-Gm-Gg: AYBFou17P72caMWU5tYtjH8Z+vzg9QCtIxFyl8o2EEO9hRE6cgagTMtWqsTZatHUnRE
	oyF99/zO3a8a8pQwiVuAdiP+FIeHBHAHr17VuSw7XJCNP+U9ZAXrti4joziy337yK9IcBSrLmpT
	s9+8xrmWLvUEaUhyX7GUZVESUqzkiXB6C5Z+knOGftAM6baZJtB2pRdDBfK+rc/30MsGM6EK0CB
	7JZI9aT7Ca1A6LE40z6P17e2DgE1nu8VaqNqHLHAFnbz75paU/A0wRJlvCn01CpZOnEqT1GCwI3
	qjmVEUEjDZSYh2XhjadbxxXcp0V8DzTp75wC8aXscoixsd3SuK/dBjB/4IuIIpIcDvQ5f3p86ff
	iRVVAf1E=
X-Received: by 2002:a05:620a:2618:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93bb76bba90mr333783885a.5.1789554637130;
        Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93bb76bba90mr333776585a.5.1789554636547;
        Wed, 16 Sep 2026 03:30:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:54 +0300
Subject: [PATCH 38/48] clk: qcom: gpucc-sc8280xp: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-38-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=U+9VQRVM4S7Z8VJMwjV5ugP/YnxuxuAFNy2XnC0w9rA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9vNtZ1AAAaxGDuuEJBhH2VfyTKPfvGCdG39
 L6eSxuqyMqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbwAKCRAbX0TJAJUV
 VqucEACCd9UTuZo6IC2p8zfCsgUYsm6g/49ObJnDkUBIIltUy7btBOAu/DBjaFkjQXTiLl06L5R
 AK5qdzCX7vuAXFERVajKMjGbZjBlUNsOf3LgE1IZ2yqYbLMh2IiXspWKeEOHoAAu2Grdi2MCf1J
 DQErmraCBnmR2gfZliuOeQUrLm3GsT4WlA22Ny/SpCrNRxYHukEb1FqUAsinNhjBeYX2Z9O2sxJ
 HbjsuC2D7Jo0hXfJQ8OnrKy8SrdtgWdG7TK2uGkZ28vMczauC8jca6egqhWEuP43SgfrWyrpqHH
 ik3X2+pAnvmYm57wl5pPODYuUJbGtLvkoHpt/4Og05WGMF/MW4u9GOXhxeiRus3QkDdfuCTr7Xz
 558A2uZ20rSRu6KroTwsGRScxqgxKaa1Knvg2u+PXzENUixAiD5VH9FM7ijoeI72/umaJ36Xnug
 GQ1QXOnEKFbPUxGWyQoNfPd4bm51oYNb7nDQl60wPmOisb2qGfeg7IgcAdWZQv065rXFYa2sf4e
 WxcDpI6DY+wsyKmDQRcCHMxTCFQdP4HI7G74YAHujhl28Gc84dZshqkmZHoxjh1w9bvN3kjngyg
 xi0PXu8QpxjZLMRngEjEqLcufP/TZRXq5KKwrzoaGtxa2F3ago73qEQ+TC/KjYrnWJ4pC5ZbWWT
 8FB6lXm7wdvfuAg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=POyaavqC c=1 sm=1 tr=0 ts=6aaa6fce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=tHUDbLQnBSC955iDWYgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8WRkhj+hg6nn
 IcuULTKHvkedQjZMDVGPTJfSZUD+yB1JX8qcRB7PAgushyN2A3MWMydJe6j28nGgrc6vVqgNuee
 62lEPjKQX48b561Sz+6cTXENj3sAT/AWor0+28CNSamkl5VPC0dkF1j4VGFrqhR/SKKrI2aw0og
 6hFGDeHa908qzfrKsajSr0oA6I2wfhzQNn9IUsZap22b43vKGdDTwce4BbZPoA2seoRDFUMFFjK
 Fh51eHfyglou2/34zUJw05mNw7LXemk6zXBkiLQCKedhypRNf19NwFBUKaMVyU7f5MaaY0s9fm3
 hh2+y6n8FFYMkbo8sBWIVo+l4MWbDPSr8zb3cQo1bRQo8719YojU1P1JJhC/t0UU7uhc8aj70Gc
 +HgHgN6SY21LdIQ6XiswLTquFDx0Phzf/Oy7W+LnmfAhHONGOjfFRIdYD2qlLIsQs2dQ/Vr3Cxh
 DphRFiceRUq3XbLadxw==
X-Proofpoint-GUID: GC5vJ6EpqgoDThjCmRp-HGl41oItSAIG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6wCRW+lGX4tu
 DlNgt7XJ/WeSw3CX4xYTdq6lJrk9t0MBl2EFUt93u5gbOrNvwzxXdz/bBDow+GFniW4fSNnAISm
 pNS7OPlZQp4pmQPKg1g4ptBgHgfgFTA=
X-Proofpoint-ORIG-GUID: GC5vJ6EpqgoDThjCmRp-HGl41oItSAIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc8280xp.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 5dd90b854afb..2ccc083a4f98 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -415,7 +415,18 @@ static const struct regmap_config gpu_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc8280xp_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x109c, /* GPU_CC_CXO_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = gpu_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
+	.driver_data = &gpu_cc_sc8280xp_driver_data,
 	.config = &gpu_cc_sc8280xp_regmap_config,
 	.clks = gpu_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc8280xp_clocks),
@@ -445,10 +456,6 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x109c); /* GPU_CC_CXO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc8280xp_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0

