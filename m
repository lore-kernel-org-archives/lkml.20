Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792444746;
	b=dZVB6vml8/HY44rEUqDG+AWqSEVoNfpoTHy96lRPJALselforKZZp1UpF6l1xshoi/Lc
	 4NuKK6Qo6sEdFZrkrG3bj78BoR45WYfJuZzo/IfcziVn5XEUHhaxtL0o/PydbV2ImotTF
	 JrngY64ptgcpOW/XsgwDNIMw0Bf9ws8UcP1wXuM0V/71B6hI9SiKfrN3rPCh4dzLHOiWq
	 9EDkIWQUT/rRU2bZIhTN8IIeSqkYPVfX1ITNrVShhSrik0cLRC24d96AD4LKbgSA5eQbQ
	 RkkZwHvlAGy7jkNFi9NthQ+Rroyd1Me2JJUX2HiJ1/lvXjfGt2ZnKqpL+77ci4+kSkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792444746;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=JXeJjG8aEUHSp7ZZVlwAvzszbcJnFuDpvTmU4Sf8uVg=;
	b=UZZ3nV4DlmW+DlwAa4Ul+oSWH0LIXcUhLG83CNWwqLv2Njprfs7YKz05ye3hyL9ukYCZ
	 UWsNvCtt/qO89YUR6C1cQ8b8YJzImHzBDLEj6MQZ4iGE+zQivy2VV/do6coX2HKIry4yd
	 k7PPByFp1sJ3ThMwItgLqTRGEWlG2GQYyuDh7crsOjF5iJWNUN0550JZuS8hFKqOIRWjc
	 5W8eN4UNNa1xwI9sv0COna2qaqJEYHpSNrmNt+1ipSDkZMTtHMs2ry6u5A3Hv6GrxT6xi
	 tc15k6yUxk4h6SRwc8aNax3iahjCAzltMcFJU9en+wsGV2+WFGDJJMyUDV5eSWCy6XQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="K/mtZ0RC";
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D588D606A326
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D588D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=K/mtZ0RC
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 86E37C5CD5C
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 21:20:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4F7B460582;
	Mon, 19 Oct 2026 21:19:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9D37210328C52;
	Mon, 19 Oct 2026 23:18:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792444739; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=JXeJjG8aEUHSp7ZZVlwAvzszbcJnFuDpvTmU4Sf8uVg=;
	b=K/mtZ0RCYRehR27i+ewN8IHmVPC9CfkzfLthpx/Q4czpL2SEeZzfNSwk9VRfCj3Hu3EEzK
	S4KhRgBG7DrhhEOC1U74oSTHb33eWyUMZw14PFaK/IGX9AArc5XGkoA82NUG1UXQ5R7PHE
	acGuLAdijl3tOeW4Nz157/dxJimh5srZ2THrmb3cUoUq2MEo2P8FJLrEiwB+mgqIV3vvgP
	sxNF1mf5Z/kfcjhChkOEGGEC43lxdmS929o3PI3zCHKhDrX9HZZE6oOzUvUTp4cI5ihWwX
	Fw0Lia6/1z33oIpSich7nC0BxUfDMGG+cIx3wzNWqK56Su22UfzKb5SlqIInjQ==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/19] rtc: ds1305: use guard
Date: Mon, 19 Oct 2026 23:18:06 +0200
Message-ID: <20261019211827.126262-5-alexandre.belloni@bootlin.com>
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
 drivers/rtc/rtc-ds1305.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/rtc/rtc-ds1305.c b/drivers/rtc/rtc-ds1305.c
index d4de401548b4..19a32d3476b5 100644
--- a/drivers/rtc/rtc-ds1305.c
+++ b/drivers/rtc/rtc-ds1305.c
@@ -440,7 +440,7 @@ static void ds1305_work(struct work_struct *work)
 	int		status;
 
 	/* lock to protect ds1305->ctrl */
-	rtc_lock(ds1305->rtc);
+	guard(rtc_ops)(ds1305->rtc);
 
 	/* Disable the IRQ, and clear its status ... for now, we "know"
 	 * that if more than one alarm is active, they're in sync.
@@ -458,8 +458,6 @@ static void ds1305_work(struct work_struct *work)
 	if (status < 0)
 		dev_dbg(&spi->dev, "clear irq --> %d\n", status);
 
-	rtc_unlock(ds1305->rtc);
-
 	if (!test_bit(FLAG_EXITING, &ds1305->flags))
 		enable_irq(spi->irq);
 
-- 
2.56.0

