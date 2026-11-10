Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794307690;
	b=JLlRJ3fNc2uMfWaVdRgIY1LlL+sWlG5Uhr134gka6ZU75N2QJVleCCb9J5Mtp1hWjIxY
	 hZK02b3HLIR0hVBmzH1nrDDibxt8+h8Xu2B9fcpRS0tNTo1mEq5lPNA3Rx6lCH7Ex5VQU
	 ka/Kdts0SHHYNzi+wyjJMq3NQKsy2fKO/Hs2plE7zwIZoyQVAte/+pjUcaljKIxKd1Zv/
	 13MWtB+UFUfUXurof8OadPrV7YJeIhjrvmyfAJCX+k1+xjk8jWyKgqT3NzOhj+cLq+NRs
	 qgwvNqJHQnsg62tH1WkK7WCVt+54u6f68ij7iwM1ksvGod3jgLEWI8Ws0ojayzyEGKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307690;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bShBu0yD41wmsU4ZUMjg7Q7N++uU9hwHuYVhHz6irRg=;
	b=y01f7R1F6nPgHDl2WkKomxitBQpq9Tq+l1AzXclr6xlpgphMPStUKrydNK7yIwTOLHfq
	 NIPfuGsPodYjF2LgwgMsBucYVJbdltDEKXBAaIBnxlWmRq3N58viqWiot+MJ0UghRUL5r
	 3U6Y+Vlaj1EQCEp2r3BK7rQsXUDaV0c5dtrb3d6XU0rav5QQSXgxvZW4c7ki3SKkAZU3a
	 GnSoZZwg/i5cZ0v/dKOaU/I20T6encO2jb2E7WI3s/+/aQFbsSgBYfpxh9slSC7/lW7rj
	 98nkPncpjJN16isYOmYaT0PiTZn7jwZSoXME/SL1KsuVaIBwgtELXuybMM4TflRWaYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Z07oNWfE;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFC1D60A2606
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 10:48:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFC1D60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=Z07oNWfE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1794307683; bh=bShBu0yD41wmsU4ZUMjg7Q7N++uU9hwHuYVhHz6irRg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Z07oNWfEB982lPZSZoLfAtqzoLi699lrpzn2hGVop4IHPNR18eshqGFBl3B9hB/o6
	 LuCH9jbhZU6cXhu1zqxuXHTA+Sd20OwqE3UIgySrtZKKJYb4ytu0A60k529OT5lHH+
	 44QRfTpytQ5uIrR9qLNYwagATzuv0Y+rfsvhnztY=
Received: from shuai-VMware-Virtual-Platform.. ([218.28.192.28])
	by newxmesmtplogicsvrszb51-1.qq.com (NewEsmtp) with SMTP
	id C00AFA4B; Tue, 10 Nov 2026 18:48:00 +0800
X-QQ-mid: xmsmtpt1794307680tsf7kezr9
Message-ID: <tencent_BD411EBE6912574EAC69E2C77D437A886505@qq.com>
X-QQ-XMAILINFO: OATpkVjS499uCwhGCaEyocW/O/HLBQRV/Z7h379jR+Zy38GydSpTC9SROyrdRz
	 CBGjP5CksOrO4JSTjZYJBlnmZwgYvqMTXAXcd1EJrmRwWtUZ5pJPvOIm6S7pLIoFpPpWmMUi9uRe
	 IhHvIZHe1owXYzeS6iiu+3uCs75fxzJLGJ4qfhBuBcLyjL09tfDyz79zTSKUkuAAT8vmQuJMZBou
	 QJKJspgCktdpWdXBuaZwUEJlaEu3VzjUjz9xFYddMvIibJH3j27NCqDOi4iZfsYylAUZpyRxa2NL
	 gNsDwqKdrJk1gWGdkEFCa+nXeB1HYSw9zRY+VAoINqfYrfG2jBT6iyluqNkM0YEtD23NrvaqHaU9
	 VydxRIWx6hDAXS1xH4ozOBG2JWOU6G8F8Ol56y7mizC6uPSa8QNDSRL1UyzTMMmBBpwDdEvzufHd
	 TawRqXqTy7lR1nznknqf+aH/UB8asoGhVph8VMB1UjHdBZVdBpDkchBsl0115SwHEJFLsRa8Kqeo
	 z98pldJRwnyICyQZBUbRGio5DE0jyIN3SMYCRdMbhActG3D2wR52vOItY8awoKlcRmfugdxA1xB8
	 T9gga+3JaSHqvCKhCmZSEfTwkBmh4j2NqNYr33HdXCVfhF1dk5JkBQu0Xfmdnyga7QOY1h6xEq5x
	 VggtrdlPqGitZvkkb1gGLG+qIAK90HcsFDiWcUeKtMifv+SzZMvu0P3tC2NFaRAVa6xf2XQgnixP
	 c95pJLLjDO03ki86nSXRgOkC7AR4CXGC0nMg1TfdI3kpdfhotYOStUq6D3UpSo96YLbqgdItfFku
	 z3+SL0iD0H2DgLEBnrSdnjVxernLWg2yMsHCi5APq2zxaBOMqpbEFDjKdAnn5QE2WYhrPk878ZKT
	 7w7asXz0GvDqxsTGzR2PI2gudeKJwHzbjif1Vzhp+SEKre35GUxlYshCq8j7CJDormChkb/cH9mQ
	 veDYXXr/+HoV+5sofEuGZ1ZjmGo/KYPzrFFuF9s7wr01fRyYwuexFQ5c9nFGKGyM6wHT85UZIw4O
	 A8yriKxBmRHl8AbpjRM5S6w4yX/6I/G4ryepQi42J0ya1xIxJKGk3mG1xYjPvdpm1yvcXDsRHdy9
	 xFNh1i1RKkuS9sT2E=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
