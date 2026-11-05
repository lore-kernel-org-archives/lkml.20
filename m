Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911950;
	b=MYttRG83gfCYnw47SefX8NELfzYdvGxp4E1Vra1l4LiSze9t8cKUzWszSUkxuaugAZi4
	 npyRkz/aQFGv3ujcInqYzW+DkkvvX6ipVOmImredVsny/R3hpfeGlkHJFIbcqqbi5bC5f
	 M4pZ+0MMosen+AZU2po4hxsu7OqU3kxajp/snA+B+bwVxy1h8UzZhVQ8rYLuBCCnOaaOv
	 VD/PAonCNi3DLHxrMWzByic8ixoxQwBBTbyHiuuz8S1VM12D5R6riVlvGwDVv0MSoaNil
	 MlGMziSuKsl5FZT/7N+qnWCieYbrELFBi3QekVMMLuwJrLNCy+JaWBKd4GdxnOm3abg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911950;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
	b=n1g/uyr1cwne7AMy6DLquDfHiLOgNR9bVmYZxOz2SLnT99LsHJDxPiZe2xKvnnrNOAYX
	 EhOmYclCPM3Pn6PvxyltTlT+WYiPBFkBygXihx4gmz8ojgHe9hcb2ung+IpJDG5lOUbL3
	 N9KkNw7nt8q6xetoZZYu/zsVrIO8iqXdcg183gzZaF/rAPZiTeKFUoznaSvVuG7sVjLqN
	 7v0mF8Vpq4aysgtYVUaBk2e+aawGsW16D60j3Lhoguc2d4z0whpf17EpsSU75esHyy869
	 Nr4w6/IPN8ZGrJqpshQabIp1K9wIXvo1PfDMvZvILAV2mhQ/pI6RiaqwasbCP+z7ELw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwefDBnx;
	arc=none smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3513606EE90
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3513606EE90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jwefDBnx
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-8446af403b5so1397522a34.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911948; x=1794516748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=jwefDBnxWZ2EcWzrZjbofVUZdtpnorCha8tuj/gnAHs01FEdUqqE3IhNil/liBwLzb
         TdKM87/UfMeyVgPHqyMq6gtZov+tbjV9Sr+B4QmCBlpuSwyuo0Rd9eSXlNwdLZX4N7gn
         ZpXZ/YdPfKwx9YawAYDI8U+0K5+ep8Ce7Dga88rLfslpGOAJ5T95CBumJ664BsoUOCA/
         Vfw/J5MkkCSf6OFdE9aYuRWs0vhTCQBfxlqNio+dEz5vusTQOwAjcSKX0aQ7tPhOJTg0
         HpZyYQgPHN6BfKyFINi7pRzBreGbZThLA3W2SDjdw4P/q7oZVgi1r3l/07wfKR6TGbit
         6uAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911948; x=1794516748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mY44dbM5nzrkV+ospj+zR69jcUle+qy1oJf0Y3qvlKo=;
        b=jsfzUC8B4nTmgsv04G9lIU5dQd6wzGeCZxTzqca1rvRvmiv137W99Ql9gSqjj+tcB4
         vLFyWzJuBHJiawNaSlLebP5LqzhuuLwQbNm6Im0Ff4DvpRvXeEktfXH7Tw6QvitGkrQl
         L1vWaFPJPGb2FTbfC5iL3rd7mQ/nf+Bgu1eFwSqwSV1PfDXvC2RxA2bBjFEzeQDP7JJX
         HoocVZoMwaKgrZbMsWXq1DGfeBa1nMmTXiz2Grfa8Dcw7tabkkyVKYPoZSyFTOHn6m5T
         VY7VLFdQqFb7YibIspW16/3o/pNCIleBoW0oJq9ok5eyRBfwcqN/+FYppmR+338qPzhw
         pt7A==
X-Gm-Message-State: APuU4Z/pVnaGdxUIaUZMAQb7El3nE2pkWg3RbhkEMGoCqNdNJ3SQ/BE8
	PIRHljYmQb0j+PvqEQ7JWKW2zznGN/Ybni7dCu4HHSC68tnmnaa4EJUQ
X-Gm-Gg: AYBFou1aX/IH+cnGQ+wGsQOkE+GNAqRfGN/szP0tZ0oZILm/fbOXJ7A+VZPcgcDEjHg
	2K8pw12EX+SrC0fcE1kZp/N6quKN7YvLj5CFVZxJY9KdBmR80RODzvQiS8hkQHImIOMw5udVALS
	DEhiUWE+p8h08UfVVrhAo0nHwn1MRWz2JVdOAWHBeX+/mDDQ3JWwIAzZJVtwl1DWdahyUmu0TsD
	aeU5lS1fcYRnP3evTc1vAOkOEoQeM0H4TErgjquJ2tIlapYC0VI2uoVcc1zV/1tcydD67nNPR3j
	1P70zDZli0jNHCluRUoCqS8m7u56vpV11V3pC59bnHim9FG65x3rFdeBGwBDKUqIzJqk6xz2gio
	tVHMgShQbpSQ+4uedVBMjHv/XKfjhSFGLHZAjUGFxk8Xj+Zu1bO/ew0seI5OZqlhUGblcDVR1kh
	pJiuC+oREr2A6qhsmJh4Q5RBMjgFupwbhEJ19awcJYqdncaAhF2cr3vuR+Ro8XrF0m8szKH0WZU
	kz7dalka/cP/oJt9W4uNrwyyvDGtKYpLOF3dvCO0T56ufJ84yZ+ihulqvWY763aht4Er5B5Lvyo
	buc2Nv8rPdw4t9z6tdaeafLL3bj+bRBni49pJ4+vj67w/n+RWTzl9QDZtiBWot+CqfrDAPDDXH9
	m8aDZH+7NhtUEqhANgmw/k2ew6cfx5vgHmBLy34ChTckCoru2rQ7t2LfUMjkqoTlm4BfI4r5cPr
	xfjEeBZsk+ZsdLjiEMqbx4XF5JH3TaWNiaozv4nd6sU0jIqgimPo4=
X-Received: by 2002:a05:6830:82ee:b0:830:43b8:72db with SMTP id 46e09a7af769-85f1d0fdec6mr511917a34.24.1793911948501;
        Thu, 05 Nov 2026 12:52:28 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:27 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:09 -0700
Subject: [PATCH v8 08/11] serial: 8250_dw: configure the Allwinner H616
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-8-14024d2b184b@gmail.com>
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

