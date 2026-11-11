Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794382322;
	b=w470/AJFUnX5bWpjMOxcLFsU88dvqFJXYe55K9IZ6ytxKABpeVE46iaw6W/ZHMNmcBZ7
	 JUaIvW+OGK0mmm0RObEVMjE2LHoDg1TLHvn0GhQHT0wYBy0m74t+JhlB3PzErp+baBKI+
	 i5IBtcFRhr6Ho79vTNv8J6HTZbveRoQUNUB85fsmFSHlvGxzZ9casixtakmMVUvbDiLgw
	 eo2TN845PkJRhZp+Ab4WuH8/OAITBEp8YAKkG1Bux1RL40am24bkuZrMMsja1Oq9fZ8MQ
	 to6GyB9Nx01N9HcYPkO06yA+rh1VI6kZmPXF/mY4DDjJUBf+q849e/cruC0epCGx0Rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794382322;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xkbL40mO2PVdKWCtdMvkpOt86tMvFojdjVZxYUtw++w=;
	b=Jba6i0j8+F6YWV4c5VYmThCVsLfggq1/AFivY8EIzVIzmQW3CQEShH5vNJwZGPFkxLox
	 m2mkTtmDC8laSAq3qqbcBxlU6KpCnbbpAKcLFyqdJxM11H1RoJQc8oWHj6EQH0JLBiDAv
	 A+CjIHDyvh79vGHBp2tTkndccd9OuEqoG/mTA1fnZxVyHjfVdaOHWspS5//R16kP8CVCv
	 hYwzyik5H2Pl1PlX0X0W+VFcrvogE05LEMO4SKrbBObBlcapujg7RX7PiykmQ1f3XOCBX
	 ne8ywSvkHYMTjUC7bfrj0fAABe7EFv7Ep9hw8SkfxYaUFmP1VKlRLVEYQwi2LAqHYnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXiCbl68;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzGeL5mW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3482D60A6F57
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3482D60A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HXiCbl68;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CzGeL5mW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5Kbdp2021381
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:32:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xkbL40mO2PV
	dKWCtdMvkpOt86tMvFojdjVZxYUtw++w=; b=HXiCbl68r2cbTzzP531CX1UP2ce
	EOcQf3SPT3T+2aYIWZiedPF/JwTSa92Nn/dWicRfQV6hNtBhC/x360/eN2TBBwB7
	F71R5a/mPRnQjkaTv1vqIps0of/Vi+eUwbcwI60F8r/j0kgrst2XiqbV0/VR7xYG
	vTswdWkaldLG39bBr9H30YkEXwDgcb0XUaJGiXZN0llYbf9QBIPXcrVcd9irUnbj
	47MNXlc2do/ZKq7AzkJ2PpU/H8d1yTo+9hxOLqu2QiY2dxHPyckhkOpEHGo9hbTy
	1zw5RN2yLyUkl8pl06LOUAFxEsp0ceJTi2bv3PTEwxGcNmwwuCchHLOOtjw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv4pvbs34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 07:32:01 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so3935209c88.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 23:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794382320; x=1794987120; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkbL40mO2PVdKWCtdMvkpOt86tMvFojdjVZxYUtw++w=;
        b=CzGeL5mWZUgZYW6c/UkVCbEmEIGcHweMdVp/9NH7SBmhW93x6a83ZbLj71S2/CCikG
         zdnDsuE+CpetGEa1/vrpawJUJX004ONOCLD3q4CG2os4EUymWMMUOVHhrJr25IB/nhEN
         dB6Cv7Sgq5UbFprSQfizQeewTl8p9s/xK1wjLPJgfV1Qr4gF6sTuyUdvE292uDMXRowU
         nMTNViJYP+OQxUDo2Ro1DQEhhhpVIg+olaVIzUZ9ZkAa59+pw76QNFMGYcw2L+6Si9by
         uhCuJMVs40oQbZwBbrH/8rI1qDuRASwLXBWokP8R6GWAod782a1xvDBFSKz+t1Nqc6iN
         1e/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794382320; x=1794987120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkbL40mO2PVdKWCtdMvkpOt86tMvFojdjVZxYUtw++w=;
        b=LY5ZC2ntKWOh5GuttDmsdkQI2F6c+lj1Xdy22E6In98sjwP/7OB3Xvmu36m2PEvq8R
         Hh4ANqOMGWUqVTE141mpGpd/nj28bMJmL/QykUnKocQAKvT7QSwuBKRabOf0oO+fhe1g
         tuF00bHVNtEgEuLVLIQcW+lRttjqVwB/ptuJZbqer5oHpErIguRmVjRpd7JCTpSrgtjV
         cVw4IJ5Ep+yQhD6hds+LRXKSbkPrUxHN25L8/hLr/kbxabF+HKllYh6OMmniDKrheQ+U
         ovw6mpTA0BlnefMOfpo3IxLmXMzEIoU3ZvgGZ61+qU5BtnIvLoYYSAqCmJYTqyjgCtb+
         4aiQ==
X-Forwarded-Encrypted: i=1; AL+hErHyaa59ToCy+kdBZKFZ4+yChDLoBmFTbjC7LaLJ16cFg73p9FgthJ6WV3frKh/2UDlF2e84c1FTqdQPUJE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zf72qNvcsxUDWBxzothhEcvtBeUlcwDZdurZYyz79c3jlPfWa
	6O0sm3Q9StTflItZCJn7rZUQClPuBNgrY8Fjzoj2Iom/Qwb5pppFbnk3ba/n+IskbmhDAD5boup
	z2jejA+zQS2i7SV4Ki6D/HuNfSYaWiW2wKss+rehaSxGrfWykcMPW/HKJWlI/OonrnTc=
