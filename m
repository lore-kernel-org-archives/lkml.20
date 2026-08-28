Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045BD47045C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925965; cv=none; b=cC1ESrT9jP6eBK01/VhcOLaDDQrMECzknTLQlwawt67RS9cfj9IwPyCPYlH2gcRLwrq1gXwzKFOR34m0bk831mCRBJkJrRqL05fJDpbi/9qi24H4EZb6j7mpXkPFRKgrE7KU6LTV3nvVLWFzvudA5Mb+IWPeLonGmXR1zJYOfeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925965; c=relaxed/simple;
	bh=1brovUppJvb6ttZNs7kwMEVpoh0akbg09pFKeVhGO2I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhgKkzf+yJWPLhgZpQB9IHR+PKzE5dU3QYoLEgtGs8n/+D5ZMFaxT6MN0hjItmfKIVnqxiKte3+PSD9knfrLtYTeyTEFLPqS8Sf319LyLFea8zUHnx71U1CwG+SusV5U9WA/7RJth/5uU+EhmAyUY1WUL5jB21UeV0FvgxK69Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VwCD4dLo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SBg6OJTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VwCD4dLo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SBg6OJTB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDkcR93279767
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7S42qkfhoToVEYy/FsQ080jT2C6K7HXx1NfxPU2yAE8=; b=VwCD4dLoAzD8N4dr
	LLUEvS2ahZRwbDsYPXkb8GI1OEVLwv1y8ArrGOd+5h0/FX22zw29Ck7jZMFy5LCV
	TRKniVInuRMhWTbUrH1epIu2notpicVY25m4JqBOmH3Z6Ro2X09ORiyFKHykj+X7
	bAfy/tM6bVMKAC8s8WyxlrRrfX1qm4/oFwnF0aP2iq00BMYvZgP7mcZuzfy/ji/Y
	UJMQNARJSm0nVp1IKICpIT9xk2+jH6W2QNm7EesVdeh3NibnHH3wT+LcqrWrmTSo
	ZYan83EWZD/Vz2VYf1mEhGqUPa7KLcE4DapI73IEDQwPI/omNCw9h6cjWYNgHs1B
	RDAoyw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb62h1gna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:05:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-783b725c8c8so888388137.0
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787925958; x=1788530758; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7S42qkfhoToVEYy/FsQ080jT2C6K7HXx1NfxPU2yAE8=;
        b=SBg6OJTBTn0kkYVU8pspEY7a9jOX4HW0z/cNJOCT8qA93iG1lc0PVeTiFaMvZLCnfp
         G0hPA88nXYztp5ImZhR8HGy/zO4OvZT7jqoOQq1sOm3iZ0KXvvaXELtaJlkw/3Rv9VUR
         Pxc6Z0SRGSnnxGrluYI/qnPSrKZYDsDelNtFUG0+o1JTyLdjdqfMw5dOjZyUcOaHlm8x
         DYgrC11GAGncVf7mf/FH16Hnp8iM0W7X6/x4A3QsNJU8O+XpUTBasRCd6GMB60gck3/w
         RsiJE9qoRaKy2IeU1fCFtxnjMW/73HVsM+/TYgPs8mQjCV1O2NJp47DiZSNtzfZGBHqN
         tmVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787925958; x=1788530758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7S42qkfhoToVEYy/FsQ080jT2C6K7HXx1NfxPU2yAE8=;
        b=ftGZIs5X5pXAMkSfPO9slaOauYQnovjvFfmySLuusMMne5VOtHoK2wn0ZWvRRKRFc3
         r1JAZdT4l2MjF8p8Xh2IkaxI1HAe7aoZzwB1AURv3oJqp+VdKA/Ymuv/BAz7kArf1Efl
         y8SiczuTZz3AQmKzl0yOCr8BYozVuiDhIhnPGeOw5LJRquLlD13a6YkO6ItO29KLrmR1
         7Ld06l33i6C05BJabRG1bdkCKia4AK7MZP9obyDvCHi03B435R/LOgJA9ihsdTTfh1At
         AQoErjjIanqsqv/n63xGLjXrB8mssxdCxxFUBdMg1gi+HNp0RPmnO14ooGRIjJvi4Swh
         e5wg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2qBm3WljsLarMPHlzA8fM8AANvGzdWZsThl+8OOMgJLCcGSK7gTAUgYqkSWtUDn9fSQZC5K6UhKLA3mQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nX5Nn+akzbj4W7B/yQ7u+j9+xVJB7hsU5EDv0l11glWTxwyfbA
	/ZVdu7VNh0TUgFkFz8+a+YiSfVdWqseZHtf6NxKz/9Vcqg2YQzWiVedm8on6uHqSWM0tnq9iMYs
	ifRJf+cLW9jYsEXmMBiJGJlK+hGoZJhptg2AQp7bcj3+mbzRsNmcC16QboWNG56au7xw=
