Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3E151E43D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 17:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788800639; cv=none; b=AB2ggyWgQhtz2onb51JBQIEK1ZXLBCxL5mg+iA195EWB7lbXh4KePCwDNKhyMPDIwXJH1yxTrVhis224QmUM6DNBUWBrtZa7Qj7mmRkTM6wWMszCHNKFK2pl4qAebBzoVbu9E2Imq/AeB3ZlzfEmTWfhtW9Un+pV0KUYo8z5DnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788800639; c=relaxed/simple;
	bh=vrODrEGyPy2HxTFLumbTrn2pJSVr3wlu7+a/6nMWEHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SZwHIyW4G+/16EKJv4fJDBK9u8PuvO0CclV+QMvMpYiM3IAPj1HTxQQ4TE2N9kf1ETb8X+oz0yE2QP/m3bsFZe22Zf94nqYYyEKDD15S5B7G6tmVfxNpbvkGhTa7jdZ7jTiqE30tSYlCAA9Y0ZvzeeUrhAK5MWmdWARf0IFjrsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VO63anKm; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VO63anKm"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-499ac87c92bso41878515e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 10:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788800636; x=1789405436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tvooa+L5cAyohFCcPjkllyWRWyPheMiofgVbNkk02cs=;
        b=VO63anKmFXgLw3wqgiX8PYk0S3PntfdCjYFCSIQhA9uFPwIoEyIGbpSiLH4ndgnEK9
         U7HNPFm6/kebnk7nIhR52g/Du26niutvt0MpNXdrZA3g0wwg5bN7M1vBo2K5GCdDZ/zI
         BSU9Z9grYHOkMspfHdT2HGq0y7q7Kv4t84SO5FZd5D1YWqZvMedThEa7eq3HzmMP7n6W
         gGmN2MLkZthBFFdQlnBpvzypgWCsYglY7aMx1xj5Sxvbqt47zl1MlBFVZXC4tC1aabPs
         CaCCfa4gudRRdxpzFYxW+lq28N0z8a1iuImcdSZLthBjK9djdMWBzh1SVUd83E1AlAG8
         vBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788800636; x=1789405436;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tvooa+L5cAyohFCcPjkllyWRWyPheMiofgVbNkk02cs=;
        b=ejJA1OKsAE8+1lhGxe24IEkiu661LJxUf+wi3GV+jZ0N/TO6xZ6QaUA79sqlqK+gVM
         IhZJVaQCxfZzEWKp11xf9Ipj4xRmDXr58EVnw5kc80LqR/br9xQMMWKo7rAwuUn/RtFx
         QAqXaBM2eTtuEYc7nU24N4kj6h8s6VAzgj3J59vjZcDQl9pwoa0yOzjXceh5yU6QznL+
         u/w9ssGWwQH/Hw6pa0ti14c20c1vqimpX3PHCZbmre7IRDUgSMpCMkvn3SMS9l/mWbxW
         myLjzAGK/AVjYIbPwBZ7EX+CDCaQPvTA4bqAPfvbcXLNDKRtn3nMkTtJhq8u6djfTOIy
         SIWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxEvxcs9CI6rXPvFKn7DFqWEo2o2GlG97VII7cNa42C111wEnlgLBhrcLdk8gkwFRSWh9yquB4SCr5K250=@vger.kernel.org
X-Gm-Message-State: AFuF++mJxe3TmxSek3uzend63qpPNE6VXNZcdS7YiOPaGy3N0iwoqPuD
	hvd7rdtNupioEUXMrlAto/qnNiLA93fB+KiqBz2FQ4KNF/me+/1F4D830qMkeGKJ57g=
X-Gm-Gg: AYBFou2hGfXFFRxnrjX+zIjJNEkQYGvT8RTh4ABCXzgGH9c0eYFXS2SwgL9C0sgQ14S
	rbqAata3Nle0OICrSdg1bws8Szrar91CkzeGvdI2Wi2Pr0/JoRG6qrUqdyi9xEdrRRuZCmieGuf
	Yv4zVLwe/5VM9CggN7SAb/6rwQiZUAchGuV3qzMy/1EZh25hczem4rhrlTG82Z9TgvLD9wN+8L6
	IVCHSMK870FQvfI9wp0fo4VebZuKox/PH3tvaJAqCw0nelI+fM/h1MdJGrgiLAOYJpjM4SqbOwH
	aSrPV5zaSQI3y5PwpgHjeW3pWPK1eTYViCSoEd5wsSPzpIKyK9trdMrxqIBkZuvyCEZVE1kit9v
	TeNkILWBx29pDyNfmDyQrfW+gn76p0dzq1pTw9RgtshkIyapam1eYFGzQvmv78Rf/aF8zUjmJc+
	6Mw1xoARqi+kZ4oFwTVeHhY1WegThF7mCHZFJIg9nlpvJp2C4j5Io=
X-Received: by 2002:a05:600c:e555:20b0:49d:1756:8c4a with SMTP id 5b1f17b1804b1-49d17568c5fmr17878935e9.17.1788800635690;
        Mon, 07 Sep 2026 10:03:55 -0700 (PDT)
Received: from localhost.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfd3f815bsm233462305e9.4.2026.09.07.10.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 10:03:54 -0700 (PDT)
From: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
To: Tejun Heo <tj@kernel.org>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Dan Schatzberg <dschatzberg@meta.com>,
	Peter Zijlstra <peterz@infradead.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	stable@vger.kernel.org,
	Noah Elias Feldt <N.Feldt@mittwald.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Johannes Weiner <hannes@cmpxchg.org>
