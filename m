Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382CE3A6B99
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506650; cv=none; b=e8ABr19/o1dm1GxeymN/WgxPos0Ry80lcg0JlWV5RWi/uBaTn50Zu29g7cfSz75V1IZ6RkX52Bl+4Z2gvbOw8uV1VTsBX3uTOZAM8sAgBfGIuNwkgSAa1JtMtUMmiGz3BQVcyq7aL5pW/R8JjuobLZ8MevBYbRJwmDuLqLTHz5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506650; c=relaxed/simple;
	bh=Y9FffLNiSXHIXGdQDT5BK/jzm2kA9XM4TuzHSNvoE0w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F93Q6Lrryq7drotgXpkpReDiBgdWrIj/SSS1vdc8SboxthYkV1vbYn9kb1znxZeViLL5MbcZUzCbPcywgNmBiq8yQBoxz2welTXIoa6RB19iA5TYXpYIp0HtpFDPvbMCU9Ha8U8i2fSvcEfsXq697hYHM/G19PfxZ/nkIR1+khY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qz1szPOR; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qz1szPOR"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b5b07ec78so1155316a91.3
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 03:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790506643; x=1791111443; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iNhuqNyiZflMWMLYzKj40EbjoI3SE3GVYg6+rQBmhgM=;
        b=qz1szPORzcF+8tZI01I2SGavHly4YTUuizUwcExRGwNYRA3J3pLGzfFcpKhbXwvM0b
         Sk8WyMppW7mzAmNX+1B424Xu/0p/1rrG+/mKzKyuS3g2mCjo8em+jMyRxnaOdVw1MpLk
         sJXwe6AGISCkFdHwvQU9as28c4dWzJKURMo4tQIyZZP1TaCE16CFlPUR7JS3sPfBbjEt
         EFnKfjz1EEE8Q/mH/XhRZDNor57GgPo/JxdjWzEbgSEA8YZGkia/J/dymX/r6SJWLpYE
         o7vst3iGXB59l1lmnsj9f4PViYgAiyQ5xI87mQfOTisjTGn2POkT4qia2LK5ZoGHlM09
         5vig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790506643; x=1791111443;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iNhuqNyiZflMWMLYzKj40EbjoI3SE3GVYg6+rQBmhgM=;
        b=DesAhfq2tdS6rJ0dKNWCg5NKZcAuJm1BmZ43xi3Z8j94VHJQKRE3d954DnuSN6PLhn
         2qnjn18s1Fqsj3/6/jHHt9UyB/KAKypqJlqX3v8InSEwZmIdRlUum25DwgKBE8vxngys
         bBHUqwbRfns3m8bsC5TqZYa5xJK5MtjNjBEhXAiBAYF70OYu8Jx0KKrP5FAy36wEVjfP
         cl3ZZ2XDphz10UIX32ojY1K4zg5NAGXuEZOW1IGlRNzdBWVQLFXyS+CjKnziJ3rhcGqN
         pmbbYhAPrXlz0WYMTgbeg98y7zfJ9B76AjUJvKmOgG1DEZP05AncWE7dxEYU0n+vvspV
         o0aA==
X-Forwarded-Encrypted: i=1; AKwUvByX5juSOb/fa5pJMuu/kr6pkVn7S5XYFoqV4B5n/BHS7mj8zw5/0EfZZ9vBguGrvOzwlDHPpRAhfKCRScQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIBRf43JZS/BY60b27AgAolM0TXpaGzKpExB4CSrCvDkY48fQMq
	yF5hhxv3ipsVocEHRxjVSOb0IzcsUXkgtMc2Se06eepv2uUw4IS1C07q
X-Gm-Gg: AYBFou3SVMJMlXi/I5nB512sDzyQaNLrfP49xeNcm9l41lf51JlCvp8RjjQU66x6vjR
	/nvaiHN2xdM+KoPcpWgKzgLQg9bXrm0FbYCsJ0rvBCEcfYDUCOuQyHKxkxn993/cU1GKJaKKAiY
	/Pdv5bKfhM08S9spWBjxYoxrIl9Kerusodp0MGtaOHA38tBL69u4Gud6AGyAz5kDAkmJQep+bco
	JcYadWB0mWvBt5E+Gbswa/gfZHySJLR+zrvhNvlaHDWP+kwp+foKi/d20xbwPi5XgHb/baIe11N
	okndIYgWi56QgV3vo67U1rbYZHFJ/Jq0Hgs+XSg/M7w1z6p3hgv9ctscmxYgwwmjISJyhDHREu4
	WWUitUU7bEiENmKDMIThcEFCM/zc3hUdaysuTjkwuUyLvRsNKxeVnHA8SR5sm5KB+FhsWdIZv3v
	FKUAW5q4OS9qfkXCvkP+5SLgUyWcb0PCE5wlkG6R/5l99HE37q7HX0Mm5NJZC/l2MqQZBsgc3u0
	ON86cQgr2pn03ZhK+vto5a+gBagm8DA1i9TDPZRHeJcqZP01AhBbg4W0iWi/EgKvo6WmXn9ZsJ5
	YAMuuuAW3MK6xwQJuuk6SpvF1j5S5KTd9clg5iu06gJAOooYXtrXoK5SCAQ=
X-Received: by 2002:a17:90b:384a:b0:3a0:c156:3f8a with SMTP id 98e67ed59e1d1-3a0c156441fmr5811233a91.56.1790506643527;
        Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.6.151.236])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b99e5220sm14419192a91.16.2026.09.27.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 03:57:23 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: Namjae Jeon <linkinjeon@kernel.org>,
	Hyunchul Lee <hyc.lee@gmail.com>
Cc: ntfs@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ntfs: do not refuse fallocate() when the MFT zone is empty
Date: Sun, 27 Sep 2026 18:57:14 +0800
Message-ID: <77d2e237e1c2ded042f8220350fd92cce5f502e7.1790503811.git.matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1790503811.git.matthias.goergens@gmail.com>
References: <cover.1790503811.git.matthias.goergens@gmail.com>
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
---
 fs/ntfs/file.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/ntfs/file.c b/fs/ntfs/file.c
index 3ec82715a5882..762045d262963 100644
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
2.55.0

