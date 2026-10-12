Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31B348F008
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 13:00:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810020; cv=none; b=KM8V8ee6zXJEpU09qb0szQg00U/j0g/IOTDTLn/zAeikrs3GmMfQ9iJv4prjs5xWRm0DYdECKlrg9ITIaTqA1tWXuUhdxH22S/Sfv5UJpZwv9RKOyUA1qumbBQm34kzyJ7a7j38LIEVddH6zAf+DjInQrbugyIPBatuj2C+mrdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810020; c=relaxed/simple;
	bh=Ry3JNjMB+Fsbisdf0uBBhFf9ak8FzcNv8/bxwJRubU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sI1EaYPL4rPpBwl26wuClwCFsb5dOU8YTgtTjal3FzaEAP1MjbdYaDM85OBnJ1/67N1ymwSCz413+xAPwz4YyVOGu1r6V4jMiwbGSVAroGZsj+bJAcevRRg4MXdTLdG1YTZaR7Q7NE4BFHJV3qQfcNMc+et88Fog/QTB+H0hOlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l943e2Pe; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l943e2Pe"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BC30244B;
	Mon, 12 Oct 2026 06:00:13 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A3EB43F66F;
	Mon, 12 Oct 2026 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791810016; bh=Ry3JNjMB+Fsbisdf0uBBhFf9ak8FzcNv8/bxwJRubU4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l943e2PeT8k/ul91M8ZzsQeD30Mw+sVC8wcBJC0qjC5mmSz3hZ0FH6Ac1YQ+kaXt3
	 v1LSs821AlNAZxTwAOnzAZenQPOvZw1oLSCVKd0uIyGvJXj2hpoRu7Bwvl4ym5ld1R
	 odW53Bup+rIJxDHOY8Bjq2/HXebZVjZqUQ/GryM8=
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
Subject: [PATCH v4 08/12] drm/panthor: Refactor GEM usage flags assignment
Date: Mon, 12 Oct 2026 14:59:36 +0200
Message-ID: <20261012125940.3291951-9-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012125940.3291951-1-ketil.johnsen@arm.com>
References: <20261012125940.3291951-1-ketil.johnsen@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Boris Brezillon <boris.brezillon@collabora.com>

Changes panthor_gem_debugfs_set_usage_flags() to
panthor_gem_debugfs_add_usage_flags(). This will come in handy in a
later change when we split panthor_kernel_bo_create() to also handle
protected memory.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Co-developed-by: Ketil Johnsen <ketil.johnsen@arm.com>
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

---

v4:
- First version of this change as a separate commit
---
 drivers/gpu/drm/panthor/panthor_gem.c | 15 +++++++++------
 drivers/gpu/drm/panthor/panthor_gem.h |  2 +-
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index c07a44057e426..2e39a32fcd673 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -74,14 +74,16 @@ static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo)
 	mutex_unlock(&ptdev->gems.lock);
 }
 
-static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags)
+static void panthor_gem_debugfs_add_usage_flags(struct panthor_gem_object *bo,
+						u32 usage_flags)
 {
-	bo->debugfs.flags = usage_flags;
-	panthor_gem_debugfs_bo_add(bo);
+	atomic_or(usage_flags, &bo->debugfs.flags);
 }
 #else
+static void panthor_gem_debugfs_bo_add(struct panthor_gem_object *bo) {}
 static void panthor_gem_debugfs_bo_rm(struct panthor_gem_object *bo) {}
-static void panthor_gem_debugfs_set_usage_flags(struct panthor_gem_object *bo, u32 usage_flags) {}
+static void panthor_gem_debugfs_add_usage_flags(struct panthor_gem_object *bo,
+						u32 usage_flags) {}
 static void panthor_gem_debugfs_bo_init(struct panthor_gem_object *bo) {}
 #endif
 
@@ -1031,7 +1033,8 @@ panthor_gem_create(struct drm_device *dev, size_t size, uint32_t flags,
 		bo->base.resv = bo->exclusive_vm_root_gem->resv;
 	}
 
-	panthor_gem_debugfs_set_usage_flags(bo, usage_flags);
+	panthor_gem_debugfs_add_usage_flags(bo, usage_flags);
+	panthor_gem_debugfs_bo_add(bo);
 	return bo;
 
 err_put:
@@ -1644,9 +1647,9 @@ static void panthor_gem_debugfs_bo_print(struct panthor_gem_object *bo,
 	enum panthor_gem_reclaim_state reclaim_state = bo->reclaim_state;
 	unsigned int refcount = kref_read(&bo->base.refcount);
 	int reclaimed_count = atomic_read(&bo->reclaimed_count);
+	u32 gem_usage_flags = atomic_read(&bo->debugfs.flags);
 	char creator_info[32] = {};
 	size_t resident_size;
-	u32 gem_usage_flags = bo->debugfs.flags;
 	u32 gem_state_flags = 0;
 
 	/* Skip BOs being destroyed. */
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 5ae37d0d3646f..4da3f59693ce4 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -62,7 +62,7 @@ struct panthor_gem_debugfs {
 	} creator;
 
 	/** @flags: Combination of panthor_debugfs_gem_usage_flags flags */
-	u32 flags;
+	atomic_t flags;
 };
 
 /**
-- 
2.43.0

