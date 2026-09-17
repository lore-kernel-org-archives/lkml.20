Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E312E4F473B
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648442; cv=none; b=QvKRzGaiH+8s0O5Q2dlBPyu+i/Xek4lymKZhjzbSGWl9jeyUGTSx/i4PejwlLLjxc63SsO9JApuB3S7dh4HvLNCxIbiacPKPP1nQUYDXUC+VvQnzSmwD1D9+0U0enKY3TiJjoLkpGvI3bNxk+KZv/O0h1SL5LPg/6WXeD2oJr8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648442; c=relaxed/simple;
	bh=wCAbH6+evR/IyGG1vLF13wRmGIFvXzlzEuaaOwiKKf4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hyfx4kInI8+kGtnZJwHG76ldCHndCF2Ex2MkGj77vRflGgfqIK4QTrDw9FgBc0rw6mvyabC7kEZ5nVeOVJFQWfvg0UZT/P9lsF7rz81idn37xd20w7VoGBikjYKgGBmwDv3nW7Ex/OVkl1s6veX3ES9aGmGwX408drzv+zFtCzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=m+mXPUJ0; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="m+mXPUJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789648434;
	bh=wCAbH6+evR/IyGG1vLF13wRmGIFvXzlzEuaaOwiKKf4=;
	h=From:Subject:Date:To:Cc:From;
	b=m+mXPUJ0Lb906Ck2Ci5NN+8ZLSfbIuJRRr8Bq2ctnw/L46iHraKOBk6m1MIcVH4ju
	 gSDOtbVnpBEee2RPAA+yKQ+jlUfNCw8NfEWfHH4LTzlPIlkHBxoGc+p9NSZSD+0rey
	 DFvKEpJ+44zeTi2ad78X0NnSf5OtvJVCcLk365M7keZUEhL0BAryodQkQ0yDvi84QJ
	 bJFH5BPRcDwO3F9TSk6jykYTdlJdqAqdCYVfkmY27+22s1Fio3nz2GBeX80jYKRlcc
	 dk05/+vl5r0chbnCvmNLcr5dUdWbHfNZM2M6xjg+4IQEkwYKSJqvpFNwXrX2SuAwSD
	 cWIdh3OqgBa4w==
Received: from fedora-21.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2E2F717E09B5;
	Thu, 17 Sep 2026 14:33:54 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH 0/4] drm/panthor: Fix partial unmaps, again
Date: Thu, 17 Sep 2026 14:33:42 +0200
Message-Id: <20260917-panthor-fix-partial-unmap-v1-0-c7008f15fea3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QqDMAxFf0XyvEDbqUx/ZfgQtqgBV0taRRD/f
 cG3c+Dce0JmFc7QVyco75JljSb+UcFnpjgxytccggut63yLiWKZV8VRDmMtQgtu8UcJqQnuWY/
 B+1cNtk/KFt3f7+G6/jFL53lrAAAA
X-Change-ID: 20260916-panthor-fix-partial-unmap-a52034f21184
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>, 
 Akash Goel <akash.goel@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789648434; l=1028;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=wCAbH6+evR/IyGG1vLF13wRmGIFvXzlzEuaaOwiKKf4=;
 b=CNgI8SVGSjZd40UrnVuhyhOhrZI8KjUCYB7YZ+CqDvDfODP4EEExVY0P8OiNnN6pnqIGruxba
 XRGX10CowgcD8MuqRO2InukJlHfDg5DYnL11vdVadGYfSr/quKVYLS2
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

The first patch is just a theoretical perf improvement to avoid
unnecessary unmap+map caused by false positive returned by
iova_mapped_as_huge_page(). The second patch is a fix for a real
bug when iova_mapped_as_huge_page() is called on an imported BO.
The last 2 patches are just consolidating the logic to make things
clearer.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
Boris Brezillon (4):
      drm/panthor: Avoid false positives in iova_mapped_as_huge_page()
      drm/panthor: Fix iova_mapped_as_huge_page() for imported BOs
      drm/panthor: Consolidate the is-huge-page-mapping test
      drm/panthor: Actually check huge-page mapping on sparse regions

 drivers/gpu/drm/panthor/panthor_mmu.c | 100 ++++++++++++++++++++++++----------
 1 file changed, 71 insertions(+), 29 deletions(-)
---
base-commit: 5535d5e61a77ad79118ea7665ce1c14f857f0f12
change-id: 20260916-panthor-fix-partial-unmap-a52034f21184

Best regards,
--  
Boris Brezillon <boris.brezillon@collabora.com>

