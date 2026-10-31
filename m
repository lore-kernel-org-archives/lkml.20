Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793440639;
	b=liYzM6gbrVbibqoI1GiK+ThjS7FDwrNkdjp7OdZbJ/qTxnk/zgrGr53UJgqmkL3AntF5
	 LeOdgYE9Fb8a55Cv6MIZGCx1yVc2sppTlxmzvbomJ7YoNuWWfMf9PZsZ+Htbw1jbfd4h1
	 +S9XYw4p9VC7T1yvpBcXqNZO+i/Z8NAjDiikPfsiwfZaCSO2TMn973+QOrHZFwHaBLllp
	 SXpclob/WaNhX60861v5Eah8qsuvfr3R0W+mWDes1vDBlWzMFpFgWTxraPwoRMM7HIi3C
	 ucoyMQbKNNtGK5ir59hVmDIxmYoO4B5ynsDRtVEmsJWCMHcLPPX4ZxyzRjC70ckNZ4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793440639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OsyNUXVXYVasBHvigfoIW6Ne0ad3jx5r3liNsbVXCQA=;
	b=iqBFArpNIso3XzIBXl89Tjk0CNdrEGZnwocCUHPbtGGgq4UkAfoIa/uvomAtJjMB600T
	 WsPZbpXTPAlBbswWg1w+l+VadQ72cSr2mF/RHhWCoyzCMYyARNi35TutUBFH3gmtrhg7Z
	 ZAXeQvYkhgtvPKRuoiGxNMvVMpSRpegkhxt89xKuNZU8eC9pm7UDlwIu6qFBknroxIWN/
	 iJhtityd42Vy+LUKGsYQWPIrwliz414Y81SJbbF7duOD3/JwSW4EEGLHylDXb+TqrO5wn
	 QJq5JOsahFZaEvVyNZrMJoEs7OZeI5wFffCgHCpD/oDWK0R+/j4bsylSYOJcaGd7q9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnTL5T+D;
	arc=none smtp.remote-ip=209.85.208.42
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A0B606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 09:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73A0B606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XnTL5T+D
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6b1aa27963eso4473192a12.1
        for <linux-kernel@vger.kernel.org>; Sat, 31 Oct 2026 02:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793440638; x=1794045438; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OsyNUXVXYVasBHvigfoIW6Ne0ad3jx5r3liNsbVXCQA=;
        b=XnTL5T+DL2phlNXmbqkLLhvirOg7giMe+mzsT6jZ3P8q/gtVkvtsUMetvI3WeBSUvk
         llwG/hhPLVMRmIyp8d5tgkbOZoBBQIuLCegr9vGom7SruDl1DB179AUZ/Yhhfxjzf7c7
         CxwW9/z1nouoKL6XVjZYisWJa+bfFOXecphWR9/tI5EnH739xdz7+xgWS5H71GI5KCAd
         nIdiHLJGUT8eLmrYRG9E2+VcvEy9Ru36X6uVFpmK7yOe6qdRHTjuMFHgVpM+Dy6CQgMv
         SyHcR9mvXrE9s3dzRZVY4TJ9SDpnQTzTYsZRKuGZqj4rI1QiINkvSJasKRJ0GPmbEcEb
         sXsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793440638; x=1794045438;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OsyNUXVXYVasBHvigfoIW6Ne0ad3jx5r3liNsbVXCQA=;
        b=s+K9VgbnDAuVQKMq/yknl56mh72K9jxVf/WbTDjVBT9aZi2p7Z2UYrWfAD3PrzgpN+
         dP+Y6NITcxgvil+OtY/1jlnjJePWWfgIKmQkHaiCFcl5BgcdRRt9iLyRhyLfEX+G84ug
         TH4SXd49G9mBIVJUIpt5hcadASsIm50xwsNFwQyFWWESqSdD/JvY9PdDRvHKgpS+7u2n
         kqAlJiX61xEvCEVyErIyTANoT3FeLEeLW5ESu5eA7P6bI2ud2Vb3lcyg1jX+BMjcITD3
         FkPFF2AZaaPydjPjjzBRArEKsV/LjSa6TaQNhjIDUO0Z3wOOdh9xYnna3HInpCYFVHXk
         6XTg==
X-Forwarded-Encrypted: i=1; AKwUvByYobmNInRa82bkgdGzflwq89b6r9jGNbxFo2+mSWdsy7zDDtRcacIG3rGFC57tGL1v3bueOiy9NAZ4XqY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIFo2/GMYbnZEnONbUeBcHYACmQzX9i0ryCvj50+o7ZjryFOHjA
	d565Hy2zsDMupWv77cK+/bjI1l29Ku55EEIzW8BADDiU9EE/JcT7oK+Y
