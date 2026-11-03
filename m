Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742012;
	b=c4czREIIjquFAuFo8Je82yMdMvoXDQ4hHPS5T9MFmBNtJPxq7eHuh9jGwtEQY2gvHek7
	 s6Dzr+LRRoc5vqc2ACT69BMvJiRUPJ+ZUFBvrzQoR6sV5qhKiO4eVm70hal2HNRAhYG2R
	 g34IxvDkWW4upuwa9mU6gZUiyvkabNmE6SaIqQ25PXqMW6aamBhAADvHcAk+7s00naLUd
	 snbCxz8E+FKWpOqbxGzh6OpxjdwgII5EhWIhhR447A7z3y1hXaNRnaCr1Z7ut1Cc0/WyN
	 NPoFE7l3WZOPrmFOiRARHg+h78l9sxaPU7WUiy2GGPcc7uCOtF8qEkYAtSFX8UuVoyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=MGRVzz2uqo92qo+Znv2w+QUjl1qrr60r4fm0Dgku23s=;
	b=WgzMoTt5On3UP8J5S+kg5fckjHby+AtvgWc+zixLKPZ1D02Obl0PwmWvHvfCYnl5KJ+w
	 W23GjQxkHSiMGe/Is6AoIVieCJwuSVhPAXi5kcjQp0qCYuBvCxwwpMFI4DxWYe8DUffK1
	 G7sD3w4792DSRhNXk80gws5e3pYV6eVO3YfN8wIzNypOmZ444oVAUqbe9+0FjlPPpInmz
	 eHXIPTiLz2C4uBtWvTw+kt40sRXG2O80PMIEW3TU8RnRmiDf1K97E4qhkpW6DEKkd5sAt
	 HTpI5x2mFvzKkQ3Eo4nvMyR2lrLYaO6E6Zy97QdOc9BFmfwr9tpe9KmZkcDC0+sjTJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3v3hjD1;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6363C606D815
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 21:40:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6363C606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3v3hjD1
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-843b6f8e2c7so29920a34.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 13:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793742010; x=1794346810; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGRVzz2uqo92qo+Znv2w+QUjl1qrr60r4fm0Dgku23s=;
        b=y3v3hjD1XzAFYTAfi+0WOVq42OSXGUDjEIEYenAjIMaVTS2JmOcNB6oL73hf7MguIa
         9UZtJrUPJu/fSMbUqR2kJTQTYxp4aePMM8UBmruWv9f8h6LmS79CIok/8FyEtDWYAzcC
         W8euaucAEZq1vtaTsaIe3m1PfrsCWrgpcOV5nolM0Iwh9uYAg6fgY8M/Tnz4kOT9/bqH
         cmUaEH99TnywiYK0mHcsnzLqMfA4QmzizejAbrK5nzch/P7+H3wSc4GgHd9EMvUJSX7q
         Diu9SQvQAKeFjn1VUxmf0UHieSGaaM8Yu6jwZwdIAFi6q/ZbVAf7hh+764qBa1PFu54a
         wLoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742010; x=1794346810;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGRVzz2uqo92qo+Znv2w+QUjl1qrr60r4fm0Dgku23s=;
        b=2ghQgrz9mB7Ox/lv/NvpHa7Fovfo1vLC+L6c2Y3jiAJ10a3hDYcYv4kfFS+coU8iup
         SCeLtya+upHupYiV1OwZfSA6WDpw7CUpGhzQv+gD8KwgxeFIOGW8g6ZUWJ56LJ5w/nvu
         RrynA/z8XTq1e4QyIqLl5KL5tkDgJZwTx3ShTUwt6t1Pm1hyI83cGnb1MUCo4StwBOwz
         eO0twUxYC66J4dT067sDwTTdmuCUg4eN/wcuIYNYZKAZsV7iMKlsmXVTQyFO8k7CsLum
         EGc0pA1gteKIe3dwlBJzXG9CJM0GJ0KKPYJ+FKgBbw65Ip1s/72itx+cyKwM3NndqtM8
         hX1w==
X-Gm-Message-State: APuU4Z+wrbdxXhCUyZgguJaSWqYLBI24Zyn6Y07xd2VIlHnZYB0UXRQ1
	NWbybUt3Dwmx2huiwAlsQhUC1jeEiMSQPx5b8Phz4rDYg36RWtuaW95r
