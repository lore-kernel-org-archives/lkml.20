Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C93033F8
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788183153; cv=none; b=JXtwiT68J9nrHpLfkfKRH+QKYvLi6OD1Bjt8wuiyxjfx9RryltJC4Sd7mcGdgMlslu90WnuVzj2LYZ8RbUp9Q3fNZQBFHqMDwmfNYDTxUxgVDt92sw0YNj+B0rSP3+tLpBrBVlahTtWo7xwGmqC/mmwFmwMw0DC4sVDbFtOahPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788183153; c=relaxed/simple;
	bh=FcsM3/p9xXPCIEnRL+5Ei4+K1e041/Wv5iEDXKMcGc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uctoVfjRnRoaMO9op4sY9VxIAw7OHWTEbRkrj7oP4YkQvGIMZXL+zB/StNU5O24fttsVV0vMSUBPUAJkavo8XryE0Z8N2COKI29IzPIbY57rDwX9zXUteG7LzlsZ2/qfbTtTxpJK8+7rC4FZ3zigKfiuTotaByh1SslNvRgPVEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azJo9/hU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azJo9/hU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d715f4a587so49826545ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788183150; x=1788787950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8iyuCMhGUpDra9S+DkJdLTa8SNwQ+om0mNosv5O74qg=;
        b=azJo9/hUswxhHOy32iBdVes7KK6czYpln4Pi5FubBBIwIg4gSKviF3Ukmi+GR63F7N
         MbTTsr3RASpbdvSKb9F+fYX7iNm4oNBkvSDOp4lvxht96IwWl68vsmInlNkKI0LRuT7Y
         4jPtMAR3SRsZNQ926X8BKYRYncaYNCR1O2uXi05Jqea1a/bkbUj0/n1dttfyfxRSX2ZA
         vhtsNElvsNpOwJVP936wYsrYtv8OOAPS0zyb73ejK4c19tw+P+BP02zZfkxqPZf29/hD
         1wmhyN5yGVXjdDyAhpGTiTgNAtanjwTvUxbdBtoHwf3TwGuE8EBiYjmO4Ra91x04WR/6
         ewMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788183150; x=1788787950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8iyuCMhGUpDra9S+DkJdLTa8SNwQ+om0mNosv5O74qg=;
        b=aFkztHoLHqtOx9Glg+XEbLpmF/MqhDZ9c/SRSQXfE8VmCgczh58KAr5VgJ1bEkPvnX
         C4GWodr7uwAn8hegZ3xA8cRvAHHUyQy3FnYa+e969ShbhbFyJhTeVCEZQCBBSkliP39s
         72mkTkizXm9tld54gA/rrTtig0Oic4RE86EZ3Stx6eBsxEvp5hG8oRHUkAUu0qr5AHqH
         l1Xdi1gAzybArh4maobaVFj1eKM069hMjuQYqCRpVQGibdGsHYVt6jJgDX8VAXCjl33u
         2oGTwtM2pU/8WV6yE2KKK1w9GEEjJIQ9ghtXT8KMlJc4x6SpJC1bwmM/T7ubN4W32VOx
         qXKA==
X-Forwarded-Encrypted: i=1; AKwUvBwMp3hwsWrJg+hBLoUV7anpvmdqM5O0CnOiPubr8ML3aPZhjHTm4U7wIlDfcKw2rbi7p/ahWWnGEFaZE1I=@vger.kernel.org
X-Gm-Message-State: AFuF++lWEj4n6n5IPApYMGFLJHXU3bVDdARjCZUPYarVX1ejkm789YAY
	FlgnTvxJ+2lXz35yJJ3h2HH6qSz6hqIon2L8xeI+TLEF3brnd9fJ24RW
