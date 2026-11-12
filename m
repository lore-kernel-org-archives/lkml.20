Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794524349;
	b=pIo37nyIvUriciwyUGcVoNT6yMbafR9AxAjrZGOzsCbfIi5qS8FnRvMf7eWcDLGSSsA0
	 mH4DJJ6zHhiAOfjsxFCXM4Q2JqauM07I5ZTTU/9DxGRTGrLyaypLTJzeBYmgSnwAFuIGK
	 FwuTsNJZm7YQpYfBTTuQz+rFX/HUfK8dPBQFWqqpX8fXGNMLdv68zBJ0Jn7iY+pVePEO9
	 5waYWj6Pw0d9IHIOt1Ytn3SzjMJL1lRP/3DXgYjbHjuUZRU0dMxxxv/YrY1/VMzXU18Di
	 ly9zynW64RIk9qIPhx6DDO5Cad84WY1NjoT/FUXPFIHGmu5PVaFaXAgKasDENUqNVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794524349;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=7n6Ho7cbKGIt/bJ4mNlulH+IAm5/LdmJToLUGkwX7ac=;
	b=ZIfe2IsxhkZxQE+MimWubgL/ysTZzb6IQ3JeX54O92e3d8GHAebAOPgF9mXOLOSC3+n0
	 YS66mvBuM8qEkUa+95cESZsp2Mf4BpPSWgvieoBobVElThkz65XfuBPh2//u225Ll+d8W
	 J+gNu/ZCKPegV/6rXNGzuhiCQQfp3OnCzlMFsiL/B7vpC21lMtDRIQ1lexIds9xGfOlRt
	 sZ2k8nrc4vGbodXqdc/a+gLD2g16L+oP2AYLUBraE2kKr3IAtR9pUHTjiUK1PafHCDaDz
	 Sv/ceu4LfxHYy/N4tGu3YAYvbqmTw4NpgZQ7lG69IAXrcN++psD7ZJAUejLTjY+X7Dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=telaak.dev;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.170
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7E2606A33D
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:59:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA7E2606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=telaak.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8b305d38bafso3293667b3.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 14:59:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794524348; x=1795129148;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7n6Ho7cbKGIt/bJ4mNlulH+IAm5/LdmJToLUGkwX7ac=;
        b=Fy/826KrRzlyJffPR0+H2OfA+H2LYwIV72oJ346e9AWaM6+eLqeF20PSv1nZBq8rnR
         s6Juo+IpiKnl9954AICTxwi5+Jgvo4zmXcGVko5QvQo1td4pfNLEHje5muAMhY264WOA
         ODIzQzLhR9pgnbVSyTA7Z9/YsJ5EUdnZuwd79SjnJH3+Z/6Fr93rJwAn05jJ9+o6z/Vc
         Eur0AlhoYM1fGuLyMsntI3IEH+gmGTaIPRXnj6q4awTyq7oPgKz31tXkHVl3NbjUg8eC
         F9rdYdaZfxHVyPQsCxL56OrwW1N6QyC3XLKasP6ZKLRrlZ9ZX5EDxexsvrFWDjYZdYj2
         rGGg==
X-Forwarded-Encrypted: i=1; AL+hErHgfj40uC0+AShgyHRhSMl+wBY06RGNZqmv6GnGE2K9y09w5FBo8PcnF6A91H+iuqQTgXa4o6LIkkbL4wA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1VgqBQ3oCcNCUwDgyLC/a2qD3qZUzMRjs6j0Bd16atfVnYWEa
	D7BEaQzkQjFpqgkOq4F+7MCcuiAV0NEP1/ptJ5t1p04hKFog03wbiWwS
X-Gm-Gg: AYBFou20hY3fHqTY3T6rJSqMT8ShHapafRXJetb+yunlGPJqQ+7hKFRCfIOEVSdUgUs
	NaUjMr6/Hl6d+EqC04iBwnsGIjCNDMDRi+XbExViQNXENR7bFnEecdGkmiuXjzMqC5+IzMOK30n
	bWl6LbdRjakXCBdWKD4U08q30V+eGyYCe4OfWIFBOnXTCSddFoMc4fKLI1jg673ojH5RkMkkuft
	K03Xhs/x3bhx9rxBEYh8HllIdVlzYd5lTF7dXwuvdgAJ5SPu1clMpfkFNqeyd60FXJIZCMF36CX
	CYzVVmN/INrytd6BaomEevXyZZ9H9R5m2bJCwbf5rX1JjQUI5IjdiT3d9jkcA7dQ7gUtf8sqiUm
	P2qRQ5Ay6p4sQ5jT5OU1cuerG1kumAxnn52NFnNV0Jl/ZOz5fwxWKTwLsV+2RspdVtaYzkyLlVJ
	5kavgKtcgSoSC8wplNDldNZinyVJK/ZFRu3RUXmvQABr0Q6AifIm3vzp99VGvCLM98GMxVfQD0K
	Dqa7CkZubhxIiFcuWJVph9KBVlf5XSP74UL86e+W91/byrl0Cd1/yER7xm9KaOdXA8mNPre1xd9
	rP0KqLzBRgQFMNqONotJSkoBa3zl0NoqQHAGQ8ExSrnHyjY6LVlKTZq4YC8eizJarNWr+/JFiqd
	2lOiJu0VU2Hosb2BoxuWUstNYWAR3YsAcKRxxhkB2nSXykVBe4FXWZN3dn6Vcba366XGuoOwiWw
	RQSCQSFVmt0Vk2nQm6YBr9HxiZ
