Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E521844CAE4
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361602; cv=none; b=IMjl4VKBJT4bG+GGKsLuV19L+QmmMW8LMn7K7JQ16nuS+6a66kcEwWq6D1DW78hhApk2oRYLuOdZb+jURrRcjZFx5L6IW1BX4qveh51d+4833Mg0pWQhdqL4EYnIF6UQdWtnzK7lniEGT3JTBu9IJk3Mq3K49R4b4fL9wVgfdKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361602; c=relaxed/simple;
	bh=7MCaBFOuVYPL3cfUtOVX6nxdRkEKoiQe3MsLZtFLwkU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ci6R7HDDtNhmguEoBMjS3zRVH3imyrwg2LcKx/ueSxTNEgeRGoXBcraPbnlNEM+AFjhZ/EHVZ1DUfjUyeoaTNIP5drCmDtRS9mWatMP4PfdE173ETp0eNLrx7tIBsL32m4aNbL+dGN9l1ZTcQfnDUqMkkaAdEl55kfGyk5cLjaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3111149f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361593; x=1791966393;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=TTTRgqfokTApXPASuj1ry86CL17apkY6uH0hMaFz8dr8Sxy/99fVnHL6MR1x2BYS7D
         VpS5EYwd9RVjjyw9rHsdqzIEK8XLqQI6T7x4gokVnhiBsIQjOTp10Z3SINgHWRRRw0me
         wpnlDW0Emwa6Lg9MT6UMOvABxRXAFjEGpACwogG7ptwYLoK5SEegz9pwDUiPaKZNqgS2
         Bmrrtm1ilkN03poyEPSV5E5zK+RXpM57HzsmZxKBxFs5OpPCS1i+AcNLOH6kC0RTeIG1
         K8zy4zvNhi24EbhazWc0ew+2CnhWmlW4yB/E5vxAWaWIWB9UCe9WL+YM4i6fXGV501XC
         JzUQ==
X-Forwarded-Encrypted: i=1; AKwUvBzSuMmyiRIB0T8q6HbiecdRVax11benDSUk2N2HeDeNnc6gA3vmbXJPMjWBHXzJQiGU0hx+saKKlX6YOzg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIiMRWbJUACwCyYHddGP2I7hI1QYL3l1L3YiRnzUWvb7xBlAuSH
	tYFsmW1hEYMS2qSqwIp6lznVRyDRh7NtzBBljMbhxYPn4YFWWAeeK3mn
X-Gm-Gg: AYBFou05Zlcp3wDmuOg/x1kSKCcE5/ZQte/ftaJKzr/IBFOsMj4EwfmJq7/Ue1JoZbx
	XFyzqcmXlZubS+FrkBCkXdQezFtVrFYXvCDiTOMTE6cKn735K5+y9xlxJ+3LRHS2hvLIJOr1gXq
	0i76+/mxjYsNWFDt+X2n6cZpHvy/c2yRcf3X/8WZ78prljiajKgjxEWQB+15pIZMKb6DWUXddlD
	xwhwJQChTAk8PsCxnTT1Wq9fVAMujlD22H4QO5PpRwe7NezIHeCbxcdd4MoCTe47FT1Z5rUTCSh
	pod/u2yY4f6MV/GZd0TOvvgA/ZLj1xyhs065DY314cKCgjCK0KvOeVwx8fiLyMWkd9169IqE16g
	8st4LUpxCYGHYJ6IVBGWiAgSNVgbpn1l/MiNBBL+Y7BC6IEJLjIFhRHr7t2x3vENerZ1Mgd1LnG
	Qrhplg5pK31ECn1BMTg5UMPGe8bb4eIDQDu5geyFIKu66VQpa2DE35OxTI307hCwiMkTYRLoop2
	I+Vt2AIkaf1rfk5yFvwP5Cqaa7aJFIMLe4=
X-Received: by 2002:a05:6000:989:b0:48c:6955:a603 with SMTP id ffacd0b85a97d-48c7278fd23mr2475124f8f.13.1791361593220;
        Wed, 07 Oct 2026 01:26:33 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Wed,  7 Oct 2026 09:26:25 +0100
Message-ID: <20261007082627.63807-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SoC brings its ethernet interface out on bank Z, but no pin groups
were described, so a board had no way to hand those pins over to the
MAC.

Describe them as the two sets a board actually needs: the nine pins the
interface always uses, and the five extra ones RGMII adds for its wider
data path.

Assisted-by: LLM
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 30 +++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6894c06a836b..7bd53ec16607 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -376,6 +376,36 @@ mux {
 					};
 				};
 
+				eth_pins: eth {
+					mux {
+						groups = "eth_mdio",
+							 "eth_mdc",
+							 "eth_rgmii_rx_clk",
+							 "eth_rx_dv",
+							 "eth_rxd0",
+							 "eth_rxd1",
+							 "eth_txen",
+							 "eth_txd0",
+							 "eth_txd1";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
+				eth_rgmii_pins: eth-rgmii {
+					mux {
+						groups = "eth_rxd2_rgmii",
+							 "eth_rxd3_rgmii",
+							 "eth_rgmii_tx_clk",
+							 "eth_txd2_rgmii",
+							 "eth_txd3_rgmii";
+						function = "eth";
+						drive-strength-microamp = <4000>;
+						bias-disable;
+					};
+				};
+
 				i2c0_ao_d_pins: i2c0-ao-d {
 					mux {
 						groups = "i2c0_ao_sck_d",
-- 
2.56.0

