Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4035C690
	for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 14:07:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789481255; cv=none; b=gu09n7gGPDt/uYUMPBpUY+ITsGE29Uxh5tDmCLaLkSDqK8aDf/JdLnR8P/n1mOicXqLdEYFPRn1DvrCIf3pZyTYm1ZkW6fpIb0hVqBjsZ/JApKpYYdvtBvmY2iAPM7Lpi6GTB9xMDdJh3fKv+1bb+G5t1Qkr6d4HaR8xdJf0GZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789481255; c=relaxed/simple;
	bh=wgTJ5pu45nxh4zZZnUYWJtKDFRA3SiPjN9jUXlPWY6k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mlgBNweg0280hy06Y4ZQIS5lqyMRDSNX58LabJtcA/d8L6ZsHmsLKkzSG9vTOSlcs/8FfJrlynMizTjsIb+pYFw7fHuev5hzVoxkLZwlrsd9wXBCl+r7uMJ++XUObLrc9bVYcR3/KIK0jKup5UtUnKW8oUAwCc4AzCdegfMJxzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d6MlYjSO; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d6MlYjSO"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e25187so2529033b3a.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Sep 2026 07:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481253; x=1790086053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ABrBd0rY1VCR3oRUOszqkQ9MHRbZxymi6zJSZ+kr70g=;
        b=d6MlYjSOnTKUhwilwQic2Q5uqbrQPQgMxTiiCscN3tf5pzJrvtWX/VR1nttsVoIe9H
         hSpldgSzGCusMo0FGaZQNSAcfVr0rqI+6RFlyLrY32oFrSCZbmliVywh6k4KR07jqjyd
         JORQ2Q6j1rsPZ6EbGeGqdbmgPcRGNK5guMKaYjQHC/k0+g5EYgh6Eg3onawXB3S2NcES
         drwe0z8RQ+tDMMEzgqBDGHC7cwLhQPHHntV3bJi/TzjGVM/LGG9pY/c17unBQK7BvePT
         3q5WHcbJkDK5OoIZ4CRvIpe5vL5Z2GNqp3ntt+lT+/dFA6jbHgonMmBzPNDR6pHSnv2J
         iFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481253; x=1790086053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ABrBd0rY1VCR3oRUOszqkQ9MHRbZxymi6zJSZ+kr70g=;
        b=caKxISJxcdiNW5goAYf6Htx7s46FbKtPo000yJjm/rGmF8StnEHMyVNgzQ1WovDHXO
         uT3CuMiJbcvBOBmNVq2BMoEf2j1LQdPw6XtXAb+ARFMnD9+WclLKNT5AyTEPCHPaz5z5
         ZZWkRVW2eXBJ3DoxImuXR4elLNZSbA1xix5RkydjmEJKgPfzHpqAGtKKBxofYs9ywSE5
         DtmdLN6ItzLwNM76Ohbyymjk0DeRZfDKiBXl2MgJmYPN8iya2BwMpthGbP9c/1rZ7CMv
         sysy4RigT6lod4WBu2+6xCI6bl+ElkWbz30xEQIoXfKrph2VVyo3ufQtvakm5MeuHZQN
         //Rg==
X-Forwarded-Encrypted: i=1; AKwUvBz7EBNfEG/hDqdXhapBXFW5ffab5Ejy3J4IH0o3dB5aBU0UQ0qHag0gfTYvrnn+gq37B3qtuGBkwxD10A0=@vger.kernel.org
X-Gm-Message-State: AFuF++lM/wR8Imv3fJEJp3+qajbqRcxxSAwSw5ZTz8698BcTK4dGD4p2
	UWvFk8tZH4K1bVo46mPWr/MUmCr0fCvw97ezF7pcMoAc3vgmfHsbi4WH
