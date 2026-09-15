Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0373CF211
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789437434; cv=none; b=D3W4d8LMW+Rs7a9Yu1FSXhYD2Ti+NIZSJ+Jl1JAwj27iwHpndTdplDq45XLcidfGsDsxawnQ732iiF99j0UuKS3PMSRMYRhqHuAMZ96wev2h0jUH6DpeBFeZdx+mgXzQ3setLUlsgOaABcE4ojYGtHwCD+wdcmZ+Sp/HKUVE0rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789437434; c=relaxed/simple;
	bh=OJ40yRLpfN6efrCKANy7vVAzWiOETYEWE6ByPCnhNNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RP7WoYQ9/mlOrsd/rVpxynrE5mIMppbZ1zoc2JNdjmkSijpE1FKoRV9QnHbNuqlUkcRAMIalVUz+R0zeRdrZop22F6ZVig57FyhtJq69/pNNkT9zz/UhrMgrlHMJojQm6JIkJ2JVThcp57iAUjElixmuSRoiBS717/oZ4k8wQyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HO9GDxxx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VqRDzuyd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HO9GDxxx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VqRDzuyd"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EN064A1440805
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qcTwtDodqRr
	FQV7lFtyB0bOkPWW/W3IrcbCXYpAuuVk=; b=HO9GDxxxUet6JNKp1ZuHTqiCzxE
	PEKaKYTRZmpRAxqTHuBc0sU7vbBKUry8upkoUmI1Se/O4bs5wQPENpnN4iBpElfl
	m8bzidH1AJ/bVU9TYhNyTAG0owObntmv5VH89qVtetwN1O1Q8MDjhsn0/YyBMiR1
	/beFJOB2iA5DXI0fmWf0/1tUJkzJ9vW99mCFF7TXyQaD0gKo0NA6rgNrfCo9g/Y7
	5eYmTefu0uQXn7vqjmGm82xEQdDaT7GTLs0fgKn+3bGma0tgO3NNfqoQjyQD7Sp2
	ToO7MaOjvXfCdan8qsIam5aCU4LjJLNCsztFPceneux+WaaMatoQRAVO/Xg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeuqbdk8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:57:11 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-855f662439aso7769240b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789437430; x=1790042230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qcTwtDodqRrFQV7lFtyB0bOkPWW/W3IrcbCXYpAuuVk=;
        b=VqRDzuyde3lr7mNHJnmBkTSvOWS2XkzQbQjDj2pSv4rZ809R0FzbLwf8LP6brptaHv
         lpSPy/fim1gvTifT0OonBWcy29zcKhDqCiz7YGJpyqKf+8kGGd0dUiv2jY79pjr/hEmJ
         Z8qsCzqGt/AXwkPUiTp7VvQ7Z0Z6+4A23plcFAdCF8J7y5qeoHyhsJ+9p8XirrMSnCRh
         C+mjJj4qBP6i8qLBH3nnMlPKqPC/cciAROH9Wvk96q2HFe8Y7W5+n9mqPYlDIWIsRdlf
         22Hjo3B+PPsgw7XluieETLFW5sjk1GpLag2EgSLu5QwiJwNUF9Ug/rofD6mtes8abz2e
         n7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789437430; x=1790042230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qcTwtDodqRrFQV7lFtyB0bOkPWW/W3IrcbCXYpAuuVk=;
        b=ktGGuCqIUBnjNUfYkxfmQvHcvRFX1+sLZ2EpppOX7c1gsT+0cgDZJ3jQ+SQNFxMyMO
         G39Z+FtbIAVb7pZai8yV0FnC6s6pBzebVd8aR4YZaNg7qi4xmBLAMZA9txsEBjYJ8JOA
         mDmJIBik+lS4zxMcmAc3nC5SbJ8DZD5Ke5mdJQwDZTzyxSZdJ3Ra80muHGCL2+vbERV/
         BO/y62AfvLbIHtiwZbuOP7iX3ntEusN9CBILFSJnojl+rEVIEC3OKP+/YWoYnEgu+QaU
         YhaWfOfmQkUeK3yRNmtX3vL7ozjHcj2OfE0SRnC6CdeIi22xaEoVk+APCe6SRyv8PXhl
         5p7Q==
X-Forwarded-Encrypted: i=1; AKwUvBww0skXrOoee2buZ/TGZiygtw8EYVmpkbjp3NTnuGMDc3zxzgf4Dw3YujZizVxIG8DqruQmus5EMz95VVw=@vger.kernel.org
X-Gm-Message-State: AFuF++mfuexpI2ALwGPZv3eVZF5ti/TK/GkA0TrJsPcYp8c+V5ROzd8P
	Q5Urr9tdUDryL8yCZ1pbktjDA9ht/ikcY2W1hwQfbLg8ma/9eRUoRUtcqi4Z6SiuekWKlrhjcsR
	sz7dOhPHG3EIkshV24plcOA4LsM4RbdxTxqmN3xL9JFDC+e4EKzP1F5qwXzKh/niTvkM=
