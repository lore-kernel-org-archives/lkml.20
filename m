Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6829A38DC71
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789370417; cv=none; b=cK+x7VW/1yPUSiZCXMgK9tTjhaMDvXGkFDKjMUY6XZrQZmNmYmmj3HYebxlkLQ8SKo+udQ0FJWixTw0kiAuMNCwCLNsD6m9nKSpqLe7RFd+zxLnUQPmti3sYnsgAsj4tXDx9asCb+TUWULXKjuKY1n1DgVnvo7txYxv3oJM28VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789370417; c=relaxed/simple;
	bh=0Dlj55dN3ldy8GK2h2cIof9VUS9RrJVjegi6K0eLVDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aqc1iyfg8hmp1yXQeSvKurQ3gU0Did9/z4WTG/LgokvBTvmbhAHQjwE0VoJwsEcTRPY0OB3iTG5gW6bAAchX3zL2SJu2oLCp6q1zSn0ZQgOabLY9941TItaLPZJoYs5QLmekGSCOnEAa9iqsbQ7BWobA5Iimk56TY4rj50TtJMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgGTO1EM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBT9wS3K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgGTO1EM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QBT9wS3K"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j4ZB063755
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1wyaSbPziNm
	UY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=; b=JgGTO1EMCNQeg78mFKCP+1IZomu
	WLP62YhVCgUUC9tEsDYUZS0zb0JheJ0enlWBVHsqhcMepkmdfGTxH7oRD4+cosZR
	i18KCSlJ5ScO703mdQhx8XWZh9umTxO4/tp0CCmHXI9pHYqEgcBmAHxSxfC0DAwJ
	LqBxnSotzAIiTY4WUDupDEpJVqlOQGb+vazmIOfAXH3HViJRlVqAl5AY7aLl/l6p
	scyfDDUC+5d3E7mAnvskuQYHot/W+cccLaHXb8a4R7aQZSfk7p6EV1X8rCt1TDgA
	WaxpEMaLB4+FtqVqum6EJkl0pkZhlN0N5TQ/bJTknzjhOhtFWM7ICpRK0SQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dnhwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 07:20:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2db22383e8fso43118435ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 00:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789370413; x=1789975213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1wyaSbPziNmUY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=;
        b=QBT9wS3KqJJ8I6wewSv5OZ/OoU00B6P2Jw72RGil5HCYATSDD1T2ThFXztf3d+R5/5
         KoRxrE9eOytTMybM5gfDFEfr3HzTitCh4AdTGpQ3rILiN2/h3PBYW0I1V3brvCn7e50u
         d0qLwlvQXjGmnlYLY08hGUniWBGOe7EaN51H8EJ213NsYPiQMix1iGlwD0jov5xNbohp
         yFP4bQPE05qPznqAof+/QdTP/5bsXA3o1f4GMC5CtSNfb8tptBBM3pw1WnkEqmoXtaJx
         FXzOPjH5sjIW7Xg9cOfv7Nk7TZgz8RQZC17Mk2cPZ4oZeUshnj2Phf5nhOjQCW3Kt4/A
         2DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789370413; x=1789975213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1wyaSbPziNmUY9eFlBEbV2JMTIhaQ9KS7++vm1XlY0Q=;
        b=DkHvdmCZIzJvjq7620nk95GvsG78tuEo4CqWbWMJjDM4o5S9jAd+XjHBvwa0jxO9Bt
         U/sOY0J0/XRIjP1wIPPyKVpQVHZf1kwU/xN7YQIXTLAwfalDYpnKq00yRugbezQXIABo
         MTI2AeCrNyK+OYcJoHgjo+TsYzXUn8BupN8QsItRub8qN/BM5/Hl8Bgoo09Wdua/z9Us
         2FplQLZsFJ8VFCu7ITIdGPziWwGj+xRYRR0gKNt58q98NV9qKjUTVs5cWX4Can5C8zAG
         jOGYFBaN+LAUR5KTgCFJ1aSgDdnm/0pg8FE8EHV7keISntPX515VLsiRFIeLNBbZIEv4
         9hyw==