X-Gm-Gg: AYBFou3oCnfFDQ+sM4Ghgt8CwYhvVdwIfcFI/LF6ku34DHl0rLHAcTx95YN1F8DWV3m
	3NpG/IqXPeOyKyoNOTMHZsflsWYiJyx0jhb4nRGozjcNJo07PpvnEBLhEMhuSp0pYrno/kqwX5x
	+4idu8zwJXEu3YJr/WMicxG2kVHQnpJ+JjJxg4mnEDE3PM+wcanctxqCjIMyFVDOR0/TYhlNoLl
	7/17/DWwRVmFF8lmaDu3jp/ueLCsC2y5OuW+sTgz39hM2ppXCijvMXOG91MDjbdHBHwopYQymnC
	budGlvdjn7uRdjQW/yMgKKgSt4b7IwTzf2zMG9/mNPkc2Lz9C5M2+nRoX6KzCx7VLHBjOyM+wta
	ZxEjiSk0kDmJrChZMLqALqSDSuBWYd5BEkv42O4Q3WQinQkdOtu6y//eQSX9i2C+b+u8xZCGjvB
	mUWTSaLIjmvleXm+F9kJv07TPrkfty8HNudm1MWdUz0c0YW31pq1rM8n7wIm7kGuHHoJ7LiitpH
	Uw0SUSVoScGxg5DnQ==
X-Received: by 2002:a05:6a00:18a9:b0:858:b809:6ec0 with SMTP id d2e1a72fcca58-86f869a920dmr15306871b3a.23.1789481252784;
        Tue, 15 Sep 2026 07:07:32 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d4a:e90:2bac:b2b4:e60b:1459])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm6454025b3a.58.2026.09.15.07.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:07:32 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com,
	Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Subject: Re: [PATCH v4 1/2] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Tue, 15 Sep 2026 21:07:26 +0700
Message-ID: <20260915140726.17414-1-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <d66b55454add2f2a48a6dabdb4569051bebb5d42.camel@dubeyko.com>
References: <d66b55454add2f2a48a6dabdb4569051bebb5d42.camel@dubeyko.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Slava,

Thanks a lot for the detailed review, this caught a real bug. Replies
inline, v5 diff at the bottom.

