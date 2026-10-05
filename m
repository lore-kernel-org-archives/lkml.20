Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962844854ED
	for <linux-kernel@vger.kernel.org>; Mon,  5 Oct 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215404; cv=none; b=HrZV2HZnLwufEk8wd9BLUT6OynHnMPghvEE+mfNazsLdmOV6M7csdWKKl5J2w/wrG3FT6KfpXl9X7BONMupryHraTlu23qsYFVMVQzDifgV8uuetGQf1gTO9xzSkqmG5hg5NYgOrvfLyLMqkbZ8XTDcwuXCMHj8QJGMdjBE3gA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215404; c=relaxed/simple;
	bh=+GwAb1diWY2eoSKclgDlISa3D7i9c6YoSdbSLUNeHmY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SVb8VCHt1iM2qYBn7rWuF7ms8iFFo57TUXXtQZ4aABLgelEGCdqbaqRoOsHe1uepGugHhJIpyg2rvQg2CgmHK+w0oiRufnoRHBaYrBegEAvQ5y478ZehRA87shRZ1BMS1qHEl4jBsrkk7u0yv9qrAw7o9tZGydEXFNNwvdSYW/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OvUEIitC; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OvUEIitC"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a81335d54cso295439a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 Oct 2026 08:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791215402; x=1791820202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=t/MEt8ox8UMec1YG4VRL7RRNUQZVW+IA9Yj7RDmYjWI=;
        b=OvUEIitCjQUR/w/Ngdk1h5vDefFWXGMF4H6reutxfw61fjEV8dIK6cFYCIASjnd2vw
         dcevzjiWf52goWIrmzzo7kLEpdxxQ3toYlp+loR6hqigIF0r9Ddy3j2AZobfyimm1P7d
         xrTVtlpwm7ooylvjFjqXREodJa3pfLe2rYjgCmJsUkCc9FxoKCsuBlAa/icb/gNASg9B
         3E3/1b4rAaW4pHap2edtHkGXJNmSZ5zhELy3Dsfie9KMx1moFTil71Z1u1AnDABzn8LG
         fHDPQY4VhEFfDBVO8rYhH9oBc76unzaPTJihgimWilRm5Rcexdi5AV7+zU0cJ1woCgyu
         mCFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791215402; x=1791820202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t/MEt8ox8UMec1YG4VRL7RRNUQZVW+IA9Yj7RDmYjWI=;
        b=zDBda7+AoicoyTGBa3VGv6Tjsx2rO7NTVa783urOvh0RPHNkYW+8OFi5h/GaUaZ3I7
         LkNrknC1vKPBW4j57njDp3BCYz+RkBkQKu+hq6YFEY2YtZx1BipFHMSyTPI4GgLTMeYM
         Qnjp+3Hx06Cx9i2ksIE1tcIbGMe5MxdO8joe1VGx8jBZG+u+U856is0SQWuA1MAhpJo+
         PSy71+3aIOtib64nXFbu8psb/8KU/9XgQjM0Rsg/WOmqZ9sAp7KSDKxBc9UXEw9/Ocwk
         ANw224E7uRVciSsYkv6GMpnEVI7LRtuFrLvC14ogg+KIz11irugWXJPlhqOdf/a+0BCA
         0+aw==
X-Forwarded-Encrypted: i=1; AKwUvBwbiAXs2RVxeNeeO1d9uisLwp8Pnkt/t6lgrxWhS5C81hrKMTtnPw6ToOaZvDFGQEwgGIervHalmE0i9n0=@vger.kernel.org
X-Gm-Message-State: AFq9FYJCFqGue9pHrWEq+UxZhaanZ9YcL0TmYQ5wdAdP7AqqdBkbBDZ/
	5SUce2YsTOuTUeL9j/8HJhwLVz66T7EHUxVpcqRKbdpMEtm14ODMZAm3
X-Gm-Gg: AYBFou1CkqE1QYKvgHlTa/1YGxidPc1fcFJ49BX74nBf5pQQIcz5OYBK9TP48z2owVP
	aJt0AeUKEaQxfgyRi6b9S+yRQ3L6kmSiAtwS2QXIlnjakSr40KDOPzcyqJMlDZSTuIxTCsmkGql
	0voAtPS4C9hHuucJDSE30UW6maKkwus21hqXqvBmcEQvm0pN9xmvQcWd9vgrkay2FHJfjSKM5ct
	y27NIC8E7dpdFFtENEbtqstt3W2jzdNz+bzK2a7NqYtssIdxogI4s2EwmudUq6AjZ6YL6W1G51S
	QTkhYtMysWDVSkubXa2KzaC3zh1jXg1Byjc54U9et1Hker1zqaeyUnKRf76wZadHxydQyKJrCZ9
	j0sVb1xPlq/W816msOmdfG/w82KO1a56qumMmrB2db9RlOx3GmiT5LrvLZfqcWJphVJnZZ0L1sJ
	4d9L3dGND27ZYKSBmu1fkiUBNN7alwi2Hn0z0/FvlIi4fT47iSBpNEiY4GCyTGatnb/OYpLWcGN
	6VPfgOWFm3c0x6aV3A1dw==
X-Received: by 2002:a17:90a:c88b:b0:3a4:930e:6c35 with SMTP id 98e67ed59e1d1-3a853cdb44bmr28181a91.4.1791215401795;
        Mon, 05 Oct 2026 08:50:01 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a853ce2b46sm47748a91.14.2026.10.05.08.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:50:01 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH] f2fs: fix defragment writeback range truncation on 32-bit
Date: Mon,  5 Oct 2026 23:49:54 +0800
Message-ID: <20261005154954.2097054-1-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

f2fs_defragment_range() flushes the range it is about to defragment:

	filemap_write_and_wait_range(inode->i_mapping,
				pg_start << PAGE_SHIFT,
				(pg_end << PAGE_SHIFT) - 1);

pg_start and pg_end are pgoff_t, 32 bits on 32-bit kernels, so both
shifts are evaluated in 32 bits and truncated before they are widened to
the loff_t parameters.  pg_end is only capped by the file's page count,
so for a file larger than 4 GiB the shift wraps.

For a 5 GiB file pg_end is 1310720 and the range collapses from
[0, 5 GiB) to [0, 1 GiB), leaving the rest of the dirty pages unwritten
before the blocks are moved.  For 8 GiB the shift yields 0, the minus one
makes it (loff_t)-1, and the range becomes [0, LLONG_MAX].

The matching call in f2fs_collapse_range() already casts:

	filemap_write_and_wait_range(inode->i_mapping,
				(loff_t)index << PAGE_SHIFT,
				((loff_t)pg_end << PAGE_SHIFT) - 1);

Do the same here.  On i386 the shift changes from "shl $0xc,%ecx" to
"shld", i.e. from a 32-bit shift to a double-precision one.

Fixes: d323d005ac4a ("f2fs: support file defragment")
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 fs/f2fs/file.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ef4d218e694b..0d9919d89d93 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3036,8 +3036,8 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 	/* writeback all dirty pages in the range */
 	err = filemap_write_and_wait_range(inode->i_mapping,
-						pg_start << PAGE_SHIFT,
-						(pg_end << PAGE_SHIFT) - 1);
+						(loff_t)pg_start << PAGE_SHIFT,
+						((loff_t)pg_end << PAGE_SHIFT) - 1);
 	if (err)
 		goto out;
 

base-commit: caae4bfcf5b5794fdf6299eb6c4fbf3d149db000
-- 
2.43.0

