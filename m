Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43E93E1713
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789895475; cv=none; b=glL7P8pbfs9zGIWlBvzw8M0doU8GDB7NipxL41IJWXyvtUJ96I+ag0UepAb8j9ll6DGjapXgWZgPQKRtftz+CSC/2Ct1jAsYOUqENEEIyr9eCAwSosddbzRFmdPVjYHvDCyCAh8Y3ji4N1Q56GyEZro7qaCYoHGt186dGjaeadg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789895475; c=relaxed/simple;
	bh=ifJg6vweMIaItFGyrzt28kVYZ36rEVOLSUsG3WHvRPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKpcaVF7wrch82mtB7u7HMWBHjJK8FOT+t4o14E1KmkYPmoCfgSIyLYFMF1jnXPDFUxVO1hJ4405QESRIUuMq8Tz0gRdb9S+f0PLIRr9UwQSkBDfVwc7VZfmdL/szD2iMcQoZsPTBQWqZUkuDDsnszf0p3b1uu/E7xhbdUfFKD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eSFVyuVU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CWK+tqcT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eSFVyuVU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CWK+tqcT"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68K8WI2b1244435
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mUv4TrqNQuf
	U6TYrki7rfdLQCmrfsKJNpjIXFaSgnTw=; b=eSFVyuVUGYOyIBpNpNXxLdbzmzH
	JZHkV8/dDwCLQAMczDn+8SCW5baZSfqVra7IdJIK4kWHTSb/zcC2t9z5bxB8wFlJ
	V0SSLhnp+hHJmkjBpV5qS/833/jmmmemm9PHmDBLEpUsII8Wt6Q259nhycH+E57E
	XCqRyVehcyc1HTw33F4732E6xlC+4wqx4rXGQ6qjVExjEoHUW2LJcFyEN6yyovu3
	VtnSeDO0lKsymR2aIrWh51BH7hBxxfAiAV9/8AdjEvwns/vk/oZaVuHeI8V6K/jt
	6zg4hqsBc/OSanGn+HNGq4amV8yTqpMp/gzYz/880M3vD1H5yc6KQ1xIA6w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gsjs82kg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 09:11:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39e25a5f6e8so4197375a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Sep 2026 02:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789895472; x=1790500272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUv4TrqNQufU6TYrki7rfdLQCmrfsKJNpjIXFaSgnTw=;
        b=CWK+tqcTiXYs6bKxhEIxk8bJbLcCm5pIdHj/wWcwm17Q47dPQ14dFtexL0XM08/P2x
         gffdIekqd/bRqtoh99oNUMfEVmhx7/CXBaxK/dmq7cuZkktHslG8PsmBqvMtLKtrM3V0
         wNYN3ZKunhczyS3CsZefFvHPZkouisUJtuEz3G1erEoA/y/LUziwWYYmaVRYBJOGHIa5
         73b5TIfHYcawj4wSrULUnGwN00V2y2NkXwRkbCx4vSHoAnS1DQ9IIfcEv3C6bRzI0dvz
         89yardVoU7oxeWba2S+57brkaWlC8VIOBvoZQv7I6xUB1QI4x42cQB1OGd7DxyVLuTDE
         oarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789895472; x=1790500272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUv4TrqNQufU6TYrki7rfdLQCmrfsKJNpjIXFaSgnTw=;
        b=OEWfgX2gA9DkHeLnr+kBEkBF67jqqJoUM+jJZYHzH2xNDjWx3OWL8dPpAS4bB2sr8r
         jZBp3Uata3ri/EebSburvZg6W7jZtc5MG967Mr54aL41BKhHF3Cw46R8XoKdDupbGQ+H
         69OFGzdddc/sYL5Tmfq9vGT0o/2dxUL/CPRGpzdeJFh4PqT6sourKQhsBwIGpLYaBfxt
         zIuYLmnM1a/prKRj1lnaLyvdwO+5ul4KCLMSq6P+rtwnA4FwfUAAX1DERLvjqmUms0l3
         kYWhuC/zolqt6mv+KrC5olhQyq1uUWpNNe/C+sKnZTSOs7J4qw1GW/3ZJ9I8v8cOnHk2
         7Axw==
