Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF043FC5CD
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764096; cv=none; b=fy2Lx0kycTemekpMF8ySOanK3GDHVGmnj09RqI1Og2l5c0LmiDqjxRAv5MY5bU5t+IO3iTnQwrg6h5RaX4XtlEoIxbFMX/34orETk3Rt41JeSxIK9Yfx6ZqEfI42dcdc6hId5X8LabrKWRgdpRP4x+/LaNT+bwPv+mHK3jHzaTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764096; c=relaxed/simple;
	bh=k9/IkBYmubstE5lHfFzWEYMgyRGHILOfRdOqqAQQX34=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VKrCnHlcnLGyNGUDr1vv5QYGTqOo4Ef10z5D3cFX2+GeiUTpOrvGcSLvsSt8n/AvCob0sYggig/pDikaO0ObV3e99FmiVrqDAVSeNhfzkgdixQLPfSkV0oR+XrGt0nx4jR3x8+heC1gu0zZId6CZOCgX8Yf11II42oyopXtyIG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ISW+3xrb; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ISW+3xrb"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cbedf433a99so3229048a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788764094; x=1789368894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iUe009wxBXwDTtROttdlCrQpfNjQ3TGGFdk3uwUeago=;
        b=ISW+3xrbEnIDxKCzU904Ke545LR5MGZHp6jFziX4sh5B1D3G8Tu6pVIOlX057ZWGcZ
         +kDUJKPOMlRhsKWOESe09VKO7XHa8Q5bOeRlKeku49yoG6FpKSZE9EaJkU/WqUAfKtee
         Ab7ieX6HDYy08oxHIPqKVdOAiv4EB5vQrgBNi/dLTvnh+ZJ+hLT/yB4oXVZ5j33ung5Y
         NZhB/kyLM9t5QLm+SLuylMBDz9xqh6zjEkBhFQBBfHXQFiBoCboV3NG7/Kq1btPy4euu
         /Ewf/7H0IoLA7e6xYoNwHdq8BaxWHGl5uDw3oRfpINPUspQ7vqFFYkeE8x99LMrrFhLW
         GIaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788764094; x=1789368894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUe009wxBXwDTtROttdlCrQpfNjQ3TGGFdk3uwUeago=;
        b=PafCeafD7NfRHJdKZVOPfmw9XIlBk3oI4Qg4BfRNGlkhCWLRWXw8qH/LRpSCAE4oYv
         UPNV2GNzrfFcNHeU9Bl2RpvuYte+y0FYgyk9NddhW2/m0+8qV4dNTmi1IFcBO09ZzeNE
         9ENAtSwEd2mViicrTaO+Ie3gBwVpn28qUbJpJFYKZVoc2cIDbyYLkXqGiq3VCn/G5DWJ
         r/BHcV6lJCzZHw7yeZszgIcApO5Cz1tl9fq9v9T1gWqnmWMFMHtwCF48Rp217RZ7FLwJ
         ljrzf6EvTQo3sAJ+7m5XbihB/ax3dXJb3UnXMJnC3S3bQn2NXNbkt4rTsWH0Jie220au
         qW6Q==
X-Gm-Message-State: AFuF++l8y7xxuAdvRB93tNWdEGHySll0Jwl5iMAVLYrMyHxVIshoZ2is
	Xs3MAJY5ULp/EJMd83RoFY2D5A0GN929zk1w+xYRvpKdgrAY4OUG6piw
X-Gm-Gg: AYBFou28ErgSxiBFyQrfbPvICdOeMl/ykbUCy/o8Z544Hvo/Zu9fFSC63H7pS9i42z3
	h19qKQkmqmcFB3Hj1WVKvxYiN7zDu6xYPLAG2Jq30oZUnyJTJCIWrtHmE7CnyYTwsdxjUQRZVIu
	T07Z37Wtg8kllwxWk2NdhBrcSVkIgRJ1Um2EXQ4J+12ofx3hsdTnxtuimwzbV9+cpsZn8L2j71R
	WGgIBv62c5Yi7GyewmwPviWobJOT3XQ7gYXb03gxABycNbM9txaS7JBO+marSxc0ScPtnUPM57Q
	uieNHAG0dpsL0c30M85TRSdw5SoFs+S39D6JdFlngnt7uumUt2VnkKwTkTOo1bKgXULOtJsG1jw
	oQyla3rb7THExpF7Du8LsGMi39Nf6kzU5H+6fOOaEXiKY8kMJb84gqHvdzUyNk8IR49rBVG8CAU
	Vxeg1/GikduckYb3pNuruAPPDni8gO4rbDe6US5N2pZZ6gXP8od3YuZfVYYd4F/F8AhzcDnLTH4
	8PFoqdNxWiClg==
