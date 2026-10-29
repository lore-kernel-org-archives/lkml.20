Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793299658;
	b=JacN/HOkYDwGwnykKTLWczyojl6UTj8r2E2RMjwms1UWc2WC0+I3K8vyUY/OHi2hKXXR
	 B1LPeCp4YVNhfZIEvH9Rv6wl5KpWxmUDUAMzxs7qBdM7FR/yZgSL+XeOCGY0L7cyP9V7z
	 OQQYu+JLjzx3hL9WEPXihv7Hlx9DKJp2i/LQwjxp1cXvf008yY7YmAyhwfqwGfZXYw+Co
	 T9rd50ZGLVz8Xgq5vaYhbDuCMi3aSfLzKWhycB8xAvVac4zyVsLGckhTjRedZVwRa/kuM
	 rmtBSDopc5ybLr6ddi94ruP7pV111CW/DYZLL133hKZ2neAfY1ykkOnP3SSGm+pP66Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793299658;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
	b=3B98FWA3keclnpRNAH5wkbPU8gi1CkEWiBLbGj+KEJlakSZIiJVFVWMSQ+FwQXs5tdDU
	 dRUPc0U9tFJJI01jifPsD3vLAIVAHMawBQ4srKTR0vABhZJx5o971ki4C2p2NOjgW67df
	 XFmRRTk074una/+/XAwNWJ7zBw68QEYphQO2nh6pKF3b1ZpIoOJLUNSq7Z+sq7JWA/sFL
	 U8JtMEZ5DBGnJvd0+kk19L8t5iOaF/Caasht9oah948Bf7sv2xrQ6ZOzc512TG1YK97hP
	 QMLPgRGeyfTAPmTqTmiS7VsaeXtMvSEuoxXOK4Y2Id3RoXDM7XXczcfoie8dF/u3WYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhJLO02K;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15BD060A2628
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 18:47:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15BD060A2628
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RhJLO02K
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-83bbcfba0ffso1878940a34.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 11:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793299657; x=1793904457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
        b=RhJLO02KqAq2X4C+m2jKQTW33sGYMCaxn2ckksSM0194F+NsdzbuN04bMKwNTmRtky
         W5E06i/k9Ejsq+UNS8ns0tIMumknZyKU15TbyeKcNcONNVLwnhY2W+HyFog/UdAuI81M
         ILi/TOwoFkcYaOhC3XVKjHCeIfAFwRPpXAayq2CLUmy0F1UrCy+pq9gvDNfN/q3hJQaX
         +FGfhBP0pCWr18WMM+Z4Y0r/owudGS2775USQJzdXY768Uj/W0bCfWENdClTGhQ2Pi5x
         IkW4t35DNsBSdkmowancdsa2mkAGc5CHRSU9lo5PwWPaYTJjIhrFXaXTxYE4g+Y5j/31
         E9vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793299657; x=1793904457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gJAfXaHluwvTpQW+2Z7MBdS0PgqOTRFcNQYFPdMFZbU=;
        b=x88cr2lTDdGhW6v+N3BVBStosOSpkETgKqvN3TzeXGmRevCWXYB4nkexCbxKC6fUhq
         m7/VMOMXLnqKcndxI7lm1ivasj4ex1XnSKHP3UCGtCJ0kbf5bYcoU2+SZqQsRCdgriLx
         wUg2B14gl+fAMbdoYESgNhvaXeSwBNzzZtMHAeX9B59VDKiHmFCIJyMyRqLPWfjqa32G
         YucIdLvH9gBvfQMRpb5YQI9IXowPx0PdmZbz09E5v3UZOBhr54UXoawplCnfyQ/9NOus
         dvty6b4uc4aIdpAVxkF0Skhyq2oe2CoN9a/gy3Rdk5ohjsvOxPDZsme3ckD/GEM0xmmR
         +DkA==
X-Gm-Message-State: AFq9FYJcc+1/3yzgRpMKOkXoQRfoqw99cBLBDixg/0nr2kedc70xk8bU
	vDt8iFsHphlSJksMYaivJdrFKZaBsvMlT7VUn2jxzkoGB3sHTfTADbsv
