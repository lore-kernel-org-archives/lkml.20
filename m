Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794560575;
	b=HyxXm8shX4bEX+pv4WKPtFIcACGrN36KN6vQEhgRqPAL4DsfofLiWyynr6R14c9nA8NL
	 SC8l05faH+6gF19Gl9yP/KChNZg2T3kRGewzYVWBlC+776DyXZBXG5Xaz0qmBkTbNDETB
	 EHfL9d8alussBw+ZxsmjUmHb5vB66GwKLDHK8FNbfkU0TjPgz0CFBZgwnkKyR/wnveykf
	 76bwVP7WxxVqFn94hu0zFFPJMhqJ2SRZXcTsuCB16DRPXPOqWj5biiUYuYkw+FdCf/vbp
	 6ShAVtQmi4LFL+KeRFxSLSZMD6Ei/dHKecoJqDWiR1RBxsUt1Dcv8w1aAG48mW/0/7g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560575;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9M9RlTgE91KmgxF0Tdaf4kzxGtvrObMNHXbTphs0Acc=;
	b=b8mbryCJTvHsUvswSIP+zTRLX0yGwqT0wOxCYuiR7VmIOsVizIO01OkdLvUcnzr4kKKE
	 kSWuvrXg5ZsUNcYF0h/OCj1SS15cBRjigTen4K+/8/AmwyGjpP7pEXIs9cNxy0j2CS/FC
	 a1nzdQoO2ft8Q7ID+2umal3vA6yxBJ/mlq0X++b9nhCrNCf3TUR9SGXC43CmAJ+RIXLOT
	 m9lTAq8FZ+sAfqAKWvyfhS4sMiF4XIlT+aopPveY+lAPmM+kLZoS0rGyNMW467/dDOUDL
	 sj+bqZpk59qCQSPepa/P9rPe63u/Lz++rBwsV0BhIBP91hocmvpSW5JbqBy2vy5muYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="fQg2RE/5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5968C606A88E
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fQg2RE/5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794560575;
	b=bU44JCbgpGNr5kptcCrL7jN8Hbm3Hgtzi0VNMUO4nqv+Q/vhXz405vykIdq5+0NsCMMB
	 9BU3SpnqCILyCwJRlRYQV0nA3S/GHC8Vdh/yQIqSgQp3IKVaifsH7xePaluwL8gwq+sHc
	 SFXd1hHD2MKyxoFdxbfKdOD9Zh3VhjQklgs1w08k4AhVtooGcZYaxLuxrV+etdGX8qqnl
	 I1iuscE//WMU2uuvmEKzM3NsJgkbFUb/buoI0k13mZ+6d/ZYG798CDbjhNkvA4ZXIyvr8
	 KQwSheaVhFQClVjdya4E2SmNEFAvU3JNpjxXcMz8J/95GPwP6SThxZ97ZPX8FX9rOPg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794560575;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=9M9RlTgE91KmgxF0Tdaf4kzxGtvrObMNHXbTphs0Acc=;
	b=UNdmZCD1ujGUrcYb+LC07GLoOp+GP/MF9+CstBLBhK3yFOWeXJko5W85abtwx4hRhZi5
	 v526SbxuIB96loaMThy71DxVuWtd2yJgH67PAyhCUsixZQk0s0xJaIc0tsEM+Ybjro0uY
	 Rl8Epfh3/LGYC87NfclGEMFbQHDvjYgcjxEzOYP5hMAIjFppqC0umkTwaoLsuKbI3a58B
	 XUPL+yfzN8JYyC8kt7sah7DteDelzwGgGtoxmOWq8ZmzvUxu/wFPPC7x1vrY/ejvW+eMg
	 4RLpszKNvCEcgsSs7gcIU9i1EJwwLSjEmRMfgExJ2lmbeHm6aRbI1dUidsGZOIV9qLQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 673F31F000C6;
	Fri, 13 Nov 2026 09:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560574;
	bh=9M9RlTgE91KmgxF0Tdaf4kzxGtvrObMNHXbTphs0Acc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=fQg2RE/5VHmJ8fz2QR+YDGKrrOOTu0P9fzUJTRIwWTztuYozReaQIve45usIVDvQ0
	 jcWEy9VHULBpDayVwLx5ZQgdwJhU5W+rrXPT+8BjC3DIBcp1zRCuytowLypWDC5tvF
	 IkpknTvZzVzjsVYFbXWSFzmyrgVQFwSYMvzIiqocD/qUum9iL3TmOePDXixNcvU32x
	 VShQn0q2fzEaxDe19rA/asyxEuqPpCEteBpzftgbpxjS9rKgKbnQQ6asw71RVQk2KK
	 AiTwKu3M3F6pUJLMrPq/PHBmBEJ/ILU/Jk++0Pb+sUPoBMfCyeeuv04WxnAeuqpvKu
	 h2rdziGTwdU+g==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E8948476DA;
	Fri, 13 Nov 2026 09:02:53 +0000 (UTC)
