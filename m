Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A431749B203
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790261343; cv=none; b=diWEyT9Bx1+89vZ5/TcsIKaeXyqP/T5rGWuitTVWVHdmbOMnMavpZpIdYCoJ7nwcNHwDJf7VL9PQ/9u49q81dlpQ/3krXeIp/B3+xLZ3NeZDrlTfkD2LZO/AZaCT/zbmD7UwT+DldImST19wFuruQyQNObI3XJlVnxdlPgcu/iw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790261343; c=relaxed/simple;
	bh=ZdGZct0TOO0xWQUR2P2vX192qB2uqrOpBR+IwqHzVOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=jOxQL+QmAsLK68gd6bFoSdOeJoPgmmJIvTLJeo741ASFm8ikaYQs9xyAsFagLlj3VipcooDwrX9SFOUUXptatiYOJZ7SyQeS/t/EllTvAjDSm46m9+dT0U/yDeQHwprQmISxJ8XLzFFxNGaSAy6q88QU0Q+OvnPIejAJzeFZzpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtMiur73; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtMiur73"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73EE21F000FF;
	Thu, 24 Sep 2026 14:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790261335;
	bh=Ef8wq2izULSXVId0JXzBJbDsipWW1k2VtR4xrhp74CU=;
	h=From:Date:Subject:To:Cc;
	b=CtMiur73rgdpsv7DLPuFaeMmrEkdTtqnye4sQnYnbVD0lufUeqnOCMmhTVmkDn5Y2
	 EhLMHwljSI23Va+QQIaefZzjqO7lOMMj4p+48mv01J6wP7eQNrRwNyLMvz4O5PJyrm
	 1OAWd+8qfDxbfOTG5G89ETVeUR4QCMg8EV0uTwjjJFpZInaZgQk2WPJZ7axwiVTvTw
	 rO58q2zA2lziHgNKge4XLsHlkDz9XkjFkNK5P1nr7pabX6Jiv8vNNtHUc54tcpK/aD
	 orfA91SjsKeZVl+qVaHH/xor0PJwbXYoAOpYcaX86thGF735KrV/xlQ73b6QRuOfFN
	 UnkFRGCZEw0IA==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 24 Sep 2026 15:48:24 +0100
Subject: [PATCH] drivers/char/mem: mmap readonly MAP_SHARED-/dev/zero
 correctly
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-fix-dev-zero-readonly-shared-v1-1-153c2111e323@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqDMBBG4avIrDuggw3oVYqLkPmtAyUpExBb8
 e4NXX7weCdVuKHS3J3k2K1ayQ3DraO0xfwEmzaT9BL6SUZe7WDFzl94YUfUkl8frlt0KK+iY0j
 DPSQItcXb0fr//rFc1w9TrLi4bgAAAA==
X-Change-ID: 20260924-fix-dev-zero-readonly-shared-f2d46c156ce2
To: Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Jann Horn <jannh@google.com>, Pedro Falcato <pfalcato@suse.de>, 
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 Lance Yang <lance.yang@linux.dev>, 
 syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com, 
 "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2333; i=ljs@kernel.org;
 h=from:subject:message-id; bh=ZdGZct0TOO0xWQUR2P2vX192qB2uqrOpBR+IwqHzVOI=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLK2WgSsy2CZtJHLbn3XcydmNrXLVp1K91cI/Z+15Jn/u
 T1zN06e3lHKwiDGxSArpsjy/Iv4/iCRsHmdF/zdYOawMoEMYeDiFICJ7FjI8L9ont2CFR/arG9m
 bJIt+1KkI5pnbvWQ0Y5BKOPMK4+TKxUZ/rtuO/RQW/hPz5RX+/8/2H9Y1TRit0Kie3JVq+r8eaF
 hL9gA
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Rather surprisingly, opening /dev/zero read-only then mmap()'ing it
MAP_SHARED gets you true anonymous memory (albeit in a VMA with
non-NULL vma->vm_file).

This is a by-product of MAP_PRIVATE-/dev/zero being how anonymous memory
was mapped in Linux's distant past.

It happens because mmap_zero_prepare() gates on VMA_SHARED_BIT and when
mapping a read-only file MAP_SHARED, do_mmap() clears VMA_SHARED_BIT and
VMA_MAYWRITE_BIT.

The gating is incorrect - the (poorly named) VMA_MAYSHARE_BIT flag exists
explicitly to tell you if something was originally mapped MAP_SHARED.

So the fix is simple - gate on this instead.

This isn't exactly a common use case, but it's unexpected behaviour which
now causes an assert if CONFIG_DEBUG_VM is set.

While this bug has existed since the dawn of time for linux (or at least
since 2.6.12), it hasn't caused issues in the past, so while it's incorrect
behaviour, it doesn't seem necessary to backport that far.

The mapping is now accounted at mmap time and can fail with -ENOMEM under
strict overcommit, and read faults allocate folios. However this is normal
behaviour for a read-only shmem mapping.

Commit 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track MAP_PRIVATE
file-backed anon folios") is the first patch at which the debug assert
fires, so target that instead.

Fixes: 93c0c8dc87f6 ("mm/rmap: use anon pgoff to track MAP_PRIVATE file-backed anon folios")
Reported-by: syzbot+c181d3198e98f8aef8b9@syzkaller.appspotmail.com
Closes: https://lore.kernel.org/linux-mm/6ab4ae75.80e1c6cc.1e8e5f.000d.GAE@google.com/
Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
 drivers/char/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 63253d1de5d7..5b93c92c2cf1 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -503,7 +503,7 @@ static int mmap_zero_prepare(struct vm_area_desc *desc)
 #ifndef CONFIG_MMU
 	return -ENOSYS;
 #endif
-	if (vma_desc_test(desc, VMA_SHARED_BIT))
+	if (vma_desc_test(desc, VMA_MAYSHARE_BIT))
 		return shmem_zero_setup_desc(desc);
 
 	/*

---
base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
change-id: 20260924-fix-dev-zero-readonly-shared-f2d46c156ce2

Best regards,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