X-Forwarded-Encrypted: i=1; AKwUvBySs6yi+Pvb5EqkLe6fNNB0iUKDQl5EWWQ6qaIqKlQBnA4X4ygiFcAptVlWLXEjgGgg3JmYr6qK328221U=@vger.kernel.org
X-Gm-Message-State: AFuF++mgM1PEGqt79Q59/GRY4bUjwdMo9CwtPVOoHYrW4B8AncVcTC/4
	gFt6XVSnSdn6aFANoswNXrlxJiCgNrETVJ9gJmRjHaxixmybGl5nlS5LyW3uIGZ9CsPGOw0S+Z0
	yUpctFvCK8/fD1IIAPwTI6GGR24ikX6MGn3+Qf2rreK5GrGHGgCxITEbNXvCGlH1bf80=
X-Gm-Gg: AYBFou1ET4amigfhmVNHpoBGowDyTq67uteJsonuugD/RzV5oIWZ9Lv+ehvQGMRCVqE
	jOLNN/xWslbkPCAl+1+HDMMojajemAgaNM1Vz534xvS2S5zyz7+n3NODzZg61y9xueLJI6D0ntU
	xI4dfOT+CKa5DWycRTB0VtRQDOz+V+xfHFvV0xLIEP5lRLcNHzkFqkc5dLTj8kDuY6feqbHW0aB
	YclkaYa7YOtFVfXgUZPJSHB+ZggyKScD22qo+X4gkM05WqFiCFLn3/QCZMYehm4d0nio/p6WNK9
	iQmc44k0aUnurO5TprNmaFMMyiEx75R8RPEE8/IsLPCjh/hd+8XjAreRbdAxTwk/k/CHoBv48o/
	AVrPts8d+padJ4iet4KA4QySOW54BkOF2gvNY5j5sz7fL/Lmz4CFBpRmSuKU=
X-Received: by 2002:a17:90b:4a41:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-39e6a815e44mr6440483a91.40.1789895471750;
        Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
X-Received: by 2002:a17:90b:4a41:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-39e6a815e44mr6440457a91.40.1789895471334;
        Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c3313d96esm10730242eec.12.2026.09.20.02.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 02:11:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/3] arm64: dts: qcom: nord: Add camss node
Date: Sun, 20 Sep 2026 17:10:51 +0800
Message-ID: <20260920091053.2214965-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
References: <20260920091053.2214965-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MfrZkb5SxglA0eMnTbL0iRhMZhK9vceY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfX650Y1kOYCunl
 S5VZRhz3RppbQ95TaiLdvsfrWzHAAZ82EN4OAjDQp7Rksk8w0xVF5gFm1Gq7RJ9Yy6AWVZMEG8k
 4oC7hSWhG8k5ELveGzQwE2Ju1kP4Afc=
X-Authority-Analysis: v=2.4 cv=YqWa1IYX c=1 sm=1 tr=0 ts=6aafa330 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=IJyGPJo1NslqkQ_NxU8A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDEzMSBTYWx0ZWRfXxxWAOJ+uIzIg
 PeO9N/c0coO09EGdfatRJil9kgduDnLmfwgc0gRfMWWEcDHZSwT0kmmQjBhFBodIaoti753XT8/
 UkKwJnjOcGN0pTrtYn6AgqObWHBdi8u4FENPE5RkJLWElJl/7MEMGprQmH6Q6QPO1pQ7mTObpWW
 X5fefCrlPWz7O4szTgiSsUP0pAYL7XfN1TI+xBpVZsVeUjQ7vDpAuL1hmJJGp7/jiGqfzmpI4CG
 2/aGxuvaTLQhnyxXyoQmzqXuwuXwXBQlGk7DnjqyIjZt/ZK3IaI2CkxjckvKzmmBLzqL4xyC0bl
 4DexDAtDfyfST+sPM4NuuVupTdM8LLOGtqB+fdDl+WEMkXhcJkPWOgUyWlvtHJTuaMIHVvbbKYT
 kQztPJa0q4DEqwdwOn+GjHB78j72z8/uVijGEQIwnNkVBY5fWkRumA5ls+hwpO0PFHUbgLdXaHI
 sOsOKA39NlKRYbYPJRw==
