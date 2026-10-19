Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444751;
	b=1Wch7PGRPKMVO3xUX6aOwywCTJmjs/2+xYxWj4HWklBdLPo7QfGDaSIWw9tNe97zx2cl
	 HLfTgScz86+GhSwZwIA10X+6nvBy8PuJ4u4bjtr2knkIIC/T3a+a/D98DPqqRv3jF/bZ3
	 lfmxr+fVrLzR/X+WOiw7VdKC8+ScSCA20vPdrjlYWNsZmv7IRrr5QdRdPR1TG/5N+LUPP
	 bjYNcSLuNf0WOPRKNkK0v9pOXQR26VDKkU3HLHtSw1/9vpwfnVtkWxe3PkzaTsuJGqeJQ
	 LYBUQ0ttc0Upql543grZ67KRbQGzabdJnP2zxozAqtLlV4oV1pFWK4Vlk7StVRU+A4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444751;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=A3KySBfkO0wNf//W+vJY7lgKk6K7hXGdO/qW19nptvg=;
	b=toxWEdhoLO9wUCGNmwZlbBvRF3r/abcihR22x1xPhKrwOoTNq6BeWrEV/h8IXAN3GYt3
	 FRFDkn4RyWboogtkBQqrxpXVzjN1w7mo/L//eDQdkQZhlCnYCJ9V01F2DbXXetHle6ns5
	 Tep2DjPT/l7iXjE7dQuH15cLqncbil23fwjwDEOQxpE4kqH2GQcUu7loWSgW3yDWUvg0P
	 iSUcahZbNhle9mxpxtrBHU4tJ3udYJ5qX3o53x82J/wdtGaUK40RSBqgwWF54PJe129YZ
	 hd7IHDNBaiZyUENceX1ZA0xXNdjvI6mmstJEHGON+ouLjBvQlG5XhHNoyvuq6nCaR3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GZuFzpHx;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C180A60A2602
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C180A60A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=GZuFzpHx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 7A2A11A1246
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4E68F60582;
	Mon, 19 Oct 2026 21:19:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9931410328C22;
	Mon, 19 Oct 2026 23:19:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444744; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=A3KySBfkO0wNf//W+vJY7lgKk6K7hXGdO/qW19nptvg=;
	b=GZuFzpHxX2rs6jdzW1UIdzLpwsAHnxWjeI8v2dCVNvlewU/dcTq6nJM2ucRunrbbNpUR2d
	NCwdqVO/V51Qi1v0SnB/oMAMlPAxOCH+a0nhFBGCRGDogDEt8/XFucAazNZYPEuceRnL7E
	HFoVOMPo8T7O6Y3Dmh97cJgWiN5mZq+k/jwsxq5lafUBfrFovWC3lpNGBNgKd2X6xJ2xmN
	xE8DIbaIeG0sL+DFeeFos9DcG8jgGk2eFFZSXtXwEseuLQR9d2rTMSKoBeAK6Z/X3YL+C/
	AxhsybY6igXL3whReaXa6+yVAIPSMO+o05Ih9fxnNkobDfnWDlidF2zD2QXdlA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/19] rtc: ds1307: use guard
Date: Mon, 19 Oct 2026 23:18:07 +0200
Message-ID: <20261019211827.126262-6-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ds1307.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/rtc/rtc-ds1307.c b/drivers/rtc/rtc-ds1307.c
index 522f7eef3b4a..0cf4836b81b1 100644
--- a/drivers/rtc/rtc-ds1307.c
+++ b/drivers/rtc/rtc-ds1307.c
@@ -579,28 +579,27 @@ static irqreturn_t rx8130_irq(int irq, void *dev_id)
 	u8 ctl[3];
 	int ret;
 
-	rtc_lock(ds1307->rtc);
+	guard(rtc_ops)(ds1307->rtc);
 
 	/* Read control registers. */
 	ret = regmap_bulk_read(ds1307->regmap, RX8130_REG_EXTENSION, ctl,
 			       sizeof(ctl));
 	if (ret < 0)
-		goto out;
+		return IRQ_HANDLED;
+
 	if (!(ctl[1] & RX8130_REG_FLAG_AF))
-		goto out;
+		return IRQ_HANDLED;
+
 	ctl[1] &= ~RX8130_REG_FLAG_AF;
 	ctl[2] &= ~RX8130_REG_CONTROL0_AIE;
 
 	ret = regmap_bulk_write(ds1307->regmap, RX8130_REG_EXTENSION, ctl,
 				sizeof(ctl));
 	if (ret < 0)
-		goto out;
+		return IRQ_HANDLED;
 
 	rtc_update_irq(ds1307->rtc, 1, RTC_AF | RTC_IRQF);
 
-out:
-	rtc_unlock(ds1307->rtc);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.56.0