X-Gm-Gg: AYBFou3M6wqv5QT0hCaKBpO++rMRfG/gz1Eo2RE9M8bT44JEoa+mg/Mbv5G1bKI4izT
	Uh0AhGkSpDfSXtd976EGJh7UUpljzlqr2KG8B4EsOD7sAkeZQxOVFduf0adS7z6C+L4WY6s9npM
	mmtx0wdyTvdJCLDgV0iAL7Xe6J2t4dIRwyUwrBnKJ51GRaX3u6Es2aT2F9UDltfdR3W+7sH7Uhf
	zThyqNpDNnPqdnbD4UZiKwySai2GxWWM++Mty2/RSVpU/cNsfhlrcw/WvaNt9FanRJcvqUpSHsI
	bVSuLJj25PgO0mxjMItjSY4JnkvoCBsBBwxqEBwLDRYUvV6KAly8exgCQgl6Pxr5MYbMc1CYWrW
	FdoJZJZDmxWggV+ZF7gzZcd9FxGPMjdR1xVgiT9v3gsQgo1A+5FSzCwR8KuuaCFZJ0Ux0s9KgMp
	9yQKYwCzhvx1XaPB7Kf5ZoS+EhkljVqSJKnL2sip4kBgOx/vDBbp/q1dvWdze8gydyQBaQjx0Cc
	idgr8AFz+BLfgzzyFanKglYG/9tJFxzB+noji45LkYQwb/Q3e6PPiq0dt3KWDf1Hf3r8bR/Skc+
	OIuGJ5QrW2vvJZYnfTfAxJuXCFRdcEYxDehf89EQFgh4x4ijRZMymPr9k7KQ8w9f6zfK0VBQ5Cx
	3yDBa16Qe44M37LnYuhDJmymO098YgIEG6CSmMehAt271kRF7R4g1K3ab+b1CH1R2eM0OQZ8MYw
	iJGGXuR6z68orXk1Ka3SWMnUNng+53Q0tfoCDhtM+Pvc1MESxqd4k=
X-Received: by 2002:a05:6830:719f:b0:7f6:705b:ffe7 with SMTP id 46e09a7af769-85d3652e99fmr29175a34.14.1793299656954;
        Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d354cfb83sm221871a34.14.2026.10.29.11.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:47:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 29 Oct 2026 12:47:25 -0600
Subject: [PATCH v5 4/8] serial: 8250_dw: configure the Allwinner H616 UART
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
Message-Id: <20261029-submit-h616-uart-fifo-v1-v5-4-53b433aebbf8@gmail.com>
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

H616 has 256-byte transmit and receive FIFOs, but its optional DesignWare
component parameter register reads as zero. Generic 16550 probing leaves
the port using the 16-byte FIFO configuration and its trigger-level table.

Keep PORT_16550A and describe H616's fixed 256-byte FIFO depth in platform
data. Use common Allwinner setup helpers to configure the transmit load
and receive trigger table from that depth.

Derive the receive thresholds from the documented 1-byte, quarter-full,
half-full and FIFO-depth-minus-two mapping. On H616 these are 1, 64, 128
and 254 bytes; the normal 16550A half-full FCR setting selects 128 bytes.

Allwinner encodes these thresholds as fractions of the FIFO depth rather
than fixed byte counts. Building a per-port table from that depth keeps
the mapping in one place for integrations with different FIFO sizes,
including those that report their depth through FCC. It also lets the
shared 8250 conversion helper select the nearest lower threshold for sysfs
writes using the same table as the read callback.

Serialize trigger changes with termios and hold a runtime PM reference
while programming FCR, preserving the FIFO contents. Propagate runtime
resume errors before changing either the FCR shadow or the hardware.

Advertise automatic flow control so CRTSCTS enables MCR.AFCE. The
DesignWare termios path selects hardware CTS handling, so the capability
must be present for the corresponding hardware control to be enabled.

