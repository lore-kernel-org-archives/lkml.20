Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911953;
	b=mqNZuXqnBb7N20Yb8vpDdvC1EaN1Cm7UFMwW3AGC+FNuNtccumMq5mNDjJNhVsdTn3sy
	 zWNzLBp8KDgmkGeMrDL7D95ODZn2Rr0aPmmU0wMWyO5sKhwrYKiOFLNm6rxTHDEmH3gDY
	 7LxqRxfqHpP125RaaC5xxVL6MPMjLxherKvp6tbsaJDWkK+VRlDDML1hrvPDea3hs7LCg
	 OL1ixGUVeAZA3KPenVgYp/sgTPKAf/fI0CEuJMKqf8JK6HKo/QaQ/cIfimYTfmJmTluj4
	 aMt9TmZw4efvZJfSJTmLA6uquRLSx4JUwc2fbJ6niJZ2NJLVqsXH6kNO3L+zfPOkuAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
	b=UqAVSu4WGIiNqqeJHTSEoCns/Q3XaM4bzLVi5DACoaoXuC2AiSfM8CZJ2z8fV6pxsPJL
	 KhoGeDvvnDDvFrXVF6iChMOjAuEpcsh6Vi9UhdSD+oWJkuua7+pHlmBB0LgbBIoylOIdu
	 MJ1e1evJMnJGcDp3xgfd5mC2Y2+ioVN9CXiH9loyDswXS1+VqU2NosgbaNj2ubATFwb6B
	 4o34+jckEghmVptyR+zOZNs3LauluG/BC1NrNW+j58/1HU0VA2cpdgoCPbF7t17wvLB0Y
	 JCN6MEjOeSeaq2Wlj/R8BsAxtrnoYoTk7pfEyNtwdRdmbpWTKiF7kAi9LVrqLJr9CrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Letfruwh;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9819A606A339
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9819A606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Letfruwh
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-847ac7ccd85so2553a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911952; x=1794516752; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=LetfruwhS4YlTwXvm6EyMPRn+7ZIu8V9uUY8FALMNLMbBgzqhYflrjUAppi9betmI4
         lT31apnNFBiEmMmb2m+soWVbyQ0NQH/lqrKcQNeMT/Be7BsXbEezyvN3VwpYoDcqJBzh
         P0xiksynz51UJwRbTCrAvW2VRrLuaYEg6eI2aPT83oqHHvKNXpO/cnPwk3r6S23pDQg9
         WeRQK5xBTdXKpYxKO8cMzre/prmnrlvRYOs22wvHcxp+M+BT4/1GJXi2Q0hjPSJhMj6L
         g3R8ZLvOP4n8JUa5m0TFktxv8RzaJoiOB9iZcb1NO08hk/qniZ941hoMc5YDhh+ccqrL
         HA5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911952; x=1794516752;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RD1jkN1QvH2Z5B6Q5iIjFx4HZtCXt5GvWjpjCwZzO7s=;
        b=QXxQHyBblQVAOgxnUPeqb6OoxPusgSGTAb2OmS9IdBTBKlkTf/pfWW+tGpazTYSw6v
         DMsb5PtcOaOXNAO1t+jZLvHEupjqWOM1ALTH4sVFX5AIjfSXDvpWf8CI8Ox/wezCr2sL
         HYNsysogkBkydwhFSzh3LVrzEdXXByTotKIsOfuUFy5rN+w6ZDq5KKFg3VnPF4rtE/jH
         zgox/aGXL4Z4dx7sqrE8sqUAbgSXzkZ0U1kraLRvimvieJXmqzRB5kT5Bfu+ycbXEAIH
         uJhYE9yJRLy7ntjYw17uodxKbRLYxlMnpYohjn1GtG8zYFxr1tN0yY5oEs/COGVbYy+o
         OFSg==
X-Gm-Message-State: APuU4Z/qugjS//hRxcoFvHOL3JCYBx2Le8YfnpInXniX/BVmqvMV2tvJ
	ZpQVY/fyhyrWvrlc6OBnR3X1PGuAYkxd5VOQ6lW5zCpf5b2X+je9d06v
