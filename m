Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F49446066
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 12:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388362; cv=none; b=GQV/RO32nCJUitl6nVsWcqRjfN+upXOPuWHooa6b8kva9oSGDBVoojezOMfhhcFRNXjjTgnDsuQKPCrSrhiTxHcp4wZk8m3EFNEOwwr8Cqo5x45YI6++CHBEcKBvFQ3GeNOEgMdzKAWd8OBt5HngQwFaOxtBRFO3HBQeOEe0Yh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388362; c=relaxed/simple;
	bh=w0NPZ2B16PTKXd/UrN0ohc5GgWHynSlyLqxyyFQZ+pU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U1XZ7pJzESJEwwABN/48PG5hFgxEst6jMN68yjJseAtEVkDI8kW+viSO+Ripl1EFW9uH7XEpMXiMH9hAz1ODiwsAsSRViJo7ynqTkhv/3F/5//TvXiqNQnq8FMJRvJQ8051jfHj+Kj8IqwizM5VoY72doSkp62nopFPFqu7obL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=R96rEyoM; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="R96rEyoM"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-495437bb891so18472965e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 05:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1789388358; x=1789993158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mtb9frUiqPz4ISU8sxRxKOZ4uH5pILeNk9x+K4a1PXU=;
        b=R96rEyoMomxICdRlZcz8tjGUzYF8Gnpctwj8T5BimfgvzxmDV3VB4uNfgLWuo2nzTu
         NqZyVV1E0CeDoVgzLN/ykHIDaJ+TdEEBusD6PheoMW/J8GWALrcQtwjVpNX8k0DIDSW7
         jl+XawgQkZpbXIpiVa25Yftr/ZH+Se5N4AUXdKcKyb3xdSi0iyf3et8lL6gzpEIYPU3d
         xlxs7NWFhsqWl/gpK1dcLfNYbBnpMQVVK34g9qq6Qfqi+HbkZTkN9+tcE8E/6BE0GGf5
         Alz3MdE8RBWfRyo5dGFWg+1Zscp2vlDSZL3tZ/Yd2zsEiok3CB25I/QPaBWJSI9YAD7Y
         2c8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388358; x=1789993158;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mtb9frUiqPz4ISU8sxRxKOZ4uH5pILeNk9x+K4a1PXU=;
        b=mhRq0avZxW3tP/JNSprp4uBXSeJCgl/m9CUne0iBLXOaEjjmiaEZA/+VXhrcLUxdqc
         YHEkBNFtBV5idrD1ID0QqsJHj5g4SnU4M8CP2z7q+d4qvY0D5FlBziNJdDuu9Jcs0JUC
         9c1ZsvABoAJ5jQbDK6xxzs5gGQVgIlOL12CaDS1BSUX0mF2+eZyCQ09nk0p+cc+KnKRi
         1SRyazz0Cfcxi4z9FZAYpSRpW4S3vC6gb+hrGviMujXBPt6WPltHVVDTvQmuqPFz/Ehu
         EUZuYOgOUdWw/SPNPYya1i7rvsjzqkPZ70tkPlkRdtW3ByFAHQNw9VKEuUFDb5IcI6UQ
         /jvg==
X-Forwarded-Encrypted: i=1; AKwUvBxGqSL77V21tbEk+slIWshdkVlaC79FgOwoyB/KHc7/8qUUuJiPEa4EhaBZ7V8UnlRxBrjEqzfH3VZlyEI=@vger.kernel.org
X-Gm-Message-State: AFuF++krvkAA0q0EtctZ29nYnWZpmlp9j6On9Ylx9IqAnhKm0RQlfqKg
	JOAIyYn4l+72J+tyZsp5BPqkwLc1vDVIymN0Q6KOwWJc5ffOewVWQ2E3N2gIRybgwtQ=
