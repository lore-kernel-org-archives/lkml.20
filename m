Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793787812;
	b=C5Heo6FZ8OX85KVWA7MST1amf5pozI2Ej2XPKZw/pX6QH76Eg74/neKExum23tgu++SI
	 X1/3n19FOMfg8/zW+FjFsA0KcIfMBiHCg9IcgDrfsty7MY6tXcEypdaRKceyPfwGwKt06
	 usSVlEvbq1pM8rtSTKUgmEPrGpRdRHxpkDMjttZMHAe0kA4+JqFlnnF2WoTasdVlj6TNc
	 +4aRntDcVckc/b3zXWoILDdUKktixuX3uB9hr2+6YuSsAa5cVcaUF6JwHsA6rzHGtA1hb
	 Att9bLoxLMqsHBzLl6pqWB18eU/Qv1tkCBoRTPcnqptpOykGjr7VDvS9KLyV8VdPzKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793787812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=m3d/wzGNwOwiGd7h6SwYhY1GxTniyAmLrkyjp/DieEQ=;
	b=kDySPmPxBxm7fiIF8AjzhWlEI5KpT7GMyoqbzYK4526ujX5hTpK2Eje/a+b3Yw8bRDyy
	 HdJzXO3lZGICA0a9YkTjM59C2E4KRA6pCRJQvjl/pC6frRHmz8WRMwEVSh89cisCjdNlO
	 CSH5uevPiI5zBnrRwFpXtIwFd+sVcZFfoHG0I0W0MjQ9yyqoPWpB0KWvkIJFCk9ftuqFM
	 u3lbX34GfSc6sBhUOltFbcijQOZ9g3uZLAAis4nYLqPGipPQVS96KhTWlpirxkUSaPtlV
	 Runp5dc79F9tSXiGbj9v7vzfdbEEunzabaeej+bALVzkG/qzWHyFwNXOF5pngKjubaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=asu.edu;
	spf=pass smtp.mailfrom=asu.edu;
	dkim=pass header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=Rw6J6PVY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556A606A338
	for <linux-kernel@vger.kernel.org>; Wed,  4 Nov 2026 10:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9556A606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=asu.edu header.i=@asu.edu header.a=rsa-sha256 header.s=google header.b=Rw6J6PVY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so682783eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Nov 2026 02:23:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1793787811; x=1794392611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3d/wzGNwOwiGd7h6SwYhY1GxTniyAmLrkyjp/DieEQ=;
        b=Rw6J6PVY5JuXf3efAuBwBkmOqE0fmQT6ehKVaHVqWMSFdzWr3DEFzWO6B/0eRMq08u
         ONefvo1rdhn7rgB995tA3v7K+u/xhWlegbSUAw2Gu4gEQh5+mu95QpX8EndSqFHSyagB
         I8liLFX5toT/OAMZGtwBx44EytCBpHrGkKFYd9PrUBnBddNrUt6nnlymi1akZ/XaFuUm
         o46JgYh/cpcE0isJGA0kdD0qoC2CtlECn2+4q53WBkC8T9QJoaT0W/ZPdpkRtZYouNJv
         Hmg/cjIfslmaOowC76NHERWGt85a7PTcSNE6nVvOeKDQJYb6Db2RCMZsQ7X4ApIptDCM
         rlQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793787811; x=1794392611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m3d/wzGNwOwiGd7h6SwYhY1GxTniyAmLrkyjp/DieEQ=;
        b=Wem3VlBLqIHfpRNf+6RS31dr6q8Y06NAboD55E7Hdly4iMgmmklrM3w+NUx1o9w3b0
         RPNuBSYk4DswWwWaTgQIXREEyfc69rEgppmGq7xKpL4yE4AAgb9IEhmbku/htW0V9QMq
         w8OUZyWe/Nfpp2bMdzk1yrapCjARfR/Z9Si3lWNYTUZHPHMMvy4kthLQ8hkqyBahbzFY
         X5vB7/FalDLOGke6pChLPSrQnP70zDW1u36LpjmwdJyJjKNFFWB6zX/3Wdw3aJhq0nlw
         lORdXrQjVNBPfDKH/xgNCJ9O8vhO+1+EHY86/Vryz7poQbC6rXXniffZLPiKaeqoyP37
         yfLQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0Cn1bLbE3kUf1orKCpzz7SleLdxm8y4d/FrxnX4psI/mQguL+SRuOBn+dC4ghaMXQm4ZXEvz4FlvCVOs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9I3fd80TiBxltEW1i1oHQ3Z+UQUgYt4c0dDNhrCA/asm/1Fq8U
	xWIo5Jj25dI4UoWoGlULFWMXxZDyQBFXysCL3fPYpVfpVJeQYwYcYp30KCWMRHlhHA==
