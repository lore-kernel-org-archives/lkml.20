Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B2A3CB8FC
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 11:00:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789383626; cv=none; b=V85tvirPUtO9224STIMVcF66YEw3CTdHbFMLgpeUuE06awzEMg70ZCRGOB18m+JeqgAsi2oYlREd9ZXKtPPMY6AY9Fcxxjt41vHI5jn8DpEoWJuYTvWV6DkhXbSvAd7tvZD0JY9fHggOV3442TeMvjmL6KUMAB1xjCXCY7umDew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789383626; c=relaxed/simple;
	bh=lJXyURU0Z5/ezwRnRzY+CCGdJU7n/e5330H9UmC9GMg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uvFuwPGAMakYG8GKVpkLY4fhXwimJ1CqzqliwBpQ5IGm4pkN6dI9CsBJsRUsd5IeItrhH4c0EpFGwwnMRLnUVpohm5OnNJz0qH4Bia582ZheKFnEBx4qmyjK46XNhVycIWgEMYDX/kipwBdXC4PSbWEPJSstoODhFQycMsU0a20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-80139a2495aso5514263a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789383621; x=1789988421;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jsY326XUJHXK21sqO0ksKFfvd8wO2J4YASv0PCYoaMY=;
        b=LzzRLhyBZRBM1e2iSXDyfvvV3Ri/kYxM22ZbGLqV7k/B3PZAaXwGxq/jbpUcTkevOg
         Wt0DeNsUGktWllqaUp77c5karFgUjxBAYC67s8odkVQ/Y5QIOTAeiTow0TFKjMkFc+Ul
         0vgVjxttgsELSqQXg3aUUtPfP36ul/Qli4upS1XLFm7RSIdIP4K3A4RjnJKiQVMB6wG+
         urNg4vdaHgWxHGBIbJtEAlUgB5rsNlMV3qDYdEr/tCPE6zEwAsq3jX7Xt40tSsvcjyMe
         pQqKl/+KyTI0ycTdmB7kmkltpGVi1c2Ry3d/0moQNtZ4oT4zSQvRKmVWIZFL0gPGnfoS
         n9Ig==
X-Gm-Message-State: AFuF++l2aJrajTxC0nDKjkTLDqz+OQijuBvexZGVSPlWS6Fm6Vz3j5nf
	AGZiOL25E4pn9iPVh3jW5F8Z/RrD0gomE1SqMXqhVVqjkvhwvIG/jg7ItpQjikrvv/Afdn6Q+Ec
	wYplyN18QcO1eSqzBKBH8DIMgeWkPQ5wrLhOjkx6FIsb9Fyeq6920Bcc6p9A=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4cc1:b0:6b3:5537:8dbe with SMTP id
 006d021491bc7-6c53f74b87cmr950493eaf.11.1789383621213; Mon, 14 Sep 2026
 04:00:21 -0700 (PDT)
Date: Mon, 14 Sep 2026 04:00:21 -0700
In-Reply-To: <6aa42297.f2639fcc.29487d.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa7d3c5.a211d2ce.1a5198.028e.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in kvm_gmem_release (2)
From: syzbot <syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in kvm_gmem_release (2)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 50d05c7c76c96b90462f24debacca971d2e86713

Reported-by: syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 65eb26a05..8843dc35c 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2534,6 +2534,52 @@ static bool kvm_pre_set_memory_attributes(struct kvm *kvm,
 	return kvm_arch_pre_set_memory_attributes(kvm, range);
 }
 
+/*
+ * Reserve or store @entry for every gfn in [@start, @end) that is backed by
+ * a memslot.
+ *
+ * Only gfns that are backed by a memslot are tracked; attributes for any
+ * other gfn are meaningless, as such gfns cannot be mapped into the guest.
+ * Walking the entire, user-controlled range instead would let userspace
+ * force KVM to hold slots_lock for an unbounded amount of time while
+ * allocating an unbounded amount of memory.  That can starve other
+ * slots_lock users, e.g. kvm_gmem_release() can get stuck waiting for
+ * slots_lock and trigger a hung task splat.
+ */
+static int kvm_set_mem_attributes_walk(struct kvm *kvm, gfn_t start, gfn_t end,
+				       void *entry, bool store)
+{
+	int as_id;
+
+	for (as_id = 0; as_id < kvm_arch_nr_memslot_as_ids(kvm); as_id++) {
+		struct kvm_memslots *slots = __kvm_memslots(kvm, as_id);
+		struct kvm_memslot_iter iter;
+
+		kvm_for_each_memslot_in_gfn_range(&iter, slots, start, end) {
+			gfn_t gfn = max(start, iter.slot->base_gfn);
+			gfn_t gfn_end = min(end, iter.slot->base_gfn + iter.slot->npages);
+
+			for (; gfn < gfn_end; gfn++) {
+				int r;
+
+				if (store)
+					r = xa_err(xa_store(&kvm->mem_attr_array,
+							    gfn, entry,
+							    GFP_KERNEL_ACCOUNT));
+				else
+					r = xa_reserve(&kvm->mem_attr_array,
+						       gfn, GFP_KERNEL_ACCOUNT);
+				if (r)
+					return r;
+
+				cond_resched();
+			}
+		}
+	}
+
+	return 0;
+}
+
 /* Set @attributes for the gfn range [@start, @end). */
 static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 				     unsigned long attributes)
@@ -2555,7 +2601,6 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 		.on_lock = kvm_mmu_invalidate_end,
 		.may_block = true,
 	};
-	unsigned long i;
 	void *entry;
 	int r = 0;
 
@@ -2571,24 +2616,17 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 
 	/*
 	 * Reserve memory ahead of time to avoid having to deal with failures
-	 * partway through setting the new attributes.
+	 * partway through setting the new attributes.  Note, only gfns that
+	 * are backed by a memslot are reserved, see the walker.
 	 */
-	for (i = start; i < end; i++) {
-		r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
-		if (r)
-			goto out_unlock;
-
-		cond_resched();
-	}
+	r = kvm_set_mem_attributes_walk(kvm, start, end, entry, false);
+	if (r)
+		goto out_unlock;
 
 	kvm_handle_gfn_range(kvm, &pre_set_range);
 
-	for (i = start; i < end; i++) {
-		r = xa_err(xa_store(&kvm->mem_attr_array, i, entry,
-				    GFP_KERNEL_ACCOUNT));
-		KVM_BUG_ON(r, kvm);
-		cond_resched();
-	}
+	r = kvm_set_mem_attributes_walk(kvm, start, end, entry, true);
+	KVM_BUG_ON(r, kvm);
 
 	kvm_handle_gfn_range(kvm, &post_set_range);
 
