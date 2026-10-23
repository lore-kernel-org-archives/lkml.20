Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740842;
	b=BZGEioEVRq3vBMxvscTIETELNbLISFDqq2pxCdYhp1UB3XvWALZ9wXBFKuQJSwHPtwEl
	 u6dlasTT2nTl1lXfeX4mYUN6A4rINfJ9LRD1vlgbrK+BCc/odzOWkOxwCV0vscVeQaTDI
	 N+0V9nfMPYQTo8GvAYTH3+NGPd7t0QMyStjQZrst5VIgYb/yq/fPU3V+A2phCiN2K4eVu
	 CEQdSAeRrWVYIPUvFoh3byTt+kMhMoL6il8CatYGO+VFlntOrB9BzQOWE8INNxog4d/tO
	 OlA8YOXXMQbzFMWBw/auGWRyNwOZJ3UiR22C5TKWOFKP5Jz5R5dq9LUtnSTVBk3ONzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740842;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=TUS+mnADfjPLb/Tu910BRKa7Osyhu7sawMFZwcFgbOg=;
	b=OGvqCayc6Rf8NMs7AxJQYgmYZi/z/a+cYotBOhSgFxhBJtDtEhJvxjeSZkmVjwCEYVdg
	 E0CzBA4UPqx1EkG2eDuzEBI8nlo7801sVenTx8n917tvJYtlyKR0hJlQZDQHmlA3rzL6R
	 7qfHKQBgbTf+8XOc3ssHhx7I304RQzCZmkA9/FYWK2AzGB5AY2QiaecvYMeBo3m/IpgHk
	 w4QzE8t3g3MBMddfC7gYQyuQD/GY4/D7L7aP6Zwjs0NNWHY8jgBEkxYqk9ijXD1OM1Gf6
	 eHgGECWNf/uJ0H7pVjRpr5MrsqfFz/d3hZ5CZQi0++v+xIJHSDy9uXKVbyvRHz7e+Bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0hjVO3Q;
	arc=none smtp.remote-ip=209.85.167.171
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1F9606A31D
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 07:34:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE1F9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=g0hjVO3Q
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4c5d8c7f326so257218b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 00:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740841; x=1793345641; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TUS+mnADfjPLb/Tu910BRKa7Osyhu7sawMFZwcFgbOg=;
        b=g0hjVO3QRlEkytUg/WED6fxFzaYy0e7PSPTyROBruC3Cmwe3TmyDHzS2ipm+dtAtiZ
         Oc0yWOPHVhuq1EvFGPdw+1CwF5YYfH6bzYtM2s5uS+1qOXam277IbQiHVrTsAyFTbcYk
         9susBeqxDk3tol+9y63mrs34YbVe4bN0uhtTcagv9RpWexPj6jN4cCflzAlzzL7SVrlL
         BgYdswY5ec84rLFpO4+JX/x9+7bCngZR/CMcUS6fRpJgupGMoyy1S+ik26odbwU1CgLs
         h753YgPr5c8WO6gMGU5FoPz3VZBpfmV0emu2LX9sRiF8AWgxHibe0mcRgsQcA1OJgGrO
         2Zkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740841; x=1793345641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TUS+mnADfjPLb/Tu910BRKa7Osyhu7sawMFZwcFgbOg=;
        b=UmcWEEBgbauC29rNXRFh8H4owqlL9EGWcZdA2E0vQhcviEnPcQ2MUlH8WKiLpwJPu+
         UNjA8fj8vRV1slnfO3UcK72vKt/GO1fjw0hG0OdKEszFh25eb5CvAgFhPRXZ/gmdWFcr
         ggoTUFqqlrgUklaY1wFrtw3N9zKl8KrHgGWNwr0OY7j2kSRyxWnkfCD69WnNBA3NLC2Y
         XqTUtiykyKMw5h3ydMWIr7yoZKU/hIGebpdO4jreOKK5HGZLU6qt13km35M16/ofxKES
         +bGLpPmowVe6Zp9aJmjD3iTo85HNlIbXlQm0Bo+2Ia55oqYvOfuDUjSy2pOXDOCPyUXc
         MaTA==
X-Gm-Message-State: AFq9FYJA4NSL6WWLhUZw+2PLgGWPf6hOzu4PzCKvO7SVvMRdH/Cs0m9l
	JAVdM7nyCx360p+IoTer8hyNtsnLn6JwS1ZmJzYSui3gZnP+WcH15IG5
