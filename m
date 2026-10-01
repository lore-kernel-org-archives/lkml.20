Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07A735E1BA
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866194; cv=none; b=bWB2wCVdQIt2zIMXh/OvriYncyvjFtjy3LrfaQm/n2H8nMXk0VXjSLGFnG1blAuRrsDsHcXvYazN4EaQTzOy52YuiIC0WtT/YnWJpnL3tHTQVoesaIBv7IUQe2l1lKQ9GAX28BBrnvSpC1th/iyYhHRMs99/sC3RnFYhnzQqqgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866194; c=relaxed/simple;
	bh=ERxfbW3SLmn3MJiIEH2RCTtXQiqkLAFMno7w5RJW/AY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bwWyeECjnwCxM5VnV6IJlNiQKj3kRBVPwwf4qmzEI6l7e06RRhe2L+CC35RNXVlAO+ZusuND1qoRK+LKh0gcI7ncYlSCE2W1QoFVKNaW59zdiVChnJD56keho75dpKUZD85wtyhdEJiEflWpKmV9Ajw64KnA/5SXA2X8UEU+oEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BIHyKK4U; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BIHyKK4U"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so43755235ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 07:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790866189; x=1791470989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1zULKRtuPS5k7AM5/JLrNzrwWExGeWJhTe+kTdy8fnM=;
        b=BIHyKK4UzHJNJErFcuTYR9ymcFFepKFqUH/td31EjG3yO0qLy+pc/ePA90ISK+kzi1
         vnunaR1NAGTZP42MbZgenhRjr+BMMrYvLInCZR06XYnbZUkM0FspPxGmOdgr2c05jmnm
         1PjetxS4FcROxLh38ndv1FNelDfOEjQCVtVFt2FEqXGOo54rynBys1/vUL1123IBYaQs
         uDuiOeqzgAz+Kj8WQb7Lszvq86UPzBaipit58r9nDmGxCgfYWZKqVEWrdj3j0I56voYO
         WuIt6QvuLy4q3UUTirgMN57YxRxLX5EggGocV9n9+0EsxOc/15aHr6GkcYmonYrl5bXg
         jaqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866189; x=1791470989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1zULKRtuPS5k7AM5/JLrNzrwWExGeWJhTe+kTdy8fnM=;
        b=DukarIwWtOiFnvzqxQ3v+ygA7WRsneNNaZoiZ6m8zKf9L7OajiiwMcg6vevO4tegTm
         I6bFJV16XvmWUHVGlHHcqDyS6rx4wiXg6l0L4JTDKhBTWuJXvTumorl6IxU7ObY5th2m
         gm0yrGCdJT7iEd2sIjwqmsQ36z5MLqSNmYN+88u7B6aogBx2mMI4Kk0pWUviJgQso5mU
         Zbf5PyUMeSqhA+97u5MJMJOpgB5We51pnvRgSHgsV4mi4XvhQHd6EmjPA0ekbX6EHCZW
         fHramjkaQTxk54dwIlMadWCtgYv58n3uMCTxwgwEsFQr5jc6EOq9LI8wo1B40yLFeTb4
         a3zg==
X-Forwarded-Encrypted: i=1; AKwUvBwHDRtKjPxX7Cbw585IM2oYuS6QkdDeA8f3BH8q6/kHgeBvRDh5voSde2oeS5LMkR0/DoricEMVnTyd8ak=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtPK7YypXCwpOnc0gYN5f7wh+ZU4biUEOV8eqJoKOQO2ZE4s56
	n3lSTzL7XO3MWEykihTys8VZVcGpwo9VCPRhIoNUqRVNrdsmWvVLuMkk
X-Gm-Gg: AYBFou3dBi2ERRZyYg7Dv2A4WUyUaLFsKnCB0K2luwvsn7CXt0ccf70o6SK49NjM7Ss
	TpI54wgWT+A+XXea3DP4xWouFcWJ/Kaq2T0c8whP8Q5ZpXunU4fOuEr9SQlLQ0BzCuT9bmrcQIa
	6H7uSgUL6Dn7tdk8mzALUCKOkqV8rozYt5iwkbiuxs4FmUGQp4o04geeUALeuHfPcM4NoIV1GKV
	/hv+D+ewSyhTRK9tmeCU/triplTtARG/gd/Ft3Wu74APNlA7YfkowhlpGzXH+NxOA72DcyEQvLQ
	sRyJMQs/8xZIAYUivRmnbwifA1IUGuWfjSQjGVszRT8gkAT/RpXQ4hTLo4QtI7LaTqfb9aMmP5Z
	jL+O1AUmHBNxBNTWAy6hSgbreB/E0f+GwJIJh99vNyiHLAXXOf7FpmtJFKC/lmmoamn1Z2Lj60m
	fm1L8X2PspMgEaKE32SmoHUhfN3utNtidfHJV4ub6JYd3oTWJkYoXjro3EpowI6CYyQ7hBuRNuf
	zWl50pWQuWbOfDWrntcKlI3gARN4MfYfLOh1UhPq9gcjVHTcdcS5VOG7qqgW6Ke9NvFk53MdppU
	j46nxh7rNhm5ys4uic8Kxk7498ZkLZ5D5YH4FaHCSHXdldONPviAFn3Dx30=
X-Received: by 2002:a17:902:fc85:b0:2dd:ad73:c988 with SMTP id d9443c01a7336-2e2e4b48e34mr40167755ad.32.1790866189323;
        Thu, 01 Oct 2026 07:49:49 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e317cd0624sm6636775ad.30.2026.10.01.07.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:49:48 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: Baolin Liu <liubaolin@kylinos.cn>,
	liubaolin <liubaolin12138@163.com>,
	ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] ntfs: do not refuse fallocate() when the MFT zone is empty
Date: Thu,  1 Oct 2026 22:49:38 +0800
Message-ID: <17b1ff77bafd136d170c23f34610d06cd684c490.1790853718.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <cover.1790853718.git.matthias.goergens@gmail.com>
References: <cover.1790853718.git.matthias.goergens@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ntfs_fallocate() fails with -ENOSPC whenever the MFT zone has shrunk to
nothing.  The cluster allocator gives the MFT zone up when it cannot
find free clusters elsewhere, and nothing restores it before the next
mount, so after one such failure every fallocate() on the volume fails
with ENOSPC, punching holes included, however much space is freed.  The
allocator failure fixed by the previous patch was enough to get there:
afterwards a one-cluster fallocate() failed with ENOSPC while 123 MiB of
the 128 MiB volume were free.

write() and truncate() do not look at the MFT zone, and
ntfs_allocate_range() already fails with -ENOSPC when too few clusters
are free.  Remove the check.

Fixes: 9c87959601e8 ("ntfs: update file operations")
Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
Reviewed-by: Baolin Liu <liubaolin@kylinos.cn>
---
 fs/ntfs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3ec82715a588..762045d26296 100644
--- a/fs/ntfs/file.c
+++ b/fs/ntfs/file.c
@@ -1163,9 +1163,6 @@ static long ntfs_fallocate(struct file *file, int mode, loff_t offset, loff_t le
 	if (!NVolFreeClusterKnown(vol))
 		wait_event(vol->free_waitq, NVolFreeClusterKnown(vol));
 
-	if ((ni->vol->mft_zone_end - ni->vol->mft_zone_start) == 0)
-		return -ENOSPC;
-
 	if (NInoNonResident(ni) && !NInoFullyMapped(ni)) {
 		down_write(&ni->runlist.lock);
 		err = ntfs_attr_map_whole_runlist(ni);
-- 
2.56.0

