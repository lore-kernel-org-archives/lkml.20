Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E184358368
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731724; cv=none; b=CRqJAqAA/vWG9mGd+50hVrC+i/nC21tP/2wwljVnPQCjoa/DRYluAfxB/rt5j/UMIrB9bVP9hrknUL7HBVLokfH4CiNLnOzZG5gQ9gSybMVqHsfcJl44NORwl/3dCs6bbhRH6vCFmhXGOcFWet83garWZ3Mg8KsxEkAJYR5booI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731724; c=relaxed/simple;
	bh=dXFJ43fsB3g/orcB6IXvIAD9eag4wCDQ/xJJooxgBwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=r64nIwhwp306WHpIU1ceDp5PS5RcBpGT/DmQcD3miO9TiSVQlI3Egka83I2viDWVgDcup+tuwoaIe1kmEtGDRgJeX5QBS+S2JYrd0mHeBRzEahIjIfbcVdKbkYuXJIHLFsiagvHooHYsraXGV0BnNOXjux3abIAU07xz8UAbZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZeP5m70; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZeP5m70"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790731721;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cLbGS0F63FUcqLx6tTlp9P+t+7knN0GFhIYL462MUj4=;
	b=cZeP5m70s7K8RYBvsMWdeIwlmm4kDmJlt8QfgAWXxHvV2zCLv4xHWnMi6He1uk2nt4DYNM
	ednu4LsRasASdy9S7hlHAI0CEB1JyqJYdZ1hTWJU70te6LTCFYXgbrBIfaIsgIHR3TScD4
	zmp3JLiJAOS8jOGuzLBEwSJe2zCc0zM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-403-z3PCzrFOP7Wg7RSaCa2TvA-1; Tue,
 29 Sep 2026 21:28:39 -0400
X-MC-Unique: z3PCzrFOP7Wg7RSaCa2TvA-1
X-Mimecast-MFC-AGG-ID: z3PCzrFOP7Wg7RSaCa2TvA_1790731717
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6557E180035C;
	Wed, 30 Sep 2026 01:28:37 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A58971955F73;
	Wed, 30 Sep 2026 01:28:35 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Ridong Chen <ridong.chen@linux.dev>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrea Righi <arighi@nvidia.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] cgroup/cpuset: Don't access cpuset_cgrp_subsys.root in is_in_v2_mode()
Date: Tue, 29 Sep 2026 21:28:19 -0400
Message-ID: <20260930012819.651526-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

After seeing the patch [1] to guard is_in_v2_mode() with RCU, it makes
me realize that is_in_v2_mode() may be called in a context where a new
cgroup filesystem is being rebound with stale cpuset_cgrp_subsys.root
pointer. Avoid this potential UaF situation by adding a new cpuset_v2_mode
flag which is set when the cpuset_v2_mode mount option is used. This
flag is written into only when cpuset_bind() is being called with a
stable cpuset_cgrp_subsys.root value. The is_in_v2_mode() helper is
modified to read the new cpuset_v2_mode flag instead of accessing
cpuset_cgrp_subsys.root directly.

[1] https://lore.kernel.org/lkml/20260929084124.626693-2-arighi@nvidia.com

Fixes: b8d1b8ee93df ("cpuset: Allow v2 behavior in v1 cgroup")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 19661df6244f..266ce17d1af0 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -147,6 +147,11 @@ static cpumask_var_t	subpartitions_cpus;	/* RWCS */
  */
 static cpumask_var_t	isolated_cpus;		/* CSCB */
 
+/*
+ * Set if "cpuset_v2_mode" mount option is used
+ */
+static bool		cpuset_v2_mode;		/* Unprotected */
+
 /*
  * Set if housekeeping cpumasks are to be updated.
  */
@@ -439,8 +444,7 @@ static inline bool cpuset_v2(void)
  */
 static inline bool is_in_v2_mode(void)
 {
-	return cpuset_v2() ||
-	      (cpuset_cgrp_subsys.root->flags & CGRP_ROOT_CPUSET_V2_MODE);
+	return cpuset_v2() || READ_ONCE(cpuset_v2_mode);
 }
 
 /**
@@ -3664,6 +3668,8 @@ static void cpuset_bind(struct cgroup_subsys_state *root_css)
 	mutex_lock(&cpuset_mutex);
 	spin_lock_irq(&callback_lock);
 
+	WRITE_ONCE(cpuset_v2_mode,
+		   !!(cpuset_cgrp_subsys.root->flags & CGRP_ROOT_CPUSET_V2_MODE));
 	if (is_in_v2_mode()) {
 		cpumask_copy(top_cpuset.cpus_allowed, cpu_possible_mask);
 		cpumask_copy(top_cpuset.effective_xcpus, cpu_possible_mask);
-- 
2.55.0

