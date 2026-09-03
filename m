Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBA12AD37
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 23:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476770; cv=none; b=GuzQkDkCWcU7byGVpbfPWzNyGwqq9FSiErQhZMcCPuGbS/ihhEREpp0rNh/YqgMXNEG3YW3ERvuxSHR+clH9urITXZyCaDgt0xNd8zENT8ACko9sSrYIvLDohD9GrkOZtIHiihQQO32OGdNR6SPCCEKbEpWRJ/wU8Kp6sva9YAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476770; c=relaxed/simple;
	bh=MxdONtZ4qXs9+6weX7FcBID+xHRxM7khKMFZJyMwTzM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SKhR3gmij/Yr1Lru1Lt8qM4SZ9v0VQllwwnhWBtkUQMdbrnR5EeNyfZ0ZKcXxL7CRcx0uP+mJPBbJ8TOFac/eXMP04/qCbGhVQhz8IZoap578dFLeNqwEBSn4EeQl9nrDaYcAsU13LxI1xl71X0unN4XnMe4GL14V2FyB/RCGyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T3ifP4Z2; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T3ifP4Z2"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cb5b8572b70so554834a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 16:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476768; x=1789081568; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0byPuk5ss0w8gPStks6iC7C9A3PMDT/7QIWY5qOJydM=;
        b=T3ifP4Z2lNR6LZAWa3NuWlrmI46XwTwcQwEtmTI8/gVpjcIEg7qgrkA+R9zlbmnfRU
         RYR1QRt5blB64HGZw9vdavyQbUbHA/lGHpadjl5CumESi/QsXxPjXc/K4FgW96QQbMwf
         xljiju9N8OPxqm5KgPNnYui4+nPqS3ZddmnXk9zSb1bgaiKLh6AT1YZRkQYXOd8XVcCv
         9zjePY5iT8peblB1b4z8Ue/087RwHLSvqD2SVZciB/GzPAMP8hjhG73XUJDlvX9t7Ag4
         WMWtPUyxsp0fQ+vE4InvpXnQH6T2WZM7HXoQUvVR+PnY8+ZIiOXyrzO2pZdCvU9KePdc
         07ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476768; x=1789081568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0byPuk5ss0w8gPStks6iC7C9A3PMDT/7QIWY5qOJydM=;
        b=sVm3ptSiiMqg5EiA9yZbCJt0wo5BtqL4R8Ff4RB7U/jlmvM/1dWH+eqgYYip5TBvrc
         EoJl694DG/a2xkUB9EsJDrw2GR0NMRyV/lO+EZGyX/TszzY1XR1T/ojiyvMuo8du6hCv
         g2dj5MWsxpkjKjOLXo6QwqwM9vlKHzCJ7Il+LlnjJvbOI4sgoBQPN9oZL0KNR0XIVO9e
         8qZJDCLP60cIUZY+YIdveBUodoFmpu518zbsPt/MIcQ7NXjc6tYhh72qpfNgyDo/B0Q2
         WKOScomJQUilNc7GhTT8HoAM+hon55EiVUaKc5TaUqqScF77s6UjN8JR8xdfb5Xjex2t
         Ll8A==
X-Forwarded-Encrypted: i=1; AKwUvBzVOn/xzqX8IjPgbWOzk133IK1OgjS2zIgEY+H8eawS0vJfiSjWkoM9r3QtAnFDAgkcgGYdbDTD/4GY7bk=@vger.kernel.org
X-Gm-Message-State: AFuF++ml2RFS2kI2vxMPtb1bS9KFZr692GfyycMxGGerCUuBx+hb4FH5
	30wNWGIGgcfkSvIE0yNrq3R4OK7qVmr2G9pWQueEbDQYhtvs5gH3T6U5
X-Gm-Gg: AYBFou2tqc2iqtomLuGKu7JZZN3IFojPHdvV0ZH/Pcilv6SVpM6PQ+1KcFNVFQT1CK7
	GjiQfxtpkzilCfsDPsAnkCbp37AqvSk0yhBEDMC2A7OnWNTCIknjqh3BxNR84ujwN7TPIVCWGPt
	5HbZiBihNEl+xJYzPKhXeNTZEF9fBI+w68+e6Hs6qvU4YlX2n+1wLPin/3NGtB95HNfvWAGeGmD
	cHnaqFVhd1fpxEbDniZlrF7My+o39AMFuVbfb4j0VisrbYcgUA/lj1WhJ8SjeBvgBhC3Ly9UKyA
	9CslHgjX6bwO8KuUHFDwBqWyN5kDMiEQqI/JDAM9NgmPZQm2JLAZ2JhVUnJ/rqk3y0K4Kc70Q/q
	lZ19B33u9YImf3nzdU3m16UvJoku3GJZd3We4kUGFkoF/mGxmkJ6XgIdKnDq7+TdHqk/fhwkD3h
	mBisFSmme4aEdlR2lxmi1uwCYNUhgE9stYqaQTO/daLAWdgdoqqdBJSpzmtQNkf8vGykfeOA+6t
	DUH8A==
X-Received: by 2002:a05:6a00:2289:b0:857:726d:2e99 with SMTP id d2e1a72fcca58-8616af5b1aemr3118130b3a.22.1788476768342;
        Thu, 03 Sep 2026 16:06:08 -0700 (PDT)
Received: from [127.0.1.1] ([2601:647:4184:b3f0:29c4:4984:db20:3bb4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152c2a536sm429263b3a.31.2026.09.03.16.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 16:06:07 -0700 (PDT)
From: Kelvin Zhang <zhangxp1998@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>,
	Daeho Jeong <daeho43@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 01/11] f2fs: initialize sb_info early in f2fs_fill_super
Date: Thu,  3 Sep 2026 16:06:05 -0700
Message-ID: <cd63b907d18ebef2f8dfa3c843d008c27de4ee8b.1788476500.git.zhangxp1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788476500.git.zhangxp1998@gmail.com>
References: <cover.1788476500.git.zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, init_sb_info() was invoked late in f2fs_fill_super(), after
processing superblock error tracking, mount options, and sb->s_maxbytes.

However, read_raw_super_block() reads the superblock folio directly
from the block device mapping using folio page offsets. This makes the
initial static sb_set_blocksize(sb, F2FS_BLKSIZE) call redundant.

Move init_sb_info() to execute immediately after sbi->raw_super is
attached, allowing the block device block size to be set dynamically via
sb_set_blocksize(sb, sbi->blocksize).

This early initialization also prepares for upcoming patches that add
dynamically computed filesystem geometry fields, such as
sbi->addrs_per_block and sbi->nids_per_block, to init_sb_info(). These
fields are required by earlier initialization steps, including mount option
consistency checks and sb->s_maxbytes computation.

Signed-off-by: Kelvin Zhang <zhangxp1998@gmail.com>
---
 fs/f2fs/super.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 253a579e9d5b..c48acfb30a0d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* set a block size */
-	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
-		f2fs_err(sbi, "unable to set blocksize");
-		goto free_sbi;
-	}
-
 	err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
 								&recovery);
 	if (err)
@@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
+	init_sb_info(sbi);
+
+	/* set a block size */
+	if (unlikely(!sb_set_blocksize(sb, sbi->blocksize))) {
+		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
+		err = -EINVAL;
+		goto free_sb_buf;
+	}
 	sbi->max_atc_write_bio_size = UINT_MAX;
 
 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
@@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 	if (err)
 		goto free_bio_info;
 
-	init_sb_info(sbi);
-
 	err = f2fs_init_iostat(sbi);
 	if (err)
 		goto free_bio_info;
-- 
2.53.0

