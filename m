Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792790375;
	b=22HmbEtt4Taw9Y9AnYzPX+MibhjZCtmAtOAsP+1tTs2VrbHf5mE0ghMKl73WBoTWPIyQ
	 s5JzK6SbM+ZvFa469lBJB1/t/d84e31BPAd93o4qMlQs5MyUrf04BIez7qySEOYvbWkHm
	 clUIEQDkLg9ZDvNGj2WFkWFUFmGB2rm/GQLK5x257vtgT1GYTSsGNJEKq8eJ1urLHcunP
	 N/9cNiTzL+tgqOYzuWz7tS8l8FbS3XIYa0/lYLzKSGABHmWv4L1FlwF5EtT8kIXStotVe
	 4j7QCjl9to/Uyl4z76mFqxhjsqX73KEA9107Pfg5ZgC88vD2KHju253EzfWJnQA9IZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792790375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
	b=Imw0p7rHHIW/0iGSZDCgEVAg0orcNhhj50deQI9XH4i58ZAa/0sQxtG3tZWlbI5dBBlJ
	 oH3kdmtM+q0qUgzs6GjKSdUmPamNR8BmDtx5XbHB6XapUOflsJ3KesTewCOSJue8HI1KB
	 T5ZoVnRzQuJNvO0ZbTn4YzhtWTXdrpqRfUiKnh1c3Mvp1WBfDSNskuFDlHuvxi1LiWbwu
	 j9sn/s70vqee+2z3M9HlsJdd4q7WBBUaPYmP8BDURkXfUnVBmh1Gg11gQb+99dEMfWOWK
	 IgexHQmYi7Ym2WAggAQI0FEs7GOCEm8IAV7BZKRZfqAORqoVcwqJ7oVB7qkT8H//XgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TsJ2Mksd;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB7B1606A334
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 21:19:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB7B1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=TsJ2Mksd
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-84a248254f4so828212a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 14:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792790374; x=1793395174; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=TsJ2Mksd+js0Hy2jtlqtjZkj4UC0XYxvCsuEIwSxkHz6A9UU1Ml2mxwg53HUv54h0i
         iroMd1Gphyiz98XyRYKNzLMRFqYhPKHoJls/CVNd+cBMh6+uTXFFZKWpfShGNJmJbL/S
         MNLk4AwViT56JR2wHiC7IuVT4T/3NcBR68MhlA3Hp59mFYTJs91El7IXh3nxm/oIMH1p
         sZXRREkstDm3mvbSsQuqMIiknRgjK7GtTPAL0noIgUMjYy5oT6unLxYXYoN9nQTIDlml
         KZml4dxQzLwWOmjhajSEctOC0zDRs2z1J1ppGGh5KXS/DFNXpbGkJNjbYgndUhJA0ZdA
         GaaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792790374; x=1793395174;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KZvQCXE2w8xm1bldONxZAIDkTdJiEoBhQ1VJO1GJj1o=;
        b=Sc7hqIXB7p+/g+VnqIKjzzDb7Ez0jvS7lAe8KkbdrF4A/0YKA0JPYWSLrP5KxgzAPQ
         Am0MSlrYMZrNcxf6Cd/GMT5eNisVbw3YzvSar8MC8cv56JRXzIZS0sc/vSzKnMGi0cso
         tSeMbVefOB/lV0Xd/MwXgt+cE0x1UophdlWhvvO0CuiQ08ZTNZq8CeCkAnDqOi7KP02d
         p60HKUNQWvHWanSUKo7SNA2mPVE75ge/PLeFNLnLCVI1TjlucxC+LNCkGntj6r8xz6lj
         Mz3ur2gjQFYo0cZylmoJSFDgzD4PBrkRvu0jwqdYkLVcCjQ3Th0NS8qJ1CHSabhTnJsr
         I8jg==
X-Gm-Message-State: AFq9FYIMdKKGTFGilYw3ecZXFUj996tCxmcF9YZuVEfCrJph0U/Psnp4
	X6xcGxeZjZ1b53agYglYGWqcUGcD9oj+t9Ys/Aznimx4X8Ibt3Ms+YIX
X-Gm-Gg: AYBFou38FvGol8WCt87FCCGQfxD4MMiiNx9VgcaDW5R126PV4+VhKywhaCjAc+94n4c
	kz2LJKGHf/cNe8nfo0EfgyJjL2DpOXvym2QIMxGzeYJPD09kadVy6oDgs39tq57ANoSvCYC5jJA
	QEiyyoeD8QxSZ0eIkbTq2ul1JUHRqngmUh6uzBvLHFk1KIE20qGvAm0lraXkksvm9B+fo577Jaq
	re/wjtsSNP4F2rpKsZLn3ntXMmo23xJ9XUZ2z7RrOcWed/8b6kQdbmLwoLcCsUY0LcVHhi0ML0V
	3dZQKmw+9xvbNjrrd4kILeKyv35QrdtxWx2R0eby/L9eg+BQX3p5Wk2nM8bEnlqYM4PUZOfkSIo
	Ngf+T9WN8RliAj51Z7yZGaPZ7GT3MWjKSe+8x9GOYwkWqPV+BZOtIT0FOZn4O9GUmmEpDLKuvCz
	D/zjF5WTmCBaloUjtgaZX7y3rjYekwPxmWZhdJ4PYpNv3SVZR3jS+Ga3eDCqvibooLewGTqMADJ
	krxGQdeM9sxr3H7r9P3O+tXQZrzcbJS08IuBukoEzlEyenQ/aXPqIbZRY+NyG9J0aAu2zK4Uy8I
	/9RBus59EHgux2vUTWHjgE2tsShJxeXqYo19kU2oxK4MySNvx+8hdjB45Scox6KOXvBbw8p7Eob
	uKkdSE/MC8YlmhTxU5a/pCc04FOFKmt60xFBUq8PioM7K0Qol9A8qYMpKK8kmIge7sWCTKb8Q1/
	BM8w==
