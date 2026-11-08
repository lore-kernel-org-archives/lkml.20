Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794178822;
	b=hFkfnhpDOdY8/iRIqhY/dkLeEd3ZwiLeDTX68dMEOuQ8fJn8uQVW0L4t8XfIk6EGt7Ij
	 vqor7MfC2LpmAEuaSgYxUEWpfLLjfWZJ9G9U9aW2HGfpr1Jxc2QxvQ9yq2PZ8g+QPbASU
	 /9L+t+iao5DEAO7WSv+K06zvH8hfljW1oqo3pFM1W/ViVOEChP8Du2RoT2C3V8i3U4bGe
	 +bIfWV+c/POwijjeYp6bEDaKv8do1tjS+z0Etcw532VByZ+iMkYE5RfEVX/HXBQZTeY1R
	 XSSbVlKFcsd4EAjpY6hbHtkh9LiikGIvJxzyzYIaRPcVv3wjuc1xwktw3LqUteOvNxA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794178822;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yKK1iMirP9JBVABMoXQcasHTn/ArdnE6y45L4tRRNZk=;
	b=gj9WvIvIhUFOvuBS4di/i6qJkR3xhq6CAEbb4ZnnyZp3X2LBsbYEEWJ4ZSrmY17ijd0T
	 PLO+vBlK+yJd8vz3dgCs055koqi1YCXD0Voqlit2GAmZ1scVL1/1WcPb3hQrpGtK7SJkA
	 S/M4w/qcjnir72iZaQVWHvoVZOYoE/DMARU7J90YR70qMibJkCp4E7CD+9GTMiKUQoeb2
	 +uRdmLgMFXwxqHzMmDK0IyJPstPXUkOXeBW0micClk0WXZJRD+n+ndJZ/EkuMxRDTIW5n
	 QyL8YMGHvqhnXmdrtMwt/Pggr0g4gkWg9vFuDXFV4NwTmookiqXe8JpV49aQiFwhymw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6CvuqTS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF08606A31C;
	Sun,  8 Nov 2026 23:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I6CvuqTS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794178821;
	b=Orb8S4LW6ClGvzu6V0Clx+RcQWDe8/ElJeTs/gW0IU4dVbraV7G6b/QD71sCtNWvb5CU
	 oSvQwnDVJ1Pp7V6kq2oX7ebc6ARnn4zb4KnlXFJDhA4ckx781BUCFDM0Ki/gv2Yv/Jy33
	 ZPRoSaQ+6gxMjafBRiWrBCpNVCR7m0msCuHutxqJAFzVG3Ti9g2SUr+Kt06mQrqJS2QT4
	 PU9m/K6aFxXgnmZP6IKACzyND03vZbZQ6RvW3IRpX//14siyK6r5Dx68w8oQOh72Wc4je
	 Fo12w+MW2YOSzvDNCdnC9ufcnQ8SOGvuT7gPuGJL05aZ1tCIVAxJJjgVFggbwilraeg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794178821;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To:
	 Content-Transfer-Encoding;
	bh=yKK1iMirP9JBVABMoXQcasHTn/ArdnE6y45L4tRRNZk=;
	b=QEOe6Bl5dGnQ6lZXLaUPORvoGbQkOLhSv2cTf8s7+qMEyf56NLtzx0CICMf/FZagJzMX
	 t4nrChluXpOunw3uHhdAdQ7OVkL+80z9A5IQlrwXQbc0hCVBAiokXUw2abqdaCOIchcEw
	 yMbMunnNPTXI3nQ5VJzk2yK/g/4Q9ALcrgdydaJK/p1u9ppelHoFCi6UFW4sIbEYhtuJL
	 om8rCKJucAWyyrh+d8A3c3VCBmXGiIWDDETIUZ1Q8utm1xjnNTDV2omJCRDz+2WvgpeEC
	 P34vOVkNxIXdhb7jl4uvnjdQH0ENV4cNlrAsb4RjNyo9JxnrX6YcB0q/mMlKyqR6SLw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 9D0471F008A3;
	Sun,  8 Nov 2026 23:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794178821;
	bh=yKK1iMirP9JBVABMoXQcasHTn/ArdnE6y45L4tRRNZk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=I6CvuqTSfn6c0ISdqAWhqvU7/I4f69ERBV6ndg8vbwtxyBCY4UopGZ+8tmKCze+f+
	 DlqUXEqjlsvb02jSZWNs3oTSIej01h1AQo+cBTiz+oiPXrWK3C2F7JlIvKF0q7r+el
	 DqtLtOZVif4sWxIWPBEjyvk0+9aa3noveEsmyWNxeFJFEYvAlvuTjjpJa7c+1Yt8x/
	 zHN+WqEucyfIzWWnN6ly40Fz2i73PFbmILZjxXs8SvSlDAbIJP50eP9uqvapo2lOTM
	 JT4TLxjwbBVFZsFj/eyLuBBUnYF6v5euHPSz1Q4SRiR7UZyGnHq6C56GI7y95oV1h3
	 FnpKPPVjXEavQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 2D5AD48126;
	Sun,  8 Nov 2026 23:00:20 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Sun, 08 Nov 2026 23:00:18 +0000
