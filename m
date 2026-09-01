Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819DD367287
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 02:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788229306; cv=none; b=OKu3BDjCQkRmH1PC+1lfemAkHseF8IXiiSS30cSfhXHw88jmI2CGRwrhQlNmrcuhCqcXsOf4X5c8rEepCmhLfYHY3ckufpe3vjT6WfGmP9NQh/cBuXzZoWkMISz183/evO3j4dbk9QcHjwCl9K9ISobme0Rb6QcUPwRWKQkRkuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788229306; c=relaxed/simple;
	bh=6A45KQsMhG545lj+gySRmdqPnbCXhblJT6vIFUdOFl0=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=NFtNUOENl10WwLEK3THu4pgcfk+fsA0hIlylXfgWUMezGxfcjbXcYttB6jSVaaDrudvUIJRos6w2UCu/M+2I2d5HEnUxEoq+E5gEV36dLi4yIaCoM3vL6CJ+ywuraPrWOh5wOIkN8RhzvkMSdeU9B1S1tG4E56kw6gh7dNy+GyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=upJeo5zI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="upJeo5zI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF76C1F000E9;
	Tue,  1 Sep 2026 02:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1788229304;
	bh=nWr57L9oQWg5Rjw3gYY7rn/3MsiJaWLvKVzqZAGClQk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=upJeo5zIxIAvCAPdVQuUdyj7fypAMNl4Dqyc84799yqVN2YblxJrWX3iJA7YGyTDr
	 oP4icuiCT+8aUOck8bF09Hxcodyczxkpdy8liaw97r+ZQjE+JO0bwMiHe3fW/CREsl
	 lAPKhrnw/2DCBHAr3zsUs/pN2up5ujeCSasvyrL0=
Date: Mon, 31 Aug 2026 19:21:43 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Qi Zheng <qi.zheng@linux.dev>
Cc: hughd@google.com, baolin.wang@linux.alibaba.com, usama.arif@linux.dev,
 brauner@kernel.org, david@kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v4 1/4] fs: fix missed removal of
 super_fs_objects_eligible()
Message-Id: <20260831192143.84da447c4fa2afb60757afa4@linux-foundation.org>
In-Reply-To: <c1ad6e39-3b21-413c-ad02-f90cfc4102f9@linux.dev>
References: <cover.1786955972.git.zhengqi.arch@bytedance.com>
	<3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com>
	<20260828114129.909edbfb7e42b36af2da6a98@linux-foundation.org>
	<eeae0d48-4d50-4dd4-9e16-b4f9902d84f4@linux.dev>
	<20260829162350.1ee9e17d71a297b06b171941@linux-foundation.org>
	<c1ad6e39-3b21-413c-ad02-f90cfc4102f9@linux.dev>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 31 Aug 2026 10:28:00 +0800 Qi Zheng <qi.zheng@linux.dev> wrote:

