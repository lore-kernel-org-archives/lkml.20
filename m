Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.231.40
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605473;
	b=wMrLU2JFbiHTPc3XZ4f7noKdNYTUSzogSiL3q6E14cDmQ4YYGo6iR5xIEHl0el6u/emX
	 123goDxPT/MjKO3RnAa0GqDbnVF76xsnJ7C8nsWKiBVAi50p7m08Z8tl1oOlBnDqjrXaz
	 8ZqUyHaBhCFvebDUQYbuARWSTiAExbVU0XU4viQG8CpYVYQqPc8NjWKFVLGaE3s0m9Xec
	 5x2p0rWlo7WUFyubXTyvvqkbTxP8JY9tg601+TCkFLwAvFpshZ0YB9MLbwluNv9Ez0h2W
	 CNnmTVaPiuy9EpXmLRmsm+c7zDhk+ScIUit28ULEt+zg34076SMmjrMsvhe76GjG50w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605473;
	h=DMARC-Filter:DKIM-Signature:Subject:X-Original-From:X-Mailer:
	 Content-Type:Date:Message-Id:Mime-Version:To:Cc:
	 Content-Transfer-Encoding:From:Received:X-Lms-Return-Path;
	bh=Be7kBnZ2pN0tqA9jaxkboOxPRK3z4kRNDuaOawCuGhc=;
	b=wKH7/xYi9TYsk3rLJxiOqyXROx+V3sY9mNLP12PcxlzSvjrsczo/ei7E7HTeYJHcN6sp
	 CUvgyjGEcvndGA14aAfAuEBoGZ6UpCRL4n2P5kW0dkgu8Rjbq3A6XkvW7nKU/29z/JuGW
	 00TdCl6+oqpb/4lVrqw9SjuNL3PPqBwGVHaXzU+1wGdA0zjTN7bY/Z/6NsNRQj4r+CIWi
	 zvLS327PS/DBG0Dnda1HG1EDFA9mSX32V2wlc8TGpVo8SPTF9a91zpTvB9cZPSg3kiF2+
	 FlSDLK7tpxHsisL1Jz9GSPmX3zLQeEnvP5mPMaAY3rQCs0Mcg/qB3YZQ7xa+JtWuj+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=insta360.com;
	spf=pass smtp.mailfrom=insta360.com;
	dkim=pass header.d=insta360.com header.i=@insta360.com header.a=rsa-sha256 header.s=feishu2606151854 header.b=K2xs9Spj;
	arc=none smtp.remote-ip=209.127.231.40
Received: from va-2-40.ptr.blmpb.com (va-2-40.ptr.blmpb.com [209.127.231.40])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D04D560A260D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 07:44:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D04D560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=insta360.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=insta360.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=insta360.com header.i=@insta360.com header.a=rsa-sha256 header.s=feishu2606151854 header.b=K2xs9Spj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2606151854; d=insta360.com; t=1793605467; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=Be7kBnZ2pN0tqA9jaxkboOxPRK3z4kRNDuaOawCuGhc=;
 b=K2xs9SpjHAbdEeUy0innDOLhtFpj02SdiiQmhlNBBadRidw8E59HY5eEOPaFqQLFa5pbBH
 8YCTi3Q2a5tnGey0dDEZDsrtKij8hSeF9LIetpXtUkSpXeiRMpcxJYXHOgGS+v+ASTeeeH
 XauavRHQZgOQu7s/nBROxM9HQ5JFknXIPylFQtrlB1ht02sFKJo1ALliYqRyfhd3hcZv/Y
 HtM2Gg58tyZ3RycbPCgdd8z2Y1CJHWiW2eGiuBY0Sv0jQV2C2ggMAhFnLUXo7/uCjyW6ft
 vK9n0NctloBLkArrhzx9TNyjvuiBDr5Za/kphgPJt9aLayuV1gIyRPFU6jFNSg==
Subject: [PATCH] mm/vma: fix NULL anon_vma deref in validate_mm() under mmap read lock
X-Original-From: Songsen Yang <yangsongsen@insta360.com>
X-Mailer: git-send-email 2.53.0.windows.2
Content-Type: text/plain; charset=UTF-8
Date: Mon,  2 Nov 2026 15:44:13 +0800
Message-Id: <20261102074414.10902-1-yangsongsen@insta360.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
To: "Andrew Morton" <akpm@linux-foundation.org>, 
	"Lorenzo Stoakes" <ljs@kernel.org>
