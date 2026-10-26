Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793030371;
	b=P7iB/ceHC03elWcJzAH7SZUSxWTwHjgPV8wYvn8Cz4w7YrQPNi4h3E6nJyIdRGeDGRqp
	 SATJFgJvNyzC90aL9g6gKKyKSEdyG2dkdmt5AeHRW/pY7iB970OlCNirajXvAjBug3o7t
	 4EsgUa6mJMI2tYSdxAPr2O1ad9+h4P8p0CIfTkenA1QSMydYJJHAfHJ0uRsn+s7664/8/
	 nnDcUByL3PEerNyOMY0teEXnes0Y53p2HsgGlmoNc2ZBq4lRwWcnkjY4T1xa0asz6ZRPT
	 85ZTknudCE7TguP3NdIudzpToIXkr/y/PDmK1U9rQNDhYLvFptSqMDfGoQoU1K0qi8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793030371;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=e98ochL+TXdfYlmwIPCFq67QlaEOT0xXDlADytWKVy4=;
	b=WgyVGaPhAKEuwlZCAmfTFiRw0LYxfMPKeGngZKwX6y6JvbPcjdx3ZG/64/RcG5TvtfjG
	 L/3Dhpt7AJAgZmD3oQtVS2xq1CWkyd1o7Jwk0DUduYhfRqafvjb/1xszcCKzutJevW1sP
	 oZOf170NiaCBGUxleEI0lrDWIVdXUwgk0eQ6wMlyVwh0H3aGhfS9YMt9ZFweyqbvks6+M
	 p7YmLv2/9OBZzEnZE0wGttNueM4lr+5wCvkEWYbhMfS9aMbYFpm8qQVJEC+uV566EAebU
	 YVeq/lom2rQjsfpyK8xrwHjqEpitloe5HOdZoJh8dW8pyLhc6Er9vYTmBxoIGZRf5gA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTH5o0sN;
	arc=none smtp.remote-ip=209.85.160.47
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390B0606A322
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 15:59:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 390B0606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=KTH5o0sN
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-4911df1e196so1564646fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 08:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793030370; x=1793635170; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e98ochL+TXdfYlmwIPCFq67QlaEOT0xXDlADytWKVy4=;
        b=KTH5o0sNl925ss0FIwV3xUH3DYKlR4GR7wR4MWQ/PkcWOUKyBBNnWhOz1ocjVfrWbb
         iLy5cXsy2sthyYlcFRVAQ+at1Va/gV86LSC1k12D0QG7FhuhHkg17MQqCxz0dFPeXxfX
         Mjvlc0Cu1CIRg7WQZSpbgy8a38r38IUJWxl93RgocB/sl7k3xrn9a6RoyIskqb70Cfqu
         lyE18al8g0MwditSAVrppXT0gDy8htiEP/xw3D+Adn30iTnWHwySm0OnvElzvjrG2VIq
         R3jGEgFMgYV0T3tw2jbnWAxDvclXNa3QMCRrjS7Gi+pu95r1wrvmSjpP45pDFxXeK/0b
         4NMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793030370; x=1793635170;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=e98ochL+TXdfYlmwIPCFq67QlaEOT0xXDlADytWKVy4=;
        b=DUVEwP4LMF37EqYI3kiD7HTMUHgYSUb2KpRYbX26iA7vefh5cH4hnDUMAsbWfYPqEH
         LqHh1FIUJueW0ayi3hVOQptYJfW0EqZUZgZOBRNA880YGXsoVhk3s1GtDy9K657nONnI
         deQ7c8FeDv1iBtkPU+6rpRmmQntUNUF9La7ecr8jgUTCRJKyELSSxozhTpc8ZWzEAyEw
         Uil6mdUK5Swq8g4zf0tL66/MnJnaJVikvSPk/APtrkCU6ed4m1KxZLu2A69XdQ0f6pZD
         0JSrivajoSSiCjCCuwIvO8rhDwvPw125acC3vcwJb49OhZWio6d42jiYUqVWTNc0oHwv
         wvQA==
X-Forwarded-Encrypted: i=1; AKwUvByuK/cMlu7llN2WSdBwxVF7s2GoVIflbH/rrkp9gyj7LPVQN4uJ0HUQ4UQwtItVhO4Z2Bi2eXhF+IY7TBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYKT0PrWNQf+l4EjuEXyCWZG4GVSESXnc5dd+bS/OhPSBA1iZir1
	Y8nzsCkalar20ktV7jhCObWZMqZ8/+aOgw3E7ZvK48RUfwWj2oY2NZWj
