Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79965284B37
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036026; cv=none; b=kWnnrLDP2xM+Lf5YEYsBjRAPwDAsUOCCxtIrPnpdeIJXPxC8CipOJzTwD4J8cMp8m+xlFKu3qF9Lir7ZBeKALUx1oH/G8B6NqLXz5Rz/wCvZGzPRf5IvGug/RZ0J59c2yFVnB/0f23NtSWWXTO5ZBU1RNGb+otISnQb3H5lNvVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036026; c=relaxed/simple;
	bh=dSa48txFhFArAMj+mUXjAGNyOy5nkRzHhuhWszJbK70=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ks60BjO2eOH51tV04BiBH36cBNTE3hNaNLDDpxpKBtt3T1OTnlo8u0msksCec/LDJK49sJl1/VIS+2umOaXtUQcbkC3nciE/dqFj/zKW8K1laGGBuFqMLO1PkEqwNtFHquWjo/rudbLZva3PGth0may+QZhxQJDQmwp9xAch3dg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vu9hgjf0; arc=none smtp.client-ip=209.85.216.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vu9hgjf0"
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so8537395a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036021; x=1790640821; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iXwUYaOTNYfdxenNnRc/ZPPCIfOwpvTRjEy50CfCbAo=;
        b=Vu9hgjf0ZJb+bh4SuqN7QzmiYPsqhvPrliOYeBRB7QoW/kxwcZcorTw/tiWUK0I7tl
         oOl1qEu9K8sIPohc2Drey47vpAtfoXowe8a8jfopsvfqlWvS7u5gUVAjVqo23y0EVQfq
         MMVP1flUU1Ybfn2I0wshb9z5wZD9Rt1/opQ6Q79sksb4CqFm4hcahLvtg+mt6Fbr0kmy
         tE58ebzs+c76yZfDqhAiJYgLVcdKLIzGOWFeldiTtdaE14+cvFCtiAiScr9TrAj3ta+1
         Pu1CleQDyit88xEKlJ3cJ0qp3TnNkcaJp8IWJVDhb2fqh6eXiFb3GMhzZxLjkHb9Y2kf
         E7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036021; x=1790640821;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iXwUYaOTNYfdxenNnRc/ZPPCIfOwpvTRjEy50CfCbAo=;
        b=feD9wF7SBhm4/bl/mWfsZIRw+sqTM6cniJUU+JEFZCJKu6AS9e8cWCsTHWoUCKI6Yc
         gjfrU92Za35kq9e8z0deuWwTNrv4zkZins0YKWPeWT64mAcA8304/rPbzI5Xw3AUFq1Y
         hrL/rfhB08M6PPJ1rJLt7e8GMOtK3HpkUtcgH/GnWshZcDSfpm5qC5PYfsbImobLUmJh
         rsjDjEwi8fCoj/kSz/yMlow5qD1wxmm4K98WQ8t/HaQ2s52BNdNqT8KsKu3oewBqc9OD
         9pmTtxFU3Dr3gjX2bbeQqcFqp6/dSNxhXTqolsUTlUw/JPihXvJJEMSaX8L0IhNPxpi6
         /CYg==
X-Forwarded-Encrypted: i=1; AKwUvBwumOsjm1JdxA0/h4jTCNCh8wvaJTHXTqb9nm/nYzrFVuu8C+kR6c0yBfDsqgMqZGA2inaEvgclGRPjsUQ=@vger.kernel.org
X-Gm-Message-State: AFuF++mgHu9XiByIciGxTGIOjo8gzUMWBJqDBnaau7X9LV8y2lB1tu4B
	mJzxjhpcOjj2Q9XpD35zmYsMt8PiyDFF4svw5S3O+hg4yCPjRoZCbvdlhgN2qiOH9Rt7jSIAycu
	UB8M5kQ==
X-Received: from pjbms19.prod.google.com ([2002:a17:90b:2353:b0:3a0:6e6d:1b8])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2681:b0:39e:6c6a:657d
 with SMTP id 98e67ed59e1d1-39e6c6a67c0mr11900031a91.64.1790036020417; Mon, 21
 Sep 2026 17:13:40 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 17:13:31 -0700
In-Reply-To: <20260922001332.1121266-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922001332.1121266-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922001332.1121266-6-seanjc@google.com>
Subject: [PATCH v5 5/6] KVM: guest_memfd: Establish memslot<=>guest_memfd
 bindings *after* memslot is ready
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

Wait to bind a memslot to a guest_memfd instance until *after* the memslot
is fully prepared, as creating the binding in guest_memfd will effectively
expose the memslot to readers.  As pointed out by Sashiko, binding the
memslot before it's ready to be exposed to the rest of the world can break
various memslot assumption and rules.  E.g. x86 could observe a NULL rmap
pointer if a PUNCH_HOLE hit the guest_memfd after the binding was created,
but before KVM made it through kvm_prepare_memory_region().

Fixes: a7800aa80ea4 ("KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for guest-specific backing memory")
Cc: stable@vger.kernel.org
Reported-by: Sashiko Bot <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260826170551.BEF801F000E9@smtp.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 44 +++++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 45b509f4e54b..90461880ff85 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1944,6 +1944,15 @@ static int kvm_set_memslot(struct kvm *kvm,
 	if (r)
 		goto err;
 
+	if (change == KVM_MR_CREATE && (new->flags & KVM_MEM_GUEST_MEMFD)) {
+		r = kvm_gmem_commit_memory_region(kvm, new);
+		if (r) {
+			kvm_arch_free_memslot(kvm, new);
+			kvm_destroy_dirty_bitmap(new);
+			goto err;
+		}
+	}
+
 	/*
 	 * For DELETE and MOVE, the working slot is now active as the INVALID
 	 * version of the old slot.  MOVE is particularly special as it reuses
@@ -2121,32 +2130,25 @@ static int kvm_set_memory_region(struct kvm *kvm,
 						   mem->guest_memfd_offset);
 		if (r)
 			goto out;
-
-		r = kvm_gmem_commit_memory_region(kvm, new);
-
-		/*
-		 * Drop the reference to the file, even on success.  The file
-		 * pins KVM, not the other way 'round.  Active bindings are
-		 * invalidated if the file is closed before memslots are
-		 * destroyed.
-		 */
-#ifdef CONFIG_KVM_GUEST_MEMFD
-		 fput(new->gmem.file);
-#endif
-
-		if (r)
-			goto out;
 	}
 
 	r = kvm_set_memslot(kvm, old, new, change);
-	if (r)
-		goto out_unbind;
 
-	return 0;
-
-out_unbind:
+	/*
+	 * Drop the reference to the gmem file, even on success.  The file pins
+	 * KVM, not the other way 'round.  Active bindings are invalidated if
+	 * the file is closed before memslots are destroyed.
+	 */
+#ifdef CONFIG_KVM_GUEST_MEMFD
 	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD))
-		kvm_gmem_unbind(new);
+		fput(new->gmem.file);
+#endif
+
+	if (r)
+		goto out;
+
+	return 0;
+
 out:
 	kfree(new);
 	return r;
-- 
2.55.0.1082.g2b9226bbc0-goog

