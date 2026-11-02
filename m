Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793648430;
	b=bcJwjLPTETSVAyMhUQ3jmYzbekVQvmruYLvzCeHEL+5dWbMuIDaMIwtWKNFrth0KWtTs
	 6d8kgiN7b77j7vSKjbEVqveKfh834xfqA78JpkB/rWF/rjnJWQadd+9ksE78fsVenm2uG
	 0XBGW9mAdq7r9zEgGH2prWbzgPF+ilwQZ2yyhq3NqbgmqVI/MdwToxKuIjAqAZ10MbMrP
	 AtEVxbA2M+sHug7cs0DUXor24GhVfWofO0nzlcy4w5sNl48FgtN26AUK8GbAOmOJViRCF
	 My44wuh8Wy600ojtBUV61cRd+jYj+61H8VTem3asCnXVcxpuPwnSYe52O3cSXw3NCNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793648430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=ZAHV4AOSytaNVCMWbh36iatuZvGOCaiBEcBiUAm2wlE=;
	b=QHsinyHLRHlfwabN7kel4H1i19l9UInLMEPSRwj2sHLgAx27mB6+BFrrlszyvvcaKdt8
	 sVfXrl3QwePehIE1zkOqEKc4PWYM5PwTtTQzA7AL3x5wDtcPuP4V/EpQVIs7sXRAgwlfa
	 ZBQAFxA1AxfcqzGE92SGCGfQS5ubvcCoGumousX0Q2SxqaZAOrsGFPnBhiZYPXHZ6bSGi
	 yF/WiohS+q13V/fzpwLhQAkPZglQlckXTqu+exvONFjm3AhI6YL1WyfULRezvEx+Gs7LS
	 z+C+Inw4I4xmE4qdkI+3S/x1ptNrkBctMQjN1c8mwcK02qqFxDNcdZqaFAUAAjASbiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="iNUks/ue";
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E336F606D818
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 19:40:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E336F606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iNUks/ue
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a089dfee18so2191961b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 11:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793648429; x=1794253229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZAHV4AOSytaNVCMWbh36iatuZvGOCaiBEcBiUAm2wlE=;
        b=iNUks/ue+4rOzOXZFuywBxQdL6ZnM15aenSVgv07m0ygvAgcDwsjjzlGq8/TsdcRy1
         ATUQGsQNq7d+4a/nd8dWkRbp9LKopHnpgGWD2/gBX73MxyJJEKheLEkpBg3gk7xcjQse
         gZgszdfvVrs2t0WpxnefEPcjuMuOanu78W2yQW0t9HUPDyA67P7XK/FWZAapwZA3woTq
         jptafwxb1OwH77DLr7dvQt+i4metg1Ad2gMoqLCgODwYuwVVo/pCyI09nJ0dAEdH0K7g
         9a8V7vX261N+Hgy489RCQELxo3H6YK1vl5RIJQzLONPNVCewtimtH0ddbW96wHi/khfE
         BVKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793648429; x=1794253229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZAHV4AOSytaNVCMWbh36iatuZvGOCaiBEcBiUAm2wlE=;
        b=kjSNS4WJtXpqQcWMYc6r5+hhp5SlGjj449hVFDfA4pGUsV9nzPUA/ZWy4AgnvOaUhc
         49sVzOe8gjnxMOI0oFUatMdZQxeqGBoFCFsUPYON1Nw4RYWHX9NSMHa95xqLdLVs0NVo
         Ivv+qICGLaK2wuOXsU0H5n0QQEGkud0y00SQmlMwUuhv5+RmhVCHPWj3IgF2YaOq3Vr/
         9kTs5pcCqj0AwuaI3zqdn85whdBy2RXjgSwaIPySn0NrrUBiOsvPE9fEl+KPq+OStm9f
         3BJO/ZHlREc4JEbwjanjSA8aMroi2x9jLm/plt7QI52EpQeIcE+ZHKwhnZGe4HiLliop
         vMOA==
X-Gm-Message-State: AFq9FYKXLxKwpYSUxXTOdgiPVnx9EFC1HBz/iMAYl6V7X8RUMtR9PBIB
	tE5atr4WBfqfdm54RPsVYQxTHbmTQ54Os9RVUh+q7BLXW2qr7PJRIi9MjYZXHl2X
