Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793389831;
	b=ZCfywjTdTQUOGEs0bwJGAeg2y00nl82PCGgzEZnrpdzahLXk1gbwNrciQGcVnAfooLAl
	 TN3FI+jP57xorHDvXVJCL92+kx6drKe4ELgeYalh07Ia/25pb+RPBkyChNtaj+pW7UWJu
	 ePEVr00auegUjcbxLWfP43LghFJg0/78ww6gCa8TySsqJodngRnl6fVc/jvsjjou9mcfJ
	 Qoa+DF+gQ6h7SFtOaOZX37lerXdDlBZxNhH0nZaIeXKrlTY+Gj8tCw7U5UvWIwG+dcL/u
	 0/Nn1Glsmz7xjXfz0pvkbjfBKhhVGcraJCEFZ+krQ+hixWzUBEgPRhvtitE6ZK8tZ/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793389831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6snMzTb+JvWCKUInfh9pIostURAAoVzKiUmt0eO+WnI=;
	b=Zs7lhNw/KCv68EG1rp9PSbJMdLjIonz/XHWJ8KtsdQ0uABYHhRzv8BEAkYzKHBAJrAzb
	 f5KkqB/KOTuzw3mtgbOR7wTW79G/kyYq5ibwQrV+VylfMfNPu242Wsq2aQalihxKivqwI
	 WjwzEEx5KCnzus11CfUgCnVPFeFytwBz8mtjDp3LBKji2CrBeWqYgbVlfCpcbStbZCzCX
	 vn9PNlsac/xRgtXPkDp3ZWgwSO0sgzJUSNv/wTw03GR69AnyzJcqYiK+aFZJwqOgxaOj+
	 qZC2ybEFKPtnbI7kCNGb4W8RRnyULuuG4fQlV2+FAoVdhv2LElxfBpUzRGj++JpAGjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOoEOD4G;
	arc=none smtp.remote-ip=209.85.222.42
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C62606A323
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 19:50:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23C62606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hOoEOD4G
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-98c78660542so588476241.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793389830; x=1793994630; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6snMzTb+JvWCKUInfh9pIostURAAoVzKiUmt0eO+WnI=;
        b=hOoEOD4GrD1rj+/jlK6vAJLtx725KtQwcw9r+UgKd+FL3cuoo47HpArBVTUWw7qe74
         f6T10mO1UB1TecbX9S0EDjoGA9rzyprG6/CARGgK2NejFu9Yrm6RKrVCV4nuZcjAtK+q
         lET2fd4OQlYBpfaidjPz/DO7f8YxOfhEg4VCAKQmsiOLaCP5ByruTh8t4G6L+2Jn8f6Y
         iGI7ugOroZHo6Wn+MiZ1EX6eL9vMIhLXs2mdhSl3AXN4BRX+75Cd7Owy025cI80uHkKb
         jzv6DXEVgLHzIVAO7NjJInmdwNNsdRjvhfvXBfR6mzzT0/ssHXpLSAJYH38JOlHOAw2/
         PMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793389830; x=1793994630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6snMzTb+JvWCKUInfh9pIostURAAoVzKiUmt0eO+WnI=;
        b=qX3luq1kpqPOIk/FyuG3hv5j4NWx6NA4GLicw+9OgGcI67+//60IQbEoqRiw2iEo9d
         k6to+92tRCWdFbquQLrjEtDIPbZlZpS1q6cZsn52I2Ic8mfNZtUpBF+xnmPFvyeBaxpo
         etdK/L2vCat+QNwYmI6N08fdW7UtLSZ7JG45JCER21LpYrx1cHQFeblFFZoUsXRjFO7U
         B4Y3WAa3ZwxK759qRr0INXr3DbF+WGzLrydNFDvDA6cspg8RtghOQFeTgDbFM8CyrTRM
         RjgQivZbUelA94looQrP/7diOJt5L1bnRIE1N4xAUGRvIPggfycWgV53Bsb7OegTWTHC
         Kg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBzd8oAAfXoycct9DJpaisjrMBxBT+Wn0F3ftiwXC0comyyQpFWTSMfE1oE84Hay6vTD/Sc1rCe3cTXL44E=@vger.kernel.org
X-Gm-Message-State: AFq9FYJWtrmbPZNnwcbffyMFNVxQNBLaDtVQfK4iumieUP0KU8i3qiQB
	VkbjfcKVQwInFvljaSttInJz6ZgAgOhvKg5lfMLiJeaXMJ08MM21InFBvLMV/uaF
