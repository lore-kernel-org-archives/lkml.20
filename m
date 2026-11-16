Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794802161;
	b=NUxA2ReSR2sVmwQS4W0YEqUxi/P6vMHqfLZiPArFnslchd0hyoAmYNW/j4u623g1Yjj0
	 oKPWRuj0tUBVNojuknGeBVsFWU+i1LtDKtjAipjyq5hVnTXXMczHK9+P/uuFhI2oJpcGI
	 ohkGJtKBFcLogL5eV+d+J3F3NhadAkTcEbgtGqsyRo1Myk/9fQVNH404fV1KhuhgkLLJk
	 3/sUj0kgHrf7jDcd5H0c55p0xtH6O+oAsFYhSTMqXY2JxzFiz90R5jwYhoAUy4Z9iAwuB
	 aiDLRUZiutiR/VV6r9oA7h25EJ1tewbuPI0+3au5wCdzNwPBlqXxfcHiiFJbxyeyZhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794802161;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X33thUbLKIiMz+y447VVVI/W+Uwf4DWtbchYH8A4ZZg=;
	b=bNa4V3Vah2+xRZE3p6GLQU9C3iEI4DBXeU5zA4QexZTK4QnjD1oUAdeMzlZFoRKSdOxX
	 nJyIoQMwnNinxf5bKCVFmPf4UY7KWLnTfHyPR9pK3/DI4F8/ETQn2qxF/PQNEYTQHAteI
	 MdLC4eThlTR1v7ZweqaUwpzELptzXdAQWOk+Mx1WKGToCjpnI2QJHJyu05hTC+A8gi7k1
	 PkZWRbbGUFNFspRPj6SxIKbXB9fOvUvYZ3RFflXjQAuyMEttMMGdEYiEA4s85MAj/Y1qL
	 o8kL1GwsZBvlBX1oj6aJHenTIKW04/n3meZtuGLITAqG/T8F+k69LYa2MUagIeEvzTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFFQ5BdN;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FF606A8A7
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 04:09:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5FF606A8A7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=FFFQ5BdN
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so2455630a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 20:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802161; x=1795406961; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X33thUbLKIiMz+y447VVVI/W+Uwf4DWtbchYH8A4ZZg=;
        b=FFFQ5BdNGAMiBUfstcbgjs0f/OCbB4qjVL20LQ8s8kI94UW2KgudkDjOR4IxrNOLQU
         2mf75rwEiCzg2hPgMg1IVnF41zk69cw3NXdWF+gtrCfxueoBxkWQqkOIbYVpiWzIsL6v
         RKIxQPN1V1a9ajjmtlJ6SW8WEYVQhVIJ6g5071hjX9U2ML+Ji+VvDfoxynfZybmdFWgx
         0gz0jENIvZU9VOrqlMbi7nnG1U7CSF7gq/56FsXkNMRj//BqsxFeYh5P0J5hbulKp+li
         IVNSjrWiyrOupz6GXEUAykwZq1zY3eOgB6sypiznBf+WbAnLaPDBrghInZ16ZYl3USNn
         ceZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802161; x=1795406961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X33thUbLKIiMz+y447VVVI/W+Uwf4DWtbchYH8A4ZZg=;
        b=AHVlbv7V57NBOARyJw9XxopWu+ZcDoUhrFkKPAASt/WBlumnVGDMNzqJSCxGzoI9+J
         wteUYKJpsP42cec0i1u9vRo4bEKAcvBE8r9GRNXspVnnDyQq8Q8IgJF61wjG5rJZcihg
         kRRzRJEb3RI20m8GYmiK3aD7sJSb5TISkYKeIsyY2RqwrAmvcujJbp/LYlPmFZZpGXDX
         xlSmNLqDSZqBJ4wH6ovs/wWhjvUR3NrzFe3M05MEoofDlXBoQMxLiiv/MvVtPR/foNF5
         l7XNogNeLCQRMLFu+wEmcFQLuFk4gJky3Tc4dJ3hKp0c0/KFdpTnPSwOLYFjlscSfL9i
         2G4w==
