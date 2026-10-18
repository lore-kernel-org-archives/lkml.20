Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925E949AA3D
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326771; cv=none; b=IXPZx93DjqczGdzHIWE3ZUIx2BXqsmEhMwV8npeSXbHBv+ndjCYMlsO1VJCxSxLgmj8rD3v6tO3Fu8kAq2VusHHcckaqQdv/RoSoQugljR09kcgp3MdSdDjsMBMIhj+feBCeGDc5hZTo68SgOj0+pHrD4AG9eG93iD4o/oFcoF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326771; c=relaxed/simple;
	bh=Nukw122yROk9xDRYamq2giXRAL8IsIdNMGYZGAIWjvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7zA93fB8you3N0C+EK6YjIzsqv1Y+QyC+Sw4ubINVoekl91JIVws9PB4YcgeYOAj1kgjaUkJ7iIeytTGAG9e2YVunP1Tr5QkmygPEiQbU3XcQtVqUcRV7iz1u98a6fVHs0cX9X70WzLAY1Owc6E9IO6iLKkyjtGChGbQH8unaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Aq6TwMcB; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Aq6TwMcB"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a1e1dade31so2634635e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326768; x=1792931568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=Aq6TwMcBbijWoiNIQ6lLzznbFSb606mfoqm9IJgOLOoajRL5T8/lfFPQ7zKE2haPvq
         sv7ju5s+pX95kHZHaN14f9Qh2DJQYlb1dSMRuxrtP/L1HLjLwnlcIrN/m+ZFZofoaOvd
         QCwJFg/CAqRaP3ZEAO3PEpGvfbmS+QbWBJ6Ef0xJwnJQhL0crbU+nLiyH/z3PLkaZVDj
         PF0r21wEpzN5EF2AMIRsmV3Vvy27cfKvJzFQSNB8nm7V4LunTGJIFGHCeBYda9jgdc7f
         wWdFdALA/ENiNL7ETzRjyEvHKenmlyzCc6WKWG99WnjjkSfhlzl11Lr6C/Vi05DuW4D2
         IvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326768; x=1792931568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0ea1NkzfJDwnTqydzvzwnSUsTKx9gypchzjscNQluAM=;
        b=iK8pfsrx33AWAj81eE30IY3mpdN0g7V+66Kg3fV19Wd9hEiO61zUQaBBZEEyKfGkbe
         pIyF4eAospqT5bihfIfGsfZF3b7tVD6eWOYf7ontZGURcMlH3np7hp5i0ldzqEWB+U2w
         ClcazRbWBmviA3eAVD8ig/YDSGcxR26mRopaN39k5lUuQZpJxJfUZguBQ3aeatBrJxPa
         5MBNS5GX0rcXMIFKSpeezG9rRfg1sSqBqTsnBKnpzVKq0IK1bhEbPw7w6i38P9zBwWe3
         RJuckh+wIcWCv/rVpsLBDmctLuXhmzl2dH+6eeRGBXlulMozHPWd/X8LjN3WxGHvmp2K
         tBNA==
X-Forwarded-Encrypted: i=1; AKwUvBwm1iCrSkvVy6ta8tNHdFaAXCWFdsnypI0PWe0BpbCGYk1f5grltl1dcSBhGroB9bjSvTGaTAwB7J0ia1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiJbRvUNlUNXaST+b7hzCz3gK3vdVhjMuci/qugd9CaQpti/Tl
	Z7NEHrKFM1x7lfe7xB1gGvyrv3UE7e6wik5172Ryp5DScODcN/rs/49N
X-Gm-Gg: AYBFou2GCAFO6I8Ef4diTV/C8bGi3IcySwc0dSp4mAbRaZ0e2O24Ah2rU/+cu1i+8RQ
	4zktlXEC+JKcv1/kufUO33dZKbjH1lXav1DV+MjVRnw+AWIDNGg/zLWb8vord6EOTnkFUJ9x6yg
	y8AGOpwGaOUP59KK9S641fwkwjcOzw7cSHFvyrrWUac8RItkfj4vgSLn2EVgxcrqbGE5tzMlKfy
	tehlyYDBjBK4CzyLZtact3bNv+h0F4BzaNOMhw0489PAYPII2byBBKco/Q5G+swPvDc+VccIiGj
	agPg1B7NtrQozusy8qkirdvRdjL3IAxDAtb6QMwqKOPVEi7f9FnSQO2CKqnuIjSHRIUqyqresBw
	D4LtBA1WCtTuui3NpV3jZIURcY83Ig1bXaHIPiuCy+mKzXA9+/8OQPO0IPzVdZdYc/eMsBK93Ah
	sB8HcoFfgUpfSoelhICcgbAw42CTsl2bhvkCixUVe56aqMwc+CRyC0L9qS5TirqtD6T914sTHYI
	XSbBdr66SSqp3PtUVaiUYtTZq7nZe3aOiqUgZ/dAxwNAP8hkdqiXXdaJJOS1S0Q7lJhqEsR6YJf
	f8zPrdyYGhtBmMcuaKGXGg==
X-Received: by 2002:a05:600c:1f86:b0:4a1:93fd:8f8 with SMTP id 5b1f17b1804b1-4a1d75ab363mr108377035e9.4.1792326767681;
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:47 -0700 (PDT)
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
Subject: [PATCH v1 2/4] arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:25 +0200
Message-ID: <35386d3fe663aa5e42dfbe904b554968ab8d5f7a.1792326585.git.stefano.r@variscite.com>
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

Mark the SCL and SDA GPIOs used for LPI2C1 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
index c1e6c9978275..437a23840898 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts
@@ -224,8 +224,8 @@ &lpi2c1 {
 	pinctrl-0 = <&pinctrl_lpi2c1>;
 	pinctrl-1 = <&pinctrl_lpi2c1_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c1_gpio>;
-	scl-gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio1 0 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio1 1 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pca9534: gpio@20 {
-- 
2.47.3

