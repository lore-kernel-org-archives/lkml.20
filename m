Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793736806;
	b=qwXPxD5/cLCgyovXN7ovkgDqRMRC3Sy5NBCBV/W4YibM3Wr75yq6n0F50Q/rv743MrcW
	 frtljvOEonjqt0q5ZunSwI9tTNpR4btkjlfCbESeNxIyBJspEsk+GRlnLSdKTrOdRaBth
	 QMEZSGYLkELVFTjfbcu7xzqpaQcBthQlXl2T0kYkBdPy/gdm9+r1SlPecGLJ42URyosVf
	 0Zjp843PlFRR8etMIT/cFoqTOViJRxjkFl2rmNDjv7m0i/HFSNr5KX5tsWfZUEzZT0fLl
	 plYqNwfMSoj3yqoHzQf+tFWoyF5r0Gt/WNgVbVsjHI9ArwauFORzg38lbkr0x73zfqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793736806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZIrDJV26wJ6cu/ZJewuMo3vnvvL3TeoGYe/qcbbz14s=;
	b=PfAz0atHF0XaVvjNM+YcU5aVqCzIC1MwAIjZmw4JhFRlBdieR6Ql09Vu/SLsi77QkGi6
	 2B34IN5ainTGNtwTm9axLdQN8sdisQe7A9l8iXmZ7xZ0TPSaeRTspMW/cXR/O862JEHNL
	 K0OtfnQk9mSb7UqNUsAF8Exqtkcz2Oh9+Mt/p3GheblM9xCbKnhQ1GFtuIfezS/B1aXXS
	 1EWFL1/Z52fRAouSGjZHUvuYvfuOB5MEOaUbwyHdASa2WThljXONu02NvZ1JYXor4/f8X
	 WtcEEKebmkXu5Z3Sa4pRRI+/XE5mY1j+UvHaIBdOW4f6jR8WoJ+HLDWuE5NgJT2gURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBrU2GFf;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B71606A324
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 20:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2B71606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oBrU2GFf
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48bbb06e746so2327737f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 12:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793736804; x=1794341604; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZIrDJV26wJ6cu/ZJewuMo3vnvvL3TeoGYe/qcbbz14s=;
        b=oBrU2GFfmB3nL5yO7RsgyKgCaaFokAvEZdeOTaYCxyKSvGvsHCR9Eos7CpSavnCCZz
         vUe4MvnC/C9+bDVSGDXq9PZCdzlDH0o8J0wauP6lImBLVCoROJ8QNahdvhvp2lqwgsEL
         gf7G29OZWxdyQn7FkaMivpApWukvlj/hCR15eQhb2VXcQQ57qnIQMsO9rOF4l7mSWjRA
         +PzN6GlUpEitzmkx+MrE/x49KfnzGUwLze8paxdd37bTTgsEwN8pA6MBKsTDh/p/hJ0d
         RcHAz6Cw2FrLK7TqRtHJisagMYVJsNGRNpgraJ+xa2Rccg/KimDG8YrQRe1VJOLlKaX/
         8tlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793736804; x=1794341604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZIrDJV26wJ6cu/ZJewuMo3vnvvL3TeoGYe/qcbbz14s=;
        b=oX3YSQMQbi+FrvYLOT5y29CMemnRTXD7vUrWnI5MZO3WMBuhnmwQABeqvU5ov43xat
         L428WLyEr4Qt0YeodeOQ+m5GxyH7G14j6w3bfFmv0psVv/trYZEa4A18h74DVCZZPn7H
         gn9S0Cryh812DXVyk0JJMNqnC9FzrYw2+dP2jAzplr0jdbXc8DXwe08UVu/ZlOAZgfA/
         9+07XkXIerbPKD+gUufpFlwblCRwsFzEIioCRQknJr0DpO2ad5sXK2fAxqhL+dVc8w7X
         FhnIAyFrY6sC1LtpoAV2w9KyM/0fAz4b5a2d157YL1+eRelQI9XuBN7diwLCMYfFHcrT
         5DKw==
