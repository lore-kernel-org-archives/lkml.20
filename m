Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280395;
	b=BMrH4dml7++Ar6Lgm/rYyujIXhCQ5FTzTQWpEB3fML64d6s8Xx8d7A/glo7zAcd1kAso
	 zgXAdUZH1TJAaA0SWSdMT/23v3GfMHlNchWj+ymUuA/xpEXMeqkB+v/C/WSmZf89myutj
	 rY4rsT3jVeDhnvTybEGB61RnTSzlCchyFlONFCXYgq/PIvUiYOIz8qRlQLxn7lDcoXYkZ
	 MXnsJa4damtNEgsD+yXxPpG6fEvudiEbeH9myfQSDQVOoQt97vDkvJE7OfvLEQLsUkhgA
	 Zkj4Ew+sCiIX2V948Ej/SSSNCL5EvNs+l/zBfeWwPW09Q8KAxZ+h1w2XCLiVYl69buw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280395;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
	b=f7/Rn0xvZclKyTKHGQhGnvW4t3Ds77O9t4t5ZVaT25LIxf9SySsUiyZuqLWiGygVA60y
	 s6DmNevGpKf1bsUPXythfK9kmSP8uCkFoyfmQja+J7qIFcn1i2/WGvrxexZqSup7u5zYD
	 reTNxPOrLvpJUV7XcavZ+kxlV8DN9Y8mvCI819HId5Q/BLkOYOlhMwDniTInHBlh0Z5b/
	 XymqZgKz3DEtifg/u9k7K38sKV4txpEcIjlmZ5Bb6o94fH5BfdqMJTj4r5nXMv5b9bant
	 D+9+l2aOLs//Q6ltRZqwhwnE92Om+B/hsF9Icl4jd5ojPWaAfbYi+eo3viXS3fEwa1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKcvETLe;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E604D60A2600
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E604D60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TKcvETLe
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4b28d9537bcso1101308b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280393; x=1794885193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=TKcvETLeC6xPYlP4w6XWNuQkLC3mMyxIu21UmG3PlogpK0vckIq+hJO0JL3E1rsxQj
         Qtpflds+Wz6GD2FKnKMbNTITSPDQrxHnQOqUZrIi7Ohzv923YlM3sDm9fgj4hdOEodST
         glafdD3NEtBZAOgTv1m+d56tF9TvdgPB1w99fMUGkMAJcjU7YIDpx0AT2Grk8HycnfYT
         K5PQTgq3SBY6KQfUAPNZfIammSuBJZlOfCOQWFL3f1e2aFL3yU4UYxQAWyyT29dhisVh
         On2RDgnWyRx93m1S2LT2CeKGsydFcuiGzjY8Z4eceCijd/ppDPUuLAW1+I1Qm/KzKFdr
         yBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280393; x=1794885193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KsGmsSOFoUFqhki7bSOzws9koK/vjaFo7VoIU6A5xpA=;
        b=DQG3N2tMrelRQy13nGoq4PkxO90Fl4wUz33kdMV14UncCZNrGpp/a/sHUy/2eWYWPP
         sWkYDmzXA+IduZO+BSMn7uEm9eCLUmYBwZP6424I3o/YW2ywCSPT+X7r8YNKilx2x2Ol
         mubM07i7s7MGzDEYsT0oAieqEU6RQR7L2R3kmN1gJypPnX3TO392b9OznwSRMZMPLDBi
         GfqLo01csThFbYfJVEGqRrWMoWLjU6KzXdWTj/MkOCF1fRZ+BfYPd4JrupRfNZ00s/1X
         a+5MDEJuAyX2xkyY4X7cZQDrn4Yqa7igT22YBzz3fbJt1jv7uTPsR2fZcZjJ7kMwSC1g
         Bwhg==
X-Gm-Message-State: APuU4Z+Nl1S9gcGeiRhUW+kYakMrsteHua2kgp9EnN0DTQGFxaSjSwhS
	xeO5KF4TWTYdZtA4fV1g1TYPk7+ysJpFNS5HGh9znRkhtOIoatXTkhw3
