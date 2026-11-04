Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753012;
	b=lWcCwZRahEPFdqJmByUQQlJ2KHinh266hwJmcnOXI9AHahAURJrKCLCxYpOmEBiFRYrn
	 GQnnGbbuma34o03D6ZdR+2SFF9zcjlfjG3lDgd/szbmCldanGX3OEaRW3vD/XzrHpETvc
	 L4B0XmcgRX3hq95ts/ySrK4YJC66zm0KZon1kw1H/7GiwbkAF6haTqmGDD3SXkyum65Mu
	 CN8QBMoB2VqSb8lq+xE11ZNJ/nW8fUlwrT9cuvStBAlFrbxvXJ5AKuZZC0VbjJ1bzfbNU
	 ogaUmW/JCoJsHSZTmk9xLRoiWIVAnzzOUF2hsUMltne274VuR11t9+q1aoyoqYwUpmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753012;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IsT5ntMMEPat1n2R0SW3YtXN4kr3zeTlQ8hBsYD60gc=;
	b=5Kny7ce4tCIaMUsaykcd7M1Rb8XWxSOWyxrsz3uY0Vsgb1mLB0e9nSe1OnRRAC1zw6Cy
	 U0cKpazdfvIabNn2RWMT7+RijEIJGlWgDIfDyp7vJQ29laqvXdIOKnUvVO0jzsLNU6VGd
	 FcKV7vK5o9K6C3f07DVfCIT/GoYMY47zVRy2ra+KHbhUhSxL9gPaMePUeQl7X1dpNf81B
	 CbIrzyU/Zp5gUjgkjDNFghzwAEb47TUBJa/H1QPgZYBj2rqZm8NQnckFm98ApG8nZHeeK
	 EnR6AHBX3f4hOcJiuEjvA7QJeedD7tj273RdhX8yW618Q8/zQum0eMv8UDx8fkS6XQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CgVwiQ+U;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D10606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 00:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2D10606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CgVwiQ+U
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso299936eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 16:43:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793753011; x=1794357811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IsT5ntMMEPat1n2R0SW3YtXN4kr3zeTlQ8hBsYD60gc=;
        b=CgVwiQ+Ulv4BTdsJfO4tlA1hoz+8FDm5J573dbYk6SIT9e3xZaWn/qEIT4m9cvBpgV
         3GAFPD24Fmu0BeklPMYLbQtpyQrXq5BpN2jSrMSs19eKVVENktIFmoo0eRTf4Oh05ARB
         krNZi7eYnuLlKQMEUq8jaBIvo1h3pbKYca3DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793753011; x=1794357811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IsT5ntMMEPat1n2R0SW3YtXN4kr3zeTlQ8hBsYD60gc=;
        b=mZcOdXprZY1qyKLhC6wtLZQoE7Ez0eliJ9TQvAeJjvjiIWeCiqm6ZNu3jNQ5wheOsV
         Ky52VScAc4E/uY2sDfkbp5twm9DHdgIkSo89WcdYsaQfnRoOOi8ti+mU59P1E+knSYf8
         esMlYXvIqidI+ji+O6ojjD+BdWOHHgTVonIHf5ySAuZ/tuh05U1s+iEAFjZYmOcmw+9Z
         BfeXdSe00xzExzYSBs1gArKwiFoayvAZFGUzQ5M7i9trK8qUhvaUHaF1GQC0U/WP4Gci
         UMqS/lptJr+vMQ81LKO5OOtuPKb/xOWDh9nBKknC0EaovbbxqgixpiWQOtxrI7gEp7rP
         8JMg==
X-Forwarded-Encrypted: i=1; AKwUvBy5aOTKwXLZyILKZsV6keLgBkvqYRr5k1mf4rfi5Bc8pvnZklq4U96A+xNXHc1YJAT37poESYlRBTdVQO8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9WZMIsX8Q3lpK8BSGU1UTB00ZTOUp3PLZeaZkRm0B88upHjsSi
	rFQH84ZAIgo1wiFgw6LfB5AnFQB8W/iDjnKLH6bgps3FKHgCpAcrV4pNLU5rXg6RlQ==
