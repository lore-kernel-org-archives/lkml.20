Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2AC514883F
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790923747; cv=none; b=QQWDkhmkjiZJ1SNIPzkzUvozH19aqUAWM9R5/rjlDkOnnlqCCkDzR6LDjqjDcnpWnofbuPzKk22xhq9XzeugTyR4E9DyRYRsjkwZjZy4hj1AlDDZa7m1KUwA5lcZ5e7x19LO8Ybwb2bewHDGWUz+NXyYAHo2u6kcpkBHY7PAXyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790923747; c=relaxed/simple;
	bh=jkLNCTWwDR/A0PYyLfoK8BT0KyzncgH2/Xvj2/jk2n4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oJaUH9zqck/NHhlDsNzAzSYENoiaaFAJnAXmtYDpFKM57qA3dvgjYKoh1zvfeXbsx4sRe9oM0Oso1ZkaCsxXEjOxtscftwJraR3aW+M/0U4p/PA37gxobktJuyf99vO7pbyLjs1h4uoXYHJz3/UfRKkIrFJFUawkCtlY8CIyyP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j1+Cy/QU; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j1+Cy/QU"
Received: by mail-pz2-f37.google.com with SMTP id d2e1a72fcca58-88826f3ff80so784712b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 23:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790923745; x=1791528545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b2I2VmL6WnuxgQWDSKKBuDVc6+oZPGkIWa4vAQHTcFI=;
        b=j1+Cy/QUq1tSw66Eea31BuEQaK6xc4D/x2503Pst3kTJ1lhR6fLGbXuhU/Y9PuQsLO
         iU0VW7bUkXn93k+y7hhkbfcOTfuRaI2D7KjXUNM5yauJ9DIuoT2LU0NYBq2kDt7yyjmW
         UKiBmcjReq7iNxrM0Xt4Y594liQknvOf+JXJ0ZGr3ShG/2GghF+c1pLjAeqtoeu9xvic
         J0iEzbhbk4vZ1lHpenVASm6FkIjVSFsfiDCY4P63S9iqlcL0DT5OfFqiQMBlQwBeRby3
         ZwlTXk/+NmPfmJDwY8CLadwfZ6uKJC3TkpERvybj6tYuS2yoe41JYP0UbD56UMHMyTYB
         UShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790923745; x=1791528545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b2I2VmL6WnuxgQWDSKKBuDVc6+oZPGkIWa4vAQHTcFI=;
        b=oXiiF7+2fnRPjD9D9Vg/0ytcguVK1/UCs0PRS4MblLmznZaoOn2hZmeBdqcxEpI1JG
         VZSNzjNHwAxAuK+aqTjtoHeNGJrB9u9ndtGOicvYXRUDx1DgHndsxf8IdxiyCvhZ8kso
         N1n3c2xY+SjZNenMNnZnbAt+1RqNEHYjQPEkqloRASES8fc9A1rRON7ZbvcmXpUKZzKY
         1CYecQefVn17/BAFnJhDLAVk3snPXh5bLEsnCs/PZdhE8CoQ4eTb39MxzXvcqctyu5yi
         XSghX4Xz0ikOkwbnqkhDyjzbbl9pY6t/5GNLLcgYITKLekUFk3+/7ViBECESwi757rxy
         /sdw==
X-Forwarded-Encrypted: i=1; AKwUvBwT3WpS1PKURTHM18sx56+BQOFX7VSXEfTUjjyrpY+0frQcbzW3i2chqDP2fxfpfbkEs/Wj1umoiJmUjoE=@vger.kernel.org
X-Gm-Message-State: AFuF++lZlYSGSAAItCmZXaO8Y+qx2NQJFWjD4pd7YuI4+IUkg/2UsTL6
	Z259ELYtltEnLQ5qah6+sh+Dji4W6JbJVBLSd+ncTj1kLvucgPNQqrHa+2Xne34E
