Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A23344A3D26
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790886184; cv=none; b=IvXGsn1lcY728sxQP5E3y5y3evtIs+ZoNowwxQQyY8+2SqI2k3mSIRkdyknSVlGtmWG+WlCXnFOS2GomB0cO+ky3/tmxIDb6vdhlaK78qgEBZ4Uet32fBNyyjWuYOE5PmYia4oEDpnYBAB/siAz8Asv/7HChHdcBNPvDisno3K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790886184; c=relaxed/simple;
	bh=94w04WZ7lwMXzxrq2sSJ/XOAEZrRC428cukBXZZaviE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Iw9DisoblYf7eChx+6R+RbYrpzc8ky9X4TXUWk1caHnoC0sM6v49j8+X5af2t4Drewm49PH7viKFpRUBit8q75D6LDy5XZWs32LR5iiOmLE1DIf6ddhUV3F9qPEU9MBvMun+7GvBYXD4PY1/JdxRNF+pMujkSfiZ2WiionUPAhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F9JKJkgY; arc=none smtp.client-ip=209.85.214.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F9JKJkgY"
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d9057fab9eso73704665ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 13:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790886175; x=1791490975; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Jbjl3neiE/IIwhYOUwKWLxnN0Mu5SRuRPO+LEk/x8go=;
        b=F9JKJkgYRY20ZKgDx8hxZhtp9gHl3kEEYuEoB46ncptkmISNACEJAgF17kzMOFATQw
         3ozMC7l4IMeVuuVnMLo5eiydPHWn2VKq1EIIUaadCKUoF/uFzGkipztnhROSp1otg8dW
         a9gHXO2FZxjxDbH9MoOPqYxVClZw4Dn3JIXY1kb++sOJfE9ntDS4dzzV8yf5eCSV8prS
         00ahuR00KTJ0u/8IYrtAVdvzzbufuz+ueyr6bQxBm+J+JR8CTu93dgL6QXaRKaAt6RNb
         hdXC1f7JjKfbiWN5Np5v0JKi9AmdyN8mBu4kmR5Qedq7t3KfOLbx1sLLqpcNPF1IdaZM
         3EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790886175; x=1791490975;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jbjl3neiE/IIwhYOUwKWLxnN0Mu5SRuRPO+LEk/x8go=;
        b=FKNvqXf4DSvnqFWc2ya/aAyMHtRQXazrt++uBbvq+L9Pr21moyidnlKMAejkSGDszo
         FgGJaZOdiLPJSbvewEELrhQK9RXL5K2yzVmLTWM9qj8ou4a+bn2Qt6mXXlxl/CLOxXAx
         pMUV39HHecSKD6wJetwWF9lmuVr+fttu3WFOygjFwPWSWB5ZfYz+XUhTCJeni8PZ4c/Q
         apDYXE7LVm4yrOKhCMO6/ABn6eUZfcsATjyQhPoN4rwq592X86JS7Ovzut/EczNdnxu2
         dGQq6Ij4Hjhdt7ctAkQf0iZaxVs8lemnbtMWWuydXeIIdmST4ACpArRBg1E8e1KYT0wi
         xtkA==
X-Forwarded-Encrypted: i=1; AKwUvBzWD+jzZ6gi16NCJdTUMNeG3M6d9xLcDrx2We5P32ButtkU9EDPSxyR23vWPdasE5B8/gI6EDfA99rrGe0=@vger.kernel.org
X-Gm-Message-State: AFuF++l/NuCheyo6ysfOLxII/Ykmaa7rbbZcyvyZ1W/Yfl0EegcXRQ1F
	pAxKbG8SNyBnZ7MWBEYk0jI0uAGZCKR/lp5Nolg3TWmlU/0UxSCol1Rl7r/d5AcgQNX0E4x4IKO
	bRuPwKA==
X-Received: from plw11.prod.google.com ([2002:a17:903:45cb:b0:2dd:288d:db3b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d50b:b0:2e4:9081:79e9
 with SMTP id d9443c01a7336-2e49b67302emr5360305ad.37.1790886174487; Thu, 01
 Oct 2026 13:22:54 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  1 Oct 2026 13:22:34 -0700
In-Reply-To: <20261001202234.3794060-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20261001202234.3794060-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261001202234.3794060-11-seanjc@google.com>
Subject: [PATCH v2 10/10] KVM: Pre-check uaccesses in KVM's APIs to read/write
 guest memory
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a check on whether or not doing a user access is ok in KVM's APIs for
accessing guest memory, *before* doing memslot lookup/validation, so that
buggy KVM accesses to guest memory more likely to fail noisily.  Because
KVM installs dummy/empty memslots early in VM destruction, bugs in the VM
teardown path will fail on the memslot checks without getting to the WARNs
buried in kvm_copy_{to,from}_user() and friends.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 770a2c3bd445..80b19d47840b 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3211,6 +3211,11 @@ static int next_segment(unsigned long len, int offset)
 		return len;
 }
 
+static bool kvm_is_guest_access_ok(struct kvm *kvm, int offset, int len, int size)
+{
+	return kvm_can_do_uaccess(kvm) && !WARN_ON_ONCE(offset + len > PAGE_SIZE);
+}
+
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
 static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
 				 gfn_t gfn, void *data, int offset, int len)
@@ -3218,7 +3223,7 @@ static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
@@ -3294,7 +3299,7 @@ static int __kvm_read_guest_atomic(struct kvm *kvm, struct kvm_memory_slot *slot
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
@@ -3327,7 +3332,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot(memslot, gfn);
@@ -3457,7 +3462,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	int r;
 	gpa_t gpa = ghc->gpa + offset;
 
-	if (WARN_ON_ONCE(len + offset > ghc->len))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
 		return -EINVAL;
 
 	if (slots->generation != ghc->generation) {
@@ -3495,7 +3500,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	int r;
 	gpa_t gpa = ghc->gpa + offset;
 
-	if (WARN_ON_ONCE(len + offset > ghc->len))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
 		return -EINVAL;
 
 	if (slots->generation != ghc->generation) {
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

