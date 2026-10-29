Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793256117;
	b=xXz/aQxZ5zp8oWdJ0lJPfkoKqIeVAkkVzS2fUOtN2IlYacFuK8w7+hKK4KQP04N7PHD5
	 HW/opYbjN4PCCocmxizuyjdsYQHciU+Nd8Ji2WM3lAqnt8LWDqGzqenghXMkH7EJLJWCp
	 40Ca1wGP+KORFmjcX5lbZVqKSMgwhpmCuIxGtlZTU6w42Up9RFQJcVBa5ChEzsb4d+JFO
	 P0YoL1VEOpWxBvO+iVuuGzJ4YY+TkP8NIiS/hrtVhrPjVePzlz01QjbBGbeDntWiFTeZR
	 7LSmeN2NnpzC6s9ZP7hU0TNxPx/HlvNdewJVj4YtCympXUeDCREAKM4lBklUpdlL8Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793256117;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=f+yQjPVBcyspZhRv1xZDBbXvdib2kEBG/V7PC7pLt2c=;
	b=1wXdQyzBFs8HWsDrIyafqRguQQxWP811bCqPPe+PAbL3GMAVqSLJI1JX/Aw9ZgCSroSl
	 8i9zPDQm3m2CpIab3Llrs2Yr1RXFErTNdIytGo7pxB0/SVPHr34pZX34oi1R1ch1fguBP
	 Xqpkczt0f1VvY+XkWgkWUrn0atUirvwPMZFsP5Oy7KZmJJxmspUoWoecHRztLoZbJe8R4
	 J+cf/7dkDlf/XLaiu2BBVd8hJB9EEFEg8WH/PZSdtZQA74b7asCUZ6PjICvMoNr2qhrO/
	 g1+VssWomco3MDrAv5vutbCAiJt8EigrxNpgaQtA2sRcQxDILnJgwGTPVd+g/NDqJHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=EiGNa+RB;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6501D606A31A
	for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 06:41:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6501D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=EiGNa+RB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=EiGNa+RBTr6U9qwtXLq6dPK9kTHL+Hup/2BZlQc31fiq54e7C8Oizp2O0nsAwzMp5i4koJ3NGdgdj
	 FhtZvfPyqNLPql/i3+QmHlXi/srj3MwGg1gWlf8hr7mNochhFooV1zdpX1vnXWMy1QirB2lWdw8z8t
	 5q8zlRD0rw16mt+w=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app09-12009 (RichMail) with SMTP id 2ee96ae2eaafe08-6c8a3;
	Thu, 29 Oct 2026 14:41:52 +0800 (CST)
X-RM-TRANSID:2ee96ae2eaafe08-6c8a3
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr03-12003 (RichMail) with SMTP id 2ee36ae2eaa9136-22f4b;
	Thu, 29 Oct 2026 14:41:51 +0800 (CST)
X-RM-TRANSID:2ee36ae2eaa9136-22f4b
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: pjw@kernel.org
Cc: samuel.holland@sifive.com,
	conor.dooley@microchip.com,
	domibel@debian.org,
	panchuang@vivo.com,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] cache: sifive: Add bounds check for interrupt count in probe
Date: Thu, 29 Oct 2026 14:41:36 +0800
Message-ID: <20261029064137.569-1-zhangjiao2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
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

From: zhang jiao <zhangjiao2@cmss.chinamobile.com>

The sifive_ccache_probe() function uses platform_irq_count() to
determine the number of interrupts and then iterates over them,
storing each IRQ number into the global g_irq[] array which has
a fixed size of SIFIVE_CCACHE_MAX_ECCINTR (4).

If the device tree defines more than 4 interrupts for the cache
controller, the loop writes past the end of g_irq[], causing a
buffer overflow in kernel BSS memory. This could corrupt adjacent
global variables and potentially be exploited for privilege
escalation.

Add a bounds check to reject configurations where intr_num exceeds
SIFIVE_CCACHE_MAX_ECCINTR.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/cache/sifive_ccache.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
index 2acb8bdf06d5..5272c4efe607 100644
--- a/drivers/cache/sifive_ccache.c
+++ b/drivers/cache/sifive_ccache.c
@@ -265,6 +265,11 @@ static int sifive_ccache_probe(struct platform_device *pdev)
 	if (!intr_num)
 		return dev_err_probe(dev, -ENODEV, "No interrupts property\n");
 
+	if (intr_num > SIFIVE_CCACHE_MAX_ECCINTR)
+		return dev_err_probe(dev, -EINVAL,
+				     "Too many interrupts: %d (max %d)\n",
+				     intr_num, SIFIVE_CCACHE_MAX_ECCINTR);
+
 	for (int i = 0; i < intr_num; i++) {
 		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))
 			continue;
-- 
2.33.0



