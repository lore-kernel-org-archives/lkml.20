Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792873356;
	b=VsoRjmccKU91Qfe0pWFVkgk7EE7BnjWJwuAcp9QVc6sH8CbhvUzLOxinadctX64Rszm0
	 FhCQcGuiQPhXXZDiRPq+MIDgArceU1J42COltU5yR6t55qRwrfmZfEupOBnCvQ6QXasMV
	 YLEAA8/th0+7PDPX1kaEeGnJCL7a0W1D4//mfgvxRDP5dYLaGHdcm5WjfUWOCA/IAsHbu
	 0r0z107CWXUvpYvaudB6uQkWSx7h/BS2XyKkFt+mvfd5ciYlUvJ8dp7lqee2xO5iDkplv
	 TJJUGnqwDihuIn8w0WPNMHR/TF3N9O4/mDPE3yZZ4Kh9/oWE770cjdzU4rh0UUa1z4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792873356;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
	b=I6cggU/aDyX5rbfawHZrLkRygqSf8MPiY+i/xssw7k3QSUieUOAD8tqlzgNB6CKVg+8t
	 4X+echqUj/Q01VyM8EklMB9qc4OpuhmZSOqz52qMngtyRSPEOEAeh2r+4itdn9nqr3Oxs
	 1C+naNIrHj4Kg7kdfRwPPlIc0Nwg8vO+l9jgpjoX3Jko9xSAyr71G9b5c9Z2kEiRrEJln
	 YGCIgWIyL1GIXO/CcQjGWMgup2q1fETX0b002FJpKxsVpLc4k5xfmiUD1m1Y0iOZxPFK/
	 cuNy0I53a5vopQ+V5lKGZZ0yECPWPeviUhCjyAy6jLR6SixN7tOf/aQnkgY9sjYs8xg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i6G+YSE2;
	arc=none smtp.remote-ip=209.85.167.169
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 378EB606A326
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 20:22:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 378EB606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=i6G+YSE2
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4af173320f9so1141716b6e.2
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792873355; x=1793478155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=i6G+YSE2VtuPXvFmigV45DZZLCH6LB+XkG5kfejVXRhCgum2x/GkbzfSq3f1FtjFLt
         A/k/PV/HiOSWfoX+TuzckdEWAdfd0jVZZtNsWh2nGw2rQTKgHcck3DcZ4viCwL+v1cu6
         Gi3M8ht7pwLkefdSvbUizVO3r2f7Z/u5nJ3Yk29OFmRKrX7N0SkJn/3IsdEwbrssEHXq
         QIpqpkjoLrKmzMntlP34ejWW3qK1f4w8EOtQwvVY5PnhWk+lwGNyPOmoKIt0Ev3xIKUo
         gH7oZmipSqJFMpi/M8iXt+hvhMdkqVRaguhWtx2ptIvEiQ9nL09P4B2dlisWxhpM/dWe
         aS9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792873355; x=1793478155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YTxJJJ8fbTcAU9VqNhqp+UqN8RZ1Zq5MlC0xiBzcrfM=;
        b=JlIypaaHUpmhuTlqhgNcyAyDc0IZH3ce7JN5mkMflVXDs3lbIlCJ2itHZ5Q73bzL3J
         gScSrQsKKsSU8SmqVktYbEHVaxYiFyKdWQ9AoMrt0CUlIcyadtWVxR0ljmtk3l2a/0L+
         WUX+iyZMonGpS2ovKYse4V4raNpMiGBUsVKiW5DeK0we/jiZmdwTyzXmMz+zYZ7v59KZ
         U4Hv2B1vHmT8tZbi1LAjGmezPG4SxRH6p7fDa2ILgTWaxiAbD0VaQg4zaNUQQC2UV9/c
         o8ph1+UDrONCUFmdck/RfGQpPr9+JeZwPYNtMomn9tazx2fmSSa++pC47HGXDBjh33Ga
         8mEw==
X-Gm-Message-State: AFq9FYKQ8T099QE0gSee7SkZE0lVXeT/fJ0eA+uW8UPG+gxSfvpH+n7o
	D/MsWxsXskYF5Hir9l9MbZC6dEj+HdKwHWR57DNC7+TKuKDML3mf2RLS
X-Gm-Gg: AYBFou0TQ4usB6AObE1uJfi4+t1ZXCiSUP8smK4qJD1OAMLryTRJC1woHCQDjrK1iDI
	7TvZjOIrUN0Xy6pm0iA6vHYigWjtutVVZ5v6trywD1tUhhHQonzype/UpRfaEOc0WZrRL7GmOsO
	eVL9SgBr6yRB4ElYmcDMqQ5m37cEd5YXbx1ndmO6Kl/1ILuMm1KwCzS9lTFNvG9nvrlUATmsoGf
	6vSHJZ6NKSI3/GX6R4XFmU1XzJ9qlDDxYdoBV6FzuQRGRkchRYbEQRiwYKMS2UQljT2SJamTcuP
	YoKRU0QDlxbosxuptbvpZJfJ4BQCh09u1k8Yd5VqvMu925o5fUiAo8Tw3a6mF0FgnsZ9KaGspkT
	kVUx3b4HmSjsRtMZLi4T5wfK+4lRqOyddsbaZz3OAZa7wMSjghtAhOGE2dFlVDDcqa61qxH2q6J
	wtKwlhm8VeAVSYCPnSSnccawiNQT6+ECBymYqa8AzrugFfpiBImTymh2Y22hukC5Xc+NC3DFZ5N
	rdldT/78A+PBXlNMD/G8N36ffxt77YGauzN5qdIdu0tpI1CRhtdrLTAOPI/x6Giea0wDEbFbhOE
	TKG24ctViZqmvgN4dSZpVxmE56Mhf/yl8AuOgTwZYJDe+guZtnFO3Nx4wKClHeI3d7GZgtiGHCv
	bhCjzpV6zi7OPzS6VvKJoo6oWUZQYeRfnJAx/2ZhU68mBth0jJrb8mlADQ0215K6attozO2TTMZ
	pOuaS04eSL8JE10rrX64JDmUqR
