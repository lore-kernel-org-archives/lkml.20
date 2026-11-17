Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892759;
	b=Oi8EIaeRDAinF3kktPjvYmD79g38UGYQVsDty2ij6J0fgxdsknCR64XkNJf7ezdnO9Pk
	 uDPxHAOo92Qz5+ERS1XCUY3FBNyVPh9B6Ox18z/ytWfI+msFyxL4sP9zeZxX15eb5L8AR
	 5HxFmwwrbIssR8VIdBbqgqSDeD1eGWPJCUqUVuhLtKvbpv7irUL86cl6pZ03SOl3UzA10
	 CuJa+hx1YtAV9K66fcni+/X1U1FzDcbvFJzEkgsoLsC94y5GFcz4JcYOI/lDoH9zwsdgE
	 s1IqBd3octb5gUMCMHQEt0mFYOXaTsTGm+KNYlrHc8mcar/qEtB7yDR0fVo73u3Cfdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892759;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=D1WXap0MMjSJua9xY8sxh1oJ/Egr+uiAo9+UvEeD97E=;
	b=2trbLXrvCgIL0TARv5VR+qabKbiPqedvAueyJ2xgnjgd6t/UoLXIDoIXFCYJcQANSzxo
	 oVFsB7fZx7wri6kdKedgYOdiWfXdjQrW23DoJWj+X9aoptvD/gBOfa32VwHGV4aE2fJsa
	 JIZYdUT52FVuYO9tziocm35K8tH3s8/rVSZj/3s4njbvX+d5IphfIX7EjtYcZwMP3lNem
	 Bn/FMXEAg3EjLyDnjsWLiDDjdiQMgVucYuk3HKbKfkCz6Kphj+lOBStLbz57l5atLCWrK
	 ra3o7HJT1wZeWGdQiEQgzMu5DwZJYDJvKEUJQliLCzSVK61BIhxqWd605czqT5O01bw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SMTLXfVs;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DEE606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 05:19:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98DEE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=SMTLXfVs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794892757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D1WXap0MMjSJua9xY8sxh1oJ/Egr+uiAo9+UvEeD97E=;
	b=SMTLXfVsubp+LYJS13ojqlAOYza+hHf79AA81Os8wP5mszf++35kyJMiT1z3NkpWT9xuBM
	7Xl3wukwqbZ1j7NwEpsh6ft4nCi2pzoBF2cy2UNfJ0XL8tdMQPaJBPh1bNzssaMmTKLqxt
	QC/BXXVq1xOL2Q2S0MhFCqQEBWwy/Tg=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-6TGAvbqdOZKlKGlYgBJG1Q-1; Tue,
 17 Nov 2026 00:19:13 -0500
X-MC-Unique: 6TGAvbqdOZKlKGlYgBJG1Q-1
X-Mimecast-MFC-AGG-ID: 6TGAvbqdOZKlKGlYgBJG1Q_1794892751
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56B231955BDD;
	Tue, 17 Nov 2026 05:19:11 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 902DC18004FE;
	Tue, 17 Nov 2026 05:19:07 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Tejun Heo <tj@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH v2] sched/isolation: Enable cpuset_mutex/cpus_read_lock synchronization before freeing old housekeeping cpumask
Date: Tue, 17 Nov 2026 00:18:53 -0500
Message-ID: <20261117051853.2429410-1-longman@redhat.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

Commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without
holding cpus_read_lock") adds a new cpuset_top_mutex on top but drops
cpus_read_lock and cpuset_mutex before calling housekeeping_update()
which calls other functions that may acquire cpus_read_lock leading
to a possibility of deadlock if cpus_read_lock isn't dropped before
calling housekeeping_update().

This commit also changes lockdep_is_cpuset_held() to return true if
either cpuset_mutex or cpuset_top_mutex is held. lockdep_is_cpuset_held()
is used by housekeeping_dereference_check() as one of the conditions
that rcu_read_lock() is not needed to access HK_TYPE_DOMAIN
cpumask which can be changed by housekeeping_update() at run
time. The housekeeping_dereference_check() function also uses
lockdep_is_cpus_write_held() as another condition that can skip the
use of rcu_read_lock().

In reality, both cpuset_mutex and cpus_write_lock are now no longer
valid conditions to skip rcu_read_lock(). It is certainly possible
that there can be a parallel housekeeping_update() call going on if
only cpuset_mutex or cpus_write_lock is held. This can lead to a
potential use-after-free situation when HK_TYPE_DOMAIN housekeeping
cpumask is being accessed.

One possible solution is to hold rcu_read_lock for functions that may
be called with only cpuset_mutex or cpus_write_lock is held. Quite a
large number of functions will need to be modified if rcu_read_lock()
has to be added. A far simpler solution is to synchronize with other
cpuset_mutex and cpus_write_lock critical sections before freeing the old
housekeeping cpumask. This will ensure that code within those critical
sections will not have a UaF situation when accessing housekeeping
cpumask. This commit implements the latter solution and make the code
in lockdep_is_cpuset_held() and housekeeping_dereference_check() correct.

Fixes: a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without holding cpus_read_lock")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/sched/isolation.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 156025ef81b7..5634d6a597bd 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -159,6 +159,16 @@ int housekeeping_update(struct cpumask *isol_mask)
 	err = kthreads_update_housekeeping();
 	WARN_ON_ONCE(err < 0);
 
+	/*
+	 * Synchronize with cpuset_mutex and cpus_read_lock to make sure that
+	 * cpuset_mutex and cpus_write_lock critical sections afterward will
+	 * not have access to the old housekeeping cpumask.
+	 */
+	cpus_read_lock();
+	cpuset_lock();
+	cpuset_unlock();
+	cpus_read_unlock();
+
 	kfree(old);
 
 	return 0;
-- 
2.56.0

