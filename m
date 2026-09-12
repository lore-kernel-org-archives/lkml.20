Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5389315A85A
	for <linux-kernel@vger.kernel.org>; Sat, 12 Sep 2026 02:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789181840; cv=none; b=OJtfSMJdu1Qzuood8tNB13GieRzIX/he9/OZgZupKHaz6uNk25OUgukSC9HAKqs/ganlyCpc3VLX4loaSokuOVdu7dz4NLgCBYPY5GR5T5pfboWmY7hGEb/4g5dOM4PQe2+H9RYY3uklmJjqDY6bG2kL2F0IPlFM4FdVlAeKc6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789181840; c=relaxed/simple;
	bh=aRmA38fLQQW2la5to94eGZ+mEq/IwIZqpvXOmzW5gd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iZdN0wFSuIpq4hZaSz7z6GsbPRoN7lPpfTfrwOn4MB6GSGYfYgBTAU2xtU3FjzCv/hQLLL5sLUly6OljnoRh9xMBfHrLRzXPCqfqfGvWjLlY1PXI+dWXYAmwb/uloarw+sgrUpu4qTB0YoboNteWTeFlh0WcwaU7EDKquyonp1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DJnFP+Tw; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DJnFP+Tw"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso449397a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 19:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789181839; x=1789786639; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZChHh/4B9HUVQ4ZUWlKc1VE04E7v5RYeUYSFt/vXmVc=;
        b=DJnFP+TwUMf3OQ/1SkbSsht6aAllf7t7pm79Js8JrzK/Y6EPJmPkpdD7fE6gCqqF3x
         B7rgPNU7Ifea3o77dhw0zTJBZDvg4DK40FscjvQ0ShVdFnAPiGJEu/Pk91hsQYXE/CSd
         D7lR3MwUfd9ZyZhwEst1Z05D1PMJ6fx87vvSWmQlW+iQLxLvgEajdmCDg24j03UH/WNn
         FPEmXDrE2UrP78Dx5OeLesrWrfPxKyOpzrMBnvrx8w61dioSBmUFmBSFX0BQpH+kCnRR
         fPIKtPsTkaW+rSXRAmr6zm2ty7l8fYzEgFw2LA3MQ9mx0FeAgx3TAZkUAsBRVkc8EnlG
         IyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789181839; x=1789786639;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZChHh/4B9HUVQ4ZUWlKc1VE04E7v5RYeUYSFt/vXmVc=;
        b=jBMLz4I3aCJf+CX6Gcrui67uBHs2RGd3pKyXAty1D/CtkIddTKWTrHK9O5fZqeUMFC
         Gk+JdFPTPD8LrIvYAGXhI8IRz8IHoc4OSqseOrYz7MPJvkWd2+oGlMNXO4V8KLd4Y7cT
         4DIAWl4xxHETHMGA9JlwqrhGPyCLXfkBdn9L6ZU53aaqM3Y7GrTzt/M8KCnWIRX5qsr9
         A83ToITKqLAUsybmiMdKvmfqhtnTDbjCtEubq6A8UaRoy4kpkVMC5P5c52oz4vjbU93s
         3dOhe8ad8zae2nwi19NRdz2OBpdXlEJikrnnmpwa4Rq4h2qo115SIEJan77oVLppn+GQ
         ozMw==
X-Forwarded-Encrypted: i=1; AKwUvByuX8ArFpAiS++YhcJRPrlmmURKbG53DOG1Ul/YvDt5FE2pJA+v/ch4xemYypl3JAFhbDSkx5AW/n+UVHU=@vger.kernel.org
X-Gm-Message-State: AFuF++nxM6330lwuUjK+vHFMI0Y7cDyDcT8GeId9/7zu1kkhfQ5TyQZP
	y/0uUt6pC1oCy2zJNSbhTB2QJ4GfaoaVrD9nysKF51DOILSaVlNQJV+q
