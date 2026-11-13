Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794585045;
	b=Tomfj1ijxPZs41nNOxNcPnMkH9/70aYaehWNxQ1EFnT/pZvLqlatzU+u7BFE6QT+KqUX
	 WJw60qfACfmk2RfsVbZH6Rp5H7ELvZBaXmG/6/DofXdhGWejAouFgWhDSK/oNtZc/rKWs
	 V6o2C9kJb7p6dXs6M8NQHDDqby/8VIWBlsi3y9rrBuE9TMF7c0AUXKnvJ5yBiWwi8yc+o
	 ikw2TRupb3Ts/rmPAjoTBTmYxGiR7C/MyUxOsvTUxUbaC1+mdds0AJRH4xatPjcwfQKwO
	 vuYfD0wZk8NKr7nlPKGU/rBxsobufg/yThnQrWBXDcgVHonAxNcA7fiDLrOwkw/zZAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794585045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=BDFZDF3egFNlLXDdV5WXPaKkWvQvZlsO3XV2abJz9jE=;
	b=R10y+/V1sbly/SCC8AqsZC02pj8UjUnIz+O62hDbflImBGYiuRtt+KdNLdBxgf5sBQLq
	 fClYFLrSt6+4NdyKB53m1DzP9+LCNOOH8txYMgNyGqZLs7vpvY7PEdMOMdhm9ZdEmryEc
	 4LtFVGBcJyaydhG3ETGmtLFmVDmihPiYU4CCdJQs52RYA0/m/HfXR/qULs1ncIw9OC8Na
	 XjCYnazdz7dVaY+OfjAv4l+j6WHg+Hf6XqnO7izb9Ry4+AMtUXnLa8clXbb9dOJOhik/R
	 fZ5MhRx+6Ca+SfO+TAShJt5iAToWBtOEg8HfYNjQrluUdM3qEaLhdUtJdtzJbyiPHRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CH9HHo5Z;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CB606A336
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 15:50:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 773CB606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CH9HHo5Z
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso404306f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 07:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794585044; x=1795189844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BDFZDF3egFNlLXDdV5WXPaKkWvQvZlsO3XV2abJz9jE=;
        b=CH9HHo5Zegeulk7qrDHSL226x7b2ljx11a9QXN49pxEr7ittpIlyNDMri+B1NZ1n5G
         +LGZGM4Qyg4aGePDM8cguPX3FU8lcgcK7dh4vzWEwiI1MCH82mfh4NPOcliQM2p5fRJK
         05IBxoY7R5+kImKHlYOvENNQjdW6jWf40n07ZPcyP+zcyjlPBArpk04n5YVhCQSQvxB7
         /2kvAM+bxAuxocZAzRcFs0ciAsvh91X8bNrXrBy5R1U33dPvWAKfLY+VH/typBOayNfF
         KDEl7M3fWGrEYMBQ4ArgSzPKu5Bso0Puk2wQmUHOLx4fxdMjzSvYFs5grWl9XzT1Dq7j
         DDpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794585044; x=1795189844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BDFZDF3egFNlLXDdV5WXPaKkWvQvZlsO3XV2abJz9jE=;
        b=Vh5mLBH/qD23wzSDTsJ9i9rB+2yqDXyqnICozPey/DpYsYDclx30N+pNskJZubajpp
         2WYJ1TpVjrr4s0yeo88Urn8qKoIt58V7b6U7lg4IusqGbExCEvTG+++kkOpGZjaRjCUF
         M6GmuWify83nyy35ggflRBgw/ZXdHKEfyyhzU+7YvWimBE2t/8CdWoUynVo9cFCHAGNY
         dJcL0zinuEHXIwK3A4caWBI9fDcRq36RBygu+uLTm26hoI4OsL+7mzMSIlL0X8Htuy4l
         W7mT7pP8td0wJURUYQVnpJAryZUSl61yO3XrSzioU2nykgSeT4bQaEYQ6D20hAu8Iz9p
         +iqw==
X-Forwarded-Encrypted: i=1; AL+hErE9lPpC4OQWYNRT3rMqIKLX6zcpORbrzJ+cm4TkVu+AZ34dGewpao97o6aBnU6C66VsA4gnucff82qn/fY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YIr7UF1Dj+XtifCC+n7LtEiaduc5QnZ27sYDq2emRD7eaHh4o
	TXUCQWtanHwWbABz/SVvL7r9enwxO2ZgdqxwIEjPRnehCZ0YPjhfGLVD
