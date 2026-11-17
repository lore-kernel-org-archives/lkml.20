Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794888992;
	b=w/PLqq6vIUyRSlZ5jXnzmK+xnV0d/RMXwbdoklirii2BFu3EkHN0KI7+jyizlQX7Nk/9
	 SmwEsPSPaLVv2MyAWvnpUZgUbLA5U88sK4eDBjG7/kEorcq9aaCrBmrSBQIhfynJhXyr5
	 b+uiqfNbPz9DddCFxboSFeLXhySeug7c3Fq1puysww5iJfdTGerVM6rb58OQk143+IXYh
	 yOhL8yyKwEwGRHtimomyrrIGftcfbe+GDdihXqBveBV5QtvXivjFGs7Lp5rKiCUtx8fEU
	 sHB6n5wfhtuu6k2K737og53l0Grp9F3MKchS+dnMh0BrEJoNYlXC599jTbnIxl57O/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794888992;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:MIME-Version:Content-Transfer-Encoding:X-Scanned-By;
	bh=fpQtbcaphgDHApVs2K6tLMLRq+bdGD7u6Y/f7ATRts8=;
	b=GIq5pH1DBTQWUD9i9/RSe/gynZWgT91m/71t00Yivifp5MdWnkq+Qd5TIu0OImifJNBK
	 7PoLI039sRqg2aCbuFBWlrmZ8epXMPpIhw4FUqpIRUmhmPNwZvFdarcIByvK3mBSxWfjy
	 IuYVGHIHrKiZLFcgxHD5/0lVK0Kq8GqV0oYGXSTLVRs7isIELhOnc4CxxGOs4Xc46JPMu
	 6BqcoIa9lZ7LUJWJpcKuH2vTLm7J7OiNUww/nLJsEeC1dPLGBa6jgfQwf7Go3Vcvbnd9W
	 CiE1tWMyFO9P0/mB/FxReSZTIFnEqoHNxSfbzcPCh59JdKg3aMQredZmK+82EA2EW/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UDrMKPkQ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34851606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 04:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34851606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UDrMKPkQ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794888991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fpQtbcaphgDHApVs2K6tLMLRq+bdGD7u6Y/f7ATRts8=;
	b=UDrMKPkQhFB3PIb/HkJZIga5+KEfj1LUEA0AWt6EaZLkfAxFxEfQhDtii90EyvPJOdJv4x
	s0zbBn6RQgpetqYCZP42lOhF1lmyScZbka+YthHMfFZP2aiZeJCP/zD47nXrX8RjJjVvh3
	UlJh6xXg4D/JBSKCXIe0OoZn0iYDFmA=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-136-NLekSvFVMBW361yStebIxw-1; Mon,
 16 Nov 2026 23:16:27 -0500
X-MC-Unique: NLekSvFVMBW361yStebIxw-1
X-Mimecast-MFC-AGG-ID: NLekSvFVMBW361yStebIxw_1794888985
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C3A811956088;
	Tue, 17 Nov 2026 04:16:24 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A5A911956088;
	Tue, 17 Nov 2026 04:16:21 +0000 (UTC)
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
Subject: [PATCH] sched/isolation: Enable cpuset_mutex synchronization before freeing old housekeeping cpumask
Date: Mon, 16 Nov 2026 23:15:55 -0500
Message-ID: <20261117041555.2421505-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Commit a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without
holding cpus_read_lock") adds a new cpuset_top_mutex on top but drops
cpus_read_lock and cpuset_mutex before calling housekeeping_update()
which calls other functions that may acquire cpus_read_lock leading to
to a possibility of deadlock if cpus_read_lock isn't dropped before
calling housekeeping_update().

This commit also changes lockdep_is_cpuset_held() to return true if
either cpuset_mutex or cpuset_top_mutex is held. lockdep_is_cpuset_held()
is used by housekeeping_dereference_check() as one of the conditions
that rcu_read_lock() is not needed to access HK_TYPE_DOMAIN cpumask
which can be changed by housekeeping_update() at run time. In reality,
it isn't right to allow holding cpuset_mutex as a condition where
rcu_read_lock isn't needed. It is certainly possible that there can be
a parallel housekeeping_update() call going on if only cpuset_mutex is
being held. This can lead to a potential use-after-free situation when
HK_TYPE_DOMAIN housekeeping cpumask is being accessed.

One possible solution is to hold rcu_read_lock for functions that may
be called with only cpuset_mutex held. Beside some cpuset functions,
several scheduler functions will also need to be changed. A far simpler
solution is to synchronize with other cpuset_mutex critical sections
before freeing the old housekeeping cpumask. This will ensure that code
within cpuset_mutex critical sections will not have a UaF situation
when accessing housekeeping cpumask. This commit implements the latter
solution and make the conditions used by lockdep_is_cpuset_held() correct.

Fixes: a84097e625f2 ("cgroup/cpuset: Call housekeeping_update() without holding cpus_read_lock")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/sched/isolation.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/sched/isolation.c b/kernel/sched/isolation.c
index 156025ef81b7..eb4ceeaf0f9d 100644
--- a/kernel/sched/isolation.c
+++ b/kernel/sched/isolation.c
@@ -159,6 +159,13 @@ int housekeeping_update(struct cpumask *isol_mask)
 	err = kthreads_update_housekeeping();
 	WARN_ON_ONCE(err < 0);
 
+	/*
+	 * Synchronize with cpuset_mutex to make sure that its critical sections
+	 * afterward will not have access to the old housekeeping cpumask.
+	 */
+	cpuset_lock();
+	cpuset_unlock();
+
 	kfree(old);
 
 	return 0;
-- 
2.56.0

