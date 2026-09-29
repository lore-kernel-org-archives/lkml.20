Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A78050B8CB
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 16:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790699703; cv=none; b=f91Vg4w6KZYt8OP6aP7FGAV91hEzjSGll4b6mQjFQbvPydUgKmqXi9lRG/sjj1/qojW2BFPucNB/KjCxy/X1nKlkcM1LcXUm5Nbr8SqyxgF1+izF9yybWRJU2ZT2rQdlUZj6dG0fKQ+LDwOrQjibynpgKemEW405qnwwE1wlXfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790699703; c=relaxed/simple;
	bh=k6vfP0YVA5s+JVQXM6pymggavOZ5XjrfFxmMafASOFc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KQLs0uBymjrVBGVN97IgE5+ONzKwBMm5XyvRPkHvpUVytIjTq4hMJ+LGWfN7wan+hOmSjdgxlSCaJI+KsDM4LEsHlfK7G36cetEHLW2HzOE1O4MD+EGIC0Up1MphKLAcP2ORXqgDawrjWP/5R1CCb8Xgt5owoyj50yBOX11jaL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=a0bHqX0m; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="a0bHqX0m"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-53331a61f71so34690971cf.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 09:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790699701; x=1791304501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=a0bHqX0mA/dZ4o5lgXC9lvCRB6d3QLvS3Y745XNssqKCi14Z1akbIL2cDbgceg8ReD
         3Aa0FI5I3VFwYFeHBaypvzUBt3ODCoNdBMFBX1wzbTNTwlX64zDa2X32q2bqxoiOXR0Z
         bWJ7DCugQkUEZlDEQeE+3sExhuTxq/nIL4YasRzc/ugYl60nnWDpiyn53owwRPYdzyDG
         bPpJyC6rAls1OierV78842Gog/IheVbxMSJEykcPDISpxJRxnceiScBDlVUxRlDnx6CA
         aekJ1IaIatxPDnnJzHCJ0oYhMIzd5HCSjzkujZiL9FmCFfe/EL21z+y40JLW8TU75NHj
         7Brg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790699701; x=1791304501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BpUlBI/TZ2/z/cI75UbimRM1YcGKhoHyCnq9jL1vi8A=;
        b=OQK1csNXCmwLzghAUtVhE7Xgq06/YFcGn7L/HiLYiymfPVXlIbpd6KSn2TpbnBPTk+
         RpTXrY5xAMA66bX7cey9kPgdk/gbZt+OW+C8R0E3Tgx2lVVIQkTJzb1ICoS4BMeTWLJk
         1tNP2fC5HI2ByIe6eyw+2SvUtRbYYhSoKhVYS9vlJHAO6X09oadKwh8Wi+heeq8Qh8mt
         GYJ7LCEz/kNtpnzX9h2csQ9wIDxWFrHsj9CdGjjhqdxBjVkRKxsT461gK7BPo+T7CRni
         lBNxpt6WabSaPaAN6pdYRsu2qn/kAwXVgoyvInyr3weJyJJXQUd1VqOkWx1AkTqEplZm
         4sWA==
X-Forwarded-Encrypted: i=1; AKwUvBxSrxX3HFYfErTqP/6iQz/jm7cwemUIZXWua8TGQQ2LfK0J2WR31YpOOhGLL0/nAlyC4s1n3GFSiB0DjXs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJQw1xIWIL02vCWyO7KlzdDo1Vw/UC7BXizH0yv6bYuZ48W5MdA
	nvQSEFT+7nszZscpZxvkhn/1VfU1MC/3Wnv7sXf3ZP1IrCt0+Z1/9MoOVjlvt9Kgry8KVcm7USz
	bx7DJUl5mBRhGSgRAcQc4o7FKMfZbPoWtC72PXotZS5hTeYdWbBe0R50qs70=
