Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792568247;
	b=Dxb2sS4C23Cn21Xs3+cq+xgwfHLB+354VsAmVVjQWMknx2oj0KO+P+9bmlpIRTGtxLQ1
	 bu4jMFV6ZaBqwU3zkPMH54NaUUH5eMZyAlNEFspl3bKRQCludJQQM6GYrM3KiF37VmOyd
	 Z7/K8Ut+wFRPsZdpCxTqyc3Xg/xMJFRzQSZvpaMgRGXg/5oeT+5qt4yFrnuyKx2gQzPM3
	 fapJs6SeyjLIda/exrHxqE0sCXuWeyOqDyzQKz2REBx05Xpm01T84wISHcdXcWT5rfhCV
	 GbVvs+88DxH8aBeptY+sVZ918Kbclb+qDtZ5JIW7ltwDfwoagWc86f1D4eUC/bVewzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792568247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
	b=e+LEliids1rjMrGpx+lMONeLye8f/3Q5C9cDYLarkMPufyqXrMsOfATWYxVI8syt7HC5
	 YCOAUZzdhS05shonnc7xXsIQD5SdX/Kpgh0+XKoyMX3lMNql2YDwzw1oXFajIrmntGt/I
	 d9Dc8qQ7ExR4WwYyAFezrSohzrpz/+V9UV0zGksF81M2DtLXCvG3sJ7HFSsynS7kxQ9lm
	 OoB3qvTVyNphaHVD0cg8brVuT2f5DP7S3461N4qOpd4u+X4VdqZ5C539IHzEvrxNhf3Oc
	 B+ckwpwHwkhhXew2Oy39jCDZC6PX8IMXbqTGMJCmueBtHRoUPogFVE9/0N3zVwWYVww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K7BWpIMm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjSzr9Ci;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12EE7606A33D
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 12EE7606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K7BWpIMm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hjSzr9Ci
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L7IkPA458611
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2rZA7QUCdd2
	DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=; b=K7BWpIMmHXR5pAd0TJex7GHHXoy
	PaqfmlQP0141PSgO6ICfoqP3Ah7Lypz0UDqSSVxIJEo4S5FqC4bbbkSDUE5NHkzQ
	hRH5XN0UsESj6ROZafz57wU/8WUNh9t9ZOh6oUNX09qmH0/Kh5sO2sa99S15FN5J
	5DK8p9YMWWbMN2rUsm5ZDfpLc6qy7soNURSYMTYh7qkBEhj6/9LJOuVbclu/BfWO
	IJkM/+HnB9+ITjOQS0gqqoTnVCqggKYl9p8Y69CksE8K3NadII5n8zMXZfySC07x
	EAV2pntu0hvGNdDs8BMH7+tF0bfCyOA3+omjQghQbXiOm5t2q6s/8h9J/xw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjkfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 07:37:25 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1383723dfddso729833c88.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 00:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792568245; x=1793173045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
        b=hjSzr9Ci+j8vTQPiaDleHGiGh2VDyl3KOV6nH8KSMsD+YBTsq3GaDA907kL+4DeHe8
         N86wBxrlRq77Qri48BdN6Nt2LCXarSTf/V8XDHPOmt80+y0lRS5L7w0y/I0X3WnLgDNj
         GMd7U6PoiyZzFd0gF4WNSg6+x6pBIAXQOgTpUN4OzIb8qOr+1utINXv/s8OP+k/Z1Otb
         BZ18k3NEtUdYs2XBV9dRKVPGJMWETbdgPduF1AIRrqAdMjqpm5/aAn2Sf0bJsBwfmIT5
         37hisdyGFg208pmUm30o4OaJ++MAzR3D+00cQBR2wH4T78WTkNtz3gmWpx1eCtIab4Dd
         XATQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792568245; x=1793173045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2rZA7QUCdd2DDc4g73OokmpuG2DSpyK5MXIuYPZCTbI=;
        b=UxENZYXvKG6pKwV7QvP+rwbBB2wyUecVlAYzJy/kBe+XK5cDGTWF5ItiD7X0ULJFjw
         Bij1y7s5G7e8gzDRpyJakE3hP0U/JWkCIeTfs/0nSG/Dse0oRFKfZ0CsCfOAKJNPRbQm
         wDzx/fO+7Qqs0KV8EvDaxSFFjSzGqa+Hrsrgdn92aAm58/gTGNUQBz345lP/bUPJorcc
         f7A5I7RkkXw5HtIGYhPNlOJKQ2RDY5aUqC6vc6KA/OdZj1fDdmTsvlp/styDg78BNkfo
         X/0jnUi9pgOdqcDuvbWh50nZaTVDnyjuY7YNPeEZwZYR+MfUu2JX0Nnoj391NP74iOEp
         HKZg==
