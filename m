Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444784;
	b=kiCQ9toDLbU5MneYQOi+m7bhS24hsQb79dSIJCmoWlGpLb9HW9DE8UGIlndj+e7l1CC2
	 b7ZGmXMpz36HjAFOzBSt6oJnrpRpbMsDrSbM/SR2r4olt55ops43xNHiEwpNG7rDK26tB
	 o8XTObN5k+WuyWyWKzClIDkXq/T4ij5X1zdof3G5CdYXoY2hi3JPt9grkEvWi3wYv2WIT
	 VpAl2b5xoZhxteIDoeZqMOiNOAMnF7Sk7j1vRVrpyT+LePz3Xyvwb5GpNiQY5vWAlt7YO
	 j3Vsc0CmOviKOtobSw2p9i73AFWcS7aTIFg9nspd+NSKOc772cd1KsPdErWKM7O3eew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444784;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=qBxQYxKuGBQ21fvUZrk2h4HlHhEGKYtEVodKZiq6n6I=;
	b=5a6GpeaxCDqU4p19WPVSF4hLFukHau2ylKIVgVK9lzX/l43XRDnLnEmzLCFdeiyvEZh/
	 z6j0WgMqVx2o/awaMnBQvBkz731Nsn4hOCSxaCYmA/ngaX0qoaAUGTBbJnXRGvbm5iFhi
	 vgtlqwvO8Y2UGvPvBfJzORwOYdEfcPO8xHH1u1hs/6VWhxMLbDZoR0PmlU3hAmGAGp/CM
	 A3jSMQJZcBlhg5s0qLGCx1VnQFSZUmuGsY4igvC+fHgtEzrGj2r1syTq6jGmoQuT81fez
	 ZkWGod1WkbdGLXZoXjO+WgnYTPsknb65dS/pd7FHVc3ghXaRO5moJxD3THRmLrtjsLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKkXzUCx;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A4760A2626
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17A4760A2626
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=nKkXzUCx
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 233C9C5CD5D
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:20:41 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DEEE160582;
	Mon, 19 Oct 2026 21:19:42 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2C88910328C22;
	Mon, 19 Oct 2026 23:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444782; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qBxQYxKuGBQ21fvUZrk2h4HlHhEGKYtEVodKZiq6n6I=;
	b=nKkXzUCxw9bGp749jDRlWncmYfUZV9m/Ol1wB6Ub35/NocG5dHH3vlYgxjcxUEwBxgtr9d
	hz3g1Ztozl9H5lutUlKcpJToVX/KSN+ZGIBSsjR2Dp5TbeYerDWbR+BHIsJqHcIDGnzjwG
	9cxSq1lP6D8f8vULmbfvISA903BApSTarwXcDZa0D6k89ZZRhPHsoSr7ygV0h9HTwnoNI9
	3SRt5LBgx27TrwLQdqkQ9iZHXNcDzUCMv/JG+e9fjisEHpAhKCOpaO9rIPuuYoevdoyMA2
	Z4hNHEE1qQCgDqhduOgIs11f42MEK3gHK1Z2vUK50YXnBBPhgvb4uW/nkiWLSA==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 17/19] rtc: rx8025: use guard
Date: Mon, 19 Oct 2026 23:18:18 +0200
Message-ID: <20261019211827.126262-17-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-rx8025.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/rtc/rtc-rx8025.c b/drivers/rtc/rtc-rx8025.c
index 5eeaa929f3ef..2f2deb59cbee 100644
--- a/drivers/rtc/rtc-rx8025.c
+++ b/drivers/rtc/rtc-rx8025.c
@@ -180,10 +180,11 @@ static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 	struct rx8025_data *rx8025 = i2c_get_clientdata(client);
 	int status, xstp;
 
-	rtc_lock(rx8025->rtc);
+	guard(rtc_ops)(rx8025->rtc);
+
 	status = rx8025_read_reg(client, RX8025_REG_CTRL2);
 	if (status < 0)
-		goto out;
+		return IRQ_HANDLED;
 
 	xstp = rx8025_is_osc_stopped(rx8025->model, status);
 	if (xstp)
@@ -201,13 +202,10 @@ static irqreturn_t rx8025_handle_irq(int irq, void *dev_id)
 		status &= RX8025_BIT_CTRL2_DAFG;
 		if (rx8025_write_reg(client, RX8025_REG_CTRL1,
 				     rx8025->ctrl1 & ~RX8025_BIT_CTRL1_DALE))
-			goto out;
+			return IRQ_HANDLED;
 		rtc_update_irq(rx8025->rtc, 1, RTC_AF | RTC_IRQF);
 	}
 
-out:
-	rtc_unlock(rx8025->rtc);
-
 	return IRQ_HANDLED;
 }
 
-- 
2.56.0

