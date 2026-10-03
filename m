Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBFF8472
	for <linux-kernel@vger.kernel.org>; Sat,  3 Oct 2026 04:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791001572; cv=none; b=Fk2dlx7M24U4kBbzXHBJjubrVKq8HHBi7RtnHn4mTGvfLzMa9vSVz9DWlRzRX2FjJUj0pmCwlPlhonjhYEfDng5Pa/x+3o2aElOx9UFgZxQMoPdl+uqGZawFm372plb6HyjCQVmoqHXAxIxna9eC3VrMMRqooGd12BKWyWEQOWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791001572; c=relaxed/simple;
	bh=h+2Ow1i15F7KPiVReMD9PgSJEKbSC2YIEWEYBSnlbHE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fQY7W7DcWzeOtvcdtx5OIPHZdXvAEnjpQQYCwfyJcRaNpGY8YPxX+N/9PBjSXu+ZucLFqqD9LihogvZ89JIayVGNWw+P6VfpE7Gb6jqx/onT/zSK6blJQEsft3bkM7Iqk+AnQ4XOH/NxzejKj3uBwHN8Eq6OPAjCCdsAItOmQKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TUTXSm5m; arc=none smtp.client-ip=74.125.229.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TUTXSm5m"
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-33e59607d38so115822eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 21:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791001570; x=1791606370; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSeOczIjPFbvATXEGGxg3VzbD+inmrgXoMUFqn7Y1/w=;
        b=TUTXSm5mNRwzQYQnfl4u3eRTNM2vGeA0Xeu2QCb95hmPhsgVX7HfkUOpNmUTbk+xrI
         EezuativnfoMPVP+wmi/9f3SpZa3+nkBhy/PR9FRS9IUiXnjyD14xKUaLUzAGHpMsP93
         BYrghhmg6ZXwFZtJIP1AZAOrIO1WjOU9MpUK7PqRepBwNhXj3aAI+n2YW4M/OgnOsYDc
         nDwZp1nBfBMGneT9zx2bRHy/BzeO/04g2nhHJWXZNVCjUoqDWMA1IPlS2MZ9WPjefm7/
         F8IWObKGKmW0M//JppTSQOPLKMna6yeWbtRYc6ECDO8U9mYZMOQDncizODNyF6aBlhqI
         Vojg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791001570; x=1791606370;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xSeOczIjPFbvATXEGGxg3VzbD+inmrgXoMUFqn7Y1/w=;
        b=J3Yrz8sh1KJ/ss4nij5mlvZmXKdjopJK0eWKeLB7qReBgDFBK0Y8TKyhO77mOwtgAh
         00+BkjmitORdRgu97V0BGNJqUOPzpmKy1ukGV91/1hXvGHMPhJEdsmG2lOempEjwMgNU
         UMyangJp+Oys272C5cR6N2SUr/pIX21QRXjuINuwMSsu9dcxR1PDWnUjS1NxGNYdFGff
         58HQ/bRc/x39CK2wJclyVXILZ16VIOXKUffQ/fYHRHFK8ByOqVzpAVSE4VwRYkSBu4t5
         6FNOUHVxCsrbltFbahHvm2Ya8A+Ygo+7v7+38igovp+Vbref4ewnN7ac20mq7FxFgciJ
         PPDw==
X-Forwarded-Encrypted: i=1; AKwUvBzwCmP38dI81IKderbzqxliU7w3/+6yxli5JKiG6porJ9zNHtzunrXavQdSwvPyaNtpNACaYzpP/t1gkOQ=@vger.kernel.org
X-Gm-Message-State: AFuF++nHjyfR1bS51d24SrThvAJQqbgERcaYFPQIoVXF9ayTDGvX+MTU
	BH8wM4HrKzbfMigA3RA8KA3A1ExY/8MRpmpznLVmidgqCvIyMHerfbGJ