X-Gm-Message-State: APuU4Z84NfDakxazukHBkQl6Sx9Cx6kK2hsXpnVzTGnwqfUJkZklGr54
	mgTYum7IdSXDVLLW0n3J/gTTeaBcocHcwsetsCkQyWLXtnJuI90VTtlVb3b8IA==
X-Gm-Gg: AYBFou0aeXFnXiMW+Y3TufAGatwsI81J519qyG+2embdR69CcKBWgyRr1eJ91UijUs4
	dY468fgcjxTJZSPW2w/X4jpwrF7uwKeHIYWohTYHbtZOcpjmZhxugha8is3nP8vyNQ3ta7Vz4jd
	WcQDiEqrl/RW1mqYA1pMgQkw0HS5Wk0nwv0Mg7dOWrVaSSl0pqGIXrnKt7Obmo9AY9m+jJMG82L
	VyfkuvrCsTBVy6gNimtwKQa+fP0B2VYuWo/KRHmJQh4BWikXZ+7GmyQsvVk/EM7uQEluxkcoH4l
	fyhuMHOHzHLOLyRbwotMQnWD/nZ4SWSwl7kblNsFKWk9YLpyuIkhEehKtHZh/Y8EUYXKBMSn2LO
	4eQi41gptgCHj20OXhASOap6QYKDhqsnIbmGJ8yTCe1hxm5JQSHmfc69mPZOI35blD8oI+dRdRS
	es84QQtkJjsw1s9icW2c23Nr/FBNA7yhnznTTHjJ1ivAMtTHVEwtMT8kU+ph5YrOLq95O67NcpI
	4Cm+lc6bO846uMyScClpaUL5haXay3BsSAdJaGja+w2Ip1vRD2wM+M8PaIoiTWiY6+omCm4XmZl
	UrTzmdyMnmOD+kQorQvtiNyjW3KYGuIgBMpd8CkGy6+sB7Io+BPJTSeKPedPJMKtrFr5fC8U4Ln
	8LTD+uHhjQilU8P55qGU85x5lcSyjkL/abhGg95dfAvXSXaBZ
X-Received: by 2002:a17:90b:1dc3:b0:3b0:9782:8721 with SMTP id 98e67ed59e1d1-3b1b0a0e116mr8704980a91.36.1794802160765;
        Sun, 15 Nov 2026 20:09:20 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3f09b92sm7191989a91.4.2026.11.15.20.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:18 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH v2 11/20] f2fs: support subpage blocks in move range
Date: Sun, 15 Nov 2026 20:08:42 -0800
Message-ID: <20261116040851.2849696-12-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
In-Reply-To: <20261116040851.2849696-1-daeho43@gmail.com>
References: <20261116040851.2849696-1-daeho43@gmail.com>
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

From: Daeho Jeong <daehojeong@google.com>

Folios at both ends of the moved ranges can straddle the range
boundaries. Write back and truncate the page cache from PAGE_SIZE
boundaries, and hold invalidate_lock of both inodes during the exchange
so that faults and readahead cannot bring back stale data. After the
exchange, also after one that failed part way, drop the source blocks
that it read into the page cache, and call pagecache_isize_extended()
for the gap between the old EOF of dst and the moved data. The page
cache was not truncated before, so this also applies when the block
size equals PAGE_SIZE. Remove the -EOPNOTSUPP check.

Zero the cached data past the old EOF of dst with
f2fs_zero_post_eof_page() before the move extends dst over it, as the
other paths that extend a file do. Otherwise data stored past EOF
through a mapping becomes file data. This also applies when the block
size equals PAGE_SIZE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 73 +++++++++++++++++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index d4472143dea0..4499a461be86 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3435,7 +3435,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	size_t olen = len;
 	loff_t dst_max_i_size = 0;
 	loff_t dst_osize, dst_end;
