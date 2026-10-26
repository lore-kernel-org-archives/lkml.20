Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793000815;
	b=tMAneBdJiDe5zMsMkAza+3srTneqNobOXn8l4KFyEt86VYV4l5x2T2pZOhKcOFwEPQ4t
	 QOWjWT2S+3bbbA8BmPmksS1hUtDYmDV41wyBqobDidBAUMMdg8OvcG1nU8n6/SNXTmJUS
	 OFn6NgiYpASsGky3Vvds0OsXzOlI/me1jWkykGmvAwbeHdUj/smQ1V2DLyokQUDsnEaJC
	 R6Y/db47no0KYPa0hpP1O4h0VtYvOfskmTWDpVc5ZGc7NX1qp8/EOOjNxANJECt2kg/P1
	 OLABXokF+oeumZ+PvV7yPwv2ZofCYqpYlqUy9ByAfXtZJEThlE3OJlpTXzfqSVBQ3lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793000815;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MaW4IJWC0g/bCa4F071QFM2op8BvQwVDTC8JsoSAq5M=;
	b=ykKxtyFTM7XSjzurSou8Ftzrhsjxdh3IT3sNvYRSRfmZ3VbIb7S6fg2hf19sphvNw2eH
	 7WR0ufMxIbIskU9BcMjiLcGowN+fMZY+YFVw46oBHY5Fh/wvtsOXn0TQ/j2t1FO657lvr
	 vmmY4dwSdq5UqD87oBQGpiJYNKGxjX0FYA+tn0DDUQAO/yDpC4ohAVWRpsQcR0DIaXUiZ
	 +ake4lRte0mgHaNe2DKbueLVCREZ6+5kR2MYySAq5wnWpgVdEW0UJBKW9lMGKyC8I1E9v
	 y04xQmIuKSpgrvqcFEn1yxGjjCZQGLPvcJtdWx+8+0RILVdYo64ncXqhMf1xaHzUu2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="K8aIDWO/";
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E425606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 07:46:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E425606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K8aIDWO/
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso12993135e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 00:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793000813; x=1793605613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MaW4IJWC0g/bCa4F071QFM2op8BvQwVDTC8JsoSAq5M=;
        b=K8aIDWO/9vobgoNaHDeHs63GRCjcODxwXky3Nq02Xikwnau67QyVp7FZu3ERHcUegf
         Zgw8RxfKLX5hxLGOs6LlAxk+EQ0m+jVeuWmiNk/B2GVZrxxP9VySjUeC4zD9PQmkzEJ+
         RfOjhl5k4Uq1OhQj9slRU9uYOw0AnTcoV/HTftyzGhqRcTH1VWEWbgOTGmCu25TeWgwA
         Xl8KQb+vSZO/oLuiCWtKlwbhYD8VCxfgBZjv0khwG3VY5v3sHlKyQI079BKCLUsBP5oh
         FpR4PABafjb8LA4OVLfRbss+Y2pEyKhx8WsGjp78M7ISpZAeNfmcQ/pkz+78HKsewBd4
         i4vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793000813; x=1793605613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MaW4IJWC0g/bCa4F071QFM2op8BvQwVDTC8JsoSAq5M=;
        b=ZZjq8Ox8DqxWCjHO+OcpBuhc0OTq9HFtMTgQPHCH2mN2SUGjCorDA/ND+Sbx6EUS/y
         /DyazuSEgaRzPHGi0LWa4iSYdlK5pf8HtRXzLkziFnHe8C10A/kU+GdS/JRPhV/PpHe1
         aeywQTW6p0OVvCFuCecI90AyASGtLcqZ1Gv8XBiTohCIvzNBKmEQnkNFqaxL1CshO7Yj
         PtrkwVxNodGgIRQMK9wGgk12f/UaO8FF4w1BSCWAGdtJSbsgMQW9rvHR1+2RFVlQNImh
         Mh7pKt5X8PSFxqA+pYnD60sHP4LAo0jSwMNS5u4V20+NxfAMOXS47Pe7UN4g1w5d93jP
         idlw==
