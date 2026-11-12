Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794473318;
	b=humNi1u8oibKh2BY3a7yWrPkEU1Ns+hkQsmR4DOPyqQlHJMdLOjY+FEhGfHdOTfIR9N8
	 ZvfI/K/PGx6ZP+UV4w+KOQpU79RBs1wgy6MCq1r4WgS3vIsBzKNPAx29JsK3HxBSi3oul
	 19KD8Sr0EG0vsNriyUSRcuM/pyzfxrE3QvCFBDeLDzqaWN+AAoeUWl8HFuVHDb2GGgoWh
	 BSMDTgJAm8WUwVD5AeTHt00Aa2ru6yZHtJALLTi7f3zH+4si1Lo0WDjVzWhN4n/9tqirw
	 eySeinq9RzsKGoO5tA+XMkx7I/e9G79kCtW8SvAmxMuwV82CQhS1z15a18YfzShn4KA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794473318;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kcrE/vgTjYnMYYSxvli1Uwevdfio/lLOgVse5l2QA6M=;
	b=bV+cfj3/DD1O1nVzkI2g1aCC81bmulYdv0yTkmelwIE2ddum8coCLAxbmn0aLwAGZN4m
	 I00KyoyReQKIKF0/8gyfgKi3dPxes5BlkqjqbE8RZaTuJpgYFvfjxyFzlP7Cil6mg6nWP
	 qv7pwFfVDWLQx1UmcFgo4O9t3AchjL/7MGz7vmG8X2X6yuVrV0Mdcyor6nQNXERHT4gTT
	 ANXXemBLsdQ+PNMvzwmcOQrU1HNh1bZH6aEKbQp0VviAxSK5glYRzYzo6OMSyeR7m2GpX
	 wHdfiJXE8s3q0P6Cr+TQftcox97a40cuFM9S9ru/BIHqRBQNL3pSvRGp426z4WMCFiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="k1d/2TPD";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54192606A8B2
	for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=k1d/2TPD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794473318;
	b=larPfPxGBZ6yg1mq19k3M7nmB6Mmep3/qdKcLLY7TjaGVCTSRTgXCOU8sldTBrpwIj55
	 TWmElt15hxH/+tfjAwJfkyGx8RnWJVULScFJBrAmIMCbvDkBPoBEKAxOraumz+RmzFyYp
	 uMbOV67XX3lckjrHZIxnkGZNzh1Yn8ZB0xt11UgisVMdTIyTsa0Ay4mJAoV5HMK/co7ja
	 jZ5RZvwOgtUcpQsoZWY4DRJIfbnPJyLTLIcch3ZcCpzE227o5pnpD9Xwk2s3Pkuf2nzax
	 h9DswRthwiVnq5x5P5maz6AqA01Pnad2EBkUtWdLg5FMCSKWJRQtL25nT9x+fhNS1Uw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794473318;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=kcrE/vgTjYnMYYSxvli1Uwevdfio/lLOgVse5l2QA6M=;
	b=Zz1n704u6AtC1N+ZlmMuBNjVR999gCiTYTcvrKBMkxRN0nJgsxoIbfA/opfaQhkKLm+k
	 nQ8MqGLA1+f0SehKPDPctKmwNvkl4wqXXg1uQaTuk1JrGsW6z1hNwfX7p2WkWFzQJxz6t
	 Z63FEyhqleJN2ffuTw6a8tOVaIRDZRzdclU20+AT6geYTF7fhFyzd0tIbM0mOs6xOKUhB
	 io0uougE1UBdFBgFUzp6X86OWOQn4qzYVbSNIVLDjuqP2oTBI6OG1BBeS8ErS+5h09thG
	 RrvghSPXcShJOS5I+XNPbEpxVcM4iZP8Cm9yoUw5shxn3ylV9cU9ezSbfD1hvoMI8MQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BEC681F00A07;
	Thu, 12 Nov 2026 08:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794473318;
	bh=kcrE/vgTjYnMYYSxvli1Uwevdfio/lLOgVse5l2QA6M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=k1d/2TPD7m7K4ygY3l4FQmIQyEiLIW8DkjpOINAQ5a/pYvf99jVPBo+9epFSSXlJS
	 Tr4N1xjO2gP/17Ug3Bo4RmwKb5f2+CZIF/kPNoFiHaR/AtTUO+zAWytaKiyjudyQk7
	 HsY8Nsm8OvQOwma2jmjBF1j7FgPMHIEpTWe84x7q9Na/aFps4QddYQolOj4+b9fAAH
	 0ijK1GaH/0lDkglzyB49xXmvCRwSFRk38+XL16qBHa7VDMGbZ5YZEvIc3/3FtL/abJ
	 tAz/jAq5GMSm33EC105mjui2cIl83Iff8OzW9/ec5Y2p78wgUUpHVVxWYOwkYKEoVw
	 TjwFilGLV5tug==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 67B57493ED;
	Thu, 12 Nov 2026 08:48:35 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Thu, 12 Nov 2026 08:48:38 +0000
