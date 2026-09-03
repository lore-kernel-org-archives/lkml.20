Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F72334CFCA
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476770; cv=none; b=njwTHCF0uKWcovzKSTHnqEt3vQ/uiK4ldGlgJcWUqtzaCmCG8rIgvYr3PrLbEhP7F0YXj0RlFcmHYtR+2TF6NyUiGeQmCagdUW9R7o/cytchlDDhZ3zPXaqYBlKNkeTpt1fwck9dGyw0SyeSKhGjtZKkROJr6+3sW1pevtfkfsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476770; c=relaxed/simple;
	bh=PAZ+0nsYEx2hQZYSTN4Fm/zyMa9yrYV0iNA799R5ZCo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lBCHEzSjxI/GXNclKy7jej3gSWA7FlVOekxmGEAXFhjq9s6l0Uc3klw4bsW+Rndtsgz7BSCFC57W94gqe2tpPSKEaCPB56S1lYL2YAqglP/PgJk2m+LK5CoBDO34JrSDrxxQBojY5LQTzrmpNNO6qgbH2sad6LCDEHqx3qpU9Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J0MeMZiX; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J0MeMZiX"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caced6038eso4221205ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476769; x=1789081569; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xkRazqQ8DBZA8pwlVaij6JLqPhgIEkspYHWRThtggmo=;
        b=J0MeMZiX0qI1AimCd5Tx5st9iQddKHz4DROkjsH/LIVrogH/roVPSr3UEuPtwu2ns3
         y4958Z8FmZXK+rESXgvpQR6KvXyYdqcZok/volpDiez1EbuhkSSkVoqbmeKpQYEULKjU
         fOLATezAlMZ4FHMfrJfkxg2MwJolEwsGJWGS1DslFPmB7D/yPr+4ls33alBa1ARfeF8b
         pph2CYgQbbafUpDWxyD9RgTpElhQVM1fxk7K0ISH9F3fl+HFnCeVISz8NnJ1NfJNXaRX
         Ol0/aVs1BAfR0XUtYD9eEOHs3/5ai7t+YG/vqk8jU4NVa6NyEXehnIXyciJxM1a7O59Y
         qZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476769; x=1789081569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xkRazqQ8DBZA8pwlVaij6JLqPhgIEkspYHWRThtggmo=;
        b=Qh51RmodlfYJZQ4BDc0JRKa0WbGE/oSpEo/uk3i0+k/PIw130af5m6+oBsCBDEYFef
         455bSlv4+nZRca99iGRiORqr+sana/1/2fFzvZHBoCPkfr8tGubznWG48SqgpknwyUVB
         fQWplXjlakeP3CinC6KnRdcFEbyeIJL7QYQddwo0bvcpDl7f69tLVXAVuIUfUcwpgauL
         52IoKqKExZbXvBNK729Uci/inpopDJhGpRpyudG9TheKOXYteTbgXhlxc12ZrmUWCu2P
         NOSHWxTUK8/gdzCK2INU+NxR3JT4LhlYFWNbKIdEp2Er15qEkhbjKRzHR888PS8Kp34A
         BH2A==
X-Forwarded-Encrypted: i=1; AKwUvByemTjkMXfzFsZa9RsU248JXkXHVgvndcl5c14pYK4AOEumPexFDxusED8H3AWTX8ry4GNNvijqv1Ho3gQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kAa2HYkRPk2+H3fPZ11fo2OhFbaSFkVdKyGiW6mAcHvF1pnk0J
	AUqp3EesKNczQExtFffU4LNRC9L+O7bIMIfe7+pJLmmnam2nktM4yM62
X-Gm-Gg: AYBFou27rY+WBjeyCxpWF/9lJ6UaOODqdNxjsWObQJVKNOv6IHElnbHP5YaimVh29iI
	AWw6qV3ANZQccmPZky8ucCHZ9glYN/iGxvdciLNZXDawCZ+jICdL+28EbTM05jce6W1Hi0nofkb
	EsIcvkomImywq1PGvY26zVTBwzab/uiVDgcw05IvaEYnp/ASS39WBXGvpu/rDivxPRekaL5HWMl
	fRUYeGmiHx0SdfvUNV/h9GgqowmNElDdL83IeqgZt1NEIpGpDMaxgAqYWYRJTCe6jT/ra7VBISU
	0CsLgVz5TmYznb40KXt4s8mMM8UMmrVbfmMO8geJrjxyvm0VT+f5EMRVMUXay//WjBTrzUOrmnw
	h6D8NXLJhezyMLYsuhLZ3wGafOVCYttCfrUwPv1YiQV08CUEFWxWYhUy9PJanAL25PhjR5Kda1Q
	4D0FjtKiuWNeB9ozvVzrMK5tWAKYrQSVD8DEpXJxvHhULJe1CTXhYf3uCu6N+4kL0bYg==
X-Received: by 2002:a17:903:37cc:b0:2d0:401c:2edc with SMTP id d9443c01a7336-2dafaee6576mr71597175ad.1.1788476766967;
        Thu, 03 Sep 2026 16:06:06 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2db1495a0c0sm1776075ad.17.2026.09.03.16.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:06:06 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 00/11] f2fs: prepare metadata layouts for runtime block sizes
