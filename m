Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C91496D2F
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251753; cv=none; b=qqmEu6ViIkTCo8l76ONPokADgK1Jqm0PZydL3LLiwP4KhoBYhpT+4gDR7Pm8koB7EzvYrvsHPhGAMI1JKQra7oClq6D3KbIyTRLjXxLbMRAqYZqmoi68f5Akl4eL4zdwRUG78cpH/cNzUZLXuyfqIzV2i1ViZ56m7c/nNq5b6QA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251753; c=relaxed/simple;
	bh=ZlV0ToIKIheLrRQzvesxiJyF6G0753SHmic9A9RRTjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWixAr4Iuo6JpndXqkteQfL1fHJcYKFdMyfVWF9ECJ6CgezKoA4XEjehInrOOBEdI/izTH3bQsdHvwp5S1ZDS5r5xmSJY24XDF09wYnPz7ogFlejmOVrDRiasfVvW4xLRcVhxmJGNMKMjMwuJaSPnysbvzX9XbIm9YPR2KLd0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUqzIZ3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnTG/4nx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUqzIZ3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnTG/4nx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4TFi3282813
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=; b=mUqzIZ3aCF2zmXoA
	R/d9nEsH/v/jX4PF+zZ00vnjFbQvA85ZtDpBjQ2HPJdaD5OQsmt9KnRdZLUn+XAR
	hys83ZGwJAJKwaDtKZeUhWXMvSIVs9lAoQ9JVrcGDI5pleWpTgBid7/BmhmUkukJ
	e19dXRAmlLUJD1N84FaAvZmg4ngcJEuNZuYNQPD1PDgu8X9NbzuZz8CyM9dRWyTl
	pNDzNRX5R/phf0/dzB6JVkvseCQqaFNqfJFzsggTPRJaziQEHkinRZaQtNZpXeOr
	IVdpWAkQqVKAKmPmHiEpyeTK7uFaSxTRm74jQ0ziuNl997/BudVxkFv02L/VH2wj
	cWhjAw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfyd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:09:11 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so864520e0c.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251750; x=1790856550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=;
        b=RnTG/4nx4x3XVv6Cq67ifDPc8aJYLRkboyMF28pLF0rNSyLwZTPFVSkwEnYF1Q1+tz
         0wbHG4ezxyCHPy5IF6X9nxQjHc2N1f3a0sXW+AeifVKJ2aIw5cJE7TfxN2le/6e0ouhT
         uWfwQIy5rGG+R4EPvR7Kx8rqnpBu63jBZnAuYO5GjSNL8vWuwml8LIOLUfMad2zt9OFx
         S3Y8QNedngviHUC4BGR9AN+isAciCKKpu2knidCq17B2IeehhUDygYQpssIawLILZt10
         zZqzOKSy2mGd9DgG0aRukslTiFLUYPRq9uEp0a2kuYMMEkEXJOeZXEL3DPn5Edb9RkMk
         fLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251750; x=1790856550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=;
        b=UfjX5Jm+EmVUYdHWXct6OXUApcrawR4Gia2LoyVvUk0qrmMhPc3Etn7IOhxslL76pM
         3Wq1qTsJOJXx4zeDIKFBVnKlZ9y8ch8VF7rfiX+SIe4Hii6PP0YcbGagCV7ix3hOZoga
         96mnKYjtTOB+j4/wEULWU0UiW2rG2B+04zQT1kPz9W6OOlZgO9cTLFpbHYfuH09icN+r
         3qpvfe12T246b3E9WE8UB96zUVjM1luvkv3G2MF0+/eqD/gLcVwN3Rfs7SE2qEIFZZp8
         i1UCxLczLut37jldxsy+2M2bDoyHYh5Vqo3iuHYp/p3dGDG2QwkvkTXb2U2IeNm0jv1z
         qV3g==
X-Forwarded-Encrypted: i=1; AKwUvBzdII8vZAGHo3VLUADrCA2Ba7se1vgQeTM9YzxgH4k6q/ndcYoeMtFIyXwvCAU/fG1NzAonV2KpWAAdQHE=@vger.kernel.org
X-Gm-Message-State: AFuF++mdkg9qSHSKRYURfl0X9iAq3p9cljS5lx2rX3CBB6pY1Izyrqij
	+X1FJ9+odVqcdOuvyHH9jrX6R3iw++ZJMNa5gSRBaaEguRD/YGopRIuc8zAe66ClvnG3Ui7h+jm
	oftS1qODrbMbZGMEsY1NlKng76kEXcPlGbZoSK6C8/tgAhFX/JTZ9mLboil+qnHFGR2M=
X-Gm-Gg: AYBFou2obQGlk25uiQ0UjeO2vz12YSTCU0NyEnd0Y90ryaoAm5MPP1Bb/ZJvO8DLO3z
	n9FSPgTgYRVXI0Ws4REHFsdqhpNev5qiEOPWgLfsKBt2NV5T6QvsPMKCSRYU34tKh6oXfu2V15F
	u7dhRhai4OQygB2Hw8+MVX1LXnhUIaFS/e0cKmjryBq2q2dt4pig4gyZFIzLdEW1h6jGrlSsMVE
	P51lt3Jnygb4R/sdDS6f0zEQjVRooqbL52sKVVJ0EvCNjKH03AwjBgK3g46iczYJoC0rLj/rMy+
	WQGJacMn9HeGzlFoTb4p+K/mYCHFnxki/lX066J2Xd5Zx6PmyHKUdzbLVv+jmLNqL3PffPbO2hW
	J6fVsuxI5
