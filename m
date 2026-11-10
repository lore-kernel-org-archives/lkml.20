Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297512;
	b=GBxM87meYzYPuNnqo1mO7fWZdeXuYlU3MXVk01b5jTDP8yB/y74eQxEg3eRumqnd60Rh
	 8unWBaQXmgF0PZC4bihbxblnRczyuG6XWTRmTN8/v941pehU/UlaYJhSobBeHhXiIbNvk
	 CXQFgFHgZsqrJBHR/ai7FOky12UvG0XZl6jRxTGaoigb64zanHD6QIFw0mLyKq4wwOUDE
	 t+6SFJbv57mDWc5Rz3glrz+gfDsyI43zZjA6WBZVm16FIoQc/06iMKiXSPw0OL62oMux2
	 v+ia7KzB5bjFq4xPJbQGbpWFdS7RVV101Lju/uLsFwmqbVdy7nmrpzBdcKnJOaN1/jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297512;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=E779vxBqds6yPR6ZwX/UxnHoDlIF7E6mtXjWmN/CZEc=;
	b=I6eminrmahitMt41HB7iZn4ZzdfWl/5qgOpGnQ2ZoMLoq5lFQ9HhIXU6alJBvf4u0Kgy
	 V2cD3KXpmVaulOTZWYp4nJcug21hTyNP2zYI3tNYdmt9t8V9PMycpt2LtCblm/Fo+Jfgg
	 Z5yKC6M4/hNheHLCLhoTQ7ZnsCXS8dnNcDSqK4bxIiqBSUwkjIsjv3x7YhynzUucW+GDu
	 XWtBD6JqxtfH0/99OCOReUUpJ8AYoYatHRYOV5GQPT5NpeET6xmRw2vQ7jscQQOP8moAE
	 3v/CEM5wU5kLpNcCtfzbm+u3KCYhGUdQi6+HZg0QBg48/RLHKrLQIY37noL2c4sActQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WQebO8XU;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D3EF606A334;
	Tue, 10 Nov 2026 07:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D3EF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=WQebO8XU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=WQebO8XU7L9hcRWtZDeAWjU2C24xhIXLei58uCJQncUEgEfYAMdqtIVHbm5vmLsVazkzorpVxscMn
	 sG0A2bv+SDLIvwLLBYdN37PefyA1ZVcpn5XYKFA0IESuyN3BqIet0VP2pGTLHvSwTgQdvQQFh5hy4D
	 X97bb80ybvFak2cg=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app06-12006 (RichMail) with SMTP id 2ee66af2cea5655-991f5;
	Tue, 10 Nov 2026 15:58:29 +0800 (CST)
X-RM-TRANSID:2ee66af2cea5655-991f5
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acdc6;
	Tue, 10 Nov 2026 15:58:29 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acdc6
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/22] usb: atm: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:04 +0000
Message-ID: <20261110075825.24946-2-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/atm/ueagle-atm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/atm/ueagle-atm.c b/drivers/usb/atm/ueagle-atm.c
index 61723e7ab351..d569ee93b493 100644
--- a/drivers/usb/atm/ueagle-atm.c
+++ b/drivers/usb/atm/ueagle-atm.c
@@ -2189,7 +2189,7 @@ static void uea_stop(struct uea_softc *sc)
 	release_firmware(sc->dsp_firm);
 }
 
-/* syfs interface */
+/* sysfs interface */
 static struct uea_softc *dev_to_uea(struct device *dev)
 {
 	struct usb_interface *intf;
-- 
2.53.0



