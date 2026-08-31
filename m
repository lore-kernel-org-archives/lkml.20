Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99ED046AA66
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788196605; cv=pass; b=I++gaKUsmD0cQDKxywvt9ATn6TU9+G6aXh9Rj0ny1M8W2p7j0Qs/3PO0Ilpp/iGzFPkv4AZzUqzQdP5yrV90rfACajfKpmtJTVvJKMS+Ujd6IuAjlPp+KdUJtpwCgnXzt7KqD+UDvtS8xRWt7esDNfCL54e7fH2DLeyQv9AA7nc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788196605; c=relaxed/simple;
	bh=9oz01DNpKx6/WMk2QkorGU5DBD7X+kgohrm0JOeFQNo=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=g4sxw5zBXn6+CjjbJSSRH1P6oXPLG3sp16JXPYgRu8PVv2ccFriGYn6Q67SS0J45Ok/hRUwpnWhrM2HNSB3HWHnNqpM/1xWXv1Uvm3m839zI6XIzotvHs1CQvucr/Lv2XNDkd2NPBEzphTwnUWXq6tqdxF5hdWNR6/m5QKxnC6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8cwZwRc; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8cwZwRc"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a173ad7cf4so5803431a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788196602; cv=none;
        d=google.com; s=arc-20260327;
        b=CSTOEy7NDyvgxeJle3syGz3iLpUOOwzJTo/JLe3HrG0EMyST3CiJzYaRETuUKUa2Xi
         xF7d/qGwbSJMXO2bBN8K4n6n4/G0FTc4CQ5lkONqrpqpUksRZpsvmXhVvVC36rY1lUHO
         iz0431Z3hHQd5PDU6Co34Y8s4MFfX9eQCFpqEUa3hkQ2FC0RnN2OPExl2JITQQ9RmLii
         BPyNnx9yUx4m47x5uRjCeeaUR+ZOLuyYzs1fAc022fne0VxcOoUZX6rY9PvH5eQuMh6R
         QdXKUM846Dc/lVdXvHT+yBQ0+oO2hs2LsJ4ibAbJqYhhmoaiUxLPdRBhA7k4SzCXrCex
         dCKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=BawYS+YToQeTJe78LwNv7pU3ko9ZF/cuwfYOG/1d9E8=;
        fh=PeAwnYmVq1HestVuggYVZJyDt9MONwSzAop842qzJBo=;
        b=U8JfOvg7SVyczIjAzvpEr3Wm4/Hl/L16gHG818uVVa+USyn5wjlNNDDoLBwG1nX0Md
         0oOir6o2FZiTFBC38UrC6+C8ODyQ/thBuxVZsUosBm4yhOSlMWSi71O6h8Yp9glRF7tc
         He71I7QRJmdh/nz9UxIa/6OisY6a0a1012XA4/roHYCGaP6qfb3ii2qZqKkd/zRaU9+v
         Yu/gjaq84y0NvWrieh3uBhReDxsls2DQYrZWGxw57braBwJT/YGHQpPmCKTx2glx5pJh
         /tmgk6/z6dzqaoyexiBy8T1C0MqlhURabswZXdEkMdBpYgogGgbX22DpNvGOlHlaev6P
         P+lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788196602; x=1788801402; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BawYS+YToQeTJe78LwNv7pU3ko9ZF/cuwfYOG/1d9E8=;
        b=V8cwZwRcVj17nSm6P2ghvUwD4m05XvXv6EkagOFM/fEKBYw4JQ63lAie11gpDbhBJm
         4MspnZ3GTNKOhMio5Y9VMOlT4J/rkdJ1+Vtghm//HI1K17Oik1wgwoNp1nw4RKbxabo/
         YdtYddLDEIoVob2Fwhw79DZxFDzD1onRbPPd+rvQv4ouCilRM9Pdwvy3RJyOpD/llu+w
         c8mlLUZJeRWqN0E/Es3vZV4XnwFJuOzZI+5MUcrn7JbkFPNs3fGBF66CAJYBf9MRzQ2z
         q5cQ6xqpDkMdgX971tqDS0tCUJzD8KdfV4ECTCmF6U/LF8dPAuJDHo3bq0rFfH3gm8q6
         Z3ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788196602; x=1788801402;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=BawYS+YToQeTJe78LwNv7pU3ko9ZF/cuwfYOG/1d9E8=;
        b=HJO7s+gmF7vqJDFa5aGkj9H26iBnN9wVoogqbwFPGCIETpDZJ6xIWgPw5BqAUBvy7O
         CZrRLTErZyiddaKQAl/hDwCEx0/GFnezgF4VL0VuVRC7egH0YFahfOR9Rdqy3yjCBFm7
         jlyWPS3D5CSuFbpJg+L+rHUBB6+VHR/WsLJpjdR5nKO8lQWoSM+ZxsAjjoMZi1TqkXPW
         8tIrKLthrKdE27nl13ISiMB5pHSbkM9gPrvPbX2bx/8wHMZ2eZQFvMqZnrKpx2GErX+9
         l/L/dOHsGXdCkT0r8AMnyvaYg9E5RaWvROhzDVUK0AYDRHeApg6730SCdQCwV6IoCe7H
         vKsw==
