Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35955448B8A
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 08:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788770518; cv=none; b=Ortu6LydJ0TWbvO3XxGeF4WZbWzTthWahAmwUPH2BrO9no+rXZU8C/G0/vJvf9+L/nflHuJn1Y+TfJJpYdaNh309FTIljxz2/kqQ3yu8EiBIxvxhVLFmgBQh2m3Uxiha1tOwXHkC2v6QEpRgtYwqxBV3ieldG/MEzXeFSitos8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788770518; c=relaxed/simple;
	bh=b66/JTp0PGZftKfxgh0vOj/JZB8PQCgl2YAq0patHng=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ec06po3xcUZm82MyNzzXP1T0xM4nptBsPRdz9y1ueVvIlVAMZk+oEIBKkU7HRLKY6MBHWGN42NejQo5t7Fpr3Ppoy3Ru1z4P1I0GcF738+IKTQe7f/qSeeekHqYNONc8QEqB/B3eFDsygnziQ40Ck8/lTpzmOLUzU7X529KV09M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0ZefUjc; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0ZefUjc"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-495590dde14so46795485e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 01:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788770515; x=1789375315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUNx51fF4zO00Zyg4SYhi1EUTdrEwCLha5IxI5s1LAM=;
        b=V0ZefUjclb0S04ydB87Qrv5APX/+dWSkvgBsoS5GGUoYvT0SEegZppbkamNGm/M+1O
         VnwaGBtSWh1iNLBEY7cyjtkfw7r1yh8ZIB+viPzmDHTNiSaVLrMyh04ybi3fNFrccSIA
         c696T7g2huvCgohTt07YB1+EpRw9gKBq+M5euFiSIqlnn3fSpSS5Tjxl2dadwbKGcGVr
         b+BdsZxvd4dxhB7aiZ6zE2FzwVwGumfo5trFHk6Mq5LeDA1/BlXqGWgLmz+14FZAsYs3
         raEJwiwYB+eJukYj13ntZ8FlJyeaJ7elz28QhFuyxLuTncha+j3LFw+fT2pPFekt1eV2
         DAbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788770515; x=1789375315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUNx51fF4zO00Zyg4SYhi1EUTdrEwCLha5IxI5s1LAM=;
        b=VZrXIQYVd5xB5BxIQl64rHQ0QqASOkpoPa0WTM0JfkvbjQjmC68Erj1NV6JaLUsUw0
         J+mbwzGX5kPfb+IeYVn5lmLvRDiXeZQM41ZXLJEHghB3kh533ZNIVdVX1++zMBhzx4sg
         4ywT8P7CmipFopCWAC26mWJy30Oj3KwHGZJtL4pu2Pmdp3u/9tya/9MElAw33+UJIDMF
         It+wBBZlh08rw2F7C69eqbXR30QeQJyr86a829ib8lxbJhJAs+XtwlzTg08wvJJ1s2pg
         7Nq3lVDl/zjmLtmylK+9X7hWKdVZqgfaFvsdvFychzlZWK7KX66LJWkQihRhQq1Z347N
         ZCpw==
X-Forwarded-Encrypted: i=1; AKwUvBxthg+oRnK5W4TTgsI20KpKpYgf1n7ANol+IOhTWHNT3rViihTNjYlMfgoJnKwQvJYI0ii/9ennFrik6y8=@vger.kernel.org
X-Gm-Message-State: AFuF++n/czZ9rkWyuf+6+FD9SH8GosoNmfVrHFneTcp2jDfp6JqDVJdm
	rFQDtCccRM1oZjaSeOULnaA+ltpNXKH+vCRIKyQXPaCf/ZxIGphF0St5
