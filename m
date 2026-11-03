Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793670305;
	b=ngxXqCjNx/b7gVrVBZWt9B2ztpTXWvKUT9954dciJ8zroGr6qnhhtx1MIWeoJBpPPsM4
	 gWVbo+FTlLcrL/dtsJsxcpZDhPSCni3vKYv5XTuH7dkwZdQqhsmBlkpknq/jRm8MGARiv
	 5lRuOQu1i2YjiP++OEaDdoTcnoDpzlkuqOOTOmZGQ1mjSLDh3qTMsRlwTLZftOwsDmfU9
	 J0XyKz6YKythwZhwU5iad1Efbtz66kIsYlyavx1Jyug2idey9bajuNqQLw9fEAty7h/oH
	 1Yo13Uk+pxEKZXcXYr1PvVBWrWSkjUycTY2qx5tLza2kNYoYwCzAzRkBZZ++oB7ngiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793670305;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NAL8h5fNjU6hYhdrPv5ujxCXwUQRFrAUW+j8KRIqdls=;
	b=1HlL9fpO7Vn6CTDEa1SFcJp6fpJSE/Rh+0l87WmqdztYhT48wepjxwf0Y7fnETYvQg0b
	 hNU3rmkaFkJgQbxLuDWeRAc66cgOV+pLdS2kR4gNEEu1sNFXWDb4xHD+birdu1k4W7RsH
	 XsHqmmcgvhAfn2cTjjh6gIKNOlE3Kk8GkrY1a66PNgUj66DBB3uDmZ1DbXSoc7wFNu3Ve
	 via4uYy5vAtZ98Cs/tmWiWM1R8/UW4P+vrfDwCDzGXLyljXHhffLxL8f7eEc3ukev3DX4
	 amzO6uoBFtqAZwc0c7YSZevIC0WkOWeOHOYFo3CjVtkxf4+AO9Nx5BoJdm4vHM3nmnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AMRZJQBy;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F81606A327;
	Tue,  3 Nov 2026 01:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26F81606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=AMRZJQBy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=AMRZJQByJhw4qT9Fx4IHq3sbGn1c2SVbqXj5hQxlz3A9rsenQpboD0uy1VVA12mZvNDLGu3Ubegki
	 73aEBFDhm0Al1wTHQTbf7REVzBC75/iCk4cYVhfxxsc6+9ulyJ9zGQE+DAgahv+N8I0DWvk8fR3M7A
	 t11OW4Bl5DlhbB9g=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86ae93c9b563-2d15a;
	Tue, 03 Nov 2026 09:45:01 +0800 (CST)
X-RM-TRANSID:2ee86ae93c9b563-2d15a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr09-12009 (RichMail) with SMTP id 2ee96ae93c9a914-e4784;
	Tue, 03 Nov 2026 09:45:00 +0800 (CST)
X-RM-TRANSID:2ee96ae93c9a914-e4784
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: Kevin Cernekee <cernekee@gmail.com>,
	Neill Kapron <nkapron@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
Subject: [PATCH] usb: gadget: udc: bcm63xx: Propagate iudma_init() error code
Date: Tue,  3 Nov 2026 09:44:57 +0800
Message-ID: <20261103014457.1255-1-laixiangwu@cmss.chinamobile.com>
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

bcm63xx_init_udc_hw() calls iudma_init() and stores the return code
in rc, but then returns 0 unconditionally.  When iudma_init() fails,
the hardware has already been torn down by bcm63xx_uninit_udc_hw(),
yet the probe believes initialization succeeded and goes on to
register a gadget controller with non-functional IUDMA channels.

Return rc so the probe fails and reports the real error.

Fixes: 613065e53cb1 ("usb: gadget: bcm63xx UDC driver")
Signed-off-by: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
---
 drivers/usb/gadget/udc/bcm63xx_udc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/gadget/udc/bcm63xx_udc.c b/drivers/usb/gadget/udc/bcm63xx_udc.c
index ba91b1ebb..250bb7685 100644
--- a/drivers/usb/gadget/udc/bcm63xx_udc.c
+++ b/drivers/usb/gadget/udc/bcm63xx_udc.c
@@ -1012,7 +1012,7 @@ static int bcm63xx_init_udc_hw(struct bcm63xx_udc *udc)
 	if (rc)
 		bcm63xx_uninit_udc_hw(udc);
 
-	return 0;
+	return rc;
 }
 
 /***********************************************************************