X-Gm-Gg: AYBFou3UI9yXd/zQtFcr7WeKEqhyBGpoFfY9xBXiK+Fq627vl0TtItQ7OWxfZ5xRKlH
	u4qCX69DrtDoNUCL81YfmgJxNE7T7kadA/jYohcqz7rj8yuerBJNZCAEyCleF10PQJ0txtGVt7B
	3CJyIQoDtoAVLNA0Aj9+nNFo2O3Ydqi+qbvBCVVwQ/E8wJbDKPRJifUvh6UP1NN2wcWSbz6TZbu
	lrfdnQWmiohNqZ5LyZlNcOnjI6ycVe42DenPS0kBwz3Xuq2qus9bvwIKMVlAmwEwdJItZes3OUc
	+wSbl58C1C3tHCYs37DGE+5qVImo8Sfv4FiuMLgvI4ZPamLMVQTHLJ0xWRtOQMne/KZoN7KxQNS
	L8gNWde6wyd245IGk1kRnI2VNQvMgdBz5/9FrDaKBm41nALxjuQYwbH3mkAcYIrjLghcXjyJDcT
	kGN3QiYHehjVVY4qtsGJBCkzFRRbfrdLAL5whEpj7AOt0rubksklgMld+VKWn7Ubj1b7RTM3YwO
	oONBCcsf4bq/dphzGsLUzpcxL5ySwCzVeznJ/MHxp35Yaf+qARZoBfGMCursfoLqv30tO0APqGL
	6+NGsq3jMZzDo85Z1rC4iYVbWPsFH6BIzk0d7mfRvDP0IiehCpqhH27fgelspOI=
X-Received: by 2002:a05:6000:4a1e:b0:48e:61c9:4e32 with SMTP id ffacd0b85a97d-49c72ab0820mr6507111f8f.32.1794585043570;
        Fri, 13 Nov 2026 07:50:43 -0800 (PST)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c6020bb0fsm5518477f8f.34.2026.11.13.07.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:50:42 -0800 (PST)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Brian Masney <bmasney+clk@redhat.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v5 1/2] dt-bindings: clock: sun4i-a10-ccu: add Allwinner B288
Date: Fri, 13 Nov 2026 15:49:59 +0000
Message-ID: <20261113155000.84703-2-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113155000.84703-1-pmazzini@gmail.com>
References: <20261113155000.84703-1-pmazzini@gmail.com>
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

The B288 (sun8iw10p1) is a dual Cortex-A7 SoC used in e-book readers.
Its CCU needs only the two oscillator inputs, so it fits the existing
schema without changes.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v5: renamed some clocks and resets to the names the other sunxi-ng
bindings use; only names changed, so I kept the Ack.
---
 .../clock/allwinner,sun4i-a10-ccu.yaml        |  1 +
 include/dt-bindings/clock/sun8i-b288-ccu.h    | 82 +++++++++++++++++++
 include/dt-bindings/reset/sun8i-b288-ccu.h    | 45 ++++++++++
 3 files changed, 128 insertions(+)
 create mode 100644 include/dt-bindings/clock/sun8i-b288-ccu.h
 create mode 100644 include/dt-bindings/reset/sun8i-b288-ccu.h

diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
index 1690b9d99c3d..cc3f62d3554c 100644
--- a/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
+++ b/Documentation/devicetree/bindings/clock/allwinner,sun4i-a10-ccu.yaml
@@ -28,6 +28,7 @@ properties:
       - allwinner,sun8i-a33-ccu
       - allwinner,sun8i-a83t-ccu
       - allwinner,sun8i-a83t-r-ccu
+      - allwinner,sun8i-b288-ccu
       - allwinner,sun8i-h3-ccu
       - allwinner,sun8i-h3-r-ccu
       - allwinner,sun8i-r40-ccu
