Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C871C28E
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025746; cv=pass; b=F9BLV/s/F7xupvZvhlNaF4Pdfeha9RotMsPLSp/bHVKx3FQnCMnDqAO8MUdYscxBy4Z/88mgdFRYS83SvOwKmrL2cvWeGOmUeRrhK5St2A7qdj+CS/ytDyCjq4ZFPjQDTuk7ku+L8ftoNbuJFmEoV2NyL3BcH0MOCgVNSpmTdyc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025746; c=relaxed/simple;
	bh=Krb6QAdupWIGLMtadsgvbt8fmWKvL/C4HuCgBh8ZXmg=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=CUbMsCGGSJ0sM5qps8s77l+Oyt/D5seOOIGk/eIWycw04z9v2vKVb6D3qJVu52i4gW54C/3LbQriwEy955GFH4o0EXJ+UA20rYajXB9Nj/FziYB9JcbNqHHdvYrJGSTtwgpq9yzW42xgwZRjcse0WXhH/F0Fi4x/b/6E7sKtJZM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kZ3pb4Aj; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZ3pb4Aj"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a0de062db5so3513041a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025743; cv=none;
        d=google.com; s=arc-20260327;
        b=Vhdt010z/tiwqvOYwDLI1smNOqyYy6z8J1EqZkVpkMv6mJb4JRPZ+0r8miThxI3GQh
         y73EVZIRaXv92iaixyUeW/VMU33AKFMl5SZx6y6G67WUuiVQbCqbkgQpnEOiHIoSeteQ
         3/qIdcYph5SV6QJxZ0p/rmIrytWPs3BgGo+X5d1CHfw8bRVvvqMggcTUFtvpNCGxuBg/
         hRx3JNDgt9X29O+db+AFtf2qnu62h7au+HXto6jDyA7xUZ664KcXjnpycAzTE/dTzbEM
         wrNLZJT+K8Fx2WZQ5a38CLBmTcrqcFO9rzcMm3uJLlV9oKF2bssXXold9/ewvA7Cv4sQ
         wyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=zjeV7NCdLgAGDWJtitErfI8jcGCQ5aP6bLcxQ2n9l7s=;
        fh=bjOr2TM3O9PLpY2vY0lOQVSFfYQL64VCXvXC2gXsn80=;
        b=lNRCYCiDIykmi2yM02YT8Fiaobq3eFVd+cPIQ1jUEMZ5kZXOaMyPcePPXcndoyuHqo
         2gSl0ol8lHcdVFLi/dOYCJ0+nBZZ50TZmP+iDoEgWwvAPmjIhEjuhyspwueQ29OID+0d
         jc4YmVQpVrqL64a5im2HBcTPDkxeRFVlU2tOabQSmFdjLi/MuCTMiK4cs3M+maQO/129
         uGbdLrh56Fh2I6m7M9+taR/iMtZpGB4vyBg7swHMIu6+drVPOkuVVRQdJZcaz63Pk3Xn
         0F68PME6nYc+quFSz1DfcDLB3IDxn8SlX69y1z39zRqS7ToOGMwmEaqM1lzL4ATON/TT
         iGEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025743; x=1788630543; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zjeV7NCdLgAGDWJtitErfI8jcGCQ5aP6bLcxQ2n9l7s=;
        b=kZ3pb4AjZtQ3itRzo16O1Ro9u2wYR/YYtmpxyMaLMmACxXtpyFpJ9nMu6BGcj4f1xe
         DqdT8DaDCKMZ60ksEupKUxoW8rYBK57PfEF2bWSbl0IhZHtMRtG8Bu+PsmOPooAyHAjf
         5kE2bVjz+41jfOKDZDbh74o4u7SPWfhxJGiV0MsJpCp6jo2rX4MMACxZglqzjYK8PRJW
         X38PSh2QgEtorKtLdYfpXZks/1F7GUIpmAi3VvZr1IeAGB5NJUfKTuD9y8gttavF0ceI
         T6UF0FpChjX7o1GdkjA4UXKhJQTkPBVZXM5uXctzeOAeFBlAcSxa6SzmT/hjAlNhux7I
         AeeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025743; x=1788630543;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zjeV7NCdLgAGDWJtitErfI8jcGCQ5aP6bLcxQ2n9l7s=;
        b=palkvJtQXtaVsKDVQoGiEsIPKlHYyL54ml2pjZxO1unMf59eo3nk7M1QlhVbuvPuez
         lYWjhjWuixU/2fu9oeuxPjNeDKlWvRaiS/VoWTR3o7DIEFnMBySvx/HT5sVijy51j2Ze
         OqMZfBBzyDRBBypPNZ/fw6L2rSPuJUTkESdlrhe6v2MTKjrsTqLV7WAtzN8Evip72rID
         YV97ZItCV7bgtwAYkp8FTN6+p6QdutiUzuub/yu1odGzGWfjZjepMR6InIXzI6FO9zuo
         H6Azw0YW0CJ6aw++JK8aBWeTYsFC096T3VKvAEt4LiDCFWkHTb8x0/90/Zzs1si4mmHk
         d2tA==
