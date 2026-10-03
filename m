Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0F93B27FA
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 09:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791018166; cv=none; b=hqKQNmEVeD1gg5SN6WqxEtnJsLeOXL3b9d5tanYbpiCEAqTpeNxwUWhXzETwIL4pP866PNtaWtPfp1O5cMQurLM7ZQwDKvDLE7SAqkn/cxG7b81aEbmXiBk7dpzquUvddB/DUYUkW62pTSsMzXFiHJvXE1t6dFNSobZP/V/ZSNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791018166; c=relaxed/simple;
	bh=8l431bMovcM7ljezOyVI2CFesdp1rq7MNtrhAG0Ub0Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uVduXRnE2TvGa0+kv/Rb7dpqjhcEFHFDMq6f2BG2EX8HV3j6c+QUclxdESsP+iqbLOu97dAwPpFmsTQtNwJz92p9nNA++FhMZtsmEOFx8m3MqcOCL6ieAOvnC/rls/Z6DM1sDi6u18sgRx0xIVy2rYZUVguvHgAxrOHNVJfZ3/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BZMAFisv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iw7b36cz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BZMAFisv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iw7b36cz"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6933djPS3190774
	for <linux-kernel@vger.kernel.org>; Sat, 3 Oct 2026 09:02:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k70G8B2hvVN7JGew1rWDtZWVUjv1RQCNzhcK9YH0HpY=; b=BZMAFisvwU35Kdfz
	f9lc0E0wm1+KuYhgfcCABfQ16vAsyVMmhnjrv8BV+A1K/B+0F4X2vLjOGsSS50H3
	YW/qIncgG3LtoaQdcfqmM2dx5o6Ilsd1MEW4jZuaV70U9F3uzTgJX0ZeuwxBb3vA
	A6QvxVWSzWef9osQdvQuV7hykxG87FszckZtIAWIFopsGlyMZWP7jLk0XRFRF5Vb
	qKUS1hcbSS43FOb90nuBx9D1HkVTPiik0bKE+9HeOaZSPPkBaCr+/D3ETd/fc12f
	VD0JILUdftEZoSkE7m9lP/1v3A9GeSZHVmm+G8h6CjYsAnsWbNhXYXKfwWq51T/y
	8APpyQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06rgfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 09:02:40 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34e676375d9so148079eec.0
        for <linux-kernel@vger.kernel.org>; Sat, 03 Oct 2026 02:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791018159; x=1791622959; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k70G8B2hvVN7JGew1rWDtZWVUjv1RQCNzhcK9YH0HpY=;
        b=Iw7b36czaMnj0/w9PhYlP8OYGix1d80oiE38wsTuSt0euZCENIor91lBfXAQL2DrGt
         R7ODcGyUbJyRrISUOohD8CSU6JFPnWERqJWpBU30dsSc8nmgksq0U0DW/b5+Hsz6iWlZ
         f5TYvBOtU0k08YkOG7zo9eeZxnxbXLyYGIBuLYLbScVa0TFEuenWRdRoi6jWZ5fLhbff
         67TSPMPwqNRgm2pfY29a/d5LaxXnHBdg7VMafZxUGoAFPqGSEm2pdvFrl6UEUWY2ykQL
         n+/778ba/pzQJ26WdMV9xQ64rHPGayOlXBYIp9j8QQRnhE1+X5VEDUmptaf2kML3CC1j
         I68g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791018159; x=1791622959;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k70G8B2hvVN7JGew1rWDtZWVUjv1RQCNzhcK9YH0HpY=;
        b=J6zLn8hk6tjYqbSkJSRuUfyjI6iMgtZ1Pq6xRV23SXFV7m8MDEZ78ExaHjZL6fkNfC
         6S+TCf18iaO2EN89754Un7uqqE8QaElf5cUWb58vTiFw+iAPjxM9oJ9K0F3kRLjD6MUT
         RxHuQ3C9wYsbUuaeNm2wl26rs8FN+rYDT+ugnPU+BfDxFvN5OOtA6u62T9s7ixOfhGU9
         qEXKK/MGMVCyTB5yIh39Fk/Sf3UKeNWbZXrhr++ZEfrGTrBkdswVSO6uNcMHQ8mKwrIV
         VEDbjRnLi0ok9x1HvI9jMWUiG5d3NNk6W05Ne1qY6d7LDpH1WusAKW5KwGYpt5HgjMII
         l49g==
