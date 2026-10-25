Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792930172;
	b=PUswa07LomWpuMs3IPvoZjYIH7h7JpN6z6BWHKatH+/z1BOoNncNHtEuDSA5RJGSyoqi
	 bQhiUBo106taWfkO3VNtMAkgX7ZLqr2Kzcrg87EggYiLLkO+9u84oXL3AxLzSAC8T6sPC
	 mUrpZ6+tUzVFoe/vT/y8y7/P1QgqX4Bx7ouIHjw+6g/rWl2XRLl5yao8gH9/VspORaVkh
	 i6Nn++YbFwiB1dwK8zqyyxs1kh4n31MUosiYGN/ly/iHQonDbHTrUYPvxADpqYUoGY03d
	 t6UOHMpaxUWsIqeizymvjPd8RYGekLKpiSxD9MHxwq4LlcXE4hfLO3fPzoesKlGaVCQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792930172;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=a995Dm/5BTmmuNdFImu0YZINKYRwMq3Z1BgBkz0ytC0=;
	b=eLANB3JmRnw0uLm3rl3+QoNmGXvKwbfYHFfNAdUlF8O2nUwlRUBBau5i4ar4islVvrzB
	 Qcy4edP9X9rsJC8S6YMyNzJQeN+quiXPSy3bBiiQAmUHELYuf3N/x8+52JlP3QUCZZLnE
	 A36H3VnQxGI1j3bIi8Km/1c1pssSTFd8AgfLqlsvo8FaRONTWVjj0FvqsNWRVuCM82Xmw
	 FPnML9KuOzVvjQueB/qaHcegPHaOhorg2UUOoBCe5PAyUX/aMq5UcEeJ3vwVyA0SdQ4Xt
	 APBTnwzHYPctXt+X1P2wsMv+rFRUL1szWnOnHvCFDisEuXekhNbj61+ue7we90IwA0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0PbtIcw;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.54
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66219606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 12:09:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66219606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=C0PbtIcw
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af9a9451daso3274567a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 05:09:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792930171; cv=none;
        d=google.com; s=arc-20260327;
        b=nDs3Xf8pJ5YZ4m48WeE4l3CQzs9BB7zT9GfIlkJQ3TiJI6EtXF1r4sFqx7t9Lemj+l
         QLDrXZ+cWZfMS7GLnmXImvv5GoMFm+JntCTyUEhSQRdu8ZosJWp9hCdagXcdiJ8kG/0m
         2p2mAOGThKnbeIq1TgJPttIieb1UCslaVeLvYthpFPGwaZkk66tuaXTxxRMED0NWpbyA
         kJrC8Ah77vgwseWWjCEK/nks5Mk2rNpVmRKTbBPi7aKlH23VePNghEY71Qi09yh/Pwbe
         uxNbDjfAhctQ92O/bKBEk5uaAa+vWA+1+2k51IU1bch9nr2iueu7qBv4e0ZCA19Bpuhk
         aFBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=a995Dm/5BTmmuNdFImu0YZINKYRwMq3Z1BgBkz0ytC0=;
        fh=biUPy/SQskorktrAIIOnTfZnRtM0bHV/1fUEieWZWmk=;
        b=ln60Izp0qW27/9VFx5d198tE7lc1dNfN0+UAMc0SJITKqvJzPP3c0opCQlnXiMjP0h
         Wow/cinhUdyDV9xWBt5Poa9hMEaeOTrCgtItZPSae8Wsy/p4EJvrGXs2mpgGGCCUeVKg
         S2BT6kNJ5BqyuTy2P6yZKNz868X4GTEpYUvNJXEb5UJg//+BcxfnGpI8Naafun9rBNga
         zes1mIAJS3iZL4us86RGJen59GunLwhPlud9z70KcrJxyriUwMk9peSY1th0Eia+7TOQ
         N53QufuMhtEZz+1DKN/2L7MwlvAhA/ZtypWEyd0hccvreojkXijauR60gmwxn8j1u61p
         pNJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792930171; x=1793534971; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=a995Dm/5BTmmuNdFImu0YZINKYRwMq3Z1BgBkz0ytC0=;
        b=C0PbtIcw+QvCCJ4HmA6ZCkuOdrITrn1rwh0zxM0jPVAy1Pv4EdrG7IQ4W5X9o/s90i
         okrpayLvFSMEARPAn6xMhg1OREQCRla6mXVTkNw9r384uLFG05nPY10okn5LuK7zRE0j
         AYvFxIj8/umPAD5I78ViBHoBBYEVDIaRgOsKBJYdYnvkP3l6jUYtuuvS+4ShAqblwn/A
         vMAY2KG9lDIwNHcJ7EzC4Q8oC+Xeg5fh9ym2DaU2I4TptMdXWD2Sd2gYkwlkVvZLyn9p
         HsN/TeQ0VyORnucMxX3f7FsJP0dxjN/YyhCIWuL4NsJ+Bifw7oc/YYhOm24S2oo+anPD
         HDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792930171; x=1793534971;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a995Dm/5BTmmuNdFImu0YZINKYRwMq3Z1BgBkz0ytC0=;
        b=ns7+k+btESEzEGDwZrPQKA8TgnSQGagYlyOxSctgP27TKtMZLegNlPGKI4gqHNSkSS
         ED1ijzaeb98q4bCVQjJ22C0AErVZCAXC0UY7ZI60HzuhAb1LwBZeEInnbgx9t1EMkyFM
         ofk3nVzV88TcIGpjAliWHGJBxrcyV7lI6Vv+u7/cBZ8bpBOYOSOxXiYXfX0/AQbB0IDN
         jHl738Us1w/CeZMHEiWuOWB3igICdBC6Kx2SkBlfKd/rri1W4BxkJ/GDrXookatrz+WH
         c959S3WFBXFErTyTkabMPOQkN6FdkCzUuOLDgCamR+WEJ2v5BSB5KbWTwHNWFr3GwFwG
         6v5w==