X-Forwarded-Encrypted: i=1; AKwUvBwFpQazwtD/gS6ufZC+9dqTEwJGcQ6Na1MbgMIYzOvbXX+KohqpCnkLSDKGVLZA6GXr42rGKOU5wsGte3k=@vger.kernel.org
X-Gm-Message-State: AFuF++laHbegEswF0V5fA4KftJbrOkrHqZix+3p5inaE0XZx/zcMKkFm
	6IgLq5f9lUPSeSFzJHaYg8Go9FeJnEJ+dZU+YGltXsJDANIc9kmTEaayO1Znk2ZG+FB6h9rQuUg
	07W7b/YYLZUGCUjR92WDIhAVFnrUo7EA=
X-Gm-Gg: AYBFou2KeF2EE6VKhevGlWKe3SAu++bKHWp3Kt80uefy+TCq1wmqSAD4iuT/bvhzg8n
	dwutNFBurRuX5bTwKowHWrcKg93u1jdP2bDtRSpvhFpB5A7Q1qfxmisPZDeQPnqeSh3swS2El+t
	Ql5GJ4Ni+E7XUcq14Y3bh4HOY5SMwGn15gmKKZftyifbldj9klT0fc8WvL9dyFX+JDYFwFP7hj7
	sOws7wAadoN74HFkcyS2Yd9/BwW1Rh1L9l9EL0XV5btAypkkNz3mSmD21TSqPXkdtyhaerMFLaw
	975GYz6ocRTiLNV/T+NaONU4xyTbR2Dr1sOxrRRe4xIWDnsQjjZIBqgBJa6fKYSkpXLttoPz0jK
	8bY7DCmOILksR
X-Received: by 2002:a05:6402:c2d4:b0:6a6:d40:6d16 with SMTP id
 4fb4d7f45d1cf-6a60d406e0amr8037773a12.6.1788025742752; Sat, 29 Aug 2026
 10:49:02 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:01 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:01 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Sat, 29 Aug 2026 10:49:01 -0700
X-Gm-Features: AcwNN1UxYcFtMsRCZ2QxoFaPr_61cYZppUzVUR8sFKE168lb2ME5_XzR8EnEYfY
Message-ID: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Subject: [PATCH v2 00/11] f2fs: prepare metadata layouts for runtime block sizes
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

Changes since v1:
- rebase onto f2fs/dev at c966d29e01bb
- drop the unrelated free-NID underflow fix from this series
- split the preparatory changes into 11 focused patches
- initialize sb_info earlier and describe the xattr layout explicitly
- separate sector, byte/block, and block-size macro parameterization
- update commit messages and address checkpatch warnings

v1: https://lore.kernel.org/linux-f2fs-devel/CAH=xXfFVAwQ3r_NdUDtmXhtg6Lw8kDWoNTzGL5oy4mwHMsJLJw@mail.gmail.com/

Tested with:
- x86_64 F2FS build at every patch
- arm64 16KB-page F2FS build at the series tip
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
