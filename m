Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747580;
	b=LXExdNgU+5RbLKrdOltabFO58YWc1kB6jc7CsEKCbbDbOFQKkeeCviygAtJqAOz6toJO
	 ePLA5nUUlCmnrgtIynZ7CRN6XLn55j8gRpDkgA6Nnti9Iv68vX0ryjB0o7mW60wc0mJYU
	 BC7vIQ5Wd7YhvQbHQJkstTWVrT5dn3StpUODaBUiehdEcYJX7omPIt1+5oIcZMAHI+YF1
	 sxfFexPF4xzwodYrYfKEfc9joZjeqFcaOygie+nyiBwNiIX0jM0NveKFEip/0AzR9Z8ux
	 cBwTnUC8OsjrsGMDuZi9I3Zurc8dwvRUbLmd+YMfNXxKDfFx02jtsG6vkevQWNOYzIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747580;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=kS1Z5LCsa+qRBaBJIS5asNgQIOLlArqrMwVB7Pu9irg=;
	b=O11pkKFZjF7FCazM52Ga8qJQVbs4CMAKF80ccnlS+ORqRhdnW/U3tXV2R2WV2XCgZIKl
	 ozbq/HR5AgEBZ8veFsi5YmuNhuZ13u7KwVtLrj/fwIqJCNhwP7HJOazFFUhqK2N4t1s9Z
	 0h5eM7tRF9iRwhd5hXdvoQ2Mrf/yEv9YzJClQndkhxxICIoadLhFVVC6gblySjao6937N
	 ImRIxQLYuuL/UPZC+mQpzoS9FR9XgDPAh+QYfkLMs4ztv1mZonQikn8gGkOuEN5OXpMxW
	 mJk9Zwdi03GgX04IKuFQY0RWmQJ5I5iVH+dW3ON1F8Ax+hUnfRdjtUfAG1hMOuURw8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aye1zcez;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3822606A31B
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 09:26:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3822606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aye1zcez
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cd60c5da24cso394056a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 02:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792747579; x=1793352379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kS1Z5LCsa+qRBaBJIS5asNgQIOLlArqrMwVB7Pu9irg=;
        b=aye1zceze7CiaTprYqf7PTybamY+omzp0KHLB4UaPBglrTNLqCqxTJ+nqcr1i2cFU+
         xu7T6P7coPrPJFfOaHLTHQ8dii2XHZXhhDN3MhNpxmnvvB/wgUgbasZxAOH7P85ZOKlZ
         zdYNxXW4v1vhvFPZxR1XNWeZIfddtjV4QRX8jn1QLHJWVc2TRwI9QWNxe2CLPfG+mDen
         twpF2AiPqd069e2f5B+L/OwEaGrH3PilfWW7mKtBsAkRRRBbrV6Ph5nFMd6i2wDb2P9Q
         aKOpdtqDsfjFvLQsccZrQfLT9VY5/1KrcNMyMEf1l1LlcI3zxcxyBXafm9B2WgMZzNXG
         bJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747579; x=1793352379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kS1Z5LCsa+qRBaBJIS5asNgQIOLlArqrMwVB7Pu9irg=;
        b=vOztq3IDEHXKQPL7hakngd+0YP++pT+h6wNWS1FTKdBpY6f8CsWEFHGuWb6cH5bxZO
         4nSxhkdau1dODbClwtnXRvQSNkqTlfNeU3vlLeoGQtJttMthcde85OiaDbwMiKpUR0V7
         rT0wMWwqGlEnXd5hcu56UR1QfkdHxT5DG32j7pl/KDClOQj/i/vyETUuuh7gS/H1Fc3X
         Z3VvD9S2GycxG5Re+IS6/KodNyiQPJ6OhIXocAiY+s58RR8fQPWLSW3RDopWrgGMiJEn
         LsShOu2TW51hiyqV8jkeF93BOPVjP5L/NnAmUazAJgzet1QnvPrtlbfLM9du6yjuLJxl
         +Q6g==
X-Gm-Message-State: AFq9FYLYY16tWMBQwC2WTIi8s69TKc3dL2wEd9vACXa+pc22QyzE+Q9C
	ZaZhyg/DPzmaqGo2NiwwJuiBBE9EipfnAczO3hmqyuXjZPQFach8WlWJ
