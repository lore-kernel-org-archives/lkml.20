Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444781;
	b=13yLo1e3xvjRoMC9OY1XXOAd9BEJQjY8F4y+b+HPxDBWKcnBvi1uqWWpEaPn/GdSjf67
	 FyM01PA/cLRfS+a/3CUil29GFFSQaISFY9GWB05Dbk0b1BHe/6KfIDDauS+c8bzd1c1zX
	 qyt+pGCQ+vsxKFgfkMnT3QgXFBBoiHLhXqZzEwY7DpgDAWqpO+d+KMo4UCUkvvwsEDs6u
	 7ZQ+nYeFhG2A5h6xbnq66SCyyk/2AUXltXda1dzZRjPf+kZcr2Uq9LQ3KxFrgIX6p+xuq
	 BL+8ec8h/WQlVm/lPgLZ9powo5Fc/9of2OJwHWg++37uAlyScBxRdR/WwGtV8Lw5nig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444781;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=CAFcFXPQgjIyCq4dIDXD81hgSPAzF5RMgOAUClVWhlM=;
	b=aq54lK5Ec1kmTG6OkRLDHDDhMeQ3mdkG1M45/4FiS5YmEh2p3E2eu0f0+Z5VeNRM+Hak
	 o83q4AtSXKIdtvxbhltb5wtCtt3ca3Rvekz27yPL6CtvhVdvWMlMTZkQ5P3Zy/lnAcwKv
	 xmWz1+cFHIi7BAec2uNK8trsytd8i3FT1j69swXdhfPpf/67durJsOcRZR9DmCU9xifIa
	 9h/IDvwgsvqNXkKNCVE49iLQlUTE28wz5vqT4tN0ohvQD/4TN247Hv0faqHZLIZnH6tgM
	 cHk7OeE9hxo4iBLcOYk0HtGjAfCm2vrcp+MczUJ5/Gss/MytCapqRl/QISUYTFPD6/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2GYzGmIX;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E40606A325
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25E40606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2GYzGmIX
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E563C4E4127D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AA2C260582;
	Mon, 19 Oct 2026 21:19:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0A98310328C52;
	Mon, 19 Oct 2026 23:19:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444779; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=CAFcFXPQgjIyCq4dIDXD81hgSPAzF5RMgOAUClVWhlM=;
	b=2GYzGmIX61GUjdLGgFMzI3wrvZDgiee82SicXjaYBWvmwxa3QyckyudMQefIJ88X1cT7+/
	Qbt7/wJ65sTkR2hsKjgwNs7Y76cx0x61l8S68hYuWeF3L7GAmnvnyet+mj2853m4uazjui
	5/qsjjPWg/oKd59NmytiarYBpp9+4PZ3lYD2YUB9yoNlvoMXMWN1FxliJFcvjEOzmH6+Dj
	H5hGz4jtYWKqkinELx7vR6L9n7gCbzx/RZYGWGsvkj/CH2OBddZHA7xoM3CRn26Q+aNuly
	/qHFlLine7mkAAigpCfRQuo20NLXBsPyGFYzgHXd4xpbpRyKtGf7Evdg/X1S2A==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/19] rtc: pcf2123: use guard
Date: Mon, 19 Oct 2026 23:18:15 +0200
Message-ID: <20261019211827.126262-14-alexandre.belloni@bootlin.com>
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

Use guard() to simplify locking

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-pcf2123.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-pcf2123.c b/drivers/rtc/rtc-pcf2123.c
index e714661e61a9..22c626d57090 100644
--- a/drivers/rtc/rtc-pcf2123.c
+++ b/drivers/rtc/rtc-pcf2123.c
@@ -310,7 +310,8 @@ static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
 	unsigned int val = 0;
 	int ret = IRQ_NONE;
 
-	rtc_lock(pcf2123->rtc);
+	guard(rtc_ops)(pcf2123->rtc);
+
 	regmap_read(pcf2123->map, PCF2123_REG_CTRL2, &val);
 
 	/* Alarm? */
@@ -323,8 +324,6 @@ static irqreturn_t pcf2123_rtc_irq(int irq, void *dev)
 		rtc_update_irq(pcf2123->rtc, 1, RTC_IRQF | RTC_AF);
 	}
 
-	rtc_unlock(pcf2123->rtc);
-
 	return ret;
 }
 
-- 
2.56.0

