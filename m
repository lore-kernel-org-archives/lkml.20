Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE65226CE2C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036038; cv=none; b=p6mT3QCiHyKPrEwjy/pjvYWH0cGaJdHRDAvtPEJ3jde+KCByewH8PKUR0XJ9TAlZtE0AeAxQ1IQeZEAhexyctTTbkn4vZ98IiBUKKrmxruyNNvKFt4jbhl4AWWeL0XWiGaEIzZU6t59nR9vrNIFfuhs6hC5/hFB9BT7zOJZomZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036038; c=relaxed/simple;
	bh=8hkynfdu3qiULMUVYcyhuzcTSpgySEmn1WUnJFWpxKs=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SdZ7XlNmiGfRc6HOOyXAzgfUNWJe7oNGDCmFdzCqCguwf2CklKwhNGGz2gPj3n1L5K4v8aCnYHkPqEZCjbvHny3fVYG9bRXJwGNR2YQL11aJ+6h0xijPoWFwZhqypfa+bup+8AfpTk0GkpV97hl1BCOeNGd/chR2kIEzzVGBI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g8uyAqky; arc=none smtp.client-ip=209.85.210.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g8uyAqky"
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-877ef1457aeso2766176b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036022; x=1790640822; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1abdFyW8+E6I798OukP3jAN+Bgv2ctuNheDkfba7TQA=;
        b=g8uyAqkyWWiQJgFx4Rns0exupjnv4x0BzODcp08OS9B3FJEGuOYZQTLDYWUYX5VP3C
         KYcPH5Uyx/uxsPu3z7Ncex8VrYqhkYm59fmFhGFL7w8aNbAUo/w/7cjHpa+Xm+IS1nNG
         lNuATo2v1zpbfwgqJYJI+iaLxJLh0ViVAFJLiIgh9PqM7d6OnteEkDD1cQIQbxNxZ/ku
         7lKHoxHetSC5nAaLtRYq+RemwmwpPKbvVRHv0wFuqRFkdNtuDxtI95wYa854BH/+LO7J
         B080GjKcALqpBAxLIEldnuOycpgWGE7JKDGJZff2oDwUjf0v6hL9YDc0JNHZBF0iXb9z
         NVEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036022; x=1790640822;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1abdFyW8+E6I798OukP3jAN+Bgv2ctuNheDkfba7TQA=;
        b=zbEmyPi5hgFSRyI/euUHdWYlXzvRKS925Xxr5yNqA5+qG5H3zaLp/bhDJ+21SJ0eax
         yrLN+qVOHapPuQmNG2+W/jQf9FukeQsmtt+nffl+tRUL/WZhOWp5VPA48AMePDFpRmBu
         IhH4Mn3cablLhTxp7742xuaM02BtWEAVloeXlkqqwyd4TeO0h2ruD/B4u8fI8LdYNcog
         tB9+CbPGmX/wfucunetRmFtsRlhofopNrl6/5Gk48oIO0/tHD/U+fHq/Az3FTuIxH16D
         a0U1s0394/q9GYZPVMPYzjJytk5Vi4GJO4giTg98PjH6Anw8XJ8RgJAfJXtiyH2umkCg
         0MrQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5iyAzn6XU12XMqxCzZhcS6NvRvbGUi7Un7sbh5mALmMtO0CA7Sa1A7dn/7dY8vAn3Y+iSE88R3AZL8pA=@vger.kernel.org
X-Gm-Message-State: AFuF++nLB/k/mWD2Zf7U0X3/nu1cWZxVuHveCeHpU2wmVE9vP9z8aTrX
	nhjbpW2cyCMUGHtUgH7UC//eeQMHiqprh0AhnRU2Y4V4GhvNWVTPNY0e1T9TbtJ05H2HRay1ziI
	Y3FKYFw==
X-Received: from pfbdl2.prod.google.com ([2002:a05:6a00:4902:b0:870:7bb4:8565])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:288a:b0:87b:784b:455c
 with SMTP id d2e1a72fcca58-87b784b5205mr2503863b3a.56.1790036021541; Mon, 21
 Sep 2026 17:13:41 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 17:13:32 -0700
In-Reply-To: <20260922001332.1121266-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922001332.1121266-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922001332.1121266-7-seanjc@google.com>
Subject: [PATCH v5 6/6] KVM: guest_memfd: Drop superfluous WRITE_ONCE() when
 binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
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
index 80932f4ec4a3..826d26036926 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -677,7 +677,7 @@ int kvm_gmem_prepare_memory_region(struct kvm *kvm, struct kvm_memory_slot *slot
 	 * kvm_gmem_bind() must occur on a new memslot.  Because the memslot
 	 * is not visible yet, kvm_gmem_get_pfn() is guaranteed to see the file.
 	 */
-	WRITE_ONCE(slot->gmem.file, file);
+	slot->gmem.file = file;
 	slot->gmem.pgoff = offset >> PAGE_SHIFT;
 	if (kvm_gmem_supports_mmap(inode))
 		slot->flags |= KVM_MEMSLOT_GMEM_ONLY;
-- 
2.55.0.1082.g2b9226bbc0-goog

