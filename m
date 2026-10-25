Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=37.120.193.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792968243;
	b=iCERqUBIPAWNPtgh5g0mlNoX5Tf16mg/fkJ3FkeqxzucCYlYeX+7CBTE0EU7VdJndnvO
	 OhfISijOW/+9R/ylo5wkChD+/IlwXUm6LA666jfFXPyQI2FZMj/G9qqlPu6k3x2jP3deA
	 UpWvxzblfaZ1uGUtvyjQJziKBAZLazbGfYlqfb3eBaPU1WMqcrxoAz/dcbfS0EPspCVJb
	 gXZFp5rkg5fJ1PJGod8w9CEghdiMVN96J/pJFwSDgxxK1vi29CI+ESnjmBWRggIbsVV3K
	 +FIaalCrILO1sN3Ry9tAb0ug3LgfsY1zQp3Lc+cId64nnspVaYziidNC14RkRIeURDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792968243;
	h=DMARC-Filter:From:DKIM-Signature:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=OAQOjevM6fHdFLz/JbNHRjh4T2JahSWwzbixGWc3E18=;
	b=AxNfYqJqhU9QYHlNPCm7tRCKqkemPRt8OxFutOzy15DhKOl0bjWh7ZKwmxtNjaSb4PrX
	 CH1jFhp2X3JzJUMOQ1U7r23tO04WgmJZlmmv14EvifFspo6Bhydm+IygkedLmD2CE1RK9
	 8UzQshmKftvyDedsS//OaPKGFJz7WWChu8C9TJ4czigkjyYo6EOU7vRSQNEeMfoEtBp6T
	 MFP+5Xdyp17uJH3UWJjgps2EApnp2lzal8QQhl+cB5LL9qOzyHVHwJPVwyRdHs4UHRBfr
	 0Om7d4KuN0MVx3mKMKU4I7qmAU2nYLMQTQXVKyPz/AipwH0vOXKzFXxal+SjxWT8BgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=airmail.cc;
	spf=pass smtp.mailfrom=airmail.cc;
	dkim=pass header.d=airmail.cc header.i=@airmail.cc header.a=rsa-sha256 header.s=mail header.b=e4eQpTZP;
	arc=none smtp.remote-ip=37.120.193.124
Received: from mail.cock.li (mail.cock.li [37.120.193.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F02F7606A31A
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 22:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F02F7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=airmail.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=airmail.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=airmail.cc header.i=@airmail.cc header.a=rsa-sha256 header.s=mail header.b=e4eQpTZP
From: "M. Grove" <mgrove@airmail.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=airmail.cc; s=mail;
	t=1792968232; bh=xYZWlQCo1QwvXPmjZNzncLhDJvV5Hg5X+K94q5DE3NI=;
	h=From:To:Cc:Subject:Date:From;
	b=e4eQpTZPVRc2aJuperBXLj1xmi1iRSSNAea+eAQ1hu27/i9dqpP2Z7XOpd04vJ5I/
	 4jtmL0gwMrT4rVBp8GXXn/hRlZkN0RfPbR8wiQnNmRPVo1VZOHo9tqfYBAXzBqUvSt
	 nmmpiblkqgNKi3X+PDXOmlsHfbN+TwSqYLzR2yNMPqL+2MYxr7DouBgZpFpfHra2d6
	 khWMnhe487kkdrQx03MFwYoZOaABAD1Qcac0GbhrtkkHxnC3+bg0rLXAWBaX/OAIpF
	 atWJsZOc79QuQUaK5wAnMPIINM9XymFfCMB24j0IZjcJmvhDCzDW/RR9dYys0YUMov
	 DegZcm/Uinfiw==
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject:
 [PATCH] mm/filemap: queue non-exclusive folio waiters ahead of exclusive
Date: Sun, 25 Oct 2026 22:43:47 -0000
Message-ID: <179296822701.680532.8543194155713536453@airmail.cc>
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
Content-Transfer-Encoding: 8bit

A folio waiter queued behind an exclusive folio_lock() waiter on the same
folio is skipped by folio_wake_bit()'s nr_exclusive=1 walk: a shared/DROP
sleeper (folio_put_wait_locked from do_read_cache_folio) never receives
WQ_FLAG_WOKEN even though its wake ran.  Readers then hang D-state in
folio_wait_bit_common while fresh reads of the same page answer instantly,
and the sleeper wakes only with each later lock/unlock of that address, one
page at a time.

Same symptom as syzbot's "INFO: task hung in read_cache_folio (6)"
(extid 9db0864859224b833108).

The change only reorders the enqueue side: non-exclusive waiters use wait.h's
default head-side insert, exclusive folio_lock waiters keep the tail, so
wake-one fairness for lockers is unchanged.  Built on mm-stable
183895979c44; mm/filemap.o also builds on v7.2.6.

Queue-walk instrument (read-only, counts non-exclusive entries left
unvisited when folio_wake_bit() returns): 363 skipped waiters per 10-minute
run before the change, 1 after the folio_wait_bit_common site, 0 after the
softleaf_entry_wait_on_locked site as well.  Reproducer shape: threads pread
a file while others block in folio_lock on the same pages (hole punch,
truncate or mmap faults) under reclaim churn.  Harness, traces or configs on
request.

Signed-off-by: M. Grove <mgrove@airmail.cc>
---
 mm/filemap.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/mm/filemap.c b/mm/filemap.c
index b74bc1e5015c..35869d19d17a 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1293,8 +1293,18 @@ static inline int folio_wait_bit_common(struct folio *folio, int bit_nr,
 	 */
 	spin_lock_irq(&q->lock);
 	folio_set_waiters(folio);
-	if (!folio_trylock_flag(folio, bit_nr, wait))
-		__add_wait_queue_entry_tail(q, wait);
+	if (!folio_trylock_flag(folio, bit_nr, wait)) {
+		/*
+		 * A non-exclusive (shared/DROP) waiter must queue ahead of
+		 * exclusive folio_lock waiters: the nr_exclusive=1 wake walk
+		 * stops at the first exclusive match, so a non-exclusive
+		 * waiter behind one is never visited and never woken.
+		 */
+		if (behavior == EXCLUSIVE)
+			__add_wait_queue_entry_tail(q, wait);
+		else
+			__add_wait_queue(q, wait);
+	}
 	spin_unlock_irq(&q->lock);
 
 	/*
@@ -1428,7 +1438,7 @@ void softleaf_entry_wait_on_locked(softleaf_t entry, spinlock_t *ptl)
 	spin_lock_irq(&q->lock);
 	folio_set_waiters(folio);
 	if (!folio_trylock_flag(folio, PG_locked, wait))
-		__add_wait_queue_entry_tail(q, wait);
+		__add_wait_queue(q, wait);
 	spin_unlock_irq(&q->lock);
 
 	/*
-- 
2.56.0

