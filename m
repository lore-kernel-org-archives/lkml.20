Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2607B463B98
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141121; cv=none; b=EK+Ov5ccn8SAploPUlny23g6Dtt4L/O83s3qconc1X8vW37PnNSLeRXe6Rnecl9Lcb1dGBNaeFTjMxKnq6b3QndwVUciwTnHvtDTgwn4Adg8yta7HEmXrPjSxeQhqnd+tPSUiu4Dyp+JXsGRkvq/Fb/hp5lndeVPHh8NM1Xe6U8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141121; c=relaxed/simple;
	bh=HPH9jE0TvxSBboAEvZcnHO8pDtA9+MEK1a+mx71Ze9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dCWdTx7Bzbi/Ave/UdjWdIh3UpWrLjDp6rnFh9m4GQU0vhhrfVsT/5x5l0BrNgtl5+PT0tOlKng5SXAApF71IPQaQFoNm86dlTEjFBgWQO/RCiJRRd+3y/x6TIUojod8P5DGEp4hdJ3Q1Qf7FVZPDEEghziNiNXA64i5yScoPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Egft1HCQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I+8JnVyM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Egft1HCQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I+8JnVyM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEm24q1371087
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+mNRMQrZ5y0e+hJEEvMCoWzyOuVlsmUuJyJuMBp/Tlo=; b=Egft1HCQxEjac6n5
	Kxz4sUj4Gq226o2oikunn4kHRSQlvlU2adMRjavco7lHKyDIqDFbjWQQZbSeKHSV
	XNbY2kcD2Q6dtzz64dLpQyj92wFF0mcfWCCB5O23G0D25u155iqaBP/f1Tls82ts
	uFqXwzBqU2NfpdX0V+FVV3sXI5DKWzeCYv62VA1LP/SZQ7g1ni//ZtIN+W/J3EB7
	f9aZ3VeR+vCjHVXKzgcHKlnxXJ9v7yj2hrqMdy6uZcp3xc1fy8XVhXdXSU1kZ8j1
	zzkwpy55xM+VNu2fQxLqulLa8dnEsc2YYvdYGVeaST24KNVrdI1LMxv5CgnwxX87
	j5/E2A==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmbf8jj1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:29 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b3319233c2so1413626b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141108; x=1789745908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+mNRMQrZ5y0e+hJEEvMCoWzyOuVlsmUuJyJuMBp/Tlo=;
        b=I+8JnVyMoaK5bHRz0DQ3tS56yHeELtl/LPfxH6yGLHrsw7NnZizeGt/6cjn7rurbSm
         tg1sXAA+kx22uPcYaUuWbIMCTb9OckCFNuCUzbUpWEFfYBFgAYF6RX5ivTsN8gjJsiVZ
         VJ5pkbYKoTbzFcZHWlQNy1YayRfLCCy8JUz4jc+6VP3aOjSYNiHhtmmU/MXSSBbfNxJ5
         6AzcwQhG7+7AgdM4JWBIWH2CSBmNHuecX1rD79SAOE0WxsdUCH6HQCHwCo9aNSuDLyvV
         IgwyChbG6arUQX7W+Kf6d4PRxpZeuSqsgJ19Dnq+K9mcQEI9UKkJ/1EwAJh8XzbtDYZN
         Q03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141108; x=1789745908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+mNRMQrZ5y0e+hJEEvMCoWzyOuVlsmUuJyJuMBp/Tlo=;
        b=aERFSi6f2fFqkV9QfsuhKmEoYhdctiaYQkuRY6aF58BKuugyKrtoCn2FDbyYX1g7go
         kCfleywubBIWHGPLqyFWfGmSWQGXMvOgB8uDvvjxOhrH0JKaX+N+V/jfp+iFSrRIXmI/
         9WeZA0TyeDASv/y5auL0NI+P5uBlZMFFCwf+daj3iJbKqq5scm3tBOSCJAE0jtkSO4Ym
         nvzXn9FvpnRCg08sZipP/8P00uYYC5nurr9FQ0nxcFEaK1oYoayMJ3oMR57sepxQqiye
         lR6K5xtrrxZR5MzvaQJfOdan5S7LmK/bO2G0cuGpfpIlCGsY0yccBvGvqoG7zAf+Ks82
         pUDg==
X-Forwarded-Encrypted: i=1; AKwUvBxKUxoJieszdF9jbA2lGMB2Wjf+SXxMIjIeRMrg4/UY3fEbrjrf/eNUmSvCaH+YdFRqjAudmkaLD7kx1GU=@vger.kernel.org
X-Gm-Message-State: AFuF++nABMU4xhMp0rhnr5tN2MRo85x9upP3ulUm2Voy/htmUVh7jlJv
	XbH3a2oK+8QQ3Csi0on0bateadma15z5s32ejDUy3jBM5ZiDuga+mIihMIIydgWfXGuYfew9TDM
	JpXN3CI7xx6lKeTvPDN2deYn1OvKloKk+hGcLhQnbplY7sdhR90nuOQpeXv6V6L27w/w=
