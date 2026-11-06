Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793934140;
	b=cF4IRNwAOJiLBRYpoJl5AMZW/BvskBYoSvPCDUoDHFWtSdUgJaqqHGiXzxAvx22tvZaJ
	 IwdhUziwxks0LN3YrdDOLiXzSVnMhonUTpsV0628UD/n6R18oWrdJGXgjo4CWbyjimqCV
	 O9E1KWHTXL1W2AOpHKeXTjmkJAnO8ujxXiDRpBgJHwi/I5kmJK8gZxIUOLb2FoiQD7oOZ
	 Rc7u5QJPBz83n4BwMdAJGTDMmzyzQz2N64a95hTM+izGda+0PiPI5oIvRMVQwcaYQkFkb
	 xOWhSHqrKgIChFr3sz7g+z8yvhdIjjdwBz43EfRJISk8wJacjDAf/5ZOGk4PpmGb9Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793934140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o2l5lE2agnBc46p6ZVGz7RTUuNthTwntTbR2yxLylwk=;
	b=WHxFGNrKHHOYWNF1pXf66SNwuXza0Vv1Yl/6QzAhNIcQ/q4grt80yDgCAGEDzXZ/DTi7
	 1E9ciSP42F4b7EY3MewSkXIXhmy69Cd67mz5Td0q+KCckTSL7cNqi2K80k9XGFnWA73uj
	 lvtHXSbS8eowl9KbNED2KKFhxjvh+fMtMT/GYNikduI1S0ru7nzxbWCFwkdXX2TSsa4CZ
	 xP/EFklZIj8NYi4bHdeoACiloKGqDXVxDAm6wjaY5O3dDy/LMPVRGYLGBBE2mGHmtadf3
	 hjJy86A5gbChHipGf62mSZ5vJr/A6fXBNjnaVL679Ha0/z8IQE55q5t6RK9y3nWBIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CisKZ4zZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9ROR+oe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A88606A33D
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 03:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A88606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CisKZ4zZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O9ROR+oe
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5Neils1170722
	for <linux-kernel@vger.kernel.org>; Fri, 6 Nov 2026 03:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=o2l5lE2agnB
	c46p6ZVGz7RTUuNthTwntTbR2yxLylwk=; b=CisKZ4zZGcSIrdbLlgAHQGSZfLf
	rTCkfPeWlEXm+SkeAuyS/xP08wsfZ4eyVjeTH6aKBAjPBPGQ+5Lh4Ybt1yv2Dt2o
	fmXEdhVrkuO5YzQd9S9k/yREHk6/xDS9nHumLRU8/8HiRCdaajRZ9R94eOU7pZjI
	MI/WjTpR6CJ/ozqRTudEgLjBiim2VoEMVyp7NIhapqGz+o1laKF444G1UEkfjdiw
	P76+NKSFpmWjsSytDXHICRWAeZ4vbxF1M3YqBv5VkKwQ5OkwP+QPS+ivSmPHUbig
	HAgzQO5LRBPY5320qFuF5NSTNR2E3N/3rtVbRkbCCd3VYiAXKi155o2WB7A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa8kn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 03:02:18 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36ecd5db581so644174eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 19:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793934138; x=1794538938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o2l5lE2agnBc46p6ZVGz7RTUuNthTwntTbR2yxLylwk=;
        b=O9ROR+oej2NAIAwl5o879Pzl1tC60oR04fbyUR/IkZuMdWbSNKJAGmkgCJBTaRrmcl
         uLeEkqsMPWORPqzkYBxkyLkGiYzU8YJ8/2gLTyYqPIWtoXY+b2SCqLEc9ePJRkKXFPjf
         79wd3KU08jyT/NhTI2z45CtHuQ9SL0IutINh/6qIcAjbEBIpP2nCJJvi27tE3ZjgopEE
         5sQKX0LtcLYgAOWQ6mGyus0g2DjcDcKMWtWKKUmMeeWd5BbjQFQHzr6am7bsaXq2UYmq
         DvHmt+tzPYa42WjWFw2Xulo90gLD8gleVw4m3pZDVCN/awTPsXc6dLqgEp5Ia2cS5ftl
         505w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793934138; x=1794538938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=o2l5lE2agnBc46p6ZVGz7RTUuNthTwntTbR2yxLylwk=;
        b=L54uVvpwkwZNKbuk4F0paz7G2hIo7w2L1eQeL1dlb5hOI/4sxxdxY+vRx2vq73NL2k
         abNnqmsYcxpjvllzZkN92snGyCyKMIEfFzwE7Eymgkl4v9tOoIY4FyyPpnPksr17ZHWB
         /cCEgHZUFNZG3xfW/2OoHnRJ/fTv3PL7xu6KGvwVBTyThCq313ht052tdqZcCtg0sQEV
         X4MBcSEzubE5IZ7Q7triQejHZFPMSM5lhIrpXS4ozv2PWaEV5cetvU/7GGJimidPYW6/
         ehiVOQ+/NpsIOLUCKA4Xdmuogxav8KxOOBukHg7hEqfuD77GaGild8om5O1WkYJlaVn/
         evHQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6eoQ/Frm/8qWNudBe9TcPw4nQTsbkXK/69qxqz0lZYcUqR3G/EJkyREXNkWZ9GU+/+G0ncYZWLcAndgs=@vger.kernel.org