X-Forwarded-Encrypted: i=1; AKwUvBzSR+rchOtGVpLu6+T1weI0Y2QCJH9uK74kyrwMsQIDfaOYsFHU6N4N3BMYqeJ8L+raYhy/ekisFjp1exw=@vger.kernel.org
X-Gm-Message-State: AFuF++m01iAyBNncHbZPThYfY+NVhQmudajeVAHLaab6PXp4gBe2+lxj
	vd2/Js1Aml9wL/jkG+I4P12jxOfS3Xrm1N7I7TBt50iYogfKJudMaBvKc3gKvfpK5pIzWPLb1v6
	2sl1VXA1ht92eyG6WdAppnlAYzwFB6FzBWvlNh4RmOLnDmxpxSofnpXpCCGv+YtE1ENE=
X-Gm-Gg: AYBFou25Faynn6ymn+fLzsVOUb/sSEKku+2a46AjvTxQwtHmaz2ZBfqwtx3eP0tLl72
	jegodsKU/+6wuFVyh5B8MYJ8CZ6nvf0Tv/Wsug2CPJAZvnNNAFx8naE5BhAGuANYgB8ZAo+11gN
	/YBlgDIyStgk3+YTbbXabdCBGHnUZAiyn3o8RofGMRzNOX2fxef7P8KYh8IyMmsL19iIGzA2xSm
	EI2u0qLimhOV0VfD9kS315B/xB9ThsVy40uPAXN2i7TzvEW1lNSAqkMgfwAYJCzatoSaM9FH4RJ
	dQ5tlskEt9qTPLNdQwtdRlHPHhUBvfEtIp2VoMPkpHNoP2svrhwoWLurbM7kiSGYmRaI5QgZVQj
	X9yG7veheoXcUx1wbt4okmtA72rFHBn2HMLn7/sG4JGSO7d91YGIj8dDW6KDQZmhN0000F1MQr/
	tTNrbe4NGrbA==
X-Received: by 2002:a05:693c:41d6:10b0:34e:e22d:6c39 with SMTP id 5a478bee46e88-34f150ab91cmr6174180eec.4.1791018159072;
        Sat, 03 Oct 2026 02:02:39 -0700 (PDT)
X-Received: by 2002:a05:693c:41d6:10b0:34e:e22d:6c39 with SMTP id 5a478bee46e88-34f150ab91cmr6174139eec.4.1791018158461;
        Sat, 03 Oct 2026 02:02:38 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34f14f9f2afsm29278695eec.18.2026.10.03.02.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 02:02:38 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 03 Oct 2026 02:02:21 -0700
