Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BB1492E43
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789051013; cv=none; b=r4sJiEboAh1uVKnxvY3nesjDflbLcMTHAyQPMJBzdWrqdc4irIDtW0NkshHVC4MFHK0aUTm3IQwUi0SsIoyKse9VCJaRFuOz6NsBkwEY6pmyWufPuRD0l3grbpU2ZYpvCx3Keaxoy5VCUzORXNA3cbMX9Y0yCX/KEYW5DRyEUPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789051013; c=relaxed/simple;
	bh=44++hIkP5myLEtGQXIFd/CtlqyOT1Q2AyIHZpmKSjvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rEbOicTpPtEYek+7w4p3K2IuMII6DPmLvHqtmaFXiH2XcbsxQkdEk+OvEyDL6t+N8DdwbE645QTb0ZMZiGTbIC6CgxvlSdmVh2FxQv8wI6veOhu4pwsFiwyCurG4XT+ksPBV7Ty1/wmHB2AcXJoBjjC/rlM14g8HZntkaSXMjGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ndWKrZ5J; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ndWKrZ5J"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c2637dd37c1so703511666b.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 07:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789051010; x=1789655810; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=orC8VUg8M5+c5rSP9eN2LigrAsxa02qw3fBkTWfZG5o=;
        b=ndWKrZ5JAjB5G6iuzNo741KncDzAzpJ1jMnadG/XLjo5S2SXnKrge9jMiu0vkqRXul
         02R542PRx2VIdx19mzyq7eG8oep8y0PvuPycoGVYn27v4Tslh28jwwIUgOFqGAYW+1qR
         9BVnJlDJn0+yE3xZ9iv2qiy3Cf3T1J0A4HfN9zAZipwdWQarykmlovSOhr5eG/56kPU9
         VQIRT1tg7aD0k6w1P3YbLbLd6SzIvuRA+0Tj70h9AJ2BZUW4F26HNbZEScZFxhfpSAfo
         odp0I8hiYhAwukNMu4QkEwTSZBvRP5liONDIvXiesFGCQsw5j4XYvbmbZ5cyrMj/O+Z3
         vTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789051010; x=1789655810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=orC8VUg8M5+c5rSP9eN2LigrAsxa02qw3fBkTWfZG5o=;
        b=TmyTibKA1ekSzl7g6BUNbJNS7SufF4lqx2PCIlyEIk6c8TlZ/NEYCvWaqCCkEPJPOq
         Yc8xbkHgzf+SAPw22GgIRO0xNNtE2RgJhR6vdkdjL57TSDtPcqEd2250lIr93pHFZT6X
         /sL7zLrd3zLjClxWNl5UkBlGIPf1wUdFfYCDwZpiPCSPGPXYvwBod/QOClNP4QnblCFw
         Q/FvYQQeFqaQC1akETn//1HEwvYF/tf//BGekoJnYvyQE+VhX2valDBEjYDpMHq6uPtX
         hBkXwxS5vi8iHif//pdHJ5wtOISFVNA1GetbgK/FJiFavm6a2Diyni7sYnPYGJXm2ElY
         htkg==
X-Forwarded-Encrypted: i=1; AKwUvBwsN5sngg+FqXQXadR80zLF4cmidm2reSjcPmHszGFJIa8dP2QTQFl/U1xmMcMU822dcAGyE8XoRMx0QQ0=@vger.kernel.org
X-Gm-Message-State: AFuF++md2CNa8DPB2K1Zsgikwq27m2WX8w77RG8N63fnwQp5/JEkBkYU
	6bNlVIoihqi4bzXObX0jfznyQ6CSXbIhfS1gBJtGLrASxjdrP/AfLyrC
X-Gm-Gg: AYBFou3vAIYV+4lfHFtAVZRY7Dqwp0PnR+uV2CCqqmshaRo1f18xPC+u7/PqRdiN2nI
	BD5eu11Cw46t7n6O1Th+Z0YeVWziu4J1ZIu22c9jlgi0mBPAW7ZhSbF7T3urzYPoWU5nESpVbbQ
	rOdrKBMIhZjteuc2jWJj/qtQWeIU9+r14Tu9FzByDq9y317mYuv6JXUqZc1Bn2gnSiKfgOcwD5u
	yQJnSOfIkGQeguCFDp1+qyq303+2FvbGmGwCuUwA8hI5CjVa99ENLYbnMNKgaTDBHtcJgBnHogN
	1KO/pvnoP7qXbxAvwIvFsjEBB0GQt1nXJjrRg+tyRXrzmtuypA+sGLu2YyG+ufVq9qBB9tV7gUr
	oUsbPIlnyjD/O8h8tFdUiwXw0/YV6Do9ZAI047XWpFCXMRR95u+aBf/L8aPOZGV5XWMJHmgNfjO
	DziFVHThPBZbJsQrfbQekbcThRr1Oyg/EGB42zDiqxRwqS/Vql7pVKObkeqF/9gbSfl/VY/7D9X
	wJN0j8=
