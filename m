Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A90A556BBC
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 17:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792083981; cv=none; b=Id8MC0DjiepoijbKqtGc3E6Ylb48Tj0EJIi/IBvCXxZWCvmfbfB7E2E20227/9gzwbrOJzy9FErHwkLXMGIG5ZeU0fX/UVqsN0Uu38GBxxLdj/0B/BG+QJGVxYCHHZnQbY/gQnjcthNxIfDYUsZT8xSctKUk3Fc/yaUz+UM3A4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792083981; c=relaxed/simple;
	bh=qHNvC7JKMWk3d9f+xJFA0sUxTFWs5f73eVLdOqvT9Ck=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CoWcumDYkKQtuRihNObVTjsP41AARtBHxvnonfBpz7QOFDDtuxsMGs+i2upt5Ox5ULhFX/lsOUR6rQ0ach/0ukhoi6XpVnJxXmhB7lGyMp8kiAR7deiLiTU9EMXwfZBVsnFyphbAo7r6skJnJmxMDLo6MALjIKertPxONrtEFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ywww01NV; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ywww01NV"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-89f0a21880aso230731b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 10:06:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792083959; x=1792688759; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F6mWt9wIVZrB4sjNqoUTGMgCNXO6bXLWh2pklh5yhSU=;
        b=Ywww01NVKzNPXXUWyYYvR8BtpX8FfujIdPTEjv07FAm6OnO24UOTCpdtN6XNL55Dg1
         n9sSEZUaOkGqKyCvE1pW0ELZK/iWJeB1BL/4Qv+o093PssU2Pn5kuZLmNZJFf73dFbic
         c8z2cXvREOZr4Lb+uqi6svwqoh6UClhweT5UsF26rWI8D/5HQ7dhYFIDRRitumq42nCd
         bLp3RItpNR7KG/TmegPcath/JM24HgsbleReSmThGK4tbMhpIw5Z2wM6F18uJ93UqgNA
         nmr6aoUz5U917otcLDAted0ZBRs1QP9Bvwg4EGlZxKF9kLAzYn0UAVrEhm8haYBaSKGR
         BLGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792083959; x=1792688759;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F6mWt9wIVZrB4sjNqoUTGMgCNXO6bXLWh2pklh5yhSU=;
        b=ngSeP3H3yr+t+r7wysNAWmKOJsSXO1PY+TwhriNbuGsewztuF+QQAzbsojbi7X4HkE
         i/uE6zYW7YABOUJryozc6q9XcLWNGXOE4Gn5QxMD8BP8WFKnTj+fqduzT1e/Z7QFxDeH
         /tHYEVcISRh8aKWQwBJ4HAxk6DIZJ9OctvBbjVzoZRJjtAFpvKy2xE72/mkbrX3eV3bt
         AK5Q80LCtB4xjmDeeiW2JAAjC0aUnttUBoJxhRJVSzc40lWnIMKrkWOONgyy0jiSp1MQ
         zKZqGzXTniGnTg6ha0aMVVOQNnAMerf3XylCZMhIYqpbM/W6576+1DbiPmTwE1lZwOGm
         zb8g==
X-Forwarded-Encrypted: i=1; AKwUvBySMmfgWd4riOChadw/cALYkbF9s2aOhaSWTK3qPkpW1Hlsgeah1dG4bJ16hwDaEvxuBlszhw6d4NdkWDk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK8aBVLGwcQj/wHdDlNL0gPNShnerGDRxSQd4kvSSvJCgWJOZdb
	ZPKKbtILlpzMZu6BKoW3H+gc9smIbcmw7PqNLpdKvfAAjkzcHzTPAN2tK/wxxxD6
