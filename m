Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974602;
	b=TlT020HU2vOBNiyc3j3ftG38sHsPTbkxC/TgVB7i7XUCyKXy56Q1KgE/qMjk3UoOKd11
	 0KlKwfktlCdX+xdFDUW07HodolQPnYVOd30mDEHhrx8CV2dcr/i/050DzNCJIFYN33aDy
	 pp04DImRiKObCoBaSFSyy3K7HFX3eCoyzB6AofGXRJuZzdo0xwqpkUYRosmzpgtR8Ci31
	 ZjIE7fjC5VIrpmewI/Al1WEX9WYsQZ0wQhhfwJXYBHbOM2+/g5UelWFU4tg8Ym6yKaUAt
	 QUqSadk+t5hO0NNIOnXeqI0aehYbT8wT+iFvoePhJbo2OVFBwWMejPn0whZFx/XMUkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974602;
	h=DMARC-Filter:DKIM-Signature:X-Pm-Submission-Id:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=xJ6FY4Qdb47uak8OWZMc6ZVyTlTQEH16GVjCHyoaP2Q=;
	b=Rk04Uux8tq5ZDFCjdIhiXGiB7czDNg3R0CglhxKS0Mao/j2Y9PPV+kgAAdC2vmg8spr+
	 288m7+SUi/m9+6Xg9FaAszwrWfXP+GZL4+CpCc/y/q+Zufv06vtMJqWHD+vPLIra1TQMg
	 ZVbPWCIgwCU9ulzmvTqCRuMPK9/huLrPFDT1/wpL7qI5gOtHF+1v0YmuQOysPDPzreh/V
	 /m/OEJWGcM/2fPi89HG9jTiaK41BEUz9TGLikXeTpZqBSJlQrgbbxv+4RCY3YVPLAvIE/
	 d2w7UhgAYMz70VanB2NHFDwmyz9tBKQLgpa/igba51g8FA1O7kYZN9Z7XqizyiWI+aQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=vinarskis.com;
	spf=pass smtp.mailfrom=vinarskis.com;
	dkim=pass header.d=vinarskis.com header.i=@vinarskis.com header.a=rsa-sha256 header.s=protonmail3 header.b=d41uLzfS;
	arc=none smtp.remote-ip=79.135.106.113
Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38078606A330
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:30:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38078606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vinarskis.com header.i=@vinarskis.com header.a=rsa-sha256 header.s=protonmail3 header.b=d41uLzfS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail3; t=1792974599; x=1793233799;
	bh=xJ6FY4Qdb47uak8OWZMc6ZVyTlTQEH16GVjCHyoaP2Q=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=d41uLzfS1MPYFTi2OfyujG1gAowG2CJ5NFI+8Hg3gEFOhZLm9lLhUnClORzgVfLne
	 IL0h77vN01oj23kKUDUkisZBHZ2KGlktwR7kFpBRLy0qctAN2EMtObQnWEhJCC+sXK
	 NPuiO2lUxTJCNatdQagyiaagKbWE528YRZ9c1J0HfIICp4XRHzTqwBd0/GDuC6DK18
	 BuGzWVAH2Ef5XftrK2+FHlNPjqXM0q0+hx+ZXX85Q9ecz6ZxpdxLnFp0fw5Ax2itky
	 PgGCuAajb1lsO64WCd/invuRp4zs+BRMlLtXBgFhzr5ZXZY3i9ZCWbpdkRw17KSHKN
	 JTR3L1bxcPIdA==
X-Pm-Submission-Id: 4jCZJk0wDXz1DF5K
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Mon, 26 Oct 2026 01:29:42 +0100
Subject: [PATCH v8 3/3] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
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
Message-Id: <20261026-dell-xps-9345-ec-v8-3-251c2cbfbc6c@vinarskis.com>
References: <20261026-dell-xps-9345-ec-v8-0-251c2cbfbc6c@vinarskis.com>
In-Reply-To: <20261026-dell-xps-9345-ec-v8-0-251c2cbfbc6c@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>
Cc: Liviu Nicoara <lnicoara@thinkoid.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 platform-driver-x86@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Tobias Heider <tobias.heider@canonical.com>, Val Packett <val@packett.cool>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 linux-hardening@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2697; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=TjL8tqeyObvnnmH2fSvubcRlGgOdAfNbx21FJciGlxM=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDFn35jPYKN9LjlQ1e8f/udHF293nr9q9q0o6b/UzApttP
 1xf2WPXUcrCIMbFICumyNL952ta16K5axmua3yDmcPKBDKEgYtTACbyzYDhv0/TkpvR5TP/J+td
 y7O78svLwiFNO3T54tBYt+mBAv5S/Ax/5SavNn68T7uzUOWCfnJx+7ZTH+q/XpQ/92PFvvsat6b
 WsQIA
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

Describe embedded controller, its interrupt and required thermal zones.
Add user-friendly labels for know thermal zones.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 65 +++++++++++++++++++++-
 1 file changed, 63 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
index f48e6bc35006..3f0c17c845b3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dts
@@ -759,8 +759,32 @@ retimer_ss0_con_sbu_out: endpoint {
 
 &i2c5 {
 	clock-frequency = <100000>;
-	status = "disabled";
-	/* EC @0x3b */
+	status = "okay";
+
+	embedded-controller@3b {
+		compatible = "dell,xps13-9345-ec";
+		reg = <0x3b>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		io-channels = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>,
+			      <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
+		io-channel-names = "sys_therm1",
+				   "sys_therm2",
+				   "sys_therm3",
+				   "sys_therm4",
+				   "sys_therm5",
+				   "sys_therm6",
+				   "sys_therm7";
+	};
 };
 
 &i2c7 {
@@ -1025,6 +1049,37 @@ rtmr0_1p8_reg_en: rtmr0-1p8-reg-en-state {
 	};
 };
 
+&pmk8550_vadc {
+	channel@144 {
+		label = "vph_pwr_therm";
+	};
+
+	channel@145 {
+		label = "usb_charger_right_therm";
+	};
+
+	channel@146 {
+		label = "ssd_conn_therm";
+	};
+
+	channel@147 {
+		label = "vreg_rtmr0_1p8_therm";
+	};
+
+	channel@148 {
+		label = "keyboard_therm";
+	};
+
+	channel@14a {
+		label = "lpddr5_therm";
+	};
+
+	/* Between Left USB charging controller and SSD connector */
+	channel@14b {
+		label = "sys_therm2";
+	};
+};
+
 &qupv3_0 {
 	status = "okay";
 };
@@ -1103,6 +1158,12 @@ cam_indicator_en: cam-indicator-en-state {
 		bias-disable;
 	};
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio74";
 		function = "gpio";

-- 
2.54.0

