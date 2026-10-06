Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7F537C112
	for <linux-kernel@vger.kernel.org>; Tue,  6 Oct 2026 10:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791281012; cv=none; b=TfPjzQUUmd7mADKFwDts+Cn6gLgm8NwKRT6FUQyCeLhLd8tEeG47OM/8JTBsg1VMwZt4vTcAIm459xdZuHE8GVsinDhoxsNwJqlXcXCXQqQLEpVwXlv15CnprVwgUUDAnYjN0re43nXidMc5LdYN/EviEO4wB3bX3S71yjR/a1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791281012; c=relaxed/simple;
	bh=4yADt5rjladWeKpuNOSKS3cLtKhVa7EPDWv8TcMsBeY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=I8hQpYbF6hpgo1Egs9JKvvjTD2SEVZGW+kHAQqQGjIrjwOw/icdFAFvnoaHbGv2dbXjjbm4RLQakaSCBY216I23ZQHMt0+DXCEh+aG2lC5CIzx4+ma5T36odUA7Q0pVzNQsS4Z+eXNZmOgVFHrWsf9988ZRYSHZwT4SfnUVNhfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a018792ab3so5811425e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 06 Oct 2026 03:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281008; x=1791885808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uVXG+Hhha7ESqpwxCWCC5IkRzxzgl7i/i73esx9czc4=;
        b=uqQ+dkAv5du13dfRzy8KuB+nAWDCUbOYy0jg/dAXQSLbsskR73Xqrjo6Ihwk1JEO0M
         i8jmwTlI81JJlA9hp5Mzfw6dmnroeKf30DAS/6UvxZaphLNP4wsI+aRDUsi8J5pZM56Z
         HluOXRys0ZC+FUp7rVaMHZC/OiJGMpqL8sT4UypKK68XU8BxvgOP2Nvs8M1wxq/PRsYR
         GO8fTvD+5DcIawfF1ZNDynYSvVMMupNR7saxtmxIcN2c19al4KrOhnFL/I1r0LLb7Miu
         6rmkG65ZZUNXn+ALKtxCdt68DvJwRubb6oAuL+ydOqLqrtWxpJib6aFAogG5d1QkfpE1
         S3Yg==
X-Gm-Message-State: AFuF++kFQJjS21K4uGpA3KBwDzMVx4qBe+kmZ8ho9g/yrthrA4fe9ge/
	ukYkdTWIeTwVPFOknvK6MIP+zLbUBh9CoKUBArigRE+3pwJB0q0wjGpU
X-Gm-Gg: AYBFou1lFeKtaWYDLor7braBRSnIGCfUyy4o6gCIM/ny1gyfpbX6+JAEU/nMKSwFvIr
	zFTGFEX6z5Nm7+/R/drwP46wwlJEhVCCTkHs661KSvwh+fuXtHdEaD7DWIlpx50+Y4UAd1H7iE4
	fyV64ExqlWO0YUTS/1wfycKO1lAJcAVXerYJ4j/l9C/5BlDqptLqCIYY8NMUIsydxHcW6DqGBC8
	c89Nov6ynjt1RbSnEbzXFyOquA9K46RYJOZTYTb8k5DROYTcORa0v4MckYxq9Ed57pB+6n9Uhce
	Qwu7lI627j7DJyjJnVv1srtRwuCM3spkrtaqY5JUCDBj63Fzu5x2cq1ag3xeOFYCpJLjjX1vQmQ
	DoubZjf0gce1dxIyhMEARCPpUJLUY7cG+ZsPShu4cn1u9d5VsTt+NJWddicdQtMHvwi3mLDtzMn
	eb0gV2JCtTe/IKJuG+xRNl0B1GPuLucPMO52THC79poVXLGyoL6UttcWyx/cQxk4iy80dSqBX9R
	mBzV4+hlg5sBp9B+YcoGclsaj8=
X-Received: by 2002:a05:600c:4e42:b0:4a0:2867:d8a9 with SMTP id 5b1f17b1804b1-4a17b558ba3mr12102095e9.30.1791281008098;
        Tue, 06 Oct 2026 03:03:28 -0700 (PDT)
Received: from white (bba-217-165-185-173.alshamil.net.ae. [217.165.185.173])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a178daa062sm61246235e9.8.2026.10.06.03.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:03:27 -0700 (PDT)
From: "Denis Efremov (Oracle)" <efremov@linux.com>
To: linux-block@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Denis Efremov (Oracle)" <efremov@linux.com>
Subject: [PATCH] floppy: fail the open when floppy_revalidate() fails
Date: Tue,  6 Oct 2026 14:02:58 +0400
Message-ID: <20261006100258.1871870-1-efremov@linux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

floppy_open() ignores what floppy_revalidate() returns. If lock_fdc() is
interrupted, or __floppy_read_block_0() can't allocate its page, the open
can succeed without the disk check.

Commit a0c80efe5956 ("floppy: fix lock_fdc() signal handling") made
floppy_revalidate() return -EINTR instead of going on without the FDC
lock, but the error was dropped. Return the error instead.

Fixes: 4a6f3d480edc ("floppy: use bdev_check_media_change")
Signed-off-by: Denis Efremov (Oracle) <efremov@linux.com>
---
 drivers/block/floppy.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
index f04397b8e381..85eac9adc385 100644
--- a/drivers/block/floppy.c
+++ b/drivers/block/floppy.c
@@ -4052,8 +4052,12 @@ static int floppy_open(struct gendisk *disk, blk_mode_t mode)
 			drive_state[drive].last_checked = 0;
 			clear_bit(FD_OPEN_SHOULD_FAIL_BIT,
 				  &drive_state[drive].flags);
-			if (disk_check_media_change(disk))
-				floppy_revalidate(disk);
+			if (disk_check_media_change(disk)) {
+				res = floppy_revalidate(disk);
+				if (res)
+					goto out;
+			}
+			res = -ENXIO;
 			if (test_bit(FD_DISK_CHANGED_BIT, &drive_state[drive].flags))
 				goto out;
 			if (test_bit(FD_OPEN_SHOULD_FAIL_BIT, &drive_state[drive].flags))

base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
-- 
2.55.0

