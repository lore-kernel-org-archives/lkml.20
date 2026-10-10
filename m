Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DDD385D75
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 02:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791600105; cv=none; b=sBvHTPIrlKLXrZ1CtQB2uUUyD+POOlsW5ghNPoza+2FNr6zVLFQuzdCLpmKCk0YJ/KhP+OQ27zMZ0AyZTzS9gexUx0TOAsDjirV26Y93V9/rGKi75s010XM+O07jdaSbibeRP66zbVuQR4GH7k9g9a3mKzPmeSzDQN/Nydc7a28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791600105; c=relaxed/simple;
	bh=QW7NjXc4anhgbxBiUbO+RRnkwirpLm9Q803gnCCN4zg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=f6Y++FKvh0mJx1Gt3IfP9YMUYisHG1n8neDMFSAH5My66KReMoH+MstfHnJjDVEmn4WnQT1efK+r8kgGW8S0Z7DZT3G/SaapyvQO2yVoC79CDGnZZJm6f/vyBmkO07XIDJW9Jq71wFn6vSArMPuXYXXp6PIa/isZcdD2KTpA2fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/+6/idr; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/+6/idr"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3a7fecf8440so108021a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 19:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600103; x=1792204903; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wq+5ysuHPmHAmM+EKqXmZYLCFhM627kiHhJZlYnVB4Y=;
        b=I/+6/idr2dnXxH+h8rtAJmefEZyn0qW+PHzkOV41vYUCQ7X9ZmYcz66W1/KKLklo5d
         muUNCSy06xQnInkGbh8KihoiAy6tmX7nZWpVMiZWRM9M/61pWUgJ14qYcTGHj0vCCPi+
         7rbhyIsDe1TwaMVt5/LJpit4y00jBpm2i6mRSQVUgf320qS4REzwI9ZcswzYwtL2032t
         MB1U6CbfU+jsMI5617CKo9t/nvXcL7v1p+YDm4NVB1LHwOOih5mVYAE3wt03xlozOrla
         hYgBEhDa+KifXTc1cODnNDrm61F/l5pGKeUOq772jglq2aSGT5LGbi9kNdhuZhMNqlWi
         4L0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600103; x=1792204903;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Wq+5ysuHPmHAmM+EKqXmZYLCFhM627kiHhJZlYnVB4Y=;
        b=LexUZeQu/8jP/ONXHB7PnijBJFnESmvWYic5fIiAee6ClsgzOMLTVoF4tKjX1uqaec
         Balf2IIsKIP8EqX/xuaqwYiXpGYjz5hiFd/hWeK3QQlXT0/ljBmIk/gwxYd1n3naIJo6
         qonKDp6pdPNrW0ocftEm91RksGCggpFV2faO7MOzeUXVcszMlhXNS2ghIDKuw70pW5Yu
         nRHH2zC75OSF0m2Ddl/3dPUrkpnpySMEd/r9FS/EKo6Q5cQ7X0fjZ5XdnAnTt9PUZGEC
         PtsOqUpsHgXSInNigJ3b/CZn73qo9XnfD12QdLafQ2FFnrnH+0UhJBWEpobq9AXVR9JN
         v2pA==
X-Gm-Message-State: AFq9FYIefqOXALmzKeoNtvDNxR7W/r8bqvwIP65m3ZYLos+JSQhaZ+C8
	Lz/09Gds2t0x7Wl38xvgXGOnpfSitBaZPE7OLaAxtMuwisjgOuSYgklv636/sLKu
X-Gm-Gg: AYBFou2k01JqsIlp2DWMcrQQZutXi9j72IrDGmYxx09KZKxMZ9CzllzukUMVUaZ5YCu
	BSGb3RAh3r7YSmgfC0msSpJp7lRmleGyy16fzE2z/GdqaVVa7u5/iNueO+1xuG8sVhoP0eUa19s
	OXavWeKS3ET0DH17MvMev9AQ8mbcMZnGf8iu90+E/VLjVPeeO3vbhFFTnSaHu2QToKLSt88JRCc
	IdfHEMsXOgOtnvuVaxJ71AUPcQjeBJEawU5ibFIXqMuMXSxRXXu3VtxTYRSfBN7GozXVh28S+pL
	H78CNIGJ2csHlGBxOlZRaP2d1Bdn3Hpr14JNJGjvYXzEApMjfdxOQcxEzQQIrBMxZU0L1cz9sZC
	kpdZaOiFnd40qMcIHNe7H/psv8kxfh1FUSrcqlexJ1vPa6srDdqp8ga+vLtqYaLu3DmX0E7vT65
	9lirPFV5nt62Zm0we1mtYs5rYuQDRI9AJZ6mRiEGwHN5h6AqElLFf6LtCI4AQ5WfOOOsZkNxlmr
	pxyzIsv2N/VJVGNMxIpZhCT+FGqBqUmyZCJbIQxTYSW1Tf4HBYV25S29uaStzKgwhfSmRgtGsEi
	V8tUyGkeiRQIqu4=
