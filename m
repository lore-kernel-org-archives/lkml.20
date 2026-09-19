Received: from mail-pz2-f34.google.com (mail-pz2-f34.google.com [74.125.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5843612FE
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841403; cv=none; b=cvXcj9SO8gJ4R5FYUYf8RM6Yjrtao49Ob1rsLU7IhUvzA9rJdijnw2mwqDNKTdcYBBDaGDipa7ZDqgXltR5/xLBZfXhcNeZfrs+pm/UFH3Q1pLzYX1f52eQv5FcWKoWC79lMTVck1LuouUUoxbJEKnu7Iqw9HRQfQ96rTpWnFzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841403; c=relaxed/simple;
	bh=aAVSFY76lgQO01OrSs7ssic/mi+/CMLDEcviR6+3myo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HWQ3Vo58C6twok1ruYaH1MP7GjvUC+Fh3GhbsCdqsXCbrOmvyI7xbLucH9QWK7rJWu/e4AQZ01JsT5lKPrNmyqG/I/ATH8STy9mGpNG+kVJe1sTv4ctE6Z2DUvw9CTAHTcsH+d7sLWy9WVyMcv9EYwSYpXoPvYzMnD615IAYznY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=raE5cUlQ; arc=none smtp.client-ip=74.125.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="raE5cUlQ"
Received: by mail-pz2-f34.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so1735087b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841401; x=1790446201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lGaU0pxyX4HFuiN75gQbxqPfhwQhSeDU8rlnsi/9iUE=;
        b=raE5cUlQwsuD61WNt03zs4CAbcF/CCnSxuCtzmfkp5LqT9WPC4Avw0iWxdctigd8rt
         VZWbutg//Vc9Qga2KZxUAuE25zPfHf6WPdAiABHr+nFDqohieY/LNDEeaJo0xXNFydt7
         fNzBSsDd+kEeCp2jNnWuqYgTYlUvtZpIOrJ2sCHmw4JabzU7MuMcSX0l8PaOkw9zTucH
         Sered+IS549czDWPXr6Q4jRfGXslDDkYs/icNxlppjlsvpaCpI21HzADlOT953WFXs8o
         +l/Mj4cWWJt/hdrcVnvKcL59N4Gntg8dc8c/B7uJGxAwQITSLAVhki9fahpVPdDwQCiD
         KMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841401; x=1790446201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lGaU0pxyX4HFuiN75gQbxqPfhwQhSeDU8rlnsi/9iUE=;
        b=p8JB6LI254ZRgAlWkK31eU3AtY+vQBYFgCXzllPDt7xD1u7deibIf4XkCGXPtsM/n+
         dRumvz/PcblsJrm7iFCO49T1s+GG+gMZtpmGuHH1VsjRYfGZdBKq7er11m2c8Wd05P/2
         y/Ll7DbNDwjNSWSy0aANIJJgkp442Fgq3SAo/YvA30LfHTSH6l1ODVjRMcdk0e4Wi+DJ
         7hannxIU3ucX0daHXvRLiJluSCHEyyM17sWstIJsUTyJ1kBR0tY6BVjlE4+5HbVnEWpx
         h5s9y63ezMI/SyI9LPWLJhv6gsaIIv3kxnwMFsl3kapv4Ydzw9+tyl9t8d8wpjFeDXG2
         pPuw==
X-Forwarded-Encrypted: i=1; AKwUvBxV1rfnTLHnTUzLmDAfjbZsXCL2IH0qIFZjV89WSy050Zj4gNuJ/4PnYBuhc90xgwfqGmNqPab+pL8MZqE=@vger.kernel.org
X-Gm-Message-State: AFuF++mKVS+SPN8XRILkAk03kFV7Y6NEwCm+za66w5tefQWd7hiuq6SR
	GCdkKwcZzksga5hP4vwO9SmwCMYrjer+QCoFSO4NtEGd0PkfwuEnMzfp
X-Gm-Gg: AYBFou1q7RcVpdNdDls5RMSHZ7pgt811LxmGaZO+tzcjbWpiFkbLj79ZxCU98/rhxAi
	iBmrpiio2UmicAEoMPY0HcCQz62m79GQeMPwdkOnk6P3UuewZ7/6QiMaQ8esJ5s/a1ifAgjTaSl
	VXsvSgBBoA/SlfKDo1rNohzFHxqtutYiKS3NoxKnXJN3mg/XXCE4hBdE3t34At/4xUt+zwNqBuN
	QW3s/B0+yeoyrCkF320RU01SmSjnzFvqk0t6zhpvPhR4mgXhSsNaX3bYn6a1UErORyhEjYTzKtU
	AyYB6UjRec26n/F8x7/a1kUNMOCu3lV9soZTOrxLn0xQYBWNGO1kHEu+hmwd4IVT2K5ElchN6WE
	XADHKypmjamhCKAonUzwJ453ez8NqG7zypnrPhnLQDd1soSIz3F/v5f5zZnVBkny/QJnSxuASNH
	0EmwbE1yPOYQa0Q7wiFRFEsvnZnHcDoVcBkkvecgp2d/pWz1bb373DKDRqjtohOxWhgLPOCwwhQ
	Fr8jFyRCHs0eykbOG9GcP+iPyzlmsoynheueq4ao5R9gkNiVR+shUrxQD8QU9wAAFYOTyH6lebq
	jB7WBrVyxQ==
X-Received: by 2002:a05:6a00:1d8c:b0:874:705d:f657 with SMTP id d2e1a72fcca58-874deced87fmr8895022b3a.37.1789841401037;
        Sat, 19 Sep 2026 11:10:01 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f8c39sm1190168b3a.28.2026.09.19.11.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:10:00 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] affs: reject out-of-range blocks in affs_free_block()
Date: Sat, 19 Sep 2026 18:09:55 +0000
Message-ID: <20260919180958.1362943-2-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919180958.1362943-1-benquike@gmail.com>
References: <20260919180958.1362943-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

affs_free_block() accepts any block number below or equal to
s_partition_size, then subtracts s_reserved from it:

	if (block > sbi->s_partition_size)
		goto err_range;

	blk     = block - sbi->s_reserved;
	bmap    = blk / sbi->s_bmap_bits;
	bit     = blk % sbi->s_bmap_bits;
	bm      = &sbi->s_bitmap[bmap];

Both bounds are wrong.

block is a u32 taken straight from the on-disk file header or extension
block, and nothing rejects a value below s_reserved. For block = 1 with
s_reserved = 2 the subtraction underflows to 0xffffffff, so with a 512
byte block size (s_bmap_bits = 512 * 8 - 32 = 4064) the index becomes
0xffffffff / 4064 = 1056832. sizeof(struct affs_bm_info) is 8, so
&sbi->s_bitmap[bmap] lands roughly 8.45 MB past an allocation that is
only a handful of entries long.

The upper bound is also off by one: s_partition_size is a block count,
so the last valid block is s_partition_size - 1, and a block equal to
s_partition_size is accepted today. Because s_bmap_count is
ceil((s_partition_size - s_reserved) / s_bmap_bits), that block yields
bmap == s_bmap_count exactly whenever the partition divides evenly into
bitmap blocks - a one element overrun of the same array.

Mounting a crafted AFFS image whose file header references a block below
s_reserved and truncating the file reproduces the underflow variant:

 ==================================================================
 BUG: KASAN: slab-use-after-free in affs_free_block+0x5d4/0x670
 Read of size 4 at addr ffff8881068d4c00 by task init/172

 CPU: 2 UID: 0 PID: 172 Comm: init Not tainted 7.3.0-rc3 #1
 Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
 Call Trace:
  <TASK>
  dump_stack_lvl+0x70/0xa0
  print_report+0x153/0x4c6
  kasan_report+0xf1/0x120
  affs_free_block+0x5d4/0x670
  affs_truncate+0x635/0x1520
  affs_setattr+0x367/0x470
  notify_change+0x941/0x1050
  do_truncate+0x1ba/0x210
  vfs_truncate+0x305/0x490
  ksys_truncate+0xd9/0x160
  __x64_sys_truncate+0x59/0x80
  do_syscall_64+0xda/0x4b0
  entry_SYSCALL_64_after_hwframe+0x77/0x7f
  </TASK>
 ==================================================================

KASAN calls it a use-after-free only because the wild address happened
to land inside an unrelated slab object that had already been freed;
the allocation and free stacks in the full report belong to a boot time
kobject_uevent_env() allocation. It is an out-of-bounds read, not a
temporal bug, and where it lands depends on the heap layout.

AFFS already has a helper that encodes the valid range, and it has done
so since the beginning of git history:

	static inline bool affs_validblock(struct super_block *sb, int block)
	{
		return(block >= AFFS_SB(sb)->s_reserved &&
		       block < AFFS_SB(sb)->s_partition_size);
	}

affs_bread(), affs_getblk(), affs_getzeroblk() and affs_getemptyblk()
all gate on it, so a block that affs_free_block() accepts today is one
that AFFS has always refused to read. Use the same helper here rather
than open coding a third variant of the test.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
The last valid block is still freeable: affs_init_bitmap() explicitly
marks every bit mapping to a block >= s_partition_size as allocated in
the final bitmap block, so s_partition_size - 1 is the highest block the
allocator can hand out and affs_validblock() accepts it.

I have left out two further checks that I had initially written, because
both are unreachable once this patch is applied and I did not want to
mix speculative hardening into a fix with a reproducer:

  - a `bmap >= sbi->s_bmap_count` test after the division. Given
    s_reserved <= block < s_partition_size we have blk <= N-1 where
    N = s_partition_size - s_reserved, and s_bmap_count = ceil(N /
    s_bmap_bits) = floor((N-1) / s_bmap_bits) + 1, so bmap is always
    <= s_bmap_count - 1.

  - an early return when sbi->s_bitmap is NULL or sbi->s_bmap_bits is 0,
    guarding the division. affs_init_bitmap() only leaves those unset on
    paths that force SB_RDONLY (including the ro->rw reconfigure path),
    and a read-only superblock cannot reach affs_truncate().

Happy to add either if you would prefer the belt and braces.

Not Cc'd to stable and posted in the open: per
Documentation/process/threat-model.rst, "bugs triggered by mounting a
corrupted or maliciously crafted file system image" are regular bugs
rather than vulnerabilities, because mounting is privileged. Say the
word if you would like it tagged for stable anyway.

Found with a QEMU/KASAN reproducer built around a crafted 4 KB AFFS
image; reproduced in six independent runs.

diff --git a/fs/affs/bitmap.c b/fs/affs/bitmap.c
--- a/fs/affs/bitmap.c
+++ b/fs/affs/bitmap.c
@@ -46,7 +46,7 @@
 
 	pr_debug("%s(%u)\n", __func__, block);
 
-	if (block > sbi->s_partition_size)
+	if (!affs_validblock(sb, block))
 		goto err_range;
 
 	blk     = block - sbi->s_reserved;
-- 
2.43.0
