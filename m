Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38B1478E3E
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 18:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788373230; cv=none; b=aYdyw6/3+Rj9iHrrzSNhMTS4kj0O/TlDNpZobmRPPdc1i+k0mdDiGttaLZxARyS0kpUFPrHfHWNR8hizNTk2SRJnwLV7w1bNn1JFHFpjTF/3g9LXzposQtpMwju3LPt0gZPlu324YHz1vCI0ZkLz0hSP8Sd8uFJuKZ8B+oV31b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788373230; c=relaxed/simple;
	bh=R/K5UWhNFqj3ZcM4cwx3BkSTRdQNwDAHdg7ioV3umQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fVzEY07ZeuAaaiij10is1wQ3IFWsxORhNd3yh7lGalp/WfuSOMQBVuTdzs7roLszESeOUyasRI1mXzaaa3sg0EevGdjhagOhITLvrDnxJse759eRUM0P4gKCeHmsf+7x2DzyDOxgaB3Dne/t5OmMhW1lpe+IPplgJyV7xCG83C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PYeP9zHg; arc=none smtp.client-ip=209.85.210.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PYeP9zHg"
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8535db07af9so722547b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 11:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788373227; x=1788978027; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ER0xLmEoKu3WiTJI8f5zgte0kZ2FP3/FFPxtMYpTVLw=;
        b=PYeP9zHgSsv3a8T64C2MCHn4cgmAEXPMMuCjxTxwRMY16GG355/xmzjZC+0LRkPQqf
         lq5ed/mQAUvKCSladaFzm1vkvHkarhcqIgXycYR3s7FikiwCbzrZPoyBaauuAc7W3wKc
         KNF4ByVrakx35n9uPIAm/+MHvUwG0QDPajl8uV55vKOm8zZoQxyXWCm2t/39CTYj54BV
         LuuAPRViZf3tz2dcBELGhBOjHcMw23OIR21gf3v6f24DT7g42SCAio61HMlTtc1bs8YB
         +b9SxDzgN4Pdhm9zY6sUUCRuZ3+YgaJbS6dYRMzz0hin8eY+j37pQLPOz2Nm68n82RtW
         060g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788373227; x=1788978027;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ER0xLmEoKu3WiTJI8f5zgte0kZ2FP3/FFPxtMYpTVLw=;
        b=S3yJ8okr02P6HwZAaqTa7+Oj6XuqToNS0gdwUA25O0RBlZNZKIcMZeAJzUkvARK3tC
         AAT38c9HLhQ7k6zkZcBWR5RR908oNHuCJtL3Of+m0kAHMVcCUiMFK3Bv7ieJDNZTJGVO
         MY+i9IlSIYGn/qzYF167TZe5++UplT4TT/gBwq1O43BKWvzNEI1PpBnXIFHv/VXhyFYT
         CKqfb3GIobegffpR+fwZzU8yJWbbta7g1l/X0PPC6dz2qxiobk8q9l2ZPSpcM89Nupar
         HjQhK+8hK/MccLXH0gwuudTfE3ElcWuRDz3kr/+2DUQ8HowSdK9p+q+6+0KvA6DcfyoA
         zNwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmgO2YA/trrjONCN6d1uF93fILcnLhR6fzqHFOTHpza53pDNgO0QFpyr6jgJI4LhTDGfJE3BZDnJMK8+I=@vger.kernel.org
X-Gm-Message-State: AFuF++k0lR6eUwhpOfrIoCxnlVFNhHyfqVq5rSPlowBh5W+JJG0UdxDA
	Ypy29s/te54zi9EkDfXYFEzSKW6l2HL0PwNPTI54lvMv7bJTFYFsV7zc7i6qYcKKGaMB1mCBmHt
	mbzHWkg==
X-Received: from pfbfb9.prod.google.com ([2002:a05:6a00:2d89:b0:85f:34bc:42ef])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:9295:b0:837:e9cc:d474
 with SMTP id d2e1a72fcca58-85ed1d07a02mr9437959b3a.2.1788373226909; Wed, 02
 Sep 2026 11:20:26 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed,  2 Sep 2026 11:20:20 -0700
In-Reply-To: <20260902182020.2615443-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260902182020.2615443-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902182020.2615443-5-seanjc@google.com>
Subject: [PATCH v2 4/4] KVM: guest_memfd: Drop superfluous WRITE_ONCE() when
 binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Drop the superfluous WRITE_ONCE() when setting a memslot's guest_memfd file
during initial binding, as the memslot *must* be inactive and unreachable.
The superfluous WRITE_ONCE() was added by commit 67b43038ce14 ("KVM:
guest_memfd: Remove RCU-protected attribute from slot->gmem.file") to
maintain rough "parity" with the existing rcu_assign_pointer(), not
realizing that the only reason rcu_assign_pointer() was used was to make
sparse and other checkers happy.

Cc: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/guest_memfd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 2c8d8735de5f..323159c9b5f3 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -653,7 +653,7 @@ int kvm_gmem_bind(struct kvm *kvm, struct kvm_memory_slot *slot,
 	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
 	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
 	 */
-	WRITE_ONCE(slot->gmem.file, file);
+	slot->gmem.file = file;
 	slot->gmem.pgoff = start;
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
-- 
2.55.0.970.g62bdec98f9-goog

