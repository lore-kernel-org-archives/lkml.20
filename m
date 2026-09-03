Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F70532B108
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 02:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788401395; cv=none; b=hrpNv/7yx78Z56WyMJf7ZE+5PIZZLhEKuSOsP6jmQzCvKwIXHBagAoGvgzfh8/mETS4qjSiPQ5PW9i8AzIcfjiGFJnwYOMpXWRiIYBVatYe6G889Q9IMUMCWJieIBGChfF9uD4yoqrzT+t2YLO7HHWkACiG48kh+PPMzt8t4S58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788401395; c=relaxed/simple;
	bh=94kJM0CGMA3CGbfIpLlEPghK0mnhcD+knhs6qcR7Om0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cVO5tps9Fqh9Q/z+4yhbWDF4ly4UmAmS/EJ0aJtmY7hd5BY8oebvHXZZWy7bLfVCs3TuQ31ZC+wXgft0LolifI7ylzg1NC+sJWs+xhdFEoiMb21c97udN77oBKw222iD8g8VWYcHgSShpDy7VFOTAGbMvd1ZjozKl3ElaQvyNOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hsTBh7AV; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hsTBh7AV"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cbedf433a99so1995030a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 19:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788401393; x=1789006193; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xXWZQGX2IRpUhasiZLHJhXX71kDpLGpLEL+iB+A8DS4=;
        b=hsTBh7AVgFwHjF0mfzdsfhY3aPFSVUzeOfb6y1BWFGeXOR2BU19uChYPmkG6deN91w
         BjoX8H/dWwHHNmOYWtTsmLb22Gwe5LNnsZrzNTC3ptgk+fvuI2xwbyNAJYPjfDZNyG5R
         MKEjAIFBMGJQrcngskN7KCs0UgSvVhD9IjoUO0Anb/fVFEmJ7UJsBjoOD6S3fLZ7ZMx3
         PlxTo6L6gDyA4mTBYil3q6UlyDuFvY8r+DwccH+OPwQkfZ1845DK8DC4DU9DuR+G4QaW
         vSVphyLDpJlvxM62spmExwTMpMeRvRhx2LEpwaxicbilfheJ8Kg7vqO//SbMnZ/+TVhy
         rtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788401393; x=1789006193;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xXWZQGX2IRpUhasiZLHJhXX71kDpLGpLEL+iB+A8DS4=;
        b=LLcRKlH8+4ZrExmfeqnHRHrTMwnQ5aU4GG4VEqJFGgZrcVDz1qYLfo32ZSHEjD6+HY
         scmcldcdxEHovguqxsAl2HWe1NA4vsfddjP7BaufKWBq/ccDvfyILyk7KWq7cIlkJMgv
         brSikOJyp2eT3vMn7yv/rrMg7DUc2AIa+48HZcSveLTeI+0QzRuPE+twK25Kk9hcVo5g
         A7fyl78pQK1lrhxElUt3zX+baIx8V4nASIYzdB1ZtpMh/WAxL0ICx1OiiwPqq3ekD+fC
         E7S6qwyzAa0s9mLA3pcXBRW5pZ9Xk2DahY1UUfhLl1bTXJQ/A3lYI10oevA03+ny6KV/
         wjzQ==
X-Forwarded-Encrypted: i=1; AKwUvByWdjLZn9AYmFs3271DoPCsz0XVoScC08vbQzv8UJx7hZjzRmCU5dHc42l3a6Zz4VgpBOkaN0XVmtjWkYw=@vger.kernel.org
X-Gm-Message-State: AFuF++k9fD3LY1XOVsyv0N0R3L6smQmlfiq4/aTSkXy+e1I4GaaqAk7V
	E2dpFc4Y+y3vbq11MWsW3+wJBJyf1eyH3ZTUieQVg7HtG+WmGGOC49QJ
X-Gm-Gg: AYBFou2Hnx10Z9hSPKmb6ex5cnUF5yriHy9tv4W5/C9n6Ua5cKgiShJVz4BFuz1IOqJ
	4SBmi5f56EsNvwCIbKTBDg3+e4NIAxKrB5PTorZPtSLXTXhptIEUb/HDDRWwJTcBskRoh0s7jQ2
	m143etjNePvMdp1eFl5NsUW4luVVVIbWIfv+teUW1TwCqrPSvtJptyakuvg2j88GPXc5Ajkhi9T
	Q4IMJe1tLv5zD+hteWWJB2Ex8Xx+uSmLsN8kV5pv1vqeGg4MeiV41IAo8pZRssty0oIcAHgBJQZ
	F+GnhosjjOzycbHMSjMEDbVISoPyvRdctFdEvyq3hNemm/LJylHAp6J2mNzzwoejw7LkvmTFloc
	RAa/yB82FTWTvEf7yLO/dvaJk/ncrygZC4ZNE7R6PFBoOc6PtQedVI5krEXLuVbbe1mH3OrBOx0
	xt5uwb5mI0mmzS55+zCVL27MhYu9eVkoHQEyrs3mnWD2RCC95Fe8W7LQ==
X-Received: by 2002:a17:90b:3d89:b0:398:deed:6e1d with SMTP id 98e67ed59e1d1-39aedf89bc9mr13978891a91.5.1788401393336;
        Wed, 02 Sep 2026 19:09:53 -0700 (PDT)
Received: from unix.. ([181.229.23.179])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14319922eb4sm1705721c88.7.2026.09.02.19.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:09:52 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: linux-block@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH v2] block: loop: restore backing file state on loop_configure() failure
Date: Wed,  2 Sep 2026 23:09:48 -0300
Message-ID: <20260903020948.47045-1-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

If queue_limits_commit_update() fails after loop_assign_backing_file(),
restore the backing file GFP mask, clear lo_backing_file and lo_device,
and re-enable uevents before unlocking.

Scope the rollback to a dedicated out_restore_backing label reached only
from errors after the backing file is modified in this call. The common
out_unlock path is also used for early validation failures such as
-EBUSY when lo->lo_state != Lo_unbound; in that case the device may
already have a valid backing file that must not be cleared.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
Changes since v1:
 - Drop the brd xa_destroy patch: xa_init() does not allocate; there is
   nothing to destroy on the blk_alloc_disk() failure path.
 - Fix loop rollback scope: do not restore from the common out_unlock
   path. That label is also reached for early failures such as -EBUSY
   when the device is already bound, where lo_backing_file belongs to
   the existing configuration. Use a dedicated out_restore_backing
   label only for errors after loop_assign_backing_file().

 drivers/block/loop.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/block/loop.c b/drivers/block/loop.c
index 6f12976035b0..aec7fbad1903 100644
--- a/drivers/block/loop.c
+++ b/drivers/block/loop.c
@@ -1085,7 +1085,7 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 	/* No need to freeze the queue as the device isn't bound yet. */
 	error = queue_limits_commit_update(lo->lo_queue, &lim);
 	if (error)
-		goto out_unlock;
+		goto out_restore_backing;
 
 	/*
 	 * We might switch to direct I/O mode for the loop device, write back
@@ -1122,6 +1122,13 @@ static int loop_configure(struct loop_device *lo, blk_mode_t mode,
 
 	return 0;
 
+out_restore_backing:
+	mapping_set_gfp_mask(lo->lo_backing_file->f_mapping,
+			     lo->old_gfp_mask);
+	lo->lo_backing_file = NULL;
+	lo->lo_device = NULL;
+	dev_set_uevent_suppress(disk_to_dev(lo->lo_disk), 0);
+
 out_unlock:
 	loop_global_unlock(lo, is_loop);
 out_bdev:
-- 
2.43.0