Select the fixed configuration through the platform setup callback.
H616 has debug-divisor and RS485 control registers at the offsets used to
detect DesignWare hardware RS485 and fractional-divisor support. Avoid
those probes and retain the BUSY-safe integer divisor hook and software
RS485 handling.

Use the existing SKIP_SET_RATE quirk to keep the UART clock enabled during
termios changes. Its clock is a gate on the shared APB2 source, rather than
an independent baud-rate generator.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 98 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index a546cf2de7b6..3bc6735fc253 100644
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
@@ -63,6 +64,7 @@
 struct dw8250_platform_data {
 	u8 usr_reg;
 	u32 cpr_value;
+	unsigned int fifo_size;
 	unsigned int quirks;
 	int (*setup)(struct uart_port *p);
 };
@@ -81,6 +83,7 @@ struct dw8250_data {
 	unsigned int		in_idle:1;
 
 	u8			no_int_count;
+	u8			rxtrig_bytes[UART_FCR_R_TRIG_MAX_STATE];
 };
 
 static inline struct dw8250_data *to_dw8250_data(struct dw8250_port_data *data)
@@ -652,6 +655,93 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+/* The trigger is the masked FCR receive trigger field, in register position */
+static unsigned int dw8250_sunxi_rxtrig_bytes(struct uart_port *p, unsigned int trigger)
+{
+	switch (trigger) {
+	case UART_FCR_TRIGGER_1:
+		return 1;
+	case UART_FCR_TRIGGER_4:
+		return p->fifosize / 4;
+	case UART_FCR_TRIGGER_8:
+		return p->fifosize / 2;
+	default:
+		return p->fifosize - 2;
+	}
+}
+
+static int dw8250_sunxi_get_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	guard(uart_port_lock_irqsave)(p);
+
+	return data->rxtrig_bytes[UART_FCR_R_TRIG_BITS(up->fcr)];
+}
+
+static int dw8250_sunxi_set_rxtrig(struct uart_port *p, unsigned char bytes)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+	int fcr, ret;
+
+	fcr = serial8250_bytes_to_fcr(data->rxtrig_bytes, bytes);
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
+static void dw8250_sunxi_setup_rxtrig(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+
+	/* Allwinner RX thresholds differ from the standard 16550A table */
+	for (unsigned int i = 0; i < ARRAY_SIZE(data->rxtrig_bytes); i++) {
+		unsigned int trigger = FIELD_PREP(UART_FCR_TRIGGER_MASK, i);
+
+		data->rxtrig_bytes[i] = dw8250_sunxi_rxtrig_bytes(p, trigger);
+	}
+	p->get_rxtrig = dw8250_sunxi_get_rxtrig;
+	p->set_rxtrig = dw8250_sunxi_set_rxtrig;
+}
+
+static int dw8250_sunxi_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	struct uart_8250_port *up = up_to_u8250p(p);
+
+	p->type = PORT_16550A;
+	p->flags |= UPF_FIXED_TYPE;
+	p->fifosize = data->pdata->fifo_size;
+	up->capabilities = UART_CAP_FIFO | UART_CAP_NOTEMT | UART_CAP_AFE;
+
+	dw8250_sunxi_setup_rxtrig(p);
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
@@ -875,6 +965,13 @@ static const struct dw8250_platform_data dw8250_dw_apb = {
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
@@ -926,6 +1023,7 @@ static const struct dw8250_platform_data dw8250_tda54 = {
 
 static const struct of_device_id dw8250_of_match[] = {
 	{ .compatible = "snps,dw-apb-uart", .data = &dw8250_dw_apb },
+	{ .compatible = "allwinner,sun50i-h616-uart", .data = &dw8250_h616_data },
 	{ .compatible = "cavium,octeon-3860-uart", .data = &dw8250_octeon_3860_data },
 	{ .compatible = "marvell,armada-38x-uart", .data = &dw8250_armada_38x_data },
 	{ .compatible = "renesas,rzn1-uart", .data = &dw8250_renesas_rzn1_data },

-- 
2.53.0

