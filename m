Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280404;
	b=ZiKoZgJd6L+MLQQTzRqBY/kburqIW3xXnDlSHuWysEInQ1VCDdVF1eYdNoqU/3UItOJs
	 OZtFrS6ZFzSrMoc5r8t6TE+CjHLUIsPeHDZQfJvHQ8GL1K91KIk4pA2kY6SNJO2fzLyKG
	 rDW8F9p+BnvWsc5U0H8rMoIBosh0X9wa5YZD1BTN7VfiZMdWNfA7bvsj1pam7s9etPM6t
	 7vNPQ+3ainICkAz0SS+inYbLc7qJXyJ2b4xpN1TO7YeFFrpe+8nO92bLrqNL6dQDqgsup
	 X/Bn0cvvyLfHXnHZjgqRrNqilx07A7XqzEz8cTidi9x1Rg3RBQIm75JmvTmNVfldfJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280404;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
	b=H6K4cLyZhhMrLoqYddwGicpMTf80nTxlEoV3CRFlq+HI7C8Dovk1pStpbAFITDN06ZNz
	 Pa+0GVgRNGwX0MYmX/Yr48cY/oB9Vg7aIOaf27eps0lYv3+FbNH+laPWYIQndxJvYsZnn
	 8e9Db9PvSNR7XLaC8n2DSQ+eAz37j5iGkLyyD99QagwVCDTLAfG4dStMtRiGz7DJ3KCFh
	 Wn7E7BPwUSH6yEPwakVwDkcVRlp1KtopTZO0Qq2Pgogd8LgUKcL38NtIylrqzGy/wZ5o9
	 vVTq/HPG82TEzqNKqPcCcm5gC0ztTmb2qDCBW+CTBUCOFqUNb9AauM8rWv549IkxCdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCOnKty6;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C5A60A5BC6
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25C5A60A5BC6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yCOnKty6
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4f14642adb4so872228b6e.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280402; x=1794885202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=yCOnKty6hdBhf+bKkL5BUk4AeE71P+hLnnxhgDgjhgbzFZt1gNESxsxF0nHlGGB5dn
         fwLKAI2QtUQP17yDt/KGUt7s7VbScV/AInTMYFfamgja3mxDzBw4Mz0GoH8+tDY6TFru
         RiWX4RG3was+y4F+Vy44Y/uKO+aRvuR774odk3nPYGOVQBGPotesJqBJl5EDSuw2Jx00
         BDkzibbNnNo8XdEnMh8+V3AOcuXQQ5LbxA72tBgvXsrEwSRxUzLLcQVhUAvEDXLHgbUS
         A3/euxvttq5fY6aU76WwRrOFNVQ5d8VK3iNn/apW+lZXHtbCgOeoWdiy8BuvMCUXVvAb
         bQyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280402; x=1794885202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=OTksTKaYgGOYc/n84NkrHchrwBjTw580OsFYvAPDQfNe9S37G1UhlV0MRr60/XGO56
         M6yAN2EqwZibx9Tp+q8UKrLf3XOTx03QAI72Kt69GQzeerFn9PvzN/pE2hz03NPRTN5j
         4BfgIbbGta+i21sYn0+Jqn3nKrEKngPFAAK3oKyRGauSM4IPJFARaPPsQUPZiIv+5CJN
         mIqk9XAj3OjBIH9Q9DNiM/Gcsc0zPHNcdh/k4VusRovHXTA1uqa9Qrbgw4b3xQ9vrl2R
         p0qc3rTZbHEHuZA+CUv/jAVBS316kinQGEbMGJWZ0HwmYcxw7nO0+vkyjQQFQBJ6UCcO
         V6+w==
X-Gm-Message-State: APuU4Z+IBqAapff6E51lZB/x9fnAb/R5a4K6CLc9WqFEZ+13DBnyQ/64
	0lQlfPCGqDrvFqzs5UXg9+TIiACqZ8ms+pKVYbMkQ+nJILqCIm9xws50
X-Gm-Gg: AYBFou3XCFrwlOjUtpjc/4G+KUYXOlmcnnxGxBvYaFohyipkraT2OJtR+yo1Y6bNBZ7
	4GyGvUNDgRPaqe3tvAx+LMuV4vdHwffY6u85BnaYDh+YEoz2PIYSRKU/drRg9srRsgakYX8zuoi
	NJCxDWyak8+dsxdkLgT4JxBQCInkMzLip0RqJZRUUrAnXta3s3jl4f2AARqrGCIhqdcDgWJnxzu
	03N07hTDQGPM+CRYxRu9ares9fF6dSmMqD0TugLPKt13KzgMP0llD1CmBMSdVffnShCUjRn1Ggl
	EazXwIbBgw8HGxxzN3qjmTm6618bfQ6aNCIxoJ4b20EKjhpW9t5R4fyzM9qO0/IloL/l4P5lMpV
	UZZm9qkNKkwRBOsCq4vEEg3GzGATGWKfZPP9jf8niL60b+f4pWi04TYSixkF0uTmLnyXKvocAYc
	ZJAHr+nsq4S/tc1SAkOFYedgF5qVbFo0mT6amL0vYz/VeHXOYu/unu5BLOi04EO0yIONXj2GZk+
	qAUCSjqq35flVcPj/8j7RpYnA/vCPwrzZfUdmGxZDtEMn7wtl0BQM2WpWNukuTwLvT3wLAWgthV
	drjKfaw6UC2w7zJPaMFhbuocFORtgfRo+jTwJycNz6ij04VHbnid4oKnq5h8xtgIwzejYxa4ape
	E668DeqQ4H88Yft8u/yMu8V0UA5lV6AkFVM8egBjB3zdrT8cp4HvFuYNIdhq+rJ4tIO67BhplZx
	8yp9s1a5rwjAZoTNseVmCthW6t1nzbfXxu4ShEot7YG5HvVCXjGoD3OVw84SDhB1T1kMKI1EIDh
	w==
X-Received: by 2002:a05:6808:1713:b0:510:7dc8:5ff7 with SMTP id 5614622812f47-5683c945eb5mr1088933b6e.19.1794280402120;
        Mon, 09 Nov 2026 19:13:22 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:21 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:57 -0700
Subject: [PATCH v9 08/11] serial: 8250_dw: configure the Allwinner H616
 UART
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-8-3f03961dae8a@gmail.com>
References: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
In-Reply-To: <20261109-submit-h616-uart-fifo-v1-v9-0-3f03961dae8a@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and supply the fixed FIFO depth through platform data.
The 8250 core derives the transmit load from that depth. Use the shared
DesignWare receive-trigger setup to describe the 1, 64, 128 and 254-byte
thresholds, with the normal half-full FCR setting selecting 128 bytes.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE, matching the
DesignWare termios path for hardware CTS handling.

Select this configuration through the platform setup callback. H616
has debug-divisor and RS485 control registers overlapping the optional
DesignWare feature probes. Use the fixed configuration with BUSY-safe
integer divisor programming and software RS485 handling.

Keep the UART clock enabled during termios changes with SKIP_SET_RATE.
Its clock is a gate on the shared APB2 source rather than an independent
baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..a55f60330a51 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -657,6 +658,31 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int ret;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	ret = dw8250_setup_rxtrig(p);
+	if (ret)
+		return ret;
+
+	/* Use software RS485 with the Allwinner register layout */
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	return 0;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -880,6 +906,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.fifo_size = 256,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_sunxi_setup,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -931,6 +964,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