X-Received: by 2002:a05:6808:1786:b0:4ec:d521:9124 with SMTP id 5614622812f47-55c002e11f9mr2173304b6e.30.1792873355240;
        Sat, 24 Oct 2026 13:22:35 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424775dsm1815063b6e.5.2026.10.24.13.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:22:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 24 Oct 2026 14:22:23 -0600
Subject: [PATCH v3 1/4] serial: 8250_dw: select port setup through platform
 data
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
Message-Id: <20261024-submit-h616-uart-fifo-v1-v3-1-286fc1b8c3c1@gmail.com>
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

Select feature discovery and DMA attachment through a platform-data setup
callback. The generic callback probes the optional registers and attaches
DMA when a FIFO size is available. Integrations with a fixed configuration
can supply their own setup before the port is registered.

Replace skip_autocfg with the Octeon setup selection. On 64-bit builds,
Octeon continues to skip optional-register probing while retaining its DMA
setup; on 32-bit builds it retains the generic setup. Keep generic setup
for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 48 +++++++++++++++++++++++++++++++--------
 1 file changed, 38 insertions(+), 10 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..9c171c5775a6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -64,6 +64,7 @@ struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
 	unsigned int quirks;
+	void (*setup)(struct uart_port *p);
 };
 
 struct dw8250_data {
@@ -76,7 +77,6 @@ struct dw8250_data {
 	struct clk		*pclk;
 	struct reset_control	*rst;
 
-	unsigned int		skip_autocfg:1;
 	unsigned int		uart_16550_compatible:1;
 	unsigned int		in_idle:1;
 
@@ -595,7 +595,6 @@ static void dw8250_quirks(struct uart_port *p, struct dw8250_data *data)
 		p->serial_out = dw8250_serial_outq;
 		p->flags = UPF_SKIP_TEST | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
 		p->type = PORT_OCTEON;
-		data->skip_autocfg = true;
 	}
 #endif
 
@@ -630,6 +629,25 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static void dw8250_setup_dma(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	/* If we have a valid fifosize, try hooking up DMA */
+	if (p->fifosize) {
+		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
+		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
+		up->dma = &data->data.dma;
+	}
+}
+
+static void dw8250_setup(struct uart_port *p)
+{
+	dw8250_setup_port(p);
+	dw8250_setup_dma(p);
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +783,11 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata) {
+		if (data->pdata->setup)
+			data->pdata->setup(p);
+	} else {
+		dw8250_setup(p);
 	}
 
 	data->data.uport = serial8250_register_8250_port(up);
@@ -852,16 +867,23 @@ static _DEFINE_DEV_PM_OPS(dw8250_pm_ops, dw8250_suspend, dw8250_resume,
 
 static const struct dw8250_platform_data dw8250_dw_apb = {
 	.usr_reg = DW_UART_USR,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
 	.quirks = DW_UART_QUIRK_OCTEON,
+#ifdef CONFIG_64BIT
+	.setup = dw8250_setup_dma,
+#else
+	.setup = dw8250_setup,
+#endif
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_ARMADA_38X,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
@@ -876,16 +898,19 @@ static const struct dw8250_platform_data dw8250_renesas_rzn1_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(16),
 	.quirks = DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_skip_set_rate_data = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_intc10ee = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_IER_KICK,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
@@ -895,11 +920,13 @@ static const struct dw8250_platform_data dw8250_ultrarisc_dp1000_data = {
 		     DW_UART_CPR_DMA_EXTRA |
 		     DW_UART_CPR_FIFO_MODE_FROM_SIZE(32),
 	.quirks = DW_UART_QUIRK_CPR_VALUE,
+	.setup = dw8250_setup,
 };
 
 static const struct dw8250_platform_data dw8250_tda54 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_SKIP_EMPTY_FIFO_READ,
+	.setup = dw8250_setup,
 };
 
 static const struct of_device_id dw8250_of_match[] = {
@@ -918,6 +945,7 @@ MODULE_DEVICE_TABLE(of, dw8250_of_match);
 static const struct dw8250_platform_data dw8250_apmc0d08 = {
 	.usr_reg = DW_UART_USR,
 	.quirks = DW_UART_QUIRK_APMC0D08,
+	.setup = dw8250_setup,
 };
 
 static const struct acpi_device_id dw8250_acpi_match[] = {

-- 
2.53.0

