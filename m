Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395298;
	b=2GH0fcdosrZQbOWFATjdBlRxEr1ouhQcCfvvgr3HsGxDI8agMd/3NT4M2tFWGaGQBoJp
	 7eOLqDAw+qTht1k5RkW+m2MBYa//o9shwmOTIY7ZbZCQAT1KWVYDAtiXEPWZNi0J55lqS
	 Z76goBTm3UN0+0f/5habIYIrZEDH14Wr+kJb/V+5qw+xTM+gDob1rMrjIDpnfBpgtbb8f
	 ToZn8os4qssdtUEyYuPfu6HFxjJElADPruJVX12bKMDSh8U06f/GLXRBlEcUlx7kSDPRI
	 ErhiC2e1pdqQi7nl1zBH9XtGb4TRTfQ79E7rFohz7fFadXlmk6SyCmZrQVC7eFfrWQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395298;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=1RT2Hwd4eS7iM21uuSoBg92EWPQROZNPCWfD+pi67rE=;
	b=MBiEmSf1bgFp1oZBqdfgIXUsHbE/R02Ykewmr/6yDlNQEMsYUXrwxVp+P4AczRJDVapy
	 P2K/sfWtFUUMxEltBFN9KfK+il/gS/I4gJZquJbB9blDzav525Xff3welNavjDambo1DL
	 i9E6E/ksMBZ8PHTnz2Egn33kUsFAiccsA/cST9dHL8HCzuWXj8dGdUTyVTQhtysOPvvrf
	 OYyvMjeXkBuce/mNaN9MAnXSFUaOdYmmvUXR5rign1EFaOVMXKEMeiy1xqKZMzZQySZ5e
	 6s9oHKmYKPFFui7dx+8qR4DtviEaEgcPg/lNfBlObuMM2tJl3BPZ4gaYKnxLpJWBSrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JHU8bw99;
	arc=none smtp.remote-ip=209.85.215.198
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1129606D978
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1129606D978
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JHU8bw99
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc7d2ff0087so723591a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395297; x=1794000097; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1RT2Hwd4eS7iM21uuSoBg92EWPQROZNPCWfD+pi67rE=;
        b=JHU8bw99jkDLUan3RvNhDUnkKZLez9b+K1OF4RAMln0B/bcLZvdoriO/l4V6D2WHQh
         uzTzk7b2xtfTa5qLr1cmcfQ3uWgvlrk1p2zkhwVY6egDsIZ3Njtnl4Ciwa2SnlK+3yX4
         KyWPQImBC1GUqClJ7WI5jCwNZV0NLvqWvAQRR5REutFPFrvHmgX59LUz+MQHrdjsq8rH
         soaYz84Z/klMh/VVs7ih+WyU6n8AOaSuHB/prqMbejwai7rfsK2kiY+uQxLPrwG7hmIB
         vREezuGa+Q6ZLdm8uYYIJquF0MW/zddaOfnp5vSh32N6NDVLs04sBRU3DsMC68ajxDTT
         xacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395297; x=1794000097;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1RT2Hwd4eS7iM21uuSoBg92EWPQROZNPCWfD+pi67rE=;
        b=lzCFLW1g9NJs14AshD9I+b6GwIxRQ7TSVBr/9VAbunh15oXlXOzNaCGzY+CXqigV//
         /Inb2Q3WCPN6J1B0ozH/FtHx7fXlt/dSe69SMWgjLaIil6p+zIuTDbix1pDoAdQgkUrg
         oa5Mz5qXs8sbH50wt9uuK7dfn19iJFb/jtSHF6X16AOaL1+6943q8WBzfyNtDcdSAcWw
         xJ713XQbiwtMjUYIXNA7CW5YNtFkv6Uwx6NL0/sQpkc3oaRDvXX8VD6ST4em17S9e8gn
         /GRlF1Q/axuYqlOMOEQ6NwvBABBqoQh4aacJxrYPYJtKUYbUHUQa/UilBbHeuTSmF+e7
         Cmqg==
X-Forwarded-Encrypted: i=1; AKwUvBzNp6QtG+L911eX8B3bPGx3KEgxS4bTr6sfPwiSMrjf4qPYD4Ekj8DLnSXVha5yzywWgbnUTIbhwZ5kX64=@vger.kernel.org
X-Gm-Message-State: AFq9FYJLt7bi0qQJ709NORHTzfknLsFGJKKvapI5KkZAARJxLV4P7yCz
	+hLC3PN0mFneQOcedQuU3E2ZQ0ny0VHlRyXCtEkgDfKBZVbLGvcmjt31ZBIlYXqI79Coz7kSOkW
	r9lSS5Q==
X-Received: from pjrm17.prod.google.com ([2002:a17:90a:b791:b0:3a8:6a28:2f71])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:264c:b0:3a7:d2b5:2e99
 with SMTP id 98e67ed59e1d1-3ae8970fd76mr2702613a91.20.1793395296953; Fri, 30
 Oct 2026 14:21:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:07 -0700
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
Message-ID: <20261030212112.2598640-20-seanjc@google.com>
Subject: [PATCH v4 19/23] KVM: Add lockdep-only APIs to query and assert that
 a vCPU is unreachable
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Add an APIs to assert that a vCPU is unreachable, along with a helper to
deduplicate the "is unreachable" logic with the existing "assert the vCPU
is locked or unreachable".  The new assert API will be used by VMX to
ensure a not-so-innocuous vCPU teardown helper is really only used when
the vCPU is unreachable and being destroyed.

Disallow using the query API without lockdep to prevent it from being used
to make control-flow decisions in KVM.  Taking different actions based on
whether or not a vCPU is reachable isn't fundamentally broken, but would
all but guarantee other code _is_ flawed and/or brittle, e.g. that unwind
error code relies on common functionality to behave differently.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/kvm_host.h | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index ba8ea62b7304..28a0c01d6a55 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -984,11 +984,26 @@ static inline struct kvm_io_bus *kvm_get_bus(struct kvm *kvm, enum kvm_bus idx)
 					 lockdep_is_held(&kvm->slots_lock));
 }
 
+static inline bool kvm_is_vcpu_unreachable(struct kvm_vcpu *vcpu)
+{
+	/*
+	 * There is no actual dependency on lockdep, but generally speaking KVM
+	 * shouldn't be making runtime decisions based on whether or not a vCPU
+	 * is reachable.
+	 */
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_LOCKDEP));
+	return vcpu->vcpu_idx < 0 || !refcount_read(&vcpu->kvm->users_count);
+}
+
+static inline void kvm_lockdep_assert_vcpu_is_unreachable(struct kvm_vcpu *vcpu)
+{
+	lockdep_assert_once(kvm_is_vcpu_unreachable(vcpu));
+}
+
 static inline void kvm_lockdep_assert_vcpu_is_locked_or_unreachable(struct kvm_vcpu *vcpu)
 {
 	lockdep_assert_once(lockdep_is_held(&vcpu->mutex) ||
-			    vcpu->vcpu_idx < 0 ||
-			    !refcount_read(&vcpu->kvm->users_count));
+			    kvm_is_vcpu_unreachable(vcpu));
 }
 
 static inline struct kvm_vcpu *kvm_get_vcpu(struct kvm *kvm, int i)
-- 
2.56.0.385.gac671c819a-goog

