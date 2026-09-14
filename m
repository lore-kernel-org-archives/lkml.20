Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26CE3AFAF4
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370413; cv=none; b=PowIWHfV+5Blvo7miAyYxJBIB9RFD5y+G3pNARL2VejB0DEE4SD+6ahz0C3yFZuSUHHqehO9QlKqIcJ4aRhx6IxCJ/rfCDlq4yNNUulCk8gR9ikiHupDs8bA6cNf/KhAAaqPX8u9k4a6m0rQY/g16cg905CSke8yFOtrtzR3G+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370413; c=relaxed/simple;
	bh=Rl+J/TY3WCJjULXucouqjDwfG6dxMJVZqai54QMsEqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1OEjwCXd/1zZnAAQOv1l5Y6yvQPBtbTiubZN3lXmGuV50m+1LEBq5DRHn3Sm6E1SKglAG9LoKBYKHuDHSX7LTjaedl1gCpeOG3B+ZGF+ppQutz3YB3rpigkVGwt04YU/WXRHntOKn6AGPhNIkrDuoUfbQ/zvFhl2l4mTOYHepw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F0SOImbw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KkBHNk4s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F0SOImbw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KkBHNk4s"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j6Ld3197015
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VXUIfslsErG
	c2vVIHVkanvJg0SMrJAHVLk+DM6FGicI=; b=F0SOImbwpSYsZf9xadBROeB21p6
	Lqz9XWyDZocLfyHuPGTrc+XVijivBuqHD1uCvu8h++pX9csSdd8h4UhP0xUtyY3W
	t2AWItY2O89HHgLQqvk5v/y4GYzeuW+HgYWNUFO1hEjxYC82l8LvoPN3suedG7EA
	6wzbK4PZAd8GspWRSl5PpoxKUFUT/exfbzWybdl9uNtd35vL7T+UZ+MzjzZexTLE
	FQdjA1cg7V607KEGMREG77v0kK4ewqYRBiMaS1SMEh/YdmfD2tHpt2sSz8nr1POS
	35Ye7AWKQf0OztpJhjV5dnESO4CTeRgzi9aBnaorkFX9YKmxxAyH0Y4RB6w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cdfjc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso3041493a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370409; x=1789975209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VXUIfslsErGc2vVIHVkanvJg0SMrJAHVLk+DM6FGicI=;
        b=KkBHNk4sP3O8ZVT7zNuHYWeG526q7Njd81wdQmufP3YVMZ8JIsRxYNNImvdAmEdFRj
         O29gkf98HYj/VFrJtYxpOYToZpnObvV9MXdsYr0o70gaVpfpK/d50/DHQqJYRl4Jtbuk
         DUDuejhpOvsLGnyG6bNhLw0ob+789dhWeZ+PwMpdbZ9HL61mu0p9PNuAR5ITzmzl5Rnf
         UXifKCqZQ4HxY7ZiO5QsqbYwqaR83U5ZzySbDrmOv1C706GeW5TBI4LZetQCx+GmOYQ/
         s5VHc9L1rs6mHOrcds76/OT4P7v5BKmosKHzYV3b0oI2E9dxky8g5mSfTADDQWtpj/l2
         7SVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370409; x=1789975209;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VXUIfslsErGc2vVIHVkanvJg0SMrJAHVLk+DM6FGicI=;
        b=jxd/kLSb99a5BQMtxK+ct0C/9U5qM1A8VwsbnX2wRI/oLsn5tfhgkwZV3+Xb9V8beB
         e8W5BI4X+kYN1osJdKaQOz9mFv9DU+1eft4oHu41nrARkvUHplzYcdTO41gLZmCOCETj
         lXSzdHdJCucWVyv7pO/zGSNipDgn1Gkc8oSyKBfk2fGdQjX0eC/0FbZ/e4j8XvIyce+U
         OEWPVlNjsWIHud3B/aID6olHEBqMMk8SVl16A0Oc1kjoY5hBGogEZlrZ9Jdlr+/ImJy/
         lX7MPJz49ubSIexiosWz6gQLU2/rUoyoRrAPPG1RgPpta7iWIwmnTKncSYmhhZL1S+QH
         AaeQ==
X-Forwarded-Encrypted: i=1; AKwUvBxXbRZx5fOVDeV3GEZ51DR2KVKnS2kDK1+yAAoNM3DAclXBaKHtkek5MLF1U73nrB3qJhw0ldnGQ5IIJHc=@vger.kernel.org
X-Gm-Message-State: AFuF++lJdepeaL6SRc1sDq51Gq0e3ygTIQ59c50TVAKKBVbCNmvQMeQk
	kIk8J49SCnQ08qTSxVgPzuakDRGFW3+oi2fxMmRio9QiqNQsM1Gy7LJlitFpw0fODDOcHJ7HHx8
	mgeOKfFNzI5+gym5qP8bcnmKMnA4KlVSiwRwxwg1XpnHMIAQZ5hLp/JOOJC5S2H8hj5M=
