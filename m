Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F39126CE2C
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 00:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790036020; cv=none; b=MOZV3W03NSAEQgSh9uABNzEqy5kJxflvcc3RQmjM93i7veaWeQkq+mSGmvurmg/h+tVojT0Wm8j38eGjk0wiNBJ07MHEFSL8s2v7fuwb3icqB2dQrxyPEOI2sokRHMh5Sm0Pp0PHIlqvLmkeF8WFcdtg6DaMxmTRuk8GBsOrdIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790036020; c=relaxed/simple;
	bh=/uWjI8Uu4H+jwIc5bzgv2pY2GKSfTMxj6nuLZ1zl2PU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=I0Uxc41SX9Gt/A771RDKxQ3MlEnsoWld5JojF8IsoZDbPljsvzBkmLJAyJRk9BJtfzRMFWP53sCKJ4qfUXS8TPykyUooMY7Zl+4sKm81X/4CgYKjYdmnC5ybPz4udu1/rEhjGy0+wzXCJe9/QdWNZOnOo/ggDlFFw/Q9jfLJxCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SWMkc23e; arc=none smtp.client-ip=209.85.215.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SWMkc23e"
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so2789119a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Sep 2026 17:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790036018; x=1790640818; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=turXne4uYV7wcVpOhFPdmOUyNfChurx8+MQeLApE3QQ=;
        b=SWMkc23eyqHUmYNn9xDXzBgGXhBVq3fwWxL3rbDt4pXFCPz+JhhBMdbxBd06misfcu
         W4Bg+QaqaZIqHQZeiEYe/39stwqxfV6CopyWWKtCZ41uFn3FS70eN4hdk6KVVbYPI1Wd
         MnzntsxBTAlmwwkI9p8SjKgWr0WJASEJL6a+4hkZekuN2gRFADoKv9Sz5ZwWWr/z4V+U
         PPWQUpd8BA7sHq9fs/BC1+gi4RdNbIPgFII6yHR2Fhy4XiZ5Ffzo3u8w5W3G8I4dyATd
         SbWePZsFf8Wzxda6JfBfck1OaVOFlmKvjp+ljHp97QQG/Q50NHrXa/IcAp8qlfk9qr4X
         g4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790036018; x=1790640818;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=turXne4uYV7wcVpOhFPdmOUyNfChurx8+MQeLApE3QQ=;
        b=r9CNWItPYFlhmmnzzuH49hwZUALiVBJE66eBZPIcLpvyXkf9jAL0Byf9+KGAmfjky7
         Xg9lIrunTnEGPyxuhdNw/7ptym5diAUFYJlFw1Z6BbxlDAmL9uFpS8k57H178MthCQtB
         VBXg2X7csGX5sGch4HzQ6a/yHGSFK6mkdQ3CtRRhWnO7NTEijV2fs0kTR5mwrtyMEpZi
         Xj7I2VWfjXQMoakM3EbcmltihlIqo6/FgudbvwQsH7hDW2vG3xfsaroFMNU57DhekxZ+
         o4ZaQ8cB8Xm3CGAT5eSlw0AffgsyMYJWL2ZdMW5p06iqOjTshGgsZysgTqugQ4InAH0M
         6t4A==
X-Forwarded-Encrypted: i=1; AKwUvBwL5n+Fvhrn5E2ONqW5KtNmtGRAo9iNohUGPplSWDgeqBfbDP8qGWITYkZuDYJuK60MiSq3/6/+3w8EBfY=@vger.kernel.org
X-Gm-Message-State: AFuF++mizCroBkqbSnU/O9qhS486bKDXMmCBsLbLMMz0Pgb9GvkwOq/M
	352JXbIlw2DKUnHp8+LmEaAdc2nsUztARvA33ptEsw8Co6TPga6Zk0qOLQ8VeaKfQ4DsOQCGRYw
	JQvSqfw==
X-Received: from pgvn10.prod.google.com ([2002:a65:63ca:0:b0:cc4:5907:21e9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a10f:b0:3dd:85a9:55a0
 with SMTP id adf61e73a8af0-3dd8c5ac31emr18020098637.34.1790036018118; Mon, 21
 Sep 2026 17:13:38 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 21 Sep 2026 17:13:29 -0700
In-Reply-To: <20260922001332.1121266-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260922001332.1121266-1-seanjc@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922001332.1121266-4-seanjc@google.com>
Subject: [PATCH v5 3/6] KVM: Only bind memslot to guest_memfd instance for
 CREATE operations
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Hildenbrand <david@kernel.org>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stefan Teodorescu <fane@google.com>, Dennis Tighe <dtighe@google.com>, 
	Sashiko Bot <sashiko-bot@kernel.org>, Ackerley Tng <ackerleytng@google.com>, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

For additional defense-in-depth, and to avoid having to handle impossible
unwind scenarios when binding to a memslot fails, bind a memslot to a gmem
instance only when for CREATE operations, i.e. don't attempt to establish a
binding for MOVE and FLAGS_ONLY operations.  And when FLAGS_ONLY operations
are eventually supported (this is currently all dead code), creating a new
binding would be incorrect; KVM instead needs to do a 1:1 replacement of
the existing binding, i.e. FLAGS_ONLY will need its own dedicated handling.

Update the relevant TODO to make a better guess as to what needs to be done
to support toggling dirty logging for guest_memfd memslots.

Because it's dead code, no functional change intended.

Cc: stable@vger.kernel.org
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 24cf96840827..ccfd5f5102a5 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -1752,10 +1752,10 @@ static void kvm_commit_memory_region(struct kvm *kvm,
 			kvm_destroy_dirty_bitmap(old);
 
 		/*
-		 * Unbind the guest_memfd instance as needed; the @new slot has
-		 * already created its own binding.  TODO: Drop the WARN when
-		 * dirty logging guest_memfd memslots is supported.  Until then,
-		 * flags-only changes on guest_memfd slots should be impossible.
+		 * TODO: Drop the WARN and do the unbind() call only for MOVE
+		 * when dirty logging guest_memfd memslots is supported.  Until
+		 * then, flags-only changes on guest_memfd slots should also be
+		 * impossible; unbind the old memslot for defense-in-depth.
 		 */
 		if (WARN_ON_ONCE(old->flags & KVM_MEM_GUEST_MEMFD))
 			kvm_gmem_unbind(old);
@@ -2116,7 +2116,7 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	new->npages = npages;
 	new->flags = mem->flags;
 	new->userspace_addr = mem->userspace_addr;
-	if (mem->flags & KVM_MEM_GUEST_MEMFD) {
+	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD)) {
 		r = kvm_gmem_bind(kvm, new, mem->guest_memfd, mem->guest_memfd_offset);
 		if (r)
 			goto out;
@@ -2129,7 +2129,7 @@ static int kvm_set_memory_region(struct kvm *kvm,
 	return 0;
 
 out_unbind:
-	if (mem->flags & KVM_MEM_GUEST_MEMFD)
+	if (change == KVM_MR_CREATE && (mem->flags & KVM_MEM_GUEST_MEMFD))
 		kvm_gmem_unbind(new);
 out:
 	kfree(new);
-- 
2.55.0.1082.g2b9226bbc0-goog

