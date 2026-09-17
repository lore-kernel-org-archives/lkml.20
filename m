Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BDC12417DE
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 01:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789608097; cv=none; b=YZp+DmSJ+N+0NkooG5xyd9xtX2ilkkOlIslQabGeD1TCk7WvScbxoFmZYin3oZxGm9oFBhDLtw0bwxk7/VkvM/yE5Za84JoTeGH6W+j4WGbcd6zJGNFIxImanLRHRppNAcTMgUK4Fu5F2rywCbaZjaCJAvx/W+0tDMe5ic0mpcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789608097; c=relaxed/simple;
	bh=+7T9BYdzO8iKuroVXgN4w7YVTsUp6HggeJOIIA6ENiA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Guz9T4DB6giVJEViaxfuAMaYKq5NbeR5ZCSSM0Xo/McDWYeMdMyh4e8IDFNcrIwidA73QiePHl3N6RrutJ194XnKhHWxcma3XkQu3sqnanCG0GTSSTXvlS570hGXP60GzJczDbAiSgyBwdmeg3Sg+5VJw3o4OsNZTBvBI9y0XKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6c1e5079d43so319085eaf.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 18:21:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789608095; x=1790212895;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=vsX+qQwQHEWldzppmwfASg2kKxlQR1QVwM+dO6GkfPg=;
        b=IN9x/voM/dgjLzcsIaFnvU+jhdQv7bJagC6g1NebOKb/zP2o0nOjiTev0zs1/HwzZv
         tC0FS1METjwCql3BuieZXhT2Jk3F9lI7D24EYKeEP0XpzH0mTeZgmvTrLXZhSnZaPffn
         UPLk9kuuP95jrEoPK6oaP1ezDUy3EX7tSrdNmWJndswFS3QflvdToCnYIeDEVz859MyV
         /we8o6P/ml7h0NyGY7tdsZKpy12Z5Xb8Z8NtN4cGG+9FTErEhskvOr8I4EKaGrjeTn9m
         dMxeRVg2s6uNbxbFec/2oH+IQGvHc4+Wc1z34qIsjadu5qnL3lUfs6G2fwnk9BuOVowt
         B4aQ==
X-Gm-Message-State: AFuF++ns100ZYwApoZmanLFYi+qjkmcyABQTCZbg7K5nIQM8CxIphqiI
	lL99xY0h9TI7jL3pkkp58aKu6B+SBnNFCy/h5FjengVM7ZiAqbHUDRqpBB/wCyGfSVSrHdM03gP
	x7T11WRWQ/8ZhUOTZHy3Vl2MycWVVnIU1nQWNsGL4C03clnyUasvMmSn1UdI=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:169e:b0:6c1:fd93:5292 with SMTP id
 006d021491bc7-6c7d35fb2a8mr6353879eaf.17.1789608095605; Wed, 16 Sep 2026
 18:21:35 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:21:35 -0700
In-Reply-To: <6aa42297.f2639fcc.29487d.002f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab409f.b398a7c9.1f86be.0002.GAE@google.com>
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
 