X-Gm-Gg: AYBFou2fuRc4veUeOqD9svfY8zgPnHzOs6EINwKS2Ld3QFaSWcyErxCW6KrzT8DR/7H
	/ewi8g9btBA7u1+w9EHvb6CFgaoAwVMjDA7NPwEEAy3EUBUfmZ1lTRjQRliObVh6FLX4kd9nDgn
	IasdwwJkE4pUMkYD30UHimL031/g6c/KXjs36KZnX1AVeWGB0WEQSeRF0R1NsxIU4S7c1hPis+v
	RkDfIuPoyXb0f4UYWnKk/jMOcZQsFh7KQf7ScCVVykI/IX6DXZHTHMRCkuzefl2YI2jb8m3dTGB
	50Ob2atqByWKcl+oCJ1Dn+ohceLf2GvCxyWYTrP5hipbh2TK9oMWF6Rf9x/UYfcy0X3d4hsowfm
	xmYzfWE/lEGr5ZwZPBwbZOHfIxr67sLOiGNjTHjQqSYmK7jsOSB+vhEd+z14Kz6q444BLm3294I
	frUUi/9I4x0mqw40fUpXcFj/B8+JoEo3EYgbiCCdJW5BTRKuY9u2feDuKIZkgMzr1OolGBHPW4e
	iI8svJPDbbN81OUuzEO4i6oXuIXBX2JVLKNdY39W9Tj3fDNhcqVj0yjI4sCFs1rX7VEAmxJrpn9
	NsAWvXDrDXugJwlLVEdQYYoFTELCmucLfIKl/LSjUTx36/M2JsZ+E/smoQo1rZC/qpTEVrq/y94
	tK5703OMqpo12OywI0zFkOpbNegvZlCoEK84DM8CnEZqhLQnmlrGzzeKBzwnjEUqL18L+ciStMU
	2pdQ==
X-Received: by 2002:a05:6870:179d:b0:494:b8f4:9a3d with SMTP id 586e51a60fabf-4a83f5d4d98mr4489414fac.40.1793030370021;
        Mon, 26 Oct 2026 08:59:30 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a843231095sm4589608fac.17.2026.10.26.08.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 08:59:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 26 Oct 2026 09:59:10 -0600
Subject: [PATCH v3] serial: 8250_dw: preserve BUSY-safe fractional divisor
 programming
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
Message-Id: <20261026-submit-serial-8250-dw-divisor-v1-v3-1-7dbd194e1f38@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOSw7CMAxEr4KyxpBPgwor7oFY5ONSI9qiJJQi1
 LuTwIYlSPZibM/zPFnEQBjZbvFkAUeKNPRZqOWCudb0JwTyWTPJ5UZwqSDebEcJis1coJaag7+
 Dp2wdAowCdCM29RY916ZmGXMN2ND0fnE4fnRmnNGlwi0X1kQEG0zv2jJK6bHODT1OqaxbimkIj
 3fEURTMH2lyCWgqLX1lrbCi2Z86Q5eVGzpW0ozyG1j9AJQZyJV0RitVK739Bs7z/AIO1wcWUgE
 AAA==
X-Change-ID: 20261023-submit-serial-8250-dw-divisor-v1-5f1689ed05a8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Raul E Rangel <rrangel@chromium.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

dw8250_probe() installs a divisor setter that makes the UART idle and
checks DLAB before writing DLL and DLH. When dw8250_setup_port() detects
fractional-divisor support, it replaces that setter with the library's
callback. The replacement writes DLF and uses serial8250_do_set_divisor(),
bypassing the divisor setter's idle sequence and DLAB readback.

If the LCR update fails to set DLAB, the subsequent divisor writes can
reach TX and IER instead of DLL and DLH.

Expose the library's fractional-divisor calculation and DLF write as
shared helpers. Install the BUSY-safe setter after hardware discovery and
use the shared DLF helper to program the fractional field only after DLAB
has been confirmed, alongside DLL and DLH. Select the shared calculator
when fractional divisors are supported, preserving the core calculation
for integer-only ports. Keep the check for fractional-divisor support in
the shared DLF setter so callers can use it for either kind of port.

Fixes: a7b9ce39fbe4 ("serial: 8250_dw: Ensure BUSY is deasserted")
Cc: stable@vger.kernel.org
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes in v3:
- Move the fractional-divisor support check into the shared DLF setter,
  allowing the BUSY-safe platform setter to call it directly, as requested
  by Ilpo.
- Rebase onto current tty-next.
- Link to v2: https://lore.kernel.org/r/20261024-submit-serial-8250-dw-divisor-v1-v2-1-032ca5338359@gmail.com

