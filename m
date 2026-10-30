Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395285;
	b=dT52onP8dmOKcHIxWISjpXzMmh64A//+irpEgrD3tL9UNkyTAWhpiXwpBdukaHCebee0
	 kLZ0abnJjnOw9EjJ+5lZSoaqgW6caEaGQCAlUtO3OpjWuNPgumg93cBtLj25HEQC3CdYF
	 feID1kQ3OWECA/LSSraXHlUopRr5aiEdDKMPFahSgdy92Zeuq3WZjApTwsdbwiLX3TYzR
	 7h1Yyoj4aUEjTSr6rcQ2rqPct7Fb0AmjGekD0Hga1YYuHOez/zbX8vkciLVfGYWWqhtSG
	 gM4pY8WCrttiWR/FE0riu6kGtOYKH+o7bo72pT2SbGQn100/pghu7EMrJZ2gJBFpliA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395285;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=4FBcwwQefjg5U9pbFhBbpj/PcCf2fiNl2oUBEHVQucg=;
	b=TrmfjTnsMyiS5Ki2NfE72yOTaPmAo98ck+Lm29tcsX68dkuOajyjdI+0PjjP4Sqd7PgE
	 PRg5l3f0tEeLeMpJQEvlbWUvnatnzcj53ara3Jh88Igd/TL9gb0JQnoJLSOTjOoIV3hYf
	 ZvMb9x0nusjjfjh0/CghzZx2sFxVOdqUH8Jw3+7U5UibU4XSctmw6CWWmzl9v4pCmzPWk
	 WO7pxgOYXuhJurtN53HM0u1VauC7t3ZJWgyNrbCGPMJVI7usabNK2ak127JvNHaRYFKcV
	 nakhg7EI/5hlZqynRnhBCTAavtlt/fsIZojnFLCJnmd4m+FKePTOOxQSNlt8I017AfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+UDukdI;
	arc=none smtp.remote-ip=209.85.216.71
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5317760A6F7E
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5317760A6F7E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=G+UDukdI
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1692396a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395285; x=1794000085; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4FBcwwQefjg5U9pbFhBbpj/PcCf2fiNl2oUBEHVQucg=;
        b=G+UDukdIeED2uRXFxXeqbYF3PMScrlAvnfagXfyLr1WfwJUDVJBTNyzDjvbjL9yags
         nB70KHAsMhV6OL0kqYE3CZ27nBvHLtnMRl9Pa9TIfTJmdrk5B9CtLPbS/403yWo8dWQv
         fPqYdQsWlr/Npsm9PRVgE42HyJJNoMOLTrAQIu1Hi8WOUp6vVqFXzoCF5NLS07HgJHMU
         swOeZkvW60U0vHyoSMEruvjH8ISumlVdjEkbe2OkecIEvOQsDs9ewk2/TVWHNe5KmE8U
         H/8Zih2cCkgjIjR0HPJ4PIp+hiLdLBO1Zhrld7jU+rh/vH/5PLTkhIfMP/9yi6UMSfj0
         Cu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395285; x=1794000085;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4FBcwwQefjg5U9pbFhBbpj/PcCf2fiNl2oUBEHVQucg=;
        b=ty9VhsuurBKWmC6u17p0YjukeGLBk0cNEkwjej5JuvekOPJ9s1Kdt5+YP24cxJbrc/
         hKaHjGeXCdgglNs5bTkyGS+1VB5cvrwIu5GoPmEV/5WC9LOdOCeeKgdIPEIZ41tnmvHQ
         yGHsiUHkaFIdYVNDurS4K2xUADjATP/aWVAyNXSnuQW4HAnjeuIt7HntFm88dlQR4sk/
         j61w50I51IJSPha8ql5B5DKOFPvBVp3IopOJrYNEHiwAiFXW6XAfxc+apPrCfszBI6Yn
         4pWTz1L8Tc6sLT0EyMGNQc16ntiSNE+mLvpDnw4iIOSpeBI1uMbXbz8yRzghe6Jyupwt
         lGXA==
