Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524353;
	b=S4f5cJ8i/YuDbqIt5lztUSKxZm085KKMM5xQvVdGAP9Ee3sfJ+fMBwYWfucmPtSVpY9L
	 vrjXrlVng+kf/o1G3RI6JUzNZVsjDY1TD30sxDwIjfqxISOak/8X2hS/mijG6sl8fJ5Vv
	 3neEBg8BzZJD1L2RMD8vhsK/hPz8jaiWG4GTY0UetZzGtZmGYSaaDOtTseSYGTAYAXd40
	 XnQATBHO5/I+sZsobAWVqiQrO21H6hfcFMECRIu95uZTA1A/g451SVKJjqEAYwE7YhpFK
	 nVWTBpUwF0ZR8QUoXkEz1r3U71H+/Nh/50aowBseg9qIYkP178FuYOcil3oDim5nJ2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524353;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=4xpeSCzbdtgpV+wabu6FimfaTfSr38PgllCPL0OdJGU=;
	b=BCiXECqdAtjJRRROB5zejB+RdXlMzIgUzdqkd/DlhBPKV88gj30i/DuVfljvqvcwRHwT
	 /k1Ysl1Y/YNqC1Ppl+ban9ao1VcDtqgo/sHbx7yTqsPqU8SyKi0WSQC+biL7q3i5lr5AY
	 eVMrxbmxe7ClNfwYLOISM9FztMzPPgzwsh/aU4byVIF1+k/0ruPtgSCx7FjLDlZk0ys8B
	 6O9vvHwaf+KxOAWLhcodlXKFsBYuf1H1NAUrpIZ41aanhvqa8UIxYbNz6JjUNndqQYlE+
	 k7DZ/3ErszkGJ/YGPqmS05KOYBdaj6sk3/ec7lzstBu1Q3ajsUEcTPWRy7EzCy8A/tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.180
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F808606A8B2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:59:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F808606A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-8b360828905so4667517b3.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:59:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524352; x=1795129152;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4xpeSCzbdtgpV+wabu6FimfaTfSr38PgllCPL0OdJGU=;
        b=U2LbNKzYqXn19QGDoUkuBqHoSUArEUsjtJIOmyEl5jYItt6enKQffxVhTl9/YselZQ
         GSyHIdwBb91H+QlyLH/zxj5BJdD0A8u4hwZWuOiH4MimT85ZxVSSLGaHGFZ+obAFwKiY
         cfKgnrHgU6W/3JMQEkWoMxBpMQOe2/LNBs+YocXUJe0VKigPNVc/w/FxG3CFaNCRPxmO
         OUND0Ohb4LVUuxFZcleQbZ8sseZcYRewwu5+2KW2U72jRfRHjJejyxlAW9es5OXTM+GE
         pr/eqI5GQbzlPBqn/F/5VdD1Ce1fRTeXE9UcjNv8sBEmxJgVfdC2q/Accacqadzqf2JC
         /txQ==
X-Forwarded-Encrypted: i=1; AL+hErGV+wKuiNnwzRAFvGtCEAmCDSCR0/+q+n2hziVgpa8/nc4HZQ70Hd1AEI0NVHP89j6s1Z+TgKweaIe1v5M=@vger.kernel.org
X-Gm-Message-State: APuU4Z/FpmoydVlhFeDXqCdfuTQ8u+1+XWZIB73HfuIaFVmb9ZZebYF3
	Y7Jjo+BFFf6cRpze1ZgVfgBZipyr3HlJ0svPo9tuaQuKazRuyuRXnVlaaN99Ey38r2Motg==
