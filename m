Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793836425;
	b=OclzvJWnNK9Zwu3HsShTFfdVcI9FoDnzMK469zISARG0/138Le3Zn7xmwguRYiHxSQjO
	 7gMpxECUqV4mM7i0BtA7uDPynr7C6zssxMpVnSzwx/ZG+nzX+7j32I0U7UagZSncgfoSh
	 lRiSdW3xXNDnEwFLMRPYVUwDWT1e3yBZK61dvgLQ9iUpq8F50ZE/D2pVME8poewWOYOqR
	 5hfrkL3amdMeXyKJryXkacesQ7LJ9gRY6/iOe2TJmkwPvmiGwQwuFPz6fCmYixX6r412g
	 qAbl0xMGhmHzOfFKXZnprnNDwbBSu2ooqY558Hg/B6DU649QWETFS6055FgVBlq4VRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793836425;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:Date:From:To:CC:Subject:
	 In-Reply-To:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VeugssPejjBkQOyMsLtKvGKvGDEUMxXJxO+Iqcxug8w=;
	b=ApKCfgpB70o6JkoVgEgr8h6omNTbsH6VwCclF0XMOwI21Rdes7sE/T4bQR3frUzlh/lV
	 dSakdASmBoapzwzlSuo8/F6DipEiIsJjBP9oelzZAA33ZayUZ3j0UMXB8udmhRgIX/K6S
	 wwuYDQww8YyH14Wc9sETClr3qjq763ayFGyfsWdnTilz/cUlEsUumZNhIoevXosHmlWbM
	 7S9SOG7CX7x1VZSQkmg0FLagEW3sikm92DLMLZn4ltKcYsN1fuLe52914+esom4bW4FOW
	 kOr4lNN0KLcZhhOBYvXHORwLFEdrOJnwK7xymS34cv93tnr04ACNtsbkOVVX9br/k2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=RZ9+qesf;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=rkoyF7VN;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640E606A31B
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 23:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9640E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=RZ9+qesf;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=rkoyF7VN
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793836404; bh=VeugssPejjBkQOyMsLtKvGK
	vGDEUMxXJxO+Iqcxug8w=; b=RZ9+qesfVBDkqxuqrNL7G2bQYpsmzx5f0moFTNygOWtxBOe8ic
	brMFHPlQ40yvj5RZ0w4irOt+I4gFA7XWBIXWIHYxT37yc+UQ7mJAGCQkZguzyzegHnk3r/Qc+7M
	IgLPfqNbcvllh53c20vxPThEDBF1Lh68mAnLbzhjRxnGr7Zqndspayrk2P3/kqumVAle4IRrPHa
	5R21Nt8j+gZaSgDga5lT1hiJM8p0+rAGsAcprHvzcaj5htUFNiXV/xnhU/aKToljL01fmXjnDm1
	F3z6bHANvI0AxJ3UjIap7C4PxcmwdW20z6sL/SVrN6OFfAmncLvVNMr1yZz85LEMBMg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1793836404; bh=VeugssPejjBkQOyMsLtKvGK
	vGDEUMxXJxO+Iqcxug8w=; b=rkoyF7VNvlmbD8NL0WhYJM/SNoWD2TrQssUMkDcFdAE8F+XtjW
	k9mYeZKK15PkI7GIviD6lnBQjsvI5lFXTIDg==;
Date: Wed, 04 Nov 2026 23:53:25 +0000
From: Bradley Morgan <brads@mainlining.org>
To: devnull+mt4022.columbia.edu@kernel.org
CC: bigeasy@linutronix.de, linux-kernel@vger.kernel.org, mt4022@columbia.edu,
 peterz@infradead.org, tglx@kernel.org, tz2294@columbia.edu
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_smpboot=3A_Run_the_thre?=
 =?US-ASCII?Q?ad_function_only_once_before_parking?=
