Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045424C9007
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766962; cv=none; b=WUce2X2CV2I2N4EQ7wnXha1Zk8ZQ/9m2Gt/ZyrddYrw4NfhG2KleFsP8gL4zlLvSMrgvE6tJ1YVQNldNfalK67IvWDn+cLfX+I/FyXg1ab9oh86FiFvMRGaagF2bK/ld0Ssl4fHh5VzswxmKN88Nz9bWjXuDVQSp6R2wmvLXLV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766962; c=relaxed/simple;
	bh=gDzlPAgnfvFXUTRQBB5gYeKcZ9ZmFhfn5B4gmT1SwvM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FTLpJDqiqymwRFVaMaPwXgK6WAaUG7z10wq3bP3lWbvfqmHTbCFLlGeDabTogHFw3eFXrl6h/y4S2RdnmUbP5iddSRwXjMrUh4Xxla6t1H83ZqSSAELXigsdc041jA7xEJHyfIlmsywhgY3vc5crg/S2Ib9rcyP/eANRCA2KpJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lTrh9kpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iPzrqrBh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lTrh9kpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iPzrqrBh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hPQ2584053
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lLHRgwSmrDBrAf6WxAAwJ0FXS4VWHRBfPODBW8qu9M=; b=lTrh9kpYYTT3xsnx
	SofwSq2FmVeEC3V+WG/e/d/nr6JQ/y6cCNZjK2gMOrP/RKOeLKTbHmh7MjF886OG
	Ovczvm5J+MbSP7TnC5JMCYxyiTnYLxTudChVFzKaIrs204cnXyVHwZnW3qv3ZkuH
	umvzZAdMYqvq6NgcWya2WJ5Nstzqd4583egC9MCYPakRGpaoCAKB0vjxQnwkJXmq
	THQpt4g2dqdQ+uB029unRP4c1IWIRYxWdQE5IovDPGk6ulI2pk0w3wa1321iaqtP
	DzdU2LDhm5UndmNUN+IxwtNEElL39cHq+0NdAoeJp5GUQKytrXlwzoDZl1lJrAq7
	BY8Vug==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhejfur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 11:15:59 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e2d4a8623bso11559225ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766959; x=1791371759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lLHRgwSmrDBrAf6WxAAwJ0FXS4VWHRBfPODBW8qu9M=;
        b=iPzrqrBhRBwykUD8o16eN6+T8L4yP2pR3ulgUYy4V2fYWMtqZCzxPIeb2YmViRo93Z
         Q8ahpnM4M8lAkit+M9LfsaRWpkF94QRkp8kVA3PJ57Li6QOXIlEzb1LZ/0U/MHZf+nhr
         ATxZtEOreYqlbXdgiGcfNTJDGOoeBJXFMhxAOYwa9b3hIwbBcHB9zf82G2hh41XiCCtc
         zIwxJ8NyILPw/gdORqqdab8LcQA0UY+/4bZ/OqtXminugNKM0AL0p76SsBc4tzzVwYXp
         AaWxBnVK9qy1DkQzYNwgrqbBKg493fvQFnQyCedVOFFVi3MmRPCry+wboUqYgCW59rHe
         uLLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766959; x=1791371759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+lLHRgwSmrDBrAf6WxAAwJ0FXS4VWHRBfPODBW8qu9M=;
        b=uXSvL6/M14fhL/+NxfqcrDX6wfxagzHbvML/VNn2BfOKZWk2Cfe9hOQ/gLms0HeixC
         4hvckEIxUmKSC4cR+pJY8x7E0lae6FRDt9IJwoP1ThDrDyyKNviQjgLpj6QDdh8RX0Wk
         MRBK1QOC+Nzpf6dpXB8qiqcyfkQpacKpUWPwb/EAJ3Fy52aClwwaXFtprruM+kRjDIwN
         MEL1tcxxSrBfD8mSfFpnRPXFBJHjoqb8QyhIdO9mCyt2Mm6pSdJY5YQxsXUowzKEV/rE
         mSZtupZ3pFCqxDP+7DRVrawfUSWfPqfSo0iqhrGNOYLMHdqHftxmJ7KMCHs0WGZ/OmqW
         +foA==
