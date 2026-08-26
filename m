Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A13147988C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787762554; cv=none; b=IuxTJ0n9mAJC6UHhx9Y3axiiFxDV4pGdfaQ4CHScBBMr1urrlZQbdodhCcWKak9mggweM8bBzuVwzfcsoIG9PvcLa4bUdMIhR9N642/wyOzAxQS3iSX4cxz2Z4wYZsVz1cYoZtFUCpIEQxlFdkgF0t91oaZeiSKHikzRZzME/4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787762554; c=relaxed/simple;
	bh=N3KhGuurOfNAdflb4lT6TlTE27zh2L+SziWwZzTsYoY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=WO8aBOXWhr720z4CCnxfhxsyiHx73VAKZSqZKAjRlR+h17WwNKLKSbREdxHS+j3urACuJbp09NzjYYoYE4+WKgU/h4hwM7KLAIap93U0nGuYGv+SZHdbFGhPAbhC3YV2RtaiGKK8PCnpGmWqGHofVAX2BFGtUDqRfpSjCHqy8hM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hV4FhYtr; arc=none smtp.client-ip=209.85.215.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hV4FhYtr"
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso856667a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787762540; x=1788367340; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=T9ggCE2s4lQUcVzu7FyWkmkWQene3zbgM9NYxUP0czg=;
        b=hV4FhYtrVsqpYlqspNSJ66iqkGEbPoQyqTF4n6VQx9xW490UO/LLkay7j2Gt7x5hzy
         7emkWgHDgGAJkupB0FNNMWSrJ9JQ37CkDZnnuO85308h2E7wD5SkBh8a71XMwWKVqbgs
         txTDshkMUgywBxKQqo4j1qg/ldAtXtFK60ZleQxBLlw6uhG/L8rP32a1NxdkDLCcfCd5
         1l6XcOxOn5esGWTblmW70lZb+xDILNTNRBhjrjc8gC5Nhj+AJXoHDftawRJrdPeT3+IN
         RXi6prRs+15dCTXYCIRPzocc5dQCiuM2nHQy8uGoYkUA8XKbMPx42lwgv0eceAE8Uodd
         cL5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787762540; x=1788367340;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T9ggCE2s4lQUcVzu7FyWkmkWQene3zbgM9NYxUP0czg=;
        b=bh1rAP2S/MK2lC7mM5wmXEjOyQwsxPVtAUFhXht0VZcPqgpA8Zz8hO+4LBNR+Dy1dh
         Tkh1TVyiYYxHBWC/S0hOSdXrGOGkKWvInZWGmRNlcSk+++5cJDIRlwCkoGpiyhvfTxlv
         GuP3BKw11JZzf0tYp+dyXPmqj6OafGEQYjRPc1y48oMrjRyv+fnxAY3oMAheXSumOK7K
         W+gPhxSAoPtJ+TGwq6WiSiYnAy47+0a8UurxArK1lkJw1licehZz305fDfpbg9lNs9Tm
         zf2pQ6Pz4hx85ese7fGlvl4HIdVppA9dnUdGvboy38nxmU7Fg82tZR+IYrda4vv0Z0fs
         sslg==
X-Forwarded-Encrypted: i=1; AHgh+RpMEJpeHmUXnmbHiVbYwhSOrp7zTsDRmaZ8dm9N55IisjiDSAi0sfXQk1NCSwdV38AhB5QXqD+YOc8x+lk=@vger.kernel.org
X-Gm-Message-State: AFuF++lQWPfD3JmA8Ehl3NHqvyiqTRDxFfTGEwyQc+dvNFm2hvOFT4bA
	FJkA1D9iasaQ838Askt+Wqb7j8W++kJ1QxLi8GWDWDOvnIonq+dCTavCoCaQWzAinklsRdyg6H0
	l8gzThA==
X-Received: from pgbct7.prod.google.com ([2002:a05:6a02:2107:b0:cc1:d48e:146c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:e210:b0:3bf:63af:855
 with SMTP id adf61e73a8af0-3cf762865fcmr14724358637.1.1787762539550; Wed, 26
 Aug 2026 09:42:19 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 09:42:13 -0700
In-Reply-To: <20260826164214.756512-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826164214.756512-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260826164214.756512-4-seanjc@google.com>
Subject: [PATCH v2 3/4] KVM: x86/mmu: Top-up memory caches when retrying "map
 private PFN"
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Yan Zhao <yan.y.zhao@intel.com>, Sashiko Bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"

When mapping a private PFN in TDX's post-populate callback, top-up the
memory caches on every attempt to map the PFN to harden against bugs in the
map flow that could consume cache entries even if mapping ultimately fails.
E.g. as pointed out by Sashiko, the in-progress Dynamic PAMT support could
consume PAMT cache entries on TDX-Module lock contention.

Harden KVM even though consuming an entry on failure is considered a KVM
bug.  Retry should only be encountered if KVM is buggy (the locks held by
the sole call path will prevent retries from being needed due to
TDX-specific details, and memory can be faulted in only once the VM is
TD_STATE_RUNNABLE, and KVM_TDX_INIT_MEM_REGION is only usable if the VM is
*not* TD_STATE_RUNNABLE), top-up is "free" if there's no work to be done,
and populating a TDX guest's memory is a slow path, i.e. there's no
meaningful downside to the hardening.

Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260718061050.E17B01F000E9@smtp.kernel.org
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1969c26861e5..19a501029f08 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5209,10 +5209,6 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 	if (kvm_gfn_is_write_tracked(kvm, fault.slot, fault.gfn))
 		return -EPERM;
 
-	r = mmu_topup_memory_caches(vcpu, false);
-	if (r)
-		return r;
-
 	do {
 		if (signal_pending(current))
 			return -EINTR;
@@ -5224,6 +5220,10 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 		if (r)
 			return r;
 
+		r = mmu_topup_memory_caches(vcpu, false);
+		if (r)
+			return r;
+
 		cond_resched();
 
 		guard(read_lock)(&kvm->mmu_lock);
-- 
2.55.0.860.g4b6b3295ed-goog

