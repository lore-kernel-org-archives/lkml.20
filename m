Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A38370D5E
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 07:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788766980; cv=none; b=oV/dVYpNuhp1rzddTmW2corEG0twiC26hOfvGqK2vGUTeqvqhngCNi5CFlNKObgslJfc2txizF9Fry48Lsejd/6gyMq7bePW7g3hbTTwOwuH/uuVyccREWj46henif0ZJ2P0vzdu51i0XCrrS5yYZ1Zc6Ai8V2btC3mSWQTCwcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788766980; c=relaxed/simple;
	bh=f6NPYr2AbxZQRthNVKm2sTOTvqetpaZlb867OTi2aBE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fpfYrcpehWgDpwnuWrmiBnJtDyjyWJXUhMmDJohPWF3GBKN/VBtOkmZQmMIEEaCthJQKpx4HWSwJOi57mtxemwp+pMgKLUpINk9u2inzwNn/zhMOjTrs5Y8/OerMEWspMaQKYkWPrNoqkzkg4KBomMtviUt1t9ji67zMWSJxELk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ar3kfNbL; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ar3kfNbL"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d9004f39d3so40108255ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 00:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788766978; x=1789371778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=z1UBgFBd90nwHRd6YeMX+tFewu5XhDiJ8y8k8qjPtt4=;
        b=ar3kfNbLHh0PcgHBdXuw0bQPxLXlQShkYerB7AG7jOpw83EVQiPT6fCuj+C5rpoF7h
         6LEfKOyBEcXZZAyQQddNTXE/ocqAUNyL+FRK93wHucyhAL7JrEZBW/TEbrXV/DtCDMFR
         Yy9ZnwK5glp41fKPLG2FzSbo2MNV7Kai5w4puHB9YGi2r58IGxNQRKSKZQz5wLddMCQK
         CGO9cj7zQC67c4RqTo9Ifpw341FEngmexmfIoZyVOacACjf8luhUK3vAnb6rcUoSAhTV
         OX8ejDzhekvYwlT63lDVZXedcj+tI8IiJQ98/HAFSkw9efFm2fDgD2khJiiXdFpIJisx
         bFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788766978; x=1789371778;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z1UBgFBd90nwHRd6YeMX+tFewu5XhDiJ8y8k8qjPtt4=;
        b=AmEdlksaTQpN2/X3G5rjJIz8+QGxOWupQP3O4xXT1HWMwtsHHptd9dB3lIY5j6cH5Y
         ct8LQGJf1CO8xVukMkTwLqYwvPg3pNnrhN+9mEOJ/h2QQ/o1cUbbWcCTlcbMl+aoPVI4
         74ZpxQvtdQsnRYZmGta8M6nnhr3YmtiD45yksWEAG9Bq5abtWJNsRwV/2aOHttNOXqnF
         SR1miHRX+hankoBk6/aBp9iIemOE5cOX/4uwTgCHsNbHWcq6RRA2/BCUxtquQP+JLmVb
         dSXFeEj4DTsZLTSEVlJhPhnQTe8GltybmFIcwKVd42GJ/bYpAx5eubYFv3qYiRk63r+F
         M8eQ==
X-Forwarded-Encrypted: i=1; AKwUvBzhm6EM9+0eWXPC7uJmTgVV90dmwTVNpkMgRpQ4TB+aFKzDKlEMiTLaMMFurHN/g6zWizqlzSN/YKBBt5Q=@vger.kernel.org
X-Gm-Message-State: AFuF++m6iTYWKgvzQZdFKFndJ2wTvl3WtQ3jLxcYb4OmZANoLwWZC3rX
	RsUpG8E4iS3j8Po8AYWf/J1Qf15dxXOBpnma7zIa5bsg99qPx38hyyarBU14Xr1C