X-Forwarded-Encrypted: i=1; AKwUvBy8vGyB4wubvKOCTrj3egERvKi8OsJBIhJYJPatdP9BoN4XE9moHx70nuh5gsDu1NL0Zw9rsoLAX0iRzDU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIYcNXDssJs2mfH1FbdnTl2oMQfBJFkQ9/gsTVpFnEyqudeflW+
	kYG+PSd2km515xZiZxwqjsUCNHmE+4LJRdOyyGar6c7ofhgtoD1xobglsEtD0dwNLcTomGqI6OE
	CdOvJoDIHVDmC1n58smpcs9zKgBQrypK8q2u7B6IiXrahkrT7C7fzKDsCR3vbQ9bSsjE=
X-Gm-Gg: AYBFou3oLV5Fw7xUfMcizf000CYV1G3PhJaQ6J6Q6r+0nYQdFa+etipjHKjSLTFDhj4
	AGwW7HeW8XHmSmU27j3v6ny9TtzlS0hcxJybtQJM6uTRholc1w+saEWfLImjULSXyu5mP8s0Ato
	PeTV6AkBBmNvbmH7ehPRXdMxDtI/innU0IOLf6dwnFKahEMv/P3SVcFWXPBaTuHLF12OSmyVH67
	OJtxAs2YCIrq4JMhWQXo+2SWoLzRCaE7y4ekbgHIo0Z0fV4M6HwQcFqk6puKQA66lllo47fkinK
	b3lwjhVwSi4Wn4rd2Ii2dg/0uLdHeN154uGt4eE3ZdILZ1EENUwBrBbWI3kdhZPpiR70hwAVQxy
	H4DWIxS7mkgJakPuumNhfNggxdl4=
X-Received: by 2002:a17:903:2344:b0:2dd:c100:7cc2 with SMTP id d9443c01a7336-2e2e4a289b9mr9019825ad.62.1790766958899;
        Wed, 30 Sep 2026 04:15:58 -0700 (PDT)
X-Received: by 2002:a17:903:2344:b0:2dd:c100:7cc2 with SMTP id d9443c01a7336-2e2e4a289b9mr9019505ad.62.1790766958397;
        Wed, 30 Sep 2026 04:15:58 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:57 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:45:13 +0530
Subject: [PATCH v5 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-dt-changes-v5-3-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=3288;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=CpHwRqGXKXX4u1XWNuWWh+UiWe4FzajbhmRqWwtKRjM=;
 b=Q0mEo6hhxAAr6TcYV4z7S9Ep/ZKDVWG4oeNSt1lcvmF67Xi0ZRifj1yoC2KXj8S7+A2qB+gHw
 ATHnOePidUrCRQu9UqGgrq3cFnYSe6WntPK2XfAw/ulq34qtFZq0GVC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: zr3hg94lLyhpZ5y7yshqu7fkutJi5BP6
X-Proofpoint-ORIG-GUID: zr3hg94lLyhpZ5y7yshqu7fkutJi5BP6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX56eozJvVaEhq
 7N/9WTQFbmNpLTk9bVjCCfoSkN4XBnHp3b+To1IQMaAJ7hlWLSAfAizOIJhjn1OLWDKp8aZt7Bz
 GeVRDfxHqvNEG4YB8fOqpdPh5P3fxljxAHAhecHa3XmCF4vSoL84/+8zIivqdw0LS/fJSoPTLY9
 E8wvNhY7NDa9Ajit2el9mTkt/52Qm7OuugAWoNoKod9KEa2oUM9lYyrAYwP/TWbNACDA+HmLQyO
 loPBNPAiTTJUVkd+2Gz0wMpkFcqHRiw8o+J8Co82NcYjbYQ03aW4EDQ0dQSIYSR/zBUtDPslvie
 MvI1cPTjg9K5KvLwHjGM+XTahde+Vn7kBSqNwiRgLLaley9gWeDdj4sRm8m6eA9dFl78fGF3fBa
 hlMOo9PlKG0amSW6xjO9tnX6CkCbIwPM9Ozge5LiRGDsjH4673zZzyJ/OvTca7IhfTOgRcoU8zb
 4a638ziv4EO7+6pW0Tw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXwxzs0+WywT3W
 87YJiEovtgLviJdeV2aa1T7rvEykZVraUPHtaftskC0jsZkABWt67WQt3II6j0W6pE95+KlyIEc
 R+CHeEp/D/6DorZk7rvWjDQY6syKK+Y=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcef6f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=yejcvWCcBpXp99Qhm6kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm
Shikra CQM EVK board and add the DLC0697 MIPI DSI display
panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
for DSI PHY PLL stability.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 110 ++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 6ad90df3b415..c42669164457 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -23,6 +23,86 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_wled: regulator-wled {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wled";
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+		wled-supply = <&vreg_wled>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &audiocorecc {
@@ -93,3 +173,33 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

