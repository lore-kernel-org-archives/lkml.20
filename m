Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793139154;
	b=kkEql7JeRWF+zRT2IUAZlBFEEPTQeKeiMSbhYN0Nn27rDF7+CZzVaDZ5cU8iCyw637Ft
	 2pCCeIrPa2ngDRvZdjc1mVOxYHm8C5imv4CTBvY5ZES/Y0y3+nFEVMRysJlAGkPuQei0r
	 FzRXS2CqGHtEznTNEajmvVWsusXY1o2yY6ogzr8SI6JjvjrggmGtv4zYubmNIc3YkYTEw
	 0iI8mAU2niZTll+imzrmBUp9vy3NdhHBCi9r08Nwy07RPMW6nLf0BOJB5f9Pp/pKcZR3+
	 FogQSC61UVgzPuobOrcyJJM8mYp9Q27Crh73Wb8aN02AROLjScIX+R5/JDduo28kC6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793139154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=h43t1HfpFYnqrCz4owPlG1Jkgt4xdvVHI5bkdA4UEfg=;
	b=d7IHD69o01nIfUxwTKE/EEdkaU9OF24KoJDXneqAToWxtEZIOiGd1Sbh8bO2L1TMmlJ3
	 IlpI3dAvRpyP/tcOSLGxrGCpTEEbptkwdctBCk/59Xijm2xt/DJoCOYobNOoRKCZIAn6S
	 uoV52UsV09ZTHrF1T59c0kotfeaRTORPXVrfxtcLQdnyrGoKELAAYIZJ5HMAYyyhgcYty
	 ZupA54jQscSq7LmGkBzUO82dHotAaYHJf3/18XJzts0ehVOgRk5teWUBOectsHhgzvHzk
	 Ax1KYwoLWFTc5x8NLUKo/jKDqUMpZEZ1xBN7fRBJWKt+4bmBnYz85ibtdvSQsPM0BBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEke+Vh4;
	arc=none smtp.remote-ip=209.85.215.197
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25CE260A3807
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 22:12:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25CE260A3807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BEke+Vh4
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd68b8579f2so160400a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 15:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793139143; x=1793743943; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=h43t1HfpFYnqrCz4owPlG1Jkgt4xdvVHI5bkdA4UEfg=;
        b=BEke+Vh4N3RjrReBMj5eRa+hIuswUKEehrHzZ4J6reI77JRP9sUF9TMj7kK30WtFV5
         OGux7Ia743PSnRfBulWb6QUM03Kc4wdzRD80Pb8uLxALD5yF87X/ro8ZY0MHjQTx0K2F
         md7g5qCGns95pv0P/PjMMAYx2lPwkaaSnq5eostK48etP4SqALnAbgGqxKPgjrxPetuA
         1gnLQNt5Cvoosrc1998q3sDtLRFBI6UlRTan80l4LsGBFpWpfDN4CKRMk2w+TH3D2i5S
         EgvIpLco/4FevCYAfTIG+ZZeqNiF6QazTfpTMel5nazlaE8huDRPaovgqqEKxgzezTfN
         RLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793139143; x=1793743943;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h43t1HfpFYnqrCz4owPlG1Jkgt4xdvVHI5bkdA4UEfg=;
        b=ijaSiIGeGdfmtginp5lO8DQWb7WYNiQ5K4oLjAgE1BeUBQtnE1qcuG9BCYq78TDz/G
         MubJ4OKS4CK/KJ13Fw26phgN0FFR5F1NP1nTqySodLh/tCT+KvFJnu66mo8OebzMttBG
         a+BE7KUQ6nAUZ293Wslz4j2b9EGCu68H6WO6/dmgGp+sWvgtwWnpVFYsiKfHqwsNVYUK
         oo3K9DvyVvMWHGHRl4eHnRjZu3DH2calWULqojdBKzJ3DMVJZ3AXQLRovYzedu6syIhh
         kxxlIXN1x59srLoen5608l8p95XxzV75FdsBdHoGv2I3O0UDv0PHmb8R4KPsuMgZHd1z
         YbkQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrQnkV3V8+6g4eb/ITWHbn1I6d7ygWCJD7TFrlg0VjKZGgLpAfWPDbVpvuSx/rMOpPUEWExlc/m8uiNow=@vger.kernel.org
X-Gm-Message-State: AFq9FYJweADEKpOLod2A/w4UXFtqmk05/7LJX5JVIsJx9LbDWQPT/4bf
	mHXWEUlZ3m6cviR7aOGEvF/lS2p6oQ2UW/MRO0JqTTgj5GfIq4FjEKDNxC/Ia7xED2WPEQ0vzMf
	uRh1Jyg==
X-Received: from pjbfh5.prod.google.com ([2002:a17:90b:345:b0:3a8:645b:da8e])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d0b:b0:3ab:9c73:12e
 with SMTP id 98e67ed59e1d1-3ae57e07896mr285693a91.6.1793139143314; Tue, 27
 Oct 2026 15:12:23 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 27 Oct 2026 15:12:02 -0700
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
Message-ID: <20261027221209.1560865-10-seanjc@google.com>
Subject: [PATCH v3 09/15] KVM: Pre-check uaccesses in KVM's APIs to read/write
 guest memory
From: Sean Christopherson <seanjc@google.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, Sean Christopherson <seanjc@google.com>, 
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jim Mattson <jmattson@google.com>, 
	James Houghton <jthoughton@google.com>, Chris Mason <mason@kernel.org>
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
index 1058b864d427..d8b914b76f90 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3298,6 +3298,11 @@ static int next_segment(unsigned long len, int offset)
 		return len;
 }
 
+static bool kvm_is_guest_access_ok(struct kvm *kvm, int offset, int len, int size)
+{
+	return kvm_can_do_uaccess(kvm) && !WARN_ON_ONCE(offset + len > size);
+}
+
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
 static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
 				 gfn_t gfn, void *data, int offset, int len)
@@ -3305,7 +3310,7 @@ static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
@@ -3381,7 +3386,7 @@ static int __kvm_read_guest_atomic(struct kvm *kvm, struct kvm_memory_slot *slot
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
@@ -3414,7 +3419,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot(memslot, gfn);
@@ -3544,7 +3549,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	int r;
 	gpa_t gpa = ghc->gpa + offset;
 
-	if (WARN_ON_ONCE(len + offset > ghc->len))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
 		return -EINVAL;
 
 	if (slots->generation != ghc->generation) {
@@ -3582,7 +3587,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	int r;
 	gpa_t gpa = ghc->gpa + offset;
 
-	if (WARN_ON_ONCE(len + offset > ghc->len))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
 		return -EINVAL;
 
 	if (slots->generation != ghc->generation) {
-- 
2.56.0.307.g5fe7bd680c-goog

