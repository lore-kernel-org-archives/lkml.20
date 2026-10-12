Received: from h3cspam01-ex.h3c.com (smtp.h3c.com [60.191.123.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849C218DB1A
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 08:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.191.123.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791795024; cv=none; b=tl/p3ysGp1zpDJmweKrXUg6uqfo8RKYp1H7Wpk0KeG6k/dOsyZEopdhFPBd0ZFkqLYDmMfcWq8aR47yPfYbNwKwZ/44H7vEPmywO8MGZsyqEWJZhNKXvwQq14Th+7qbsgveK36XoCd1+4teTk6ZHu5VoCAt8eUie5Evc3bMh1v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791795024; c=relaxed/simple;
	bh=/KK/czsRL45mXBKZgTtPvGztDqX9i0JJRCslH/bDN/M=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=NU5mATPOIHTXsHhhNp/W8h5jedDgDUVeA/Jm3Z7O2yyRKmN1uEvxw6+BQ2Lkj+Cu+VDiNpSVGDhpQnmEt7vOen39hjjoNExBFXM8LarUpNUQbDhj3R5R1CkExnidVzq2gNo66WRAsx1IYuwXOrkqeYX6Vi3ZvNtz3OxKWrzVrQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com; spf=pass smtp.mailfrom=h3c.com; arc=none smtp.client-ip=60.191.123.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=h3c.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=h3c.com
Received: from h3cspam01-ex.h3c.com (localhost [127.0.0.2] (may be forged))
	by h3cspam01-ex.h3c.com with ESMTP id 69C7wsJd036931
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 15:58:54 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from mail.maildlp.com ([172.25.15.155])
	by h3cspam01-ex.h3c.com with ESMTP id 69C7wBEf032117;
	Mon, 12 Oct 2026 15:58:11 +0800 (+08)
	(envelope-from lin.nan@h3c.com)
Received: from DAG6EX09-BJD.srv.huawei-3com.com (unknown [10.153.34.11])
	by mail.maildlp.com (Postfix) with ESMTP id 7098A2284EA2;
	Mon, 12 Oct 2026 16:01:00 +0800 (CST)
Received: from localhost.localdomain (10.142.164.48) by
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1258.27; Mon, 12 Oct 2026 15:58:10 +0800
From: Nan Lin <lin.nan@h3c.com>
To: <richard@nod.at>, <chengzhihao1@huawei.com>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <lin.nan@h3c.com>, <wangxiaoqing@h3c.com>, <zhou.kete@h3c.com>
Subject: [PATCH] ubifs: fix host inode TNC offset when deleting an xattr
Date: Mon, 12 Oct 2026 15:50:46 +0800
Message-ID: <20261012075046.1268480-1-lin.nan@h3c.com>
X-Mailer: git-send-email 2.33.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSMTP02-EX.srv.huawei-3com.com (10.63.20.133) To
 DAG6EX09-BJD.srv.huawei-3com.com (10.153.34.11)
X-DNSRBL: 
X-SPAM-SOURCE-CHECK: pass
X-MAIL:h3cspam01-ex.h3c.com 69C7wsJd036931

When ubifs_jnl_delete_xattr() deletes an extended attribute, it writes
a group of three nodes to the base head: the xent node, the xattr
inode node and the host inode node. The host inode node is actually
packed at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, but the
position registered into TNC is computed backwards as
xent_offs + len - hlen. The two differ by the group tail padding,
ALIGN(hlen, 8) - hlen.

Whenever the host inode's data_len is not a multiple of 8, the offset
registered in TNC points 1 to 7 bytes past the real node header. The
wrong offset gets committed into the on-flash index, and on the next
mount read_znode() fails the offs & 7 alignment check, returns -EINVAL
and switches the filesystem to read-only mode, reporting
"bad indexing node ... error 2".

Which inodes are affected depends on data_len:
 - block/character devices always carry data_len = 4 and are always
   affected;
 - symlinks carry data_len = strlen(target) and are affected unless
   the target length happens to be a multiple of 8;
 - regular files, FIFOs and sockets carry data_len = 0 and are
   unaffected.

The bug reproduces by setting an xattr on a symlink with attr -Rs and
removing it with attr -Rr: after unmount and remount, readlink()
fails, the index node is rejected with error 2 (bad branch offset) and
the filesystem turns read-only.

Fix the offset computation by accumulating the group layout forward
instead of subtracting from the total length: register the host inode
at xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ, which matches the
packed position exactly. The host node length hlen is already correct
and stays unchanged.

Signed-off-by: Nan Lin <lin.nan@h3c.com>
---
 fs/ubifs/journal.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/ubifs/journal.c b/fs/ubifs/journal.c
index 40a95a2fad50..1a32d641e658 100644
--- a/fs/ubifs/journal.c
+++ b/fs/ubifs/journal.c
@@ -1943,7 +1943,9 @@ int ubifs_jnl_delete_xattr(struct ubifs_info *c, const struct inode *host,
 
 	/* And update TNC with the new host inode position */
 	ino_key_init(c, &key1, host->i_ino);
-	err = ubifs_tnc_add(c, &key1, lnum, xent_offs + len - hlen, hlen, hash);
+	err = ubifs_tnc_add(c, &key1, lnum,
+				xent_offs + aligned_xlen + UBIFS_INO_NODE_SZ,
+				hlen, hash);
 	if (err)
 		goto out_ro;
 
-- 
2.33.0

