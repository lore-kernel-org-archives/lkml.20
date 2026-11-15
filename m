Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744341;
	b=ZFOzYChLmADT24e7CjUp1wk/ozVALBWe8Q43/dIzNsukrqfh9HR+GKRvrgAgffbxJPPv
	 CgEqtvAxTaarPxcFwniD91zrD75MYVOwjB4Jh+P/dXnzTT8MjB3EQhrnFjUzN8veuPB6x
	 n56NY2QZ2w7jc/6IDYeX4ui4c7eGpMv99BGEqFTZ4AVFosEycrU+E0UU2tgYRZ+9byTr6
	 z/aPLh2acWBBqzgI3rmCrCLuIsuFXoeFB9mxD/8tXqJjJ8AgoD4nc8IkfUfWIosfjskHy
	 Eb9LwBNrgaT6d+QOHR7zZCiXgwLbCWjPp/FhTQxsAJSUyC+4tLsfI0TNqmi3QLHyWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iw87GGpgaygCtKpkHMjCxhTw+ezQn2b21tLr5BV9P8U=;
	b=bI6wm+CPsUaUDOuu43r29S5kK7W1rbr/Nj+1p9LemUjiJ6dxR4Cq6P34Y/nIVby+DIuo
	 nXMdy7ovvd7spDYHt+fK1MrCMW5WlWGG1ujO9A5vWjbj+Z43xgq4J3p7goEyLPfcpCi0j
	 7G/fsW/08zBeZcBQwuEkanKoPz57rd63qKkB1+rvL6moW1zrn8rGKP62ac+reCWnCL6hr
	 VZP6ePvXZj+zWOYFgJ/UmDsr0k+M5KljGVrTrdB5cQldCLknXEXLVtvE9zWabhOGqXrjz
	 MyO0ccTw8HI8x40qAGjk/QzvneOD00ApZ6FvHyWMUots+PElg9hnEM6epOM+0EgvlPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2aCvnsJ;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F129B606A31E
	for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 12:05:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F129B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X2aCvnsJ
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e47347279so979120f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 15 Nov 2026 04:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794744339; x=1795349139; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=iw87GGpgaygCtKpkHMjCxhTw+ezQn2b21tLr5BV9P8U=;
        b=X2aCvnsJnqid44G2Xe4dm0LocNM+q91itA7FAXkMtxNeeORMFpFfxyNXSbTsxS7gh0
         7S7VSxKbfKDOj4kdn2aAppZnNd7iyLupWmaeo/jxHOb95GBd64ERk0jqxF2nljqct94v
         f0MrzVCkCeQPTurLWv1OwokSwX/9OtmPbDA8wnV7viQP+ky49XZuzxBZRPpjLdz6Ij7K
         D8IjG+lKgcanyYnts12DBxsV7TdbRH007Nn+QxRWE4BenXKQC96O4rfWdUaAxKUvD6NW
         d/uyDjlOC/GBcMS8O3tXCWZ01Sl7/7dptt9uO5JIF84bAIZhMPeFJyUlXXyCN7eGdbC5
         xnOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744339; x=1795349139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iw87GGpgaygCtKpkHMjCxhTw+ezQn2b21tLr5BV9P8U=;
        b=LvPiZ0d+VzfPFtiVYjqz/KYLbTyEMTRXTYih9c/1V12r1OYszKDX6DpDhyF10BO+Oi
         eApLpfgTBw/5dg621ZkbO9NS3475dxT0rgAt0u4lxRLemE14jsAZeFXvHfx4MMLc9dtC
         Lv9+l28hukJAA4vg2PtODUu4mtaraF8Cc+f4OSjid4KEkIyBSF6Lhrxb44iUTCvpAf1/
         cHjr78ATF8u0wkCf5QMYUFQzpaXbootpPAE8a7xyT3xHqZsTJWYrzFHrLUIegWgGOO5t
         vkpG51nHX3QBkPkog/cSmTAjwVNMPjmxgadtbg+orENfy72UPxR77TiPGNI83+tj5Z3p
         gDIw==
