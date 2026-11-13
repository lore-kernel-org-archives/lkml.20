Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560575;
	b=iAAyWuOjuf9WtE9LNshoyriRp66I1XCIsMo7fHSxll7KTQxnDha1YY+L5I/rMxHFxjYl
	 8YHM6ixId1K1I2UVoxG0WBIMLmL93OlFocuHc2syHEMQvu9fMJU+QwyXgx3tsCCJcQH/C
	 qw6uBfik2VYAcMrnGMSfVuDGQN6dmtYT/QN+lrDwsbRWubyyifgnl0w/Byjnl4ZUrladV
	 rnAHKZVFEl0eGVTrDnxPp6VpO9EMLLYFXVnKWPdW+R3NWkjB5mXLdbhdf8fsKyd8jkdAm
	 u9zwwY612n6zbcABOYj+2D5bxIGZTqY4kPGoXyhkRaDVG8OIuKrJQECnWVglK1UAJUA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560575;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CWSkFDcQAWrxwGG2XgZSrWsLDZvF6dbvJLFFxienCSo=;
	b=gBciKjKnD7kSKWRmHAJFl9AgNlEF4xgAMirEpPsuPW/+05vFDAd8qS7U3VN4Web6tZkZ
	 8A4aa/g/2ZsNBVh6cMLoWzoTQ/Vzwz9cCwkXlzF0ITHD5W04MaMJSBQbeMIdOMshk1+MO
	 dz1ws5jGra1qVVW+olGaaKSqPNFdqaMpT8/ULoGmG+kfgh+9WT0JY19Nz2wCpTPe/NTtf
	 FhuQKVZNPbMwCuL8Zc+FbHYss+BemV+KAPYwRlmA9VXsqS+PZH3i/mnwWpc+Kt5lddv2m
	 z9jQNimBdsf1PrIQ/Hi9yqoXrfVxW+LlhyVyxUGrNeytH0ct+/HZGeM+m2JZ6ylcLkw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQARAFoo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B23606A8AE
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YQARAFoo
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794560575;
	b=nhoiVfpVeUMoIfQc0lR7kAhpxDGoVVYQzX2wGocGrT806CbmbEUOSwFX2Mwbe5wvzMlR
	 fjHhE7Qlgkj9zrhvGHuIGRXqqceP/ZJmml3/yAVbSZhasAqyIMYKnYjWSHAcdyNrzkz4Q
	 vCtG5p/X5J+TyGB9H8ZoE9luvhqAuoZatP00ZmlcmUTdI6rUaMvIeZlF7kFl0Wxu4/emw
	 eq/hAT50n//8fg2Q0G8E8HoSF+fl1ilvUWFeMyWqVk7i8vkobvmFxhvjw3RUZN3btUtp0
	 drJHXOYG/1P1amvVhMwE5AlBNfiCNtiQJABP5lJyC/Chd79VmO9hrWhF2VSKCaIUGRQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794560575;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CWSkFDcQAWrxwGG2XgZSrWsLDZvF6dbvJLFFxienCSo=;
	b=JvH1UdZYgce4E0/zLlM6uV1zw+72aUQTH9wOm+UoDF8V5GJIjVz3V6lqZs5a/BH6hoqM
	 YSEDwEJgVT/h6CwtV42TE8gPueQ3v/U3Sj/xoB4CliDJQTYlVQvFlbbwscswY68JAG+97
	 Djlw1VqfLewfVdW6+DOKXFdJZV4v7SBCeBL46uPNl9nPzaYmC91OKnJXtYQLgY3mQX48E
	 jM1pXpon+CI7V75u9UEaRbvPmIu9MKQUFtOuTp5a5yU+6yPM2WFAuKWi16d5r74USmWrt
	 Y1jrR3+eJCe6RQ/lJL4VsQ2pnA8n9fWveEMckMfRLm/ljj0Xlx1cdWVSaHsmSaFCr+A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8C4BD1F000CA;
	Fri, 13 Nov 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560575;
	bh=CWSkFDcQAWrxwGG2XgZSrWsLDZvF6dbvJLFFxienCSo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YQARAFooBunYUJan8Newu+NRE9furX0+i7Fn3pDu7tQQ/bK3K31D6EdU/rsQOKZcX
	 E0BBL9oJ1ehsFAdZXjtQIT7PVvi6T3eLLW7C0JqV4rJ55A0p5n3AwQskUTkmYBsID1
	 mMYT1J0Fe3CG3VQZteqqvzMfQ3gBjRxoqWzgX5qUcBZMIyogbJ73NNthWlIe8ixUF4
	 u1V7pX91rSGnUn17OV4n1GnIQBSnDYSMQwfFZ3vzVpZ9s7tQPCK8TefeN0OSqE18R6
	 0b1BUZrYE+aV/XTGxDjqJvPA9zjEevhPTrS6QlBCq3ZTiv91wCXa3Vxa9xZ66dMniW
	 KL9KIBiUqyj1w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 197D5476E2;
	Fri, 13 Nov 2026 09:02:54 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 09:02:56 +0000
Subject: [PATCH v3 04/14] drm/panfrost: Don't WARN when a GEM mapping
 cannot get its pages
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
Message-Id: <20261113-panfrost-long-jobs-v3-4-80ae78d38f6e@gmail.com>
References: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
In-Reply-To: <20261113-panfrost-long-jobs-v3-0-80ae78d38f6e@gmail.com>
To: Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Arun Iyengar <aiyengar1990@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560572; l=1408;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=KypmdQFpXJhyVRriukZHmt8v/aAOg8j9iF3Sawr4q8w=;
 b=W58nWWFc2fOSjc0d1hxtV6/qgQ/bRIrbW/3o40ZDwSeGVkLC1PjZD0DqzMtUy5h5z7Jtmgm2q
 wABSjf1dPm+BuprumuD0bQRRe8QDkBRx/Fs6S+csPeizLt7WcYe40M1
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

drm_gem_shmem_get_pages_sgt() fails with -ENOMEM when the caller's
memory cgroup is at its limit, or with -EINTR when the caller is being
killed. Userspace gets the error (Mesa: "DRM_IOCTL_PANFROST_CREATE_BO
failed (err=12)"), but the WARN_ON() in panfrost_mmu_map() also prints a
backtrace:

  WARNING: drivers/gpu/drm/panfrost/panfrost_mmu.c:478 at panfrost_mmu_map+0xcc

dEQP-GLES31.functional.draw_indirect.compute_interop.large.* in a 600 MB
memory cgroup on a 1 GB Mali-G31 board prints it five times.

Drop the WARN_ON(). No pages are held at this point, so there is nothing
to undo.

Fixes: f3ba91228e8e ("drm/panfrost: Add initial panfrost driver")
Cc: stable@vger.kernel.org
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_mmu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_mmu.c b/drivers/gpu/drm/panfrost/panfrost_mmu.c
index d0c6b6635..74fd159de 100644
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


