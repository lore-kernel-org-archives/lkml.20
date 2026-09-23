Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CAB489FC6
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159282; cv=none; b=rxxIsu6dxANfAusDnnoqa1DDLNx7BoEQOt/OyRVlp8uIQ2y99jxDGomnMye1b3Lg39IrTEzTHJNPT+wFc+i/Y248RMYafBX/5aQsKepYDxBuHdba6gZKGyuQW0HCWUQY2/XPgICHNd25yAoQTWzeNEDjPuZSQmzOYy0CYIraWKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159282; c=relaxed/simple;
	bh=n1LHjAQGW4oKjtxsQtempMH6l83u0Jfw/aNMXgWqElU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BP2C+zX16AU7sUJAwnz4/ZWTmbvOEjh805j8vv2vP6JcMcFirMyVf/IUQKU1KNrpxAV2UShArTavsD3DMii62lQUWomuMyzIHGixYq2r4rXD9WNmivlCCGkmVe0HMwWIqNRsWwAReA/deeJVgArC2upBEIhMwOkCSA92ujWaCYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZpEMNiCP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MsBBMkJF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZpEMNiCP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MsBBMkJF"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA2uYK3409808
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YSxzJvLJkFw1613tjCAKrHc8hSHWEvo3XbcR78aSAIU=; b=ZpEMNiCP23SFaF35
	dHmoFmXcnVgwYxAZcEDPj7oAFFOerW5soIQUuft3B1mFx/+GUmy8Jyzm442W0ppe
	ow9Eig3AM+q8QAPCSvIp+udnt9qu4CThVBK3mre1PyGmTPllOjwwx4alljTjh7Y/
	3nn4vn9ISdyySVSPgW8DyhukJancDHRevyUr+YHNRMt+ycjXvkX1Ifz/LWceXQMC
	a/lftg+bA6iUvcWlmhZgpYlJjHe62Us8KAxP4hP6FSycVB9nBq2dWmxNHQzMLWbW
	cKZdzcu4hSqaiD0Xkt1HdOwDAQJK8BjEiQL6lXDHrFlkjp429TY4t6A6jzwadXF/
	5x97bQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux863vur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:27:41 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14383177746so1322685c88.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 03:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159260; x=1790764060; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YSxzJvLJkFw1613tjCAKrHc8hSHWEvo3XbcR78aSAIU=;
        b=MsBBMkJFUCezi1FBwTc5RfRkdMw/uG3Qr7Jk06dIyIFotyiQl3OpZihdc8pp0Dt+Cx
         fKmXoWM0JNSEckxTvmJ9InQb6BkdbAvTIpAGTVVNUsogH2254YhPn5eKRmNOLLmmP5Lx
         kRj2MoMdOksr5A48T6/nIIpVtOsXNZ5IBmq5X3s9rPEJd2OUCLww6VNpsmyHUIt1ICIp
         SJvlK7uEUxzzuyGaUheRNB1Zu4O79PItur9Q794LTks5Hl0dSk9tnJdbq4yXLXphK4VE
         PIjSFOnZpL7mcehKBLOUDa+rniU5mE8M+Um2vWkegsm5FOCc3XwKWUCwLbj1cewbB8hm
         unhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159260; x=1790764060;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YSxzJvLJkFw1613tjCAKrHc8hSHWEvo3XbcR78aSAIU=;
        b=dHpyt/cjYrSLXX9tlzCwiJ5TY9YZ1zw8tNil+/7ntJXUFQChJ927U9sYLljfxAdPXl
         JG5ZAWLU3CXqCHxZD62w+vIkKQCJtzoa2GgTLrQJsvyVgUGu9bK4qio3rCGaOHmz8ZqX
         HXREKJEPwqxA4LClZpED/kBI2rIsKMndClGjItT9JbPANajAFDq/7/L9AbHXAriRJGap
         zgkzacAeCd7NRmpI8FqOB0kSOKLHHUa/vfXHiZX1vtK+SvGYDiPtnguKGfUHhNdIysSK
         goJj5+qiKSq+G+v1KuGq479x4S2hXcIa40a6VcYoRGSwukubS7dUWpvPSu1vV7IOnqah
         LC4w==
X-Forwarded-Encrypted: i=1; AKwUvBxq0gTXrYlAjpLs/cDjYb0AFDJlzQalaw5ezk5auy6XvLq2jSaapGkrtrA9Ml9vNxZzN6wLrgwQe1qkzRI=@vger.kernel.org
X-Gm-Message-State: AFuF++lzhg0sOzpmNHOVKYKu8SETfDtJLQaubvze4kvT3EZEzlnLXoGP
	js6Yn9vrNCSPC6J2KtmzTwoJIL2U7r2/njXUDBFsjUgpKh7BsxlTuUAmJuRElsJ9r6TjcxJo2Y0
	9YmWfZNFywzcaWzYkMlQ5MqA147jcBLdqJwIKhANqJgcO17a4OmAZFTvUaEH59ueb430=