X-Received: by 2002:a17:90b:4d88:b0:3a0:c85a:ee02 with SMTP id 98e67ed59e1d1-3ab3ac57201mr3454410a91.17.1791600103250;
        Fri, 09 Oct 2026 19:41:43 -0700 (PDT)
Received: from f2fs-test.c.googlers.com.com (225.134.16.34.bc.googleusercontent.com. [34.16.134.225])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36fdc75esm6296183a91.12.2026.10.09.19.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:41:42 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	stable@kernel.org
Subject: [PATCH v2] f2fs: disallow mmap write and data-modifying fallocate on atomic files
Date: Sat, 10 Oct 2026 02:41:33 +0000
Message-ID: <20261010024133.2444761-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gd3acb90ef8-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

Stores through a shared writable mapping and fallocate with
FALLOC_FL_PUNCH_HOLE, FALLOC_FL_ZERO_RANGE, FALLOC_FL_COLLAPSE_RANGE or
FALLOC_FL_INSERT_RANGE do not go through ->write_begin, so they bypass
the COW inode and modify the original inode directly. Reject them while
the file is in atomic write mode, as fallocate already does for pinned
and compressed files. A write fault gets SIGBUS and fallocate gets
-EOPNOTSUPP.

fallocate without these flags only preallocates blocks and stays
allowed.

f2fs_vm_page_mkwrite() cannot take inode_lock, so check the flag under
invalidate_lock, and hold invalidate_lock in
f2fs_ioc_start_atomic_write() from the flush until the flag is set.
Otherwise a fault could check the flag, then start_atomic_write could
flush and set the flag, and the fault would dirty the folio afterwards.

Cc: stable@kernel.org
Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: serialize atomic flag check in f2fs_vm_page_mkwrite().
---
 fs/f2fs/file.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ef4d218e694..7020b3e8940 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -187,6 +187,17 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	file_update_time(vmf->vma->vm_file);
 	filemap_invalidate_lock_shared(inode->i_mapping);
 
+	/*
+	 * mmap stores bypass the COW inode and would break atomicity. Check
+	 * under invalidate_lock: f2fs_ioc_start_atomic_write() holds it while
+	 * flushing dirty folios and setting FI_ATOMIC_FILE, so either it sees
+	 * our dirty folio and writes it back, or we see the flag.
+	 */
+	if (unlikely(f2fs_is_atomic_file(inode))) {
+		err = -EOPNOTSUPP;
+		goto out_sem;
+	}
+
 	folio_lock(folio);
 	if (unlikely(folio->mapping != inode->i_mapping ||
 			folio_pos(folio) > i_size_read(inode) ||
@@ -2113,9 +2124,11 @@ static long f2fs_fallocate(struct file *file, int mode,
 
 	/*
 	 * Pinned file should not support partial truncation since the block
-	 * can be used by applications.
+	 * can be used by applications. Atomic files should not either, since
+	 * these modify the original inode directly and break atomicity.
 	 */
-	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
+	if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode) ||
+	     f2fs_is_atomic_file(inode)) &&
 		(mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
 			FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) {
 		ret = -EOPNOTSUPP;
@@ -2403,6 +2416,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 	f2fs_down_write(&fi->i_gc_rwsem[READ]);
+	/* serialize with f2fs_vm_page_mkwrite(), see the comment there */
+	filemap_invalidate_lock(inode->i_mapping);
 
 	/*
 	 * Should wait end_io to count F2FS_WB_CP_DATA correctly by
@@ -2458,6 +2473,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	f2fs_i_size_write(fi->cow_inode, isize);
 
 out_unlock:
+	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&fi->i_gc_rwsem[READ]);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 	if (ret)
-- 
2.56.0.385.gd3acb90ef8-goog

