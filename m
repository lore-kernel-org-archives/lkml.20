Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419FB37998B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 04:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789361833; cv=none; b=toutlv1Nstp688bshCLpVjZ4tScplAHcCgDFgzDdISL18D0fQ5qTdCqdjLi/Pbn8cXqpnQY3iDr2ariFPGnzHdHRIKYDh6LcscN9soI8blLk2N5qYfFv6O5l+OdsHguwfzyBWUK21H25SUPuiGIB/2UuL2w5iru4o2twjS1MdHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789361833; c=relaxed/simple;
	bh=BBX8/0738NSj5leksmqmYpczzUltcDdH6n+eeaDute4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f+QC9GRXqN0ryk0EL/9BlW48IlMDqZkOydE5mruDGrENkxHry0N2FRrHcj84NQ4EaeGg2sG9sPigpSlCBXdoy05IOfQsW6Ey0lr29iayAR6G2+ifIn4BPvkszEWBqVdW1wG037Z8ujD6vAqMGIDnbvAG8n+y10x70oE+i6x2IPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kjHNHSdw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kjHNHSdw"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc4aa18f9afso1921050a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 21:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789361832; x=1789966632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uCp8m2ue1HIu47SujiP2rZsKqNx/UJ3BDFl1VHtBYXI=;
        b=kjHNHSdw5ip3EBHpScicQQ+2dX0XqDS2wF7XtP8spJ4iGhL2xr8d+0yXvWQBfmdNBK
         6uHKire55PFoYG21g06jhl2EwcZejx6bpzQ9r5sTxGgEG6zCjyrDznHcfglhh38wpDpd
         B7XQptZLgtU/iCKEayEkXsIix1rvc67nh0Gexo3KupxKs0/lVX2guspdIXkopbAHwbWa
         xeODIuaPbBQm6byU6OtNVxZKg6DfFf8a3gJ8HmTcs9z/Rf3bAwAbzjTeSF17IURi8feh
         CvHbiTmsylzLgOFPE389GDy83xgT5ZttZWDVRJGcM290ByP2Ua4S5pjoxjXl87DJExeB
         LApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789361832; x=1789966632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uCp8m2ue1HIu47SujiP2rZsKqNx/UJ3BDFl1VHtBYXI=;
        b=XCFIR+GuTy9OTVwig7W9bHHP/HjFDKoZxhQMCgCB5bIyOwYz+kCnkDapKiCfICvkGo
         P/WYLuVDU8fufKk4g83xiInqBCfl0rmVG6UdKchjlx9SEl0QwjQ62LKG5Fawrl4+KLH8
         JwsJZxEa5/ms99cNIT9GvfrGVa4G5/EuC4dMUY4p6S0+GEB4duDr5Npd7C6wIoHWpop1
         TcQgDQ3htvlfsv6dhoiCum4wwSB7AmS3hOqRxpwNkHoCZIJhqvLbl9URDyWJRpXKXBX9
         m4ZHPwM/nJFqeiJmVv8AwQVd6XkzTxd4deCn59T0wtJwglo3woTe6KNSlNzaiQhP+as3
         c7DA==
X-Forwarded-Encrypted: i=1; AKwUvBzTKrjZoWVmIAPX7AL5orYU/tuCgMYXpnFBMAmNS164nKRBvGPvuCLWUF13ak9oZL2a4vRG9iWUxHQCGZc=@vger.kernel.org
X-Gm-Message-State: AFuF++krwAuWVTECe1vJ0K13Jm35L28Tu37HEyYBmU/ANGfinziNpx74
	2mN1I1WffTjyobm9ow8RAVeEVkynEqLJzjV96dHhFaYm94Wwq7H1BRg=
X-Gm-Gg: AYBFou3BFtjwv96pgCLzq6i/VqElhyGTQeEw/LiOsMHpe1Ec7ebz1AB8BJwURoqtLx+
	Q2OI8+fmt5q+jpvnWlnEaeM0aeeqAMKzRPtj2OiRWxHToppvGjDx5tGiRN7z/gVtwNbrO8BzhO3
	YVEAkOY9GsBtZd0A5eaR9cxtXqqMDf8aTbD9rGivGMcaIxcmqoNmtbft8hR3sV/wPuf9eVPS6Cq
	Fu8A0G1kPq/C0eD+rdrEbssHJipITZ2jNZSgUqYaG4DnLx4w0v0cAYTvVJBgjfYxfkU5d3OhJCX
	/hm1C8FE9HPcNA0r1IHeRM3DDj7gSxGg55Mz7L8yNg7UxzrRqYGnqGhFwZ4e+cjQN27ticjuck6
	+zKCO/ceiWd5Rw+AxtqnP07v4ILvl75WS8weE8MWliTnZIdjkzDln9YD/NNd5UloLcGL1fVJVwe
	DaM1Vjwtn0OWR8gEQAPx30BQwDkrEaWtx9hBeNheZ432CEBVzW7I2zAcfAVjObU0ao/0chWGLoq
	TvsCIK4S9tD4w==
