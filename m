Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F612F8EA3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788479661; cv=none; b=IMw5CpitL+WLToCl0hA/IFh1Xh9PFa7Hlq2YDptYwyQkI9Jzw+IGoNDPm0EWcRBfFpVDJ8dVgPoZ4D5sxFIU/FeVvKlXIODYhnaPoy9lev1j55bDGH25UnHVMbWhzAU2DVyyP0TOl7lRvl7izSgyAUEx0QRbyHkBYGbOTVu4vs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788479661; c=relaxed/simple;
	bh=Bw7y9NTDWyMISbKyXf0TgRhsNQo2qvUPxvjGEI29IC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MaK2zVrJHJ43SnJo7rm4VeE3NTgQKqwMPO/xxp66o5cY+elTnecyYGeuT9a1NtNQHNHJkhFDE7BGAfQ9Yn2qdnkXYR39QxbvQ4N/Zkf38HxAhoaCvkJG9N3BOAd1pUEPvamGDYp+ZfurAdAJGKPBOjc9QgdfC/TmV6Tm8jkCjTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Uzc6bE+5; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Uzc6bE+5"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc1c3d79b9bso426278a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788479659; x=1789084459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uHu7gXF2LgNRnxV/HYKmzoP+vKk/shVS0drULysZU1c=;
        b=Uzc6bE+5TOjFjmKo974jjMRRelFiJwGJvHZm5gVlkAl6MDlg3+VuXb0QtFqngh8gty
         alPFu4rNDTVgZB17notekh3qqmdp1NnpnVIIDaSlGSmkUTagSNfnbvqAdVQEmcqBjlhj
         tTRUJLT2hsVNU06VBbYbHUEocoogWSMKAsZBq7icHIalpaJ9qBFPQjtwb9DXCXvMA9i5
         IS3M+QrkUv7oNLa5l1mKyrjH3IrrGGMgx4a+FuJUMVPxiNWfivCJ8OpPZGW2IQZ65f/L
         qc1vZs9boc8Q8IHX6VaZNibTnMD6LpPuUhSm/iUYJwN0e0Bv6le/ZLk9Xfkwm5PxLJ0h
         6LIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788479659; x=1789084459;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uHu7gXF2LgNRnxV/HYKmzoP+vKk/shVS0drULysZU1c=;
        b=FEMR2mLuhehXaCmp+h1SDRcB+0Q16anQ1Ak/FLH2C06i8/QBE6Q6DDUItsg7Nd9/11
         D7nPi15ElQbEx+9n641ScnL50uIhIFADW+vGAyS5IoGGC6S0zRaJpoHF8zHcqmLYzDQD
         XeAbYiQKl/A3DsTSWnWzZTMGbcowD4eZOXAA4UZyDHPLT+lNiNHE3fHjlBnBWPCyCS4x
         9uuJtFaGSYGfZ1gr+FigX/nqdPH8MmB6FZmDIdQVW+Gfd66fWP+1fPwcPhmC5N6MYkhk
         DYPC2cQDU+1ww/AFz1N3l4OW24WzVZnzYPLZm/YYXTO5CIAsmlDU9IpNBMtJA+PdZctC
         IqBw==
X-Forwarded-Encrypted: i=1; AKwUvBxjLlk1d94DNKau5ma96QXXNTtvU192iQsndJX7RLQgrs06DI9ABcd5QzqniJ2fF7RWOFCfUWO3wIk28KE=@vger.kernel.org
X-Gm-Message-State: AFuF++nB9pVPf17g2+91YeqwPhYuNSetbAaTYrqT3eAQ07el2v8cRd0E
	qx6KXSpxt9ENk8mlDQEVy3hxCETKhe9gfiJReWdBYLDa0Js0h25sSq6w
X-Gm-Gg: AYBFou308CbBUYIzcTn7KU87S9KFkpL+1Gtwoio46AuoJ8XgfNmBVPcHy3AUn3SZo3L
	cq7SuCUjAfGMkPxh8bIdisro3AJVlH6oImGgjUm6JNH2LOHhnZ5A5vpYOkFCE26tBO7CNu8dp8J
	DYZ0TwaZ3MsEmgO5HjM3pSuSplWgm5we9GiG1+a4MMuZYhw7I4vk3/0YPhcCYm6YPNYX5YcoII9
	BFsk2uKz3/l5zldFINiBnF73lTGcCbGJlNBqdOTHr2GpeQsOMTu0lgWBg2rBR99d8Z0TUNwKAEZ
	TkvBge3CXFJ63SZpymXsXpth6A62Qewmdvag0Z89Cft7wBHb3uq7io7RW5ArpZB5OsrA2taG8lu
	j3Xz2YRTWm8nve8W3eU0IT9BMNgsK72gsNI2Jp1V+aOemz3cV/iu6vf5m0Uxl6ydOkUGcSur2dH
	kRrNPGRjJkV+07XkVRTM0meYYDt56JSrFQy3RNi7WAY/BF22wG1az80HeWiQrsedCHLQ==
X-Received: by 2002:a17:90b:564c:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-39b2612338dmr3303412a91.4.1788479658863;
        Thu, 03 Sep 2026 16:54:18 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339885d29esm2327688eec.2.2026.09.03.16.54.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:54:18 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 00/11] f2fs: prepare metadata layouts for runtime block sizes
Date: Thu,  3 Sep 2026 16:54:16 -0700
Message-ID: <cover.1788479509.git.zhangxp1998@gmail.com>
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

Changes since v8:
- rebase onto f2fs/dev at 5ad9409a9533 ("f2fs: stop using PG_private")
- no intentional code changes

v8:
https://lore.kernel.org/linux-f2fs-devel/cover.1788476500.git.zhangxp1998@gmail.com/

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


base-commit: 5ad9409a9533bd345d5c9c3d5e3be7619c31a761
-- 
2.53.0
