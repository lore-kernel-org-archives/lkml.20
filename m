Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.109
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794213129;
	b=VH6nLX10fCPngxHYFoVrHtNAWqu73gOPUmEuLLmAqk7ktP3q9poB0wghuhqDEwnSdjqq
	 zS/j51yZ+0ywxSb1Wb/RH1WwFzjUv0mNEQn9qdU5bNmD0PQGbtTyUvhoDD4gPvQttlcSN
	 /35/fWIx3fVkKeUums4FAg315kvD5gpvHhHv1ih6xXdj9b+tsID2atAwJ2zU8mxWEhuuS
	 84jdqBGonI0kIq7Q0yLZatmid6/Ukrwj8L2uZOwCp5uvm3ZoT3wPh+U1Lb10tZJESR5QW
	 S7mY12MlImEr/Q5h5MRtoYwbmSomHT9CrikBmO3TPnWGNA5xuMDnHmfJVRPVZhRNeLQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794213129;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=KmjDL+ZYjMuGRzVCbJ/ua2rZFiezU/zJqi55Q1TXzTU=;
	b=yXJInrPXuQzoEdE2VvJCniBfrWC/qnHARBILL14qSZNhfCp0bcjoQO3qFuWYkuyj4HJj
	 SI+6B1137wtDayavVPZJKyRQ+ULeiM71Jn70S7l468cItNz5AGSO308tQ3bNcbPK2IpOW
	 00CEPm5qcTQCeM6seAb14BrH18j68/7p3LJw1KsOJK7oMi0wElXgiOwU52v9qZGSgruUl
	 KxnzN9xd2QI7x9jyNKzjZZJLNwFQvRFxJoKpf3t8hBrWOpwfFyx3n96Eoq0aDFWXIbjbd
	 JE6VN7LCarf5SiezbCKIVdQH6zBeBpQeK3JC/jIWBnClIyqNiyHAUFuT+MzQShhox6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k5K1tyvV;
	arc=none smtp.remote-ip=95.215.58.109
Received: from mta1.migadu.com (out-109.mta1.migadu.com [95.215.58.109])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9657606A321
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 08:32:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9657606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=k5K1tyvV
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=QRV3SldNox6KvqwDi88YeJ7A25jJBfRYkhmfbFDJhhY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794213124; v=1; x=1794817924;
 b=k5K1tyvVGvkrqrCzBT33RcQ2SL4vUmQGCmi4dl0KpbDL6X2pcbJSK+Z5z4KYoMl0jD7xRQCz
 OQE7mWnTeZzemp+z9BWRqej3yvnK6MH2GauCHXMdzUocVvvHp6w2Hjx6GhEa6iqDyNBY3TfbNdS
 OqkOVR0UvZz57ZRjecaonMyg=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by mta12.migadu.com with ESMTPS id 5016b8722ed8e219;
	Mon, 09 Nov 2026 08:32:04 +0000
X-Mizu-Trace-ID: 5016b8722ed8e219
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: mingo@redhat.com,
	peterz@infradead.org,
	juri.lelli@redhat.com,
	vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com,
	rostedt@goodmis.org,
	bsegall@google.com,
	mgorman@suse.de,
	vschneid@redhat.com,
	kprateek.nayak@amd.com,
	sshegde@linux.ibm.com
Cc: linux-kernel@vger.kernel.org,
	wangfushuai@baidu.com
Subject: [PATCH] sched/core: Fix a TOCTOU bug in sched_non_preferred_cpu_push_stop()
Date: Mon,  9 Nov 2026 16:31:30 +0800
Message-Id: <20261109083130.1679-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
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

From: Fushuai Wang <wangfushuai@baidu.com>

sched_push_current_non_preferred_cpu() is called in irq context. It
checks is_migration_disabled() before queuing the stopper, but the
task may continue running and enter migrate_disable() before the stopper
runs.
Recheck is_migration_disabled() in sched_non_preferred_cpu_push_stop()
before calling __migrate_task().

  WARNING: kernel/sched/core.c:3432 at set_task_cpu+0x1b8/0xdf0, CPU#21: migration/21/152
  Stopper: sched_non_preferred_cpu_push_stop+0x0/0xb10 <- sched_push_current_non_preferred_cpu+0x6a6/0x9a0
  ...
  Call Trace:
   <TASK>
   ? __this_cpu_preempt_check+0x13/0x20
   move_queued_task+0xfc/0x650
   ? is_cpu_allowed+0x341/0x820
   ? __this_cpu_preempt_check+0x13/0x20
   sched_non_preferred_cpu_push_stop+0x7b7/0xb10
   ? __pfx_sched_non_preferred_cpu_push_stop+0x10/0x10
   ...
   </TASK>

Fixes: 74699f56ebcf ("sched/core: Push current task from non preferred CPU")
Signed-off-by: Fushuai Wang <wangfushuai@baidu.com>
---
 kernel/sched/core.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 1a088d4576f5..8ed7613eafd6 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -11317,7 +11317,8 @@ static int sched_non_preferred_cpu_push_stop(void *arg)
 		rq->npc_push_work_pending = false;
 		update_rq_clock(rq);
 
-		if (task_rq(p) == rq && task_on_rq_queued(p)) {
+		if (task_rq(p) == rq && task_on_rq_queued(p) &&
+		    !is_migration_disabled(p)) {
 			struct rq *dest_rq = __migrate_task(rq, &rf, p, cpu);
 
 			if (rq != dest_rq)
-- 
2.36.1

