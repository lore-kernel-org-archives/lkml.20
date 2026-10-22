Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699613;
	b=wfsKjld3tXCCqMPYio9taNTT9eWlmbALSTLAuZr6AJD7dpTNUxgqo5hw9b+hFuBLPVdM
	 0zUyG9fFp/gdf9pyzaTuqOUtGybOZUnbIXmT6ive+euJDI7YoUi8EmCDuiBbQMT5Pku5u
	 QeWPMNY1Xw1YCXDM4clI60ghzDicWj1KGIopocnM2R7HDW8+L+nR/Q+D3UPQ3y9VdWcSY
	 DsSQ8iBQ2mX1GBd6E5OY1tcvFA/9k6JbUKu04iIiobkQtWmeGz3O7MDZ3SmovAh3mJea2
	 jeMUVlyPIYF8x80Y1Poe3XsXGYM6cMe146zx3QtuMYCusahAvOrlSqGiRAXUgieoRnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699613;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
	b=wE4E+OPatBkG2k7bwzdbMEhDcBwopukbZkL6xF38omEDpV1l4cRSrqF/v6E97Zwn/F2j
	 uEzEdDY6ind7TAdyP9pCe51uQvIMaU5xh5kjcyBLCMfq1kcT/qwx+WWvrVO9CMSxczFfa
	 np5ejDpbW/7L9KF/VXloeLKOTxhJ+g6stKR2HjsE2EMMklFjblqMvJTvVRkNOpfh530/r
	 JuzQJD3RAvHGyuKzgP4L26DRKELyE5uFxab318H68CvhbjB/FaiAgo7vKabJcb2KR9sek
	 8sLpEvVCzWl0Mxz4prAkiCYJiWJHLdjikFSwq8SGGPskjuXJ0luI18mag52hRBYE1nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926960A3810
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 20:06:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1926960A3810
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a209a7fd1bso965495e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 13:06:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699611; x=1793304411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=v5CqxcBKvAvHjHHPxB9ySYgie/HwK72kF8ZKF5b74+M=;
        b=CqhcB+6Ll4ULi5KDd7ZYYzG5Ki9vw4959vo+gNiID4mzPYjVm9n2jPfvxF54h2rmkN
         1pAAkmDew/dXJefk5XbnI8uGXcrP9qSQIn3t+NPbgbVdTJDiNUfXefrEzcWqgMDl/DfJ
         ZNH9k+tHm4RTQ9w7KlcpmU5VRlExy+2kaxs1YnoxjZK48I01cMnSgki14LQrqiz6Qo6D
         YKSFPBhAU9dD9GY+o7w8att38dHKxQvGwv6xyCVmi2S2nZY7q1BDaWBCGSpAZax33o+6
         FBGI3z8keSj+tsx53BZPAVVeNec4QOQxltiK/k5vvJLkicuk9bw51+vBD323QjEvHryh
         kvzA==
X-Forwarded-Encrypted: i=1; AKwUvBxa4OOW2rt1b+KPIr7jqf/YeBYnt4/hbeS5nB4PIbUaLaLtREBOPx5VtmqFSBuMicbamzqqQHgzzedJgl8=@vger.kernel.org
X-Gm-Message-State: AFq9FYIY6AttjLq/pl9o/7a8xhrHxCSyz3L5e6d/HJBeWMttm/A/zOiY
	XuhHtaIDyI7FOxorfHwo29aGbZLvadkN0Ah0PGA7mqabkKS10xHtI052
X-Gm-Gg: AYBFou3tfEbC+l6auV/zrvVBpZ+kD5Dtzr44h1jAoaepZQ7//t9evT8Ki/jQxS/cItN
	p2kvSAaSCvihE2XG8/ojuJEc4OIG3VRrcA31T3taCWBnGreUUDku4FQWTVJSXGjsweUcjVmgbRq
	crp4FUXjZr8Icq7wBtzX83wMRBgS835tcCgeUqppfaB8YQjFAIq3iYPjrY1JLKb8TXKO7ppZppV
	NxSegz2GlO359KdgHKliLGIhaD5M/i/1EaZ1NO1p2/IgV9dJRpkNEnub43LFQGduIjGcN30y3ID
	FP2fxSnROZbcNc5h+Zkf+W1aj91kHLExkseU3uNW32yjUzhA3F0IK4XWXvQaTFNRTMSd6ErNB/v
	IJ5u93pEcUWeAHJVMV5A8s/gl3ovh+DyKP03I/WGN+99lufXq4rvU4dCfJRN8Y5Qdnb2Ho4Py6I
	a1Ze+F5+kfyVPHIBqrrsxhE6v9Ob1iP+qf3jyJv2ll15rWpexJ2cjhETKhupZJ+nK6RAVcRCJsF
	1Z6gYUNE+Rs4QM2Bo/ryzLyZk6A0XTAoHjv0SsMHx+UeOHruj5GNXAX6Enoi2PDsoo1rHeHyRgm
	C6Yt6d6UsFXVsU/fiQjeJLnuCyfrWBWXBaYS
X-Received: by 2002:a05:600c:1d0a:b0:4a1:f8cb:7d70 with SMTP id 5b1f17b1804b1-4a211f08fedmr1687545e9.24.1792699611517;
        Thu, 22 Oct 2026 13:06:51 -0700 (PDT)
Received: from threads.localdomain ([81.79.62.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2123a1797sm35965e9.1.2026.10.22.13.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:06:50 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
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
Subject: [PATCH v4 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Thu, 22 Oct 2026 21:06:38 +0100
Message-ID: <20261022200640.3101932-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261022200640.3101932-1-tanure@linux.com>
References: <20261022200640.3101932-1-tanure@linux.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
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

