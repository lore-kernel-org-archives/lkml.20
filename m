Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280395;
	b=0I9twjNV1KDoP6UPIj4fsvAESdjkEwLDQh/c4g6WxH118rUB+KT+9hf/yn1tj6P/GRWe
	 29bU6F9DiqwgFS84cDNXnixXIJ3gbF0QUpk875d6YNhbzESI1AdWbPfJcU1JCewEo0TVt
	 KGCoF0RnR41rM8Htnh+Fg3IqYTaPpCShC+w1U398WteQk2uVt07rNhWWcHqxRDE8qzSFU
	 is/NfCZHZEDR+j93wliHrgd8QZHxQ4TegK6HoZbx9jmRXvAPMX3EWJYeivOIauvrf2rAi
	 CY2ajX6LL0GSAfsIhYnAMhUvFUlw3HoDNjEsDb6vE+0D0e1nK5LAmBfEJxyfthYu/+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
	b=H8nXRC0t2/MzF1DWcB7q5RvLfzMh42fCMbJp6eRGje3H0WAzHgr0QfGl7T1yqD1DB9zy
	 XXsCu0s5unrSp2wX2cjTj/A3OtsT6ORkph1lbq1SC8OoaEdLw1RRGV1+9QCvQpd+U2yjo
	 w75ckWLWaHuqdp+hBDpZT4Ahtwn+MHbgxmYEqnkqOPVurakvq46Qc2eUYY/kL4T7YqDh9
	 1Zg+YSh7PYdjwumn5kidk+eYPHVq4OYFSEhOtSo+xIsyZQ3m1qrLajDUXs69Q2v0jQBT6
	 tN+5itaAhCq+F+eLIjNpm0fjQMYAQahQ9/52qcwO9yS3Vvz7nzvTe1P68bOFr3bVUHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ak6nt5+A;
	arc=none smtp.remote-ip=209.85.167.172
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3893A606A325
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3893A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ak6nt5+A
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-4f699fe49b3so1065704b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280394; x=1794885194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
        b=Ak6nt5+AewXo3FJpZYvivbdaaM6+fol5MdoV77DpuAE2/zg4IMV42y6ryL696mF/JV
         YTyKHB5IUwwQRImzNd0BvUqfyZLQaadSFNLMofL41HmBza83a9eOI04DQSBp3tUiHQ+s
         1ohz9lHJ+qvZK57w+sQTPLJNYGj8hlMde12X0aID8lQ85/a8m1D9Ru+0iqgJ/sKn0vO4
         bZ23nOFOZnC6uk93+Q/3i+OQuMyJLPBqHOefSeEg9AiCy5DTtdq46BfVWVGWpehVMDR5
         wEWNVWV600N94l6KtZEtGcEXYIq0wjlxM4eFrNOaDjHcEzja/UPQZoln3SWYcJM0KNHN
         /6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280394; x=1794885194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7aXPSFORx9h5Qfn55QWDlYJPN2WJIsHxPzHhos4jn0=;
        b=iK+Z1xDZ0DWvy9xcxqI5Y+lw7KFRt8599erKQ18i+7u26T5ic9sjGgddPRppMjU7tN
         gUFCk8KL20XhwLyvRw2rh91YU4MwuWPRTNROBFY+8bUok+M4eoNDO8iHNQeIl9VXl0jF
         DVJryawbC6/ydLkG2Vf6Od9KYu1z03xRqbTSKqhZRZD1zuYzITdKPy+BIhcwHpBllMzS
         TrMM8h8H360ZllSIASXJd4YBAayLoAURgJk/6DpEGdxu8gmbzOfS+G66TNyCrVGBLvJ7
         OG/jm/xfPjaYzHPWeffni8Y0Qkr4BvGl0sKyBWlUqWy67ipw9FJzHNzEtIrmABqkoT9W
         MNXg==
X-Gm-Message-State: APuU4Z92ZXBjqGHoiqbMzGT2+uDcTL6BpgcfF3K3JeMf1dyWglX7cU+c
	HE7yaMj5AqD+8JmlXeNwVspR9GXQzsRyS9VUgAveIipCx4P6y+j+6FYamNXg28xL
X-Gm-Gg: AYBFou1/mpQ8ltJqplNsA+TOeW2Mmevl4bm+/eD3eL4c8ZLQ71kFjqHJhBnHHXWb7Es
	L3jdk0hhTWzO+JgaGHsNCjBaLWAV60ae07pU37vT5SxqP0gjQyIr0JALzAOmeCbwlo14WqlqstT
	2IohgobKgNhraL5MLkAj5h2tEHDYeCZQgTv9vx0OBQePPAX6rMm80E7L9yRcdTeFq1Sq+8iVDyR
	dg7QQa+1lGsNzjS9wuWh2ghzU0Uv7xYnHjQUZfaQ6WIdbfKcr6LzQgJ7brhergbfuQOb8fZkvui
	zts2DDLq1tQ9saVPsj2hpaezoOT++2iOrJFnUwrQ34VbcpbqiwpLsdh5Knb9XIOibnNJepodeLi
	ZOpQgeigo4jDGloL+8aP0woz7WA8TBS9uLaYQMYWBLpx1T4GGCqGbyZTvs6tg3gBep33r56XzXp
	5MBoF6qPiML/QuU1ZSnAI4W6gpu+r27boj/FAdAYFh/DZeQxbvavLc3y9WIy275u05KfnmWXCuF
	+W+vch+K5yAm2droxCqv8wJFOQWXpC6gc21iC9r5gctE36RMoXcaw74GFRcOr9Ub1iF0DwOL+qu
	lRbwtPL5XBX5wuMTkqnhphy9MWmTUh396q1Rc5ONuiwIFjQuixeLo5QmFQ4ILsbWGf8MqCBZig6
	usBox91p2+hhT/x0ptIjDfXC3rnDB/NNLZJ9F10MMyA43Yw0NzrRNDcY8I+KmMo7ZWt69RNWZzY
	OsghOYeeRxmnlGcs0AekwvueiLvBLH74nc4yQ8+aJTLXREzTM2rEPV
X-Received: by 2002:a05:6808:1810:b0:568:e5e:8058 with SMTP id 5614622812f47-5683cbec0aemr1136816b6e.19.1794280394206;
        Mon, 09 Nov 2026 19:13:14 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:13 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:51 -0700
Subject: [PATCH v9 02/11] serial: 8250_dw: select port setup through
 platform data
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-2-3f03961dae8a@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered. Allow setup to
return an error so integrations can reject invalid configuration before
registration.

Replace skip_autocfg with the Octeon setup selection. Octeon is a 64-bit
platform and continues to skip optional-register probing while preserving
its existing conditional DMA attachment. Select the DMA setup helper
directly for this integration. Keep generic setup for devices without
matched platform data as well.

Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c | 44 +++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 8fffb1f9ab0d..613907b8a40f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	int (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -596,7 +596,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -631,6 +630,33 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static int dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* DMA setup requires a FIFO */
+	if (!p->fifosize)
+		return 0;
+
+	data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+	data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	up->dma = &data->data.dma;
+
+	return 0;
+}
+
+static int dw8250_setup(struct uart_port *p)
+{
+	int ret;
+
+	ret = dw8250_setup_port(p);
+	if (ret)
+		return ret;
+
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,21 +791,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		err = dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
 	if (err)
 		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
 
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
-	}
-
 	data->data.uport = serial8250_register_8250_port(up);
 	if (IS_ERR(data->data.uport))
 		return PTR_ERR(data->data.uport);
@@ -862,6 +883,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

