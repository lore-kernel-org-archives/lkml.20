Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832EC10F2
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 00:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788048954; cv=none; b=Um3ssMIYHX+EjeS8U93cse8cpPW/0Z5sFVmhubkL5Sx7vFZqJoQAk2qW7tna0fz+RUbdDYbAJKDrRRVUNElIbMOeNpGzxZnzM2EZALjnf1/IyRauR0R/e1ZyTD/sui67cGORV7UHfsP8ezrwnB2MGYnkfWfLbMMBjCeZCraroGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788048954; c=relaxed/simple;
	bh=GBkRZfhhhjMPhwvKL0XDc2B5qkJvnA6DudmV/I9oFqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mlG2m2VFV4OJJ/6O9vvvBYnI47dqUF/wtvbZN4pFJz8nWr3yhVDRtSywWz2EtvsjMHSZPnId0BSvqu5SY6nP4HcuzBwjKihMWsub3fu0elrLGpIUAU3f5sa/O/N6e+G8IJurCZs+OmIyuEx6oMOwV0EyshN5KQsTZQRHZC0et8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TxiGy36F; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TxiGy36F"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b0dd3c9a0so16226825e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788048952; x=1788653752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/PK/sXxsciKxVrUSs99U8nxlxsFltkAdmaHPPtgu7OU=;
        b=TxiGy36FBQ6vey5F2m6g7o3GbosVsZ1c707KcPZ93Vt9MXkSyIb958Qzrt8c2otWAP
         ooXMCaOfk6EIb4fUA9KIG1sUkf+kCG1hKIGSywVx9wkz3GzLOg31coB1/V/KhtBfkXkX
         hTDEHmvL0Ral/ftqOfDsEIk5ig7zYJjGsdqCI8IJ6Bf7ITa+BekEiEgAp5EdAVaCDxN4
         iZ+QST+2mfDyB/0kZLpj5ANroEth5F7gHZOL379rsaaIClOOw2s6EndSxf2g2hzr69zr
         th5PCaRnW8q3YQnJncDRU0xZvhVUUCMOTnm+Gg8lGbIQGxFJu/wEEKkIlFDidTR50oHN
         iPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788048952; x=1788653752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/PK/sXxsciKxVrUSs99U8nxlxsFltkAdmaHPPtgu7OU=;
        b=VcmWzOYjmES8azpMZxrQ54DbgS1ka8ljRcO6B3+72A8sv7OSVXVbEXnG8UbNcHNLS3
         8aa9g3rf49lbYeYEcnpVNtlZUij4fNunrgwejMouU35raP2QQcUbeYuaMLch+lfaDEtE
         bHQ/oKHuWkLfrCosCo/yGRsxH3g6B+X6yY4S4dILeacGLRdyVjvHdl/5+yGHofDBLk3m
         nzeGlzKqZmwXd7DNA28Ut74e9HxdU5X7/dLVRsLRGOv0xqbv4LKlIOTz2GWoUgy3VrpK
         zhSfPtVjCYqrN1RRTQ6k25HXGivTjjkrs72oS3YpWbjUtJsWvoE6CN4cjpEKRiwSngP/
         5llA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4cAGVu/kk2m0l8lLDw1cKYTaFGoW7S9oSj/coo8QtliOHfgLH25qjdY90r7rC3zLrbnthlO/adXHpcfo=@vger.kernel.org
X-Gm-Message-State: AFuF++mYzLgB6EmwdtTXiXy5giwpqoNdNMQfRd9NjpjZ++puAiAHMaRg
	Axv6t9FIkNsyZ1+oehh6UY8XiqJEKeNBprJIEOtT39tCo3GOZEkXjFe3