X-Gm-Gg: AYBFou1Q70pBeSL2sRB2fpjxFXdml+9CMVhABXdQbqvrxqI4HK+Nu9oWKXm8Wc7Yrvy
	HtO+mpVWNcAYelNgWTAjM3x+e9rK4tGpqQPD7UNtPjAPVeLn6W7X5JE9SZAarSFsAekJwmcseqR
	xCg+0a9aTh3gpO35wtvc9QjSG5OfuhxdUkNzSkqZBqbObiYioMiYmgS8oVYghnV+yWb82wXbWsZ
	hO8kkaSdtGsFysmLmbJk0D5rCrpR1T5Le8ozyQ74F6lPHobLRF0ZiVHQezMFuGIlCPnAhDBF5or
	eXyShfOfAp9NYrh3ZU1OA+wWzdDJY2BbeEx6ikPkIx8MmIZ7HpIhcyKEaBF4OCO5PhyQ+dWIKG3
	qk9SRu+pENSNtHQdnk8bt4ru2a8vXdtAyF7wHC3L/wiEJGrFckOrbufGzzoEF1YoWsiflfV9uND
	ohaQNgO1kTv5kjUC0eLySTxvo4FcgUqzmi6hTz/LU2NAG68yLzTGW+HbULdPnyFXAzSpCD1TQHA
	+Z2wiNtLT/irup01kI0z1mql6EuodEALsirpuR48EDu/zzUhmwetSS5fxsDm1If7iUG7n45ba1H
	kaXWNmtdOaCj7jIqg9m8VjNOv2Thi3C84QScrSxBZ51bbGi5QmRSdPVFxA2kz6CUXd29z0Abgur
	5/Pg2fn9UaNPt4Agr+G2D4L8ZVvmvoA67GXAkqxgwjUINUuxr/5AFaYew67UIlv6L0lkcvfTkg1
	d5rSeVLEhjPbQoWdLwHaGxy24dKvQToa/6IFYyZrbAD/w6yVOsv14X
X-Received: by 2002:a05:6808:4fce:b0:4d6:9222:99f7 with SMTP id 5614622812f47-5640dde6011mr10618870b6e.55.1793742010259;
        Tue, 03 Nov 2026 13:40:10 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9115csm27060b6e.11.2026.11.03.13.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:40:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 03 Nov 2026 14:39:58 -0700
Subject: [PATCH v7 05/12] serial: 8250_dw: derive RX trigger thresholds
 from the FIFO depth
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
Message-Id: <20261103-submit-h616-uart-fifo-v1-v7-5-c9e248d685c1@gmail.com>
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

DW_apb_uart uses receive thresholds of one byte, one quarter full,
one half full and two bytes below full. The generic 16550A table describes
these encodings only for a 16-byte FIFO. For example, the half-full setting
on a 64-byte DW FIFO is reported as eight bytes instead of 32, and a sysfs
request for 32 bytes selects the 62-byte encoding.

Build a per-port threshold table from the discovered FIFO depth in dwlib
and install receive-trigger callbacks for CPR-described FIFOs, including
LPSS ports. Keep the setup helper available to integrations which obtain
the depth without probing the optional DW registers. Validate that each
threshold is positive and representable before constructing the table.

Serialize FCR updates with termios and the port lock, acquire a runtime PM
reference before accessing the device, and propagate resume errors without
changing the shadow or hardware. Update only the trigger field so changing
the threshold preserves the FIFO contents.

The FCR mapping is documented in the DW_apb_uart databook, section 6,
FIFO Control Register. The existing default FCR encoding is unchanged.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c    |  7 ++-
 drivers/tty/serial/8250/8250_dwlib.c | 94 +++++++++++++++++++++++++++++++++++-
 drivers/tty/serial/8250/8250_dwlib.h |  4 +-
 drivers/tty/serial/8250/8250_lpss.c  |  4 +-
 4 files changed, 104 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a546cf2de7b6..613907b8a40f 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -648,7 +648,12 @@ static int dw8250_setup_dma(struct uart_port *p)
 
 static int dw8250_setup(struct uart_port *p)
 {
-	dw8250_setup_port(p);
+	int ret;
+
+	ret = dw8250_setup_port(p);
+	if (ret)
+		return ret;
+
 	return dw8250_setup_dma(p);
 }
 
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..004817cc8f28 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -1,18 +1,27 @@
 // SPDX-License-Identifier: GPL-2.0+
 /* Synopsys DesignWare 8250 library. */
 
+#include <linux/array_size.h>
 #include <linux/bitops.h>
 #include <linux/bitfield.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/kernel.h>
