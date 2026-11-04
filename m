Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793790892;
	b=UOkqYNYT9rZrPfvRk6M9zCBL4nJCE6Ge12Hi6+fZZI1O9qBvTOBZlQLygNTOR7B7z54N
	 dHocgIwtN8OwciRc5oMb6dd5l7cj0uICu13orNym3nCv3vMTldINuLuUqj5k+Kc92C99R
	 D8FABd4jfwfdxqKx3NR+jQgLVlZRfsS3HwMexv6KeYeUuOytW0+uAfP8EVnTO95vDiTmu
	 rhxsuYxP34NXrPuyda+k3uEGsL2J3RlbQUCtM0sZaNwGWc2qgvF1WcRblGVsJgpmvCvIH
	 gQmd0jp1FZlnre3D2IFz5pd4ok+aqgGyM0VNRQHIMQsXaQpWHcNwD+APLFCVRzOLbXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793790892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=xDxDhqJVjBKwoBSqZ4/8zTufBKgQ9/aX3QhT60mdvuE=;
	b=uct/TYGFHFsZNUZX8/ZNAUohmM3lEFFluiwn5yP5xLPsLc0KHno2OIZdjISttD3o8zUS
	 niLSlJxT11o/xk327utrhGTyISidGuaO80r6U6V7J75IfW1TQBdWGLLvW2kHLEFDW0UoH
	 Xss6iVdEL2z+Ueje1YgxP0/YywETQCdvR7QyjUWBJY7BMWpcCgmaYiBIXpv63lLayfPG2
	 XF5Kva2c2RD/VZnoIFjSpAhgErIJloU+MdRkiEGYkcOiuG3WXdO8Jx16byTc5kp/nxJcp
	 hFLicXAlvnp4vGwfPRK2riMAKkqe1yNFKBpNPfQB1J4ejURS7/8uqr9gfm6DyFhDV7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j5rJVpOA;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B96606A326
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 11:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39B96606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jpiecuch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=j5rJVpOA
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso5124635e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 03:14:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793790890; x=1794395690; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xDxDhqJVjBKwoBSqZ4/8zTufBKgQ9/aX3QhT60mdvuE=;
        b=j5rJVpOA2tezszyFdo20OxehC6I3vkpwJiMG9G0RNAGwCoFUjEYgxEC/GriSW28s2k
         xcpre/+VQ365vS/j7WLDVeAEJmQjGZWblGr/T6QujUDUtNYYHMtMJwIV3Q7kUIb2lGHS
         aDHToAqV+BKW7x09WqP3OZZshW/O4WeeTsaIvP3FeMDYHYqy0qJFByscQI2tWTaBpAtU
         jN5cym7tPQgmDJO217csR/d9byxh36M5db5uekrA/8FNwdAYiOk1CfY7MkKQ4WQXtGgv
         ZUs6UO/0zbD9oZ/IQNmaTbLKY+RiKGnbvgHyJVXP1oDG8dN1W5QP2BSUCuIPJc4PNK51
         o2mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790890; x=1794395690;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xDxDhqJVjBKwoBSqZ4/8zTufBKgQ9/aX3QhT60mdvuE=;
        b=DEXNeJbDqsuAqq5599l8PEXHT5eAQwTXq/foTegjmaqdSZWGKleMLEmoQ/1AT/4GJl
         saCFCdDX5IcCd/hpk1pHd+mvS5oy6eKZkt/UrtWWgC4cP3AoYPF5WVgkq4E3MIpekPON
         CRuDWt/5Twbhaf9DEOm3advQswtUy7YtF2tJun4AIzO/4E+SsSNzoHZInwdpMXTFVMM1
         DMqveXyyfZ4X6oFwr+FnhmLKlgA22l5plDB+SAehzBaTvBVdkcfSsk+pqlF9zz00aFYT
         OZWmqdPNDy4ForbekqcMc6ngVSBG/EbJxpId6XkPHJky+2AmZY2lASyeYsWHf77NMoNJ
         PUoA==
