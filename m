Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572340;
	b=zzLY6SXLbhDiaosN3iHdvKzG7o7LzPSulsjoY1d5p/UAWaryy0Sio/9Xh9mVHKC5Sxvu
	 z/k8NezywpPR7TiG7+dozNqq18YSuBJVOVTm7ItIrb7NQV/wStP/1vymTd0zqapK+dmiT
	 dIBQ/oVuEgxMFvsvTfCRYvq3cd8GjJS93iTI4vRXt51yh2B4yNWeWTCKMjIEc/pu+d+SK
	 /u0YdiPTB7CrGOsoRC/c70pxVXQHkyDJvIVKH37k3FIwL1mOGx31qjg9kQ6Ok84zPMvLu
	 doLEkND+5dIluEH9SG4i6o1FCe1RvIU1TrIz9DAVpVdUXyEXkjzIwmH+ni/R2UjVNsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572340;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=;
	b=v4t5DrB/hlqdGqIRFnhrkIxQhvQee3AeeOCAHi8QdJdVqW+bSWgpkjjymedmz9LDzk0E
	 IFuNHi+VvbhRb7f5DSewckNwWkK0GGphy1oTuhBnMaSOIPUGSYtR+bqVl68py1TCxTNGx
	 HiI/f8D/FEiaRF4TMH4B//7mWuAuqLicJ7Rjxt56fxxz+8B+Hg5N63XXEt2QMcmVMdHi0
	 nozjYupMrwyLzBLVispWi8FJs3L6zTxiI5dG7sXwtwRCPOG0XPpFsTBiKjuJBAw5rHm/A
	 N9sWcfl0UYyGEdUeG/9EBWG/YyVn9uLYK9X8CrHweKRfemL45UA/3CaYDTrN0a5qyXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=linux.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AF960A2613
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 12:18:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06AF960A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-491aaed7565so352221f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 04:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794572338; x=1795177138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9GQJLLepWwoaxFgy0WwYMme3cDh2Nvdn33ep+PsXVNo=;
        b=d5o9dm1/16wR+gRT8J33Tt829PwKPZka4fzXpEA50w4LU+746cKyhKe46Df0Dt//Cw
         eysZGeWOHA+AAnK23l34iGubizRf7y94gPnozyPUtszlCEDy/kZBdw29Cd6dmI2j0IDH
         ufuLqJ6oKCgUN/2rVX01OPYZn/ovWmgXz/s1TcLW/8Imt0KQcSVqGRYH2tHYJEx56jCQ
         uEPo1UdHt5XFNpGXBph3fuQgoz2YDmKQal0aTtZhTuVptFiWbA8yNN6bV6/CdTQamI6t
         AHrG5da83KFGupwacE/FlsdcU0bk5VHKk+KFTE1OIv0WtW8yE6AL+NiNLC96UQWaMS16
         oiUA==
X-Forwarded-Encrypted: i=1; AL+hErGZfBnipe5bp78staHW+5NS4UBXqKVVxjj0jS5/3Hi4PvkIOjTeDEaMcPdcmzM63azW6ddhYvotLAsEWfU=@vger.kernel.org
X-Gm-Message-State: APuU4Z+jRKiqYHO/zIwWUZYePa7B3xk2YR/Pc//KESXEwaUn/iLFl0Mn
	tgAhhRYYQCSvPftcISAERnXV7jo/xqhfTlKe/xKWfCUl27ek0793+U6Y
X-Gm-Gg: AYBFou1h6l/03gHWcmbrnOIHTISLwQODF2PgdM+PXPtfDq7fErYlivBHRy7AR3NaNHe
	0qWFrduqtMutqaOPcrQVrUB+Rvi6sKmwc24N+hKXzr7qLlXIgkqTU9b33SGht69fAbvgMcJKvyv
	T0VM4ys95z3jvJ08NedAPlclngb5lsnG4mTkXODnbk6VWIG61gA9ih3o+FBhIeDz1EGDtSDvS6v
	zef68GOkMVKAYzRP3Fa77rFlWhONfo5N8EolO3AHtXx7e3KTMLJ4Cee2L42rx7SaS12CKlVDSLd
	8Lnz5k/4rGLG/bN5/15c+T05JEALfwEQT+oXf4FSaq+CvdFAeIqjaipW6dLOGXsF1AXQ1hF+0iP
	UV+FdSlk01FFPzk68az7oMI0wbzJLUVU5ADTKXeN8Gbb/5/mfJy4ammD5MxVb2FyYhSDwjXmoOi
	DC/jeOciXGk4JVb+EzNRWglpsWGUYKtC2ojsYfget+ArebSY+gZvBS+NwwHOPMk7z8IdtHxnruw
	81PlQBZZQBQEu0nokMqtwkaMhNDjPnKOSFCPlA0uHNB5fSPkAqX9yFyVRQy8wQtU8a8aIMcXhKl
	CdEKC8v5IN4ND3BwpsHl6i+jFP8mftVEhkS+xZB1F+++nYxhqcpS6YtyhzWCWGfEHLQ2pfNPneN
	ZPgNkTA7Ohbj0ayT1GV13IPQXfzIfXTIpkksx0HUQe3cfoGQ=
X-Received: by 2002:a05:6000:2c04:b0:491:3fdd:af42 with SMTP id ffacd0b85a97d-49c72c9c049mr5208825f8f.37.1794572338269;
        Fri, 13 Nov 2026 04:18:58 -0800 (PST)
Received: from threads.localdomain ([84.70.166.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c605e5b2fsm5167103f8f.40.2026.11.13.04.18.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 04:18:57 -0800 (PST)
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
Subject: [PATCH v7 5/7] arm64: dts: amlogic: t7: add the ethernet pinctrl nodes
Date: Fri, 13 Nov 2026 12:18:50 +0000
Message-ID: <20261113121852.334604-6-tanure@linux.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113121852.334604-1-tanure@linux.com>
References: <20261113121852.334604-1-tanure@linux.com>
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
2.56.1