X-Forwarded-Encrypted: i=1; AKwUvBy1ib6LmtFuUX6xClJjJVFIcrWvhdzjmdmRoouWrC6X8zF+K/9Iop1dWWmaJXWnRgsu8s3iliNkNJsWDec=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4CbEcOC3vjOZRhgw9SEv8pKBDv7OB++tGKl6wzsuLYiAsY0fl
	Y2vuT3ySsAG3WiUz0C85FrLxxqWwaNUzlH6rRCfooSHtx3xbFbMP9H0qNJvoP9mOkkB5cl7Fotm
	NQI0nqE4FBtvDuNb12BGDmOaXSBLXt1KayK00HnVhsiVz57GZUhDlM9B1paK29WQm0XQ=
X-Gm-Gg: AYBFou3PauDCOIUPoLW6NckHDyq2pyUQYz1NsjAR0AqlOFy5bpldGWeL2t3ZUydoN8s
	AyNKI7lhmht/kKTLIkb54BeOvVPcrrv9I+RCdm8fF9CKCHZ6RhFczocUIjdbndESPV6AZRO7mVS
	reRYXmJwEr4XOEo+PFyFwV1jVCLrHLcy2vvi3Arn6r0F1SG94XV6HbvwHzFB0dmu5oiTQq4iBrM
	9heXjyk+KvtxYQKGJ+nZcaxUmlPFWHwUdXHEXzf9qyEJliSvfFi/s4pudN6jl8RtgwOV4VUykyW
	tEdr5CHWc7fHFzFSUoP/E/y+/gJxgi4enzDjSAqZQLJGC4azfOHGM6X2rz5pPONQSq77PgpDliK
	z9tjrHVJ8mMyaZ9MOzlUmL/+KkThdKDclnf36s9Bz3tkKhF8V21OPhNknbNM=
X-Received: by 2002:a05:7022:6986:b0:185:869a:8c64 with SMTP id a92af1059eb24-1909fc7bcd7mr2409901c88.1.1792568244222;
        Wed, 21 Oct 2026 00:37:24 -0700 (PDT)
X-Received: by 2002:a05:7022:6986:b0:185:869a:8c64 with SMTP id a92af1059eb24-1909fc7bcd7mr2409844c88.1.1792568243635;
        Wed, 21 Oct 2026 00:37:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1903bf5d0a1sm4042471c88.14.2026.10.21.00.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 00:37:23 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH RFC v2 4/5] arm64: dts: qcom: nord-ride-embedded: Add sound support
Date: Wed, 21 Oct 2026 15:36:32 +0800
Message-ID: <20261021073633.2163128-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX8mrYv9GgV4J5
 0axFPhYFM96kQlgdu56lcTDqKfPtvDXhcCmhk8QAfUrOQEmq3EPPu4EbUChmbbKOsngEu+g8uwt
 yE8YAGzadrj77YLbSRth2oqy+pO5SlIT7EAES3z9wRrNF6Phkk4zsFSbaAX3aUU/Y0GZouHbiKQ
 iQ0EQyohVG/iRiQ95z4KhtAvkwMylvSH0Ur01vAPycrcVIwqt6hxPClzNkty3jNX6x896TENPZS
 cRrfh2iuyyZEm34KpzN+B1d48/SgBg6eV4KozXu+pKH7FBfDj7pXw7A/jf9hrKlX8eQVqfJKT43
 8QJY3lcm0c/7IQThrRofNBOAuWjsT+mawdTko3E3W48LaCvHaaQu/3NN8PJ81bQ7M3XQEk8mI6E
 HKl6RYSvuC/Shgr0hhZbdncbHR6Xhi/WSQA/XTTipK/fU54gSAbmrPUC++71olCvbvQH3JZmQaL
 z9272mSHje4mCa5MBkw==