X-Gm-Gg: AYBFou2pfQR24clW8pPn63Hwz/3rlZ7ExqkTcFMKc4l1Zp4fv6o3WTl8jk/Dadwk4Iu
	Ar21DpiGV7vIhRuYHfLFHQ21JRIP8nU2JsybWqukg7gbTbKj077xOD0d0/a2oWtVSXHT49X1XDU
	rfrrv9VS+qLAr8PUVHrsyG5JuXiIApoyjcb1yQJgKJLprMbSARNb2aH3vuyF+R0Iy0NmfRl94nb
	nmwZn6v3hMxo5yjRDuN8HgtWxROpTJIxCeyslfYjXTO+J9pPd93qtu6usSfsQhmzgFTfxvPxnsZ
	T0TjEZC0PbCKCBzhOjKqhNr6vZdnH6IiZFNFRLV5RiDGsyBT6A6ik0S3jcirS+13ZZC1ZwhgQ5p
	fH8uiI0dc7k3nSIQ2Kxt6hWuJl/0PlLoAsVqQjRCni8VIZOBH4FQZ6bI+TubEjoBM7crm5xDs2M
	fbYijbTf8hIrHRMU/v5EldpkYqclB6hvU5OJkQGdbfES2TtxVJCmlgnQyPvgKdDZYOoihpDC7U5
	TrrQKQiUaZzFbEhxjGJUKiLhtd0WrDx000cUeFTK5ivRTiJhnG6VeWk47ewEWNsPgArwWBESdlt
	cb/s/fK+LIRbzc9v5ODBAOFN+dAfRaw5Mq5678tgCT9xZCNsPw71ET72ZYRL4r76sRUDRqiiBhq
	UPeAZHn57xPFjpuJ5vHY1m2XrCiddfL4EYwPPEXXBsBU7r4C+1CUjWQAqCtU4pDqdJwuXCry844
	e7+o4dw4U5dJCym2tCqRw7MJLO
X-Received: by 2002:a05:690c:6987:b0:8b3:361f:5d7a with SMTP id 00721157ae682-8b4aa25cab2mr5540957b3.41.1794524352554;
        Thu, 12 Nov 2026 14:59:12 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f354asm7261077b3.14.2026.11.12.14.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:59:11 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 17:58:53 -0500
Subject: [PATCH RFC 03/13] drm/gma500: Export GEM objects as dma-bufs
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-powervr-sgx-v1-3-c69b84bac011@telaak.dev>
References: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
In-Reply-To: <20261112-powervr-sgx-v1-0-c69b84bac011@telaak.dev>
To: dri-devel@lists.freedesktop.org, 
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: imagination@lists.freedesktop.org, Frank Binns <frank.binns@imgtec.com>, 
 Gabriel Gama <operatingsystemsdepression@gmail.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>, 
 Philipp Stanner <phasta@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 linux-media@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joseph Telaak <joseph@telaak.dev>
X-Mailer: b4 0.16.0

A render GPU next to gma500 draws into gma500's scanout buffers: on
Cedarview the SGX545, driven by powervr_sgx through gma500's auxiliary
device, renders while gma500 scans out. Mesa's kmsro allocates the
buffers on the display device and imports them into the render device,
which needs gma500 to export them.

Add the pin, unpin, get_sg_table, vmap and vunmap hooks the PRIME
helpers need. An export pins the object's pages, write-combined as for a
framebuffer, but doesn't insert them into the GTT: the importer maps the
pages itself, and powervr_sgx takes a write-combined kernel mapping of
an import for its cache maintenance. (A CPU mmap through
dma_buf_mmap() still goes through psb_gem_fault(), which pins the object
into the GTT.) A use count shares the pages between GTT pins, exports
and kernel mappings. Objects in stolen memory have no struct pages and
can't be exported.

The PRIME helpers call pin and unpin with the object's reservation lock
held, and psb_gem_pin() and psb_gem_unpin() take that lock themselves.
Split each into a variant that expects the lock held.

The importer's CPU mapping, dma_buf_mmap(), goes through the object's
fake mmap offset, which a dumb buffer only gets from MAP_DUMB, and Mesa's
kmsro never calls that for the buffers it exports. Create the offset at
export.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpu/drm/gma500/gem.c | 182 ++++++++++++++++++++++++++++++++++++-------
 drivers/gpu/drm/gma500/gem.h |   1 +
 2 files changed, 153 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/gma500/gem.c b/drivers/gpu/drm/gma500/gem.c
index 4a4ecfb7b..9eff7a739 100644
--- a/drivers/gpu/drm/gma500/gem.c
+++ b/drivers/gpu/drm/gma500/gem.c
@@ -11,11 +11,14 @@
  *		accelerated operations on a GEM object)
  */
 
+#include <linux/iosys-map.h>
 #include <linux/pagemap.h>
+#include <linux/vmalloc.h>
 
 #include <asm/set_memory.h>
 
 #include <drm/drm.h>
+#include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vma_manager.h>
 
@@ -26,71 +29,104 @@
  * PSB GEM object
  */
 
