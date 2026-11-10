Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297514;
	b=kpwMJkoNo4i+U7jZuQoFferT4xMvw6jDrQ7VMoMBk+aiAx/E02r1DEVM7toRohOHYnLG
	 /vgIBXg8SID1RIhoiPyJrdi7fe2KNdEadVPjFP/SAQutEpsh6IiLclll+cICSfIk6xBTW
	 6ouTGKTOkBToI/8b4oCSI0pDE5gMEupbdrnqGh1w4r2RkO/I7TWYPSsxexU17OKzIASic
	 CLHHeIQuAzdE21JJea91mivmmn0eX/tVB0v8mmghRFs8MCqCII414iaAU7z71bVT7o4mJ
	 1ZRWOVLVOc1t4kfpN+wvtPCISjYOwdADe9uzAHHIibw8737/CTEg46nn+ssmjWe+tqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297514;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CBYhq2V6qx8ka22PZstjMFiYY56iiX/LfNGkcUdFc+c=;
	b=DVhpFkFLjELiNnjqdIBo4F75eTnSFom7BzEZwC4FA5jqKneqK0XTay3kv+dTmSV4jwf8
	 1MM8KgajvZUy4NCL/NiTXojqiX+cxPK6ToBX86qwIOGBITWEoGiA+qYLsh8XIfRs/hXtg
	 /oubm0/53xdIVsldtH90Qt4dmHkho3u6aKtLW+pfy+oXVyYo91LO0W2wnfrJmaMZWWSxP
	 N00gvFRAtW17vPOAZHXjj9+xYUvMOwYQmZMkchYNzBcFKbV8d3DRktx1faJ0b+COjjAhN
	 uWuqRwNCDgFOKoiZsSsLARwzxah6HLamts2kwKGOLOl99C+QNhGhGQlhKAfPNNPPSrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LxMozntu;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C02D960A2623;
	Tue, 10 Nov 2026 07:58:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C02D960A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=LxMozntu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=LxMozntuiweH4+VNcfLYpffcWtMV231UT4XlDbgmW0vyJrZ/4N7jgH6M8UDEwT+D76qjXgTxs5JqT
	 V2+IG8jYDZgkDYEzP5h9yzY0iGKqUB1mya5nHgXjjLM/lg3HZ8M5p59farRlr83sguKJaFYvlDZyq8
	 nvyCcwQxy2ut0GyE=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app01-12001 (RichMail) with SMTP id 2ee16af2cea8ff2-a83e8;
	Tue, 10 Nov 2026 15:58:32 +0800 (CST)
X-RM-TRANSID:2ee16af2cea8ff2-a83e8
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdd6;
	Tue, 10 Nov 2026 15:58:32 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdd6
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/22] usb: fotg210: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:12 +0000
Message-ID: <20261110075825.24946-10-shishunbo@cmss.chinamobile.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
References: <20261110064105.20335-1-shishunbo@cmss.chinamobile.com>
 <20261110075825.24946-1-shishunbo@cmss.chinamobile.com>
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



