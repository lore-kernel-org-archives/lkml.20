Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 302F23CE4B6
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437438; cv=none; b=lKNhUK4aXr1wIunSwQYVWhsHMi6qUxppKkvwNW7NTfkBGdjrt9VnJ/weDUsQMNXWx9FReYiey6hDGtUJAi5LHNVeklXIVvzwAXO7s0gW3OMklJLoNij6jbvnb9MC5wLOEEMQNkAT1teS1KDb44Q06ouUdavg0y3KnjlBzT5Ojh4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437438; c=relaxed/simple;
	bh=3/BEcntwn3GlfM9tafrFcFrN/R+nv6mJHhnVw6uPjO0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OZDvvgfIyA9HsEwfsS6dOCr8V0gDBPmjUnJ09vAZqrSpm43BVCXJe31uZl/1VqVnn38wiQ+u5Z+5dZKM+62xzAckZtDOrCPsNB0iiknbO9lkGDq2ooBwEQOxDIxlaMy4LhGeEY6CgwlaQ0GB69RbQ61CzNxDtPV3qru5OLxSMBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WazIbOy3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHz4wYDj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WazIbOy3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHz4wYDj"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EMxs9t1914359
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=txZkqH7gEzK
	SCeP8HzTcZdq7R2+c/bBlxvGh8Aflyxs=; b=WazIbOy3eaMK0JEPasDKTAQMqlx
	r7aOM+ISiK3FoSNSEStqN3/v7bIM+baxxgK8EaWrrqGP59S4BuctRV8PWpsxaswQ
	OEf1siXMPomBfRqqc+eTNjZNl8SF/AJsO8rAxgD3SX2rbSTFD8pJ+TKL8rj3icMN
	cO5l/Fb+VcAv236+bxFjfhr2N7g47Ou6XFPZuvluJHsklG2ynBLhU2yWACdeaYLY
	WVz39vDsFZaYGWENV70f4YzL4FW55qv6IX+1/VOEdLr0INi0f/d0bkZxYJp+EOgf
	7v0hIpQO0yx+e9KrVepg0LmH5/Gk783E7pDFFGamZ+OC8NkAYVGZFFkDAjA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpg2ku51v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:15 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso7200475a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437435; x=1790042235; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=txZkqH7gEzKSCeP8HzTcZdq7R2+c/bBlxvGh8Aflyxs=;
        b=JHz4wYDjoLottlEehypJQUmvKH33J5f2Bocv0Cig7RK3qr26u/WJDTw5ndV1wBFDa6
         VQthiDlZ0x+9QwaGMQGLDchnFshysyVZfl1IzB3SsdVmDLocAZ9+gMInVOaOlbKaWXKp
         Lkr9g7S32QS4bs1RFT5gczybtwIqJFpj2UZLemquKkJ/SjwhMYRnTg59ZRFNbTB5KDDn
         VzMAHiOwtd08f5CbAv0uWkiwXYH6tfW2d8yWvT+S7OvmXLdzCzrxLdpBDpSJdZdmRKGk
         4AKPWsOq4x1pvVoA6kBPE+yybtV/rM0JwLtaaz2yn9wmzvIDKPvmskMdDSYukxxCw8nk
         q66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437435; x=1790042235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=txZkqH7gEzKSCeP8HzTcZdq7R2+c/bBlxvGh8Aflyxs=;
        b=EbrE8O0D0/wgopQbh4tbv0DRAQoSW3RiVoasmXp+Bn0dXPJ2oMNNPOHnGniMX8wRjH
         CklPi/jitBNbN2JEomgDeRT+lZD03L43m5pE3yPHpHUvJigV9Qyw5SI79LhbKxZv7BCm
         EDxcvJ0CQ8Kpej/PA/pDZPW08VLG2SPApxnSGH/TlrLc3s//QzVNd8KJLsEs8oNIULNF
         HwpzLNV/BNHF/4IM/XC2SL+Uu3MvlUdV3qumEaADU3/8fyM/2mVcflDZzpw5y0QGeGz+
         5vwgUKqMmINUFdKD7bqgaihTBAVrzaSrHCsdOeRdr04e2NOO5baTZmtfPcj2mJjy4GYh
         E/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBysMA7mYKU6cbgvuQXSGY4FsxgILHvJNPOJ8cw93JFjmrQxwDvcyUnlTaXBSpz3dWN8cGR4lw0Z+946NNg=@vger.kernel.org
X-Gm-Message-State: AFuF++lUKA22py0+SwForW+/u4bXHWjW8zrGrZoDiTMoG++OzhzXnYiX
	Ap1Qu/J8jkr6uLR3pe63F/7/aIgpCxzkFf7c9ptJwGricxYsOyiblCR6p4q9b4xzs81PpaBUJQK
	bXWpcnoA7k4pNuS3RGK1bDcHuyjIgNztcfuhPLAtC+U7/gX/IRjH9A/aQbbT6bYpnMV4=