X-Gm-Gg: AYBFou1+aI6eO4F5mfMnMmUBUhluYPx4nX2X6BGPJflXadLAcCv+qwKlumb4fGRoTb3
	Apotl2ouTm/Rp3DMcgh8snfpfszQCuHvNJYxcGY7gV66RYqWQ5ODooM5Qsvk3Xtc6Xz8DCkBKPn
	Uah2DAzpQBWhT2oArPoSGKBKOBHvOx8PAIrSsH1sth1A2+G64cPWedxXZTXiy6ZmOhKYQMuhFn0
	fZo9SjROTK+1D+QcXcVDmpUW1IWwTgxii6W//Gl/krKVH9QfLEEjiUjS7TWIP//CKsykqGTZnOd
	4QZHOhDDLay/lBvGDVdNZ6NM0SUjBXaQEj2Eylp19Iw20AKCucNvYM4iK9JHJg1JWC0P5aC5ZnH
	oaAPJ+4d74N2GPvi9sF6Lfhrz3PQ+RLFC2LqZQzFAAgazQmlEiPH0eUFZBctmbTvNzx909ZtEYw
	3bCvvYs7tuSR/XjvDjdMPxvQAIt1jPoMvzD2rDTxrrAzW9H/yw90AtHf5xX6jki0wB/9Gs6PEqk
	5Leb1dghfYxk24=
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6111080a91.16.1788766978149;
        Mon, 07 Sep 2026 00:42:58 -0700 (PDT)
Received: from somonox.localdomain ([210.180.194.253])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26127fddsm18646695a91.12.2026.09.07.00.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:42:57 -0700 (PDT)
From: Hyungmin Lee <hungmin090929@gmail.com>
To: Dave Kleikamp <shaggy@kernel.org>
Cc: jfs-discussion@lists.sourceforge.net,
	linux-kernel@vger.kernel.org
Subject: [PATCH] jfs: reject negative symlink size in jfs_iget()
Date: Mon,  7 Sep 2026 16:42:35 +0900
Message-ID: <20260907074235.73696-1-hungmin090929@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The on-disk di_size field is copied into the signed inode->i_size
without checking whether the resulting value is negative.

For a symbolic link, a negative size passes the existing

	inode->i_size >= IDATASIZE

check and enters the fast-symlink path. jfs_iget() then uses the
negative size directly as an index into the inline symlink buffer:

	inode->i_link[inode->i_size] = '\0';

With an on-disk di_size of 0x8000000000000000, inode->i_size becomes
LLONG_MIN and the store generates a general protection fault on a
non-canonical address.

Reject negative symlink sizes before selecting the fast- or
page-backed symlink operations. The affected inode lookup then fails
with -EIO instead of crashing the kernel.

The original crash and the fix were tested on Linux 6.12.108 in an
x86-64 KVM guest with CONFIG_JFS_FS=y. A malformed JFS image was
created with a symlink inode whose di_size is LLONG_MIN. Looking up
that symlink with stat(2) reached the affected path in jfs_iget().

The same unchecked path is present at mainline commit
df2908090cda368b01ff43709f51890076c56157.

Before this change, looking up the symlink caused a GPF followed by a
kernel panic. After this change, the same lookup produces:

	jfs_lookup: iget failed on inum 34
	stat: can't stat '/mnt/file0/file1': Input/output error

and the guest powers down normally without a GPF or kernel panic.

AI assistance from Claude Code using Claude Opus 4.8 was used to
identify the affected code path, structure the fix, and prepare the
technical documentation and changelog. The author independently
reviewed the analysis and patch, built the resulting kernel, and
verified the fix using the reproducer described above.

Tested with:

	make -j16 bzImage
	scripts/checkpatch.pl --no-tree --no-signoff

checkpatch reported 0 errors and 0 warnings. A tested reproducer is
available on request.

Fixes: d69e83d99cf8 ("jfs: ensure symlinks are NUL-terminated")
Cc: stable@vger.kernel.org
Assisted-by: Claude-Code:Claude-Opus-4.8
Signed-off-by: Hyungmin Lee <hungmin090929@gmail.com>
---
 fs/jfs/inode.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/jfs/inode.c b/fs/jfs/inode.c
index 470976271..9bbac7fec 100644
--- a/fs/jfs/inode.c
+++ b/fs/jfs/inode.c
@@ -46,6 +46,10 @@ struct inode *jfs_iget(struct super_block *sb, unsigned long ino)
 		inode->i_op = &jfs_dir_inode_operations;
 		inode->i_fop = &jfs_dir_operations;
 	} else if (S_ISLNK(inode->i_mode)) {
+		if (inode->i_size < 0) {
+			iget_failed(inode);
+			return ERR_PTR(-EIO);
+		}
 		if (inode->i_size >= IDATASIZE) {
 			inode->i_op = &page_symlink_inode_operations;
 			inode_nohighmem(inode);
-- 
2.53.0

