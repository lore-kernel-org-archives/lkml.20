Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D015356757
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789607721; cv=none; b=buFhDoF2WbRTdw3XAr7eQRWPUUUPdm/bK/HTNtq8g+Rssh0MWVoimmLBltAEbrEHB7v2hTmE063ctLgx3czjaa9713h1pCMM7cpTuOgcsIY5AxscHEDdZbsyyneqwZ2GKB5YFPn95u0u5qtfrCh+R9vYvdaVHkRmwRk5PSFFb1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789607721; c=relaxed/simple;
	bh=wM5u33FfsoAZTN2NE6p415MJJsrgLErd5pHF1xm0hio=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=peQ4+JuldIpRoJwI7731Q06Y7355xHYeAyB8zK22etsadT6YdryMAvMV47H0WLaWsDu95sPGwEaRnfWBwRhIYbUsAkE5Iu9IgwDEyzaVMsijTqPocXGkcOdY91FNGOAneaSjOUvengK6W2TQAu9VcpK+UKb3591PEu+WYmvr9yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f4eb9e05a8so536051a34.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:15:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607719; x=1790212519;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u9LhAIRcV4b3/IRMxxJVScT2WoGL+OacJBdhWfxQG8g=;
        b=TIOLZ7CF3sjn+T3uCf4BWjkwcnK/hXlxmyh7y4DRAgBNvYS37skib6Bc/jCNuGJVGN
         RguVBhBAN8PEsIw0JT9M48tvL+vSFAwP1SUAVdrIK2glugDDEC9DMCv2+t8MFAEeiB/S
         kuEp22Spc/Kkwwmz6kKGm6ZKQ/fZjR/8YYRrSA4ZcipTN5qDPkvNWGEHKklIezSvafKF
         CBqe8AZ9kc0blhLyyANFEDxJ3vghNfnzvlpDEYncGlGAdgEeGxzpjep1ORzqT05vJGgA
         967cBKS31MY7Ane76u+uR4H9CKUqoExSe75JCFGpRSiwfCcTQprVLKAduAHymo0bafO6
         bPBA==
X-Gm-Message-State: AFuF++mQlDn/30BB/wQNYRDwKqNG75PI56gUBxVKghxtxTOo9PQ4Ud1V
	bJ1WhFIjkgzfVkKZcSrCRpLbDudSSazuVsK/9rAhjbe/udKiow+yv56CEZ94aKD1JUOUlVIQgjE
	gScIwwutkvd/AN+sk6jy5Auma4Csh+6BiZDG1Gnl60EWjrdWOv66Cl0aaIuY=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:612:b0:6c1:1734:2ec9 with SMTP id
 006d021491bc7-6c7d47f6685mr7714699eaf.28.1789607719020; Wed, 16 Sep 2026
 18:15:19 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:15:19 -0700
In-Reply-To: <6aa42297.f2639fcc.29487d.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab3f27.71f81b7d.278072.0003.GAE@google.com>
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
index 65eb26a05..ad5852f49 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -2572,8 +2572,18 @@ static int kvm_vm_set_mem_attributes(struct kvm *kvm, gfn_t start, gfn_t end,
 	/*
 	 * Reserve memory ahead of time to avoid having to deal with failures
 	 * partway through setting the new attributes.
+	 *
+	 * The requested range can be arbitrarily large, so allow userspace to
+	 * abort the reservation loop with a signal.  Otherwise the loop can run
+	 * for an extended period of time while holding slots_lock, which blocks
+	 * tasks such as kvm_gmem_release() and triggers hung task warnings.
 	 */
 	for (i = start; i < end; i++) {
+		if (signal_pending(current)) {
+			r = -EINTR;
+			goto out_unlock;
+		}
+
 		r = xa_reserve(&kvm->mem_attr_array, i, GFP_KERNEL_ACCOUNT);
 		if (r)
 			goto out_unlock;
@@ -2612,6 +2622,14 @@ static int kvm_vm_ioctl_set_mem_attributes(struct kvm *kvm,
 	if (!PAGE_ALIGNED(attrs->address) || !PAGE_ALIGNED(attrs->size))
 		return -EINVAL;
 
+	/*
+	 * KVM processes the range one gfn at a time while holding slots_lock.
+	 * Reject absurdly large requests, using the same limit as memory
+	 * regions, so that userspace can't hang tasks that need slots_lock.
+	 */
+	if ((attrs->size >> PAGE_SHIFT) > KVM_MEM_MAX_NR_PAGES)
+		return -EINVAL;
+
 	start = attrs->address >> PAGE_SHIFT;
 	end = (attrs->address + attrs->size) >> PAGE_SHIFT;
 
