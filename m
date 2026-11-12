Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458226;
	b=r2DZYTvoWwCcwJXkOlAn4S5llT/9GphZJW9B5OSwRy6/90mB1eaYOKZQIllYK4zshgAg
	 JHI20kfAYVrrcRctdRYY9fJR7ojmo4/y7B3Mrr48yu9dJNEdkDz3tQACCBPLrEygsKVH5
	 vb+qOnMzgn5MvE/7hM6WnXMhKrxR2nsmwOfIjVn3qrT0QuHkQNJNRtHtTQOsPuO18oWQv
	 PXaM0hsE/HEghDERAkpvHB56ykngmnZasGdNTXhb3eHXDggX3MzvmR9fNInwG3AzWpL/8
	 hvAw4PNmtNzuovXDnBqp6Pv2jyLYo0t/njtxbRiyu9lHqoFighWYHZpRSQfX3dC87TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
	b=Zr4QX/2vS9WO5cx7cIXrxxJnb082Xn9NuoB2i1Alfr3jUKs0NHK8ER1D6vJzTOIlGSLY
	 A6Ih8Fu2qtfTpfVGUvu7KFoB8d45PvYnKjmgCU0z7gmHx5mIeWC7LBSepeFD7xMJwg73k
	 n6bM0EAah2l0TqWDFh3yNmbdTaWnnJ6XksHxvh7g+SWQA6JkRGldyQRyrWz3n7VLHvwAJ
	 hHbzmkrbGBzKXfbg4EXXg8dt7xgY3e2DghnlMo/qQ3VkKn5enDvCxp7qe4OVA1mdZbsCm
	 vYr27zYhbXJKKt+snVPpVvfa+R1F0tXJ+LiRbZR799VDKr1+rl3u0ytRZM+pgyJ73ig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8KTScis;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2RqXo3g;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AC606A8A3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1AC606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8KTScis;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L2RqXo3g
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2ZfDA903679
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=; b=A8KTScisN04F/Dfr
	uvXgyFAAbbkKyyL7ESWlywj5IF1Sl80FCjCsU6XGms0/8XuNw3gVB/Ek6vD8awbi
	vMZ+z8fDIrUdaaswGrjDu+QzaJnv8QVK6L3tGTA+ptXSezPzPFPMkDMAwmVa/OSa
	uE8rdANa3NphI3mvdFwGJ91Nxkark/0IELIJKwMFDy67Vlr/PTuwEpEq0iCCwFj+
	SKgli9MDmtTKjPMnNK1gxlXpCLfLakssVaShi2r9iWXmytMw8E0RtnbE8kW/V+X1
	Ic31UG1RrTgSx0wNfSxlniBrpJToUlNv9UXT5dqjOqqvS4SROzYy4p2SW0LrbRKl
	ybdysw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1uay96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36ecd5db581so984436eec.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 20:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458225; x=1795063025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
        b=L2RqXo3gWaZ5O/ZGNEh5JRE68gY7oopD0ktSPlAC11UyM323dGFp00qJ1/l8EUepLz
         PQZt2NyFEykK8zCHfXIuIrwijO2HZGCfcnChHQp00cjBdwroS+XJ6xv6nTxOzMqFN4FO
         5TP4OjmP84HIwQ5dppOMxneKgdRO8AlYVJBz2ApR5pBHAqkKw7RBhpOGn8JxOInCIHU7
         zDQh8yVDHInCp/Zx4+nVy4DZkkkZsSKLkDHCG4+bkHa1m67boQoeG3Z1jsesFYuG5N4d
         6cCEsfEd1vUPXUSl2Zz/zybFwtX0k0LjKSGKb4OpTRJBZYkQEjmDbvwyI33khHqfnMdQ
         MBiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458225; x=1795063025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
        b=oP0Jf94HXYSO7uzI1jWaJZujZi6uNP4uztOdQVgfzze+SxPsqiOCOu2v/QPjDDLkuj
         cxcb5z6Dnlb0pFHdn1O8ZoIUv3AquHL5M/9WaM9HOxQ8sanfGy1u+tbMDLubQcdwmYZ4
         ctsDzuAUHWFhLHAUQ1fNdeDhtr3C5JUUkPj3FycYlmcJbPze0xxB3NY/IM6Q9Mr7acLe
         F0ILMrrQEojkkzKiYB6RYgwhu1u4iIo/bPmt8x9etpcc3hJmnyRYUnPxybPRepv1GB44
         Z7Zku6WWC4vQpfNUp9AFLyIQQzPOetzyusY4LG5HWZlbGKnJzYACnr7Yk5x/ia/BdydQ
         HC+A==