X-Gm-Gg: AYBFou3wyK2COb7YBEQTjNKfMFjG+Q6OVbRzJb9DlToy1FqL3tLaC7U6EDNtL2Zf1BG
	M6+mz2BTf9XMNYuDR+bwODqGfEgocgKvadgb7BrxIqmQRM6t+qT70pXdboqEEVl1OItjUmRbhz8
	KPtjx+xJi/YjDnfsyruE4S1hB7FalwlKoK1EnzYQ8xnTsjl770LWpXmvQGbV1LAynO1CLtxOMB6
	fJhZUFAOB4rOcT0nKclH/dtYp2eNBl1ozNFSrbm8vo9wUr7QT4WJEREypxX5aWEhWpFDIl3e1IC
	FvS2bI4TccqbgpOhpFRW2OKOTL9xdi2RJ1DaZuX6Hx/cUySrfDACrWDBBB/HtYrTc5GNFk8b/iZ
	krPr6phH/vA4rzBPowNUTjqU6u/yhj6QM3B5qNqT5+lPBqnVJ7inOrLvIA6U/Yyoqft/RFt8oGK
	j3zYN2AcReZX4AiB+XDobCesPOgQx0e4lti1kV+/GOpF0BW8pipo5kyxEqKGvHf4fcXwu2nRRii
	v160li3YxcGGm6hVlsVUuMdDh/eZMUbfkCsmOsiOv0Qea8c2+SMqhld3TNGNPbbhJfsXJZlVwBN
	B9tVFUsLrGetAnnGs1vZi+oOMLV6kH+21RIDQ9+cOA==
X-Received: by 2002:a05:693c:88c8:20b0:369:f2d6:4108 with SMTP id 5a478bee46e88-36a42401233mr23215503eec.10.1793787810538;
        Wed, 04 Nov 2026 02:23:30 -0800 (PST)
