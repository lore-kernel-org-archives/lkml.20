Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794296699;
	b=sXE1NUHjmepMFkJlKV8pzBbrqzDuppZFbVhQ1H/KC5SzdbZY58YExZgwDPFGm7GYmB+h
	 lviXdA0DNJieS+I/MWHQ3O28bwNJKp+91trPeqZV6Qv46LKPVEUCq3Gc8GrMJ/UYAucmY
	 w2SQmASoatWv+WS1M58OpdjznOoM20ieLeyVsOBQHuIYn5q6P0WB/YHjwJrPCB7ZXUO7N
	 yPTzOXsJvol5paQlcr9I7n9RBdCv08RDD8uLqA7tkhA4fgdkU0856ZbIGS3HacYLcjkSp
	 f809CZaFrrCUbVuW0FVLIIYNQ4MZMUEnI+SFmSHuPC7qGCKgEXvmhoGXd9wF3rWsxFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794296699;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=i5N+tVJxnId8UsrysKZ0zfsLo0q1nLarLHnQm5olOTQ=;
	b=kM3AyGMUYagVPeK6/5zWHGUrph/b2/ajfQkkiM/O2LwRZnu8O8jKluxBYeYDc8brDr7P
	 v0ireFQXaj62yp0ILhF8tRzZvGK/fKXuvTWSmloXDYAHgL5CoyEVc0+lvEK102dd2+lgg
	 XwDD0+MhpFCS4rwsp4St0Zuk2IGUJONCLy2B48sVTNN2bDRHkV/bwGm3ejMAPUTaYdpXQ
	 kllM2b7eYdLIq9ZFeCG0pcVV/RY2MTeh5ehQwHPSpdppJLzJd5q3vavWAWff8LUerQChc
	 7cFBYk/MuuXQ8LZ/QQ14pctnGlNPQJrckCO8NNAdFpiuZs1sNslgO5hBmq/M6DxV3ow==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zxbq3two;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A93606DF0A
	for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 07:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Zxbq3two
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794296698;
	b=ybd4VCNiajH3uj83XSIEcDYQBvGQ/vRGK7R1n+MzfFGyn2EaliIdnqHWeO3AyMLXSjFQ
	 nMbN5waxZDnOdtlFpeNpyHT3ZWEr4Tv8W8HQr1bBhUaVPRe0bMv/qZXZfIs+0qZr7PJEx
	 ntoDoWYycQIaM+JlNjCvQG6iOYbCmFcquG2dPqgb3W4wVJqfurF1b/04vOSoTBj3yzMFj
	 TFc+R8LIFIK7w+ppSl4UUcWEtotRy5OP0/TPn0QP4damLIl+MkN05+AhxH16aQRjdhmK2
	 NKjDFL7EvB33zGAu9cb/Xut48/7OFvG/IGTDLYgK3y+KEx3Z2OziUhfxWDsMoS5C06A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794296698;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=i5N+tVJxnId8UsrysKZ0zfsLo0q1nLarLHnQm5olOTQ=;
	b=Pu30Wg/DBD70qIo/e+jma8NRmYYg4OaPsMmMzrKTktyyLeKdBpErj+4RhZiEL7ai6e/F
	 YZNgY+dGLtnJ1PM0VG0IevhoNg1x1jAB2JL1WvRqhwfK/SnVTx2SxAEz0XKvJ0c66AoXF
	 V1q4pQ6lSpJMW4KxXZ5wGFMMSR0ndvvgiRT8mdSYyosUstIIvxPIw+0PEdrhV3G5xlrsy
	 +TwxUGQsEkW72jpWWufW6ohpvK6QCjiMpOqrMtNbKW5yWoL9bb0B/LB92zmLBcXRynyMH
	 QSv1RUqVerqXHEah+VcGZafnTcegoBIlJyDi4aXQzP2OoxR050eETi/X7dks0d1VVrg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C39591F008AB;
	Tue, 10 Nov 2026 07:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794296698;
	bh=i5N+tVJxnId8UsrysKZ0zfsLo0q1nLarLHnQm5olOTQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Zxbq3twoLsV2tT1DLr1pMuI1PoYvFP8lUJXVcFX9PB3X1A/DiqVXSKLTf1Ln1gDz0
	 Ds0Wyi9GW0bczvQ47CjY41fDokR2FMmLGDnHthAldVdrl9zIUyE1d7csyQUkVBT1mt
	 2Q6/aixbxUil+sV80F2zolDYku1Wgd6+0Mlria2/2mSBU/fyR0Veq/CK6tKGh6SBP8
	 sBrOSXezyy6uBm5ieBWMvRVnUcZL5iOSdzI9f/RvgMqz2vPZkdVoyRALlFeL2pW4Gx
	 8em9zemyIgxHpYD8GLaaIsVGWBQHCDtHMlDNrROVlSKi8xDqc48P6iHS3tRGKWgv70
	 hXTGD4yydwDow==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 385C7489F4;
	Tue, 10 Nov 2026 07:44:56 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Tue, 10 Nov 2026 07:44:56 +0000
Subject: [PATCH 1/7] drm/panfrost: Don't WARN when a GEM mapping cannot get
 its pages
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
Message-Id: <20261110-panfrost-long-jobs-v1-1-24508939ae8d@gmail.com>
References: <20261110-panfrost-long-jobs-v1-0-24508939ae8d@gmail.com>
In-Reply-To: <20261110-panfrost-long-jobs-v1-0-24508939ae8d@gmail.com>
To: David Airlie <airlied@gmail.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Steven Price <steven.price@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Maxime Ripard <mripard@kernel.org>, 
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794296695; l=1604;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=SzdETha1EfbR4V8xB4YpinYavQbXjkchW8N44hE9ljI=;
 b=2y2BLHhUesghPsa1NKXc75hSh5P5HglHEmkRtqoZKIEGteAM1+JX6Ul5uR/LPBj0V4hHBJ46b
 grSQ5io3jx/Bm+a8BKzdbsAVSF70Klchpsp2hLPnm+jP0iH2fFjGrDo
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

panfrost_mmu_map() gets the pages of a BO with
drm_gem_shmem_get_pages_sgt(), which fails with -ENOMEM when shmem
cannot allocate them, for instance when the caller's memory cgroup is at
its limit, or with -EINTR when the caller is being killed. Those are
ordinary failures that reach userspace as an error (Mesa reports
"DRM_IOCTL_PANFROST_CREATE_BO failed (err=12)"), not driver bugs, but
the WARN_ON() turns each of them into a kernel warning with a backtrace:

  WARNING: drivers/gpu/drm/panfrost/panfrost_mmu.c:478 at panfrost_mmu_map+0xcc

dEQP-GLES31.functional.draw_indirect.compute_interop.large.* run in a
600 MB memory cgroup on a 1 GB Mali-G31 board prints it five times.

Return the error without the warning. No pages are held at this point,
so there is nothing to undo.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index faa62643c..56e642f73 100644
--- a/drivers/gpu/drm/panfrost/panfrost_mmu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_mmu.c
@@ -480,7 +480,7 @@ int panfrost_mmu_map(struct panfrost_gem_mapping *mapping)
 		prot |= IOMMU_NOEXEC;
 
 	sgt = drm_gem_shmem_get_pages_sgt(shmem);
-	if (WARN_ON(IS_ERR(sgt)))
+	if (IS_ERR(sgt))
 		return PTR_ERR(sgt);
 
 	ret = mmu_map_sg(pfdev, mapping->mmu, mapping->mmnode.start << PAGE_SHIFT,

-- 
2.55.0