X-Gm-Gg: AYBFou18b6dcEZyyXbpo2ftgYab98Xx+zqml5yrChIaOdqBUSgSAFomWoYH3u6JR0sb
	ndyoOU+UzR2qrQWaK0wUo1NYWbw42Mdf4wnhVOjPyg0JqyVKEzHIwqxN8LoTkyuP62qcPNMYZvy
	b10SgOR/tiW9hXB2APc74q7wzhqrrDu+ZgITWLakmcEtSkQflvAb2GUElvVuGMcrq48rv2CcRR+
	QD5pNF+M1sgGBx1fJSKKG469Z8M6JoqzljwC1cl9Gy0LOgl8ozdxrm5tG31uTxDmGj0oxEZmROf
	Ija652ZForz5B/9PmvcXXfAYcmG8DIyTTrUpRdHF8IE1+A1nU+EpuN9HKqX2mZIIveOCJ+XcPWF
	MPFSPm276MxPwD0FTVtUqM0k=
X-Received: by 2002:a05:7022:e88e:b0:143:342a:3d3d with SMTP id a92af1059eb24-144f8ff4706mr3217932c88.0.1790159260202;
        Wed, 23 Sep 2026 03:27:40 -0700 (PDT)
X-Received: by 2002:a05:7022:e88e:b0:143:342a:3d3d with SMTP id a92af1059eb24-144f8ff4706mr3217900c88.0.1790159259641;
        Wed, 23 Sep 2026 03:27:39 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:39 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:52 +0530
Subject: [PATCH 12/15] arm64: dts: qcom: hawi: Add GPU support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-12-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=11088;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=n1LHjAQGW4oKjtxsQtempMH6l83u0Jfw/aNMXgWqElU=;
 b=pkt/7vOh1cwgeUaCAm0j872gPDIme7MloVj9UKyY99cwqUsd9LCwOmoivFxeh9QV8gx41xbtJ
 bqWaYw5sgiAAwERu8yKpCLy7Eio6+7Uwlanw+VjmYwhI36O5kQ6rFS5
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: ffEAUwNCOi3Jizh4vViF6z2MUs1j2zi_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX0jIH0/tshjuY
 dnZmD4yttV1p5VCPAbbTcJW+GIm6x84Ur7zSSKkxUV6/UfGevKmUTIWeiHqYB9OiPKvI0xtoY2U
 ofSYFUmdX4FJFsuf0B5l/QEW6jE9iM8=
X-Proofpoint-ORIG-GUID: ffEAUwNCOi3Jizh4vViF6z2MUs1j2zi_
X-Authority-Analysis: v=2.4 cv=eIOGH3p1 c=1 sm=1 tr=0 ts=6ab3a99d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=if0HThm8pQPrmmLXrhUA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXwVtjAEz38PbL
 ah5x4yqrQ2yTSBeVrcpRO4PDG/NCOalLyIGge04bXoiQS6URNB8MiyJ1DM0/aPjWFu4xMl5Q6wV
 /sFhXwvl5QDCmOkWYV14xsA3JEYxkKAFojnmuzWPtadIhAkpwuGBlVupeXIEQY3tHqGlfBJVx51
 RuXCNmlwyWFWQwlEGsPNUyykRzN7vWtcyF9ZL3gwJpqxS2vE9/HKq0TJPZBimC68G5E/neZ0tZR
 VNHSjCCMz9YiRaO/Dqqus9vuEOKiHxdEJqb/OV37DVwGloaZqGxPJEqQNS8rGLM34RZf+2NZx1h
 XqYy8dy2yV9lZ5D1OpGAG0UMSJNPVDRx6g95VbLp+F4LaCpnMfiEzZHmmRrO8aNu9sY070lhi9g
 ZW9+j5YSIO3k5InuWTovXLzP9E0gjnif19WxDCd9NRlN5WDvA+pyo9iE/kCavNP8eogKyyeZz5/
 j/DGRAE235Ed42dnkyQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

Adreno 850 is the next generation of A8x GPU present in Hawi SoC. It shares
the ADRENO_8XX_GEN2 family and slice architecture with A840, but has many
architectural improvements. There is a new block Matrix ALU (MALU) which
helps to accelerate certain compute workloads. Also, there is a new Bx rail
that powers a part of the GPU IP. GMU is now powered by a dedicated GDSC
powered by MxG rail.