X-Gm-Gg: AYBFou2tr1tAD3c+8A9HbWWtP/j84ge3Id8BC/mM2Jb1/JgEfIbr8qGs/+Xx0Uv2mna
	RkB2nJa3nV6yEDyZk90Czsdqq8UBNio+3idLlgM6E4FSjKfLIeOwigq8VTmXEFYzN09217E+6aF
	y+KheZv95tWxQ8KwR3VYqyTG4C5cGpMyLuPRMZMnjuKWl1AtDBUzGY8VOChNLynqyPg8x/JBjHr
	QVU7sucYMMDITG0dZMiwbPAmxo1wF7k4L9Cz4954IYcF3PcY0CzK78umTDys0Ph/IzEAxTsVhH1
	m6DpJOTReuTZmgK++68KcR28t+UyE56Nz9iuS5Q/JCtZlu0CxfgkKAvN+Q3YUPzW89RDfsyiJW3
	LOtsxum7KpOEL76Yn1wkjNYku0htb+dFRu9/lrDe2p48a/+uk33/eRm+451m1wPHDOmoouv8OZa
	TyiJYeDBQ3m2KKd7FxMq2Aj2msOXaXCX7Om9YkbdmVk4VYR8QbVOZAlSi03FnmnL3H0PnJhmLLT
	8SJi31Nv9GBmqHnkDaSdlglmuQutylaj28GXPLqqZ65Ib8B2HkYO/tQciXVrbluOWHLyHy1r+7T
	rbvEKkIVNEg8CPWqtxr9HvjAHIqK3x/FDrGwnSDugH88fUGLKP4pMLw096+51Movnpoqq2HY7be
	/kJjQ9z0xIOi5aSpspllpnCeRN/t5nHfrRg==
X-Received: by 2002:a17:907:940f:b0:c2e:1b6b:8b19 with SMTP id a640c23a62f3a-c49d142cb22mr731014066b.23.1793440637746;
        Sat, 31 Oct 2026 02:57:17 -0700 (PDT)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe1002asm162304466b.45.2026.10.31.02.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 02:57:17 -0700 (PDT)
From: Amir Goldstein <amir73il@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Miklos Szeredi <miklos@szeredi.hu>,
	Christian Brauner <brauner@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-unionfs@vger.kernel.org
Subject: [GIT PULL] overlayfs fixes for 7.3
Date: Sat, 31 Oct 2026 10:57:16 +0100
Message-ID: <20261031095716.3030288-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Hi Linus,

Please pull overlayfs fixes for 7.3.

- Was in linux-next overnight

- Gone through the usual overlayfs test routines

- Includes one change in vfs code, factor out helper
  try_take_dentry_name_snapshot() with RVB from Christian

- Merges cleanly with master branch of the moment

Note that commit 8457ca071faba ("selftests/ovl: fix detached layer
mountinfo expectations") was already merged via Christain's vfs.fixes
PR from earlier today is duplicate and also on my branch.

Standard maintainers race and miscommunication. No merge conflict.
Let me know if you want me to drop this patch from my branch.

Thanks,
Amir.

----------------------------------------------------------------
The following changes since commit 214897acc8c2e5d6b63189d23ccaed6fa2af45a9:

  Revert "namei: don't reveal overmounted entries in refwalk" (2026-10-16 10:50:57 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/overlayfs/vfs.git ovl-fixes-7.3

for you to fetch changes up to 1d27da7de3f74405b1de85ad26c5ea90f826114b:

  ovl: check the casefold flag of directories only (2026-10-29 13:40:31 +0100)

----------------------------------------------------------------
overlayfs fixes for 7.3

- Fixes for bugs found by Chris Mason's AI review, several of them
  reachable by unprivileged users: an info leak, use-after-free and NULL
  deref bugs, an RCU walk stall with remote layers and data loss with
  nfs_export

- Fix copy up of files with an empty security.capability xattr, which
  any user could set to block copy up

- Fix a regression from v6.16 with the override_creds mount option

- Two casefold fixes

----------------------------------------------------------------
Amir Goldstein (6):
      ovl: fortify ovl_copy_xattr() against underlying layer modifications
      ovl: add assertions in dir cache code
      vfs: add try_take_dentry_name_snapshot()
      ovl: skip copy up of empty security.capability
      selftests/ovl: fix detached layer mountinfo expectations
      ovl: fix mount setup failing when override_creds drops CAP_SYS_ADMIN

Chris Mason (13):
      ovl: do not copy up an xattr value that was never read
      ovl: set OVL_WHITEOUTS before publishing the upper dir
      ovl: check that the parents of volatile/dirty are dirs
      ovl: take a snapshot of the name for copy up
      ovl: do not take a name snapshot in RCU walk
      ovl: use the pinned upper dir in ovl_fix_origin()
      ovl: hold a reference on the parent in readdir
      ovl: do not copy up a dentry that was removed
      ovl: fix a torn path in ovl_get_redirect()
      ovl: read the nlink xattr of every indexed non-dir
      ovl: always encode the origin fh when index is enabled
      ovl: set the revalidate flags after d_instantiate()
      ovl: check the casefold flag of directories only

Hungyu Lin (1):
      ovl: reserve space for the casefolded name terminator

 fs/dcache.c                                        |  29 +++++-
 fs/overlayfs/copy_up.c                             | 110 +++++++++++++--------
 fs/overlayfs/dir.c                                 |  22 ++++-
 fs/overlayfs/inode.c                               |  16 ++-
 fs/overlayfs/namei.c                               |  11 ++-
 fs/overlayfs/overlayfs.h                           |   8 +-
 fs/overlayfs/readdir.c                             |  65 +++++++++---
 fs/overlayfs/super.c                               |  39 ++++++--
 include/linux/dcache.h                             |   1 +
 .../filesystems/overlayfs/set_layers_via_fds.c     |  18 ++--
 10 files changed, 233 insertions(+), 86 deletions(-)