-int psb_gem_pin(struct psb_gem_object *pobj)
+/*
+ * The object's pages, write-combined, for a GART pin or a PRIME export: an
+ * exported object needs them, not a slot in the small GTT aperture.
+ */
+static int psb_gem_get_pages_locked(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+	struct page **pages;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (pobj->pages_use++)
+		return 0;
+	pages = drm_gem_get_pages(obj);
+	if (IS_ERR(pages)) {
+		pobj->pages_use--;
+		return PTR_ERR(pages);
+	}
+	set_pages_array_wc(pages, obj->size / PAGE_SIZE);
+	pobj->pages = pages;
+	return 0;
+}
+
+static void psb_gem_put_pages_locked(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+
+	dma_resv_assert_held(obj->resv);
+
+	if (WARN_ON(!pobj->pages_use) || --pobj->pages_use)
+		return;
+	/* Reset caching flags */
+	set_pages_array_wb(pobj->pages, obj->size / PAGE_SIZE);
+	drm_gem_put_pages(obj, pobj->pages, true, false);
+	pobj->pages = NULL;
+}
+
+static int psb_gem_pin_locked(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
 	struct drm_device *dev = obj->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
-	struct page **pages;
 	unsigned int npages;
 	int ret;
 
-	ret = dma_resv_lock(obj->resv, NULL);
-	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
-		return ret;
+	dma_resv_assert_held(obj->resv);
 
 	if (pobj->in_gart || pobj->stolen)
 		goto out; /* already mapped */
 
-	pages = drm_gem_get_pages(obj);
-	if (IS_ERR(pages)) {
-		ret = PTR_ERR(pages);
-		goto err_dma_resv_unlock;
-	}
+	ret = psb_gem_get_pages_locked(pobj);
+	if (ret)
+		return ret;
 
 	npages = obj->size / PAGE_SIZE;
 
-	set_pages_array_wc(pages, npages);
-
-	psb_gtt_insert_pages(dev_priv, &pobj->resource, pages);
+	psb_gtt_insert_pages(dev_priv, &pobj->resource, pobj->pages);
 	if (dev_priv->mmu)
-		psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pages,
+		psb_mmu_insert_pages(psb_mmu_get_default_pd(dev_priv->mmu), pobj->pages,
 				     (gpu_base + pobj->offset), npages, 0, 0,
 				     PSB_MMU_CACHED_MEMORY);
 
-	pobj->pages = pages;
-
 out:
 	++pobj->in_gart;
-	dma_resv_unlock(obj->resv);
-
 	return 0;
+}
+
+int psb_gem_pin(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+	int ret;
 
-err_dma_resv_unlock:
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ONCE(obj->dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
+		return ret;
+	ret = psb_gem_pin_locked(pobj);
 	dma_resv_unlock(obj->resv);
+
 	return ret;
 }
 
-void psb_gem_unpin(struct psb_gem_object *pobj)
+static void psb_gem_unpin_locked(struct psb_gem_object *pobj)
 {
 	struct drm_gem_object *obj = &pobj->base;
 	struct drm_device *dev = obj->dev;
 	struct drm_psb_private *dev_priv = to_drm_psb_private(dev);
 	u32 gpu_base = dev_priv->gtt.gatt_start;
 	unsigned long npages;
-	int ret;
 
-	ret = dma_resv_lock(obj->resv, NULL);
-	if (drm_WARN_ONCE(dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
-		return;
+	dma_resv_assert_held(obj->resv);
 
 	WARN_ON(!pobj->in_gart);
 
 	--pobj->in_gart;
 
 	if (pobj->in_gart || pobj->stolen)
-		goto out;
+		return;
 
 	npages = obj->size / PAGE_SIZE;
 
@@ -99,13 +135,18 @@ void psb_gem_unpin(struct psb_gem_object *pobj)
 				     (gpu_base + pobj->offset), npages, 0, 0);
 	psb_gtt_remove_pages(dev_priv, &pobj->resource);
 
-	/* Reset caching flags */
-	set_pages_array_wb(pobj->pages, npages);
+	psb_gem_put_pages_locked(pobj);
+}
 
-	drm_gem_put_pages(obj, pobj->pages, true, false);
-	pobj->pages = NULL;
+void psb_gem_unpin(struct psb_gem_object *pobj)
+{
+	struct drm_gem_object *obj = &pobj->base;
+	int ret;
 
-out:
+	ret = dma_resv_lock(obj->resv, NULL);
+	if (drm_WARN_ONCE(obj->dev, ret, "dma_resv_lock() failed, ret=%d\n", ret))
+		return;
+	psb_gem_unpin_locked(pobj);
 	dma_resv_unlock(obj->resv);
 }
 
@@ -133,8 +174,89 @@ static const struct vm_operations_struct psb_gem_vm_ops = {
 	.close = drm_gem_vm_close,
 };
 
+/*
+ * PRIME export, for a render GPU to draw into scanout buffers. Only objects
+ * with pages can be shared: stolen memory has none. An export pins the pages,
+ * write-combined, and doesn't insert them into the GTT. The PRIME helpers
+ * call pin and unpin with the reservation lock held.
+ */
+static int psb_gem_prime_pin(struct drm_gem_object *obj)
+{
+	struct psb_gem_object *pobj = to_psb_gem_object(obj);
+
+	if (pobj->stolen)
+		return -EINVAL;
+	return psb_gem_get_pages_locked(pobj);
+}
+
+static void psb_gem_prime_unpin(struct drm_gem_object *obj)
+{
+	psb_gem_put_pages_locked(to_psb_gem_object(obj));
+}
+
+static struct sg_table *psb_gem_prime_get_sg_table(struct drm_gem_object *obj)
+{
+	struct psb_gem_object *pobj = to_psb_gem_object(obj);
+
+	if (!pobj->pages)
+		return ERR_PTR(-EINVAL);
+	return drm_prime_pages_to_sg(obj->dev, pobj->pages, obj->size >> PAGE_SHIFT);
+}
+
+/*
+ * A kernel mapping for an importer, write-combined like the pages. It holds
+ * the pages as a PRIME pin does. The PRIME helpers call it with the
+ * reservation lock held.
+ */
+static int psb_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	struct psb_gem_object *pobj = to_psb_gem_object(obj);
+	void *vaddr;
+	int ret;
+
+	if (pobj->stolen)
+		return -EINVAL;
+	ret = psb_gem_get_pages_locked(pobj);
+	if (ret)
+		return ret;
+	vaddr = vmap(pobj->pages, obj->size >> PAGE_SHIFT, VM_MAP,
+		     pgprot_writecombine(PAGE_KERNEL));
+	if (!vaddr) {
+		psb_gem_put_pages_locked(pobj);
+		return -ENOMEM;
+	}
+	iosys_map_set_vaddr(map, vaddr);
+	return 0;
+}
+
+static void psb_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
+{
+	vunmap(map->vaddr);
+	psb_gem_put_pages_locked(to_psb_gem_object(obj));
+}
+
+/*
+ * dma_buf_mmap() maps through the object's fake offset (drm_gem_prime_mmap()),
+ * which a dumb buffer only gets from MAP_DUMB: make sure it has one.
+ */
+static struct dma_buf *psb_gem_prime_export(struct drm_gem_object *obj, int flags)
+{
+	int ret;
+
+	ret = drm_gem_create_mmap_offset(obj);
+	if (ret)
+		return ERR_PTR(ret);
+	return drm_gem_prime_export(obj, flags);
+}
+
 static const struct drm_gem_object_funcs psb_gem_object_funcs = {
 	.free = psb_gem_free_object,
+	.export = psb_gem_prime_export,
+	.pin = psb_gem_prime_pin,
+	.unpin = psb_gem_prime_unpin,
+	.get_sg_table = psb_gem_prime_get_sg_table,
+	.vmap = psb_gem_prime_vmap,
+	.vunmap = psb_gem_prime_vunmap,
 	.vm_ops = &psb_gem_vm_ops,
 };
 
diff --git a/drivers/gpu/drm/gma500/gem.h b/drivers/gpu/drm/gma500/gem.h
index 27df6ff4e..539f8f20a 100644
--- a/drivers/gpu/drm/gma500/gem.h
+++ b/drivers/gpu/drm/gma500/gem.h
@@ -27,6 +27,7 @@ struct psb_gem_object {
 	bool stolen;			/* Backed from stolen RAM */
 	bool mmapping;			/* Is mmappable */
 	struct page **pages;		/* Backing pages if present */
+	unsigned int pages_use;		/* GART pins and PRIME pins of @pages */
 };
 
 static inline struct psb_gem_object *to_psb_gem_object(struct drm_gem_object *obj)

-- 
2.50.1

