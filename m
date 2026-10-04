Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A05455617
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 14:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791124863; cv=none; b=NjdIZvKoUIK2YyYC3Np2JjIwa9mJtqDDUmHz0ormHGIhlrvk8Ph19qirYW2gdZ3GMQartPsvK9aXUMvhHHQaUm6FmM2I7X1sY8tRXiDF0hoMHUXJ9doCojohJOr/iaiYVt+RAn7QZPAzdhrstcTL43FK3NxNdEQXtmzMluW3KmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791124863; c=relaxed/simple;
	bh=wCquXpGCn1eO0qgNhHx+XrO7DCj4AVei1TrHhHqS2tw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W75o/5PRsi/Px57efVo9KnNpgWK0DH1yxTuL017NyeWqz37B1ybWN8qEfedHVrqnH1NNlKmxwf0tirV2ARWuhq0zp0CdzX1XBfRh9jmeADlxGIU2kyKDIB/SrMDcjrgtkzORS2sLewK9H8CIk0VfLXCnMq/6jjw4qgM4EFvhwGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49d05d51553so6913615e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 07:40:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791124853; x=1791729653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4WnY2f3qUDmMEIrOsugmwhw1biyWqEpaCp+l7ISDYX0=;
        b=LDTYSLI9sXT1YWXDckIedot2ybVpDuTw4BUeEdp3V+CJ679l/jCwprTNGrURykC5DI
         ZBvFeNfpECwhBYCA+vAhLNwH1TRO3krcpDo7vTxjkQiR2dDNXAQSaWa/HpnbcFCAGNwU
         K6G9A0rDRvfs5K9lP5xoTl0JD81jz+Ej8BoPa98CnpZDKcrfQsS8JJ95BQ/QKdnpihR+
         LG1H09IUCjw9nss18wx5FmSOjpE+/u1k5lpz2g1vn1RV40bYYny8KBzKbofeI+bx40XF
         H4hinLOQoPyWjjkDbcJImU7NPePSpqV9o1mN0XSAarDFt1ggBW6T0NaDwLJ+V+XaznRJ
         zTMw==
X-Forwarded-Encrypted: i=1; AKwUvBytSe8FFSFi6F3YMd3XEP+oakWmqsCkyjjaqkfqLI9MOZCU+cykT6zbtuTqpdO+/vpiuTBOlptnp3bfDh4=@vger.kernel.org
X-Gm-Message-State: AFuF++lYlgkvImnpA6pVGpdUFYOHl71dnGp9MoqgBJIgn7ysH/PgfDVp
	s3CiBi+o+5gnC3XoCv//nlCMwBgT/j6e1T1LrUuOzCvl4SP7G23uZ7tV
X-Gm-Gg: AYBFou2xL4h3TGN5dFtL5O5vYBs7ZJgsVb2gnog2vtdF+aB00ccNl9IcoKX9tFQM4cW
	NZElCkWckby8CDnkTq4oed+LwpzfGavu2nDBA2Z1gDrhT8cwED/ZIG8wJb+PBghb3kVSL1hNt6P
	SM1Q4fxfqBF0LPYoEQmw/qzlM3JxolYkaCyuy+UL3TqAu4eEohsaPQgmnmOKMnK+HWKOZWNxivv
	IGPLdratESrdIriYAPTUVbb+334h1K7/qAfsnMBM/Mo1P75GelAHwtnhrp9NzQySKRawbgCR1EQ
	JILU5dV884KufPKY3YTUZNhBp/lYJor/yYHImdO/p8zsheOrzYW3/YJ2bOb6fIugZplTU3kOveq
	c92QoPa3m+38h+TQuxkNEEspCIHWbvc1uDEehvNomkBE1pSYLs31DG3BuCPbuAqlE4rT/ZPdlWB
	QxNPfXVgpaSfk/dylnZxMcaF/ac7rmQT3Vzeox/5pPLtho2hgpcRo15I3S6GAuw4eui8ono4E9R
	DnvQg4Bz/AWYoDpTJ3bsLeInG1gLH6AHA==
X-Received: by 2002:a05:600c:1d07:b0:49f:cbf1:e765 with SMTP id 5b1f17b1804b1-4a168068ef8mr79507265e9.0.1791124853178;
        Sun, 04 Oct 2026 07:40:53 -0700 (PDT)
Received: from threads.localdomain ([84.68.183.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027740a2fsm298907685e9.13.2026.10.04.07.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 07:40:51 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RFC PATCH 4/6] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Sun,  4 Oct 2026 15:40:44 +0100
Message-ID: <20261004144046.391444-5-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261004144046.391444-1-tanure@linux.com>
References: <20261004144046.391444-1-tanure@linux.com>
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