X-Forwarded-Encrypted: i=1; AKwUvBw2cWJY5S7kEAvrH24eRqLTAx824NxKPn7cic/4E2LtWFrGI+y5DKr9UQ15fdmHu86fHpdv7TJwZcxJU7k=@vger.kernel.org
X-Gm-Message-State: AFq9FYLYZVF4Sun7tj2A2mSfrt+akjmRSvVNVJjWahn1mG7kgIE66Z8f
	0G8oNGyyEjHsdOY1llpXKlJufdDzQDu8DCEgW1wpZAPFQpCEfv9izqrcmM9NtCmgKoK7RFS0uWG
	ixEuyKw==
X-Received: from pjry9.prod.google.com ([2002:a17:90a:bd09:b0:3ab:d09d:a37a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3b44:b0:3ac:74b3:a8f3
 with SMTP id 98e67ed59e1d1-3ae8983b590mr3022604a91.44.1793395284519; Fri, 30
 Oct 2026 14:21:24 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:57 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-10-seanjc@google.com>
Subject: [PATCH v4 09/23] KVM: x86: Re-queue APICv update request if
 inhibiting APIC access page fails
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Re-queue an APICv update request if deleting the APIC access page memslot
fails when trying to (permanently) inhibit the APIC access page.  Sadly,
memslot deletion requires a memory allocation and so can fail even if KVM
does everything right.

Fixes: 2008fab34530 ("KVM: x86: Inhibit APIC memslot if x2APIC and AVIC are enabled")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/lapic.c | 38 ++++++++++++++++++++++----------------
 1 file changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/x86/kvm/lapic.c b/arch/x86/kvm/lapic.c
index ecf611845fb1..c20e2a25834f 100644
--- a/arch/x86/kvm/lapic.c
+++ b/arch/x86/kvm/lapic.c
@@ -2931,6 +2931,7 @@ EXPORT_SYMBOL_FOR_KVM_INTERNAL(kvm_alloc_apic_access_page);
 void kvm_inhibit_apic_access_page(struct kvm_vcpu *vcpu)
 {
 	struct kvm *kvm = vcpu->kvm;
+	void __user *p;
 
 	if (!kvm->arch.apic_access_memslot_enabled)
 		return;
@@ -2939,25 +2940,30 @@ void kvm_inhibit_apic_access_page(struct kvm_vcpu *vcpu)
 
 	mutex_lock(&kvm->slots_lock);
 
-	if (kvm->arch.apic_access_memslot_enabled) {
-		__x86_set_memory_region(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT, 0, 0);
-		/*
-		 * Clear "enabled" after the memslot is deleted so that a
-		 * different vCPU doesn't get a false negative when checking
-		 * the flag out of slots_lock.  No additional memory barrier is
-		 * needed as modifying memslots requires waiting other vCPUs to
-		 * drop SRCU (see above), and false positives are ok as the
-		 * flag is rechecked after acquiring slots_lock.
-		 */
-		kvm->arch.apic_access_memslot_enabled = false;
+	if (!kvm->arch.apic_access_memslot_enabled)
+		goto out;
 
-		/*
-		 * Mark the memslot as inhibited to prevent reallocating the
-		 * memslot during vCPU creation, e.g. if a vCPU is hotplugged.
-		 */
-		kvm->arch.apic_access_memslot_inhibited = true;
+	p = __x86_set_memory_region(kvm, APIC_ACCESS_PAGE_PRIVATE_MEMSLOT, 0, 0);
+	if (IS_ERR(p)) {
+		kvm_make_request(KVM_REQ_APICV_UPDATE, vcpu);
+		goto out;
 	}
 
+	/*
+	 * Clear "enabled" after the memslot is deleted so that a different vCPU
+	 * doesn't get a false negative when checking the flag out of slots_lock.
+	 * No additional memory barrier is needed as modifying memslots requires
+	 * waiting other vCPUs to drop SRCU (see above), and false positives are
+	 * ok as the flag is rechecked after acquiring slots_lock.
+	 */
+	kvm->arch.apic_access_memslot_enabled = false;
+
+	/*
+	 * Mark the memslot as inhibited to prevent reallocating the memslot
+	 * during vCPU creation, e.g. if a vCPU is hotplugged.
+	 */
+	kvm->arch.apic_access_memslot_inhibited = true;
+out:
 	mutex_unlock(&kvm->slots_lock);
 
 	kvm_vcpu_srcu_read_lock(vcpu);
-- 
2.56.0.385.gac671c819a-goog

