Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792513960;
	b=Qnk2DZjpiaBOwMCFfbGrUKqhjU/i6k/9IHYffLdbIGtYj++V+cDl5LnAKLx4edSZT1lp
	 1G0JYbXvdJA55/KsqzB8UQ/A/anRauZa7rcZKPQsmlqZFjIZ3FBmS+Ytn4onG5D5GBvMK
	 riPj3VsmWG7HhlEDjYnA9/VApT81dDP5FhLqRMyD71nC+4d02v/R/Rtx10sdHDAf9UVYw
	 JxOvzX66lXQuRwi2KKMfg3nMQP/YYKrTy2wCccXfWhjFc0YThYp1e/zXusT3UDJEZsPQA
	 BcIuZWIcwXnTvWx8aMMqSe+gR31I398s+7ovp9EItvJQOATepsIf6gEH3EzeR+hUNcw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792513960;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BmuvYDLnL4oCN/8txzpGUelJxzwWzVd32COPEwMPZ0c=;
	b=KU7HRXhI6Sbd1snJiQWzwwAioipru6w0EVo73GLtxm78VfPwYWs9pw9sQyu7AMcbl5wZ
	 UcH2yQkai6EWh9LodZ+2thkYEgySL46uLcDshU5p1wtj5OA9Q1+LlK1BxGgF8BU5aLeD8
	 ABcxwjMDxPJvrx5J/RRGaaapxqZrmnI1wOXi5SQUA5CkTioRfzA7sMz7lNmHRcFIjpqgm
	 40kwhy68d9pN1iUL91h8/9xBxjc5IBfjEn7btp+jGvSxSrMbqH5vz8YennioTKwtz6Sa0
	 a4X9jfQPmKcJaufL9/4iaKnD/vLfq61efJZiyZYcmAfYeeff/kQvlNHEyfDIVTa8xkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSwH7Hf7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0EB606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 16:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSwH7Hf7
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792513959;
	b=OBKkwhIYXknqgkfYeFs1LIqn+ZDgyrT22E5Zr3Y57EgAPwXtffCxfVaL19VYb8hhdZwk
	 fMu12xkfJuzy3fEOm6TfzD9I1vR8s1x7tkZREOJy+8umj52UsfgDlxt48fBTN9cN9wg5W
	 9z+jdxEJRIaL9q6fBQ4tlEhTEkeW6+fcMlNGL0WWeTOZuUSyltotJ5WQk9BdtlypgrLyk
	 mvSRacC306FyFRaGmfO0iPasQ9JGnggJvZMtO+NBL6KdXU8wH9AT/JVjrAWzUr2LkRbU2
	 pyWqPGxzrbh2EByCDuW+gzwbUbmJqYyZkSEEPyu4nqzCrBYi1+2nFsPGJdivgCZpQOw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792513959;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=BmuvYDLnL4oCN/8txzpGUelJxzwWzVd32COPEwMPZ0c=;
	b=P/0v0qGdmzwUqnqWetRzD4kPMWlfQj55Hu3gCQmTUeruREFpdpuRakYTyHFs4KITEpN9
	 D5P/6K0uIbPLQDIcVkHsGB05IIKDgqDKFn+fQw0WXQUXTKOSu0anr4k3yUzq24PKtuYUM
	 zrMi4kx+XyLhpWGxRyLsJpxtO/ylxwQUvRvKkyRn30M6E9MroQ+2eM7sIB8mtJ5s9ZeuJ
	 5FEwxIZtWRdcGLsW8IXje0mPo6y4d0IxhOtWdHPaX1skQaEwJofV25JZS1HJNP3wLiysA
	 1vLVsSnUqdAG5fPRhdCxtf+hq3fLb5Ipx8j0Wo6MqsCmErVFcEebFN6R4k6sRJcAcQQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E81171F000C4;
	Tue, 20 Oct 2026 16:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792513959;
	bh=BmuvYDLnL4oCN/8txzpGUelJxzwWzVd32COPEwMPZ0c=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LSwH7Hf75HTK1oOTQhvmjzh++yL3PPEg0yK9Sgbm3UhG1NM9e1H5X7hoVuQjrsdDe
	 RjzJ3PTG0/K2/cuNwBcgOOmkoEPSfgXUBn5zo3J2JGgcXD7ujMoot99+RaxhTJuRPH
	 /nLgonvc6cfjOt0fNZ4P0FwMZr48rv/OmPFE7T67k/bzKjI273Wxz+H0VemiTMO+eK
	 Ej5O1j0RRZKIxMquRjpuzWGXdBLKETzNyqk6dAkje95+oRmqVePg7h8wyztJug8q1s
	 35KByHiBqV99r1zDW/ErUuCRATwAtmwdmlYzVXfrDHs2iI37A5MC10Rim0rrJU7EM2
	 UYGdWHxTGR/Mw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3A992405FF;
	Tue, 20 Oct 2026 16:32:21 +0000 (UTC)
From: Nicholas Velten via B4 Relay <devnull+nicholasfvelten.gmail.com@kernel.org>
Date: Tue, 20 Oct 2026 13:32:21 -0300
Subject: [PATCH] jfs: reject xtree pages whose BT_ROOT flag does not match
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261020-jfs-xtroot-check-v1-1-4877a93be93e@gmail.com>
X-B4-Tracking: v=1; b=H4sIAJSX12oC/yXMwQqDMAyA4VeRnBdog465Vxk7rDHOOLCjqUMQ3
 91Oj9/h/1cwSSoG92qFJD81jVOBv1TAw2t6C2pXDOTo6h05HHvDJacYM/Ig/EEhJt+0dXsLDkr
 2TdLrciwfz9M2h1E4/z+wbTsnAcg4dAAAAA==