From: Arun Iyengar via B4 Relay <devnull+aiyengar1990.gmail.com@kernel.org>
Date: Fri, 13 Nov 2026 09:02:54 +0000
Subject: [PATCH v3 02/14] drm/panfrost: Refuse to sync the CPU caches of a
 heap BO
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
Message-Id: <20261113-panfrost-long-jobs-v3-2-80ae78d38f6e@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794560572; l=1768;
 i=aiyengar1990@gmail.com; s=20261110; h=from:subject:message-id;
 bh=HrsdWKsSgiGXkqlebjInUOvLazjeFD30/bAvYhzVDVs=;
 b=dlCqTBSrojRZUFzJOLlMFkRPGOmIXJ0x6/dG8G1sDEWPKbDF/4+G3xB2st9BIgmevHkEzr5mS
 X68MKJzh15XBSVEagT7ngMK9XkSkW+FOGCdhTwn/r1qy97NxP/J3Wce
X-Developer-Key: i=aiyengar1990@gmail.com; a=ed25519;
 pk=zXpRgUTrhaFe6jLyPqbBy3ccfkj04w0g2690Wv3mg+0=
X-Endpoint-Received: by B4 Relay for aiyengar1990@gmail.com/20261110 with
 auth_id=1480
X-Original-From: Arun Iyengar <aiyengar1990@gmail.com>
Reply-To: aiyengar1990@gmail.com
Content-Transfer-Encoding: 7bit

From: Arun Iyengar <aiyengar1990@gmail.com>

On a coherent GPU a heap BO is not write-combined, so PANFROST_SYNC_BO
on it reaches drm_gem_shmem_get_pages_sgt() with bo->base.pages being
the fault handler's sparse page array, and drm_prime_pages_to_sg()
dereferences the NULL entries of the chunks not faulted in yet. With no
chunk faulted in, it pins the whole heap and sets bo->base.pages without
bo->sgts, which the next GPU fault on the heap dereferences.

Heap BOs are not CPU-mappable (panfrost_ioctl_mmap_bo() refuses them,
panfrost_gem_create() refuses PANFROST_BO_WB_MMAP for them), so there is
nothing to sync: return -EINVAL, as for imported BOs.

Found by code review (Sashiko). Not tested on a coherent GPU: on the
Mali-G31 here a heap BO is write-combined and the sync returned early.

Fixes: 7be45f548976 ("drm/panfrost: Add a PANFROST_SYNC_BO ioctl")
Cc: stable@vger.kernel.org
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/sashiko-outbox-206561@kernel.org/
Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_gem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 518f24549..f72edb65b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -569,6 +569,10 @@ panfrost_gem_sync(struct drm_gem_object *obj, u32 type, u32 offset, u32 size)
 	if (drm_gem_is_imported(&shmem->base))
 		return -EINVAL;
 
+	/* A heap BO's pages and sg tables belong to the GPU fault handler. */
+	if (bo->is_heap)
+		return -EINVAL;
+
 	switch (type) {
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
 	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:

-- 
2.55.0