X-Gm-Message-State: APuU4Z8qTzmfy4qfZYXzf6zjWQTE8DVapQkcTp3FI276EFTggSYAEu2o
	DL2XEtEHhAqEAnq+Q3QFt9MQPvy92frYvTiAcntRZZUc+u1WXT7WZoKMzYJk8OIE8qrh9C87vGL
	LySbMsT9v2e2iX+l+TEoDyke5XBWgFnjl0EgHPxdezX7rCcrzLXVzmTYwXK2/lZ/2z4M=
X-Gm-Gg: AYBFou1KsS7XYD/xlUaZl4h3YVE3p5d0WbIWNbx6SON+pLdRjv2VLgF/s0p7zj3IySK
	fGRUeKw3IZVLQJZKmAAw12R/lfRXUmWjND4ogsSAojJ4u9pWwcXgtckVBxGDtDTZgDu/v6Clyf8
	EU2m+cBJx1ksObBP0ToDCvtV8xX1EKSFFVbRvlg3NHYrPnoGlq7dEEdWp9r4prBjpc3fbqOy+3Z
	vL6rwvffjP3z715ebhhNteXPdJ2my96AjhQlgCB+ZkaHEavpNBoIMj/MUivp19hFmk+sssPp36b
	Hnr+w/aDHlyEJAyWCZIwlh08T+fSZRb+jg08T0fqGZI/wFDheU5nbQ4VwLa4A5y0cZj7t/NtLZi
	OhKblebJ0khpVSKx3TNNuUDIDbCBqJyWHW8DAbEhFcJiFiR0Y1OA0fCqomvVKpb9BDEzjFd1WLp
	T8IM0XjmYGHC+22eYcLre4NffjvzY=
X-Received: by 2002:a05:7300:c8c8:b0:366:c497:610c with SMTP id 5a478bee46e88-36f770080f3mr1595208eec.33.1793934137451;
        Thu, 05 Nov 2026 19:02:17 -0800 (PST)
X-Received: by 2002:a05:7300:c8c8:b0:366:c497:610c with SMTP id 5a478bee46e88-36f770080f3mr1595163eec.33.1793934136867;
        Thu, 05 Nov 2026 19:02:16 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa9ed126csm1484905eec.18.2026.11.05.19.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 19:02:16 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: qcom: kodiak: add CSI2 D-PHY common-phy providers
