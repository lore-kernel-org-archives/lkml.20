Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792639057;
	b=3/WvyRn+Kxj0PUYa0W0P/appfRFoe36/HAql4Q2qJnvruwphGgiAi/5Ql4QsAFeKefaT
	 BlcfURkYN+K0t294IpYOnA0WN+phqJ4g215cKpc5pngtzXQpKSvrkDjjxF3jN9ZMZhfDP
	 TvJz9YN/Cq9trT0yADCHa0IgJYPkBa8+jhFRtUO+BVLt/hPdQdJwJdE2oB4uWQkrCQjOy
	 T/tbU/ZryqnxbMX7Zzqmkhg5UKBpHcENZHX2itFEjdaD7arY3FU9f/s4196F7A63ufSOX
	 4j0Umq4Birhn84Om5/KAwIQxM+784KSoO2GAlvibFUVIQxSkf+jvZceVmcUHqwbRDdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792639057;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=ng2Z4i0l6+f8aePkaaylUNGsht+qS83D5TBM5+FHNM8=;
	b=MfNIBlKlcNnWYmtbiXEXebvAIvBcWB0qiTixuc9+IQ0sUnyP4BAikLX4+Gr7SB9K9oaC
	 a0clnXAKYUu4P6h6TbpBLkYzkmq1aEjZV9yeqL4VBfme9AZpbzkJlmbHWp8reJMLgGe9e
	 Ua/juj3ZnJg1pUehVNlk26oJy/fTYBzjRh+/i7jJGoqIp4PhGM1FYCyW2NB4TmC1RDhkJ
	 yNJl2aCs9wtHulnocYwopmKZ+pTTtOGoYoSb+4kvoEEN/qoA9eOoCmH3rh8sdLhga59fl
	 rQ0qvABCQzMCwwnYEGjnwcEYnMzh7hhFyCL7xvtUP/Yo1RINEhfUMVPD3pFI6Lbi7fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQzkRbnd;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC6060A261B
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CC6060A261B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FQzkRbnd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792639056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ng2Z4i0l6+f8aePkaaylUNGsht+qS83D5TBM5+FHNM8=;
	b=FQzkRbndmafez0Ji8lVMrpBTKGDZHcVZ4nUw99u2Jdt6kgcpSdjGVwWQYreAgfqrZRicta
	SEGvL9XQWBGnfG6eoJdSjYOIkSEsJxPmEr4IfgLLZuaeX8uTBJyNrCeAVNxSUgYykdbONJ
	F+Yoqui2bnfGa/7SYzYFOAHW2Qyd4+k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-68-AL9Gff16OyykHnf4Ff_WPA-1; Wed,
 21 Oct 2026 23:17:30 -0400
X-MC-Unique: AL9Gff16OyykHnf4Ff_WPA-1
X-Mimecast-MFC-AGG-ID: AL9Gff16OyykHnf4Ff_WPA_1792639049
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 57EB61800657;
	Thu, 22 Oct 2026 03:17:29 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.rmtusnh.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 95A9418005B7;
	Thu, 22 Oct 2026 03:17:27 +0000 (UTC)
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
Subject: [PATCH-next 3/6] cgroup/cpuset: Fix incorrect effective_cpus bug in update_cpumasks_hier()
Date: Wed, 21 Oct 2026 23:16:40 -0400
Message-ID: <20261022031643.1351877-4-longman@redhat.com>
In-Reply-To: <20261022031643.1351877-1-longman@redhat.com>
References: <20261022031643.1351877-1-longman@redhat.com>
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
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

With the introduction of cpuset.cpus.exclusive, the computation of
effective_cpus differs depending on if a cpuset is a valid partition
root or not.

In update_cpumasks_hier(), effective_cpus is computed early
to check if the current subtree can be skipped. Later on
update_parent_effective_cpumask() may be called which can change the
partition state from valid to invalid or vice versa. If the partition
state changes, the previously computed effective_cpus may no longer be
valid. Fix that by recomputing effective_cpus again when that happens.

Also add a new test case into test_cpuset_prs.sh to verify this change.

Fixes: e2ffe502ba45 ("cgroup/cpuset: Add cpuset.cpus.exclusive for v2")
Signed-off-by: Waiman Long <longman@redhat.com>
---
 kernel/cgroup/cpuset.c                            | 10 ++++++++--
 tools/testing/selftests/cgroup/test_cpuset_prs.sh |  3 +++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index db6e4663f4be..7b9062326f35 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2316,10 +2316,16 @@ static void update_cpumasks_hier(struct cpuset *cs, struct tmpmasks *tmp,
 		if (update_parent) {
 			update_parent_effective_cpumask(cp, partcmd_update, NULL, tmp);
 			/*
-			 * The cpuset partition_root_state may become
-			 * invalid. Capture it.
+			 * Capture current partition_root_state as it may have
+			 * changed. Recompute effective cpumask if changed.
 			 */
 			new_prs = cp->partition_root_state;
+			if (new_prs != old_prs) {
+				if (new_prs > 0)
+					compute_partition_effective_cpumask(cp, tmp->new_cpus);
+				else
+					compute_effective_cpumask(tmp->new_cpus, cp, parent);
+			}
 		}
 
 		spin_lock_irq(&callback_lock);
diff --git a/tools/testing/selftests/cgroup/test_cpuset_prs.sh b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
index 47791591002f..8595b6b4b7bf 100755
--- a/tools/testing/selftests/cgroup/test_cpuset_prs.sh
+++ b/tools/testing/selftests/cgroup/test_cpuset_prs.sh
@@ -364,6 +364,9 @@ TEST_MATRIX=(
 	" C1-4:X2-4 C2-4:X3-4:P1 C3-4:X4:P2 \
 				   .      .      X5      .      .    0 A1:1-4|A2:2-4|A3:3-4 \
 								       A1:P0|A2:P-1|A3:P-2 ."
+	" C1-5:X3-5:P2 C3-5:X4-5:P2 C4-5:X5:P2 \
+				   .    X1-4     .       .      .    0 A1:1-3|A2:4|A3:4 \
+								       A1:P2|A2:P2|A3:P-2 1-4"
 	" C1-4:X2-4 C1-4:X3-4:P1 C3-4:X4:P2 \
 				   .      .      .      X1      .    0 A1:1-2|A2:3-4|A3:3-4 \
 								       A1:P0|A2:P1|A3:P-2 ."
-- 
2.55.0

