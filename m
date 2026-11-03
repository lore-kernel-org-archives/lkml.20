Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793710186;
	b=xzD9uknWPelFYcZDYhaLcH1NyNpJ+pd/lh6fId55aX42gwVL/1YT463rLeAPASa8PKVq
	 AekSVix05pstTzA1nMQkr2obuVw0H/uclSBmdCLnuAUbQuUoLqh6KwmyCAV2hPATnlJk0
	 536ucWP6xFNq0SAOpDHjOgqOWmWIg00pdXvMWRp150ycWUjcKwaIXNig11YoZ90aYaKXk
	 p8FcUa0GPMQHV5Ma69zJiA40H2QjvNehrQnRdMZm+osvV7FwYB+PAlBeGSlkJhrGvNYW2
	 XS5zu6mdnEyIGx9RobiTKJuU9BELjShSS++lCzkuvddoK9ZzLtnZot9NAAxlttk8xug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793710186;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=z6TyrzBsDIKTkKz2Ybfvv4Ho+J8zUEfYP2FNz6uqUeU=;
	b=vw6ru5ulFYx7aojWCwLj3B323zVGz5/O7X8Rty9F7yMKpA0bJRjq4fiVaE1lo0/MeS+O
	 pjbaCMNf1j0GcUQcbckm0QC3k6mx82mM6o1NZvdM0CqFqyZMa6eqj0FCgI0+WKAo4arvJ
	 xaxVZeTVamtEB2bIsBfAZgAa+20U3wN9/gqpWmz/D7gIHCMjTPUs75fRF9Gu0zmzpaWeq
	 15JW+QkM1KAla4nuas4Iep8mc08nFcIjMUCByikTRfd4/ORBca+nG3LGwo25SeQtbHU4J
	 LdqToS8XAnEI41ClP4Xl4psIW8LAG5Ydp1Tas6V11rB8GPi8v9IUOlZ91sL8FTHTcdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYdWOAFU;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239CE606A332
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 12:49:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 239CE606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OYdWOAFU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793710185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z6TyrzBsDIKTkKz2Ybfvv4Ho+J8zUEfYP2FNz6uqUeU=;
	b=OYdWOAFU4h+5kmIEqCwY23kAEY95g3VGPlocba+tXr5CbsQ4K0FGeYDkQuy2wSgRYIInme
	5lyqwVUjF6Ywdvmpvym6dHHplBcdU8pBQT7phZK4NQy23c2f6GQ8T78IEPQTjYdYnZOWR0
	wh1H5T40Fw4BD318YAqAD8QsbHEWj7w=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-597-zqqZZjuANLWWXcEJITBjpg-1; Tue,
 03 Nov 2026 07:49:40 -0500
X-MC-Unique: zqqZZjuANLWWXcEJITBjpg-1
X-Mimecast-MFC-AGG-ID: zqqZZjuANLWWXcEJITBjpg_1793710178
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A9781180075C;
	Tue,  3 Nov 2026 12:49:38 +0000 (UTC)
Received: from pbonzini-thinkpadx1carbon6th.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E214A1955F03;
	Tue,  3 Nov 2026 12:49:36 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Hillf Danton <hdanton@sina.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Harry Yoo <harry@kernel.org>
Subject: [PATCH 2/2] x86: KVM: remove the dummy allocation case from async page fault handling
Date: Tue,  3 Nov 2026 13:49:30 +0100
Message-ID: <20261103124930.2278671-3-pbonzini@redhat.com>
In-Reply-To: <20261103124930.2278671-1-pbonzini@redhat.com>
References: <20261103124930.2278671-1-pbonzini@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

The page ready notification for asynchronous page faults is delivered as
an interrupt to the same vCPU that received the not-present exception.
As long as interrupts are not enabled before the page fault is registered
in the sleepers' hash table, the page ready notification must happen
after a prior registration.

This is now the case indeed, so the dummy allocation case is dead and
can be dropped.

Note however that a write of the apf-enable MSR that goes from enabled
to enabled might trigger *both* a broadcast notification interrupt
and, later, individual interrupts for pending asynchronous page faults.
While Linux will never do such a write, the host might do a KVM_SET_MSRS
call that would result in the broadcast notification, so do not complain
too loudly if the wait does not find a token and only do a pr_once().

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/include/asm/kvm_para.h |  1 -
 arch/x86/kernel/kvm.c           | 66 ++++++++-------------------------
 2 files changed, 15 insertions(+), 52 deletions(-)

