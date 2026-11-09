Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794251421;
	b=Tholv4g7iynfljge848zvuyXeZFJoZ4D/omDBRir8yjmdPE6eNxfWHdh7tR7HA6PtdOM
	 rs71Zy+rV+09qOuyaXwOBqZcJUXGRUseSY/xi9jXNg+i7EXQxS9wwE2QDAohD5Dxw4UDH
	 7fg5zRr+YIYivk6NdTOCQDUnsGjacstJF9rVKkOfOib5jOnajda5xyqGpNqhX1KgYnhOs
	 T8x0smvMB6SgzI1oRJFGnDRLZu5xwzIKqopFKW17WtV0u9AhlcyZFfRhNcw+FAR8BcCya
	 PhuKzk7pcjhcx2e3TT35VokRWoMheUNrjawB1sosfFae+Vex5sndVb7CsnLwJfhM/rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794251421;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=LscdtRchjtrbDlkYId9rzpuyhTSf+d7tOLrjjyv2xvI=;
	b=pz/0nv87BJfnBq//DdS5yaPb1IGyJSsrnMQvhuydlN6Vgr+/Sz2en/s1QFsOi1ov+yNd
	 Ejv7jZuDNpYq+YcYdUodoDMab+HktcGtZYuFdAopmCJp22DHvMt48KNHOBNGNfqszx2QG
	 ahtNBViWhG5OQv3pdyaP5fsPxseNBHanG7F+CrAC+qyyGuvUdzC2Gu9ed4l+j53KqN3Ad
	 WOqnwhrvuAY4EXp1fcdWKDRHaZgVUxGdmUk/sRtqNawQxPLP4C1I5EnhxPIkOFx9BIf8a
	 y7QoFEtMaLXi2hTovceE8xJ5FYIsEYaSFgqbyUGQeqL/yqd2aYYgyLstJHuRkEcygig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f+9zTQyO;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4C6606A330
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 19:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE4C6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f+9zTQyO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794251419;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LscdtRchjtrbDlkYId9rzpuyhTSf+d7tOLrjjyv2xvI=;
	b=f+9zTQyOmFAEJGciB/oI89T9SzXQLJ0b8vFa659QciCkbhnhLhDFDzoyfZHaxspy3h/0wd
	v84C+kwg3s3BJ6o0Y7Q8wkjJwBzjExXgNgGi/+mnSMRf4aoGI9//IZfZ0DpoBkK3k5uUZT
	Ln7EWD4VhLwsnGgF286muy/wYmvCtTc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-198-N2lkeJcqMzWNzNzm08dFpQ-1; Mon,
 09 Nov 2026 14:10:16 -0500
X-MC-Unique: N2lkeJcqMzWNzNzm08dFpQ-1
X-Mimecast-MFC-AGG-ID: N2lkeJcqMzWNzNzm08dFpQ_1794251414
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7E9081800378;
	Mon,  9 Nov 2026 19:10:14 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8BF4E195608B;
	Mon,  9 Nov 2026 19:10:12 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH-next v2 2/5] cgroup/cpuset: Correctly set cpus_updated in cpuset_hotplug_update_tasks()
Date: Mon,  9 Nov 2026 14:09:52 -0500
Message-ID: <20261109190955.1398611-3-longman@redhat.com>
In-Reply-To: <20261109190955.1398611-1-longman@redhat.com>
References: <20261109190955.1398611-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

When cpuset_hotplug_update_tasks() is called with the conditions that
either remote_partition_disable() or update_parent_effective_cpumask()
has to be called, the cs->effective_cpus can be updated such that it
matches what is computed in new_cpus. In such case, cpus_updated can
be incorrectly set to false leading to stale CPU afinity remained in the
tasks not matching the new cpuset value. Fix that by forcing cpus_updated
to true whenever one of these partition helpers is being called.

Fixes: 4b842da276a8a ("cpuset: Make CPU hotplug work with partition")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-ab90f7e8-0d60-40ca-83e9-e405075b24d2
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 6074327c3477..3955d2d574cf 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4002,7 +4002,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 {
 	static cpumask_t new_cpus;
 	static nodemask_t new_mems;
-	bool cpus_updated;
+	bool cpus_updated = false;
 	bool mems_updated;
 	int partcmd = -1;
 	struct cpuset *parent;
@@ -4015,12 +4015,18 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (!tmp || !cs->partition_root_state)
 		goto update_tasks;
 
+	/*
+	 * cpus_updated should be set to true when remote_partition_disable()
+	 * or update_parent_effective_cpumask() is called as cs->effective_cpus
+	 * may have been updated.
+	 */
 	if (is_remote_partition(cs) && (cpumask_empty(subpartitions_cpus) ||
 				       (cpumask_empty(&new_cpus) &&
 					partition_is_populated(cs, NULL)))) {
 		WRITE_ONCE(cs->prs_err, PERR_HOTPLUG);
 		remote_partition_disable(cs, tmp);
 		compute_effective_cpumask(&new_cpus, cs, parent);
+		cpus_updated = true;
 	}
 
 	/*
@@ -4045,6 +4051,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 		partcmd = partcmd_update;
 
 	if (partcmd >= 0) {
+		cpus_updated = true;
 		update_parent_effective_cpumask(cs, partcmd, NULL, tmp);
 		if (is_partition_valid(cs) || (partcmd == partcmd_invalidate)) {
 			compute_effective_cpumask(&new_cpus, cs, parent);
@@ -4053,7 +4060,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	}
 
 update_tasks:
-	cpus_updated = !cpumask_equal(&new_cpus, cs->effective_cpus);
+	cpus_updated |= !cpumask_equal(&new_cpus, cs->effective_cpus);
 	mems_updated = !nodes_equal(new_mems, cs->effective_mems);
 	if (!cpus_updated && !mems_updated)
 		goto unlock;	/* Hotplug doesn't affect this cpuset */
-- 
2.56.0