X-Gm-Gg: AR+sD11ETKLCw7Xr9rwmJtAJaC/PIssZ3b3HkWOsdMH+THDexliL9CFmOJHkn6PhxQc
	J63lTXKA7d5HRGbVSPHEnMMGXSiXkQ+6PsMpQTH2soInHexXQokVJ/bXZH/HQ1xF3bC9g+GSCuF
	nf+edLSexzFRmvfz8YdFyEMzbkZlhHIhlgVVnOJC7XIS2+ncafFnz2ijGVwI3cPQVXeqe4h+7K9
	FU51Mkg1Flgqf9bzr0AOwe+PTh/kbdDowvM7TX6x3kVbebnalCLj9/r4pBNi8d3eV+3t5JAxP4x
	X3+AMu7BPgxPxIIgm5HGoW4blkx4VzkPdidrCXbV1jP6Rjt+hQNR51AQH/RT2Y4d7PLD4An4P9h
	2n55wTDZ3rzWAd+vXbmXtV/Y=
X-Received: by 2002:a05:6102:14a0:b0:785:8f76:654d with SMTP id ada2fe7eead31-7859996dea3mr2555564137.13.1787925958200;
        Fri, 28 Aug 2026 07:05:58 -0700 (PDT)
X-Received: by 2002:a05:6102:14a0:b0:785:8f76:654d with SMTP id ada2fe7eead31-7859996dea3mr2555540137.13.1787925957739;
        Fri, 28 Aug 2026 07:05:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20122sm3908633f8f.20.2026.08.28.07.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:05:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 16:05:09 +0200
Subject: [PATCH RFC/DO NOT MERGE 11/12] arm64: dts: qcom: eliza: Add HDMI
 display with HDMI PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-drm-msm-hdmi-eliza-v1-11-67843277de17@oss.qualcomm.com>
References: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
In-Reply-To: <20260828-drm-msm-hdmi-eliza-v1-0-67843277de17@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-phy@lists.infradead.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3332;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1brovUppJvb6ttZNs7kwMEVpoh0akbg09pFKeVhGO2I=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqkZWh434bFUqmEnSRcqsBUTydZhsSgPv4+miDG
 XMlneJoAQ2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCapGVoQAKCRDBN2bmhouD
 1wsCD/9Mr2Zz4eadLs8rLbHZ5HLoj8IHcYC6XeDJBJ1hq4JmXgA9jzZ+iJwEmqmCHO+hd3lbluM
 L1ufQWKSIRAP93y/MLCFtw77XbOtvmpCg6nKr1393bd6hMFwzpwJn4E8VlMojR7kl+PnXamsAsh
 pPuK6s6pnv/uY5yZfWO0gMCBdTuwXjpUbpYYnMhP88AgUFUykJ55+9Ba5DSZVAtmK7ZjetkAv61
 I/u2P1IbLdsIKgUUQiR1wbXa0phdVCUoVr8ziBhkOVT60LBNksyXoKjGZPr8EzQpAgU9LUhxJ3d
 TjiM3PLC6Ur1wPvN8ANHOxQtnDkCdY4He9djZ5266iTpV1ZrAHpqGNhbMWnsjXVuTBwv3QeKRXA
 hlppN+whNMClQuLSY12GNHRINbI1bSyh5gWk7bHKsO988VkutbnhSgOnGUTBpjTz1OC5bNaxFNs
 6pPhgIq8plNv3MOhsu6rpno+QcujtZ4y1k5oIFHp0kbkLK60F5WP5urqGNR0sUBD7XmqwmzlyJs
 eFQYX2MnjvFzese4jNfjZHcapT7f6R8OKRxGRH4kP9pOYIkCkzNQ/tQXxUC/gxdnBigh/riykcV
 O9mPclqIeHGQSjF7S2fHOvChM2pvK5j+L6J4aCQe+FpFYpo7edImd/Kub32vtHP1DtbIKgp6Eb+
 0RMxMekt3ocM8ZA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXw5rs1ex3G6y3
 KLnfqGzpHVNkYAX4rR81Zm3sFLKUovR3U5veE+tqXNEOnrqf1/QeiHxA/4+xQbW3hBSle4tm59P
 5RlQRWTAmbxSN0spAJorncQL/A8rcug=