In-Reply-To: <20261104-smpboot-park-once-v2-1-ea28ec9fd85e@columbia.edu>
Message-ID: <8F051E1B-268D-417E-B1E1-4ECA2046E0F8@mainlining.org>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit

On 4 November 2026 21:58:09 GMT, Mani Tofigh <mt4022@columbia.edu> wrote:
>Since commit 4a3b51aab6e2 ("smpboot: Don't park the thread if work is
>pending"), smpboot_thread_fn() parks only once thread_should_run() is
>false.  CPU offline waits for that with no timeout and with
>cpu_hotplug_lock held for write.
>
>When the outgoing CPU keeps receiving more packets than it can process,
>ksoftirqd always has NET_RX pending and never parks.  The offline then
>waits for as long as the packets keep coming and everything that takes
>cpus_read_lock() waits with it:
>
>  [   41.469979] INFO: task kworker/0:1:10 blocked for more than 20 seconds.
>  [   41.470020] task:kworker/0:1     state:D stack:28392 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
>  [   41.470055] Workqueue: events vmstat_shepherd
>  [   41.470077] Call Trace:
>  [   41.470082]  <TASK>
>  [   41.470091]  __schedule+0x10f1/0x4760
>  [   41.470175]  schedule+0xd7/0x2c0
>  [   41.470189]  percpu_rwsem_wait+0x1f8/0x4e0
>  [   41.470269]  __percpu_down_read+0x11f/0x3e0
>  [   41.470287]  cpus_read_lock+0xc1/0xd0
>  [   41.470301]  vmstat_shepherd+0x22/0x2a0
>  [   41.470315]  process_one_work+0x92b/0x16d0
>  [   41.470393]  worker_thread+0x4e6/0xd60
>  [   41.470507]  kthread+0x300/0x3e0
>  [   41.470542]  ret_from_fork+0x4f0/0x6f0
>  [   41.470597]  ret_from_fork_asm+0x1a/0x30
>  [   41.470623]  </TASK>
>  [   41.470635] INFO: task cpuhp/3:33 blocked for more than 20 seconds.
>  [   41.470653] task:cpuhp/3         state:D stack:27976 pid:33    tgid:33    ppid:2      task_flags:0x4208040 flags:0x00080000
>  [   41.470678] Call Trace:
>  [   41.470682]  <TASK>
>  [   41.470690]  __schedule+0x10f1/0x4760
>  [   41.470753]  schedule+0xd7/0x2c0
>  [   41.470766]  schedule_timeout+0x176/0x250
>  [   41.470849]  wait_for_completion+0x169/0x3b0
>  [   41.470918]  kthread_park+0xff/0x180
>  [   41.470934]  smpboot_park_threads+0xd5/0x160
>  [   41.470959]  cpuhp_invoke_callback+0x2b0/0x1190
>  [   41.470995]  cpuhp_thread_fun+0x2f8/0x6d0
>  [   41.471027]  smpboot_thread_fn+0x2fb/0x8a0
>  [   41.471051]  kthread+0x300/0x3e0
>  [   41.471083]  ret_from_fork+0x4f0/0x6f0
>  [   41.471132]  ret_from_fork_asm+0x1a/0x30
>  [   41.471154]  </TASK>
>
>That commit only needs the work queued before the park request to run
>once on its own CPU.  Softirqs left pending are taken over by the
>dead-CPU callbacks as before.  So on a park request, run the thread
>function once if there is work and then park.  With the fix, the
>offline finishes under the same load.
>
>This bug was identified and confirmed with the help of a deterministic
>hypervisor currently under development.  The C reproducer below however
>hits it within about 25s.
>
>Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
>Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
>---
>Changes in v2:
>- Use Sebastian's comment above the thread function call
>- Link to v1: https://lore.kernel.org/all/20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu/
>
>Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ksoftpark.c

You sent two V2s, what?

>---
> kernel/smpboot.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>index 3f60e8c6dd30..b477267903d7 100644
>--- a/kernel/smpboot.c
>+++ b/kernel/smpboot.c
>@@ -119,9 +119,17 @@ static int smpboot_thread_fn(void *data)
> 		}
> 
> 		should_run = td->status == HP_THREAD_ACTIVE && ht->thread_should_run(td->cpu);
>-		if (kthread_should_park() && !should_run) {
>+		if (kthread_should_park()) {
> 			__set_current_state(TASK_RUNNING);
> 			preempt_enable();
>+			/*
>+			 * Run pending work once to handle queued work prior the
>+			 * parking request. Don't try to process everything in case
>+			 * new work continues to come and the handler has a hotplug
>+			 * notifier for everything that was enqueued later.
>+			 */
>+			if (should_run)
>+				ht->thread_fn(td->cpu);
> 			if (ht->park && td->status == HP_THREAD_ACTIVE) {
> 				BUG_ON(td->cpu != smp_processor_id());
> 				ht->park(td->cpu);
>
>---
>base-commit: a2b67e904401858d9f0ff6a0485c2fab506cc1bf
>change-id: 20261102-smpboot-park-once-9607f8e7703d
>
>Best regards,
>--  
>Mani Tofigh <mt4022@columbia.edu>
>
>
>From mboxrd@z Thu Jan  1 00:00:00 1970
>Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
>ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
>	t=1793829490;
>	b=lDM8XgrK+tdPKwn+T2gaas8kg/ZvKIX46skmH9bcvHI8mkQNWmt3enwliQeCpqLRkZ7m
>	 RZ8+M7tJoV356aWxXWoxvod1aPnHHJTKazudj6fxP8CKKnsZrH4BNloByqnLMge20XWON
>	 GP2xAttG21+l5/sDIvQnnZRlh3LCmPRvdgUilIbEWhksPpBSCIs5Lyh7vzxNrbDU6dUkq
>	 W7KKtoX3IyHc/PybUwN8AAhDYvz6uTlPOllyB4kdE7h1iHx08oqt/kvcrS3WzkHlZD91m
>	 rT4pSAAIzhK2B7mGLmciFRCOuiMk7EvGpMUSJ2M860IFnfRoPzaIABCNr7nUVV9C+jg==
>ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
>	a=rsa-sha256; c=relaxed/relaxed; t=1793829490;
>	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
>	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
>	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
>	 X-Original-From:Reply-To:Content-Transfer-Encoding;
>	bh=IjVws6NdOXZamYoE9YsCdkzyOUuQjtHci0qOQtNo5Cs=;
>	b=T21HsQBpEy2KFi8zoGiP8w7/zvTemvK68Qvv4YAdTIH4zzyREa3EL+v68/2lBPt+ZhX4
>	 BbKJXo0tauq4pwNt6Ugwg+N0APRDBCX0VqSZWKk8nRDoLvrt7+iLqNKrqWb3gIsmprCZo
>	 jbp3Fhz68tGWjF0i0rpexS920ODMYJStcpEi37jIG8Iu3EU9PLDDlArhpoqdRwFUOOpx9
>	 W+zLwM+QG7xlZtLXHC7bYVFkGZhFsojg0aPOVjx+B7LOS9+bEIkaNVPdRVIJayoiBWMWM
>	 8vIZW3g6qxtsQIHXb9Kbe/bzG0GT7b0Du7jokoCbQ7t+FlA7Wi/njSsYHqPoybXcyRA==
>ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
>	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBGpwSNh;
>	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
>Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
>	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
>	 key-exchange X25519 server-signature ECDSA (prime256v1))
>	(No client certificate requested)
>	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5952D606A878
>	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 21:58:10 +0000 (UTC)
>Authentication-Results: smtp.subspace.kernel.org;
>	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MBGpwSNh
>Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
>ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
>	t=1793829490;
>	b=ZVXfluaOAHmpMN9JdWl57MJY+ajzNhzl++y8x+rPWkWmpp30tKSwiVdaDgTQ1IQLk+/e
>	 WJnI5X3I0OPIQ02uUOBT1QpE63ThGM0VxCN0+kRw209inC+pIuwvBq63xxPq7dPtZRMZA
>	 2/Wb2DmRa9705zLfGKBzhZ+YDfX33encF4OM0mzt06Q11/wPOE7UFUgZkUlxAjRqdmbzR
>	 RMDCgFhPaM6jZFJMO6KRmlf+Az7wQz3T/J1AorY27ZHg5z4gWvpEqs6g8Md9bnGmERnHQ
>	 cLtjiWg7pIB6NgXAIbviBiez5z5Y8iSj+yeuw2yksqRSCjO3+y9KsF30vwBW68kro0w==
>ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
>	c=relaxed/relaxed; t=1793829490;
>	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
>	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
>	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
>	 X-Original-From:Reply-To:Content-Transfer-Encoding;
>	bh=IjVws6NdOXZamYoE9YsCdkzyOUuQjtHci0qOQtNo5Cs=;
>	b=tXYyAlT+6v6UOPyfZeQydSdVLnD/uax/9QhUfMAmxfqMufh8lBMBbjp7LHKjL7WgPAab
>	 8mmrB5qVH/Jxm/nAq3t7LfFz6FZjZUoEUAHrfp0DqY8ViepY62piVezkyWlAKGOURA3K0
>	 4Q2/YJr4LoN104bt/LkrtRzhACX3eAJbNVyB3MYqv2iyBnQeHfJJkqRn/bD5ACVnUKrDd
>	 Z7JbMsUauS8JyvVcjhDMvqV355gFmhSQ8i2S3TWOfhLiQoqUGrbm4MGuvQTNx4myFHL5i
>	 8Vgf1xqqDIg8EoY8KyKT0k3p5jsDdj1oJ8bnMD9fhHkqorSU5YK9tCCNe575DO7uwJA==
>ARC-Authentication-Results: i=1; smtp.kernel.org; 
>	arc=none smtp.remote-ip=100.80.115.77
>Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
>	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
>	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
>	(No client certificate requested)
>	by smtp.kernel.org (Postfix) with ESMTPS id 883F81F0093A;
>	Wed,  4 Nov 2026 21:58:09 +0000 (UTC)
>DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
>	s=k20260515; t=1793829490;
>	bh=IjVws6NdOXZamYoE9YsCdkzyOUuQjtHci0qOQtNo5Cs=;
>	h=From:Date:Subject:To:Cc:Reply-To;
>	b=MBGpwSNhXqeek2yJZLXNWtr+UOY1I05TmdWKjhxcCUSWNg44JMIDyyp+5ZNbW4bIz
>	 xKaOgqZMMqgbYerTH+wfgjW1as+Y04aKFBCMbhDMoZK/fuwEfml9bkIShI6PwFv/k+
>	 PCbPa+FIpOTI8WIO1CNhGrf/yxXbf6+FjPEcpah3wh47o1OaO8iMSvLdJtf89Uipfm
>	 uMoa5eiei886f8qjQmv+To/jPN5mrzIyClQPbc5hFO+rr0hAwKKEoci9THCKBH67Ss
>	 /w/DpEFod81raG+HnD9MsBDTteF7y9SwlXcpcUvYIsFtvTf0z3JLGbkvltEtL7GBvZ
>	 conz2Q9CMDCpg==
>Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
>	by lkml.kernel.org (Postfix) with ESMTP id DA72346FCD;
>	Wed,  4 Nov 2026 21:58:08 +0000 (UTC)
>From: Mani Tofigh via B4 Relay <devnull+mt4022.columbia.edu@kernel.org>
>Date: Wed, 04 Nov 2026 16:58:09 -0500
>Subject: [PATCH v2] smpboot: Run the thread function only once before
> parking
>X-Mailing-List: linux-kernel@vger.kernel.org
>List-Id: <linux-kernel.vger.kernel.org>
>List-Post: <mailto:linux-kernel@vger.kernel.org>
>List-Help: <mailto:linux-kernel+help@vger.kernel.org>
>List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
>List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
>List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
>Precedence: list
>MIME-Version: 1.0
>Content-Type: text/plain; charset="utf-8"
>Message-Id: <20261104-smpboot-park-once-v2-1-ea28ec9fd85e@columbia.edu>
>X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBBFf4XM2jFtiTxc8R+GBbSDjEpLWiAaw
> r9bcO/yJOeeu0IgzxTgmqzgaeHAzkZQpwR039g7IZvIoITKpBQKwzC2zk04Nv6JzmrCMhN5V1C
> ei9RA3I2eOn4fzVv94zC3D9LTHtqNnsPk/Oc4XeTu/esvEiWWUShUll6MEpV2r3louTmTmaHet
> u0LG6ZDX8cAAAA=
>X-Change-ID: 20261102-smpboot-park-once-9607f8e7703d
>To: Thomas Gleixner <tglx@kernel.org>, 
> Peter Zijlstra <peterz@infradead.org>
>Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
> linux-kernel@vger.kernel.org, tz2294@columbia.edu, 
> Mani Tofigh <mt4022@columbia.edu>
>X-Mailer: b4 0.16.0
>X-Developer-Signature: v=1; a=ed25519-sha256; t=1793829488; l=4201;
> i=mt4022@columbia.edu; s=20261026; h=from:subject:message-id;
> bh=QJGwfQcO8wqq1GxIL5UPd4JWg89kSii0cXanOGd1Z2g=;
> b=jvY6vvbvK02lMFAnkeDHsYc4Qi9sCaqv1F4RgTQMoxrH/twR3LBqFzch6rLOUtn6fGVnP3M4B
> g6RTc6PQ8yKAp8o0T6mQOSHkdfw9zn3AtalX33GqV5qZ3tSBlSk2inx
>X-Developer-Key: i=mt4022@columbia.edu; a=ed25519;
> pk=gljCMQDuxyKPmd5y37CRpEJGSPXDV1MyAnHBhCgXl0I=
>X-Endpoint-Received: by B4 Relay for mt4022@columbia.edu/20261026 with
> auth_id=1322
>X-Original-From: Mani Tofigh <mt4022@columbia.edu>
>Reply-To: mt4022@columbia.edu
>Content-Transfer-Encoding: 7bit
>
>From: Mani Tofigh <mt4022@columbia.edu>
>
>Since commit 4a3b51aab6e2 ("smpboot: Don't park the thread if work is
>pending"), smpboot_thread_fn() parks only once thread_should_run() is
>false.  CPU offline waits for that with no timeout and with
>cpu_hotplug_lock held for write.
>
>When the outgoing CPU keeps receiving more packets than it can process,
>ksoftirqd always has NET_RX pending and never parks.  The offline then
>waits for as long as the packets keep coming and everything that takes
>cpus_read_lock() waits with it:
>
>  [   41.469979] INFO: task kworker/0:1:10 blocked for more than 20 seconds.
>  [   41.470020] task:kworker/0:1     state:D stack:28392 pid:10    tgid:10    ppid:2      task_flags:0x4208060 flags:0x00080000
>  [   41.470055] Workqueue: events vmstat_shepherd
>  [   41.470077] Call Trace:
>  [   41.470082]  <TASK>
>  [   41.470091]  __schedule+0x10f1/0x4760
>  [   41.470175]  schedule+0xd7/0x2c0
>  [   41.470189]  percpu_rwsem_wait+0x1f8/0x4e0
>  [   41.470269]  __percpu_down_read+0x11f/0x3e0
>  [   41.470287]  cpus_read_lock+0xc1/0xd0
>  [   41.470301]  vmstat_shepherd+0x22/0x2a0
>  [   41.470315]  process_one_work+0x92b/0x16d0
>  [   41.470393]  worker_thread+0x4e6/0xd60
>  [   41.470507]  kthread+0x300/0x3e0
>  [   41.470542]  ret_from_fork+0x4f0/0x6f0
>  [   41.470597]  ret_from_fork_asm+0x1a/0x30
>  [   41.470623]  </TASK>
>  [   41.470635] INFO: task cpuhp/3:33 blocked for more than 20 seconds.
>  [   41.470653] task:cpuhp/3         state:D stack:27976 pid:33    tgid:33    ppid:2      task_flags:0x4208040 flags:0x00080000
>  [   41.470678] Call Trace:
>  [   41.470682]  <TASK>
>  [   41.470690]  __schedule+0x10f1/0x4760
>  [   41.470753]  schedule+0xd7/0x2c0
>  [   41.470766]  schedule_timeout+0x176/0x250
>  [   41.470849]  wait_for_completion+0x169/0x3b0
>  [   41.470918]  kthread_park+0xff/0x180
>  [   41.470934]  smpboot_park_threads+0xd5/0x160
>  [   41.470959]  cpuhp_invoke_callback+0x2b0/0x1190
>  [   41.470995]  cpuhp_thread_fun+0x2f8/0x6d0
>  [   41.471027]  smpboot_thread_fn+0x2fb/0x8a0
>  [   41.471051]  kthread+0x300/0x3e0
>  [   41.471083]  ret_from_fork+0x4f0/0x6f0
>  [   41.471132]  ret_from_fork_asm+0x1a/0x30
>  [   41.471154]  </TASK>
>
>That commit only needs the work queued before the park request to run
>once on its own CPU.  Softirqs left pending are taken over by the
>dead-CPU callbacks as before.  So on a park request, run the thread
>function once if there is work and then park.  With the fix, the
>offline finishes under the same load.
>
>This bug was identified and confirmed with the help of a deterministic
>hypervisor currently under development.  The C reproducer below however
>hits it within about 25s.
>
>Fixes: 4a3b51aab6e2 ("smpboot: Don't park the thread if work is pending")
>Signed-off-by: Mani Tofigh <mt4022@columbia.edu>
>---
>Changes in v2:
>- Use Sebastian's comment above the thread function call
>- Link to v1: https://lore.kernel.org/all/20261102-smpboot-park-once-v1-1-920282635d20@columbia.edu/
>
>Reproducer: https://github.com/manitofigh/files/blob/main/linux-repros/ksoftpark.c
>---
> kernel/smpboot.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>
>diff --git a/kernel/smpboot.c b/kernel/smpboot.c
>index 3f60e8c6dd30..b477267903d7 100644
>--- a/kernel/smpboot.c
>+++ b/kernel/smpboot.c
>@@ -119,9 +119,17 @@ static int smpboot_thread_fn(void *data)
> 		}
> 
> 		should_run = td->status == HP_THREAD_ACTIVE && ht->thread_should_run(td->cpu);
>-		if (kthread_should_park() && !should_run) {
>+		if (kthread_should_park()) {
> 			__set_current_state(TASK_RUNNING);
> 			preempt_enable();
>+			/*
>+			 * Run pending work once to handle queued work prior the
>+			 * parking request. Don't try to process everything in case
>+			 * new work continues to come and the handler has a hotplug
>+			 * notifier for everything that was enqueued later.
>+			 */
>+			if (should_run)
>+				ht->thread_fn(td->cpu);
> 			if (ht->park && td->status == HP_THREAD_ACTIVE) {
> 				BUG_ON(td->cpu != smp_processor_id());
> 				ht->park(td->cpu);
>
>---
>base-commit: a2b67e904401858d9f0ff6a0485c2fab506cc1bf
>change-id: 20261102-smpboot-park-once-9607f8e7703d
>
>Best regards,
>--  
>Mani Tofigh <mt4022@columbia.edu>
>
>
>
>

--- Thanks!