X-Gm-Gg: AYBFou2wFaQEiT9ZWc97EMJCTjPVvSUaweS1+KxC2zX7ov5OzRbAskgIzbJ6dTKMQu+
	D6S51oio9xhtUInxj3Zn8qMP8Y0hlG+lT8TB14tAmyAwf2yWa2wKv4Y0NA5hYfgklwMfouIXO3B
	QDqXvuslklJEeBbNbqeiGC/v4gLZrO0rxol5YJQQ+86P5gzo36SBW3/OuhN7jTsvNIaHVwhiXWf
	4bU1Omnksai2WImxW4XuhxTZBbfb9jgxEAGknuzYLiZyLva1ockai6JRI+x7OE93K3xrwzW3Gkc
	ryCva6F7f1lV7XwEemsoampLQinQrIXzUCEdCwnGhWWlw0+Gjlx9eW9zne3fNJWAKDPiNv6Oywr
	BmZ4vZPm6CdmnkreqK/aZ/hHpulKbnRJxxS20cRoHKQJ+KIo7T7+d+L1WFTJn949NAUmW+5pbog
	By6iBQYXTR3FrC9cTj1FmbRTdyvT8ro2wKSkQME8LGCTTIDt9//o1PyD//SpBM153z0YTzrROrB
	WOhPPr3VrvlJnlZ/KqszoAPziQ3f+98X2GJO3fpQaiE9uuxY7d4F6SB
X-Received: by 2002:a05:7022:150c:b0:147:8a40:cdf3 with SMTP id a92af1059eb24-151c30ed221mr1886309c88.24.1791001569922;
        Fri, 02 Oct 2026 21:26:09 -0700 (PDT)
