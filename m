Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A133D7D97
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 11:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791632419; cv=none; b=HS1w7k4yxDUbGydzEJsrLvD1q0/P/I/Y3zy/Rb2jY5JmGHVGbPtHpYjxhKMJnsOJ42rZRaCBQtg0L8RW7C9ppU8R6k1Ca2ftL4YY9L+zBOr5HOW31rN9uuT9hvNf3Q7IVzIQqYtSrXDJbb0fxk63pxP3Y7SuVYgNjxK8MKtBgJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791632419; c=relaxed/simple;
	bh=1ArUv4zY14cXl3Wn0JayiraDc2Q4sgIMzLUJG/Lit/c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=evzVQgs/GHqjo2gihU5A0b3sKyko5+4vH4dc1DfPUVpsfXGoEoelX1X2yNunustv1vnqZcFBtinoIp62Pbv9eUZFptWHEQ/KWnAe3KqUNqlPV5Otu0CzqodksdD//cF/eZFegZn4toR0iPABfJwxwxq/AK3p8OeT1GAxBRY36vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=p0WgRM6g; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="p0WgRM6g"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1791632414; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=I6NtQGfz6p7yd+tXSFpdwKh92GfdoMPnWxkUliZla3c=;
	b=p0WgRM6goBwBd+eGAOCTsqhuPxDhj621yzdG2xhgRkD2Km7i6EWCl0kjfKLNU6+5v3utDThfmVAmzOhXvdwNoBTvafOyss2o1O5t+uMxUpj1nQVC/imO7v7HUOgzoT6ZPxBdYpyuZgxlfYJrWAEEAhYmDNj1s/uLCSGBtR9dleo=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R931e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XCW3a.b_1791632095;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XCW3a.b_1791632095 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 10 Oct 2026 19:34:56 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] ocfs2: reserve metadata for a new xattr block and its value tree
Date: Sat, 10 Oct 2026 19:34:52 +0800
Message-Id: <20261010113454.1420939-2-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261010113454.1420939-1-joseph.qi@linux.alibaba.com>
References: <20261010113454.1420939-1-joseph.qi@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The create side of meta_guess in ocfs2_calc_xattr_set_need() reserves
metadata for the new value's extent tree and nothing for the xattr block
that will hold it:

        } else {
                credits += OCFS2_XATTR_BLOCK_CREATE_CREDITS;
                if (xi->xi_value_len > OCFS2_XATTR_INLINE_SIZE) {
                        struct ocfs2_extent_list *el = &def_xv.xv.xr_list;
                        meta_add += ocfs2_extend_meta_needed(el);
                        ...

Commit 3ed2be719eb9 ("ocfs2: allow for more than one data extent when
creating xattr") meant to add that tree on top of the meta_add += 1 the
branch already had, but it moved the 1 into the else arm instead, so the
external-value case lost it.  The 1 is not optional: it is what
ocfs2_create_xattr_block() takes from meta_ac through
ocfs2_claim_metadata(), and it is spent before the value tree exists.

ocfs2_extend_meta_needed() on the empty def_xv list returns 2, so the
branch reserves 2 where 3 are needed.  The xattr block consumes one, and
when the cluster allocator is fragmented enough that the value needs
more than one extent, ocfs2_add_clusters_in_btree() comes back around
with a full value root and ocfs2_alloc_context_bits_left() of 1 against
a threshold of 2.  It answers RESTART_META, which
ocfs2_xattr_extend_allocation() turns into a BUG_ON().
Commit 0cdc7dde00ec ("ocfs2: fix missing metadata reservation for
large xattrs") downgraded that to -ENOSPC, at the cost of leaking the
clusters already handed out: ocfs2_xa_cleanup_value_truncate() takes
its !orig_clusters arm, drops the entry and leaves the clusters for
fsck.ocfs2 to reclaim.

Reserve for the block and the tree separately.

Fixes: 3ed2be719eb9 ("ocfs2: allow for more than one data extent when creating xattr")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/xattr.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index a428fe908116..801d3d311115 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -3580,7 +3580,13 @@ static int ocfs2_calc_xattr_set_need(struct inode *inode,
 		credits += OCFS2_XATTR_BLOCK_CREATE_CREDITS;
 		if (xi->xi_value_len > OCFS2_XATTR_INLINE_SIZE) {
 			struct ocfs2_extent_list *el = &def_xv.xv.xr_list;
-			meta_add += ocfs2_extend_meta_needed(el);
+			/*
+			 * One block for the xattr block we may have to
+			 * allocate, the rest for growing the value tree it
+			 * would hold.  If ocfs2_xattr_ibody_set() succeeds
+			 * instead, that first block goes unused.
+			 */
+			meta_add += 1 + ocfs2_extend_meta_needed(el);
 			credits += ocfs2_calc_extend_credits(inode->i_sb,
 							     el);
 		} else {
-- 
2.39.3