X-Gm-Gg: AYBFou3e8nDsDRtxC8jqtCPRFkQIP1llragD1Bl4nJ4nFQxjXAmhjecvXL/9JxkH4YG
	KvpW87l+ufy19vKSrdpQhUSEefEMp2BHNWqeLyPT62QH1QqcoynHjO+CtdHVq8f0wp5mWDd0z1N
	XMpLWZgLkF1qJSEj8WqHtwit4onDUPTaRjdQ9h9NH/Duyi2pX11hcTAwvjxgY0ZQwLlOCOZfdad
	5SzLq1GKwE/tdHn70B5f6MuEprSZjX8rjyyakGPgkknRT4iDAQ17z6PS9bf7HnzyUznRc+Y8lqN
	5J4lGP52C2Hox49dzf+kmkJXaZ0rUL6BovOCH5dx6Ht3toQCYwaG/FWPTnGoUxXzJbr9vsD/DLO
	22DD/anU7mqUiK4lW710M24cwgJgq5wB1hJBC54abvz3xOvmUonPzVxe+/8zHTjTTL5VJFmmJd4
	XTFphDGNwCiW9CaZOuoHVZGI89Cn33l6P1d0f/uUIOTvlDxbtLJX3Mz3z1w4zwNlfo09q6mYUPD
	Radz+04uhlgvqa1wynuVKxySwVhpZQxNkhg6nu65zEeh4R1wjVS4LAFygeHdITSEEZOGfY+0a5I
	6DqN5rRymn77YWZhEzXIHRYMciD3ixEXySwQx8o=
X-Received: by 2002:a05:6102:8086:b0:7cc:32ce:4c5e with SMTP id ada2fe7eead31-7d0726b4e19mr1974710137.16.1793389830084;
        Fri, 30 Oct 2026 12:50:30 -0700 (PDT)
Received: from munique-a520 ([2804:3bf0:fe29:ac41:2d94:706:4bfd:852e])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5ec69bf34c0sm3449419e0c.8.2026.10.30.12.50.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 12:50:29 -0700 (PDT)
From: Munique Feitoza <muniquefeitoz4@gmail.com>
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Munique Feitoza <muniquefeitoz4@gmail.com>
Subject: [PATCH] pinctrl: amd: Clear interrupt enable on spurious IRQ and skip unhandled EOI
Date: Fri, 30 Oct 2026 16:50:25 -0300
Message-ID: <20261030195025.5153-1-muniquefeitoz4@gmail.com>
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

When do_amd_gpio_irq_handler() detects a spurious interrupt on a pin
that is not configured as an IRQ line (!gpiochip_line_is_irq()), it
currently only clears BIT(INTERRUPT_MASK_OFF) while leaving
BIT(INTERRUPT_ENABLE_OFF) set. Unlike amd_gpio_irq_disable(), leaving
INTERRUPT_ENABLE_OFF enabled allows the pin status bit to keep
re-asserting in WAKE_INT_STATUS_REG0/1. Clear both INTERRUPT_MASK_OFF
and INTERRUPT_ENABLE_OFF when disabling a spurious GPIO IRQ on both
main and RGPIO banks.

Additionally, if no GPIO interrupt was handled (ret == false), return
early before acquiring gpio_dev->lock and writing EOI_MASK to
WAKE_INT_MASTER_REG. This avoids unnecessary MMIO accesses and spinlock
contention when the IRQ line is shared or asserted by an unhandled
spurious interrupt storm.

Signed-off-by: Munique Feitoza <muniquefeitoz4@gmail.com>
---
 drivers/pinctrl/pinctrl-amd.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 9fa752f55..428440949 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -671,7 +671,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(amd_gpio_pin_reg(gpio_dev, irqnr + i));
 			if (!gpiochip_line_is_irq(gc, irqnr + i)) {
-				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				regval &= ~(BIT(INTERRUPT_MASK_OFF) |
+					    BIT(INTERRUPT_ENABLE_OFF));
 				dev_dbg(&gpio_dev->pdev->dev,
 					"Disabling spurious GPIO IRQ %d\n",
 					irqnr + i);
@@ -722,7 +723,8 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 			raw_spin_lock_irqsave(&gpio_dev->lock, flags);
 			regval = readl(amd_gpio_pin_reg(gpio_dev, pin));
 			if (!gpiochip_line_is_irq(gc, pin)) {
-				regval &= ~BIT(INTERRUPT_MASK_OFF);
+				regval &= ~(BIT(INTERRUPT_MASK_OFF) |
+					    BIT(INTERRUPT_ENABLE_OFF));
 				dev_dbg(&gpio_dev->pdev->dev,
 					"Disabling spurious GPIO IRQ %d\n",
 					pin);
@@ -735,7 +737,7 @@ static bool do_amd_gpio_irq_handler(int irq, void *dev_id)
 	}
 
 	/* did not cause wake on resume context for shared IRQ */
-	if (irq < 0)
+	if (irq < 0 || !ret)
 		return false;
 
 	/* Signal EOI to the GPIO unit */
-- 
2.56.0

