Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8547728A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523575; cv=none; b=uIkC5lDklAPMIpWf+Sesa7XKuvFwDKa/tz1arL6C5c62jr9w1gq6VVF/uDROUBZwXlVfoXnmF9xrSPCe7t4/bqYIQA+ftP0+6+8SV/Cv9GqreK7VOm7DXflec5P8OA938B4SWxHtfODjlf2f1U5BxIHD9wq0lWkSqNOuaqkaSVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523575; c=relaxed/simple;
	bh=O/ZeYLolTcCfV0GvkpQQktrGnB00dKmW9lHeT4GOfjI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d4FqIcKp3H7L7H1PdJIjyYvGgMUyy4J6IxNmsjdWt0E5X7rk4DuyUfB8zlXJ7jiXIuXo6U3C8jml3RRk/p/+Z1SgdRr/WnJeserg2hTBQufLVe6Axo2nDTGXl+e6A5l3NYTufBasQ67HepBtBxpJMVygGtaXN0S01TfzjaoWoGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P0c35STP; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P0c35STP"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-6b1b1cb72d0so459068eaf.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523572; x=1789128372; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mUnqZgZG6/HByiIclaEltYHSMp4tHK+7pXJmI++LxBc=;
        b=P0c35STPXPt3j5o3eoPvy1d3b0J6TzjYOrWKKDW81YQ+MBNHsszAB9TNiLfaLv7IRD
         HC7jLMKR3T6rf+qU10PuT4rg2xSlnMUZX3KDQWWBwI+ayE2s5PU/GABq9Kv/ryv/T9SE
         7IABuegaA6Rrt7xY3DDYUh1sl465+96Fx00w9yk4MPiiQPETDBwAwFCO4O5aWWm1lMLq
         NHPh3AyJv2+cV6LJDPXUxnQisfceIWDu0Tkbdw7OJMve6JSeXAtg+utI0EqCMu5wzQlE
         PzowV6Th4F4sOqfFmvKuq7VBKjKJE+KG5Lrr4vG7ZVMYN6BqMPQCrNG9/od9mKoRTSRB
         Zf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523572; x=1789128372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mUnqZgZG6/HByiIclaEltYHSMp4tHK+7pXJmI++LxBc=;
        b=jIvu9on8httOZNojoxvdh5jP0aWcE9x8U3xtPzEGIBclhI9IRavRVMpA/WyGk1pnUR
         Ge1JiRc03o5IpmPsWrg+f2dNjvaO2/H9H+79lhL4z2Lvpo3+buSSqXZMflj3K/Yxs6Uh
         PQAYdS9fFR13ooZqxcIOno8is8+yXMa8KsvJICLmQzy+eXcYI6l1UuaXNVbJS0Yk8iry
         p5YiYnucSNlUiv8IE5lFERc0EEj789AqWLP+tJ+xYUhE3pnubL9X29V1c6H4+e7Yc9G1
         kgU75s//H/7NjyamNLbwaCFBu+Ookb/DazkGk9UZsjMVvJDdc4Z9JjEmlBUqQV9OkT8D
         hvIw==
X-Gm-Message-State: AFuF++n5EQI7+yfvSkXAIZOBBjR5gfmI9ADO9muhZNrbKS8E2S3rFZRe
	2SW2QHFZoRbkeYS02JyU9ZRLipc63Xb7kfKUn+o3zuARrmmphxvDvOWx
X-Gm-Gg: AYBFou1rVcVzzeRGpPXfNDDi0ryckZ5XFd2JjeKsBWAk9zlujIzjV3I9I/Mcv6FO9wO
	Gi2bt7TbUXAw5z11phzwPxen0bu8XZQV/QthIDXVgY0ysH0j/Ogh9vcfYMx0FyHegKMb4Hot5t1
	ku9Peof5V9hYw3HyUg9rMfXhQJ+I9c4yHbjvQ+xwBMoQaIZXPlkuNPDz6W0sJTyHtNzhp8H+/iV
	/ueOFE+wgq0JFb8dZIu7QuyYOu8unT9I8HuKmn8fLHwaFlXb7qBU7Jvc37SpzZKlLCQ7tf/MMnI
	6Z0l+EzneqkWJEDYmKEwvOCMTWioIHVsl4d/yBGi9AJsZmahWHd5mwqEcOzOBiiUYs0jaGI9hMi
	sGtqVw2GXbCB6O0BfnpXc280vP3ORdZxKYsIqAOJap8rsq1W7ZwPqLfOFWPtsl2phVzUlmMjupO
	lR/6TuSoHb6+Je5ht88nUfYNE87RBueS4XuJeNUPVLHFimqxwo0HTAZBfkeOhjW85DXRsEyp6lA
	zOJz68a113umtg=
