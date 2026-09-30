Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72443537F8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 03:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790738168; cv=none; b=Zn6L4H1XtF4iVkgvKd755DcEZzXBzepMejWCa7Ag6lRBddW5iKYytxcLWDf/WShiYo4gCG7ivmkrXk8f5v1JTaX3r5Ok8pe+tdDyy5oEKtpNl6qjLrhfKEiWj7gKSn2Ps/+iFKMNsH4P/er7sq36cHR2MldKFkwp4G20x348/tM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790738168; c=relaxed/simple;
	bh=3/qhAeYGHEUQqsjsUGUSrWP8BuoOwlBxWj6GYtC6W54=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Olvz28P5S/DYcl3l1Pwp2dRGGr+9TwHW4Ypcljqsyy+mmIpOR+YAcE/VRflb8iFQeScHTQ6s4UNLyq9LuSySG2orvadjbwZgNhrpso58C1eSjFoTr2lEmQyA3i+aWe8qQGd2KbL+yWmaCMdP+ZwBQLTb81AAd3Em0RrXP8BQC7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0i4I3CO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0i4I3CO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb65437so2864988a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 20:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790738167; x=1791342967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHMd/eoEVRL0G22GCKAq4L3I8Lox1g3RZutdH67x6BY=;
        b=U0i4I3COqKdwCyqKUSQy6JsHyBi65+Fe4PVu84hakcwhMjwBGRopjXkmQj8aMpYkAT
         B0zZjk09HIo5JUIn1KL0x2mI9S27nS954MHk8Vx2HGul8H0WIH8ObBgu5h9ya5XMmr+z
         eqizir5uF86wcurwEbwkEj+np6Jr6PKzhootNKZAHsov7tFUnkeOAJY4uTIOS1BxcQHl
         9Lr4r6heTXDs+o13D5uJeN/54kH9sFolbP6KZ1QacCA0M8yeHczEL7FE1c+PNHaJI2mW
         kzPOGARp5G+GSJpbLMRXBPhCIyf4lFkE0UB85ifiOkhrkF//MN8dsDPTWjDdSi7yJr27
         LDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790738167; x=1791342967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oHMd/eoEVRL0G22GCKAq4L3I8Lox1g3RZutdH67x6BY=;
        b=daa3f+ZQcfTmE9DNq0r02U8Ib6j6ybASMFHp4iy32QMd/6bENnqmdaIhmEYQUlw3ft
         pVkKniH7QVIR0sacD+TQQn0RAgeBC+8VhYLGthWhkrME97uea6snqVCcreni/QVNhxbc
         J/FyRYfHaHDQykqMpgEA7/B87JR81ZKIittqGkpsJpmfZmq4dJTjX+SFPxjTQlTOc74z
         deWaOfXfE8Lb4Q57yjt3P+cL7wN9SZkrzpU1bgVahw4dNlXJNRx9S324oeBgmhjjIAfQ
         wBZL+ROL1VxLvK1pugX1DHez5ixNzUNflC0HdYDYwsgAqGIMDs9QySGmEymNtp00nBa4
         HWVw==
X-Forwarded-Encrypted: i=1; AKwUvBw4YvHyepwECEZX+/2jjMfiNOIGX/NHKQo3k1qF6l1X1dx8AqCSf1Pg6J2sqvIoZWO2zDre+XDqtvvpQFU=@vger.kernel.org
X-Gm-Message-State: AFq9FYI4II2jufNxT+Yxf3oU/PKgCWCZVufbyCFXyHVr+Gws2KEtBz9u
	3k0JZvQ1pz9ZHWyXtXs5RjQXzNQ/tB0inAvCqPskQe9wExMa3vbamPQR
