Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.134
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793533413;
	b=aElV5muzSkqpWgC0amx9BMw7uqvOlSAvfEtenGOwoMByYQdWo3YiRZnaPbW6Ob41CM7b
	 Xy5eK7eda8gQo6ff6ryE2GrA3JORBNOShyCyjEXw2JUducCkRSbJUHjoKPxQGx+oB4BtI
	 o+HwwmE0C1lZqwz+D0Pz1uyxEi4ibnYFC4rUT/FSzhxqvCN7ZlfY0HfmaLQ71UDS1vG3R
	 xKtHsNZC6a819mfqoWVfVYON5mjfYA7jYKYYVjwVg9LRjH9ykUbbXOwD0gHlv32XQuc8x
	 wKJzti/DyXR6+8V9tpIvCUEeJPfLX3DdVy+nJMnc8BfCk73wlza0cd8vq8G9lDUuZxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793533413;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k03DturYFPchgQIyDX1b2ykePOY+3A3usQcgDXb+QGA=;
	b=dQyEAEjGpHigJsIY7FxXsFU9ilogMh30Oa3JaLG6kz81keq7DRcD5SB452pZL9nqqII5
	 i+u6fAevFkXPoHvjl0f2KHIhZo/5bQsonOsEQBR/mO2Cspq2hR3kiDtU0nS98zn+hN6dW
	 DIi4KBBAWn0aX8LyzkCviCQiqk3g2qbCQNErHdLDjws0poTojKVrxamJh1wCPy4YBxFe5
	 w8qGkDQLQek/4tuJDmTPugTrGWavOCOqp/RaJ+voyw+0wZ9pi1yx8z3IADx1hJy22oWJ2
	 0cLa64+oFwtNzEooob+Qj/FRyxj5UJ+sLQ+WzBqzqdTRp52MXvgo/4aSMZwS/YQHMLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bVa9oJga;
	arc=none smtp.remote-ip=95.215.58.134
Received: from mta1.migadu.com (out-134.mta1.migadu.com [95.215.58.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14578606A326
	for <linux-kernel@vger.kernel.org>; Sun,  1 Nov 2026 11:43:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14578606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=bVa9oJga
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=t7DCjAKm9g2Tplz78gGmplW61TMN9ozyCJpzorNdG6w=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793533410; v=1; x=1794138210;
 b=bVa9oJgaYHTkylMKSgrFIju3z0FpcEZ1bWGh6l4SERYiRul9ZPM40VZ70xx6US4SDJqB0wBI
 xdZwdZZRJCRErBwNyrjlFzBQUNFTMdz/MW7SsvlY73HtUISfgFXSwXQ3TR2E0ZmIjSYzCeEy9de
 i0LVrBorYb7jygKUZMGzonug=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id a9c5b284b38d2954;
	Sun, 01 Nov 2026 11:43:30 +0000
X-Mizu-Trace-ID: a9c5b284b38d2954
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	"Michal Koutn?" <mkoutny@suse.com>
Cc: Guopeng Zhang <guopeng.zhang@linux.dev>,
	Ridong Chen <ridong.chen@linux.dev>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Ridong <chenridong@huawei.com>,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [RFC PATCH -v4 08/22] cpuset: use partition_disable() for remote partition disablement
Date: Sun,  1 Nov 2026 19:41:52 +0800
Message-Id: <20261101114206.2434398-9-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261101114206.2434398-1-ridong.chen@linux.dev>
References: <20261101114206.2434398-1-ridong.chen@linux.dev>
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

From: Chen Ridong <chenridong@huawei.com>

Now that the partition_disable() helper is available, replace the
existing implementation for remote partition disablement with this
centralized function to unify the disablement logic.

Signed-off-by: Chen Ridong <chenridong@huawei.com>
Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index d7f9f6e1fa3c..9a683e6ef0be 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -1915,6 +1915,8 @@ static int remote_partition_enable(struct cpuset *cs, int new_prs,
  */
 static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
 {
+	int new_prs;
+
 	WARN_ON_ONCE(!is_remote_partition(cs));
 	/*
 	 * When a CPU is offlined, top_cpuset may end up with no available CPUs,
@@ -1925,19 +1927,8 @@ static void remote_partition_disable(struct cpuset *cs, struct tmpmasks *tmp)
 	WARN_ON_ONCE(!cpumask_subset(cs->effective_xcpus, subpartitions_cpus) &&
 		     !cpumask_empty(subpartitions_cpus));
 
-	spin_lock_irq(&callback_lock);
-	cs->remote_partition = false;
-	partition_xcpus_del(cs->partition_root_state, NULL, cs->effective_xcpus);
-	if (cs->prs_err)
-		cs->partition_root_state = -cs->partition_root_state;
-	else
-		cs->partition_root_state = PRS_MEMBER;
-
-	/* effective_xcpus may need to be changed */
-	compute_excpus(cs, cs->effective_xcpus);
-	reset_partition_data(cs);
-	spin_unlock_irq(&callback_lock);
-	cpuset_force_rebuild();
+	new_prs = cs->prs_err ? -cs->partition_root_state : PRS_MEMBER;
+	partition_disable(cs, NULL, new_prs, cs->prs_err);
 
 	/*
 	 * Propagate changes in top_cpuset's effective_cpus down the hierarchy.
-- 
2.34.1

