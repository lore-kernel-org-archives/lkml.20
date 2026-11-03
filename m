Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742007;
	b=COgnFIuJzcT2qsZpKBkhAEcxT/M/qXGliBMmIzvGTyP+FDzjdQmF4Kcov8V6o5kQlAvX
	 UDWgTcr/E1lrnVkPKXbdNVlSiriRuA4yn23n8xzbPoMfNENV4/FLj4xyUGeAGWsYnCEIl
	 Pv0faJIdTyrhmh/CZ8Ae8AJK46pXuHgokx3s+d3tLJyKcSY5SRtzvgqBt/OD7rkMWWKWT
	 5bTy3dYJQfR010mfdpRQNwbVCKLAsXmKohazYpulNDh3DJLIflaEzh7WF1jqrtmRU7z0U
	 c5J8bq2J+JWbHDnpf1xAw/bGY57ARbySUFYDclEaUh4+iPfpqKvBHQ0thI3gQcpQYnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742007;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
	b=bC4NwGB6o9fJF3NEO+DtCzgJ0G6z2iKAncRnyC9+MpD+I5jovATmT5jeSYZNU304vnXa
	 rBKAB7vx8sJJOWanF5lkGFYsTHwU6NEF/uJVkgJuCEGN66DV01B5UFk74fTGIcpvqypCj
	 5S0Uo4QD1bKBidRJ2x7buy+2YfSLTuLATdrqc+UAnrKGhQg/T9IsRvG9Bvc2Oh9sh8/qS
	 KIbHVgENYmHmhunjpCEUMWC4oKI6yBZ5L48nGtOlTUgmd0vg2DcQrXxoU98LAWSAMxJAW
	 VIDXrNOgiQW/m4DSqHkgHk6oQf9fahOXoI+XVIOH2Ou+Kvi0Go/QrUmZromBPASzqpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re1wsBE3;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0744E606A331
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0744E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=re1wsBE3
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-823e4047037so11444a34.2
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742006; x=1794346806; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=re1wsBE3N5usOw4SMgvBcZi5X1IlLIbBEsqlNIwEN0P8G+Vwv9Og1ZP/8DHVM6Dw8c
         ZT0tNq/mWh57pbDNcekGJPfeOm/FPYxv1GByDUyuTD6z52XTS8DZMD+Y5P3LQ2sRpF4N
         JUUYgq34+HCzgmBek0XQhpin+i8y2TafiKZXhIjZugWmMbpLtL20xkuleuKRYhiazBmY
         AvKP6COJLdHweYkysqw0spaDo2mWsiqKUe1s+RdLFjO7LsbUbTzgKlciA86Q0l9yZxXo
         9NCWj1CAoWYiHx/wLJF2vnupbALRk1dHNrvRjNxNCpTbxYvTI+wSCTIOn1Dvg81Rs6mj
         sT6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742006; x=1794346806;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaGB+sHBwtYVccxB8PUJWA10dOr1SqV2RJG8RV3nZJ8=;
        b=Xzy2y+2D+1JqvD6LGX0awZow8VkeNOilBmeCPvv8eAaLuKbrxSZiIZPPXiKgAPnI7t
         wmetFtLvPOaqDqbl8Wh4Ylj2HyhyRGK0Km/jEQ8ka5ZyvX4TgYcYZhmr+CrOKIoU0XEM
         7BHpSsyi4rf6HJGyc+vX08KTeZfZbi6225VXZ2R0i7oIqK3ov/L2IwpCm6b3bWwoFZid
         kzOUch4zg8PNQ1lOwxdnSfe/UsgoF7X9ejQdXWwIhw5uyzutAydzHo5gsyBe0psL0ftr
         t8vEr1S2YXHw8IeBpJF3nDvuTugRjo3TUKefrO3Wjw3RRvPCOgnlWLbYc542zQZcKwQF
         JaWg==
X-Gm-Message-State: APuU4Z8B4Yq0+kyg3Yai5I7QvPZww+is1yLGn6ZoDSVc8+sBkRBU81ie
	kMxBL1MlX555SJTg4gEYrGSKGtIXogzeUj3jwriGdHdjnMUUJRY7usRz
X-Gm-Gg: AYBFou0Rs2jzP01R1F76aDiGeTiO+wOazUriQOS7/XSdQ/DJ8yFHxQ2G8063coLDLEQ
	XBLjj/wWy3xiFfGKsdkylecLLmPn2PHQSp8HJd3v+mFgzACrTfo9VkmEOBr1BZYlTY0DAvkEMlW
	2BNaHJcgTITrkG9kLwtNVFg8YuDoMy81DwtI1lpCuWRWyb3ZJdiM7dA0cUqxMjDNWxGc8OEO7Pr
	AIb2lZR70AEUfcfTb+Resd0O3uvEolYrkL2SwUk4yQQGgMV4pkIj//bmVwuxUDSRAbaM8s0Xcau
	NCF29++k/fc8YE04+DMy7MsjEuVhhbtLwRc/c8MViwifEcHyGyRHTKqPfEj0TC4WdpAMfFFU9xS
	9M5F2gfKqNnstxF/hm0IsU7eIKhiTIASh88H/TUtHid8D7WW9pNdLFJwk7TpEY9av8QFIoqMPu6
	B9w1uYR0n/Wz39wlGWKArOFxvMPHx6Vx0fnPY0lyxiX5TUkzKAcMg5XHGFKPrlAsytuwfQsv2iS
	jf/ebLOpZBaVWPG9MhT9u6Gm9YM+HqwtX4AWKMljvH0TjjGsbUxQkgHIUPei1oBrLwmT+dpAKFg
	4s5dfzgx/4pAukrtifGlKNU/SnPuj95Q9igQaTWVXprw0qXVI3ocTy/BV0mltY3mrq937jd3zUJ
	WBnef2V/MFQItNF5HTzZhoICp7kURZ0HHj7+VLI5wjgK4whIl/B3pxKVL5I43HKkT5VzeK2SSr+
	mYpGMgkW3y3A4r1Uq9vzewOSHfgghtZd3VargENhlRsRGGGTpewSu0
X-Received: by 2002:a05:6808:1a0f:b0:4cb:26a3:a0dc with SMTP id 5614622812f47-5640deea675mr10671861b6e.20.1793742005972;
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:05 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:54 -0700
Subject: [PATCH v7 01/12] serial: 8250_dw: select port setup through
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-1-c9e248d685c1@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 41 ++++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 11 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..a546cf2de7b6 100644
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
 
@@ -631,6 +630,28 @@ static void dw8250_shutdown(struct uart_port *port)
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
+	dw8250_setup_port(p);
+	return dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,19 +786,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+	if (data->pdata && data->pdata->setup)
+		err = data->pdata->setup(p);
+	else
+		err = dw8250_setup(p);
+	if (err)
+		return err;
 
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
@@ -860,6 +878,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