Received: from localhost.localdomain ([2600:8800:1e00:25f0:ff01:97fc:f9e5:d7e1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a6160sm5749086eec.9.2026.11.04.02.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 02:23:29 -0800 (PST)
From: Siddharth Mishra <smish149@asu.edu>
To: dsterba@suse.com
Cc: wqu@suse.com,
	boris@bur.io,
	josef@toxicpanda.com,
	fdmanana@suse.com,
	mason@kernel.org,
	linux-btrfs@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Siddharth Mishra <smish149@asu.edu>,
	stable@vger.kernel.org
Subject: [PATCH 1/5] btrfs: skip tree blocks in btrfs_get_extent_owner_root()
Date: Wed,  4 Nov 2026 03:23:19 -0700
Message-ID: <20261104102323.4090290-2-smish149@asu.edu>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104102323.4090290-1-smish149@asu.edu>
References: <20261104102323.4090290-1-smish149@asu.edu>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[BUG]
With simple quotas enabled on a filesystem without the skinny-metadata
feature, deleting a subvolume triggers the following warning:

 ------------[ cut here ]------------
 WARNING: fs/btrfs/extent-tree.c:393 at
   btrfs_get_extent_inline_ref_type+0x1b9/0x2d0, CPU#1: btrfs-cleaner/84
 RIP: 0010:btrfs_get_extent_inline_ref_type (fs/btrfs/extent-tree.c:393)
 Call Trace:
  <TASK>
  btrfs_get_extent_owner_root (fs/btrfs/extent-tree.c:3128)
  btrfs_lookup_extent_info (fs/btrfs/extent-tree.c:187)
  walk_down_proc (fs/btrfs/extent-tree.c:5647)
  walk_down_tree (fs/btrfs/extent-tree.c:6170)
  btrfs_drop_snapshot (fs/btrfs/extent-tree.c:6392)
  btrfs_clean_one_deleted_snapshot (fs/btrfs/transaction.c:2728)
  cleaner_kthread (fs/btrfs/disk-io.c:1553)
  kthread (kernel/kthread.c:436)
  ret_from_fork (arch/x86/kernel/process.c:158)
  ret_from_fork_asm (arch/x86/entry/entry_64.S:245)
  </TASK>
 ---[ end trace 0000000000000000 ]---
 BTRFS error (device vda): eb 30720000 iref 0x3ee6 invalid extent
   inline ref type 0

Writing to a snapshot (update_ref_for_cow()) or a metadata balance
(relocate_block_group()) trigger the same warning.

[CAUSE]
Without skinny-metadata, the extent item of a tree block is an
EXTENT_ITEM with the TREE_BLOCK flag, and a btrfs_tree_block_info sits
between the btrfs_extent_item and the first inline ref:

	item 3 key (30441472 EXTENT_ITEM 16384) itemoff 16079 itemsize 51
		refs 1 gen 5 flags TREE_BLOCK
		tree block key (256 INODE_ITEM 0) level 0
		^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		(176 0x5) tree block backref root FS_TREE

But btrfs_get_extent_owner_root() always takes the first inline ref
right after the btrfs_extent_item:

	ptr = (unsigned long)(ei + 1);

So for such a tree block it reads the lowest byte of the first key
objectid as the inline ref type. For the key above that byte is 0, and
btrfs_get_extent_inline_ref_type() warns. If the byte happens to be
BTRFS_EXTENT_OWNER_REF_KEY (172), the key bytes are returned as the
owner root.

The filesystem is valid. It can be reproduced with:

  mkfs.btrfs -f -O ^skinny-metadata $dev
  mount $dev $mnt
  btrfs quota enable --simple $mnt
  btrfs subvolume create $mnt/sv
  btrfs subvolume delete $mnt/sv
  btrfs subvolume sync $mnt

[FIX]
Owner refs are only added to data extents, never to tree blocks, so
return 0 for an extent item with the TREE_BLOCK flag before looking at
its inline refs. This covers both the EXTENT_ITEM and the METADATA_ITEM
layouts, and gives the same result as on a skinny-metadata filesystem,
where the first inline ref of a tree block is never an owner ref.

Fixes: 8d2990914073 ("btrfs: add helper for inline owner ref lookup")
Cc: stable@vger.kernel.org # 6.7+
Signed-off-by: Siddharth Mishra <smish149@asu.edu>
---
 fs/btrfs/extent-tree.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/btrfs/extent-tree.c b/fs/btrfs/extent-tree.c
index 9b0a5c6b9..3ab4f2696 100644
--- a/fs/btrfs/extent-tree.c
+++ b/fs/btrfs/extent-tree.c
@@ -3117,6 +3117,9 @@ u64 btrfs_get_extent_owner_root(struct btrfs_fs_info *fs_info,
 		return 0;
 
 	ei = btrfs_item_ptr(leaf, slot, struct btrfs_extent_item);
+	if (btrfs_extent_flags(leaf, ei) & BTRFS_EXTENT_FLAG_TREE_BLOCK)
+		return 0;
+
 	ptr = (unsigned long)(ei + 1);
 	end = (unsigned long)ei + btrfs_item_size(leaf, slot);
 
-- 
2.54.0