X-Received: by 2002:a05:6a21:32a2:b0:3cd:3e77:1dcd with SMTP id adf61e73a8af0-3da39d18cd8mr30998840637.1.1788764094009;
        Sun, 06 Sep 2026 23:54:54 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm26571653eec.24.2026.09.06.23.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:54:53 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] sched: fix typos in comments
Date: Mon,  7 Sep 2026 12:24:48 +0530
Message-ID: <20260907065448.17762-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 include/linux/sched.h   | 2 +-
 kernel/sched/core.c     | 2 +-
 kernel/sched/cputime.c  | 2 +-
 kernel/sched/fair.c     | 2 +-
 kernel/sched/sched.h    | 2 +-
 kernel/sched/topology.c | 2 +-
 kernel/sched/wait_bit.c | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 8b3d47a325cc..364a7ea67d03 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -688,7 +688,7 @@ struct sched_dl_entity {
 	 * dlserver is started on first cfs enqueue on an idle runqueue
 	 * and is stopped when a dequeue results in 0 cfs tasks on the
 	 * runqueue. In other words, dlserver is active only when cpu's
-	 * runqueue has atleast one cfs task.
+	 * runqueue has at least one cfs task.
 	 *
 	 * @dl_defer tells if this is a deferred or regular server. For
 	 * now only defer server exists.
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index f78275192036..a2e258646065 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -10751,7 +10751,7 @@ void call_trace_sched_update_nr_running(struct rq *rq, int count)
  * acceptable tradeoff as it completely avoids complex serialization,
  * memory barriers and atomic operations for the common case.
  *
- * Aside of that this mechanism also ensures RT compability:
+ * Aside of that this mechanism also ensures RT compatibility:
  *
  *   - The task which runs the fixup is fully preemptible except for the
  *     short runqueue lock held sections.
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 06bddaa738e5..f0cdf5d5e044 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -437,7 +437,7 @@ static void kcpustat_idle_stop(struct kernel_cpustat *kc, u64 now)
 
 	/*
 	 * Record the idle time after substracting the steal time from
-	 * previous update sequence. Don't substract the steal time from
+	 * previous update sequence. Don't subtract the steal time from
 	 * the current update sequence to avoid readers moving backward.
 	 */
 	write_seqcount_begin(&kc->idle_sleeptime_seq);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 8dff37059faf..8da25c0e87ed 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -15105,7 +15105,7 @@ static void propagate_entity_cfs_rq(struct sched_entity *se)
 	 * If a task gets attached to this cfs_rq and before being queued,
 	 * it gets migrated to another CPU due to reasons like affinity
 	 * change, make sure this cfs_rq stays on leaf cfs_rq list to have
-	 * that removed load decayed or it can cause faireness problem.
+	 * that removed load decayed or it can cause fairness problem.
 	 */
 	if (!cfs_rq_pelt_clock_throttled(cfs_rq))
 		list_add_leaf_cfs_rq(cfs_rq);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e656c7059bf8..ebaf892a16b6 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -394,7 +394,7 @@ extern s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s6
  * between defer and replenish but never actually enqueue the server.
  *
  * Only when the target class does not manage to exhaust the server's runtime
- * (there's actualy starvation in the given period), will the dl_server get on
+ * (there's actually starvation in the given period), will the dl_server get on
  * the runqueue. Once queued it will pick tasks from the target class and run
  * them until either its runtime is exhaused, at which point its back to
  * dl_server_timer, or until there are no more tasks to run, at which point
diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 0248227d983a..66e3aacfa6d4 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -2966,7 +2966,7 @@ init_sched_domain_shared(struct s_data *d, struct sched_domain *sd, int flags)
 
 	/*
 	 * Use the sd_shared corresponding to the last
-	 * CPU in the span if none are avaialable.
+	 * CPU in the span if none are available.
 	 */
 	if (WARN_ON_ONCE(!sd->shared))
 		sd->shared = sds;
diff --git a/kernel/sched/wait_bit.c b/kernel/sched/wait_bit.c
index 348f7211b4aa..f3fa7e36449d 100644
--- a/kernel/sched/wait_bit.c
+++ b/kernel/sched/wait_bit.c
@@ -215,7 +215,7 @@ EXPORT_SYMBOL(init_wait_var_entry);
  * given variable to change.  wait_var_event() can be waiting for an
  * arbitrary condition to be true and associates that condition with an
  * address.  Calling wake_up_var() suggests that the condition has been
- * made true, but does not strictly require the condtion to use the
+ * made true, but does not strictly require the condition to use the
  * address given.
  *
  * The wake-up is sent to tasks in a waitqueue selected by hash from a
