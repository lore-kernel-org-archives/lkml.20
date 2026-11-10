Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292878;
	b=mgSiOrhGm8FZqRsEbc2ex5UeFvRy+rRRWjDUjJmU+nbZqsrP6qDTfGtL+JIMjB5rfxZB
	 m2o04LLnBcJI8MjFQwfb4IHw2yxn3+Kv21eZQNLu0xXptTQPWkfz53K0qCXTthVW+bmub
	 m/X+/2SpSFzeoYStALDPaxksTL+DpNVpfQPqWyv8SZLnsbw+4zY5DV7+RDqn0NYI5Q1yr
	 RXC2cmc/NSfZ9joTzQJ5iYLnIkpg5c+xb2a6LqCwUJ+jXgdqEoQrIyfFqNEp7HmgVKj5M
	 m1JFbjXGlbaUwhvSEjoNuEy2fLLIPfjoXPkVvXpYYwyyDmRkjRlDN8zEoU9Rdtb/xGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292878;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CBYhq2V6qx8ka22PZstjMFiYY56iiX/LfNGkcUdFc+c=;
	b=M3WSV7PSrpGyDp3j7WFH5AY6WrA0QSJQNkJkRirytkxSZaa1nko+nOaB37Tr+hoZvF8x
	 DZ7MS74Zmn2Z4ynqkD2CHHotFqZ4eC19TnoY2Udyc2PE0lXPkmLpaHrUNDGlHVCsOBJpG
	 lbr9HPstpKhpp2sRtclnxDcCDJuxrdYY96LC3cOhty5Izrhy92nKGtwCj8tbwl88X9Njt
	 O3F08YYobBBpmRjs+TLUEEu8CFwmpb16Xqjy8i9mNWsmyYUZxPv54RM0IWH4s7UDWNpdZ
	 vsvzoo8TmpyI3mjMNfa+hESHz/+06ZQQIb5uKZ4Dm65PN4tJhbCFdRAiZ/IFJbc5Y7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V79mnfoY;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49099606A331;
	Tue, 10 Nov 2026 06:41:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49099606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=V79mnfoY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=V79mnfoY5ldQsgDZivIPZaqGdFxZoSvbOwQ0DNxGHHuaqwwJNKALraaw2LsqH70MpTSADMi8x0j6J
	 /u9n7DwXHae41bEX2A41VUqBkCx2qd9a2SvuuvQF3UwAPgQBxuBcGF1yRR+8GvZBAjYz2z4h0Tbst6
	 SgGcpks8UzzXfMJQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2bc87802-6b8f9;
	Tue, 10 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2ee86af2bc87802-6b8f9
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa10c;
	Tue, 10 Nov 2026 14:41:13 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa10c
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/22] usb: fotg210: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:52 +0000
Message-ID: <20261110064105.20335-10-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
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

No functional changes.

Signed-off-by: Shunbo Shi <shishunbo@cmss.chinamobile.com>
---
 drivers/usb/fotg210/fotg210-udc.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/fotg210/fotg210-udc.h b/drivers/usb/fotg210/fotg210-udc.h
index 11fe67802537..f64339fcc273 100644
--- a/drivers/usb/fotg210/fotg210-udc.h
+++ b/drivers/usb/fotg210/fotg210-udc.h
@@ -171,7 +171,7 @@
 #define FIFOMAP_EPNO(ep)	((ep) << ((ep) - 1) * 8)
 #define FIFOMAP_EPNOMSK(ep)	(0xF << ((ep) - 1) * 8)
 
-/* Device FIFO Confuguration Register (0x1AC) */
+/* Device FIFO Configuration Register (0x1AC) */
 #define FOTG210_FIFOCF		0x1AC
 #define FIFOCF_TYPE(type, fifo)	((type) << (fifo) * 8)
 #define FIFOCF_BLK_SIN(fifo)	(0x0 << (fifo) * 8 << 2)
-- 
2.53.0



