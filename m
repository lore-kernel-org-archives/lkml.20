Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793897177;
	b=x35VKsu85fDCv/0QoZm/w5YzNhRdWu+tRL/YovAQwlUgj4/cBSn+KNO8JTs764u2EhHz
	 chYJpSgSu+AaMw8CwU+pJ/tvNCLWnU/qQ9wF6nzkNo7PnJh4i8Op6e5La7Rk8AkawIr8H
	 MAY4ImBzctUAtj3qi5+TO7yaUZJkLFaTep68QPsYowjSNktO2wM6XCC8E/1ONMU9ZESTQ
	 DDdT5g3AoU9tc2KOwSuOreHiXHi8JKXWxElH3Q7YHnBs7lf33flh1mSAr3qvO0PWVZmMR
	 hVFIsKb7o9nN++ZAe6UkJ7BlosYe/P5XFg17Z/zwmdJN2MN9sjY2+HiCyVAuNzJpkhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793897177;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Scanned-By;
	bh=qOBd/AF0trxY0YAt5Jt3B+F2pkdd0RcR8oCX6VitlYo=;
	b=kPQnzStynEIPK//YrDznc9vEkQkmx+gIEicL3PgfiSyjxw/DVtjqJCJZqskZZFgpDpHO
	 IPZy1N29Sm2uTwaaXZFTSiC522DYB7gbaFUL+3swFCK/lfren4rmGCXKODrlLmNRdlGmc
	 1jlb2iikt9dl9hXM91MBNQmQaehi4ROmpd4tU/XH4kmvvZPpA6kYR4aueMeIuQHg6LtLV
	 alAo4JIaJNTE1PzxSLXD4r2rdqrCPey8d02w/a+B28dc/BhUsbBz3PFujohVbi+FSOHKW
	 MOyzWfP55kd3kjj0xiaIDnrfnjS92W4RAoo6sU5SiFYyhEY6RfvAksVk80VTBs2YFBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="Fr1LtU/5";
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC93F606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 16:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC93F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Fr1LtU/5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1793897175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qOBd/AF0trxY0YAt5Jt3B+F2pkdd0RcR8oCX6VitlYo=;
	b=Fr1LtU/5AlKLbrwBsCdDe4+eb+I2yqV+NFiV8xHLOap0FP2s85oYMakEpP71lgTdgAK67w
	R1SitOFiuaMd1KpQjZaiibHDcT4loOlmB/q+EoOKIeGt6fbUw/a+epyax2N0v2CG+rkH2h
	Gf/OXDXHWvWyW1VlRt0wDCV3NwQ7gps=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-496-P__bO09AMJu_dDHqsFadHA-1; Thu,
 05 Nov 2026 11:45:57 -0500
X-MC-Unique: P__bO09AMJu_dDHqsFadHA-1
X-Mimecast-MFC-AGG-ID: P__bO09AMJu_dDHqsFadHA_1793897138
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D792D1955E7A;
	Thu,  5 Nov 2026 16:45:37 +0000 (UTC)
Received: from pbonzini-thinkpadx1carbon6th.rmtit.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D51C01956088;
	Thu,  5 Nov 2026 16:45:35 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>,
	Hillf Danton <hdanton@sina.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Harry Yoo <harry@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] x86: KVM: take b->lock around wait
Date: Thu,  5 Nov 2026 17:45:27 +0100
Message-ID: <20261105164531.313849-2-pbonzini@redhat.com>
In-Reply-To: <20261105164531.313849-1-pbonzini@redhat.com>
References: <20261105164531.313849-1-pbonzini@redhat.com>
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

If a vCPU thread is migrated between an async page fault vmexit and the
call to kvm_async_pf_wait_schedule(), the wait will occur on a different
CPU than the page ready notification.  When this happens,
kvm_async_pf_wait_schedule() can exit and free the on-stack node
before swake_up_one() finishes.  Avoid this by protecting the
accesses to &n.link with the bucket spinlock.

Note that in principle this could use a single critical section that
also covers kvm_async_pf_queue_task(), but that call is going to be
moved out of kvm_async_pf_wait_schedule().

Cc: stable@vger.kernel.org
Cc: Sean Christopherson <seanjc@google.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 arch/x86/kernel/kvm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
index 9f0efbe94793..6c0a794ed89a 100644
--- a/arch/x86/kernel/kvm.c
+++ b/arch/x86/kernel/kvm.c
@@ -152,6 +152,8 @@ static bool kvm_async_pf_queue_task(u32 token, struct kvm_task_sleep_node *n)
  */
 void kvm_async_pf_task_wait_schedule(u32 token)
 {
+	u32 key = hash_32(token, KVM_TASK_SLEEP_HASHBITS);
+	struct kvm_task_sleep_head *b = &async_pf_sleepers[key];
 	struct kvm_task_sleep_node n;
 	DECLARE_SWAITQUEUE(wait);
 
@@ -160,16 +162,20 @@ void kvm_async_pf_task_wait_schedule(u32 token)
 	if (!kvm_async_pf_queue_task(token, &n))
 		return;
 
+	raw_spin_lock(&b->lock);
 	for (;;) {
 		prepare_to_swait_exclusive(&n.wq, &wait, TASK_UNINTERRUPTIBLE);
 		if (hlist_unhashed(&n.link))
 			break;
 
+		raw_spin_unlock(&b->lock);
 		local_irq_enable();
 		schedule();
 		local_irq_disable();
+		raw_spin_lock(&b->lock);
 	}
 	finish_swait(&n.wq, &wait);
+	raw_spin_unlock(&b->lock);
 }
 EXPORT_SYMBOL_FOR_KVM(kvm_async_pf_task_wait_schedule);
 
-- 
2.56.0


