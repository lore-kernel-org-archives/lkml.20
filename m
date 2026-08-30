Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B8318DB2A
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 07:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788074751; cv=none; b=c0M77qRFAtQgxPIvgBpK262EWRCkUavxXShEsx4GqgJm+zBiScwczZwHRnVZBRx63Rx/RJclzN+Q6I2brssmRMQd5JI2aW8kGAMnLOmVOe5l0P5aHF+GnAN6WWMJPm3GAGkoLXG7FEhUdx319AQbnrrpXDS9rh2IBpt1oSXmaxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788074751; c=relaxed/simple;
	bh=rHhQ3CouOpfrU4V+eXvK5UciHi/ecpohAdH2hDPyzsE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KUkncA9gLUeJMK9OcC434w3g0kEPot/SJItyo7A/JDygdrWllQf3TqWazRhIAwurz1tf3ZflGwkKsk8Tkcp5Mbw4m7M1AcbK5jDBOT2dyE9bUrN7z+zSQvAaHQEvX5Kfx52KwNmd0bO8UD+Z3LQETfymKBnVcoV174RKuhDj+r8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePIYUi7g; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePIYUi7g"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ccf2360620so19745355ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788074750; x=1788679550; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hcmzw/bzGZXuqmnVsevrBZ8607zbsdAVZ+LLgOu15kE=;
        b=ePIYUi7gEIt80fDE/wmvjyA4/wxN8qZZrER8DO7fv7QkAtJilnY7/Fc7h4Ab8JBcvq
         +AzleE89/WGnFsB0NoCfXrVuwSrIzu24cTwOeO6rR5uLqHAblzNXJmwpRHFNYplChYOe
         +340QpVNpj4XlXOKQLsg3HtTmD1gYhxAJs7ypyDi6gkhG+xExseKFZ/L5CpDl8L8Hv95
         uJA8MTNvNlqfvefkeC2bO9Q2+a46XMz9NGcUe7VWAAEpjMNtF3JNHH3BgkfAx7wsHJL9
         uOatQBVwU4NQKwGDbNC8FsAH0tUL0qTzG3syhjhh52QuN69sD+CVExM6Lp3FKeiDMo/8
         /vMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788074750; x=1788679550;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hcmzw/bzGZXuqmnVsevrBZ8607zbsdAVZ+LLgOu15kE=;
        b=hcFp9M+hRcRMAZduijsVECaOZYpYI+w6fxD7FCQZ1SmwB5EfB5FMzp9tnXzruB5gdy
         yJRb8LQppxJMAxMChxOR1vf1K1A9yEQnjPRYaezcGFBQQi8hWMo6pCYfOaQCftyzH2I0
         +WGAFpXRG0zepJQhc/JtxS72ClTt8c/FyaIV/dxBh0H77FmwWRwyY6d4W9Rit3NTPPzT
         1E3Ksh/xN9ko2j7gevZ3pi2wL7EPXqd9OppMoI8cAuFyNoMfeMNITudOEq2hVxsDs2Um
         t927vGM+Oihax1To8+7fIO0MId4sUN7Ak5zo0vPHwujDM7RYsw0RDezVw3cA9dyjcQLN
         MKZA==
X-Forwarded-Encrypted: i=1; AKwUvBwLp0M+xuv0+VU+EHCIPOKs880zjnBFMYlSahmOw0Ej/nr6AMoS5ukY7JeY34D9ny1iKMoPKKSpnqZLIXo=@vger.kernel.org
X-Gm-Message-State: AFuF++kewEOe4t/rmhBxxMVdYa1uQEDFqgRqWziSTRrX7VJIByS8Uz5t
	hkItxpuPohF1+3CnQ1uDdPYvGKDPxT9qIQ62uytuj8352dYTxMEZPh2t
X-Gm-Gg: AYBFou06SjNzFLdzU2ab9oCzgoX7VyPip1Si8se07Lyrw8zRWlIXpBH8gidVVw55xkl
	5k+A5C5y0iIZagflq8VJpemRsYVCJcuDfY3TPpJV5/8OpCxCisgUUUkKM6ahk8wMad48Z7ISsOH
	ZZVO3lItNWfaRsmWxsIoypKmtaVsTfwwGf7EdN4tnK43PLylbddvP13nEEyPZ7Pux6eJmEtkwWM
	rNvapCcAn3CbUZCuAzAEX70HXl3vCUUmFiwmAqPTMnCcBdbC2vLAlAwYJuz+syAS+Mmz6VWgL8l
	FmqzsAxVO6+SNjPq2tgKrYUOlHLw526O9mbDYaoC6V6aIWPeWXVPBzPLSYeutbTH7kuVKWMwLPT
	XsDAC6P81QLxukf6U3dP2q59e0vBh1E0gM8LbE03EXd25cfFpxnoqwxZwfSjVoREqUJ7eo6QmGY
	VW2C+lnHHpDVgQgxNCX3GEGq2eQqBHya9NiXvfsfj1wQ3xgB9CPiNl7CgrzUwtd/N0Eqdcgdm6F
	eHChJw=
X-Received: by 2002:a17:90b:2fcc:b0:398:9be9:ab8f with SMTP id 98e67ed59e1d1-3989be9aca2mr16397639a91.20.1788074749551;
        Sun, 30 Aug 2026 00:25:49 -0700 (PDT)
