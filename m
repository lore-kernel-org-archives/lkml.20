Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03309309EF4
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 13:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788095248; cv=none; b=cNJ5LUd99HMv7JHLQDfbtgwtzrpt2WU7F7Nz2V8zaWPX6dC8LOGFRPbhu55fPBiuBd7h53wv6pHfWKybZ7gFxMIw9Rt2mb653ZCACk/EYxtQkn6JVRTRpvDb0R4XvhGgJOtiASROiQsyIOwYLACGMHw+TsMLt9Xw033ufDGYzAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788095248; c=relaxed/simple;
	bh=HSmkZaU5um5sq0Qt6uORYxOtOEKxN0bOvLzk2TFw+8A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9nObCvPkRIW8/zSFjThdX9xDzJSygSMvEZQ+Snc+bKbTXSKPVGobyWwEse12VOqHxf6WME0XnBpwTJKSrudhInjKmb+ph+Sfpj2S437s8remD85dzI0yi+M0mSAaBE3HGcxjbVn1nm+DQRnmCBdFgDcE2qSF1IeotCQ9xc5d8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nRi/4JGa; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nRi/4JGa"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d6f624c323so25131145ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 06:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788095246; x=1788700046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ff+tAYyxP+Ja85LcjLz6eITSmOy44S8AX6xrfczNf6Y=;
        b=nRi/4JGafYlSwrPR/fSbtPfY6eROQSkQSgI50eBkJAfVvZHrTvxzSkHxXJjJrXS2y2
         LU2RWHZyG/3ogSGfl/6nCMnT8HsohOQzNpl2+C5lkhZzKCciNo1lT2o1o1u2oaLcxZ1K
         VtdlCa3zt8+t8uHFxWcc4cGOrl/FAOvStxYBie8KvYMe7l+P2IRW18eOyvrpTfktzQSS
         4DrYrfQDXUAQCAnXB9Nk4O9I+ItmZ2H3eV/25BnYs6Y4nXIe2qpogsNlp2vcodCdQUL2
         s1bv2cwXV5vAIBqKtZdUNWTpNMh/GrSE2BWSnlH6W+z56ZWoY/v3Hy3cXWSXUZEeAkSF
         aUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788095246; x=1788700046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ff+tAYyxP+Ja85LcjLz6eITSmOy44S8AX6xrfczNf6Y=;
        b=qjU9DC2tvU0qeFxfmzW+hom4CTn5lqfocZDEtPGqfAxjknjAF2pjiQ2qOzeMwmTBp6
         GsaQGsm63v7pKcLzyvngj3yYC9ekzSb217mJKItdqpsPAGdRKaqAGRzl9kScPeZbxFY8
         1ID/t2NMxHfJm5lNNplU2pUkYr4Z9wUzbFkH3j7UZEVoE99Mz0ubKYLExOPt7sDwBkGa
         iPkZ0nJF8xkFNL0Pf+Qkd3i7fBbQDcu0Oes/t38+Pl+t4CSVKi4CiZJkSIJ8aXkxA1mg
         SyRBBuVWYKJaR99pF7HjFaqhsMdk1tsHbuKEXK5E7HqUNAW9S5cWdedrsIhYpnoF3XOr
         Usfg==
X-Forwarded-Encrypted: i=1; AKwUvBz9RPTRLVLRz7oVNAvz0edGAmCl2Jr4aB9CfeUz9ENuY4qhV+yxs7NGA8IJKmJU0lpfR/wwvT8OGR+Krfk=@vger.kernel.org
X-Gm-Message-State: AFuF++kYb/w0rr9TEi+HrH2K/Ssvdry1LRGejkxaI06TurWLJCjKP2Pt
	C2nSK1w1EhdKT+UEwBACgY2IttWdQTN6fXP/rYuBr0gPx69+daCT086l
