Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCDC449997
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 14:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756189; cv=none; b=MloSxHPGJXsd2fWfzOQcAry29q27tvBuoFGt4/aAqXM7d59Rv0ivn5972OpWtarEhVzTBa3oAWR6iB8lzup1qk98QNISpAnpvnfvywCdW+0qXavpaAMyiWvmym9iFq1ZlAI5Cv9J8F8Ryv6Ws9acT/XSmjv66b4tgpBiKmGcmv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756189; c=relaxed/simple;
	bh=bYF/WVO/8PQU9JZz6diBBOiGhkMkJAQ8JUsYcg37RaA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EwBKAs0ln3FudnCLcmnAE580/NdX0sggluR1Az2sARNKU56jvA3hYLsUprUI5DQeFtD2eoNVDWWPFc1UnPf7LbBIdfPcXJWDWQk0Vg3PIQZ7bqVJZ8/Jw/J4Q2QMTU+dYHo27uHUmPwe1RbzSBnOq5Hm8vVfTFwsTSvnENtgtp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=izOFdZkx; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="izOFdZkx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1787756186;
	bh=bYF/WVO/8PQU9JZz6diBBOiGhkMkJAQ8JUsYcg37RaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=izOFdZkxsypQZGnxtFxKABCt62wppiXGPZ1foNo+3ELQs38dvbRBT1ghjDc9hziem
	 AKHXYQedgdDetfILC5YuWUkWF/UHLpXWcvxfc1r901KpqmuVur9Z43jhX5kEcdLZWy
	 JtG/m3NBaQxqmiJ6K5+DM5OUWQfKecbXl+cyNbuTwWbldYc43KUZIqVwFnE7AAREVf
	 qmccuMJIeNKJ8QLzz5b9TdOoXPYSf7aq64REZNo7g19rMmKVr+9yaQdLqd1Bo9Yl6V
	 VFGCt0tnt0XG/lNZFWrG6ZUUZCJE/iI53Qqhyqh2btJSjq4cUngPGrTKq5D2i06Mau
	 0PRtxx/7I7WoQ==
Received: from fedora-32.home (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A4B5D17E10A1;
	Wed, 26 Aug 2026 16:56:25 +0200 (CEST)
From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, 26 Aug 2026 16:56:10 +0200
Subject: [PATCH v4 11/18] drm/panthor: Don't pre-allocate VMAs or page
 tables when preparing a full VM unmap
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260826-panthor-unplug-fixes-v4-11-982cc8f4234b@collabora.com>
References: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
In-Reply-To: <20260826-panthor-unplug-fixes-v4-0-982cc8f4234b@collabora.com>
To: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>
Cc: Chris Diamand <chris.diamand@arm.com>, Akash Goel <akash.goel@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Boris Brezillon <boris.brezillon@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787756178; l=1151;
 i=boris.brezillon@collabora.com; s=20260429; h=from:subject:message-id;
 bh=bYF/WVO/8PQU9JZz6diBBOiGhkMkJAQ8JUsYcg37RaA=;
 b=IDI1mBncTTodhYH5GNIDQooCKbKswCNgntEA3w03A59FGWjTyoLcpsQ/FP8aOmDZgyb2qqdTQ
 uYHiEyOKYLmAb3ySh8WQwqG0NWya6tI2r99VIPftqRUrjrKri1kT/mM
X-Developer-Key: i=boris.brezillon@collabora.com; a=ed25519;
 pk=eN+ORdOgQY7d5U+0kA8h5bf67XdD8bhKbjD/TCHexSY=

In the cleanup path, we unmap the full VA range to make sure things are
clean before the VM is released. I'd rather not fail on memory
allocation in that path, so let's make sure
panthor_vm_pgtable_prepare_unmap_op_ctx() doesn't allocate VMAs or
page tables when the unmap range matches the VM virtual address range.

Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_mmu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/drm/panthor/panthor_mmu.c
index 58f0bd2ac7a2..11a9bbe87986 100644
--- a/drivers/gpu/drm/panthor/panthor_mmu.c
+++ b/drivers/gpu/drm/panthor/panthor_mmu.c
@@ -1477,6 +1477,10 @@ static int panthor_as_prepare_unmap_op_ctx(struct panthor_as_op_ctx *op_ctx,
 	op_ctx->va.addr = va;
 	op_ctx->flags = DRM_PANTHOR_VM_BIND_OP_TYPE_UNMAP;
 
+	/* Unmap on the whole VM range don't need new VMAs or page tables. */
+	if (va == as->base.mm_start && size == as->base.mm_range)
+		return 0;
+
 	/* Pre-allocate L3 page tables to account for the split-2M-block
 	 * situation on unmap.
 	 */

-- 
2.55.0

