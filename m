Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280407;
	b=EBwfzgZoj5TvV7jkfbL6ke/YWqbP5wiRvLWnqwrJ6t/Laf6Tnz7z3Iq8Q5NR1GJeFFRS
	 V3NlfE9HQie7v8kxn0fc7zC8GtOTxAI/OpKfxKWLHACabtS9leQ8MfUdiQYrfLvkc/xZB
	 UMHA6onGjqN+mHfzfYf7KYuXnv821HscIbn2mK7ZTr2aiqzMh3vEUJIwxrRuD4c6f5buq
	 pmbBrDlzK47xcBD4Pu68Xzjo7haapW36RnCq6GQxMGhsSN53aPIDc2S01FCZax8Tv/dAv
	 QDH77gd3sHprHbqTmeJAmZNlJbbh9pPHIi0mYOXZqng7Z+pY2vgDTTR8M+tAny5cjPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280407;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
	b=hZjjFQVOeKw3R9Fcej/MsG1K2i8Xg5e1L/NwOgal9N4rGDhgKNRuisKMlZzmquSuCSYw
	 thK72JmGG0TRDWpRaVhSTHDwzJnEwCHLDcUF4AnmAnDRAcCajATqF/SiRyEehtoW3TGpX
	 kQbuoQIipxggjJ5pr2fuR1ajx44vmhxjulKypZuCHgqHqWQ2lcfjrr1jvAyqtgDsrrVUM
	 IiNW11Jo++2+Zj6XVJX59n00vM6try69VupD+0iwcReDyn7CUI1hTk7wm5Zc5twpL0BnK
	 FFdAVPYrD98DNHV2q0vtBV9cDXFZWyoGCZEPhbVKuXt3nDiT+ICZigFjrIV4OXrKewA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROkKaZkM;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4969760A2621
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4969760A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ROkKaZkM
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4adaa0f72abso1134408fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280406; x=1794885206; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=ROkKaZkMWh5d5OvpULRiZEJmYvA+/FdCDQzPNlLL7F7ekMbXbekAgW8jTlvQgY7gOV
         ns/UlBCci8eJ2z569ftVevTJV2To/dboOcyV5EYi/R49d6Z0GddcCYVD4Z6W6WTBU8xa
         LZC6DgxzyhLMxlDdqVoSAtjIee5WIa3Cf5gms86s4bdW6re1B9sAzqlmLm50kJzXsfXJ
         iRQRC1yLwbU6hfmSnwryaQHmhySQlOveZBA+MVg0vorY3bdurElVwgDLvCDk8klkfCPZ
         Fo5WSUVImH0miVWP8Zxbh9FLcG+KMUmGASU5xbODVCqfIK7P0NZt9ecp8Nsk5Lj5A4Lc
         mnsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280406; x=1794885206;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gLp03dCCASGHpzLVyWfgND6QB17hfQHAhLsrbe2Ht9o=;
        b=S+iEjaQF6yRXo/Ez38QqWrZIq2HUuEPdP8PIQDsmC2kz6GxwsmtTnTADFwp71E0iEw
         ryh8cnjdAVt4GAEJcwtW8sk5g18mV9wsjQrH1mMfkUSYvkpiRt8qLFBjbtkaZv7m3oPd
         hRwqfgnHkjWiVCyGNc9x26gVToxYg7uIGYF1awyP9QdeI9JqfmUWWAstHbZpNmSaylWa
         G46HpMWudp5+dCr4X25UnBuQq+n1KcAqqKuc9NgaGY972hj1Qpm4c9yMHmN1moCKozvi
         xClXyZ4AuRlNKdQ/ogKWC9zZR5rHTcIeKTmbSufWkXNA/umWd7HC10PuvpIWelMNuSPv
         iUsA==
X-Gm-Message-State: APuU4Z8B7Kle0UsIj4wBL4G1KRzztg8GjqA1cwLAj3qPf6hqZBqbTIkq
	BH27qnpZKTC15FZM7Cb04mdLwp7O4Af6iv47i9xUgfwCOT/rM3U1lNI9
