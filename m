Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.38.64.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793429741;
	b=SZ3a5qQwf5xi/F+POZzCOtrtQ/TkThtIdZIP8m41RBJ0KFcAgLXIlRL1Nh5NGfjtU3sx
	 bPlJmKK0HHOcXcPXm9RcyE8JL/BmlGA8MrE1WvzSpVDox+zHyv170i0GNu7agOkJGMRv+
	 o43Z1n8NfXvTqsxg0KftxEHP+ppIEZvG/AEqgS2jfXQB2YCemA7fSFte8NyyUATsgAtto
	 CRES85dpZPthH8yMWuPN5BwP6Nks1wU369vCQ90cOrCXm40azvmU5aRYb+J8dW4enwHPZ
	 OA0vYsDwKLRBnHiTk7oKnmvLxj0rnjzIzQxwNh6oUZqqjFkfzfqezhtgUzeci+aTvBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793429741;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=MHSt2ooCYUBzuKcYHR8HbnlXyzm34DmNLXrkva2+CrE=;
	b=gaPZSR3nfU4Imls9NbI/sk1IBN+N/VOButVqgRwnrtWnxIXKRVdghy0RPxGtGltLuxh5
	 3hqWHzN4KQAYRsEzHHqzNQRT8zekFHHoqIFOAdICXBvLzgJrzWn2S2Ap0IeEitG4ocv2w
	 nf2alGjz5DI6HahgWga3CU3aBaqJD5yF4hM+WCjwnf0N/9kwtm96fjmfaTR+Oa+AJz35N
	 bMfelmBOCFMsk5yj+hlpEAobSeIqfw0SPXOiKZbESZJTaBTzhTq3xoSis0v86Hc0cXjEP
	 lonRdvD2xlUmxMqm9lzwEMY5S+GLVwKlpDGyRQKB7YXUEb+/z19poyuPJXo9w8FZkJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.ustc.edu.cn;
	spf=pass smtp.mailfrom=mail.ustc.edu.cn;
	dkim=pass header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=UikUsnQ+;
	arc=none smtp.remote-ip=202.38.64.46
Received: from ustc.edu.cn (smtp.ustc.edu.cn [202.38.64.46])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9104B606A31E;
	Sat, 31 Oct 2026 06:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9104B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.ustc.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.ustc.edu.cn header.i=@mail.ustc.edu.cn header.a=rsa-sha256 header.s=dkim header.b=UikUsnQ+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
	Message-ID:In-Reply-To:References:MIME-Version:
	Content-Transfer-Encoding; bh=MHSt2ooCYUBzuKcYHR8HbnlXyzm34DmNLX
	rkva2+CrE=; b=UikUsnQ+lNA2s5eUIANrV2sO0vQ4U9PhtgA5SdPwTXq09XMKnN
	0aHodjTa+1dD26ycKxzzjTLwH2ib3MaNtazu5NMACR/MHOX+CYas6De0/jzPVKDc
	o/MgzYprWfO8ds7H9cHPfPZ75bqpGEOxnj79UisWHsYhb/ywiVKEFmEKo=
Received: from xuqianhui.ustc.edu.cn (unknown [114.214.177.113])
	by mailimap2024 (Coremail) with SMTP id 3pYKCgCH_THmkOVqQXFtAA--.295S5;
	Sat, 31 Oct 2026 14:55:36 +0800 (CST)
From: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm8750: describe two of the three CCI I2C controllers
Date: Sat, 31 Oct 2026 14:55:33 +0800
Message-ID: <74cccd474e7955f3d79f57059bca68ae0df7a005.1793427041.git.xiaqinghuan@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
References: <cover.1793427040.git.xiaqinghuan@mail.ustc.edu.cn>
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
X-CM-TRANSID:3pYKCgCH_THmkOVqQXFtAA--.295S5
X-Coremail-Antispam: 1UD129KBjvJXoWxurWfZr4fArWxWrW7WF4kJFb_yoWrtry3pw
	nrArWfCrn29r4jqws3Z340yr9xCa1kG34kCrnrWry8Gw10qayv9F40vryfWF1DJFZ7Xw1Y
	qr43X34xKFsFkw7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPIb7Iv0xC_Cr1lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUWwA2048vs2IY020Ec7CjxVAFwI0_Xr0E3s1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv
	6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c
	02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE
	4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1lc2xSY4
	AK67AK6r47MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8C
	rVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8Zw
	CIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x02
	67AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr
	0_Cr1lIxAIcVC2z280aVCY1x0267AKxVW8Jr0_Cr1UYxBIdaVFxhVjvjDU0xZFpf9x07jw
	R6wUUUUU=
X-CM-SenderInfo: 50ld1x5qjk3t3q6ptxnoox23vfohv3gofq/1tbiAREQB2rk8FYCLwA8s+

The SM8750 has three CCI I2C controllers; this dtsi describes the two
that the Qualcomm camera subsystem binds to on this SoC. Each controller
exposes two I2C buses; both buses are described and left available, as
on sm8550 and sm8650, and the second bus pinctrl states are carried for
both controllers (cci0 bus 1 on gpio115/116, cci1 bus 1 on gpio119/120).

The nodes are placed in unit-address order after videocc@aaf0000.

Signed-off-by: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 158 +++++++++++++++++++++++++++
 1 file changed, 158 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index dd738d13df..9649af7f6f 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -3060,6 +3060,72 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac7b000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7b000 0x0 0x1000>;
+			interrupts = <GIC_SPI 426 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb", "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_0_CLK>;
+			assigned-clock-rates = <37500000>;
+			pinctrl-0 = <&cci0_0_default &cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep &cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				status = "disabled";
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac7c000 {
+			compatible = "qcom,sm8750-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac7c000 0x0 0x1000>;
+			interrupts = <GIC_SPI 427 IRQ_TYPE_EDGE_RISING>;
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+			clocks = <&camcc CAM_CC_CAM_TOP_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb", "cci";
+			assigned-clocks = <&camcc CAM_CC_CCI_1_CLK>;
+			assigned-clock-rates = <37500000>;
+			pinctrl-0 = <&cci1_0_default &cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep &cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+			status = "disabled";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				status = "disabled";
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8750-mdss";
 			reg = <0x0 0x0ae00000 0x0 0x1000>;
@@ -4090,6 +4156,98 @@ qup_uart15_default: qup-uart15-default-state {
 				bias-pull-up;
 			};
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio113";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio114";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				pins = "gpio113", "gpio114";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio117";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio118";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				pins = "gpio117", "gpio118";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio115";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio116";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				pins = "gpio115", "gpio116";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio119";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				scl-pins {
+					pins = "gpio120";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				pins = "gpio119", "gpio120";
+				function = "gpio";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
 			sdc2_sleep: sdc2-sleep-state {
 				clk-pins {
 					pins = "sdc2_clk";
-- 
2.53.0