> > OK, please add this info to this patch's changelog.  Please also decide
> > whether a cc:stable should be added and if so, ensure the changelog
> > makes clear why we're recommending a backport.
> > 
> > As part of this, let's expand on "XFS will also run into issues".
> 
> How about this instead:
> 
> ---
> Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
> individual filesystems") was meant to drop the blanket memcg gate in
> fs/super.c and let each ->nr_cached_objects() implementation decide
> for itself whether it is meaningful in per-memcg reclaim. However,
> when that patch was applied the removal of super_fs_objects_eligible()
> and its two call sites in super_cache_scan() / super_cache_count() was
> lost, so the helper is still gating every ->nr_cached_objects() hook
> and 0ef8faff490be is effectively a no-op.
> 
> Consequences of the leftover gate:
> 
>    - XFS's inode-reclaim hook, which is intentionally driven from
>      per-memcg contexts to free memcg-charged slab, is still
>      short-circuited in fs/super.c — exactly the regression from
>      commit 0baad6f9b997 ("fs/super: skip non-memcg-aware
>      nr_cached_objects in memcg slab shrink") that 0ef8faff490be was
>      written to undo. Memcg-charged XFS inode slab therefore keeps
>      piling up under per-memcg pressure until global reclaim kicks in.
> 
>    - Any future ->nr_cached_objects()/->free_cached_objects() that
>      grows memcg awareness is likewise blocked before it can run, so
>      filesystems cannot opt in to per-memcg reclaim on their own —
>      defeating the whole point of pushing the gating decision down
>      into the callbacks.
> 
> Drop the leftover helper and its call sites so the intent of
> 0ef8faff490be actually takes effect.
> 
> Fixes: 0ef8faff490be ("fs: push nr_cached_objects memcg gating into 
> individual filesystems")
> Cc: stable@vger.kernel.org
> ---
> 
> Can you fix up the commit message directly on your end? Let me know if
> you prefer me to spin a v5 instead.

Thanks.  I pasted this in and turned your [1/4] into a standalone patch
for mm-hotfixes, with a cc:stable.

The remaining three patches I turned into a separate series for the
next merge window.

This particular patch has no evidence of reviewer input yet?


From: Qi Zheng <zhengqi.arch@bytedance.com>
Subject: fs: fix missed removal of super_fs_objects_eligible()
Date: Mon, 17 Aug 2026 17:03:25 +0800

Commit 0ef8faff490be ("fs: push nr_cached_objects memcg gating into
individual filesystems") was meant to drop the blanket memcg gate in
fs/super.c and let each ->nr_cached_objects() implementation decide for
itself whether it is meaningful in per-memcg reclaim.  However, when
that patch was applied the removal of super_fs_objects_eligible() and
its two call sites in super_cache_scan() / super_cache_count() was
lost, so the helper is still gating every ->nr_cached_objects() hook
and 0ef8faff490be is effectively a no-op.

Consequences of the leftover gate:

   - XFS's inode-reclaim hook, which is intentionally driven from
     per-memcg contexts to free memcg-charged slab, is still
     short-circuited in fs/super.c  exactly the regression from
     commit 0baad6f9b997 ("fs/super: skip non-memcg-aware
     nr_cached_objects in memcg slab shrink") that 0ef8faff490be was
     written to undo. Memcg-charged XFS inode slab therefore keeps
     piling up under per-memcg pressure until global reclaim kicks in.

   - Any future ->nr_cached_objects()/->free_cached_objects() that
     grows memcg awareness is likewise blocked before it can run, so
     filesystems cannot opt in to per-memcg reclaim on their own 
     defeating the whole point of pushing the gating decision down
     into the callbacks.

Drop the leftover helper and its call sites so the intent of
0ef8faff490be actually takes effect.

Link: https://lore.kernel.org/cover.1786955972.git.zhengqi.arch@bytedance.com
Link: https://lore.kernel.org/3b038d373c70ebac7cdabfb0035bb91d1d6e6cfe.1786955972.git.zhengqi.arch@bytedance.com
Link: https://lore.kernel.org/all/20260715103516.2410175-1-usama.arif@linux.dev/ [0]
Fixes: 0ef8faff490b ("fs: push nr_cached_objects memcg gating into individual filesystems")
Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>
Cc: Christian Brauner <brauner@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Hugh Dickins <hughd@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Shakeel Butt <shakeel.butt@linux.dev>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 fs/super.c |   18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

--- a/fs/super.c~fs-fix-missed-removal-of-super_fs_objects_eligible
+++ a/fs/super.c
@@ -172,19 +172,6 @@ static void super_wake(struct super_bloc
 }
 
 /*
- * The s_op->nr_cached_objects hooks (used for example by btrfs and xfs)
- * operate on filesystem-global state and ignore sc->memcg. Driving them
- * from per-memcg shrink_slab_memcg() invocations only burns CPU walking
- * per-cpu counters and queueing duplicate work: the actual reclaim happens on
- * the global path (kswapd or root direct reclaim) regardless. Restrict them
- * to that path.
- */
-static inline bool super_fs_objects_eligible(struct shrink_control *sc)
-{
-	return !sc->memcg || mem_cgroup_is_root(sc->memcg);
-}
-
-/*
  * One thing we have to be careful of with a per-sb shrinker is that we don't
  * drop the last active reference to the superblock from within the shrinker.
  * If that happens we could trigger unregistering the shrinker from within the
@@ -213,7 +200,7 @@ static unsigned long super_cache_scan(st
 	if (!super_trylock_shared(sb))
 		return SHRINK_STOP;
 
-	if (sb->s_op->nr_cached_objects && super_fs_objects_eligible(sc))
+	if (sb->s_op->nr_cached_objects)
 		fs_objects = sb->s_op->nr_cached_objects(sb, sc);
 
 	inodes = list_lru_shrink_count(&sb->s_inode_lru, sc);
@@ -274,8 +261,7 @@ static unsigned long super_cache_count(s
 		return 0;
 	smp_rmb();
 
-	if (sb->s_op && sb->s_op->nr_cached_objects &&
-	    super_fs_objects_eligible(sc))
+	if (sb->s_op && sb->s_op->nr_cached_objects)
 		total_objects = sb->s_op->nr_cached_objects(sb, sc);
 
 	total_objects += list_lru_shrink_count(&sb->s_dentry_lru, sc);
_