X-Gm-Gg: AYBFou2SFokVV1kqqbc6YR9eC5+iuy3d4KpxrZzClyrtE9GwT5/pFRKmYgjGOZR6+C7
	NSuylNjuWV+UUUuIZANX4n9z5IyqaWojxNJSxvj81xI7b3k9M2jhPTqtlY/7GabwaVxUSvqJPPU
	RJnthEvL9rhf6SwpZRMCkSU6l6VbKDf014+WNejsIkjHLkWrkwTVpAzCxViecwzqCmsxgaaRQ0K
	8/l5LDMlKkQE7zJ0DePOcnKyNuQuQzhnqJ03WF6wIdUHhi/oErYzU5d03uFf6U/Eo9fwAwhnxKL
	9le5IxzTZm7y1sW8Lk0NdUKV0Ln6Jtfa1sRZ4JjX4C5UhFtIvlHe58EwEweD/SPs6Q4IrafRRai
	XluSqDTvgvdidBClsqPbDjyqdjdcs93XPELHV6yY1dv1rVpxv/gD9/LPcYoPYe68MkYbSvsP5y2
	QUPgwKEMmho3nmRJ2hidtXOVCiBtowFkWYsBhXm4ft42RXUTRKTWLcRdHFjwQVguRXbh1+svR56
	9Y8rO/UqHudkPb8fDgEjcSBAFKixs9UEESF8qC9/evmgyFlnFhTouphYsYcEtQc/SEQqo6q2vxB
	i1BE39HglPCZNwKiUnoAy7AwBYSz2U+kdxqC7j6tptNodsdovUVi/69VS0Ov18LDEhjiG2Gb7cg
	GamE6YUIwP+5y
X-Received: by 2002:a05:693c:88ce:20b0:36a:1f8:a5a4 with SMTP id 5a478bee46e88-36a4241f808mr21941327eec.38.1793753010843;
        Tue, 03 Nov 2026 16:43:30 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:1123:15a6:4d6:b367])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38d36besm2661680eec.11.2026.11.03.16.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 16:43:29 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mailbox: Only reset txdone_method to POLL if controller supports polling
Date: Tue,  3 Nov 2026 16:42:36 -0800
Message-ID: <20261103164235.1.Ica21c7a396cf407fca02b7c0fb3a16150feaab90@changeid>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
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

In mbox_controller_register(), a mailbox controller's default
txdone_method is initialized to MBOX_TXDONE_BY_IRQ if mbox->txdone_irq
is set, MBOX_TXDONE_BY_POLL if mbox->txdone_poll is set, or
MBOX_TXDONE_BY_ACK if neither is set. Only controllers with
mbox->txdone_poll set initialize mbox->poll_hrt and require
mbox->ops->last_tx_done to be implemented.

When a client with cl->knows_txdone = true binds to a channel whose
controller uses MBOX_TXDONE_BY_POLL, __mbox_bind_client() overrides
chan->txdone_method to MBOX_TXDONE_BY_ACK. Commit 33cd7123ac0b
("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
attempted to restore chan->txdone_method to MBOX_TXDONE_BY_POLL when
the channel is released, but did so unconditionally whenever
chan->txdone_method == MBOX_TXDONE_BY_ACK:

  if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
          chan->txdone_method = MBOX_TXDONE_BY_POLL;

For controllers whose native txdone_method is MBOX_TXDONE_BY_ACK
(!txdone_irq && !txdone_poll), releasing a channel (or failing in the
controller's startup() callback) corrupts chan->txdone_method to
MBOX_TXDONE_BY_POLL even though the controller does not support
polling and has not initialized poll_hrt or ops->last_tx_done.

Check chan->mbox->txdone_poll before resetting chan->txdone_method to
MBOX_TXDONE_BY_POLL in mbox_clean_and_put_channel().

Fixes: 33cd7123ac0b ("mailbox: reset txdone_method TXDONE_BY_POLL if client knows_txdone")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Found by code inspection and only compile-tested.

 drivers/mailbox/mailbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index efacd24a085d..cfc49cfb057c 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -343,7 +343,7 @@ static void mbox_clean_and_put_channel(struct mbox_chan *chan)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
 		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+		if (chan->txdone_method == MBOX_TXDONE_BY_ACK && chan->mbox->txdone_poll)
 			chan->txdone_method = MBOX_TXDONE_BY_POLL;
 	}
 
-- 
2.56.0.385.gac671c819a-goog

