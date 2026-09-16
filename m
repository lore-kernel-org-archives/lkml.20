Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC034F30CC
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554735; cv=none; b=JAXul7Ptuuxbz1y9uxYA5V3tkT2t0nxsrUKU7g65MdmvcB0u2WhHlhhJT6IzUyIORtW3sYGXBWWkiIjaiSwZjQzowyMq3hjz6H05shwpfAzXazyxEqKFV5AYhNa8UWmlxXEUKGgAq24ROBFLOkfK8+DoLBljxabVexv7vLYokwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554735; c=relaxed/simple;
	bh=1iyxdTFCgs0fvXex+Hkh9Q3PZiZOUVA+VIIF9U+lR+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ehyui80Onn7zNL1uj7na/XCyA0qoH+tEqLfAz5XcvMZLQsWKmX9C6pkk6Ivgw4EhDSFNtf6AweIeqcoon+PX/x+j3M0MqsRX47WPhr8bT512mTnoXXGXXmODnr6zrt3eq4LblQW08nVZ/WT8RyqsNDyyY/HEte0J15MRF7O4Eas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WGHLE9Lf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjmpGUlx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WGHLE9Lf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjmpGUlx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G934Es2226525
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:32:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+2IkqqEDVer7+tcXkK31/3lm9kPq64fRR4JiXgYJOuI=; b=WGHLE9Lf/qARqFyT
	hYFz8eQwF6kk3YNqvoHiMHvAXYfbKzXCtOYgCluw40UMk0ZQWQgJnGA2f8oT3Z7b
	XMTLz7DjSHpJzSXpwLRWrncEviTilk1pkmPtNsT0oQH964nppeTy8cnww/BVv45X
	lFi4y81KVS5CD9Bd1hNVkvQNRWS8gyAAL9OfECRuRkZwUdUCgTimLayFKhwhdbUk
	a4Jh+ub+Mns0KuWNMkHIWKSWE5Uo4bm5jx4PbWLgs4clupQD5D2Je+Hj9HttDI+C
	jocR/SFnsQhOYkQSbS7C+7iuhTkK+dvly2zS1V9IGINZXEwS09vw995pV0e2whNf
	57qIcA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9utaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:32:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1b824e84so686479385a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 03:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554723; x=1790159523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2IkqqEDVer7+tcXkK31/3lm9kPq64fRR4JiXgYJOuI=;
        b=VjmpGUlx8Ks5qwwTKG55II7im0KtAa307GBPdD6zsinFnJhEAJlihu4XjLWkZdIYU4
         4S+inhKxT4h0v9LSjcNAK5kJoZed5eGFTKe26gqmTPz3A58lMq1pGgr5dE/1E6egK7gI
         LIz7TSkq8dWyTiDmtHVtOvOx3rRLmSkXk2hoDG3uT47qR8MJDeNEH9uJ/4TwTxGR614q
         +ujJQbuN+mp2ItEJE/ArvmD7+fCDR80mjFl4ues7S858feXmBCi3wsdOaiQ4+u0SW01I
         H60jit4d/wGCvW2bGDb4E5GjSbAzY5QEGUW1L/5mMfxW3ByVKgq7HmrTgmLmEIedoAIv
         lycA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554723; x=1790159523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+2IkqqEDVer7+tcXkK31/3lm9kPq64fRR4JiXgYJOuI=;
        b=xTE7LopjmeuQ4GJa0uVacVEKJvpITCu689Jvbf17LGSe/3jKUw7zESRSufq8TOwKR3
         G9lPx5+kJeDbGkVd0z64MftGj3apjxeBDZpIHga9rzjaK4PYfZL0AN4ti24Gn+A3J0Lf
         LoRBd9XJrakj4iXTBjzPcT4NVXgR948bV8o4+izfX1RaNesbSxPc/f2uFTjGOFO1y/yR
         xOpkue1Su48n/64MFyN8cd9IN74er/DLIOH3WnNf/NID1YmKLJFu56cq4MoAV358RgDm
         vn4U8OUG6ALavkgmnluU5yiKj7zzP6fv0OMP0Y61CguzIXjZLtYE8RDyUdYKLKT1Rgei
         MQng==
X-Forwarded-Encrypted: i=1; AKwUvBwF+VYOyuHMtj00NsghbeDCt85lC4KhORg0GKxERfaWPysC4NiOdvEVBf/6FtLPoDszYXIGxYzUv3Pz0nQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kJeosFmoI/yghPIGRfSo0nFLI5ocpjY4S973oUHq+OD7XruWzv
	PxtE2u5ZIsDqqw7akpNa6NmA8iKdrmYbMcaYtdYsFttCphXRhuOmLwFs3aMzqxyzMtcHwfElUri
	DVh0eyMfLHd/u5aalVDtzZLq9v55v54deHBFqhGzn+acUKh0JgbxMF10PGjyGsStijYc=
X-Gm-Gg: AYBFou1QH/28OHaEaez5JMBPCp8YwxtG45UgXD2GWBeK2dkEMscCLuexyMY/qWtxTba
	XWXuUvNoBMIb1jpBQ5ZWbgdOzsSNtngwOcx+qW1d0S9ljHI2eRoYcnPC1vcC9zfjeuFUtAoHLr/
	+LUnGJNcSHG/WbawzKOQX5dseRvw4M6oQiZTP3JzWjSJrPlqoYcqxlzLDUJhs/wkfo7HoBKC/GX
	xXQnYjjg9Ognokz3SXiENcsuTbqOHlZqXpY1lMJcCsRfdnxynJeM086duSZge2a9aCd2kua4ZrV
	Sdx8ZqiF/H1Emo5RjksKEgpnWIEdnn2+tAFs1p/WWknXIv03HLP5X1VKr4bSktqOun4JEBaIGAq
	EARVLtHI=
