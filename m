Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CDF391E76
	for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 21:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789853344; cv=none; b=MOpN9v+x0LB6O/n+aZccVB8jOZ738sbp+67tGrTkBfE1f3MOaqGwjnsdJv1PA9cM2aiFTbcFoqPB246O8MQmuak1bv67ySa9a0YejK31SqZ9uGzDurrXbCgbOvBN+Kx5eRxEwJbWERnJ6ziEei9e5vtGNy/mhtU8kkxiXkOv7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789853344; c=relaxed/simple;
	bh=+ZgBa5oxplc/pfhnwtyr03hcEQg5St2PAAKUz0F4xNg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+kcx3Uya/axHn4lS4SduXy1rPEG3SC8r/9zijV94W1t3n1d39dJ7c83RVxv8mlNaMOF3N40ZH6lubAHQQYo7l+3igTr9Jy9u229rhCBj06BsA0dzqw/+uGcwd65XSRFXzFBv1IxUPr/iqOX3nf7Q2j3S/WlLoT3ZjJQFl9p52E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RnQuKF0E; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RnQuKF0E"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd4f99cso1999535a91.0
        for <linux-kernel@vger.kernel.org>; Sat, 19 Sep 2026 14:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789853339; x=1790458139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jfuK4sNLwi6LLkfdWONjv/BG3p1tIa4X/0S+wLmRAsY=;
        b=RnQuKF0EB6Rv02TnMoW1tZ7aquz6j8uifZ+Dwo5I0A1WC58lnU6DvBxEGf3RjtQaqV
         294L1S9X4iuklCu7ytPj7VJGwedTUICzqBUcMDdjshAvlRcAIZnRqFZGd+gs8XoBDWpc
         5lk5tKlgM9hG4pq5aTghUYMlzz+xjKEEZKWmWpVJYGfPE6Xgf257lKHw61QUMCwFdK62
         aVaO+8lU3CQhoy8YPT7GEmFnXmf5v10BxLIGJJS/IOdK0fe1leMvIPMtMfx96II1SQ8U
         S5QnCrv1OPiVXoNIagFc/YvA0RrephRhGGauKaZnLB0zwr3Eva9UplY00ukI72gtpJos
         5p+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789853339; x=1790458139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfuK4sNLwi6LLkfdWONjv/BG3p1tIa4X/0S+wLmRAsY=;
        b=fU2fZJX895uzCZ0aw1RQ4lliGmOvhZBNkwCq9mbLZ9cSJbM/nD8r4xjSuwMne/kDS4
         FPQxDnQ70m94ia65z/znMYg53Gjnup7nr0645wbNy7yYG97t2AmMgYsfpSxFnifvSmE3
         QliShOua68qpg4Z22Fwl9bq+kV/xJpdsBgwI354d7uo21ZhfsuSbwZ1FzQ3cetabWY/Q
         8PckLC9loidjzozE5BxRjldCCG4Fb9SBMf/DuiRpkFNQLn09RyTdbORO8Z34n4IScHGK
         hWGrBXwXF0x9U+a0qXbAKyjnTVVwm/KchZpcFvMsYOgqPl1289/+zgMfZlmFEX4OCccD
         c6Tg==
X-Forwarded-Encrypted: i=1; AKwUvBx7a2r8r/erQjw/V0GsHqYVMQp3Oj4ii/swiHWNTcTmQSmu6M74RlGhal7yWJHr53uq0DJss2mJjgtbivI=@vger.kernel.org
X-Gm-Message-State: AFuF++n+8+G0WPfmH5MWoPnuSNYaw/Tv7ilpAIei8lkXVp5QLRa+YA8s
	552pzNExfoPcRONLZ2ySEYM3H0M2W+SkbnRK1qsx9KtlF3qUuPt8Scgb
