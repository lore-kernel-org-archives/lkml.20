Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BF345C6F7
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 08:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547801; cv=none; b=M6+rXDSEF9rV6B1R055332/3QJ9gnN0Sex7yV/jxOwx1tIDzBX+3J2IXnxd3Zmw0NpWsRc5wJTi+X8jdxLg/hT/S4ChMSWdnqprcxRZNFdBaTqv1H4WcmXc3a45RrPnMWcLyFXRgOc1ibCMWIJovVVKnv9n6G036jDdadyFuO5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547801; c=relaxed/simple;
	bh=N28+9dduTURGr7Z/jDM+HUHsACZdvaz8kci5VoQIsUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rzcISFlGqOUkqYuqO3l52IPGVMGRl+qVbFPxNOCBeF1QpnMFakYPOKuo8eilDpEsmyfZ9liEgSMCGEH+h4KF9X//fmhDSHGSOfuiOACKmVgrespQNUB0mRJV1k+e4P8sGDVqMxuTV0RcpO6EwgnI+iD7AsD4pvnN+7Rj5jIalrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=cYb1HUNx; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="cYb1HUNx"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91c22d27dso4063625ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 01:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789547798; x=1790152598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/Ky/jym2qeoiedQ+4uP+uRv23sKBrOXkwKGv1IN5HSI=;
        b=cYb1HUNxi6cZzzhy+4HDYDuwYumI/rJ1kdINv1qbwsXD5PPqC/9GETgAAI2nzZk5Pd
         IYfG30JAqRle0XG0MvLiqTKyjTHe7v3nofsyik0X9sdldgkmKRlQvBfZG/6wjZgxoEab
         nkD2+NiohfRaT3GIkKTqtOvvfFrFVP85WuAnbvUPWCCjSk/aix+Q0Yihiwk1zFXn9pEu
         7Li2cAhwmcvVeqL/R0JD5kTqlBOvlYUp5uZZCO73xtdCdIFGmDzFZIyd0UoTWw1rijwc
         sgzl7uxJFkfXQb9ggsBJxMQkXAV84heaLokbE+pVuqWIY4V0shLjBSp6CK4TQpWNXjD6
         /hUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547798; x=1790152598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/Ky/jym2qeoiedQ+4uP+uRv23sKBrOXkwKGv1IN5HSI=;
        b=erDBTGj1JNIzyLkm6LaUDMvQCpncwSHiW3BKVCTxKbgN+S/1kEnLj1mwAVVbRLIOFb
         b4fAPhviXep8PKDsCTMFMToRJJ7kUBJtPGLcMWtnkom7cnILyluejrWw7O1DGosq05SX
         Uq092yV3H5kDSUWDyYPngSHqeGmGPe96SIe3+Sb9uSzV6whNW6VHMo81WcBR0KW5/wee
         2NbvUfh5KicipvzMMjx7dhNfBQtmU6sRLK4Wlm+TNy+OTPI+W2AS4tI91J5JRcNp4lxS
         Hu4kbe68fqd8/42SQFETvgmQPfdKTFhvY5HzthvSW7aiQnK95tHWjlAyRx1/h5szTxWj
         QOtA==
X-Forwarded-Encrypted: i=1; AKwUvByDaT8Scnq176gszJCDu1PjoBv7TdM4YiCOf6j67WzbjMBTpL/Zy7UoxS/vX4jjLXh7q//Nafxpz5SD69s=@vger.kernel.org
X-Gm-Message-State: AFuF++lCJcwu88z+nBQyAyv3CkvVBsIFiW00OkiXxkFMnKiK4IgIF+Tb
	+FguafE00gSo7OLMyXwyj/c7wcfVbf1wRaHrc88y2mcOi9ks2Zj36TwAEEj78tBI6k0=