From: Shuai Liu <847807867@qq.com>
To: jfs-discussion@lists.sourceforge.net
Cc: shaggy@kernel.org,
	sj@kernel.org,
	syzbot+ab18fa9c959320611727@syzkaller.appspotmail.com,
	linux-kernel@vger.kernel.org,
	Shuai Liu <847807867@qq.com>
Subject: [PATCH] jfs: add dmap integrity check to prevent out-of-bounds tree access
Date: Tue, 10 Nov 2026 18:48:00 +0800
X-OQ-MSGID: <20261110104800.669438-1-847807867@qq.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <6ae96436.abb90550.19e2c9.0000.GAE@google.com>
References: <6ae96436.abb90550.19e2c9.0000.GAE@google.com>
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

Add check_dmap() to validate dmap structure integrity, mirroring
check_dmapctl() which already guards the dmapctl pages.

A corrupted on-disk dmap page (e.g. a fuzzed filesystem image) carries a
garbage dmaptree header.  The free path does not validate it before use:
dbFreeBits() -> dbJoin() reads tp->dmt_leafidx straight from the on-disk
tree header to locate the leaves, and dbAdjTree() then computes
lp = leafno + dmt_leafidx into the stree[] array.  With the observed
corruption leafidx = 0x5ff20055 (expected LEAFIND = 85) the computed
index reaches 0x5ff20056, far beyond TREESIZE (341), triggering the
WARN_ON_ONCE added to dbAdjTree() by commit a174706ba4da ("jfs: add a
check to prevent array-index-out-of-bounds in dbAdjTree") -- a
mitigation, not a fix.  The alloc path got a leafidx sanity check in
dbFindLeaf() by commit d64ff0d23067 ("jfs: check if leafidx greater
than num leaves per dmap tree") and the dmapctl pages are verified by
check_dmapctl() from commit cce219b203c4 ("jfs: add dmapctl integrity
check to prevent invalid operations"), but the dmap leaf pages
themselves are still trusted.

Validate the dmap tree header (nleafs, l2nleafs, leafidx, height,
budmin and the leaf values) in check_dmap() and call it when a dmap
page is about to be modified: dbAllocDmap(), dbFreeDmap() and
dbAllocDmapBU().  Return -EIO on corruption so the caller aborts the
map update instead of operating on a bogus tree.

Verified with the syzbot reproducer under QEMU (x86_64_defconfig +
CONFIG_JFS_FS=y): without the fix the jfsCommit thread reliably
triggers

    WARNING: fs/jfs/jfs_dmap.c:2962 at dbAdjTree+0x2fa/0x3f0, CPU#1: jfsCommit
      dbJoin+0x24b/0x2b0
      dbFreeBits+0x170/0x8d0
      dbFreeDmap+0x62/0x1c0
      dbFree+0x266/0x550
      txFreeMap+0x2d3/0xe10
      xtTruncate+0x24fe/0x2e20
      jfs_free_zero_link+0x262/0x4c0
      jfs_evict_inode+0x40a/0x4a0

with R12 = 0x5ff20056 (= 1 + corrupted dmt_leafidx), reproducing on
every run; with the check in place three consecutive runs complete the
mount and file operations with no WARNING, Oops or jfs_error report.

Reported-by: syzbot+ab18fa9c959320611727@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=ab18fa9c959320611727
Signed-off-by: Shuai Liu <847807867@qq.com>
---
 fs/jfs/jfs_dmap.c | 77 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a841cf21da7de..4616ded254ba6 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -220,6 +220,74 @@ static bool check_dmapctl(struct dmapctl *dcp)
 	return true;
 }
 
+/*
+ * check_dmap - Validate integrity of a dmap structure
+ * @dp: Pointer to the dmap structure to check
+ *
+ * Return: true if valid, false if corrupted
+ */
+static bool check_dmap(struct dmap *dp)
+{
+	s8 budmin = dp->tree.budmin;
+	u32 nleafs, l2nleafs, leafidx, height;
+	int i;
+
+	nleafs = le32_to_cpu(dp->tree.nleafs);
+	/* A dmap tree always covers LPERDMAP leaves */
+	if (unlikely(nleafs != LPERDMAP)) {
+		jfs_err("dmap: invalid nleafs %u (expected %u)",
+			nleafs, LPERDMAP);
+		return false;
+	}
+
+	l2nleafs = le32_to_cpu(dp->tree.l2nleafs);
+	if (unlikely(l2nleafs != L2LPERDMAP)) {
+		jfs_err("dmap: invalid l2nleafs %u (expected %u)",
+			l2nleafs, L2LPERDMAP);
+		return false;
+	}
+
+	leafidx = le32_to_cpu(dp->tree.leafidx);
+	/* Check leaf index matches expected position */
+	if (unlikely(leafidx != LEAFIND)) {
+		jfs_err("dmap: invalid leafidx %u (expected %u)",
+			leafidx, LEAFIND);
+		return false;
+	}
+
+	height = le32_to_cpu(dp->tree.height);
+	/* Check tree height is within valid range */
+	if (unlikely(height > (L2LPERDMAP >> 1))) {
+		jfs_err("dmap: invalid height %u (max %u)",
+			height, L2LPERDMAP >> 1);
+		return false;
+	}
+
+	/* Check budmin is valid (cannot be NOFREE for a full tree) */
+	if (unlikely(budmin < BUDMIN)) {
+		jfs_err("dmap: invalid budmin %d (min %d)",
+			budmin, BUDMIN);
+		return false;
+	}
+
+	/* Check leaf nodes have valid values */
+	for (i = leafidx; i < leafidx + nleafs; i++) {
+		s8 val = dp->tree.stree[i];
+
+		if (unlikely(val < NOFREE)) {
+			jfs_err("dmap: invalid leaf value %d at index %d",
+				val, i);
+			return false;
+		} else if (unlikely(val > 31)) {
+			jfs_err("dmap: leaf value %d too large at index %d",
+				val, i);
+			return false;
+		}
+	}
+
+	return true;
+}
+
 /*
  * NAME:	dbMount()
  *
@@ -2112,6 +2180,9 @@ static int dbAllocDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
 	s8 oldroot;
 	int rc;
 
+	if (unlikely(!check_dmap(dp)))
+		return -EIO;
+
 	/* save the current value of the root (i.e. maximum free string)
 	 * of the dmap tree.
 	 */
@@ -2167,6 +2238,9 @@ static int dbFreeDmap(struct bmap * bmp, struct dmap * dp, s64 blkno,
 	s8 oldroot;
 	int rc = 0, word;
 
+	if (unlikely(!check_dmap(dp)))
+		return -EIO;
+
 	/* save the current value of the root (i.e. maximum free string)
 	 * of the dmap tree.
 	 */
@@ -3338,6 +3412,9 @@ static int dbAllocDmapBU(struct bmap * bmp, struct dmap * dp, s64 blkno,
 	s8 oldroot;
 	struct dmaptree *tp = (struct dmaptree *) & dp->tree;
 
+	if (unlikely(!check_dmap(dp)))
+		return -EIO;
+
 	/* save the current value of the root (i.e. maximum free string)
 	 * of the dmap tree.
 	 */
-- 
2.43.0

