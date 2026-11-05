Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793911937;
	b=hbL7LHIB0520rEieWFXp2QMz8kkwDXejdmWdXUr7Y/Pm8bAFSZS2va3eHx3pakFIKPIE
	 0P2xDsfeW+sbPhYQmTR47dmedl1eKOHIJzyE3EeWN+XXN55ObIu+mrM2vBqChyEWv2dtM
	 y30bt3Sx/XCTVqbQVHAgFgElHXwvo0X7bDshFuITKKYEOPn9XsvHh1bkG57dfKQy8Azu/
	 mm6A0ggoVndF43M+0zExqWZk9wvpGCJbOeI4LTskjQoJtI3DPsN17dCjOqFFHQ6TqQtYe
	 TU8V3meepw9vxPKCur1BoUTq5DScYWlr9micnutuHQcU06AQxex6PjBBVFkYg/MHcIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793911937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gFXtfo2QF4UuPe88KiYuo+dmf8LupFBJ/LFbUjyQRiE=;
	b=0sUyZ2SFOjt/0HWOOpUc0c+XARjo8Vtfpqov2EfleQVQ1KQJ8NxtEzRZ1+4T6jqb6nFy
	 vUcci5PCEh1bSorclhjET8Jm1Z9PEm7NfO3VL6TX5/iBH20xULKtt75UC9oU9Ratej/N/
	 8ZDOLIR6/nY9/4mpdppy047UnrpydZmej76KvQMA/qNIUGO7Fwk69ntZm9MQrMwawQUiI
	 DbZORpqxLlzwb0ItCmy9ILM5ibmyGUkFUCqWTE6ck+/2slywyYEcrTStWoucK+BBVeIFh
	 8AebzvFRFiErBGfsRwRE719fzwJmzHzw4FnWbxIapig56AWDYI3BZ/0RxyR0PsLWlGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9b5qbJa;
	arc=none smtp.remote-ip=209.85.210.45
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3D2606A332
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 20:52:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D3D2606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=H9b5qbJa
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-843b6f8e2c7so4854a34.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 12:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793911936; x=1794516736; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gFXtfo2QF4UuPe88KiYuo+dmf8LupFBJ/LFbUjyQRiE=;
        b=H9b5qbJaa35DQBCd6+Hj5NIA6huM6pu8Ti8sg7rVVwxbTEjmF0NRZBd4FDlscIVt69
         7naHbg2CwRh1mf9hrRgt9LVtQfH1vAkesHaMnQo0BF2huKXvuxPL8049w4k6q9XGBXB5
         DuJXX5UZ3Axdn8rSwkl9NeaGDOggHEyJoZSWwfB6CJTW9ykUI374de0GRc2ysYPCnZTI
         gjIknLUXyVTINokyJS44MK5WTrsbW5g3a6T1AybqrjdAcBTJik895F0uzUudu5P9q422
         ZPsMZwJiXfm6rxES0VtLKm8Gyd2WeDMvThobMGhLTbniGk4uCH4UyfUqfYODwRsd7SlR
         veAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793911936; x=1794516736;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gFXtfo2QF4UuPe88KiYuo+dmf8LupFBJ/LFbUjyQRiE=;
        b=NK6O8ea/EPxp2uxgaTJJOxxZpPYq1FpGZBUkKH1oq0PmJxDpMIvhC8rli1N5+VxbDa
         VhE5MXwyooCSEDIVlVk9b5LGjcnh8h1ms08zF94YHEb/ZxMJvN6AxORmlqfSL412OYV5
         MQsp1RYAoHOV2So301VdLVajypNeTa5KCJjfWOZY1Z9Oq0ccGJs3hujYv0k1VTSU7U5d
         89VD8rGG8mAgRb/esTkYaMu4y7c/z7O+ieamtRpo2MoDXzth3SY/5rF6UjOnWsNWzTDc
         tPoP7WAFlDmkw1u4TjfA4n6YIHWU80F0LKNs45WLAMy/Sz0fVgPJQs9UMOW+PpkPwo0s
         fxqQ==
X-Gm-Message-State: APuU4Z+6xbM+O913/OD8YXscJo5D1XWRtxdckqjzC/V5iSffek5nYThM
	ZGTOl46XBhAi877Hub1d2HG4pwDLbcp2yFfehBakCxEadT8EJ6B9iGZ6
X-Gm-Gg: AYBFou2cv55KWJAOiEqh9vzD+tmF4O20lPMqLjOynYbJK3WmHTtI8bbpuoH05CI3/W7
	tTIzq/vNhq/Lmz48pnPRbSY8w32LP3NLQ9QCdBRvI0oEH4cNoOC8lM4HbPXsin7lepLh8ToMbVQ
	uBtsKOilQrgJ/N3mp8T1A4s3cY744ZMTl7B4dhfarVnVrhPtoJDRP4ilOdcO4WKDH0bYYeX/2u9
	BJgZrNPisFIiwhFJkLA9E1qlkM1HHywx1dZinaukhbv/At/Wr4nfe3VPATrmTSmNvjF6jDI9CBy
	hvo9VQN3lMv51zpOCWfnynPsto0Y0MGPPUXCtl0AwrJtv4nCUqeEIfCnyiulUesgAM5v/eUuTBY
	RHVd3uw8Rt3Tq8UKxb3PSMMGLju5f19/HSf0ElcPT8b+9qQdM69ySu5eGK+lfQBrAEIme7C2Hqw
	Ydx56jCcoTxp3pqY3k1HaQH6PpSiC6oNdP3nwh4g4hXivBYJSyiuFBwZYJ6WHdCdlSLWd4CeMhI
	zc3xHoBH1eLM9c+lbgSh7uri48XIQ1HwG1kFgkEs9v33TKUlz23k9d1Hf1C5ifMoizO/G7m0R58
	UBAjBz7axtIvv4k8mltYFTxVDIqcOgQFsopIxu/qKyLN1yVYMFyRDKrY3rWKbzGiNEH7on7xRSH
	n/CAPnhv4VeZ+7cqCLJzLpnZYTPluspc91I+EhZsrKKv9ELEVpkC6tOJ8nQaAYkjsUOKEtMuJc9
	1Z8Jb0u+Bv2XPlb2MCPwIx2wuyAVFKBrbbM1pvDpPnPdZAX5lxczE=
X-Received: by 2002:a05:6830:3e03:b0:85e:f25a:7d26 with SMTP id 46e09a7af769-85f1cdfaf90mr603385a34.1.1793911936207;
        Thu, 05 Nov 2026 12:52:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85f1dbb298fsm292276a34.6.2026.11.05.12.52.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:52:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 05 Nov 2026 13:52:03 -0700
Subject: [PATCH v8 02/11] serial: 8250_dw: select port setup through
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
Message-Id: <20261105-submit-h616-uart-fifo-v1-v8-2-14024d2b184b@gmail.com>
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
 drivers/tty/serial/8250/8250_dw.c | 49 ++++++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 80b2b673b422..613907b8a40f 100644
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
@@ -765,22 +791,16 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg) {
-		err = dw8250_setup_port(p);
-		if (err)
-			return err;
-	}
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
@@ -863,6 +883,7 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+	.setup = dw8250_setup_dma,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

