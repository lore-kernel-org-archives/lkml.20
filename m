Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9293126A0
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 00:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788482627; cv=none; b=SKEB5Hy5RbltYEdktl63o4smirqap9iM1cj8wFChngBVk5x8Gc1n7yKMX8TWb6NiV3+VpWASq6XtzCOWuEKfzygrUvA4iuZwWohyatPodtZSjQhW95zT/1c+SsVUVCELkmt1xQ4YCUaefzcy1p2vqR8p2PisEXMQ0JWiclSvrNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788482627; c=relaxed/simple;
	bh=uPpdSve/KMXyb4J63L091m+vctxs7emvRo1xsJVEMuo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rlncdlL6Z4+nKYuY1CSX0EeBbve7wuJAEiCCDu3bHZGs+VTDLoJ4xbd5TRMPj419+3tMQozLaMj1VRIzovs3aT575xXRYuyR8NRGfz9s/vLgm656CsQaaasQIl34J+vzyninfI1VuCzDTqWkNkzivLyOzZAKo2TdDi428OKs58A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VucA2pEG; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VucA2pEG"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-84a67b16217so603033b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 17:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788482626; x=1789087426; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gKWtQCST/EuxgO5WVT81LHcHZYensAAKyMOkSmJAd+8=;
        b=VucA2pEGA3pUjx/KhO36omYw4b99bykPHfieut70Te0EI9RVA9L6oH2UChqeJXJL1g
         moB+e1gVZd2AUqSqR9m8jHxhdqytQ3S1kJFtdormyyEYzjPEmFUbEk1LVMaPbFX8cg38
         OHNb9R9erXJNOc47ZVmxn2UOTuMZVQf/x4zlXW0S+ltR/lSRHoRVCa3prCgcOJ77CUm6
         HxruI5kTCKIlWG4x1L8L1gO5MpgDDej0uYW29NiFKbi2Xn2SM/khM4Y55v+Yw1CMlX2f
         OyPb48MbDjBmU8HCJoTQgwBDOdQwPG4dZMCnG1ukXPu5KG4kL1IPcB8ev+wDAjO8abXs
         LTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788482626; x=1789087426;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKWtQCST/EuxgO5WVT81LHcHZYensAAKyMOkSmJAd+8=;
        b=U8oUwoYbkPh7jXIAN4bIu4wrTZEtajLOPBqsvKhH68ethO/GPQhUwsvtAAPuHc3Y4g
         3W4piWl7NQD9FOYjCLzR0bkAK4zytsi+sczGQI1uSh4xnAO5o3oybdahF6P/gA/xicpm
         F6JqYTUIF5R/C4hOyFtqmQu9y4BJUJj91uuEKM0JLJd3LwFV4gO5BtBLYSBVUC5rqj98
         ouvLQ5GtqcrFlCqrH1zkgzW06pUBYclC6WMfB9NU1VRn9QZwdwDw/WgMKczrtpTFPZhV
         gtpGEBXKkNXW9USPX3lRFnnf82m5pxbFontirMFMgK2F4loLaoYoUwaGZ1JvrR8S4yLD
         VZag==
X-Forwarded-Encrypted: i=1; AKwUvBwT/sD0fLgUPL0SnLxm5EVTEynIfav6sLXUJ7rPlwPEfC96okOIR/koN+kNMPpJbuRolS3QNx5fINLVMi8=@vger.kernel.org
X-Gm-Message-State: AFuF++n7owjVH6F3TIDvdvr8K5yC79jjIHWrupDalso2fatmX0nUGwEs
	SegTF54JeKgEvJkK0nypWpQj+qKjzpoMweSUyDW2bnCvmrFbj1ZloSvNAMDJmSCImj38DNm3/bO
	kbX+58A==
X-Received: from pfem13-n1.prod.google.com ([2002:a05:6a00:c08d:10b0:851:c4fc:fe2b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2c97:b0:857:7337:5db9
 with SMTP id d2e1a72fcca58-8616af6486fmr3815983b3a.23.1788482625135; Thu, 03
 Sep 2026 17:43:45 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu,  3 Sep 2026 17:43:39 -0700
In-Reply-To: <20260904004342.3162959-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260904004342.3162959-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
Message-ID: <20260904004342.3162959-2-seanjc@google.com>
Subject: [PATCH v3 1/4] KVM: guest_memfd: Gracefully handle xarray errors when
 binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

If inserting a memslot into a guest_memfd's bindings xarray fails,
propagate the error back to the caller, i.e. fail memslot creation as well.
Signalling success and continuing on with memslot creation results in
use-after-free, as the guest_memfd instance will remain reachable via the
memslot after the file is freed (kvm_gmem_release() won't nullify the file
pointer due to lack of a valid binding).

Opportunistically WARN and reject binding if KVM_MEMSLOT_GMEM_ONLY is
already set, partly to guard against goofs elsewhere, but mostly so that
KVM doesn't need to worry about clobbering flags when unwinding on failure.

Fixes: a7800aa80ea4 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Reported-by: Dennis Tighe <dtighe@google.com>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260823135031.4F6DC1F000E9%40smtp.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index b596486d184c..0b48e9a775aa 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -612,10 +612,14 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	struct inode *inode;
 	struct file *file;
 	int r = -EINVAL;
+	void *xar;
 
 	BUILD_BUG_ON(sizeof(gpa_t) != sizeof(offset));
 	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
 
+	if (WARN_ON_ONCE(slot->flags & KVM_MEMSLOT_GMEM_ONLY))
+		return -EINVAL;
+
 	file = fget(fd);
 	if (!file)
 		return -EBADF;
@@ -654,7 +658,15 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
-	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
+	xar = xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
+
+	r = xa_is_err(xar) ? xa_err(xar) : 0;
+	if (r) {
+		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
+		slot->gmem.file = NULL;
+		slot->gmem.pgoff = 0;
+		slot->flags &= ~KVM_MEMSLOT_GMEM_ONLY;
+	}
 	filemap_invalidate_unlock(inode->i_mapping);
 
 	/*
@@ -662,7 +674,6 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 * not the other way 'round.  Active bindings are invalidated if the
 	 * file is closed before memslots are destroyed.
 	 */
-	r = 0;
 err:
 	fput(file);
 	return r;
-- 
2.55.0.979.g7e5102b832-goog

