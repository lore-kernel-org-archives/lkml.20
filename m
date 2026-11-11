Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794362547;
	b=Z2R2uEZdljdNOi370iLnRpfgqshj+WFB1x7aSbUUmaQ3Fy0APahBaRvcYv3O6sEXUIlH
	 qZdhAHc9gKxuHTAauJMBTF0+DKHgfvXQug25nnnJFEOu6gWh+U1Kxuh7evtSAJVwV8PzD
	 MfhvzMzYhgOaLkB7XvYE5tb2mZEMAwkKXQADRZcT+4sK527NNIVU6BCyhAAqwcaSN8SOb
	 qOxNLJZ8v0PvfLU+e6ysfFILGocWvJOOElx2fHv74xuGgaLLOUOFYOvDdZKzsHp6Ii9UH
	 xvyOsHagDCCgjfwb1sk9Ii1wo20gkd1eQNKeDClKGpxG4EqCnx342zQFvfhWBGiEc5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794362547;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=/a0ORaEq24bJUuPsDhsL6TKJneqnhdFYxeO8XuW76kA=;
	b=nc785mk1RXFl33iHQtzmwJOFs/lpS0eNw1xSMRB+jlsiAWgQjYPt4g46oZaUHTWad6xQ
	 aJpJczN0A3GZP2X32UD305pW/SH8lgM42JP3IDxiac5PB0O5Sw7S+/POrYKopujAzI9gO
	 zdkhCjxbFD8vqdeQDJwhozG1xxvO/l1pCFpNZBCUU20AqvnZdFmm4NneAabMVyTxMv4R0
	 /14MySprP/U6+H2fB4ZM3zrQf2JChhm2dSZtew0B4T2BcQUIVlrQVc6e3V7vYfb9A6/vE
	 +3JE+M34IvoJ2drNVjjq4gD+JSPrHwj98+M4A3m9zcqiz5+B9S4/mzV0JLBFOHWe93g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fza24nO4;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42D5606A336
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 02:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A42D5606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fza24nO4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794362545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/a0ORaEq24bJUuPsDhsL6TKJneqnhdFYxeO8XuW76kA=;
	b=Fza24nO4gmb3YiXLcYbo/iJD45VDBQxPdXzAB8FoGsnLSN3QGnVN9VLtnRTVoTpBSOxXe+
	0+Njcv85qrzRQkCGZFRFEbDs8RsVxNTH9ORW04gkBglVi/FjdU52IPevrGQN2Bj3baFmPB
	wLQYMvtb/eY2evH07CiMrxJ6/bVuKnU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-TRtHNs-4O0mFj3vafuvE5w-1; Tue,
 10 Nov 2026 21:02:22 -0500
X-MC-Unique: TRtHNs-4O0mFj3vafuvE5w-1
X-Mimecast-MFC-AGG-ID: TRtHNs-4O0mFj3vafuvE5w_1794362540
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4AE4C195607F;
	Wed, 11 Nov 2026 02:02:20 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 93F61196665E;
	Wed, 11 Nov 2026 02:02:18 +0000 (UTC)
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
Subject: [PATCH-next v3 1/3] cgroup/cpuset: Correctly set cpus_updated in cpuset_hotplug_update_tasks()
Date: Tue, 10 Nov 2026 21:02:02 -0500
Message-ID: <20261111020204.1660055-2-longman@redhat.com>
In-Reply-To: <20261111020204.1660055-1-longman@redhat.com>
References: <20261111020204.1660055-1-longman@redhat.com>
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

When cpuset_hotplug_update_tasks() is called with the conditions that
remote_partition_disable() has to be called, the cs->effective_cpus will
be updated such that it matches what is computed in new_cpus. In such
case, cpus_updated can be incorrectly set to false leading to stale CPU
afinity remained in the tasks not matching the new cpuset value. Fix that
by forcing cpus_updated to true after calling remote_partition_disable().

Fixes: 181c8e091aae ("cgroup/cpuset: Introduce remote partition")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://sashiko.dev/#/bug/linux-ab90f7e8-0d60-40ca-83e9-e405075b24d2
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 8a8a424a389f..862864b44960 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -4031,7 +4031,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 {
 	static cpumask_t new_cpus;
 	static nodemask_t new_mems;
-	bool cpus_updated;
+	bool cpus_updated = false;
 	bool mems_updated;
 	int partcmd = -1;
 	struct cpuset *parent;
@@ -4044,12 +4044,17 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	if (!tmp || !cs->partition_root_state)
 		goto update_tasks;
 
+	/*
+	 * cpus_updated should be set to true when remote_partition_disable()
+	 * is called as cs->effective_cpus will be modified.
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
@@ -4082,7 +4087,7 @@ static void cpuset_hotplug_update_tasks(struct cpuset *cs, struct tmpmasks *tmp)
 	}
 
 update_tasks:
-	cpus_updated = !cpumask_equal(&new_cpus, cs->effective_cpus);
+	cpus_updated |= !cpumask_equal(&new_cpus, cs->effective_cpus);
 	mems_updated = !nodes_equal(new_mems, cs->effective_mems);
 	if (!cpus_updated && !mems_updated)
 		goto unlock;	/* Hotplug doesn't affect this cpuset */
-- 
2.56.0

