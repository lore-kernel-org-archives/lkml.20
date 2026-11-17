Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794925315;
	b=CsYIHlOQTQL3Hd/2XGq++xzpcJVHMw7SlpEXEfNuqaEEHMDjKWkmWnCBzDMEXBmpX010
	 UxRUrr/OPBOr7zG/O3Di7GEQIOPwxkTxdCeQbrL04l6VRIe4JZlXYrZzIk78+9iDA5GAP
	 zGlwGVEfc7IidBlwNSxc1SoxVlv6XjMVqEAxh0rmMPNiHb0wo9JsMolpb9CC35SewoTzA
	 1y74c+UXAN1ojCu5j89uzk5TPhIvWJJPNkGuETxrmdyf2OWTLZn8G5R07jf/dykkix33o
	 qjP/J3I3DjO6/5jnbQed/2wyQas0uhk9DKqJ8VOJ8GQtXspWsRvO8X0NvE9AZDeHcTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794925315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LwurQFNbXh7iPvGiwBmdrhIGI4UzTbfkuF1+uo8VDJ8=;
	b=TGbeI25luxft1krenS5tVPX2VayoWAh/GIHbI1yw9YUwcV4o64vk+H1FIR3ecz3a1j9Q
	 XvNY/T8vgQTluCCpJIu5pz0P+Elt109DGayO3Nu6jLWJ/ivlV6K9NCfOffxFmah7+Koia
	 HAAzHSVJdSDid+Hrj6cvD2CzGvfU+xyB/JwMKX9gWc9a/49lTkgFmzF93Hk7gQzFhGvAb
	 F6C0zSoRRN9stMlXzQDWKOO0Rhi2vn03lL1YonNLjebbVvf+ISXQBurvNfpeCEMGKeCFW
	 c1cM1yAX68bqGIAuZ3QUcENQQ5Y2kv4DpkDn8wokkaPJ9XGoKtwmXoIBIVEb48+m7tA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HYxgAvlt;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FD83606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FD83606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HYxgAvlt
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b547d6c07bso6251407a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 06:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794925313; x=1795530113; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LwurQFNbXh7iPvGiwBmdrhIGI4UzTbfkuF1+uo8VDJ8=;
        b=HYxgAvltjlfhfqJpx9q7Jzw+9n6sTMFBXoqMI1l49I/u3QjUQ/FdBJlmkoEb8grnHi
         /fTWg6cFafyMosqUjBCh693zSsQBXitFqfT6WmmboEMnufuX8AXI0PaBs2MAOwJx5KCE
         rbA65xE4jdObOYmXO7YgLLwcRqUjq4FJJiSU1fnPDCtRk6BsLTS/b14j8ZRzG/xJLBc3
         Xg6Inre/FC3ejOaGb+nKJ+SU18+9KV1to1cosG4NpKR1jiGGjPAVCmRBLI85uoqZxrdR
         ZjEScSb2S9C+mCzTwqWY3C+tiUBtrOzByOJXn9KrSSQ0mSy8mjTHw0HG0feCQIacqJ3+
         RDRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794925313; x=1795530113;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LwurQFNbXh7iPvGiwBmdrhIGI4UzTbfkuF1+uo8VDJ8=;
        b=MlXl8xc7XC/Wz7cfSz/M+pmCLHoUFDm7Yzl6MhSC3iwYyX86L7gNO+NJ8memB7lPab
         /qicEVDmHiJcmISMJlzVPlxPLOBtGwkIuUB6yzzoqXgeBdh0cDs1tnk9KAEtuAcBXt1o
         9oulq9MHVpphxOfZZR29Kw7Q9r4E0XiHuOcjfx2uDBasQ4uHa/PAukjnWf/j62jXYU9N
         LMr/yPY7nWvYiSWoiepuOCa6EXSaARbAA5IOgBezCirZzP8Zblfp74CGrp3C5Wfb/GQQ
         plS4bCR4huZsnFzufkejjmXBdXkcCvEcOAnK8mhqAjq0xKrDy6PEYOwAom5rGjEcStx1
         SRuQ==
X-Forwarded-Encrypted: i=1; AL+hErGNCigSmoV2w3GeTU95MIeUzXimBasnMmfZFouup9PmaR8RXcn8nQq6oy7CN8kk6p2hPhMswL1XQ/WZl4g=@vger.kernel.org
X-Gm-Message-State: APuU4Z95OuINPMzYmzL4XqlF9hRVNBflzrfZKISqvig2t+K8KQ48paFo
	mporjy8v7z6uvggrc4KgqsW8VwP7iMEveg3YbHi9xCEhi8K6MX8UIWl1
