Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.81
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794645146;
	b=RxGmAgu0+FbaQJrEFKZ4XUsxnBWbBZBTbBrNBWNreGm2OuDaYwSEY8Ep2adRnQgOA1Z0
	 eRU0pLtuaG/3EHKiuHqOJZCuYBFsxZqVWNtNQYo+N8HI6j/F5fBN63xbYD8eKIrWgXzF8
	 /jodCr7Ty5k4iHxFZsPlJ4wRnMOeLXqLnYHiQ8nrWfDM/BgRoTWRSSsoJq3Qs+unezj+2
	 +z0PdfrgbOibadSWX9nkW3JG49uzaOmWpaPMNXlcxXhepbuOf4hhvBBpCczrAnRLWYwf+
	 NsoMR7bAAxG0+hzBBYO9BeI7Vd++L0A5nnGmZO3ifdp9p3A/lwkzMEZ5Wu/UsvUIRuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794645146;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v56buqOAnoISJLJjEOvtNrq8gu4iS5VwYphuZrrNXnU=;
	b=Q+IlH2vrouScXKGvoWiKclepaRff9WLtCol0+tyJurORp/4ChDHz9Q6+5/kQm8emTrQ3
	 002Nc4csD5w3bDBjZa6XEyCIjEehcqJbHmPSckD+9MQbc8xZI2ORNUI35GHAB6SkES/L7
	 yPb+tzv8NuNjCQNswt1CM+Hu4Ttk2QPoBzv/Yg/gQfkiuvDp4CHnRDmHSdvjAwNkR/Ff6
	 xmRtcsTVTFfYaOHo8C+b4g5uAxjI3GpcpS/lVM/JSAAmc5wL79J6Jly1Li79AicUF+v9y
	 LCvlAottuZaHt8mxTyBJ7mn44P+J5yQGaHGfJ+lgXkuuD2NgoWur6DxYjHWs2co2F5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SzICz0Wm;
	arc=none smtp.remote-ip=95.215.58.81
Received: from mta1.migadu.com (out-81.mta1.migadu.com [95.215.58.81])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BB606A339
	for <linux-kernel@vger.kernel.org>; Sat, 14 Nov 2026 08:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7BB606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=SzICz0Wm
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jTiMVRfmESq77/jNjDbnQ8wQoFvg3Zo4sKz2oMhgNck=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794645143; v=1; x=1795249943;
 b=SzICz0WmhEUOMcab7Z5wBeVbfIzEO/A9Q5uDvxo0ssZBEjZMW4AIp055Jnx4xp3kuvqV+k2H
 d94P5g8k/0Q01FZgcukfgFmTBlPGxQI5slVRm7uvlc7T+xE0Tsq0poVTZ15d7u4iIOUREmQ1B8k
 WN/2aSfSQ1UL2xuu5AQgy9wo=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 9074b3080037dd51;
	Sat, 14 Nov 2026 08:32:23 +0000
X-Mizu-Trace-ID: 9074b3080037dd51
X-Migadu-Flow: FLOW_OUT
From: Ridong Chen <ridong.chen@linux.dev>
To: Waiman Long <longman@redhat.com>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>
Cc: Ridong Chen <ridong.chen@linux.dev>,
	Guopeng Zhang <zhangguopeng@kylinos.cn>,
	cgroups@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ridong Chen <chenridong@xiaomi.com>
Subject: [PATCH v5 10/12] cpuset: use partition_disable() to invalidate local partition
Date: Sat, 14 Nov 2026 16:31:22 +0800
Message-Id: <20261114083124.1340140-11-ridong.chen@linux.dev>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261114083124.1340140-1-ridong.chen@linux.dev>
References: <20261114083124.1340140-1-ridong.chen@linux.dev>
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

From: Ridong Chen <chenridong@xiaomi.com>

Use partition_disable() to handle local partition invalidation as well,
replacing partcmd_invalidate in partition_cpus_change(). An invalid
partition has already given back its CPUs, so partition_cpus_change()
leaves it alone. cpuset_hotplug_update_tasks() is converted later
together with the partition revival, by local_partition_update().

As partition_disable() resets the partition data, the
effective_xcpus of an invalid partition is no longer kept. When
update_parent_effective_cpumask() turns an invalid partition back into
a valid one, use partition_enable() to set up effective_xcpus and the
partition state again.

Signed-off-by: Ridong Chen <chenridong@xiaomi.com>
---
 kernel/cgroup/cpuset.c | 40 ++++++++++++++++++++++++----------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/kernel/cgroup/cpuset.c b/kernel/cgroup/cpuset.c
index 211567c61e95..038bed1f4fb8 100644
--- a/kernel/cgroup/cpuset.c
+++ b/kernel/cgroup/cpuset.c
@@ -2367,20 +2367,28 @@ static int update_parent_effective_cpumask(struct cpuset *cs, int cmd,
 	 * Newly added CPUs will be removed from effective_cpus and
 	 * newly deleted ones will be added back to effective_cpus.
 	 */
-	spin_lock_irq(&callback_lock);
-	if (old_prs != new_prs)
-		cs->partition_root_state = new_prs;
+	if (old_prs < 0 && new_prs > 0) {
+		/*
+		 * An invalid partition becomes valid again, its effective_xcpus
+		 * was cleared or recomputed when it was invalidated.
+		 */
+		partition_enable(cs, parent, new_prs, tmp->delmask);
+	} else {
+		spin_lock_irq(&callback_lock);
+		if (old_prs != new_prs)
+			cs->partition_root_state = new_prs;
 
-	/*
-	 * Adding to parent's effective_cpus means deletion CPUs from cs
-	 * and vice versa.
-	 */
-	if (adding)
-		partition_xcpus_del(old_prs, parent, tmp->addmask);
-	if (deleting)
-		partition_xcpus_add(new_prs, parent, tmp->delmask);
+		/*
+		 * Adding to parent's effective_cpus means deletion CPUs from cs
+		 * and vice versa.
+		 */
+		if (adding)
+			partition_xcpus_del(old_prs, parent, tmp->addmask);
+		if (deleting)
+			partition_xcpus_add(new_prs, parent, tmp->delmask);
 
-	spin_unlock_irq(&callback_lock);
+		spin_unlock_irq(&callback_lock);
+	}
 
 	if (adding || deleting) {
 		cpuset_update_tasks_cpumask(parent, tmp->addmask);
@@ -2684,12 +2692,12 @@ static void partition_cpus_change(struct cpuset *cs, struct cpuset *trialcs,
 			remote_cpus_update(cs, trialcs->exclusive_cpus,
 					   trialcs->effective_xcpus, tmp);
 	} else {
-		if (trialcs->prs_err)
-			update_parent_effective_cpumask(cs, partcmd_invalidate,
-							NULL, tmp);
-		else
+		if (!trialcs->prs_err)
 			update_parent_effective_cpumask(cs, partcmd_update,
 							trialcs->effective_xcpus, tmp);
+		else if (is_partition_valid(cs))
+			partition_disable(cs, -cs->partition_root_state,
+					  trialcs->prs_err, tmp);
 	}
 }
 
-- 
2.34.1

