Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444756;
	b=cLV/hbT3PaQeGweks2TcY4fGrzAPe6swQT06zvJ0TNNyLgjs/XKGgfsbtRSmaUl0aqsg
	 DZ5i/O9drJY5osVgetkObd60uQxCDFTbm3M361vY3SlA4lzNhhhXtBW3F3IrqvGJAva0T
	 EtcjfbTplwZezF4BmwXAOs5ituir8Dj07E01SeOQkWdVB1QrmbbmDg44l/XiaPWbbLtkJ
	 wSZxrWO/tkkdnwFiM7gn+ir0nqUMDPG0l3XzI91j9zgQxs3HW8nmJqW3vvWcZgSdDj6yf
	 /QqRF1O/GrWbvC8MWzAyy9K1mV000qUUXschyjpft2Sx4nkoD1zfifozYGr4aupVU7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444756;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=XEzKTFQ9bTRV2RN61J13fI5VmT4JunXOx6tYvH1TSr0=;
	b=S2vzxQAG1gSzrzT8y4jInbHn/KKqZLbYQJ+CVpqKnIpiEm0YB9q8h23tf/2XvDvTrA67
	 +b+SzfiAElAmp3QETWX6TDX05nXzxBYcUOBkpmiF69c3Jz6io+eHtXqE8edSgcUgkc1Yt
	 5qXhO0omBrciohWE+8bmHV22n6m3/lyMguEp7TVa1SrWwOJZAh+i3+IQAUd2Hy/5w7gat
	 0ghh5XISlQ1fFfs00Oc7KCJpRBqT8iUIF+YpM0uM+QSANarTStLwvmRwoSwjKp7WcyNj5
	 b+GBC1foNplmxRgeyEF6Zpn95VPzigI3293hfuAMHnptGB8Ty0bdsBgpeyEhUN/HZXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hvGNaa4j;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 288D9606A320
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 288D9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=hvGNaa4j
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A66B7C5CD5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:20:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FB4060582;
	Mon, 19 Oct 2026 21:19:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5A5810328C22;
	Mon, 19 Oct 2026 23:19:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444750; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=XEzKTFQ9bTRV2RN61J13fI5VmT4JunXOx6tYvH1TSr0=;
	b=hvGNaa4juhtdKkRo0Ug86nVSFiOoo1PvBDyeNL+uFmJf0e2S0AFSKRkycwiATrbkPQ3Hbs
	6WLw7k1d6zHe3QGMwBqYElr0VyUsbxbulrBG+ZOVx2la2BtczUK4EstTXrZRuToWr4mQoI
	FN4CBl5lFWmr5PXYUDNfUD+ywdZNQgMprqmu/95Hrac30Ru8gtfsvmlysIlKLWFuH+gGCF
	RqWQogzaq/o3VRGA5HjBMHcVCl2Ri3GDv7IidQCrMnlN5BlE3wBJ3dDI9N8xjKgxTllOaH
	ihKJTXB74s4ypfhjAcVk+SngkgDPogrh3eKfwY9g6LBqZZxrBsDke88iNX9RJA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/19] rtc: ds1343: use guard
Date: Mon, 19 Oct 2026 23:18:08 +0200
Message-ID: <20261019211827.126262-7-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
References: <20261019211827.126262-1-alexandre.belloni@bootlin.com>
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
X-Last-TLS-Session-Version: TLSv1.3

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

Use guard() to simplify error handling

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-ds1343.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/rtc/rtc-ds1343.c b/drivers/rtc/rtc-ds1343.c
index 54f6af7886a8..22abec4ba656 100644
--- a/drivers/rtc/rtc-ds1343.c
+++ b/drivers/rtc/rtc-ds1343.c
@@ -312,11 +312,11 @@ static irqreturn_t ds1343_thread(int irq, void *dev_id)
 	unsigned int stat;
 	int res = 0;
 
-	rtc_lock(priv->rtc);
+	guard(rtc_ops)(priv->rtc);
 
 	res = regmap_read(priv->map, DS1343_STATUS_REG, &stat);
 	if (res)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (stat & DS1343_IRQF0) {
 		stat &= ~DS1343_IRQF0;
@@ -328,8 +328,6 @@ static irqreturn_t ds1343_thread(int irq, void *dev_id)
 				   DS1343_A0IE, 0);
 	}
 
-out:
-	rtc_unlock(priv->rtc);
 	return IRQ_HANDLED;
 }
 
-- 
2.56.0