X-Gm-Gg: AYBFou2QzUECAKP++U/UzCh3Grq5O567/+gGdEX3JFmymLqPRS6C+vE/MrawhsXJRIm
	S8YD6VLrUPYo2DsIsYXkRYXFwEaBcb/vYVXTX/hW2gJaywD+FLfdCsJjFYQQLHJeYfKAkDU/HXV
	+leOOXId59PNzjVpIOl1tN0U6lUaias1hbqc0Rkokq8mZpAbqv2bgAgVW7XKAYdOSkhm6L0Hji+
	3mgXWHI+89L2LxIiLgRI6hd8Ee2TflTXwvbzO3Im3mYfyZrkklJ7OOTEp+cgPNpBFrTe35s11TG
	R2ASEZGhz8wpgTUvW32WCF//g1nln9vbuqNTaUPHq9ng2QRU+uJUsdR9d/hk6tPW6vbVlW9TTZ2
	Sr6nITWtavYtiGgOaYy+eVmYK0a/94RCsUC+elFrVWy/6SqKNznBch6h3SEdBFnbWEo2v0zOibU
	XIL3XA1qQ1Odvz3vzcJDwNBSjqQDJrJIbmmwlRKa2aNrAh0GXq6/UTAGCwJlnKRrd8JEMY1BPhN
	FR/0ceTRWqt4sGQXz05qHFsszpkjMLTyNksCpyWKlmY2WX56Eyh6vpV5FHGoJXntI+qpZkSS6CG
	nR9xRntYQH1HtpvwcCA=
X-Received: by 2002:a17:90b:1844:b0:3a0:9c9d:eb18 with SMTP id 98e67ed59e1d1-3adce0a49d3mr1376081a91.54.1792747579117;
        Fri, 23 Oct 2026 02:26:19 -0700 (PDT)
Received: from 4ce604c9y2.bytedance.net ([61.213.176.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada49366fdsm7975741a91.14.2026.10.23.02.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:26:18 -0700 (PDT)
From: Jianan Huang <jnhuang95@gmail.com>
To: linux-block@vger.kernel.org,
	axboe@kernel.dk
Cc: linux-kernel@vger.kernel.org,
	ming.lei@redhat.com,
	Jianan Huang <jnhuang95@gmail.com>
Subject: [PATCH] blk-mq: reset queue state on scheduler teardown
Date: Fri, 23 Oct 2026 17:26:11 +0800
Message-ID: <20261023092611.116795-1-jnhuang95@gmail.com>
X-Mailer: git-send-email 2.43.0
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

We observed I/O timeouts with requests stalled in per-CPU software
queues.

The affected queue had no elevator, but QUEUE_FLAG_SQ_SCHED remained
set. A failed elevator switch can leave this state when falling back to
none without clearing the flag. With empty hctx dispatch lists, a
queue-wide restart on CPU4 would skip requests pending in ctx5/ctx7:

CPU4: blk_mq_run_hw_queues(q)
  sq_hctx = hctx4
  hctx4: no pending requests   -> selected
  hctx5: 9 reads in ctx5       -> skipped
  hctx7: 3 writes in ctx7      -> skipped

The pending requests may remain undispatched until another event runs
their hardware queues.

Clear the flag and restore nr_requests and async_depth to the driver
queue depth in the common scheduler teardown path, covering both
scheduler exit and failed initialization.

Fixes: 4d337cebcb1c ("blk-mq: avoid to touch q->elevator without any protection")
Assisted-by: LLM
Signed-off-by: Jianan Huang <jnhuang95@gmail.com>
---
 block/blk-mq-sched.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/blk-mq-sched.c b/block/blk-mq-sched.c
index 0a00f5a76f5a..d7b45778732b 100644
--- a/block/blk-mq-sched.c
+++ b/block/blk-mq-sched.c
@@ -374,7 +374,7 @@ bool blk_mq_sched_try_insert_merge(struct request_queue *q, struct request *rq,
 }
 EXPORT_SYMBOL_GPL(blk_mq_sched_try_insert_merge);
 
-/* called in queue's release handler, tagset has gone away */
+/* Clear scheduler tags and reset queue state. */
 static void blk_mq_sched_tags_teardown(struct request_queue *q, unsigned int flags)
 {
 	struct blk_mq_hw_ctx *hctx;
@@ -385,6 +385,10 @@ static void blk_mq_sched_tags_teardown(struct request_queue *q, unsigned int fla
 
 	if (blk_mq_is_shared_tags(flags))
 		q->sched_shared_tags = NULL;
+
+	blk_queue_flag_clear(QUEUE_FLAG_SQ_SCHED, q);
+	q->nr_requests = q->tag_set->queue_depth;
+	q->async_depth = q->tag_set->queue_depth;
 }
 
 void blk_mq_sched_reg_debugfs(struct request_queue *q)
-- 
2.43.0

