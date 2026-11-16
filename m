Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.65
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794805939;
	b=e9pa3rdptEaVrUnwqOJP/wttWhIOnHCUmBvBD4Rf00VBlc3wJhXqUqSMQE0UUV17+XL5
	 qzmyIgepHStdAsCrsZUkdtWPjMXnrFwOryhzGrPkrLITcv70YyX27CUvAsVd/IKV0/5HM
	 7tpM7wNX6WRlmGzzz1byR+It99X9PfRTMsPogmVJURaz0Mq4JMEZw97X9nnh1TZRSuSFB
	 anlBGwMcEvl/wNSGwiaIr4vhGSLBzFC69ul/nUwSAamVRt/54uQYYJbyFWOjwdCJ28eCU
	 yPu8W8Ckai1oxTIcbkxzz6LQSAImwRwHlcD8wPC2Eml0cChU0+HTEbjsBo8/Ltvon4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794805939;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=W+wXT11nJhSS19tcilV3uSfJ8bLtuBDroFYijxy12Es=;
	b=RpBKmGNJULFtnyy+obWV5DGsDiAOAq5yUQnS4+6rtIzMfIxCKOSw932kQEAaBLwTj+z9
	 ISbSvAejXwWhSssSBmf4ON/3ljVm3JcehvHNQRMMtaqjUcJs0wnLOMzgqblp15WWb0FUH
	 ooQKFr01C0tg7WuKy8l/JIDx3vZP3EhsJ/X3egtiEgeA+SU4lFvWJW+t8Neg4rEeA98/n
	 FTcPLw6cZvRnP6dn8C6cV0jqKIPFyY+YeiTpXIdFKCa0lddW1UQntYKA86u6lte0j6fOg
	 Sizrpe2AlNxKhkZY8xAiouobOZ7OzdHFJWoxX+jIsPF311c4dEDqTa/enySozfs0tdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AZP6Xdib;
	arc=none smtp.remote-ip=95.215.58.65
Received: from mta1.migadu.com (out-65.mta1.migadu.com [95.215.58.65])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843EB606A32A
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 05:12:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 843EB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=AZP6Xdib
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=Km7OfgZ8PltK3tbudPrmRK16be4ZvZVYx5fTaD1GRto=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794805936; v=1; x=1795410736;
 b=AZP6Xdib0eobM3tgY02R8sGzoBCTPKgCVT22JckDko1B2KI8Oy9tBO+l/jTg3kTEMzboMhD+
 J0boA/WqJ4l6Cd6mIbnpQw6Io/WjMJy1Xn8HNy7mQf1ys/b5R/1HmY0xIy4O3xBDuGrnUMA8W/K
 UWuZqEXHBma+mV1GdCm27wJY=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 338ac73156b1b968;
	Mon, 16 Nov 2026 05:12:16 +0000
X-Mizu-Trace-ID: 338ac73156b1b968
X-Migadu-Flow: FLOW_OUT
From: Qiliang Yuan <qiliang.yuan@linux.dev>
Date: Mon, 16 Nov 2026 00:12:03 -0500
Subject: [PATCH 1/2] dm thin: drop the grace period from thin_ctr()
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-bug-dm-thin-rcu-gp-v1-1-14ed3567da3e@linux.dev>
References: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev>
In-Reply-To: <20261116-bug-dm-thin-rcu-gp-v1-0-14ed3567da3e@linux.dev>
To: Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, 
 Mikulas Patocka <mpatocka@redhat.com>, 
 Benjamin Marzinski <bmarzins@redhat.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Qiliang Yuan <qiliang.yuan@linux.dev>
X-Mailer: b4 0.13.0

thin_ctr() adds the new thin to pool->active_thins with
list_add_tail_rcu() and then calls synchronize_rcu(), so that a
wake_worker() call can't miss the bios of a thin that isn't visible yet.

The grace period doesn't make the entry any more visible. A worker that
walks the list after list_add_tail_rcu() finds the thin, and the thin
gets no bios before its table is resumed. A walk already in progress may
miss it, but the wake_worker() for the first bio queues the worker
again. Still, activating a thin device waits for a full grace period,
which takes about half of the activation.

Remove the synchronize_rcu() call.

Activating 100 thin devices of an idle pool with dmsetup create takes
per device (mean of five rounds, min-max of the rounds in parentheses):

  before (ms)        after (ms)       change
  15.4 (14.9-15.9)   7.6 (7.3-7.8)      -51%

Signed-off-by: Qiliang Yuan <qiliang.yuan@linux.dev>
---
 drivers/md/dm-thin.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/md/dm-thin.c b/drivers/md/dm-thin.c
index 358ed77ffb2be..d5ff937eeacba 100644
--- a/drivers/md/dm-thin.c
+++ b/drivers/md/dm-thin.c
@@ -4289,13 +4289,6 @@ static int thin_ctr(struct dm_target *ti, unsigned int argc, char **argv)
 	init_completion(&tc->can_destroy);
 	list_add_tail_rcu(&tc->list, &tc->pool->active_thins);
 	spin_unlock_irq(&tc->pool->lock);
-	/*
-	 * This synchronize_rcu() call is needed here otherwise we risk a
-	 * wake_worker() call finding no bios to process (because the newly
-	 * added tc isn't yet visible).  So this reduces latency since we
-	 * aren't then dependent on the periodic commit to wake_worker().
-	 */
-	synchronize_rcu();
 
 	dm_put(pool_md);
 

-- 
2.43.0

