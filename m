Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706144;
	b=nW52qXjfNlqhQ6flvpoVkpSxGx+zyNI8Csv28iq4iZl3fPMX/MoWrn+HIj72uprEqB+7
	 r4ewf36wCJSK9GR3kACxTnRph4vjRYRSxpBWfxf1RNtUpzdS0mJb/B0SF7FKvB7Gv8ksW
	 0asvFvaIZ65M333R3lECnJxGUBXP385dJpNMhnLUEc9SWpUipYbnCs6jlgGlDSHpkoFfo
	 Om6bVfy1WXJPdXFdp0N8N1IsMeY9FssdwSsUBch926jro8TX4ndF7jZ3k2vxE7vn5hsnB
	 rz5BV5cUH9eU4XBIHunnJteOGfx2KK6aLcz7Xud7jM/nmbvFeHrFC3On+4iZ0/RnIGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706144;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=d2GP3/xMpsIH5cpcG4RPrAfL3ezbI3nXC8h1MMuuxmQ=;
	b=OJXZiZxMp2VJ2drHlBi7i60bX4xRWqpimtbpD03A69rL+OTwspuwhX8oL2HfNsquG3Ty
	 Aj50dTYIUgxPX3AYVnRdkdETKbdpKrLurhqOY3v+sNpNcPdp8tPJpnMfXP73ZhoZ3WTNm
	 0s3B4k/Skc7Cg/wao8xGLNPP8LUxwopMIsxZTuA5HCECjU2hG5mFNnGvuWS/dbjYyqKI5
	 9/6u1wkWcK4xsRllofIKYCQha+yRUgSWxNVQus056e7xFn5hgZyf6CVBz2fjcf5iz7oW3
	 JE9a+2VW4pwrbMLS4ANREGTlm3X7pSNKb1ermoK6AtzKd6K4K4Ikl5n7kBjikB9VsWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PfmhL7my;
	arc=none smtp.remote-ip=209.85.214.199
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D6D5606A32C
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 21:55:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7D6D5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=PfmhL7my
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ea71803effso1715805ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 14:55:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792706144; x=1793310944; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=d2GP3/xMpsIH5cpcG4RPrAfL3ezbI3nXC8h1MMuuxmQ=;
        b=PfmhL7my2/tDj3qFFfdnQxBqCW8Fa+qNkCwDcxFtndharXdZcUtwwR1WNJdCNFn/XG
         fhhP4dtvarNcX+Q75XwT5SQZfgSeRbHayyis8gfU4KdLFvgAzI5034xE83DapJWB/KJH
         yTt+3pTiAp8/p+OlAVqONmeJAupORG46NGYD2oFxTuHDkkxwYhLHwMG7hPQ9LgirF6Ud
         1vrB9PxagWTaZlkVPERIgIMgw/4iHSZw2L4idi/EqUe/4x4Qp3FD4aBLTSjMolUsIRcc
         /UWKGSVZgchiWjC4jIrU+ZnTkKv7O/vt2i/rDSaST/CKMKWqgPb5vqnUTaFhJJd6ODKy
         QEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706144; x=1793310944;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2GP3/xMpsIH5cpcG4RPrAfL3ezbI3nXC8h1MMuuxmQ=;
        b=Ha8o4NogGmEfP0S7L1Aci81P0/umU/+YI+OIq0AeOanc1zo58Nf5uuZIrbfvikHWX7
         Cobx4AP6J6D2SVZVsb4rRYcPDZ/t5mlBhbp/MjYZhuqPtXGIzr1zrB9ZWreIuAtwY8Gp
         mMUPd/O41lBL9z+QF9NuBpDbFNGTkzXOG77DbP1uWvUpr1asB+MtchStfV5Cs06usy50
         JTp/wZaTyIcoCcPZjVrQD4oMHLoApzOmNSoT98Zc5PtuX4LxmndmhhB5y/CY8yIPzhZp
         FRSwpuct1hCnlrAF3N/5nvDHKStyPrpRTXLoZUFWSm5qXoL+t/PGcArnhx0SUOJi34yt
         X0AA==
X-Forwarded-Encrypted: i=1; AKwUvBxSfSiMxZBcqdxesFhS3SVnPnC7hclRGVhL1JAm5xduen2FbdsOGdWsGi3lxd2EPS69sgn4CjinFZWrTCo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIx0sTmH3Yrdp1m48uH4f/grQ3wygmnHVOeLWSO/I/lzAwgCIvz
	KrZZZcuxMmjmAVkUNZb+kCtUwVUUXkNrnKNlrntl9dFvlBgT7q8jlBMpsft2aDngpIZFuIsSALd
	QXDBbzQ==
X-Received: from plxj18.prod.google.com ([2002:a17:902:da92:b0:2e8:43aa:1e5e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:19c5:b0:2e9:4e83:1979
 with SMTP id d9443c01a7336-2ea7cfffac2mr3985975ad.32.1792706143685; Thu, 22
 Oct 2026 14:55:43 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 22 Oct 2026 14:55:40 -0700
In-Reply-To: <20261022215541.631694-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022215541.631694-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261022215541.631694-2-seanjc@google.com>
Subject: [PATCH 1/2] KVM: x86: Convert WARN_ON(preemptible()) to lockdep assertion
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
2.56.0.257.gf7497c7d27-goog

