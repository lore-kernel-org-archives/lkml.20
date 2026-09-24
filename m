Received: from mta0.migadu.com (out-133.mta0.migadu.com [91.218.175.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C43C4B53FD
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 18:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275672; cv=none; b=o7doDUeruZiC/XQbEyE2eLCWAUBKgWNcPM/jeTAipxvsmY770D0c6G0BHMalUCRqy5kFIgylmBpX6CZiO7JW1i/PoiIq7BgTxq0izJFch3fBPEIZNYT7/kE4Ksv2ryoer7YtTEH/NEETWu+sDaX49NICWzvZilz4GTophJEDcAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275672; c=relaxed/simple;
	bh=KWYgNto++ozYhoROAlYfWUaWx+IZSfR+cITBgAkMrPk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EaVXz4j9JIB5JRql7WpPgMAOh1ZARS3W2oc71rOMrIknJo7gh4rOlKb9d6yxQbafmdw4/6Rejq+RFw6Eo48t4mU2Z0D3pMcvYScslIc102kya94rkHrWt69nUsqkaPZblBeTS8mkmPxp49gMfTDGSyN//8+dJygBYTMch7PEoZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=EJS6RQyB; arc=none smtp.client-ip=91.218.175.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="EJS6RQyB"
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=KWYgNto++ozYhoROAlYfWUaWx+IZSfR+cITBgAkMrPk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1790275659; v=1; x=1790880459;
 b=EJS6RQyBvI4kdMwid/t72yspTC/ft+HdunWq1xt3FKePia8hnUzLZ68YpPb9/P2zkUmXJGvL
 wUfhJq3osfiuo/AR/PgmGj3w7nkSOgsc6sejcP+fJ4fbmohnKqD14o5U4Qca5HQdyy/0G3cLXRT
 BDXlFlZSf9HlNtyOkwp5gdm8=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 44910fe0e13f3b28;
	Thu, 24 Sep 2026 18:47:38 +0000
X-Mizu-Trace-ID: 44910fe0e13f3b28
X-Migadu-Flow: FLOW_OUT
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Peter Zijlstra <peterz@infradead.org>
Cc: =?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	David Dai <david.dai@linux.dev>,
	JP Kobryn <jp.kobryn@linux.dev>,
	Frederic Weisbecker <frederic@kernel.org>,
	Aaron Lu <ziqianlu@bytedance.com>,
	Daniel Jordan <daniel.m.jordan@oracle.com>,
	Hao Lee <haolee.swjtu@gmail.com>,
	kernel-team@meta.com,
	cgroups@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 1/7] cgroup: add cgroup_account_system_time()
Date: Thu, 24 Sep 2026 11:47:05 -0700
Message-ID: <20260924184714.912181-2-shakeel.butt@linux.dev>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260924184714.912181-1-shakeel.butt@linux.dev>
References: <20260924184714.912181-1-shakeel.butt@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a helper that charges some kernel CPU time to a cgroup's cpu.stat.
The next patch uses it for the time a kernel thread spends working for
another cgroup.

Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
---
 include/linux/cgroup.h | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/include/linux/cgroup.h b/include/linux/cgroup.h
index 2afb4cb2bb4f..7b19ded2578d 100644
--- a/include/linux/cgroup.h
+++ b/include/linux/cgroup.h
@@ -868,6 +868,17 @@ void __cgroup_account_cputime(struct cgroup *cgrp, u64 delta_exec);
 void __cgroup_account_cputime_field(struct cgroup *cgrp,
 				    enum cpu_usage_stat index, u64 delta_exec);
 
+/* Charge @delta_exec of kernel CPU time to @cgrp. */
+static inline void cgroup_account_system_time(struct cgroup *cgrp,
+					      u64 delta_exec)
+{
+	if (cgroup_parent(cgrp)) {
+		__cgroup_account_cputime(cgrp, delta_exec);
+		__cgroup_account_cputime_field(cgrp, CPUTIME_SYSTEM,
+					       delta_exec);
+	}
+}
+
 static inline void cgroup_account_cputime(struct task_struct *task,
 					  u64 delta_exec)
 {
@@ -900,6 +911,8 @@ static inline void cgroup_account_cputime(struct task_struct *task,
 static inline void cgroup_account_cputime_field(struct task_struct *task,
 						enum cpu_usage_stat index,
 						u64 delta_exec) {}
+static inline void cgroup_account_system_time(struct cgroup *cgrp,
+					      u64 delta_exec) {}
 
 #endif	/* CONFIG_CGROUPS */
 
-- 
2.53.0-Meta