X-Received: by 2002:a05:6830:927:b0:7f8:4ebe:2854 with SMTP id 46e09a7af769-850fb0769c4mr573277a34.4.1792790373894;
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850f8458d8esm565721a34.1.2026.10.23.14.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 14:19:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 23 Oct 2026 15:19:28 -0600
Subject: [PATCH v2 2/3] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261023-submit-h616-uart-fifo-v1-v2-2-af0593504635@gmail.com>
References: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
In-Reply-To: <20261023-submit-h616-uart-fifo-v1-v2-0-af0593504635@gmail.com>
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

Keep PORT_16550A and supply the FIFO size, transmit load and capabilities
when matching the H616 platform data. Provide receive-trigger callbacks
for the documented thresholds of 1, 64, 128 and 254 bytes. The normal
16550A half-full trigger selects 128 bytes on this integration. Serialize
trigger changes with termios and hold a runtime PM reference while
programming FCR, preserving the FIFO contents.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Skip optional-register probing for this fixed configuration. H616 has
debug-divisor and RS485 control registers at the offsets used to detect
DesignWare hardware RS485 and fractional-divisor support. Probing these
offsets writes unrelated registers and can select incompatible callbacks.
Keep the BUSY-safe integer divisor hook and software RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Attach DMA from the fixed configuration before registering the port.
Configure single-byte RX and TX bursts because the peripheral request can
correspond to just one character. The existing startup path requests the
firmware-described channels and falls back to PIO when they are unavailable
or the port is a kernel console.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 87 +++++++++++++++++++++++++++++++++++----
 1 file changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..b9f5cb61f2b6 100644
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
@@ -66,6 +67,11 @@ struct dw8250_platform_data {
 	unsigned int quirks;
 };
 
+static const struct dw8250_platform_data dw8250_h616_data = {
+	.usr_reg = DW_UART_USR,
+	.quirks = DW_UART_QUIRK_SKIP_SET_RATE,
+};
+
 struct dw8250_data {
 	struct dw8250_port_data	data;
 	const struct dw8250_platform_data *pdata;
@@ -630,6 +636,66 @@ static void dw8250_shutdown(struct uart_port *port)
 	d->no_int_count = 0;
 }
 
+static const u8 dw8250_h616_rxtrig_bytes[] = { 1, 64, 128, 254 };
+
+static int dw8250_h616_get_rxtrig(struct uart_port *p)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return dw8250_h616_rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_h616_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int i, ret;
+
+	/* Use the nearest lower threshold, as the generic 8250 implementation does. */
+	for (i = 1; i < ARRAY_SIZE(dw8250_h616_rxtrig_bytes); i++)
+		if (bytes < dw8250_h616_rxtrig_bytes[i])
+			break;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	ret = pm_runtime_resume_and_get(p->dev);
+	if (ret < 0)
+		return ret;
+
+	scoped_guard(uart_port_lock_irqsave, p) {
+		up->fcr &= ~UART_FCR_TRIGGER_MASK;
+		up->fcr |= (i - 1) << UART_FCR_R_TRIG_SHIFT;
+		/* Changing the trigger alone preserves the FIFO contents. */
+		serial_port_out(p, UART_FCR, up->fcr);
+	}
+	pm_runtime_put(p->dev);
+
+	return 0;
+}
+
+static void dw8250_h616_setup(struct uart_8250_port *up, struct dw8250_data *data)
+{
+	struct uart_port *p = &up->port;
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = 256;
+	up->tx_loadsz = 256;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+	p->get_rxtrig = dw8250_h616_get_rxtrig;
+	p->set_rxtrig = dw8250_h616_set_rxtrig;
+	p->rs485_config = serial8250_em485_config;
+	p->rs485_supported = serial8250_em485_supported;
+	up->rs485_start_tx = serial8250_em485_start_tx;
+	up->rs485_stop_tx = serial8250_em485_stop_tx;
+
+	/* A peripheral request can correspond to just one character. */
+	data->data.dma.rxconf.src_maxburst = 1;
+	data->data.dma.txconf.dst_maxburst = 1;
+	up->dma = &data->data.dma;
+}
+
 static int dw8250_probe(struct platform_device *pdev)
 {
 	struct uart_8250_port uart = {}, *up = &uart;
@@ -765,14 +831,18 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	dw8250_setup_dma_filter(p, data);
 
-	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
-
-	/* If we have a valid fifosize, try hooking up DMA */
-	if (p->fifosize) {
-		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
-		data->data.dma.txconf.dst_maxburst = p->fifosize / 4;
-		up->dma = &data->data.dma;
+	if (data->pdata == &dw8250_h616_data) {
+		dw8250_h616_setup(up, data);
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
@@ -904,6 +974,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

