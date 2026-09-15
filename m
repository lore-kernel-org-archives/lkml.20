Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0158338D404
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 01:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789436320; cv=none; b=p5xN8yTUm3ZY5H32Zl6iHOIMe/we4yy5oorZryWcbNc4ecASW5l5fQJ23nRW5viHma/maiyyioatGrvkGvvv6pVThF1e4dv8ECdezBG/jJKMvKOgTzlP6vI51UGzUHr9hk8MasWtv0BBIbOfr9atPPKLZmyn0HHTkLNJPM5U0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789436320; c=relaxed/simple;
	bh=kTHPOCcnlCDoudbJ0oNJ2FysjhAWiOkueDhxlW+QOCE=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=T/87kRWAEBbeQ5/bs8GiLGi7Rxi3MXkJvkJbioM4zH3hlqAVsh0z6PpHkiBwIDqxYZhzP1z34WgXpc6i/a1nMnWjoFBaPLn7WbF1Ni4X/9b2/zc0wDYXfIeBzeA8k1WlY4Eyo0l/GmBS8oAgHQykVK96CQ/+3kskr8BgA76yUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4959c49e054so3129669b6e.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 18:38:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789436318; x=1790041118;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0jU5rdMwleJVbQ8DpwiGkG8NG+1SZ88on5KfKsWqEBk=;
        b=jVfwn0b+iTs8cUaLQ1/LruRBuJgPqiaHMy1kDOKKNM2+aIzhn1hoZIjU3wIZgjRD+H
         B2O+66aDeVKwd5HCaJfuEteULhrldiSMARkYLYUZsqClBwAVd5HhKcFGvHAEv5xLwSTY
         k3O1mjmm2KxlKDnLXpFvymS0+IMIte06MvDw5TEa2jIUiO6r9fiZebesuC1AwtlLpVuk
         4FmiqEYd8XxbVEXegBCjEfpRFclpjMXDYPRtH8EzghcfW/0ZImOCBkt7YUdvaaxJ+cDg
         n7ElS9wA+JHzK/ExCyXffBVaS22QsAVC2KfRjiMZcZr997LgAgFckYz8qDq5YKklhZFQ
         Iaow==
X-Gm-Message-State: AFuF++l+C/hBSBxE2P5i2o1iy8BGfJWN5fl6qNqN3RseXT0xKO662L5D
	+BYkX3MOQUA6snXZlubFoLI5ysmP4dwbzCF3J569LLCs4schLJIQLdKYLds9IC6iXK1W9jOxxJy
	3q6aQo9ISR/N5fTJqh/Ds5Svl7x7BXQDqryDiFUYhP8BAQwh7xzuDYuyEaZg=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1609:b0:6b3:6236:6fa with SMTP id
 006d021491bc7-6c53f050dd0mr2782777eaf.21.1789436317932; Mon, 14 Sep 2026
 18:38:37 -0700 (PDT)
Date: Mon, 14 Sep 2026 18:38:37 -0700
In-Reply-To: <6aa42297.f2639fcc.29487d.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa8a19d.4c28b7d0.c1bba.0029.GAE@google.com>
Subject: Forwarded: [PATCH] INFO: task hung in kvm_gmem_release (2)
From: syzbot <syzbot+ab6273c58262b9de56d9@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: [PATCH] INFO: task hung in kvm_gmem_release (2)
Author: jchuang26@m.fudan.edu.cn

#syz test: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master

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
 