X-Received: by 2002:a17:90b:1d05:b0:398:9bd1:3210 with SMTP id 98e67ed59e1d1-39dec0bdc55mr2456899a91.17.1789361831544;
        Sun, 13 Sep 2026 21:57:11 -0700 (PDT)
Received: from DL2XHKPB4.dl.net ([103.63.104.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d994872e0sm18824792a91.8.2026.09.13.21.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 21:57:11 -0700 (PDT)
From: Triet Hoang <triet.hoang.dev@gmail.com>
To: sidong.yang@furiosa.ai,
	royalnet026@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	ogabbay@kernel.org,
	tomeu@tomeuvizoso.net,
	triet.hoang.dev@gmail.com
Subject: [PATCH v6 2/2] drm/rocket: Keep scheduler allocation in rocket_file_priv
Date: Mon, 14 Sep 2026 11:56:05 +0700
Message-ID: <20260914045605.381933-3-triet.hoang.dev@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
References: <20260914045605.381933-1-triet.hoang.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The scheduler array passed to drm_sched_entity_init() is retained by the
entity when the device has multiple cores. drm_sched_entity_init() stores 
the list conditionally:

	entity->sched_list = num_sched_list > 1 ? sched_list : NULL;

With one scheduler, it keeps only entity->rq and drops the array pointer
while rocket_job_open() allows its local copy to go out of scope. So
for num_cores == 1 the kfree() in rocket_job_close() is a kfree(NULL)
and the array leaks unreachably. For num_cores > 1 there is no leak,
which is why this is invisible in normal use on RK3588.

Keep the allocation in rocket_file_priv so rocket_job_close() can destroy
the entity before freeing the array. Free the array directly if entity
initialization fails, since rocket_job_open() does not call
rocket_job_close() on that error path.

Fixes: 0810d5ad88a1 ("accel/rocket: Add job submission IOCTL")

Suggested-by: Igor Paunovic <royalnet026@gmail.com>
Link: https://lore.kernel.org/all/20260817093009.22359-1-royalnet026@gmail.com/
Signed-off-by: Triet Hoang <triet.hoang.dev@gmail.com>
Tested-by: Igor Paunovic <royalnet026@gmail.com>
Tested-by: Sidong Yang <sidong.yang@furiosa.ai>
---
Changes in v5:
- Free rocket_priv->scheds instead of entity->sched_list in rocket_job_close().

Changes in v6:
- Add Tested-by and Fixes tags.
- Move kfree() below the drm_sched_entity_destroy() call in rocket_job_close().
- Update commit message to explain why the scheduler array must outlive the scheduler entity.
---
 drivers/accel/rocket/rocket_drv.h | 1 +
 drivers/accel/rocket/rocket_job.c | 4 +++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/rocket/rocket_drv.h b/drivers/accel/rocket/rocket_drv.h
index 2c673bb99ccc..9421e48ec5d8 100644
--- a/drivers/accel/rocket/rocket_drv.h
+++ b/drivers/accel/rocket/rocket_drv.h
@@ -23,6 +23,7 @@ struct rocket_file_priv {
 	struct drm_mm mm;
 	struct mutex mm_lock;
 
+	struct drm_gpu_scheduler **scheds;
 	struct drm_sched_entity sched_entity;
 };
 
diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/rocket_job.c
index 704a15513179..f27e6264f91d 100644
--- a/drivers/accel/rocket/rocket_job.c
+++ b/drivers/accel/rocket/rocket_job.c
@@ -528,6 +528,8 @@ int rocket_job_open(struct rocket_file_priv *rocket_priv)
 				    rdev->num_cores, NULL);
 	if (ret)
 		kfree(scheds);
+	else
+		rocket_priv->scheds = scheds;
 
 	return ret;
 }
@@ -536,8 +538,8 @@ void rocket_job_close(struct rocket_file_priv *rocket_priv)
 {
 	struct drm_sched_entity *entity = &rocket_priv->sched_entity;
 
-	kfree(entity->sched_list);
 	drm_sched_entity_destroy(entity);
+	kfree(rocket_priv->scheds);
 }
 
 int rocket_job_is_idle(struct rocket_core *core)
-- 
2.53.0