X-Gm-Gg: AYBFou1/49t9EeoVFxeDFbvvCCHNlC/TOdLQba1wSt8JUbtnXZ+xkr5rSiHGivkN+Mr
	S34p1tMjMg8CFhK0gvmtCq3mlLCw9/ZsGDN+xQGgqwqrzag9tNa0FeWmB12Y20Zv3GRgwzbgM7t
	PF48Jd6mDlieU76LJqD7jlwU+C5d1eNkIweNWfrc/qro8zQ745nFStkN5/H+RgnZVPjE1m1nnSP
	ip3Ycc3MB2tfDtnz75nN2JsvPQ5VK/QcG7YtbfUI8zWhQEzMmlZxcylBTNhpvrs8sTEIPq2Q2S1
	7Wx87uvEZBSN21GTGl01H90r4BKeFRQbyg4yvze5wJMNW+nXM6ADywKrxcH8Xci8RgdQxVphxIJ
	/NO/WEnzcyxLhfzNNDIpX1qxTtBC34dcAwuHzOAoHsvgn1Nz5Y8L/Btd57+G8WP2BC7InZ5+2Tk
	J+hw1MAmJiJ2s2QALe6IE7BKzmibHz4o+xx2ZVkpf9AEt2BG7uWUBYhkdqkHGwXh09S+2utWzTH
	Ra0xds7qys=
X-Received: by 2002:a05:6a20:431e:b0:3e0:bb59:7fc0 with SMTP id adf61e73a8af0-3e16beb6bf1mr16704479637.52.1792083959380;
        Thu, 15 Oct 2026 10:05:59 -0700 (PDT)
Received: from ancienth-X870E-Nova-WiFi ([125.186.72.2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd635c57edbsm1575938a12.15.2026.10.15.10.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 10:05:58 -0700 (PDT)
From: Daehyeon Ko <4ncienth@gmail.com>
To: Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>
Cc: David Hildenbrand <david@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hugetlb: retry private VMA locking when unmapping folios
Date: Fri, 16 Oct 2026 02:05:51 +0900
Message-ID: <20261015170551.2656546-1-4ncienth@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hugetlb_unmap_file_folio() takes a reference to the hugetlb_vma_lock in
vm_private_data when its VMA trylock fails. It then drops i_mmap_rwsem and
waits for the lock in the established order.

That fallback is only valid for VM_MAYSHARE VMAs. Since commit
bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs"), the
trylock can also fail for a private owner VMA. Its vm_private_data contains
resv_map | HPAGE_RESV_OWNER, not a hugetlb_vma_lock. The fallback then
performs a misaligned refcount operation and treats reservation-map list
fields as an rwsem.

Private reservation maps have no stable VMA backpointer. Drop i_mmap_rwsem
and restart the interval-tree walk when their trylock fails. Keep the
referenced fallback for shareable VMAs.

On a system with a pre-provisioned hugepage pool, an unprivileged
reproducer racing mprotect() with hole punching triggered the refcount
warning followed by a general protection fault in rwsem_down_write_slowpath
on v7.3-rc5 and 6.12.111. With this change, a v7.3-rc5 KASAN+LOCKDEP build
completed 1,000 rounds and 64,000 hole punches without a warning, lockdep
report, oops, or panic. The reproducer is available privately on request.

Fixes: bf4916922c60 ("hugetlbfs: extend hugetlb_vma_lock to private VMAs")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Daehyeon Ko <4ncienth@gmail.com>
---
 fs/hugetlbfs/inode.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/hugetlbfs/inode.c b/fs/hugetlbfs/inode.c
index 7611a8470ea265..9a676228e2070a 100644
--- a/fs/hugetlbfs/inode.c
+++ b/fs/hugetlbfs/inode.c
@@ -402,6 +402,17 @@ static void hugetlb_unmap_file_folio(struct hstate *h,
 			continue;
 
 		if (!hugetlb_vma_trylock_write(vma)) {
+			/*
+			 * The referenced fallback below is specific to the
+			 * hugetlb_vma_lock stored by shareable VMAs.  A private
+			 * owner VMA stores a tagged resv_map pointer here instead.
+			 */
+			if (!(vma->vm_flags & VM_MAYSHARE)) {
+				i_mmap_unlock_write(mapping);
+				cond_resched();
+				i_mmap_lock_write(mapping);
+				goto retry;
+			}
 			vma_lock = vma->vm_private_data;
 			/*
 			 * If we can not get vma lock, we need to drop

base-commit: 0fcb05b72344f40806cbe810de8872f1698bf053
