Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794390225;
	b=wT9bMbjnEyMJi2PvAfkDZiiGvP2UJxi2C2bnutp5ZZ96vA1QTuSqCRJakcMkrFrnPOu8
	 LmedwmTDFuV5I+H5389HyNJky+aFHEa+MOW583OJNA0syqvsN+ruvgaTfG8HV66yfMJXl
	 etzyxrzRlAp4UBD7N5TdcAEq0Nlkmsr/FmBjXAeX8JFLp9acwaCRXRsU7y1j8Z3AqeXv3
	 a7XXgYGKNMdrUHe1DMwRmjkOtPWEa6Bo14GHdxYMHDagPs45qMBYMnX982Elk5e0nPC5C
	 UBSBMDlPU2or2EjulxjFTp6xrZE38Rk06o5tE3JiQX2aFw7xm34m0i4fWfSA54IJYBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794390225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=17nTIOS/dd/uGgTMm9wblinmfvVg+kfi3Q9xJ7p3hHc=;
	b=JApQNCMo4AFJqSns5+BLFay8hDiRku+m8qFKG1wapX+HIZpzZ/1j1iIlkMUGoDBK3Hgb
	 GsJ4aW8/+Ez5ul56I69Lbs19K2tZZs/hwY8YYhuDCdiOiEqlRS0Lu5LQKWbDsVQg56iZS
	 rqfINujVOKa7dwPPLL3KRXtIkk3kdXHqs6l2fJhppnwl+pnBw06YlI1chSErHb2soJF9s
	 H6Bvh17UfbIkbb2zFFWagK4sQW/eAdlQDL/gw9pSLS5ttGEHB5rVpqu7DQXg/pxhijgcz
	 6HmtW9pE3t0l0fiUpk0zQPVKTJrV6qKVqqvBKYwJblBE+NUKeClE8vOUmR/MSf3BnDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i5pHfcrW;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EDD606A321
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:43:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5EDD606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=i5pHfcrW
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48e47347279so1902583f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794390223; x=1794995023; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=17nTIOS/dd/uGgTMm9wblinmfvVg+kfi3Q9xJ7p3hHc=;
        b=i5pHfcrWMMKA4GoKIB6t1PgDtvQJCwWDp/64vPrVXMMqxMrd0OkRdEypJ9xPl8uMo6
         vN9a8yV0hVH9Aox83Fm1W8A5stawAt8C/8qSMQQQcTrPBARKS5zSCSTKKHEJ3WQExXC/
         I52FNePvDXbKO/qpOCC3gTNnlfxstyxZImtXgLNlVKndezOdajxLJnBKJOZlMCkTQjmb
         Yc91I1PKvpjmx1B3DGPIWdhjdjKMI3Z/YMz6VH02kjz8jKHLIbR9uU8P9M8n0zJxjOhd
         UhbiUWGWBePBtiWiutUH8sHODpRoIoqqfGQ062N6SJ9Ojd4wvaT5t/MwITIae+rSB7QJ
         dZKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794390223; x=1794995023;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=17nTIOS/dd/uGgTMm9wblinmfvVg+kfi3Q9xJ7p3hHc=;
        b=fQ+zmnTnh1H5NvRmFUzWzKO9rLtlYMxnTHe7oes7taewDlhPIz4aTXePfXDb0V+Ls0
         3aLASJq1iIznntATDDv3N1rswiB7d+FO4naQCzdUH7gYf7pJ2o+awKkpLrNl8U5aPLrW
         JPyOh3mesf7jkrFwa9xy0iars7WTMOklN7WrWVmJqogmKlGD3wn6tI2m9R1Nz3pr4UVQ
         J+GhDOJ1LBpD594hv46XTA56NbU0L/ZmYDywk4jMA089qK3P511LdJ7f392PC186sSsS
         KzdnvNexa0hjdE5yNKzSJAy5QQ0uAtXActjCf6jjZSVVYXv2XYf6riDT/XAgYUZNB3yU
         IVcg==