X-Received: by 2002:a05:6820:1992:b0:6b1:4173:ca4a with SMTP id 006d021491bc7-6b6fafe071emr3681918eaf.11.1788523572254;
        Fri, 04 Sep 2026 05:06:12 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm6321674eec.22.2026.09.04.05.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:06:11 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Akhil P Oommen <akhilpo@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm: fix typos in comments
Date: Fri,  4 Sep 2026 17:35:56 +0530
Message-ID: <20260904120601.18363-2-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260904120601.18363-1-hemanth.selam@gmail.com>
References: <20260904120601.18363-1-hemanth.selam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a5xx_power.c     | 2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c  | 2 +-
 drivers/gpu/drm/msm/dsi/dsi.c               | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c       | 2 +-
 drivers/gpu/drm/msm/msm_gem.h               | 2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 2 +-
 drivers/gpu/drm/msm/registers/gen_header.py | 2 +-
 8 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_power.c b/drivers/gpu/drm/msm/adreno/a5xx_power.c
index d6da7351cfbb..95f432de2bcc 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_power.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_power.c
@@ -8,7 +8,7 @@
 /*
  * The GPMU data block is a block of shared registers that can be used to
  * communicate back and forth. These "registers" are by convention with the GPMU
- * firwmare and not bound to any specific hardware design
+ * firmware and not bound to any specific hardware design
  */
 
 #define AGC_INIT_BASE REG_A5XX_GPMU_DATA_RAM_BASE
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 8cd2020d4b7e..667ed411076d 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -518,7 +518,7 @@ int adreno_set_param(struct msm_gpu *gpu, struct msm_context *ctx,
 			return UERR(EINVAL, drm, "requires per-process pgtables");
 
 		/*
-		 * We can only swtich to VM_BIND mode if the VM has not yet
+		 * We can only switch to VM_BIND mode if the VM has not yet
 		 * been created:
 		 */
 		if (ctx->vm)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 841f444a8d68..cb9606c21ba2 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -245,7 +245,7 @@ static int mdp5_plane_atomic_check_with_state(struct drm_crtc_state *crtc_state,
 			new_hwpipe = true;
 
 		/*
-		 * (re)allocte hw pipe if we're either requesting for 2 hw pipes
+		 * (re)allocate hw pipe if we're either requesting for 2 hw pipes
 		 * or we're switching from 2 hw pipes to 1 hw pipe because the
 		 * new src_w can be supported by 1 hw pipe itself.
 		 */
diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
index 3c9f01ed6271..1a1a59151e5c 100644
--- a/drivers/gpu/drm/msm/dsi/dsi.c
+++ b/drivers/gpu/drm/msm/dsi/dsi.c
@@ -246,7 +246,7 @@ int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
 	if (msm_dsi_is_bonded_dsi(msm_dsi) &&
 	    !msm_dsi_is_master_dsi(msm_dsi)) {
 		/*
-		 * Do not return an eror here,
+		 * Do not return an error here,
 		 * Just skip creating encoder/connector for the slave-DSI.
 		 */
 		return 0;
diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 959daa88b1d0..36c7ae94b1c8 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -347,7 +347,7 @@ static void dsi_mgr_bridge_post_disable(struct drm_bridge *bridge,
 	/*
 	 * Do nothing with the host if it is slave-DSI in case of bonded DSI.
 	 * It is safe to call dsi_mgr_phy_disable() here because a single PHY
-	 * won't be diabled until both PHYs request disable.
+	 * won't be disabled until both PHYs request disable.
 	 */
 	if (is_bonded_dsi && !IS_MASTER_DSI_LINK(id))
 		goto disable_phy;
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index dff60cbc9d95..a8e983b243b8 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -346,7 +346,7 @@ msm_gem_unlock(struct drm_gem_object *obj)
 
 /**
  * msm_gem_lock_vm_and_obj() - Helper to lock an obj + VM
- * @exec: the exec context helper which will be initalized
+ * @exec: the exec context helper which will be initialized
  * @obj: the GEM object to lock
  * @vm: the VM to lock
  *
diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.h b/drivers/gpu/drm/msm/msm_ringbuffer.h
index 3631ec283c6e..486280ca478e 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.h
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.h
@@ -101,7 +101,7 @@ struct msm_ringbuffer {
 
 	/*
 	 * preempt_lock protects preemption and serializes wptr updates against
-	 * preemption.  Can be aquired from irq context.
+	 * preemption.  Can be acquired from irq context.
 	 */
 	spinlock_t preempt_lock;
 
diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index d3b56a9d84fb..d6bfb7b7d7b3 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -576,7 +576,7 @@ class Parser(object):
             raise self.error(e)
 
     def parse_varset(self, attrs):
-        # Inherit the varset from the enclosing domain if not overriden:
+        # Inherit the varset from the enclosing domain if not overridden:
         varset = self.current_varset
         if "varset" in attrs:
             varset = self.enums[attrs["varset"]]
-- 
2.48.1

