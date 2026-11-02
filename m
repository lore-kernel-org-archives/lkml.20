Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793656286;
	b=eUJeNpMGjptJo0w6/YllO4Ustk9Y7C6cgj21viikUscCXlVGh2N2KN1b5bhQpG2u92sG
	 Ec6VT6gdCyIoLjD4XgNqfw0O3y0EWVDExNI3arbFKcHkHgav5smetC1+qrURvdZ6HWHQf
	 webnJcfFPuvTVUc5OFLuX9ORV6ixez1bfTcrIuq2j5T6zEClvCLfhsChEo/obXzsz8tYK
	 cCw4kjx7G47orHgP6ytUj2k5hyqtFp+aIooJwwQEyBwXHXMgZDljbar+LkWIJfng/c6cp
	 EBI7Fmh754pjkhITA/xXaxEpNlUC/YtbikwFMnA5pJRpv9hN+XgbX5Mu/EP3s+Mx6fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793656286;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1yUSzQ6MCDHE2+ze4TOnmE6+qrQ6gjXqUqjQOsAxKo4=;
	b=4c70Sh0J+6f+2H6YtvT60yICCUhGnVaIQgqlV+rmbY8v3jpqynDfRzCUq8/xUaOCFqpR
	 KSZLbjVPRZOD1+5GrohO/laa+ivV2va1yPOmP9Vbyn5ohEuTJ60n684tNElT6hp1zcCy+
	 +U25oWq8bZhdHnLTANwIDRLgShaNiXusQ13Cwn7b5aKdWj1FGWAtqt/iUZjwVGlYeZgz4
	 0kga29vKk/Qc69x9EIBY6VkRHfVV9eEGCQeJpS6ReePsNsefaYQ0Vr0hmJWk/Y28iEe4V
	 FZcE+VAK1AngZQBrmz59iYNPGMctYdUkfB+4k+W0O7bCxUD7SOxuOpClGoO/qAREdQA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdAOoYuT;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CDB6606D809
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 21:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PdAOoYuT
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793656286;
	b=tsDvgBUtek2SuH36j/zMGuK9Q8r+6gUVMawDn1UjPEGOkMOFEr6NeH/cnjfKVv6/G9Vx
	 2Wsh4Qm4wLPFnwh7rwnzka2DMMi1ClLzG/5A/OqjubAth2oGCbNftzxYJGtvMnV4CWY89
	 MbEHybAXTittYk2Zb14JCAwEgZHPBoBU0qjuq1fo4H4Rp62vs4/BdnhSLRB9C9jYpptwu
	 lUdBmw+spSh2c7YZQ9nPJ/CJbWr+hpc2HLEKM7TfuiUChz5JVu8RoRm6TK06dCAv6GvJZ
	 2Mm8DmFuz6M0VEwiKgL6Qe5d4Bq5O5iGJuWc2+D5EG6sM2dSFODdT3gtEf0PohYExKA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793656286;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=1yUSzQ6MCDHE2+ze4TOnmE6+qrQ6gjXqUqjQOsAxKo4=;
	b=ouKQz5mLZTnt5HG1gyRtWrT5aC2nyYtOEWIv0Ot1DYNlQCNERnKEnZQCIVZZH/dvH6vZ
	 YOiwLV6sjrrVMmRSHQsMAXPI/HHf+h/a4ZryEqDHKoQRuJDmY8p11vzvdNrJhC/mltxa8
	 2LmIqrGeQbSb3xJV7DvuZkbtuDGgMOlfr6Fb8R5D8yZAqKp7PoM1Pc5pjjHLXH3qsDwve
	 4kNphbnyx36+I1rRz4v/+FEbFbR1K+/c2okgPISf2pnXJ+HRVSAuw7+laWRcCas57ZEt1
	 MyxIwv5FclWPGx29mQhsWir9gTYCXtDueH3Glgywn8/Ndd2ncuXOWrtiaZ+qtGXr9KQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 05DBA1F00A1A;
	Mon,  2 Nov 2026 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793656286;
	bh=1yUSzQ6MCDHE2+ze4TOnmE6+qrQ6gjXqUqjQOsAxKo4=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=PdAOoYuTNf9DutMO8eHutAQeugmHegFbSs1zS+9aUnFEg3VL+53mkk68xZxuWnLJv
	 ttzuh1Q3HhecD3LMTaW1pctCc2AHqttA9fpPQTsedwZAHE5PULpTdNjjq7p2IDq5QO
	 LJbkVvZ6QECa9JuIxxVGck16H9M++A/zaGhLI9dQBVrLYjRh6HwmLFbVPekXE/o5He
	 ozpL0fAAinQAWdlqHbSeOfF2/rcACI1UN12wzQG+MHJpKos7IVZ/S5qiCgSU2koekR
	 q3jq0OtWY8DMKbErOLXtwkliX5hsu4I/A0b/Ou+LMxUn7LAkOU7wTX8Jn2+m2G0diJ
	 XtxtsQ3BagGbw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 579AE46691;
	Mon,  2 Nov 2026 21:51:24 +0000 (UTC)
