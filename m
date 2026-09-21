Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F93509EE2
	for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 21:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790024789; cv=none; b=c1qYzM3sHagQrP6dA4Bo7LmQ8xb4O0PH4BiHrO+XdoV9ppwDX2hWdHHWileokvi6saQI1T0tRrsJgmH8FU8Moe4v7/aqRsKhOmIl2r+7u3NL2HOvVY7PMHlDbx29/tZWqEBaupW+zzT1UHq+HBT4Yk21nmEijQtUNHWe3O0Yznc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790024789; c=relaxed/simple;
	bh=NiYO9u22M0EOKTPmFi+as9af++RPLwF2dk3axMotfZ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Q8NNye/FQVhHTdeyh/NI3SUBlzR0BuMyiRRDwwzMGQjs/yCkCaTY6K6CcvLPhUrzoNss+u+TD9dMk9tjZUMTrzoSvqhEoAY21/tCgfPevQhOA3p3g7DLu7yEB6zCOrHx9Xyi2WfRRnNpr0ZwxOZq5Dx1oDQrX4JsrJ430MRWg3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YvfM+/tn; arc=none smtp.client-ip=209.85.210.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YvfM+/tn"
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-86a880e91f0so5985211b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 14:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790024788; x=1790629588; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aMnK3YE9JmuSMLmY/xn/2iknwP8QiqPv8uY0jyKuvFE=;
        b=YvfM+/tnxTZvUs5KDVsIEMal2RzJYOJIw38pUHMvYRMDzNJe/hJeK0ioviTJm/Wfso
         XV5nkHVHX9q3MYODgevmXPiF/uo1HcLDq7jadlfipWqyINlPglfrUhJf6qCNdJVICwRV
         o0k7Hl+DLFQBvJf521DGbN+7ZWwx6gwYkI5PKK4Tixrh2P8xrYcQrHt4eZFWFewvUvRF
         5K3mQvQMV1AGh7VBOgScX0bk+gG09+enXDyUUsp+SUETyh1DeezUmMRfuoQrdE9xb3eH
         rDJ7s7A9I2DhYlm8wBOEr4Q9hhQCeyPf7i2O6DsFBnxQN0CrzlCFGrjiURYn7RISBDab
         y5BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790024788; x=1790629588;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aMnK3YE9JmuSMLmY/xn/2iknwP8QiqPv8uY0jyKuvFE=;
        b=rLk0QMD8WoyQofP42UYLPB67dSDhq/sRJULHJ3cw4HQ1nNlPQ38MN+pARwxmQ9WNvs
         Q2ceGaGBFrXmvyCVAgwWia3YPwCC9p1hrT2/N7ugxp81UaUk12CqZlf55sZXrA8lLlQQ
         3vRbqc1h1JgBMWoW3Y8P2Kyfuq6dkFTQ43LDtpVXwru8v9uOPlhTyQGd4Zo3tFqUwgY7
         ap4rFifBoM+kB0mhmodKeE/luOjzBhIF6//NE+ypTTvQBOz39w3tY+a2pAN4xcRqujDk
         CtLC/mHT9qABZ35vkR81Bu3LwrUM9WMmY+Z1B1izMXw0NFqx71UsbaM4v7prcbf7pzNQ
         f77w==
X-Forwarded-Encrypted: i=1; AKwUvBypbb7nt/CMx0ORY8LgZBfwY2q13/CKphJbAJkFVH304ZcYLfRGc9SOemkhxXTstpqCKNn/uE33L7fUBSc=@vger.kernel.org
X-Gm-Message-State: AFuF++n3GRLdkQH63YNz1xa01TZ7IPdOWWebd/hBuYfZOpBWt7D18VCZ
	/KMHBx60DY8tLpRPK9ltlY8pptI0NI88v2PgHOtsx6pWBO5yMiuC8ipdvmAzeiFb+JWhRy6nMD+
	EREj4hA==
X-Received: from pfbgd4.prod.google.com ([2002:a05:6a00:8304:b0:87a:ea08:6067])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9504:b0:879:56df:91e
 with SMTP id d2e1a72fcca58-87956df0d09mr5762408b3a.41.1790024787615; Mon, 21
 Sep 2026 14:06:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 14:06:16 -0700
In-Reply-To: <20260921210616.1024168-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260921210616.1024168-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260921210616.1024168-6-seanjc@google.com>
Subject: [PATCH v4 5/5] KVM: guest_memfd: Drop superfluous WRITE_ONCE() when
 binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop the superfluous WRITE_ONCE() when setting a memslot's guest_memfd file
during initial binding, as the memslot *must* be inactive and unreachable.
The superfluous WRITE_ONCE() was added by commit 67b43038ce14 ("KVM:
guest_memfd: Remove RCU-protected attribute from slot->gmem.file") to
maintain rough "parity" with the existing rcu_assign_pointer(), not
realizing that the only reason rcu_assign_pointer() was used was to make
sparse and other checkers happy.

Cc: Yan Zhao <yan.y.zhao@intel.com>
Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index c094611f7c7a..11795ffe5830 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -690,7 +690,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
 	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
 	 */
-	WRITE_ONCE(slot->gmem.file, file);
+	slot->gmem.file = file;
 	slot->gmem.pgoff = start;
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
-- 
2.55.0.1082.g2b9226bbc0-goog