Received: from Raccoon ([2409:408d:681:993f:98e4:2186:6da9:ff5e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-151fc39948bsm2034446c88.4.2026.10.02.21.26.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 21:26:09 -0700 (PDT)
From: Rohinthan P <rokinthanp03@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	syzbot+0266f74df36ca702aedf@syzkaller.appspotmail.com
Subject: [PATCH] jfs: fix general protection fault in dbDiscardAG
Date: Sat,  3 Oct 2026 09:56:02 +0530
Message-ID: <20261003042602.22602-1-rokinthanp03@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

syzbot reported a general protection fault in dbDiscardAG():

    Oops: general protection fault, probably for non-canonical
    address 0xdffffc0000000003: 0000 [#1] SMP KASAN PTI
    KASAN: null-ptr-deref in range
    [0x0000000000000018-0x000000000000001f]
    RIP: 0010:dbDiscardAG+0x648/0x8f0 fs/jfs/jfs_dmap.c:1726
    ...
    Call Trace:
     <TASK>
     jfs_ioc_trim+0x436/0x680 fs/jfs/jfs_discard.c:106
     jfs_ioctl+0x291/0x3b0 fs/jfs/ioctl.c:131

In dbDiscardAG(), nblocks is initialized from bmp->db_agfree[agno].
On a corrupted filesystem or when free block accounting underflows,
nblocks can be negative (e.g. -1LL / 0xffffffffffffffff).
When max_ranges is assigned from nblocks (as u64) and divided by minlen,
max_ranges retains 0xffffffffffffffff. Then max_ranges + 1 overflows to 0,
causing min_t(u64, max_ranges + 1, 32 * 1024) to evaluate to 0.

As a result, kmalloc_objs(struct range2trim, 0, GFP_NOFS) returns
ZERO_SIZE_PTR (0x10). The check (totrim == NULL) does not catch this,
the loop while (nblocks >= minlen) is skipped because nblocks is negative,
and tt->nblocks = 0 dereferences offset 8 of ZERO_SIZE_PTR (0x18),
triggering a KASAN null-ptr-deref / general protection fault.

Fix this by:
1. Validating agno against bmp->db_numag and minlen > 0.
2. Checking if nblocks < minlen before allocation; if an AG does not have
   enough free blocks to satisfy minlen, there are no extents to discard,
   so return 0 immediately.
3. Clamping nblocks to bmp->db_agsize.
4. Checking ZERO_OR_NULL_PTR(totrim) instead of just NULL.
5. In jfs_ioc_trim(), clamping agno and agno_end to db_numag - 1 and
   handling potential integer overflow in the range calculation.

Fixes: b40c2e665cd5 ("fs/jfs: TRIM support for JFS Filesystem")
Reported-by: syzbot+0266f74df36ca702aedf@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=0266f74df36ca702aedf
Signed-off-by: Rohinthan P <rokinthanp03@gmail.com>
---
 fs/jfs/jfs_discard.c |  9 ++++++++-
 fs/jfs/jfs_dmap.c    | 15 ++++++++++++++-
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/fs/jfs/jfs_discard.c b/fs/jfs/jfs_discard.c
index 4b66029..3cf8d84 100644
--- a/fs/jfs/jfs_discard.c
+++ b/fs/jfs/jfs_discard.c
@@ -94,7 +94,7 @@ int jfs_ioc_trim(struct inode *ip, struct fstrim_range *range)
 		return -EINVAL;
 	}
 
-	if (end >= bmp->db_mapsize)
+	if (end >= bmp->db_mapsize || end < start)
 		end = bmp->db_mapsize - 1;
 
 	/**
@@ -102,6 +102,13 @@ int jfs_ioc_trim(struct inode *ip, struct fstrim_range *range)
 	 */
 	agno = BLKTOAG(start, JFS_SBI(ip->i_sb));
 	agno_end = BLKTOAG(end, JFS_SBI(ip->i_sb));
+	if (agno >= bmp->db_numag) {
+		up_read(&sb->s_umount);
+		return 0;
+	}
+	if (agno_end >= bmp->db_numag)
+		agno_end = bmp->db_numag - 1;
+
 	while (agno <= agno_end) {
 		trimmed += dbDiscardAG(ip, agno, minlen);
 		agno++;
diff --git a/fs/jfs/jfs_dmap.c b/fs/jfs/jfs_dmap.c
index a841cf2..cee0b8e 100644
--- a/fs/jfs/jfs_dmap.c
+++ b/fs/jfs/jfs_dmap.c
@@ -1673,15 +1673,26 @@ s64 dbDiscardAG(struct inode *ip, int agno, s64 minlen)
 	int count = 0, range_cnt;
 	u64 max_ranges;
 
+	if (agno < 0 || agno >= bmp->db_numag || minlen <= 0)
+		return 0;
+
 	/* prevent others from writing new stuff here, while trimming */
 	IWRITE_LOCK(ipbmap, RDWRLOCK_DMAP);
 
 	nblocks = bmp->db_agfree[agno];
+	if (nblocks < minlen) {
+		IWRITE_UNLOCK(ipbmap);
+		return 0;
+	}
+
+	if (nblocks > bmp->db_agsize)
+		nblocks = bmp->db_agsize;
+
 	max_ranges = nblocks;
 	do_div(max_ranges, minlen);
 	range_cnt = min_t(u64, max_ranges + 1, 32 * 1024);
 	totrim = kmalloc_objs(struct range2trim, range_cnt, GFP_NOFS);
-	if (totrim == NULL) {
+	if (ZERO_OR_NULL_PTR(totrim)) {
 		jfs_error(bmp->db_ipbmap->i_sb, "no memory for trim array\n");
 		IWRITE_UNLOCK(ipbmap);
 		return 0;
@@ -1704,6 +1715,8 @@ s64 dbDiscardAG(struct inode *ip, int agno, s64 minlen)
 
 			/* give a hint for the next while */
 			nblocks = bmp->db_agfree[agno];
+			if (nblocks > bmp->db_agsize)
+				nblocks = bmp->db_agsize;
 			continue;
 		} else if (rc == -ENOSPC) {
 			/* search for next smaller log2 block */
-- 
2.53.0