X-Forwarded-Encrypted: i=1; AKwUvByQ6suiXqJp6T7iCIXKcm8x/3s8PrBkgF+LO32uibPaNcbt7OPxYkvgBlisqzY2E5WXA7wcRdglWRPLydI=@vger.kernel.org
X-Gm-Message-State: APuU4Z84sPye3xQtcdFeszIBDwapMrk+qd0i6igogZ7DLjMJE4y+po2d
	S3fJarTv5P+8cBWRrw60GLXzbzmF9gMSYfLWR2e+SnY1GVe4/LjdhAXX
X-Gm-Gg: AYBFou1zo8rII/d3mX/yphwNbjqUW+iTL3qWxS275CO1nSbF7hZozaUWPsywLv8gIg2
	+HewhGWYj1YYtlRadOOt8QNaneG7LIa+t95lxI7lwwxNiWyT8ifMdTLe7rsiY8/bGsIT+F0pF/K
	e6dL0AeEA9JH4+VCS5IPvD4afA5qmSTT5WbdaN6pT6bdE6uOW0KU3de6ncpIWneug9l15n0ilPy
	cZS9OK+5lbsTfM99buGlk8sgN8kXofoNIgQnxx5Kty8f1rSiQXWC1T6d0ArJZRXFXjULxn+TAhw
	xq2rDi9pSpGV+P2Ekc8w+HMOhHP2xboMlLfi8T0UK3d1yl5yo0mx6AVRLC4w87VQ0feQIHOPbL5
	2GdCDJR7h4daKv4H1WKyTGMCpQ28SabC2Zs9pGRoCCxkXzSd9zqoPqEnIBPrqWmcbqmU1MjmaYc
	LKwzEMZBCe8oB+HIZPkVar0mS9jGAbYKfvV9BZC2EFjmkIVKLyMCbORB8KW3Ilq1v45Yod4HOdK
	bowufe2XKq38LMPymDYtFFsWHMVb8sNp/9nBMi5vzJCJ7y8rHqjiGbIt5C5zmPSC3qodSO7b2vs
	PUNex5Kg7rKdarzsbgKKNJZR3bu6pVGEuGOieXDsA6g=
X-Received: by 2002:a05:6000:4a19:b0:48a:f8fb:cd49 with SMTP id ffacd0b85a97d-48e6e2fce72mr30237604f8f.22.1793736804112;
        Tue, 03 Nov 2026 12:13:24 -0800 (PST)
Received: from fedora.jkuat.ac.ke ([41.204.187.5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fcc5b1798sm443240f8f.29.2026.11.03.12.13.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:13:22 -0800 (PST)
From: Bramwel Barack <bramwelbarack89@gmail.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bramwel Barack <bramwelbarack89@gmail.com>
Subject: [PATCH v3] tty: serial: mvebu-uart: use device_get_match_data()
Date: Tue,  3 Nov 2026 23:13:05 +0300
Message-ID: <20261103201305.18963-1-bramwelbarack89@gmail.com>
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
Changes in v3:
  - Removed the redundant type cast from device_get_match_data() assignment as suggested by Jiri Slaby.
  - Marked the data pointer in struct mvebu_uart as const to match the return type of device_get_match_data() and prevent build errors.

Changes in v2:
  - Dropped the redundant forward declaration of mvebu_uart_of_match.
  - Removed the of_match_ptr() macro wrapper from the platform driver structure
    to prevent build warnings when compiling with CONFIG_OF disabled.
---
 drivers/tty/serial/mvebu-uart.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/tty/serial/mvebu-uart.c b/drivers/tty/serial/mvebu-uart.c
index 33ea496c93b2..fcb8f3d52df8 100644
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
@@ -154,7 +152,7 @@ struct mvebu_uart {
 	struct uart_port *port;
 	struct clk *clk;
 	int irq[UART_IRQ_COUNT];
-	struct mvebu_uart_driver_data *data;
+	const struct mvebu_uart_driver_data *data;
 #if defined(CONFIG_PM)
 	struct mvebu_uart_pm_regs pm_regs;
 #endif /* CONFIG_PM */
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
+	mvuart->data = device_get_match_data(&pdev->dev);
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