X-Forwarded-Encrypted: i=1; AL+hErG5Sww/SFTCdng7lSqGRhGrT/wxg9c3lj6tCaLlkW+9ZNCCEHkkdc9ojpyl8LDZ1hnyCLkWE5192hN8eiI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+yQgGZJu+qILq3tX5muCol8zaTrFLSd7+PB3nFEO6xVi+KB6P3
	wv93em2QdeW//E5CR3/7ObJYC5gAnjZizgkZFNjmEIZdVpxBCCf+tYfPboZ8FROjmF0=
X-Gm-Gg: AYBFou3Yb3xuorKjVNdg4h3oQyq2vAE+vXAMjebr2IV7RV81uveexHPQpYjxHPHOUdm
	e76Q3NZ+vf7ax3YsN8uSz9byJYEteeRMd451aijRE+WU42FiLDFoW9TfJOHu8KziNim7iW3XQsH
	gcGwxUc0Rr7P35XlHi4AjxX+fOSliW1ACFzDEeDcw6RcvjlEKsKHDRF+t/ExPXL7F34NzYIbDe9
	nvTrHfniKo0D3of4aq9C4OYn3gliI0xStl+kiq9vIMZe3pop892EBXRXtbQ7ofiOxrZPm0OiznV
	vdA5D92bm7li7yxKlrQ6s17ueE55nLMozm0tP1z3nuTAXwmNv/Mt0wdCQ1LJze0TD7JWwZo0nB8
	FiXixyuP6RlsxOA4Z8I9sJ1IYJ8RJov3y/ADTGN9emt/m+f0/BnKpESGJ5yzS7hxs9cci3senPW
	uTaJNoIz6GYT62eIPjIdSCQpPVM/+mCPxEeoAtZ9qlJCtDEmELUNSO1gEcibS2zWznCqlBRKljA
	HnrTTQqurs6+8Cy0N6NQ6OtPtyFgO6fd+bPCaSJwUSmrDQ9zovPZA4flSCPd5cqDN9JWB2DJXus
	Lt2uhLzdx+SnAs5Jau3Uo9vNtDlvLurwB2YYnuCBGgWhuEiO4N7D9XKTF0KGUSd7F+NpRg8W
X-Received: by 2002:a05:6000:2506:b0:497:bd30:8df5 with SMTP id ffacd0b85a97d-499c434ba2fmr3395414f8f.2.1794390222924;
        Wed, 11 Nov 2026 01:43:42 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860::e1d1:d182])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365ccbccsm10200316f8f.44.2026.11.11.01.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:43:42 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Wed, 11 Nov 2026 10:43:18 +0100
Subject: [PATCH] drm/imagination: drop redundant zeroing of new GEM objects
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
Message-Id: <20261111-pvr-gem-drop-zeroing-v1-1-2dc725857053@baylibre.com>
X-B4-Tracking: v=1; b=H4sIALU49GoC/yXMQQ6CMBBA0auQWTtJiykCVzEuoB3rmNg2UyWEh
 rtTdfkW/xfIJEwZxqaA0MKZY6jQpwbsYwqekF01tKrttFYG0yLo6YVOYsKNJHLw2F2sHfpzryZ
 joKZJ6M7rb3u9/Z0/85Ps+/uCfT8AnEw+4HgAAAA=
X-Change-ID: 20261105-pvr-gem-drop-zeroing-67cc98380a55
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794390222; l=3784;
 i=glaroque@baylibre.com; s=20261019; h=from:subject:message-id;
 bh=5J7YBCe5j9+nwpij7d9ckYkfgn/eiOZ+W8MPorbIWNA=;
 b=jXV9kmOq6eP63sQqsQoSW70q6JsnWFoM+OGtbLmsKdJIx9xdThIWLdwEkoqj7cAiAG6LXxJ1/
 9vYT5k+p7oCB3KHyclIJ9uTuCM3bYzvi0nDgdTajHlv36UlUxr7laUQ
X-Developer-Key: i=glaroque@baylibre.com; a=ed25519;
 pk=nMpSg4NT6M6q143E089emouMc+MXpHO9CWmnEUfjhjI=

pvr_gem_object_create() clears every new object through a CPU mapping
so that userspace never sees data left by a previous owner of the
pages [1]. shmem already guarantees that: it clears each page it
allocates, and the dma_sync_sgtable_for_device() call that follows
makes those zeroes visible to the GPU. The second pass, write-combined
on non-coherent devices, only adds latency.

