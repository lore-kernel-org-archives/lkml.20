Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793212899;
	b=WA8DjxdXVr/fQy4+5YG2RBfK03ihpcurrrTpIH93Z1RqBFGEyUStnZUlhh5gpNdMKxri
	 vk6MeBfdGKhk4gLdkFbKLhuvNlcIGMPSqWDAJNPdT5g+cUN94MYHsGtqcMNa3GaDLa8cJ
	 1+4UYWv0SLuRJOhKiAAxBMB2nLW439pSM8CPf6lXk2V5p5WgKCQTgeIeJinP88WzF9wyI
	 ijIy+NedaHd58xsTGGny1tvb+zFhTzszvLvAKOD7wHifNs9IdtVXlQcdRldfUrZXNQSs2
	 8vDfAcme7nf9X2X5TIPEMDCcMuR6pxshg7xGExq67FEnyJ1kseoS7WCgep63X0vvBcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793212899;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=ppoKODV1UhbNltjW3IQuhV5+KabDhhTDl+rZiEljMwo=;
	b=aMMP5XliP6lr6YFVrGKdu+WXh7fxEGcS+1UMkTZAnsBCiHFoDTus0unGZMnq1RaZTrpU
	 zPCaIeRcD403JGUQK7cj4xeVhPfoLeXQKOfm3dCVMCaRbmgO+EuBV97OgKPRk5qiBHxkZ
	 U23K9YouKmLb2I5EG3ANTdcX+jXpgodVfr3eRS8dHdpaWG6Bd5RWyaxFDLQ3oWYUe6BRX
	 FlDH5uv1147oNfFCP9/rZjgmyBovWBonvRSxR8BYo6FrCL9taBHJzluwHQm40IXo7osFe
	 YglycHy3YQZGIo3qeIiCJV1seoMpRWD2jnLivBxMCPqWFx4jb5MsqFiwTCag72QsZew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HMsak6XA;
	arc=none smtp.remote-ip=209.85.214.198
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86537606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 18:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86537606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HMsak6XA
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e95f8543c9so9880155ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 11:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793212899; x=1793817699; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ppoKODV1UhbNltjW3IQuhV5+KabDhhTDl+rZiEljMwo=;
        b=HMsak6XAjahIQ+LEKCC+rZrmDK4B/+vpatSxwxO+JllAfvTsiTsopS7lvmiepxhVwf
         c05kenmvnbFxbr4RmVB1imcsLrMjno2LO5z1JWvrlnTY3XvaS5CsQvLk6DGlkhkTZk4O
         wUl4WL9NCf70L7Y29NsbK7lrY/iLtsXDq2mMwcL4BQV1M+IkQS6g0X1snjAok9LM8gk9
         GiDrWddyyg7N2SY0nrm2hKiCushd5iIiPU8jsXDQDtACRHOgah/55BNyPe667kg+O0R8
         0Z6zVzQIQUO2OBHYZUuqfvxzWHLg3fJnx0i5fTbqCfR5KU1eOF/CHRzgB6MgbjaOPnLv
         AX8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793212899; x=1793817699;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ppoKODV1UhbNltjW3IQuhV5+KabDhhTDl+rZiEljMwo=;
        b=sLcjzkkPXEEGizL6VS8yf/bXMMIuDsTYK+KBidonNyKLtAa8YXq8NXioOTDi92CR3w
         SP0kRlour4/PIWH0esqmcBXT+cjDl7H+kXGTojnu2iTFZsWSolekulwa2AmAd47h08+y
         e2ui6sCXuSZF+IjNUGlpnYSQdATLOBb03N4fIFxTAut7q2s5F6OkPQTpP06/r3b8ATlR
         df40xcqhn7N3vO/54OqK5Xq0/ByqWqzR3yi3b7UuLRPb27N04h6fQaCHEMf8ivALkdCD
         k/g83Fw9wLgw7JEnG6E7OJb8gasbaKQmacDpQ4kV3oZMfJ363x88RfrHU597uOjre9LP
         ALzQ==
X-Forwarded-Encrypted: i=1; AKwUvBwhLU7wblihYHgOzs0dV2BAGhHAeTp2bIZbF8A0sbiXj7IzM1qCRZ7w8lV68bMLFb9669XGeqVjmPMGoMk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXkL4HLRzEzgtVVWl1yp6BctkVWRjkiIgbGkYgXhHOSFFsgvjV
	8FgSw5OKOylcLmph1oxZoOeQkVeKAQ2swkJstkJe1eQ84CM7pQJKdtuzUzVc2bFZgbOTlZQygZe
	uPT/nGw==
X-Received: from plbmt12.prod.google.com ([2002:a17:903:b0c:b0:2e5:db9c:f03f])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d504:b0:2e8:3d48:4d92
 with SMTP id d9443c01a7336-2eb003bf1dfmr27341215ad.33.1793212898727; Wed, 28
 Oct 2026 11:41:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 28 Oct 2026 11:41:35 -0700
In-Reply-To: <20261028184136.1803336-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261028184136.1803336-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.313.g2479322e68-goog
Message-ID: <20261028184136.1803336-2-seanjc@google.com>
Subject: [PATCH v2 1/2] KVM: x86: Convert WARN_ON(preemptible()) to lockdep assertion
From: Sean Christopherson <seanjc@google.com>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>
Content-Type: text/plain; charset="UTF-8"

Use lockdep_assert_preemption_disabled() in the local APIC code instead of
open-coding a rough equivalent that would likely do more harm than good if
it were to ever fire (the non-ONCE WARN_ON() would likely spam the kernel
log and hang the host).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index ecf611845fb1..61bf09badb5a 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2270,7 +2270,8 @@ bool kvm_lapic_hv_timer_in_use(struct kvm_vcpu *vcpu)
 
 static void cancel_hv_timer(struct kvm_lapic *apic)
 {
-	WARN_ON(preemptible());
+	lockdep_assert_preemption_disabled();
+
 	WARN_ON(!apic->lapic_timer.hv_timer_in_use);
 	kvm_x86_call(cancel_hv_timer)(apic->vcpu);
 	apic->lapic_timer.hv_timer_in_use = false;
@@ -2282,7 +2283,8 @@ static bool start_hv_timer(struct kvm_lapic *apic)
 	struct kvm_vcpu *vcpu = apic->vcpu;
 	bool expired;
 
-	WARN_ON(preemptible());
+	lockdep_assert_preemption_disabled();
+
 	if (!kvm_can_use_hv_timer(vcpu))
 		return false;
 
@@ -2322,7 +2324,8 @@ static void start_sw_timer(struct kvm_lapic *apic)
 {
 	struct kvm_timer *ktimer = &apic->lapic_timer;
 
-	WARN_ON(preemptible());
+	lockdep_assert_preemption_disabled();
+
 	if (apic->lapic_timer.hv_timer_in_use)
 		cancel_hv_timer(apic);
 	if (!apic_lvtt_period(apic) && atomic_read(&ktimer->pending))
-- 
2.56.0.313.g2479322e68-goog