X-Gm-Gg: AYBFou3+AWp1AuJXYx2edze/ixNcTE8/uxjUhicJ/0UUi338+dkarrAN0tyyodj7GrQ
	VNe6WGBIguO4ldeBfEXef+i2BNo1ypemAH26XeM7OU3+12V0G6cllgail2i8Yzox4fm4WHFB9bd
	B+jFXHASIcg3ypmC7RoIY+k2jKC7wsV2JbXumXJhroJn0T3bEqJKF0ng8zuUx0dP90BvyK88I+7
	ZIX1cZK3NXJJeawc86oCkaUJ1EZgWWsWMm+gMhxDTxORSf1NfNXxxAhoBk15X1PcUnhX4fV5IVb
	PGM/WmkjWn6r2eBGyhWVkVbsWw/gcN8ChmVASBpZg8+1iOEUq/wFadNmOiZfTHKJKDQseC1WWdT
	uIuQBIxjqzwfCYuh+Psp4zqweDoC8FiLXIXRlvz71Zlgkoo/nfXlBlJGine8GvJrsdK+11x8B6W
	xFnNcx+zOaafx7JlNkb773pNN3ejiU5il8n7dBNdguGqpfCUY09Hsf87odJupsoL2O8Eu6c1Wli
	CTAixNnMWpwnI/pq/R4y5fXgz7OewIcxQeGPv3NTeCO3tkEzLZb+2rO1JnKiig0Tx7kDuBI/w==
X-Received: by 2002:a05:6a00:b89:b0:87a:50f9:2930 with SMTP id d2e1a72fcca58-88af5ac3f05mr1926461b3a.55.1790923744971;
        Thu, 01 Oct 2026 23:49:04 -0700 (PDT)
Received: from codespaces-2362ac.m2fxbej512jepnsor2itp05j3d.ix.internal.cloudapp.net ([207.46.224.87])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-88b0b8f5b20sm573055b3a.11.2026.10.01.23.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 23:49:04 -0700 (PDT)
From: Seongjae Jeong <jsjlee1020@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Cc: linux-f2fs-devel@lists.sourceforge.net,
	linux-kernel@vger.kernel.org,
	jsjlee1020@gmail.com
Subject: [PATCH] f2fs: avoid unnecessary reads in f2fs_update_meta_block()
Date: Fri,  2 Oct 2026 06:48:53 +0000
Message-ID: <20261002064853.37782-1-jsjlee1020@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the packed SSA feature is enabled, f2fs_update_meta_block()
uses f2fs_get_meta_cache_retry(), which reads the target block from
disk if the cache entry is not uptodate.

However, f2fs_update_meta_block() overwrites the entire filesystem
block with memcpy(), so the existing contents are not needed.
Partial updates to packed SSA blocks are handled separately in
write_sum_block().

Use f2fs_grab_meta_cache() unconditionally to avoid reading blocks
that will be fully overwritten. Also remove the error check, since
f2fs_grab_meta_cache() retries allocation failures internally and
does not return an error pointer.

Signed-off-by: Seongjae Jeong <jsjlee1020@gmail.com>
---
 fs/f2fs/segment.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 794e0d99fc7c..51858f64e43e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2844,13 +2844,7 @@ void f2fs_update_meta_block(struct f2fs_sb_info *sbi,
 {
 	struct f2fs_cached_block *entry;
 
-	if (!f2fs_sb_has_packed_ssa(sbi))
-		entry = f2fs_grab_meta_cache(sbi, blk_addr);
-	else
-		entry = f2fs_get_meta_cache_retry(sbi, blk_addr);
-
-	if (IS_ERR(entry))
-		return;
+	entry = f2fs_grab_meta_cache(sbi, blk_addr);
 
 	memcpy(cache_address(entry), src, F2FS_BLKSIZE(sbi));
 	f2fs_mark_cache_dirty(entry);
-- 
2.53.0