Link: https://lore.kernel.org/dd2ceacc-f59b-9c3c-e4ce-30b3bbd6939b@mailbox.org [1]
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
pvr_gem_object_create() clears every new object through a CPU mapping,
on top of the zeroing shmem already does. Dropping that pass speeds up
object creation, most visibly where it goes through a write-combined
mapping on a non-coherent platform.

Testing: drm-misc-next (41ecf852c073) with a Debian rootfs, on a TI
J722S EVM (BXS-4-64, arm64) and a SpacemiT K3 Pico-ITX (BXM-4-64,
riscv64). The K3 also needs local patches that are not upstream yet:
its GPU DT node, an RPMI power domain fix for its firmware and BVNC
36.56.104.183. Each board ran two small test programs, once without and
once with the patch:

- The first one only uses the powervr DRM ioctls. It fills 250 objects
  with a pattern through their CPU mapping, frees them, creates new
  objects of the same size and checks they read back as zero. It also
  times DRM_IOCTL_PVR_CREATE_BO. Result, without -> with the patch:
    J722S: 0 -> 0 non-zero bytes, 16 MiB object in 20.6 -> 17.4 ms
    K3:    0 -> 0 non-zero bytes, 16 MiB object in 41.6 ->  9.2 ms

- The second one does the same check through Mesa's Vulkan driver,
  and also reads the new memory from the GPU: the GPU copies it into a
  buffer that the CPU then checks. 80 allocations, on the J722S only, as
  Mesa is not built on the K3 yet. Result: 0 non-zero bytes without and
  with the patch.

The test programs were written and run with the help of an LLM.
---
 drivers/gpu/drm/imagination/pvr_gem.c | 34 ----------------------------------
 1 file changed, 34 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_gem.c b/drivers/gpu/drm/imagination/pvr_gem.c
index d8660d6a8e01..01b8e08d12f0 100644
--- a/drivers/gpu/drm/imagination/pvr_gem.c
+++ b/drivers/gpu/drm/imagination/pvr_gem.c
@@ -275,34 +275,6 @@ pvr_gem_object_vunmap(struct pvr_gem_object *pvr_obj)
 	dma_resv_unlock(obj->resv);
 }
 
-/**
- * pvr_gem_object_zero() - Zeroes the physical memory behind an object.
- * @pvr_obj: Target PowerVR GEM object.
- *
- * Return:
- *  * 0 on success, or
- *  * Any error encountered while attempting to map @pvr_obj to the CPU (see
- *    pvr_gem_object_vmap()).
- */
-static int
-pvr_gem_object_zero(struct pvr_gem_object *pvr_obj)
-{
-	void *cpu_ptr;
-
-	cpu_ptr = pvr_gem_object_vmap(pvr_obj);
-	if (IS_ERR(cpu_ptr))
-		return PTR_ERR(cpu_ptr);
-
-	memset(cpu_ptr, 0, pvr_gem_object_size(pvr_obj));
-
-	/* Make sure the zero-ing is done before vumap-ing the object. */
-	wmb();
-
-	pvr_gem_object_vunmap(pvr_obj);
-
-	return 0;
-}
-
 /**
  * pvr_gem_create_object() - Allocate and pre-initializes a pvr_gem_object
  * @drm_dev: DRM device creating this object.
@@ -378,12 +350,6 @@ pvr_gem_object_create(struct pvr_device *pvr_dev, size_t size, u64 flags)
 
 	dma_sync_sgtable_for_device(drm_dev->dev, sgt, DMA_BIDIRECTIONAL);
 
-	/*
-	 * Do this last because pvr_gem_object_zero() requires a fully
-	 * configured instance of struct pvr_gem_object.
-	 */
-	pvr_gem_object_zero(pvr_obj);
-
 	return pvr_obj;
 
 err_shmem_object_free:

---
base-commit: 41b5458595c60143d0ebaa1e032c9cda5d764dff
change-id: 20261105-pvr-gem-drop-zeroing-67cc98380a55

Best regards,
--  
Guillaume La Roque <glaroque@baylibre.com>