X-Gm-Gg: AYBFou21SAvLsZBLKWfr+x4BhrhDPkMKcQpvqibLrpKg81BGgJLgzTtD3wwFbt0MKZX
	libWNVlOvaSud4d8zJRIPKaOcj++V15DELohTYwMupT1+24rqa0OVwmHDSxsN0+Ne2ZFR/GL5l4
	KBMHJxj6lYG/wrPXJro+7f2HrUK80D8LQvgbWomvjeJLouLUyeNy4yJ9KSl2yrUyUvIjveoEhL1
	IUKkV8w7NUDPwHojVgtjyrlzHtHM8Csu/ScsPuQM1WwYW5+fKyY6LmStmRrX8hEjecVoYtIpC4N
	Ut4bOHHD1Cj/CvYMR2w3OfO705C4Vuo7QUUM8/GXJx7fSloSU4KZSgsX61onjxt74F4q9K86qkO
	zKEsboIRdLFoA9ag1Bkwvi+BbcQ8gP4sVDf2PYt3z+YYVgPqpgQbMJWYZFucca7oJXD9zM/S4cX
	daG7C5NylbuKaYkLzHvtf1LfmQbjb6OYP8ilLMRFRYHI2il446j/5R+FWHKFK1LWvuKj78hXYRO
	+liTeNZOEFD+TsKLhKDKPknMfgJXSGJQ1mw8/yGcSv3uv/GI2WBQhRQpqupQAspXSi3ySAYMaRl
	R6yBnV7VZrhxdJ4N+YiDYa4zKx6Vf4hVR6RrweXStPz1rSRV3ec8iT9JkK08iAcynK4dDyriBtf
	fVJgVSKrOd6CdosZvruaA9jw/MKbfWYBUEa/gKriuT8uaMSmWCcdCuVbnmB99pAEwBGQMgWD8HE
	PQPZoiFNK5Hl4TFUNcl7IcG9HYu02ML9N4l3289xdnS8dfzECb56+l
X-Received: by 2002:a05:6808:11c8:b0:568:195a:3bb0 with SMTP id 5614622812f47-568812d0fa4mr697292b6e.23.1794280392814;
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:50 -0700
Subject: [PATCH v9 01/11] serial: 8250_dw: allow port setup to report
 errors
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-1-3f03961dae8a@gmail.com>
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

Return a status from dw8250_setup_port() and propagate failures through
the DW and LPSS probe paths before registering the UART. Use the existing
LPSS cleanup path to release board resources and IRQ vectors on failure.

Keep the current setup behavior by returning zero on both successful
paths. This separates error propagation from the configuration validation
that will use it.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/tty/serial/8250/8250_dw.c    | 4 +++-
 drivers/tty/serial/8250/8250_dwlib.c | 6 ++++--
 drivers/tty/serial/8250/8250_dwlib.h | 2 +-
 drivers/tty/serial/8250/8250_lpss.c  | 4 +++-
 4 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 9cbe076463e0..8fffb1f9ab0d 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -766,7 +766,9 @@ static int dw8250_probe(struct platform_device *pdev)
 	dw8250_setup_dma_filter(p, data);
 
 	if (!data->skip_autocfg)
-		dw8250_setup_port(p);
+		err = dw8250_setup_port(p);
+	if (err)
+		return err;
 
 	/* Use the BUSY-safe sequence for both integer and fractional divisors. */
 	p->set_divisor = dw8250_set_divisor;
diff --git a/drivers/tty/serial/8250/8250_dwlib.c b/drivers/tty/serial/8250/8250_dwlib.c
index 91b3607b64e6..4a06dec6e263 100644
--- a/drivers/tty/serial/8250/8250_dwlib.c
+++ b/drivers/tty/serial/8250/8250_dwlib.c
@@ -208,7 +208,7 @@ static const struct serial_rs485 dw8250_rs485_supported = {
 		 SER_RS485_ADDR_DEST,
 };
 
-void dw8250_setup_port(struct uart_port *p)
+int dw8250_setup_port(struct uart_port *p)
 {
 	struct dw8250_port_data *pd = p->private_data;
 	struct uart_8250_port *up = up_to_u8250p(p);
@@ -250,7 +250,7 @@ void dw8250_setup_port(struct uart_port *p)
 		dev_dbg(p->dev, "CPR is not available, using 0x%08x instead\n", reg);
 	}
 	if (!reg)
-		return;
+		return 0;
 
 	/* Select the type based on FIFO */
 	if (reg & DW_UART_CPR_FIFO_MODE) {
@@ -270,5 +270,7 @@ void dw8250_setup_port(struct uart_port *p)
 		pd->srbr = DW_UART_SRBR_0;
 	else
 		pd->srbr = UART_RX;
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(dw8250_setup_port);
diff --git a/drivers/tty/serial/8250/8250_dwlib.h b/drivers/tty/serial/8250/8250_dwlib.h
index 7191cabfb086..4d32651956ab 100644
--- a/drivers/tty/serial/8250/8250_dwlib.h
+++ b/drivers/tty/serial/8250/8250_dwlib.h
@@ -100,7 +100,7 @@ struct dw8250_port_data {
 unsigned int dw8250_get_divisor_dlf(struct uart_port *p, unsigned int baud, unsigned int *frac);
 void dw8250_set_divisor_dlf(struct uart_port *p, unsigned int quot_frac);
 void dw8250_do_set_termios(struct uart_port *p, struct ktermios *termios, const struct ktermios *old);
-void dw8250_setup_port(struct uart_port *p);
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