Cc: "Liam R . Howlett" <liam@infradead.org>, 
	"Vlastimil Babka" <vbabka@kernel.org>, "Jann Horn" <jannh@google.com>, 
	"Pedro Falcato" <pfalcato@suse.de>, <linux-mm@kvack.org>, 
	<linux-kernel@vger.kernel.org>, 
	<syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com>
Content-Transfer-Encoding: 7bit
From: "Songsen Yang" <yangsongsen@insta360.com>
Received: from DT-9806 ([58.251.139.251]) by smtp.feishu.cn with ESMTPS; Mon, 02 Nov 2026 15:44:23 +0800
X-Lms-Return-Path: <lba+26ae83f59+6673a7+vger.kernel.org+yangsongsen@insta360.com>

Since commit 38564710f443 ("mm: implement and use vma_has_anon_rmap(),
silence KCSAN"), validate_mm() decides whether to walk a VMA's anon_vma
chain with vma_has_anon_rmap(), which re-reads vma->anon_vma, but still
locks the anon_vma pointer it cached at the top of the loop iteration.

vms_complete_munmap_vmas() calls validate_mm() after downgrading the
mmap lock to a read lock. A page fault on another thread can then
install vma->anon_vma via __anon_vma_prepare() between the two reads.
The check sees a non-NULL anon_vma while the cached value is still
NULL, and anon_vma_lock_read() dereferences it:

  BUG: kernel NULL pointer dereference, address: 0000000000000000
  RIP: 0010:validate_mm+0x143/0x2a0
  Call Trace:
   vms_complete_munmap_vmas+0x201/0x2d0
   do_vmi_align_munmap+0x285/0x2d0
   do_vmi_munmap+0xcb/0x190
   __vm_munmap+0xab/0x190
   __x64_sys_munmap+0x16/0x20

Read vma->anon_vma once and use that value for both the check and the
lock, as the code did before. Under the mmap read lock vma->anon_vma
can only go from NULL to non-NULL, so a non-NULL value read here stays
valid until validate_mm() is done with it. Keep the data_race()
annotation that vma_has_anon_rmap() provided, since a concurrent
install is expected.

Only CONFIG_DEBUG_VM_RB kernels are affected.

Testing: on top of mm-hotfixes-unstable at commit 989bf98b512c
("iov_iter: validate extracted segment for bvec alignment"), x86_64
under QEMU TCG with -smp 2 and CONFIG_DEBUG_VM_RB=y. The race window
is too narrow to hit with the syzbot reproducer under TCG in the time
available, so a debug-only mdelay(1) was added before the check to
widen it: without this patch the reproducer crashes with the splat
above in its first round; with this patch and the same mdelay(1) it
completes all rounds without any splat. The mdelay(1) is not part of
this patch. mm selftests were not run.

This issue was analysed, and the fix, changelog and tests were
prepared, with the help of an AI coding assistant (Claude); the
submitter has reviewed the change.

Fixes: 38564710f443 ("mm: implement and use vma_has_anon_rmap(), silence KCSAN")
Reported-by: syzbot+10e72ea5747737bcd2ad@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/all/6ae78418.6552420f.2a0efc.005c.GAE@google.com/
Signed-off-by: Songsen Yang <yangsongsen@insta360.com>
---
 mm/vma.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/vma.c b/mm/vma.c
index 4672d4205..b674c69f7 100644
--- a/mm/vma.c
+++ b/mm/vma.c
@@ -679,7 +679,7 @@ void validate_mm(struct mm_struct *mm)
 	mt_validate(&mm->mm_mt);
 	for_each_vma(vmi, vma) {
 #ifdef CONFIG_DEBUG_VM_RB
-		struct anon_vma *anon_vma = vma->anon_vma;
+		struct anon_vma *anon_vma;
 		struct anon_vma_chain *avc;
 #endif
 		unsigned long vmi_start, vmi_end;
@@ -703,7 +703,13 @@ void validate_mm(struct mm_struct *mm)
 		}
 
 #ifdef CONFIG_DEBUG_VM_RB
-		if (vma_has_anon_rmap(vma)) {
+		/*
+		 * Callers may hold only the mmap read lock, in which case a
+		 * concurrent fault can install vma->anon_vma at any time. Read
+		 * it once, so that the check and the lock use the same value.
+		 */
+		anon_vma = data_race(vma->anon_vma);
+		if (anon_vma) {
 			anon_vma_lock_read(anon_vma);
 			list_for_each_entry(avc, &vma->anon_vma_chain, same_vma)
 				anon_rmap_tree_verify(avc);
-- 
2.50.1