X-Gm-Gg: AYBFou1NQdDT3a6E6oY0ysCOsM4MLApzxc30qcDrO/VeoexRcY0dHo0T6uf5vommrsY
	eQN44KWPNqf6gKNGHhykObw+gghn+lmc9XD//JE2qKVka+9PyiQZ1LTUBUsjbgqZIXzWK/KjPTu
	3ZF7Dk8cYMGhTfywQBUSVCbEeOm1E5+fe3vGEchXZ1z5S9jWKfvTJ/kYpDciE5YHDplb2D9gGwt
	LnVXK/38nhwf3W6im2QSD22yrsVad0j3AWXlsQUtJiU8zYu/PoeojDe8+G9S14CBUpfcZLbPaFN
	kh2Wf3sbJu8Bkw5PjE8CJtXkEg5y5362chwQR37gn8sMDlG9MKFh27CMJepL+NgpVwESI04dZbK
	Y84rFpYkjoWc9Uj2vNNsSwIQvCgwPHtBsRdFzRp6RCbZfOL/wHe7CXNn7kLbRfVyE9yDtpVlh6E
	CzkV9M+tTvmAVgOIkJGEps162IGoN3TCM13/MbKuG/lnUAUL0QBTNPIOM/o2bIgezI
X-Received: by 2002:a05:6214:248d:b0:917:8d04:deae with SMTP id 6a1803df08f44-9178d04e0b4mr37336786d6.35.1790699701212;
        Tue, 29 Sep 2026 09:35:01 -0700 (PDT)
Received: from strozzi ([71.163.254.246])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d39627asm14065896d6.45.2026.09.29.09.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 09:35:00 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-amlogic@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] arm64: dts: amlogic: meson-s4: Set stdout-path to uart_b
Date: Tue, 29 Sep 2026 12:34:10 -0400
Message-ID: <20260929163457.3237394-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If stdout-path is not set then bootloaders such as U-Boot may fail to
boot when they cannot find the serial console. Normally, this would be
added to the board devicetree, but in this case the boot ROM,
first-stage bootloader, ATF, and TEE all use this serial port with this
baud rate [1]. All of the listed components are signed by Amlogic and can't
be modified by OEMs. So while someone might want to use a different
port, they can't prevent previous stages of the boot process from
printing to this port. Therefore, set the serial port in the SoC
devicetree. Boards can override it in their devicetree if necessary.

[1] Actually, the baud rate used by the ROM et al. is 888888, but some
    userspace tools (such as agetty) choke on non-standard baud rates,
    so we use 921600 which is close enough for most serial adapters.

Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts    | 8 --------
 .../boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts    | 5 -----
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi                | 9 ++++++++-
 3 files changed, 8 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
index 0a3f81ea0fb0a..15bf143317a2d 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dts
@@ -14,10 +14,6 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	aliases {
-		serial0 = &uart_b;
-	};
-
 	memory@0 {
 		device_type = "memory";
 		reg = <0x0 0x0 0x0 0x40000000>;
@@ -141,10 +137,6 @@ &pwm_ij {
 	status = "okay";
 };
 
-&uart_b {
-	status = "okay";
-};
-
 &ir {
 	status = "okay";
 	pinctrl-0 = <&remote_pins>;
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
index 99d5df71b9cd4..c602091bca0a6 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts
@@ -22,7 +22,6 @@ aliases {
 		mmc2 = &sdio; /* SDIO */
 		rtc0 = &rtc;
 		rtc1 = &vrtc;
-		serial0 = &uart_b;
 	};
 
 	memory@0 {
@@ -334,7 +333,3 @@ bluetooth {
 		clock-names = "lpo";
 	};
 };
-
-&uart_b {
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
index 2a6fbd5308362..3e432e232a76a 100644
--- a/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
+++ b/arch/arm64/boot/dts/amlogic/meson-s4.dtsi
@@ -13,6 +13,14 @@
 #include <dt-bindings/reset/amlogic,meson-s4-reset.h>
 
 / {
+	aliases {
+		serial0 = &uart_b;
+	};
+
+	chosen {
+		stdout-path = "serial0:921600n8";
+	};
+
 	cpus {
 		#address-cells = <2>;
 		#size-cells = <0>;
@@ -794,7 +802,6 @@ uart_b: serial@7a000 {
 				interrupts = <GIC_SPI 169 IRQ_TYPE_EDGE_RISING>;
 				clocks = <&xtal>, <&clkc_periphs CLKID_UART_B>, <&xtal>;
 				clock-names = "xtal", "pclk", "baud";
-				status = "disabled";
 			};
 
 			reset: reset-controller@2000 {
---
base-commit: 6f8319e3e9a44dd537d17f41565a8453c560a581
branch: s4_stdout

-- 
2.53.0

