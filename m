Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D26D493652
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 15:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867165; cv=none; b=MJC1azw3Chcdt7XR8CJH1AJdioiJterkLvL2FsXkHU8hmWr0a6o0MKaMcBNyKfpeKo5Zjkt1ZKh0qnDTvGuof7VlCqo3fnyT5jYaq0NMTCNTA4w3+eoR3JhAZ+1kQSuDvpTD9anNQefQYmJkvrzsVzuFh7cWOwAqhmj6gFscTFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867165; c=relaxed/simple;
	bh=959PKmDmqbYmphBObUuUZb2yNOoX2/DlcuuCqeq0DMY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QMvF0k/GgrJWqhKmuoc4jBGPaz/VWah+dFMLQb3gcKMwvG4XxDK8JgNISS2SCYlZDyiTHyUh60Dcj6nZytUh+QTNqRZxUP22vll8yzBAk2WUwcuwmw1cJPG5cdLP5z+vkXhiZi7wf8rz6QB/OrQGV2c4/VnNnA5twsDH6Wuu9iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PVVnSj1t; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PVVnSj1t"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso1778813a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 08:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790867163; x=1791471963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNFuIUXNuGIMK04aFKXkSC9USRBbb3SEJPHqr2VtdVw=;
        b=PVVnSj1tKBg5pDBpDpAgNiceGez05I/mTT2RqyXGe6xaakJ4rvd//yDnr8WPx/aJU7
         It66FPn0hsDSSrxb01f09h8CSgqtp24Cj/kpDBiG+VqE0Dk3cgxWEG1njqhAlcp78hbX
         zQvd9RObIpGsUnPKJzvwWSIpKqhqsj/7Odtloj8j7b4QldgYtUAPsfh0r1sWwOC+QmZf
         d47rXn7V9agpFWqq3pKucw0jZqE4mUuxq0RfBHyWBQRzpCHETpSF0EtQZ9E3ePatb1xy
         bnl+Wo8ZNjbYDH8ss3lLuNQIrFLF6+11tnBd1FymZDuFY4ZruZKCfeV7P6hfFvERbQhh
         Vgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790867163; x=1791471963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNFuIUXNuGIMK04aFKXkSC9USRBbb3SEJPHqr2VtdVw=;
        b=lB+g3rATygnlIMDxBWOGyIsnc3UTMWKZnf67AzHZuppy0I3K19wmXqHacLhMOx+GWt
         NKtsRglEt7AyYJRjokJqgMT1LkejYlnMTKqxQ8fjWovz9G7oFsZrXm0SktVxINdnb1bo
         eU8v0ie+BJOIz6VWGLXGlwaKd3CUxynCr9An6oj/hegKUe0DWqjBw8aDCqfNkhdG3h50
         IExWr/P9J3teljBIJ2htuWXCUBxmDFNBUkxaSKlbQoZUi0lOJtz+Ycva7mtHeCjrc0GZ
         wWfnZd9g00srqrDsH2j4Wvi4mQPmm52OlEoJGSJk7Sc/G7B/r3I8L8PAxr2gzIE3v7X3
         Fjiw==
X-Forwarded-Encrypted: i=1; AKwUvBwksa947ToCVdwWe4DK7604PkBUAvKol9MD1gwqFnuaKTsFYqbEO7+YKNm41hOIy0BwVOyGewkFJoeJqlo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKht5hkLZ0GJ4Pr+5q6GBrNbFtD2054Yqzn6Nl7LiXVMRQgQCEY
	KLH3THLoFSOWwEcKlCjPd1oK5//WBpFitgN5+krT7L1DlWeTKwbNeNgH
