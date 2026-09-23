Received: from mail-pj2-f14.google.com (mail-pj2-f14.google.com [74.125.227.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D81C556B85
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 16:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790181836; cv=none; b=J+mYuM/rsaXlsPGXGaKBEFeA1coC7xDXOQdOpMc1vbnZv6Fw6SOHp08GnAp5pqMc2a6bnnLvaoENSFsU1DY9J/0cV0obid7sqVJXRMQl/48xYXZLTae6wpgBq17qF8qDP6mYnr7VmwhhZ3m60DlV05EuZLzir3IVZgiqGYXM458=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790181836; c=relaxed/simple;
	bh=U3sHigMCrX/n5NS47tTRaKkN8n2XUCVkkGrtu+Vz9Qc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D2J/ibo0qbrZU65cyCsHjAzqZaU3LSjSumWUxEGxcE0J110FPChaOUllEw88w9OWNOwt52+aUfKStcMKHILIhoEe9lu397XfPbuQqf1DJbseTcOupU4GWkGCMKeTtLt4E5NRFZNTlaHpfKeoTsrCbWdIIPL/aCR3lHUHxVfJI4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HsRMHVOo; arc=none smtp.client-ip=74.125.227.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HsRMHVOo"
Received: by mail-pj2-f14.google.com with SMTP id d9443c01a7336-2dd58e1e2c7so6352435ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:43:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790181829; x=1790786629; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hOl6tPrOOHYH5O/IseABr/XrIgSZiBfl2TxmXjGm+SY=;
        b=HsRMHVOo0d6l+7zV1hzYqdlAQGf5RJhZ7bUaM3PIuqqwYGKZv5ZPr+7myPUeSVmJpu
         EfDaArLJE75yRMEWkpZUO7WIHl5n2uPyxuYsHY/6i7WkAua5USAZL6+FsNO+lkX8Z6DW
         kEFq+PkRAL9K0zh7Za1jaspgQm6I6ClbDRskCOfYfm0W29AjbXbCL0C1mz1svQ3R2khu
         ajf/ZBWbgpwllpcIM4XSYyCLUTGOIXAG0it77qB3Dl+lrNhixWwSPfodNEsKlcXCf0c8
         t2f4hZtSGDK1o/j6XiW5F4GWasWpPtp1r9F6+Y0XISA3WaShX2YbluNiyy3ljbiqL+2M
         AdEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790181829; x=1790786629;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hOl6tPrOOHYH5O/IseABr/XrIgSZiBfl2TxmXjGm+SY=;
        b=pGCNCk/CUNYSPs0YjLb5m4pLnOBJOyYVoAe3OyGJuGX9p1AsZvt5fltzPtZHOFdskx
         1Lz8kz2v9qXoH9RajJ360vYaf/PDmCR69T6n/iOU3Rk7THrHC1rVJA82Gte4RS659vKC
         AQhogXLD+bM/R3LgzE9le61LIIL4CP59BV/JJdIUAQ/dJioQgCtUFt7bDb4ENH0p7jdi
         gdsVH2DA7ZrhA+R389kar0BU0DWULbuo6OtQ3g2EhcyiZg6HCnR/OZ6KJCur3JQYySMm
         ry+g+FwoGeGdRbeeQWgGUsAXe8M63Xusd8tKov9EK9r0m09T8TL+yDInSNdVKlTkLvsk
         lTaA==
X-Forwarded-Encrypted: i=1; AKwUvBzoTrormd4hKwn3gMX/4AkH1Wkm9e6EISjtiRluDD+y3N1+j/uSm1IkLvnN8Ddw1TYYKzHJnLZIyRNIwKI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNUDcFAHH2jwwIjUpQVifo/Ac9HZCLK7/WlwxYMWx/bkTHWfKU
	E7Jg/+mh7PoAn/m8KcHbfDOvvbCgpE+g9OBC0u5C2+UW5bpFm3BJztdt
X-Gm-Gg: AYBFou3X0Na5nV14UoSTVU2Zmn0wskAjmAGtcQjtLKsWYurHYrqTJ99bd4Udd6PYOlu
	SKITjWMUTtoH9/1UrE7VMM46P7asjaRhZrheHqkUDLVTpFOJtQkRoSEkB/oUXKgJ+ofgIMZYnGL
	vme0/J8i/2livhmgZoBOFIUcJoR0AOMkipXTwp0S9Oozn7BwjuNBU7rusOXbx9utuA6+M9EZk3Y
	XsLZvmXuATbzkigB1mEbYACq1CW/i4nkUGZw+KUxMwzpmDT2Omo3J2A7oJ/0y1fUv6OrbCzQP2D
	lje8k24JUyw2TRyt8Q7hmWBS22/aibO8LNAkOiQB0d7cnT5BsoS2LSRXAwV/fCeHA7W4YwQZx58
	sBVf1iqACmmTAiQIA8c5eycr8PcLtcKt8fnIZwcWe7X3+VkxIpdBaMFJMgJ/RnnJsICq8lkaW/O
	dlx73yJxN0cecMJ+wbmhWWMIROE+UuonB1Ve2Dj4Il8Ey72NCKXIjhonXPm5C6GPb4h9OX5VcWf
	fZDLir1x2fkZxY0ZEpXpJOR650M/DY7cVo7LDeaTfU=
X-Received: by 2002:a17:903:8c3:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2df69d36537mr27542935ad.2.1790181828967;
        Wed, 23 Sep 2026 09:43:48 -0700 (PDT)
Received: from carrot.home.local (madb688455.ap.nuro.jp. [219.104.132.85])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5f52dcsm14763745ad.69.2026.09.23.09.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 09:43:48 -0700 (PDT)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
To: Viacheslav Dubeyko <slava@dubeyko.com>
Cc: linux-nilfs <linux-nilfs@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: [PATCH] nilfs2: fix deadlock between nilfs_evict_inode() and find_inode()
Date: Thu, 24 Sep 2026 01:41:19 +0900
Message-ID: <20260923164345.18456-1-konishi.ryusuke@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syzbot reported a deadlock between nilfs_evict_inode(), executed via
an asynchronous workqueue (kworker) as:

  process_one_work()
    process_scheduled_works()
      nilfs_iput_work_func()
        nilfs_dispose_list()
          iput()
            iput_final()
              evict()
                s_op->evict_inode()
                  nilfs_evict_inode()

and find_inode(), called via

  nilfs_mkdir()
    nilfs_new_inode()
      nilfs_insert_inode_locked()
        insert_inode_locked4()
          inode_insert5()
            find_inode()

When an inode is deleted (i_nlink == 0), nilfs_evict_inode() clears its
ifile bitmap entry and then synchronously triggers the log writer via
nilfs_transaction_commit() if IS_SYNC(inode) is true.

If a concurrent directory creation via nilfs_new_inode() attempts to
allocate the same newly freed inode number, however, find_inode() called
just before inserting it into the inode hash, blocks waiting for the old
inode's evict() to complete.

Meanwhile, the synchronous log writer invoked from nilfs_evict_inode()
tries to acquire a write lock on 'ns_segctor_sem' which is read locked
by the caller of nilfs_new_inode() (in this case, nilfs_mkdir()),
resulting in a deadlock.

The synchronous log writer invocation from nilfs_evict_inode() is a
legacy artifact; it is no longer necessary because the call itself
(triggered by iput()) is now handled asynchronously with a kworker
if i_nlink == 0.  It merely increases the risk of deadlock.

Fix this deadlock by removing the synchronous log writer trigger from
nilfs_evict_inode().

Reported-by: syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=6646318bbcf419411bc5
Fixes: 7ef3ff2fea8b ("nilfs2: fix deadlock of segment constructor over I_SYNC flag")
Tested-by: syzbot+6646318bbcf419411bc5@syzkaller.appspotmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Ryusuke Konishi <konishi.ryusuke@gmail.com>
---
Hi Viacheslav,

Please apply this bug fix.

This fixes a deadlock issue that had been reported by syzbot but
remained unresolved for over a year.

Thanks,
Ryusuke Konishi

 fs/nilfs2/inode.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 64437aed8390..33490e8063eb 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -895,13 +895,7 @@ void nilfs_evict_inode(struct inode *inode)
 
 	nilfs_clear_inode(inode);
 
-	if (IS_SYNC(inode))
-		nilfs_set_transaction_flag(NILFS_TI_SYNC);
 	nilfs_transaction_commit(sb);
-	/*
-	 * May construct a logical segment and may fail in sync mode.
-	 * But delete_inode has no return value.
-	 */
 }
 
 int nilfs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
-- 
2.53.0

