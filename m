Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793693459;
	b=UWxHsG8Ij1wY7QB15tf3KiRXkzroj7hYoEN7S8F+xZl01Fp/3QuJRVrVZSNHOuCgk3Lk
	 oFu4/Ro/hVhJBSM2+acVKq1eESZoHF4LOE48547uUF04uyix/y43NjCoKBp+oBNWRrNsc
	 qNT17WUoNYUDUKHWkpLG8n5jXElueBA5//vSpx0yX3wCdcbgQpdPcC5dce1uet+u/8p/w
	 58K6LdDuAQID9CHuTmkPZbcvl29+4fxGbcjeFl9rShWaC/RCFkpwEhMMS0Vn21vz9YksG
	 0dl0/F8LCfsJaWq1KD1K9MR1JcZl68vYflNZ5wln8lgJISNxfhHU5gyzbsxzc36yWOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793693459;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=OCBEogtd4WQ6NFtESpTyBkJzNayzM85qVHDRTKTymcA=;
	b=KyJ/V8NtL7dusEPUl+OpUwkID1jANezqTzB3+VCR2NKsoQGbJ0wOD0mBn5gLnHzk/9VN
	 UlkRhUMvf/ZMDI3AERoEqCd39iUXQwaaCPnyMGa7St8DNuILMLlbmnmtcIwtAoBQyFwAQ
	 ew4vb+M8LAjo//6zdDN1Vke141HZgier+UGtXHaB1hwUx6oGWtt6/UObbQ3MFVFg1G8F0
	 ERXHjf20rGvPKyenmr1C6gVP0NpZigzWX9bAq98KLL0PRFUTKO8AurkZDDUfCWDM7kCj9
	 jiEmQldeZY8DrPdXx140grKpDDFJ4qkoggaBKXi07tFJpkJqHdaaMk18DlZ5289R6UA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwIpZWkd;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64BD7606D804
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 08:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64BD7606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iwIpZWkd
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-3678f64d078so5877777eec.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 00:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793693457; x=1794298257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OCBEogtd4WQ6NFtESpTyBkJzNayzM85qVHDRTKTymcA=;
        b=iwIpZWkd/OIVCNYDKv/ylUfUbC6RRjGeOfXP+TJDBfgUTZYPifM7e+YeHVHoaxgV06
         27Zu7jZqrCgKe/0hb9AjB/DCdFPCeaXPrNqcn755+x8CMHrj27EZr29LL5aiYZMgkBCf
         5p3nCi/0rijZhRnj5rTfwpJmGaMeNdLFyZboD7UOiCa1qdyjlkMvmMkovmipe1L9LaFA
         U856VuuPf5w9JD7un/GhGqPTCFIdWS74vSddSxP5l5BVPwGsxi2227F9uBJUG8NV7UXD
         h0q4A92rR0G9wVXLgAXMzzyH/LsGJKPTtuahj+b1O0YDfk0ulWH+7wbkGRUV6PD5/ZT3
         a+qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793693457; x=1794298257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OCBEogtd4WQ6NFtESpTyBkJzNayzM85qVHDRTKTymcA=;
        b=lzaVGZBx5tk3U8XfjwiurqQP592VrVJFz+HbK17TT2bjhwGpoEdNq6xDM9qtS2ggOB
         JXB7lDo1c8v8YyefidJMDXadAthq+2L8Kxj3jS2lPukSS6Qh0Mu4PoleIxVr4sdeQdFc
         ly0IR9QNl+7PSfOUbq9TJTQk3TOdYls10/9xfOcGarE36qlqbvRHj498CbqNkpTMyD5q
         YeYXBC5DGcMekeeBpKa+Dy7VC1iTdyTDHMaoCZUdvgkg53KcMVQ6bg9+dGYWfO/sWwyB
         NuWN7UgAzR+xyz8TRga53aTuwN+m3XIbQemOT361jT2QD/CIL5QTlD5TFuCY2FpHyNd3
         oj9Q==
X-Forwarded-Encrypted: i=1; AKwUvByIGfBNY/gomnyjczbh964qO6QDHs8sE17xDt7ggw7p3l5iy5MKwpjLHr73V6J9Z0mIJ7RhS4bWJ3wnllM=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Mcl6LE8304VMIQcw869o8rSE2Jpq5QTAsDl82W1M8DBCekEr4
	jthbizwSAtfwtpzNDUfKYEEQZ16nhQg+PkUn/vSp84oJCviQDxP7I+9u