Changes in v2:
- Share the fractional-divisor calculation and DLF write through exported
  dwlib helpers, and use them in the platform driver as requested by Andy.
- Select the fractional calculator only when DLF is implemented, preserving
  the existing core calculation for integer-only ports.
- Link to v1: https://lore.kernel.org/r/20261023-submit-serial-8250-dw-divisor-v1-v1-1-f452d4bb1b1f@gmail.com

Previously included in the DMA cancellation series v4:
https://lore.kernel.org/r/20261023-submit-serial-8250-dma-cancel-v1-v4-0-e759de1839de@gmail.com

Changes in DMA cancellation v4:
- Keep DesignWare's BUSY-safe divisor setter after fractional-divisor
  discovery, writing DLF and DLL/DLH only after confirming DLAB.
- Link to v3: https://patch.msgid.link/20261023-submit-serial-8250-dma-cancel-v1-v3-0-d78f9e4c4932@gmail.com
---
 drivers/tty/serial/8250/8250_dw.c    |  7 ++++++-
 drivers/tty/serial/8250/8250_dwlib.c | 20 ++++++++++++++++----
 drivers/tty/serial/8250/8250_dwlib.h |  2 ++
 3 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index eca02e8bd6d1..e823c38d381e 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -201,6 +201,7 @@ static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 	if (!(serial_port_in(p, UART_LCR) & UART_LCR_DLAB))
 		goto idle_failed;
 
+	dw8250_set_divisor_dlf(p, quot_frac);
 	serial_dl_write(up, quot);
 	serial_port_out(p, UART_LCR, up->lcr);
 
@@ -651,7 +652,6 @@ static int dw8250_probe(struct platform_device *pdev)
 
 	p->set_ldisc	= dw8250_set_ldisc;
 	p->set_termios	= dw8250_set_termios;
-	p->set_divisor	= dw8250_set_divisor;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -768,6 +768,11 @@ static int dw8250_probe(struct platform_device *pdev)
 	if (!data->skip_autocfg)
 		dw8250_setup_port(p);
 
+	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
+	if (data->data.dlf_size)
+		p->get_divisor = dw8250_get_divisor_dlf;
+	p->set_divisor = dw8250_set_divisor;
+
 	/* If we have a valid fifosize, try hooking up DMA */
 	if (p->fifosize) {
 		data->data.dma.rxconf.src_maxburst = p->fifosize / 4;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 9bb02a4ab11f..9125ef130a97 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -23,8 +23,8 @@
  * we have: div(F) * (16 * baud) = rem
  * so frac = 2^dlf_size * rem / (16 * baud) = (rem << dlf_size) / (16 * baud)
  */
-static unsigned int dw8250_get_divisor(struct uart_port *p, unsigned int baud,
-				       unsigned int *frac)
+unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud,
+				  unsigned int *frac)
 {
 	unsigned int quot, rem, base_baud = baud * 16;
 	struct dw8250_port_data *d = p->private_data;
@@ -35,11 +35,23 @@ static unsigned int dw8250_get_divisor(struct uart_port *p, unsigned int baud,
 
 	return quot;
 }
+EXPORT_SYMBOL_GPL(dw8250_get_divisor_dlf);
+
+void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac)
+{
+	struct dw8250_port_data *pd = p->private_data;
+
+	if (!pd->dlf_size)
+		return;
+
+	dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
+}
+EXPORT_SYMBOL_GPL(dw8250_set_divisor_dlf);
 
 static void dw8250_set_divisor(struct uart_port *p, unsigned int baud,
 			       unsigned int quot, unsigned int quot_frac)
 {
-	dw8250_writel_ext(p, DW_UART_DLF, quot_frac);
+	dw8250_set_divisor_dlf(p, quot_frac);
 	serial8250_do_set_divisor(p, baud, quot);
 }
 
@@ -217,7 +229,7 @@ void dw8250_setup_port(struct uart_port *p)
 
 	if (reg) {
 		pd->dlf_size = fls(reg);
-		p->get_divisor = dw8250_get_divisor;
+		p->get_divisor = dw8250_get_divisor_dlf;
 		p->set_divisor = dw8250_set_divisor;
 	}
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 39fcb1b323ad..7191cabfb086 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -97,6 +97,8 @@ struct dw8250_port_data {
 	int		srbr;
 };
 
+unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
+void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
 void dw8250_setup_port(struct uart_port *p);
 

---
base-commit: 6b4b543fa18757297ac756a6fe6e64f506b7844a
change-id: 20261023-submit-serial-8250-dw-divisor-v1-5f1689ed05a8

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