X-Gm-Gg: AYBFou2hwyahqnZPiEIPiPYcDbzkEIdhRhb/axrkldK73QFKcYxWxUJYkZm2Xq9u3V3
	MTMtnXPB2offC9mjuJ4Sns5hDxJWxAbUQRPOa5F9o/a7vo3ttCdNX5qy2BC838Lgcb7Xt5J2Qkf
	dv0XPP0wqZ4b6huD9jrc5gEQOYV/m0/5v1w4MM4j4b5yQ7rwGZcaJCitWKSBFvVvoz3BI+Iv4c+
	zTbrfWCjph+DWhj9VoYkpYvHgwW+ebNpK8pOCoDtgm361khZZL1WM3iKAnkmOMAfxN0u9D2R17M
	YXiyNC2j0qqe3XkkT9VPdSgcHpcn8583P5IUtQzxebiFg3S7JfBpAgomP5PGr5vKaWj0h4yghaD
	rTg8xieTsDr1mPKsmP+x3joW68dI7uW8b3xwLCYUaB1yiIml5JlK0MFeSnGLxbYfT2mbAnXMCRL
	DBSNH1eaIzoU8jWGVbfBB1CmCCDTtKKcgj60UG+fscPQzmtM1dDnhgEn2J6V6uyJUnJ0ApP2eO9
	WorXNaAdjaxEU/9iSZxuHs2R6bQSJLmEq73YJvzVof0/MwvJOm8XESugk9ZfvdoMJH0mwn5QZ+x
	XYjpPtlSLrwxEX5pjcCoHCXMsI0=
X-Received: by 2002:a05:6402:1e96:b0:6b6:f5b0:88b3 with SMTP id 4fb4d7f45d1cf-6b7c0891000mr11477809a12.3.1794925313148;
        Tue, 17 Nov 2026 06:21:53 -0800 (PST)
Received: from fedora ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c24e7714sm5728827a12.28.2026.11.17.06.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 06:21:52 -0800 (PST)
From: Bramuel Barack <bramwelbarack89@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bramuel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH v2] serial: mvebu-uart: drop of_match_ptr for ID table
Date: Tue, 17 Nov 2026 17:21:15 +0300
Message-ID: <20261117142115.18402-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.56.1
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

mvebu_uart_of_match[] is always compiled in and already referenced
directly in mvebu_uart_probe(). Wrapping it in of_match_ptr() in
mvebu_uart_platform_driver is redundant and prevents ACPI PRP0001
matching when CONFIG_OF is disabled.

Switch mvebu_uart_probe() from of_match_device() to
device_get_match_data() and check for NULL so both Device Tree and
ACPI PRP0001 bindings resolve match data safely. Also drop the
now-unused forward declaration and <linux/of_device.h> include.

Signed-off-by: Bramuel Barack <bramwelbarack89@gmail.com>
---
Changes in v2:
- Use device_get_match_data() with a NULL check in mvebu_uart_probe()
  to prevent a NULL pointer dereference on ACPI PRP0001 match.
- Drop unused forward declaration and <linux/of_device.h> include.

 drivers/tty/serial/mvebu-uart.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..509690748ef7 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -18,10 +18,10 @@
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
 #include <linux/slab.h>
@@ -154,7 +154,7 @@ struct mvebu_uart {
 	struct uart_port *port;
 	struct clk *clk;
 	int irq[UART_IRQ_COUNT];
-	struct mvebu_uart_driver_data *data;
+	const struct mvebu_uart_driver_data *data;
 #if defined(CONFIG_PM)
 	struct mvebu_uart_pm_regs pm_regs;
 #endif /* CONFIG_PM */
@@ -859,15 +859,12 @@ static const struct dev_pm_ops mvebu_uart_pm_ops = {
 };
 #endif /* CONFIG_PM */
 
-static const struct of_device_id mvebu_uart_of_match[];
 
 /* Counter to keep track of each UART port id when not using CONFIG_OF */
 static int uart_num_counter;
 
 static int mvebu_uart_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match = of_match_device(mvebu_uart_of_match,
-							   &pdev->dev);
 	struct uart_port *port;
 	struct mvebu_uart *mvuart;
 	struct resource *reg;
@@ -919,7 +916,10 @@ static int mvebu_uart_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Get controller data depending on the compatible string */
-	mvuart->data = (struct mvebu_uart_driver_data *)match->data;
+	mvuart->data = device_get_match_data(&pdev->dev);
+	if (!mvuart->data)
+		return -ENODEV;
+
 	mvuart->port = port;
 
 	port->private_data = mvuart;
@@ -1016,7 +1016,7 @@ static struct platform_driver mvebu_uart_platform_driver = {
 	.probe	= mvebu_uart_probe,
 	.driver	= {
 		.name  = "mvebu-uart",
-		.of_match_table = of_match_ptr(mvebu_uart_of_match),
+		.of_match_table = mvebu_uart_of_match,
 		.suppress_bind_attrs = true,
 #if defined(CONFIG_PM)
 		.pm	= &mvebu_uart_pm_ops,
-- 
2.56.1

