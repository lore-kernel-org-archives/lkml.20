Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649334;
	b=pLYCuOl2q02elYuDU6u6fEygknDsVpPuwYKZr8GWx6Ttdq2GxtKC1KMreZ+YSsw4ASXl
	 aFLy/tUyAWai1bI2bujRkaxtICWbZ0wX1dnlGYBEZgEnmxsJjdfl+Plq2ub8jwh60XOaQ
	 DB5pR3JiXYmcIoLq3KNjCX5Y/0Muxfz5+G8bCDSeISVRKWif+c0iCgPuqHxGrQEbYI1JE
	 Uwmpvmh8fh5tTB+GIM5XR5SNdkzrvZZCjsBRTzY68qJ5NmYwJzasGxZkZyzTR8Jf2vrdz
	 yHiGvMAiEHaVm2jUJpfey5og86qY08iXV2kDPtP2+X1IWKWz2h3ljefOMWNGpoUr4JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649334;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
	b=cRa/wW1EDnJGnCuk9lseVCXENkPlzrn3El/Rem6tOlqmWhZHynRV0vx9WKXIua2aeVGl
	 QbwPRWwM84Jhgts+oZBFQAULuokriNB/zZZsCXXMUFjJGhkQcwfyCxJ3IvKivSb8Pot+P
	 Vxi2z1fRjCiQTcBDm9gLODMg4+QxQ9yV2tZNlSgkaIALBHIQopeQpBKzoEy1jFZDQ9Jya
	 lu/UhkK7kE67rZSwt5hZV/XmxlwZxtzoR5eK/MPFE679Py5dTjDq6dqZW41JbYXW6wSj0
	 kiDTF+g+QD7NyqgIIQbaVH/2l7QmyRqdX/JzvPL9cmtsfJcsjbGQ8goizqCTgW/QwWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nb6C05qj;
	arc=none smtp.remote-ip=209.85.160.44
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 916146082BF2
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 916146082BF2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nb6C05qj
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-43bf9548df4so3294340fac.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793649332; x=1794254132; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
        b=nb6C05qj2M4+itQdUJAgVD62ghE2eo0BrcoO7Jqp1tkJeppZkEgcNfivCA5KfljGFQ
         g9SOl7nbLfee9oFjYMJQcXvORREV9TeTujgfe6eUSJq1ql1OoQBYb2kmMCyLl/DgLmJV
         BIDr2E1sa8iB2RnxJQYqHaCo5CsaznmDASCH8q26EfigIfD4TdSDefSE+HnGTnLB/n5n
         Ozrqk9keTyEGweXxHnltuBx7eRInPqQ65UTssGev2UAAlz9f/dAO/MU8vWj0m/SBuyj1
         k0+xfSG7688BVwWzjiaCgfINS8V5OxvTLtWd14q3y2gO4uGOfKPQl6gDAWgQlQN7oEm4
         AJRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793649332; x=1794254132;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e5pG2x2D0CE8fAouwsfujGjEJUqfkPlGvTlxhvkEIu4=;
        b=jM6kIkKRrwwf3icaKYSkxqjo8qsQVNvtCc1PjvdenpyQ+/N5Sys7IvTzJVQzeIqD57
         bn9YJFwOSHQn60k3Vs79v46fll9IfI4W2XLG95wcM41osOMEspym0D9eGH6un+GHT5Dx
         CTQDVcRH3rL+nJG4C5OnsMFKPkoArW4e/hVnf4P8Jbb0ALwwN0lgSzsT++2x9E6zC0qO
         0cAUEt8NSHMIi+uDSxE8dELnR8+48RkJ4NhmtQOPtY9/BnnrpQV7/pdvf7lIHHRDddGj
         qZ46U2vMC8oWiPgFJVLGMa2uKzzQmKvGZVSC8aCHr9rLImDeDeqmKypRKo9EUnqCGXwY
         dtjA==
X-Gm-Message-State: AFq9FYKSE5mxhBWdx6YREyETA/Z3gFKeY5QaqcwGE8YYfhq/fomNhDmA
	MSE5mxxu1KtIWrnebLX0tNcciXBrm4eycbvOtrxI0OKPo2ueMP1b0EhU
