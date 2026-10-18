Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676249B46C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326774; cv=none; b=jyFNoZXSzKXA/xAL8yNR4TIvRpCoIXCDhEHh1Ozn2vkh64Wmb6ahwzPo5H04OyoMVLMw+e5ZNuGjz1rGOQWLuyez8nw6VT7V2D08i936xQmedpE2E+m2dM+3UKglhQ/Kjzna+TEF3gQ2NdsPQVhClq/lccbtyy+8Mueh3BNffIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326774; c=relaxed/simple;
	bh=sDeH5Aa/6RVXWRKxDt4y6WTi40kVY22vaLdAcItynqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZlwloFS2g86mji5WIehhDHPt5dWx8cY/egjJyzQbMLDIVauIY54vaYYq6EeTKDlNj9Qg+U2O9rjS2yj3Z/ELYj0956KdZaQ41PpGFDPNQttfqZ7mPk3xTdeoGt9ohmDmLMOvvTWGVTj2RrcQpQr7eGUH/htHGhMsWLINOAOEZRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n/ETP8sg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n/ETP8sg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49d05d51553so8132095e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326771; x=1792931571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=n/ETP8sgzIZZqpAfnh+5/HQd3VL8/ZHYtwhSr33f3ltgWkFpcwMKzSLZoM5KQ4GpA9
         GA7Dn25M96A+HtNVQCKsvcUaK6vkxNERmERPWQkb/CrLuGs1PNJyNu8c6HH9hYERJX8M
         6BuHvnFQ7SASbQ8LYLhPXicEjtzhBBSVTXU5XhOtu3fmoZXBfcdpBVMbXQfs2VfLd9k6
         wQXVAR6KmHG+RAvWzZaD2iZMtJXVbjfDq4kQCxvBrTIPw6OX4MQwVER8EWUa9U66szQN
         3LYN5UtsqsFKJ1hPB/F3Zbdxhi7g6ICA5teKcHYZGw/+AL46SNXkZrAxjGXaCdkXc06j
         b97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326771; x=1792931571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=le/7ZMUGNW/GaIhf/O4ysG6KC+WhTS8gzrqG1Rpguic=;
        b=FRvD1cjIdBbVLua+f9IaQJxXLuE4XRG/bNgGP6hddQ+Qk6i50UTPKA2Q/FdQVdXSxw
         v03Y5f9Z58laTwzdXwfoLtI9z4Q24IvzbyUnHDA5nLCvWY11BOTEdpq4/ZAgM0WrM3eT
         0slJ/N+ZTmCPMYHJcwoX60WMw4vxv/Z3/KDpkKVIOZ8X1AR8AlUC18zN1k/50kki6FvY
         t+UgzXyhbxYUllbjqtpok+J+Fn0YrPSMbGXoZLtRpswph61radHxblVUkj1kgS/XWUVi
         tt3cujS/ZfR3GbTzyWfqoPOFDrpVWizYqj1i2ecLW7cVKYBcjQ0/vFNylOrSwlN2hqgb
         oEuw==
X-Forwarded-Encrypted: i=1; AKwUvByv34xxH8gprlamaH9EBqSkMFMSKWsSHh1KRDyABs0fa9ctHIwGeNIxsW6PtX/9otPssuZPegh4qQ9iP1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFQRie912ecweyIh4pbojz5mkZBefG7Cu5HOWqhFWvmZxO+S2h
	9VzEoKYhBIoBvCrlhY8Ma5QwCHXNujQCu7SZq+Ds+XKHR6B3Ocf6wWzi
X-Gm-Gg: AYBFou2fJiehfSKb7fvRUCbfeB8patBgRAyYrztlKsc1WXUXhghBzEY7oS0COkJu8sl
	MDjAo8oxjqB29LUqpAwkJIT0pBYMGkhxnJhAnPMwC0m2SvXEPFFapsall2Od0B+5TiN9mgp/dah
	ipe50JKBw4sa7BuOIAfb3xh64ICI5NiqbyaHx6bg/z8en0dfk6rHQG+Nh/HXFwsBElg7EtIr2Rw
	1LQkS0elHq1Wm85JKRaEtmROPbvmC9wFa8HLRKvxnx2JEbw5Z+xbFPiHGRIs8TrjMBvkTI7loLt
	DOdT1KlTWiSEVPGksC4J8hJOGntLwrYfUWhU48QrYNlpqL1NQLTemwHNTTr83pgcIljhks19Uhp
	ys6uBzBTvuLUQ2y5OV25zKyKRCTFM+rjv3rtmixJoB8WP9qp9fkHlv/QVC50SmkfmtV4/Ol4JGJ
	mTEX4Gk8l8ZDFMrNVPi9Du1kOdXcAxVUA3uwWcC8WX5vWQ0+XbJU8XHxJZguM2jAJafkF8r4RQV
	L+1+kqgZ+iPV1h9DoiFcU0Y3TQ04QQq9KsEIuhh7E/zC/TnZ6HGP0KkP7fy5fkVJ+zamurb+1kH
	QCRuhUTlzj7V/Z/fkru89w==
X-Received: by 2002:a05:600c:4e8a:b0:4a0:4a8:d444 with SMTP id 5b1f17b1804b1-4a1d7630cf8mr109051655e9.33.1792326771289;
        Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:50 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:27 +0200
Message-ID: <ec5fdbdf55d25cdcb756d16709a7011d5bbea9b4.1792326585.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1792326585.git.stefano.r@variscite.com>
References: <cover.1792326585.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the SCL and SDA GPIOs used for LPI2C1 and LPI2C5 bus recovery
as open drain to match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 409c7e74ffe3..1f0954620195 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -210,8 +210,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pcal6408: gpio@21 {
@@ -265,8 +265,8 @@ &lpi2c5 {
 	pinctrl-0 = <&pinctrl_lpi2c5>;
 	pinctrl-1 = <&pinctrl_lpi2c5_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c5_gpio>;
-	scl-gpios = <&gpio2 23 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 22 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 23 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 22 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3