X-Forwarded-Encrypted: i=1; AL+hErE2jBCBDX2rEO6jqTBs40FVgxCf2jyi1yHVI3ugCDr7e1Y1h+6QTgsWs+aPXKT3RVt3jZnHbbpoNwJUiRA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/lB4REGUfCDV1XcGEj2eMZ2mZJm2w+OG8H13Upl+8GqK0yQM9a
	8YlB619gA4pKdwDDooefkcCbxs6gmf9ia8slzGle2c/tRnnBe32CS/Pd
X-Gm-Gg: AYBFou0LXBf8CS/R8Y+BgWvobGpzuO5sSbRQ2p025BZmetmlkxqA8hjSKnzpev4Gz/q
	N3Ajj0NG/+G/XYCWOmVHl26quZecm0o/5DTgVgcd3h4+RV83G6Z2sQfXDh4U+p05wRlXbB9JGl4
	Zb2K8vmeydbkaXsQGPiGkzampp+zQhBzpOmh4fmNxGc6BA8EwwGpnSYy3Ognw+URmEcxovZCrLs
	NUzqwAToWN4/QN6uN8nxQcN0m+OU1e/OmTlcrPCS8gFKND6R1dYgM6hORScuuRp2s15SVECtnmH
	Ma6sS+nri9N0KxGOZlSoW4Ns/9wr4Z/y45IsUbIaq7rKo9d63fZWZSTm1bty+FkeXSZ74Mc0aVf
	c7ZINkd2Jmtbr9uTkHYPkBpS3CLxS1IlyJWGfRa8C+lXwZfpiI5UnhMhjZt18pbg8oYXJys2Jt0
	IrtNJ5nV5SSITBu+V8c51dXtP/6k5aSGa1oziEb44BuZ+cbWoqBLHqD7cZF9SK1XkjZQ39fVLHQ
	VPkTixI8TaaFNdla7PtG6i4xllgQw/HH1duwYdI9V0DjUvwI7CB2c27bhXHNRPH4QKQ25wXl24Y
	yVinYA6qCFFQDS2YekOAF8YaJQz2guxvwa7hhOF5boV3PnMlOLonv31mFkImaar/wzU=
X-Received: by 2002:a05:6000:3c6:b0:491:ef47:72d7 with SMTP id ffacd0b85a97d-49c712ac8e1mr15120353f8f.12.1794744339076;
        Sun, 15 Nov 2026 04:05:39 -0800 (PST)
Received: from localhost.localdomain ([2a06:c701:474b:1700:da41:1869:5f63:edb1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c603f4e2esm16258788f8f.36.2026.11.15.04.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 04:05:38 -0800 (PST)
From: Avi Weiss <thnkslprpt@gmail.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avi Weiss <thnkslprpt@gmail.com>
Subject: [PATCH] dma-contiguous: reserve NUMA CMA areas after default reservation failure
Date: Sun, 15 Nov 2026 14:05:35 +0200
Message-ID: <20261115120534.2331911-2-thnkslprpt@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_contiguous_reserve() returns when reserving the default CMA area
fails, skipping independently configured NUMA CMA areas that might
still be reservable.

Register the default area only when its reservation succeeds, then
continue with NUMA CMA reservation even if the default area fails.

Fixes: 7e6ace2535d0 ("dma-contiguous: add kconfig option to setup numa cma area if not configured explicitly")
Signed-off-by: Avi Weiss <thnkslprpt@gmail.com>
---
 kernel/dma/contiguous.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 90937dc7c627..0b6500bb6cd9 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -287,8 +287,6 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 						  selected_limit,
 						  &dma_contiguous_default_area,
 						  fixed);
-		if (ret)
-			return;
 
 		/*
 		 * We need to insert the new area in our list to avoid
@@ -305,9 +303,11 @@ void __init dma_contiguous_reserve(phys_addr_t limit)
 		 * but we also need to insert it in our list to avoid
 		 * having a default area but an empty list.
 		 */
-		ret = dma_contiguous_insert_area(dma_contiguous_default_area);
-		if (ret)
-			pr_warn("Couldn't queue default CMA region for heap creation.");
+		if (!ret) {
+			ret = dma_contiguous_insert_area(dma_contiguous_default_area);
+			if (ret)
+				pr_warn("Couldn't queue default CMA region for heap creation.");
+		}
 	}
 
 	dma_numa_cma_reserve();

base-commit: 97d73c8251226cf27cc6656b4c542869bb8c69fa
-- 
2.43.0