X-Gm-Gg: AYBFou16TNsY3Ki6jibztUR7LPQ66wpfVdWnOAC8fI3s/TcxWkoC1oLVUzogA6Vo8uW
	r9b7Uuja8PR8dZo7e3BjDt8ZfMrw8hNymmGqqjaIITRbxDaykM5yyt1Uoa8vih/r5BwTKVgXCE3
	823jrngTIvINfCY1McmeHSRPVOuaNAiYzk4wrWZCgoNEkKDcnUEIJ7GKq3NjvbuRksWoUncZF3d
	UCMMFo6roQPgPIvL0JImeQmAiaUlQj1EbG0c4WD/+JI8hm6Ga0qrMJNi8DKPJvXzJh1tNszj39j
	BrlW5AQo5ug1YSfHHCNb4Ij/O52AKId2SDdUA8HM7Avhw8kKB0S2r1NzvpIygYTBIssnfMUdZB7
	G+kSUFwumcD19EmEPgvQGXH7/2Ps=
X-Received: by 2002:a05:6808:1452:b0:4b9:e6ab:d085 with SMTP id 5614622812f47-4c3200d5179mr3580131b6e.37.1789141108345;
        Fri, 11 Sep 2026 08:38:28 -0700 (PDT)
X-Received: by 2002:a05:6808:1452:b0:4b9:e6ab:d085 with SMTP id 5614622812f47-4c3200d5179mr3580066b6e.37.1789141107848;
        Fri, 11 Sep 2026 08:38:27 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:26 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:40 +0530
Subject: [PATCH 09/17] phy: qcom: edp: Add Nord AUX channel and VCO divider
 configuration tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-9-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=1610;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=BecAQlq3TaHMxBVo38m4lxEAqYxStsb1bM863V68CZw=;
 b=f1//ctHCbi4gWmftu37Crl+H2W96k9QXUGf1z4eqL0/hZ77TEn1HIzExaxlaKiarHv4/sqaZG
 seJoInzNAJpBtQqw4GdKwEPGZ10iN99MUzD/l9kF0WDuoqk6ABNPG9X
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: iRNb_jEupLGNRfCm93YNrsQOFOAFffDX
X-Proofpoint-ORIG-GUID: iRNb_jEupLGNRfCm93YNrsQOFOAFffDX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX6E88IpbanYg4
 O0DGUWscnGZ3cgKyF0R2ed6/usJMIW6svr6GFPfyT8zjDg2zhSy519plBVl5ZDuTZyAvJTFc8eh
 oL7GsiZTVKzhRrx8mBz5MhEBoBW8MvaNCMkwZ9MMvMUG0qpNNy5f4Z6nQe+9E83b+kyARJ4tUfR
 KEV9yPY0uq1O31XRlzNXgjYy81aZ0RKYRocF2Sl2lgD1wmVxTRXdPyhA4nBdyq0Nf6lIQpp0ypG
 Lm9M2BhFpFjRo8JpE2+SF9NBYXyyg7JuXcp2nPNRrKRu04LTFOg2sWjyJmmbCNIIH5eF5a1FqvR
 bdjTnJlxY2aYeQC15Wa+mqskV2HqhaWtXLs9ub3qasXGazZqgjBpK5KDy0FV0g1sabVBbv5X0Kv
 vWYOGIa6Vj/j2MePgzLAqlecRPMgpGCestiw5R4RppFJDKjvsHrRC8ZC9FUt73wWc2E80b9ZR87
 m3kLD53YqREly3fqwcw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX7Gcc5c/HOMe2
 pKSGELCcGh79CgG1vgo24N4+M5GQ7qgeh+p81AdfqpxC2nT8YtiZdWH0ATHJzJlQePI+LHkd92N
 JXOSacjXQDBDxqokWav01moYxGyxydg=
X-Authority-Analysis: v=2.4 cv=UJFIjyfy c=1 sm=1 tr=0 ts=6aa42075 cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=1Vbz-4btua6vGiN1ejwA:9 a=QEXdDO2ut3YA:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 malwarescore=0 suspectscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires different AUX channel and VCO divider settings compared
to existing SoCs.  Add edp_phy_aux_cfg_nord and edp_phy_vco_div_cfg_nord
with values sourced from HPG Tables 2-1-a and 2-1-b respectively.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index 373f13b3d6d5..ee0d7f1a90fe 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1508,6 +1508,25 @@ static int qcom_edp_phy_probe(struct platform_device *pdev)
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
+/*
+ * nord AUX config (eDP mode).
+ * From HPG Table 2-1-a: edp_phy_aux_bist.csv
+ * Index:  0     1     2     3     4     5     6     7     8     9    10    11    12
+ */
+static const u8 edp_phy_aux_cfg_nord[DP_AUX_CFG_SIZE] = {
+	0x00, 0x13, 0xa4, 0x00, 0x0a, 0x26, 0x0a, 0x03, 0x37, 0x03, 0x02, 0x02, 0x04,
+};
+
+/*
+ * nord VCO_DIV config for eDP mode.
+ * From HPG Table 2-1-b AUX Clock Settings (eDP mode) - Nominal/Turbo column.
+ * Indices: [0]=1620, [1]=2700, [2]=5400, [3]=8100
+ */
+static const u8 edp_phy_vco_div_cfg_nord[4] = {
+	0x00, 0x00, 0x02, 0x01,
+};
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

