Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04578372B26
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 22:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788213940; cv=none; b=U/2FiQzzVP5z7koM99OJZQ5h1b+i7NSKBpmboB6EVGDcRbGS5X1bqwleH8VB/5PhxGirCD5P1ojdtx3EA/iXR+fbFSMtk8eznGbE2m1ktHqXA+ZjQQlH/FDzEpP5KyBlNXLykppq1QSlcwzOEyySiZarsTcFqy9yqxpBTR9bw5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788213940; c=relaxed/simple;
	bh=QpQMFE7UlsW9dAByJ/mkGHAc/oAvk0ot/gpvULPJa6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AF5dZZ6/b463AFR8KDiU++d3q+3VMsctJGRH6oP9tST70JGOUvO4Lar/mNwf6xOqx0OzYv2X7MwGW87vbl08p/a+sMQnncP+BmL+dsASDwsIrWJ/w+wtc8rf1KzvOSyMjYT21N6QqKpuFihksPldu7YplgWDYZBt8F6ga/h3Ieg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKj6mb/P; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKj6mb/P"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d944747d41so12571725ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 15:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788213938; x=1788818738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RMi5i5iPklymXSxIAMEXceLLJGJAAAwbDIEES0t4V2Y=;
        b=IKj6mb/Pe7RLUTghdTKOfGOm06r98CsYfrBr8p7r1lPRm1KLEEjZKxp1K2UGlTDtNJ
         ICRjOAu4zVTuNbRftlkuIYxxugLxG17hvsOtSjs4AENaATSPSPkP8cw45VQd9QkD+wRZ
         MPDRVZ8HleEm4jlBHVY9hsBBPJzpchxWVc+NYmBwZEOuwQODRrSVf1W/OfUyIG5JWBCg
         qj680aclGa8zJWmeTL6rph9L7HNxviZJyWwAUqNgeIX+jnIYR6npGikRBsc4IQsfGScV
         js8AemC8/d7U+kn8Olw1o0IGqxOnP12p8tYsRhD3p2UFbHFqZCxD3XcxETorcFYJ7pSk
         RbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788213938; x=1788818738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RMi5i5iPklymXSxIAMEXceLLJGJAAAwbDIEES0t4V2Y=;
        b=DsnlYmCBMV8qnqPYb79PGSQ9cFwRVZmucMPBMumShXdFRWSmcS5gwKMKZwkRPdnuYW
         pupoNuNY5o+RGFxV1DmX/90Xu0ajsI6CfhzSO6jtnj6iEZEK/cBn5cGjKRZijxME3Uvw
         FxWizSaDr1+2QA+zj36hpKRArZxoicNuhKQURW76DPfGkCYoQKyWrgMJh5YAzQUyOuFW
         qdMkYMkBvsJYblWCMnitEnOta8lzwxV6GZg13aSh9a7KdL8hR4a7AaI/TKffxRYkQ2/W
         jiRdYRgfTc2H6XJDQjURa4wb0AHoisj5to4QXfXfD7f8lKcw5GTZUW8lscXOS2HaO2G8
         6ARA==
X-Forwarded-Encrypted: i=1; AKwUvBxO6TQJMptvoU3jHtpTjPJvSygh/5lbSNIh5s2d7zm+JVihc38rRnSq6VNMuyHr6ytxqOGwTjixCoGCOxo=@vger.kernel.org
X-Gm-Message-State: AFuF++lYdjo6awWgEn3sxVaxEIpWH3Z7Q4xMwaBjGiFI5TGw7SM/yErO
	PhJaZwVBp46r6tbGq5Rd/Xy5ylVbcmFn9ZHxDr7DAjQDPQs19vlLumOIgmoY0HHOaBM=
