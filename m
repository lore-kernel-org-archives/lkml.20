Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B88D376A08
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 16:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790440068; cv=none; b=uXw6yKEj20mNdfUFs/kaIQRHhAxoKhsKCc8q34MhZmfwqJT7S7ZTLUh/x50thjrwV0sXsCVxqIcveR8qAMtaVMw9Hxt3lejpxXqnrDygeDvpn1FoQ5G8Rz8gVW8EjLep0Gn3EjqUWZ+FfDvLt/35kaTyrcsHvaZvx7vMn8RnmYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790440068; c=relaxed/simple;
	bh=OKjVb6Qnd4TNBO62LPG+FD3Ol8efCNoK1xJpjgieTZc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L9AJ+7ugIQqfYLejC0U6MkpUmbedcvsQvpQFBHJvm1dc9RrTEG2Os4SdI8K5dTnAntVUOuBOoD1sS++ELSy15OjocPE7KT/bQoLu6n0GIxdfYd7lY4Y3X5FP2Ps64r6eWizwQjI2KeJdHjzHMGD5RVbz3rRUw7gP/LQ6UdFBHCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=Bk9HOghe; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="Bk9HOghe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Qk
	3GrePbv9eu1xk5tupyIxeqhb2lAK9MbLxhiUca/KA=; b=Bk9HOgheCr6rFakatO
	wS1KwBlnFHrWIKsDtvCj6LJ8Jy/KMKKSx9BGlnZ1aIrfhiHM19G18V9rtA0OoMZL
	mcNwrYmCJGCv7As5OW/z3ZaygcpyYGlvB5VHRpx95/KxnOd/GGwXFzJdULO/LS+H
	9d8YAIBez/q6NcfNhgvPnaV2c=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3v6EU8rdq1Ce5Aw--.54526S5;
	Sun, 27 Sep 2026 00:26:17 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Qiang Yu <yuq825@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Eric Anholt <eric@anholt.net>,
	Erico Nunes <nunes.erico@gmail.com>,
	Rob Herring <robh@kerrnel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andreas Baierl <ichgeh@imkreisrum.de>,
	dri-devel@lists.freedesktop.org,
	lima@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 3/3] drm/lima: Drain fence callbacks before destroying slab
Date: Sun, 27 Sep 2026 00:25:52 +0800
Message-Id: <20260926162554.163197-4-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260926162554.163197-1-yaojiale02@163.com>
References: <20260926162554.163197-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD3v6EU8rdq1Ce5Aw--.54526S5
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF1kXr4UGF4DXr4Dury3Arb_yoWDArb_Kw
	43Wrn3Gw17GFnrK3ZrZrn3Wr9akasrZFZ5ZrnYvFWfKry7JF1UXw4jgr45Z34UJ3W2y3Zx
	tanFqFyrXr9F9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_CJmUUUUUU==
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQlPiWq38imLAgAA3N

lima_fence_release() defers freeing fences from lima_fence_slab to an
RCU callback. The last lima_sched_slab_fini() can destroy the slab and
clear its pointer while a release callback is still queued. Module removal
can also free lima_fence_release_rcu() before that callback runs.

Drain outstanding callbacks before destroying the last fence slab.

Fixes: a1d2a6339961 ("drm/lima: driver for ARM Mali4xx GPUs")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/gpu/drm/lima/lima_sched.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/lima/lima_sched.c b/drivers/gpu/drm/lima/lima_sched.c
index 9a1e6b9ecbe5..9c5ff1929d3e 100644
--- a/drivers/gpu/drm/lima/lima_sched.c
+++ b/drivers/gpu/drm/lima/lima_sched.c
@@ -44,6 +44,7 @@ int lima_sched_slab_init(void)
 void lima_sched_slab_fini(void)
 {
 	if (!--lima_fence_slab_refcnt) {
+		rcu_barrier();
 		kmem_cache_destroy(lima_fence_slab);
 		lima_fence_slab = NULL;
 	}
-- 
2.34.1

