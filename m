Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 154A529408
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 06:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788156451; cv=none; b=JEhOroPN3srQPJfnQ9N/qby6DuWpoXXdvb/P2fMS6fR1CdbKsRorVkBEv9WB759P4mn2paRDQ4usVrbBt8ET9ztI0JCv9ODNN/eyVGfxbzyetAnI0XphFc8Du+HhFAoOjDnl2H71emuNhr/aMqOVZ42MtJNx25DMp2L3hfgYHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788156451; c=relaxed/simple;
	bh=JXR3ikR0PzfPVFhh7TE8tFwEuaq75yPycMthOrlC+XY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pQVk9vDP+iDskcceL7dAxLn7zT4au0iirR8J1XSfl8VThECcfzcwlEkaXR9s5JxxnDk+GdnkAoNI3wgD2pvk79EsTpK+9fNmB+kF3PhlOGR1TnCoCjmCkx2Mv8yKO/0tRLxpewW+2DOYVzXhBWJiqer5su98vieNGEvMipDnMeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aO6RY54h; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aO6RY54h"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d7200b2e15so32586165ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 23:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788156449; x=1788761249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hZKewmGq0J9WH8blhf/djGi6qD4AnbzKIdeFzMaSw4w=;
        b=aO6RY54h7CgiP1RSpCpF8FCKzHBzbeFBwCnjaMAO1g8DL2kUTnUR4trxDZZ3eEJ/4+
         ZSL3ttJuTLrWidUAhJYec0sej3mHrvZZYZwYgPkTDtui4qE7J/lE2Mld4hcfMQerq3uU
         MiTBOLclkzuiXD5rJGYufvHUqXHsweuT87PXxZA7MzZ5QW4ojPW5WjWbo+gqEhoa3ziD
         LwPcqT7jvRDFlOslb4to7hrhTAiULbH7xsQUsiv5ncRVQjMY1Fa/mbNDkqN595eheeOe
         e2nkYv8Xmzp2jKELupkAXxsYyhN0oFR5YQOLulsdzMk4AY26sXBOpYKfuEqNPkOEEF8u
         Ea4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788156449; x=1788761249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hZKewmGq0J9WH8blhf/djGi6qD4AnbzKIdeFzMaSw4w=;
        b=KyLkqI1E6ROMc8V6DfSbUSkNX6R2Oyok36jisS56Ye6E6Hojr5vYHvOTYVwEt3QY+S
         E02eJLcE0osrYCjffkTHQ1Ev3uKKFxkDptWKKSMrYpZJ3uNc9cEKHUNMc+6IcyDX9Nnv
         HJj/tRicgUTHgze/pv4AWIZFofL5ZdOQxu/Vp5ABHJE2iYYCYqUDIHHyJ6PLcYLHzvwN
         /M/N8ONFvx0v0zguA5bcozsPxJqHimHhdjCrpAYOsWEOolA3R3mq+PtbjjexLpIxJK2N
         Z+aDQm4kQac3CQccTBSzZP/6R0RphgBf9K/b/k4Xxxlc21Y40pnCL02GwfzavKtwpkbx
         P+Ew==
X-Forwarded-Encrypted: i=1; AKwUvBwz2pmtH1YH/YPrMWfhm5WV9DhwZLzmtwDa29quZHPUuwIRbl70/DMbPxJrHhvu0vroF3Cj3jHwno9IwyQ=@vger.kernel.org
X-Gm-Message-State: AFuF++l/eORPSZwFqJE9Xo4S6INjSjmVjZYlWkYn4xmNOTipe4K0Kc4b
	e5mUxKRr60vdZgYSSW/kQmvZOOUESYxRPIi07/P9W/e/VMe3i8FJWemX
