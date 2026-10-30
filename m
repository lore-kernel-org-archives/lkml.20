Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793385274;
	b=1sc0thkBJAIVr7lYU0fEg84Ypz6QZ+J9YLl7JA5JyFbj55UIZ+jY1aZFMbGS04wqtNXw
	 moq8gz4SHnm94NA3TC6g1JeequbDLWnCcho0xW4RocLgiDEiMfFUTfDQfmXtsk18vSJoY
	 xvK2TKmP02cJ1lnSKSZuMQ7sQWH14a9cEef5Sqpu7FKpgTGHL2F4FPAReAVwKA0xWaMsk
	 iRhWRf6Ho7EeMJ/tAs5xEZHi7mUg6yl4GfAbG1TS/6D0eSBOJJHR7wtpV7RUuzoyRlo2z
	 1DHlWMfuTThWeL4VgBqchLWkYjHCLw96AyHenb/SVYTUFVV/ZHEgrZJ9jlGvtKRymXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793385274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6IcSNu4leey2R/HZQEBsUuZxK1oRfKLqiFJlrMLS854=;
	b=39CfoEIMWthR/qsnxZw4xflAhWiNuCO5RtbMB1uXiZzpODAsN//ei5Cso11EdX8zuaAe
	 AITRJz+5dofGaSELaR3hzZvS9NpaWxwdoQraV9xWhIBEcaWn3jMk77mHh44GMP45qi5ah
	 MGzD+G1JTHI286g+2BQUs+oPYViqOEvE+zqicMkBfFNfogK6B45uVPzsXaQJCcI7HgD53
	 z2R8UNPuY7SkIxtNoT69nYtPfJo9ovRdERudUbwsD49WMEo+opT8AeAtim/kuxa+NL/iw
	 Xyi4tzdxBRYGDWugZB3pdyuZX3YTPSjDgFkw5LPpIT/B63sB6++cnT+zBfsdbKZfSfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVt2wqfq;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10294606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 18:34:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10294606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wVt2wqfq
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4be28b82so1116832f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 11:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793385272; x=1793990072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6IcSNu4leey2R/HZQEBsUuZxK1oRfKLqiFJlrMLS854=;
        b=wVt2wqfqlC2tFU7dgRYWofFhySsKi6XWL54tcVniMNHh3s9cRc+cLL+xY+pN4c1riV
         DtDEr4n10/djQH/E0jiT7qedo0HGaoWg+yhRjdcPGtfxg5FrvIeOc8TYo9dY4PrXDaeD
         GX3pwQePYwo3inQemkhgdDFwqHGWYH+honwFu8uTyIkg49qzZCX9G8EPPwzx85icgG9t
         IMK1u20OzfvT24CtYfDS16nKM2NU78JJko6nyAUwqTmytu0dzUY4DApV1/gx4Q3Ah0TG
         WqYQAiWCK3rWm0MlEH4FY8+ieySzYQ2t9e6+tYLsylsqhJB15b6abS2J9yihy//XEYpn
         PMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793385272; x=1793990072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6IcSNu4leey2R/HZQEBsUuZxK1oRfKLqiFJlrMLS854=;
        b=nPNMdlOxdKR/DFI6EQ0kzoeAfSj1/v8MSg+M30IZBp/GPeRWVnrBms/z2RzRQvwiPv
         1UiyQquAu3pYmsq5WkSm/9rmgx1yPV9SQbbHe/XArEjekzuMDjtbN+BSGIDGd7d7Fa57
         SZXoFOv/hcmwIaZE1rWL3uUwmwXzq6Xm0bV7aS/SIW+o+z/vBZ4kyeufzLmFyL/5K5tj
         EG/d/MGNtHHAv1RCGhKHVdK9xVGRSJoLlvTbL0ovZBHzWsytjd6A3VqmfRIWkwiydz83
         NZQURuIUTNVyikR+l7v13zzSNr4IU+40pd5mjkwLq50U1mEPyyKiqUslZf7uGagFPrpg
         V1Gw==
