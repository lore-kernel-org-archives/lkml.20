Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF949B47B
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 12:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792326773; cv=none; b=ljwAW6/DVTi1gJuAWQ1SOcd0gjmOJbHAF/a9H4v+xTJ/XS5tliAsJHbVgjBroINiGhz3dAfWPUJjg1tGLJdeRax9CcalUfsu/0c+pDBXT72nbCT5W9Gedao0o7/vJTj7xPhJ4+Tvz6VMwHLtMqoL1y9aFL0oeozUk+5jUkyLdV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792326773; c=relaxed/simple;
	bh=zLxW7Bv3Ru3U7jHr0/eoztXfDcqq0fHfPDwR5r/Ud/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pv8DjF9lUFYqU/1dl6Sd0/u30oW6eyIOEvdpvVL+bPdxU6MelnZMG/2FQjjYnFDEYDVdVc4UPFB1QIcmcmfwwNwlwdu3ZRL/m9jtpI7Y5i8ozrkTOGiDrFjOD13lScAAu6lyxU2YbLtVdk15b/A+D/Jv5HcnlPUKTezBjAPEB8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PNBI3zNh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PNBI3zNh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a1d293b293so6896745e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 05:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792326770; x=1792931570; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=PNBI3zNhiPVrd9/ddmWKVYOutTjICv6ukxK4ptNw8+tOzRxoOR0wMCNnA6Zev0P8Ub
         gvgWxEGHYyb7DsZDjEYSA+9UDBRm/YJqUVXyd98Fk9Nfl/A/dJyyq5aJ+KPLx3UsUbqB
         0P0HOZ0k+x7Qb0so+8S8vKDDxE9j5yLSqRREAy1Qb3gl8k/74Qe/xYMKY8YumA2VSLYW
         wwFEb8kjgazgGOwniT4gcW/0+urDRtvcUXvaaXx5Jp1jdy0KahJLZBALwO23QEv5k8F7
         8bUDRVMk6dfdc56mwWn/RaJdky1TafjDKi2+Ge29c8D/e0q6Qw7IQ1HXq2nrsW0OxDJP
         7Q5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792326770; x=1792931570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YoTkqetwDXx7EPpERx3l0yijxyF3Cc+zIbtbMzAnzsQ=;
        b=GVi19/5lBEoRw8OMcAiHsddb3+NOTmXfbn6dC+bUtFU9lEUqL9TCkyBfjp/a9OxrDE
         6bIrGUp0JQ8nR2Bv2WfYIuEzSbHffkrX59CQBoGS2kODPDmd8QrwN6/cwsP10C73/5Bx
         EScrM6xSNxfIehiW1fcdeEa/VPJAjohYongJenEb429KomoBnf48/LKM3RWUlFXtzQrf
         4Hxl34zbrxmfkFavXHC8Bj2o1i+Mq+3ZGJoeuSIC9yN6Jc6Dngj9Oovcl5dTlRk6h1ta
         6BZ5+5hiETg9tDjWkagRjWjczdEOCgHgK5c4jLSQ+6XJoDQTqggJ9dEblYAqEdEHMf25
         p2Qw==
X-Forwarded-Encrypted: i=1; AKwUvByLHMUYxGfNupD6asI/ELzUyJC7zB8qFA2PH/ZRCi3r6wXwWJAKH4YMxfXNiNftDmpQgIc1+YnsZao+MiU=@vger.kernel.org
X-Gm-Message-State: AFq9FYKe8lN5SOWYyasWkuQvGr1PvVcKE3FRUS8uHB1zw8zOEn4pueOl
	6eRWPY+peimX/OFqcoUihxNITyBnDXfNP4V0m2Ru5B3S17yP9ObKiVgz
X-Gm-Gg: AYBFou1nc08hey0i/GN/R4v5F/ShpLy8ozb7OaEFil1NgON0IOnOg2i3LNg3s2Bg87t
	eC7ZGon0AbxDiKAcHQ9eakvnOMD9c7pzI+om3d8YSLgX61QlAo5sJy5N1uKhptxg1jg+8mn94Dr
	BwWIk6lYb4KboPwNfEPiUjnrI3NJiVDD9dZP7KZINc+8yfDHvyJLYxSLYHMB3Aef3sQt/DHlhW6
	U1XFHVD15e4NC6b+P6VgPVJ9xGke1zNgGpbBNBkxqC21naq867t4j7Pcj6+cXBc7MEf4NetYBtO
	8E/NZxlc8J5dMgcByMErTkn5D2ITrZ/KCj/ACz2bIQ2ZDrBAINklvHkpUJlvDu+kVE/sdHrS8Mi
	9ybg1VEZfMq43wZn60K9jyvgKGWtV6iADj9amygbtxzs4x1ACAyv3Tf06osDBzpuT6/bbRHKLcx
	IH4oUvlvg0z3mAn4x7mAx4sVEs841A8Asx9w17tGyMx0V95t9yOdhm+ebnlwzhFGJrBVq29iP+v
	bh6NRqjiAtNWHaClEeIhrWei80K1f6vihlxtYFHvFBPJM+PChX2NEdH66dF4csNNtT0Oyie7d0V
	wouEtRQmYKK0YQbCO1nneaE=
X-Received: by 2002:a05:600c:c117:b0:4a0:1c0e:b057 with SMTP id 5b1f17b1804b1-4a1d75af362mr75981735e9.4.1792326769990;
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ddde4esm245012535e9.12.2026.10.18.05.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 05:32:49 -0700 (PDT)
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
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
Date: Sun, 18 Oct 2026 14:32:26 +0200
Message-ID: <775959bbb03ff0b5dd5c45b5c8793ab8945adca3.1792326585.git.stefano.r@variscite.com>
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
 arch/arm64/boot/dts/freescale/imx93-var-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
index 24063bf8183d..b0ffcb534cb6 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som.dtsi
@@ -104,8 +104,8 @@ &lpi2c3 {
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

