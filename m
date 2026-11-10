Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297519;
	b=e6JbIPTKN4RRdWNiDZaXD2wtmWiQ4Tuguohv8ZKtZfHVZ4LJnzg81ifyNDJDRRTdSphR
	 6LVOnmEP2NjUAzLqb89WC4xnpWC/cOMtnD+hTtXWCK2I7lyPsKQtZiiToXqfy0+lHi2p2
	 TuzcP+X9cIqCRnfIQCWg9uxudqYFtDuNyOBfk1R6mq01IZzYPk+5XvVUqr5Yd/aKp/A/w
	 rbgUAz6MDj+3ZBvBusY0UmSKvHF/M8rVzcwaNYLjwpjdtsKLXJgcuam/CJ3HIXfHy7Sbi
	 1vTZcYMQDlUdfZR/wHE/yad/uEmF2U8Lez/wfUnbHs5hjPylKDdxdDZy322FcmV9rOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297519;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZcbuoKcmoM0xdN/PZYv5Je38NiolC63gdCP770nQ4GE=;
	b=S7ISakVmn5xm36Ct/NSHBHvl5SE8XPGro/Y22XxYsbjQUB521bgvbyQambvq3gjxZ74Z
	 ViQ4p42Yg0uxaOuSnrqOilVmDs0f6go/J6WW373Pp9zh/GhkramGGg2yLqIq+vaHh0Mn6
	 PMx5AxibacEA3+xqGAaeCDXc0L6UcrYNhsyLpAHaf91eehW9eRQPWYN0rr8/Xl1K6/baA
	 CE6nCyMxdErkUqNQWQdB9ZABjZtfmDL/ARYEZjwz1zlYPB5aBvTMOGHVSKn0WxZEn0DTG
	 qQChJ/PQBDRefESqwDcgvAKqgpga0v1AqFMLSnGehrxZhcWv24k7Ugnw917/2S0oLpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YZby5YSq;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C3C606A338;
	Tue, 10 Nov 2026 07:58:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0C3C606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=YZby5YSq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=YZby5YSqa41H7CVJBvaot3j/XYgdov/UJW3Kr+JcpurSM2VpmXmUzh0d1/jqm9pFnCda1Hk5qcpil
	 EbVzoyvSp8bdh8PNI45ynKbNsTQiBsQXnOwLA6i9gblyn5DKf6m0iAf6tOaCBNcVhwuxgfrSkZ2/rA
	 2Sx84aCTrnQDonhQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af2ceac5c8-6c6c0;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee86af2ceac5c8-6c6c0
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from  (unknown[223.108.79.97])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af2cea2027-acde6;
	Tue, 10 Nov 2026 15:58:36 +0800 (CST)
X-RM-TRANSID:2ee76af2cea2027-acde6
From: Shunbo Shi <shishunbo@cmss.chinamobile.com>
To: gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/22] usb: musb: fix a few spelling mistakes in comments
Date: Tue, 10 Nov 2026 07:58:18 +0000
Message-ID: <20261110075825.24946-16-shishunbo@cmss.chinamobile.com>
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
 drivers/usb/musb/musb_host.c | 2 +-
 drivers/usb/musb/tusb6010.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/musb/musb_host.c b/drivers/usb/musb/musb_host.c
index 31b061248991..b8a502d2b08b 100644
--- a/drivers/usb/musb/musb_host.c
+++ b/drivers/usb/musb/musb_host.c
@@ -65,7 +65,7 @@
  * (Yes, bulk _could_ use more of the endpoints than that, and would even
  * benefit from it.)
  *
- * INTERUPPT and ISOCHRONOUS transfers are scheduled to the other endpoints.
+ * INTERRUPT and ISOCHRONOUS transfers are scheduled to the other endpoints.
  * So far that scheduling is both dumb and optimistic:  the endpoint will be
  * "claimed" until its software queue is no longer refilled.  No multiplexing
  * of transfers between endpoints, or anything clever.
diff --git a/drivers/usb/musb/tusb6010.c b/drivers/usb/musb/tusb6010.c
index 1d9571f24a56..6a86bebc24ca 100644
--- a/drivers/usb/musb/tusb6010.c
+++ b/drivers/usb/musb/tusb6010.c
@@ -941,7 +941,7 @@ static void tusb_musb_enable(struct musb *musb)
 	musb_writel(tbase, TUSB_DMA_INT_MASK, 0x7fffffff);
 	musb_writel(tbase, TUSB_GPIO_INT_MASK, 0x1ff);
 
-	/* Clear all subsystem interrups */
+	/* Clear all subsystem interrupts */
 	musb_writel(tbase, TUSB_USBIP_INT_CLEAR, 0x7fffffff);
 	musb_writel(tbase, TUSB_DMA_INT_CLEAR, 0x7fffffff);
 	musb_writel(tbase, TUSB_GPIO_INT_CLEAR, 0x1ff);
-- 
2.53.0



