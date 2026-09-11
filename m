Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064A3489878
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141128; cv=none; b=oCdGQFdF661ShyRj7HKPSFd0qxgQR+yaNIko7T8H+N9N3t4b9xo7qpZeZjZ4xAxmRv1yfOD+rBKCL4Xc2TiY1oVwKIlkrR9IpIBWOwyOXhAJXLTCPCYbRVmMlG+uRPUepg7opV/L4WWZlK//zkwmrzH+Zi1ueO2opyKYSKxQRyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141128; c=relaxed/simple;
	bh=FeZWFhiOZuA34C51rdNymhyXxOqLvIaJVLaOnAty0LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hl1rBemtG9Hv3c2OU4Kbuf5Xe7i4EbbmD5X0QJRLk2p5HxSSPkm1xl8mp11zB4H3C9owXj2PCdLTsjIwDsbPjdM7Wlf+SOFJz8GIXonOjfFRSYDK3Q6rnsCNTCjr7gdaDkEqxz9mgQdZ7eKuY1HxlD1lB7KW6dSBOhisSqx0Bkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ER3OAoWv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HaypT2vu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ER3OAoWv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HaypT2vu"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA8R0658391
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	544PPlpv8KTF7vSUH6ehJCfjvM1awtYfBnmsoYrqWyk=; b=ER3OAoWvCqmWe/jI
	ll7qWh1j5p9MBlGXaA7WV0SnB0UqQuwH5qBW6c2AGtqtFNlYIY1J+UjZkYdwAOsa
	sLRZH4yJlKex24p2krfY/R5EPz+YRvrn7yE6imTSrnwIEPgd4Nl+QQjsoRW9gR9C
	v2S+j1JwV8ekBrmuHKoqbBg4zkIpx4QeLkYMU3+Tpb0Ho5dppJxjXpAi73DpgCiX
	hWrvW8X8OBMel/6py9lMCf3EjgCwxoVL47b3mgbzHg41jE6qGT1hZqoObFV2wSpv
	s5exf56Q9/fHHSX3l/qDuZxY7EHWyWAU74yeRbq2+E2TSKB85F7DJRr8hGSNoM5t
	Jt4+Gw==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r434-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 15:38:38 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-46a12cfc288so1345456fac.2
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 08:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141117; x=1789745917; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=544PPlpv8KTF7vSUH6ehJCfjvM1awtYfBnmsoYrqWyk=;
        b=HaypT2vuCcWrnU2wwAyRpgTgtL9z/6LOqrdTgXi2mL8CMhdk7J6LZLsV5Jqd/FNiIy
         etou8+RtX3FVgP/YzyJEkRz7SNUzZAd/xce+54MsLLcaB6v8YH9M8fYuFnm84JqD6aVS
         bgIgBHAiuz6YYYj+w0q/2R9D7WPFKd2XiHFfnryaGxFv4D6P7eIGXhTrw0HOGaWS1YYx
         wM6fGDdBz7t6Ot8SAUAzESyF4gEk5FA13jEnKM8u9dqzFR2TMlLfZROalPAPmA3HDsKd
         hhd+R0f23GQZ047naKyeSsWAfIQJAVMU7wS717AqD+tECNwikyT4PKUlNB2xmnFYNQwv
         jEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141117; x=1789745917;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=544PPlpv8KTF7vSUH6ehJCfjvM1awtYfBnmsoYrqWyk=;
        b=S0FIHS2h+LkfIspHvMAL/W+hrsUZs8AyqRffSVW1AvzfqWRWyLpBqIroIFZPhRIdiH
         44pLSHeovUG1E4l4HICsVzWMO1gSdDmYVLOkMc7h+Vo0jkC5gsqZ2uEzM5BAxYod42TF
         iitfnlTSSFWt9qNFPnnorzMR5mja2HYylq5gSzvbnkDGa/2BpqTXF/moxl9YIxFNK6qM
         oD7rKWcy4FKmno75Bdhh3oKKIrIHfC2MiyxN/iKsgFd3GzRxLodIfheReAZnq1bu66ZK
         EA2V/4gXS1y5FgfEFg7aWmxJhrzWJn3ceKFPJj/ADVjopFdwqmK46sUQRSR2zHO4NG87
         NDrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzeVpzvMyq/KcY4gfNnwCpcPZsS6MBASxXiwSHKKdJNznY4witnWNbTbTtXlGabXbLXsiC8DCet1DOOY40=@vger.kernel.org