X-Forwarded-Encrypted: i=1; AKwUvBxsWr9sLh2NBU1lhlKQXJisnxu10npugZnwQZk+dPNugqun8nd859b8QoTRgoY7qsQ767N9dFyrWJ/XWbM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+xK6poAzjcgMTNjwBmuII1rVnlDqQPQionLdKj9yQUoL+cMrbV
	NemOpreaoMZynVHdfY5jOgnA7Iks8szvjOmeGyumGvxIRuy436ly3Us1SzK517nJUrufLbefoBn
	NK9TONFkgAWR6ag==
X-Received: from wmbjp21.prod.google.com ([2002:a05:600c:5595:b0:4a1:dfb3:2e66])
 (user=jpiecuch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600d:a:b0:4ac:aae6:6400 with SMTP id 5b1f17b1804b1-4acaae665a6mr272975095e9.13.1793790890378;
 Wed, 04 Nov 2026 03:14:50 -0800 (PST)
Date: Wed,  4 Nov 2026 11:14:39 +0000
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
Message-ID: <20261104111449.3984318-1-jpiecuch@google.com>
Subject: [PATCH sched_ext/for-7.4-fixes] sched_ext: Read exit_kind before
 flushing in scx_flush_disable_work()
From: Kuba Piecuch <jpiecuch@google.com>
To: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>, Andrea Righi <arighi@nvidia.com>, 
	Changwoo Min <changwoo@igalia.com>
Cc: Kuba Piecuch <jpiecuch@google.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>, 
	Richard Cheng <icheng@nvidia.com>, sched-ext@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

scx_disable_workfn() sets exit_kind to SCX_EXIT_DONE before it tears the
scheduler down. scx_flush_disable_work() reads exit_kind after syncing
disable_irq_work and flushing disable_work, so it can observe DONE from
a disable_work that was queued after its flush and return while the
teardown is still running:

  CPU A                          CPU B
  -----                          -----
  scx_vexit()
    scx_claim_exit() -> true
                                 bpf_struct_ops_map_link_detach()
                                   bpf_scx_unreg()
                                     scx_disable()
                                       scx_claim_exit() -> false
                                     scx_flush_disable_work()
                                       irq_work_sync()      // not queued
                                       kthread_flush_work() // not queued
    irq_work_queue()
  scx_disable_irq_workfn()
    kthread_queue_work()
  scx_disable_workfn()
    exit_kind = SCX_EXIT_DONE
    scx_root_disable()
                                       atomic_read() -> SCX_EXIT_DONE
                                   bpf_map_put()

Once bpf_scx_unreg() returns, its caller drops the struct_ops map
reference, and the struct_ops trampolines can be freed while
scx_root_disable() is still running and can still call into the BPF
scheduler, e.g. ops.exit().

Read exit_kind before syncing and flushing, with acquire ordering paired
with the atomic_try_cmpxchg() in scx_disable_workfn(). DONE is only set
from disable_work, so once it is observed, the following
kthread_flush_work() sees the queued work and waits for the teardown to
finish.

This patch was created with the help of an AI coding assistant.

Fixes: d99f7a32f09d ("sched_ext: Fix scx_flush_disable_work() UAF race")
Cc: stable@vger.kernel.org # v7.1+
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-195908@kernel.org/
Signed-off-by: Kuba Piecuch <jpiecuch@google.com>
---
 kernel/sched/ext/ext.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/ext/ext.c b/kernel/sched/ext/ext.c
index 6c593d3dee3c..949143bf4752 100644
--- a/kernel/sched/ext/ext.c
+++ b/kernel/sched/ext/ext.c
@@ -7810,10 +7810,17 @@ void scx_flush_disable_work(struct scx_sched *sch)
 {
 	int kind;
 
+	/*
+	 * scx_disable_workfn() sets SCX_EXIT_DONE before tearing down. Read
+	 * exit_kind with acquire ordering (paired with atomic_try_cmpxchg() in
+	 * scx_disable_workfn()) before syncing and flushing so that, once DONE
+	 * is seen, the following flush observes the queued work and waits for
+	 * the teardown to finish.
+	 */
 	do {
+		kind = atomic_read_acquire(&sch->exit_kind);
 		irq_work_sync(&sch->disable_irq_work);
 		kthread_flush_work(&sch->disable_work);
-		kind = atomic_read(&sch->exit_kind);
 	} while (kind != SCX_EXIT_NONE && kind != SCX_EXIT_DONE);
 }
 
-- 
2.56.0.398.g882cbad275-goog