X-Gm-Gg: AYBFou0IzHMc1Amd9fxklUtnk3WKp4VOjNlwFFnRjm8MJT/n05EyguQ/dbdn/cgIR7o
	C54arrPErp0AVma2Gb8INPqE8ed9GfrH14st1k0lT++yUpYZKCSGMarCuyNU3pGTCkGrqQCslzy
	YZzCXWmaiuoSl8Z0VFwyNibL+9+yaHCiaaSLF7RTYTfATP8A4ydw0JHtkLCnRWGDM4SsVNxzP91
	GDhmeW9oExcv+ofEVT0RmrdKlSueKAOWfu53xaUg4AkmCLEUvGfqM643gxBISbge0EYBTM7eadc
	YF4gjsZbks5X9wNFRn5nLpj9pq6YqM+a08GH7sbsG4Xdob7aU+Z0R8pfJMwiEo/rrp2x1whdNn5
	iegynWcejUZ1rYlIGEjNLHmsC96elG10gw4Zk6JcoZ6JtyjOwDx4q39HMfTGOmvJP+Y81aC5nex
	ojUAuuJxwuBivdgBEsItxMomf3Dc9gfADh
X-Received: by 2002:a05:701a:815a:20b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b3c023c46amr1746366c88.4.1794382319982;
        Tue, 10 Nov 2026 23:31:59 -0800 (PST)
X-Received: by 2002:a05:701a:815a:20b0:1a0:b8f5:872d with SMTP id a92af1059eb24-1b3c023c46amr1746312c88.4.1794382318869;
        Tue, 10 Nov 2026 23:31:58 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm27220027c88.10.2026.11.10.23.31.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:31:58 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 5/5] arm64: dts: qcom: nord-rrd: Add sound support
Date: Wed, 11 Nov 2026 15:31:21 +0800
Message-ID: <20261111073121.3707030-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
References: <20261111073121.3707030-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=XqZvqlF9 c=1 sm=1 tr=0 ts=6af419f1 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=ZlzAYip4OQkxlMcad5cA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: ApRCQEYCMA0vRluU-OCHiWF6U9GZGIZv
X-Proofpoint-GUID: ApRCQEYCMA0vRluU-OCHiWF6U9GZGIZv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX2c7Xy0JAxfpP
 YArx+clnpFHTSrm1qfp7rQz4343TExyrN7VD/KXo6iCHufkf8wTK2IKQ6D0tSWJLcRZB42nzKHu
 jEK1cBJAyoPraXBmBa3/Qe5b/pOGGNE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAyOSBTYWx0ZWRfX7Yh2kw09YGvq
 EjRZVRCfhvinB4JV9N7EfSqZEh0guS63YrLz8wsLNLCPRYW6v29wEW0DDzTIGyDmKouVP9nW6cd
 S4Vh4QNjJ2zRNR5XyAdo3OqrtFZn/qvS3H4gmsYJ6L8f2UhCjDfj7BDOzE818HaS/nLeGGwynuH
 jCfAm9kEB5kv1+aOFm3pMZ9N+1qUqiHMV5p27JeIJ6lVVqfgpealn1XwWfGL9VDXoEPimEoP8IW
 duKDjQUweShZ/qEMHikGIRbdqpxxzZ35cdMTs4LyOqjHOxBOu7Ae6rvr7EW/S63uffRzvN0sFxI
 7+286V3wTRh1UpXLCHb9RCD08ohfy2WB/Gcf/yZBnyrEh9L+RjM9IAgDR4R4Iab2LJ/n7weKtbv
 AH7GWUUXlPGrVkv8MFIB3+ZzeGf4O2ncoPZV2Z5ImrxSnq9D4U9v8i3lHPQUZp4OD8nZd9HaZdz
 Zbk1lFZny6EJgmr1HNQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110029

Enable audio on the nord-rrd board. Add a soundcard node using
the qcom,nord-sndcard compatible.

Add PCM1681/ADAU1979 codec nodes on I2C18, with the PCM1681 system
clock supplied via MCLK0.

Describe DAC_ENABLE as the enable of two regulator-fixed supplies
(3.3V and 5V load switches) feeding the PCM1681, and the two MAX9892
click-and-pop suppressors as one simple-audio-amplifier on
CLICK_POP_MUTE_N, routed after VOUT1..4, so DAPM controls the mute.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 153 ++++++++++++++++++++++++++
 1 file changed, 153 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index 47978df0af92..b0abee05a8ba 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 #include "nord-embedded.dtsi"
 #include "pmau0102-nord.dtsi"
@@ -53,6 +54,106 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	/*
+	 * MAX9892 click-and-pop suppressors on the PCM1681 line outputs. Both
+	 * parts are muted by a single CLICK_POP_MUTE_N line, so describe them
+	 * as one amplifier.
+	 */
+	lineout_amp: amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "LineOut";
+		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
+		VCC-supply = <&vreg_per_3p3>;
+	};
+
+	sound {
+		compatible = "qcom,nord-sndcard";
+		model = "NORD-RRD";
+
+		aux-devs = <&lineout_amp>;
+		audio-routing = "LineOut INL", "VOUT1",
+				"LineOut INR", "VOUT2",
+				"LineOut INL", "VOUT3",
+				"LineOut INR", "VOUT4";
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
+				dai-tdm-slot-rx-mask = <1 1 1 1>;
+				sound-dai = <&pcm1681>;
+			};
+
+			cpu {
+				dai-tdm-slot-num = <8>;
+				dai-tdm-slot-width = <32>;
+				dai-tdm-slot-tx-mask = <1 1 1 1>;
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
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_5p0_dac: regulator-5p0-dac {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_5p0_dac";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 41 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +478,58 @@ rtc@32 {
 	};
 };
 
+&i2c18 {
+	clock-frequency = <400000>;
+
+	status = "okay";
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