diff --git a/arch/x86/include/asm/kvm_para.h b/arch/x86/include/asm/kvm_para.h
index 1e28c89b1405..b986edb1a225 100644
--- a/arch/x86/include/asm/kvm_para.h
+++ b/arch/x86/include/asm/kvm_para.h
@@ -123,7 +123,6 @@ struct kvm_task_sleep_node {
 	struct swait_queue_head wq;
 	u32 token;
 	int cpu;
-	bool dummy;
 };
 
 #ifdef CONFIG_KVM_GUEST
diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index ca5dcdc7ffde..ab57cb3ed5a0 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -111,26 +111,11 @@ bool kvm_async_pf_queue_task(u32 token, struct kvm_task_sleep_node *n)
 	raw_spin_lock(&b->lock);
 	e = _find_apf_task(b, token);
 	if (e) {
-		struct kvm_task_sleep_node *dummy = NULL;
-
-		/*
-		 * The entry can either be a 'dummy' entry (which is put on the
-		 * list when wake-up happens ahead of APF handling completion)
-		 * or a token from another task which should not be touched.
-		 */
-		if (e->dummy) {
-			hlist_del(&e->link);
-			dummy = e;
-		}
-
 		raw_spin_unlock(&b->lock);
-		kfree(dummy);
 		return false;
 	}
-
 	n->token = token;
 	n->cpu = smp_processor_id();
-	n->dummy = false;
 	init_swait_queue_head(&n->wq);
 	hlist_add_head(&n->link, &b->list);
 	raw_spin_unlock(&b->lock);
@@ -194,53 +179,32 @@ static void kvm_async_pf_task_wake(u32 token)
 {
 	u32 key = hash_32(token, KVM_TASK_SLEEP_HASHBITS);
 	struct kvm_task_sleep_head *b = &async_pf_sleepers[key];
-	struct kvm_task_sleep_node *n, *dummy = NULL;
+	struct kvm_task_sleep_node *n;
 
 	if (token == ~0) {
 		apf_task_wake_all();
 		return;
 	}
 
-again:
 	raw_spin_lock(&b->lock);
 	n = _find_apf_task(b, token);
-	if (!n) {
-		/*
-		 * Async #PF not yet handled, add a dummy entry for the token.
-		 * Allocating the token must be down outside of the raw lock
-		 * as the allocator is preemptible on PREEMPT_RT kernels.
-		 */
-		if (!dummy) {
-			raw_spin_unlock(&b->lock);
-			dummy = kzalloc_obj(*dummy, GFP_ATOMIC);
 
-			/*
-			 * Continue looping on allocation failure, eventually
-			 * the async #PF will be handled and allocating a new
-			 * node will be unnecessary.
-			 */
-			if (!dummy)
-				cpu_relax();
-
-			/*
-			 * Recheck for async #PF completion before enqueueing
-			 * the dummy token to avoid duplicate list entries.
-			 */
-			goto again;
-		}
-		dummy->token = token;
-		dummy->cpu = smp_processor_id();
-		dummy->dummy = true;
-		init_swait_queue_head(&dummy->wq);
-		hlist_add_head(&dummy->link, &b->list);
-		dummy = NULL;
-	} else {
+	/*
+	 * A broadcast wakeup, which can happen for example if the VMM calls
+	 * KVM_SET_MSRS, might still leave the individual wakeups queued.
+	 * In that case _find_apf_task() will not find the token when the
+	 * individual wakeup comes, so just ignore the case where n is NULL.
+	 * Nevertheless it *should* not happen, so print a message for the
+	 * user in case something bad actually happens later.
+	 */
+	if (n)
 		apf_task_wake_one(n);
-	}
-	raw_spin_unlock(&b->lock);
+	else
+		pr_info_once("Async page fault waiter not found. This is probably triggered "
+			     "by the host and harmless. However, if a userspace task hangs, "
+			     "please include this message in your bug report.\n");
 
-	/* A dummy token might be allocated and ultimately not used.  */
-	kfree(dummy);
+	raw_spin_unlock(&b->lock);
 }
 
 noinstr u32 kvm_read_and_reset_apf_flags(void)
-- 
2.56.0