Subject: [PATCH v2] arm64: dts: rockchip: Describe more of the power tree
 on Kobol Helios64
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
Message-Id: <20261108-helios64-power-tree-v2-1-639ac2fc5ad7@iav.lv>
X-B4-Tracking: v=1; b=H4sIAAH/8GoC/32NQQrCMBBFr1Jm7UgSm7G68h7SRUlGO1CakpSol
 Nzd2AO4fA/++xskjsIJrs0GkbMkCXMFc2jAjcP8ZBRfGYwypJUmHHmSkKjFJbw44hqZ0Z5NR61
 zTJagLpfID3nv1XtfeZS0hvjZT7L+2f+9rFHhSXtynXdWXcxNhnycMvSllC+R/i/yswAAAA==
To: Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=q4DkBQaFCKCe8qKMF/toFq0OPupIRXkfyB7nLuL7qmg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkf/jNbv11+JHHf5IcVenLHrfkWbXvKM6fu6otn6re47
 hhb7PZm7yhlYRDjYpAVU2SZcEjjVsaSq3/9PcwfwMxhZQIZwsDFKQATMXdmZLhp+/n4ZovfUQLr
 S1jc1h1UMs2+E/CnvTLz+ns9MT8nOzOGf5rWPOxn5h2cZJ/hJfKn7fmXe+FnueI+vN9Zuck1eUr
 aUwYA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

Add the regulators that the Helios64 schematic shows and the device
tree does not describe yet:

- RK808 DCDC_REG3 vcc_ddr_s3, LDO_REG6 vcc1v5_s3 and SWITCH_REG1
  vcc3v3_sys_s0 (sheet 6),
- the fixed 0.9 V regulator vcc0v9_s3, fed from vcc3v3_sys_s3 (sheet 8),
- the hard disk supplies vcc5v0_hdd and vcc12v_hdd, fed from
  vcc12v_dcin_bkup (sheets 4 and 9).

The hdd_a_power and hdd_b_power switches each take both vcc5v0_hdd and
vcc12v_hdd (sheet 5). A regulator has one vin-supply, so the two disk
supplies stay without a consumer. They feed the disks through those
switches.

Link: https://wiki.kobol.io/helios64/files/schematics/Helios64_Schematics_Rev1.2.pdf
Signed-off-by: Igor Velkov <iav@iav.lv>
---
Tested on Helios64 with a 7.3-rc7 kernel, on v1 of this patch; the DTS
hunks are unchanged in v2. All six regulators register, and the disks
and Ethernet work.
---
Changes in v2:
- Drop patch 2 (unused RK808 outputs) after Chen-Yu Tsai's remark.
- Rebase on for-next.
- Link to v1: https://lore.kernel.org/r/20261016-helios64-power-tree-v1-0-31d6c8dc5092@iav.lv
---
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts    | 63 ++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
index f13ea2df7a30..61e50c3e7ef2 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3399-kobol-helios64.dts
@@ -248,6 +248,16 @@ usblan_power: regulator-usblan-power {
 		vin-supply = <&vcc5v0_usb>;
 	};
 
+	vcc0v9_s3: regulator-vcc0v9-s3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc0v9_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc3v3_sys_s3>;
+	};
+
 	vcc1v8_sys_s0: regulator-vcc1v8-sys-s0 {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc1v8_sys_s0";
@@ -285,6 +295,16 @@ regulator-state-mem {
 		};
 	};
 
+	vcc5v0_hdd: regulator-vcc5v0-hdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_hdd";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v_dcin_bkup>;
+	};
+
 	vcc5v0_perdev: regulator-vcc5v0-perdev {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc5v0_perdev";
@@ -342,6 +362,16 @@ vcc12v_dcin_bkup: regulator-vcc12v-dcin-bkup {
 		vin-supply = <&vcc12v_dcin>;
 	};
 
+	vcc12v_hdd: regulator-vcc12v-hdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v_hdd";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+		vin-supply = <&vcc12v_dcin_bkup>;
+	};
+
 	vdd_log: regulator-vdd-log {
 		compatible = "pwm-regulator";
 		pwms = <&pwm2 0 25000 1>;
@@ -479,6 +509,16 @@ regulator-state-mem {
 				};
 			};
 
+			vcc_ddr_s3: DCDC_REG3 {
+				regulator-name = "vcc_ddr_s3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
 			vcc1v8_sys_s3: DCDC_REG4 {
 				regulator-name = "vcc1v8_sys_s3";
 				regulator-always-on;
@@ -518,6 +558,19 @@ regulator-state-mem {
 				};
 			};
 
+			vcc1v5_s3: LDO_REG6 {
+				regulator-name = "vcc1v5_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1500000>;
+				regulator-max-microvolt = <1500000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1500000>;
+				};
+			};
+
 			vcc3v0_s3: LDO_REG8 {
 				regulator-name = "vcc3v0_s3";
 				regulator-always-on;
@@ -530,6 +583,16 @@ regulator-state-mem {
 					regulator-suspend-microvolt = <3000000>;
 				};
 			};
+
+			vcc3v3_sys_s0: SWITCH_REG1 {
+				regulator-name = "vcc3v3_sys_s0";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
 		};
 	};
 

---
base-commit: c3baae5f1a15645cddadcb2b9abddef5df291f59
change-id: 20261016-helios64-power-tree-572864cce656

Best regards,
-- 
Igor Velkov <iav@iav.lv>


