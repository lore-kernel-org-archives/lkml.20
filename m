Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4954766BE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 16:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787763125; cv=none; b=uXQrixd7OMWJ5rjxZiT7vZsjpQAlkkBuwFUNNmPpg3IBkhjqVdDvcGJhb3pIsDxk4BvLC2tnzWq7qehWgUQ6xuQGkTbTQuLs8N/6ycOlAJyuXmBBiTiZMbIhlG+U0pYJeBZidp3e/p+qxPGXo6h04rkk1lHDFGRcBy7OdXKHLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787763125; c=relaxed/simple;
	bh=iqbnxW81PVZ4JrYasvYkpNsH6AAm6QU/fKSXBKEPVe0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BT/eyynMx2i20+kpZ4SIQsDq7ae3HIV7UUwicXwsW1fUlrvB3GuzTVkNVsyIlPdV2eME0TtNvNJ3M27rGHj9RCT9uI/47277NZZmgYw3MemnTDFhL0XeNNtc53P90xe0emxSAAHLp8RDfVBylXj580Tfe5H74QZ76+1lfmzvxnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KNOy833R; arc=none smtp.client-ip=209.85.215.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KNOy833R"
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1ca15334cso1028008a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 09:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787763119; x=1788367919; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3KxgdA9C3Q2gUzH0EONwpXAO6HVPxwiye0akeJiAgZM=;
        b=KNOy833Rl39bZ5UcNb2FEd8yrlC7sivTNJXlFgwDBN70iodGd/QBWp7OtJvxbPuJdS
         TT6dKdYUxR/ta3Ahvi6KaCUikuAoxNSmg+ECDXT8tNfw03AAGgWOcEsDizBrNMW4Zwel
         tAQs/+6aGUGVUOUxRfkjtJA1TZP55bNGsgVF4F9Lw53hgwjSj4q4JBzlJaGG+a4TE2ud
         Nb8pXdvRlkikVY55fIqkzSrf2PG2zOywP7KPmsN/3eGwptzh5Vz62lzkzbnwYXrKOgFN
         X7Jt6RmDpa3PZlNsbX3ZU5OKwDQ9cgG4wDRNtCWhqJthMu7vi365IYe3x9BpfdJBQ/Sz
         ShIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763119; x=1788367919;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3KxgdA9C3Q2gUzH0EONwpXAO6HVPxwiye0akeJiAgZM=;
        b=tENkLXCwd8coDkjX96f+zEQO1MG3jy3WPoEwbNAptMRvuuF385MjYHAW+HVOhwYkG4
         kSUU42Cg4YjmtPSPeQeJrJyyZGL5DXlZMd9AcPl0C/XvnSQKSMwrT5WxnVxq4IpWfR0D
         gBZvgL7r0iWFUNq/zRVNp9kNTZJ1DhpwNJS8kKAYTHAe0a6MUcrLyiuqbnN6SXzoxfxn
         AfyuDr1g03OBIlCup4HOTc/vgETrhczyICO5p8IMosuoncRsjDIfAFzc+F5xTg07qNjG
         2gxSQRF04hSor68m1QJa/pvmyvHN0BgP7ObvdmEOAl1Dc2rW8vMXuP3dN+Sxo6M0vbX2
         eeJw==
X-Forwarded-Encrypted: i=1; AHgh+RqyaO3HopqM8HE6XEQGLjkXgkNq7hDIpLSl6eiYI+yeHJABzWQomIImtQTStYQnWakKLa4cfz5+b+4sl1k=@vger.kernel.org
X-Gm-Message-State: AFuF++m+u61nel+yv6hrtE0uLYOpo5y40bLyPFiKKdxAhsPG4CKE9I7V
	m2zRz+RXcFIXIsz9eclGEYZbhzUXDdNC4Pouhhwy+FB4wNsuBKe3AuZsIido74y6KkavaoCUC9r
	attQCKA==
X-Received: from pfbfw4.prod.google.com ([2002:a05:6a00:61c4:b0:848:487e:d23c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2e08:b0:853:6571:9567
 with SMTP id d2e1a72fcca58-853720af96dmr14899043b3a.4.1787763118618; Wed, 26
 Aug 2026 09:51:58 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 26 Aug 2026 09:51:54 -0700
In-Reply-To: <20260826165154.766699-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260826165154.766699-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.887.g758fc8c411-goog
Message-ID: <20260826165154.766699-3-seanjc@google.com>
Subject: [PATCH 2/2] KVM: guest_memfd: Drop superfluous WRITE_ONCE() when
 binding a memslot
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>
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
index 1ef9e2916423..1d2de9a1bc3f 100644
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
2.55.0.887.g758fc8c411-goog