X-Gm-Gg: AYBFou0W5Grl9Fw7UtmXfr9fuEFADFr4OhKX0gyzMf2SwgkUg1YMZbdDAVSyvWsbSfx
	R7rptDp5LG9oELkbMcp3nSXlR0Os5YA2VZlfFwUaWsEQk2EA3TN5RBCvb1yMq5NoE0oyRTUWlk1
	wPCXFeqHSPQMl3l7ByCN3Rl6ij03RmyAH0SdsK5bjUcvCcynkM+WXU57V12aFTiFT0wDGLxvCIq
	ShWVaqN5PBr+Eh9035ipqW3uVcpCj0wFn5GkA+EbGpyAldRVJdAwlvb8fpmfRO3t3DIw+nhdmDl
	xq4W3ZzkMrTnk4URQEPuRvKhBNNyyzYv3e/FqtNjEfFmC9T59NiTeC96yl9Zszpujc6M83uQria
	iWYYXGqS7oE+xilxcV6MGbZDo2o0aKrYe0cuKhZyaRKTRVLoF4uwxGsDw3RcqtyTRtIfdVB3X36
	u3RsPrenJFNvdo9RE3IAePiCqfmbiFmhWeimvv+Q9Iwdyj42WWvlv6iUD0NojpndilwFbhTYo6Y
	irgBk4=
X-Received: by 2002:a17:903:2a8b:b0:2d7:1cee:3682 with SMTP id d9443c01a7336-2d74dc21e53mr406131505ad.5.1788183150392;
        Mon, 31 Aug 2026 06:32:30 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:50b1:2f22:32bb:703])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598b8829sm36684125ad.73.2026.08.31.06.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 06:32:29 -0700 (PDT)
From: ThangNN99 <ngocthang2710.1999@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	ThangNN99 <ngocthang2710.1999@gmail.com>,
	syzbot+acf142088e0182172e58@syzkaller.appspotmail.com
Subject: [PATCH v3] mm/slab: don't use kfree_rcu sheaves on PREEMPT_RT in kvfree_call_rcu()
Date: Mon, 31 Aug 2026 20:32:22 +0700
Message-ID: <20260831133222.8637-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831130057.HLukQ-zm@linutronix.de>
References: <20260831130057.HLukQ-zm@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reports a possible circular locking dependency between
&p->pi_lock and the per-CPU kfree_rcu sheaf lock (_T->lock) on
PREEMPT_RT:

  __balance_push_cpu_stop()               [holds p->pi_lock]
    select_fallback_rq()
      cpuset_cpus_allowed_fallback()
        set_cpus_allowed_force()
          kfree_rcu(ac.user_mask)
            kvfree_call_rcu()
              kfree_rcu_sheaf()
                __kfree_rcu_sheaf()
                  local_trylock(&s->cpu_sheaves->lock)   <- _T->lock

set_cpus_allowed_force() uses kfree_rcu() instead of kfree() here
because all of its callers hold task_struct::pi_lock (a
raw_spinlock_t), and plain kfree() may sleep under PREEMPT_RT.