X-Gm-Gg: AYBFou2oh2pHmta7lLxic7p4iguwMLUV69pAGJqx1UkvCF0SeF67jjX0JpgLRXcBzyT
	JbnVcK4g5kyPXLob5pQt/5Bi/6NkzkD8DaxGRFyzTjZ5493tAUISHpkDGezrORxt0rtGPaUy5ot
	g3gG1qOcgzJyvEJ9sWRmzhgG889NOdCETXnJdKgNvRY8IlZDpkmPLWM85pGGIVoTclpZgiEGjv7
	URihB7HsKAbC3xyCooos1J2yvaK6Ms1OSHZtN6DuAieyyNiwVok+jNezpfMzb5xHmawfcfjKeJw
	6FZ51j1ZGqPZs/Tpx5t1lEBjVWuopGKo9gB8WCqjOsE9Mvo5Alf4gYhu3GQmtDpERnTz6RbYuHX
	Qq+RQyZHhEycIQQb1nxOdiAu10uILR3tA1s/3O7PEmWes7YGidaNfgvnQOWzobEPowbd6zP05tN
	nyhEhdZBogi5IpP3CbcuSLc/LVy8mBTfE9wsKh5c6rYGyp4AjFglDu3oUQKetdVg9df5P8YCQUw
	GVBkAVrBRRIwl2TTkBR
X-Received: by 2002:a17:903:ac4:b0:2db:63cb:1b17 with SMTP id d9443c01a7336-2dd8e633554mr35455145ad.18.1789547797988;
        Wed, 16 Sep 2026 01:36:37 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd89d9007csm7646915ad.5.2026.09.16.01.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 01:36:37 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH] fixup! mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION
Date: Wed, 16 Sep 2026 16:36:27 +0800
Message-ID: <20260916083627.2145779-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260916064341.1825793-2-songmuchun@bytedance.com>
References: <20260916064341.1825793-2-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The section-based vmemmap optimization infrastructure is guarded by
CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP, but it can also be used by
ZONE_DEVICE users that set dev_pagemap::vmemmap_shift. Introduce
CONFIG_VMEMMAP_OPTIMIZATION as a common config for the shared
infrastructure.

Select the new option from HUGETLB_PAGE_OPTIMIZE_VMEMMAP and from
ZONE_DEVICE when the architecture opts in to DAX vmemmap optimization,
and use it to guard the generic sparse-vmemmap state and helpers.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
Note: When folding this fix into
"mm/sparse-vmemmap: introduce CONFIG_VMEMMAP_OPTIMIZATION",
please use this commit message for the resulting patch.

v5:
- Select VMEMMAP_OPTIMIZATION from ZONE_DEVICE instead of DEV_DAX,
  covering all users of dev_pagemap::vmemmap_shift, reported by
  Sashiko.
- Drop the DEV_DAX dependency on ZONE_DEVICE added in v2, as it is
  no longer needed by this patch.

v4:
- Rename SPARSEMEM_VMEMMAP_OPTIMIZATION to VMEMMAP_OPTIMIZATION
  (suggested by Mike Rapoport)
- Collect Acked-by from Mike Rapoport

v2:
- Fix SPARSEMEM_VMEMMAP_OPTIMIZATION being selected without
  SPARSEMEM_VMEMMAP, reported by Sashiko.
- Add an explicit DEV_DAX dependency on ZONE_DEVICE
- Collect Acked-by from Qi Zheng
---
 drivers/dax/Kconfig | 2 --
 mm/Kconfig          | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/dax/Kconfig b/drivers/dax/Kconfig
index f50c6b32d826..602f9a0839a9 100644
--- a/drivers/dax/Kconfig
+++ b/drivers/dax/Kconfig
@@ -8,8 +8,6 @@ if DAX
 config DEV_DAX
 	tristate "Device DAX: direct access mapping device"
 	depends on TRANSPARENT_HUGEPAGE
-	depends on ZONE_DEVICE
-	select VMEMMAP_OPTIMIZATION if ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	help
 	  Support raw access to differentiated (persistence, bandwidth,
 	  latency...) memory via an mmap(2) capable character
diff --git a/mm/Kconfig b/mm/Kconfig
index 0fa2eb76e4f2..30170a936f1f 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1224,6 +1224,7 @@ config ZONE_DMA32
 config ZONE_DEVICE
 	bool "Device memory (pmem, HMM, etc...) hotplug support"
 	depends on MEMORY_HOTREMOVE
+	select VMEMMAP_OPTIMIZATION if ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 	select XARRAY_MULTI
 
 	help
-- 
2.54.0