X-Gm-Gg: AYBFou00cmn+SDn27mRESi4vEW0X7treZY4mBW+x4uhfadGE0iWahNI9Js+TqZmYuld
	6jwyk+qq/3+2LRn4cv3XO1Ll8rahUXKqrZP/augS8trXioQL3eZE1YSeoGb4jfB9tbFDAa9qBGC
	/ocNDSbEu31/YOuvoKeXuIzXEKr/fa704ibFrPGtgIaRneler91SjFxnZod5H3Ww5xhYpweQM5K
	TWNw90OZU6MxLxXbJ0/CSw16pYjaxcbP97VCwb8H7XeqEfC6U9qs3m8w/V+59HYsoyziq96FvmV
	lZ7HMEkAkiTHV90lWheuqahxT7Evg0KT4JRIeGuLLXmr4lTVzRWoMhVFKVV1p0OlO8/wReaz6u+
	3pc73Z+9AcsnHiSLOuVUIu7ZuJQyxwJLCFDNobWHMg6PwmSQ6LIaEPbzyxX59
X-Received: by 2002:a05:6a20:6a08:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3db404efb80mr11282641637.9.1789437430386;
        Mon, 14 Sep 2026 18:57:10 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a08:b0:3cc:ebeb:3efe with SMTP id adf61e73a8af0-3db404efb80mr11282591637.9.1789437429984;
        Mon, 14 Sep 2026 18:57:09 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4fa50e3sm31115791eec.29.2026.09.14.18.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 18:57:09 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add WCN7850 WLAN support
Date: Tue, 15 Sep 2026 09:56:31 +0800
Message-ID: <20260915015632.283642-5-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfX1wvCnBPQhIPq
 ZCVL54d9iuhz8qVTY8l5SCwmqZeeM3AUPpyB+D16w0rVOT4MSJxGstu/Aoi9Q1WYlhCKHWO3iJQ
 ezMF+jpUFy45KNnRTts04s4IxBhvg60E3gWVHHe596XQHLlVZxxKEfnpPx80vv6YHYoWHClxktu
 gl+9SUUP0DdgTuSJanZPs8m/BUohrS4oepk81oyjnoM4JPErsuqzDZwtcwiHkRwHGHmmBOEjeTJ
 voztYZzDQQ88gO7XhOyY6N10nI9jtp7O6iV+Q7m18JSlI9L9AjfVFGjJ4mp+zZX4LVqR0oJR9Uw
 yz1J/SUPE/8FTzeFEwbhwKZ7ijKhEKb9vpsWhI9VQfE3XhEQHjJP5X0QfmmGbB4ezUkokB9vrZR
 q/VjPkSZvQKETej4WJKhvTqhI9RFT64WjE4M95hNMLMnpC8DAFegN+B2tyMfR0QLOkrzheeJLBq
 BybPiD+DIVKrgn428DA==
X-Authority-Analysis: v=2.4 cv=TrFzFzXh c=1 sm=1 tr=0 ts=6aa8a5f7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=btXJogeg36QJwmQpmpwA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: d4vWfioHq72wpfkxxXeLpoIHntsvZiXh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDAyNCBTYWx0ZWRfXzkvQjpf8Tsv0
 eSFsdym9WDgzil4v0ax9/8N2Mcvy+1iqjXlyYYSWPEWBTwitqr6WSW3PTWAS0/ugx6LYQEdpm6k
 MrQ5baZCodfmghqzj4Q3Tj4JF8+sjLw=
X-Proofpoint-GUID: d4vWfioHq72wpfkxxXeLpoIHntsvZiXh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_05,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150024

From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>

The Nord Ride Embedded board carries a QCA6797AQ (WCN7850) LGA module on
a connectivity adapter card hanging off PCIe2.  Two PMIC GPIOs gate the
module supplies: PWR_CORE (pmau0102_e GPIO6) enables the DBU_CORE_VL,
DBU_CORE_VM and DBU_CORE_VH regulators feeding VDD_CORE_VL/VM/VH, and
PWR_CTRL1 (pmau0102_e GPIO8) enables DBU4, which produces the 3.3 V rail.
PWR_CTRL2 drives DBU3, which is not populated, so it is left alone.

Describe those rails, the WCN7850 PMU that derives the chip supplies from
them, and the PCIe endpoint node consuming the PMU outputs.

Signed-off-by: Yu Zhang (Yuriy) <yu.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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