Commit 2a8bb29ec9b2 ("mm/slab: allow kfree_rcu_sheaf() on
PREEMPT_RT") made kvfree_call_rcu() try the sheaves fast path on
PREEMPT_RT too, since __kfree_rcu_sheaf() only trylocks there and
so cannot itself block. True, but the sheaf/barn locks it trylocks
are also taken as regular, blocking locks elsewhere, so lockdep
still records a lock-class ordering cycle against any raw_spinlock_t
already held by the caller, which is what syzbot caught.

The plain kfree_rcu()/kvfree_rcu() API gives kvfree_call_rcu() no
way to know the caller is in such a context, so keep it
conservative on PREEMPT_RT and skip the sheaves layer there,
falling back to the existing raw_spinlock_t-protected krcp list,
which is always safe to nest under another raw_spinlock_t. This
restores the pre-2a8bb29ec9b2 behavior of kvfree_call_rcu().

kfree_call_rcu_nolock(), added later in commit 3bc999d944b3
("mm/slab: introduce kfree_rcu_nolock()"), is untouched by this
patch. Note it would not be a safe substitute here either: it still
reaches __kfree_rcu_sheaf()'s local_trylock() on &s->cpu_sheaves->lock
unconditionally, so a caller already holding a raw_spinlock_t would
hit the same lockdep ordering cycle through that path too.

Reported-by: syzbot+acf142088e0182172e58@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=acf142088e0182172e58
Fixes: 2a8bb29ec9b2 ("mm/slab: allow kfree_rcu_sheaf() on PREEMPT_RT")
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
---
v3 (per Sebastian Andrzej Siewior's review on v2):
 - Say "raw_spinlock_t" instead of the vague "a raw spinlock"
   throughout the commit message and comment.
 - State plainly that *all* callers of set_cpus_allowed_force() hold
   task_struct::pi_lock, not just that it "can be called" with it
   held.

v2 (per automated review on v1):
 - Corrected commit message / comments: kfree_call_rcu_nolock() is not
   a safe alternative here either, since it still trylocks the same
   &s->cpu_sheaves->lock unconditionally.
 - Removed the now-unreachable CONFIG_PREEMPT_RT branch inside
   kfree_rcu_sheaf() left over by this fix (it can no longer run,
   since kvfree_call_rcu() already skips calling it on PREEMPT_RT).

 mm/slab_common.c | 20 ++++++++++----------
 mm/slub.c        |  6 +++---
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/mm/slab_common.c b/mm/slab_common.c
index b19ba1b31484..015380ba8bcc 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1667,15 +1667,8 @@ static bool kfree_rcu_sheaf(void *obj)
 {
 	struct kmem_cache *s;
 	struct slab *slab;
-	unsigned int free_flags = SLAB_FREE_DEFAULT;
-
-	/*
-	 * It is not safe to spin on PREEMPT_RT because the kernel might be
-	 * holding a raw spinlock and slab acquires sleeping locks.
-	 */
-	if (IS_ENABLED(CONFIG_PREEMPT_RT))
-		free_flags = SLAB_FREE_NOLOCK;
 
+	/* Callers on PREEMPT_RT never reach here, see kvfree_call_rcu(). */
 	if (is_vmalloc_addr(obj))
 		return false;
 
@@ -1685,7 +1678,7 @@ static bool kfree_rcu_sheaf(void *obj)
 
 	s = slab->slab_cache;
 	if (likely(!IS_ENABLED(CONFIG_NUMA) || slab_nid(slab) == numa_mem_id()))
-		return __kfree_rcu_sheaf(s, obj, free_flags);
+		return __kfree_rcu_sheaf(s, obj, SLAB_FREE_DEFAULT);
 
 	return false;
 }
@@ -2034,7 +2027,14 @@ void kvfree_call_rcu(struct kvfree_rcu_head *head, void *ptr)
 	if (!head)
 		might_sleep();
 
-	if (kfree_rcu_sheaf(ptr))
+	/*
+	 * Callers may hold a raw_spinlock_t here on PREEMPT_RT (e.g.
+	 * set_cpus_allowed_force(), whose callers all hold
+	 * task_struct::pi_lock), and the sheaf/barn locks are also taken
+	 * as blocking locks elsewhere, so trying them here creates a
+	 * lockdep-visible ordering conflict. Skip sheaves on PREEMPT_RT.
+	 */
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
 		return;
 
 	// Queue the object but don't yet schedule the batch.
diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e7..1e8bad7a018e 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -6088,10 +6088,10 @@ static void rcu_free_sheaf(struct rcu_head *head)
 /*
  * kvfree_call_rcu() can be called while holding a raw_spinlock_t. Since
  * __kfree_rcu_sheaf() may acquire a spinlock_t (sleeping lock on PREEMPT_RT),
- * this would violate lock nesting rules. Therefore, kvfree_call_rcu() avoids
- * this problem by passing SLAB_FREE_NOLOCK on PREEMPT_RT.
+ * this would violate lock nesting rules. kvfree_call_rcu() avoids this by
+ * bypassing the sheaves layer on PREEMPT_RT.
  *
- * However, lockdep still complains that it is invalid to acquire spinlock_t
+ * lockdep still complains that it is invalid to acquire spinlock_t
  * while holding raw_spinlock_t, even on !PREEMPT_RT where spinlock_t is a
  * spinning lock. Tell lockdep that acquiring spinlock_t is valid here
  * by temporarily raising the wait-type to LD_WAIT_CONFIG. Skip the lockdep map
-- 
2.43.0