X-Gm-Gg: AYBFou0HZ3VNSZ2NazTtbz5UAG22ClBq/yXYqO0qgcmN7zKAjwdI3ewy0RF6hCuyHfy
	ORQH7KgviQefSWyKYUgbUtf9zJ9LsItXnL69xwSQcNChQIcvVDMqJhqRYy/pyCN/O5wST+tVoO0
	wJrD1dSWvs3TrMQNh7SpJkEZxMT+utslKNZF1VgNNLUNu9pOD9ecGg4QlOve14tEBLWlyuHqrfG
	6PE6y6KFzmHb55rAeOp/9aImXcPfsnZDmzjuy4ZejabzmixnIw6GRaW+laRR+yHu8B8B8tkrwwr
	HTvzcuMSQk9de2WTIzbFstgtTR1PkGB9/0UuGaEiaUGzo9KVxXstgoTPvL6jNPQFPpEwnc8oSQX
	+y0a22qiEYWKhisN88JVynJb/dQwnVbPZy2Qh2vvBvwcHbSXWMYebfCdCpY6+SV7IkNoRoY4cfw
	RARnX97SsmNHQRRzjNchybN6vrRijQi3gBMt0McrifpsF8KnVpbjh4Fphl2v/0iqzk1e+Fiunck
	qvDPfCgsnV+XWYsqQzoPFJdkFlrLf6mnHTQ2xxgP9/StM/zaOxLTjKxoYRoNqh5XvwvpBlGvJIu
	JCcUEWY/R5DvoMzURIEzzAUYwo4AB6dWK4U3Ll2YPIdSLM0eXhuLJ62anVkUlbxOYkGNdGbl/yc
	vuxkUHocGWw0L04nZxeeC0IhY1Z+EcBhemlSholaFqpl3T2xmP9ax01nZBiOrShpbgk7/l0vUbt
	l0bLI=
X-Received: by 2002:a05:6808:6d93:b0:4d6:90f3:74ad with SMTP id 5614622812f47-55be82da8c2mr808701b6e.45.1792740840785;
        Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55be9880a99sm909562b6e.14.2026.10.23.00.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:34:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 01:33:50 -0600
Subject: [PATCH 2/3] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v1-2-e4a3bae2eba8@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v1-0-e4a3bae2eba8@gmail.com>
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
DMA attachment also depends on a FIFO size being available during probe,
so these ports do not reach the existing 8250 DMA path.

Use a fixed port configuration for the H616 compatible, with a 256-byte
transmit load and the documented receive thresholds of 1, 64, 128 and 254
bytes. Select the quarter-full receive trigger by default.

Skip optional-register probing for this fixed configuration. H616 has
debug-divisor and RS485 control registers at the offsets used to detect
DesignWare hardware RS485 and fractional-divisor support. Probing these
offsets writes unrelated registers and can select incompatible callbacks.
Keep the BUSY-safe integer divisor hook and software RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Attach DMA from the fixed configuration before registering the port. The
8250 core installs its FIFO defaults during registration, after the probe's
FIFO-size test. Configure single-byte RX and TX bursts because the
peripheral request can correspond to just one character. The existing
startup path requests the firmware-described channels and falls back to
PIO when they are unavailable or the port is a kernel console.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  1 +
 drivers/tty/serial/8250/8250_dw.c   | 45 +++++++++++++++++++++++++++++++------
 drivers/tty/serial/8250/8250_port.c |  8 +++++++
 3 files changed, 47 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 21ed9c41b751..0f8c1b0b4a71 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -77,6 +77,7 @@ enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
 	UART_PORT_AIROHA_HS		= 125,
+	UART_PORT_DW_APB_256	= 126,
 };
 
 #define UART_CAP_FIFO	BIT(8)	/* UART has FIFO */
diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..f03051740be0 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -63,6 +63,9 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	/* Use a fixed configuration instead of probing optional registers. */
+	unsigned int type;
+	unsigned int dma_maxburst;
 	unsigned int quirks;
 };
 
@@ -630,6 +633,18 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_port_fixed(struct uart_8250_port *up, unsigned int type)
+{
+	struct uart_port *p = &up->port;
+
+	p->type = type;
+	p->flags |= UPF_FIXED_TYPE;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +780,21 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+	if (data->pdata && data->pdata->type) {
+		dw8250_setup_port_fixed(up, data->pdata->type);
+		data->data.dma.rxconf.src_maxburst = data->pdata->dma_maxburst;
+		data->data.dma.txconf.dst_maxburst = data->pdata->dma_maxburst;
 		up->dma = &data->data.dma;
+	} else {
+		if (!data->skip_autocfg)
+			dw8250_setup_port(p);
+
+		/* If we have a valid fifosize, try hooking up DMA */
+		if (p->fifosize) {
+			data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+			data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+			up->dma = &data->data.dma;
+		}
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -854,6 +876,14 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.type = UART_PORT_DW_APB_256,
+	/* A peripheral request can correspond to just one character. */
+	.dma_maxburst = 1,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
@@ -904,6 +934,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index db066a42f61d..e99d35880a68 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -335,6 +335,14 @@ static const struct serial8250_config uart_config[] = {
 		.rxtrig_bytes	= {1, 4},
 		.flags		= UART_CAP_FIFO,
 	},
+	[UART_PORT_DW_APB_256] = {
+		.name		= "DW APB UART 256",
+		.fifo_size	= 256,
+		.tx_loadsz	= 256,
+		.fcr		= UART_FCR_ENABLE_FIFO | UART_FCR_R_TRIG_01,
+		.rxtrig_bytes	= {1, 64, 128, 254},
+		.flags		= UART_CAP_FIFO | UART_CAP_NOTEMT,
+	},
 };
 
 /* Uart divisor latch read */

-- 
2.53.0