Add the GPU and GMU nodes describing the register maps, interrupts, clocks,
power domains, IOMMU, interconnect paths and the OPP tables.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi.dtsi | 336 +++++++++++++++++++++++++++++++++++++
 1 file changed, 336 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi.dtsi b/arch/arm64/boot/dts/qcom/hawi.dtsi
index c7ae8133b9cd..351909a34286 100644
--- a/arch/arm64/boot/dts/qcom/hawi.dtsi
+++ b/arch/arm64/boot/dts/qcom/hawi.dtsi
@@ -3612,6 +3612,277 @@ tcsrcc: clock-controller@3b13040 {
 			#reset-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44051401", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_ESPI 364 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				/* Only applicable for SKUs with 1500 MHz Fmax */
+				opp-1500000000 {
+					opp-hz = /bits/ 64 <1500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L5>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x01>;
+					qcom,opp-acd-level = <0x802f5ffd>;
+				};
+
+				/* Only applicable for SKUs with 1500 MHz Fmax */
+				opp-1475000000 {
+					opp-hz = /bits/ 64 <1475000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3_2>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x01>;
+					qcom,opp-acd-level = <0x802f5ffd>;
+				};
+
+				opp-1450000000 {
+					opp-hz = /bits/ 64 <1450000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3_1>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x03>;
+					qcom,opp-acd-level = <0x88285ffd>;
+				};
+
+				opp-1400000000 {
+					opp-hz = /bits/ 64 <1400000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3_0>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x03>;
+					qcom,opp-acd-level = <0x88285ffd>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+
+				opp-1275000000 {
+					opp-hz = /bits/ 64 <1275000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1_1>;
+					opp-peak-kBps = <18671875>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1201000000 {
+					opp-hz = /bits/ 64 <1201000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1_0>;
+					opp-peak-kBps = <18671875>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0x882b5ffd>;
+				};
+
+				opp-1126000000 {
+					opp-hz = /bits/ 64 <1126000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-1025000000-0 {
+					opp-hz = /bits/ 64 <1025000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0x07>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				/* Only applicable for SKUs with 1025 MHz Fmax */
+				opp-1025000000-1 {
+					opp-hz = /bits/ 64 <1025000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x08>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-951000000 {
+					opp-hz = /bits/ 64 <951000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-843000000 {
+					opp-hz = /bits/ 64 <843000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-801000000 {
+					opp-hz = /bits/ 64 <801000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2_0>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-759000000 {
+					opp-hz = /bits/ 64 <759000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-693000000 {
+					opp-hz = /bits/ 64 <693000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82f5ffd>;
+				};
+
+				opp-636000000 {
+					opp-hz = /bits/ 64 <636000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe0285ffd>;
+				};
+
+				opp-578000000 {
+					opp-hz = /bits/ 64 <578000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe0285ffd>;
+				};
+
+				opp-539000000 {
+					opp-hz = /bits/ 64 <539000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L2>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-461000000 {
+					opp-hz = /bits/ 64 <461000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-422000000 {
+					opp-hz = /bits/ 64 <422000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-390000000 {
+					opp-hz = /bits/ 64 <390000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe02d5ffd>;
+				};
+
+				opp-357000000 {
+					opp-hz = /bits/ 64 <357000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0_0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82a5ffd>;
+				};
+
+				opp-325000000 {
+					opp-hz = /bits/ 64 <325000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82a5ffd>;
+				};
+
+				opp-274000000 {
+					opp-hz = /bits/ 64 <274000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82a5ffd>;
+				};
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xaa2a5ffd>;
+				};
+
+				opp-190000000 {
+					opp-hz = /bits/ 64 <190000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x8a2f5ffd>;
+				};
+
+				opp-157000000 {
+					opp-hz = /bits/ 64 <157000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe22d5ffd>;
+				};
+
+				opp-125000000 {
+					opp-hz = /bits/ 64 <125000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3_0>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					/* ACD is disabled */
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,hawi-gxclkctl",
 				     "qcom,kaanapali-gxclkctl";
@@ -3624,6 +3895,71 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-850.1", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6c000 0x0 0x32000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_ESPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gcc GCC_GPU_GEMNOC_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_MXG_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "memnoc",
+				      "ahb",
+				      "mxg_ahb",
+				      "hub";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>,
+					<&gpucc GPU_CC_MXG_GDSC>;
+			power-domain-names = "cx",
+					     "gx",
+					     "gmu_mx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-556000000 {
+					opp-hz = /bits/ 64 <556000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+				};
+
+				opp-788000000 {
+					opp-hz = /bits/ 64 <788000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-825000000 {
+					opp-hz = /bits/ 64 <825000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-880000000 {
+					opp-hz = /bits/ 64 <880000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				opp-917000000 {
+					opp-hz = /bits/ 64 <917000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,hawi-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.55.0