X-Received: by 2002:a05:6102:160f:b0:7a7:196a:84ec with SMTP id ada2fe7eead31-7af1f1fe5b5mr1088074137.36.1790251749754;
        Thu, 24 Sep 2026 05:09:09 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:7a7:196a:84ec with SMTP id ada2fe7eead31-7af1f1fe5b5mr1088048137.36.1790251749022;
        Thu, 24 Sep 2026 05:09:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:52 +0300
Subject: [PATCH v2 40/48] clk: qcom: gpucc-sm8550: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-40-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZlV0ToIKIheLrRQzvesxiJyF6G0753SHmic9A9RRTjk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJoSpH0HQzLkTM5wfxmpv+jplK4B0u0n2GVE
 BVN2j8HSVeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSaAAKCRAbX0TJAJUV
 VuF1D/9Ml5SbMGeNznrPvr1sEeBSW593eGrbFmF4x+U/PEaC44X0SBXJeX9X2Q82TLY8OAvrcaH
 KBT5+LOC4nwgQK9lc8xxOxgVpRQHLsAeOiI+1xVWZn8/Pk1WkAaIF/HBdSa9PauAIX7psNmWgJ7
 4pbIT83iiD/8GgJ5cBlE/lyfUvkomGJZGS25BOhcF1pOWZzn5U86ogqpJzwVtSiHPU31xK+zwdm
 EtCxFhqFymxH9ry6beajozCFvKOb7BMz+D48EDw5GlsEImSYNrYhgh/lhe7pnzJNbKNvwL5LeFV
 N3w15rL9ntQVlz4fCgHhu83py0m9Rf0ShTrqo9rP87aPraHwlPL1FGcsB1NT2iTjUXvF+3KhZWb
 tNy1TWtVPNCpozQfe5t+g9XMQ5wVXCWqg8h6qqxwcliaFUDOAHEetdObtEJuoA1dghrjzvH2uNs
 X6YVNIljxThsKi+SexNSbWcR1qj1fp4UBhIBxKHfmLbsQOhiIbdd4V9s+1XJAQTZoPzuePe8BkO
 L4b9pOIYmv50aym6PccXoYgmrBXaLbnX0I+ZzXIBgcEP7yJYIs/hzd3ll1KTh/sbFEAb8NISqCh
 DFUfE3YoDHui5e/PhEwclW0HyK2P430fyWTo1bwSP/ojMGC8fKjPuqVRV2/CC92MnBKEaA+as8D
 nDv29ftSrxxxP2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX3TF+v+EaB3EB
 H233PhJi0YjC6BNtWX/m8IHHXZF4K+LE1D1BeHvOziZI2xZCSKi1L0ffwZHv5tBncs6KrrEhcG7
 xfcRha6aRCzTBS9jWCqJSHdQkOVxvfs=
X-Proofpoint-ORIG-GUID: P5o4SgQvOmvTe_69WWROHkEexEjPoOlR
X-Proofpoint-GUID: P5o4SgQvOmvTe_69WWROHkEexEjPoOlR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4/B47SDsY1zL
 5bAFnFo/M1wDol3C26ltWZYhHcmsLzgXIM9klF5HFKDQ+USPmtNjCxdD7dxH1SX2zOHGnpxWy4B
 tUSg3Z9ICPcOTtFmdpG/5N06TLCBk3Uc9+AqxCW2jCeoKUVuyeZh4ZXglY7PcqysKHNTk9XKOPE
 Cx0D8p8L5ons9DSs8WW/lA/AIYPcNGj4l9Tzd9H56Hu6nw8DvPFOODa0Nyw18VkpTkGQ2R+iMNE
 FidGgBQoZgT6oTUXkcQpMBc37tXEe9yfV9XrKmK5zUpztCpDHysddsVam6qHhIVLsnL5ZrfHo+s
 ZzFfyg21a/FWa99iyhDZBtzGCEWip0HznMauiCoJQf2MmV3MkibaQTFWiOOoLDM5Ntkq7rrqelK
 p6olZjIGXfFYAD//bwJFm9oYg/bCLaooow5ME8OcJ/5P4ON+3nNKfu6bA+v4tDI32c8pQuXP7Q6
 xxDRzzJI0SpdZ5n/HTQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512e7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm8550.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 53614e980b26..f8dd1727c080 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -547,7 +547,18 @@ static const struct regmap_config gpu_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm8550_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm8550_driver_data = {
+	.clk_cbcrs = gpu_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm8550_desc = {
+	.driver_data = &gpu_cc_sm8550_driver_data,
 	.config = &gpu_cc_sm8550_regmap_config,
 	.clks = gpu_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm8550_clocks),
@@ -574,10 +585,6 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8550_desc, regmap);
 }
 

-- 
2.54.0

