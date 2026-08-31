Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4B13A5E89
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 17:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788195637; cv=pass; b=YntG5sQjqdliM9Zj1s0BXRyUijWGuyfi+Qhukj7urkPtWxo0jZMPY+U7cgSr6E5FL/v7V7pPRrRd5qKko5aDBqVs1/wa8Mzm7EP6dku4Tvwws8uHwgRCadGy9sy7jM1vObr1ZuOhfcXmPQ0XGg5XwH4uBNnvb67WiPkagq3NeHE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788195637; c=relaxed/simple;
	bh=02scVgstZ0gxSNYqabIYvrClpyZRJSr0IYq84OzBy9U=;
	h=From:MIME-Version:Date:Message-ID:Subject:To:Cc:Content-Type; b=awNTKfOARaSSWW1Iq1ZKWurvgAknvEIDWnmeOzCS9CEbLiB/jSdqq3uDo9rx7zp5kcJT2PhJtnciNLSYQP/fUStVSymKB7kq6wEk3yB6/pdKrQ+YWIpPRe4VpBs8t6SJ2kyxBFNNI2bhBFkrUeNs6VWCc9EJjQ1abhDGhaxP/Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ0azLA5; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ0azLA5"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6a374bea882so5938581a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 10:00:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788195634; cv=none;
        d=google.com; s=arc-20260327;
        b=iskDU/BhBiKThr9YGPwRGQ6nY/aqdnZWPdyfQ9PMC3TY2qIhgyRqdTDtVTK7qemmdE
         +XJs3J9udkO832v4Tpb4mJMspDQDqDsZ49eiWBTQlDy8SbRbehC9779wIYkdZQY9rg8j
         cAy+Clvnn6mccWMNprnoEPlHPvogXt7UfaYaGNs+vh9SyfWOIy3Qe41SrbgzGGudOH4B
         vY0K0eRqe+FGF4WZCIM8FAZ4zafrgwobZMiwgymrSdg1XGSukQxui9lj2z0ZS6+jTdvz
         hxKwHJH8ZszgReE5sMXcatiS/XzNSKtUCMK8JErcOq6v5q1uCsSW5D+pb1nDr61CF/Mw
         Sgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:mime-version:from:dkim-signature;
        bh=E8GNPZNfb7DfVRA5Y4zrLXAJh8rcaabLYwavFKkKh3M=;
        fh=Vj1t9qusgEFVIcS3nbQ4V/02x8zAdNceubViO/iMYLQ=;
        b=oVQ2SpN4RiWjJJcaSdeoM9BUo9KRdBbM/lsYydEOwOVQRCvD8kuonBjL2H75WJ3c2H
         VaTHePHCq95tAu1U/Bd87xB4kA8t/R32beW+bezuFy4RDMyNyorzClhnvkKW0H0REy3J
         ilj5oLwiHa2SgzKFYNv6pBcWuSA385l9imuHPGy7dg7KNO7JZg3HhfcaOoLCyVsZLNOD
         NuEY1MeAXqe0g6WdRjcvcOdbXjPbNtg8X7STmekeMYgr17H1oxzmGWC6BzE7GVBrIERh
         m+R7cRIsos51/rZLbUlytkj8VA/rsxluTIxm+UbD+UIL9C+Cxzyu8oPhQgrkkawicca1
         0kAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788195634; x=1788800434; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:mime-version:from:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E8GNPZNfb7DfVRA5Y4zrLXAJh8rcaabLYwavFKkKh3M=;
        b=eJ0azLA5gLcRnGCoyECgOco/+r9na090aSUdmKla1XL6Zb160ziWvmWcO2LYpA50uR
         dciPSllJSdWGo5AcwKyYnbu8uNhLLwxwenFPmSVzdmFnRcLDRRrLz9sOyZoGVRaWeDwC
         T1Qb5p3Oyc75gcWCGSD2J5lpXWQ1yAAA5iZC7aTXcC1mnDLMnsa1zxI/Aqy+jggVxcOx
         Mt27RPQ6VSn8WHlpdSaNuzoPr7bLFA7jqmqkTX6cfiqB04QyDNHUc683GwAaATKFcpQX
         UiRkDy+kmBeP88lmG93lBxEchxqAQBTZ8eMYfZ6trlNgns3azJTr8cBg5aZkooeQflVW
         d9XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788195634; x=1788800434;
        h=content-type:cc:to:subject:message-id:date:mime-version:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=E8GNPZNfb7DfVRA5Y4zrLXAJh8rcaabLYwavFKkKh3M=;
        b=V1tKwe/k5Kjbvrt2PQe11GgNuOjeaATutr1mHjN5rcFCiEpIyS3YbGcPfhW2m51hHI
         zP4jQnpUYFh3UW+GXQamUiQZCl3OaAK7ypsQIescxoq93o0e8QHoGYdMLBbmHL/8Pzw+
         6gSWIcNsK61EAifBjDzMSsy0BUjlRde3xCfbfy75+xhgyLuB7vPb8pjGX69fOxMeDi6G
         JmYiORqu9IKDtLW4p6cXosTQYNrIepLCFn2E6pdQdEDMEeSI0pa3vQCrOwk1P8bIu9sm
         /9Q+jEr5u8zxQ8LQQk3aGD7Wbv13lIKFleU3LK89ZdIiN0VgcPeG/RWLTv1kiBP4v3pj
         Fc4Q==