X-Change-ID: 20261020-jfs-xtroot-check-e2c2159498b0
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzbot+43706fd1eb4c8dccdfe6@syzkaller.appspotmail.com, 
 Nicholas Velten <nicholasfvelten@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792513940; l=3454;
 i=nicholasfvelten@gmail.com; s=20261014; h=from:subject:message-id;
 bh=A7u2AT1HyEAjeanbXyIXcu220bBEFFEl+WoLfKmLCZM=;
 b=TBYSxYzsdnCNRnV/Pwis8URFHiMRnNNEJIrFwZtSqbRWs5r3TcREn4ijHcOX0y/n7mMDHVDNZ
 CsaxPskNY8lC2b2NybXVAQhWwSxyRY3R3fqLhf3Nyym4jdANwLs49Tp
X-Developer-Key: i=nicholasfvelten@gmail.com; a=ed25519;
 pk=WVTZgm6yXQ+XrhULAObg4lwcHPhhxAXrAY+YY6svXzg=
X-Endpoint-Received: by B4 Relay for nicholasfvelten@gmail.com/20261014
 with auth_id=1173
X-Original-From: Nicholas Velten <nicholasfvelten@gmail.com>
Reply-To: nicholasfvelten@gmail.com
Content-Transfer-Encoding: 7bit

From: Nicholas Velten <nicholasfvelten@gmail.com>

syzbot reports a crash in release_metapage() when an inode from a
corrupted JFS image is evicted:

  Oops: stack segment: 0000 [#1] SMP KASAN PTI
  RIP: 0010:release_metapage+0x9e/0xab0 fs/jfs/jfs_metapage.c:870
  Call Trace:
   xtTruncate+0xecd/0x2f20 fs/jfs/jfs_xtree.c
   jfs_free_zero_link+0x35b/0x4c0 fs/jfs/namei.c:759
   jfs_evict_inode+0x363/0x440 fs/jfs/inode.c:159
   evict+0x61e/0xb10 fs/inode.c:837
   ...

The xtree root of a regular file is embedded in the inode, and
xt_getpage() returns it for bn == 0 with a pseudo metapage. Callers
such as xtTruncate() and xtTruncate_pmap() then decide whether they
hold the root by testing the on-disk p->header.flag & BT_ROOT. In the
reproducer's image a regular file has an xtroot flag of 0 instead of
DXD_INDEX | BT_ROOT | BT_LEAF, so xtTruncate() takes the non-root path
for the embedded root and releases the pseudo metapage as if it were
a real page, dereferencing an invalid folio.

xt_getpage() already validates nextindex and maxentry for both the
root and regular pages. Also reject a page whose BT_ROOT flag does not
match where it came from: the root (bn == 0) must have it set and any
other page must not. Healthy trees always satisfy this, since
xtInitRoot() sets BT_ROOT and xtSplitRoot()/xtSplitPage() never copy it
to a child page.

Tested in a KASAN guest: the syzbot reproducer crashes the unpatched
kernel. With this patch the bad page is reported as
"xt_getpage: xtree page corrupt" and the reproducer runs to completion.
On a clean mkfs.jfs image, writing 40 separate extents to one file
(forcing a root split), remounting, truncating, renaming over an
existing file and remounting again still works, with the data
unchanged.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Reported-by: syzbot+43706fd1eb4c8dccdfe6@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=43706fd1eb4c8dccdfe6
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Nicholas Velten <nicholasfvelten@gmail.com>
---
syzbot sent an AI-generated RFC for this bug in May
(https://lore.kernel.org/all/938f325a-46c6-4ade-8a21-b3271963810c@mail.kernel.org/),
which also bundled unrelated txnmgr/logmgr changes and got no replies.
This patch only addresses the xtree root confusion, by validating the
flag in xt_getpage() next to the existing nextindex/maxentry checks.

The reproducer is syzbot's C repro, run in a virtme-ng KASAN guest built
from next-20261009.

Not tested: architectures other than x86_64, and jfs_fsck on the
rejected image.
---
 fs/jfs/jfs_xtree.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/jfs/jfs_xtree.c b/fs/jfs/jfs_xtree.c
index 28c3cf960..3a5f9d035 100644
--- a/fs/jfs/jfs_xtree.c
+++ b/fs/jfs/jfs_xtree.c
@@ -121,7 +121,8 @@ static inline xtpage_t *xt_getpage(struct inode *ip, s64 bn, struct metapage **m
 		(le16_to_cpu(p->header.nextindex) >
 			le16_to_cpu(p->header.maxentry)) ||
 		(le16_to_cpu(p->header.maxentry) >
-			((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE))) {
+			((bn == 0) ? XTROOTMAXSLOT : PSIZE >> L2XTSLOTSIZE)) ||
+		((bn == 0) != !!(p->header.flag & BT_ROOT))) {
 		jfs_error(ip->i_sb, "xt_getpage: xtree page corrupt\n");
 		BT_PUTPAGE(*mp);
 		*mp = NULL;

---
base-commit: becb95e45ef0dda9ffb35156d909d3da7a2789c3
change-id: 20261020-jfs-xtroot-check-e2c2159498b0

Best regards,
--  
Nicholas Velten <nicholasfvelten@gmail.com>


