Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444734;
	b=ruadZ25xX6qc8m1DOEbbmBdFD9vVN1GDuntD36KATqE8J2x5CVlEcIR5juLYzZK/BmTO
	 tVd164l3T3FRo18ccTet6UiN1jf2hwT+LwSIN0RL67Ta82ZtI5fZIKFe+YGYeaftfCxk6
	 68XgdsrpRC0FS5ccH5N30rfSUBw7VJxAZf7Nx0VxIgtBvpoZ5Ydeiruviumt35c/8iZSd
	 Qq66IYNUSGl7SsdOqYYkOq/4domm1KV4IyInzIFtnXB0JWOZGg5Bb6eu40A1Hg/HW17KM
	 kpjdjngXkmZ8LjDpvQEfh9zmRcg3eeXfBR0waWX9jitHMB68jUq7jer+deOe4gC3Jjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444734;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=1aY/ovidFv5oOqnqGNioiPlwdlj0XKYaRdg6c0us2fg=;
	b=PLNBwAAC+GMbNe5fKut9a/ptJUDGam0/fq7szVcTXXUNMCBhw6EeZselhJ8M8Vr+mrTW
	 +pSR5srE+89QkGMQ7iuIhLujm42jWpPQXizELGWGTIcs4fcLK1IJ8v2SoRfVJKc8P3zBA
	 Nl77svFMhyrRveHUtf3EwF2BZOWj2j6TkvOM961c72IRRy99ZAJqAOHFa8WLxuxIiGuZO
	 mCYF83NvuAli4PVbjlaSKo/YLMSWrbb1pSEv33dzAQ2PVt9hhS0Erkbjth3c8CL0yOhNQ
	 2fFKh4tVNsLJHrzc9iME5w4VgrWcxakCs+lI7Ki4BLRto/F/sh9/WbzLN5uUUyxoo/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DztTtqai;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60629606A327
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:18:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60629606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=DztTtqai
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E65CD1A1246;
	Mon, 19 Oct 2026 21:18:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BA22960582;
	Mon, 19 Oct 2026 21:18:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C749C10328C52;
	Mon, 19 Oct 2026 23:18:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444727; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=1aY/ovidFv5oOqnqGNioiPlwdlj0XKYaRdg6c0us2fg=;
	b=DztTtqaiMFNxQyeT/XjiWwK1V6UffMiaMoegSAVrYBY6q+Sq5lG9Men7q2iCjuO3qYEusE
	LZJfVRHOqRNva2Ht11r9c5SzJDXU7oaXb8Xgw8qfD+YkgSDQpAlnozdmiGIKVWwzPDQKMj
	PuYiw6Op4ELUS+ooThQFuvY3BxCjhgM8h+wnw3H49sbBoc7Qr2WFRFtLlKeKmSmigS7BeH
	VBDRHs3uTitLTuTm+IBSSLJYZ9roCxTB+AwmWtHMyLKgSKcnxbdSScA5MiuZ7NVAi6JoMq
	T28SUIn3TtaE+0j55Kt6jBMRlVHqzGJ5m7tkb0th9fHuAEGZx3qOQV8Hi808tw==
From: alexandre.belloni@bootlin.com
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/19] rtc: asm9260: use guard
Date: Mon, 19 Oct 2026 23:18:04 +0200
Message-ID: <20261019211827.126262-3-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-asm9260.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-asm9260.c b/drivers/rtc/rtc-asm9260.c
index 705470ae8428..422c2e5d83aa 100644
--- a/drivers/rtc/rtc-asm9260.c
+++ b/drivers/rtc/rtc-asm9260.c
@@ -116,15 +116,13 @@ static irqreturn_t asm9260_rtc_irq(int irq, void *dev_id)
 	u32 isr;
 	unsigned long events = 0;
 
-	rtc_lock(priv->rtc);
+	guard(rtc_ops)(priv->rtc);
 	isr = ioread32(priv->iobase + HW_CIIR);
 	if (!isr) {
-		rtc_unlock(priv->rtc);
 		return IRQ_NONE;
 	}
 
 	iowrite32(0, priv->iobase + HW_CIIR);
-	rtc_unlock(priv->rtc);
 
 	events |= RTC_AF | RTC_IRQF;
 
-- 
2.56.0