X-Gm-Gg: AYBFou0xr1xP4H8xZnzvJpuUvCxnxTF9F/c38xbccLbSA3bCrqCn/3N/ra9yJLn8kHI
	QkPN1kU/jTeP4I7oi/SVu6NO/yF9p4li15rVRDEj4i6zN3VPG4e4WQZJSxkQF6puMRPA1VWMru4
	Pym/Qu0v3LNSdL9sRqsRIjszvS1eOJ1C5WpXHb1GdSfNNBH7YMFlNuMI5DbBJoumD8n+046XOOz
	4+BueLMg1+vL1TY7NADMMyrRRL+Qvy4u4Wp7v8rY4uShIiIN1fI4nxK8eHyf5GLJdYTjHXpGrXk
	tiCtxsvtnzBOEc/ec50CiQgcdkozjyn2KYRNAJpVB3dnxxGVJD80D49WgnVYekomQbj5YTJwTph
	GVTyvuRgfLz12H1Nx1pY+TB+F1gW++VecdUEoT4cGGGaG0OvNUtaFJxwgM6qt4138i+UTmiDJTF
	TSd4MZMpuz9CJfKaVLmvoAHE/MJ6+8ZGR0wwnrMSZxZqAvemdYpoHgp1jsAsDKQPJ0Fa+CQfrfF
	DU9m361zVXoYKJcs8VIxT/hcsv6xa14ot+gGObPkPqGJbi73Ha6qBlPx2iHkDP9/+9RTl5VyiE0
	UHNWLTErDxQpsE7Piz0CWQaT5VBdrSJn81mdKv4ZtJlTE4PMveXtl6N1WLc=
X-Received: by 2002:a17:90b:54c4:b0:3a4:b3a4:e7a6 with SMTP id 98e67ed59e1d1-3a4f2d2f534mr1881980a91.11.1790867162529;
        Thu, 01 Oct 2026 08:06:02 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f47cbd1dsm5248555a91.16.2026.10.01.08.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:06:02 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ntfs: hold the runlist lock while expanding a non-resident attribute
Date: Thu,  1 Oct 2026 23:05:58 +0800
Message-ID: <20261001150558.3970385-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_non_resident_attr_expand() changes ni->runlist.rl while it
allocates clusters: ntfs_attr_map_whole_runlist(), the compressed
branch's ntfs_rl_realloc() and ntfs_runlists_merge() can each kvfree()
the old array.  Unless the caller already holds ni->runlist.lock, none
of this happens under it; only the rollback takes it.  Callers without
it include the write path, fallocate, ntfs_inode_attr_pwrite() and
ntfs_resident_attr_resize().

Those callers hold mrec_lock, and the write path also inode_lock, but
the iomap read side takes neither: FIEMAP, page faults, readahead and
splice read reach ntfs_read_iomap_begin_non_resident(), which takes only
ni->runlist.lock.  A FIEMAP running while write(2) extends the same file
can walk the array that ntfs_runlists_merge() has just freed:

  BUG: KASAN: slab-use-after-free in ntfs_attr_vcn_to_rl+0x19b/0x200

A reader that finds a vcn unmapped in the stale array also maps it from
disk into the runlist the writer is changing, which shows up as "Run
lists overlap. Cannot merge!".

Take ni->runlist.lock for writing around the part of the expansion that
changes the runlist and allocated_size, up to and including the mapping
pairs update, as ntfs_non_resident_attr_shrink() does since commit
91709ba5d6d7 ("ntfs: protect runlist updates with the runlist lock"),
and hold it throughout the rollback, where ntfs_cluster_free() requires
it.  The lock nests inside mrec_lock, as on the truncate-up path, which
already calls this function with the runlist lock held.  Where the
caller says it holds the lock (locked_ni == ni), assert that it holds it
for writing.

For an $ATTRIBUTE_LIST whose lock the caller does not hold, drop the
lock again before the mapping pairs update: that update can resize the
same list through ntfs_attrlist_update_locked(), which returns -ENOSPC
when told that the list's lock is held.  Holding it there made punching
holes into a large fragmented file fail with -ENOSPC.

Fixes: 495e90fa3348 ("ntfs: update attrib operations")
Cc: stable@vger.kernel.org
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
Reviewed-by: Hyunchul Lee <hyc.lee@gmail.com>
---
Changes since v1:

 - Add lockdep_assert_held_write(&ni->runlist.lock) for the case where
   the caller says it holds the lock, as Hyunchul asked.  The only
   caller that passes locked_ni == ni is __ntfs_attr_truncate_vfs(),
   which takes the lock for writing just before the call.  Callers
   from ntfs_attrlist_update_locked() never pass the list's own inode
   as locked_ni, because that function returns -ENOSPC first.
 - Rebase onto current ntfs-next (708f9d56caca).  The rollback hunk
   conflicted with the new restore of allocated_size under size_lock;
   that now runs with the runlist lock held.
 - Keep both Reviewed-by tags.  Baolin, Hyunchul: the assertion is the
   only functional addition, so shout if you would rather I dropped
   yours.

