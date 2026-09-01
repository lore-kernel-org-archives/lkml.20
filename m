Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD9736A364
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 06:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788244395; cv=none; b=XCVboQVUfQlJ5TEXjt3WhIXsgUuTWb+tSpu7oxIWFOwBgAz+nVa5qFamR9SaIsW7SzF63/kluZ0XNHHJIQ0JfP/ByarMm7pdHpPiie12dzbzHXp59nAfrQJtDfO8sn+M9yxUOo1a34GeVkJm33oPrnrEnhdQs3q2oTP+TCAHryA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788244395; c=relaxed/simple;
	bh=edazl2ou1TLvrk3rmjtmKnMfsy2LB8FGmDUno3DnjzU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=R3krfEaWnnoahOQ/cvT9NsvIHSETP6rV57UYE9bDlOK1o4txrtOgpXzbOsIbR0r9WA275Qja+vQb7yqDY/hnpzseIzWCBA2xfCMxd6bQmA+zTXs9L/t/pvGgaYNs352w68FXvFJ5X+HsJRMKG8I1IRMt8PLjyn0d+cZBk/DmBrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=jlTAWIrv; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="jlTAWIrv"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788244382; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=bnWFImoGhAi1v6CrkWMP07uZX5A0q/0x1mw75nQV2cA=;
	b=jlTAWIrvcCmd6gZ9J1CqjN3OhzscggNPUeCXeJn/5mtHxxhg1ZyyNDUqL1nIqHTkT4IK/Zrbh9CHmagqkn+wiJVEOFD6fvDrcszbEKU6LAkwmnTv39PnBAwXyjvXPYWT7ijMAWR0ye4i68v5BsmzKyDAzgLVNJKIPKn1JtlyLew=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0XA47zCd_1788244381;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XA47zCd_1788244381 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 14:33:02 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] ocfs2: validate suballoc slot and bit of metadata blocks
Date: Tue,  1 Sep 2026 14:32:57 +0800
Message-Id: <20260901063301.984933-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ocfs2 metadata validators trust the on-disk suballoc slot and bit
without checking them against the slot range of the mounted filesystem
and the capacity of the block group bitmap.  A corrupted image can
carry OCFS2_INVALID_SLOT or another out-of-range slot, or a suballoc
bit beyond the bitmap, and once the corresponding inode, extent block,
xattr block, dir index root or refcount block gets freed, the bad
value goes straight into ocfs2_get_system_file_inode() or
_ocfs2_free_suballoc_bits() and hits a BUG_ON() or runs off the end of
local_system_inodes[].

This series rejects such values at read time in the existing
validators, so a corrupted filesystem fails with -EROFS and remounts
read-only instead of crashing:

  patch 1 restricts dinodes with OCFS2_INVALID_SLOT to system inodes,
        completing fe7a283b3916 ("ocfs2: add suballoc slot check in
        ocfs2_validate_inode_block()"), and turns the "system file
        state is ambiguous" BUG_ON() in ocfs2_read_locked_inode() into
        an ocfs2_error();
  patch 2 rejects oversized suballoc bits in dinodes;
  patch 3 validates the suballoc slot and bit of xattr and dir index
        blocks;
  patch 4 validates the suballoc slot and bit of extent and refcount
        blocks.

The checks only enforce what the kernel and mkfs.ocfs2 already write:
a valid slot from meta_ac->ac_alloc_slot and a bit within the block
group bitmap, with system inodes carrying OCFS2_INVALID_SLOT plus
OCFS2_SYSTEM_FL and extent blocks using slot 0.  Nothing changes for
healthy filesystems.

Each new check was exercised under QEMU by corrupting the field in
question with an out-of-range value; with the series applied the
access fails with -EROFS and the filesystem remounts read-only instead
of hitting the BUG_ON().

Changes since v1:
  - Patch 1 also turns the system-file-state BUG_ON() in
    ocfs2_read_locked_inode() into ocfs2_error().  i_flags is on-disk
    data, so a crafted dinode with OCFS2_SYSTEM_FL passes the slot
    check and still hit that BUG() on a plain lookup.
  - Patches 2-4 now bound the suballoc bit against the block group
    bitmap capacity (block size minus the group descriptor header)
    instead of the raw block size, using a new
    ocfs2_suballoc_bits_per_block() helper.
  - Patch 3 also validates xb_suballoc_bit and dr_suballoc_bit.
  - Patch 4 also validates h_suballoc_bit, and adds rf_suballoc_slot
    and rf_suballoc_bit checks in ocfs2_validate_refcount_block().

Joseph Qi (4):
  ocfs2: restrict OCFS2_INVALID_SLOT suballoc slot to system inodes
  ocfs2: validate suballoc bit during inode read
  ocfs2: validate suballoc slot and bit of xattr and dir index blocks
  ocfs2: validate suballoc slot and bit of extent and refcount blocks

 fs/ocfs2/alloc.c        | 27 +++++++++++++++++++++
 fs/ocfs2/dir.c          | 27 +++++++++++++++++++++
 fs/ocfs2/inode.c        | 53 ++++++++++++++++++++++++++++++++++-------
 fs/ocfs2/ocfs2.h        | 11 +++++++++
 fs/ocfs2/refcounttree.c | 27 +++++++++++++++++++++
 fs/ocfs2/xattr.c        | 25 +++++++++++++++++++
 6 files changed, 161 insertions(+), 9 deletions(-)

-- 
2.39.3