X-Gm-Gg: AYBFou0EigLPtX5Wc8aVj8nTPOAvoM4wrDsUAdXD1p0+jubXnV4z/CvVzf5d/5oKPLx
	biXozB06DT4hIRmzyyGVwYPUl60DXeXR67oI3B/N5VyCMU3zDYeLhhSDcRHxQOuUvSDLnVQa5g3
	xcdeRyu7drvAKV8IJBaTAoSVjMTTY4RoHA0uQg37o4+uBxrbkmL3W+PcZlp6pv+1Y3Hb9AINMtA
	ohqCYS37b8xixFJfAFWqNl8FXWa4JM2D6o4Briu/0fVaXyuI+amDA2BFGI4RK1BCLmU8s8sIaAu
	9Z4gfYEw2Fs3Ld8MGVJhM7ICl3PLGYohaHldw003s8woiV51Y/mVFO2fWnw6ub+iYIkEUcqxeTB
	mD7rKZpr8tV/cWcmoorRt7/GUee8XcijofzV+okMXifv4acRFNCtoq3eSvSmpZNOhUNLrPc5Bwr
	KdEEWCIoEQq9HVOPZPy+CegZEonsK6i96oE6L44v9WOKq1gV99YJx+t0+M31ZN+iQoFs+XSvPVe
	bdD1TDsJ5efIKwLD2s9BFeZHeXlXQEKcryuIduRNXc=
X-Received: by 2002:a17:903:320d:b0:2cc:6018:f030 with SMTP id d9443c01a7336-2d74df16112mr345982995ad.14.1788095246201;
        Sun, 30 Aug 2026 06:07:26 -0700 (PDT)
Received: from hnkz-ubuntu-vm1.mshome.net (flh4-125-195-69-140.tky.mesh.ad.jp. [125.195.69.140])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d7598d26e4sm22386025ad.84.2026.08.30.06.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 06:07:25 -0700 (PDT)
From: Kazuki Hanai <hnkz.64@gmail.com>
To: mripard@kernel.org,
	dave.stevenson@raspberrypi.com
Cc: mcanal@igalia.com,
	kernel-list@raspberrypi.com,
	maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	eric@anholt.net,
	bbrezillon@kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Kazuki Hanai <hnkz.64@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] drm/vc4: Hold a GEM reference while purging userspace BOs
Date: Sun, 30 Aug 2026 22:07:00 +0900
Message-ID: <20260830130700.680041-1-hnkz.64@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

vc4_bo_userspace_cache_purge() removes a BO from the purgeable list and
then drops the list lock before taking the BO madvise lock. A concurrent
final GEM put can therefore release the BO while the purge path still
holds only a raw pointer.

Acquire a non-zero GEM reference while the purgeable list lock still
protects the lookup. If final release has already started, drop the list
lock so the release path can remove the entry and retry. Put the temporary
reference after dropping the madvise lock to avoid recursing into final
release while that lock is held.

Fixes: b9f19259b84d ("drm/vc4: Add the DRM_IOCTL_VC4_GEM_MADVISE ioctl")
Cc: stable@vger.kernel.org
Signed-off-by: Kazuki Hanai <hnkz.64@gmail.com>
---
 drivers/gpu/drm/vc4/vc4_bo.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 49ea2ed0996b4..5289e69f3345f 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -319,6 +319,19 @@ static void vc4_bo_userspace_cache_purge(struct drm_device *dev)
 		struct drm_gem_object *obj = &bo->base.base;
 		size_t purged_size = 0;
 
+		/*
+		 * The last GEM reference can be dropped concurrently. Its free
+		 * callback removes the BO from this list before releasing it, so
+		 * the list lock makes an unless-zero get safe. Never carry only a
+		 * raw list pointer across the lock drop below.
+		 */
+		if (!kref_get_unless_zero(&obj->refcount)) {
+			mutex_unlock(&vc4->purgeable.lock);
+			cond_resched();
+			mutex_lock(&vc4->purgeable.lock);
+			continue;
+		}
+
 		vc4_bo_remove_from_purgeable_pool_locked(bo);
 
 		/* Release the purgeable lock while we're purging the BO so
@@ -345,6 +358,7 @@ static void vc4_bo_userspace_cache_purge(struct drm_device *dev)
 			vc4_bo_purge(obj);
 		}
 		mutex_unlock(&bo->madv_lock);
+		drm_gem_object_put(obj);
 		mutex_lock(&vc4->purgeable.lock);
 
 		if (purged_size) {
