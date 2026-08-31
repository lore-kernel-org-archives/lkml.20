Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF0C47798A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788197747; cv=pass; b=BD7H+hCtcxhdMGwzf5ZbmisPjyabx6nv79RqNZR+Fo4uw6SPsc8UqVV1uPuyqVlMGHk5ZttLoqDhDDY5olrpSODQo2kTG7rkEBhnsF4uOFCOmpZMWXFSTwgiZgGxuWTI/K/t2e7hy+twAe61yZ99MJLwT8dwaZHvBrfXoHkCZLg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788197747; c=relaxed/simple;
	bh=knxdwHwU3vtDFCWMa82XQX3S02q39w5bB3rwsdSJi9I=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=E7V2WZrm4BBiIBxYuLd3Y/yN7PODqqXjLtGRAPsOR4te89v84VTvvlHmNQsyAOS19eqg+zw2Nyl0fV0FrrTh4LTyMXi3rT/DexzfgwGSLLoD8uxRwe3wEkAyy1uFonuh2M9j/NgF6eorEgm51bi/GAMMwqPsmxsBoChVia9HCh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQIW4o+R; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQIW4o+R"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-69c108fee7fso4894723a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788197744; cv=none;
        d=google.com; s=arc-20260327;
        b=WcGtB7wyKJrKrjf1eY2HcjacSKTH7Vs8ba2LbLJ+5U/KljF8jzUR2KkLIkE9SP1vDW
         RYfG0qhKujk3yA3V2ZOXrulxMoMWHi84yPtMa2kXY9lFi/d/6KYadRk27lAS6ChoPByI
         WTZwQCgxeuUDh4P/lWq5ItmszK+DtuiGmdgAiMZ8x7ZzUDAEln3oydkCXt16lGZh9hEb
         DJg4uitcmJ4ufO/frOQ9JvMc21cpPjxjt51nCGz4qea6aEzV8w0a77zoMKRbwBUWEAi9
         RqB4IhJVfER8wwdTWTFeS3wf+SXt6OXHpcDRoNrUpRzSy7Fydg4JMgRj7OyXotgbQ2v6
         1dYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=NrLEV+P2I7sA236ztoqXL6dgwfLc2PQ26Z83hstTuik=;
        fh=thhxhwTq7nSM0y8ypu4px1BNjYb8j/fsIlno/D0OxUE=;
        b=mCrvbkOk9VQI0iniNiLb6ZPpxc95moBjZA+02nrbJFzj7XQdnChq8zCu03awtehrvV
         eRSItvB6iBz84FeckbhZ/N8yh3puQb0uWZqYaAZDTXJY964R1xWbZfnG2JcBqwH/uIyu
         EVLGyG7DReN7pTZooHahVi0UXkHWHojvYk7srBL2yh4m6Zj0aA5EMiq7rsxoa88RyOtd
         DjUKc+1h79Vla4bHVMezsihI0X/FnsVTBYEdocMDFpo1TbMDPCtF+NAFSVB8XITajIDm
         +0ZrcQvnkSCK7sDuPwmsK7b5yMVXs7WKhFyyaA1GNJIpi7eXcdGLqd7mRDigzN1j7Yxo
         mXdQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788197744; x=1788802544; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NrLEV+P2I7sA236ztoqXL6dgwfLc2PQ26Z83hstTuik=;
        b=jQIW4o+R+75deFZGt18qVRYd8RDQxGBzZiyr+wgCNKFOL1t0Z9XnI7VMgyrefNA+dW
         zU0dNykfuDIrtfHG4OkrP25ceLLEEyhidi8IZcvvgZohw4+FzE6oZIuQzEFEaEy+VmHJ
         vEWwa1XTlsnP0X7BLB8kGar2J1R1ky7T3UZCUwTtSUtpYS49BKR/01CDFHEv4ebYga90
         iWCOPHgUkEKN6wTdlUyO7R55/c9nrfAAsi7kIqMmLhDAlZkTsk7nfL7NSmCgFvToSZrz
         czVSHd9LhQUnaXSXKJDbyv6jpq4McvPu9jW3B1s/L62WszXYVH2lzpPNYpvpYowCO409
         eamQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788197744; x=1788802544;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NrLEV+P2I7sA236ztoqXL6dgwfLc2PQ26Z83hstTuik=;
        b=l8hegpay3T5JVB/3MF7lkdtpyq/6dtia6IdaHavJh71CNkgiXnbmu8X0hOcgK4Q5I5
         xs7VovGm5VW6hxwgVWh6UAUTq5JyigDui1UZS2bX8+oi3BwoSLe1wvxWwViYPVBF1QAN
         lBI0Xa5qiDEeCNpPA5/ihvFnbbj2cpojJdwzvCdn+F28GtWvniYk+BCr5r12A04MxiDn
         fsqgvXBtuP9YKktq8SBFEWTZQz35aW/HuE/oPZ8FKP1OynTiABtZcqlXH3MNjEVzcDO1
         MsEXLXfMa80vWHx6zOO16PBzwBQx/C++kevYw2+6GQqXiP1cqJ+dq3tHhH+BcWdrlfnN
         qIvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzto/3xIJptbyqAsJdmb+9FY4N7VROMf+7/rBQNjzUSyqGFc4xcxC3OQaBCP5kuUqaHBCBgjW5cAwgGCVI=@vger.kernel.org
