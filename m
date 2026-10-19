Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444787;
	b=jn1jMJqdKLVnAoXtJkp0TD+rsIGshPlS3eNRwLzQFO2g1bDdXw7XOROSYD/OPLWvxJ/e
	 V47HbR9+EOQfNTchi9DXDFDRQ7arlKDbfoq7dGE+7LDXhVylvwHEEEjiwUA/37YLNRmsg
	 YGSodUjJAcRt3Spsh5RVZD0HIpwqDfAFcAXiGFL6V0yDaA2kdyCHaoH1E7MFPMxhrnlxI
	 pjMbuvBtHzXdCSpb/qoSxbCxNV9ovlNTyQRazBQeohEsguQysL/K6j8sv1gnh2oTJvtUd
	 etBhCgTK48F4eyIzqlCeDnJCgSw5sVgJGul776+G+29BvMacx8Hjz8Ug9qebnBXLY2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444787;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=yZjG2IwYnhcLEtk23bjX0dkfBTdvYZcrIyrdACv8Msk=;
	b=y6QoB+AOPFqIy1zufoKbxSA1bNukyP9zxgl7ZWYHJnuv/ILoD1v3maLmHB4Fi8HbfCa+
	 bNraalDGIEbvOprjZ4n0kle0A+v1l+coeyOsNauNoVzi4SKKIp856ucXzyQUbogIkKHXB
	 JX7Lvmmr2qKA1NrEG9BkXXJ4TV/XaJM/R6V3sKrjmqVgL83+SoS9LwE0YFIZr0fMGZz63
	 SEtlmST2YP3KyQfkHEaf60hJjymjCyhlcrLT6HqE2EPkyViTThaTbU5LKed+bpdoTIz8u
	 2kbAB3fJWveoU8hz8JHpH8FiJgoStagiyBbdlPULR8jTOjiudcQSe5kCaELFaBBYkGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CuPFDcOQ;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2702560A380D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2702560A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=CuPFDcOQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 027AC4E4127B;
	Mon, 19 Oct 2026 21:19:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C9B6D60582;
	Mon, 19 Oct 2026 21:19:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2CF0310328C22;
	Mon, 19 Oct 2026 23:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444785; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yZjG2IwYnhcLEtk23bjX0dkfBTdvYZcrIyrdACv8Msk=;
	b=CuPFDcOQ+v4qI8I69v9WKpehVrcXLlDsov6Zg7+hr/Wg0OdoUdbjpFWNy4cf+sIfC87wGl
	L7QzMSstyd7xIlyKRfpiZ7TLdwKb3AqCG7FZOEjpwEeALbRZiG/G9uPZrx7KCdoH/XWp8x
	QiDDhYZNqPZJBhPIT0U6aENC6bB3Vg8UveJiwM51/YveZ78F0Hkioz3mU5yu8lxxM7gzmH
	+dNZJZIhr25yh0ywUa+nWoe+M6N9MappPKkqCLv5ybCCrR3jCTBcDsu0WZ7S4YUJwewrvd
	itMnhEayIBY8SOWdhX93S7OmHYBcIkq+Whxx8rXEXXFPKzpbeL2REvWWSlPWbg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-rtc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/19] rtc: stm32: use guard
Date: Mon, 19 Oct 2026 23:18:19 +0200
Message-ID: <20261019211827.126262-18-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-stm32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-stm32.c b/drivers/rtc/rtc-stm32.c
index d4ebf3eb54aa..1c4e4bd7afe4 100644
--- a/drivers/rtc/rtc-stm32.c
+++ b/drivers/rtc/rtc-stm32.c
@@ -465,7 +465,7 @@ static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
 	const struct stm32_rtc_events *evts = &rtc->data->events;
 	unsigned int status, cr;
 
-	rtc_lock(rtc->rtc_dev);
+	guard(rtc_ops)(rtc->rtc_dev);
 
 	status = readl_relaxed(rtc->base + regs->sr);
 	cr = readl_relaxed(rtc->base + regs->cr);
@@ -482,8 +482,6 @@ static irqreturn_t stm32_rtc_alarm_irq(int irq, void *dev_id)
 		stm32_rtc_clear_event_flags(rtc, evts->alra);
 	}
 
-	rtc_unlock(rtc->rtc_dev);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.56.0

