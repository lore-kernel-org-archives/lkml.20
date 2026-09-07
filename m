Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ADC53C0619
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 21:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815546; cv=none; b=bFgXcCdh68YJGz6OmER86H5O4IXmf6y0lBoDInPzxQxmzjvU24/ieo1SdDDZ/rq4vpC2Go8pbyoLW4/OfyPHO4M3P51BwQr7L8eGqCcv7lEPopG7limrivlYTrGDkblEctNtCThdzep2k2jJf1LAX/0v/XwkUkQ99AcHzKCuyRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815546; c=relaxed/simple;
	bh=xiXIyUF728pdEMxBYCKoeOijmNpBaYqOiK2jGy8n+Bg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lsEPKua8W1O39wJTkQBzKEuf9cvFQxsKTv/MBpdFJXzcyQEIk3UDV10jg+fUTVSZxOYdRnoMbFiS9CcyqNeBRTA1CA/qxSs+FtKmC199s80g0voXW7N9x1vPuANARfPd8DVBMo2CbfkUGARUZPjX/zfK84rWDO3kG8BEA5W2dqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EhAnUDfD; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EhAnUDfD"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-499ae1c6471so38345945e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 14:12:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788815543; x=1789420343; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UJGLSFX8zrT7Q+dYaopHAkGvQp+bTwZKSJV0d+iSPkY=;
        b=EhAnUDfDOZJ/X6HCxheW7bA2v03tKBBxA6oeVTBj4TYbDrVuTUTTWocm+cNIGKLpfX
         rL8ijF/QapWvIMSBrhYsWrgQ7daxljq8CaCeNcjsyxds+mLsq0UIUlRhMTOx7aB6BieM
         8Yqb1IrneKyDMvibYt73k7pl+V4R7wKko/UOMUYlzBka8kIZqhNm+htGW1ACChiPNpE7
         F8r/by3u77t00tRsA4W1T1JsVGkPFjPtcJmHZSdAsccc7Pk44GJLJcErUtLeHYvnnwcQ
         ttpC3kNUye+5tqdQKigpQZb+MyFUrynYdNsJvCiKPuDoG5eh3GRHwPrYnEpTUVuNWLO3
         E1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788815543; x=1789420343;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UJGLSFX8zrT7Q+dYaopHAkGvQp+bTwZKSJV0d+iSPkY=;
        b=VY6LlkNZIlScVTEKVKji5ka8lFb7NtmgZXDDqMPjuny8hXwwR11zZvsHws+euzOVlF
         p6dOfVvKfQFDGRrem3efNP9GTOvnDjS01SUN+fbn+G4gA3dMLOQDpuGWX0IHuBg18bCe
         4QvwuzcgLRfqz4n/LxX/8ugFI4KVj2JHMy8BwX1kAjDXAYAvPOK9hYD3vKeeF0mTihgx
         Nf/S0bRqMy2Scc2dvKA0FogrqTzxXoydtOlXFbHuLL0wq+E4V5/KjzsfJyZl6GZvQGUT
         QaG3S98AG+ioOc78igBMRWBSGOFqR5zGkqF1paxDqL9EJiACmNkbUZo35muZy0JZevaz
         DgSg==
X-Gm-Message-State: AFuF++mf7FQ+OIMgNIJ2fcFV0uQmF/d2QuJVei1fn5FTZonV1joanap4
	ef2cbcIrcQ2reZzXKqpwa1aodTP+7idlQ5MwyQMGU9yTES9fyc4/lvKX
