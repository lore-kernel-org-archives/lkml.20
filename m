Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D1D63859D4
	for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 17:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788025770; cv=pass; b=XyGEEd+qQlqCDRbXAy8k0GGHwjTsb0PMAaiJAcHvV9RSE5dpleYCo0CUG0I+tlJJzHfMsWUp0xYzw9FTGvoRIrvd9qN8PNu+wdROncJ3J0BH5pu9rLbjQHVWgIaJjqnOdiG+gU+Wy8tMCtsm0i85/obHFF8dkIB+yeJDGRDZDE0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788025770; c=relaxed/simple;
	bh=MXFqWr7Uky0TUxYJJ7ciGR+LjTO2h6aLcYNxNAXrW0o=;
	h=From:MIME-Version:In-Reply-To:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfvIotWJRdGfqgTuXF8sepiGrlCKE4EC/UFveBjUVUDANu+cp/YDZDalc1XN1Ddp8ozMqsqjTEsEFaBj9cYFMoDsbhyuffzwJ7KWk9TlWpnQpiW7f/6vMWZwEvPcUNuGQCfKq7pC1Ft7GkhZBnUVx1BAOJY4GvDScHSDHbP+CWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXGxxdOM; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXGxxdOM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6a600a1caf8so3238071a12.2
        for <linux-kernel@vger.kernel.org>; Sat, 29 Aug 2026 10:49:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788025767; cv=none;
        d=google.com; s=arc-20260327;
        b=B1EJURHOOlildLQGYpR7dD0nYuSiPvq701A4eOeB74ZmNAPKdy/2EogsOtJ/pyYXL0
         iXcYD1SE9HWpsUMSwyhfEGWlR00BQlEfwxrF2C3i9fgx4U1gZXAbldmBnX7ATdQZ3fKK
         rOQFz9py7wY3NmMohOle59HR2VSj02lMkK5QBa/P+IxZvXpIqoR2ZkJCkB6eXjyPz+5b
         95xbWggD/x8ga/xAMSs3rnMusAq7lcE+7LKE7oiIZWtcU+AP3Fghb/q+EJnAVHDj7Xfr
         yoNB8t1CRI0xIm2GHl15Y6QZSWH6ZsDrPSgtLobEV/unzpTgG0a4qUzOoldeCClKMWHE
         NCFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:references:in-reply-to:mime-version
         :from:dkim-signature;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        fh=qJH79Wt5rNgBT9a76iKfSTnjqhXzx7H5lAvM/0XLzlo=;
        b=RlC03mU96L25BvARseZCJLYgiwGIf5ABGA3ryb8whq0uORBXzxm9/7u/Ih90+fVKD1
         JCg4Ptggh8969fg81TimE8eW02lyFt8D1R8Wmkx4V9zZ4uvcNfWmseZZWUSTZ6tleXfD
         vQTuLN9mlDjuLkd7VjR3+t8i7v9AAiwwx4drFj9AfFitK3cC1NHYAUzp2prMQk3Uqbu0
         8Pb3QZq6WWObDpoNv/3ESiyV6NkOpSQ5NnXiD8+kRY6PjkNhGZykx5fJ5s893C5xvndr
         TFM/vxdX6dZkOZJAo0UTD+FtmQ9JhhrxT6HuHmFjEMZrGJmLvfd34GUNtj6FRw17U9pL
         XAOg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788025767; x=1788630567; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=BXGxxdOMvCMYkVlC20CabLOWUxd39irk35iwpQjlw/rFAR1ayYccbkQcJUWZU5T9/N
         /yKHUyzDX0QX52EcVhTyJfnrgGXF05hPVZY/OsduHZ77bDr1t04BuyWQEdGJ6GOZmDVX
         pr9CJe+9SCpOZ9aRL871ZKN4u6iMiDLYi1lZB1uSd0hpKbEYM6iiAT4YMFC5EnR2QMYT
         4bObScJAGxikogKIQjThUCNA0JCbVzetE+BhFSBMI6WMT11ImI2NJYqExUIQAINCfDaG
         c/kdLMwn2lVHejt8iEypHl7+/c2NWI3b4gHwWQLXfOcxzRyv/Q8myjbKgCKSV3Qccxks
         80ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788025767; x=1788630567;
        h=content-type:cc:to:subject:message-id:date:references:in-reply-to
         :mime-version:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C/Ut8igNUUEDDCrdtbCLiaGMVpNyyvqtTQshGja4fhw=;
        b=OIUESAoPQZTElxkTKlr7kd4BhOZRpInJP6BDg21UANxMDnnMryL2cYZaIK+nQ+bTcU
         HhuXeMEbCJYBOENmo3jZcDmYNaEP2A90+dxWsLD+EktQtfKyQTMxzr2mHY7IDiLuJ9vp
         SeryCfXraMH+xaGCsxckjdHKM75npODfsjRyD0pb0Ggd8RIoSM5K2Z5QaWmIY5nzfVFm
         UG6EvrtRFF8y4SOqwndbmjo9C+OEm+pOuGGd42oc2fjVE/ZSOQBKV3LonY6BTywZqAMM
         lAGsdhieOhxZ89xPqwSe3NZ5/VyQtugTYnObuBzqu6/aHOMQ/qy+RVFFv///G6flyT+P
         2dIA==