> static inline?
>
> > +{
> > +     int i;
> > +
> > +     for (i = 0; i < 8; ext++, i++)
>
> I am introducing the special constant for the 8 extents of the fork in
> HFS+ iomap patchset. How can we handle this? Because I would like to
> see the named constant instead of hardcoded value.

Added HFSPLUS_EXTENT_COUNT in hfsplus_fs.h and used it here. I don't
know what name you're using in the iomap patchset -- happy to rename
to match once you let me know, so we don't end up with two constants
for the same thing when that series lands.

I kept hfsplus_ext_fork_full() itself as plain "static", not "static
inline": it's not a single-line wrapper, and the compiler already
inlines small static functions like this at -O2, so an explicit
"inline" in a .c file (as opposed to a header) doesn't buy us
anything here. I did make the new one-line is_extents_btree() helper
below "static inline", since that one really is just a trivial
predicate wrapper.

> The comment is not fully correct. We should not be here for the case of
> Extents Overflow file because there is no forks other than in
> superblock. It's not about the lock issue. We simply should not be here
> at all.

You're right, fixed. The comment now says: "Per the HFS+ format, the
extents overflow file is fully described by its own eight fork
extents and can never have an overflow extent of its own recorded in
the tree; this function should never legitimately be reached for it."

> Maybe, we need to introduce something like is_extents_btree() method?
> What do you think?

Done -- added is_extents_btree() and used it at all three call sites
in this patch (hfsplus_ext_read_extent(), the fork-full check in
hfsplus_file_extend(), and the insert_extent backstop).

> It looks like complicated condition and it deserves a static inline
> function, from my point of view.

Extracted into hfsplus_ext_file_needs_contig_grow().

> Maybe, instead of this long comment we need to introduce a dedicated
> method for processing Extents Overflow file allocation case?

Extracted into hfsplus_ext_file_grow(), replacing the inline comment
with a doc comment on the function itself.

> Maybe, I am missing something here. But goal + 1 sounds like we request
> to allocate only one block. Is it correct? If yes, why only one block?
> Usually, we need to try to allocate a clumpSize.

You're right, and this was an actual bug, not just a readability
issue. I traced hfsplus_block_allocate(): the `size` argument bounds
both where the scan stops *and* the returned run length via
`len = min(size - start, len)`. With `size = goal + 1` and
`start = goal`, that clamps `len` to 1 no matter what clump_blocks
was, so this path only ever allocated a single block. Fixed to use
`goal + *len` (the original clump_blocks) as the bound instead, in
hfsplus_ext_file_grow(). That keeps the "must start exactly at goal"
rejection (still checked via `start != goal` by the caller) while
allowing a full clump to be granted when the space is there.

> Can we be here at all? If start != goal, then we cannot allocate at
> all. And we can be here only if we have empty slot it the fork. Am I
> right?

The other way around: this branch is taken when
hfsplus_ext_fork_full() returns true, i.e. there is *no* free slot
left in the fork. If there is a free slot, we fall through to the
regular allocate-anywhere path and hfsplus_add_extent() just records
it in that slot -- no special-casing needed. I renamed the condition
to hfsplus_ext_file_needs_contig_grow() to make that unambiguous.

> checkpatch.pl --strict flags one alignment style issue [...]
> continuation should align with the open paren — cosmetic only

Fixed.

Thanks again for catching the goal+1 bug in particular -- v5 below.

---
Changes since v4:
 - Fix hfsplus_file_extend() requesting only 1 block instead of a
   full clump when growing the extents overflow file's fork
   (goal + 1 -> goal + len in the block_allocate() call).
 - Add HFSPLUS_EXTENT_COUNT instead of hardcoding 8.
 - Add is_extents_btree() instead of repeating the i_ino comparison.
 - Extract hfsplus_ext_file_needs_contig_grow() and
   hfsplus_ext_file_grow() out of hfsplus_file_extend().
 - Fix comment on the HFSPLUS_EXT_CNID guard in
   hfsplus_ext_read_extent() to state the real reason.
 - Fix checkpatch --strict alignment nit on pr_err() continuation.
(all per Slava's review)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524d18..f3a4b8fd567f 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -84,6 +84,23 @@ static u32 hfsplus_ext_lastblock(struct hfsplus_extent *ext)
 	return be32_to_cpu(ext->start_block) + be32_to_cpu(ext->block_count);
 }

+/* True if the inode is the extents overflow file's own inode */
+static inline bool is_extents_btree(struct inode *inode)
+{
+	return inode->i_ino == HFSPLUS_EXT_CNID;
+}
+
+/* True if all extents of a fork are in use (no free slot left) */
+static bool hfsplus_ext_fork_full(struct hfsplus_extent *ext)
+{
+	int i;
+
+	for (i = 0; i < HFSPLUS_EXTENT_COUNT; ext++, i++)
+		if (!ext->block_count)
+			return false;
+	return true;
+}
+
 static int __hfsplus_ext_write_extent(struct inode *inode,
 		struct hfs_find_data *fd)
 {
@@ -217,6 +234,15 @@ static int hfsplus_ext_read_extent(struct inode *inode, u32 block)
 	    block < hip->cached_start + hip->cached_blocks)
 		return 0;

+	/*
+	 * Per the HFS+ format, the extents overflow file is fully
+	 * described by its own eight fork extents and can never have an
+	 * overflow extent of its own recorded in the tree; this function
+	 * should never legitimately be reached for it.
+	 */
+	if (is_extents_btree(inode))
+		return -ENOSPC;
+
 	res = hfs_find_init(HFSPLUS_SB(inode->i_sb)->ext_tree, &fd);
 	if (!res) {
 		res = __hfsplus_ext_cache_extent(&fd, inode, block);
@@ -392,6 +418,34 @@ static int hfsplus_free_extents(struct super_block *sb,
 	}
 }

+/*
+ * True when growing the extents overflow file's own inode needs the
+ * contiguous-only special case below: its fork's eight extents are
+ * all in use, so there is no free slot left to record a new extent
+ * for it.
+ */
+static bool hfsplus_ext_file_needs_contig_grow(struct inode *inode,
+					       struct hfsplus_inode_info *hip)
+{
+	return is_extents_btree(inode) &&
+	       hip->alloc_blocks == hip->first_blocks &&
+	       hfsplus_ext_fork_full(hip->first_extents);
+}
+
+/*
+ * Allocate blocks to grow the extents overflow file itself once its
+ * fork is full (see hfsplus_ext_file_needs_contig_grow()). Per the
+ * HFS+ format this file can never record an overflow extent of its
+ * own, so the only way to grow it further is a contiguous extension
+ * of the last extent already in the fork: search for up to *len free
+ * blocks starting exactly at goal, and return a start block other
+ * than goal if the block at goal itself isn't free.
+ */
+static u32 hfsplus_ext_file_grow(struct super_block *sb, u32 goal, u32 *len)
+{
+	return hfsplus_block_allocate(sb, goal + *len, goal, len);
+}
+
 int hfsplus_free_fork(struct super_block *sb, u32 cnid,
 		struct hfsplus_fork_raw *fork, int type)
 {
@@ -465,13 +519,21 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	}

 	len = hip->clump_blocks;
-	start = hfsplus_block_allocate(sb, sbi->total_blocks, goal, &len);
-	if (start >= sbi->total_blocks) {
-		start = hfsplus_block_allocate(sb, goal, 0, &len);
-		if (start >= goal) {
+	if (hfsplus_ext_file_needs_contig_grow(inode, hip)) {
+		start = hfsplus_ext_file_grow(sb, goal, &len);
+		if (start != goal) {
 			res = -ENOSPC;
 			goto out;
 		}
+	} else {
+		start = hfsplus_block_allocate(sb, sbi->total_blocks, goal, &len);
+		if (start >= sbi->total_blocks) {
+			start = hfsplus_block_allocate(sb, goal, 0, &len);
+			if (start >= goal) {
+				res = -ENOSPC;
+				goto out;
+			}
+		}
 	}

 	if (zeroout) {
@@ -526,6 +588,20 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	return res;

 insert_extent:
+	/*
+	 * The fork-full precheck above keeps the extents overflow file's
+	 * own inode from ever landing here with blocks already allocated;
+	 * this is a backstop, so still free what was allocated rather
+	 * than leak it.
+	 */
+	if (is_extents_btree(inode)) {
+		if (hfsplus_block_free(sb, start, len))
+			pr_err("can't free extent: start %u, count %u\n",
+			       start, len);
+		res = -ENOSPC;
+		goto out;
+	}
+
 	hfs_dbg("insert new extent\n");
 	res = hfsplus_ext_write_extent_locked(inode);
 	if (res)
diff --git a/fs/hfsplus/hfsplus_fs.h b/fs/hfsplus/hfsplus_fs.h
index 1e5b58e6a13f..7c53832f2784 100644
--- a/fs/hfsplus/hfsplus_fs.h
+++ b/fs/hfsplus/hfsplus_fs.h
@@ -24,6 +24,9 @@
 #define HFSPLUS_TYPE_DATA 0x00
 #define HFSPLUS_TYPE_RSRC 0xFF

+/* Number of extent slots in a fork (hfsplus_extent_rec, hfs_common.h) */
+#define HFSPLUS_EXTENT_COUNT 8
+
 typedef int (*btree_keycmp)(const hfsplus_btree_key *,
 		const hfsplus_btree_key *);

--
Thanks,
Nguyen Ngoc Thang