X-Gm-Gg: AYBFou32CxUaRhhOqawGSfgSmH2cCGDM6V4bysBoMlpuJXHIjpwxl3XviIE9UFZZxqK
	BulbUW+uqqzPBDtoBhxspdApNZ5zD6s0zsR9qnuPmlZNvnf9gjpdljCVYGbqCv1V0FlG1oz8zlu
	7pbtLVWR4/Y9eAaTi6PezgdQlAbE9TMxiOGWZMxmbjzF0rUWHfs1NoI94Y9yiqHXEBKBFh20lTm
	IxiBWyqlRmWLtw/s8RfjvBSK/aFlPOj3g6bew+bYAARqgC6RTPzRp/7RgKqkixPvnz1Ws+UvsIF
	8BOJFNALZX3ILIgPbnvdesyVjqskWOqsGAZcI+pbRSfMTei809eoyFa2sLrl3AvvmhqQE8UDKTr
	N9AiS0r8J3W9w4Ifb/wurxTv+PCR7a/owRefzuQ1JwC3J0U7ncvuv2HvXgQeM1hKzPkAE+TU+pX
	aCmvJ8rt0jrxiIxdxqzIRAXVtu8kZQ+nWjf98zteIv4ts3GP5A5iN/
X-Received: by 2002:a17:90b:57ce:b0:396:b918:c2a with SMTP id 98e67ed59e1d1-39d9c1dbb3emr12783798a91.12.1789181838654;
        Fri, 11 Sep 2026 19:57:18 -0700 (PDT)
Received: from linux.. ([2409:8a28:a63:d170:c5de:2f75:4ae3:11de])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d9d554220sm2344737a91.2.2026.09.11.19.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 19:57:18 -0700 (PDT)
From: Binglei Wang <l3b2w1@gmail.com>
X-Google-Original-From: Binglei Wang
To: linux-erofs@lists.ozlabs.org
Cc: xiang@kernel.org,
	chao@kernel.org,
	shengyong1@xiaomi.com,
	linux-kernel@vger.kernel.org,
	Binglei Wang <l3b2w1@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] erofs: fix unbalanced buf->off handling in erofs_bread()
Date: Sat, 12 Sep 2026 10:57:09 +0800
Message-ID: <20260912025709.25604-1-l3b2w1@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Binglei Wang <l3b2w1@gmail.com>

erofs_bread() locates the target folio with

	index = (buf->off + offset) >> PAGE_SHIFT;

but computes the in-folio offset without taking buf->off into account:

	return buf->base + (offset & ~PAGE_MASK);

If buf->off is not page-aligned, the returned pointer misses the in-page
component of buf->off, so callers end up fetching data from a wrong
offset.

buf->off is set to sbi->dif0.fsoff in erofs_init_metabuf(), and fsoff can
be specified via the "fsoffset=" mount option, which only requires
block-size alignment.  Therefore, on an image with a sub-page block size
(e.g. 512 bytes), a non-page-aligned fsoff (e.g. 512) triggers the issue,
since 512 is a multiple of the block size but not of PAGE_SIZE.

It can be reproduced by mounting an image that is placed at a
non-page-aligned offset:

	mkfs.erofs -b512 -zlz4hc sub.erofs src/
	# prepend 512 bytes of padding to the image
	mount -t erofs -o loop,fsoffset=512 padded.erofs /mnt

which fails with

	erofs (device loop0): cannot find valid erofs superblock

because the on-disk superblock (at offset 1024 within the image, i.e.
1536 within the padded file) is read from a wrong in-folio offset.  With
this fixed, the very same image mounts successfully and its file contents
match those read from the unpadded image.

Fix it by including buf->off in the in-folio offset calculation, so that
it is consistent with the folio index calculation.

Fixes: c36ec00d7f67 ("erofs: add 'fsoffset' mount option to specify filesystem offset")
Cc: <stable@vger.kernel.org> # 6.16+
Signed-off-by: Binglei Wang <l3b2w1@gmail.com>
---
 fs/erofs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/erofs/data.c b/fs/erofs/data.c
index 0885b1f2fc92..be63b89f0862 100644
--- a/fs/erofs/data.c
+++ b/fs/erofs/data.c
@@ -48,7 +48,7 @@ void *erofs_bread(struct erofs_buf *buf, erofs_off_t offset, bool need_kmap)
 		return NULL;
 	if (!buf->base)
 		buf->base = kmap_local_page(buf->page);
-	return buf->base + (offset & ~PAGE_MASK);
+	return buf->base + ((buf->off + offset) & ~PAGE_MASK);
 }

 int erofs_init_metabuf(struct erofs_buf *buf, struct super_block *sb,
--
2.33.0