X-Gm-Gg: AYBFou2Wu4M6vJCkYTIMMG6NTOPs4jleopif2IcMBH8O75sp/a7aNBWoqPBe2IJiqaA
	+8HrnX2YgeqQh6ow/Cnoa59qVoCW1aVySqk0zmWcPsgnugPwUS/WLohiN6F2U/dm029CHVw1NqA
	KiVL5GWGmDJA/e18wwawoVpPWSrYpvr9sYTESxZPkSuYBaUezk52O9d3YbIfT7e4EVHbj51jXBZ
	iHAlkUOe8xOVGvK8aZkbDaPWjGSHKuBqn9hwDhrVbjNy1Nt/wWhHwtRIiAHefPXxlfNyRo141FY
	EKNzCLDViPpnwbwNI0DqUuR37fBmljSkJk0qecWRL5KBEOrnWXhZ5odllTXgDBS7ogfgNfO/hqo
	T2xhUAgO5Lm3uJcB1JU3cViSLteLz9HbEVymBdy/4cBoq5mlls9wHpovlfalW
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39debdd2283mr3055252a91.0.1789370409242;
        Mon, 14 Sep 2026 00:20:09 -0700 (PDT)
X-Received: by 2002:a17:90b:2249:b0:398:c3c9:d0ae with SMTP id 98e67ed59e1d1-39debdd2283mr3055179a91.0.1789370408719;
        Mon, 14 Sep 2026 00:20:08 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:08 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Mon, 14 Sep 2026 15:19:43 +0800
Message-ID: <20260914071944.164217-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: u7gqZ_GGCcWUxWqDHhFEmbioYLCyRsN3
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa7a02a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=btXJogeg36QJwmQpmpwA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX3jTnjN0jDA8q
 7yw7PUIlXQxtFHQYXu8oeS928fVvYtDDPyyrMVuhm0HsfOtWtzluFoeMBclwFgZhIUGJpRBd0ZF
 HY7pyZoaJGc2VKzm540kxdt4YTPmmtU=
X-Proofpoint-ORIG-GUID: u7gqZ_GGCcWUxWqDHhFEmbioYLCyRsN3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfXy/XHLbw48lZe
 8Ijha7xP5zL8oyKZpmXNyNSFIf+8I7LMgAZ9xpAtXxstV3mZC1/6QUy3WNNOJc+TEsdu+P5j6DT
 XWeRAGVz8O3qD2NQtUYyno/EZxYID3n4g2vmwWmnTFtdksyHQULQ3UbJQVUUZSGUKnvza5BAgfF
 e8W1Vhc+VnUpg3/Gg+OYshPyMALSSralhucVOxptZSCkFg+9YfCCSmMQmlqKvwRnZswtPSooP6J
 d2l1CnNEIIsBzfLWn6jM1ux4RqdUD/C91iABoVqY3AZa+uP6xyBAGpq13F2FTtCuPapjbJIG1Wd
 TCx6wVRbkw8NXW0yGSo6+WA/STZ4odwQeVOVGV1IFersysB0WGAqFhEnXmhGn7AnfUDkkqIWUPc
 LYgytcP5bZ3+JHtr8tWLKCdWfr6SMXs/TMKDUBQoiV8d1W45aol4wQ9FlBubrg0fO2zN1nNtU9D
 sooCcZN21LglVOLLGdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140103

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../boot/dts/qcom/nord-ride-embedded.dts      | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 0b230551a49f..38d50f040c4d 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -53,6 +53,93 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pmau0102_e_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vl_0p95: regulator-wcn-core-vl-0p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vl_0p95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vm_1p35: regulator-wcn-core-vm-1p35 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vm_1p35";
+		regulator-min-microvolt = <1350000>;
+		regulator-max-microvolt = <1350000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_wcn_core_vh_1p95: regulator-wcn-core-vh-1p95 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_core_vh_1p95";
+		regulator-min-microvolt = <1950000>;
+		regulator-max-microvolt = <1950000>;
+		gpio = <&pmau0102_e_gpios 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		wlan-enable-gpios = <&pmau0102_e_gpios 10 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_wcn_3p3>;
+		vddio-supply = <&vreg_s3a_1p8>;
+		vddaon-supply = <&vreg_wcn_core_vl_0p95>;
+		vdddig-supply = <&vreg_wcn_core_vl_0p95>;
+		vddrfa1p2-supply = <&vreg_wcn_core_vm_1p35>;
+		vddrfa1p8-supply = <&vreg_wcn_core_vh_1p95>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -404,6 +491,21 @@ &pcie2 {
 &pcie2_port0 {
 	reset-gpios = <&tlmm 8 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 6 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie3 {
-- 
2.43.0

