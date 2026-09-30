Received: from cstnet.cn (smtp25.cstnet.cn [159.226.251.25])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9722E3B4EBD
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 07:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790753761; cv=none; b=ZNr1awdv4iYUa78kbhqFe7xoUu6Ob4D1CBy3w2CfAc2e7mR/74fSFzhIzI9QOMESLHBC94xWqE3CLE6hJoX4k8X7XQnXJgE6i9yN5U5maFeFJXGl6yO3CyE5sXC/k9gOt+o+BbqQDM5H5882DA+oAsheDvgUPS2ecfYBmJflEP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790753761; c=relaxed/simple;
	bh=5njdtgKlrFGWjlU++ppK3eJGswU+uBpgKSc+ju1kIsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m86gNztrgU/OL4gfc4hiMM8fHlWxZYe5uUQRVuUpRVR72aZSWoWLd2mkbczURPoxYtpaR5vOfQRsXjrGQjrkAkKkljHdNhpYrw3C5TSU9AisJGuGlWG24KTmmJ4Erj4hnxYSvYsjMC1M6U0w6QnzJ9p/U5R+z0pSa0V4Jd+pb8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.101.54])
	by APP-05 (Coremail) with SMTP id zQCowABHtD7Eu7xqdFHBCQ--.5968S3;
	Wed, 30 Sep 2026 15:35:35 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Dominique Belhachemi <domibel@debian.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: [RFC PATCH 1/2] drm: add a helper function to check availbility of coherent mapping
Date: Wed, 30 Sep 2026 15:35:27 +0800
Message-ID: <20260930073528.3369325-2-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
References: <20260930073528.3369325-1-zhengxingda@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABHtD7Eu7xqdFHBCQ--.5968S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw1rAFyxuF1fur4UGFW7urg_yoW8Xw1UpF
	Z7CFyrJFsYqa1fCF13A3WSvFWrC397WFWxJ34avw4xZr4fKw1vqrWkJF4avFyrJrWkKw4a
	qFZakr98uryUZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AI
	xVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20x
	vE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xv
	r2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04
	v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j
	6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
	AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
	2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
	C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
	nUUI43ZEXa7VUjrHUDUUUUU==
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/

On some early SiFive RISC-V cores, there're no architectural way to map
the framebuffer coherently (bypassing the cache).

Add a helper function to check this situation for drivers to enable
dirty-tracking-based cache maintenance, which is more than returning
true currently on all architectures other than RISC-V.

Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
---
 include/drm/drm_cache.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/include/drm/drm_cache.h b/include/drm/drm_cache.h
index 08e0e3ffad131..001a6d89afead 100644
--- a/include/drm/drm_cache.h
+++ b/include/drm/drm_cache.h
@@ -34,6 +34,9 @@
 #define _DRM_CACHE_H_
 
 #include <linux/scatterlist.h>
+#if defined(CONFIG_RISCV)
+#include <linux/pgtable.h>
+#endif
 
 struct iosys_map;
 
@@ -80,6 +83,24 @@ static inline bool drm_arch_can_wc_memory(void)
 #endif
 }
 
+static inline bool drm_arch_can_map_coherent(void)
+{
+#if defined(CONFIG_RISCV)
+	/*
+	 * Early ratified versions of RISC-V privileged architecture manual
+	 * lacks any standardized way to override the cacheability of the
+	 * main memory region, from which framebuffers are allocated.
+	 *
+	 * In this case pgprot_writecombine() would just be a noop and manual
+	 * cache maintenance is required.
+	 */
+	return pgprot_val(pgprot_writecombine(PAGE_KERNEL)) !=
+	       pgprot_val(PAGE_KERNEL);
+#else
+	return true;
+#endif
+}
+
 void drm_memcpy_init_early(void);
 
 void drm_memcpy_from_wc(struct iosys_map *dst,
-- 
2.55.0