X-Gm-Gg: AYBFou3nb9JfgwbYeSaCCwcDx2WOX9YkM9WbYFq00EaowBflT4ZNh3ahxbQQnlcuPhf
	Kx6GaP4q1tO7bu+Ws1tdA8F3o3tqYVBctBSDOMqmrHJgTO53w2JNtttmVPHSqQl2Ggl7tlUkEIN
	/GwZZ3fdlKD+C+8pkBY/Y3RsvK9aXp2E83dyXTzO3SM19ojB1lKo0zovOiO2vWl0T2rERz9A0PB
	Pca+WKWAj7XucY5eks1yRCv8wFWRJwAFUTd+zBO4tfLH7UQweW23QKfvTRn7aTuaY5F/8YRnhUx
	97mx3jwAE5MREEwNaQuzAtynOxWtCdXjqWVOGFE7mV+rqzpj/21HR/UuTMt+cf57sf0AyS4w2ks
	JZyvoWN3guh2s7iLn71dIhRf52pvADUdHmRn9uokg0n7Qg2vSHtR+VCVP1D7scLJPPaUUmHT+Tr
	Ly0X383wbCGCg1x2EieXZoTsJItuWMFXRJ4Ww/dwFHvYsxTZw7c/HTHt8uvsRavGKSzZQ/7A6fk
	kN+YGJw6mZeQndJYUTxpY+rtS7rYmVs4HksQ/m7hPXPR1qFGF1PINNKevsda9CPuAbZxeiUqw7U
	km1qdo1PsyA15SZvV/fro/yej7m347pZwXvteo24Ip1lbSLwqF6jxe+IJT1crDdmOAoSVqq9BIo
	hx6A9+WcamXWiXSugWrUhTQkCb7XiDA63wa2rFeGsbm1AfFZuqsqOlnKaMcZHPtau51RsK++Dr8
	G8ol2owN49XvaCBz5Zc4+jDtvphmt52dYOzsyNk7RZVVIzKXUbl94=
X-Received: by 2002:a05:6870:960e:b0:48f:e21d:1a30 with SMTP id 586e51a60fabf-4a9078421f2mr5974885fac.59.1793649332410;
        Mon, 02 Nov 2026 11:55:32 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a921353dcfsm7809249fac.0.2026.11.02.11.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:55:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 02 Nov 2026 12:55:22 -0700
Subject: [PATCH v6 7/8] serial: 8250_dw: discover Allwinner A523 FIFO
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
Message-Id: <20261102-submit-h616-uart-fifo-v1-v6-7-25afcb346b0c@gmail.com>
References: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
In-Reply-To: <20261102-submit-h616-uart-fifo-v1-v6-0-25afcb346b0c@gmail.com>
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
zero or truncated thresholds. This bound follows the current 8250
table and callback types, not a hardware FIFO-capacity limit; support
for larger thresholds would require widening that interface.

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
 drivers/tty/serial/8250/8250_dw.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 0b0156464af6..0ed50d9515e7 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -18,6 +18,7 @@
 #include <linux/device.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/limits.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
@@ -51,6 +52,10 @@
 #define SUNXI_UART_RXTRIG_HALF_DIV	2
 #define SUNXI_UART_RXTRIG_FULL_MARGIN	2
 
+/* Allwinner FIFO Clock Control register */
+#define SUNXI_UART_FCC			0xf0
+#define SUNXI_UART_FCC_FIFO_DEPTH		GENMASK(31, 8)
+
 /* Quirks */
 #define DW_UART_QUIRK_OCTEON		BIT(0)
 #define DW_UART_QUIRK_ARMADA_38X	BIT(1)
@@ -70,6 +75,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Fixed FIFO depth; zero selects discovery during setup */
 	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
@@ -735,6 +741,20 @@ static int dw8250_sunxi_setup(struct uart_port *p)
 	p->type = PORT_16550A;
 	p->flags |= UPF_FIXED_TYPE;
 	p->fifosize = data->pdata->fifo_size;
+	if (!p->fifosize) {
+		u32 fcc = dw8250_readl_ext(p, SUNXI_UART_FCC);
+
+		p->fifosize = FIELD_GET(SUNXI_UART_FCC_FIFO_DEPTH, fcc);
+	}
+	/*
+	 * The byte-sized 8250 RX trigger interface requires positive,
+	 * representable thresholds. Larger thresholds require widening it.
+	 */
+	if (p->fifosize < SUNXI_UART_RXTRIG_QUARTER_DIV ||
+	    p->fifosize - SUNXI_UART_RXTRIG_FULL_MARGIN > U8_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
 	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
 
 	dw8250_sunxi_setup_rxtrig(p);
@@ -978,6 +998,12 @@ static const struct dw8250_platform_data dw8250_h616_data = {
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
@@ -1030,6 +1056,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
 	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
+	{ .compatible = "allwinner,sun55i-a523-uart", .data = &dw8250_a523_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

