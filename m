Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA199450917
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 08:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791361606; cv=none; b=O/lzLe+uGy/i1hueCYKI8rfer2qnvjrkImBTeGRAnHIWLU8OAQwI9QCyDAo3Lt5DybAAK25bPaoPL/OwlUNtFBUG/wlPXlqiqg2lxhIhRvwXlyyZ7vBBtym63uI2e0ckzoZ7mpDKZ1x6T+6+t8DweulTrRHr36E3ASbfO8UpWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791361606; c=relaxed/simple;
	bh=5tlL+2agJ2s9km+DZ2KGJFImg/1CkMbVGilWBDkZMNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RVyrJExbvzCkqe+2iIfTFp3bPvL++CejBVrh60dfdZIV6B1wRYWkLxI/m+jXDjDsBPx0BZvJG2vUU4EhWg5MAvncMFYhE/Kpvox+4wjdMUZHoBnXJqd8xS9JXPMuLsy2KpQMDHQcAooUvajqi2EDnRs0E1KaXtXJaUDSqLzJyeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48b02b1b4cfso1058729f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 01:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361595; x=1791966395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rz1uNP1/6zGDpEzl8JcWI5dNkU1Wh/FOy/3g1YXciIM=;
        b=ydAxFiFBfMdPHPPrBmGgffiTr1ri2AACrqWE19R0ZD3oQoTHYopOKe8o37VQ2mm3w7
         j4t2OqyMY4rj9pq8PYiZDHlyttIsFnQBrwkn/8SZqPe+BQxZvhUi89iQIn4M/PQiLU4E
         GVfsCPlHqWJ6pwJxx15fzRdXiuiGnTWQyrc78Hu3OvRNstfm/G6zdkZNa//Z2cGqNdJq
         hHf967R6EasJST8k2660u8Wx9NVZmqfFBT6ZefPSpzJ0wJ7J0+mBWozyBg14Fw+vflBa
         BcYbfy1LsUDPPT7aPJgtbDIwD8c8EfEE7LGK8/ue68FZE+OLYFfBCfRMcAnVNplQK/Fp
         wbjg==
X-Forwarded-Encrypted: i=1; AKwUvByOywEJ4WMm3rws+J9qjH2u/NuzDRGMwRVhkEsSSSDodUvWimLWXIYYiqZT9z1o9Dk+NWNf25FViCbtS8o=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTQS1nQFRoxbTYJ7KtYwuMysD/LXqcsWIxL4fnldGuSdZIL2Mq
	Xj0chaUhOB1UHdxD/foSmFoHwRuWfNcB0xb7WaUKWTX1QUJP1BH9+KPz
X-Gm-Gg: AYBFou3c1k6kD4uWZxZAdPmMFaMKcu5pOW/cajE4uXOfORUWOsX3at3b3TSWJU3xbff
	xxBg9FBpAg2cYRYA2HXWeFnOKmsjSxsROfMIpKerIVUJRYz1Z/l8CWOwyeXmhrp0fWdsk1swxFN
	+9/PZ/mzOjnUmLz4xnGxBWcUeG/aenGC7+1MoJBNxJQkidYCGP6Uni098/ydbbkVTHy1xxseezc
	cPEn60rsNVFX4SCpOxky610eYHqC07rtPcnpK6FYg4ly1Ez9BB7q3RCYeeo2llBvF4HcJ4rUzZc
	82KyXWddfi+FBjOrrFCwnX9IUWCwfYjhqP6yW2wzXHGhXze1cC6hJ8PX/f768psXQcKblwJ+YK7
	Q1WFVDSVJSw9RBn9F/V1GYbnO6TU9q+CJZ5Bf/gc/sm0h3efF/V3RXbLHuq+4RSokKbn6y2SvAq
	OX0PMksoh+tZXJFY1MoHZPypC/I4zvzULeKqJ83gFn3bodTI14XILbelEuGyew1eG8x7RGFpjJ5
	q1xYYmOV8xHNXuzWWXamW/u5Kz6UDBDzDo=
X-Received: by 2002:a05:6000:454f:b0:488:7892:1932 with SMTP id ffacd0b85a97d-48c7256fa0bmr2028288f8f.0.1791361594943;
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:34 -0700 (PDT)
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
Subject: [RFC PATCH v2 7/7] arm64: dts: amlogic: t7: khadas-vim4: enable the ethernet port
Date: Wed,  7 Oct 2026 09:26:27 +0100
Message-ID: <20261007082627.63807-8-tanure@linux.com>
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

The board carries a Realtek RTL8211F gigabit PHY on the external
management bus, connected to the MAC over RGMII.

Enable the controller, hand it the ethernet pins and point it at the
PHY. RGMII needs a delay on each of its two clocks, and on this board
both come from inside the chips, not from the board tracks. The PHY
adds the one on receive. Its transmit delay does not work here, so the
controller adds that one.

The PHY interrupt output is wired to GPIOH_6, so link changes are
reported instead of polled. The PHY reset is an RC network on the
board, not a SoC pin, so there is no reset line to describe.

Assisted-by: LLM
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../amlogic/amlogic-t7-a311d2-khadas-vim4.dts | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
index 0fa83362b417..4a2b0b563655 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7-a311d2-khadas-vim4.dts
@@ -14,6 +14,7 @@ / {
 	compatible = "khadas,vim4", "amlogic,a311d2", "amlogic,t7";
 
 	aliases {
+		ethernet0 = &ethmac;
 		serial0 = &uart_a;
 		mmc0 = &sd_emmc_c;
 		mmc1 = &sd_emmc_b;
@@ -256,6 +257,27 @@ xtal: xtal-clk {
 	};
 };
 
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>, <&eth_rgmii_pins>;
+	pinctrl-names = "default";
+	phy-mode = "rgmii-id";
+	phy-handle = <&external_phy>;
+	tx-internal-delay-ps = <2000>;
+};
+
+&ext_mdio {
+	external_phy: ethernet-phy@0 {
+		/* Realtek RTL8211FD-CG */
+		reg = <0>;
+		max-speed = <1000>;
+
+		interrupt-parent = <&gpio_intc>;
+		/* RGMII_INT on GPIOH_6 */
+		interrupts = <154 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
 &i2c_m_ao_a {
 	status = "okay";
 	pinctrl-0 = <&i2c0_ao_d_pins>;
-- 
2.56.0

