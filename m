Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2836647DFB0
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789219457; cv=none; b=tQfc5zDc2UGRg3oqa3gJREFotecXOJ/O7TEdmh0znOSB9OX507mbs5KT1vLuAOm2iLvXxOfBfaaWG/5Tvu968zJsDid+qbmRz/rSZyNPiV/+q0ufluqAqSUpjzQkdTIJFIy12UMlg15tN9f6IIb8LK1RGFEl/2KiupJ9QL0SFOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789219457; c=relaxed/simple;
	bh=cHwswaLHS63EipwJZ5k7IuKeyHsjmD0CMBOGzoXUuo8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JcElJ2JZ2gWSAbff/4S/+wBbR/EsONWrV8E4iHAYpZ2tKDda02uIWEfStuSeyVXnOigFbDLPlVIVEN2P+LFd1HuzzzKpioE1augIgPH7nVQJiQ2m5muXcLZhKM8gH0lfaCg2bjjzApUC2ddKA8mfegsM2Bay0jE4adJMkpBkK28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rCOvvFZq; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rCOvvFZq"
Received: by mail-pz2-f12.google.com with SMTP id d2e1a72fcca58-8631d0023daso256072b3a.2
        for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 06:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789219455; x=1789824255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R/LNreBp2TtdR9tBywqnjgXm+zGPC2XwaiQWB1Gl4ag=;
        b=rCOvvFZqWHjQtWcbBiMf61NN819ATfjo38Rj4FD3xrkOtcacXymGX5iQM+t90ZAXuF
         Rf+ZPYd9zhGIjbfMPidG8Y/JI2Mkl9yIP4weNBy+Iymp5OjhG+CtAhUs8wYsRwaaeETv
         iBD9ZKyZk8Ec8y3BgYi+BxIZ3gdc3DCDsJtBM81Y88ftOcg2x8YglOi9z0/116QyW1bp
         odjcL8xaAUNwoMRdAQcupoZrf58T2ox+xVG/q7YRxVEMwO4n8kZjHC7QkyU/crKGGGQf
         lDbmJvKiDAbMtCfjmzzEwf+TWO6dBzdwSFF4Ff8QsreQEF2pwNtM7a7UH7q6L6xKoYu+
         ZXdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789219455; x=1789824255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R/LNreBp2TtdR9tBywqnjgXm+zGPC2XwaiQWB1Gl4ag=;
        b=HKL9seIUeJkehMvaRswOctY1KSGBzeLRajbi/BI6JA3cqJxE3/QiG9yn4GKuLDy5rt
         TAIrYyNypOxW7eboRJTlEkB+E8/e3EYnEjocgZ7nSTHO0pTznrf53IFiQITl7QnOhVGv
         i4zvQcJimPt/Utjyee7Sc73eZvO5mTN2a7EIxmg4p2lG5a4Nv8pJ7jDsU9W1Oxb79iY5
         RxRZsK8zPcE9P3U77sNlU41796CsXmGhS6EkCehrnoaeM604/EqqGN4TK4C6jHUO5FBP
         ddbDPXI9lZnKedPYgi1M1dJ7yf1QFs511ecqXzAGsZkHDEaw851HHAAy6F99zcUVEoK0
         ln7Q==
X-Forwarded-Encrypted: i=1; AKwUvBxVvESru5gFLh4dh7U/lvruobZz5k1gVG6169iWUtx6O4LUJ8tZ8nyFxKYNldLZsHauXljOyBszWWNpM44=@vger.kernel.org
X-Gm-Message-State: AFuF++kjTqRK4BnsqMv9S8+g0PVfJceT9/Jok3DnbT/3p7L5L9UYvbLr
	J5gZYBfh51cgCBA4atCyWVw2TEgsb9XonSruIpuRRyxE4hHt4j2PnCe2
X-Gm-Gg: AYBFou3Psnzq7VZjgRXqxOQutYO1OPb2cQ9FOEujBnsBBW5pubZfd3xmoqFVeQDIcKR
	NmIbcymLil7cBdn9QJizrXhrQOXOuECEMcIu4qmG5lUGSQWz4GmOrLjOvCKawo3jA4WigQWXI2Y
	rRjKKf3qhfd4Lv6xepcGGBQXD/sCJzyJSklWqKXEG8Cw9PjoQvnt0rZYpqCNk0rUlbjJqsRDZsn
	YM3BKShAJil/lRIU6vG9d2tBL2zRzLoivu82PGkB6ajHOI16cZy+LiEgqqCJp5fi+3VXQ6rDNnp
	p/Vm+Tz2us41DoImBxKCyQFjjWtTYTC3Vmw9XmeOccAVFI5B6SStjTEPCjAjmS6VIVJwLPE0Oql
	Va5cnzCRjVMYFbU4p87lGYDaREIcxN2lO4ZwM8mdrdmKXCZoemUTAuwzGPcjU9Fklv4AsJZvUWo
	b43DY8ZSKLoExuaucETWE3CCDBO/3ncWfeTGJDh16WsATlODT1NShMe+lO0rf+3T3wW7YAgqdxR
	FYTvGevZVtQGT+LBiC2wjTMqFXh
X-Received: by 2002:a05:6a00:1906:b0:842:5b66:3c7f with SMTP id d2e1a72fcca58-86cc59a9c7emr4306818b3a.0.1789219455392;
        Sat, 12 Sep 2026 06:24:15 -0700 (PDT)