X-Gm-Gg: AYBFou3sahTbPslQneQPOmjBoYSsLqjLhGcA7OeBo4ekQBVOMEBf8/WJ7qNQgXyfqcd
	SEZr+FlN1Z35+w6jcLuT848Yz1PpRCdRESk/trQ2mmXsvjHkNlonzpkxWBnEqAlVm5pin2iljRn
	vDtpAxq7d+TbFdKmLX1O4zG+TBxivGdqjwjQUvSGGrdpNsCl1iRjjqVRlu4CrKLN7v/O8KZOEVc
	MYh5n4JPbkfyAqx/nEGOFuZaPFnoNj0I+r+h/Y2TkaV0bsVDMbLlRDcfC7b98r2eQ8nuGOxNDmn
	lR9nQpm/d18KmTfwqETC63jYFiVMxXHs6c17XIwQrEZopc/+OyK2pGlETYabiSTW0qfJPI9bkrR
	TCiTE4+lAz+IhaZilyRNJbSMYDKLrMYM8JZpaqmMcMApO/8xXbUo/S2Ze2oUqdZuQ8GSleV9/4T
	RHNDv2NYQw4F8SjbZ9Yi5ngEMSs7G8r/9nTnJEtgENYt31K2+/+S2XWsB2dIZPRYCKJb+NAEUQo
	RQ5z2eu241FbIhN5WtmhPkqFPHBvfkucke9LoP6wheGDQrcUZQBk6BAL9s0LUYtyEwlBXoPID6E
	cNHS9zCIWA==
X-Received: by 2002:a17:90b:544e:b0:39e:6a82:afd0 with SMTP id 98e67ed59e1d1-39e6a82bbabmr5629083a91.34.1789853339125;
        Sat, 19 Sep 2026 14:28:59 -0700 (PDT)
Received: from phui-2.c.googlers.com.com (78.123.83.34.bc.googleusercontent.com. [34.83.123.78])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a031d63ca9sm1487914a91.14.2026.09.19.14.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 14:28:58 -0700 (PDT)
From: Hui Peng <benquike@gmail.com>
To: maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vgem: fix IDR slot and xa_node memory leak in vgem_fence_signal_ioctl()
Date: Sat, 19 Sep 2026 21:28:58 +0000
Message-ID: <20260919212858.3241545-1-benquike@gmail.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In `vgem_fence_signal_ioctl()`, `idr_replace(&vfile->fence_idr, NULL,
arg->fence)` is called instead of `idr_remove(&vfile->fence_idr,
arg->fence)`.

Because `idr_replace()` replaces the slot's pointer with `NULL` in the
underlying XArray without freeing the IDR slot (`xa_erase()`), the ID
remains allocated until the vgem file descriptor is closed. Repeated
`DRM_IOCTL_VGEM_FENCE_ATTACH` + `DRM_IOCTL_VGEM_FENCE_SIGNAL` cycles on
a long-lived vgem fd permanently accumulate `xa_node` slab allocations
in the kernel and exhaust the per-fd IDR space.

Replace `idr_replace(&vfile->fence_idr, NULL, arg->fence)` with
`idr_remove(&vfile->fence_idr, arg->fence)`.

Fixes: 407779848445 ("drm/vgem: Attach sw fences to exported vGEM dma-buf (ioctl)")
Assisted-by: LLM
Signed-off-by: Hui Peng <benquike@gmail.com>

---
 drivers/gpu/drm/vgem/vgem_fence.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_fence.c b/drivers/gpu/drm/vgem/vgem_fence.c
index 0e53ba7db629..5793be469b3c 100644
--- a/drivers/gpu/drm/vgem/vgem_fence.c
+++ b/drivers/gpu/drm/vgem/vgem_fence.c
@@ -200,12 +200,10 @@ int vgem_fence_signal_ioctl(struct drm_device *dev,
 		return -EINVAL;
 
 	mutex_lock(&vfile->fence_mutex);
-	fence = idr_replace(&vfile->fence_idr, NULL, arg->fence);
+	fence = idr_remove(&vfile->fence_idr, arg->fence);
 	mutex_unlock(&vfile->fence_mutex);
 	if (!fence)
 		return -ENOENT;
-	if (IS_ERR(fence))
-		return PTR_ERR(fence);
 
 	if (dma_fence_is_signaled(fence))
 		ret = -ETIMEDOUT;
-- 
2.55.0.1082.g2b9226bbc0-goog