X-Forwarded-Encrypted: i=1; AKwUvBwpXPDUVcqQulSLqMTg51tw03qAnoZbSFocw3oXjJT3PjKX4N6YTlNOsaqm0OdTES0JSMD9jA/JQuaqB4I=@vger.kernel.org
X-Gm-Message-State: AFuF++n3a0P0XXdq4yPsz0CXOpUz4ET2feVPMIpfYdotz+jRytdw0jJp
	RFIu0gmFJ8HPVw7E1RBKEC3qWfBvoW1O+s4ZfHWy5ASbzw1hNliKKHH0r/FkjECaDoieTdMEq7F
	i8Ydda4rUg5pkPT17SR4O5kxaVpn2ZktfkLkpw1tF0JAO5C1LVcn8idf8+k7HTFHzpvk=
X-Gm-Gg: AYBFou1TRsOEuisBMLQXb3MVlCYzok3BbEq5kCebfKDqkP6WwHtriOewyVydsw3L3bl
	Pb6q74Dl1nFDjGVRO4Gpzga0nX29U2q1YnwfG5ZSt3qDztTcGTfpe5CEDa9TJoZqun2TRtT5vk2
	4mOW+ZB3fPeSMwYflhtvxT7J+eW9ZhyoSIUdo4VfCSKPdwzB9vkhxl/rcRemHdFmq0n1PCAZPdV
	6tdB77idjMs4dyjj5DSDj+ARYMLpA8WHrgeXY0LXnTyzi0QJB4mT8CpxT9UhatzaiJpQYSRVTa6
	oln07DtVFJrRagISuydOOpsqYN6BLqhEKKVC+OMPbKsu3sNrI+XITcn4xE8FzGzL9RyQm1kqxz0
	WBjeZID3rbRV9KhoO5DweXdM7RE4oSIEdIV2wrZMJgFoMk4DDTt0uh3L7Oti/
X-Received: by 2002:a17:903:380e:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dd5f1940f2mr62465675ad.17.1789370412965;
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
X-Received: by 2002:a17:903:380e:b0:2d8:d4d2:d135 with SMTP id d9443c01a7336-2dd5f1940f2mr62465175ad.17.1789370412517;
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bc03778c7sm14782238eec.9.2026.09.14.00.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:20:12 -0700 (PDT)
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
Subject: [PATCH 5/5] arm64: dts: qcom: nord-rrd: Add WCN7850 WLAN support
Date: Mon, 14 Sep 2026 15:19:44 +0800
Message-ID: <20260914071944.164217-6-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfX8RiJiNkCfEmq
 9+vLHBclFPnD5Var377Ux0anA+yGVBpisWHc0s94lEVAACBdOM3oBO2DcAWxypB8VPA9K2AyCpT
 OBcAvng6Q/H/UFOSchgsKXOy8j1DkQubSvm5/AuLAsk8EkucIxy80+DUKegqeet4WuGRF7X0xYl
 qRQseDPPq/S0NZICA7Yu5TfL6gQTd7oLJzGqcPCJ6wLKd12ZA6YSoqU6ERAm0Ma4uQpBKlHGcOR
 TMFoRWl31JCYLr0MXuFbb0NPxz4CfUet5lVYym1mFTpLO0GoQumAR0Gp27GM32hee26IwJCkt/j
 LjICzYOQ8QyZ0KV7n8h+ncZttj8EsFqADejjM/fRmj08B2bgzVI9v5txzRfSJ/oEEuCuqtPA0H7
 hjLMeOqHKH1Hat0CkJAI6NTJeguSO4jTq4RyNyu08zM8JsorlT6NxlXT99e81Psze3RIo3uVe/G
 0MOXVUsXmL4cn90QGRA==
X-Proofpoint-ORIG-GUID: QLqogBmdux8izugUZXYQ3SPOV1qJxE6X
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMyBTYWx0ZWRfXwwgjdqXvTNqx
 ImoNCbK3y116fBNyQlJbYMSU3YRVBQB8NLMsQcS20nDUPAojUNToeGqda28+ao0kJzgKZecYjCD
 vRHhZbWe/q8vB6lYdq0iAjWgI9R4RvE=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa7a02e cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=3uEAWm1Q5IaYrG0nJHIA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: QLqogBmdux8izugUZXYQ3SPOV1qJxE6X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140103

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