A reproducer that extends two files with interleaved clusters while
FIEMAP loops over them hits the KASAN report above within two seconds in
each of three runs without this patch.  With it, six 60-second runs are
clean (three on v1, three on v2).  I can send it privately if you want
it.

Also tested v2 in a VM with KASAN, lockdep and the hung task detector:
writes past EOF, fallocate, truncate-up, sparse and compressed files,
growing xattrs, directories and a non-resident attribute list, with
FIEMAP after each step.  Output is identical to v1, and lockdep reports
nothing.  A build with a printk in front of the new assertion shows it
running on the truncate-up path, and swapping that caller's down_write()
for down_read() makes it fire.

 fs/ntfs/attrib.c | 74 ++++++++++++++++++++++++++++++++++--------------
 1 file changed, 53 insertions(+), 21 deletions(-)

diff --git a/fs/ntfs/attrib.c b/fs/ntfs/attrib.c
index 5439c12f9280..565bd468b893 100644
--- a/fs/ntfs/attrib.c
+++ b/fs/ntfs/attrib.c
@@ -4487,6 +4487,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	struct super_block *sb = ni->vol->sb;
 	size_t new_rl_count;
 	unsigned long flags;
+	bool runlist_locked = locked_ni == ni;
 
 	ntfs_debug("Inode 0x%llx, attr 0x%x, new size %lld old size %lld\n",
 			(unsigned long long)ni->mft_no, ni->type,
@@ -4528,10 +4529,19 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	 * clusters if there is a change.
 	 */
 	if (ntfs_bytes_to_cluster(vol, ni->allocated_size) < first_free_vcn) {
+		/*
+		 * The runlist array is replaced below.  Readers such as the
+		 * iomap read path hold only the runlist lock, not mrec_lock.
+		 */
+		if (runlist_locked)
+			lockdep_assert_held_write(&ni->runlist.lock);
+		else
+			down_write(&ni->runlist.lock);
+
 		err = ntfs_attr_map_whole_runlist(ni);
 		if (err) {
 			ntfs_error(sb, "ntfs_attr_map_whole_runlist failed");
-			return err;
+			goto unlock_runlist;
 		}
 
 		/*
@@ -4556,7 +4566,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 						last + more_entries + 1);
 				if (IS_ERR(rl)) {
 					err = -ENOMEM;
-					goto put_err_out;
+					goto unlock_runlist;
 				}
 
 				alloc_size = ni->allocated_size;
@@ -4581,7 +4591,7 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				rl = kmalloc(sizeof(struct runlist_element) * 2, GFP_NOFS);
 				if (!rl) {
 					err = -ENOMEM;
-					goto put_err_out;
+					goto unlock_runlist;
 				}
 
 				rl[0].vcn = ntfs_bytes_to_cluster(vol, ni->allocated_size);
@@ -4628,7 +4638,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				ntfs_debug("Cluster allocation failed (%lld)",
 						(long long)first_free_vcn -
 						ntfs_bytes_to_cluster(vol, ni->allocated_size));
-				return PTR_ERR(rl);
+				err = PTR_ERR(rl);
+				goto unlock_runlist;
 			}
 			/*
 			 * A contiguous ATTRIBUTE_LIST allocation keeps its mapping
@@ -4652,8 +4663,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 								ni->allocated_size),
 						lcn_seek_from, DATA_ZONE, false,
 						false, false);
-				if (IS_ERR(rl))
-					return PTR_ERR(rl);
+				if (IS_ERR(rl)) {
+					err = PTR_ERR(rl);
+					goto unlock_runlist;
+				}
 			}
 		}
 
@@ -4665,7 +4678,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 				ntfs_error(sb, "Run list merge failed");
 				ntfs_cluster_free_from_rl(vol, rl);
 				kvfree(rl);
-				return -EIO;
+				err = -EIO;
+				goto unlock_runlist;
 			}
 			ni->runlist.rl = rln;
 			ni->runlist.count = new_rl_count;
@@ -4673,11 +4687,28 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 
 		/* Prepare to mapping pairs update. */
 		ni->allocated_size = ntfs_cluster_to_bytes(vol, first_free_vcn);
-		err = ntfs_attr_update_mapping_pairs_locked(
-				ni, 0, locked_ni);
-		if (err) {
-			ntfs_debug("Mapping pairs update failed");
-			goto rollback;
+		if (ni->type == AT_ATTRIBUTE_LIST && !runlist_locked) {
+			/*
+			 * Making room for the list's mapping pairs can resize
+			 * this attribute list again through
+			 * ntfs_attrlist_update_locked(), which takes its
+			 * runlist lock.
+			 */
+			up_write(&ni->runlist.lock);
+			err = ntfs_attr_update_mapping_pairs_locked(ni, 0,
+								    locked_ni);
+			if (err) {
+				ntfs_debug("Mapping pairs update failed");
+				goto rollback;
+			}
+		} else {
+			err = ntfs_attr_update_mapping_pairs_locked(ni, 0, ni);
+			if (err) {
+				ntfs_debug("Mapping pairs update failed");
+				goto rollback_locked;
+			}
+			if (!runlist_locked)
+				up_write(&ni->runlist.lock);
 		}
 	}
 
@@ -4711,6 +4742,9 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	ntfs_attr_put_search_ctx(ctx);
 	return 0;
 rollback:
+	if (!runlist_locked)
+		down_write(&ni->runlist.lock);
+rollback_locked:
 	/* Free allocated clusters. */
 	err2 = ntfs_cluster_free(ni, ntfs_bytes_to_cluster(vol, org_alloc_size),
 				-1, ctx);
@@ -4722,8 +4756,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	 * dropping the lock: ntfs_attr_vcn_to_rl() fails a lookup below the
 	 * allocated size that falls past the end of the runlist.
 	 */
-	if (ni != locked_ni)
-		down_write(&ni->runlist.lock);
 	err2 = ntfs_rl_truncate_nolock(vol, &ni->runlist,
 			ntfs_bytes_to_cluster(vol, org_alloc_size));
 	if (!err2) {
@@ -4731,8 +4763,6 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ni->allocated_size = org_alloc_size;
 		write_unlock_irqrestore(&ni->size_lock, flags);
 	}
-	if (ni != locked_ni)
-		up_write(&ni->runlist.lock);
 	if (err2) {
 		/*
 		 * Failed to truncate the runlist, so just throw it away, it
@@ -4743,12 +4773,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		ntfs_error(sb, "Couldn't truncate runlist. Rollback failed");
 	} else {
 		/* Restore mapping pairs. */
-		if (ni != locked_ni)
-			down_read(&ni->runlist.lock);
-		if (__ntfs_attr_update_mapping_pairs(ni, 0, locked_ni, true))
+		if (__ntfs_attr_update_mapping_pairs(ni, 0, ni, true))
 			ntfs_error(sb, "Failed to restore old mapping pairs");
-		if (ni != locked_ni)
-			up_read(&ni->runlist.lock);
 
 		if (NInoSparse(ni) || NInoCompressed(ni)) {
 			ni->itype.compressed.size =  org_compressed_size;
@@ -4756,6 +4782,8 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 		} else
 			VFS_I(base_ni)->i_blocks = ni->allocated_size >> 9;
 	}
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
@@ -4763,6 +4791,10 @@ static int ntfs_non_resident_attr_expand(struct ntfs_inode *ni, const s64 newsiz
 	if (ctx)
 		ntfs_attr_put_search_ctx(ctx);
 	return err;
+unlock_runlist:
+	if (!runlist_locked)
+		up_write(&ni->runlist.lock);
+	return err;
 }
 
 /*

base-commit: 708f9d56cacae21aeee98d16bcdd50a66edc04a0
-- 
2.56.0

