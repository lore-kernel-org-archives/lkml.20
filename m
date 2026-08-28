Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8300A367B96
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 09:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910517; cv=none; b=mhfyaJE8n9aR3ASQ6DNU0pkfpb5SPhYibAc6dLfsZG7YSP50fPkOAuLAlCt4ylTMXVf3dPPbHCFVQ9RvRiTTsqfjWIpooGqvaifZvldE8H7uoBB2pXHP7TtaUx6gAJspyodz/vziIfRDZi6lt9KiegFM37gJqAImNFlkY5wJQ80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910517; c=relaxed/simple;
	bh=8IuohYJIFQq7XvofNgNPwVDtDoQLhfZC62FmH3VKmfM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MNvErqoMog/BcP8MNitOwATbzwgwe+lVYLKnwGWod2tvRIAqfIAfSuTI4f+G9SGzzraWVIo2MlwNLH9FDrffWXMf5nafrcIgBzu3dAZZ6+88/hjrVz65SsLkBVcGNPjRqBs3P0wACORwEiqHtPnRiBTCneQ6YmivUvp+3N/LzCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IIVI867I; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IIVI867I"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d5335cf904so7573555ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 02:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787910516; x=1788515316; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=glXaJJLLc7413zYTPQe8CxMRLtRUMADuZ7/9ajV0cjY=;
        b=IIVI867IcRoqi9VOfWGb0hpKKI/vEC3ZJcN/3n9jveYsiJaU/Z0R3y43lfPa+FM61s
         vEvJvBqoDmkM3VeKbxfkHt0kNlRCSucw7ZguMoZ74dlvLKdpxfeKVt+BNJp8LbST/UIB
         CG2KRMHfFXcHxxj2igGRixUz7LZIcE736TAFuZ90hcFUKo18EpoCbbxV2eb5Yen7Srid
         Xr90QHSmPQj1krce9k6W9Dhvl2RuefA80UmVNGSTatQnE3RzD6JdKt9s2RqvOa5fS2R6
         LCKuavItkaWAWefLjLmn9O05Rv83abIk8evGKtadFwTXYxW8LpUY1yUXKbosyZDxBzu8
         CP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910516; x=1788515316;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glXaJJLLc7413zYTPQe8CxMRLtRUMADuZ7/9ajV0cjY=;
        b=Jt6mYCr4qzxI0cruU9QVRnm4hzTrht+Xsv+xqLNBOxRVhX7r0nYoOqZhUkoa9BCltz
         51XWqxrvdrOrb+Ej0ss5gjKt9cg68AbLlD/SDdPEcov99uch3wQnutrS4rbMCd78sZHk
         ds0M8ycig5rqaIzAa5MZFwQ6StKwecfZBY/zszdGNfDSQnCUlhnOOLvfcN+1nDHex00C
         uHum5VmpsGeIFQqS27am5tnNsAfbJJb60C+AQrBxWibZuz7zoDoxP7vSWX8/KrjHNvc8
         FtjM65brZrbhY0v4sOei41KfER+uP0MQYdpMvpMLcaCBPyElQ/El3Wxn/tnKh03EdLZE
         8Pqw==
X-Forwarded-Encrypted: i=1; AHgh+RqNe9q2kNmNu+XsKzxBER+njJ/KP68C2zBXIRnn0aGkodqJ3eoJAVYWfHGI3LGeLo1+cRE7EGRcBHSr230=@vger.kernel.org
X-Gm-Message-State: AFuF++ltyFb2puncBmdyVSQ84DDOWaHr3zdTFeaginPf//wISTcbEvEg
	bKm7sqDwjitDZvWXi16ggo1Y/9UyLachfAUoM7J1BJTRZ5vdGTWY5VLz