-	int ret;
+	int ret, err;
 
 	if (file_in->f_path.mnt != file_out->f_path.mnt ||
 				src->i_sb != dst->i_sb)
@@ -3516,17 +3516,6 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	if (ret)
 		goto out_unlock;
 
-	/* write out all dirty pages from offset */
-	ret = filemap_write_and_wait_range(src->i_mapping,
-					pos_in, pos_in + len);
-	if (ret)
-		goto out_unlock;
-
-	ret = filemap_write_and_wait_range(dst->i_mapping,
-					pos_out, pos_out + len);
-	if (ret)
-		goto out_unlock;
-
 	f2fs_balance_fs(sbi, true);
 
 	f2fs_down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
@@ -3536,6 +3525,39 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out_src;
 	}
 
+	/*
+	 * Hold invalidate_lock across writeback, truncation and the block
+	 * exchange so neither faults nor readahead can repopulate the page
+	 * cache with pre-exchange data.
+	 */
+	filemap_invalidate_lock_two(src->i_mapping, dst->i_mapping);
+
+	/*
+	 * Zero the cached data past the old EOF of dst, such as mmap stores
+	 * past EOF, before the move extends dst over it.
+	 */
+	ret = f2fs_zero_post_eof_page(dst, dst_end, false, false);
+	if (ret)
+		goto out_inval;
+
+	/* write out all dirty pages from offset */
+	ret = filemap_write_and_wait_range(src->i_mapping,
+					round_down(pos_in, PAGE_SIZE),
+					round_up(pos_in + len, PAGE_SIZE) - 1);
+	if (ret)
+		goto out_inval;
+
+	ret = filemap_write_and_wait_range(dst->i_mapping,
+					round_down(pos_out, PAGE_SIZE),
+					round_up(pos_out + len, PAGE_SIZE) - 1);
+	if (ret)
+		goto out_inval;
+
+	truncate_pagecache_range(src, round_down(pos_in, PAGE_SIZE),
+				 round_up(pos_in + len, PAGE_SIZE) - 1);
+	truncate_pagecache_range(dst, round_down(pos_out, PAGE_SIZE),
+				 round_up(pos_out + len, PAGE_SIZE) - 1);
+
 	f2fs_lock_op(sbi, &lc);
 	ret = __exchange_data_block(src, dst, F2FS_BYTES_TO_BLK(sbi, pos_in),
 				F2FS_BYTES_TO_BLK(sbi, pos_out),
@@ -3549,6 +3571,30 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 	f2fs_unlock_op(sbi, &lc);
 
+	/*
+	 * __clone_blkaddrs() reads the checkpointed source blocks into the
+	 * page cache before punching them, so drop them again. Do it after a
+	 * failed exchange too: the blocks moved before the failure were
+	 * punched as well.
+	 */
+	err = filemap_write_and_wait_range(src->i_mapping,
+					round_down(pos_in, PAGE_SIZE),
+					round_up(pos_in + len, PAGE_SIZE) - 1);
+	if (!err)
+		truncate_pagecache_range(src, round_down(pos_in, PAGE_SIZE),
+					 round_up(pos_in + len, PAGE_SIZE) - 1);
+	if (!ret)
+		ret = err;
+
+	/*
+	 * Write-protect the folio straddling the old EOF of dst, so that mmap
+	 * stores to the blocks between it and the moved data fault.
+	 */
+	if (i_size_read(dst) > dst_osize)
+		pagecache_isize_extended(dst, dst_osize, pos_out);
+out_inval:
+	filemap_invalidate_unlock_two(src->i_mapping, dst->i_mapping);
+
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
 out_src:
@@ -3603,9 +3649,6 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 {
 	struct f2fs_move_range range;
 
-	if (f2fs_has_subpage_blocks(F2FS_I_SB(file_inode(filp))))
-		return -EOPNOTSUPP;
-
 	if (copy_from_user(&range, (struct f2fs_move_range __user *)arg,
 							sizeof(range)))
 		return -EFAULT;
-- 
2.56.0.611.g1030f0b940-goog

