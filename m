Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4866931BCAE
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 03:19:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789960779; cv=none; b=Zypvpp0+p7myQR3ggwJ9Qr5wfl+Y1xyxnGbc6in47RlLrmzpCWZpZprqXLYS2IeOYZ46OIpjpE8N7IuKpdaqM9GHuyPKo8vEmRwhZF0PNweAMTfYMfnEM6DXzffwFDd71SvORKy4nqDD45ffZiERGFbksrKxfS3OdY2QXwSCg5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789960779; c=relaxed/simple;
	bh=T6EQGFBUsRV/2PMZm8ITyBLZCY4VnZvaQ+tJEEiar2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=klRqCZ2sGsmugeQoJ9+Tq/RW0jaVQijNYMvyduiUZ0RlFeQl913lNlLpT5r4/7Q3KuReQKyiNJbN9H5K5oldyP8uJwA/yLxSND8w8lHPEK4c1NZ7aXljqoTNJbUEs8aGmgQHZ3aapnqt33jqSU+DV5uUUBHJzg3Hw2Hwn0dASxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp; spf=pass smtp.mailfrom=sakamocchi.jp; dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b=eYHBeoL4; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=psjsYSyQ; arc=none smtp.client-ip=103.168.172.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sakamocchi.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sakamocchi.jp header.i=@sakamocchi.jp header.b="eYHBeoL4";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="psjsYSyQ"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 59AB6EC00CC;
	Sun, 20 Sep 2026 23:19:37 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Sun, 20 Sep 2026 23:19:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sakamocchi.jp;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm1; t=1789960777; x=
	1790047177; bh=4j0WGvSLc2ROyYOH698jWE60ScwgFmiTycdvIbV5XOA=; b=e
	YHBeoL4H85urgm4kCUPsqxYILS3Y4LOi7xoC21KdGbGRkrNGp8kw6l9gd1pBiarI
	7WqAa/6m5xxN26hW5AxFnN9vDzkgHOb5T6/nWOPdam9B/JD5UxAo77iZGdoYDkCF
	6+mOhw+6KvnVW3nlRkabIz3g8eHwP7TX+sBVYrACvyt2A9PdeOlfr5ooPUUg1RJp
	FdxbgHmMDTvEo0/sTJ7RY/yrnuTlHyQ8Q5OZNnUHpXugPKCL731dhVKSMHEEEvGt
	RVMjtSsNXBNVkybPrs69d9bvn6uE9mQrUsGjXnjnxR/Q9IkC7HApcnYfEANILEB4
	tqm4Ky0qi/p9PF+w0E4Ew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; t=1789960777; x=1790047177; bh=4
	j0WGvSLc2ROyYOH698jWE60ScwgFmiTycdvIbV5XOA=; b=psjsYSyQrx/M9vYYW
	qSVOyXQIC3v5S4QPAv1LuIFj9LgrqnjFRwCgwgfspBdrVWipZyD/AuTnqG4yzL+n
	kMxq6MQ/ObhXlB1XdNnQiuUt2iAbcEFGDDD+ZnopvdtavCtfEXTQBofm2sOUwdQn
	y2fk2/DyY36eOrnPPwnhAidU4/myruRHXlWfhKQP4rhOELXFYoz6ZOvJVoioQ0Ar
	fFRn+2ydhJjljuh6KfaR2YlrpinzySS4VJIBaSejDYzy8X8FJllNYR1kAsBRAyTK
	7jwImUR42t5J3pWTUJkpgKwE02jaQj0srGvH/3V5pAMtltrSh/Epxzytk+OnbyAS
	EPa4w==
X-ME-Sender: <xms:SaKwana4-ICRQKk_jXFZVPkF0a1ZZWhYfaeR5JAwfofUxaVxHEWYjA>
    <xme:SaKwakXXQugA6E81CEPuYjhrS4vZroTEcYoEZ62NV1WUDGCF5A89aE67hKmUgmV2B
    vr-aT64Z6_O9aPtf5FW9vnYrjXYv0lHR3xbq5GD54XbDxgkpW8xiaXeCQ>
X-ME-Received: <xmr:SaKwahgkQCX3sYKWWE97GVqzogD71JqPRMmfsEtF_a-myuAmvahgU2w0GySZgo4-y_-AeqpiifWBNvqS-hiC_rZflHW46E6x4_ajhCKUDIF_4w>
X-ME-Proxy-Cause: dmFkZTG4HxcRk5U6N4ypSfJUTdx+6umR7TSQ4g44xSCYOl+LSsOjyHLREsxOw5gpDWjGze
    ssZLXb8NQxBJAfAUzYHAbyvWaRwsq40mDR3QglpIIDOh4aDtOIlzcZNB62z4mDymKjq8jd
    UAw+qD5Fd6CAYTpex4syY5GNMZvis2cXIcCo2nhBw5bybLWSYdtPnUCp36inipJE76ak20
    d1oH1q9KObfdYrwOh4VrMfNbrg6I9B2GUYo2Bcgfzs4yTgdISuPHc8sFeR8xscqwDa+lNM
    zTDlL6JavrPbKQ8tH66oqgOWzXA9BieBgfS/eaXHh+GlACm+XjjsELkq75QnzOipCwA3hZ
    JYejXYkTGBOb7VwcguxXCLqz0QsH5jzzYf+p2Ah4bZoS6ISPHOrcU3VBO19vk/QVREpPmG
    BnkQ/AKBcIPAllk7NalHfNYLO/RLBjVbuwpW6jYZtSC97zfP2fuFsqJ/as8Qfr+bFDEuWR
    8n2o/cWmgFuyycaoostbnmNaQbJzPZhec6ke66nIOpXE6/asOHHY7Z4jjoJFERgEuwtP0l
    mKploJVoUKR1JZBb/Iro9aa04YEJKMFr2aXtj1ekLflVhgY8Rky8I8iRor2iBE8kNoTnWX
    GhgZjhdxY/v4OL0YOkN72VOqvNUjacDSbCGd7qh91PFLgtiRGfXKHJ7iyDWQ