Received: from v4bel ([58.123.110.97])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda7835dsm10440159a91.5.2026.08.30.00.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 00:25:49 -0700 (PDT)
Date: Sun, 30 Aug 2026 16:25:45 +0900
From: Hyunwoo Kim <imv4bel@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>, Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Hao Li <hao.li@linux.dev>, Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Suren Baghdasaryan <surenb@google.com>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, imv4bel@gmail.com
Subject: [PATCH] mm/slab: take n->list_lock for the list_add() in
 __refill_objects_node()
Message-ID: <apPa-cGLcyt90l-E@v4bel>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In __refill_objects_node(), the list_add(&slab->slab_list, &pc.slabs) that
follows a successful __slab_try_return_freelist() is done without
n->list_lock.

__slab_try_return_freelist() only succeeds while slab->freelist is NULL. The
slab we are refilling from is taken off pc.slabs by the list_del() at the
top of the loop, so at that point it is on no list.

If another CPU frees an object of that slab, __slab_free() sees the slab as
full and puts it back on n->partial. If a third CPU then takes that object
in get_from_partial_node(), the freelist becomes NULL again.

A slab that sits on n->partial with a NULL freelist only exists while
get_from_partial_node() holds n->list_lock, between its cmpxchg and its
remove_partial().

A list_add() in that window overwrites slab_list to point into pc.slabs.
The list_del() in remove_partial() then follows the overwritten links, so it
unlinks the slab from pc.slabs and poisons slab_list while leaving the
n->partial side alone. n->partial is left pointing at the poisoned slab.

           CPU0                        CPU1                  CPU2

  __refill_objects_node()
    get_partial_node_bulk()   // n->partial to pc.slabs
    list_del()                // on no list now
    get_freelist_nofreeze()   // freelist = NULL
                              __slab_free()
                                add_partial()
                                // back on n->partial
	                        // freelist is not NULL

                                                    get_from_partial_node()
                                                      lock
                                                      cmpxchg
                                                      // freelist = NULL
    __slab_try_return_freelist()
    list_add(&pc.slabs)       // overwrites slab_list
                                                      remove_partial()
                                                        list_del()
                                                        // off pc.slabs
                                                        // slab_list = POISON

panic log:

  list_add corruption. next->prev should be prev
  (ffff888100000248), but was dead000000000122.
  (next=ffffea000416e410).
  kernel BUG at lib/list_debug.c:29!
  Oops: invalid opcode: 0000 [#1] SMP NOPTI
  CPU: 1 UID: 65534 PID: 144 Comm: poc Not tainted
  7.2.0-16172-gcf72cbb39da8-dirty #1 PREEMPT(lazy)
  RIP: 0010:__list_add_valid_or_report+0x80/0xd0
  ...
  Call Trace:
   alloc_from_new_slab+0x183/0x300
   ___slab_alloc+0x31c/0x890
   __kmalloc_noprof+0x3d4/0x800
   lsm_blob_alloc+0x2d/0x50
   security_msg_msg_alloc+0x26/0x90
   load_msg+0x1aa/0x210
   do_msgsnd+0x91/0x800
   do_syscall_64+0x109/0x5d0
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
  ...
  Kernel panic - not syncing: Fatal exception

Do the list_add() under n->list_lock. Reattaching the freelist stays outside
the lock. Once it succeeds the freelist is no longer NULL, so __slab_free()
cannot put the slab back, and by the time the lock is taken remove_partial()
has finished and the slab is on no list.

The lock is held until the block below that returns the remaining slabs to
the partial list. That block already took the same lock on this path, so no
lock/unlock pair is added.

The unlock is keyed on having taken the lock instead of on pc.slabs being
empty. With CONFIG_DEBUG_LIST or CONFIG_LIST_HARDENED, __list_add() returns
without linking anything if its check fails, which would leave pc.slabs
empty.

Fixes: ba7425312607 ("mm, slab: add an optimistic __slab_try_return_freelist()")
Cc: stable@vger.kernel.org
Signed-off-by: Hyunwoo Kim <imv4bel@gmail.com>
---
 mm/slub.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/slub.c b/mm/slub.c
index f9b56cb439e709..4f6d1a03a8ee46 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -7260,6 +7260,7 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 	struct slab *slab, *slab2;
 	unsigned int refilled = 0;
 	unsigned long flags;
+	bool locked = false;
 	void *object;
 
 	pc.flags = gfp;
@@ -7297,7 +7298,10 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 			void *tail;
 
 			if (__slab_try_return_freelist(s, slab, head, count)) {
+				/* get_from_partial_node() may be mid-removal of the slab */
+				spin_lock_irqsave(&n->list_lock, flags);
 				list_add(&slab->slab_list, &pc.slabs);
+				locked = true;
 				break;
 			}
 
@@ -7312,9 +7316,12 @@ __refill_objects_node(struct kmem_cache *s, void **p, gfp_t gfp, unsigned int mi
 			break;
 	}
 
-	if (!list_empty(&pc.slabs)) {
+	if (!locked && !list_empty(&pc.slabs)) {
 		spin_lock_irqsave(&n->list_lock, flags);
+		locked = true;
+	}
 
+	if (locked) {
 		list_for_each_entry(slab, &pc.slabs, slab_list)
 			set_node_partial_state(n, slab);
 
-- 
2.43.0

