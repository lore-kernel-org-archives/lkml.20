Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DE34CF49B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326769; cv=none; b=lLj/lLlTMVMP68u0xJeiGOQczxFV2N4RQku2VH4VdvKfRmpOX4V5gHx2sxKMJvPigEj7gaiqmtiqkvI4+cDkPURC6NvJYOv+kdUk4cpZjnKiK3WaJJ/9vGoDqWBJgzDYxAq0Z6ifsRvs5UvJXaXFKO5YLRGZULcWEfrUa9t9vXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326769; c=relaxed/simple;
	bh=kTz07uCPd3IIAU2tuW29eA2AVOLw4tb4lfqCUC95pLA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=poQ9DoZKyE3GvKqVNi1wYQoL3zL2hLIqfBZypCoutuLGObdgxkK6akM4TL+IROUrnhVL50PXZSSD7jXuZhnV2fXk7N2SfPlBTlDKNV2+YLgafvYx7DtO6raOu5ADAZK0xxCtbdQq7+gMNbMySb4WN8xyKtOBudakMMJsTPD6wns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIzZjE0H; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIzZjE0H"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a1e3098ee2so3759435e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326767; x=1792931567; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=JIzZjE0He2Cskos8ENN1d9+3AAU7YsJU88+GdoVg3IeOvPu8VyKbYLUKOiMDCBaquT
         yFTb4iWGmI4HBsqiiZswBQqpnp38R5i8FpGzjaap9X69u+734+xp4t9EEEXClea5DCef
         IZQHQ8dptpgQ+2v2Hnyv+VPle5DbhBPWOPXYZt83oI/p+FGJPP3y/0gmLQ8lwikdN/Kv
         uFp9WXGiD7ilOVe7EeVth2z99qReaLCTMbW2hY4Biswc7PFgsOeFEi5wvDkr4kZRpSUk
         +qhCS+Qm46frt84XMtCnL/RnhDFR9orJx+zqy3yB7e7fMtxcZU4CsOQv6YgO7AkvETlK
         fNLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326767; x=1792931567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mbhy+FzLVarX5z41FEjg/6yaqn9vrkSa3rr8ypDlujw=;
        b=GhnO9AHEEMbRBiq7iGsCagy0L07GETiAwvP2CAjEteqSjeso5EEOWLnL1nPUxeFT4l
         SeIgFlcFxEgQC8bZWW4jhcR5fFIywvZJM8VI/bu5RgNtxSoiQhULyAifIvqrVzlsWanw
         w9/2jsg5t0jfKdQJ0Oq9QOoeasJ67tHPrPswvlFxOyvxKBjx/ZK2HhwAcZviGZd2euGH
         CBYbutfElbPecI+QVZ87kxuipbROJO8Hw1l4glKj1dq82tXL5Kv+ucWYXatyrY4JYYkj
         X5ulVTBiKAgo2CUUxwz8V2lRlMFaSrZs/j/rUqWHBhbenqrgMNO7sOOw0JKan4iJNbFK
         aGxw==
X-Forwarded-Encrypted: i=1; AKwUvBzGzBTz8OfXverFXyvzRX0jqydmTPJlR0bRNDzATXM9kDbhfNzQNtg5U53q8FVONlHn7F+S3eh8xE8wkKk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx1NbgGF6bhrjSo/cd4GsQ5GoDVZT5psAcISMJCqoCj/g8n8xD
	Xomp6vjl1GqwhPoMyic9RzKs17iolA+sZgAlu+0ipDEui2+5nSflIeeG
X-Gm-Gg: AYBFou3xR1MGIW7ivET9dv651sWymdJGsbO1wbbdnolhO1yHiv9xi3KbNovwSCFWWlH
	LXfFPBDdk5sSVcxUiwzxj8RbivSvSJP+g7jmEuNaYKIwSUvmudhURurA0UWfJerE8Mil0RwcQPI
	AEfvJd92RYvakC8Rc+m/p26pkswh9k7rios9dqCsn46Pc5hBl9oTkalozH2PVM4w9XRKkI9lXoh
	2D6FOQjmGTHo78VJ0QHNk2d+ejj0KpKE/LYQtI+s9uOdNE3gBpXFw2J7B/WlVVVHFwwv8wCDmPJ
	Fwk9z53eCATApYh41UYbxiA+4Z7x+heJ9uIWmepQ+3xfn92g6MaOA015E4AKP4jCexxpB5ZLTJM
	cOCUXwVkHDIMlmmgHUBsABhlYEQzIP6omT1ROWTA6GPblHU7pF/aONOsOnGHV9eegTFxF7vqL99
	fR3ztm/qcRiIDHRshBP0GBdDplgdzlqsvlqD1vlTanNyEyntXbjfcrmXhoQSboj7ooReJYWemoX
	QxhXuz+HV4S/g4DWYHFusuqVOfVA0GC05taHvXFT2UU76Qgo0b1KHNSSM6n/gBGJrxoQLSJn0QQ
	Nu/XD5h/6GxeJ475TsMGSOQ=
X-Received: by 2002:a05:600c:6815:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4a1d762367fmr103844675e9.34.1792326766510;
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:46 -0700 (PDT)
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
Subject: [PATCH v1 1/4] arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:24 +0200
Message-ID: <f591f8cde74ef4b3bd0e2fcc2108b8564b195e90.1792326585.git.stefano.r@variscite.com>
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

Mark the SCL and SDA GPIOs used for LPI2C3 bus recovery as open drain to
match the I2C bus requirements.
This also avoids the warning emitted when the I2C core enforces
open-drain operation on SCL.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
index b30a0d8a81ba..a90a784f1966 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx91-var-som.dtsi
@@ -89,8 +89,8 @@ &lpi2c3 {
 	pinctrl-0 = <&pinctrl_lpi2c3>;
 	pinctrl-1 = <&pinctrl_lpi2c3_gpio>;
 	pinctrl-2 = <&pinctrl_lpi2c3_gpio>;
-	scl-gpios = <&gpio2 29 GPIO_ACTIVE_HIGH>;
-	sda-gpios = <&gpio2 28 GPIO_ACTIVE_HIGH>;
+	scl-gpios = <&gpio2 29 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+	sda-gpios = <&gpio2 28 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 	status = "okay";
 
 	pmic@25 {
-- 
2.47.3

