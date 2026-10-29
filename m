Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299655;
	b=WmMHQciuUFbClYB44OzEk8RqVddVP9IlMkXJ7vuA33sVjZZM+8oninEb49tyXtg00W7J
	 stzFfXlhmyqRoZOttYdQ0h54pZRsX+0Uqtq+gHBm0W5TRRWPL96qNglJcEzvsaS99xBlc
	 LOt8TeAZWR/B5kzy/jwWk09BfnrpGq3nmrGQupWq/0TtaGv3ST5u/IwO/OD5VcAG2AWVk
	 zdbFMUg051Q+HbhsQvV7excjk7KFq5IfnuSuDbZtR0ROktIDCldxrXqgcxpXe1PLPFYp+
	 ORKbNGXXS2smk0gD9QeqwH2IZEpBy2YWkd5g4fZhJ6Sus0rDM6xO3+f/ajSDhjij3TQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
	b=AZniLdogVQmxvOVNe2JyAKLUUc10eTktxXBXTN6rwdbZXYr+L4Obu8UAa+LunxTTLf3e
	 N2qtX3v+59GKYP00DDwiU2nt/mSZzyFPQRyB1pdX6R+kE0Gz3+8Ch+Lax3TRenGg/yeY0
	 1G4qPjJjzB+O6eP6zl53mJDVFIsIR/iWJbMVgmp/jFVjdp8ZtqrFEtc0jQdEhw8HNzlcX
	 GS5aHlO807mAfVmFowIoWHMcdiU9POqJ/76oyCNhHGC+RkAXSKA+xIuD7EGaXBZ8MqDaI
	 cbpxlG8AEpAgkbs2+pkOuWO81qjzsCy6OjXBONb3ugUfHXWyjpA0skuQE6y4Naetzfg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="PrntL/wb";
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE261606A32E
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE261606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PrntL/wb
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7f48c750afcso1685589a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299654; x=1793904454; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=PrntL/wbi1brw1HKp6gJxQtbAx0bEEnqDauGyQJbZfSn3mAaSi7DQlcuRgk3BdxDwU
         eoVmF9SlX8Ee/Ipi7YP1FTMqNGdS/itNatH6jI9MXwMnSF1TzNRWrb1IdyyC2WMp7r5A
         2SXS1UkfApyq5fm9wlS+8GfG9n5erfMRA3AvXzS23TaK284Ky3Ui+IZARjuvM1iNdjzz
         ducrZ9o84pldeK+KxCabfZL8KBYO3ciVE6DgI1V489wdx8hTa9EEKXaFn6glJmA06Gnk
         5rwp9SZA3X2+FFwS5FNWM2beEbbj5jW8W8ZoKRKuLCGotOKii2MiqLwR56Ci1GkIDdNk
         Qghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299654; x=1793904454;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LR/0qFuwxt+mPuiN/gLTEtrR/SgllBRn6v2o0ijhbhk=;
        b=yfYFg4sJnzARBUWvJsuCXxJOGbDEszbqNFnGEX1VSPjJiItx6j8DrTdaqPUNz3ux82
         Sh07qJPz2YIovot3DH5xSYUI+FYKoruJSpaORtuBLdL0KqdXiiZRNz///0JFglnSotkZ
         QeNY0YyHGgqs4BsPElMFKI1qyKERTLnIhiLZc/u0AI1td/UTlDlOFo17F2yZMjAARDsT
         oERxz4gwNKKHPYJwjEfoRsZgZI/FLtXzsE2YNQKSgAWoADqeYljBycDUjRhqiDvisREt
         ZUlSi8sBa0MyebOPq/xYxV1ssFv5uvrcKRlZW3ylBAqiUQWkuq1k5Kx4Qg8ky6JzlsoI
         3qJw==
X-Gm-Message-State: AFq9FYLAfQGXs334U1beHhj1DZ+LHZfBZo3C0pggU+yGwOfkTmvwtcRs
	tDwd5Y55N9G88kc6WecQ7jVpos5of8Me5NssbTTltcCMKBeCKaAhjCTC
X-Gm-Gg: AYBFou0L/oaJb9BNE9GBxl+pqL2k7IZ53a30pktNk1UrBCxnpg2wp8+GhbH1eazDHSA
	jTO6dnmwvRBmYVFvjOVGCdrfjPD1gaSNxZHuobQxymNTyS+TszjgyJrf9DVdQfTwI+yWrO1Vz8G
	cvCfpDEI58zeotp5twcjBqfj04nUjy/o+F0ouGUOo25hdejqzDw1lI2PuJLJ4n61JOLh+5l8jqb
	EMJLiarC/HLGnY/a/eF2Lzzl5cMFGIRJtNjgtQWDShwd6OnKjR1HkVRufQ1/ILRODWC8SVl/mvZ
	yL3nn70mjVJBwKRDs9xm5QsN057Sh6X+/ckkabVqhElTO3hxeTx6+4l+2fj+bMm+MXutsHnBuqU
	Wp7Cht4F/OXTbL09QqKIjGakQekyneFC/1LX+03lA3Fa5R4381UrePjkxET7EmThHYse977u0AX
	29/aNW4kbJ2swR7anBerYI2cp94lzH5WJtWvBnohtZRcp/umJwTkef5BCCEfIYXGJjFkhbl8R8F
	ZCH+mR856qTw82vrEqsLFX32wWBghmNBNg3xuGywvRkGn9LSF5gNemByqTV4++chZC18EO7wWi8
	JvDC+rs7WJbXU81xEopL5ynikKuegW07LCA0oloOWYkz6h7AlKJxVCXeEOoybhDjsUVYQf/YaaC
	rh5aAV8w4gfTiJg5jr6AEXp4dXPn59HyDWAMjeu1ddlx15pZF/Oja1l0ohG7TY64gToG0dtZcgv
	8uIgK4ZMhhBup1N0SHac/668cJs61UoLIhMh08dBvdbbYqvPJPWxk=
X-Received: by 2002:a05:6830:43a6:b0:821:a0a4:5016 with SMTP id 46e09a7af769-85d364068famr49875a34.18.1793299653520;
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:22 -0600
Subject: [PATCH v5 1/8] serial: 8250_dw: select port setup through platform
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-1-53b433aebbf8@gmail.com>
References: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
In-Reply-To: <20261029-submit-h616-uart-fifo-v1-v5-0-53b433aebbf8@gmail.com>
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
platform and continues to skip optional-register probing while retaining
its DMA setup. Select the DMA setup helper directly for this integration.
Keep generic setup for devices without matched platform data as well.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
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

