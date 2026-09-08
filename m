Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9328A559C84
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 13:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872755; cv=none; b=uA8LhdLO9BMRS1dXVV4ffOWHjeu3lRL1tKmYnvhO8bEa04zeCkwdvhQMDBy2UYqWszXDpFzjO3Alv1Z3DdZYlxC+7/kE/4zeeCGHnnBTAJlfQv5uT5YjlD0h6W35cL++m+wOdEW+Qtc7g2387fPMVMW2VfdVJ9Ppdl/MVy8Stuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872755; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFCLSsxxTC1UmKvT3OKhk1cqTpmCognSZ2CWXVAOL+w6qRZ0E6eBFb1mFKwGp5gmcsSE337ay4NTFE3BXd+ubYQQ/CRvQHSBwtgcsGX26Le3+wGRKscDavaBkSVmIm/0mgU1age/hBuikDozgUsdcGymXT5uBSGIPcO5OIUBBhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PQpuybyx; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PQpuybyx"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ce364488dso3945095e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Sep 2026 06:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788872749; x=1789477549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=PQpuybyxzDIFX2Mw93LItl8NH2vJSTC4Lwde8IWJWY+4FHTEvn8SoZhmA3ycV3Y4pU
         SuWm/gsNMUdvb5BRaE5IIOys30VGi3Ogupr9qi+jq2yozZSk4AKdSNB0jUOCq8LuvgxW
         ahMRbrnuizERKDrBYGeU6P/OyM7jO+eyM7w1W2fdJ+8FO1YDnK3vz62uqBRrxjIDc9xf
         nexY2xqmbDjD51UKs3GzJWl0CddoHRs6LzCV3ie6mqTEU+arwWmDoEC2WYnxlAN37arM
         CgQcUo7rRBE9Uj8junp98FiBVJRXQNOSt9nbZ6gMUpHLVSGvQ+te/+rW9An4bhrOHnd7
         YHiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872749; x=1789477549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=XRD8EQaHcVjRGesSr2vQjY1cb5sPL31zoYt7phJxqX/OUwTVj7qiy901wTglyeXHtA
         LeTOPTJ6ojVKtMqhq5MwaEwf8e4SotWMOT8b1Kh6PcRG3k9pmXAuKLgioQqkPK/H1Vk6
         wGwCb7fvvmjxdkF+oxTK1AB4v3NXuZYzjBvlA6S8oLfMfUmzhxHGi43jMlrn2xHlABgK
         kRALCLk5KGF0Hn/2XxSS1qvse7kuCDAPPWcumjeBSIH/SZ7sEkhbVwRE2sI9YFlzjlwV
         SwtHP9SBwiJ5h6bQYHl28uWCTwbjtTvq4PGdn+ilnpZEs2HN4bb9Rllvzwab9jQiAONp
         VXRQ==
X-Forwarded-Encrypted: i=1; AKwUvBxiGG0ICT6sudF55E315huDTF8ffCClZyTx7nBlYQYeAmoKmwdjtNzxvFrlyrRL/q0rkKe67mBjQQq996U=@vger.kernel.org
X-Gm-Message-State: AFuF++ke6XHcHHuWuz8bY3eCtK+hRR9V9/eepJwwXsymHRupFVNHowVw
	xOKgF4qEqN5AsZfBRybJaJjfMdQy1ospPRfixYZL8QOKBLdkIonA1MRMQdZ23YhbhKxnTHb3xSI
	1Iu5HZNs=
X-Gm-Gg: AYBFou2JM1Dg7ewzP2pNTZZpyWWzr2kewchcWJdlgGVB8/8qE5PgYRdPlVy7U0VczpN
	PJD26bkbJwXslDvCIbCs7vq2ToVlOcKaSwTufYvRZIb6VqyFFuuvyupDES9ZbxLgblQc50xmMM4
	ecv6ZRFyvVytGDEbuL0fcZefvvIQSJ54Th6r01ydMwbIfodFH2X3Pxtd0SzFfZHr1Ghh6JxxbS5
	O/xvZTQawg/zqQDICVVBnQ9c0AezebedLxEP33MUxIy6Dx4wxrqa8TZ+Uj0z/UKmY0KJ7bi8KbY
	Vi7NjWAKETzq6a06gVgGjA0r2+6bHQ0BE2mA+BrLgZuA13jAGmGkZRO5BvjCodoMDTi//bSwz7m
	NS9nBvTxLBJQXqIsqC6LBUBgKJQPm8CfYMGGRGafRNPDa0y7RrROl6gY5yCC3wJI+PaOUaHOaQp
	M+qKjSxarp6PQ9AYUs/L/gkMn9UEaSAHFk7dVbo1d4Fcz5k0+RLiD2wNKRRw==
X-Received: by 2002:a05:600c:c4b8:b0:49b:8f5e:51fb with SMTP id 5b1f17b1804b1-49d17543be5mr74495775e9.3.1788872749175;
        Tue, 08 Sep 2026 06:05:49 -0700 (PDT)
Received: from localhost ([82.145.119.95])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d1e5c58a6sm2552135e9.2.2026.09.08.06.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:05:48 -0700 (PDT)
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
Subject: [PATCH v8 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Tue,  8 Sep 2026 15:09:14 +0200
Message-ID: <946df411f5d2a127800298fba856face5cc5e8b0.1788872294.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1788872294.git.andrea.porta@suse.com>
References: <cover.1788872294.git.andrea.porta@suse.com>
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

