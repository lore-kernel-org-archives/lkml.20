Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240583;
	b=hrPbaIB71fLHunDlgzTYNQ/TBxPBrLTjAFdgRgpOm9F3dSkQU0UK0+nZkM3Aubktkr3Z
	 op2YmU7ZUSjGPIAdlrTtxVSDQGys3wkdjxxCVYCCuY+ZuGDodIoXroQpd0CaRgpUpKlWr
	 of0ss65OpAOEDT5Y9qPXVJ3FpwZj7YvZHXLxr+9TnVL7bAgrM+c3t2tQIMXDaY8zsa8WK
	 c3AJYVHxoUb+2Rqo4kynxyxkjRAF7CwlrTNrccRMlD9G01A0lsN9vcK94oFZjSb+bKBq0
	 S1wLWvWmlrWZ6MtKoEMOY2UkAwJ7TWmsKT+uN6vmkjJRAFej9vduUMBZETvRTj9Auzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240583;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=Pxf1sr8msaQE1TTU7wlyIvGZ2jTJaI+ibRTEZrXZ7yY=;
	b=3FoE9L95Io5irH2jgYodZG8/M8aru8HyfH1FDyElr1UXB/KHHqjfU4gpHnOQZrCAdKjf
	 mSJadphVilePkKm8xxlQY4xLkMP+cZQbuW/Oq/zhVMXm1AlCkqElDsx+8VbO2KA7CIgUr
	 BvjPbNr2yF/YZLuCJv6UoMtarPD7YB+5cVN/5KlAM/CYt8VCIlspQE3KMwY2Vs0gII6Ei
	 EatBF1KBT0K6Igas6Wl5GggbIcO84/hpcKnbmd4EdW5hI3sArucYxmguLuMCDwJhHzhGT
	 0GWw167yzNCZR/kwX9r3cl/FcVV/Y7tzPaPLnEHtuj4rDXgOU2X5al5973ds6BztSmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jP3oVNsC;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EE01606EEA1
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 16:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2EE01606EEA1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jP3oVNsC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794240582;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pxf1sr8msaQE1TTU7wlyIvGZ2jTJaI+ibRTEZrXZ7yY=;
	b=jP3oVNsCXY8lm0Drowej+PreqXfM1kV6U14tS4h0T0bpFNhthR284BAgEnucsLl5K47RTI
	ts0XjXEneb2lzFvLl4SE/jAJ+4/eBogjWfKSK8i9ZokeV4N9GtP9S2vmpg7+zmqiBAZpXV
	a8l+Jac4twHGWv47yeIvoja/0Enz8pg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-581-ai9Mzo5DOWeGe4Z4hbL5kQ-1; Mon,
 09 Nov 2026 11:09:38 -0500
X-MC-Unique: ai9Mzo5DOWeGe4Z4hbL5kQ-1
X-Mimecast-MFC-AGG-ID: ai9Mzo5DOWeGe4Z4hbL5kQ_1794240577
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2DC9118005B0;
	Mon,  9 Nov 2026 16:09:37 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.redhat.corp (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 9943F7E2;
	Mon,  9 Nov 2026 16:09:35 +0000 (UTC)
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
	Waiman Long <longman@redhat.com>
Subject: [PATCH 5/5] cgroup/cpuset: Correctly set isolated_cpus when switching partition state
Date: Mon,  9 Nov 2026 11:09:12 -0500
Message-ID: <20261109160912.1369897-6-longman@redhat.com>
In-Reply-To: <20261109160912.1369897-1-longman@redhat.com>
References: <20261109160912.1369897-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95

When update_prstate() is called to switch the partition state from
root to isolated or vice versa, the whole effective_xcpus is passed to
isolated_cpus_update(). However, if there are child partitions present,
some of the effective_xcpus are dedicated to those child partitions
and their partition states will remain the same or get invalidated in
the case of child root partition with isolated parent in the latter
update_cpumasks_heir() call. In the latter case, their exclusive CPUs
will be returned to their parent.

Therefore isolated_cpus may be set incorrectly with child partitions
underneath. Fix that by excluding their exclusive CPUs in computing
the correct cpumask of exclusive CPUs used by that partition alone.

Add new test cases into test_cpuset_prs.sh to test for such cases.

Fixes: f28e22441f35 ("cgroup/cpuset: Add a new isolated cpus.partition type")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                        | 30 +++++++++++++++----
 .../selftests/cgroup/test_cpuset_prs.sh       |  7 +++++
 2 files changed, 32 insertions(+), 5 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 742a719b4180..c51fe952bbd7 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -3050,12 +3050,32 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 						  cs->effective_xcpus, NULL))
 			err = PERR_HKEEPING;
 		else if (parent_prs == PRS_ISOLATED)
-			err = PERR_ISOPARENT;
+			err = PERR_ISOPARENT;	/* old_prs should be isolated */
 
-		if (!err)
-			isolcpus_updated = true;
-		else
+		if (err) {
 			disable_partition = true;
+		} else {
+			struct cgroup_subsys_state *css;
+			struct cpuset *child;
+
+			/*
+			 * Need to scan child partitions, if present, and
+			 * exclude their effective_xcpus from cs. In the case
+			 * of switching to isolated partition with child root
+			 * partitions, those child partitions will be
+			 * invalidated in update_cpumasks_hier().
+			 */
+			isolcpus_updated = true;
+			cpumask_copy(tmpmask.new_cpus, cs->effective_xcpus);
+			rcu_read_lock();
+			cpuset_for_each_child(child, css, cs) {
+				if (!is_partition_valid(child))
+					continue;
+				cpumask_andnot(tmpmask.new_cpus, tmpmask.new_cpus,
+					       child->effective_xcpus);
+			}
+			rcu_read_unlock();
+		}
 	} else {
 		/*
 		 * Switching back to member is always allowed even if it
@@ -3089,7 +3109,7 @@ static int update_prstate(struct cpuset *cs, int new_prs)
 	if (!is_partition_valid(cs))
 		reset_partition_data(cs);
 	else if (isolcpus_updated)
-		isolated_cpus_update(old_prs, new_prs, cs->effective_xcpus);
+		isolated_cpus_update(old_prs, new_prs, tmpmask.new_cpus);
 	spin_unlock_irq(&callback_lock);
 
 	/* Force update if partition is disabled & update effective_xcpus */
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 3835b97f7a8b..1e9387af819f 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -550,6 +550,13 @@ TEST_MATRIX=(
 	" C2-6:X2-5:P1 CX3-6:P2 \
 	                    .      .   T:X4-6    .      .      .     0 A1:4-6|A2:4-6 A1:P1|A2:P-2 ."
 
+	# Switch PRS state (root <=> isolated) will properly update cpuset.cpus.isolated
+	# even if child partitions are present.
+	" C1-6:P1 C3-6:P1 C5-6:P2  .       .    P2      .      .     0 A1:1-2:A2:3-4:A3:5-6
+								       A1:P1|A2:P2:A3:P2 3-6"
+	" C1-6:P1 C3-6:P2 C5-6:P2  .       .    P1      .      .     0 A1:1-2:A2:3-4:A3:5-6
+								       A1:P1|A2:P1:A3:P2 5-6"
+
 	#
 	#  old-A1 old-A2 old-A3 old-B1 new-A1 new-A2 new-A3 new-B1 fail ECPUs Pstate ISOLCPUS
 	#  ------ ------ ------ ------ ------ ------ ------ ------ ---- ----- ------ --------
-- 
2.56.0