X-Proofpoint-GUID: _YrJuW0omCXk4N4E7fdHnVJQBAiyeUgc
X-Proofpoint-ORIG-GUID: _YrJuW0omCXk4N4E7fdHnVJQBAiyeUgc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMCBTYWx0ZWRfX309mWA9wXkAV
 XisrdVLJgrKqUWMWPLeaJTQr7qDwK72MteZMNOT3WKhs1mm1dtUQH5EZdZIafXqJsUia1aLLQ0Q
 DS6H5PMZ2bhI8kmktJawEiJ43LNSrLI=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad86bb5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=WpxzUcmsBv8F2e-3JPYA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210030

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Enable audio on the nord-ride-embedded board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0. The DAC control lines come off a TCA6408 I/O
expander on the same bus.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the three MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..6, so DAPM controls the mute.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-embedded.dtsi   |  30 ++++
 .../boot/dts/qcom/nord-ride-embedded.dts      | 166 ++++++++++++++++++
 2 files changed, 196 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
index 1ead642254e0..8f07f9f9ac62 100644
--- a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
+++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
@@ -1106,6 +1106,36 @@ nsp_data_noc_3: interconnect@1fe00000 {
 };
 
 &tlmm {
+	aud_intfc8_mi2s_active: aud-intfc8-mi2s-active-state {
+		data-pins {
+			pins = "gpio75", "gpio76";
+			function = "aud_intfc8_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		sclk-pins {
+			pins = "gpio73";
+			function = "aud_intfc8_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		ws-pins {
+			pins = "gpio74";
+			function = "aud_intfc8_ws";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	aud_mclk0_mira_active: aud-mclk0-mira-active-state {
+		pins = "gpio99";
+		function = "aud_mclk0_mira";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
 	qup_i2c0_default: qup-i2c0-default-state {
 		pins = "gpio111", "gpio112";
 		function = "qup0_se0";
diff --git a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
index 49635695f832..34119b80d395 100644
--- a/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
+++ b/arch/arm64/boot/dts/qcom/nord-ride-embedded.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,107 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. All
+	 * three parts are muted by a single CLICK_POP_MUTE_N line, so describe
+	 * them as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&expander0 5 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RIDE";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4",
+				"LineOut INL", "VOUT5",
+				"LineOut INR", "VOUT6";
+
+		pinctrl-0 = <&aud_intfc8_mi2s_active>;
+		pinctrl-names = "default";
+
+		aud-intfc8-tdm-playback-dai-link {
+			link-name = "PCM1681 Playback";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_RX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		aud-intfc8-tdm-capture-dai-link {
+			link-name = "ADAU1979 Capture";
+
+			codec {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&adau1979>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&q6apmbedai AIF_TDM_TX_8>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
+	/*
+	 * DAC_ENABLE gates two load switches feeding the PCM1681, one for the
+	 * analog and one for the digital supply.
+	 */
+	vreg_3p3_dac: regulator-3p3-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3_dac";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&expander0 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
 };
 
 &apps_rsc {
@@ -366,6 +468,70 @@ vreg_l3l_1p8: ldo3 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupts-extended = <&pmau0102_l_gpios 6 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&pmau0102_l_gpios 5 GPIO_ACTIVE_LOW>;
+		vcc-supply =<&vreg_per_3p3>;
+	};
+
+	/* ADI ADAU1979 - 4-channel 24-bit ADC */
+	adau1979: adau1979@31 {
+		compatible = "adi,adau1979";
+		reg = <0x31>;
+
+		AVDD-supply = <&vreg_per_3p3>;
+		#sound-dai-cells = <0>;
+	};
+
+	/* PCM1681 DAC */
+	pcm1681: pcm1681@4c {
+		compatible = "ti,pcm1681";
+		reg = <0x4c>;
+
+		pinctrl-0 = <&aud_mclk0_mira_active>;
+		pinctrl-names = "default";
+
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "sck";
+		assigned-clocks = <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		assigned-clock-rates = <12288000>;
+
+		VCC1-supply = <&vreg_5p0_dac>;
+		VCC2-supply = <&vreg_5p0_dac>;
+		VDD-supply = <&vreg_3p3_dac>;
+
+		#sound-dai-cells = <0>;
+	};
+};
+
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@195 {
+		reg = <AIF_TDM_RX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+
+	dai@196 {
+		reg = <AIF_TDM_TX_8>;
+		clocks = <&q6prmcc LPASS_CLK_ID_QAIF_IF8_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk";
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
-- 
2.43.0