X-Gm-Gg: AYBFou2QeeH/0WlMAhHpqpmptZdkoH6XR6P8iF8yHVopc5JcBxe15xP0t2/Kb/vbksF
	yUkEd661c8muwl5SuYWEJ5w+C4nDrd7Mclkikl93IjawIiY+ojJliFkslmd8USTCnJu4s7GhI3f
	Y631FmwsE3yJOQoexMCHQXNcJN0T/MizO9mQJhlD7JFtLyX2/maGXT0Vz8/yVhVyUOcc3zklqIN
	KF69gJkXAzo8s+vkDZJXU4IIU1D9dmovfm7XRpuHx+lmCd+XXBHPxfvMADRgeh6Lc4f1GJxjydP
	3WfAdw3hICVt+uReBGdd77P2FxiXzg+9EMyx6Xx/WYTZzWJ3uJOAqDzbBEPyNQKn93maU5+hxTr
	b6Z8JGBR2Q7dnCg10Abakpb3COE5j3kZkPLCVD3H8y1nvaILn0Szag4p6BopqgYzY/cS/p8f9oq
	+kZQ9gR0NUxe1QWw/pFTZovYNmWg8EYbZVP4sBnXQ1muy569DobxulrYar7nQhTg==
X-Received: by 2002:a7b:cb87:0:b0:49e:718f:4f2e with SMTP id 5b1f17b1804b1-49e76021236mr49712805e9.3.1789388357764;
        Mon, 14 Sep 2026 05:19:17 -0700 (PDT)
Received: from localhost.cz ([2001:af0:8000:1409:193:86:92:181])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm26768289f8f.2.2026.09.14.05.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:19:17 -0700 (PDT)
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
Subject: [PATCH v3] cgroup: Avoid iteration of dying tasks with zero refcount
Date: Mon, 14 Sep 2026 14:19:10 +0200
Message-ID: <20260914121911.98132-1-mkoutny@suse.com>
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
are subject to race when they may or may not have ->usage count > 0.

The race window is between css_task_iter_next() invocations
when css_set_lock is released and we may arrive at a new ->task_pos.
The iterator should not attempt to resurrect tasks whose ->usage count
dropped to zero. (When that happens, __put_task_struct_rcu_cb() is
already imminent and the returned task_struct would could be used
after free.)

As for the fix, we cannot simply check the signal->live count of a task
on the dying list because that won't distinguish regular zombies waiting
to be reaped from RCU remnant tasks that are going to be free'd.
Therefore add an extra check to rule out ->usage==0 tasks from any
iteration.

The repeat: loop in css_task_iter_advance() doesn't consider ->usage
count, so add a new loop to css_task_iter_next() to skip de-used tasks
on the dying_list.

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
                                     T exits
                                     --signal->live == 0
				     cgroup_task_dead(T) // css_set_lock
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
  css_task_iter_next() // another iteration
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

Fixes: 260fbcb92bbea ("cgroup: Move dying_tasks cleanup from cgroup_task_release() to cgroup_task_free()")
Cc: stable@vger.kernel.org # v6.19+
Link: https://lists.debian.org/debian-kernel/2026/08/msg00220.html
Reported-by: Noah Elias Feldt <N.Feldt@mittwald.de>
Reported-by: Salvatore Bonaccorso <carnil@debian.org>
Tested-by: Salvatore Bonaccorso <carnil@debian.org>
Signed-off-by: Michal Koutný <mkoutny@suse.com>
---
 kernel/cgroup/cgroup.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

Changes from v2 (https://lore.kernel.org/r/20260907170345.45316-1-mkoutny@suse.com)
- return to tryget_task_struct() variant not to break CSS_TASK_ITER_WITH_DEAD
- append Tested-by: from v1
- reword commit message

diff --git a/kernel/cgroup/cgroup.c b/kernel/cgroup/cgroup.c
index c3a12fee7528f..112d68fe28778 100644
--- a/kernel/cgroup/cgroup.c
+++ b/kernel/cgroup/cgroup.c
@@ -5303,10 +5303,13 @@ struct task_struct *css_task_iter_next(struct css_task_iter *it)
 	if (it->flags & CSS_TASK_ITER_SKIPPED)
 		css_task_iter_advance(it);
 
-	if (it->task_pos) {
+	while (it->task_pos && !it->cur_task) {
 		it->cur_task = list_entry(it->task_pos, struct task_struct,
 					  cg_list);
-		get_task_struct(it->cur_task);
+		/* a task on dying_tasks with zero refcount is only valid for
+		 * RCU readers, not even interesting for
+		 * CSS_TASK_ITER_WITH_DEAD, find another one */
+		it->cur_task = tryget_task_struct(it->cur_task);
 		css_task_iter_advance(it);
 	}
 
-- 
2.55.0

