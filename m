Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64898429034
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380765; cv=none; b=N4DEbNSiIvG/LU5t5C+ashz42ozd6/udfNRPPZrKe2NQS+fEQNHfAhFa2JBVWm83eMy51aG5djYCJMMjR+9Ld1BCtanQG8jMLNxqvttFmtbphXA3BB0mReTPrTRS6pEdoBl0kIyTgXHrGZSC0Nu0GNTi51ryJl1kBGPDrRIufOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380765; c=relaxed/simple;
	bh=Fu28UbyxzjDPNZJKvrhaDpt8VOyhtW+O79q4STS49jU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOdDZ/vBP9BDgpcinNzj5w2Z4N2BZyvC6gkxs97CX610b3/FtNhKhZmD4ExyaeSj4TEVdCJrIi+U2wE/J9EPiHVQpPs1xT5p7ntBtlFy0ZRL1L4cHiyy4sBGsJrdGZO3dwxtMUM67pHkyUX+lU6Ongy2XkXyAFPBImJd9gzNkCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OaKwmwa7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iDWhbMqF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OaKwmwa7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iDWhbMqF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nvf0402999
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0nEY/GZceuR
	pm+/tBc75KsRba6MypvhCQ5MZoRctDrw=; b=OaKwmwa70U3nLnGOSKVEfIoPern
	kz7/+7rcRplTX0b5Yh0cPaY9fzNswBIupkrz+y29hSeh4XW+5f8CW0a8YBINSacS
	/5TtwjHII5NH3yD3XeubQ0OMRUZSRaNXyGOmLBq0fOGsKUv972AMw1T3RfKMjF2G
	54vKgdglBzC34ydNsvex1N0wew+MQ9t1+uz4sY5Hu4DtKxgBfGsuQd3M/uuy8ipw
	JpHueB0Pd5dPDnH/qvPtmtBVs23tzO6hQpN6r4nbcTXSB26HNUul2qjQVGBibigj
	Lyo1AnLgA5ijzZ3U+3KWdTUACtKwXT6rjkS+lKQ/8ZM+d2we6jfUJcvFS0g==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hssw04-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 10:12:42 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab4ca7ce3fso3242388b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 03:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380761; x=1789985561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0nEY/GZceuRpm+/tBc75KsRba6MypvhCQ5MZoRctDrw=;
        b=iDWhbMqFyUf7q5YBFCzP6X4gEZt6ajmSQgA9thO2F/FHHsJVlDtYmhN8L0wDoe4JOK
         kHkGDHnLWpeRUH1VOKqHZKiHQ6V9xKb+9+5cIhkNvJs7SLdcvNOJ3Fc+cF/+030miMmR
         9Xb0IcDcCUibc+xh1BjLnK3ZSUbZji9iWNFVYxJ6es1CipqQsJcPzNfPzLetAgo+mYps
         6jfbhPbnhkpKEzoD0lBfLRSOawvzXTMg+3pixQI9Jw/ubUCd5ZfleSJ2bPf+uOSnzZ0X
         bhwDmaAKJo45HS+vtrSl4cTeeos3gKrP7NQkKRG7irqH6wY3tm/KFTK8O87yjp9Jt/cT
         FXoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380761; x=1789985561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0nEY/GZceuRpm+/tBc75KsRba6MypvhCQ5MZoRctDrw=;
        b=f2ipJHLe7SV9d5vhLfIJpuYaqRsyAwyEOn4NQ7qBmcuhUnIIyAEtgWTbfR25XXGnR/
         yczVoYTHaT5iqqdFI9LkLYDj/uGWExz5/BEuyBoaqtpHaZolhjd4rLoNDaNsfJQjlJNf
         rt7qS5WnnpZNpz2PY5j6BYDWzCd7uzzJ6YUBxltYq5rG68IcVz2MTPvSWhKHcOE3vDfG
         RilUCxlZnJ81W8/67CXYyccMIhPTt5JNKG9Bqs0CncQUwspYi3jcsZkccFw9vXW3BYKz
         TJlOlEb1rQ7TisfS94gPMlnJf8e9r3QXtjAWUhw0oP9On+4OBsKDqngmPdOUnSHVHT+w
         CLZg==
X-Forwarded-Encrypted: i=1; AKwUvBxdbv6Is7FXfu6RH/wYlnvRq/n3N/2Bhu0oqppUY+wNWK3hpi9dYJJJMvyAadKo68TDouPgRU4uCgUuXG0=@vger.kernel.org
X-Gm-Message-State: AFuF++lHaT3iNDvfpatTQchV8yYAkc90VboQ55kPq8j2gnVjZRC41VbR
	Zewh6490LhorJhURmlEQodGMwhqZL9Y9nujeVbzosfndunUnEhsi4zpUzSOpaoIKFu+00HhKBdB
	6sBIpgp1DUGzZAOL3lX6Ik0LZLeW00mRoab3kJpQLAobv6Cpj4edaGQMMdbYTTVewNO0=
