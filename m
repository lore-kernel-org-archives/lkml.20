Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F682D5C7A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 05:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788154345; cv=pass; b=OSC7Mg+7BX8RFWzpynHT+qUIdc+DZ0beoAdmFJLrhkINoPh0VnITT2vZT1RNkOPO3TwS7u3NR/j0DcKeYipDMvhiH3eUNBySEf/hydgn87REuMKI+keDxZ/6FxhoGDHH1KUf0VQFK+1m/U+7/Mhplriz6Oaz5dNEynKJWMEI1O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788154345; c=relaxed/simple;
	bh=egKKb3/wnvFAvuLUfGhrQRBcMf/UtxQWJxOGLPSxP7Y=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=DYwwxfxMuC0LvMiId/B9xPFc+wwmW5UKCIXZ9rrkCb20ekMo01/4OUBjbcgOTk/RdrTArqELanBg2oVU1emdu6cmV2je9ib8yFkQcuPQhJvIJSbDOZoF5PG6dxbm26HKIrqWqhH2ABCOsVvjJSpAtfUH4MA2eb5IAgVpR0Gkt0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DGKNe/Nq; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DGKNe/Nq"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5e392b2b3so4778020a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 22:32:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788154342; cv=none;
        d=google.com; s=arc-20260327;
        b=isgHu9s7s+VwW1MrVgaMFIRpHwmDNx/obySny0inWJzpxGWVs1O2dath0vZd7plwGk
         ZXjSW648EmLcdfDUrbneBtCidrdxYsBDmO4YcZkvTuabIjdXaDowG3c8QnDBZiEn17n+
         FXgYXRdv6xPTpQjDT9nWvIdzJnwle8YWJocWZcRcQc3C1rCHoaXBXrtplzfXZZAUn2zv
         Z1w70tdYpb4mEFEsDMRHfEvxEEXTC019qGsJuKWfSQS+QCOmFpCMj2YSSSphioSXR/xT
         rxjQyOvKgrJTVw0tgmrF1tkm7jZ2v9CSKt2NqxUik5I9i2QSjBoR+jGMLDcvsJGuVJK5
         j2/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=mpPB7JHgUkLmwS0RUDvJF+z08BOphkdkr41jJfgnTag=;
        fh=v6DyCi9REZ7+0GoH+nEzVW2o5KKvijGrb1euFeL4Ezk=;
        b=FVnnGyNEEFDxBN4H+3rrCjMM5RVDHpoblBuskuGKqItXG4zImof2T+oT8Fu3bJZVTp
         JGAKpqA4q3JNDreiqI2mCw/4zp3/xkO3tSai//IQ+wPzJEpRu746oRcLKJPGVYgBZc5I
         v4Ytb2mmGWyP8KxAxkM4braP8ODMSUUQr7C+O4dWwtkK03lakYVdQczwuWK5rArdr7V+
         mjpzOblLtmbDYvi590JBKdvWuXGRSsfRqXcWT6Shf6rz64ZNVmceJEwt8Ky1FBdIZNVs
         32x5+cvaQGpAu78KMBI7WMhjvcA896C+2zr/6qv584NrFpCxqq+BHUXKdqwRXKh7EY1Y
         +L8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788154342; x=1788759142; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mpPB7JHgUkLmwS0RUDvJF+z08BOphkdkr41jJfgnTag=;
        b=DGKNe/NqGYEJeA+Q7cA6Dkf9KZxlUPg/IuVCxUSGQAMiryMyJqlLB6fiBPwHCFbDwr
         rNidgVMYV16QgpiybW0wcQbgvQWypGV8OG/zQfFgH4GrJLvsKG+lGipc12OwrC5sTHE8
         kttTzunoJy7uuebYDecflezPQyQOro91Gxx+mOFyXznxHccMcyw0Pr/Zl/a4jA3f82u/
         uPrNkNS3TWv+cvwJVNQ3gwtc4pcmPJNMDEHJPRTP0H76bw/vJKSim1AFbGXc5FiMq8XF
         bMnof30oLaae6w53qptm4XoWcmwMbLepBJMfTqD6nk2cAAq+8a6ycRkgM8U6hiFGtMg4
         kj3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788154342; x=1788759142;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mpPB7JHgUkLmwS0RUDvJF+z08BOphkdkr41jJfgnTag=;
        b=omMy5jcplbGQqv3k/3XR9urPiCTYaGQu3+rGA1iUT56MxMZrsbqadJUtLT8YaTODVT
         cXV1GZ8ObXcojLFgM8jmVgLrNGQ5JNrmnTF8C8Lf5CcFfsYYQSw75W6nD0QzKlKP57me
         nouC9s0YMyxVFAHALbEpE3t21+e2mqXmhCO+8VxfVCSZWxVpXXlJsjWVuy18T2G/AK4C
         jFy0kA81zXVUkA7Ra7jcKODs5v0G6RpWMyh5d3crqbKMaqB72hGtd4yMdVKmrjgucEFb
         zep3a9kyT2iFNX/jjhWLHghFxgVL0vOKtV5tYbv1h0C9w6OI0hC304YDQ85Cf/1TmZm/
         66EA==
