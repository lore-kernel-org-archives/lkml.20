Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742018;
	b=Vti+UjjuY7ADplJJ0jadm+zHsYqoh/wZA++hEK1X6nUQ3DCRvkAGaDLgw/VrEQpcYCam
	 umK6kALSNtU4FY1GVHSYCbDm/d+dLaX+fMCXCumZzhuGxx4WPlDzkerQT6s8veNe9xkFI
	 HsjcJiSMq+MkpmkHlUwmPwpMIgPpM1LYa3QhAgVPTPOxv+oweYiBwbVOl3v254KRMS1mT
	 cOwaqAN159eERLcT3D7fiimqAYdZvQEbUETW5SRrB5KF6fvBLRaL6Z8cbUe/MZceisW+b
	 YCfrD7X1/o8hZ2saPzY6eDOePH4iAENxfpqtwLIREfKOFDwm944F0HbnplVw4x8sPgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
	b=o95G2R8ip5zZa59EXnA5xh7OKVdmQDsJ5bnJedE3QKFd+66qII/cIhqTwYCPnjmsNMt4
	 bPtZHcYI6GFiCm5Z2mY0JVYRO/I1fwrk/39AtHC4yWgLSL5va8dbckeMuuJfnvvR5Qrru
	 w8BtTaCKYBs7M4YEznVKIjXsO+6+66coat8Cgodm5vwnT2tJqBu+nzbQq8OqWnHdmvTk9
	 IS5lTmAo8Yh5ELYQBD2zR4ZC92ydYycOgTzTImlP/fJngFMXXv3RmXssxnLmLoOghOccv
	 nTwRo7u3NlcEJ9VZy9++C415/+bTRq4mrrwZG0Vv98/0p7XKpocgrKQhBvg0+E+yXig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByDFiXHV;
	arc=none smtp.remote-ip=209.85.167.174
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAE4606D828
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DAE4606D828
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ByDFiXHV
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-53ec9237600so38521b6e.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742012; x=1794346812; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=ByDFiXHVwC84fNnosmmrBEsgMAb7JGd2Rw1dUQWMEBibv04/S7TBJszh2D+GBvnjq8
         hLJjJqS8hSUmq99vQjlYbIk7FHEaOeBdVqx+ZzugbERNMlDlQE4vJd7EbXsoPOM1I5Q/
         SOfd0G5dnm7xKIh8hEI+/m4qyqUWNxrqEBZ3NB3nQIcrrPr9C/rkQVo+T0JCNyfV40p1
         0gnDjXopkTAqxnjppYFBwvKn+84/VN1qLcWzx/9IOLZixJ+xjJnRgG/5LYMy4DlzMI/9
         yT4qVMsFKO9cIJMLMsA2csQpt4GTSRvf7ALP1izGBo5dKFMgypVGu9nazNI5I7Jn1bBc
         mlIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742012; x=1794346812;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JhZegKXTLoM0aFpusHdkE4137WJUIfV1PRTu3QP4cf8=;
        b=aW0a421zDq4WBDkDS1y/VzL9qqDXS4eqijCPdMhsE9x/z83XeaBtQSzDriWrAZZZIG
         E9sg1V56x6D8IurIFBM7kC9Hgbx2oHloiM9wui2/1+HeoJn6vcjuLR/k8z9rz0UxPbqG
         lWcVuMKrdRJRVNheI4a6KWnmtLyuKwaMqon5I7zYrYoXdltaf1VZjJzXYyHSzeyYE08m
         bNKybFYyzJzHSoemQtz8oy1OFrh7b80YMKOMCngYZU+vYnHrsd97fobKKI6AbBHj8kOu
         tdR7PUFyFjNCsDmorTluMzX5/5RdAu+DHbGWd5k0P4xkOTBxgZfpAH8Mq3SRP/+gbUCw
         w93g==
X-Gm-Message-State: APuU4Z93tOLGBp/hP9LuYLGWuES/lEMIOVehhLNexEa5r/9Efx3k+njX
	aDQalIeykgu3yhYsPtK6qzJOeFPyhDsUqK/+9tS2soRptu6WT1n4HF+u
X-Gm-Gg: AYBFou1lpTuG78N8wunLn0R6zjH4fgUj8qmGtSi3ilxd7tUWt825PeRKlMMbTLrHrmC
	swN0fqS2v9lA7pDTldNnZe+spq8+MOL3Qo1QtoDvvEhOjmaRMDz5bezwdJXBNBKML6C8dhbEl3Q
	ctD3rK9NrXpeE83GHsyBejeSr+SWLwVAox0qqR+C8OF9PkfoIyAHnwtEZHK3UbEEYuG9PFXfE6a
	Dbf8R2KapHFJU9NLiTdJ50yofisD2Y9nVGkMsLdfNdDld0XkPX/wdMqxc7xnpVFWGSsF5CwfNQm
	LiE3oizWQ8p4H+Ldp1ccN10hiRrqoEWoqEzKWJpSQAa0/RE+4R+uc4EoYTZKQAPMGTrUmGOiXXR
	2yA9dIERJCTbYrkWiWp3wtPQamrpl4eQPDbcxx7UvuyeyEyju0K7TrE+E/z+VgIse6jVaVkc9nN
	NQkyiYq9jzMkzZRmNTXobXH02jN4u5sw0eCLaAUWDiWVaPdQ0hQ2t6yAv1j5iwG9j5oaRc3+qsb
	N4+acf4iU12jUuKQ4ygmQhrAKc6Xa5Q3b15vFN+DE1lz8IrH5fUpDeMx6Td+6nGyho03GLPO+VV
	wXh/i5GhzhGomWjHYC9YHwyezUnWg+oNeYY3a62JNeJn5/w6PbvxIEpOHDlNXwBdS3lOaqol240
	hnb6PSKts6ftlg2ParFsaJvk2RYnZ/LxgogO3hXT60U7wsRUtVuZ/vPMIr9cZWJvAYJ4TeOtWok
	IaOMmZ5Vh8hihLRmq2T48dX/YZFYns7Tqs058GP0YQx2skHI3U6UVK
X-Received: by 2002:a05:6808:191f:b0:4f4:3790:6615 with SMTP id 5614622812f47-5640deea416mr11125036b6e.11.1793742012357;
        Tue, 03 Nov 2026 13:40:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:11 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:40:00 -0700
Subject: [PATCH v7 07/12] serial: 8250_dw: configure the Allwinner H616
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-7-c9e248d685c1@gmail.com>
References: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
In-Reply-To: <20261103-submit-h616-uart-fifo-v1-v7-0-c9e248d685c1@gmail.com>
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
---
 drivers/tty/serial/8250/8250_dw.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 613907b8a40f..0e7367ba872e 100644
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
@@ -657,6 +658,30 @@ static int dw8250_setup(struct uart_port *p)
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
@@ -880,6 +905,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -931,6 +963,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