Date: Thu,  3 Sep 2026 16:06:04 -0700
Message-ID: <cover.1788476500.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

F2FS currently describes several on-disk metadata layouts and filesystem
geometry values with constants derived from PAGE_SIZE or a fixed 4KB block
size. This series derives those values from the mounted filesystem's block
size instead, as preparation for supporting filesystem blocks smaller than
PAGE_SIZE.

The patches initialize sb_info early, describe the SIT, NAT, orphan, dentry,
node, and xattr layouts dynamically, parameterize sector/byte/block
conversion helpers, and derive node-tree geometry at runtime.

This series does not relax the block-size mount check or enable subpage I/O.
It is intended to be a behavior-preserving refactoring for currently
supported 4KB-block filesystems.

Changes since v7:
- address all review comments from Chao Yu and Daeho Jeong
- mark the sb_set_blocksize() failure as unlikely and remove unused helpers
- retain struct f2fs_orphan_block as a flexible-array wrapper
- separate the shared-header block-size geometry helper from the cached
  kernel-side inode geometry helper
- consolidate the inline-xattr size helpers and move F2FS_MAX_BLKSIZE to its
  first use
- retain the node-ID layout description without nesting comments
- restore shift-based block alignment instead of using 64-bit division
- move node-tree geometry before block-size macro parameterization so each
  intermediate patch builds without temporary PAGE_SIZE churn
- use a size_t format for the maximum inline-xattr size on 32-bit builds
- remove unrelated whitespace and other incidental changes

v7:
https://lore.kernel.org/linux-f2fs-devel/cover.1788213716.git.zhangxp1998@gmail.com/

Changes since v3:
- no code changes in v4 through v7; those versions addressed mail transport
  corruption before v7 was delivered intact through direct SMTP

v3:
https://lore.kernel.org/linux-f2fs-devel/CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com/

Changes since v2:
- use DECLARE_FLEX_ARRAY() for flexible arrays that are alone in a struct or
  used in a union, fixing the reported m68k GCC build failures
- use F2FS_BLK_ALIGN() in f2fs_sec_trim_file() to avoid a runtime 64-bit
  division and an unresolved __divdi3 reference on 32-bit SH
- no other code changes

Changes since v1:
- rebase onto f2fs/dev at c966d29e01bb
- drop the unrelated free-NID underflow fix from this series
- split the preparatory changes into 11 focused patches
- initialize sb_info earlier and describe the xattr layout explicitly
- separate sector, byte/block, and block-size macro parameterization
- update commit messages and address checkpatch warnings

v2:
https://lore.kernel.org/linux-f2fs-devel/CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com/
v1:
https://lore.kernel.org/linux-f2fs-devel/CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com/

Tested with:
- x86_64 W=1 F2FS build at every patch
- i386 allmodconfig W=1 F2FS builds at patch 07/11 and the series tip
  (no new warnings)
- arm64 16KB-page W=1 F2FS build at the series tip
- builds of all five F2FS subpage selftest binaries on the complete branch
- scripts/checkpatch.pl --strict (no errors or warnings)

Kelvin Zhang (11):
  f2fs: initialize sb_info early in f2fs_fill_super
  f2fs: describe SIT block layout dynamically
  f2fs: describe NAT block layout dynamically
  f2fs: describe orphan block layout dynamically
  f2fs: describe dentry block layout dynamically
  f2fs: describe {i,d,id}node block layout dynamically
  f2fs: describe xattr block layout dynamically
  f2fs: parameterize sector conversion macros
  f2fs: parameterize byte and block conversion macros
  f2fs: describe node tree geometry dynamically
  f2fs: parameterize block size and mask macros

 fs/f2fs/checkpoint.c    |  63 ++++++++-------
 fs/f2fs/data.c          |  85 +++++++++++---------
 fs/f2fs/debug.c         |   4 +-
 fs/f2fs/dir.c           |  51 ++++++------
 fs/f2fs/extent_cache.c  |   9 ++-
 fs/f2fs/f2fs.h          | 117 ++++++++++++++++++++-------
 fs/f2fs/file.c          |  84 +++++++++++---------
 fs/f2fs/gc.c            |  27 ++++---
 fs/f2fs/inline.c        |  11 ++-
 fs/f2fs/inode.c         |  25 +++---
 fs/f2fs/node.c          | 171 +++++++++++++++++++++-------------------
 fs/f2fs/node.h          |  87 ++++++++++----------
 fs/f2fs/recovery.c      |   4 +-
 fs/f2fs/segment.c       |  60 +++++++-------
 fs/f2fs/segment.h       |  32 ++++----
 fs/f2fs/shrinker.c      |   2 +-
 fs/f2fs/super.c         |  84 +++++++++++++-------
 fs/f2fs/sysfs.c         |  10 +--
 fs/f2fs/verity.c        |   6 +-
 fs/f2fs/xattr.c         |  10 ++-
 fs/f2fs/xattr.h         |  11 +--
 include/linux/f2fs_fs.h | 135 +++++++++++++++++--------------
 22 files changed, 628 insertions(+), 460 deletions(-)

base-commit: c966d29e01bbf829f8bb4a39a49811c56cdb49c3
-- 
2.53.0