X-Received: by 2002:a05:690c:c189:b0:8b3:5f41:3c3c with SMTP id 00721157ae682-8b4aa233286mr6243907b3.17.1794524348062;
        Thu, 12 Nov 2026 14:59:08 -0800 (PST)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([71.68.170.161])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa8f354asm7261077b3.14.2026.11.12.14.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 14:59:07 -0800 (PST)
From: Joseph Telaak <joseph@telaak.dev>
Date: Thu, 12 Nov 2026 17:58:51 -0500
Subject: [PATCH RFC 01/13] drm/gem-shmem: Map pages for the DMA device
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
Message-Id: <20261112-powervr-sgx-v1-1-c69b84bac011@telaak.dev>
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

A DRM device whose DMA goes through another device sets it with
drm_dev_set_dma_dev(). The DMA helper allocates and maps for that
device, and PRIME imports attach with it, but the shmem helper still
maps and unmaps its pages for drm_device.dev, and
drm_gem_shmem_prime_import_no_map() still attaches with it. On such a
device that is a struct device without DMA ops or a DMA mask.

Map and unmap shmem pages, and attach in
drm_gem_shmem_prime_import_no_map(), for drm_dev_dma_dev(), as the DMA
helper and drm_prime do. Nothing changes for drivers that don't set a
DMA device. Of those that do and use the shmem helpers (gud, udl,
gm12u320, appletbdrm), none maps an object's pages through
drm_gem_shmem_get_pages_sgt() or imports with
drm_gem_shmem_prime_import_no_map().

The first user is powervr_sgx, later in this series: behind gma500 its
DRM device is an auxiliary device, and its DMA goes through the GPU's
PCI function.

Signed-off-by: Joseph Telaak <joseph@telaak.dev>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index d654a22a3..4bce0a716 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -175,7 +175,7 @@ void __drm_gem_shmem_free_sgt_locked(struct drm_gem_shmem_object *shmem)
 {
 	dma_resv_assert_held(shmem->base.resv);
 
-	dma_unmap_sgtable(shmem->base.dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(drm_dev_dma_dev(shmem->base.dev), shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -535,7 +535,7 @@ void drm_gem_shmem_purge_locked(struct drm_gem_shmem_object *shmem)
 
 	drm_WARN_ON(obj->dev, !drm_gem_shmem_is_purgeable(shmem));
 
-	dma_unmap_sgtable(dev->dev, shmem->sgt, DMA_BIDIRECTIONAL, 0);
+	dma_unmap_sgtable(drm_dev_dma_dev(dev), shmem->sgt, DMA_BIDIRECTIONAL, 0);
 	sg_free_table(shmem->sgt);
 	kfree(shmem->sgt);
 	shmem->sgt = NULL;
@@ -854,7 +854,7 @@ static struct sg_table *drm_gem_shmem_get_pages_sgt_locked(struct drm_gem_shmem_
 		goto err_put_pages;
 	}
 	/* Map the pages for use by the h/w. */
-	ret = dma_map_sgtable(obj->dev->dev, sgt, DMA_BIDIRECTIONAL, 0);
+	ret = dma_map_sgtable(drm_dev_dma_dev(obj->dev), sgt, DMA_BIDIRECTIONAL, 0);
 	if (ret)
 		goto err_free_sgt;
 
@@ -964,7 +964,7 @@ struct drm_gem_object *drm_gem_shmem_prime_import_no_map(struct drm_device *dev,
 		return obj;
 	}
 
-	attach = dma_buf_attach(dma_buf, dev->dev);
+	attach = dma_buf_attach(dma_buf, drm_dev_dma_dev(dev));
 	if (IS_ERR(attach))
 		return ERR_CAST(attach);
 

-- 
2.50.1