X-Gm-Message-State: AFuF++k2vgBz8jip8sa4vW6rUlWukHKl8CKSxTzPbJpyfUjOgNLx9Jbx
	WKK3ZqvQ/jqPBZKqM1W5SH9xsInPycP+O+W12rtWYx8tH2ETopGqKLoOy1u+v72XIkDE4kVyCl1
	TwvktmSeqRw+YKljocwLv1DA6UD/XUr9NhZMNriLB2j1WXzgZkQ4JJv7ZJ9JGCru+8pc=
X-Gm-Gg: AYBFou1iakDr2lNZzJVBu0JqemdzvT6Hbb7nu8hppPdelbJ7gwrXPhHhyRrHyuOHb5t
	wtskIr/e5JNz3M9mv+05uyGJXDxZuDsCpPYLOIAJOTxlDp7NVB0MKTrWRFct/GYybcU93Kdfu08
	lrT10OTYybhXXSmooOPRh6WjfXergsOzjQEN4kRiyhqxqBfcguoFx+Abbel7kUgD4GoXIaylP67
	IMyj2VmVuLsWhS+XN0aYJEzDYLysDvQjg+zpLGmwDfQetdQLVSAB8pOFWZUv6jtQ/YO9Cis7MhN
	1zu7pPvacVhaJmwR5sSBZ7UCosNmAjyC1+4UZXoN+8oM/TjlUWoBEKntW8v+99u4PQf5WeyucaU
	Rz4/5962tMU+vdNgFmL6Z7eY4duk=
X-Received: by 2002:a05:6870:252:b0:467:c40d:8920 with SMTP id 586e51a60fabf-47de9ea8d18mr5880830fac.11.1789141117470;
        Fri, 11 Sep 2026 08:38:37 -0700 (PDT)
X-Received: by 2002:a05:6870:252:b0:467:c40d:8920 with SMTP id 586e51a60fabf-47de9ea8d18mr5880783fac.11.1789141117021;
        Fri, 11 Sep 2026 08:38:37 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:38:36 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:41 +0530
Subject: [PATCH 10/17] phy: qcom: edp: Add Nord voltage-swing and
 pre-emphasis tables
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-10-e25c073cf1b6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=3594;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=KK+JtcaGKxOZhpeU9EbHQrvKXGn1efmjoLj5Q2mLrks=;
 b=P63+IEbelT6qmuz4lPHsT5NeSKlrlz+E6ME+S4QOOsIk+8rALitGMqXYUzsBNWiRFI9pnFPlA
 XvcQzcbL3gfApUhx1lOoTtZlimO5WZzNi145uaaDbw4C1FDhN2O+9Yl
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXwkC583VYQk9L
 La9NLnaiHc63A+V1MYCI4tFypm0SAE5vA9SGiuheyFsUFs0Y+KzWonkpQKRaXHfuO3BD2gGaM7I
 HLJfGk2wHt8QPTkM7CwsYPO22hjVMIYfwigfCBCvD9qrviniiCXxgHhzvDl7I6lKGQDjrYhYLyc
 RvPTWWCl4aubh1P6JcNEa8txDG9eMc23lz2ZogIqGWLlwZU2LgigEMH65WOOsgyVSmoHgRmsa1J
 weQwRa4m8USsfCcei8kMSnbL8EavQCScmMaLUOJSjBjso6EGSfT2LSu9lJaVMF8f3coARz/xGfh
 GG5wMhWoay+/kxBFae7Gq62RpuJmY8feg04DWVfr+HY77U2rNGc5yzt1bdYvUKNUkdb7MkXlq9V
 zUmDjXXunO+K9Pfa6m8NmOLH/Z5Qt51Ot+u/5ck+mEofwCih+CZdS3+bc0YQnezcGgzNbF4r+qk
 sIkBqeBA76mwjw+I9cQ==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa4207e cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=1VMeiWxxgHqCBInRz6gA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: ZpXHjuSZw1S3uyv5Mn_HMOwBaYKxdhY6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX2saKZkb8Jae8
 +VWLsrXSMf+LzGmCesM6BWo1C4rUJzjSVJA84u8/XD/uknFCgW8hXpHEMn7Z/nGSPe4TbkhHqrO
 3MmhSMHw7u2mvmxkrfuUSFYLGsowPrw=
