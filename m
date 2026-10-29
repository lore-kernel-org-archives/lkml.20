Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299661;
	b=mWOunVZtmD9NTuQU3OO4oDTaTZp/+JBenG1d5PqFDUwwDqkMVf6Htg3zGIv/cOpfgV9w
	 Pg+F6Mc75d7EVrWR3syAhFE2dChK3CZH2GCqJ4dTx8O9g8H99oJCav6z0sAf0DYc8a39h
	 ZsadaD5oCkS+OmVI4NNn/pSlwXtqXUz/BBAFydkgLN/RFi67DeN7UBKYh53Rygm07fT58
	 9tAQNLa/kR1S+JmwlQpwFFBVCbO0dYWLC/sVinI2/J9xKKggZwVeCTOpVEwtWRT/EknqE
	 xD0gvGggFCpiw65ZQFbKZ77LDHpki7ecvtXrLCeG2dKAocj0OU8GZYioVb3lF6jAciQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299661;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
	b=BW+O9kZoKOJiuNgtXBB6sO6+7XcKbJW7GgswrDZcxa/FI59BlxLjYhZjQiD2ujtftoR3
	 He3mL3xewY61FjL5W6xm/49ttdM8mydQKjLGQKHZM8Ddr+pxuRi6VKoyMpGOyzQDux29A
	 bl8dm9RqYIHKtKdNXIWCova4Fa6k38956r+VVtYrylCgNR6G3x8lVbOZKNP61P3rO6zlD
	 FqbsRMNrPrKeOTMpPK54AVWkDfnxwDC+UcGZRHRo90jDUBGKIV8H+p8xqnqXuvTTmnEoT
	 NW3Y8cQt5+hQgs4MeobdW8VjWbU5v6wEwLUcekggJAqxTwHprD2t6G9bGYAZJGvxQyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAJSstbL;
	arc=none smtp.remote-ip=209.85.161.47
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE0E60A3812
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EE0E60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YAJSstbL
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-70059e4dab6so1634957eaf.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299660; x=1793904460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=YAJSstbLvrQs9uylpyI3HdZb1yZfuuCQa/k0Xb2TuXgPLTRxBU9BoEHNybbaPAAnQ6
         95qt6FhqfEdm6oTug2FM2bnS2sCHUaIjs1cCTf7l1Rm6KtVpzNb/55CrMj7qXDHF8xK4
         uYkQ5d1n65HPJSXS+K9EJ8Oh/4PPndGc1SIOkJ5XsgVu3hHHr/uTdwR/sESiOUW7nRor
         pajAQ53swTJOpM+dAEvpLA5uoUtef9PWwzfCTA4pjRHZpcsUVWlLGWQavDLCGyBeak5M
         nr9R9YVSz937p9VKOZyAspVgeGZJsDb+geY6aDW6hK24fuItk698Y+Pl9u90Fu3c3uFJ
         JdWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299660; x=1793904460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XiQ0h5RUDVFXY9TV9nlMQOKan7K7h2eTMSJt9GdccNU=;
        b=o8L1GxXyKfR87RFB6PpSg3q2iSSr2qJR6iAuj7bpwbdiH+BcgMw8y/nA76gcfikCrE
         E4Hji+NlpBmHy3U7f+sx7VoM13UhMLerDOf1NVULAOcbK+W326JU5frM03Vu8bVmH7/2
         xI3zkpHKDEJ7x5sHG3Yq+0YclxgnOvJkhZTdHnUuhxvmk/qrxZ5O5HvtduMs6h4NpiEk
         7MT16ofsGxsSQGV+Lx1QrqXr3LI9BMIO7/Zgp4L8KIHZNW8Xs8zJryaNpwkhcC8pnlly
         z9qpZQrcjleipM7hzpz9MXFovx0tme9IR8aDYP/4eQfY4rnOqrpKMrjrBc5SIwKUpeLS
         CaXQ==
