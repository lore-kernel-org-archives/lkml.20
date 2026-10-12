Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E060C30CD95
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798062; cv=none; b=dPsZmZQZHjNT1OLMJ4o0N2Pf7ljLqBK+HvEgEJu0fDgdVXze0UCneuGMRw4RvuEjMRmN+v48dcz+oO+a/GP50ki9mef3FkiUZpqI4x7RhrxlTjN3O0eRGnT2GQWGL+lhka66IWr+lDZb0z/f98Rr1dQxUriBmyMgkXusiCB5dd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798062; c=relaxed/simple;
	bh=lmbfP6/LQtekS5d2UAKODhzYECFpFLpPjSLkUfC8pXI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GMZ9a86OTjdOwOt6u6HduHkGHWNPEnj5Vef6rpMnkagVnsHmM4cee1wSgc4KfvJY8TpyivM2xWJtKsjpDr+0YEwalzl7UfzJ4LmVMygRDMaM0yXav3KC6OrvAmf6FICr5xMREXQqxFJRaJDo1KEBsPCr5YANgdVpBsPKCm90Eig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu; spf=pass smtp.mailfrom=cs.unc.edu; dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b=KmzPzZGG; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cs.unc.edu header.i=@cs.unc.edu header.b="KmzPzZGG"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-93e76469b93so95450385a.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1791798059; x=1792402859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TFmCIpUfagd6jNTqIQiMG7oS1DzngqujJGbDwYFy81o=;
        b=KmzPzZGGAxQjOkzm1xv8X3AhmKEYRXzDhSZS090y2Bu8N7FEvbfBDH7tniySi1WnB7
         ksTf4RwnRBOExs+JIUYJctnAxgIPBdvZikViTPWNAsKzAugyjfnSOK7qPBKOl5vndkCO
         pdRxN4bwvGdIPV0An0q+XE3OpCUJDJ0ru+RqzWMWsQNBDF5ST/az65NN1LEn0p31rrUr
         LWlS4Ou/S/sAx2MOxgMZ4PGVrTwXML6dq+Qi8B9NS/6KzlI5vZhXfwa2I9Ki2MQYCTUV
         V2OUO5JG5qrRxEs5MkR4Ti65NZOLRrVsLKXuMRcX2PKIX9nAKRKPIfh7kslewmgTqof9
         F/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791798059; x=1792402859;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFmCIpUfagd6jNTqIQiMG7oS1DzngqujJGbDwYFy81o=;
        b=LtxTDDqlKmwloFt0gyWi0eg1dgDZuOsRnneoMvLDYjLRYNkJecmAVUk+QYa5A9o5rG
         Y5A11gS7XZ/4tva/Mt/m1tqSVTxKs5dl9wSL3sb/G7IOuaiX/HZNBbRhn00u+oEgcAQt
         4TkI+Lnt12yuvn6FNWzuJF9KeeFvOMedyI5vdT+45vjxSIwdTTJ+K4h3daTy0zVOc/a3
         9e6oUkSJqk4QlrbAKxv0lxb8YeB7/mmNtAyBb5V6FKA2vEDkI0ZyQGZY1XL/BJU4CDXF
         vulHg2lN11qSSoVu6Ki/svr59ZuQfAVKXKClvB2sFvz+QK6mKpLQtbCYUGsstXhTR+Fc
         wHRA==
X-Forwarded-Encrypted: i=1; AKwUvBw7CIFgaVp5wlrcbtRYECwOKsZzZbpQrnlxyIEcMv8bkEcrwzw6zL9EVjKvV0eC28JnkQcn3ApXFbWmGnY=@vger.kernel.org
X-Gm-Message-State: AFq9FYK2MDyfkBlOAobj6vAx2IOD+n0FqyXzpsqikdx/cOKL4jE0ax10
	o4GIhZFTd9jAVlClmt61zmNbWG12yhwV8pOD6YI7wlstlI3t7H6FcG2/8nhbw1oY/g==
X-Gm-Gg: AYBFou0yFNw99XlTE6qJJGFC1TbpgegvGgSr8dTHXzVZ5qQMUiXK+V+rqTz9JAK+Fiu
	RE+0kPEIFKghcEeKR3CW3ncrfy2iiZI663On7RbtkmDQlKhl4p/ZwX+nmcdaLzhu6kByjySRjwJ
	CKyhO9HIKtJt+pRWFGOUX045/Q29eRvHWcz37Ke4YyR3EcwK8xHmQAZT15nX4y0kH/F4TgpPhNM
	bAs+u9zUX1HcLe8P/ISdGupGsnBBjNx5qUi5TNsVccPsjitQzmBKkQXfGIIQevlFhIl5WznSi1I
	gpTcO2f/2L+vWFW0vloT7UdWoQJaQnjZExVY+/k4k/X6JUnbuAY/vJzMLEMGZV6uKPea7/zssJ6
	I7haox6HxK48GKDp0FttgykW/K12+jZUyDaTEUJHYdSS0F71XqUBswY3WPoE2sqhIL7tJNX5W7t
	GdNHT8ovASmwsOKUf5j9zLhoDazED6zL//sk7C7/JKPy5ArLQV0XPhQq1nmyQlGhX3UmsjcouL3
	OSoasHadw0iA5NICJxssw==