X-Gm-Gg: AYBFou3wDZ/NV1HE1qhlBx2Myree1aOfv1PXqgrH/m+LNg9wBfoV6F6aDlLCau8vQw4
	IUyT6iw0uT/r5vvCsWq5YtiBfAhkQVfjdKRdVKAzVX0i0UjCMZxr+LO5h9ap7U5mfx69Jh/HREY
	axVawdGOE58HvO8GhkSRWX8hGAnxAO2ltZF987BN4iB2kkkziQ7j6be8QrlWQXAlQ3Y5Fs1xSOx
	dzBK9m5Xinx3D0p2IW83pmubYmccpwDWA7avOmhKdTndQftcETWEVjDi8lw91KuFY1uNP6foEwR
	I9SOwXzyNFIzfrNPnhN/mYpLxGZIIuaxndMrZRyncl/W3XgNCS6yYBSbXk6WaDjFNnitIMhimcS
	87GgpYvIzrFj8fBz70pNbMBWx8xyTpIxs7xv/ISV1YU0llxGks2WOhXk8njaIB9TtnRMFu9TdSh
	9djtLtOGeKtiobU4hzrIBP9xHBN9Ww14eBDHq/Yr4w6JZjOFW+v10/IHuGZbOkC9hoHGSV5woPG
	niSgREgw6Zrtq43nYelhUexZr/fYMcrfXiXtcD6qN6WkVu8FZkH1cUF7L2QM3ZokNkPY8DoWRD9
	lhbH6SF7G/ZZgU97BFFx
X-Received: by 2002:a17:90b:3ec9:b0:3a4:963a:b477 with SMTP id 98e67ed59e1d1-3a4d1b07f0cmr70286a91.35.1790738166803;
        Tue, 29 Sep 2026 20:16:06 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (25.187.82.34.bc.googleusercontent.com. [34.82.187.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4ce1c9045sm588743a91.12.2026.09.29.20.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 20:16:06 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: Anders Larsen <al@alarsen.net>
Cc: Matthias Goergens <matthias.goergens@gmail.com>,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Hui Peng <benquike@gmail.com>
Subject: [PATCH v4 0/6] fs/qnx6: fix buffer head leaks, double free, and inode validation
Date: Wed, 30 Sep 2026 03:15:58 +0000
Message-ID: <20260930031604.70544-1-benquike@gmail.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
In-Reply-To: <20260924073920.2782917-1-benquike@gmail.com>
References: <20260924073920.2782917-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series fixes buffer head leaks, double free issues, and inode/
superblock validation defects in fs/qnx6/:

1. Validate di_filelevels against QNX6_PTR_MAX_LEVELS (5) in qnx6_iget()
   before accessing level pointers.
2. Release buffer_head on error path in qnx6_block_map().
3. Avoid double brelse() and fix sbi->sb_buf leak on error path in
   qnx6_fill_super().
4. Clear bh pointers when selecting active superblock in
   qnx6_mmi_fill_super().
5. Abort mount on superblock magic mismatch when silent is set in
   qnx6_mmi_fill_super().
6. Validate sb_blocksize before dividing in qnx6_mmi_fill_super().

Changes in v4:
- Rebased cleanly and tested for applicability against tip of upstream
  mainline commit 62f4c998b297 ("Merge tag 'parisc-for-7.3-rc5' of
  git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux").
- Updated 1/6 commit description to state QNX6_PTR_MAX_LEVELS is 5
  (defined in include/linux/qnx6_fs.h), correcting the previous
  description text as pointed out by Matthias Goergens.
- Temporarily dropped Tested-by / Reviewed-by tags from Matthias Goergens
  per his request until he re-tests v4 on mainline.

Changes in v3:
- Added Tested-by and Reviewed-by tags from Matthias Goergens across all
  6 patches.
- Updated Fixes tag in patch 1/6 to commit 5d026c724220 ("fs: initial
  qnx6fs addition").

Hui Peng (6):
  qnx6: validate di_filelevels in qnx6_iget() before accessing level...
  qnx6: release bh on error path in qnx6_block_map()
  qnx6: avoid double brelse() and fix sb_buf leak on error path in...
  qnx6: release bh2/bh1 on active superblock selection in...
  qnx6: abort mount on superblock magic mismatch when silent is set...
  qnx6: validate sb_blocksize before dividing in qnx6_mmi_fill_super()

 fs/qnx6/inode.c     | 17 ++++++++++++++---
 fs/qnx6/super_mmi.c |  9 ++++++---
 2 files changed, 20 insertions(+), 6 deletions(-)

