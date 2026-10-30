Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793395293;
	b=qzVHA5YHe7JpMYFqg/LGTlSf0n8Z/UVIth1+wNZdIU6uXLRM8IbZK9iTt2vlUnTIMc/a
	 SVMwOSuRYnOGEJ6L1pD6epZ7RTAD8HpT8OKUtQY82krLQqDmTXMlM8fUqzDqCXryvlyaX
	 J4Ca4qOG7B+VkVWOi7uk9bXkW9gII9gkC2lPn2TFeJKpp/I/fKXZnkI9CVge7/alXBpQM
	 xMGGegoTFYfX4JFSj6ws8mgw/xUa263oq/5GpWAfzWcsSk//aBpFMhbDlhhiQshH5HWX1
	 AMQXT5de6ZmcarnxBm+xLf+pXRmWvNSfXx1/vHrQ+1Hn4IibmPg0o0rbnjRFrYBq7PA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793395293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Reply-To:Date:
	 In-Reply-To:Mime-Version:References:X-Mailer:Message-ID:Subject:From:
	 To:Cc:Content-Type;
	bh=dM15LINaQxHbLc792vSLF2sf6HuVzGHLaKE+3j4yUXo=;
	b=MiIhKW780YTf8dYTphVq6BexbffP+WWornFgYXC7JjWeyvqjwESypJXU1yqNvhEdtyZ8
	 c25sXmlro8fbP5g/TnO5fnXlCKcdpAEu1B1uTMlZ0GoHwD+i52zDtISe1/OmJo2wEbKm1
	 sH3iAr0xd4kaa6a38yxvtCUCotbViyjfFMA35nMCgy0w+pToGUN0uU4l1hpdgyeNcjd4k
	 Asldnqn4iQKw3Fpz6il08A/GQvIc1YoKja8wltBUPVIAlHQur4VRU6KH4U+3jCU+iqmWV
	 AvaNgCrIajNQtrxFVXIqzUZvxfoxU/rKiVEC0cdPr6jMXXDXC1Qb8L8/UnBJSfqinaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="C/PAIv6/";
	arc=none smtp.remote-ip=209.85.216.70
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9880F606CE55
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 21:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9880F606CE55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=C/PAIv6/
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3adf71ee6a5so1505526a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 14:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793395292; x=1794000092; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dM15LINaQxHbLc792vSLF2sf6HuVzGHLaKE+3j4yUXo=;
        b=C/PAIv6/7mXB9iX1bzFxxw6bfggIFfuJmp+hZLq7fgAt6pNrh+1KS6j6JlVxZ+mZ/8
         1+6eoWWnxARPScnfkFz+i20vf8IzKw1rR0sRppuwwVfXyf98gVxdo8N54i6WVt4ulh7G
         FhSAU2aEzm0C0sowwm8Ots63VXDrIjdmoiAs6m1ZYKqiQI+4yAEYrYWm1eUWXQ7WHs3K
         ZT9eLVxblIyw8WIW/QFLuMYPXZ78/vRrfaoPli+l+RAV0VQYqRnh4XVvYnHfG7sBHwo2
         RdGHtS+iQ8XU8fnMM0wBaQ7N6aeI8rdp308KPkkBOrkn/Pjx1QiA3RBjdWHX567MX5hi
         ra0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793395292; x=1794000092;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:reply-to:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dM15LINaQxHbLc792vSLF2sf6HuVzGHLaKE+3j4yUXo=;
        b=iSxZNxKwSYD6YYwvJdD5imVvmEamlKsYryI3ZuSG8g+p4Kwk1aWLWGjoxUHEL1aVyR
         dZdKfF4/TbmjcrVaFRP3p4SssBRHx5hSttx1caYmZ4U6UmEJLHiMScdUpfl7L3pKJQN9
         L6uNVFEGQ666wCBqPfwtzBWvzXrIKQ1O6WyrARAdSIK1dxfGgWe8coUd34VcSynF9urP
         lIYE9w4Jb0zQznea2daClakN+8JM/8F5g7E11bKWm2eeA8/RJ2vIpfhiWkmzoZ52KPXC
         bYOdH8/viIGLFcp55o5Xy/0IlwuyFpGJRtRhhBAUV1jCsnwDuymF1CHRwArTs8/60FFn
         IrvA==