Date: Thu,  5 Nov 2026 19:02:12 -0800
Message-Id: <20261106030212.2811027-4-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
References: <20261106030212.2811027-1-anusha.nandi@oss.qualcomm.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 028Prj-d0QX_Ct5S-9hT16ZUKmVkrPTv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX/esdnJZWlYZw
 i+7FcM89fu/V9iEtp+mDEugcNFKnWFQXSv0MCfmmAImB5FIMciXv20zSWIQUg6EsxouMBz6sHWk
 JVlOf+EuGbLH8fpYGEtkydML+F8sSWz4eQ5L7W2fDg90qWFbeVNxgVIN1eSAS0opaPIag2gj6zu
 3qlBxIV9yMWCqM/Q12CQHVDUSuvlDSi+iOnnbM8gWIlln05GH6n9Lcvq6/SV0/eL4JxkUppkirk
 iZKQryKxeVsOW3P1q8I/VEPorgaeWijfN5Ewqf9BngbixeJ0Xf3Gnx+/SJ1Cr/hyRMx8d+/YL3G
 UurfQS0daDIMibeZfNgeNw/p5iXPMfp4eK76qcJ9tLMThrQYc4Coz6BLmQoJKmX30K2/PNxOl1g
 KPz4mdXAKUn6PJ3SjPm5acpRuw3QgiOBjyWp1nBmsUBiShRq1PiEdGwW3FfM9PtsA8QP0MEH8gn
 FKppJ8TqHyJkTLGWNiw==
X-Proofpoint-ORIG-GUID: 028Prj-d0QX_Ct5S-9hT16ZUKmVkrPTv
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed433a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=AEMvfOE69tE_Q1r2TxsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAxMSBTYWx0ZWRfX1hXF7E9qnuc1
 pr3prw72UFvmDc1xvTVtQhA/pxIDIv7O4b9JF8r4En407QINZc3J3fghr7hus6HyKq3eODf4k7Y
 5sOEpBMBGYhs+Yr/S+G9TIkg/B9ZFF4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060011

Expose SC7280's five CSIPHYs as standalone
qcom,sc7280-csi2-phy generic-PHY provider nodes (csiphy0..4) at their
existing register addresses, each with its own OF graph (port@0
sensor-facing, port@1 CAMSS-facing) so camss_detect_legacy_phy() picks
the non-legacy path once a board wires a sensor through one of them.
The camss node's own reg-names/clocks/interrupts for the CSIPHYs are
unchanged, so boards that don't use a provider still get the legacy
binding.

csiphy_opp_table moves to the root node, not inside soc@0 (a
simple-bus), since it has no reg/ranges property of its own. Its
opp-300000000 and opp-400000000 entries are both kept unchanged: unlike
SA8775P/QCS8300, SC7280's cam_cc_cphy_rx_clk_src defines both rates.

The provider nodes are disabled by default; a board or camera overlay
enables the one(s) it uses.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 172 +++++++++++++++++++++++++++
 1 file changed, 172 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index 8c7523602d27..e0e1fef7882e 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -968,6 +968,18 @@ opp-128000000 {
 		};
 	};
 
+	csiphy_opp_table: opp-table-csiphy {
+		compatible = "operating-points-v2";
+
+		opp-300000000 {
+			opp-hz = /bits/ 64 <300000000>;
+		};
+
+		opp-400000000 {
+			opp-hz = /bits/ 64 <400000000>;
+		};
+	};
+
 	soc: soc@0 {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -5164,6 +5176,166 @@ cci1_i2c1: i2c-bus@1 {
 			};
 		};
 
+		csiphy0: phy@ace0000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace0000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy1: phy@ace2000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace2000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY1_CLK>,
+				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy2: phy@ace4000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace4000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY2_CLK>,
+				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy3: phy@ace6000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace6000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY3_CLK>,
+				 <&camcc CAM_CC_CSI3PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 448 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
+		csiphy4: phy@ace8000 {
+			compatible = "qcom,sc7280-csi2-phy";
+			reg = <0x0 0x0ace8000 0x0 0x2000>;
+
+			clocks = <&camcc CAM_CC_CSIPHY4_CLK>,
+				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>;
+			clock-names = "core",
+				      "timer";
+
+			interrupts = <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
+
+			operating-points-v2 = <&csiphy_opp_table>;
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			power-domain-names = "top";
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+				};
+
+				port@1 {
+					reg = <1>;
+				};
+			};
+		};
+
 		camss: isp@acb3000 {
 			compatible = "qcom,sc7280-camss";
 
-- 
2.34.1

