Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5734C4F6C
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 18:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790361056; cv=none; b=fJybCd9UZGcErgZ84xxX8cb/55tYOfm51WwVXTt34OGnCVfV55AIWEIUksVjkfL07mzd4vAMe8T62JMiZHj/3nZaTF427CvjBVTV0Q0u07bVMwRCNMMMqNlfVx9LqGXbIuKsx3Dye9UT9LQ1xXIdl2zxbdgqyvBcbE62pMPvKmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790361056; c=relaxed/simple;
	bh=5bTeIx/3s3lWKZ4nDNCgKXw7Rt+gYVbleVn2IGZZ9Yw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fHBtBi+6ntSmoL8Wd+TuNOtSG5K8ujA5WRkM/d5N5D+bsabTQUkImefZ0iIgdYhkVEoE//FJjot4HeJet4+9mhSgm0YD0z/GEyOSoiPJ19lrcM+lwv/cYlDjyafgZYMXDCljfwiYuy9QZsQmNl3+Z2NN8ZljJGtrICAcZTw2ed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0GnIiDF; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0GnIiDF"
Received: by mail-oo2-f39.google.com with SMTP id 006d021491bc7-6b1ae6b200fso865929eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790361054; x=1790965854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cW2XG4Hoqs2N1NPgfs1kba+XBAoXoAzgs1+8F/XNb98=;
        b=U0GnIiDFUnMHJgw6yHDx5rw6p+Y4ALU+1yCXVcHaNMRaknxDf25EgcXgpqyBfkd6w4
         Qb5vvMy/s7FShC7gevlCgIyVJL3Ug5eV2XaEAHuu4NNuYgkkK9BsBNVR0t91JGl3xnLl
         csr++Kfoe5n338SlprhKWXhgOOcSkJrGNkPLFHHUY5M/67VDqN1QbmuGE/RMSm58JyXt
         Q7MbnxQad8V2hrMsBeNRvconG7au/rx8Pr6cyo3UyKJHyTx42csynwvkCnAUVe0iW0xk
         Ts8qixGVnxeTEY/treY+EyQus6i+TI4l+IyLDC3Qgo+yTdlUW7IRG6kOUJkTVh4MmeI8
         Xx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790361054; x=1790965854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cW2XG4Hoqs2N1NPgfs1kba+XBAoXoAzgs1+8F/XNb98=;
        b=MIYmAlsZ3rPYTH9dA4NSNYo1WFjCwOPQIU5rGA1sfFL8/mRDtCtBY6iWa/NFxF1IhD
         j2SikNjtWCqmdgjkuZ2syHdAgwSKfOSWGD5x39c8zjmY96SZ5rkoPwP5yLFMy1MBWoEN
         4++PrP9RK2xd+zE7HSBcQkTYQm5FmK+dlGXqvrOdQvZrChrVhtaEX7Q2jQt3qveuva28
         H2EQOCINNHlCEAKVkv+kKo3FW7ZPB+ekDhpC10X5xmL3JhXX8ZrgS0FoU7bV1oi7G7Xi
         HZQ9zVAuACOeRnCp73toTCB1A9OzaTP7D3P/ajGAo5TPe6qhaOPUTaLZmZoEd01nchEp
         zhqA==
X-Forwarded-Encrypted: i=1; AKwUvByYbhGHHQ5PbahrnL+yuql17PnBvaFzdygDOKQcsLqaWSxpPfVGU8OEVuHut6rEybNKLlp9DpBqMj38TaE=@vger.kernel.org
X-Gm-Message-State: AFuF++mGaSv0OeXdOebAA7KuYzcA0a+aUW/YGtY+9PlmhX7Pw8Ftv2jo
	ZcSjfVUCTX8RPyYiApF8APSK9zvJ6oTNUVgtuZ2ebkdJfbeM9/FVUZ9taeYNLA==
X-Gm-Gg: AYBFou15zcO79Q8U3lc5jNhj19Q8x1mNee5rYyZ2s50FufIDJF2JoMhLg1U6k5F7BGH
	QHPySP+U+38AHdzUYNZtRmt+hpgE0271rgPsKGl2xY6sBMdVxq6Uw6Qm2GyBt3vu1UUitIWEONJ
	3TRLn4KsLzx0g5+jytkbUQ1XZfOyZLxuWkOtiQuKgwsI2bdHUUAFJYtV9tecV6GNl/3OnJJNVWR
	IQMnbAaurQk9DUgtmEwkQ59h6VkKyKA3omwU3W2nhgqbVg/Nlilsn/Qz5zYVpa/601yXjlPy+i6
	BIEDBGVP9Y6czVglC/yEUMLX37BX3zC+8yAt3BwQsL4dUpr8ZKD30ft5+ibJFtQSF/IVgzNWEs6
	pOCwCNXrYZW9NBVhEQdfmB3VvS235Cu8tieCBFPei1qLtD6YVKsfyvESu4uVBsjJYbMSYNJpblC
	7kadJWAWGZ+nDDz7QoNzbFuK0N7XzOPCRgx/202W6PHokYDN9+e3KbKqxx3n5cARUaL/FpKaPhh
	6uFgeBG7OPJgrrCmpck8E/hQfZoxikdDHg4XphbMWmGuH3GueI7OyA4TWkXBnp+27VZOrQTyYiN
	EmpBR+tEXiw/DOUT//CJZukUMUBdj+eidiO3SFC5HVjpAkVW
X-Received: by 2002:a05:6820:4b0c:b0:6c3:2390:c293 with SMTP id 006d021491bc7-6d43e80cbd2mr6577666eaf.32.1790361053750;
        Fri, 25 Sep 2026 11:30:53 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e8beb374sm3181560a34.10.2026.09.25.11.30.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 11:30:52 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-serial@vger.kernel.org
Cc: Vineet Gupta <vgupta@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-snps-arc@lists.infradead.org (open list:SYNOPSYS ARC ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list:TTY LAYER AND SERIAL DRIVERS)
Subject: [PATCH] serial: arc_uart: Use platform IRQ helper
Date: Fri, 25 Sep 2026 11:30:50 -0700
Message-ID: <20260925183050.56839-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Avoid calling irq_dispose_mapping() by letting the platform_device
machinery handle it. Also enable possibility of handling -EPROBE_DEFER
and other errors. Handle as early as possible to avoid doing unnecessary
work.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/tty/serial/arc_uart.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/arc_uart.c b/drivers/tty/serial/arc_uart.c
index 3988e5958896..b46b057a181b 100644
--- a/drivers/tty/serial/arc_uart.c
+++ b/drivers/tty/serial/arc_uart.c
@@ -30,7 +30,6 @@
 #include <linux/tty_flip.h>
 #include <linux/serial_core.h>
 #include <linux/io.h>
-#include <linux/of_irq.h>
 #include <linux/of_address.h>
 
 /*************************************
@@ -571,12 +570,17 @@ static int arc_serial_probe(struct platform_device *pdev)
 	struct arc_uart_port *uart;
 	struct uart_port *port;
 	int dev_id;
+	int irq;
 	u32 val;
 
 	/* no device tree device */
 	if (!np)
 		return -ENODEV;
 
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
 	dev_id = of_alias_get_id(np, "serial");
 	if (dev_id < 0)
 		dev_id = 0;
@@ -607,7 +611,7 @@ static int arc_serial_probe(struct platform_device *pdev)
 		return PTR_ERR(port->membase);
 	}
 
-	port->irq = irq_of_parse_and_map(np, 0);
+	port->irq = irq;
 
 	port->dev = &pdev->dev;
 	port->iotype = UPIO_MEM;
-- 
2.55.0