X-Received: by 2002:a17:906:ee88:b0:c29:3711:626f with SMTP id a640c23a62f3a-c2937116522mr422684566b.24.1789051009715;
        Thu, 10 Sep 2026 07:36:49 -0700 (PDT)
Received: from bbzr-mini (cool-t.fvds.ru. [103.137.251.133])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2945d5ea60sm135441466b.29.2026.09.10.07.36.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 07:36:49 -0700 (PDT)
From: Vadim Nikitushkin <bub4z0r@gmail.com>
To: christian.koenig@amd.com,
	thomas.hellstrom@linux.intel.com
Cc: ray.huang@amd.com,
	matthew.auld@intel.com,
	matthew.brost@intel.com,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	skainsworth@gmail.com,
	alexander.deucher@amd.com,
	bernardomagri21@gmail.com,
	Vadim Nikitushkin <bub4z0r@gmail.com>
Subject: [PATCH] drm/ttm: apply the swapout bulk_move fix to the intended condition
Date: Thu, 10 Sep 2026 17:34:51 +0300
Message-ID: <20260910143451.65853-1-bub4z0r@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <853fb020-592b-4f85-a9b5-a522aca6a29e@amd.com>
References: <853fb020-592b-4f85-a9b5-a522aca6a29e@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 3db7d7d58341 ("drm/ttm: fix swapped-out resources never leaving
their bulk_move range") landed in drm-misc-fixes with its one-line
change applied to the wrong "if": the "if (ret)" after
ttm_resource_try_charge() in ttm_bo_alloc_at_place() became
"if (ret > 0)", while the "if (!ret)" after ttm_tt_swapout() in
ttm_bo_swapout_cb() that the patch targeted was left untouched.

ttm_resource_try_charge() returns 0 or a negative error code, so with
"ret > 0" a failed dmem cgroup charge no longer fails the allocation.
Restore that check and apply the intended change: ttm_tt_swapout()
returns the number of pages swapped out on success, so the bulk_move
removal must run for ret > 0.

Fixes: 3db7d7d58341 ("drm/ttm: fix swapped-out resources never leaving their bulk_move range")
Cc: stable@vger.kernel.org # v7.1+
Signed-off-by: Vadim Nikitushkin <bub4z0r@gmail.com>
---
Christian, the commit in drm-misc-fixes (3db7d7d58341) ended up with the
change applied to the try_charge condition at line 532 instead of the
swapout one at line 1434; the resulting tree still has "if (!ret)" in
ttm_bo_swapout_cb(). This is a fix-up on top of 3db7d7d58341 since
drm-misc-fixes does not rebase. Sorry for the noise.

 drivers/gpu/drm/ttm/ttm_bo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index a12af5b..9b85b5f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -532,7 +532,7 @@ static int ttm_bo_alloc_at_place(struct ttm_buffer_object *bo,
 		ret = ttm_resource_try_charge(bo, place, &alloc_state->charge_pool,
 					      force_space ? &alloc_state->limit_pool
 							  : NULL);
-		if (ret > 0) {
+		if (ret) {
 			/*
 			 * -EAGAIN means the charge failed, which we treat
 			 * like an allocation failure. Therefore, return an
@@ -1434,7 +1434,7 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk, struct ttm_buffer_object *bo)
 
 	if (ttm_tt_is_populated(tt)) {
 		ret = ttm_tt_swapout(bdev, tt, swapout_walk->gfp_flags);
-		if (!ret) {
+		if (ret > 0) {
 			spin_lock(&bdev->lru_lock);
 			ttm_resource_del_bulk_move_unevictable(bo->resource, bo);
 			ttm_resource_move_to_lru_tail(bo->resource);
-- 
2.53.0

