Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.22.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260406;
	b=II2gY4MdCiN20Btkf+Hu89XrtXGM6vmdStSBn+MvcI6vPR7n5i5zV2y0EIIbJ0IpEaUF
	 flaCt6ZkFnERmCJf2r/HSGrgphk0TEWkARM8TYd3pGqELxBd/Iy8Kgds8gxKS2CV4qnNO
	 xNlEdt6LW1DezUy9d9Nclos+VbOgXdGfWxVqPVDuFhSiSihLLuL3tSXIQZrLRUxgrJvOZ
	 LxW8mpVeQWsEoDGkfbHGqFpX3czie8ZmIsUzzFsJZSqC0dfa3hYjM4WtZwI3+ibN77Atw
	 uVOy2uC2yxNiZroOe/jRYVIWYCMzqvYzU9Pj25CWPCoovjMtVe9DYpOAuGhDPd+PUSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260406;
	h=DMARC-Filter:X-QQ-mid:X-QQ-Originating-IP:Received:X-QQ-SSF:
	 X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:X-QQ-XMRINFO:
	 X-QQ-RECHKSPAM;
	bh=Zk7PttkJj2s+z3QYDmiTRDwVd5tYUDsO2g2jxIwy3i8=;
	b=u3ZxDAPESTrExkLfLYUxS2h/V6k2T+b5km1pkmEBGolUGLvuwxiuuQr9muxcCdylT2oc
	 jUvmJBH+U5IDT0IYzYmPs4L9Plki2vx+1tvIDcIf4SuvMZSWq/Af7sPWRkKhSMjQBbT0y
	 rkcEFqe3ueTIoXTRWPhhW1X+GDCA1X5bbOIzOXgaTwlEfI3+4NI17FX4uoyVmvPhQ+GlH
	 3MJvfgRiIMsW/CBnNvDpZBv9IQ2mYinmVkdB1Lc+6aqsb6AMMJKrjPkXttcqliyJxtIjr
	 QckV57znxffvJ/wrjZdCKjBX6gWJ+Sd7xkpDSvORngQNjEFnkfRtKZYvDQiQ+Mnsx6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=radxa.com;
	spf=pass smtp.mailfrom=radxa.com;
	arc=none smtp.remote-ip=54.207.22.56
Received: from smtpbgbr2.qq.com (smtpbgbr2.qq.com [54.207.22.56])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B804E606A31C;
	Thu, 29 Oct 2026 07:53:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B804E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=radxa.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=radxa.com
X-QQ-mid: zesmtpip3t1793260369t1589146f
X-QQ-Originating-IP: UND6PzV/MYXrLakO3dPTa4TaAeYYwh3aDp2UXRnKyE8=
Received: from [192.168.30.244] ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 29 Oct 2026 15:52:37 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2533109350868982928
EX-QQ-RecipientCnt: 11
From: Xilin Wu <sophon@radxa.com>
Date: Thu, 29 Oct 2026 15:52:32 +0800
Subject: [PATCH v3] arm64: dts: qcom: sc8280xp: add missing QUP pinctrl
 states
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
Message-Id: <20261029-sc8280xp-qup-pinctrl-v3-1-48c4ef292dfc@radxa.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WNSw7CIAAFr9KwFsOntNSV9zAugILFaIvQkpqmd
 xfqQjfG5STvzSwgaG91AIdiAV5HG+zQJ6C7AqhO9BcNbZsYEEQqxFANg+KEo9nBx+Sgs70a/Q0
 yIbkwjdSUGZCuzmtj5017Or85TPKq1ZhdedHZMA7+uXUjzrs/iYghhrxhqCpLYXCJj160s9ir4
 Q5yIpKPhFP8Q0KSRFSNlLKVtNb8W7Ku6wvm4r+4DwEAAA==
