Received: from mta1.migadu.com (out-53.mta1.migadu.com [95.215.58.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0968568FC4
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790177161; cv=none; b=e7a31j0ABaheCyCz6WvgVL9pMXSLovTknCl9oFa+5NCDDJg9MKw8xnVA12S/K6gaYq50PlRJU+eokoR3egDxaS+MHvfdsJOxyX4rEhOeyZaXZtZYuWG3ZKJF8iXS6dX1YmnwLYd2o4SUZdNFXLGiFnsa1NuMvo3YluP5ouLgjbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790177161; c=relaxed/simple;
	bh=SN5y69kOURosVP6k7rGK7zuJM05gP6ofLl1gMVn3G0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JAf4NzMq5sAgrOjcNALsOVHQMfhubLWQUACbRXwDYD2kodGFK8Q28Hp9KOzAy56I1fGiRKuLxtdHPvPi5V600ZjcMT85ZKvLL8ks9ZMpYLx5QXsnTIYyu9xmhWr3HxBx4QGYAjxs7KOTqGadU5C1HU26SUzSOKfRlKvPgEAlGlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akao.au; spf=pass smtp.mailfrom=akao.au; dkim=pass (2048-bit key) header.d=akao.au header.i=@akao.au header.b=NAnYrzxt; arc=none smtp.client-ip=95.215.58.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=akao.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=akao.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=akao.au header.i=@akao.au header.b="NAnYrzxt"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=SN5y69kOURosVP6k7rGK7zuJM05gP6ofLl1gMVn3G0c=;
 c=simple/simple; d=akao.au;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790177140; v=1; x=1790781940;
 b=NAnYrzxteU4PTujHpN2zwk0v3lItom5HBIy3X3bHEKqgJ6uuWC7aeVvB/TpRs5a1BQz4BjtW
 WLmOpaVL7oB4ZR/Fx95OePt0K67t5/eP/BYhtIQ519kAt+g7fStnu+p05QFsQ6W9ed0w6zJlbUP
 9pLlwl6vLNOx6sf5q0PQ2z4GUeHxvvJoJ0Wo1+xoiNSoJxDe71YyFqCuUjdX23JhVrkeFcypFJG
 bY+H50tIN5K2QFlXPI7lR/sdSGPF9cZRNAtvjmamgXZtt1formjO/NsUZ5xdF5vOzWnGQGlM1B/
 8UKjXQBz4bn9PNOMVVk0Xqm38UxV8qX1rrguS9hQ5IPNw==
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 98b70ba86cf04d63;
	Wed, 23 Sep 2026 15:25:39 +0000
X-Mizu-Trace-ID: 98b70ba86cf04d63
X-Migadu-Flow: FLOW_OUT
From: Charlie Garner <charlie@akao.au>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Val Packett <val@packett.cool>,
	Laurentiu Tudor <laurentiu.tudor1@dell.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charlie Garner <charlie@akao.au>
Subject: [PATCH 1/2] arm64: dts: qcom: x1e80100-dell-inspiron-14-plus-7441: add PWM backlight
Date: Thu, 24 Sep 2026 00:55:05 +0930
Message-ID: <20260923152506.44989-2-charlie@akao.au>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923152506.44989-1-charlie@akao.au>
References: <20260923152506.44989-1-charlie@akao.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The panel on the Dell Inspiron 14 Plus 7441 (AUO B140QAX01.H) cannot have
its brightness set over eDP AUX. DPCD 0x702 has BRIGHTNESS_PWM_PIN_CAP set
but BRIGHTNESS_AUX_SET_CAP clear:

	0x701 GENERAL_CAP_1            = 0x9b
	0x702 BACKLIGHT_ADJUSTMENT_CAP = 0x91   bit1 (AUX_SET) clear
	0x721 MODE_SET                 = 0x00   control mode: PWM pin

With no backlight phandle on the panel, panel-edp falls back to
drm_panel_dp_aux_backlight(). drm_edp_backlight_supported() only tests
0x701 bit0, which is set, so a backlight device is registered - but
drm_edp_backlight_probe_max() returns early when !aux_set, leaving max at
0:

	systemd-backlight: dp_aux_backlight: Maximum brightness is 0, ignoring device.
	gnome-shell: Backlight is unusable because the maximum brightness 0 is
	             bigger than minimum brightness 0

Brightness is driven by PWM instead. UEFI already configures the pad and
leaves it running, which is how the panel is lit before Linux touches it:

	gpiochip0 (c42d000.spmi:pmic@0:gpio@8800, PMK8550):
	  gpio5 : out low func3 vin-0 pull-down 10uA push-pull medium

and the corresponding LPG is present but disabled:

	pmic@0/pwm  qcom,pmk8550-pwm  status=disabled

This matches the PWM wiring of the HP OmniBook X14
(x1-hp-omnibook-x14.dtsi), so describe it the same way: enable
pmk8550_pwm, add the pinctrl state for gpio5 func3, and give the panel a
pwm-backlight.

The panel keeps its existing enable-gpios and edp_bl_en pinctrl, so power
sequencing is unchanged; only brightness control is added.

Keep this in the Inspiron DT rather than x1-dell-thena.dtsi. The Latitude
7455 shares the dtsi but was submitted with a different panel (BOE
NE14QDM) and a working backlight without any PWM description, and this
has only been tested on the Inspiron. Label the panel in the dtsi so the
board DT can attach the backlight, as the ThinkPad T14s LCD variant does.

Signed-off-by: Charlie Garner <charlie@akao.au>
---

Notes:
    If a Latitude 7455 owner can confirm the same PWM wiring on that machine,
    this can move to x1-dell-thena.dtsi.

 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi   |  2 +-
 .../x1e80100-dell-inspiron-14-plus-7441.dts   | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index 2ebb42906c9b..ce31c9f5cd05 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -1039,7 +1039,7 @@ &mdss_dp3 {
 	status = "okay";
 
 	aux-bus {
-		panel {
+		panel: panel {
 			compatible = "edp-panel";
 			enable-gpios = <&tlmm 74 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
index 75e10d97c386..5779a4e84522 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-inspiron-14-plus-7441.dts
@@ -10,6 +10,18 @@
 / {
 	model = "Dell Inspiron 14 Plus 7441";
 	compatible = "dell,inspiron-14-plus-7441", "qcom,x1e80100";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+
+		brightness-levels = <0 2048 4096 8192 16384 65535>;
+		num-interpolated-steps = <20>;
+		default-brightness-level = <80>;
+
+		pinctrl-0 = <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
 };
 
 &sound {
@@ -42,6 +54,21 @@ &iris {
 	status = "okay";
 };
 
+&panel {
+	backlight = <&backlight>;
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/x1e80100/dell/inspiron-14-plus-7441/qcadsp8380.mbn",
 			"qcom/x1e80100/dell/inspiron-14-plus-7441/adsp_dtbs.elf";
-- 
2.55.0