X-ME-Proxy: <xmx:SaKwaqXZdDBipPyFWV3-hrElPm2-Y3vI8Kz_xUKE9I78px_pLiA7HQ>
    <xmx:SaKwagOc-zJd8Q9tBFMkf4Yak21ehyzCt8nAh3JJblX2aVvlRcRnjg>
    <xmx:SaKwauYW4uHHHvXz-_fQPPqZVwXr0HUS8pRKBc_QSKwMFaIqE54gLA>
    <xmx:SaKwakpsXBJQJyCKeZeVy8TfmBVR1TIBUEKagp5YgHLBUu-QS0fGzQ>
    <xmx:SaKwakM5BfhXFx7dNYwusizhvMQd7r_R12ZWECuUYrdVyG3mRz5T_4Kt>
Feedback-ID: ie8e14432:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 20 Sep 2026 23:19:36 -0400 (EDT)
From: Takashi Sakamoto <o-takashi@sakamocchi.jp>
To: linux1394-devel@lists.sourceforge.net
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] firewire: core: use workqueue to invoke transaction callback in some error cases
Date: Mon, 21 Sep 2026 12:19:30 +0900
Message-ID: <20260921031931.287429-3-o-takashi@sakamocchi.jp>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
References: <20260921031931.287429-1-o-takashi@sakamocchi.jp>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some error paths of __fw_send_request() invoke the transaction callback
in the caller's context. Additionally, when a split transaction times
out, the callback is invoked in softIRQ context by the timer wheel.

These are the only cases where the callback is not guaranteed to be
invoked in process context.

Use a workqueue to invoke the callback in these cases. This may introduce
additional delay when a split transaction times out, but the default
timeout is 2 seconds, so the additional delay should be negligible.

Signed-off-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
---
 drivers/firewire/core-transaction.c | 22 +++++++++++++++++++---
 include/linux/firewire.h            |  5 +++++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/firewire/core-transaction.c b/drivers/firewire/core-transaction.c
index 0cad55763a3e..e59b347ff248 100644
--- a/drivers/firewire/core-transaction.c
+++ b/drivers/firewire/core-transaction.c
@@ -40,7 +40,7 @@
 static int try_cancel_split_timeout(struct fw_transaction *t)
 {
 	if (t->is_split_transaction)
-		return timer_delete(&t->split_timeout_timer);
+		return timer_delete(&t->split_timeout_timer) || disable_work(&t->error_work);
 	else
 		return 1;
 }
@@ -154,6 +154,21 @@ int fw_cancel_transaction(struct fw_card *card,
 }
 EXPORT_SYMBOL(fw_cancel_transaction);
 
+static void error_callback_work(struct work_struct *work)
+{
+	struct fw_transaction *t = from_work(t, work, error_work);
+
+	invoke_callback(t, t->rcode, t->response_timestamp, NULL, 0);
+}
+
+static void schedule_error_callback(struct fw_transaction *t, int rcode, u32 response_timestamp)
+{
+	t->rcode = rcode;
+	t->response_timestamp = response_timestamp;
+
+	queue_work(t->card->async_wq, &t->error_work);
+}
+
 static void split_transaction_timeout_callback(struct timer_list *timer)
 {
 	struct fw_transaction *t = timer_container_of(t, timer, split_timeout_timer);
@@ -165,7 +180,7 @@ static void split_transaction_timeout_callback(struct timer_list *timer)
 		remove_transaction_entry(card, t);
 	}
 
-	invoke_callback(t, RCODE_CANCELLED, t->split_timeout_cycle, NULL, 0);
+	schedule_error_callback(t, RCODE_CANCELLED, t->split_timeout_cycle);
 }
 
 // card->transactions.lock should be acquired in advance for the linked list.
@@ -383,6 +398,7 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 	t->callback = callback;
 	t->with_tstamp = with_tstamp;
 	t->callback_data = callback_data;
+	INIT_WORK(&t->error_work, error_callback_work);
 
 	/*
 	 * Allocate tlabel from the bitmap and put the transaction on
@@ -402,7 +418,7 @@ void __fw_send_request(struct fw_card *card, struct fw_transaction *t, int tcode
 		tstamp = cycle_time_to_ohci_tstamp(curr_cycle_time);
 
 		t->packet.timestamp = tstamp;
-		invoke_callback(t, RCODE_SEND_ERROR, tstamp, NULL, 0);
+		schedule_error_callback(t, RCODE_SEND_ERROR, tstamp);
 
 		return;
 	}
diff --git a/include/linux/firewire.h b/include/linux/firewire.h
index 2b065f03565d..a3a3a9ec1b21 100644
--- a/include/linux/firewire.h
+++ b/include/linux/firewire.h
@@ -362,6 +362,11 @@ struct fw_transaction {
 	union fw_transaction_callback callback;
 	bool with_tstamp;
 	void *callback_data;
+
+	// For some error cases.
+	struct work_struct error_work;
+	int rcode;
+	u32 response_timestamp;
 };
 
 struct fw_address_handler {
-- 
2.53.0