X-Forwarded-Encrypted: i=1; AKwUvBykGwrYZR6rFj6UY/Z2LORcRXlxiEvsuEi1q1G+13diwD8hjFHA5o46ZpzswwMilRzDHgWrvhvMlWPoBgk=@vger.kernel.org
X-Gm-Message-State: AFq9FYJoiN0cuPawpotuCZThaTCWVsPGSSGdWbejqFWlAz9bFGV8g8v2
	Tp29eJ2GSHlmIj5W5GPh5He5vTAMQo0tZ36EhoHSMTibGSOfuyTlooNRfyrwLw4ksSmcM6NNUC3
	wDriuEQ==
X-Received: from pjbbo5.prod.google.com ([2002:a17:90b:905:b0:3ac:24b3:3484])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d0c:b0:3a8:5cab:1009
 with SMTP id 98e67ed59e1d1-3ae897ba3b2mr3007282a91.46.1793395291990; Fri, 30
 Oct 2026 14:21:31 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 30 Oct 2026 14:21:03 -0700
In-Reply-To: <20261030212112.2598640-1-seanjc@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261030212112.2598640-1-seanjc@google.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
Message-ID: <20261030212112.2598640-16-seanjc@google.com>
Subject: [PATCH v4 15/23] KVM: Pre-check uaccesses in KVM's APIs to read/write
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
buggy KVM accesses to guest memory are more likely to fail noisily.
Because KVM installs dummy/empty memslots early in VM destruction, bugs in
the VM teardown path will fail on the memslot checks without getting to the
WARNs buried in kvm_copy_{to,from}_user() and friends.

Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/kvm_main.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 2eda12a52bf4..c6af11cea296 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -3300,6 +3300,12 @@ static int next_segment(unsigned long len, int offset)
 		return len;
 }
 
+static bool kvm_is_guest_access_ok(struct kvm *kvm, unsigned long offset,
+				   unsigned long len, unsigned long size)
+{
+	return kvm_can_do_uaccess(kvm) && !WARN_ON_ONCE(offset + len > size);
+}
+
 /* Copy @len bytes from guest memory at '(@gfn * PAGE_SIZE) + @offset' to @data */
 static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
 				 gfn_t gfn, void *data, int offset, int len)
@@ -3307,7 +3313,7 @@ static int __kvm_read_guest_page(struct kvm *kvm, struct kvm_memory_slot *slot,
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
@@ -3383,7 +3389,7 @@ static int __kvm_read_guest_atomic(struct kvm *kvm, struct kvm_memory_slot *slot
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot_prot(slot, gfn, NULL);
@@ -3416,7 +3422,7 @@ static int __kvm_write_guest_page(struct kvm *kvm,
 	int r;
 	unsigned long addr;
 
-	if (WARN_ON_ONCE(offset + len > PAGE_SIZE))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, PAGE_SIZE))
 		return -EFAULT;
 
 	addr = gfn_to_hva_memslot(memslot, gfn);
@@ -3546,7 +3552,7 @@ int kvm_write_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	int r;
 	gpa_t gpa = ghc->gpa + offset;
 
-	if (WARN_ON_ONCE(len + offset > ghc->len))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
 		return -EINVAL;
 
 	if (slots->generation != ghc->generation) {
@@ -3584,7 +3590,7 @@ int kvm_read_guest_offset_cached(struct kvm *kvm, struct gfn_to_hva_cache *ghc,
 	int r;
 	gpa_t gpa = ghc->gpa + offset;
 
-	if (WARN_ON_ONCE(len + offset > ghc->len))
+	if (!kvm_is_guest_access_ok(kvm, offset, len, ghc->len))
 		return -EINVAL;
 
 	if (slots->generation != ghc->generation) {
-- 
2.56.0.385.gac671c819a-goog