Received: from thangnn-ASUS.. ([2405:4802:1d38:5c70:dfd9:c41e:7c9b:c69])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b292c9839sm2410819b3a.33.2026.09.12.06.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 06:24:15 -0700 (PDT)
From: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Yangtao Li <frank.li@vivo.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Subject: [PATCH v4 1/2] hfsplus: fix recursive tree_lock in hfsplus_file_extend()
Date: Sat, 12 Sep 2026 20:24:06 +0700
Message-ID: <20260912132407.16856-2-ngocthang2710.1999@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260912132407.16856-1-ngocthang2710.1999@gmail.com>
References: <c6b841becc5b1709a9f54a1c0efd0a14f02ad97b.camel@dubeyko.com>
 <20260912132407.16856-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hfs_bmap_reserve() calls hfsplus_file_extend() on tree->inode with
tree->tree_lock already held. For the extents overflow B-tree's own
inode, growing it can call hfsplus_ext_read_extent() -> hfs_find_init()
on that same tree, taking tree_lock a second time (lockdep: "possible
recursive locking ... &tree->tree_lock/1"). This happens two ways:

 - the fork already claims more blocks than its eight extents
   describe (a corrupted on-disk fork), so hfsplus_ext_read_extent()
   is called immediately to look up the rest; or
 - the fork's eight extents get exhausted during this call, and
   inserting a new overflow extent record for the file would need
   the same lookup.

Per the HFS+ format the extents overflow file is fully described by
its eight fork extents and can never legitimately have overflow
extents of its own, so both cases mean it cannot grow any further.

Move the check into hfsplus_ext_read_extent() itself, the one place
that actually re-enters hfs_find_init(), rather than duplicating it at
each caller, and report -ENOSPC.

For the second case, don't allocate blocks on the chance the fork
still has room and undo it if not: hfsplus_ext_fork_full() tests the
fork first. If it does have a free extent slot, any free space works,
same as before. If it's already full, the only way to grow is a
contiguous extension of the last extent, so only search for free
space starting exactly at the block right after it, and fail with
-ENOSPC immediately if that block isn't free -- nothing gets
allocated in that case, so there's nothing to undo. The prior
allocate-then-free-on-failure code stays at the insert_extent label
as a backstop, in case this reasoning has a gap.

Reported-by: syzbot+f8ce6c197125ab9d72ce@syzkaller.appspotmail.com
Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Co-Authored-By: Claude Sonnet 5 <noreply@anthropic.com>
---
 fs/hfsplus/extents.c | 59 +++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/fs/hfsplus/extents.c b/fs/hfsplus/extents.c
index eb7c11524d18..236f2d9a7a2d 100644
--- a/fs/hfsplus/extents.c
+++ b/fs/hfsplus/extents.c
@@ -84,6 +84,17 @@ static u32 hfsplus_ext_lastblock(struct hfsplus_extent *ext)
 	return be32_to_cpu(ext->start_block) + be32_to_cpu(ext->block_count);
 }
 
+/* True if all eight extents of a fork are in use (no free slot left) */
+static bool hfsplus_ext_fork_full(struct hfsplus_extent *ext)
+{
+	int i;
+
+	for (i = 0; i < 8; ext++, i++)
+		if (!ext->block_count)
+			return false;
+	return true;
+}
+
 static int __hfsplus_ext_write_extent(struct inode *inode,
 		struct hfs_find_data *fd)
 {
@@ -217,6 +228,15 @@ static int hfsplus_ext_read_extent(struct inode *inode, u32 block)
 	    block < hip->cached_start + hip->cached_blocks)
 		return 0;
 
+	/*
+	 * The extents overflow file is fully described by its own fork
+	 * extents; looking up an overflow extent for it would re-enter
+	 * hfs_find_init() on the extents tree, whose tree_lock may already
+	 * be held by the caller.
+	 */
+	if (inode->i_ino == HFSPLUS_EXT_CNID)
+		return -ENOSPC;
+
 	res = hfs_find_init(HFSPLUS_SB(inode->i_sb)->ext_tree, &fd);
 	if (!res) {
 		res = __hfsplus_ext_cache_extent(&fd, inode, block);
@@ -465,13 +485,30 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	}
 
 	len = hip->clump_blocks;
-	start = hfsplus_block_allocate(sb, sbi->total_blocks, goal, &len);
-	if (start >= sbi->total_blocks) {
-		start = hfsplus_block_allocate(sb, goal, 0, &len);
-		if (start >= goal) {
+	if (inode->i_ino == HFSPLUS_EXT_CNID &&
+	    hip->alloc_blocks == hip->first_blocks &&
+	    hfsplus_ext_fork_full(hip->first_extents)) {
+		/*
+		 * No free slot is left in the fork, and the extents overflow
+		 * file can't record an overflow extent of its own: the only
+		 * way to grow it is a contiguous extension of the last
+		 * extent, so only accept free space starting exactly at
+		 * goal instead of allocating anywhere and having to undo it.
+		 */
+		start = hfsplus_block_allocate(sb, goal + 1, goal, &len);
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
@@ -526,6 +563,20 @@ int hfsplus_file_extend(struct inode *inode, bool zeroout)
 	return res;
 
 insert_extent:
+	/*
+	 * The fork-full precheck above keeps the extents overflow file's
+	 * own inode from ever landing here with blocks already allocated;
+	 * this is a backstop, so still free what was allocated rather
+	 * than leak it.
+	 */
+	if (inode->i_ino == HFSPLUS_EXT_CNID) {
+		if (hfsplus_block_free(sb, start, len))
+			pr_err("can't free extent: start %u, count %u\n",
+				start, len);
+		res = -ENOSPC;
+		goto out;
+	}
+
 	hfs_dbg("insert new extent\n");
 	res = hfsplus_ext_write_extent_locked(inode);
 	if (res)
-- 
2.43.0

