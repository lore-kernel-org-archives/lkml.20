Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.30.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963713;
	b=nn02iF3OYMVAXb/FqkGqgPjt2Q0iY7kUcDafhQ6Ph3Is2QuILi7qOKrmVRv/tOKsCZNF
	 dgQn0WsBoyX1oLdBuZAfQ1XEg5tzwLGtJomUuZfhi56a11TmI/Zh5HU5fsTG8koUWA9a3
	 D+lKZ6IDWIIiGLNt/wxqgUTJCmZM8n4xapCV4DISG8c7/EZ1o3s/8kCt5zutBL4wN1uTN
	 QjLOu+NKE8vNLAwuwYZSb9liPlxXRO3CjpOvdd5K+vfPneKFfBUtz1vnb831sm0zXgd7N
	 CzzIwkZksR2ghsbxRgdSWzKyyTvcqXnVpBkMLOH2NOcdO8OrGAvkSB4yPEcIxDNzY0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963713;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=foPz3ajcNiYo7J20QK49aA/pdA1+e6ccm/huoatWd5o=;
	b=ezz5JizxHvZg6iLMi5/8Yhpxo8TFsOUnFHdtJ4UIKaOOdroylklpQoGDAFNgjee6nckw
	 Q3w3bcX0q47rTYrj9Ux5g1wE0y44TnsqUumGgrloP65CqGQStAdm8pObd2S2EaPbjL2MH
	 Tvc9ZUB0VRrdFcPFpKc+5aeVK8mzqi5B8aXv9/votILrUw/j3wEnvX76TmD+Y897Q/j+k
	 WW3JTE3m1sSpu+xv1eizWTFGtKJWAllJ3u0okNE17Zdl5yc1WEhclFpSVKoFD8RpBT7ft
	 0m21a1wOP9wnlPS/Jw4QYJwVtDcggnY/HTVtYVaj4UlGNKABe1o2eYMjd8NdHDuMLew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.alibaba.com;
	spf=pass smtp.mailfrom=linux.alibaba.com;
	dkim=pass header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Kim04exU;
	arc=none smtp.remote-ip=115.124.30.99
Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60DD606D813
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 11:15:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E60DD606D813
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Kim04exU
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1793963699; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=foPz3ajcNiYo7J20QK49aA/pdA1+e6ccm/huoatWd5o=;
	b=Kim04exUldPD0n2DNIksySNzg/Haz6T4lUlgpKYWZJDejhZ2stLV2PBc0krzvoF1I/9F9g4/JAYUtq3cAY4h7Wfg0xaf013NMK5n6y4o6l37LYdz1BF6CuBISJqjcSmTZotU2vXUcG/m1YI9wZ++NQ/g8wsP0HcTqaOlEW/PU80=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R391e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0XEBd-0Z_1793963698;