X-Gm-Message-State: AFq9FYIpYQdPk2WdGlLtfU+whS3G1uChPhcrbjfhh2+vMPEihyBaoxOP
	7kZK++tS6qfnMdVbWjXNP9cdADtHNCG7oVrv+6KhdsqoTAG/cx7czE+j
X-Gm-Gg: AYBFou30UnMqpN+h8/yiEJTjWJaZ07HWlBJy65in/O1L5HyGDS+wzUwKz6Gm7cFJHoh
	GDQ1ujKWBlMXy3jFz48ELfgmCsCMRPtu7jeOm/COCvFQqwT8Am9uKFKdcvLTKjtE4T6+OQQls2w
	LH+YMUPEY0UhQk2p//WmRhkjvyuZnzrsMAD22q0NTcz1uxmFuc7o4BdtkBa93GXGGhSiMvyDGgf
	gPHn0GdsGX8dviCHjCzJvvPiU84g3H1tfW7BnGcWtRUAqsHf9WGAMjsHZ3MFYGHb47HYe9+WLrK
	o4LlcfC0K32ZR1Rsywk1so6BZSB7AzkL4akKnmdpNKOPQ4AK33AU7CCqpEzr2iVyXPTiTGCEdHq
	GOfMWC12uPHDJLBTW6L4MBKVhsoktnhCLeN/rdhnJPbS9pet5owHs9AyOwXR1Eo+APTqLQywFPN
	183+P1GzoCVZ+LI86Z6bpQG+zqgvrvNcvd774u9iRjo6eLzJTADEhQddCu9OeNSbQ6qwMsK2Fun
	1YVmfoLrbBXANtjLUt61z2AD/0OkZgojkYr7mvRw/GA4UHKnsW9mGAGGwmeKUfBNZaAnDSqCl7A
	LAfxFg47R/kLQ3ejrq2b+jlAxQRdMOgYQ2g0bg9+bp5w1L6mhgoc3BtMSMf0bV+pe3RcgTGeKnS
	ac/5IVeGkC4qcvugEX3fTsP2ktDfn1Tla63qjb95CwKVUR8Pd6dnUXhYS7Fj/asbzlI1yEuxXPv
	UDnjxCSSdhLEALW7ZkSotJd8ZIs3inibSv6CsJg/NoDQ8MsHETBbQ=
X-Received: by 2002:a05:6820:a65c:10b0:6e2:3d8b:a01c with SMTP id 006d021491bc7-714f24006f7mr112598eaf.19.1793299660372;
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:28 -0600
Subject: [PATCH v5 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-7-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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

Validate the depth before generating the RX trigger table or setting the
transmit load. The quarter-full threshold must be positive and the
FIFO-depth-minus-two threshold must fit in the byte-sized table and RX
trigger API. Report an invalid depth and fail probe instead of generating
zero or truncated thresholds.

Select this setup for the A523 compatible. Derive the transmit load and
RX threshold table from the discovered depth using the common sunxi
helpers. This handles the different FIFO sizes with one compatible and
one receive-trigger mapping.

Like H616, this integration has Allwinner-specific debug-divisor and
RS485 registers overlapping the generic DesignWare feature probes. Use
the common sunxi PIO setup, BUSY-safe integer divisor programming and
software RS485 handling. Keep the APB clock gate enabled during termios
updates with SKIP_SET_RATE.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 3bc6735fc253..2ab91f479fc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -17,6 +17,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -45,6 +46,10 @@
 #define RZN1_UART_xDMACR_8_WORD_BURST	(2 << 1)
 #define RZN1_UART_xDMACR_BLK_SZ(x)	((x) << 3)
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -64,6 +69,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed sunxi FIFO depth; zero selects discovery through FCC */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -729,6 +735,16 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/* The RX trigger table must contain positive, byte-sized thresholds */
+	if (p->fifosize < 4 || p->fifosize - 2 > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -972,6 +988,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -1024,6 +1046,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

