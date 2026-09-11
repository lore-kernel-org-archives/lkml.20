Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87415443C2C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789126843; cv=none; b=DXSHhgnumTXZuZNc19oqGyO+zlY7b9EFjPrx4u7HM7zfUON7R5dQdgr9Xt55EEEwmyzoOycMa7Kl32gqWyhQB5APfXssZjeF/ZuQyFityWWUATUjXQdSHfTHGT2HRBUryR86NhQGp42zlmeku5pbn+FWDahtyUtGVCO3jZcLZ1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789126843; c=relaxed/simple;
	bh=X6S/11y57oqtbjM71ajaTOSiWRdLx/vpH6BjAYqx7OI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tSU/2n5kH+izP7VjfmKB29D5AkJQPLQlJrxMVRfaqRZkz+J6Z9aBUtLHeeDl+ZR6Fra/1wcOPcctX42QT8PpOX9wbh5uQIokZNI9/+7t2164cVVNrIBAIdpC1g+gcGaOYMwTQervRuFGmQ8JitSX+BbPWK78wpeqC2zYI4Gn3KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=IAfqIuVP; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="IAfqIuVP"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4657E16F2;
	Fri, 11 Sep 2026 04:40:37 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 014CA3F59E;
	Fri, 11 Sep 2026 04:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789126840; bh=X6S/11y57oqtbjM71ajaTOSiWRdLx/vpH6BjAYqx7OI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IAfqIuVPw2zieMK3EAKVai13jx1z6G4/fGJxXZdHWKyrMmw7/9g84oZl1cHLvXzbg
	 +ObH8uItDpAy8MSwy3Y1Ll6xpVGUUvtkU6C5VyQkaviWt0iLqxbwah5ZfcLSxKEBIA
	 lQbvjTcXz2mcCjoHkcoNr2YiVRupJ9X6kUtgVfZs=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH v3 4/6] drm/panthor: Don't allocate protm_suspend_buf
Date: Fri, 11 Sep 2026 13:40:12 +0200
Message-ID: <20260911114014.79139-5-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911114014.79139-1-ketil.johnsen@arm.com>
References: <20260911114014.79139-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PROTM suspend buffer is only needed if the group is going to
use PROTM in the first place, so let's not assume we need one until
we're being asked to.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
---
 drivers/gpu/drm/panthor/panthor_sched.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index e02062e8443ec..0c8ea07fc7b9d 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -3636,9 +3636,11 @@ static void add_group_kbo_sizes(struct panthor_device *ptdev,
 	if (drm_WARN_ON(&ptdev->base, ptdev != group->ptdev))
 		return;
 
-	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
-	group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
 	group->fdinfo.kbo_sizes += group->syncobjs->obj->size;
+	group->fdinfo.kbo_sizes += group->suspend_buf->obj->size;
+
+	if (group->protm_suspend_buf)
+		group->fdinfo.kbo_sizes += group->protm_suspend_buf->obj->size;
 
 	for (i = 0; i < group->queue_count; i++) {
 		queue =	group->queues[i];
@@ -3716,14 +3718,6 @@ int panthor_group_create(struct drm_file *file,
 		goto err_put_group;
 	}
 
-	suspend_size = csg_iface->control->protm_suspend_size;
-	group->protm_suspend_buf = panthor_fw_alloc_suspend_buf_mem(ptdev, suspend_size);
-	if (IS_ERR(group->protm_suspend_buf)) {
-		ret = PTR_ERR(group->protm_suspend_buf);
-		group->protm_suspend_buf = NULL;
-		goto err_put_group;
-	}
-
 	group->syncobjs = panthor_kernel_bo_create(ptdev, group->vm,
 						   group_args->queues.count *
 						   sizeof(struct panthor_syncobj_64b),
-- 
2.43.0