Subject: [PATCH v2] cgroup: Avoid iteration of dying tasks with zero refcount
Date: Mon,  7 Sep 2026 19:03:44 +0200
Message-ID: <20260907170345.45316-1-mkoutny@suse.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The commit 260fbcb92bbea ("cgroup: Move dying_tasks cleanup from
cgroup_task_release() to cgroup_task_free()") extended the lifetime of
tasks on the dying_tasks list.
The iterators have provision to go through dying_tasks because of
dying threadgroup leaders or explicit CSS_TASK_ITER_WITH_DEAD, however,
it was expected that such tasks can obtain a new reference (that is
possible before cgroup_task_release()/put_task_struct_rcu_user()).
The tasks after cgroup_task_release() and before cgroup_task_free()
are subject to race when they may or may not have usage count > 0.
The iterator should not attempt to resurrect tasks whose usage count
dropped to zero. (When that happens, __put_task_struct_rcu_cb() is
already imminent and the returned task_struct would could be used
after free.)

To avoid dispatching such tasks through the iterator, recheck the
threadgroup's size (follows same logic we have at other places) and skip
such tasks on the dying_tasks list.

Rough illustration of the possible race

  R (reader of cgroup.procs)         T (thread)                       L (group leader)
  ---------------------------------  -------------------------------- --------------------------------
                                                                      L exits, signal->live > 0
                                                                      cgroup_task_dead(L)
                                                                        css_set_skip_task_iters() // skips only cset->tasks
                                                                        list_add_tail(&L->cg_list, &cset->dying_tasks)
  css_task_iter_next()
    take css_set_lock
    css_task_iter_advance()
      leader && signal->live != 0
      => it->task_pos = &L->cg_list
    release css_set_lock
                                     T exits 					[A]
                                     --signal->live == 0  // we can check this
				     cgroup_task_dead(T) // css_set_lock	[C]
                                     release_task(T)
                                       cgroup_task_release(T)
                                       release_task(L) // zap_leader
                                         cgroup_task_release(L)
                                         put_task_struct_rcu_user(L)
                                         ...RCU...
                                         put_task_struct(L)
                                           L->usage = 0
                                           /* L still on dying_tasks */
                                           ...RCU...
                                           __put_task_struct(L)
  css_task_iter_next() // another iteration					[B]
    take css_set_lock
    it->task_pos = &L->cg_list
    get_task_struct(L)
      => addition on 0
    drop css_set_lock
                                           cgroup_task_free(L)
                                             css_set_skip_task_iters() // dying skip comes too late
                                           free_task(L)
  cgroup_procs_show()
    task_pid_vnr(L)

cgroup_task_release() is not synced via css_set_lock hence the race
possibility. (I'm not 100% convinced about this LLM-assisted
interleaving, multiple css_task_iter_next() calls may be involved with
css_set_lock released.)

Fixes: 260fbcb92bbea ("cgroup: Move dying_tasks cleanup from cgroup_task_release() to cgroup_task_free()")
Cc: stable@vger.kernel.org # v6.19+
Link: https://lists.debian.org/debian-kernel/2026/08/msg00220.html
Suggested-by: Tejun Heo <tj@kernel.org>
Reported-by: Noah Elias Feldt <N.Feldt@mittwald.de>
Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Tested-by: Noah Elias Feldt <N.Feldt@mittwald.de> # if-variant
Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/cgroup/cgroup.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

Changes from v1 (https://lore.kernel.org/r/20260902161653.1051794-1-mkoutny@suse.com)
- check task->signal->live instead of t->usage
- add css_set_lock release to sequence diagram

My comments to the signal-live variant.

First, I replaced the if() with a while() loop because when one such
dying leader could remain on dying_tasks, there can be more of them
(matter of effort) and single css_task_iter_advance() won't be enough
(we need to skip all such tasks before get_task_struct()).

<del>Second, if [B] races at moment of [A] (signal->live still positive)
and before [C], usage can still drop to zero.</del> Nothing, given the
ordering, positive signal->live implies positive L->usage so the
proposed check should be OK.

Thanks,
Michal

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index c3a12fee7528f..d3069a5e9185d 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -5290,6 +5290,7 @@ void css_task_iter_start(struct cgroup_subsys_state *css, unsigned int flags,
  */
 struct task_struct *css_task_iter_next(struct css_task_iter *it)
 {
+	struct task_struct *task;
 	unsigned long irqflags;
 
 	if (it->cur_task) {
@@ -5303,6 +5304,21 @@ struct task_struct *css_task_iter_next(struct css_task_iter *it)
 	if (it->flags & CSS_TASK_ITER_SKIPPED)
 		css_task_iter_advance(it);
 
+	/*
+	 * @it->task_pos was picked on an earlier call. A dying leader stays on
+	 * dying_tasks until cgroup_task_free(), past its last usage ref drop,
+	 * so it may have been reaped since and get_task_struct() on it would
+	 * resurrect a task about to be freed. That last ref is dropped by an
+	 * RCU callback queued from release_task(), after signal->live hit zero,
+	 * so a leader still showing live threads in this irq-disabled section
+	 * can't lose its ref before the section ends.
+	 */
+	while (it->task_pos && it->cur_tasks_head == &it->cur_cset->dying_tasks) {
+		task = list_entry(it->task_pos, struct task_struct, cg_list);
+		if (!atomic_read(&task->signal->live))
+			css_task_iter_advance(it);
+	}
+
 	if (it->task_pos) {
 		it->cur_task = list_entry(it->task_pos, struct task_struct,
 					  cg_list);
-- 
2.55.0