+#include <linux/limits.h>
 #include <linux/math.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/serial_8250.h>
 #include <linux/serial_core.h>
 
 #include "8250_dwlib.h"
 
+/* DesignWare FIFO-relative receive thresholds */
+#define DW_UART_RXTRIG_QUARTER_DIV	4
+#define DW_UART_RXTRIG_HALF_DIV		2
+#define DW_UART_RXTRIG_FULL_MARGIN	2
+
 /*
  * divisor = div(I) + div(F)
  * "I" means integer, "F" means fractional
@@ -208,11 +217,86 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+/* The trigger is the masked FCR receive trigger field, in register position */
+static unsigned int dw8250_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / DW_UART_RXTRIG_QUARTER_DIV;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / DW_UART_RXTRIG_HALF_DIV;
+	default:
+		return p->fifosize - DW_UART_RXTRIG_FULL_MARGIN;
+	}
+}
+
+static int dw8250_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_port_data *pd = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return pd->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_set_rxtrig(struct uart_port *p, u16 bytes)
+{
+	struct dw8250_port_data *pd = p->private_data;
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(pd->rxtrig_bytes, bytes);
+	if (fcr < 0)
+		return fcr;
+
+	guard(mutex)(&p->state->port.mutex);
+
+	PM_RUNTIME_ACQUIRE_IF_ENABLED(p->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	guard(uart_port_lock_irqsave)(p);
+
+	up->fcr &= ~UART_FCR_TRIGGER_MASK;
+	up->fcr |= fcr;
+	/* Changing the trigger alone preserves the FIFO contents */
+	serial_port_out(p, UART_FCR, up->fcr);
+
+	return 0;
+}
+
+int dw8250_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_port_data *pd = p->private_data;
+
+	/* Each FIFO-relative threshold must be positive and fit in the table */
+	if (p->fifosize < DW_UART_RXTRIG_QUARTER_DIV ||
+	    p->fifosize - DW_UART_RXTRIG_FULL_MARGIN > U16_MAX)
+		return dev_err_probe(p->dev, -EINVAL,
+				     "invalid FIFO size %u\n", p->fifosize);
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(pd->rxtrig_bytes); i++) {
+		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
+
+		pd->rxtrig_bytes[i] = dw8250_rxtrig_bytes(p, trigger);
+	}
+	p->get_rxtrig = dw8250_get_rxtrig;
+	p->set_rxtrig = dw8250_set_rxtrig;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(dw8250_setup_rxtrig, "SERIAL_8250");
+
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
 	u32 reg, old_dlf;
+	int ret;
 
 	pd->hw_rs485_support = dw8250_detect_rs485_hw(p);
 	if (pd->hw_rs485_support) {
@@ -250,7 +334,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -258,6 +342,10 @@ void dw8250_setup_port(struct uart_port *p)
 		p->flags |= UPF_FIXED_TYPE;
 		p->fifosize = DW_UART_CPR_FIFO_SIZE(reg);
 		up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT;
+
+		ret = dw8250_setup_rxtrig(p);
+		if (ret)
+			return ret;
 	}
 
 	if (reg & DW_UART_CPR_AFCE_MODE)
@@ -270,5 +358,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..44a5d0c2feba 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -88,6 +88,7 @@ struct dw8250_port_data {
 	/* Hardware configuration */
 	u32			cpr_value;
 	u8			dlf_size;
+	u16			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 
 	/* RS485 variables */
 	bool			hw_rs485_support;
@@ -100,7 +101,8 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
+int dw8250_setup_rxtrig(struct uart_port *p);
+int dw8250_setup_port(struct uart_port *p);
 
 static inline u32 dw8250_readl_ext(struct uart_port *p, int offset)
 {
diff --git a/drivers/tty/serial/8250/8250_lpss.c b/drivers/tty/serial/8250/8250_lpss.c
index f1b4b975571a..7ace0515038e 100644
--- a/drivers/tty/serial/8250/8250_lpss.c
+++ b/drivers/tty/serial/8250/8250_lpss.c
@@ -350,7 +350,9 @@ static int lpss8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	if (ret)
 		return ret;
 
-	dw8250_setup_port(&uart.port);
+	ret = dw8250_setup_port(&uart.port);
+	if (ret)
+		goto err_exit;
 
 	ret = lpss8250_dma_setup(lpss, &uart);
 	if (ret)

-- 
2.53.0