X-Forwarded-Encrypted: i=1; AKwUvByYWmwbK4a6zzBEd3eyOMlx0xIMmHOV1rpqqeS5mIqzVzCiaC6fnQbCezKM5bt1I+9FjOpv1h83Wigr+xg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLMTsgbnvsqXdoavSW7kAtl7WxcjX6rsMWwufoNSOltfhFfPqkO
	w3Sl40QMNijToUTxndWWaEPDl1Rv8Hww5heBz0lpPVvcekgRiCLqd/3uWQ09F/swQe+WwA/YSdM
	AjeCEv7w9znKXXG4SoTnmH+balrsJF9E=
X-Gm-Gg: AYBFou2J8Y5/351M4HpvpSNkjgjlLMw/MqWubT3PJF/3VhoJMLthMbD1SNYZNIONC9W
	HHlPOrbSD8tOdZKagm+VWGtX66OTi/9kCyQXBOKC1YTnmP6vNaIupCRC3asNUxATiRiaX5FXXMf
	tqx3mcvecMtgV8vi8Rob8f1VRht0dmJHGIUC3KnVpMuZg504ED/BrWDaduJSYy+1M7p1ibHNI0I
	jBmD3prAwFVN3uvvo8F4yhl86/LznvwTzCzid2rkysCbHm1a0jy5O6hHRQ1sPluaDIXyGmZIIw4
	TYjzp82IolJjUxwD9Z0aq8jtnaBrbbSQriLwHUKIt9Y1JlukmmeKdt590EtiMAPUDoe9B9vd7zq
	RCeOQdI3dW4UoVrQotyDIRGCw5BqYpL9OGoc=
X-Received: by 2002:a17:907:94cf:b0:c2e:3f49:df04 with SMTP id
 a640c23a62f3a-c46bdaf8b27mr471383466b.1.1792930170435; Sun, 25 Oct 2026
 05:09:30 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: =?UTF-8?B?7J207J6s7ZuI?= <dlwognsdc6100@gmail.com>
