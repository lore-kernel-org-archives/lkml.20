Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 108434756DF
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788523583; cv=none; b=GHbvI9uWhj3Yxwv6sW6CvBx/ZRolPT60hCCsoBH/d0CBcF2RGH+c570KdPNq2gL7kgpCNKhNYZ6OQFIilFB+xVfKLRibJVmDoKPXK83dm42TveqKb6fbfRLYfw9+SonMquhCbJopWqHHlHe5kFjZP+JWkWrl6HivdysOVKM1/vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788523583; c=relaxed/simple;
	bh=sPN9S2SipzeCvUtPxw8RMcHggMANadY+KjgyyNcHFCg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4qOENzfxbFNmuk4BtDVX2JRuX0dGrhoxfz7mM1/9Qk2GfRTxsQihKa+47V7QgL3xG9qcsb39Tcy+T+/nY0fcK79m4Qdshkzylu8DVQVLYdwAbYsko/PNVvbCt5CGTQvsePo4E2uciqgE9G9YafvZXYVBPUGKIUxek0TmMDx6jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pOasWwII; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pOasWwII"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6b1c75f0049so694766eaf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 05:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788523580; x=1789128380; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LpjAUK45k2PJKSjdfeljwO5d42gX8uNwxDJAnF1e9RY=;
        b=pOasWwIIt9BWLLuuZudzx+UGJbRieNF7J8i2WiRkGX4FoAzr4GhhsuYut5iK67QYv4
         LB0l5Tz+evzfTwkGHRQwQ1cSSFdUD6dMH1R5upg7WYBEdc7MoeEVq/nJ4sAiQRiAJopw
         /pHnaWp9OUQkV4diQ4zBct1poQRc30Eu9AVD0WKnftiY+ZvKUl8gFIe5QmEStM+4rz4t
         iW2kgpubuMAlDR6OBFsEs4/+YF/itI6NhoZ2KtAGlEQSoDOpUnFFGZ8zji/vfxfP78rw
         vjkfZTWym/IEMLrBMU/scCc3cU8T62srYnbwpbk0l+une4hZfCSgxQZpYVU4pvWG5WXT
         wr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788523580; x=1789128380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LpjAUK45k2PJKSjdfeljwO5d42gX8uNwxDJAnF1e9RY=;
        b=Pjv0O62OcONtjmg1jYTj/LNCQxzWtWUWx+0OGBSdU5pENSWjZMVfkBXnowFoYHMnIp
         YgtfutFsJz+jsYuPDKbqu6C0wZHzgVG5rywcR1r7+4WceolQyqtVl/x9cg77eBSdLcl2
         qeY1+9StRJqOrmCcCmLH44m26P4Z6YtbzyTRMlfs4YHT8W3D4yMPCYLCBxoO/m1f/x6Y
         MXsGAk2+tvilPQiYpfKFyKSKwd7khtC1dzg03no9DBMMqFAvDslQyOKU5JpP2iNoQUHO
         QIWvG/iHEqsH2VsLBYETZuFbPKv17c4COtbEQ4/th7RYIY/R77/ejqdsZYyAKeGBSKts
         pGdQ==
X-Gm-Message-State: AFuF++nkeJSCQIpdbsW4fWZ3iY9HHUqJ+rUvR/Fl6bL4a0jFuvDga9Wq
	AlvTD4l1pSMD+bNGjHWSoOG8eYKMz9uVitc/IfbCRcByFfstl2x6RTqB
