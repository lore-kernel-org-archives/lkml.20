Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793981632;
	b=iF98YU+P+3/aWJcLpDRO0leZZRhd1m58D1yBum+Vp2CYCUZiCvO+0j1wgMIiyEX+WHsL
	 KP40PgDf3ap3ufprEDiNeH0T+8bpFOwterYO1cnvbNjlf2OxQuOUFA6GYWbVwdzfNGFVV
	 4KNBNR6AazK2aR84wqHZEXQXeoTYRYacYJNhQImG74LooRWtl9ZFk9FTHMD/TyXbVbvmU
	 IFszLZvoMtCM2GbKw5G3VeLskXFtNVHGKG4PCfakV4jsQJqg9GJDv+Nt1A6O6uRVJ0Mc0
	 FvYzqAoxYq+TCnL/cORqTf9WVlaZQ8y/XX7tZv8SRwOMoMpxqVUFyuBLV5FPCGmogSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981632;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4p/riUXFsjOjpa6ssGj7UaebkRyu/J5l9ryx35/Ead0=;
	b=illZF/tbefrAWfJ6iNJE4PD9macj2C/yR6xzuH0xPmQ9ny9/Xg6p86u67LIDutEe+sZP
	 eZk1eUvGTYuw1nSoIE1+EsHazm0JXUzLMGgrhA7f6OLURRaUVoWuXtsG40uUiOgw7Q3lp
	 7dkxiohunGiZe54KMlvFvZ6fOvYatrtzCsyQ0KLYpGNWYPbKgASI08kdnMjGtq9mQV1hA
	 0lP7wNgraXV8+wxbfHa5+vOXKc438F4Q0tvxMIPQtz9Cx7H9ShfzSMsTNcyft1q4Hq23q
	 GyWKCP9c2DGeb7liIGZpt3Te4l95pBanQV9NuDKiEC+Qk/KXU7Yzf16t3DproUleKdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0qMmf5K;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE635606A9A3
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=I0qMmf5K
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793981631;
	b=SKErmvFo77OzRvd88ZNmFacYCOKN7tVF70yivRqeyB44Hobn0chBHDNAEGnUun/MmzsU
	 BjOWNUjMpv0Mq+payrKqNRxjJqGyBO28bZdYide0KWrYPyDZaqKtpGIiWPvu4/sb5xyJk
	 XavvoP0CgMKy+H8zmI7XxW8sQZh3CTsn7x2HmwNSbajaqs2usgTjUh9vw+iNi3QOMmiw4
	 U6Cl15lf9zcIDoQ/wHidef5qH/cVwPjM1gl8Wor4rAFw5f4Nwobvg8KCGZxMuoO8xz7Xj
	 dMYhJLVj4ZN/n8SpmVITnAU8fmO9m5EVeq2nLDLhMCYIiOkToOEjU7hDpC5J37uuNOg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981631;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=4p/riUXFsjOjpa6ssGj7UaebkRyu/J5l9ryx35/Ead0=;
	b=yKqLvldurCWJACR5sqEfTxDt1izpJEY1R7uzfgSHNo1AuTh8QvebRSK2Kd8nJLrOnP2k
	 9AeMcoWbJI/ejKYro+yaq2wNYOqPmNgTda8MoxXW79CRBvjXjl7W60eTICWEQSD5bOSK7
	 x5hVzt1FDCRLvQxkt1ouLSGiF82EMOpjTJxjyuU/4aluG8BOf7+TsRfSn64+2nhjDsHQ5
	 mx5OJTSutb/zjNJDzQuMNQr6fGEiC5eipmZLlPoQvnT9ZYAGFEnsROELI37fzh5wLgmeq
	 diZciFQujFzr1Vk5CGS/xfmBZ8HFFHYwij/17mrnotWe+sGeBz+DSRQjah1qfCVDDGg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0B5D51F008A4;
	Fri,  6 Nov 2026 16:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793981631;
	bh=4p/riUXFsjOjpa6ssGj7UaebkRyu/J5l9ryx35/Ead0=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=I0qMmf5K9UHM0ns1jIZ1Je72gmmyzEo7f2LR1wxuk1fyDsQ18v8kk4pgmOywUTqwl
	 P2MS5qSWeRcXSe4yzDQrnHSq6zxiylb2r2eKb0akgucdE7PmaTZHc9etE5uHMexMsK
	 /Ex08XQLsTEA5lveN10xjaNOzb61kCuuTHg4ut18Nl4Z3A/cZd5Ysc9MDbAJcaP0En
	 rRPHsS3PoKnwkXsDNwJrbRHgzbvzxbj0R9u+E5iNJ2MryF2N18J3H4D/2a+87KIhkf
	 TajiKsB9UVbc+RwmDRlmuaVe/Zo3RIgmxc56kUjuN4DIfNw9o9Q0phKBcEptniPr2A
	 pjXYrpuXhjwkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5A37A400A4;
	Fri,  6 Nov 2026 16:13:50 +0000 (UTC)
