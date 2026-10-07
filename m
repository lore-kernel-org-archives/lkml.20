Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307F6376BF2
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 22:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791412581; cv=none; b=e5Y1DGue/LBLSUqfBCax2zknXTbwzMxl+nTKxMrfEvBo4jGJ7kytFz7J/IMYZSYQ58UMt3HvLrEuShj9GPjX90P5Z+GVjzdL5lvmvSD9LBM4ySDMacwVDPVJ5O/Um+8ng+0bMvmQownECnWEekZzSiP1VEAwzssZqTeiF4DlbPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791412581; c=relaxed/simple;
	bh=qYXUUyVXIDf3GiQnTsP+59CtoVygtIp+QWffDCUDsRQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mbBHzST8f9pdz6srrMTqD4uwFjAxxuoTaBj2DLAXzov7f2itBRyXZ3FtLdlb5TnF3H+1N8ZjN0cuBLgibnG0BgjO/NPqJ0OjrJpSMRk+NH3/iSP7kE/5HLLGwEf2ahyMkPgMuvZSmLsvXxiL/RgQod1UBFIgXJVr8CzFFlISCTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mRprK0kp; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mRprK0kp"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3964dfb5a69so1522916a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 15:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791412579; x=1792017379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=s0hL7DMQpdsnbzZB8C++RDtzIKdJ2wm2h7g58/6ye+0=;
        b=mRprK0kpRIMOYfcvi5Q9Uj5FH3lArSCDUM5DpVSiqAF9FarjS8HsmfIUsT9ubLr+Jp
         SvGxAYuERyuPKf1+W51QN3vhZLidGDEAWyHYRBiDEOF02oaBBuXeIM2P5E/xXkuPfwJ7
         5oQKwzCY4SbL3VCM+FEaIMntvPf9Gp+3b5SL1+KUhQtPw2Rp3+pkkOuEM8ivP3H8u3Tz
         +IVpzXt5O+PIgGEpjyfbQhM4+TU3rleN/jqa7D8Bes9eGxn5o+NZ/a0y8/1UkRsCDA9w
         /7WP4UPOYJYfTJGm1Ccxg6AEBBFXiyXMayZWJxtQOxCoskqjnH391PeNu+hbm/wx0L5X
         NNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791412579; x=1792017379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s0hL7DMQpdsnbzZB8C++RDtzIKdJ2wm2h7g58/6ye+0=;
        b=DNdQMhqGLwjp+2qRKOvNq4d5cfe2iMbTnZd6YeGjOhBtCj0UoeGhwUinbgXOTUQm3t
         TwUwEqcYcGXIlccmCtq9hrELNtNucPaoLXW3SQR33+yLBhNAOStvgb5otRJh1jZfOClY
         4EiaoV1vdcezLJVOb2PXzakwUBfDq6/1Oy4/q8SaO6ZgveR7H5n03RQ6sPDfK6O37A5Z
         8VpQ0d2+XGkMvTZFyBVSUJ0t2nv+RAX8LkGtRCYFpr5nDEwKSFlCO/fxOg+d8qlFNcUc
         fGSZHBSib+Dm1BtUhySiJf4D7qN6iiF+w3SBGy/z2b7euFa8UQhftu7w9vArNBkN4Nlk
         Wr5g==
X-Gm-Message-State: AFq9FYKZUuuYdUqx8SVpIxtHJUbWA3YOh8b9HPzSC0vd2zr2UnZ0/m6r
	iJQFMCogTMGze/iVwYJDnQwcbaEM54HXyP3WZw7Mt+QFrKTk3v0LGfINYUQ106o/
X-Gm-Gg: AYBFou1YfVrlVoHCpjzXcWSwZJnw/A3JADZxb5LQ+XdWWhPY2BEKnH9oVjRucoHGD8g
	9Wg/Q5PAmZG+uokrSW1fX3joqZgVZnSj0x4e2tTaEIqjYUbRyoHvBIcVuyhYznK57zivrT6QXn2
	QpNctCw7cs+u6HmIIcYe0NHwWSiGN5bv61X/K3SbkqOKYkURetKIrATFccC6QA35NwXM284z2fG
	y+sgXeJXwr5n6L+W1uHQ8ysiQHanz4dOUQa5OqcbOaovM0Fd2wgW7ZoDlN9f2cxAGl6rfq2jsf9
	89upZMPiWnWmpmZIL4oOrehRneXbXQKSbOfGxzIh0IwC5kaTEkwUlBwLkQk1RxMJfQ5L6O8dIjH
	X589E39lb2vDupWrapoY3oof3MX0YjFOXQqPPF0m7eua8I2ppuYgiGKzs7c1Bda3xs0iA3PIQzZ
	Qv3T2Mb8aYtP5TQVmw7VU//9xMz/7uN2rhyQrWMr6QRoM/lZEu1tKC/RSqBa13kwZS1VRd3oKBS
	8P+4LuCax9wDK2ByKNACBbsJDycoMRz1fiflFLRC/6y7QYvkjKsdOubDUkAn/NVsmn7JQerRqrs
	LjUsRGYzbh4nG5ub
X-Received: by 2002:a17:90b:1812:b0:3a8:6b84:234d with SMTP id 98e67ed59e1d1-3a89f693aedmr2586526a91.6.1791412579426;
        Wed, 07 Oct 2026 15:36:19 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1c17b63sm1721253a91.12.2026.10.07.15.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 15:36:18 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: write the directory inode in fsync before checkpoint
Date: Wed,  7 Oct 2026 22:36:08 +0000
Message-ID: <20261007223608.2158904-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.360.g66cac248cb-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

fsync() on a directory is done by a checkpoint, but the checkpoint
does not write timestamp-only inode updates. Since commit 7c45729a4d6d
("f2fs: keep dirty inodes selectively for checkpoint"), such updates
are marked with sync=false and left to inode writeback on purpose.

fsync() on a regular file calls f2fs_write_inode() first when the
inode is dirty, but fsync() on a directory goes to the checkpoint
directly and misses it. So if the last change to a directory only
updated its timestamps, e.g. unlinking a file in it, the new mtime is
lost after a sudden power off even though fsync() returned. generic/547
fails sometimes because of this.

Call f2fs_write_inode() for a directory before the checkpoint, as the
regular file path does. The inode block becomes dirty and is written by
the same checkpoint, so no extra checkpoint or flush is added.
Timestamp-only updates without fsync() are still not written by the
checkpoint.

Fixes: 7c45729a4d6d ("f2fs: keep dirty inodes selectively for checkpoint")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 56c686b8580..b012cc22307 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -351,8 +351,15 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 
 	trace_f2fs_sync_file_enter(inode);
 
-	if (S_ISDIR(inode->i_mode))
+	if (S_ISDIR(inode->i_mode)) {
+		/*
+		 * Checkpoint writes only the inodes on the dirty meta list.
+		 * Timestamp updates of a directory, e.g. by unlinking a file
+		 * in it, do not put it on the list, so write it here.
+		 */
+		f2fs_write_inode(inode, NULL);
 		goto go_write;
+	}
 
 	/* if fdatasync is triggered, let's do in-place-update */
 	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
-- 
2.56.0.360.g66cac248cb-goog