X-Gm-Gg: AR+sD12J/LKODMku7glpX6350seBXZ0JVoLUwPwrLKxgJH0RI9kc8/QzDdM13/MRqyb
	YoX19CpM4S4W2xgL2ZblGWkFJTcbm4Xjjvrt7cuA+xXFUMq4sBv3PUPvKBPiPKCyN5npaftx0wj
	BwXix59Ib28aqUGPhyv15l0qp77UFvn51SpX9ptvFqXMmYT6CHi+ly1SkJGKOko1RnA5fu1Z9iM
	Ni80rp/v1uPro9doLa2vd63+u/cOFntpgdq9gvdb6WzL2yGAwvG/DbKv5deTUb7srmfBop7nyI+
	e5hzRDhC933UUy1a7PI86n9F7EXLzC6ycYFuzM2imIutMNgoYEfBi1hMUFhbm5uOmHfJx60BZh2
	DacZE2522ahTedcFT9SRQj5Ra7lBz3T2vtB4GlVcsbOaMSo2f9QHmdi2LDxvVSQXa1S9JaFxic1
	yu4Vbc090zXzUJvIWu8CSkMmntXGo4IQmbg979fukpETFt8+i6ILxpHFvFknuWHv1E1TsnXHsGL
	vsS+9L631k8M2NRvJAJ7bYAaNW0J4Ll+lAxNU/55YhzpNXQjL1mpUpnFzeykftnc1BpivjzAg==
X-Received: by 2002:a7b:c30a:0:b0:49b:8c63:dfdf with SMTP id 5b1f17b1804b1-49b91c5749fmr191750615e9.15.1788048951616;
        Sat, 29 Aug 2026 17:15:51 -0700 (PDT)
Received: from ideapad-amd-linux (host-79-43-65-53.retail.telecomitalia.it. [79.43.65.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b49cc61cfsm269974105e9.6.2026.08.29.17.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 17:15:51 -0700 (PDT)
From: Jacopo Labardi <jacopolabardi@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Christoph Hellwig <hch@lst.de>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ntfs: fix FITRIM range alignment
Date: Sun, 30 Aug 2026 02:15:36 +0200
Message-ID: <20260830001536.30841-1-jacopolabardi@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_trim_fs() aligns the start of a free extent up to the device discard
granularity, but derives the discard length by aligning the original extent
length down. When the free extent start is not discard-aligned, adding that
length to the aligned start can extend the discard past the free extent and
into allocated clusters.

For example, with 4 KiB clusters and 32 KiB discard granularity, the free
extent [4 KiB, 36 KiB) becomes the discard range [32 KiB, 64 KiB), so
28 KiB beyond the free extent may be discarded.

Align the absolute end of the free extent down and derive the length from
the two aligned endpoints. Skip extents that contain no full discard unit.

Reproduced with a 4 KiB-cluster NTFS filesystem on scsi_debug configured
for 32 KiB discard granularity and read-zero-after-trim. Before this
change, FITRIM zeroed seven allocated 4 KiB clusters following an unaligned
32 KiB hole. With this change, the same data remains intact across FITRIM
and remount.

Fixes: 11ccc9107dc4 ("ntfs: update runlist handling and cluster allocator")
Cc: stable@vger.kernel.org
Assisted-by: OpenAI Codex:GPT-5.6 Sol Max
Signed-off-by: Jacopo Labardi <jacopolabardi@gmail.com>
---
 fs/ntfs/bitmap.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/ntfs/bitmap.c b/fs/ntfs/bitmap.c
index b1436b3151b98..1840b7d84c628 100644
--- a/fs/ntfs/bitmap.c
+++ b/fs/ntfs/bitmap.c
@@ -64,7 +64,7 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 
 		end = start_buf;
 		while (end < end_buf) {
-			u64 aligned_start, aligned_count;
+			u64 aligned_start, aligned_end, aligned_count;
 			u64 start = find_next_zero_bit(bitmap, end_buf - start_buf,
 					end - start_buf) + start_buf;
 			if (start >= end_buf)
@@ -74,8 +74,10 @@ int ntfs_trim_fs(struct ntfs_volume *vol, struct fstrim_range *range)
 					start - start_buf) + start_buf;
 
 			aligned_start = ALIGN(ntfs_cluster_to_bytes(vol, start), dq);
-			aligned_count =
-				ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end - start), dq);
+			aligned_end = ALIGN_DOWN(ntfs_cluster_to_bytes(vol, end), dq);
+			if (aligned_start >= aligned_end)
+				continue;
+			aligned_count = aligned_end - aligned_start;
 			if (aligned_count >= range->minlen) {
 				ret = blkdev_issue_discard(vol->sb->s_bdev, aligned_start >> 9,
 						aligned_count >> 9, GFP_NOFS);

base-commit: ac727d86fb84bdc9626ba9c756c26767459f3083
-- 
2.55.0