X-Gm-Gg: AYBFou2qZyuepc5naWty3W1FF3fxnHEvsjkhlAdDITJHGttrN1fZ6nPb0oVRzSY2Tc5
	w/HRWKvQ1LUeRDACGqcUlCCRu5sLpR/qXA0SjVRzPaXPMxKmREauXyVhY0zoSXtZ+nmoSv4frpP
	bjGRlNb3VlTQOG3MDh/O9FMi43H90Zs45T3qZM2EeSkQK38tBLpuaQJZD12HLoxrwPxJsQMMHaM
	EsrfysoZkg5MdjDNCv4fl2kpnS5nb1ug6TEmsEtwWJ8VJ3Pukb5dQbAOirU+03QyrJs6Uwydeq4
	FyQ1uM1NjOXhZy2n6zgwweK6lXhAnk+wuI4CrtNkOO07vImzpuGtvgsyAPmGRqHWUBvV8BVeiHV
	bog3rs36EBEBb75/8XEXGxG3RDJdiVw1TZqowVKuYn1fJEA97GlGbNgHLsiCf
X-Received: by 2002:a17:90a:dfc7:b0:39d:f5ef:b1d5 with SMTP id 98e67ed59e1d1-39df5efb222mr7911278a91.7.1789437434777;
        Mon, 14 Sep 2026 18:57:14 -0700 (PDT)
X-Received: by 2002:a17:90a:dfc7:b0:39d:f5ef:b1d5 with SMTP id 98e67ed59e1d1-39df5efb222mr7911234a91.7.1789437434293;
        Mon, 14 Sep 2026 18:57:14 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.57.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:14 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Tue, 15 Sep 2026 09:56:32 +0800
Message-ID: <20260915015632.283642-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
References: <20260915015632.283642-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: F264nFVMSM47TBeBngpoPY9CRsE5vrRW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfXwRyLqwM9gHqW
 s9zsmQgmdA8svvSA9seIkS4k9j6n/VMDqLxcNCF2TlujwGrcYrTQnWV1LJ5aFXf3aKlI3MauGbU
 WsQCobz22vCDF1H7yLW/Qd4MWk7MUT6oPnb6yrkZ7FjMEcBzm2RvD60uLVw9Fv/diD2vjZYd5zW
 WgGUrBeccgYJv7ClVLpT9a1m86x4Q498EhWznSEd7rmNHldYgAmt6RkMbFW04DDXnbZj2C4T8zG
 9fBC6yroqE3AUHfBC5lpe2qMLttMvUFYMWwVYYBoA410LMrlDHu+VATBuOo6HOkeM/JxLp5dSiu
 WY8bfcf6nCaTeHWdAdshL/E/F/otZW9JyiPB25rEVLgsABMSc5Lx9GWm/qfUnVXcDYQHEYlPtSQ
 90lBP7wozXnathx9C0pQqwXJqmZ0167puIKLBAeO/BhYTErIQCOZ5aAQVTnaaSMhFwIhowPzbtW
 7yu8SB6MhDLhyZxUL/A==
X-Proofpoint-GUID: F264nFVMSM47TBeBngpoPY9CRsE5vrRW
X-Authority-Analysis: v=2.4 cv=M7TYuCws c=1 sm=1 tr=0 ts=6aa8a5fb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=3uEAWm1Q5IaYrG0nJHIA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfXzm6aVuPdO+7N
 LeAq4r+/OP7nht5hGVfupiRng4QWr2KqWyIiJxBoeGLL6zoXvQJTgv3i29GvpX8FFxad7Hyc51s
 H6lkGf5RiOGizRf9qbQ9KN0ZMKdoWHc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

The IQ10 Robotics Reference Design carries a Hamilton (WCN7850) module on
a board-to-board connector hanging off PCIe2, using two lanes.

Unlike the Ride Embedded board, the RRD generates the module supplies
itself rather than relying on the module DBUs: three discrete buck
converters produce VDD_CORE_VL, VDD_CORE_VM and VDD_CORE_VH (0.95 V,
1.35 V and 1.95 V), all gated by WLAN0_CORE_PWR_EN on pmau0102_e GPIO6,
while the 3.3 V and 1.8 V I/O rails are strapped to the always-on
peripheral rails.  WLAN0_EN on pmau0102_e GPIO10 releases the module
itself.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Assisted-by: LLM
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 109 ++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 4c4d54d7aa90..c8a6df21fa87 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -53,6 +53,100 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vreg_wcn_vddio_1p8: regulator-wcn-vddio-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wcn_vddio_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
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
+		vddio-supply = <&vreg_wcn_vddio_1p8>;
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
@@ -415,6 +509,21 @@ &pcie2 {
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