X-Forwarded-Encrypted: i=1; AKwUvBzyEzHCfN6yM9jbJnH8Xh19+h7IJWepm/7PFojrhV7s8O8Ca6zmglKLsUHy6WJcyYO6P+pSs3LNyYVlbiM=@vger.kernel.org
X-Gm-Message-State: AFuF++lcmsqyH5UQAiMsp1y6GV2yupIKUJh/K5+Pw1JxGwykycj7JzD/
	ZdIeq1oFVvxnvIh4O6xSfEN9+suXM81ndhYsf06KQ4QmQfSBc8P8RdbVuV2OGNiNsAidkG92rDP
	btf3K3mWDcV/srRzZH90nbi88YCwOTbs=
X-Gm-Gg: AYBFou2z1LZQZylqZIGwnCaVhocgy5rPhmm+Twh/VUTbzWRkQYhR5rrIgYVm1SHpZsY
	0xfdtgpXMSvMfpgiVNEK5rsmw/VuFBxAlXDZ1nOwSZ5WVUKFUuavcJc4WjjN/KH9289fSLP7f+m
	9M1cXtd9jNxm+W40GmVxUsoj2P0LpPWnenqFIjHC7Uq1EETcJV0SLaxYqwNmLqKeg7V7g2yfmIn
	fYlf37CzZxTrgcj3yMAULGlCbmKVPVn7R4vkjAH1b1pfUuElsa6ctWyl/94iM6rvCpJqRoVvlxh
	YrpdOegoW+7Hkcy2hxIwbf2vLETStLfErvmpC6DFUMEYOhLvqFanyOH11l0CLHyEkUbca+FiYbH
	jqA==
X-Received: by 2002:a05:6402:505c:b0:6a5:def7:b872 with SMTP id
 4fb4d7f45d1cf-6a60d36ffffmr14896256a12.9.1788196601644; Mon, 31 Aug 2026
 10:16:41 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:16:40 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:16:40 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 19:16:40 +0200
X-Gm-Features: AcwNN1XtA5-tnGNDvaK43aUf8AA5pUFIOgzydLBSl0rC4kpzP9uEFI3HIlNEi0g
Message-ID: <CAH=xXfH7TPGt-zKXvJRNTgGDZKa1Xoq_sF3-WGs5kdsQLuYn4g@mail.gmail.com>
Subject: [PATCH v5 00/11] f2fs: prepare metadata layouts for runtime block sizes
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org, 
	Kelvin Zhang <zhangxp1998@gmail.com>
Content-Type: text/plain; charset="UTF-8"

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

Changes since v4:
- no code changes
- resend because the v4 transport submitted LF-only body line endings and
  the mailing-list copy still contained hard-wrapped hunk headers
- canonicalize the complete RFC822 message to CRLF before submission; the
  received copy of patch 01/11 will be checked before completing the series

v4:
https://lore.kernel.org/linux-f2fs-devel/CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com/

Changes since v3:
- no code changes
- resend with git send-email because the previous mail-sending path produced
  hard-wrapped hunk headers in the delivered messages

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