X-Gm-Gg: AYBFou3BeApt91D6NA/KZUGaiuRy2z+TypT3X93DSs//r95t/ZwBhQSWctKvSdUiIqN
	VDwZ4wBWoQWk0xTMaw09GiFcgpbVaeKSmnStinVLvi1zEVfYwrlTnf5Df5IYzYve+CUxfxzOw0T
	1IVJfNog65/7uLvA1O+qzlQJLioRmD029ULOXYcR5DT7IGP9jN+eHJQuCG0grKMR46OVaoToXX2
	UIoi9HZD9xUE0uCypc5Jan/n/vjFzTtyD+CuWuO5q7MfhdO74k0O9NBUPnze2+TnFyNG9VFZ98f
	gpp10kc08iY1x2Fe6505evPGFjh9r6o3FpI0YzLiyWuuOFX8muTHpU58fN0tyeLvBj1OsQCvSV4
	Vub3wIVYdpl66yY2AeyJFUvrc0ACVq/mKdW83khSruw6BtDIERuz/Q35RiI+xbeE9pwixvNAY2K
	P54MAIVZtU1+TUSQWQC3obucK1lhhcPVtdPgmdGQMvJKu411uhEqswL+dOu8lrDUZOugpiaZbsv
	KNq1oSgoD6u8dn/UEeXDRIq1VSIr6PwxfFj+wVZT1d0TBHqLIDWMKibAGCaBqLzg/iEQgmWWeiq
	JaCHjyKA9NerA9eqI8Y2NGaJilFesHg6qZm1J3856C9kNM6sA/zPRSmE//O4H2Rhkj2/VceW8n1
	owgvxOOUpkZupYTGyJPMoU9xSOXuDIpnOq+WnCSkKmDP9jI+GV0Hd8mEo5Ame68XyEkAzAd3ZwT
	d8lpFuNGjSkbZvopEwq1wpIfYw53MSS4bbMplGy4HTPNkw0AUZMLg=
X-Received: by 2002:a05:6830:43a2:b0:821:8e71:1bb5 with SMTP id 46e09a7af769-85f1cfe1eddmr529135a34.14.1793911952656;
        Thu, 05 Nov 2026 12:52:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:11 -0700
Subject: [PATCH v8 10/11] serial: 8250_dw: discover Allwinner A523 FIFO
 depths through FCC
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-10-14024d2b184b@gmail.com>
References: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
In-Reply-To: <20261105-submit-h616-uart-fifo-v1-v8-0-14024d2b184b@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The A523 UART integration, also used by A527 and T527, has 64-byte FIFOs
on UART0 and 128-byte FIFOs on UART1 through UART7. Each controller reports
its TX/RX FIFO depth in bits 31:8 of the FIFO Clock Control register at
offset 0xf0. The field holds a byte count, not a logarithmic encoding.

Read this field in the sunxi setup callback when platform data does not
provide a fixed FIFO size. A fixed size takes precedence, so H616 retains
its 256-byte configuration without accessing FCC. The probe has already
enabled the clocks and deasserted reset before invoking the callback.
Leave the FIFO clock-control bits untouched.

Use the shared DesignWare trigger setup to validate the depth and build
the FIFO-relative threshold table. Invalid depths fail probe before
registration instead of producing zero or truncated thresholds. The 8250
core derives the transmit load from the discovered depth.

Select this setup for the A523 compatible. Like H616, this integration
has Allwinner-specific debug-divisor and RS485 registers overlapping the
generic DesignWare feature probes. Use the common sunxi PIO setup,
BUSY-safe integer divisor programming and software RS485 handling. Keep
the APB clock gate enabled during termios updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 22 +++++++++++++++++++++-
 1 file changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a55f60330a51..257baab5a3ed 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -44,6 +44,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -63,6 +67,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -666,7 +671,15 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
-	p->fifosize = data->pdata->fifo_size;
+
+	/* Apply given FIFO size or try to autodetect it */
+	if (data->pdata->fifo_size) {
+		p->fifosize = data->pdata->fifo_size;
+	} else {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
 
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
@@ -913,6 +926,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
 	.setup = dw8250_sunxi_setup,
 };
 
+static const struct dw8250_platform_data dw8250_a523_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -965,6 +984,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