From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Date: Mon, 02 Nov 2026 16:51:24 -0500
Subject: [PATCH] smpboot: Run the thread function only once before parking
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrDuQpGBsr1K60DjqVExCRosg3
 t2oy7f4fwOhxCTwLjZI9Gfh4DP0owA31L4n5DYbjDKl1sqgTLEJYcZYpxGDd4SvUtmuImvVs4X
 cxUQdr9fz870tS/MjN58j2PcDzX9SmnUAAAA=
X-Change-ID: 20261102-smpboot-park-once-9607f8e7703d
To: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-kernel@vger.kernel.org, tz2294@columbia.edu, 
 Mani Tofigh <mt4022@columbia.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793656284; l=3810;
 i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
 bh=7+gwrJFIT86+cmc25bfaTu75k8C3HHor3PiorlzLhzY=;
 b=797VxbCot/vvg5lW0l6AUFp8w7P83tGOkuo07iOCrKtsbPXjdDYmdJNN8q5bTUif8ysS+II2L
 FlK4JYfbJXdD1niboSovpoypZkM+pKbn4hcyXSGBpNA7MRvhGJHrQzb
X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
 pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with
 auth_id=1322
X-Original-From: Mani Tofigh <mt4022@columbia.edu>
Reply-To: mt4022@columbia.edu
Content-Transfer-Encoding: 7bit

From: Mani Tofigh <mt4022@columbia.edu>

Since commit 4a3b51aab6e2 ("smpboot: Don't park the thread if work is
pending"), smpboot_thread_fn() parks only once thread_should_run() is
false.  CPU offline waits for that with no timeout and with
cpu_hotplug_lock held for write.

When the outgoing CPU keeps receiving more packets than it can process,
ksoftirqd always has NET_RX pending and never parks.  The offline then
waits for as long as the packets keep coming and everything that takes
cpus_read_lock() waits with it:

  [   41.469979] INFO: task kworker/0:1:10 blocked for more than 20 seconds.
  [   41.470020] task:kworker/0:1     state:D stack:28392 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
  [   41.470055] Workqueue: events vmstat_shepherd
  [   41.470077] Call Trace:
  [   41.470082]  <TASK>
  [   41.470091]  __schedule+0x10f1/0x4760
  [   41.470175]  schedule+0xd7/0x2c0
  [   41.470189]  percpu_rwsem_wait+0x1f8/0x4e0
  [   41.470269]  __percpu_down_read+0x11f/0x3e0
  [   41.470287]  cpus_read_lock+0xc1/0xd0
  [   41.470301]  vmstat_shepherd+0x22/0x2a0
  [   41.470315]  process_one_work+0x92b/0x16d0
  [   41.470393]  worker_thread+0x4e6/0xd60
  [   41.470507]  kthread+0x300/0x3e0
  [   41.470542]  ret_from_fork+0x4f0/0x6f0
  [   41.470597]  ret_from_fork_asm+0x1a/0x30
  [   41.470623]  </TASK>
  [   41.470635] INFO: task cpuhp/3:33 blocked for more than 20 seconds.
  [   41.470653] task:cpuhp/3         state:D stack:27976 pid:33    tgid:33    ppid:2      task_flags:0x4208040 flags:0x00080000
  [   41.470678] Call Trace:
  [   41.470682]  <TASK>
  [   41.470690]  __schedule+0x10f1/0x4760
  [   41.470753]  schedule+0xd7/0x2c0
  [   41.470766]  schedule_timeout+0x176/0x250
  [   41.470849]  wait_for_completion+0x169/0x3b0
  [   41.470918]  kthread_park+0xff/0x180
  [   41.470934]  smpboot_park_threads+0xd5/0x160
  [   41.470959]  cpuhp_invoke_callback+0x2b0/0x1190
  [   41.470995]  cpuhp_thread_fun+0x2f8/0x6d0
  [   41.471027]  smpboot_thread_fn+0x2fb/0x8a0
  [   41.471051]  kthread+0x300/0x3e0
  [   41.471083]  ret_from_fork+0x4f0/0x6f0
  [   41.471132]  ret_from_fork_asm+0x1a/0x30
  [   41.471154]  </TASK>

That commit only needs the work queued before the park request to run
once on its own CPU.  Softirqs left pending are taken over by the
dead-CPU callbacks as before.  So on a park request, run the thread
function once if there is work and then park.  With the fix, the
offline finishes under the same load.

This bug was identified and confirmed with the help of a deterministic
hypervisor currently under development.  The C reproducer below however
hits it within about 25s.

Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
---
Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ksoftpark.c
---
 kernel/smpboot.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 3f60e8c6dd30..a2ddd10a8577 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -119,9 +119,12 @@ static int smpboot_thread_fn(void *data)
 		}
 
 		should_run = td->status == HP_THREAD_ACTIVE && ht->thread_should_run(td->cpu);
-		if (kthread_should_park() && !should_run) {
+		if (kthread_should_park()) {
 			__set_current_state(TASK_RUNNING);
 			preempt_enable();
+			/* Run pending work once, new work may keep coming */
+			if (should_run)
+				ht->thread_fn(td->cpu);
 			if (ht->park && td->status == HP_THREAD_ACTIVE) {
 				BUG_ON(td->cpu != smp_processor_id());
 				ht->park(td->cpu);

---
base-commit: b327e63683a2b894b500027375342c25222b58ef
change-id: 20261102-smpboot-park-once-9607f8e7703d

Best regards,
--  
Mani Tofigh <mt4022@columbia.edu>