Date: Sun, 25 Oct 2026 21:09:18 +0900
X-Gm-Features: AclHuK_NQG-FPVaZjrn9OhnO2a1wfu6rKiyQZ5UFTcUxTw58REiCUkZs91sNnC0
Message-ID: <CAE5fF3jr6A=UiC6vMv1q=JM4Fjm1n+eX4xCsRBQycxybk2oWAg@mail.gmail.com>
Subject: [RFC PATCH v2] drm/v3d: add write-back BO mappings and cache sync
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Melissa Wen <mwen@igalia.com>
Cc: Iago Toral Quiroga <itoral@igalia.com>, dri-devel@lists.freedesktop.org, 
	linux-api@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: JaeHoon Lee <dlwognsdc610@gmail.com>

Add V3D_BO_WB_MMAP to request WB CPU mappings. Keep WC as the default.
Set map_wc before getting the BO pages, and use WB for the kernel mapping
only when the BO is native and uses WB.

Add V3D_SYNC_BO, based on Panfrost's BO sync API. It takes a list of BO
ranges and supports cache flush or flush and invalidate. Reject imported
BOs and invalid ranges or sync types.

Indirect CSD uses a CPU job to read three 32-bit workgroup counts. Sync
this 12-byte input range before the CPU reads it from a WB BO.

Signed-off-by: JaeHoon Lee <dlwognsdc610@gmail.com>
Assisted-by: LLM
---
Sorry, the wrong version of the email was sent without my Signed-off-by
trailer. I also forgot to Cc Iago Toral.
Please use this version instead.

This is an RFC for the V3DV host-cached memory work. The Mesa changes are
on this branch:
https://gitlab.freedesktop.org/yserrr/mesa/-/commits/v3dv-host-cached

V3DV uses WB for native HOST_CACHED memory. Internal BOs, including the
uniform BO, still use WC. Shared allocations, images and TRANSFER_DST
buffers also use WC. TRANSFER_DST needs cache sync in the CPU jobs that
copy query results.

Hardware tests were run on a Raspberry Pi 5 with a backport to
6.18.34 and a rebuilt V3DV driver. Native BO creation and
mapping, sync batches, and checks for invalid inputs passed.

If I have missed anything, please let me know so I can fix it.

Base: drm-misc-next cf61bef3801c3c9d0d8c39026b7b2fb242898a3a


 drivers/gpu/drm/v3d/v3d_bo.c    | 127 ++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/drm/v3d/v3d_drv.c   |   1 +
 drivers/gpu/drm/v3d/v3d_drv.h   |   3 +
 drivers/gpu/drm/v3d/v3d_sched.c |  16 +++++
 include/uapi/drm/v3d_drm.h      |  52 +++++++++++++++-
 5 files changed, 192 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_bo.c b/drivers/gpu/drm/v3d/v3d_bo.c
index db95a2fac..1eaa57c64 100644
--- a/drivers/gpu/drm/v3d/v3d_bo.c
+++ b/drivers/gpu/drm/v3d/v3d_bo.c
@@ -16,6 +16,8 @@
  */

 #include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/uaccess.h>
 #include <linux/vmalloc.h>

 #include <drm/drm_print.h>
@@ -147,8 +149,8 @@ v3d_bo_create_finish(struct drm_gem_object *obj)
        return 0;
 }

-struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file
*file_priv,
-                            size_t unaligned_size)
+static struct v3d_bo *v3d_bo_create_flags(struct drm_device *dev,
+                                         size_t unaligned_size, u32 flags)
 {
        struct drm_gem_shmem_object *shmem_obj;
        struct v3d_bo *bo;
@@ -159,6 +161,12 @@ struct v3d_bo *v3d_bo_create(struct drm_device
*dev, struct drm_file *file_priv,
                return ERR_CAST(shmem_obj);
        bo = to_v3d_bo(&shmem_obj->base);
        bo->vaddr = NULL;
+       /*
+        * Use map_wc=true for WC by default.
+        * V3D_BO_WB_MMAP sets map_wc=false for WB.
+        * WB memory needs explicit cache sync.
+        */
+       bo->base.map_wc = !(flags & V3D_BO_WB_MMAP);

        ret = v3d_bo_create_finish(&shmem_obj->base);
        if (ret)
@@ -171,6 +179,12 @@ struct v3d_bo *v3d_bo_create(struct drm_device
*dev, struct drm_file *file_priv,
        return ERR_PTR(ret);
 }

+struct v3d_bo *v3d_bo_create(struct drm_device *dev, struct drm_file
*file_priv,
+                            size_t unaligned_size)
+{
+       return v3d_bo_create_flags(dev, unaligned_size, 0);
+}
+
 struct drm_gem_object *
 v3d_prime_import_sg_table(struct drm_device *dev,
                          struct dma_buf_attachment *attach,
@@ -195,9 +209,13 @@ v3d_prime_import_sg_table(struct drm_device *dev,
 void v3d_get_bo_vaddr(struct v3d_bo *bo)
 {
        struct drm_gem_shmem_object *obj = &bo->base;
+       pgprot_t prot = pgprot_writecombine(PAGE_KERNEL);
+
+       if (!drm_gem_is_imported(&obj->base) && !obj->map_wc)
+               prot = PAGE_KERNEL;

        bo->vaddr = vmap(obj->pages, obj->base.size >> PAGE_SHIFT, VM_MAP,
-                        pgprot_writecombine(PAGE_KERNEL));
+                        prot);
 }

 void v3d_put_bo_vaddr(struct v3d_bo *bo)
@@ -213,12 +231,12 @@ int v3d_create_bo_ioctl(struct drm_device *dev,
void *data,
        struct v3d_bo *bo = NULL;
        int ret;

-       if (args->flags != 0) {
+       if (args->flags & ~V3D_BO_WB_MMAP) {
                drm_dbg(dev, "unknown create_bo flags: %d\n", args->flags);
                return -EINVAL;
        }

-       bo = v3d_bo_create(dev, file_priv, PAGE_ALIGN(args->size));
+       bo = v3d_bo_create_flags(dev, PAGE_ALIGN(args->size), args->flags);
        if (IS_ERR(bo))
                return PTR_ERR(bo);

@@ -230,6 +248,105 @@ int v3d_create_bo_ioctl(struct drm_device *dev,
void *data,
        return ret;
 }

+int v3d_bo_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
+{
+       struct drm_gem_shmem_object *shmem = &to_v3d_bo(obj)->base;
+       struct sg_table *sgt;
+       struct scatterlist *sg;
+       unsigned int i;
+
+       if (offset + size < offset)
+               return -EINVAL;
+
+       if (offset + size > obj->size)
+               return -EINVAL;
+
+       if (drm_gem_is_imported(obj))
+               return -EINVAL;
+
+       if (type != V3D_BO_SYNC_CPU_CACHE_FLUSH &&
+           type != V3D_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
+               return -EINVAL;
+
+       if (shmem->map_wc)
+               return 0;
+
+       if (!size)
+               return 0;
+
+       sgt = drm_gem_shmem_get_pages_sgt(shmem);
+       if (IS_ERR(sgt))
+               return PTR_ERR(sgt);
+
+       for_each_sgtable_dma_sg(sgt, sg, i) {
+               dma_addr_t addr = sg_dma_address(sg);
+               size_t len = sg_dma_len(sg);
+
+               if (!size)
+                       break;
+
+               if (offset >= len) {
+                       offset -= len;
+                       continue;
+               }
+
+               addr += offset;
+               len -= offset;
+               len = min_t(size_t, len, size);
+               size -= len;
+               offset = 0;
+
+               dma_sync_single_for_device(obj->dev->dev, addr, len,
DMA_TO_DEVICE);
+               if (type == V3D_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE)
+                       dma_sync_single_for_cpu(obj->dev->dev, addr,
len, DMA_FROM_DEVICE);
+       }
+
+       return 0;
+}
+
+int v3d_sync_bo_ioctl(struct drm_device *dev, void *data,
+                     struct drm_file *file_priv)
+{
+       struct drm_v3d_sync_bo *args = data;
+       struct drm_v3d_bo_sync_op *ops;
+       struct drm_gem_object *obj;
+       unsigned int i;
+       int ret = 0;
+
+       if (args->pad)
+               return -EINVAL;
+
+       if (!args->op_count)
+               return 0;
+
+       ops = kvmalloc_objs(*ops, args->op_count);
+       if (!ops)
+               return -ENOMEM;
+
+       if (copy_from_user(ops, u64_to_user_ptr(args->ops),
+                          args->op_count * sizeof(*ops))) {
+               ret = -EFAULT;
+               goto out;
+       }
+
+       for (i = 0; i < args->op_count; i++) {
+               obj = drm_gem_object_lookup(file_priv, ops[i].handle);
+               if (!obj) {
+                       ret = -ENOENT;
+                       goto out;
+               }
+
+               ret = v3d_bo_sync(obj, ops[i].type, ops[i].offset, ops[i].size);
+               drm_gem_object_put(obj);
+               if (ret)
+                       goto out;
+       }
+
+out:
+       kvfree(ops);
+       return ret;
+}
+
 int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
                      struct drm_file *file_priv)
 {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8d914dbc3..0fcf6ceed 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -264,6 +264,7 @@ static const struct drm_ioctl_desc v3d_drm_ioctls[] = {
        DRM_IOCTL_DEF_DRV(V3D_SUBMIT_CPU, v3d_submit_cpu_ioctl,
DRM_RENDER_ALLOW | DRM_AUTH),
        DRM_IOCTL_DEF_DRV(V3D_PERFMON_GET_COUNTER,
v3d_perfmon_get_counter_ioctl, DRM_RENDER_ALLOW),
        DRM_IOCTL_DEF_DRV(V3D_PERFMON_SET_GLOBAL,
v3d_perfmon_set_global_ioctl, DRM_RENDER_ALLOW),
+       DRM_IOCTL_DEF_DRV(V3D_SYNC_BO, v3d_sync_bo_ioctl, DRM_RENDER_ALLOW),
 };

 static const struct drm_driver v3d_drm_driver = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index 7c7bdf6e5..d5db64bf5 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -595,10 +595,13 @@ struct v3d_bo *v3d_bo_create(struct drm_device
*dev, struct drm_file *file_priv,
                             size_t size);
 void v3d_get_bo_vaddr(struct v3d_bo *bo);
 void v3d_put_bo_vaddr(struct v3d_bo *bo);
+int v3d_bo_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size);
 int v3d_create_bo_ioctl(struct drm_device *dev, void *data,
                        struct drm_file *file_priv);
 int v3d_mmap_bo_ioctl(struct drm_device *dev, void *data,
                      struct drm_file *file_priv);
+int v3d_sync_bo_ioctl(struct drm_device *dev, void *data,
+                     struct drm_file *file_priv);
 int v3d_get_bo_offset_ioctl(struct drm_device *dev, void *data,
                            struct drm_file *file_priv);
 int v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 1924e3440..17648a913 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -396,6 +396,22 @@
v3d_rewrite_csd_job_wg_counts_from_indirect(struct v3d_cpu_job *job)
        struct drm_v3d_submit_csd *args = &indirect_csd->job->args;
        struct v3d_dev *v3d = job->base.v3d;
        u32 num_batches, *wg_counts;
+       int ret;
+
+       /*
+        * WB memory needs cache sync before the CPU reads the three counts.
+        * The GPU job that wrote them must finish first.
+        */
+       if (!drm_gem_is_imported(&bo->base.base)) {
+               ret = v3d_bo_sync(&bo->base.base,
+                                V3D_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE,
+                                indirect_csd->offset, 3 * sizeof(*wg_counts));
+               if (ret) {
+                       dma_fence_set_error(job->base.done_fence, ret);
+
dma_fence_set_error(indirect_csd->job->base.done_fence, ret);
+                       return;
+               }
+       }

        v3d_get_bo_vaddr(bo);
        v3d_get_bo_vaddr(indirect);
diff --git a/include/uapi/drm/v3d_drm.h b/include/uapi/drm/v3d_drm.h
index d9b01f4c3..ca7352e96 100644
--- a/include/uapi/drm/v3d_drm.h
+++ b/include/uapi/drm/v3d_drm.h
@@ -44,6 +44,7 @@ extern "C" {
 #define DRM_V3D_SUBMIT_CPU                        0x0b
 #define DRM_V3D_PERFMON_GET_COUNTER               0x0c
 #define DRM_V3D_PERFMON_SET_GLOBAL                0x0d
+#define DRM_V3D_SYNC_BO                           0x0e

 #define DRM_IOCTL_V3D_SUBMIT_CL           DRM_IOWR(DRM_COMMAND_BASE +
DRM_V3D_SUBMIT_CL, struct drm_v3d_submit_cl)
 #define DRM_IOCTL_V3D_WAIT_BO             DRM_IOWR(DRM_COMMAND_BASE +
DRM_V3D_WAIT_BO, struct drm_v3d_wait_bo)
@@ -64,6 +65,8 @@ extern "C" {
                                                   struct
drm_v3d_perfmon_get_counter)
 #define DRM_IOCTL_V3D_PERFMON_SET_GLOBAL  DRM_IOW(DRM_COMMAND_BASE +
DRM_V3D_PERFMON_SET_GLOBAL, \
                                                   struct
drm_v3d_perfmon_set_global)
+#define DRM_IOCTL_V3D_SYNC_BO             DRM_IOWR(DRM_COMMAND_BASE +
DRM_V3D_SYNC_BO, \
+                                                  struct drm_v3d_sync_bo)

 #define DRM_V3D_SUBMIT_CL_FLUSH_CACHE             0x01
 #define DRM_V3D_SUBMIT_EXTENSION                 0x02
@@ -237,11 +240,13 @@ struct drm_v3d_wait_bo {
        __u64 timeout_ns;
 };

+/* WB BOs require explicit cache sync. */
+#define V3D_BO_WB_MMAP 4
+
 /**
  * struct drm_v3d_create_bo - ioctl argument for creating V3D BOs.
  *
- * There are currently no values for the flags argument, but it may be
- * used in a future extension.
+ * The flags argument may request V3D_BO_WB_MMAP for a write-back CPU mapping.
  */
 struct drm_v3d_create_bo {
        __u32 size;
@@ -278,6 +283,49 @@ struct drm_v3d_mmap_bo {
        __u64 offset;
 };

+/* Valid flags to pass to drm_v3d_bo_sync_op */
+#define V3D_BO_SYNC_CPU_CACHE_FLUSH                    0
+#define V3D_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE     1
+
+/**
+ * struct drm_v3d_bo_sync_op - BO map sync op
+ */
+struct drm_v3d_bo_sync_op {
+       /** Handle of the buffer object to sync. */
+       __u32 handle;
+
+       /** Type of sync operation. */
+       __u32 type;
+
+       /**
+        * Offset into the BO at which the sync range starts.
+        *
+        * This will be rounded down to the nearest cache line as needed.
+        */
+       __u32 offset;
+
+       /**
+        * Size of the range to sync
+        *
+        * size + offset will be rounded up to the nearest cache line as
+        * needed.
+        */
+       __u32 size;
+};
+
+/**
+ * struct drm_v3d_sync_bo - ioctl argument for syncing BO maps
+ */
+struct drm_v3d_sync_bo {
+       /** Array of struct drm_v3d_bo_sync_op */
+       __u64 ops;
+
+       /** Number of BO sync ops */
+       __u32 op_count;
+
+       __u32 pad;
+};
+
 enum drm_v3d_param {
        DRM_V3D_PARAM_V3D_UIFCFG,
        DRM_V3D_PARAM_V3D_HUB_IDENT1,
