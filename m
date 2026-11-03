Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793691722;
	b=ewqB8eqPEx4wHhj8WZPDLX8ltA1yxSxrh7PUQgMxU8ddyzEzLiA+UAwu6kjj11KCI+c9
	 9qaBMJqf+rOx8+/x1AsDwdQ/ceTmChB9fSXgxkcvJ6xECn1sS5PhSn3M+Co8VNPx2PVWw
	 Uqf7qw05LZHdGDQp3b3SxjdA/Xb2/khvGBmmo78eyoh557abuPYN2r8YtbX/+bamB3cqW
	 CTNi8iAlF/txVfFS9aTUcCtBjlnBdGn68MxsI/6PSMGkGvbPoET2NNyu8BlVHxVc7aUFb
	 XPGZ3rjr9CppSMVQDbV3jn7u9T11yWKB2L9SuAc65QlrR3aQnHht5IlnwnActJPOF7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793691722;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=AJHCnTtZU6TwhUEN7+iIRgCqn2TrJs9oMQPOPWv/cyQ=;
	b=nWCK+tPz7lnn301zhD62RIG5A3nfBmU+z8hqRtjLek3ILENYzGNX7HZPT7i02kgvxtZu
	 OHZK+P/0I4fxmTKRG6PiYI6hcOOi2FsUitKA5sWPLOGtPHvvZ2fU16vDOWcZy6X3EumHd
	 iZ3RrDZ+XuH9P86ev++o8lpAK9L/PrSILzWUCg6Y7VjWBmRYmRBW3X20klrA7GCfhC33k
	 T+4EgONJwhqA3jVdhVlx14K/iNbzGcBzPxTpWJLljqqWZ2FxxNjBdI0iWsvn8/XwALCJu
	 fwSqwzNOn1AsZ8lw4cR5WR49YnxHrpF58L2H4+27uSCOjNLkHSzFiXEEx7kWrT1a4iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HmXmYFoA;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8490606A330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 07:42:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8490606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=HmXmYFoA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=HmXmYFoAeehrdViA9+opjs049IFtZcuNz+VuBUaB/GcUP/7VwBEhGbE4nRxD9+w7HCPpMeB8TpI+g
	 OLMgtXQj82eq1JNYWCxAOqlDmp0RJcvop116eL4W+ZHDDKyCCwo2iebv6WR5i7f2XRIYfg3hLUqMKC
	 uCJdD8GNEO4yXsco=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56ae9904614c-8f327;
	Tue, 03 Nov 2026 15:41:58 +0800 (CST)
X-RM-TRANSID:2ee56ae9904614c-8f327
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from Z04181454368174 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76ae99043d91-f0ba8;
	Tue, 03 Nov 2026 15:41:58 +0800 (CST)
X-RM-TRANSID:2ee76ae99043d91-f0ba8
From: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: tglx@kernel.org,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	zhang jiao <zhangjiao2@cmss.chinamobile.com>
Subject: [PATCH] uio: uio_dmem_genirq: use platform_get_irq_optional() to avoid spurious error log
Date: Tue,  3 Nov 2026 15:41:51 +0800
Message-ID: <20261103074152.1354-1-zhangjiao2@cmss.chinamobile.com>
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

The driver treats a missing IRQ as a valid configuration by mapping
-ENXIO to UIO_IRQ_NONE when probing from device tree. However,
platform_get_irq() logs an error message for any failure including
-ENXIO, producing misleading kernel log noise on devices that simply
do not have an interrupt.

Switch to platform_get_irq_optional(), which returns -ENXIO silently
when the IRQ is absent. This aligns uio_dmem_genirq with its sibling
driver uio_pdrv_genirq, which was already converted to use the
optional variant.

Signed-off-by: zhang jiao <zhangjiao2@cmss.chinamobile.com>
---
 drivers/uio/uio_dmem_genirq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/uio/uio_dmem_genirq.c b/drivers/uio/uio_dmem_genirq.c
index 41c18ec62a45..c8f769372171 100644
--- a/drivers/uio/uio_dmem_genirq.c
+++ b/drivers/uio/uio_dmem_genirq.c
@@ -203,7 +203,7 @@ static int uio_dmem_genirq_probe(struct platform_device *pdev)
 
 	if (!uioinfo->irq) {
 		/* Multiple IRQs are not supported */
-		ret = platform_get_irq(pdev, 0);
+		ret = platform_get_irq_optional(pdev, 0);
 		if (ret == -ENXIO && pdev->dev.of_node)
 			ret = UIO_IRQ_NONE;
 		else if (ret < 0)
-- 
2.33.0