X-Proofpoint-GUID: ZpXHjuSZw1S3uyv5Mn_HMOwBaYKxdhY6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord requires different TX voltage-swing and pre-emphasis levels for
both eDP and DP modes.  Add four pairs of 4x4 tables covering RBR/HBR
and HBR2/HBR3 for each mode, sourced from HPG Tables 2-2, 2-4, 2-6-a
and 2-6-b, and wrap them in qcom_edp_swing_pre_emph_cfg descriptors.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 85 +++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index ee0d7f1a90fe..64878398f43c 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1527,6 +1527,91 @@ static const u8 edp_phy_vco_div_cfg_nord[4] = {
 };
 
 
+/*
+ * nord eDP swing/pre-emphasis tables (eDP mode, low HBR: RBR/HBR).
+ * From HPG Table 2-2: LDO ON 550mV (0x51).
+ * Rates: 1.62/2.16/2.43/2.7 Gbps
+ */
+static const u8 nord_edp_swing_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x0d, 0x16, 0x1e, 0xff },
+	{ 0x11, 0x1b, 0xff, 0xff },
+	{ 0x16, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_edp_pre_emp_hbr_rbr[4][4] = {
+	{ 0x05, 0x11, 0x17, 0x1d },
+	{ 0x05, 0x11, 0x18, 0xff },
+	{ 0x06, 0x11, 0xff, 0xff },
+	{ 0x00, 0xff, 0xff, 0xff },
+};
+
+/*
+ * nord eDP swing/pre-emphasis tables (eDP mode, high HBR: HBR2/HBR3).
+ * From HPG Table 2-4: LDO ON 660mV (0x91).
+ * Rates: 3.24/4.32/5.4/5.94/8.1 Gbps
+ */
+static const u8 nord_edp_swing_hbr2_hbr3[4][4] = {
+	{ 0x0b, 0x11, 0x17, 0x1c },
+	{ 0x10, 0x19, 0x1f, 0xff },
+	{ 0x19, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_edp_pre_emp_hbr2_hbr3[4][4] = {
+	{ 0x0c, 0x15, 0x19, 0x1e },
+	{ 0x0b, 0x15, 0x19, 0xff },
+	{ 0x0e, 0x14, 0xff, 0xff },
+	{ 0x0d, 0xff, 0xff, 0xff },
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg nord_edp_swing_pre_emph_cfg = {
+	.swing_hbr_rbr		= &nord_edp_swing_hbr_rbr,
+	.swing_hbr3_hbr2	= &nord_edp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr	= &nord_edp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2	= &nord_edp_pre_emp_hbr2_hbr3,
+};
+
+/*
+ * nord DP swing/pre-emphasis tables (DP mode, COMBO_PHYS TypeC).
+ * From HPG Table 2-6-a (HBR3/HBR2) and Table 2-6-b (HBR/RBR).
+ */
+static const u8 nord_dp_swing_hbr2_hbr3[4][4] = {
+	{ 0x02, 0x12, 0x16, 0x1a },
+	{ 0x09, 0x19, 0x1f, 0xff },
+	{ 0x10, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_dp_pre_emp_hbr2_hbr3[4][4] = {
+	{ 0x00, 0x0c, 0x15, 0x1b },
+	{ 0x02, 0x0e, 0x16, 0xff },
+	{ 0x02, 0x11, 0xff, 0xff },
+	{ 0x04, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_dp_swing_hbr_rbr[4][4] = {
+	{ 0x07, 0x0f, 0x16, 0x1f },
+	{ 0x11, 0x1e, 0x1f, 0xff },
+	{ 0x16, 0x1f, 0xff, 0xff },
+	{ 0x1f, 0xff, 0xff, 0xff },
+};
+
+static const u8 nord_dp_pre_emp_hbr_rbr[4][4] = {
+	{ 0x00, 0x0e, 0x15, 0x1a },
+	{ 0x00, 0x0e, 0x15, 0xff },
+	{ 0x00, 0x0e, 0xff, 0xff },
+	{ 0x02, 0xff, 0xff, 0xff },
+};
+
+static const struct qcom_edp_swing_pre_emph_cfg nord_dp_swing_pre_emph_cfg = {
+	.swing_hbr_rbr		= &nord_dp_swing_hbr_rbr,
+	.swing_hbr3_hbr2	= &nord_dp_swing_hbr2_hbr3,
+	.pre_emphasis_hbr_rbr	= &nord_dp_pre_emp_hbr_rbr,
+	.pre_emphasis_hbr3_hbr2	= &nord_dp_pre_emp_hbr2_hbr3,
+};
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