X-Gm-Gg: AR+sD12jPODK5o/3Kt+te8Q/WHiRJQt+5rfgCFJOx3N/AH5Zjgc/xjT8f2b9mG1W0gP
	kVaTDf5x8nG6Rm4wDXoGPhdMm2mWXPlAmtJYzcCaI1wYjOCL7SnllVi7CsWx7vWFAoGKdLF6vaX
	2gyHGalJUyfe4MJUgTOHesuKQ1sP+dEdg35ZgrWixvmaxnQ5BANhYUEbEubOxbTghQJeQdf0Xy2
	2MxE/upDfP4Ect1LaNmVJyNcsABJs2SlBLhGGS+pMzVPiAofwsYOd3+UvAyjPw6nGh7A9whi+VC
	vh+nS6H3wSJQhbL+DRR/OHXUW5P8p31+2xaGLei0ogzl9yrSlZzxEsxDfqGiwBgZkK61gjPIZab
	0VNGl8Fnk1nAC1A1o5la7kcE8K4rnDMBH+lZ9MsDTUyycfKYbfnv5SNVaw8pMhxgdXsxUJ/ndyj
	rUhnYUFFNr6JZTEMl8NBVTFmGaxsoQkvGL0shHBBnNRw+BpL4Sa/CGQqGQ6G7XYLrYHGpJ8PiQQ
	J1JmzMZkQ==
X-Received: by 2002:a17:903:3d07:b0:2d8:d4d7:f055 with SMTP id d9443c01a7336-2d93fa78359mr17270765ad.22.1788156449332;
        Sun, 30 Aug 2026 23:07:29 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:21dc:72d0:980a:8660:dfa9:a9cc])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598c3da2sm29795255ad.82.2026.08.30.23.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 23:07:29 -0700 (PDT)
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
Subject: [PATCH v2] mm/slab: don't use kfree_rcu sheaves on PREEMPT_RT in kvfree_call_rcu()
Date: Mon, 31 Aug 2026 13:06:32 +0700
Message-ID: <20260831060633.6831-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831053846.107974-1-ngocthang2710.1999@gmail.com>
References: <20260831053846.107974-1-ngocthang2710.1999@gmail.com>
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

  __balance_push_cpu_stop()               [holds p->pi_lock, raw]
    select_fallback_rq()
      cpuset_cpus_allowed_fallback()
        set_cpus_allowed_force()
          kfree_rcu(ac.user_mask)
            kvfree_call_rcu()
              kfree_rcu_sheaf()
                __kfree_rcu_sheaf()
                  local_trylock(&s->cpu_sheaves->lock)   <- _T->lock

set_cpus_allowed_force() uses kfree_rcu() instead of kfree() here
specifically because it can be called with p->pi_lock (a raw
spinlock) held, and plain kfree() may sleep under PREEMPT_RT.

Commit 2a8bb29ec9b2 ("mm/slab: allow kfree_rcu_sheaf() on
PREEMPT_RT") made kvfree_call_rcu() try the sheaves fast path on
PREEMPT_RT too, since __kfree_rcu_sheaf() only trylocks there and
so cannot itself block. True, but the sheaf/barn locks it trylocks
are also taken as regular, blocking locks elsewhere, so lockdep
still records a lock-class ordering cycle against any raw spinlock
already held by the caller, which is what syzbot caught.

The plain kfree_rcu()/kvfree_rcu() API gives kvfree_call_rcu() no
way to know the caller is in such a context, so keep it
conservative on PREEMPT_RT and skip the sheaves layer there,
falling back to the existing raw_spinlock_t-protected krcp list,
which is always safe to nest under another raw spinlock. This
restores the pre-2a8bb29ec9b2 behavior of kvfree_call_rcu().

kfree_call_rcu_nolock(), added later in commit 3bc999d944b3
("mm/slab: introduce kfree_rcu_nolock()"), is untouched by this
patch. Note it would not be a safe substitute here either: it still
reaches __kfree_rcu_sheaf()'s local_trylock() on &s->cpu_sheaves->lock
unconditionally, so a caller already holding a raw spinlock would hit
the same lockdep ordering cycle through that path too.

Reported-by: syzbot+acf142088e0182172e58@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=acf142088e0182172e58
Fixes: 2a8bb29ec9b2 ("mm/slab: allow kfree_rcu_sheaf() on PREEMPT_RT")
Signed-off-by: ThangNN99 <ngocthang2710.1999@gmail.com>
---
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
index b19ba1b31484..3de1eabe6c77 100644
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
+	 * Callers may hold a raw spinlock here on PREEMPT_RT (e.g.
+	 * set_cpus_allowed_force() with p->pi_lock held), and the sheaf/barn
+	 * locks are also taken as blocking locks elsewhere, so trying them
+	 * here creates a lockdep-visible ordering conflict. Skip sheaves on
+	 * PREEMPT_RT.
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