diff --git a/include/dt-bindings/clock/sun8i-b288-ccu.h b/include/dt-bindings/clock/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..48e532e44a12
--- /dev/null
+++ b/include/dt-bindings/clock/sun8i-b288-ccu.h
@@ -0,0 +1,82 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_CLK_SUN8I_B288_H_
+#define _DT_BINDINGS_CLK_SUN8I_B288_H_
+
+#define CLK_PLL_CPUX	0
+#define CLK_PLL_AUDIO_BASE	1
+#define CLK_PLL_VIDEO0	2
+#define CLK_PLL_DDR0	3
+#define CLK_PLL_PERIPH0	4
+#define CLK_PLL_VIDEO1	5
+#define CLK_PLL_24M	6
+#define CLK_PLL_PERIPH1	7
+#define CLK_PLL_DE	8
+#define CLK_PLL_DDR1	9
+
+#define CLK_PLL_PERIPH0_2X	10
+#define CLK_PLL_PERIPH1_2X	11
+#define CLK_CPUX	12
+#define CLK_AXI	13
+#define CLK_CPUAPB	14
+#define CLK_AHB1	15
+#define CLK_APB1	16
+#define CLK_APB2	17
+
+#define CLK_NAND	18
+#define CLK_MMC0	19
+#define CLK_MMC1	20
+#define CLK_MMC2	21
+#define CLK_MMC3	22
+#define CLK_SPI0	23
+#define CLK_SPI1	24
+#define CLK_SPI2	25
+#define CLK_DRAM	26
+#define CLK_DE	27
+#define CLK_EE	28
+#define CLK_EDMA	29
+#define CLK_TCON0	30
+#define CLK_MBUS	31
+
+#define CLK_BUS_THS	32
+#define CLK_BUS_NAND	33
+#define CLK_BUS_MMC0	34
+#define CLK_BUS_MMC1	35
+#define CLK_BUS_MMC2	36
+#define CLK_BUS_MMC3	37
+#define CLK_BUS_SPI0	38
+#define CLK_BUS_SPI1	39
+#define CLK_BUS_SPI2	40
+#define CLK_BUS_I2S0	41
+#define CLK_BUS_I2S1	42
+#define CLK_BUS_SPDIF	43
+#define CLK_BUS_DSD	44
+#define CLK_BUS_DMIC	45
+#define CLK_BUS_OHCI0	46
+#define CLK_BUS_EHCI0	47
+#define CLK_BUS_OTG	48
+#define CLK_BUS_DE	49
+#define CLK_BUS_EE	50
+#define CLK_BUS_TCON0	51
+#define CLK_BUS_CSI	52
+#define CLK_BUS_CODEC	53
+#define CLK_BUS_DRAM	54
+#define CLK_BUS_PSRAM	55
+#define CLK_BUS_DMA	56
+#define CLK_BUS_UART0	57
+#define CLK_BUS_UART1	58
+#define CLK_BUS_UART2	59
+#define CLK_BUS_UART3	60
+#define CLK_BUS_UART4	61
+#define CLK_BUS_UART5	62
+#define CLK_BUS_I2C0	63
+#define CLK_BUS_I2C1	64
+#define CLK_BUS_I2C2	65
+#define CLK_BUS_PIO	66
+#define CLK_BUS_GPADC	67
+#define CLK_BUS_KEYADC	68
+#define CLK_MMC0_SAMPLE	69
+#define CLK_MMC0_OUTPUT	70
+#define CLK_MMC1_SAMPLE	71
+#define CLK_MMC1_OUTPUT	72
+
+#endif
diff --git a/include/dt-bindings/reset/sun8i-b288-ccu.h b/include/dt-bindings/reset/sun8i-b288-ccu.h
new file mode 100644
index 000000000000..8595e26ee0fa
--- /dev/null
+++ b/include/dt-bindings/reset/sun8i-b288-ccu.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
+#ifndef _DT_BINDINGS_RST_SUN8I_B288_H_
+#define _DT_BINDINGS_RST_SUN8I_B288_H_
+
+#define RST_BUS_THS	0
+#define RST_BUS_NAND	1
+#define RST_BUS_MMC0	2
+#define RST_BUS_MMC1	3
+#define RST_BUS_MMC2	4
+#define RST_BUS_MMC3	5
+#define RST_BUS_SPI0	6
+#define RST_BUS_SPI1	7
+#define RST_BUS_SPI2	8
+#define RST_BUS_I2S0	9
+#define RST_BUS_I2S1	10
+#define RST_BUS_SPDIF	11
+#define RST_BUS_DSD	12
+#define RST_BUS_DMIC	13
+#define RST_USB_PHY0	14
+#define RST_BUS_OHCI0	15
+#define RST_BUS_EHCI0	16
+#define RST_BUS_OTG	17
+#define RST_BUS_DE	18
+#define RST_BUS_EE	19
+#define RST_BUS_TCON0	20
+#define RST_BUS_CSI	21
+#define RST_BUS_CODEC	22
+#define RST_BUS_WLAN	23
+#define RST_MBUS	24
+#define RST_BUS_DRAM	25
+#define RST_BUS_PSRAM	26
+#define RST_BUS_DMA	27
+#define RST_BUS_UART0	28
+#define RST_BUS_UART1	29
+#define RST_BUS_UART2	30
+#define RST_BUS_UART3	31
+#define RST_BUS_UART4	32
+#define RST_BUS_UART5	33
+#define RST_BUS_I2C0	34
+#define RST_BUS_I2C1	35
+#define RST_BUS_I2C2	36
+#define RST_BUS_GPADC	37
+#define RST_BUS_KEYADC	38
+
+#endif
-- 
2.52.0

