Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794292879;
	b=pjuimw8JclRXCsW2GDZEMBUcNepWYwjeYwaSqhQTubb6XA8T3QInAZcRjMgpjOgYRv9/
	 eTDD8XpfIoXZtPLjieU6mcqcltYJI5fBSHDvF0nf1S8QDcmWGWctIHt7TVehpv9AA9bsB
	 qaVhNGr4Xa3Vt9nmDOnorYmGFn2J9SVTXJ3BuYRX85EPKN0JqL9IUPxanjUDfP3p2Vhv9
	 rys0jGGB85KmJ6l7QEgzUxRzwHEGPpBvEBCs/0MubqmLn3s7pTllZ2j2BsMvIEPvBUhuc
	 pURtSP9ZWpXG+eg2W/a+OKJ5PGrFoHmhhJe2lkRjhGUHbrPiZY306NTD16FSUaEuUsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794292879;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=teyQ2+VYGBxUxxmzECjiOKDl2bPB0P335b7uU7olMrw=;
	b=Thbfp+mFusCbwHT1geli+AQY5th16dMzMy90xZnpTLiBTqz9Pq/cCFSCJ6qlgB8yJOvH
	 CCmvSZYq97+TAZGHHI2AQDH0B16IAoBSQ6iE4rdweJh7/FxE8JoSn81fZ+THLPyTTYDkc
	 TqledE4XUNzmLvgrjFhs/OE+ehlhxMoP7M64NBdGPiT7WxWOmfWaEzCueo5bjGpmNCxmB
	 9xXn6JxNJ3bUzVkcX4epslsV70I5w/WrhUUH0OGATL+oshC4zXjx+lko/xbAaFxdSLY+n
	 dU4/4AFNXlOWDDX3r4W0HCXiQHTsm1YBwICgbeYn4+stGIYgsDVY0dsQBmlt/CmyTmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YCQwVVwT;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08D7A60A2609;
	Tue, 10 Nov 2026 06:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08D7A60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YCQwVVwT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YCQwVVwTxKyF57w6Is+rJtEKTMNYNwKl67uaxig1NjxdnH4Vj9hpTF+UHTgxkk32EHEumNq/rA7Lp
	 /So2/H/QGZkd+O6rz4vRouol8vyRzv6ID5bIY1fVWVKDHwmUOEbGgAEjzrhIdoY2czCmkwoSg4v1At
	 zGpvcqZcdpQtdCok=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26af2bc8cc80-07a52;
	Tue, 10 Nov 2026 14:41:16 +0800 (CST)
X-RM-TRANSID:2ee26af2bc8cc80-07a52
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af2bc812f6-aa11a;
	Tue, 10 Nov 2026 14:41:16 +0800 (CST)
X-RM-TRANSID:2eea6af2bc812f6-aa11a
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/22] usb: isp1760: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 06:40:56 +0000
Message-ID: <20261110064105.20335-14-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/isp1760/isp1760-if.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/isp1760/isp1760-if.c b/drivers/usb/isp1760/isp1760-if.c
index a64190addba6..e09d509b4de0 100644
--- a/drivers/usb/isp1760/isp1760-if.c
+++ b/drivers/usb/isp1760/isp1760-if.c
@@ -94,7 +94,7 @@ static int isp1761_pci_init(struct pci_dev *dev)
 		return -ENOMEM;
 	}
 
-	/* Grab the PLX PCI mem maped port start address we need  */
+	/* Grab the PLX PCI mem mapped port start address we need  */
 	mem_start = pci_resource_start(dev, 0);
 	mem_length = pci_resource_len(dev, 0);
 
-- 
2.53.0