X-Change-ID: 20260507-sc8280xp-qup-pinctrl-5ab8af9be35f
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dragon@radxa.com, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=31110; i=sophon@radxa.com;
 h=from:subject:message-id; bh=AkkSKaHHZLzH1aMEmrS1l6LxkYzwaqAEwQsH6N40C2c=;
 b=owGbwMvMwCVmdFg0fe08Iz/G02pJDFmPfrsduGujkFp6Po1hV4LowtyFwsGNMTPVH++wSZ86j
 22H8k++jlIWBjEuBlkxRRaFeIa57JW5156KlerBzGFlAhnCwMUpABNxOMvI0FNXq6q/t7RS8PSm
 DyE3+HuFTRhLFv4tjyzf+6H7zUnDJ4wMq70FeL4+1wpd/4dj1qWUtpqMsxyRlu5fI5YFKDzkDXr
 DDQA=
X-Developer-Key: i=sophon@radxa.com; a=openpgp;
 fpr=205F009D07796DD6E516752E32C31567AD9E324E
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: OWhN4QRntHSGR8UpmvjKQUO7bHXJm3Yppzb45jRgj0AYx3XIirDMCAM6
	sQTw7J3GneZHEsJt6aOjPXwMfZV1TnWPB3+SRHc0DdICKmRxkux80o4zSGnyB7JiH+SKb/D
	8LgD2oPvQqL1YOPBX+yEsYhQU6wMUn+OVcbpBDujhdNDLLRl6sKV6aCC5SD6dBnV6VgE+Sw
	1ol+pkXK1/yAbkMI5oBaJMz5SfdhDaCX1ahzrqhAIeRYS9BAsAoVM1KA0NG648zXR/PCEZs
	rYCvBw0cHECNRaBGOX9IvVyN5yqKbQ1esyo5DlsTdyL9zOUfHeol4c3U24o1+QapuoD1cM8
	3CD87NL9m0XpX7/yLwyQimiiu6BY7pdLngr7RkUMe4tLiXEFAz5+o1isdL/KEmJDMY1el7I
	41seVv2zI03OGmb0NqUSDnSegcvZQPTH8fLhSmUirpew+iXf546E/FIToLUqz931tFTHcRc
	QWwWuTlOp0x9F2dfE1rpvZz4OI2lvV9xzzt+F/i6z7cpl9vIoqJ+sKFeIaIvL58A1Jl2/Yl
	evGVeLjvjYbtnLvYOpug8UM63X5d7TyRE3BirGx6Ke5G6v0KUelNfW9htn8OQGWsSyoGqqH
	3woikHn5yprE4JDDiTYEgQeiTB2404BGRKTYdvl9C0ixudVFGf1MJYDUhPjY9ES9m78WKpj
	Num/TK7Z9HKi6t4t/6RHVP0y+2+c0i+ghkT74i1bE9gdu7FEmiaFoE41RNe5IV0iVCDz9bS
	FmnIIhXUeNNQ1dEa35UhmrLbgKy+5qd+gTJpyHTLuR24/W08/7BKXl4gj+5J+gP7WnjFYhG
	WUnCGQ734p1qnuc3S1VUTCpHGormIEY6IoNkduegucaqshnG/AD8hmBkEb4THiALEm6/ZOe
	1xOfFigvmpgmfuREaETV7mdSwG0D5C+HMFmItP1s177EeOvenjEXFcfj+eo9+jjOfJHPPjl
	tsOD1STPXrhdG54OKrSZono/hXxNXyAGO8q41GXNHsXTz6sCQmgIgp+30E0VnM9BhmUJIVs
	GKCmENVHMqurdt+4KQo0wt4yV0DcB/qtO58xoND8ix+D7wpiPAlll0lr/2/1dJGvuX7PJH6
	Q==
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

Add the missing tlmm pinctrl states for the SC8280XP QUP engines so common
I2C, SPI and UART pinmux definitions are available from the SoC dtsi.
Populate all 24 engines using the SC8280XP lane-to-GPIO mapping, including
the non-linear QUP instances, and keep the mux function names aligned with
the driver-supported qup0..qup23 names.