From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
Date: Fri, 06 Nov 2026 11:13:50 -0500
Subject: [PATCH v3] smpboot: Run the thread function only once before
 parking
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
Message-Id: <20261106-smpboot-park-once-v3-1-86dadce65c63@columbia.edu>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NQQ6CMBQE0KuYrq1pPwLFlfcwLkr7kapQ0kKjI
 dzdFjfGGJeTzLyZiUdn0JPDZiYOg/HG9jFk2w1RrewvSI2OmQCDgnMG1HdDbe1IB+lu1PYKaVW
 wshFYlizTJO4Gh415rObp/M5+qq+oxgSlRmv8aN1zPQ089f75gVNOq1gQUGS5BnZU9j51tZE71
 BNJFwE+kf0vBCKCEgSqqtEixy9kWZYXs+xc7AwBAAA=
X-Change-ID: 20261102-smpboot-park-once-9607f8e7703d
To: Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-kernel@vger.kernel.org, tz2294@columbia.edu, 
 Mani Tofigh <mt4022@columbia.edu>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793981630; l=2770;
 i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
 bh=hQCHuB1d9BRH2/8dcB77iRnc4fAbW9qf8O+O+kdrRw4=;
 b=POb6tSQ/ejI405B3M4LOQ80NK42gYvLvXTSTzWXlsOnoeevhpP692cq/zUuxtZ1UOKHR7Lod6
 dkPJjgTT5sDAI9iTHU60FYh6YFfIfj9oy/jzIcJnZD/Pirx2KLZKJa2
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
cpus_read_lock() waits with it.

That commit only needs the work queued before the park request to run
once on its own CPU.  Softirqs left pending are taken over by the
dead-CPU callbacks as before.  So on a park request, run the thread
function once if there is work and then park.  With the fix, the
offline finishes under the same load.

This bug was identified and confirmed with the help of a deterministic
hypervisor currently under development.  The C reproducer below however
hits it within about 25s.

Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
---
Changes in v3:
- Drop the hung task traces (Sebastian)
- Add Sebastian's Reviewed-by
- Link to v2: https://lore.kernel.org/all/20261104-smpboot-park-once-v2-1-ea28ec9fd85e@columbia.edu/

Changes in v2:
- Use Sebastian's comment above the thread function call
- Link to v1: https://lore.kernel.org/all/20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu/

Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ksoftpark.c
---
 kernel/smpboot.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 3f60e8c6dd30..b477267903d7 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -119,9 +119,17 @@ static int smpboot_thread_fn(void *data)
 		}
 
 		should_run = td->status == HP_THREAD_ACTIVE && ht->thread_should_run(td->cpu);
-		if (kthread_should_park() && !should_run) {
+		if (kthread_should_park()) {
 			__set_current_state(TASK_RUNNING);
 			preempt_enable();
+			/*
+			 * Run pending work once to handle queued work prior the
+			 * parking request. Don't try to process everything in case
+			 * new work continues to come and the handler has a hotplug
+			 * notifier for everything that was enqueued later.
+			 */
+			if (should_run)
+				ht->thread_fn(td->cpu);
 			if (ht->park && td->status == HP_THREAD_ACTIVE) {
 				BUG_ON(td->cpu != smp_processor_id());
 				ht->park(td->cpu);

---
base-commit: 006991aa89974378ee579416dba87adc22cd60fd
change-id: 20261102-smpboot-park-once-9607f8e7703d

Best regards,
--  
Mani Tofigh <mt4022@columbia.edu>