X-Gm-Gg: AYBFou0ldhZwtIlr/cCiug2F0qwFpAcizjR1aeC64hWVn+dzjSaImj+20D2+qT1XtCQ
	Qkb3J8WO3SFxGw2+NNlt5IlVnfgjxX0ebgEAuqTSrZElscgaYAOAn70LLzvJdSgLDPGYFi7wciJ
	zHThuBag8E3oa/uALJBmbieJW3NKksT3MsFV+pC75HKq0EzYQx7LU95eApDdRrZ7YBClyDP8R28
	12evYh5rOZ9BGL3qAO/g8zCoR9YwyCl3gHvmTU2go65M32q1ikk09+uLmXz35mfeEekBYyo+R30
	bl41STE8OBiF5N0oBjKARtDOyl4rWfXcdgzQ3EAVVCV14FcZDtZFRhobos/Zv7znltpKgx41vjf
	Z98BZ8/V3/ccEm1BDNY+B/OAVyIhX9s3Ul6PFvEsIchv8Hfpko/iujREJvg7hN2U+iGtS8d1eJe
	1EYBCC8mnIZo8Zww2wEBL5GIl2X5/qLjOLVpYLOQTglJ59j/bwoq9jLtRCdEJbAFY8NZ2S+Fa+f
	4kxtSVltB91OXlJlfGRXywR1DfLHaWL86rHgNEHmAGw+XxNskOgGMtw3GCQibJGnyO4YOQllbGi
	zRRMpezn+9jQe0e0FRgZNx0Vc1x/uhS0kj5+bCOYy6y1nryipH+ZMBU20xdmW2dKgIz2+2QJ5jb
	yHeKP+Jg/QXsGg1tFcKVJGH00NVOuxT/tMT/lySoU2wOBgg==
X-Received: by 2002:a05:6a20:3ca5:b0:3e2:8c65:b229 with SMTP id adf61e73a8af0-3e913ae6ea5mr12470406637.11.1793648429145;
        Mon, 02 Nov 2026 11:40:29 -0800 (PST)
Received: from f2fs-test.c.googlers.com.com (193.67.125.34.bc.googleusercontent.com. [34.125.67.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb364c48d4sm241826a12.27.2026.11.02.11.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 11:40:27 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>
Subject: [PATCH 11/20] f2fs: support subpage blocks in move range
Date: Mon,  2 Nov 2026 11:39:43 -0800
Message-ID: <20261102193952.3002018-12-daeho43@gmail.com>
X-Mailer: git-send-email 2.56.0.385.gac671c819a-goog
In-Reply-To: <20261102193952.3002018-1-daeho43@gmail.com>
References: <20261102193952.3002018-1-daeho43@gmail.com>
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
so that faults and readahead cannot bring back stale data. The page
cache was not truncated before, so this also applies when the block
size equals PAGE_SIZE. Remove the -EOPNOTSUPP check.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 45 +++++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3ef810653bb2..0fad86267256 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3501,17 +3501,6 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
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
@@ -3521,6 +3510,31 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out_src;
 	}
 
+	/*
+	 * Hold invalidate_lock across writeback, truncation and the block
+	 * exchange so neither faults nor readahead can repopulate the page
+	 * cache with pre-exchange data.
+	 */
+	filemap_invalidate_lock_two(src->i_mapping, dst->i_mapping);
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
@@ -3534,6 +3548,12 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 	f2fs_unlock_op(sbi, &lc);
 
+	/* the exchange may have extended dst past its old EOF folio */
+	if (i_size_read(dst) > dst_osize)
+		pagecache_isize_extended(dst, dst_osize, i_size_read(dst));
+out_inval:
+	filemap_invalidate_unlock_two(src->i_mapping, dst->i_mapping);
+
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
 out_src:
@@ -3588,9 +3608,6 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 {
 	struct f2fs_move_range range;
 
-	if (f2fs_has_subpage_blocks(F2FS_I_SB(file_inode(filp))))
-		return -EOPNOTSUPP;
-
 	if (copy_from_user(&range, (struct f2fs_move_range __user *)arg,
 							sizeof(range)))
 		return -EFAULT;
-- 
2.56.0.317.g454f8302e1-goog

