Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1152E223328
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036017; cv=none; b=kI+FtvhzjJVXEiTxrtorRU2Eu1jYSC1TNtdObKU0SaoVSjp5g5M52YqoBv05gJNQrOVNJExcNDVesEqs/ekwEWxnlh95+nZ0k5R3b6fWYkKFNhaRc4mCZyS78ByvsaeWbXcpQBL4EYoLVJ7mNY1O02YjL5xFBlkpKYOeZ6nwjrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036017; c=relaxed/simple;
	bh=+OgMs5FTH885W5hqbW9mZemd9t74Q3YKNRON5By5iS4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LLGUFuctmFIitsNYtd1d5mu/7xEtRSHxiZ5zvJUBvb03uswXfST74uebpDdFavkQrmLDvlVjQ+G5d/WgPeXe6rKKBB/9SnAo9AFuvpDoxOxUzgRQnzEgnP4mf7nD+dCfbFQ8WfMrtzr0S7Gntcn+jZBg91geHR0avMzGxJKu0bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Zv+xpZf7; arc=none smtp.client-ip=209.85.214.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Zv+xpZf7"
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d94f086fedso51645525ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036015; x=1790640815; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=TG/mu75XYT0SNXMXtTJlKEYyCMKeyuwB8Y7qCUcxVbg=;
        b=Zv+xpZf7m3MRy4BDsAoYkTpzhbF0wI6WMAdlcignQ0rAQ4pEmhV26c5Q35nZjRi+vV
         AfxxbgmB1VOmvbOW6BcR7n/jkHC2H3aW6gtnuK3j0E+NFcEaK/kgVPgOjEzp5sCPCOWr
         41cnHNbo/a9ESEG1UTwocPPaw1hwNHN2G6j+X7HVBWZZpn15UkwAoxHbE+3sLqrbqGC0
         S6vgVQbyn3rTyeCfcCaIMjB8FdMf/buJwxc+KApjPS9sjCp34GxUyR5a5mIrDIr1/lWt
         mekaHRIYifi6pDUnXsGvkxN71PlqmY2alZZvA2827/uP04HneuI1SFtCtSYawft2skab
         pY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036015; x=1790640815;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TG/mu75XYT0SNXMXtTJlKEYyCMKeyuwB8Y7qCUcxVbg=;
        b=vBfAHE2MoweMAlPC1BtCVSW/T6rU+X2LbBU6OXmGsUubeYF8Xlj+9AibTtfYAjakdH
         brC4zKmjzSzb8GF83qq8stT+xFi4AI95rgwOLCkfoYkOc73u558PgsDI1edr8Kbh2OMW
         9AynHLzmhzwVQY9ovshK/50SJtbDB/OHQmCsEfD3K9Zrtl+V5FWS0wyXfleNHO9e2S2P
         0OVuptxYeYUmtkcYq29lRn3zScIw+36FKKyoCu3vl06eJ5O8ikr/nN0LJ+qRHr4JgOWn
         FPiFdLcg+61Cs/fDjhrv8EGh2OE/pmRqjhb17ci4AI0skn8uSas9+bP0b9rS86Ts7piR
         w5MQ==
X-Forwarded-Encrypted: i=1; AKwUvBy52hV6bXhmO3GPVNWqBARyzLNEDVhG2Tu6LGTbtKkMxt0SRDErl+8PtAhBdOc+OqprBr3ZqRK4O1muTEE=@vger.kernel.org
X-Gm-Message-State: AFuF++nwwVj77is+pD9Wtxvq62uY/xgw93/mTLxdzd0l3LrS121omQid
	CeX3KhX3r2545G6NiY/ptPDNQHRFTNf6zgpnlmkWYb4kbXUfq8aVhgbR/jsq2WyJSp6RpYU04E4
	rvuD21A==
X-Received: from plem11.prod.google.com ([2002:a17:902:e40b:b0:2dc:fcb9:e5f1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:e742:b0:2df:5ab2:ea13
 with SMTP id d9443c01a7336-2df5ab2f6dbmr10657245ad.10.1790036015093; Mon, 21
 Sep 2026 17:13:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 17:13:27 -0700
In-Reply-To: <20260922001332.1121266-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922001332.1121266-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922001332.1121266-2-seanjc@google.com>
Subject: [PATCH v5 1/6] KVM: guest_memfd: Gracefully handle xarray errors when
 binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
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

Regarding the unwind, the slot must be fully prepared before inserting it
into the bindings, at which point the slot becomes reachable.  I.e. waiting
to update the slot in order to avoid the ugly unwind isn't an option.  And
as part of the unwind, explicitly nullify the relevant bindings, as xarray
can store a subset of entries when populating a range.

Fixes: a7800aa80ea4 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
Cc: stable@vger.kernel.org
Reported-by: Stefan Teodorescu <fane@google.com>
Reported-by: Dennis Tighe <dtighe@google.com>
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260823135031.4F6DC1F000E9%40smtp.kernel.org
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 63943aa253d4..c094611f7c7a 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -654,6 +654,9 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	BUILD_BUG_ON(sizeof(gpa_t) != sizeof(offset));
 	BUILD_BUG_ON(sizeof(gfn_t) != sizeof(slot->gmem.pgoff));
 
+	if (WARN_ON_ONCE(slot->flags & KVM_MEMSLOT_GMEM_ONLY))
+		return -EINVAL;
+
 	file = fget(fd);
 	if (!file)
 		return -EBADF;
@@ -692,7 +695,13 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
 
-	xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL);
+	r = xa_err(xa_store_range(&f->bindings, start, end - 1, slot, GFP_KERNEL));
+	if (r) {
+		xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
+		slot->gmem.file = NULL;
+		slot->gmem.pgoff = 0;
+		slot->flags &= ~KVM_MEMSLOT_GMEM_ONLY;
+	}
 	filemap_invalidate_unlock(inode->i_mapping);
 
 	/*
@@ -700,7 +709,6 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 * not the other way 'round.  Active bindings are invalidated if the
 	 * file is closed before memslots are destroyed.
 	 */
-	r = 0;
 err:
 	fput(file);
 	return r;
-- 
2.55.0.1082.g2b9226bbc0-goog

