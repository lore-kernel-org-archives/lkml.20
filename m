Received: from mail-pz2-f34.google.com (mail-pz2-f34.google.com [74.125.228.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C826385D97
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 18:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789841404; cv=none; b=V4lRN3bkcnnEGzTGIPq3POlGRA/V1YWE0F5ol/lEvS6mQlgWKZNJzZHXH8tx68p1TUspwhpXg1MNek/fraYYyVaTWLEE/JqXatT0AjRgeXZO6IXKWY4BH3h+qHoPinAU1efe5aAIcsGL6FVNTiUeDOZgsTNLvywD3HWO3iNzeLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789841404; c=relaxed/simple;
	bh=b1Eqor/XA/1dclmoeTJ6useLZPuzRaNCBOEbwaWnw8g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnEFHezivYH3GeyEtU2+4hwCfk+bzzOVJbUMOUIoIURDdykQ4mdehEqRD0vTQdD6Vuy+Akg1MAK0x9qxbXgy3lcr7n33lS98s6ES3RmcZgpG5oxLQpYR9iqjn7aE3eJcKwFxKaPo8KY3s4b5kqyJhBPX24wkPBXdm+X4tNOujw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oeAMenRZ; arc=none smtp.client-ip=74.125.228.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oeAMenRZ"
Received: by mail-pz2-f34.google.com with SMTP id d2e1a72fcca58-8748f34b1f2so1735123b3a.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789841402; x=1790446202; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=giTwKDIwEU84jfLK5hnKcSoBAczq+bG+LFpvE2zAxq8=;
        b=oeAMenRZ7xVPh0avtvjRAr6BQ/MJNMqmvqxnPX0jSvo2PrjdwrTNFtOeUwit0Pr3dz
         HrCWojO7Foe6IWJjlAWx5Otnk0LqYX+sdFovVhWLbQu2JD3/lcr+5UHKOpikHsW6r7Bo
         1Tb5sSa7dTcraUeA4Dx1U//V7A0bQUZdA/VuM7I6toFUNj5xPrbq+fPJIJSTAwE51sfH
         uGtDVqs8Tv3wZ20WBmM8qaLpSgE0fcAou71VJDqIBZ5dCN5UMhAtv8VVxjWuqV3alw9L
         MEqueXMhjG+c8RHCvrXNEYxNo8JU/Q1MGxQqgbjW1/P1pWcSFDyPfEa5E5q8p69sZQiW
         CHtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789841402; x=1790446202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=giTwKDIwEU84jfLK5hnKcSoBAczq+bG+LFpvE2zAxq8=;
        b=f/jTUTzx9aODlmvoH/08YHTwq4q6YBmYhzW4VSVJyLvYgb7EsPrirS/lNH/aJffl7n
         MY5Rb/ljJVqClxrAJk5DxfP5M2C/ekmy+hbOG8yZaJ7tGOa6dkTv4ABhcDe2WR+jp0vx
         Di0mIsr4ZoNMf2nMispmhhRm3JVLUQzgszQozI1Mp9cT/N4SHHAh/UrDu4hKAoPEAAt7
         IJFhtg/xl5PAMS9qrHiwbssOJQQd5xSMrlP/Y04gZEKUOyK0mYgYypPCTOy3xqGxBLDO
         hjpCn5/yLnbhAidW5e+AUlwErVQo2q02A8uZ7sU2DAxrFAyA2dqjnkd1eeVp4QBzvDbL
         Yuvg==
X-Forwarded-Encrypted: i=1; AKwUvBxLVhFA6v2QntNKdBryvGqSyDXjv/e7/IblbtfNifDvDAmySqRLa89WA+poL/otuKDO3OlrOHhacl5ZPSw=@vger.kernel.org
X-Gm-Message-State: AFuF++nsdzzzSmL8uLpBMrgGpbvgUZl3SW9+0LCh52mzo/VJs1TQbjbz
	DDFhnGrxyYgXGPuxpXgHwnDq/rdjReRbYfVT+3lOQihDpXifhixNTsjx
X-Gm-Gg: AYBFou0RSWk4XBk9hsaq+eUVsrp85DgYSX+uap4QSqBEDMZUOosHYZCDQmassAyypDd
	Xz3wExgaJD2r3802y6ERnR3jkai/dphr5Mhtnw4UJfKXCASR0MC3z6GMw0TMuydaok+GUsKWI5W
	0VDpyPO60SlmGyfpmrJMbbfbsoy+UndNo8LR8C8SZBlOtbAKu/b+VJNSgMILoWal3rAdubfPgqN
	cpWgEWkobW4R51p10LTpC+KwdyxdCS/P3J5Lz/MK24Dh+duKGsBOyOEk6NhaIyx6dsYX2UQwc21
	g2edgONHcspn+h8OVJ7ZBLclZnfcqOSAB9hRDuJN9b5/NFSSBY0gyYik4t/sx6EPXz1HLs6tze9
	3NwJDMth/2gCOkJ8EbNtPec5h/grMwXweyUAt1595tuwNpZ3P9P6lxJR4TMlWKIUjGVRW4dvjK9
	uz6OACrDh2kbATQ6dxi3sPczMLkLAz4tmfolpBoL/NmAk033qnNiWRdSS+RVYomfXK05Wcirl5s
	uAegtRIjIVqJBj+FYFwy1ovQX0MB7E5fdz1GIS0h9nXYFUBW0Ho1272UyHfYZEhvMhMOVKf/C7y
	FWBYhOHloQ==
X-Received: by 2002:a05:6a00:1d99:b0:873:5267:dfd0 with SMTP id d2e1a72fcca58-874dbee3a93mr8677777b3a.5.1789841402439;
        Sat, 19 Sep 2026 11:10:02 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (67.51.127.34.bc.googleusercontent.com. [34.127.51.67])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-877a94f8c39sm1190168b3a.28.2026.09.19.11.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 11:10:02 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: David Sterba <dsterba@suse.com>
Cc: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] affs: validate the allocation goal in affs_alloc_block()
Date: Sat, 19 Sep 2026 18:09:57 +0000
Message-ID: <20260919180958.1362943-4-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
In-Reply-To: <20260919180958.1362943-1-benquike@gmail.com>
References: <20260919180958.1362943-1-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

affs_alloc_block() applies the same too-permissive range test that
affs_free_block() did, and then performs the same arithmetic:

	if (!goal || goal > sbi->s_partition_size) {
		...
		goal = sbi->s_reserved;
	}

	blk = goal - sbi->s_reserved;
	bmap = blk / sbi->s_bmap_bits;
	bm = &sbi->s_bitmap[bmap];

	if (bm->bm_free)

A goal strictly between 0 and s_reserved passes the test, underflows the
subtraction and indexes sbi->s_bitmap far out of bounds, and a goal equal
to s_partition_size overruns it by one entry.

Unlike the free path this is not driven directly by on-disk data - goal
is derived from inode state (i_lastalloc, the last allocated block, or
0) - and I have no reproducer for it. It is the same defect in the
sibling function though, so fix it the same way, with the helper that
already defines the valid block range.

Keep the `if (goal)` guard around the warning so that a first allocation
with goal == 0, which is the normal case, stays silent.

Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>
---
Behaviour change worth noting: goal == 0 previously took this branch via
the `!goal` test and now takes it via affs_validblock() returning false
(0 < s_reserved for any mountable image, since the root block alone puts
s_reserved at 2). The outcome, goal = sbi->s_reserved, is identical.

No reproducer for this one - please treat it as hardening rather than a
security fix, and drop the Fixes: tag if you would rather it did not go
to stable on its own.

diff --git a/fs/affs/bitmap.c b/fs/affs/bitmap.c
--- a/fs/affs/bitmap.c
+++ b/fs/affs/bitmap.c
@@ -133,7 +133,7 @@
 		return ++AFFS_I(inode)->i_lastalloc;
 	}
 
-	if (!goal || goal > sbi->s_partition_size) {
+	if (!affs_validblock(sb, goal)) {
 		if (goal)
 			affs_warning(sb, "affs_balloc", "invalid goal %d", goal);
 		//if (!AFFS_I(inode)->i_last_block)
-- 
2.43.0