X-Gm-Gg: AYBFou3iHKslXQYNtOuXdGIvRXUMxv3oU6hNy6IHihJx/BEzsM2A9JqJHF4jpENpYyU
	NSMxoCu++v/AsiHEazjFCFkyNmNYoBbd3XswORIrIEXBEC6esT2pO1wU56Nfka3VxeFbEoDOhAl
	isb5vJf7M90Xv10vYyoNcLlziqDC1aQpllEUZMFqVHQKANXciAPh+JAXJ4GE3rPjt/P1JUc7LLe
	PwNFG2+RVcZrYXXcl4H6lJmPZaw7OFrLvMMoNWXTx+xD566AQaZMuzZRPOG+iVShbT9Q3X8i/aJ
	FutRRVkY6ffDa0dd71sC1GhxJBYi0iHQ9oSLt0HUVa4dh82OHyFF0cbyzomDlk+LZ/cTr7fj1aL
	QCktbl0F02+EsGJd9GStGFXA8JASHa0JgNS3jCojSkvGJpBKcucgYGPZ8JAY248Y6kFOegDhCNN
	yX0EXdCByeIypPnDCq3kGOD8SaoXTyFxYUpfZl7sJn0qjwq2bM11UqiqPBX9rf93dSvZ+Q43CJ
X-Received: by 2002:a05:600c:1990:b0:49d:1012:893a with SMTP id 5b1f17b1804b1-49d101289e2mr141469225e9.7.1788815543142;
        Mon, 07 Sep 2026 14:12:23 -0700 (PDT)
Received: from andreayoga.wind3.hub ([31.189.32.38])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7fec25sm492052235e9.13.2026.09.07.14.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:12:22 -0700 (PDT)
From: Andrea Parri <parri.andrea@gmail.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Andrea Parri <parri.andrea@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] hrtimer: Use hard expiry when updating timers on the same base
Date: Mon,  7 Sep 2026 23:11:33 +0200
Message-ID: <20260907211134.3854-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rearming a queued timer with nonzero slack can leave the timerqueue out
of order. remove_and_enqueue_same_base() checks the new soft expiry
against its neighbours' hard expiries, then stores the new hard expiry
in the node without requeueing it.

For example, with A at 10 and B at 20, rearming A at 11 with slack 30
passes the neighbour check but leaves A's hard expiry of 41 before B's
20. The same function also caches the soft expiry in base->expires_next
when updating or inserting the first timer, giving next-event selection
an earlier deadline than the queue head's hard expiry.

Compute the hard expiry with the same saturating addition used by
hrtimer_set_expires_range_ns(). Use it for the in-place ordering check
and both updates to base->expires_next.

Fixes: eddffab8282e3 ("hrtimer: Keep track of first expiring timer per clock base")
Fixes: 343f2f4dc5425 ("hrtimer: Try to modify timers in place")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Andrea Parri <parri.andrea@gmail.com>
---
 kernel/time/hrtimer.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 530d61257b9a0..c5940323746db 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1261,6 +1261,7 @@ static inline bool
 remove_and_enqueue_same_base(struct hrtimer *timer, struct hrtimer_clock_base *base,
 			     const enum hrtimer_mode mode, ktime_t expires, u64 delta_ns)
 {
+	ktime_t hard_expires = ktime_add_safe(expires, ns_to_ktime(delta_ns));
 	bool was_first = false;
 
 	/* Remove it from the timer queue if active */
@@ -1268,11 +1269,11 @@ remove_and_enqueue_same_base(struct hrtimer *timer, struct hrtimer_clock_base *b
 		was_first = !timerqueue_linked_prev(&timer->node);
 
 		/* Try to update in place to avoid the de/enqueue dance */
-		if (hrtimer_can_update_in_place(timer, base, expires)) {
+		if (hrtimer_can_update_in_place(timer, base, hard_expires)) {
 			hrtimer_set_expires_range_ns(timer, expires, delta_ns);
 			trace_hrtimer_start(timer, mode, true);
 			if (was_first)
-				base->expires_next = expires;
+				base->expires_next = hard_expires;
 			return was_first;
 		}
 
@@ -1291,7 +1292,7 @@ remove_and_enqueue_same_base(struct hrtimer *timer, struct hrtimer_clock_base *b
 
 	/* If it's the first expiring timer now or again, update base */
 	if (timerqueue_linked_add(&base->active, &timer->node)) {
-		base->expires_next = expires;
+		base->expires_next = hard_expires;
 		return true;
 	}
 
-- 
2.53.0