Subject: [PATCH v2 05/11] drm/panfrost: Unwind a failed GPU mapping without
 dropping its pages
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
Message-Id: <20261112-panfrost-long-jobs-v2-5-a06830da3d99@gmail.com>
References: <20261112-panfrost-long-jobs-v2-0-a06830da3d99@gmail.com>
In-Reply-To: <20261112-panfrost-long-jobs-v2-0-a06830da3d99@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794473314; l=3059;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=cXmdq7u+D1jQoUrPnQYz4g1arOg/4riZ6jjCd0tgiX0=;
 b=mBwghWTfu7WsN0fYkW2YkvYAv5kRJjyOPIe4wMbT5UFf/oUbjjT51kg2JyYZtwLB+OQEHYSdi
 7mlmu6CWHdICiTrFpkEQfJoaV+hlnzdsMt0uNtWioBH7JTjbBiPQ7eI
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

Two error paths of a BO mapping leave the wrong state behind when an
allocation fails part-way (memory cgroup at its limit, io-pgtable
running out of memory):

- When mmu_map_sg() fails, panfrost_mmu_map() calls
  drm_gem_shmem_put_pages_locked(). The only page reference
  drm_gem_shmem_get_pages_sgt() took belongs to the sg table cached in
  shmem->sgt, which the object releases when it is freed, so this drops
  pages that shmem->sgt still maps (for an imported BO it underflows
  pages_use_count). It also runs without the reservation lock that
  helper asserts. Keep the pages and just return the error.

- When ops->map_pages() fails, mmu_map_sg() unmaps what the earlier
  calls mapped, but not the part the failing call itself had mapped
  before it failed (map_pages() reports it in @mapped). Those PTEs stay
  behind in a VA range that drm_mm hands out again, and the next mapping
  there finds them. Unmap that part too, and flush the unmapped range.

Fixes: 4da352cf8fb1 ("drm/panfrost: Handle page mapping failure")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index 971552c42..35fb86b6b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -442,8 +442,11 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 
 			ret = ops->map_pages(ops, iova, paddr, pgsize, pgcount, prot,
 				       GFP_KERNEL, &mapped);
-			if (ret)
+			if (ret) {
+				/* Unwind the pages this call mapped too. */
+				total_mapped += mapped;
 				goto err_unmap_pages;
+			}
 
 			/* Don't get stuck if things have gone wrong */
 			mapped = max(mapped, pgsize);
@@ -459,7 +462,10 @@ static int mmu_map_sg(struct panfrost_device *pfdev, struct panfrost_mmu *mmu,
 	return 0;
 
 err_unmap_pages:
-	mmu_unmap_range(mmu, start_iova, total_mapped);
+	if (total_mapped) {
+		mmu_unmap_range(mmu, start_iova, total_mapped);
+		panfrost_mmu_flush_range(pfdev, mmu, start_iova, total_mapped);
+	}
 	return ret;
 }
 
@@ -483,18 +489,20 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
+	/*
+	 * On failure keep the pages: the sg table cached in the shmem object
+	 * owns the only page reference drm_gem_shmem_get_pages_sgt() took,
+	 * and the object frees both. Dropping it here (without the reservation
+	 * lock) released pages that shmem->sgt still maps.
+	 */
 	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,
 			 prot, sgt);
 	if (ret)
-		goto err_put_pages;
+		return ret;
 
 	mapping->active = true;
 
 	return 0;
-
-err_put_pages:
-	drm_gem_shmem_put_pages_locked(shmem);
-	return ret;
 }
 
 void panfrost_mmu_unmap(struct panfrost_gem_mapping *mapping)

-- 
2.55.0