X-Gm-Gg: AYBFou00ibMHHd/hgyq3JfkzfPaB42t4dMH0s/gmc0hs+uemkZCOzPCWORDoBpYDrrP
	TlzujZ3Z7XNGIrS9+BU14TkW/fZtp6SjLgDAYF4KxP/SMhhA3laAGB0COVmJnN0wcS8EcpZ33w4
	N7p2ZO5VnRie/l+Q6kpxL0OVfz++yORPEG7LYMUB7f/w+VQXMJqpvxgELg0ZwAH6qRpStsoeAuk
	aHT0xgFNzQ7HAIrPOlh8UZ3TXYtHTT5i4Nj3cR98UH+pVo1r1sRYxoxu9yaK2LY7U8RIOP07jkz
	LBiCRlf+L+qcNrcaMe2C0J9jid0u5BrP+gnINaQYIYHkpa7cwyZwu82en6fo4+ihECjm8uHBArK
	VLggmA9PGP7muxA8gr+AIeppCJZBL/ePdJcHXUFkAPphdDgTeXzGiFSBo0O24A09o8Q56owR2sx
	mxJCjP48ZZsYKYNaEkO/RC9yW+aijniJos3m93/w3GGFwH/BxSCTI7FUQoIMJTmNzbqQ2F9331V
	+ZTsx4FWFb5LJyYcGKqVDuHGw==
X-Received: by 2002:a4a:e914:0:b0:6b2:69bf:c8d7 with SMTP id 006d021491bc7-6b6fb3df17emr3896155eaf.10.1788523579864;
        Fri, 04 Sep 2026 05:06:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b8f44d7sm6321674eec.22.2026.09.04.05.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 05:06:19 -0700 (PDT)
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
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org
Subject: [PATCH 2/2] drm: fix repeated words in comments
Date: Fri,  4 Sep 2026 17:35:57 +0530
Message-ID: <20260904120601.18363-3-hemanth.selam@gmail.com>
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

Drop words accidentally written twice, reported by checkpatch.pl as a
possible repeated word.  Only touches comments, no code changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c  | 4 ++--
 drivers/gpu/drm/msm/msm_gem.c          | 4 ++--
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 2 +-
 include/uapi/drm/msm_drm.h             | 4 ++--
 4 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 27cac853975f..16fed0066f00 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1759,7 +1759,7 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
 		}
 
 		/*
-		 * Look for a level in in the secondary list that matches. If
+		 * Look for a level in the secondary list that matches. If
 		 * nothing fits, use the maximum non zero vote
 		 */
 
@@ -2378,7 +2378,7 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		goto err_memory;
 
-	/* Allocate memory for for the HFI queues */
+	/* Allocate memory for the HFI queues */
 	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
 	if (ret)
 		goto err_memory;
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index c4cff3d53d81..7ad450b574bf 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -502,8 +502,8 @@ void msm_gem_unpin_locked(struct drm_gem_object *obj)
 
 /* Special unpin path for use in fence-signaling path, avoiding the need
  * to hold the obj lock by only depending on things that a protected by
- * the LRU lock.  In particular we know that that we already have backing
- * and and that the object's dma_resv has the fence for the current
+ * the LRU lock.  In particular we know that we already have backing
+ * and that the object's dma_resv has the fence for the current
  * submit/job which will prevent us racing against page eviction.
  */
 void msm_gem_unpin_active(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
index 9d2788f79ace..d84cbb64bc56 100644
--- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
+++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
@@ -47,7 +47,7 @@ with_vm_locks(void (*fn)(struct drm_gem_object *obj),
 	      struct drm_gem_object *obj)
 {
 	/*
-	 * Track last locked entry for for unwinding locks in error and
+	 * Track last locked entry for unwinding locks in error and
 	 * success paths
 	 */
 	struct drm_gpuvm_bo *vm_bo, *last_locked = NULL;
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 3d363f12f66a..9b6b30189230 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -102,7 +102,7 @@ struct drm_msm_timespec {
  *
  * With VM_BIND enabled, userspace does not include a submit_bo table in the
  * SUBMIT ioctl (this will be rejected), the resident set is determined by
- * the the VM_BIND ops.
+ * the VM_BIND ops.
  *
  * Enabling VM_BIND will fail on devices which do not have per-process pgtables.
  * And it is not allowed to disable VM_BIND once it has been enabled.
@@ -366,7 +366,7 @@ struct drm_msm_vm_bind_op {
 	__u64 obj_offset;
 	/** @iova: Address to operate on */
 	__u64 iova;
-	/** @range: Number of bites to to map/unmap */
+	/** @range: Number of bites to map/unmap */
 	__u64 range;
 	/** @flags: Bitmask of MSM_VM_BIND_OP_FLAG_x */
 	__u32 flags;
-- 
2.48.1