X-Gm-Gg: AYBFou0rOvfcYVDgajwOjuW026domQFBPubQOI8gQaIJdVcEXFrfzcdhh3XepJSzBDC
	HE7Pq2KGPLy5peN+hMf5tJ8iIu9cY+jFTxF8OjpYOeEUyS/stku7pgHfPG+2zbwTd43pNDhFSZd
	eab2sPx6n1C5jiJqnmFaZ5jXyvKbEsFAg+PdczLPzXFChlZk+vfvz5V24e798km4+nGZnZRegOy
	ASzwK6jIVLZY1rbSumCeb66lM3XoInfZFUDClJ/FY8svrSRexDYrUXVjfkKM6cNl7EPSQeT0X7y
	o45JQkYJtsNitZbBb8yd2GTQLkwOV2yfmOIAQDAZfH7qFVkJiSWnbpozjhW0IGea9LHAihDg9g5
	mDiJApQR4FU+boGqm+UEmyrdBsTsWe0iTd2gVoVRNZy07co3QU4yfqCXqqChUQGeDMntxOuusPt
	EbE8aeaV4BPukPACtQYjlvonYWPfFrEjsQ4f8TpRthxP8DCy2mFO7mlL7NRWP77+1Ojg==
X-Received: by 2002:a17:902:f786:b0:2d8:d4ce:7e3d with SMTP id d9443c01a7336-2d8d4ce836bmr326161875ad.18.1788213938327;
        Mon, 31 Aug 2026 15:05:38 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:91a4:c2d8:1d54:21ad])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d951b52bfbsm3131575ad.17.2026.08.31.15.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 15:05:37 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 00/11] f2fs: prepare metadata layouts for runtime block sizes
Date: Mon, 31 Aug 2026 15:05:36 -0700
Message-ID: <cover.1788213716.git.zhangxp1998@gmail.com>
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

Changes since v6:
- no code changes
- return to inline patches sent by git send-email through direct SMTP; the
  previous Gmail API transport reflowed long lines in text/plain bodies
- verified an actual SMTP-received copy of patch 01/11 with git am; its long
  hunk headers were intact and the resulting tree matched the original commit
- send the cover and 01/11 first and verify the list-received raw copy before
  completing the series

v6:
https://lore.kernel.org/lkml/CAH=xXfE6o2sLwcYdoH9cayZpbf389y8PeJ_aDRty61i7q4QKow@mail.gmail.com/

Changes since v3:
- no code changes; v4 through v6 were transport-only resends after the
  delivered inline patches were corrupted by line wrapping

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
- arm64 16KB-page W=1 F2FS build at the series tip
- m68k W=1 F2FS builds with the two reported randconfigs at the affected
  patch points
- SH W=1 F2FS build with the reported randconfig at the affected patch;
  fs/f2fs/file.o has no __divdi3 reference
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
  f2fs: parameterize block size and mask macros
  f2fs: describe node tree geometry dynamically

 fs/f2fs/checkpoint.c    |  75 ++++++++++--------
 fs/f2fs/data.c          |  85 +++++++++++---------
 fs/f2fs/debug.c         |   4 +-
 fs/f2fs/dir.c           |  51 ++++++------
 fs/f2fs/extent_cache.c  |   6 +-
 fs/f2fs/f2fs.h          | 122 +++++++++++++++++++++-------
 fs/f2fs/file.c          |  84 +++++++++++---------
 fs/f2fs/gc.c            |  27 ++++---
 fs/f2fs/inline.c        |  11 ++-
 fs/f2fs/inode.c         |  22 +++---
 fs/f2fs/node.c          | 171 +++++++++++++++++++++-------------------
 fs/f2fs/node.h          |  89 +++++++++++----------
 fs/f2fs/recovery.c      |   4 +-
 fs/f2fs/segment.c       |  60 +++++++-------
 fs/f2fs/segment.h       |  32 ++++----
 fs/f2fs/shrinker.c      |   2 +-
 fs/f2fs/super.c         |  83 +++++++++++++------
 fs/f2fs/sysfs.c         |  10 +--
 fs/f2fs/verity.c        |   6 +-
 fs/f2fs/xattr.c         |  10 ++-
 fs/f2fs/xattr.h         |  15 ++--
 include/linux/f2fs_fs.h | 131 ++++++++++++++++--------------
 22 files changed, 636 insertions(+), 464 deletions(-)


base-commit: c966d29e01bbf829f8bb4a39a49811c56cdb49c3
-- 
2.53.0
