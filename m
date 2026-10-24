Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792879638;
	b=ve/U3l6DYI1DtDS7hLAAc2Eb0Q6jBMsYmfXZbxDiOvhfANk0BmD7gCOxggvZA2qgn+UD
	 EzTYEZoa/fnURsj5PJzkqTvSMHiJWppP+P6dOrAe+YwwGzueInB+NGHRt+7jqVdL6Uf+j
	 8lVO6yezqORjb8wMV+iTnHB/XuZ7XsNJ5RdJIDrvmrHnZHOTVUD/M48Hq4OJgdS2gjrVG
	 NVfa4rsfOkwC7lVfjZFgR9fvu0aRrFS4hAGA6LlmlMV9bWpc53rfkJO+j7nTHCAWJWSBv
	 ccpApAN6AD07DjjQDK6m79+JGFKnQgmLCm0OMj601bFcWzYtxE2PBScxrXSN9y+r35w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792879638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xpsIF/cfagR2zVFmuilPnUkqxjm9mv7XoS2i7FolaHE=;
	b=ieh6gbmYsECYIJk0Xk2m/b7GJ5Wa6Oi4WGtVwjCI7gcDJSfJ2qR1cFaWiC8OHie8NlMP
	 kwuCv6Y5KXx8BNevGEcEuSUQXOpUSDSHetdUSglQqAOLBTT4OjcpLgupgHDr5quu9Oo3N
	 HXaFWAP7t/zWEsUcs4iquYjNGQ3tcnhmJssim7ZbMNDhqNeuUk4IW4MAMzSMElWZYl0uY
	 PZJtw5ej/7ScC/Mmn5lprNQQT73iH5OhnsG0lzLuLJ+hlhsNRzkDZoWgpX6KRK8PQfcxD
	 t/MRgdeWEii276NG4nrlQdCh+3u+QlxDI76/ZY0bwiC3pItE28A/5mG1sbdcweaw2Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bMCFuXIW;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A401606A328
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 22:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A401606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=bMCFuXIW
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso17782065e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792879637; x=1793484437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpsIF/cfagR2zVFmuilPnUkqxjm9mv7XoS2i7FolaHE=;
        b=bMCFuXIW8WSLFTdO69RsRRj1TOG56FNvXFJDyPKPQCXvpDcbUqzwN5B7XZLTqwR0pQ
         LhxaNIdIIsCo3fSitwA8UGcYqaF7HYfb7Kkc+I1OmOSlxW6jWJ9w9XVrRiL+01JuXA3/
         SXcVpcXnls1i1R9b2RAcyjuJlJLZu4LxZeGfGd+xTn5rFEpta2FDYcwDKnulNcKrFhBW
         53G5GOCh+TkA+UuSB9NdHoHiHQjTGPsxx/c78Vl9NXwkMjLg0hVdnpRVi3zepykbMAT7
         aZapMts7o0kFqf8YmGfj2XBPq5mqc4eVwFL5aw7pcY8u72ghz0nKfBsejE3tkjA/fMnE
         SpHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792879637; x=1793484437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xpsIF/cfagR2zVFmuilPnUkqxjm9mv7XoS2i7FolaHE=;
        b=kVrDKdYGZdIeM/t/QJVq1XtMx4uvKL1auHrq2xDSWNyE0cVifVa+cbsJsbFbB9J92W
         ucrru3lWLt7TTKWi7jOhRTAMPW3YeVC3eEzu9skgZw8GuNx55Iht3u5LkRiK2NACp4NK
         WsHpItJ6OEakGMEtKRjXaq28+vqYbqCn9hO4DhPksg8pj3y1Khz+s2N2YiTdApIrneFH
         ntOgEwdxxWnB9I83IjjVnUvuuSYGx+cnplZsspwEaxgNamLyxdronAXxer52S+2SDKR1
         T7dsfSZ9KEz7RELLN9oLIN0u7NekX2hKDIV1sv6cDOZKKs2E+l6JeEodGBQWcojwqvhr
         P/Vw==
X-Forwarded-Encrypted: i=1; AKwUvBxDEvdLbChsQYmrJl79DcDXbXA2Azk4BLs5ip2pQF7MNc4ANK24QQyOM0QrUejpJ4DS8IT52xvhfsanNOE=@vger.kernel.org
X-Gm-Message-State: AFq9FYKGj///tfZi1ufkcUExyUM1QW/WOM3LqjLlsPo+jRXTxPyfhvII
	S6bgNvKe48MiBW3e7CI6pQWL3fHxBlW9Pe21rFRF9p6VKp5Sz9o7xhyzyq4G8esxnjo=