X-Forwarded-Encrypted: i=1; AKwUvBzPNUSmMPufFxLPzSHB6dRlTMTm1DR93dlCeaAyIxjdcZnD2yMnLaldwkqszo1kBt7YIYnptiWVxK4cF2U=@vger.kernel.org
X-Gm-Message-State: AFuF++knNAjDLpDx6GVeaVmBbIXtv2o2c1lKBhA5Y3ZAXZrgE32YwSQ9
	or4bGbHz7j4D1enCzad28VbnMEi1RjfZUBDUMutMyfLj/RC9R1swKVQT+FJC8TpI5oCzl3XpWpJ
	F93BDBmjNwhqs7dAjQzNvt67yS+/9saQ=
X-Gm-Gg: AYBFou2upBVWbe8X0VW68BsK/1KNtV0cuyVy0zNLeuU5k3kRgs+NVK7q3RqaFK6mpw6
	+MIu17CirVXQZEaSt0FS+YtXEqthCGZjWG8SoDU3SmajmQHtnvS1Zrj5bt33j6iX4S4OhImvNS4
	6hQ0r9/R3BKctLQdBBih6LEcXMfCpnE2GikPIMjDU63IlbGda8KPJeh8ct0vfQ4CP8M5VP2q4VS
	6E1rBaIulKkZVHiIQ3WCJTvyAE+T5jB8SrA9fy12bdHVk9aDXOxI6BOPnykW0jAzIvbwda1Zg6e
	Yi1/mbXYD8YEMlZK9zyS276dAO8u6opEKX0xeJuAzrCSg+PAPcu6C9pgrzi+xtuul6vCV04UY13
	zlw==
X-Received: by 2002:a05:6402:43c6:b0:6a5:f4ed:50e8 with SMTP id
 4fb4d7f45d1cf-6a60d36ffdamr13496589a12.10.1788154341962; Sun, 30 Aug 2026
 22:32:21 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:32:20 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 07:32:20 +0200
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 07:32:20 +0200
X-Gm-Features: AcwNN1XUkvSukCcHJeY8_X3lDDomY3JH8BsRBHVzXeo5dnl6Lq8igF5_R-4UeAc
Message-ID: <CAH=xXfEFL7w7nsU3xjNubKJ1soYMqT-DbJBuyzfEX4Rv3rdFEA@mail.gmail.com>
Subject: [PATCH v3 00/11] f2fs: prepare metadata layouts for runtime block sizes
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

F2FS currently describes several on-disk metadata layouts and filesystem
geometry values with constants derived from PAGE_SIZE or a fixed 4KB block
size.  This series derives those values from the mounted filesystem's block
size instead, as preparation for supporting filesystem blocks smaller than
PAGE_SIZE.

The patches initialize sb_info early, describe the SIT, NAT, orphan, dentry,
node, and xattr layouts dynamically, parameterize sector/byte/block
conversion helpers, and derive node-tree geometry at runtime.

This series does not relax the block-size mount check or enable subpage I/O.
It is intended to be a behavior-preserving refactoring for currently
supported 4KB-block filesystems.

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

v2: https://lore.kernel.org/linux-f2fs-devel/CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com/
v1: https://lore.kernel.org/linux-f2fs-devel/CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com/

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