X-Forwarded-Encrypted: i=1; AKwUvBzwDrGNGtRMyia7FKFCMtPYnZ3Fa1lWGSfcwEZJpm82LebuIJ+W4rHjrWw21GvAfzlwo2/noCQeskYmZvU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLy2DXGSxjmdo5/+L2V9geF5ak3UcTOd4VkZ+Kl81qq/G8hwJGh
	3DAeaMczIhIOvlFsfrNWrpfwWAAQQyHStt2hQn4/aZpWAiIgiZhGf7cl
X-Gm-Gg: AYBFou2CAGRewmaPTdczmkORcDIsHY8DoJUOGF3AwBEEowWDoBD72fFE4pcblpQ1hIm
	vcMMDgaxU/A2PNznEq+/ZSroWpCpfqeCi4Hcrtdjucxyyr9O8oQUCnqMEd/wGclBfpWNOc3Pwlq
	P6sJopA1D0aaH6W6IGHWA1D9bAqVluJ3ou2E+81HC38Ue0ct+xpfVzVogIhD3VDagDjnsfY34Mu
	cqSzfd8LnFvjAsa1k8oj4v0IEfx3fMzqLxgMBeknSvNc5JI6cQN0oWrmltEx58q4KnE8U+TKX9o
	YyfHZ+qGvQDrKjN/A27Vm8pHHu4zwg5J+RPF8cDJR4gjPnTOsEleV9yVfzMO0mOoEpblxALVyQi
	vJKYUUEHlNLnlVIRdAYQqSfeQF1Em2bCB5tDR0S16Sr6jGMHNONZCkSsbA0I0QIefBEecZITuA7
	9y0b0z4GU7jO/sF7enk5aAngZadcC/BnHF7QFK85n21+DNheymrS250bVSfN493wV/xeieTunSp
	21w33YSfN8X1JEAzUmehCL+F4Pn8350hnJZmgLv7JS2St9bAaEF9+IH/2F7A+ZoQD2lj+F0zEcs
	hqarhhqLmTxizRoVuXuRFIOZ9IecdOyvFw==
X-Received: by 2002:a05:6000:26c8:b0:48d:f14a:9183 with SMTP id ffacd0b85a97d-48e6e303b1dmr7587067f8f.15.1793385272117;
        Fri, 30 Oct 2026 11:34:32 -0700 (PDT)
Received: from fedora.net ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71ba24f6sm4388535f8f.51.2026.10.30.11.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 11:34:31 -0700 (PDT)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS),
	linux-serial@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Cc: Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH v2] tty: serial: mvebu-uart: use device_get_match_data()
Date: Fri, 30 Oct 2026 21:33:30 +0300
Message-ID: <20261030183332.23834-1-bramwelbarack89@gmail.com>
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
This allows us to also remove a now-redundant forward declaration and
 drop the problematic of_match_ptr() macro wrapper.

Signed-off-by: Bramwel Barack <bramwelbarack89@gmail.com>
---

Changes in v2:
  - Dropped the redundant forward declaration of mvebu_uart_of_match.
  - Removed the of_match_ptr() macro wrapper from the platform driver structure
    to prevent build warnings when compiling with CONFIG_OF disabled.

 drivers/tty/serial/mvebu-uart.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..1e980dd26465 100644
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
@@ -859,15 +857,12 @@ static const struct dev_pm_ops mvebu_uart_pm_ops = {
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
@@ -919,7 +914,7 @@ static int mvebu_uart_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	/* Get controller data depending on the compatible string */
-	mvuart->data = (struct mvebu_uart_driver_data *)match->data;
+	mvuart->data = (struct mvebu_uart_driver_data *)device_get_match_data(&pdev->dev);
 	mvuart->port = port;
 
 	port->private_data = mvuart;
@@ -1016,7 +1011,7 @@ static struct platform_driver mvebu_uart_platform_driver = {
 	.probe	= mvebu_uart_probe,
 	.driver	= {
 		.name  = "mvebu-uart",
-		.of_match_table = of_match_ptr(mvebu_uart_of_match),
+		.of_match_table = mvebu_uart_of_match,
 		.suppress_bind_attrs = true,
 #if defined(CONFIG_PM)
 		.pm	= &mvebu_uart_pm_ops,
-- 
2.56.0