X-Received: by 2002:a05:620a:710d:b0:93e:5daa:67a4 with SMTP id af79cd13be357-93ebd225a6cmr1469980085a.29.1791798058677;
        Mon, 12 Oct 2026 02:40:58 -0700 (PDT)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b815fd211sm21817986d6.48.2026.10.12.02.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:40:58 -0700 (PDT)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Sungjong Seo <sj1557.seo@samsung.com>
Cc: Yuezhang Mo <yuezhang.mo@sony.com>,
	exfat@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] exfat: free clusters beyond EOF when a write fails or is short
Date: Mon, 12 Oct 2026 05:40:46 -0400
Message-ID: <20261012094046.2592731-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 82a81a7352bc ("exfat: add iomap buffered I/O support") and commit
867b9c96dc83 ("exfat: add iomap direct I/O support") made a write
allocate the clusters for its whole range in one step. They also dropped
exfat_write_failed(), which freed the clusters beyond the end of the
file after a failed or short write.

However, a write can stop early, for example when the process is killed
or when a part of the buffer cannot be read. As of now, the clusters for
the part that was not written stay allocated beyond the end of the file.
exfat_cont_expand() does not expect them, so a later write or truncate
that extends the file fails with ENOSPC. The directory entry records
only the size of the file, so the space can be lost for good once the
volume is unmounted.

The issue can be reproduced on a 64M volume made by mkfs.exfat and
mounted on /mnt, with a write of 1M from a buffer that has only its
first 4K mapped:

    #include <fcntl.h>
    #include <stdio.h>
    #include <sys/mman.h>
    #include <sys/stat.h>
    #include <unistd.h>

    int main(void)
    {
            char *p = mmap(NULL, 8192, PROT_READ | PROT_WRITE,
                           MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
            int fd = open("/mnt/f", O_CREAT | O_WRONLY, 0644);
            struct stat st;

            munmap(p + 4096, 4096);
            printf("write: %zd\n", write(fd, p, 1 << 20));
            fstat(fd, &st);
            printf("blocks: %ld\n", (long)st.st_blocks);
            printf("ftruncate: %d\n", ftruncate(fd, 1 << 16));
            return 0;
    }

Before commit 82a81a7352bc ("exfat: add iomap buffered I/O support"),
the result is:

    write: 4096
    blocks: 8
    ftruncate: 0

After that commit, the result is:

    write: 4096
    blocks: 2048
    ftruncate: -1

This patch will bring back exfat_write_failed() and call it when a write
ends before the end of its range, so that the clusters beyond the end of
the file are freed again. It waits for direct I/O in flight first, as
exfat_setattr() does before it frees clusters.

Fixes: 82a81a7352bc ("exfat: add iomap buffered I/O support")
Fixes: 867b9c96dc83 ("exfat: add iomap direct I/O support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Hengyu Liang <hengyul@cs.unc.edu>
---
Based on the exfat dev branch (1cae92a58966).

Tested on v7.3-rc6 with fs/exfat taken from that branch (KASAN, and a
second build with lockdep), on volumes with 512-byte, 4K and 32K
clusters: the program above, the same write with O_DIRECT, a process
killed in the middle of one 48M write(), a fragmented volume, and
asynchronous direct writes in flight while writes on the same file
fail. With the patch no clusters are left beyond EOF and all the space
is free again after the file is deleted.

Without the patch, the killed 48M write leaves a 1.5M file with 48M
allocated; after a remount and deleting the file, only 15M of the 62M
volume are free.

The inode_dio_wait() is needed. In a test build without it, a direct
write that fails while asynchronous direct writes are extending the
file frees their clusters, and fsck.exfat reports "less clusters are
allocated".

 fs/exfat/file.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/fs/exfat/file.c b/fs/exfat/file.c
index f106db945d8d..dc57d2c2f0f0 100644
--- a/fs/exfat/file.c
+++ b/fs/exfat/file.c
@@ -804,6 +804,19 @@ static int exfat_extend_valid_size(struct inode *inode, loff_t new_valid_size)
 	return ret;
 }
 
+/*
+ * The clusters for a write are allocated before the data is copied. Free the
+ * ones that a failed or short write has left beyond the end of the file.
+ */
+static void exfat_write_failed(struct inode *inode)
+{
+	inode_dio_wait(inode);
+	filemap_invalidate_lock(inode->i_mapping);
+	truncate_pagecache(inode, i_size_read(inode));
+	exfat_truncate(inode);
+	filemap_invalidate_unlock(inode->i_mapping);
+}
+
 static ssize_t exfat_fallback_buffered_write(struct kiocb *iocb,
 		struct iov_iter *from)
 {
@@ -862,7 +875,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 	struct file *file = iocb->ki_filp;
 	struct inode *inode = file_inode(file);
 	struct exfat_inode_info *ei = EXFAT_I(inode);
-	loff_t pos, valid_size;
+	loff_t pos, valid_size, end;
 	int err;
 
 	if (unlikely(exfat_forced_shutdown(inode->i_sb)))
@@ -881,6 +894,7 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 	}
 
 	pos = iocb->ki_pos;
+	end = pos + iov_iter_count(iter);
 	if (pos > i_size_read(inode))
 		truncate_pagecache(inode, i_size_read(inode));
 
@@ -909,6 +923,8 @@ static ssize_t exfat_file_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 		ret = iomap_file_buffered_write(iocb, iter,
 				&exfat_write_iomap_ops, NULL, NULL);
 	}
+	if (ret != -EIOCBQUEUED && end > i_size_read(inode))
+		exfat_write_failed(inode);
 	if (ret < 0)
 		goto unlock;
 
-- 
2.53.0

