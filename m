Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873360;
	b=VGg6J/1RDYF0IVl+TYfjyQZjkeONuMGdFicQuKCbXqKH8ALdMpKVS/HwN6KJdIBuTiAJ
	 s8tzMr9Mft7yS0kCtrd4KziuTYCiTqeQU9yGS3IOIiatijbIHyjxl+i5OEEwBykjRZFuj
	 d08I1N8ryvPlQBLL2VWtxdv/sYPpWjiMnaVxEHmqk6EqcDQ8b0LjGMOkmM0wHou4CS1uy
	 SPyrIbbZs7zYHpeIWCxwNAe06gKwaFsXWK5LFBomrsoRuPpHQWl+LvbVWpR/6/QjzGpiB
	 7ZmSATCEfFn1vXImLanNDsyRfkmRrpu1qAiprou4v25KWcYG1ukf5u2h0T12LgLgnNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
	b=vBXWG36ODPmvTdAcR9AnEHzddw+mjP8vK4URblavflhBt+xtjt0TuocYzCxrKWih/XjH
	 W8EdEXxmKe/bEnVei4MbjbuBm4hROFytP2M0WUql+J47QISPLTHlhzmTabuEOEfSMSJ+c
	 BMbBQX5ZddkWRMZB0OtQFro7Z+UZ+SyRYH/F2sG8B3sABTqjffBhgVjJBNC+DmV9AQnqD
	 M3aphPcWx59cnR9PNzo0rnR4uxfGmKx4ZT1kYjIdEmVB/zH/vHoT8mN0Xzfg9dJMZ5sE9
	 WyGTc6oj7mmdlwtGVz9mxKrMOKb63pRsk+iaKlMVE1SJOVru/JxWvcqH4h0QOkLfocg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaMzDOtb;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4436A60A261D
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4436A60A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TaMzDOtb
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-823b938464fso1395822a34.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873358; x=1793478158; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=TaMzDOtbipq3H0hMxrTqLEGpvgLxunR40KiGs827LUA4QZZMMUolHwo+b4Fgo1gjoN
         HBYyl7hhKUNJC8hXczwBGPkSvfDuUva7TPoxIlWAY9Fbu9UKBtYr0k1oC7q3hvI+IGyS
         tZex8M27oBhp/SqxZxhUelQ+zdb7oX/tK7enj3VgvblWFCiUVczdOD47tmbfV3Vn+mNu
         c+vLcma9+71iaRPITXF4kraotzk31MUiTxf69nioako7JvHo2dtV+nLqlcsay0FpxSpA
         adOjC1splw50rM1yNvw70nQdwH9pdc5Fii4H6vI4tkRX8YXfk1QpP89JSMdIwFE8RSNr
         ixbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873358; x=1793478158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=quBdTCWmyLOutiiqlKg+zE0eUur6E5vFRS0ZQQJBF/Y=;
        b=K6VoFb3aEpEdpdCoVfRxEy9KZVsAVcZPpn7L8YvdykbyU0xtnMZPKyMni1Zxupow8F
         0Uu2X6G00cLpZRz+20+1FNp1RjKzRIWmjfsg+HPkUSJWKz9zhdgm4jdNoNs/R2nq6Cc0
         BH5FjmdLFF+d/hsgXoovEpGy41dUm7F8Al2B+tCiGnQOnmmRp/yi22r2wZqtEVws4qOl
         1t9Tn/+L+7CQIuS64kwnR/vhSJlzuHnZ5jlMKeSglOrv9LWEnH2UTThlQ1i9Y02q1rGQ
         8QDf4lhwO1ks3NPTynWnRYfd9O1tI0XEcVuncp0qb45+tSnxU8HNVuu3b0q9StpI7bcD
         EIhA==
X-Gm-Message-State: AFq9FYKsKwHTecHQhJMttwUNLPNrmZK+l6kW3D16gosqNKxXJXdLJwS0
	xBo+ILz6PflsjHFy/IZ+lJEWfIC1MJvJBwOAAcj91u65toCJva87pUB2
X-Gm-Gg: AYBFou1eUdo27JOqiHU1xrcqg+DVWJtiFs/U+l5cLjLEz5/53dmW+pm3rwN4LOb/dkW
	Xxvx6H2UECynMyuk6D+kjswlf6yOQ7u8UA78GXTd7iBeyY2QonoWR3wDFuCdqqvBvCd0LfzmOrj
	6eWsWHNBJAvTG/cFRPnqYKYuwAcocNX7yOc9klVUvywCBya2g/HRdVhbP+DR3RoBwzaZ7paxK7t
	jQc7+xuXoh2tMPPfr+reTKeCtbfFC9qM2fnv5URMRwJXXP1Sc+sBbK18csvGT7fDyj7nMR2vGPu
	bm+DPjDCXwPcun7CrHbD+QLtLasIfOQ916kwsiNMpKxZnFfkFLKBQ1WUhHdQVphKo6d5Ak/PBXf
	BF4U/gYUNf7b/FlEv0sUCu3JnORD05hwj25AuXQVNVJPe1Ooh5L003h3mjQBgG+yaujbMzdg7v2
	OKMb2svomzJGwj+73PS8dHkh7hQIFVjbbR+4v7kRmieXGSm8rAiqUZlVgWtXQncXSN1LQINoW1G
	mU/g2a5kQ8zKQxUwuQWBIIMH/Phs4XqjcTD7j6T3sT1IYu1oprtZKepklXPGptybFlrqtJpXMS9
	VK4eIIGBRAglQz2vDl7YD+aza+PopSKbku63EOb4xh5gFy/Qw9Hf66VCJX8Uy4dQyfp5qenvkVw
	RxXfU9wdv4GHHWZUeSK/XEdGZJxPdoGV8tDF2dXHJQNXyV3TOMhQ5d6k9SDyQS9ExyN1e4v1aIe
	8qN5d8bYGVn2Kb28/mLbwFsBHx
X-Received: by 2002:a05:6808:1982:b0:4f4:3790:65fd with SMTP id 5614622812f47-55c002b7e97mr1918256b6e.29.1792873358250;
        Sat, 24 Oct 2026 13:22:38 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:25 -0600
Subject: [PATCH v3 3/4] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-3-286fc1b8c3c1@gmail.com>
References: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
In-Reply-To: <20261024-submit-h616-uart-fifo-v1-v3-0-286fc1b8c3c1@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and preserve the FIFO size read from firmware by
uart_read_port_properties(). Use it for the transmit load and derive the
receive thresholds from the documented 1-byte, quarter-full, half-full
and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128 and 254
bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 75 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9c171c5775a6..557832254c37 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -19,6 +19,7 @@
 #include <linux/io.h>
 #include <linux/lockdep.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
@@ -648,6 +649,73 @@ static void dw8250_setup(struct uart_port *p)
 	dw8250_setup_dma(p);
 }
 
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case 0:
+		return 1;
+	case 1:
+		return p->fifosize / 4;
+	case 2:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_sunxi_rxtrig_bytes(p, UART_FCR_R_TRIG_BITS(up->fcr));
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	unsigned int i;
+	int ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++)
+		if (bytes < dw8250_sunxi_rxtrig_bytes(p, i))
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+	/* Changing the trigger alone preserves the FIFO contents. */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	up->tx_loadsz = p->fifosize;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -870,6 +938,12 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.setup = dw8250_setup,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_h616_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +1005,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

