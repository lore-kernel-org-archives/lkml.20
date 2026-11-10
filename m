Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794280398;
	b=vlUjDqWW9KHorzF++IIDW5IHnyynu45X+iaN1ZwKUOMulM8F+HeoAPyKufAus8T3Uz6V
	 OSSV03fzZqSZdKlcLAj7FQ5+eGI4HNxDDG1JYcehz6FlMOfOgqyruSqLsinqsaahqWoXN
	 jMdwknWNOJmEkiN1N5NagpnamTmBLkdozO0Ou76P1ctn+ILojbE0E7asrTqff6DaGv28z
	 Id/6aE8D0DZ/qMgEDstf903i6CwFoDHfdqpesjuvb3wAq89MC09/XoIAB4uDQ0ku5ptGL
	 aZpqJDZyQDUad5HFN0OtqVV/tACNC2dYv8w8MmqHQlw0krKANx3wrtkcfyInfNNjYgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794280398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
	b=yl+Jr5R5XQFWH2RAplRvkJJl/zU6IfpXBTid6ws0pGZxPIHLT5IUJEYBLuXHcQH0bTlB
	 oCTHuyxE4HzuIKc+1q4wEOBGR4K7J2VbM+8xFwGtM7N4T0oG9AveNxHzSsvIOtH3n9K5w
	 8fBoO6I0ASF/rDDNY73A21TuzzJUpGFkoAQHGhK7ZscMv1Kv2C5DdVXhaMlpBhAvhNIxP
	 YGblZNeTiz7Q8FRxbTpfOr7tgtTtlqV693/qDYPTVfT5LuBy1W0Fw5l+kuLRGW5HFkP7d
	 XPQKtLFzT0QsASrFiO/erO8sCIurKSOctRuTDxr4tI9wrQBD0spVyDK5WL9izRuh90w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9AqkMxM;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67BA606A321
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 03:13:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D67BA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=A9AqkMxM
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f84a55cc06so914461a34.2
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 19:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794280397; x=1794885197; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=A9AqkMxMK4FPNMW90MZCORCwopA+gopgfmc15klZek3jqQcsXSA2GSwT9kWjmd24eB
         zH25ro0kMNjEWSxesGBg7DobhiU5rTmSOApVldcJNoevOvyAmqhGDXaOjT3wStNPPAQv
         aDlYE+OjKIfMD/TX8CRogMA/dw4BrOogYWwzOU8kB61EzPbLaJNsyupGgYBDklYg5qNX
         F/4Y2MvV79eEk06J2Rm34zhduSKv5Bwff1oXrJhIaJfXF1TXIP+a1d1yAY0NhniVpsdM
         os94y5U8iGreDqoVOUZ8y3+FhygJGv9zalpEXtrd9vwohQkQtGJ3YRBUVw+qAkXKixSH
         gcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794280397; x=1794885197;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wQd2y5d3c9Xle1BZoXd9DRgnl2+Av/870a5uei8ZYeo=;
        b=xik7RdBEZO7h/BOGZR5OGeVTCH2wS2Yai9zqSniKXB/BIO3wrJwtc9RFCSrpj98Cjf
         gj5HTK4DA9fYQL52END+OUNU2u0lXji1Wa0qyaex2I9cdzb/J96cVBrThcUxMgMCE1yg
         OaIZw9h45E/33usH7QEJbqHRqBWvo7d0jzrcF9gDNGt4i7yhvzHljduuRKh+rIC7bxAu
         m0BBgCCNnHEkR0PAfW0a4EZjAdXwQ0oWMNAnc7CxTtEQr/sS3UTxhYnIAZUcT60J+4nY
         Zs9lt/FXWnJ0MU4+WnvlnWCw0fyJsNwCpw/QN7P5a78NuVptylp0IjORsMmCBMVOixFH
         9qkQ==
X-Gm-Message-State: APuU4Z8VBZvjg9OEZc9e2QefGKOB8gX02pM5k+yaPgxGpy5ZXzuHWPFL
	MwSujD2Z8OuKkTU4lu57DNvmyNsTolNOMJ7vniE4YGW6vd2X4MlnBeMF