X-Gm-Gg: AYBFou19JbAd927xBIDQIDC4pDMUx+U+CNUmLTT6kJ76K6DbqKLmXb9y/b6FTcWlPy0
	ml6qzY431FxwGh+k6QM+3UsgoWzZO4Asnfrlw/tqAABTngkHBMfffvFTvcbm1w4BEyrbKvwgvZI
	0UtKfEH34ZLR1XMhIYlWrE1ERKDLHtMiydWVJ0bYfsBPHr3f/t+PyFIp751cMqvqHyWGRy0C5uW
	4yEP8ZKrmJneY/eW2zYfZAct4sfhhp4z4fmZDoa3LBpYJjHTTSCcjYwRoyi32YvXbKUTCWOmOBn
	02J/tNigK7gthXFRxPf80vnG7fuYFQiDReq7cZgXupHpzPRTB+3S7Y1JK4IkarOo/e0eWaKy0am
	OQIDkPvFcD+Kj0W82bgZkmpzU9Xuj7aSuJSiSd3BI9lCLI5oju0HiG6qOMCt45ianlsero0QebU
	gt2g0ayE+sLTeqFbnA8ybhsqvLm+qjGZSDg4sBfIoL5cnPHtRCVcN1/UyGUO1g+EfgkLMLpCVtu
	vHyrl5ubdGMm7/G68K+BRrOcIxCXHBEaPLbZ0PiGhW3TPU7DF48+6uU29mcq9Fk9AOuwbmrY8Nb
	majUrE2dBaa5LXhclv7QHsCwIOEJtbxPP/tceUWe1aibGJRLs8ozHuGAsQQZhlJQkk6b
X-Received: by 2002:a05:600c:6212:b0:4a1:742e:3 with SMTP id 5b1f17b1804b1-4a35acdd912mr42496565e9.27.1792879635966;
        Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
Received: from localhost.localdomain (2a01cb060184ad00bcfbae5efa3e0f0b.ipv6.abo.wanadoo.fr. [2a01:cb06:184:ad00:bcfb:ae5e:fa3e:f0b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a06da5fsm53466635e9.3.2026.10.24.15.07.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 24 Oct 2026 15:07:15 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jiri Slaby <jirislaby@kernel.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"H . Nikolaus Schaller" <hns@goldelico.com>,
	linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH v2 2/2] serial: 8250_ingenic: Set UMR and UACR at probe
Date: Sun, 25 Oct 2026 00:07:12 +0200
Message-ID: <20261024220712.23250-3-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261024220712.23250-1-olivier@mgcrea.io>
References: <20261024220712.23250-1-olivier@mgcrea.io>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ingenic UARTs have two registers beyond the 16550's: UMR, the number of
clocks a bit takes, and UACR, which adds one clock to chosen bits of a
frame, for fractional baud rates. The JZ4725, JZ4740, JZ4755, JZ4760,
X1000, X1830, X2000 and X1600 programming manuals all have them at 0x24
and 0x28. The divisor the 8250 core computes assumes 16 clocks a bit and
none added.

The driver never writes them, so a UART keeps whatever was there before.
On a HiBy R1 (X1600) the vendor boot loader sets UMR to 8 on its console
UART, and the vendor kernel had left 8 on UART0, which carries the
Bluetooth chip: every rate came out doubled, and the chip never answered
("command 0xfc18 tx timeout" from hci_bcm). Their reset value, 0, which
the X1000 and X1600 manuals call normal mode, does not work on the X1600
either: with UMR at 0 the same command times out.

Set UMR to 16 and UACR to 0 at probe.

Tested on a HiBy R1: with UMR at 0 or 8 the BCM43430A1 on UART0 fails to
set up; with this patch it comes up at 1.5 Mbaud and streams A2DP audio.

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/tty/serial/8250/8250_ingenic.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/tty/serial/8250/8250_ingenic.c b/drivers/tty/serial/8250/8250_ingenic.c
index 0cdadacd7019..ca45e74b999b 100644
--- a/drivers/tty/serial/8250/8250_ingenic.c
+++ b/drivers/tty/serial/8250/8250_ingenic.c
@@ -40,6 +40,10 @@ static const struct of_device_id of_match[];
 #define UART_MCR_MDCE	BIT(7)
 #define UART_MCR_FCM	BIT(6)
 
+/* Clocks a bit, and an extra clock for chosen bits */
+#define UART_UMR	9
+#define UART_UACR	10
+
 static struct earlycon_device *early_device;
 
 static uint8_t early_in(struct uart_port *port, int offset)
@@ -298,6 +302,14 @@ static int ingenic_uart_probe(struct platform_device *pdev)
 	}
 	uart.port.uartclk = clk_get_rate(data->clk_baud);
 
+	/*
+	 * The 8250 core's divisor assumes 16 clocks a bit. Whatever ran before
+	 * may have left another count, and on the X1600 even the reset value,
+	 * 0, does not give 16.
+	 */
+	writel(16, uart.port.membase + (UART_UMR << uart.port.regshift));
+	writel(0, uart.port.membase + (UART_UACR << uart.port.regshift));
+
 	data->uport = serial8250_register_8250_port(&uart);
 	if (IS_ERR(data->uport)) {
 		err = PTR_ERR(data->uport);
-- 
2.39.5