X-Gm-Message-State: AFuF++kekoAzu5NDCQR/ql5F8Ac79YJnvmCvF0ApX4DhJvigN90zWKr9
	u8hLk1FyyN7ZyrJcVkCXL4BasjCvz5FjnusAKFA7N57GQQ2z59DtDZdhDZPmZmvsWUR6HVRciSG
	6PaHg5Lzy/cNqtdp8/eIpBWYngiW3vxM=
X-Gm-Gg: AYBFou1gCt3HTK3nVTYU9T+igm4ElZV66S9jD8+oD6c4YsJab+xEBS6rZtw7oPeDQsM
	dnCZsto3bNPYY+dg0zoOQcgGdUG818iT3ZajtPkMsxkslD5DWfXnu2N2b0151TODgPLD1dx+f2z
	RWVP6zVeryq71bBYNMLiZuhFnn0ZRzPUoQt9QJyXxNiffPj42n6d7zYZD/s+z16vIquQMMoEiv4
	ns/iSQD1xfTUVXzEBf2pFhEY6+sbz5OJYNfuPezbL7FMQZIbKXK7e8tQKXVQKQksKJU/To5ouAo
	kUnQerQQ3+nwGEJfJL7zlG0wbaJAFnaufxMBMnELL9iC8lnn6NNFFsW3DoRwU1MYxS0EaqrpDcW
	lylXhwc8Cvor9
X-Received: by 2002:a05:6402:1f49:b0:6a6:cda:1c9f with SMTP id
 4fb4d7f45d1cf-6a60d3a9c9cmr16793695a12.9.1788197743340; Mon, 31 Aug 2026
 10:35:43 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:35:42 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:35:42 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 19:35:42 +0200
X-Gm-Features: AcwNN1Wjkh5ICuspxoVciXOfblGjJOCL4nZYjxXDlIu24xNvA-SUFp-jzGh96OQ
Message-ID: <CAH=xXfE6o2sLwcYdoH9cayZpbf389y8PeJ_aDRty61i7q4QKow@mail.gmail.com>
Subject: [PATCH v6 00/11] f2fs: prepare metadata layouts for runtime block sizes
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

Changes since v5:
- no code changes
- send each diff as a base64-encoded text/x-patch attachment because Gmail's
  outgoing transport reflowed long lines in inline text/plain bodies
- verified that an actual received raw message applies with git am and
  produces the expected tree; the list-side copy of patch 01/11 will be
  checked before completing the series

v5:
https://lore.kernel.org/linux-f2fs-devel/CAH=xXfH7TPGt-zKXvJRNTgGDZKa1Xoq_sF3-WGs5kdsQLuYn4g@mail.gmail.com/

Changes since v4:
- no code changes
- resend with CRLF-canonicalized RFC822 messages; the delivered inline patch
  was still reflowed by Gmail's outgoing transport

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