Subject: [PATCH v18 10/11] arm64: dts: qcom: kaanapali: Add CCI controller
 nodes
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261003-kaanapali-camss-v18-10-87ba4ebe0db1@oss.qualcomm.com>
References: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
In-Reply-To: <20261003-kaanapali-camss-v18-0-87ba4ebe0db1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac0c4b0 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=6uyy3mKblwRlHw_pSasA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: ZJx-eUNU9XEoVIP2apIXULLiJepqRc0z
X-Proofpoint-GUID: ZJx-eUNU9XEoVIP2apIXULLiJepqRc0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX7iSAHOeOgFVp
 N356VFVToAehn+1aVPMDf5sCSf3tPCxjNeU5naUlOG5CqHLWqElu5NXGiYFc1HZ2RYJ7JbfZmN3
 qtIEp2aSTPlA8svMLkTGAe3vH4wY0zQJ+EpeHNMaESHDYfwMY6zPNBJ/HH4+steUHfxYBEj2ySj
 wXcRWpD5yNv8ms+G18RTRcFL3hnm4deQkcgAbJhJ0tQWsJBTbqnVhT3NVSYBoh/kacu4eDsA6we
 gSKc86YDd8qdCouAcP7HpZiD4t6ohmAQQ7Hmcn8aHBZrWn4WR7eyiiPuIQki7On35ofZpJADKZS
 XTcQzmuSrTY3DqpZIRqGb6T1ZKtA2qLuegvP5xZrX6uiRpK9gQnr/GlAPguhqFP1jxIyt5yx7wt
 wTfxzHrihZvhicuPl8dLrV00u15gZgmkZd+T678dWOJUwBZZLfHv5sek2FqGnCxt1fb1iXGe0Zw
 CHcy2hRhnVoN/KhaJxA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAzNSBTYWx0ZWRfX7TZI6e7nwYUc
 6ARPpv1/mf4winTQr2Nb3xiLlBs9xYfdj50wbNo7vBqCtUY7Jdraz7kHvW/5hDFFEYwxcWjF7no
 nZwJelwGro11dtYeZ7mF8x/yLqKfQrg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030035

Add the three Camera Control Interface (CCI) controllers present on the
Kaanapali SoC. Each controller provides two I2C hosts used for camera
sensor control, so define the controller nodes and their pinctrl states.

The first bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio109
cci_i2c_scl0 = gpio110

cci_i2c_sda1 = gpio111
cci_i2c_scl1 = gpio112

The second bus has two CCI bus master pinouts:
cci_i2c_sda3 = gpio113
cci_i2c_scl3 = gpio114

cci_i2c_sda4 = gpio107
cci_i2c_scl4 = gpio160

The third bus has two CCI bus master pinouts:
cci_i2c_sda5 = gpio108
cci_i2c_scl5 = gpio149

cci_i2c_sda6 = gpio115
cci_i2c_scl6 = gpio116

Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kaanapali.dtsi | 303 ++++++++++++++++++++++++++++++++
 1 file changed, 303 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
index 7e5106865e7e..710af0597aaa 100644
--- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
@@ -3749,6 +3749,117 @@ port@5 {
 			};
 		};
 
+		cci0: cci@941b000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941b000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_i2c0_default &cci0_i2c1_default>;
+			pinctrl-1 = <&cci0_i2c0_sleep &cci0_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@941c000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941c000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_i2c0_default &cci1_i2c1_default>;
+			pinctrl-1 = <&cci1_i2c0_sleep &cci1_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci2: cci@941d000 {
+			compatible = "qcom,kaanapali-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0941d000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 428 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_2_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci2_i2c0_default &cci2_i2c1_default>;
+			pinctrl-1 = <&cci2_i2c0_sleep &cci2_i2c1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci2_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci2_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		csiphy0: phy@9523000 {
 			compatible = "qcom,kaanapali-csi2-phy";
 			reg = <0x0 0x09523000 0x0 0x2000>;
@@ -4459,6 +4570,198 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cci0_i2c0_default: cci0-i2c0-default-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_i2c0_sleep: cci0-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio110";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio109";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_i2c1_default: cci0-i2c1-default-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_i2c1_sleep: cci0-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio112";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio111";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_i2c0_default: cci1-i2c0-default-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_i2c0_sleep: cci1-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_i2c1_default: cci1-i2c1-default-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_i2c1_sleep: cci1-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio160";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio107";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_i2c0_default: cci2-i2c0-default-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_i2c0_sleep: cci2-i2c0-sleep-state {
+				scl-pins {
+					pins = "gpio149";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio108";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci2_i2c1_default: cci2-i2c1-default-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci2_i2c1_sleep: cci2-i2c1-sleep-state {
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			hub_i2c0_data_clk: hub-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio66", "gpio67";

-- 
2.34.1

