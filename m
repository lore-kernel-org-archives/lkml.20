Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F768442392
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756185; cv=none; b=g7MLnB+JwgHCQDXAqlhOYnu/6T1ZVreWVbwP6mi97CAY+yWZH22efIogbhGJ40ODFhN6CmB4bjxcpIy4XDl4ZuUZ04gTRA+QLjCixbkqDhv4QDLryg456aILdWbg5ECaFVMfXdn9ap4h33AiIwE97FVIRXsCw72Xjcl0OVQdioU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756185; c=relaxed/simple;
	bh=6nxPERHTdccMCsUoEfsZmeKNNYtONGLjFoRsi9B3dEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JkSOkfsLkdx6y5OQ6vc1HderMYpehZvNtNOMjeb/qNdkb++DjMnXL0xzzzOmsoggS+A7NohPbTAQpZCg2k+vzky55MnWJkF+kIvyhM9s3J5lG2tQsZyuL7+RWyvZkl+ObkFWEEEaXeLzUDdpMr1RGVloXj6xI8MAxUA8S8TTsdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Cbo4w4jX; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Cbo4w4jX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756181;
	bh=6nxPERHTdccMCsUoEfsZmeKNNYtONGLjFoRsi9B3dEE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Cbo4w4jXJVRKz4bMB7skMEpKBMp7IJw0hY2r6dgcZxyjV88Ikj2KdYBTNgR0mkqSw
	 yygKThmkqQ06tjC4CHnBGigAcnf6YJricnXJdyWnUlIoFTAGHQjhtI5LGgF+FkSO/n
	 sEndbTTp3lvlmAU1PX1DBUnxYd7IJoM7xmvjE5BvxTvJbHro18BqgBTZLXzUH949Wc
	 wWlwbSQRLDHSiI2WnMTVwbwCa9UaSZ99/6QpB/dFdrm92V/1nHGEbrrPz0sVZoU7G2
	 RRGMGNfd43/KT10KS21TtJjNm3MfwO0HX68pyNuufpGHPK73OhF5GOYZMBefwFE3hb
	 zwpyuN9dHpIxA==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 75ADD17E0FCD;
	Wed, 26 Aug 2026 16:56:21 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:03 +0200
Subject: [PATCH v4 04/18] drm/panthor: Flush the cleanup_wq in the unplug
 path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-4-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>, sashiko-bot@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=2353;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=6nxPERHTdccMCsUoEfsZmeKNNYtONGLjFoRsi9B3dEE=;
 b=CgdbnJRU4yas3cvXvvl1yUZyMgH7GHimBh0NhFw+ZyQKgeLM9WBLjr+nMIghHChruz447fojK
 MIid5SwU0UHB79h9oG6e1rhOTuVxPf7AubhOSlume011Z9o3LGt7t/4
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

If we don't do that, we might face various UAFs, because the resource
referenced by these work items might be gone by the time they get
executed.

In each subcomponent making use of the panthor_cleanup_wq, we add a
flush_workqueue() at the end of the _unplug() function. Note that this
assumes no more work items from this subcomponent gets queued after
that point, which is not yet guaranteed, but this will be fixed in
upcoming changes.

Fixes: de8548813824 ("drm/panthor: Add the scheduler logical block")
Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
Reported-by: sashiko-bot@kernel.org
Closes: https://sashiko.dev/#/patchset/20260625-panthor-signal-from-irq-v5-0-8836a74e0ef9@collabora.com?part=2
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c   | 6 ++++++
 drivers/gpu/drm/panthor/panthor_sched.c | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index d43ba1c7cd2a..1385ee28bee5 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -3367,6 +3367,12 @@ void panthor_mmu_unplug(struct panthor_device *ptdev)
 		}
 	}
 	mutex_unlock(&ptdev->mmu->as.slots_lock);
+
+	/* Ensure any pending job cleanup work are executed before returning,
+	 * otherwise those might access objects that are gone if the work is
+	 * executed after other components are unplugged.
+	 */
+	flush_workqueue(panthor_cleanup_wq);
 }
 
 static void panthor_mmu_release_wq(struct drm_device *ddev, void *res)
diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
index 42adfc76b9e1..a6d57dc1b43e 100644
--- a/drivers/gpu/drm/panthor/panthor_sched.c
+++ b/drivers/gpu/drm/panthor/panthor_sched.c
@@ -4049,6 +4049,12 @@ void panthor_sched_unplug(struct panthor_device *ptdev)
 		sched->pm.has_ref = false;
 	}
 	mutex_unlock(&sched->lock);
+
+	/* Ensure any pending group release work are executed before returning,
+	 * otherwise those might access objects that are gone if the work is
+	 * executed after other components are unplugged.
+	 */
+	flush_workqueue(panthor_cleanup_wq);
 }
 
 static void panthor_sched_fini(struct drm_device *ddev, void *res)

-- 
2.55.0

