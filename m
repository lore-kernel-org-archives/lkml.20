Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792854623;
	b=bNWwtBH3xvvitMcRbz7yhFNGNp4PxAYvOU64o+2+iFqdIp4n21Jn8qD1FlJTguNinyjN
	 da1SBMttCT4Jbi44fa4/6vF00HzggPpe5XgNuc1RWYofVDOkAMijTJcQV2S0j06KPKioP
	 KS42SOdPffb5BHjsNRF5KkeXqP7PM2K/2TX6QiAt+TUa04qp7dJ1V490W09H590EAV/9W
	 2fAbdyBzDto+wJRIK0A/zDOIyTJ0unJNBVo9/s/1827C3w9S2Gu3asoCwU1pHJVYvKhN5
	 L2xXoEwA8rmeF01tCUgf53hrR2byPW0B3f6LCXz7hgk1xmkbrazrhnQcHcvDNz0Wm/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792854623;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=9JDFRrI5Zm8lm4r9xZObuGaRC6mhGOsAjpj/UhYTsMY=;
	b=P8mzmieAR6iAB/JCfTsmazlSvicpDdF53UQoqXxZkKhZrMcQ61CLhS5TNjIouaYaz/VD
	 23D99UAE07zBV9vEze8eq7G81ybziyF1SHY2Ua7rQMBr9Ru8p30T+gwUrXroJmE1/ud4j
	 UGDQZ4w6RTNLmS4gU0rI+Yud6Bt4nVXyGgBLkz9OmID8cFZxc4k5Wa1Y6nDSOxv5v+lIC
	 jh6ZxhYl2oOPP1iTnMwwga9z5An3Gi7QfOBkEYy1i9R0JXLT5S2FIWL5tjgqjllqi7ffd
	 yD2Sf518TOSTLpZLEQFTi9kLjZXEX85nt2nunmcdcJE6vVJs+irdU9NculrXPnEkUpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=sL2Q2jjw;
	arc=none smtp.remote-ip=115.124.30.101
Received: from out30-101.freemail.mail.aliyun.com (out30-101.freemail.mail.aliyun.com [115.124.30.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E7E606A334
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 15:10:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1E7E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=sL2Q2jjw
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1792854615; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=9JDFRrI5Zm8lm4r9xZObuGaRC6mhGOsAjpj/UhYTsMY=;
	b=sL2Q2jjwAAcSAu10SakqgOLn3/lWY+r0sKzE08p4bGPPSSqMyk/maJhFp67AqeED3grA3H76vA1L5+Nt8hfLi6UmiNtvJncfwTUtOYRd0tR4cuNvBHhC4n8OgfqeQa90FvhEeq/MLwXtPdXswuECd19yHE/UUB4BUzCga0zeYWk=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R461e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XDONeQ2_1792854614;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XDONeQ2_1792854614 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 24 Oct 2026 23:10:14 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] ocfs2: find the xattr entry again after defragmenting a bucket
Date: Sat, 24 Oct 2026 23:10:08 +0800
Message-Id: <20261024151012.1059683-3-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
References: <20261024151012.1059683-1-joseph.qi@linux.alibaba.com>
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

ocfs2_xattr_set_entry_bucket() hands loc.xl_entry to ocfs2_xa_set() twice:
once for the bucket as it stands, and, if that reports -ENOSPC, once more
after ocfs2_defrag_xattr_bucket() has packed the name/value pairs down.

Defragmenting ends by sorting the entry array on xe_name_hash.  Buckets
are kept sorted, so the sort only permutes entries that share a hash, but
lib/sort.c is an unstable heapsort and it does permute them.  loc.xl_entry
is an address inside xh_entries[], so afterwards it denotes whichever
entry landed in that slot rather than the one the search found.

The second ocfs2_xa_set() then works on the wrong entry.  Nothing on that
path compares the entry's name with xi->xi_name, so what happens depends
on how the two entries compare in size: ocfs2_xa_reuse_entry() trips its
BUG_ON() when the padded name sizes differ, and otherwise the new value is
written into the neighbouring attribute's value slot while the attribute
being set is left untouched.  setxattr() reports success either way.

Remember the entry's hash before defragmenting and look the entry up
again afterwards, the way ocfs2_xattr_bucket_find() does.  An entry that
cannot be found again means the bucket no longer holds what the search
found, so fail with -EFSCORRUPTED rather than writing through the stale
pointer.

Fixes: 012255961c9e ("ocfs2: Enable xattr set in index btree")
Cc: <stable@vger.kernel.org>
Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
---
 fs/ocfs2/xattr.c | 30 +++++++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index bb5b12924e1b..d6d07116ce97 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -6052,13 +6052,18 @@ static int ocfs2_xattr_set_entry_bucket(struct inode *inode,
 					struct ocfs2_xattr_search *xs,
 					struct ocfs2_xattr_set_ctxt *ctxt)
 {
-	int ret;
+	int ret, found = 0;
+	u16 xe_index;
+	u32 name_hash;
 	struct ocfs2_xa_loc loc;
 
 	trace_ocfs2_xattr_set_entry_bucket(xi->xi_name);
 
 	ocfs2_init_xattr_bucket_xa_loc(&loc, xs->bucket,
 				       xs->not_found ? NULL : xs->here);
+	/* Defragmenting below may move this entry, so remember its hash. */
+	name_hash = loc.xl_entry ? le32_to_cpu(loc.xl_entry->xe_name_hash) : 0;
+
 	ret = ocfs2_xa_set(&loc, xi, ctxt);
 	if (!ret) {
 		xs->here = loc.xl_entry;
@@ -6077,6 +6082,29 @@ static int ocfs2_xattr_set_entry_bucket(struct inode *inode,
 		goto out;
 	}
 
+	/*
+	 * ocfs2_defrag_xattr_bucket() sorts the entries by name hash and
+	 * lib/sort.c is not stable, so entries sharing a hash may have traded
+	 * slots.  Look the entry up again before writing through it.
+	 */
+	if (loc.xl_entry) {
+		ret = ocfs2_find_xe_in_bucket(inode, xs->bucket,
+					      xi->xi_name_index, xi->xi_name,
+					      name_hash, &xe_index, &found);
+		if (ret) {
+			mlog_errno(ret);
+			goto out;
+		}
+		if (!found) {
+			mlog(ML_ERROR, "xattr entry not found in bucket %llu after defrag\n",
+			     (unsigned long long)bucket_blkno(xs->bucket));
+			ret = -EFSCORRUPTED;
+			goto out;
+		}
+		loc.xl_entry = &bucket_xh(xs->bucket)->xh_entries[xe_index];
+		xs->here = loc.xl_entry;
+	}
+
 	ret = ocfs2_xa_set(&loc, xi, ctxt);
 	if (!ret) {
 		xs->here = loc.xl_entry;
-- 
2.39.3

