Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245F439A806
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853822; cv=none; b=XXpwJbimT0lK84kHC1s8lrcbOX5Kb4gQ3vYpi6+GOIgRLUt7F2HqwdpC8LKb00BU0Cid272edAq+/mOejBNPnt5RBFDgeDIy1jDA+0io+ZJMFBqfH5PbsSUhrs/ZvOESf5aC1C2n2KZFG7M8EGaG2MiMBtZblx+ajJ5bF8rDfbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853822; c=relaxed/simple;
	bh=gubw4vu5KE96qeQVXvdktCzoMS3uUdf7EmTC1dkA7I0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DiRAHZ2Bt2d6oHgXwKhcONTqcP6zsqn2Hiqwg+zGbcQyqCSHh6Pd1mJp2iT3P36B1ZbxOXqJy+FwaBm7TrSo0rYT1mE9o+WXE1bjwXLpun7VLuVO624QXYBKDZUkHL4sKspEnXSCr1tMBQkGqgw5CSlsNpcukdrzOArpHyj/vjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzQgf7CF; arc=none smtp.client-ip=74.125.227.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzQgf7CF"
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so18891185ad.1
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853814; x=1790458614; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ckY1+td9rxCiBo37cakEiKpQ3Nr/bNRDXdl87Bu/9/s=;
        b=lzQgf7CFmwBItrBlxi5xcCNIANkvm9iMP5qy7UrtHhPC+CVIf+UvptgZvYd9i/kW9c
         dvaOTowFF6+7LDfexBGSLLtQxeO4MYYzt03uD+QNJXUSxhqdglIu5h67iMC+xav9rUw7
         phbic9FdYOeOIRdfiCiTCHHwMMWr8YWcrDJml0y32vIbBlVSiY7l8jN+OXag1Mz0Y8BE
         GTVTlIKBZAji4hEJn1kOLuKlfzUilckN+OrHCOgW2ZJNZehAsNg9ZmnFpmPr7qjXaK9c
         eySvPJiH/OgZbvs8aytbk9JnF9xk60vlIsLRlnlUA/rV+0dGNHWJIwo8Yjm44gIElRIP
         txcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853814; x=1790458614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ckY1+td9rxCiBo37cakEiKpQ3Nr/bNRDXdl87Bu/9/s=;
        b=yl9poCzl0dGebhsweJZ8rOZzWhokhlhH0GdtObbT0hdQenVmLzkOpmaUF1m4rqiLyW
         qrk9N2zZBWIepJGqmT+SXbRJzzcz4nipPZ0fKffo6ZvER2K3Azh32O17lbRO8sUKdlfU
         B6/OYy7BUkPbxe/Zja3BDcVTGsjKFU9L3X8B8ejNGRERI51AXd4HlmGqT5L5Xc8aasJv
         xLUxIEYPhKZRtpNEPCDDhAU+s9WSY9lHr8eSw1w/SSsjPzNg8pLjKuOQ5dYe0RDXpdXb
         j4V3OqZ/FEpbCc8pmNgq6OuxQ94jMo/QFE94gWem0e3UkhOYJY+5dhaCSmgAkmt5mjDr
         w+Gw==
X-Gm-Message-State: AFuF++loD0UuMVPK2VGdpAcNF1vfjkixL6sBGqEvVxbDMj3bAvM15qap
	WBOrAYO7YH2KGckY0srOtIRuWagte3uIrS+3G0/ZA2nNbN3QMinVAf08
X-Gm-Gg: AYBFou2/cc3+1ZwrVJg+ipuMHnFvYoHXmNzFT7Rfxu6xJo+hSDlrHWFZ03SuJCuHvK6
	whOtNXW1HEjG6IfsMUU8yzap4xDz851xYS1IPafRE1q78vYMIGE7TBuujIN4LjUZ53E+UgvLNv0
	C4KHcgJ31gwAMm0Q6tE0qHK/rETTOLqEaLX8aZrWJi4g7AfJwDWiWETynjDSZUCgGOiiihSvwzB
	lCfg2hD6Lk8erOHqnWI47DRju2VvVNpvURPVkan+5NqTry5b+hfxe6VQGelhrCsNtukdZP8Ai1R
	ytvG8mqHonclPEuP/Ycsdf8O3FzvJRwDddelPmhtWIljFLK+roodliUoNiLqj/Pn+ionyoYVo5z
	UuoaklN8kpxScT8d3SG+uKgDpxK0Ubo/2UwzFz6w9P+XcEmGeiqTfhnrkZuiiIyHz5pdYYsDpM7
	sRd5lxB+gTOhDHPAv+rsAmjunfbPSMXUjh0oWiwn5sn/cIV2Xoye2rpRyFU6I9qPEDWk0ugDhL3
	7uTz6lK97uJCy+YBSuwS6YNAMHxiECeZMw6vxFffWzlpYVA7zDzFILAo24Lp8sou2mxwwDjrfsG
	gFOdUPkTSQ==
X-Received: by 2002:a17:903:11cc:b0:2dd:7979:246 with SMTP id d9443c01a7336-2ddb1b78d80mr107805005ad.16.1789853814114;
        Sat, 19 Sep 2026 14:36:54 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba55bsm13079025ad.57.2026.09.19.14.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:36:53 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	brauner@kernel.org,
	cmllamas@google.com,
	aliceryhl@google.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] binder: forbid VMA splitting and mremap on binder mmap
Date: Sat, 19 Sep 2026 21:36:53 +0000
Message-ID: <20260919213653.3317260-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`binder_vm_ops` does not implement `.may_split` or `.mremap`, and
`binder_vma_close()` unconditionally calls
`binder_alloc_vma_close(&proc->alloc)` (which sets `alloc->vma = NULL`).

If userspace calls `munmap()` on a sub-range of the binder mapping (or
`mremap()` to move/split a sub-range), the VMA is split into two VMAs
sharing the same `binder_proc`, and `binder_vma_close()` runs on the
unmapped half and clears `alloc->vma = NULL` while the remaining VMA
stays mapped in the process's address space, desynchronizing
`alloc->vma` from the remaining VMA.

Implement `.may_split` and `.mremap` returning `-EINVAL` in
`binder_vm_ops` and check `vma->vm_start == proc->alloc.vm_start` in
`binder_vma_close()`.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/android/binder.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 8f2ef1bd539f..1c7218e599a1 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -6023,9 +6058,21 @@ static void binder_vma_close(struct vm_area_struct *vma)
 		     proc->pid, vma->vm_start, vma->vm_end,
 		     (vma->vm_end - vma->vm_start) / SZ_1K, vma->vm_flags,
 		     (unsigned long)pgprot_val(vma->vm_page_prot));
+	if (vma->vm_start != proc->alloc.vm_start)
+		return;
 	binder_alloc_vma_close(&proc->alloc);
 }
 
+static int binder_may_split(struct vm_area_struct *vma, unsigned long addr)
+{
+	return -EINVAL;
+}
+
+static int binder_mremap(struct vm_area_struct *vma)
+{
+	return -EINVAL;
+}
+
 VISIBLE_IF_KUNIT vm_fault_t binder_vm_fault(struct vm_fault *vmf)
 {
 	return VM_FAULT_SIGBUS;
@@ -6035,6 +6082,8 @@ EXPORT_SYMBOL_IF_KUNIT(binder_vm_fault);
 static const struct vm_operations_struct binder_vm_ops = {
 	.open = binder_vma_open,
 	.close = binder_vma_close,
+	.may_split = binder_may_split,
+	.mremap = binder_mremap,
 	.fault = binder_vm_fault,
 };
 