X-Gm-Gg: AYBFou1OgUUcI9rjskipp5GobZ1L3RrSMh+G6r5mIMGIJv9bolXOP3a/1VwA1do4jKD
	n3bSPJ4cSeOAXX1vj5WvOfgzOHyCjEc7HMfv/r+3wpWSJ03uWeUO2gHyiDJzFlUEPTB1+TDtWWv
	QN2kFkDjdO1I5peX9rFB2eaofAkyoBYyg8F6kwBR1vApreZgWjjPFvsFCu0BOzxWVQY71zaVQJo
	GIx3oJiq8TQ5DSZwNtRN2at8cl1BFvFRCFGqoeWzk9zj0DXJRls3c7+q3OiuUUdHTdariPqqsqD
	onl7WKQ1MIfWh9QzNXlWf7qCVa+sqAnHf3U35Q2KDc763ta1VuQl69YKWjW3sidFAP0wEHAqgoL
	Nqu7esSNWLOgJCpKxs5ZfXYykyEXVH/XKDW1PZiRBGsncMJjwzbLsbIRU8218Ufn2gaRsRNgIsi
	XpY/swqFrZw2/tdj87f1EZRw48hmWZnt5Yc/8OmDdKbULVrmt4ibmWM0CjO0V6/7OIUEHSBfFv/
	GVZj+xbU7BuEFOSw4aCVls643Lz7e0RsJ4cItPDOdCS7RwWLpcHGl7yI0XFyoU3T0Me3fWHRGCz
	aM8Om7pCNpfHke9N+jgpFoxmJ0teNAfeATWlPncDsnWB1WOoNi8FI9BEoKjNxQaUEnor9Lp92Qu
	Ui8VpWHqzyofjZrnA+eqRq8B0AdNmCne4OlXngW+7CwubpJ8PbekvT1oPJJpaqOCX0RZ6dHC0Dk
	4FTKII8rIK/M//e36rXgxG7AyApyu3kVeR5018yO3x3BX0auJ8rRtH
X-Received: by 2002:a05:6808:150d:b0:521:561a:8e8c with SMTP id 5614622812f47-568813057e5mr726068b6e.33.1794280406385;
        Mon, 09 Nov 2026 19:13:26 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:13:00 -0700
Subject: [PATCH v9 11/11] serial: 8250_dw: configure RX trigger thresholds
 for Octeon
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-11-3f03961dae8a@gmail.com>
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

Octeon uses the DesignWare receive-trigger mapping with a 64-byte FIFO,
giving thresholds of 1, 16, 32 and 62 bytes. Its setup bypasses
dw8250_setup_port(), so it does not install the common trigger callbacks.
PORT_OCTEON also has no static trigger table, so rx_trig_bytes is not
exposed.

Supply the fixed depth from platform data when firmware has not provided
one and initialize the common trigger table before port registration.
This makes rx_trig_bytes available while preserving the Octeon port type
and register accessors.

Select DMA before filling in the default depth, as before when the 8250
core supplied that default during registration. Thus the new trigger
setup preserves which ports attach DMA and their existing burst sizes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250_dw.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/8250_dw.c
index 257baab5a3ed..31045128dcc6 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -663,6 +663,21 @@ static int dw8250_setup(struct uart_port *p)
 	return dw8250_setup_dma(p);
 }
 
+static int dw8250_octeon_setup(struct uart_port *p)
+{
+	struct dw8250_data *data = to_dw8250_data(p->private_data);
+	int ret;
+
+	/* Preserve DMA selection before supplying the fixed FIFO depth */
+	ret = dw8250_setup_dma(p);
+	if (ret)
+		return ret;
+
+	p->fifosize = p->fifosize ?: data->pdata->fifo_size;
+
+	return dw8250_setup_rxtrig(p);
+}
+
 static int dw8250_sunxi_setup(struct uart_port *p)
 {
 	struct dw8250_data *data = to_dw8250_data(p->private_data);
@@ -934,8 +949,9 @@ static const struct dw8250_platform_data dw8250_a523_data = {
 
 static const struct dw8250_platform_data dw8250_octeon_3860_data = {
 	.usr_reg = OCTEON_UART_USR,
+	.fifo_size = 64,
 	.quirks = DW_UART_QUIRK_OCTEON,
-	.setup = dw8250_setup_dma,
+	.setup = dw8250_octeon_setup,
 };
 
 static const struct dw8250_platform_data dw8250_armada_38x_data = {

-- 
2.53.0

