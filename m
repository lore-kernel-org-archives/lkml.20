Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC41E32142B;
	Sat, 10 Oct 2026 21:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791669183; cv=none; b=E13Yo0VmuYfLsnxSd2V22vZ+vksf95WiujC44qlmOfgQGvhNAheXJNjKIUx+qforO+t6GNtUr7yTbWJOPDybpwvG69qsMtLMH6H0513rCFyHgm697rbfd0SCgFfUNZzAUvHFVns4QKgecg3PJ7SdCPpwfTGJ+9F+Xo6iSflSG04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791669183; c=relaxed/simple;
	bh=SB4ZAuEiQKRXeywG/ez21/G2gN88L39KmM6wGar9fao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=qW9oEfnUEojdH9l7z8y7+nvxxTiP46YfPI7apFYHxc9v+cQXEHwPbAiqQx7lcZ5vCYfhqzZWewbP2hwcCBMlwcxerFaau6kqYtIHWiqab75SdKIybf3/YveoJ0WOMS6DIIDKmr0Okw8jMfUwJnSAxhS39O154y1qyNXU9ku+4YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EprNz6NO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EprNz6NO"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C1FCC2BCB9;
	Sat, 10 Oct 2026 21:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791669183;
	bh=SB4ZAuEiQKRXeywG/ez21/G2gN88L39KmM6wGar9fao=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=EprNz6NOKutoSUawMRz+SITbTbEiRm31R1ihhg3H2XwxlDF3CKXwoTz2NbX/K3XTV
	 XG7gUu2kelfn5BuJ8NK15TrfBgatr730n7+7xmAqjiteYB5yrmQWYcZsaKLGGl1Fl+
	 1vfLhGAuJwoAtTlJh4I4JBMlxszOn0A155T926lQh7IdzAKBLNCHivxs7AxVhEIJwv
	 5MpbEJx1+UuxyRBMYXoHRRzuFSWXu4uId1I+AMSPr+WGf2kEnhQ3htbvfRX0wlD6gP
	 cZwyT8qfg5vIcp0KS/AKE2G5VQVjZobxWdahsgBuuC/013flJbvRk4Tzl5zPeo4WbZ
	 SUMy/ebzYm0DA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B2ADCA9ECA;
	Sat, 10 Oct 2026 21:53:03 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 11 Oct 2026 00:53:01 +0300
Subject: [PATCH] arm64: dts: rockchip: Add the GPU to Kobol Helios64
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-b4-helios64-gpu-v1-1-bd83c6ecd19e@iav.lv>
X-B4-Tracking: v=1; b=H4sIALyzymoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0MD3SQT3YzUnMz8YjMT3fSCUl0jizQTY0vj1KRUU3MloK6CotS0zAq
 widGxtbUAwYhAdmEAAAA=
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2291; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=QC0ldbg5vEEp/9pOfxvQQHo+177uJ6uj3YQwTElyKdA=;
 b=kA0DAAoWMpeVi+pfeQMByyZiAGrKs76jR2bGxizOiVPl+2Tkq9d9BhPKXJXtt97sdU9l4TP3Q
 Yh1BAAWCgAdFiEEkMIo2mik1f1PSDfgMpeVi+pfeQMFAmrKs74ACgkQMpeVi+pfeQOp0AEAlPVZ
 fa0yZOz1Z8GnX32xqyA7QSrRld40rIphRKp9DroA/0OkglmIjvWGiZ1QMVZ5LC3vUV3Xuj7CFVE
 rOCLpC+UO
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The GPU core of Helios64 is supplied by U12, a Silergy SYR838 on i2c0
at 0x41, with its VSEL pin on GPU_SLEEP_H (GPIO1_B6). Describe it as
silergy,syr828, the way vdd_cpu_b (a SYR837) is described as
silergy,syr827, and enable the GPU.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Schematic, sheet 7:
https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf

Tested on mainline: panfrost probes, devfreq moves vdd_gpu from 825 mV
at 200 MHz to 1100 mV at 800 MHz, glmark2-es2-wayland under headless
weston scores 548-577 in three runs. Two of them logged one panfrost
job timeout each; the Armbian DT gave none in three runs.
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index 63ad79b4c8ac..1f50982291bf 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -339,6 +339,11 @@ &gmac {
 	status = "okay";
 };
 
+&gpu {
+	mali-supply = <&vdd_gpu>;
+	status = "okay";
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 	i2c-scl-rising-time-ns = <168>;
@@ -453,6 +458,25 @@ regulator-state-mem {
 			regulator-off-in-suspend;
 		};
 	};
+
+	vdd_gpu: regulator@41 {
+		compatible = "silergy,syr828";
+		reg = <0x41>;
+		fcs,suspend-voltage-selector = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vsel2_pin>;
+		regulator-name = "vdd_gpu";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <712500>;
+		regulator-max-microvolt = <1500000>;
+		regulator-ramp-delay = <1000>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
 };
 
 &i2c2 {
@@ -538,6 +562,10 @@ pmic {
 		pmic_int_l: pmic-int-l {
 			rockchip,pins = <0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
+
+		vsel2_pin: vsel2-pin {
+			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
 	};
 
 	power {

---
base-commit: d2abcbb905b0e4b2e06b257fa1e5bcf4faa6dbda
change-id: 20261010-b4-helios64-gpu-28f4393ebe57

Best regards,
-- 
Igor Velkov <iav@iav.lv>