X-Forwarded-Encrypted: i=1; AKwUvByOzhnTr7JdsDoOXLeiAvfc204LdwdL+FhR5lY8WU0P4XGIWjEZTwjOKqNyGQDxXJucYInzAx7LlQfNDP8=@vger.kernel.org
X-Gm-Message-State: AFuF++mlDlHJQYubasVILrld+ady9PmbtrDk1yY3z1Ql6G4k4yYSKjhr
	OYQHQwyDQuvFNByYCzTRaAEF365aNWu03ysOa4ssb3TkuRi7aPAuwhrHUPfe5m4d4awJEIzhB/8
	uce1jZRuFxgnro1vaJ3fC3RfcFY6q7xopZoZt800=
X-Gm-Gg: AYBFou23qfjxqnrzvFk44nR0hxI4jA0Mq+gi0j+QzxbWqaZG07ei/Joluu64G50NECW
	iyamNPESg+cioFOGGYi9hOQr61Wft+47xj3jurkTXN2rvYAoqWpbBSp5v9f6Jq0MWX9T4oRzu/S
	fAIYoFcvXwsnKvdUYjeLpsbCxzTuXBKlcslPOqFcOzRNZSpbSO9WJ3H2o08S6cgiT+FWrKri6tG
	Nr9TOIt8F2u4URnMr8FZwozx/xrQhXR79MpUqHYgulUAxqI0JW0X/3JF6p8NSMNwWIpUG5yzLiE
	Y/wZNXX+7lWguAm2cfKeU3cjR4X/DxSSJqUGPoNIxFFSjhEXdMPoiDO4v2DSF8/IyEMdBVVB88x
	Yl9E=
X-Received: by 2002:a05:6402:454d:b0:6a1:b0b:ba6 with SMTP id
 4fb4d7f45d1cf-6a663acea3bmr1478385a12.15.1788195633057; Mon, 31 Aug 2026
 10:00:33 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:00:32 +0200
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 31 Aug 2026 19:00:32 +0200
From: Kelvin Zhang <zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 31 Aug 2026 19:00:32 +0200
X-Gm-Features: AcwNN1UFAGEwWCwWZWpiOlmQtnMZ_PTDICLYCNR1LpT8T-x7XvvfaJMNhxScSik
Message-ID: <CAH=xXfHWPg6qRwW+N2ziH1cvG3OD3wJc1z_Tm04MtFCpqYmQFg@mail.gmail.com>
Subject: [PATCH v4 00/11] f2fs: prepare metadata layouts for runtime block sizes
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
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
