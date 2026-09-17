Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABFD03E4109
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789621334; cv=none; b=Wy2J56MegDJMJ7fM+ZVpZB6w/gYX5fG6/q2D8BdViKaGkJpOCAKL6xDbcGio9ynAcDG/D/S1z9CDohb8Uf8RL9msObSgrwMmD44aPpOKtvRELzpueNb88AD7nExoCrWOFORTXL0VVOcSWYAlNAtI9xTVZWUojQgSENJV5bpqbhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789621334; c=relaxed/simple;
	bh=32Kcson1oMyhaRSNmjZ2RwVJm4JSqMWBAMwJs8KH4DY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZNgGkqQHDBdyVWox8GbPmP+s19UvHSA/Io6ISK4Sav/vIb6s3xQE8nKtiHc9CVQ+LaCSBsFYTynaKY+8y9EvA5zrsZ4JM/AgLXSKUHQlfo6TZ0KgCvM52D8iOc1U4uKDKU9Tk5vUPtPx/U496J3dBMsvXhd2f/zWWdrPjJoJAZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IA0iFFdb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TzZQQIyg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IA0iFFdb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TzZQQIyg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H2spsK3302820
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BsgoTby7KvPvWqWzFVbbBk7dvHSmCSAsefqrJReaSnU=; b=IA0iFFdb92EnqlGu
	PpS93n2BjNzAhPxVBhg7UJmyqncsmxDGPL15nECGGr2QvPf9+8r6xnBcKcN+zwrI
	gO4SGuzHEP7NGFL/Wau34m9ZTYI+0UrPhRg+bTGpFucU+IQJjkgt98QgN34h7HV/
	Piid0YiBOA9mgH+3aQgOtxwEKGHlyrMw5Yx3yGcCbI6V2oOdi9D53xi6MCpC0R2j
	ByC2DXm8OiI3iwhCRYZtLuRYeJEnhfbsTaqfDc0f2OHAIqXExo4RkDhaub1Zkli0
	rgxahDuYxsBkwXXKJQK1YVvi5XgKfzdnMjTKamB8tITvY+3Z0OXZ8cuq8e4XOeRw
	gjB/oA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr7uc8dqe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:02:11 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b2fb8f0df0so667404b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789621331; x=1790226131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BsgoTby7KvPvWqWzFVbbBk7dvHSmCSAsefqrJReaSnU=;
        b=TzZQQIygsaV1HsxJBcAbK6X8Iutot6rHjQQcIYuVfFjkx6mTs0bHXoxaSkI0BgtYCF
         v9RYuNaonneo7maMhZEKoCmkWrw/bCzMjI0DWO5ynO92PRSO+rPVG4bc7CV7BIVs8f7/
         laYA4xusfq/dps1bDFvEHHcowYJmlmzEtqImIysE7NwRHxJLkAhDIlUGpqwCmYTaHH0B
         B9KwS5cXgH2OBjZkSNt9HfeiKbgfcJ6P6EGS2WaYmVV3tRTTXJFrbbtnzSAXuNiHTYtG
         TuV05okWY8hJOAY1zE2yTQ2HocG7PPSLXFY10K05CC9eWk/6lt4E2mIEPRqShYka47P8
         r0ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789621331; x=1790226131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BsgoTby7KvPvWqWzFVbbBk7dvHSmCSAsefqrJReaSnU=;
        b=uZLIZw1wrNJ8As9k0b8cY9Dm7bKP9HMRGxmwY6ocMXkEjG1+kXUnazDKsnieWXSKWn
         5ptFvpjUVXJ/q+cVqUyIeGLk8JUBf/VolSqWZwLHjgP3Xg8hmC6f1NB1U+cnLbxGsUQC
         UTKnlwtB15QvG31IHke7kC5hVuNW5+jRNHZYHEoeH6Z0VqKQDiwhQf6+Fl/fa1wbANAn
         WhVeKjoq6off8bTNXwa4V92dv3BAXlG8qlzIhsVnb/+5B5boPsu/Ewu8ydQF+vEfuCK6
         6ryNGnEO1nUewLO3G73ClHYN/pDC7ZiTsqS56VUf6rYHSEUZEJOOUPTHWZ/xQGL3SPaw
         DIFg==
X-Forwarded-Encrypted: i=1; AKwUvBxj/c4lnaABCS9QON2h7/xDJjnvOM4JzUitvqQqXRgDQQhKN2E2adfi0iOA5d9BuhcL6dlp7DctaYXR1pw=@vger.kernel.org
X-Gm-Message-State: AFuF++kSqAyDCWRki9s2tah+8WZ1fyhVAMsdaLEX7XqwuGGu884WUbmF
	LivzSuv7cA1bIyQRruWsDj2cXPC4Q5v2WtUkp8virNKlRb9e8OSsP8PPol9zaRaAPofKmvOsW3L
	rcSptd/TE+1CqzUF5Jw9yrcKfToj9iGIY5kPweOvsL70kllO6f36hQ1CmVmsV4x2OWp0=
X-Gm-Gg: AYBFou3NFPKGNqHQChNLsCnIyQNHM27aeeM5aICE+MllDg9McVqpiSmWLWJaLYUw5ig
	KNaBXwEPmaiOQMnqepvhxrIeV/n7qphJmIlczAcKLKYK2WK3tn15Rti+xcaL/mliGMz+1WxGF15
	l9jD/FkBtWxYvm/kIMtVSu2sV+QRjIASACrdSN//2/XLxhUBrQtZELqKpkIvwNtJ0/Wmg4+YxAA
	BmczX45QTabBSaxI+CLpVteUY5ipVzhCByIt9WC9v0K7Ll7TRqEor2H6TnVvXlZ896BN67DFn5R
	SyhVxIBeQ0tkfigD0vfykuWcy8k3ri9iuPykGjJszLcqlM6ZAERzlnEJONBTxUwpNPZzgK4R0gS
	tiwxzlNFUbaKVgLh+wb//uOsl9W5RdtdBTQ==