Received: from localhost(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XEBd-0Z_1793963698 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 19:14:59 +0800
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Heming Zhao <heming.zhao@suse.com>
Cc: Mark Fasheh <mark@fasheh.com>,
	Joel Becker <jlbec@evilplan.org>,
	ocfs2-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: [PATCH v2 00/31] ocfs2: split dinode validation into shared predicates
Date: Fri,  6 Nov 2026 19:14:27 +0800
Message-Id: <20261106111458.1467464-1-joseph.qi@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3
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

ocfs2_validate_inode_block() is a flat sequence of about twenty open-coded
dinode checks.  The filecheck variant duplicates eight of them but reports
differently: mlog() plus an OCFS2_FILECHECK_ERR_* code instead of
ocfs2_error(), which can force the filesystem read-only.  The duplicated
conditions had drifted apart, and filecheck silently skipped the rest.

Patch series summary

  01      Bug fix.  Exempt orphaned dinodes from the zero nlink check.
          An open-unlinked inode legitimately has nlink 0 on disk with
          OCFS2_VALID_FL still set, so the check rejects valid inodes.
          Orphan recovery then skips the resulting bad inode, so the
          orphan is never wiped and its space leaks.  Fixed at the root
          first, so the refactor stays behaviour preserving.

  02-21   Pure refactor, one check per commit.  Each condition becomes a
          static bool ocfs2_dinode_has_*() predicate, following the four
          helpers already in inode.c.  Return codes and log messages stay
          at the call sites, so no ocfs2_error() call site moves and the
          two reporting paths remain distinct.

  22      Bug fix.  filecheck fix reported SUCCESS on corruption it cannot
          repair.  Revalidate and return the residual code, snapshotting
          the block so a failed repair is rolled back rather than leaving
          a dirty buffer behind.

  23-31   Wire the remaining predicates into filecheck.  All reuse
          OCFS2_FILECHECK_ERR_INVALIDINO, so no new error code and no
          change to the userspace-visible names in ocfs2_filecheck_errs[].

The inline xattr check is still not shared: ocfs2_validate_inode_xattr()
calls ocfs2_error() through its helpers in xattr.c, so reusing it needs a
reporting flag threaded into that file.  Left for a follow-up.

Testing

linux-next 20261103, in a QEMU guest running the series.  Block device
buffers are flushed and caches dropped before each remount, otherwise a
corruption test can read a stale buffer and appear to pass.

  - Refactor is behaviour preserving: all 27 messages, all return codes
    and all ocfs2_error()/mlog() call sites in the normal validator are
    unchanged, each predicate body was compared against the condition it
    replaced, and filecheck's disassembly is instruction identical apart
    from __LINE__.  The normal validator's disassembly also shows block
    rescheduling, so equivalence there rests on the source comparison
    rather than an instruction by instruction proof.

  - No false positives on 4K blocks with inline-data, refcount, sparse,
    usrquota, grpquota, xattr and indexed-dirs, over seventeen inode types
    plus all system inodes during mount and I/O; and on 512-byte blocks
    over five types.  Forcing i_xattr_inline_size up on 512-byte blocks
    drove the inline maximum negative and gave "id_count 312 exceeds max
    -88", confirming the comparison stayed signed.

  - Seven corrupted dinodes on a nometaecc volume were each detected with
    the expected message, with no escalation and the filesystem still
    read-write.

  - With metaecc on: a repairable field alone gives SUCCESS and is really
    written to disk; an unrepairable field alone, and a repairable plus
    unrepairable pair, both give INVALIDINO with the on-disk block byte
    identical afterwards and a second check reporting INVALIDINO rather
    than FAILED.

  - An orphaned dinode with nlink 0 reports SUCCESS, while the same dinode
    without OCFS2_ORPHANED_FL still reports INVALIDINO, so the exemption
    did not disable the check.

The ocfs2 testsuite and xfstests were not run.

Changes since v1

  - The zero nlink check rejected valid orphaned dinodes.  Instead of
    exempting them only in filecheck, patch 01 fixes the predicate at the
    root.  The check was added by commit 7efb45f9685f ("ocfs2: invalidate
    inode if i_mode is zero after block read"), whose changelog describes
    a check for "(i_mode == 0, i_nlink == 0, non-orphan)" while the code
    has no orphan exemption and ORs the conditions instead of ANDing
    them.  v1 also understated the reachability: it claimed orphan
    recovery skips validation because ocfs2_read_blocks_sync() takes no
    validate callback, but ocfs2_read_locked_inode() calls
    ocfs2_validate_inode_block() explicitly right after it in the
    !can_lock branch.  Recovery therefore rejects every orphan on every
    pass, and ocfs2_orphan_filldir() ignores the resulting iget failure
    ("Skip bad inodes so that recovery can continue"), so the orphan is
    never wiped and its space is leaked, with a "Corrupt state" message
    logged on each mount.

  - Returning an error from the repair callback after mark_buffer_dirty()
    left a dirty non-uptodate buffer in the block device cache.
    ocfs2_read_blocks() clears BH_Uptodate on validate failure and
    ocfs2_read_locked_inode() bails before the exclusive lock upgrade and
    ocfs2_write_block(), so the next OCFS2_BH_IGNORE_CACHE read skips the
    disk read and fails -EIO, and later filecheck requests report FAILED
    instead of the real reason.  Patch 22 now recomputes the ecc,
    revalidates, and only then marks the buffer dirty, restoring a
    snapshot otherwise.  Two details: the snapshot covers the whole block
    because ocfs2_validate_meta_ecc() mutates it in place during a hamming
    fix, and the ecc is recomputed before revalidating so a bad ecc does
    not roll back its own repair.  The mechanism was confirmed by reading
    those two functions; it was not reproduced by running v1.

  - The l_next_free_rec repair copied an unvalidated l_count, spreading
    the corruption to a second field and stamping it with a good ecc.
    Now guarded by a valid l_count.

  - The suballoc slot commit cited ocfs2_validate_group_descriptor(),
    which does not inspect i_suballoc_slot, and called the range predicate
    stricter than suballoc.c when it is identical.  Corrected to
    ocfs2_get_suballoc_slot_bit() and reworded: the pair of predicates is
    stricter, the range test alone is not.

Link to v1: https://lore.kernel.org/r/20261105094926.3203416-1-joseph.qi@linux.alibaba.com

Joseph Qi (31):
  ocfs2: exempt orphaned dinodes from the zero nlink check
  ocfs2: abstract the zero nlink or mode dinode check
  ocfs2: abstract the dinode i_blkno mismatch check
  ocfs2: abstract the dinode OCFS2_VALID_FL check
  ocfs2: abstract the dinode fs_generation mismatch check
  ocfs2: abstract the dinode suballoc slot checks
  ocfs2: abstract the dinode suballoc bit check
  ocfs2: abstract the dinode orphaned slot check
  ocfs2: abstract the dinode DIO orphaned slot check
  ocfs2: abstract the inline data dinode guard and cluster check
  ocfs2: abstract the inline data id_count bound check
  ocfs2: abstract the inline data i_size bound check
  ocfs2: abstract the fast symlink dinode guard and size check
  ocfs2: abstract the fast symlink NUL-termination check
  ocfs2: abstract the chain list dinode guard and count check
  ocfs2: abstract the chain list next free record check
  ocfs2: abstract the chain list bits per cluster check
  ocfs2: abstract the dinode refcount location check
  ocfs2: abstract the zero extent list count check
  ocfs2: abstract the oversized extent list count check
  ocfs2: abstract the extent list next free record check
  ocfs2: report unrepairable corruption from online filecheck fix
  ocfs2: check dinode nlink and mode in online filecheck
  ocfs2: check dinode suballoc slot in online filecheck
  ocfs2: check dinode suballoc bit in online filecheck
  ocfs2: check dinode orphaned slots in online filecheck
  ocfs2: check inline data dinodes in online filecheck
  ocfs2: check fast symlink dinodes in online filecheck
  ocfs2: check chain list dinodes in online filecheck
  ocfs2: check dinode refcount location in online filecheck
  ocfs2: check extent list dinodes in online filecheck

 fs/ocfs2/inode.c | 512 +++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 453 insertions(+), 59 deletions(-)

-- 
2.39.3

