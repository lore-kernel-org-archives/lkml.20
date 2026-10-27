Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139136;
	b=FKR7fA0NIG9xgLzlmFIqz4Me3GSXX3e/6Z3bmTINjQdv3fjBXFOPUlXgva4Xr2s/TYxX
	 EXlFHT5IHLGdUC46lFbAcFGMIHYmMLcYcgWisSqYzz/ocfYlNeqrRTCBGnma8nL6hA3QN
	 f9wa0WU973RDYN6VGmpIpjZL7EXujn4xKZCh4TZXxHolYY1b4Wl+hULos8L6wKI3TnoFE
	 aBHvDe6GtoDNc2PvHInFXpCbguftgm0aAC9FfwPKYGtqYvuSHXqKn4NaJ3XxejRFYs90m
	 sQyS8r0ZSXjF6JAeCFCe1qpNoqTjQuU3TLOj8+mMl5fCkdTD9u3Oq2slyOwkTIich/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=GXFll2rwFr+11U65zmd4BD/o9D9qDEYJ5GKHj/mz+LA=;
	b=gFyjlOQJXbtYdYpgq+6LlV0QOw9slvPfXjygNz03qxpCaKVNE+/5FaOtBvVzZ6p4At6K
	 QKPLmDHCQ32KATussN4s9Bhq//n7JCFYA1beT+s+th5w0nIpH8Kp/c/BbmXKggtDD1n0E
	 Q6s8upWRJoUQlpMAfNFKCDzhrk3waVRgY+hBiIf9CQCwO3Yayoy+Zq5SbRwyocBUwdDfN
	 TevECi9Ta/yFRbpW+j3In06uFXeB+TfdRL/1+ius72FHGnxduVApM8D31LPNUY1HNpSLL
	 U5LPO450aWU4a0wPx6W/gsjZEqKeDIi0rxzyC4PebqQTKFDuqbbwJB6zEaYRPcIatkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N6l6Exp8;
	arc=none smtp.remote-ip=209.85.216.72
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FB0606A339
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8FB0606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=N6l6Exp8
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3adc5b185bfso342297a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139135; x=1793743935; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GXFll2rwFr+11U65zmd4BD/o9D9qDEYJ5GKHj/mz+LA=;
        b=N6l6Exp8j2Sb+gyuL9lMYXp6wSDrG9sZrgHXvFewgPl3/NhmhqeF1QX6W8XOFF1kIy
         2AF0AHImJ0mVnvCZT1/D4rs4D2KcKK3wUU2qgP2qVRsLN225J2MCB4ZT9kLJ3t6myMT2
         ZDp0UOWLBrYwowX1aXNfK5CNieC2lkbzUi8YApogmc82b+K55DfpBdb6E6gObX1KO/XG
         I2z+xJeEE5n2FbdnERHIEF3zQBOjC7YaZoyll8lZhAlJCPNv1f0pV78s7qkg9bfARs0V
         do9r908kAboJNQ3cA00KRbULlfqFO3o3qAUfGmRcxu/JLR/+xahdGDkCLDYzNZem//y5
         hN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139135; x=1793743935;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GXFll2rwFr+11U65zmd4BD/o9D9qDEYJ5GKHj/mz+LA=;
        b=pKehtGSlPS6sOgnrcDsb615XKE8tMqZ2W/L5u92BpmXJBUffEOExxUTUoOPUFaqheo
         i9IsECVdP0xjv/jX4r1BLlC4hY/Cx7r2UAKPc8IY5D8240j2aeo4bEeJN3KF9HFhcIk0
         3891Xy5vyxLzIOEf4BIRKW69EJKUdj8Abg6F0/NtY50B3nZGqNX5OKix8Kfukie6fF9O
         aNMDiMUPm7ScvgSOBq0B2hfI1caJP0TUcG+2CH95NqafASzGijiRW0CazJyOgoYO+KrN
         SZVaSYfnM1FbS+kuUjMRxZuZQ6Hn/EEOvns9bOQplm1syr42IjxVeloPN/X3eCHPUxOQ
         Cyng==
X-Forwarded-Encrypted: i=1; AKwUvBzZ2oyfGiPhh7yu0MGj1qVHUoNTP6g0H8Udr/nXd5JqRCh81dhAurrHCMeifCZkK2K1bLahOOV+rM1VCgI=@vger.kernel.org
X-Gm-Message-State: AFq9FYKxsCavnWDaUjXpqx58l2irAnho2R4eOK86kLSHxL/mxYkFxUnq
	g2Oj5jvLqy3Ti9S+kEpSNhgoOIGgIV1fiOA//L8kNiDAARk1LQdhPHI9z4s5LCye9Ty+WTGmnN7
	Ivh/L5Q==
X-Received: from pjtn20.prod.google.com ([2002:a17:90a:c694:b0:3ae:1810:840c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2645:b0:3ac:9d26:551d
 with SMTP id 98e67ed59e1d1-3ae58313b6dmr297261a91.50.1793139135013; Tue, 27
 Oct 2026 15:12:15 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:11:56 -0700
In-Reply-To: <20261027221209.1560865-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261027221209.1560865-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
Message-ID: <20261027221209.1560865-4-seanjc@google.com>
Subject: [PATCH v3 03/15] KVM: PPC: Flush/zap all memslots on kvm_arch_flush_shadow_all()
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Flush/zap every memslot in kvm_arch_flush_shadow_all(), i.e. when the
owning userspace process is exiting, as KVM must ensure all associated
memory is unmapped from the guest.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/powerpc/include/asm/kvm_host.h |  1 -
 arch/powerpc/kvm/powerpc.c          | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 708a32f89776..50a42f80e5f1 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -910,7 +910,6 @@ struct kvm_vcpu_arch {
 #define __KVM_HAVE_CREATE_DEVICE
 
 static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
-static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
 static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
 static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
 
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 9194cf492d1c..9e9d0865c2f6 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -764,6 +764,17 @@ void kvm_arch_commit_memory_region(struct kvm *kvm,
 	kvmppc_core_commit_memory_region(kvm, old, new, change);
 }
 
+void kvm_arch_flush_shadow_all(struct kvm *kvm)
+{
+	struct kvm_memory_slot *slot;
+	struct kvm_memslots *slots;
+	int bkt;
+
+	slots = kvm_memslots(kvm);
+	kvm_for_each_memslot(slot, bkt, slots)
+		kvmppc_core_flush_memslot(kvm, slot);
+}
+
 void kvm_arch_flush_shadow_memslot(struct kvm *kvm,
 				   struct kvm_memory_slot *slot)
 {
-- 
2.56.0.307.g5fe7bd680c-goog