X-Proofpoint-GUID: MfrZkb5SxglA0eMnTbL0iRhMZhK9vceY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200131

From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Add the camera subsystem node for the Nord SoC with its 5 CSIPHY, 3 CSID
plus 10 CSID lite and 3 IFE plus 10 IFE lite blocks, along with their
clocks, interrupts, interconnects, SMMU stream IDs and power domains.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi |  64 +++++++++++
 arch/arm64/boot/dts/qcom/nord.dtsi          | 121 ++++++++++++++++++++
 2 files changed, 185 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 6dc4c871f41e..3b9fcebf7baa 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -42,6 +42,70 @@ &crypto {
 	status = "okay";
 };
 
+&camss {
+	clocks = <&camcc CAM_CC_CAMNOC_RT_AXI_CLK>,
+		 <&camcc CAM_CC_CSID_CLK>,
+		 <&camcc CAM_CC_CSID_CSIPHY_RX_CLK>,
+		 <&nwgcc NW_GCC_CAMERA_HF_AXI_CLK>,
+		 <&camcc CAM_CC_TOP_AHB_CLK>,
+		 <&camcc CAM_CC_TOP_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_0_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_1_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_2_CLK>,
+		 <&camcc CAM_CC_TOP_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_0_MAIN_CLK>,
+		 <&camcc CAM_CC_IFE_0_MAIN_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_1_MAIN_CLK>,
+		 <&camcc CAM_CC_IFE_1_MAIN_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_2_MAIN_CLK>,
+		 <&camcc CAM_CC_IFE_2_MAIN_FAST_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
+		 <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
+		 <&camcc CAM_CC_TPG_CSIPHY_RX_CLK>,
+		 <&camcc CAM_CC_QDSS_DEBUG_XO_CLK>;
+	clock-names = "camnoc_rt_axi",
+		      "csid",
+		      "csid_csiphy_rx",
+		      "gcc_axi_hf",
+		      "top_ahb",
+		      "top_fast_ahb",
+		      "top_ife0",
+		      "top_ife1",
+		      "top_ife2",
+		      "top_ife_lite",
+		      "vfe0",
+		      "vfe0_fast_ahb",
+		      "vfe1",
+		      "vfe1_fast_ahb",
+		      "vfe2",
+		      "vfe2_fast_ahb",
+		      "vfe_lite",
+		      "vfe_lite_ahb",
+		      "vfe_lite_cphy_rx",
+		      "vfe_lite_csid",
+		      "tpg_csiphy_rx",
+		      "qdss_debug_xo";
+
+	interconnects = <&hscnoc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+			 &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+			<&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
+			 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+	interconnect-names = "ahb",
+			     "hf_mnoc";
+
+	power-domains = <&camcc CAM_CC_IFE_0_GDSC>,
+			<&camcc CAM_CC_IFE_1_GDSC>,
+			<&camcc CAM_CC_IFE_2_GDSC>,
+			<&camcc CAM_CC_TITAN_TOP_GDSC>;
+	power-domain-names = "ife0",
+			     "ife1",
+			     "ife2",
+			     "top";
+
+};
+
 &i2c0 {
 	clocks = <&segcc SE_GCC_QUPV3_WRAP0_S0_CLK>;
 	clock-names = "se";
diff --git a/arch/arm64/boot/dts/qcom/nord.dtsi b/arch/arm64/boot/dts/qcom/nord.dtsi
index 926ccf3bbe4e..9993091effdc 100644
--- a/arch/arm64/boot/dts/qcom/nord.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord.dtsi
@@ -1737,6 +1737,127 @@ ipcc0: mailbox@9007000 {
 			#mbox-cells = <2>;
 		};
 
+		camss: isp@9b32000 {
+			compatible = "qcom,nord-camss";
+
+			reg = <0 0x09b32000 0 0x2000>,
+			      <0 0x09b38800 0 0x2000>,
+			      <0 0x09b3f000 0 0x2000>,
+			      <0 0x09c32000 0 0x1000>,
+			      <0 0x09c37000 0 0x1000>,
+			      <0 0x09c3c000 0 0x1000>,
+			      <0 0x09c41000 0 0x1000>,
+			      <0 0x09c46000 0 0x1000>,
+			      <0 0x09c4b000 0 0x1000>,
+			      <0 0x09c50000 0 0x1000>,
+			      <0 0x09c55000 0 0x1000>,
+			      <0 0x09c5a000 0 0x1000>,
+			      <0 0x09c5f000 0 0x1000>,
+			      <0 0x09a92000 0 0x400>,
+			      <0 0x09a93000 0 0x400>,
+			      <0 0x09a94000 0 0x400>,
+			      <0 0x09ab1000 0 0x4000>,
+			      <0 0x09ad1000 0 0x4000>,
+			      <0 0x09af1000 0 0x4000>,
+			      <0 0x09c34000 0 0x2000>,
+			      <0 0x09c39000 0 0x2000>,
+			      <0 0x09c3e000 0 0x2000>,
+			      <0 0x09c43000 0 0x2000>,
+			      <0 0x09c48000 0 0x2000>,
+			      <0 0x09c4d000 0 0x2000>,
+			      <0 0x09c52000 0 0x2000>,
+			      <0 0x09c57000 0 0x2000>,
+			      <0 0x09c5c000 0 0x2000>,
+			      <0 0x09c61000 0 0x2000>;
+			reg-names = "csid0",
+				    "csid1",
+				    "csid2",
+				    "csid_lite0",
+				    "csid_lite1",
+				    "csid_lite2",
+				    "csid_lite3",
+				    "csid_lite4",
+				    "csid_lite5",
+				    "csid_lite6",
+				    "csid_lite7",
+				    "csid_lite8",
+				    "csid_lite9",
+				    "csitpg0",
+				    "csitpg1",
+				    "csitpg2",
+				    "vfe0",
+				    "vfe1",
+				    "vfe2",
+				    "vfe_lite0",
+				    "vfe_lite1",
+				    "vfe_lite2",
+				    "vfe_lite3",
+				    "vfe_lite4",
+				    "vfe_lite5",
+				    "vfe_lite6",
+				    "vfe_lite7",
+				    "vfe_lite8",
+				    "vfe_lite9";
+
+			interrupts = <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 605 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 376 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 19 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 17 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 15 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 13 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 11 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 9 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 7 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 5 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 22 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 21 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 20 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 606 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 377 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 18 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 16 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 14 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 12 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 10 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 8 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_ESPI 6 IRQ_TYPE_EDGE_RISING>,
+				     <GIC_SPI 795 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "csid0",
+					  "csid1",
+					  "csid2",
+					  "csid_lite0",
+					  "csid_lite1",
+					  "csid_lite2",
+					  "csid_lite3",
+					  "csid_lite4",
+					  "csid_lite5",
+					  "csid_lite6",
+					  "csid_lite7",
+					  "csid_lite8",
+					  "csid_lite9",
+					  "vfe0",
+					  "vfe1",
+					  "vfe2",
+					  "vfe_lite0",
+					  "vfe_lite1",
+					  "vfe_lite2",
+					  "vfe_lite3",
+					  "vfe_lite4",
+					  "vfe_lite5",
+					  "vfe_lite6",
+					  "vfe_lite7",
+					  "vfe_lite8",
+					  "vfe_lite9";
+
+			iommus = <&apps_smmu_2 0x1401 0x20>,
+				 <&apps_smmu_2 0x1460 0x00>;
+
+			status = "disabled";
+		};
+
 		pdc: interrupt-controller@b220000 {
 			compatible = "qcom,nord-pdc",
 				     "qcom,pdc";
-- 
2.43.0

