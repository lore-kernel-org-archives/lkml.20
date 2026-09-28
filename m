Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7C4D4878
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 13:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790603735; cv=none; b=YEpmXyCPUE5dua7n0zfjQTjoSu4HWhjOogwuSdb7KY08b9bL3yX1C5TItlROyPLhXL0/t02pepfEfnU25Q9ruHrlGufu2pKHLO9VW7+Gf9NulDGhX5ohJOps64Cs1bKEGlXqYjOer6k3HelUin58M7e4aW1O1V4NfZYc4TeWImM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790603735; c=relaxed/simple;
	bh=NyT3bvkYhBzVis/qc4NVpDUc0HxiHbXcgKHaKLAMasY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oOYzcVnXZymrIIFinf8CuUcKAz6Vsyd6xDvSjJ+JY+ermSmn+RvPkYUgjhsh/ew6l0fpCdsdV69GVkfXwcJmZHIH6+3uxoNxMlzRr3o805mwNzFUT2Q8o7OE3cC0FWKvciqt5DA4hB2Ub0/W1bMp0B4u/GSKQYq9UEZqDR2g5MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=DJE7fgVZ; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DJE7fgVZ"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2afd63c3e0so284353966b.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 06:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790603732; x=1791208532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=DJE7fgVZC+gNP4wYfKUU5byTvBHa4FaOGoBxDrOHA6Nk2V4uxuX9LejhpmRIRd/84p
         BYXUiu/7Ttfmu6rmOhh/bMnh0pPlyFTxI8RZS+V+RFpUzBLIS9YfnHnWLI3LAJs0NNmL
         bF99C9g5ngl4ilu18pZkDx5HRPvev5C4ASEj7fQMqFl/qqQSdgiyDg7QNDE6RmKy2Ixa
         HoJTBVGNpoCT8AEQenFpnIp/dcjRDN11q8XR+iUSS9ZrvcLk6PMS4n+ldUFCo32kcZh/
         n7OZNBlMOAztqWxNuY3kiHuWbM6VHpTw/gq1+99GRwOl5ud/hjLBIsZYhyzbn7An5PH3
         Ttnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790603732; x=1791208532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=RUWg5GWqhMeDrgGwJjMhc1B+7LHRy8TQo04xcORPTAE=;
        b=H3qEhWYJsbejxwjY5qdXHip9tmD1ENfn+MeA30b7e3qVnQpZa55wVrbuKmOvrYltTO
         x3XYkO9SyTQBvk7TDAe1oaGuMgfGtGFd3ocBM9KRG7bg/D8QBbnrzg8Mm39aaVZNyTw/
         s1X/cI3GeEga+pKYNlFKuS1JtA3NTveD+/jKTbC0U8MzT6TNRJfw6lGIJbp2fJ1rkIJi
         Fkua+F8oBAQyyYYkJN1O00fsOdcuQwDQZLclaqevNMK8wbOrUXHBtLidow1kUT6rIiel
         tDc6X5ZSY8DgRacHfQt/4aqRuejzWOLZRN9U+RueffFSuWntP5vdI164ldqD6l4R96c8
         IYiw==
X-Forwarded-Encrypted: i=1; AKwUvByFOi6sAzVO2+qaJWzck6eGVMwR2asA6GB7Qx5rYt68m1XqKL/cra+aS0MF2avp4ucWXmgIHYamIgpbohw=@vger.kernel.org
X-Gm-Message-State: AFuF++ns7YbFM8lCUVijNe3VyT6I7TC4KhzepUmrrJ+omJdy26k5igCw
	EofbigVZjtqUJGlsvT91g1jOCphCHrCZxPFWjicGqBJe2kZC4Ksr/G90mp6v4qOVatZOSClx949
	8gMXot78=
X-Gm-Gg: AYBFou3K4OMrjidrVUU0D5jWc3bxfBN+2IJqqDtNKda9OdZasXgaA+ZNGgz+OYjhEEB
	BgKdeBGWTFtHhvdLtVBbNLrM3g0VLr8gpK84lHTOLwZuhLE4ZVjx62XslARxhQunogTEWfuLM9O
	rnBPyXTyu5dwhDnSLicxQ8ojkqKy24zBgk/C0yPmFjYSX1zsB8a4PNnrzkVFPKQ2t8gKwaDBpAY
	X/G4aBUtmnrydSFcL+6vUcm07QzLvqSsWCaxknvWcfAiOnxWB6knGn8DQocf2r7A+q2eqEqa0Z0
	Vbvf1ESV5Tf+VNW1vX2oogK2qWQbM/Zg8zdA7jpryMi687omfmM0z8Ne7Dl+2yPRW5xSS9CLdBd
	oXI6a7+1AT5r47kTYIGQRkrheG7VH1HmOtyYqYIbEbTqrIGNQUz+BbLrnUIQj/CvBeFZl8Evmap
	c2ex8wBmkfcDbdMmld4D6BSQGSouQD7FRP2UJI7NlMsKfwpvL/+xMHLOgcrJCutLy1AS9+Ww==
X-Received: by 2002:a17:906:730d:b0:c29:4b79:e417 with SMTP id a640c23a62f3a-c2ac240e791mr1124305166b.16.1790603731805;
        Mon, 28 Sep 2026 06:55:31 -0700 (PDT)
Received: from localhost ([195.94.147.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc9a855adsm232416866b.60.2026.09.28.06.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 06:55:30 -0700 (PDT)
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
Subject: [PATCH v10 3/3] arm64: dts: broadcom: rpi-5: Add RP1 PWM node
Date: Mon, 28 Sep 2026 15:59:02 +0200
Message-ID: <b222c0aa1c77564090d3c783cc79baf299b5d59b.1790603500.git.andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1790603500.git.andrea.porta@suse.com>
References: <cover.1790603500.git.andrea.porta@suse.com>
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