X-Gm-Gg: AR+sD13lozyod5oxUPM14QaqIfjFPflIWR7XfUi9G8UsqmHw+ocHZ0evQ1FnKJkcvUQ
	bS9XFsX8RBsRKaABHuMqS8UrS58o/5yWxNl5zXx/z/fu3K0bNOBwHAnBdbsUjuu5zNgIUisTyIC
	xESn4luZsu3qQEU9SfN6pBj9tV/QVupZyJ8FKstMG+KVZyiNIoe7uhDHhkani+AwrIhzCiGv//5
	6oglsnFYL1e6hKZ3cgqzqnRYSIOspzT8Iax55WQ9R/4aX48FjBiTmyDZY+mnFHOzD9UY0viGP+6
	SAPBrnWzQ3a24r7yI+sensQEyNyxUGGtUw3kIAkRuJbjYzqj5h+hSOrxKPka7XYIomgec6ZDWeC
	kZfkb23JuuPjxv72dsd1DY98xhmXT1YnszbaN8z66nCmfGeep4UX9B6BLtSmT49bRSw9YPx78rn
	IF4TiiUdL5fP1PZa90bxlvcx2TUuIrpj3grvOhSZNp+vKQcIvwuXi20w5awBqbAsRtfgbBt2B5y
	HDt+fQ=
X-Received: by 2002:a17:903:3a8b:b0:2c9:d88e:f996 with SMTP id d9443c01a7336-2d74dee96b5mr108548445ad.9.1787910515336;
        Fri, 28 Aug 2026 02:48:35 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d759531f5csm3778075ad.28.2026.08.28.02.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:48:34 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
X-Google-Original-From: Kunwu Chan <kunwu.chan@linux.dev>
To: akpm@linux-foundation.org,
	liam@infradead.org,
	ljs@kernel.org,
	vbabka@kernel.org,
	jannh@google.com,
	pfalcato@suse.de
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] mm/mremap: fix locked_vm accounting for MREMAP_DONTUNMAP
Date: Fri, 28 Aug 2026 17:48:22 +0800
Message-ID: <20260828094823.594279-1-kunwu.chan@linux.dev>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kunwu Chan <kunwu.chan@gmail.com>

When mremap() is called with MREMAP_DONTUNMAP on a locked VMA,
vrm_stat_account() increments mm->locked_vm for the new VMA while the
source VMA is still marked VM_LOCKED.

For a normal mremap(), the source VMA is subsequently unmapped and the
munmap path decrements mm->locked_vm, balancing this accounting.

With MREMAP_DONTUNMAP, the source VMA is left in place and
dontunmap_complete() clears VMA_LOCKED_MASK.  When the source VMA is
subsequently unmapped, VMA_LOCKED_BIT is already clear, so the munmap
path does not undo the increment from vrm_stat_account().  This leaves
mm->locked_vm over-accounted.

Undo the locked_vm increment in dontunmap_complete() before clearing
VMA_LOCKED_MASK.  MREMAP_DONTUNMAP requires old_len == new_len, and
only VMA_LOCKED_BIT is checked to match the accounting performed by
vrm_stat_account().

Fixes: b714ccb02a76 ("mm/mremap: complete refactor of move_vma()")
Cc: stable@vger.kernel.org
Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/mremap.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index e8df5cdb0ac..37ea5ee1986 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -1334,6 +1334,14 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
 	unsigned long old_start = vrm->vma->vm_start;
 	unsigned long old_end = vrm->vma->vm_end;
 
+	/*
+	 * vrm_stat_account() accounted the new VMA while the source VMA
+	 * was still locked.  Since DONTUNMAP leaves the source VMA in
+	 * place after clearing VMA_LOCKED_MASK, undo that accounting here.
+	 */
+	if (vma_test(vrm->vma, VMA_LOCKED_BIT))
+		vrm->vma->vm_mm->locked_vm -= vrm->old_len >> PAGE_SHIFT;
+
 	/* We always clear VMA_LOCKED[ONFAULT]_BIT on the old VMA. */
 	vma_clear_flags_mask(vrm->vma, VMA_LOCKED_MASK);
 
@@ -1343,8 +1351,6 @@ static void dontunmap_complete(struct vma_remap_struct *vrm,
 	 */
 	if (new_vma != vrm->vma && start == old_start && end == old_end)
 		unlink_anon_vmas(vrm->vma);
-
-	/* Because we won't unmap we don't need to touch locked_vm. */
 }
 
 static unsigned long move_vma(struct vma_remap_struct *vrm)
-- 
2.43.0