X-Forwarded-Encrypted: i=1; AKwUvBwTfkqGsLEx7V4W9015SqCQxtYLUK4iad98tracdlW9/DAdzrIVKZJ48X/7flVacEZLH0R4LS1eINx2rnQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN/Dlyt2ny7twie8B8ZIG9fEhXN3hcliezGNf6rGGkDL9siQpQ
	odoXa8/3XQAuSdyGzZQiy2tJgzTXIoNG9LjcLZ/hkU1nrcALeF4l44G9
X-Gm-Gg: AYBFou0RaPueBS2RPkR/OQX6rI4o754jOqvQgoNnKLhV5HkFqNSs4axc7ktN3uiLZbG
	ToE71parxOehXsIKIrr+2z0vJT1dtXe1YrrgiXlXj/LZ5KNM75cjyhy/lC4b+jitB2eAUmqxUXj
	CRjDVO1gPIEFUthBEnPtV8CHtXGGccwq1OVG6czNfonO2+5IEPZziy0F5VHEJdGT/ujSrJDFnON
	DQbg6WaGmaMPdhpoaZEPK3SM9z/Wmiz3ZrYmPpfSrj+xeID/8qNRSyfCuzs36RdJIRYtUsUGFC6
	ELwJmbyuLXE+v7i2/z5XYd91LkGpbljrmlKeSFFmZqvr12w0oVfDdStxANgagzVkrZzEJ9qAwWn
	1k16tp+UwZZod6P1snB4vUSNhgT16N6vXhmI0RwG3UfDO08y0ugWTPpLW6p9rblkkIUGPbjvuPC
	NF0IiA+ggwdmllg9V6cFofzubWAniwDUiSFFNKiqLvrx4ZuGP1d8p+cNvnfXo5hwkvFchu4+rIz
	Cs26ykWfsjpxcrfHpdqFPvDZLROfuoW2YJM2T/VHH8RItuzeOxynw+ZNIqmbE5O1U3Ixw==
X-Received: by 2002:a05:600c:3493:b0:4a2:a6e:80f5 with SMTP id 5b1f17b1804b1-4a35ac9d0e8mr108207515e9.11.1793000813031;
        Mon, 26 Oct 2026 00:46:53 -0700 (PDT)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a59d238sm162898215e9.14.2026.10.26.00.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 00:46:52 -0700 (PDT)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: pali@kernel.org,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH] tty: serial: mvebu-uart: use device_get_match_data()
Date: Mon, 26 Oct 2026 10:46:44 +0300
Message-ID: <20261026074644.17464-1-bramwelbarack89@gmail.com>
X-Mailer: git-send-email 2.56.0
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

Modernize the driver by replacing the legacy of_match_device() call
with the modern device_get_match_data() helper API. This cleans up
the boilerplate code by extracting the match driver data configuration
directly.

Consequently, drop the explicit inclusions of <linux/of_device.h> and
<linux/of_platform.h> as they are no longer required by the driver.

Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
---
 drivers/tty/serial/mvebu-uart.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..adc2cf7ee65d 100644
--- a/drivers/tty/serial/mvebu-uart.c
+++ b/drivers/tty/serial/mvebu-uart.c
@@ -18,9 +18,7 @@
 #include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/serial.h>
 #include <linux/serial_core.h>
@@ -866,8 +864,6 @@ static int uart_num_counter;
 
 static int mvebu_uart_probe(struct platform_device *pdev)
 {
-	const struct of_device_id *match = of_match_device(mvebu_uart_of_match,
-							   &pdev->dev);
 	struct uart_port *port;
 	struct mvebu_uart *mvuart;
 	struct resource *reg;
@@ -919,7 +915,7 @@ static int mvebu_uart_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Get controller data depending on the compatible string */
-	mvuart->data = (struct mvebu_uart_driver_data *)match->data;
+	mvuart->data = (struct mvebu_uart_driver_data *)device_get_match_data(&pdev->dev);
 	mvuart->port = port;
 
 	port->private_data = mvuart;
-- 
2.56.0