X-Gm-Gg: AYBFou3XzRESAoDEITP0vh7O49xzbsQJofHdCNsP1dMxV05WmPtCIB1peOpf/Ra2dan
	C7CQdK8qQUr8T0sfpj6cBaIzbM0TqRuRdtmXSQnst2lbQq1SpGjT3gAVFoy3fyngrNTUV/o4kvy
	s+JqjQYBaSwJtEKp03H5X9bT0OeBcnqAx4Ygm3YdppbktnWB8WLPN7uOW3UhxycqsWBAMXh+wnN
	YUtdhqczTNwSNvDQ4eGf0trxbzR4/sGGjyHMNCw2wyslCDS8mkvGPE3hq6xdPKWe1QdslX9Uqaq
	L8tSJ1t12nq5QfltdZQrEBAfPLotBcyQXYbpPJ2n06LKpAf6rtjYet39gNGsPkxFr7dxF5C/0pZ
	6kKZttbeRBPfFAm3uA+mmLCPC8h1I12ul247Hgf/kGdTRUxjFBOtYqDMJEqGVpQtFDjk2zuvKVJ
	Yju0LB0PJPMD15cHkUvqMaUDfqkOdqZc8t/bneCVW923anJDj2nqGUORO2a2UEzQyPLTutDsgP1
	hqyUE+KVDQ0eihpkcCS5f/lmk9L3W7HCvYHmx9LMN2l/2YGpP1xcBmdtNzLPGwJE2S8sYuiJzZB
	M0VPkfSA7KsfnU7x0UMFnnCTQHGDaumAouovaoYrlh2wjfbAwznZ32LX
X-Received: by 2002:a05:7300:c39f:b0:366:6644:2839 with SMTP id 5a478bee46e88-36a42203e90mr19153100eec.3.1793693457451;
        Tue, 03 Nov 2026 00:10:57 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36b13bd87b2sm4621906eec.28.2026.11.03.00.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:10:56 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: miklos@szeredi.hu
Cc: fuse-devel@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	shawnq1@163.com,
	jamz@amazon.com,
	stable@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] fuse: clear the old EOF tail when copying past EOF
Date: Tue,  3 Nov 2026 08:08:46 +0000
Message-ID: <20261103080846.55656-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
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

__fuse_copy_file_range() invalidates the copied range before updating the
destination size, but does not clear the tail of the old EOF page. If that
tail was modified through a shared mapping and the copy starts in a later
page, the newly exposed gap can contain stale data instead of zeros. A
subsequent writeback can also send those stale bytes to the server.

Remember the destination size before sending the COPY request. After a
positive copy result, clear the gap from the old EOF to the copy start
before publishing the new size. Keep the existing invalidation of the
copied range. Apply the page-cache cleanup to non-DAX inodes and cover
both write-through and writeback-cache connections.

Fixes: 88bc7d5097a1 ("fuse: add support for copy_file_range()")
Reported-by: shaos <shawnq1@163.com>
Link: https://lore.kernel.org/r/20261020003429.1009226-1-shawnq1@163.com
Cc: stable@vger.kernel.org
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 fs/fuse/file.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/fuse/file.c b/fs/fuse/file.c
index d5e1cb53d86a6b35e63ca31b1065068ea5bdb6be..d3fa2bac9903acbd15cdbe9483fe3605f7ab5da5 100644
--- a/fs/fuse/file.c
+++ b/fs/fuse/file.c
@@ -3000,6 +3000,7 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	struct fuse_copy_file_range_out outarg_64;
 	u64 bytes_copied;
 	ssize_t err;
+	loff_t oldsize;
 	/* mark unstable when write-back is not used, and file_out gets
 	 * extended */
 	bool is_unstable = (!fc->writeback_cache) &&
@@ -3047,6 +3048,8 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 	if (err)
 		goto out;
 
+	oldsize = i_size_read(inode_out);
+
 	if (is_unstable)
 		set_bit(FUSE_I_SIZE_UNSTABLE, &fi_out->state);
 
@@ -3087,6 +3090,9 @@ static ssize_t __fuse_copy_file_range(struct file *file_in, loff_t pos_in,
 		goto out;
 	}
 
+	if (bytes_copied && !IS_DAX(inode_out) && pos_out > oldsize)
+		truncate_pagecache_range(inode_out, oldsize, pos_out - 1);
+
 	if (bytes_copied)
 		invalidate_inode_pages2_range(inode_out->i_mapping,
 					      pos_out >> PAGE_SHIFT,

base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.43.0