X-Proofpoint-GUID: dXkn_-gChChA2SRIGxucA4cmMaKjZyoH
X-Proofpoint-ORIG-GUID: dXkn_-gChChA2SRIGxucA4cmMaKjZyoH
X-Authority-Analysis: v=2.4 cv=I5dVgtgg c=1 sm=1 tr=0 ts=6a9195c6 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=BhlsTWrtbvULCAht3EwA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEyMiBTYWx0ZWRfXzeyLrjQdo7bY
 VUYHuWimR4SEQWF5KLc2VnF4gytWqgXcUjnWvPucsDjw6N3IrLeOMZ2eA+OFUxwgBqmXnc7oMR8
 sDhOIrWKYy+GKa8+YF3/SHRhNPCzcDuiPYnsJDnP3FzPRb0YkEoPngUekFgJv0lZf5gCqjvtxvc
 GfjTTYpwqCjqtXABVGA6NBrxy1AMuLo5k+/uz9/hJ/BZoTOqH9Ve4wsKDasZZJZyaRSPcrxSCKq
 NvYrZGc8wVgFu/aYBp8vMZKzTB6cnxeFql9qEYePe1pp8J+z3pEjZ/pOk/8Vr5aSlfkZowkXQ1B
 QKHC7u/s11soYiJms7a+RE9rEHSnNpqDsZvWxLZo5lte7cJEovwKxfGMXhhIakW6hfuzJHexbFJ
 URWZWWc/lfbyZtCsyuHGE5aq/lpwaZYWVZgl0iEKhoNBhkU0pLHYhkELkK9fcQ4qCCF5GNqKNvb
 y/1+xOkUsADLJwy17xA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280122

Add device nodes for HDMI (similar to previous one in MSM8998) and HDMI
PHY (new Synopsys-based block).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 94 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 92 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 66ea4aaafd73..27dd15766f51 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -2570,7 +2570,14 @@ dpu_intf0_out: endpoint {
 							remote-endpoint = <&mdss_dp0_in>;
 						};
 					};
-					/* TODO: HDMI */
+
+					port@3 {
+						reg = <3>;
+
+						dpu_intf4_out: endpoint {
+							remote-endpoint = <&mdss_hdmi_in>;
+						};
+					};
 				};
 
 				mdp_opp_table: opp-table {
@@ -2805,6 +2812,89 @@ mdss_dsi1_phy: phy@ae97000 {
 				status = "disabled";
 			};
 
+			mdss_hdmi: hdmi@aea0000 {
+				compatible = "qcom,eliza-hdmi-tx";
+				reg = <0x0 0x0aea0000 0x0 0x1000>,
+				      <0x0 0x0aee0000 0x0 0x1000>;
+				reg-names = "core_physical",
+					    "hdcp_physical";
+
+				interrupts-extended = <&mdss 8>;
+
+				clocks = <&dispcc DISP_CC_MDSS_HDMI_AHBM_CLK>,
+					 <&dispcc DISP_CC_MDSS_HDMI_APP_CLK>,
+					 <&dispcc DISP_CC_MDSS_HDMI_PCLK_CLK>,
+					 <&dispcc DISP_CC_MDSS_HDMI_INTF_CLK>,
+					 <&mdss_hdmi_phy>,
+					 <&dispcc DISP_CC_MDSS_HDMI_PCLK_CLK_SRC>;
+				clock-names = "iface",
+					      "core",
+					      "extp",
+					      "phy_iface",
+					      "pll",
+					      "pixel_src";
+
+				operating-points-v2 = <&mdss_hdmi_opp_table>;
+
+				phys = <&mdss_hdmi_phy>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+				#sound-dai-cells = <1>;
+
+				status = "disabled";
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						mdss_hdmi_in: endpoint {
+							remote-endpoint = <&dpu_intf4_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						mdss_hdmi_out: endpoint {
+						};
+					};
+				};
+
+				mdss_hdmi_opp_table: opp-table {
+					compatible = "operating-points-v2";
+
+					opp-150000000 {
+						opp-hz = /bits/ 64 <150000000>;
+						required-opps = <&rpmhpd_opp_low_svs_d1>;
+					};
+
+					opp-300000000 {
+						opp-hz = /bits/ 64 <300000000>;
+						required-opps = <&rpmhpd_opp_svs>;
+					};
+				};
+			};
+
+			mdss_hdmi_phy: phy@aea1000 {
+				compatible = "qcom,eliza-hdmi-phy";
+				reg = <0x0 0x0aea1000 0x0 0x1000>;
+
+				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+					 <&tcsr TCSR_HDMI_CLKREF_EN>,
+					 <&bi_tcxo_div2>;
+				clock-names = "iface",
+					      "ref",
+					      "xo";
+
+				#clock-cells = <0>;
+				#phy-cells = <0>;
+				power-domains = <&rpmhpd RPMHPD_CX>;
+
+				status = "disabled";
+			};
+
 			mdss_dp0: displayport-controller@af54000 {
 				compatible = "qcom,eliza-dp", "qcom,sm8650-dp";
 				reg = <0x0 0x0af54000 0x0 0x200>,
@@ -2913,7 +3003,7 @@ dispcc: clock-controller@af00000 {
 				 <0>,
 				 <0>, /* dp3 */
 				 <0>,
-				 <0>; /* HDMI phy */
+				 <&mdss_hdmi_phy>; /* HDMI phy */
 
 			power-domains = <&rpmhpd RPMHPD_MX>;
 			required-opps = <&rpmhpd_opp_low_svs>;

-- 
2.53.0