X-Forwarded-Encrypted: i=1; AKwUvBx/AezFY+mt31tSPugUdIRO097lX5uSABdOmER5ZTejv7tgyKStwjqmbl+0Qug98yGtDyjqZ8niA8cAv+4=@vger.kernel.org
X-Gm-Message-State: AFuF++lFd/BCXdwPd+CZEZpO3hpZY9aqlRCuIAAWDaMB8qsXCpyfiObl
	jYTvoqqBrU06S1M1knv96ozXaZ+SptI/6sLVkO4I+AwZMapnUQIFi/WSYYlba1SgS/kqye3gBB1
	+U3+exM6X2RG+HBiDW7dLacRn44+kmC0=
X-Gm-Gg: AYBFou0qffcMa5crDmNyuaLgXMo6p63lKALq1kDs8qIHnTDlps1YtLBgCtbZOu3egIx
	/otIhAkgEGalb38PFtbtNS99rxgVC74v3X5vWDEKFoE6UrYB+hXy+MfwcbOpblPLATPnRXOE68l
	QFjJQgfwaFh8/zPKQpN8oJNHOo3VtZgemxU+YPc/vb+yjTn2R5YDMamGDPrt6W6lkRjTN8rINgW
	dW6hbMBicxXxMjwSyYhxF20YHBkzz/hoM9naFbAbs3kzQDy4U/blHkATYa8PnLbckbnceTkkAUB
	xAADDfeJEjWLWXQgC+NJN/4PiKYIe1i3vbNnUJato3r+LVDTBkrwf8LLqLGxDoW3HtoRn477t+j
	A1w==
X-Received: by 2002:a05:6402:2354:b0:6a6:32f6:10 with SMTP id
 4fb4d7f45d1cf-6a632f6018fmr2135352a12.22.1788025766571; Sat, 29 Aug 2026
 10:49:26 -0700 (PDT)
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:26 -0700
Received: from 637551599889 named unknown by gmailapi.google.com with
 HTTPREST; Sat, 29 Aug 2026 10:49:26 -0700
From: Xinping Zhang <zhangxp1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
References: <CAH=xXfHWW_J92z3YgvoLSx8+z6rekq=p2kiP15KE9=2+Ju2RjQ@mail.gmail.com>
Date: Sat, 29 Aug 2026 10:49:26 -0700
X-Gm-Features: AcwNN1VPFbUxMZo0vv3M1b072VLJ8ALxYO_nCN1eu9bWQAa0bdENrYB8eDbqABo
Message-ID: <CAH=xXfFTThTDXpLX=F3j1Nmj8ypViopBLSRkwAvX2wGJ5wkaQQ@mail.gmail.com>
Subject: [PATCH v2 01/11] f2fs: initialize sb_info early in f2fs_fill_super
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org, chao@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

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
index 253a579e9d5b..2d9f5b77f815 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5125,12 +5125,6 @@ static int f2fs_fill_super(struct super_block
*sb, struct fs_context *fc)
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
@@ -5138,6 +5132,14 @@ static int f2fs_fill_super(struct super_block
*sb, struct fs_context *fc)

 	sb->s_fs_info = sbi;
 	sbi->raw_super = raw_super;
+	init_sb_info(sbi);
+
+	/* set a block size */
+	if (!sb_set_blocksize(sb, sbi->blocksize)) {
+		f2fs_err(sbi, "unable to set blocksize %u", sbi->blocksize);
+		err = -EINVAL;
+		goto free_sb_buf;
+	}
 	sbi->max_atc_write_bio_size = UINT_MAX;

 	INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
@@ -5217,8 +5219,6 @@ static int f2fs_fill_super(struct super_block
*sb, struct fs_context *fc)
 	if (err)
 		goto free_bio_info;

-	init_sb_info(sbi);
-
 	err = f2fs_init_iostat(sbi);
 	if (err)
 		goto free_bio_info;
-- 
2.53.0
