Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A91388E7E
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 22:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791670811; cv=none; b=R0OrOdJuHTttOy2jFb/PC6p5kXYymWCzZJ+YiltEk81H9psAyQnBWR05IczcBE92j7ZtzvNA+ruQdWpEKmznQhx5K9m9q+MPQEJU+QUm8stoBVCGZW0FnwTKL4SSqnJ14jB6AgscKeM9DMrCgzbcKwbSLFWl4mh54yvB5yFE6O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791670811; c=relaxed/simple;
	bh=X6aRBMR5ADVAYOtOF1/aWB4C3EiATE85IGpaBzTbpeY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dvcPO5HEp0j0rQcuLNd9kMLsXIoHX68XbQ4OIzbodQp0dTzyw7sR2ZmEzKKHxLLjyfQ8Oq1fl3eJfeWrdcaFQ5GH4ANCV/rcXGay3g8vR/vRyFqqt5GVcz7I9nZkWxiv09XmDUwkqNn/ZpMKXqjVuUDVlJsM3ZLUw7ZxbLPNQQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HklsDn5d; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HklsDn5d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791670809;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lHYntlVzsaRibJoJ6xKyc52NIg//TqXw9hUuTzFusEs=;
	b=HklsDn5dPxTAFTHWBo9qY9D23CwEbDhYdfkCTlRLQ3MxiEBSwHGDd2vUeqBpyBCwvv1mWF
	o5veZERbY9Gv+Nc20mRe+5u+OqvirmqgUe0j1l8v0AwzaYYroHdgcQhqiQtdPDvvtrhe9h
	0Nijj5h2l2VGv8ZH1f7xMPJ0OJfBbpg=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-FqUIhWqGN5Gtmf0lNj2ElA-1; Sat,
 10 Oct 2026 22:20:07 +0000
X-MC-Unique: FqUIhWqGN5Gtmf0lNj2ElA-1
X-Mimecast-MFC-AGG-ID: FqUIhWqGN5Gtmf0lNj2ElA_1791670806
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D94B71954B11;
	Sat, 10 Oct 2026 22:20:05 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet03.pony-001.prod.iad2.dc.redhat.com [10.2.32.114])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 04DC018004D4;
	Sat, 10 Oct 2026 22:20:02 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Hui Peng <benquike@gmail.com>,
	Guopeng Zhang <guopeng.zhang@linux.dev>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH-next v2 2/6] cgroup/cpuset: Consider all the exclusive CPUs when doing housekeeping check
Date: Sat, 10 Oct 2026 18:19:34 -0400
Message-ID: <20261010221938.243859-3-longman@redhat.com>
In-Reply-To: <20261010221938.243859-1-longman@redhat.com>
References: <20261010221938.243859-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93

When prstate_housekeeping_conflict() is called to perform housekeeping
check with cpumask changes, the exclusive CPUs owned by child partitions
are excluded. If the current cpuset is an isolated partition with root
partition children. It is possible the cpumask change will still leave
active housekeeping CPUs but then no housekeeping CPUs will be left when
the child partitions are disabled or invalidated.

To protect against this possibility, all the exclusive CPUs of the
cpuset should be considered to be owned by the current cpuset when doing
housekeeping check. Do that by calling prstate_housekeeping_conflict()
in partition_cpus_change() and passing in the add_cpus and del_cpus
parameters as if the cpuset owns all the exclusive CPUs.

With this change, the prstate_housekeeping_conflict() call in
update_parent_effective_cpumask() with partcmd_update and newmask
is now duplicative and can be removed. The housekeeping check in
remote_cpus_update(), however, will still be useful as this function can
be called directly from update_cpumasks_hier() without going through
partition_cpus_change(). The update_parent_effective_cpumask() call
from update_cpumasks_hier() is partcmd_update with no cpumask which
still have the housekeeping check and so is covered.

In the case of partition state switch from isolated to root and vice
versa, the set of exclusive CPUs are recomputed to include those
transferred to child paritions as well.

Fixes: 4a74e418881f ("cgroup/cpuset: Check partition conflict with housekeeping setup")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index f3cebb277a68..1c0441fa3bea 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1907,14 +1907,6 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 					       parent->effective_xcpus);
 		}
 
-		/*
-		 * Check for housekeeping conflicts
-		 */
-		if (is_partition_valid(cs) &&
-		    prstate_housekeeping_conflict(old_prs, parent_prs,
-						  tmp->delmask, tmp->addmask))
-			part_error = PERR_HKEEPING;
-
 		/*
 		 * The new CPUs to be removed from parent's effective CPUs
 		 * must be present.
@@ -2398,6 +2390,21 @@ static void partition_cpus_change(struct cpuset *cs, struct cpuset *trialcs,
 		return;
 
 	prs_err = validate_partition(cs, trialcs);
+	if (!prs_err) {
+		int parent_prs = is_remote_partition(cs)
+			       ? PRS_ROOT : parent_cs(cs)->partition_root_state;
+		/*
+		 * Check for housekeeping CPUs conflict assuming that all the
+		 * exclusive CPUs belong to the current cpuset.
+		 */
+		compute_excpus(trialcs, tmp->new_cpus);
+		cpumask_andnot(tmp->addmask, tmp->new_cpus, cs->effective_xcpus);
+		cpumask_andnot(tmp->delmask, cs->effective_xcpus, tmp->new_cpus);
+		if (prstate_housekeeping_conflict(cs->partition_root_state,
+						  parent_prs, tmp->addmask,
+						  tmp->delmask))
+			prs_err = PERR_HKEEPING;
+	}
 	if (prs_err) {
 		WRITE_ONCE(cs->prs_err, prs_err);
 		trialcs->prs_err = prs_err;
@@ -2897,8 +2904,9 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 		 * A change in load balance state only, no change in cpumasks.
 		 * Need to update isolated_cpus.
 		 */
+		compute_excpus(cs, tmpmask.new_cpus);
 		if (prstate_housekeeping_conflict(new_prs, parent_prs,
-						  cs->effective_xcpus, NULL))
+						  tmpmask.new_cpus, NULL))
 			err = PERR_HKEEPING;
 		else
 			isolcpus_updated = true;
-- 
2.55.0