X-Gm-Gg: AYBFou3aEtpF5tx6jjnaa4GQm/eEn0HGav823K5Yl19V6puJC0uQuTYNCGDOx6CIhMl
	qv7S5+mc2zF7g6ulXQZl887lzBhRuBFyH+MWj+RXPb5iHG3AJ3o/+rw6TeG72gh/XvIlxcxy+kn
	7gF7Sn83eeL14i4L8T0/tx6kUK0stg5bUpHDnP6UTkA6iAni+MlfQ7lZzuiLEcSZ2SFJDoV626i
	aEV/zT/hmbmSD362GnrvksemS4dP2TuwUmgEoCBNHURJur5Vsxf8ji6xCWTQDanZFIGMEq0ZGvU
	8ve9EkIUWS7lOaoYdE9wljZz+V81AcJ6rcys8zzCd8vLAeKRax9qfuVjhS2h0tlz8dYmE2BMvAl
	KpNzUQU4J7q/GktkyuzEXpP90aJkHLOWdW1uRvLTE5OuUGg==
X-Received: by 2002:a05:6808:190c:b0:4c4:a240:9c3a with SMTP id 5614622812f47-4c7b2df8cf3mr1291000b6e.4.1789380761381;
        Mon, 14 Sep 2026 03:12:41 -0700 (PDT)
X-Received: by 2002:a05:6808:190c:b0:4c4:a240:9c3a with SMTP id 5614622812f47-4c7b2df8cf3mr1290977b6e.4.1789380760977;
        Mon, 14 Sep 2026 03:12:40 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 3/3] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer
Date: Mon, 14 Sep 2026 03:12:30 -0700
Message-ID: <20260914101233.981643-4-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX2OJpDBHKta+r
 hZNf53aBBz/D0GHoaN5eq9T5s0L8+h5LfnQ2OxiVgUShNowIcg5HsYOA8Uok1A2ivhTTiiBNNft
 tEGmcbSBvkPFsZHHgkvW4YcHlybZl0lxOhdBId2OSVDt/W1Ac3IGYiXtoDsnv+hF/iI9woMV41j
 SDM4qrvnHulEt7Esanz+fv/naT8WcMDBS2AU6sKB48hBN8nY9nxfFluZGlq98x5j95NRI8UogoO
 6VOFp3NTB3bhOLAdfbhX3jpcSxJ1vaS7YR/1NwZLC1kn0lwNp3khQwm4CM4JY33UutKh45bZ3+p
 3UnkG7LmMifR8/6wacBuKzLJloVFIG1sZcdQTq9a4oimAa8+LxAA89v/BpCLckPAwKeTLZLVFnc
 jqD7IUiRShEDac42tbmVu6Bw5uSzGzmDQ9qd+9o+piYiTuVgYI+kjVcQIDrlvK2j8q0jsNb0RjR
 uRmUcwqU7PPTiBWn7AQ==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7c89a cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=8LwbUeallTqhS2w2LGoA:9 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-GUID: 0zlKCE5kFWsN_NFNQlUV7qplwHli68Kl
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXyYiGkUk2x12T
 keSjEC1myfUyxnsJkcPcXaLKSzvo4QzbxpF2svcGXMdrFmQ3Xss22MQUjDldiCp3UY7o6PKdq9H
 28U4A8M+PtzOv1wwFVB8fiIK9kwJPwA=
X-Proofpoint-ORIG-GUID: 0zlKCE5kFWsN_NFNQlUV7qplwHli68Kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140145

The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
I2C3 for USB Type-C port 0. Describe the retimer and route typec0
through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.

Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
their stale "Left unused" annotation.

The FSUSB42 SBU mux chip is present on the PCB but with all signal
lines unconnected (NC), so remove the fsusb42 node and its pinctrl
group. The chip is retained as a hardware fallback: should the PS8830's
SBU path encounter issues, the FSUSB42 can be activated with a simple
rework, avoiding a full board respin.

Co-developed-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
v3: Replace RPMH_RF_CLK4 reference with a fixed-clock node; split off
    clock fix into a separate patch (2/3).
v2: Updated the commit message to clarify that FSUSB42 is present on
    PCB but with all signal lines unconnected (NC).
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 114 ++++++++++++---------
 1 file changed, 66 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 57c8ae2e7d4c..a4a2a1fccf11 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -36,6 +36,12 @@ mcp2518fd_osc: clock-40000000 {
 			#clock-cells = <0>;
 		};
 
+		clk_rtmr0_xo: clock-rtmr0-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
 		clk_rtmr1_xo: clock-rtmr1-xo {
 			compatible = "fixed-clock";
 			clock-frequency = <25000000>;
@@ -138,15 +144,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -315,7 +321,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -644,25 +649,6 @@ platform {
 		};
 	};
 
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
 	wifi-bt-connector {
 		compatible = "pcie-m2-e-connector";
 		vpcie3v3-supply = <&vreg_wcn_3p3>;
@@ -759,6 +745,62 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&clk_rtmr0_xo>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+		retimer-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1413,30 +1455,6 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
-	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
-		mode-pins {
-			pins = "gpio166";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-			output-high;
-		};
-
-		oe-n-pins {
-			pins = "gpio168";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-
-		sel-pins {
-			pins = "gpio167";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-	};
-
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1524,7 +1542,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.43.0

