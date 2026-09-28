Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7DC4CDDE3;
	Mon, 28 Sep 2026 13:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790602932; cv=none; b=RYCT8X1al6Mnaw2u1ZxI4TVIMD5lMcaSLSVCuBS9gzsylZYwZ3CspCzJgJIhf5kKZKJZ8gzyJ6yEOyOTRnm+hZtFKihe2sKfX8jgichZ1Pogy+awIkNcdsFyxy0XQjp+tkziIaPfZg6fnD9+mlHbCNw2nWi2J40NlWPaZgif4lM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790602932; c=relaxed/simple;
	bh=tMntdNFlrJw1ooW6JCFNS8zExzsNbHQmLM2IrRQC+8E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iDl0VqPId+IV4iNJq9eWwxDJJcKRxFlzcN98+4R5V3iolRyryqVI6hDKusgmOwfR+vZw0F41nZz7Ugnbn42YSiVOPf1ffKO4RbilK3IQW+wj2IKLVUViNk3Eac2xVuwcq4rSIFadxQC2fchT5KZHs13Kx1g+86YJUg2rQ/nFJ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=a/YqVKu+; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="a/YqVKu+"
Received: from LAPTOP-99KJFSET (unknown [58.216.104.98])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4f5d6f440;
	Mon, 28 Sep 2026 21:41:59 +0800 (GMT+08:00)
From: Hongyan Xu <getshell@seu.edu.cn>
To: gregkh@linuxfoundation.org,
	vz@mleia.com
Cc: piotr.wojtaszczyk@timesys.com,
	johan@kernel.org,
	make24@iscas.ac.cn,
	kees@kernel.org,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn,
	Hongyan Xu <getshell@seu.edu.cn>
Subject: [PATCH] usb: gadget: lpc32xx_udc: cancel pullup work on remove
Date: Mon, 28 Sep 2026 21:41:58 +0800
Message-ID: <20260928134158.117-1-getshell@seu.edu.cn>
X-Mailer: git-send-email 2.50.1.windows.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa0e8403a1503a1kunmf3b98a98200231
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaH04aVkMdHkoYH05CHk1KTVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlOQ1VJSk1VSktPVUJDWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=a/YqVKu+cl/JdJzhOku1M4V7jBVYfxP8NwcttM9Gl8Z8x4FMD1Oj8R/E8SSNC9aqM8TPxSEjlpvBCoWlrU0soWlyOfHBUEZMoRyff6UieDJ924GkiKVtU3EssjxCRCf1TV3y1x19WtLMmyXNZErLNtBPgdAFbPKw/a+7L1TDufA=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=hRxg82xUfOW9mDQeH10Yx//tywA8mAwY9WlS188BwMI=;
	h=date:mime-version:subject:message-id:from;

Several device interrupts can queue pullup_job, whose callback accesses
the UDC and its I2C transceiver. The IRQs are device-managed, so they
remain registered throughout the driver remove callback, and no path
drains work queued before the resources are released.

Disable and synchronize all publishing IRQs, then cancel pullup_job
before putting the I2C device and releasing the UDC resources.

Fixes: 24a28e428351 ("USB: gadget driver for LPC32xx")
Signed-off-by: Hongyan Xu <getshell@seu.edu.cn>
---
 drivers/usb/gadget/udc/lpc32xx_udc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/usb/gadget/udc/lpc32xx_udc.c b/drivers/usb/gadget/udc/lpc32xx_udc.c
index 044c31869cfb..0a784c9252c5 100644
--- a/drivers/usb/gadget/udc/lpc32xx_udc.c
+++ b/drivers/usb/gadget/udc/lpc32xx_udc.c
@@ -3184,9 +3184,15 @@ static void lpc32xx_udc_remove(struct platform_device *pdev)
 		return;
 	}
 
+	disable_irq(udc->udp_irq[IRQ_USB_LP]);
+	disable_irq(udc->udp_irq[IRQ_USB_HP]);
+	disable_irq(udc->udp_irq[IRQ_USB_DEVDMA]);
+	disable_irq(udc->udp_irq[IRQ_USB_ATX]);
+
 	udc_clk_set(udc, 1);
 	udc_disable(udc);
 	pullup(udc, 0);
+	cancel_work_sync(&udc->pullup_job);
 
 	device_init_wakeup(&pdev->dev, 0);
 	remove_debug_file(udc);
-- 
2.50.1.windows.1

