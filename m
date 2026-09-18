Received: from mail-wr2-f26.google.com (mail-wr2-f26.google.com [74.125.225.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0FF43802B
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789725337; cv=none; b=Ek17KKDAMvxeKr6oknsiesYSZvRCrjPi6BFCFkg5AgHsGamDnotlbNmPMLrCks2Ae1gfSIdXR6YzbBe4CJ6BHmxXxBrQm7p/DqwwSrFT89w43bdX+R6FrTH2qOeOOxHzr8rFvSxivqPZ5x03VeJqdNsaDLh0hubJZk2fmuAHLbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789725337; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hssdl3wcD2vI+Lau/yV2z4/XpGgw4CAfy7gxvK4vSqKHrigH5aYKK2dL5xh+9R/A7nW7L6KxVaFxpxBw2s9JsdAbEaibTwIOxq2hk3slXcqKDVlOPMI3+2LhZN1jFXqqJmh/pYlyL2iOnhgOK9MiFmybI2SboGS+WKRh4bhFTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ICB15+dM; arc=none smtp.client-ip=74.125.225.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ICB15+dM"
Received: by mail-wr2-f26.google.com with SMTP id ffacd0b85a97d-4843f22dc83so356654f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 02:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789725329; x=1790330129; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=ICB15+dMW8qgOThkSxsnuoekJONG4TpcpLrrqabzQyhY67+KGirTMj/xyuTKbsvmzw
         2nTT666mqYUWivLtnqIBiKk1mjVqs8hKYmvokDAC30ww7stroOIETdV5mekvKP6e2Enk
         J6HGGwP1z5xuJXqPlEOutMW4z6hSSY+5vNsufn4lfPHDZsRm7nWtW4WYA/q5t8XpxxFX
         9dQUo1tqOzEsoXlEfM65y7QECASTu+h9gafAHHlhjxGspKDu9rl+FxxBstwwWL30L1X8
         iJ4gjx+ejLTGp0qZjLL+IUOb43z92KTTCjXPAnAB+Arqo0rvJ6Y8xu5Vst9RtMO7cnDI
         fgEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789725329; x=1790330129;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=10ZI6FYR+18/CgUyoHKkIog4qZaiAZRjzqHvlWTauwKdWxkiexEQwfuWnZwfP41h2w
         AEeOAv7vjAKa2esN4LmroDCYuaqD4J2jCE+zho0uhQ2Ifb78rBh2sU4I0RO8Wa/Xtr6K
         hCUJSEF3XdBG15n2H7Lz5F/Q4ERP/2BbngSrKhVdb/gBVhxC1LsauFCVZ+mmlE78YNqd
         ER1qUMleNltMHGenomqo//PBOXRp0JIWJNRQzW8vTqkCIEMEA6p+mTIadX5UiQKG0Xau
         aX9oFqASoL1G5bDoR+8viSYzoJMM+gOItbDKzSLp5855yhPmB40LSYLNjn64s3G6mADk
         7oNg==
X-Forwarded-Encrypted: i=1; AKwUvBy/GMfPRUC+hUqOKiRW6sDDei6Z0jJ7ynz1LUiVykG2iSVLGIeTI9lh0Dds4+V/4BX8/Ayb4Q1ZG0UH9wo=@vger.kernel.org
X-Gm-Message-State: AFuF++n2InZh2C8y9VNgI9eKgIhJFiW/Mq6J86GVC6JOtNFu1wRM2GBN
	lc5PmoEG1j9RLCQ+unwIUsZugsAUDmGcQ+QWMytB7fjEAj212odGfgOkyIZgHJbzYf0=
X-Gm-Gg: AYBFou1aYrtpOO2L8Is3cxbbjeSL8yxLlOWt0YfslHqBgLir3gI23WTgaiC+JznHu5Z
	Ioj2UP0J2LynjMiYF9PcyQERl2dWNYnrI5e1M2mKvURlQUcgjolKYXBJRJgPJN9B1GG/xV4pdg0
	MtzAVIL3zWDxst5SmGqYgmAeQqWTr2l9k/opzHV4FM+y9MDSVBldffkfh4hz5OoUeaDZT2DXBFg
	qTJZeqvgBPcIP5sp4r5d//z4lhbwVzQPUUhjBc54cn9SF+E8dD0yRMSKK3ZqHaEQUA90+eGWHYj
	zReNHbVX2bUxkNdHreuVT63fCV2vgNiHnu1iNksKU6/U6frh6kmuOzmBOdwoVnN6kYOmIyA2OLW
	zis2+QhRcfEgO9UUmgrAre1dWGP3UP2vM9AEKnRGOjMhneygUk9dWMQgmaWLqJpRl+yGvJQQLj1
	0HSZb0oGJvjAGucil7Y6IsqgF4CID/xnO6hHmJaEINIZsnBu7b1mux8Rufuo77RGIkW/amWDg=
X-Received: by 2002:a05:6000:186b:b0:487:81c:b5e2 with SMTP id ffacd0b85a97d-4871e244c0cmr2606562f8f.5.1789725329175;
        Fri, 18 Sep 2026 02:55:29 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4871ff3a928sm3077528f8f.13.2026.09.18.02.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 02:55:28 -0700 (PDT)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Naushir Patuck <naush@raspberrypi.com>,
	Stanimir Varbanov <svarbanov@suse.de>,
	mbrugger@suse.com,
	Sean Young <sean@mess.org>,
	Julian Braha <julianbraha@gmail.com>,
	"Gary Guo" <gary@garyguo.net>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: [PATCH v9 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Fri, 18 Sep 2026 11:59:02 +0200
Message-ID: <504b6c3403b0cdc1731d3dca735d5a07450e80e2.1789724999.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1789724999.git.andrea.porta@suse.com>
References: <cover.1789724999.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stanimir Varbanov <svarbanov@suse.de>

The RP1 chipset used on the Raspberry Pi 5 features an integrated
PWM controller to drive the cooling fan.

Add the corresponding DT node for this PWM controller.

Signed-off-by: Stanimir Varbanov <svarbanov@suse.de>
Co-developed-by: Andrea della Porta <andrea.porta@suse.com>
Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
---
 arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts | 12 ++++++++++++
 arch/arm64/boot/dts/broadcom/rp1-common.dtsi     |  9 +++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
index 0fc57e72632ed..748be8f1ee9e2 100644
--- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
+++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
@@ -64,6 +64,12 @@ phy1: ethernet-phy@1 {
 };
 
 &rp1_gpio {
+	fan_pwm_default_state: fan-pwm-default-state {
+		function = "pwm1";
+		pins = "gpio45";
+		bias-pull-down;
+	};
+
 	usb_vbus_default_state: usb-vbus-default-state {
 		function = "vbus1";
 		groups = "vbus1";
@@ -94,6 +100,12 @@ &rp1_i2c6 {
 	pinctrl-names = "default";
 };
 
+&rp1_pwm1 {
+	pinctrl-0 = <&fan_pwm_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &rp1_usb0 {
 	pinctrl-0 = <&usb_vbus_default_state>;
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
index 16f5359395835..df4c2d09c8d34 100644
--- a/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
+++ b/arch/arm64/boot/dts/broadcom/rp1-common.dtsi
@@ -99,7 +99,16 @@ rp1_i2c6: i2c@40088000 {
 		clocks = <&rp1_clocks RP1_CLK_SYS>;
 		i2c-scl-rising-time-ns = <65>;
 		i2c-scl-falling-time-ns = <100>;
+		status = "disabled";
+	};
 
+	rp1_pwm1: pwm@4009c000 {
+		compatible = "raspberrypi,rp1-pwm";
+		reg = <0x00 0x4009c000  0x0 0x100>;
+		clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clocks = <&rp1_clocks RP1_CLK_PWM1>;
+		assigned-clock-rates = <50000000>;
+		#pwm-cells = <3>;
 		status = "disabled";
 	};
 
-- 
2.35.3

