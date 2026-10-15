Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EA23EDE4A
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 16:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792081059; cv=none; b=HLaVKYPeB4MTrNREot7pXYOCUxpA3JynwkB/bOybLeYTETIeXzxRm/1ZnYet7+SXOiU9PRE5QbjWZ5r2Akqg3bO87BTMaLuG1iI99QrhtzuB8XoBuuLzQZEGf+TkiGP9BNxO4Gcv1OzGHDdwpSe96arXpLH3WoDMLWf8/CEBXYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792081059; c=relaxed/simple;
	bh=BWHit1UlhX0zhpOtwkh62QQnuewsjtTME+d5ezffyxo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IVmd7+cPioCSDBai/0FMrhfosSSJ4ZfwJxkKm3DOwOos4ViINFGFHttVvsON0WLESlQthiPG6yx2R45klCCYYqM4k+1seKChHLLlb9iNivPb0uG1ZwQPf6UYo6e+CggkCNoM3WWrxuS+RSzfsDoZM70KGg89s4+DaDFtfXY2btY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdG09JxQ; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdG09JxQ"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so2530803a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 09:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792081040; x=1792685840; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e/dtXorIWh5RpuBhW8iMUT+F6g07/k8JXa1ZHIcQO4A=;
        b=PdG09JxQDWjVafss4f0R8jJcLZCgUJ0G6TjLf9cBLK6DW4YQSm8TMsJbeL6dNSCtRX
         ceAi3DmL1L7dewV0pSYlR/Npbsm/AZWT/Vn/q1ooAJ3r6rdaOxosYeGlPGcEFXKq9vzU
         YoCK7J4vhc4Sl9O1txjP9mEHvrnAsz6si8AJY1Usm6i2uOk7yhSHDP561Y1Fk40Gm6Bs
         EHWGyfDxXyzvri3euZSOMeqzQeFucSIBJtT/h+eqHKL7PC/0VB4Qyn3CW+yJVEidUPwz
         gFXzK6nm9Ndb3PoTmbtqfduoO7XqIjTZvImv3wfbu3timqZ/IGtWB2d7HmPIJfLrLMvS
         SKfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792081040; x=1792685840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e/dtXorIWh5RpuBhW8iMUT+F6g07/k8JXa1ZHIcQO4A=;
        b=SJpz6rWNGsXEkwFv/JrQkQ7EEAimf/Ss7qqTzJ8klKXwysLTMGw6WPoc5KtBy18oBo
         qFZd8BCc9H5GYgi6lTj+5yzfQXCc2w31BO8gS66QQNlesWLzXnWjfEKkt/R48A8Vezcy
         +3YdCToF4/7+sorOv4mrFZZKhczE+Puu7lQjYDj59aUhHexLaR/jreTPFqp4DkweuMxP
         DTuz2OnKiWtjo27lJxOiuD+7ykvmpw7X7CxeEdpwBVFWDuPw+vOOakmpivenCTavElZ8
         n8RPOprFPdtdz18Fo+VmlRIX3TO+6LwopWaGxZ0/fluZL4m/wMcuqBhgW7rXzAqaNn1u
         egNg==
X-Gm-Message-State: AFq9FYLyO9lywBKl8cO8dsq4jnvC7jHB2TTrWG10xiLgZqK2fBxvGoI9
	6cVQGmuytYMVvDEBNMxf/ouyWY8Bkloh5vkXifdYupJZ8S2ARE5Fsni675gO6g==
X-Gm-Gg: AYBFou0hc2+cJHO6yup2AoMG1Q0zi2V76Mblfihb1t3HLdk0+m4lggO47fNQPnDr4QP
	TQ9HOcgadBTxXwNlPBwaYg18D4sFjxCHPD/2L+2ZnW2HyYZcu9Br3OJCa9NNKOUKXASw1lR5X73
	qKIQlVaCqTTfGUELgtj249/DZ2uxYm8WjBCNw93oAVUXNpr9GbATQTnKb9xuirCMALi7XQRwY9O
	mZ716POO1kAfh0wHPJNnXPQcd+Y8qSyfQtphVBmc3QLK+uPf+32s/MCJ3/cwZcUOHNULv6CrTZn
	6eZ9gkT4W8550Cy//L9hdDFP7Z9T5M2Giy50m4rAgwKvDlyZRuEhpvTR+UvEfuujmtigCY0Ewgg
	r8ZV/RSxFSNr0LXpKJ87hRpvYRgrnquXLozGeWcFXWZ/gAuEHv917GorQTAXGNKl7PEkw3PH5c/
	GDWEMDCYNHeIVytqb/aRhm42SVyIzHUBHLSKwgED11sikRyd6ByzZew5j6J5IlHftaxK9+KkLxl
	0M64zhFRW1tOhhMWN8+w+SH/YqieVikcPuMbmzNR3f14Gp1NZFwS918FrBooefPtjfpeqDOUcu3
	1clfMf0vrS8piWun
X-Received: by 2002:a17:90b:55cb:b0:3ac:403d:6239 with SMTP id 98e67ed59e1d1-3ac403d6baamr7208538a91.43.1792081039779;
        Thu, 15 Oct 2026 09:17:19 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac945e74bcsm5082958a91.3.2026.10.15.09.17.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 09:17:18 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH] f2fs: don't use truncate_inode_pages_final() on live inodes
Date: Thu, 15 Oct 2026 16:17:14 +0000
Message-ID: <20261015161714.1586334-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

truncate_inode_pages_final() is meant to be called from ->evict_inode.
It sets AS_EXITING on the mapping, and nothing ever clears it, to tell
the VM that the inode is going away.

f2fs calls it in two places where the inode stays live:

 - F2FS_IOC_START_ATOMIC_REPLACE uses it to drop the page cache of the
   original inode before setting i_size to 0. The atomic write then
   goes on through this inode.

 - f2fs_abort_atomic_write() uses it to drop the uncommitted data. It
   is called on eviction, but also on the last writer's close in
   f2fs_release_file(), from f2fs_file_flush() when the atomic writer
   exits, from F2FS_IOC_ABORT_ATOMIC_WRITE and when
   F2FS_IOC_COMMIT_ATOMIC_WRITE fails.

Other processes may still have the file open or mapped in all of these
cases. The mapping then stays marked as exiting for as long as the
inode is in memory. This stops reclaim from storing workingset shadow
entries for it and breaks any code that assumes an exiting mapping has
no users left.

All we need in both places is to drop the page cache, so use
truncate_inode_pages(mapping, 0) instead. The eviction path is not
affected, because f2fs_pre_evict_inode() still calls
truncate_inode_pages_final() after f2fs_abort_atomic_write().

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Fixes: 41e8f85a75fc ("f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c    | 2 +-
 fs/f2fs/segment.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7020b3e8940..1e6f1f02357 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2466,7 +2466,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	fi->original_i_size = isize;
 	if (truncate) {
 		set_inode_flag(inode, FI_ATOMIC_REPLACE);
-		truncate_inode_pages_final(inode->i_mapping);
+		truncate_inode_pages(inode->i_mapping, 0);
 		f2fs_i_size_write(inode, 0);
 		isize = 0;
 	}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 794e0d99fc7..781995fedcc 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -194,7 +194,7 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 		return;
 
 	if (clean)
-		truncate_inode_pages_final(inode->i_mapping);
+		truncate_inode_pages(inode->i_mapping, 0);
 
 	release_atomic_write_cnt(inode);
 	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
-- 
2.56.0.385.gd3acb90ef8-goog