X-Forwarded-Encrypted: i=1; AL+hErFuCMH8ddEbR4rpP094MzEHxyOlnLbFICXuGnPtLjKFI++77mXr5DiNDB5wSnSzRmurj+HY8HcAwSI2D3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+gtWsMYhphY8VE/wjGzljIpbaKfDiDqsqbWCT6bNqZ4OChpoqG
	6YGriQIP8mP4UBO53l1JxuXhyRW8wekzUcj7EIf93zsFUOmFvHtR2eMc3eZvR7hJ5XrYtf7Dp0e
	cOs3HFSWXYmkOElIVPoI6wCqChM4bciOGwpZDnhErKILum2H4fuNl13AcUH4poWbOboE=
X-Gm-Gg: AYBFou3QYuzZgar0kR1YpzMaaSnus/Xyp55aKk7IdIPeDP7sRdGfpIR2gOmZHwC6lHJ
	3UgODt9cWD+uVPMKkEtMoCxaUzVmDNmbqrwHi2eM2Delyusfq3GKAjFI8sM1QS4lDquYyeMjeEV
	osewt8w398vCWsaMCBWBj36D9D5ELz0u0RwMOTZlS5Q7hv7eHyqK68MPWxkJSO3Wnzs1VivEEkB
	i1PzwhgJ87K7iE0+1q/Kx0gzwPYQIebrS1QqIlOJ/gCajxS/SK64YVBeavR7g+Si9F/8j51gQMJ
	r5+PVSwuXw/45FiOyiaB7/uWMyvU7I+m682fMuplzHG96u+LEam8Z9tMrWNfFoNvbJ31M/0yqVx
	Ndq8ZQAp9RBHknvMWki1O5BEVXfTLyABjubofytsTHKQwPsvs2/0qfo+dWvGr0dgf1xluKY9xUN
	W6BL+bJ3TGUkXoS4WXseXRjv849quzIyTyD09A0O2junurh8iwhAnSi6Vs4+a9LbyGoQM/g9sxd
	J7YCKY=
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5070349eec.22.1794458224221;
        Wed, 11 Nov 2026 20:37:04 -0800 (PST)
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5070310eec.22.1794458223534;
        Wed, 11 Nov 2026 20:37:03 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:03 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:28 +0530
Subject: [PATCH v9 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-08-dts-v9-9-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX6IeptTW6L/bn
 PahtktIaiPtA7JPUr0GLDKPEeXUV82OdHiZOul+/Wb86jdy71JnvbCJ92EEb/4AdOZklyrq/tuH
 zKLGWpN5BCEU6eK0+b04L+DAo+DYChY=
X-Proofpoint-GUID: HQ_bvmSnS3r0yIrnIPoaDY_WA7z3YWe7
X-Proofpoint-ORIG-GUID: HQ_bvmSnS3r0yIrnIPoaDY_WA7z3YWe7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX4Am0VwGrWDb0
 HaXxP3jis0gtCL6e+3Hgtycj6dgGABk++WOLYtvCySH90Uaa6GgMpcsDmxyhQXPyD+uShNTGWfW
 OYTf357S0ujwpTAgMh/+lCn1BATDuMxkTwD+rMESm8w1NhgpZ8JHVgFjhlqSn0cDO56re/neY8Z
 /NYOr0g4N+00KD/NnIzZ6Xcb10wRwyWsykgAnsPLMskIjzzEtPDAOH3HEptypK2PtARva0K3Emc
 Nh57vaoFTcPlLE778mwY2JvVrTFvvMlAL/6h9Tsx5n8bwj9b5M+2NYK6PDXz3yB7Bmlmco9wzTl
 fNmIlsKCw7r2w/+5DN0a27wmrapHelmQ1ZvJce2pIuP6AOFc12wtmfo8FSb8HXdEr686XvBs+af
 MGl26Dr7YcOHo6HtcNmRRCTIsb8dKscr5sOvarJXClCzLocrmrFeBDVQgbs4ia8qm7fASqzeOc7
 YDnKZeCEKHzj/j5SDhQ==
X-Authority-Analysis: v=2.4 cv=LvcHWXdc c=1 sm=1 tr=0 ts=6af54271 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GVWKzDYot3hTMZ8E5o4A:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120018

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 47 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 87a7e625a2a4..7cbdcf58d946 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -202,6 +209,15 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-pins {
+			pins = "gpio20", "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 4cb9f399d480..36f874e57b42 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -173,6 +173,14 @@ opp-300000000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-qup32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -460,6 +468,45 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