X-Received: by 2002:a05:6808:1912:b0:4b9:e5fa:8905 with SMTP id 5614622812f47-4ca4b73867bmr5457330b6e.24.1789621330912;
        Wed, 16 Sep 2026 22:02:10 -0700 (PDT)
X-Received: by 2002:a05:6808:1912:b0:4b9:e5fa:8905 with SMTP id 5614622812f47-4ca4b73867bmr5457299b6e.24.1789621330409;
        Wed, 16 Sep 2026 22:02:10 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5b2753csm23544223eec.31.2026.09.16.22.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 22:02:09 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 10:30:27 +0530
Subject: [PATCH v11 8/9] arm64: dts: qcom: glymur: Add iris video node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-glymur-v11-8-e0c8bc914742@oss.qualcomm.com>
References: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
In-Reply-To: <20260917-glymur-v11-0-e0c8bc914742@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789621265; l=4448;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=32Kcson1oMyhaRSNmjZ2RwVJm4JSqMWBAMwJs8KH4DY=;
 b=1x7AcP3+WXYocMYL/BdCRca3fBoX6pBhuF5WZ+JSm8e88KtQ+bRYIeJ6YIa2UmfUXx+1sTBSz
 UozKh7yu23gDGE2AU/McZLg5Pnr/yyvL/RIbSL4A22JfLQJOYMDwEJs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX29DDemh0GBhR
 3uOUy/gBXbZTwOJBgsBvn1VMwFIcubMHA/lOuY/8xWmkW+KdnLNP83dHoR2S+GCSFvGHotrJQap
 dU9JVRgEeWHXJVsyNZjVpj3dyvoVSAjwkRh+taZrTKV0BmpsMHSb8WoCWcjAJxhBGgevAM5y0cG
 Sbqg9n3W26B9iSLLh0OyEuZUep4J/Wyqf/jRubHMkDr2lMD0O0FEoGQjliY4dTKmE25AQ7N6xpK
 9Orzulx2b+RG+/CZlhTPGdM75cwyMppYQZmNKyI45BCkaBRuXZwwjfXFl23LsW4tN8+FFe1mgI0
 1cLEw2viawN+itJuyRhy9JlzVez4FfX4pkEMDrKKKRWj8cfsX2s6Ky/jBTLlGohM6fRV3aqgGNa
 MEqzizr1WVG7G+0wnIVyuC2CzNlH9gfZTd3iYFBf+a7OrBJYrz6wP3a3zaluJwlEoMY4BLMTqvI
 6OjfAdKaYKWlkJBT6Ww==
X-Proofpoint-GUID: iMenqxEJmZ8BdMgP_K33ZWG8wH4sCvwH
X-Proofpoint-ORIG-GUID: iMenqxEJmZ8BdMgP_K33ZWG8wH4sCvwH
X-Authority-Analysis: v=2.4 cv=F9zC5ahN c=1 sm=1 tr=0 ts=6aab7453 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=su6zD_3c2FXtS07H2BAA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDA2MyBTYWx0ZWRfX+ZH2NhNSpkXj
 GrQaqwTWGWsAqHc6JqxIoz+cX7T3kEExjKIynbOIL6zm9Zh5La8MtSJWuKiDUmMBPK9JdphZ2SJ
 +8CxEoTUbKspmIDqbGvuAPIJIEX5fDg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170063

Add iris video codec to glymur SoC, which comes with significantly
different powering up sequence than previous platforms, thus different
clocks and resets.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 120 +++++++++++++++++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7dedace8c3c4..cea1d22bba4b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5744,6 +5744,126 @@ mdss_dp3_out: endpoint {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,glymur-iris";
+			reg = <0x0 0x0aa00000 0x0 0xf0000>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>,
+				 <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK>,
+				 <&gcc GCC_VIDEO_AXI1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_CLK>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK>;
+			clock-names = "core_iface",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec0_iface",
+				      "core_freerun",
+				      "vcodec0_core_freerun",
+				      "vcodec1_iface",
+				      "vcodec1_core",
+				      "vcodec1_core_freerun";
+
+			dma-coherent;
+
+			interconnects = <&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			memory-region = <&video_mem>;
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MXC>,
+					<&rpmhpd RPMHPD_MMCX>,
+					<&videocc VIDEO_CC_MVS1_GDSC>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx",
+					     "vcodec1";
+
+			resets = <&gcc GCC_VIDEO_AXI0C_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_FREERUN_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0_FREERUN_CLK_ARES>,
+				 <&gcc GCC_VIDEO_AXI1_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS1_FREERUN_CLK_ARES>;
+			reset-names = "core_bus",
+				      "vcodec0_bus",
+				      "core",
+				      "vcodec0_core",
+				      "vcodec1_bus",
+				      "vcodec1_core";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xffe00000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>,
+					 <&apps_smmu 0x1944 0x0>,
+					 <&apps_smmu 0x19e0 0x0>;
+				iommu-ranges = <0x25800000 0xda600000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1943 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000 240000000 360000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000 338000000 507000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000 366000000 549000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000 444000000 666000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+
+				opp-533333334 {
+					opp-hz = /bits/ 64 <533333334 533333334 800000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_turbo>;
+				};
+
+				opp-655000000 {
+					opp-hz = /bits/ 64 <655000000 655000000 982000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,glymur-videocc";
 			reg = <0x0 0x0aaf0000 0x0 0x10000>;

-- 
2.34.1