Define common four-wire UART electrical defaults in the SoC dtsi: CTS uses
bus hold, RX uses a pull-up, and RTS/TX use 2 mA drive with no bias. This
matches the Bluetooth UART configuration used by the existing boards, lets
them reference the shared QUP state directly, and removes duplicated
board-local pinctrl definitions.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Xilin Wu <sophon@radxa.com>
---
Changes in v3:
- Add blank lines between UART pinctrl subnodes.
- Link to v2: https://patch.msgid.link/20260831-sc8280xp-qup-pinctrl-v2-1-a69bbbdb37e8@radxa.com

Changes in v2:
- Rebased onto next-20260828
- Define common UART electrical defaults in the SC8280XP dtsi and drop redundant board overrides.
- Link to v1: https://patch.msgid.link/20260507-sc8280xp-qup-pinctrl-v1-1-8950644af141@radxa.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |   30 +-
 .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts      |   30 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |   30 +-
 .../boot/dts/qcom/sc8280xp-microsoft-arcata.dts    |   30 +-
 .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts |   30 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 1126 +++++++++++++++++++-
 6 files changed, 1129 insertions(+), 147 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index 1eea9d710d5b..814ed65af1dd 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -778,7 +778,7 @@ &sdc2 {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1150,34 +1150,6 @@ reset-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
index adce0302d92e..5254292ce349 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
@@ -1109,7 +1109,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1430,34 +1430,6 @@ reset-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		pins = "gpio164";
 		function = "gpio";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index 218573a97785..51523e305a5b 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1327,7 +1327,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1760,34 +1760,6 @@ reset-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
index 89c4ba267b07..18b12ee277c8 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dts
@@ -876,7 +876,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1170,34 +1170,6 @@ ssam_state: ssam-state-state {
 		bias-disable;
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio100";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
index 4f4b5f4285ec..20d0515a5d53 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dts
@@ -954,7 +954,7 @@ &txmacro {
 };
 
 &uart2 {
-	pinctrl-0 = <&uart2_default>;
+	pinctrl-0 = <&qup_uart2_default>;
 	pinctrl-names = "default";
 
 	status = "okay";
@@ -1231,34 +1231,6 @@ wake-n-pins {
 		};
 	};
 
-	uart2_default: uart2-default-state {
-		cts-pins {
-			pins = "gpio121";
-			function = "qup2";
-			bias-bus-hold;
-		};
-
-		rts-pins {
-			pins = "gpio122";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-
-		rx-pins {
-			pins = "gpio124";
-			function = "qup2";
-			bias-pull-up;
-		};
-
-		tx-pins {
-			pins = "gpio123";
-			function = "qup2";
-			drive-strength = <2>;
-			bias-disable;
-		};
-	};
-
 	usb0_sbu_default: usb0-sbu-state {
 		oe-n-pins {
 			pins = "gpio101";
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index fbcfd3883bbb..f9decc421e2d 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -5799,12 +5799,995 @@ cci3_i2c1_sleep: cci3-i2c1-sleep-pins {
 				};
 			};
 
+			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
+				pins = "gpio135", "gpio136";
+				function = "qup0";
+			};
+
+			qup_i2c1_data_clk: qup-i2c1-data-clk-state {
+				pins = "gpio158", "gpio159";
+				function = "qup1";
+			};
+
+			qup_i2c2_data_clk: qup-i2c2-data-clk-state {
+				pins = "gpio121", "gpio122";
+				function = "qup2";
+			};
+
+			qup_i2c3_data_clk: qup-i2c3-data-clk-state {
+				pins = "gpio137", "gpio138";
+				function = "qup3";
+			};
+
+			qup_i2c4_data_clk: qup-i2c4-data-clk-state {
+				pins = "gpio171", "gpio172";
+				function = "qup4";
+			};
+
+			qup_i2c5_data_clk: qup-i2c5-data-clk-state {
+				pins = "gpio111", "gpio112";
+				function = "qup5";
+			};
+
+			qup_i2c6_data_clk: qup-i2c6-data-clk-state {
+				pins = "gpio154", "gpio155";
+				function = "qup6";
+			};
+
+			qup_i2c7_data_clk: qup-i2c7-data-clk-state {
+				pins = "gpio128", "gpio129";
+				function = "qup7";
+			};
+
+			qup_i2c8_data_clk: qup-i2c8-data-clk-state {
+				pins = "gpio43", "gpio44";
+				function = "qup8";
+			};
+
+			qup_i2c9_data_clk: qup-i2c9-data-clk-state {
+				pins = "gpio41", "gpio42";
+				function = "qup9";
+			};
+
+			qup_i2c10_data_clk: qup-i2c10-data-clk-state {
+				pins = "gpio22", "gpio23";
+				function = "qup10";
+			};
+
+			qup_i2c11_data_clk: qup-i2c11-data-clk-state {
+				pins = "gpio18", "gpio19";
+				function = "qup11";
+			};
+
+			qup_i2c12_data_clk: qup-i2c12-data-clk-state {
+				pins = "gpio0", "gpio1";
+				function = "qup12";
+			};
+
+			qup_i2c13_data_clk: qup-i2c13-data-clk-state {
+				pins = "gpio26", "gpio27";
+				function = "qup13";
+			};
+
+			qup_i2c14_data_clk: qup-i2c14-data-clk-state {
+				pins = "gpio4", "gpio5";
+				function = "qup14";
+			};
+
+			qup_i2c15_data_clk: qup-i2c15-data-clk-state {
+				pins = "gpio36", "gpio37";
+				function = "qup15";
+			};
+
+			qup_i2c16_data_clk: qup-i2c16-data-clk-state {
+				pins = "gpio70", "gpio71";
+				function = "qup16";
+			};
+
+			qup_i2c17_data_clk: qup-i2c17-data-clk-state {
+				pins = "gpio61", "gpio62";
+				function = "qup17";
+			};
+
+			qup_i2c18_data_clk: qup-i2c18-data-clk-state {
+				pins = "gpio66", "gpio67";
+				function = "qup18";
+			};
+
+			qup_i2c19_data_clk: qup-i2c19-data-clk-state {
+				pins = "gpio55", "gpio56";
+				function = "qup19";
+			};
+
+			qup_i2c20_data_clk: qup-i2c20-data-clk-state {
+				pins = "gpio87", "gpio88";
+				function = "qup20";
+			};
+
+			qup_i2c21_data_clk: qup-i2c21-data-clk-state {
+				pins = "gpio81", "gpio82";
+				function = "qup21";
+			};
+
+			qup_i2c22_data_clk: qup-i2c22-data-clk-state {
+				pins = "gpio85", "gpio86";
+				function = "qup22";
+			};
+
+			qup_i2c23_data_clk: qup-i2c23-data-clk-state {
+				pins = "gpio59", "gpio60";
+				function = "qup23";
+			};
+
+			qup_spi0_data_clk: qup-spi0-data-clk-state {
+				pins = "gpio135", "gpio136", "gpio137";
+				function = "qup0";
+			};
+
+			qup_spi0_cs: qup-spi0-cs-state {
+				pins = "gpio138";
+				function = "qup0";
+			};
+
+			qup_spi0_cs_gpio: qup-spi0-cs-gpio-state {
+				pins = "gpio138";
+				function = "gpio";
+			};
+
+			qup_spi1_data_clk: qup-spi1-data-clk-state {
+				pins = "gpio158", "gpio159", "gpio160";
+				function = "qup1";
+			};
+
+			qup_spi1_cs: qup-spi1-cs-state {
+				pins = "gpio161";
+				function = "qup1";
+			};
+
+			qup_spi1_cs_gpio: qup-spi1-cs-gpio-state {
+				pins = "gpio161";
+				function = "gpio";
+			};
+
+			qup_spi2_data_clk: qup-spi2-data-clk-state {
+				pins = "gpio121", "gpio122", "gpio123";
+				function = "qup2";
+			};
+
+			qup_spi2_cs: qup-spi2-cs-state {
+				pins = "gpio124";
+				function = "qup2";
+			};
+
+			qup_spi2_cs_gpio: qup-spi2-cs-gpio-state {
+				pins = "gpio124";
+				function = "gpio";
+			};
+
+			qup_spi3_data_clk: qup-spi3-data-clk-state {
+				pins = "gpio137", "gpio138", "gpio135";
+				function = "qup3";
+			};
+
+			qup_spi3_cs: qup-spi3-cs-state {
+				pins = "gpio136";
+				function = "qup3";
+			};
+
+			qup_spi3_cs_gpio: qup-spi3-cs-gpio-state {
+				pins = "gpio136";
+				function = "gpio";
+			};
+
+			qup_spi4_data_clk: qup-spi4-data-clk-state {
+				pins = "gpio171", "gpio172", "gpio173";
+				function = "qup4";
+			};
+
+			qup_spi4_cs: qup-spi4-cs-state {
+				pins = "gpio174";
+				function = "qup4";
+			};
+
+			qup_spi4_cs_gpio: qup-spi4-cs-gpio-state {
+				pins = "gpio174";
+				function = "gpio";
+			};
+
+			qup_spi5_data_clk: qup-spi5-data-clk-state {
+				pins = "gpio111", "gpio112", "gpio145";
+				function = "qup5";
+			};
+
+			qup_spi5_cs: qup-spi5-cs-state {
+				pins = "gpio146";
+				function = "qup5";
+			};
+
+			qup_spi5_cs_gpio: qup-spi5-cs-gpio-state {
+				pins = "gpio146";
+				function = "gpio";
+			};
+
+			qup_spi6_data_clk: qup-spi6-data-clk-state {
+				pins = "gpio154", "gpio155", "gpio156";
+				function = "qup6";
+			};
+
+			qup_spi6_cs: qup-spi6-cs-state {
+				pins = "gpio157";
+				function = "qup6";
+			};
+
+			qup_spi6_cs_gpio: qup-spi6-cs-gpio-state {
+				pins = "gpio157";
+				function = "gpio";
+			};
+
+			qup_spi7_data_clk: qup-spi7-data-clk-state {
+				pins = "gpio128", "gpio129", "gpio125";
+				function = "qup7";
+			};
+
+			qup_spi7_cs: qup-spi7-cs-state {
+				pins = "gpio126";
+				function = "qup7";
+			};
+
+			qup_spi7_cs_gpio: qup-spi7-cs-gpio-state {
+				pins = "gpio126";
+				function = "gpio";
+			};
+
+			qup_spi8_data_clk: qup-spi8-data-clk-state {
+				pins = "gpio43", "gpio44", "gpio45";
+				function = "qup8";
+			};
+
+			qup_spi8_cs: qup-spi8-cs-state {
+				pins = "gpio46";
+				function = "qup8";
+			};
+
+			qup_spi8_cs_gpio: qup-spi8-cs-gpio-state {
+				pins = "gpio46";
+				function = "gpio";
+			};
+
+			qup_spi9_data_clk: qup-spi9-data-clk-state {
+				pins = "gpio41", "gpio42", "gpio43";
+				function = "qup9";
+			};
+
+			qup_spi9_cs: qup-spi9-cs-state {
+				pins = "gpio44";
+				function = "qup9";
+			};
+
+			qup_spi9_cs_gpio: qup-spi9-cs-gpio-state {
+				pins = "gpio44";
+				function = "gpio";
+			};
+
+			qup_spi10_data_clk: qup-spi10-data-clk-state {
+				pins = "gpio22", "gpio23", "gpio24";
+				function = "qup10";
+			};
+
+			qup_spi10_cs: qup-spi10-cs-state {
+				pins = "gpio25";
+				function = "qup10";
+			};
+
+			qup_spi10_cs_gpio: qup-spi10-cs-gpio-state {
+				pins = "gpio25";
+				function = "gpio";
+			};
+
+			qup_spi11_data_clk: qup-spi11-data-clk-state {
+				pins = "gpio18", "gpio19", "gpio20";
+				function = "qup11";
+			};
+
+			qup_spi11_cs: qup-spi11-cs-state {
+				pins = "gpio21";
+				function = "qup11";
+			};
+
+			qup_spi11_cs_gpio: qup-spi11-cs-gpio-state {
+				pins = "gpio21";
+				function = "gpio";
+			};
+
+			qup_spi12_data_clk: qup-spi12-data-clk-state {
+				pins = "gpio0", "gpio1", "gpio2";
+				function = "qup12";
+			};
+
+			qup_spi12_cs: qup-spi12-cs-state {
+				pins = "gpio3";
+				function = "qup12";
+			};
+
+			qup_spi12_cs_gpio: qup-spi12-cs-gpio-state {
+				pins = "gpio3";
+				function = "gpio";
+			};
+
+			qup_spi13_data_clk: qup-spi13-data-clk-state {
+				pins = "gpio26", "gpio27", "gpio28";
+				function = "qup13";
+			};
+
+			qup_spi13_cs: qup-spi13-cs-state {
+				pins = "gpio29";
+				function = "qup13";
+			};
+
+			qup_spi13_cs_gpio: qup-spi13-cs-gpio-state {
+				pins = "gpio29";
+				function = "gpio";
+			};
+
+			qup_spi14_data_clk: qup-spi14-data-clk-state {
+				pins = "gpio4", "gpio5", "gpio6";
+				function = "qup14";
+			};
+
+			qup_spi14_cs: qup-spi14-cs-state {
+				pins = "gpio7";
+				function = "qup14";
+			};
+
+			qup_spi14_cs_gpio: qup-spi14-cs-gpio-state {
+				pins = "gpio7";
+				function = "gpio";
+			};
+
+			qup_spi15_data_clk: qup-spi15-data-clk-state {
+				pins = "gpio36", "gpio37", "gpio38";
+				function = "qup15";
+			};
+
+			qup_spi15_cs: qup-spi15-cs-state {
+				pins = "gpio39";
+				function = "qup15";
+			};
+
+			qup_spi15_cs_gpio: qup-spi15-cs-gpio-state {
+				pins = "gpio39";
+				function = "gpio";
+			};
+
+			qup_spi16_data_clk: qup-spi16-data-clk-state {
+				pins = "gpio70", "gpio71", "gpio72";
+				function = "qup16";
+			};
+
+			qup_spi16_cs: qup-spi16-cs-state {
+				pins = "gpio73";
+				function = "qup16";
+			};
+
+			qup_spi16_cs_gpio: qup-spi16-cs-gpio-state {
+				pins = "gpio73";
+				function = "gpio";
+			};
+
+			qup_spi17_data_clk: qup-spi17-data-clk-state {
+				pins = "gpio61", "gpio62", "gpio63";
+				function = "qup17";
+			};
+
+			qup_spi17_cs: qup-spi17-cs-state {
+				pins = "gpio64";
+				function = "qup17";
+			};
+
+			qup_spi17_cs_gpio: qup-spi17-cs-gpio-state {
+				pins = "gpio64";
+				function = "gpio";
+			};
+
+			qup_spi18_data_clk: qup-spi18-data-clk-state {
+				pins = "gpio66", "gpio67", "gpio68";
+				function = "qup18";
+			};
+
+			qup_spi18_cs: qup-spi18-cs-state {
+				pins = "gpio69";
+				function = "qup18";
+			};
+
+			qup_spi18_cs_gpio: qup-spi18-cs-gpio-state {
+				pins = "gpio69";
+				function = "gpio";
+			};
+
+			qup_spi19_data_clk: qup-spi19-data-clk-state {
+				pins = "gpio55", "gpio56", "gpio57";
+				function = "qup19";
+			};
+
+			qup_spi19_cs: qup-spi19-cs-state {
+				pins = "gpio58";
+				function = "qup19";
+			};
+
+			qup_spi19_cs_gpio: qup-spi19-cs-gpio-state {
+				pins = "gpio58";
+				function = "gpio";
+			};
+
+			qup_spi20_data_clk: qup-spi20-data-clk-state {
+				pins = "gpio87", "gpio88", "gpio89";
+				function = "qup20";
+			};
+
+			qup_spi20_cs: qup-spi20-cs-state {
+				pins = "gpio90";
+				function = "qup20";
+			};
+
+			qup_spi20_cs_gpio: qup-spi20-cs-gpio-state {
+				pins = "gpio90";
+				function = "gpio";
+			};
+
+			qup_spi21_data_clk: qup-spi21-data-clk-state {
+				pins = "gpio81", "gpio82", "gpio83";
+				function = "qup21";
+			};
+
+			qup_spi21_cs: qup-spi21-cs-state {
+				pins = "gpio84";
+				function = "qup21";
+			};
+
+			qup_spi21_cs_gpio: qup-spi21-cs-gpio-state {
+				pins = "gpio84";
+				function = "gpio";
+			};
+
+			qup_spi22_data_clk: qup-spi22-data-clk-state {
+				pins = "gpio85", "gpio86", "gpio83";
+				function = "qup22";
+			};
+
+			qup_spi22_cs: qup-spi22-cs-state {
+				pins = "gpio84";
+				function = "qup22";
+			};
+
+			qup_spi22_cs_gpio: qup-spi22-cs-gpio-state {
+				pins = "gpio84";
+				function = "gpio";
+			};
+
+			qup_spi23_data_clk: qup-spi23-data-clk-state {
+				pins = "gpio59", "gpio60", "gpio61";
+				function = "qup23";
+			};
+
+			qup_spi23_cs: qup-spi23-cs-state {
+				pins = "gpio62";
+				function = "qup23";
+			};
+
+			qup_spi23_cs_gpio: qup-spi23-cs-gpio-state {
+				pins = "gpio62";
+				function = "gpio";
+			};
+
+			qup_uart0_default: qup-uart0-default-state {
+				cts-pins {
+					pins = "gpio135";
+					function = "qup0";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio136";
+					function = "qup0";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio137";
+					function = "qup0";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio138";
+					function = "qup0";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart1_default: qup-uart1-default-state {
+				cts-pins {
+					pins = "gpio158";
+					function = "qup1";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio159";
+					function = "qup1";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio160";
+					function = "qup1";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio161";
+					function = "qup1";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart2_default: qup-uart2-default-state {
+				cts-pins {
+					pins = "gpio121";
+					function = "qup2";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio122";
+					function = "qup2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio123";
+					function = "qup2";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio124";
+					function = "qup2";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart3_default: qup-uart3-default-state {
+				cts-pins {
+					pins = "gpio137";
+					function = "qup3";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio138";
+					function = "qup3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio135";
+					function = "qup3";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio136";
+					function = "qup3";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart4_default: qup-uart4-default-state {
+				cts-pins {
+					pins = "gpio171";
+					function = "qup4";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio172";
+					function = "qup4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio173";
+					function = "qup4";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio174";
+					function = "qup4";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart5_default: qup-uart5-default-state {
+				cts-pins {
+					pins = "gpio111";
+					function = "qup5";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio112";
+					function = "qup5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio145";
+					function = "qup5";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio146";
+					function = "qup5";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart6_default: qup-uart6-default-state {
+				cts-pins {
+					pins = "gpio154";
+					function = "qup6";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio155";
+					function = "qup6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio156";
+					function = "qup6";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio157";
+					function = "qup6";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart7_default: qup-uart7-default-state {
+				cts-pins {
+					pins = "gpio128";
+					function = "qup7";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio129";
+					function = "qup7";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio125";
+					function = "qup7";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio126";
+					function = "qup7";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart8_default: qup-uart8-default-state {
+				cts-pins {
+					pins = "gpio43";
+					function = "qup8";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio44";
+					function = "qup8";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio45";
+					function = "qup8";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio46";
+					function = "qup8";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart9_default: qup-uart9-default-state {
+				cts-pins {
+					pins = "gpio41";
+					function = "qup9";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio42";
+					function = "qup9";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio43";
+					function = "qup9";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio44";
+					function = "qup9";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart10_default: qup-uart10-default-state {
+				cts-pins {
+					pins = "gpio22";
+					function = "qup10";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio23";
+					function = "qup10";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio24";
+					function = "qup10";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio25";
+					function = "qup10";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart11_default: qup-uart11-default-state {
+				cts-pins {
+					pins = "gpio18";
+					function = "qup11";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio19";
+					function = "qup11";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio20";
+					function = "qup11";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio21";
+					function = "qup11";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart12_default: qup-uart12-default-state {
+				cts-pins {
+					pins = "gpio0";
+					function = "qup12";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio1";
+					function = "qup12";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio2";
+					function = "qup12";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio3";
+					function = "qup12";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart13_default: qup-uart13-default-state {
+				cts-pins {
+					pins = "gpio26";
+					function = "qup13";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio27";
+					function = "qup13";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio28";
+					function = "qup13";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio29";
+					function = "qup13";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart14_default: qup-uart14-default-state {
+				cts-pins {
+					pins = "gpio4";
+					function = "qup14";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio5";
+					function = "qup14";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio6";
+					function = "qup14";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio7";
+					function = "qup14";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart15_default: qup-uart15-default-state {
+				cts-pins {
+					pins = "gpio36";
+					function = "qup15";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio37";
+					function = "qup15";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio38";
+					function = "qup15";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio39";
+					function = "qup15";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart16_default: qup-uart16-default-state {
+				cts-pins {
+					pins = "gpio70";
+					function = "qup16";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio71";
+					function = "qup16";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio72";
+					function = "qup16";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio73";
+					function = "qup16";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart17_default: qup-uart17-default-state {
+				cts-pins {
+					pins = "gpio61";
+					function = "qup17";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio62";
+					function = "qup17";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio63";
+					function = "qup17";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio64";
+					function = "qup17";
+					bias-pull-up;
+				};
+			};
+
 			qup_uart18_default: qup-uart18-default-state {
 				cts-pins {
 					pins = "gpio66";
 					function = "qup18";
-					drive-strength = <2>;
-					bias-disable;
+					bias-bus-hold;
 				};
 
 				rts-pins {
@@ -5824,9 +6807,148 @@ tx-pins {
 				rx-pins {
 					pins = "gpio69";
 					function = "qup18";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart19_default: qup-uart19-default-state {
+				cts-pins {
+					pins = "gpio55";
+					function = "qup19";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio56";
+					function = "qup19";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio57";
+					function = "qup19";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio58";
+					function = "qup19";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart20_default: qup-uart20-default-state {
+				cts-pins {
+					pins = "gpio87";
+					function = "qup20";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio88";
+					function = "qup20";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio89";
+					function = "qup20";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio90";
+					function = "qup20";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart21_default: qup-uart21-default-state {
+				cts-pins {
+					pins = "gpio81";
+					function = "qup21";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio82";
+					function = "qup21";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio83";
+					function = "qup21";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio84";
+					function = "qup21";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart22_default: qup-uart22-default-state {
+				cts-pins {
+					pins = "gpio85";
+					function = "qup22";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio86";
+					function = "qup22";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio83";
+					function = "qup22";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				rx-pins {
+					pins = "gpio84";
+					function = "qup22";
+					bias-pull-up;
+				};
+			};
+
+			qup_uart23_default: qup-uart23-default-state {
+				cts-pins {
+					pins = "gpio59";
+					function = "qup23";
+					bias-bus-hold;
+				};
+
+				rts-pins {
+					pins = "gpio60";
+					function = "qup23";
+					drive-strength = <2>;
+					bias-disable;
+				};
+
+				tx-pins {
+					pins = "gpio61";
+					function = "qup23";
 					drive-strength = <2>;
 					bias-disable;
 				};
+
+				rx-pins {
+					pins = "gpio62";
+					function = "qup23";
+					bias-pull-up;
+				};
 			};
 		};
 

---
base-commit: e30626823a406725ce29bc75cb8ec467d3e1e326
change-id: 20260507-sc8280xp-qup-pinctrl-5ab8af9be35f

Best regards,
--  
Xilin Wu <sophon@radxa.com>