X-Received: by 2002:a05:620a:1720:b0:939:ad19:c5a4 with SMTP id af79cd13be357-93bb795032fmr294552085a.39.1789554678599;
        Wed, 16 Sep 2026 03:31:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:939:ad19:c5a4 with SMTP id af79cd13be357-93bb795032fmr293985185a.39.1789554642791;
        Wed, 16 Sep 2026 03:30:42 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:41 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:57 +0300
Subject: [PATCH 41/48] clk: qcom: gpucc-x1e80100: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-41-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1iyxdTFCgs0fvXex+Hkh9Q3PZiZOUVA+VIIF9U+lR+c=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9yZKPdBHW0rMcqMSXrMdf/2KkEh7oUvhnVY
 pyPKFM/E1mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvcgAKCRAbX0TJAJUV
 VgS7D/4/+yGGszF5q5sp/dUCjPGenMIbYCiNQpBCDSpuIQbNoUbh/mKrHnhvh1jHMhK8iKdqz9d
 Idu2d5Nz+q734pCI50tpO6WaHMHKVeoLKmGGEYJKnaWVmVJBoZtXx/J7IYzNIQX5FioL7ShVO81
 8AMrvsreO2L4yE5wuF3tepEFndtq9l9vbYUtB3HRZ4k8hDgzfNfz5O7BP21u9S1Twdo8Y6MGsVz
 hsT4F4v+NJBoY/fyY32pXelsgD1u1fUeou6ypvKdAFECHDlKxPNZyLx/6NhR5b0RRxdlvuDrMUT
 Y/+Ma8VW+LtZysPcfIL7ynQWW9b6UDyBKa0Z0fMkIMF+miaxuggp7M1PyuEirADmXnBrCH7HUgH
 aKp2UD2ps2ha55zQxRY/zGrigMuwDub4LXZ/kiyHIw61SNim+0qxwnsaeAWMihoYUbUGYwmIAFj
 qpLT78bz6T690aUc/5KVgZ0r8iaDOzqJFhDAZp9Zye00uihCwkaaTf6iVALlVzjnbZ+Td2rpSMP
 XDS8oF/i+hxX3FEGghwmuBBKCRIWDwLUfXk4O9A/0UmMSjpsGXxPpYSdnddHaBGGsyLFWTETBTl
 3QSAuGJl+7pQ7+e4Ac+1KxWeDmDLwT7qp/K+QCj4y9KjZLRCAPehWtJawp66bNSACIx25u0r+zh
 K3dWPFlVI0OmnYw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa7023 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Q3WM7qoV2j0wxbEI33wA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: bEkksIKDeiem5VUOu7cJsJPbAGkFL0tG
X-Proofpoint-GUID: bEkksIKDeiem5VUOu7cJsJPbAGkFL0tG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4A1a2sB4eUZh
 2VX8BG9aSNXve/0tr4+bu2KHKbvbn8Pu7T+Ft86YZOfcnCJxN+/ZAvjUknYcDype0aU62ioHjbL
 onAm4/d/8jk1ABr225hgU9AkIHEF4wQiwFL+tPObmPXKyAtry9yCk+Rf1t4ycG/cfZIIhjTH0VW
 8FuL3SwO0PALJleg7rUhXoOsltOoHKo6XUaK5WRRRaQCgYMQtZQawKUH+grKR0WxL/QuLaKYhSd
 IBjoyiyhO/bSXSsUGKAVXtMclaKZrZ5TFTqMtCSYubpXDfm784HjA/9vrCMb9NgkB2GK47IHyD1
 sTXPr/VNeavFgpqfKafsAXg4hWZM1csZLoELFyMC4gJttSXnrirgrFFB60cgpUJqdI2c+I7ai+c
 f8zbQj7emPELXg4kdjfcRe2WwVyMyrBIw1An/WaZicvXeILizAuhSM61cyQTs46C6/iBzaL3BYL
 niXXW+0TE+nu2Uk3Ozg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX+YYR36ERUBbr
 4pnfHp+ZFVaysQjVWFjT+YC9W0/IMXjZlEjKY3lIf5CDVLwmIY72yNYCPoOttSFGFhwYqirGwpn
 IvHrTKA6XbatkXeQsE1sO6xH+kJDy2k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-x1e80100.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-x1e80100.c b/drivers/clk/qcom/gpucc-x1e80100.c
index f9161dbaedd7..10a0b11927e3 100644
--- a/drivers/clk/qcom/gpucc-x1e80100.c
+++ b/drivers/clk/qcom/gpucc-x1e80100.c
@@ -609,7 +609,17 @@ static const struct regmap_config gpu_cc_x1e80100_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_x1e80100_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_x1e80100_driver_data = {
+	.clk_cbcrs = gpu_cc_x1e80100_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_x1e80100_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_x1e80100_desc = {
+	.driver_data = &gpu_cc_x1e80100_driver_data,
 	.config = &gpu_cc_x1e80100_regmap_config,
 	.clks = gpu_cc_x1e80100_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_x1e80100_clocks),
@@ -636,9 +646,6 @@ static int gpu_cc_x1e80100_probe(struct platform_device *pdev)
 	clk_zonda_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_x1e80100_desc, regmap);
 }
 

-- 
2.54.0