X-Gm-Gg: AYBFou3O51SnSyUDAq8rLW6mD3+pqP3b4XpS9zWOlHtoAgeqb6yIIbZFGcEsxHykB11
	WdoMBtfe/lHTg+zX+ywAkioY1d+JjC12LAnwoJnjSkTSko7JuAzBN4eprkNUL+HGPAoG3Kumd+G
	noSe0viUStwqgyxuSilYdzIlbpcx46mqHquHgA/MMl+AfVxNsHaWJnO8WC5th1ey5PHjtX/30R3
	Fu/7eaafdGvRyA0ewW4le7odUoi6rOJHFwmAu8f2aWJEkgfVVAfb9uB70Ke7PPAYPyqUsRulNg2
	0wm99gK1F+MQJWdgZAWLuUihdult9b1TsNXkJMkxDeXUmESzGtlt5oDegzohffG42vzzlB/+fEO
	JvLxurHRTYhcw0MgoefyV4pQnzv2yN4owGR9NgH8Hiples9F6cW/9ZyX9jAb32iOZmrAqWXNEpz
	OoOPOnxNDbMlbk5gcqcbqfWnXQT3UakwV/GxQFolyNVDMPBZ7tsfsbpXk24A5MhNo5Sphzm3y8D
	gT3nJL5GIH2aXNnWyploE7kw14NkYHIKyz9S2cWnwgpXQ==
X-Received: by 2002:a05:600c:860b:b0:49c:ee20:e787 with SMTP id 5b1f17b1804b1-49cf7fe62e9mr440579205e9.1.1788770515073;
        Mon, 07 Sep 2026 01:41:55 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bbb51sm27883762f8f.30.2026.09.07.01.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 01:41:54 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Yafang Shao <laoar.shao@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v4 next 5/9] locking/osq_lock: Avoid writing to node->next in the osq_lock() fast path
Date: Mon,  7 Sep 2026 09:41:29 +0100
Message-Id: <20260907084133.3696-6-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260907084133.3696-1-david.laight.linux@gmail.com>
References: <20260907084133.3696-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

osq_unlink_from_next() is called by osq_unlock() and when osq_lock() returns
false (lock not acquired).
osq_unlink_from_next() will either have done an explicit xchg(&node->next, NULL)
or a cmpxchg() that checked that node was lock->tail.
In both cases node->next will be NULL in exit.
Since it can't be changed when not referenced by an osq_lock there is no
need to initialise it at the top of osq_lock().

The atomic_xchg(&lock->tail, curr) could probably changed back to
the '_acquire' version or even the _relaxed version.
The important barrier is after the write to node->prev.

Defer determining the address of the CPU's 'node' until after the
atomic_exchange() so that it isn't done in the uncontented path.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/locking/osq_lock.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/kernel/locking/osq_lock.c b/kernel/locking/osq_lock.c
index f39f77c3a07d..2f92d3d63da9 100644
--- a/kernel/locking/osq_lock.c
+++ b/kernel/locking/osq_lock.c
@@ -86,6 +86,9 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 			 * We were the last queued, lock->tail now references
 			 * prev (or is 0 if the list is now empty).
 			 * If prev was spinning in this loop it can continue.
+			 *
+			 * Since we are the tail of the list, node->next
+			 * must be NULL.
 			 */
 			return NULL;
 		}
@@ -122,13 +125,10 @@ osq_unlink_from_next(struct optimistic_spin_queue *lock, int prev)
 
 bool osq_lock(struct optimistic_spin_queue *lock)
 {
-	struct optimistic_spin_node *node = this_cpu_ptr(&osq_node);
-	struct optimistic_spin_node *prev_ptr, *next;
+	struct optimistic_spin_node *node, *prev_ptr, *next;
 	int curr = encode_cpu(smp_processor_id());
 	int prev;
 
-	node->next = NULL;
-
 	/*
 	 * We need both ACQUIRE (pairs with corresponding RELEASE in
 	 * unlock() uncontended, or fastpath) and RELEASE (to publish
@@ -139,6 +139,7 @@ bool osq_lock(struct optimistic_spin_queue *lock)
 	if (prev == OSQ_UNLOCKED_VAL)
 		return true;
 
+	node = this_cpu_ptr(&osq_node);
 	prev_ptr = decode_cpu(prev);
 	node->prev = prev;
 
-- 
2.39.5

