Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395284;
	b=LhX5cCMkpuKRRRLawQV2A/JKGDyzcJ6pTITBUlwt0orlaS7ehTLS5NaK2tmTznM/iSes
	 kqMWZCVJ5VQjCSh9gJQE8d0QONxkXmqBQIsPHA2s2K3oIS/6p2qQhRj73L1CLNon6iWoz
	 SCpEqO1/K4a7sC8RpR9BDMHiK2X0IFFKbbnoU1wK2WmH3noNLV37VdjdmQLEjankwDFVZ
	 UCdMVRp9khU27X+nGAq1SlfvPLwGqP5ED/QCT4vWCRhBcHoY1V2SuMLCDfxU64xLrz+A4
	 OFH8DhjdV3gSM5KRJtpzZfsKheesMrXPsqvrw23CBCFsvzB7qAwtVQ3Pgcg+fwKVxrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=mm/jFK6aaegQ9pZQ54m0VqIEuYvDOfyBcHCegw/+L/s=;
	b=Z1rM657HbVXySavlxDX8nlQNmrbLBbcl/XgGMwLxWDWckUP4Y9Hw+5jd17uprFKZJU1x
	 YGkwMJWnN/cPwt4zz2L9hNdK1u+89UPLYUBEFn0NcSPfdV2/UaQLu17hIfgHki/uxlsOI
	 9FMtmF9xr7a1+1xpBHQWqlA/EhSCcdxZ5VJnY//0m7A55vx+eR4+7gkD41BxHy9d9zjnE
	 jXBFQkbIF+ZUzf/lUJwi7m+y/EKp+ousrzS1h+NFM7/+wZsHWrWgt//KgOcnm4O8D2+VR
	 1m7AxQjjv+coDNTS847MzSg/nvNDxNtudmQ0I3G+pFaS4YOnCDb92R8a8luqviui/IQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l5dhk49t;
	arc=none smtp.remote-ip=209.85.216.69
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096F360A6F6A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 096F360A6F6A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l5dhk49t
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad30487d55so1692187a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395283; x=1794000083; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mm/jFK6aaegQ9pZQ54m0VqIEuYvDOfyBcHCegw/+L/s=;
        b=l5dhk49tz7IPRF9MgE7g5hlUj6Sr6EPjTNnlBYJDyQnb1HIuepAb1WI4EHVaDbheHz
         c0HD8mh0EuxU8KV9SOiPBVWWUh2Ty8DnYdCPZQARqpDnbgoV8WjZmPyyKAsq6sFJ5SwB
         AE3EbDq/C60SE5yu9jqQWI5QWOSJK4w5WCrPPfnprHbJaJDVSDGyp00vkVqdM8ohniJO
         asURtUfA2rb1y1IBnZCGidmSidHuS9Ct6MZu9yhf9i6ul/rNeu1W4shj/luoHHdslrVW
         o5pY3GAh+ZwplNAmwgCRngYgbNkaST3XSG8wRjj2Hexoir0J8d5VthCyXsPWjbH+I/NZ
         0Q+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395283; x=1794000083;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mm/jFK6aaegQ9pZQ54m0VqIEuYvDOfyBcHCegw/+L/s=;
        b=QJyOcWboFSq0PSNeA1M1wT7iGH/1axiSUrQb6nCdjpSgP+T+0ldaEbFFOmODbQstFA
         kgGUoTzKY8OazTXpxY3qKt+XbzRmKf8FdKVIwbYfNwp/FY9+4SJkBQYKl75uXZhLeZ95
         Z5ZCBbEV/Lbds2ZscGSXoXyBRbfYESZg8D+Z6iMO5bBk3pT5kqZWKOCwiNuOoUjUge4a
         MMkCNGf5M576DwYUx65vhD5Xrm9fzYJxqbJ6jNHheuYxUcvtVVkX0LOO8xhyssOcEIFQ
         5+rL0dfFzmvm5pdhikCYE68Te1EDsZQ7uYO6tarMN1L9pLGsIilsJcgFU3rbtB+nV9Ys
         XTMw==
X-Forwarded-Encrypted: i=1; AKwUvBwQdHIIrO/J6es0Drf1GxJIgadm8OvFN/z4uwbO+eVCkcmlgAY60lt5vJ0coY29UKfGp67occfWD0TLFiM=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx/tqB3aysSwPsfOGrIpqu36jXdiB8kHyDy88gozZhQKC2JV0F
	DIaz+Nf/K+Q+/Cgu2odF+VB3/Zo6VpodEkCQhrVjrJ6k+rCdw+qSJr+vfgxc6VSOd/oQuYWBWYE
	E6AAhuQ==
X-Received: from pgo14.prod.google.com ([2002:a63:e4e:0:b0:cd6:aee6:763e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1cc5:b0:3a0:bbd8:5ba7
 with SMTP id 98e67ed59e1d1-3ae89879e16mr3031014a91.62.1793395283274; Fri, 30
 Oct 2026 14:21:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:20:56 -0700
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
Message-ID: <20261030212112.2598640-9-seanjc@google.com>
Subject: [PATCH v4 08/23] KVM: x86: Process all address spaces when deleting
 internal memslot
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Process all address spaces when deleting a KVM-internal memslot, i.e. try
to delete the SMM memslot (if SMM is enabled) even if there is no non-SMM
memslot.  This will allow retrying deletion when inhibiting the APIC access
page (the only scenario where KVM deletes memslots while the VM is alive).

Fixes: 9da0e4d5ac96 ("KVM: x86: work on all available address spaces")
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/x86.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 326f8a9a5d18..0b94f981a2e1 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -10011,6 +10011,9 @@ static int x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
 {
 	struct kvm_userspace_memory_region2 m;
 
+	if (!size && !id_to_memslot(__kvm_memslots(kvm, as_id), id))
+		return 0;
+
 	m.slot = id | (as_id << 16);
 	m.flags = 0;
 	m.guest_phys_addr = gpa;
@@ -10044,8 +10047,6 @@ static int x86_set_internal_memslot(struct kvm *kvm, int id, int as_id,
 void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 				      u32 size)
 {
-	struct kvm_memslots *slots = kvm_memslots(kvm);
-	struct kvm_memory_slot *slot;
 	unsigned long hva;
 	int i, r;
 
@@ -10054,11 +10055,10 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 	if (WARN_ON(id >= KVM_MEM_SLOTS_NUM))
 		return ERR_PTR_USR(-EINVAL);
 
-	slot = id_to_memslot(slots, id);
+	if (size && id_to_memslot(kvm_memslots(kvm), id))
+		return ERR_PTR_USR(-EEXIST);
+
 	if (size) {
-		if (slot)
-			return ERR_PTR_USR(-EEXIST);
-
 		/*
 		 * MAP_SHARED to prevent internal slot pages from being moved
 		 * by fork()/COW.
@@ -10068,9 +10068,6 @@ void __user * __x86_set_memory_region(struct kvm *kvm, int id, gpa_t gpa,
 		if (IS_ERR_VALUE(hva))
 			return (void __user *)hva;
 	} else {
-		if (!slot)
-			return NULL;
-
 		hva = 0;
 	}
 
-- 
2.56.0.385.gac671c819a-goog