X-Gm-Gg: AYBFou19OLcZ+bHB+viDNmSewWBMBBP8349P3bDIe0eLOljdf4LcuVfag5gSRDBe06k
	ylWUO+SCKN1rZFxwuWaxFcNMkNBa6DS1oDxbXThmLz/LrCQhe+7MBc3tX/1C7BO8eaFhOFJALmc
	cVO6SUXZwt7pRJ/sgC8nQsbQHK2VteVEEUjemDgi8rQo+6503/8NV9GY2+G93SsjD72yIqbs2Go
	1H017iuP1wS48dYc98127zNQxMv4c/GcDo7S5wFQfbaTpWvTcm4jhkst9gIowtIAYP4n4SlkKps
	bBeM71udGRqzTUiyHBg9bIHFLVWtbMqxJKwBbYjlvOFh0XKC4DW0iu8Id8lAVr+TwCys/De8D94
	UWj29d1EwDbnE9E42JHioL8akjdhyUpi4xSz61I86I8g4g4afNEPzI/09jyPr7VY5mhB7Aj2bfJ
	W/7JfQtiYjVsas5wkkfgnF0vdXW5IvmDSkT0c2iXt7UUQIzgmRIazk/EwhiaxJkmT5Db4nNqtAm
	5Yz6lNVaEfy4vUDMUlPYh8m55YC+XJL8djWU4DJsQ2PFiqvBtRzPyhBPKEAk9i+GwEe9ZJyklNU
	w4hWC53RBvxsBTz9pXjZ/EQ7Ee4X0ZDrMt9oYb1Mepk1SgTpgdw77UQoOBe8Zv6zXiV2STlrjJu
	OCEvtfmf92cIInNKNe1ssLYNzOM8MWJ70D6Z2Z7KBYtxajzG7ajIDhtMAwBlzTyFcmhaM/2SsGU
	OFiXHBNaUmJraublpn6ScaIsdYhw0bELuyPjZusSRXPA7p1mxdtOJX
X-Received: by 2002:a05:6808:1787:b0:564:347c:5a7c with SMTP id 5614622812f47-5683cd801f3mr1322272b6e.59.1794280396724;
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56905736b92sm1019236b6e.8.2026.11.09.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:13:16 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 09 Nov 2026 20:12:53 -0700
Subject: [PATCH v9 04/11] serial: 8250: share the RX trigger conversion
 helper
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
Message-Id: <20261109-submit-h616-uart-fifo-v1-v9-4-3f03961dae8a@gmail.com>
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

Drivers can supply receive-trigger thresholds through the RX trigger
callbacks without adding a legacy port type to uart_config[]. Extract the
threshold search into serial8250_bytes_to_fcr() so those drivers can use
the same conversion as the generic 8250 implementation.

Keep the implementation in 8250_port.c and share it within 8250_base.
Include the unsupported-table check and preserve the existing nearest-lower
selection and highest-encoding fallback.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/tty/serial/8250/8250.h      |  2 ++
 drivers/tty/serial/8250/8250_port.c | 14 ++++++++++----
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/tty/serial/8250/8250.h b/drivers/tty/serial/8250/8250.h
index 939b7d4209f1..8729619160ea 100644
--- a/drivers/tty/serial/8250/8250.h
+++ b/drivers/tty/serial/8250/8250.h
@@ -73,6 +73,8 @@ struct serial8250_config {
 	unsigned int	flags;
 };
 
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes);
+
 enum uart_port_type {
 	/* Internal 8250 only */
 	UART_PORT_AIROHA		= 124,
diff --git a/drivers/tty/serial/8250/8250_port.c b/drivers/tty/serial/8250/8250_port.c
index 452851815ffc..73bc9e7ab703 100644
--- a/drivers/tty/serial/8250/8250_port.c
+++ b/drivers/tty/serial/8250/8250_port.c
@@ -3015,16 +3015,15 @@ static int fcr_get_rxtrig_bytes(struct uart_8250_port *up)
 	return bytes ? bytes : -EOPNOTSUPP;
 }
 
-static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+int serial8250_bytes_to_fcr(const u16 *rxtrig_bytes, u16 bytes)
 {
-	const struct serial8250_config *conf_type = &uart_config[up->port.type];
 	int i;
 
-	if (!conf_type->rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
+	if (!rxtrig_bytes[UART_FCR_R_TRIG_BITS(UART_FCR_R_TRIG_00)])
 		return -EOPNOTSUPP;
 
 	for (i = 1; i < UART_FCR_R_TRIG_MAX_STATE; i++) {
-		if (bytes < conf_type->rxtrig_bytes[i])
+		if (bytes < rxtrig_bytes[i])
 			/* Use the nearest lower value */
 			return (--i) << UART_FCR_R_TRIG_SHIFT;
 	}
@@ -3032,6 +3031,13 @@ static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
 	return UART_FCR_R_TRIG_11;
 }
 
+static int bytes_to_fcr_rxtrig(struct uart_8250_port *up, u16 bytes)
+{
+	const struct serial8250_config *conf_type = &uart_config[up->port.type];
+
+	return serial8250_bytes_to_fcr(conf_type->rxtrig_bytes, bytes);
+}
+
 static int do_get_rxtrig(struct tty_port *port)
 {
 	struct uart_state *state = container_of(port, struct uart_state, port);

-- 
2.53.0

