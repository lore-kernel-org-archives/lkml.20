Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC833D331A
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 09:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788168309; cv=none; b=FC9hjNdrUa43f11CofGPSuMjcfklUuT+42aAwWNs8g5TFcRPE7YiapfBvL79Kd4VzaIz3x6z/hqNRZQMJNGErDH0+t7RMOuhBec/QorwuruwLZ2cnYQqhjae+QTgqBhj50fKMoysoke0mlMGCk807JAsyvrHQMX+CPCiRdsjr+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788168309; c=relaxed/simple;
	bh=qB8s8hgLiwwzQUS/BjiiGt7iGpPiuwlo6zbKh3mEro0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=M/T3+yiB7Qs5r1HYEN0A+Wj9ypb6t6mbFk89irq4ZRl1qHoZsT9Lp3QYmw+g5a/ud2ijiDKiifWBG1SnfWRKcRqjRbQtl4i6A6R8+61vETSM2rkK3BxFiDqcZ5j1MgBr7W7UyJhNnHtCNooojmuSRUNzsmusi+gYgEgD9SlRW+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sBFv7mr2; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sBFv7mr2"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so2524740a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 02:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788168307; x=1788773107; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=k1IRmhTgtgps2WH28DrYHzZw8IYzte0O10wXaGr0CRE=;
        b=sBFv7mr2prraYr9AsLJwul2y0INZr0lKG+vaIxFQGbkvvogdNyM7lInYz5bBziZ6xW
         WKPGGV0DuoR60dhMfUz92DO940oCffQ1cJ6h7qUfMWAgIygEZsnPQj/5D+bflxSIm5SP
         fv95YC+dxy5qxupynwAtvdQe1rXRHKRLE5GdISRjC/MBj7cvW6qsCue+ImKSeYcPhBNV
         A5IHObMnvTmV9YItyCrP818fgCVDlfvuDejPq4+be7pOnQe3xevmbeU+v6OAYjJulPhE
         lv7U9HBIjLK7kKgz8WK6W+mhvKHPsvvxPtYqSVej6hFJdHM51IyLeTMc3DywK2AMSaob
         cm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788168307; x=1788773107;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=k1IRmhTgtgps2WH28DrYHzZw8IYzte0O10wXaGr0CRE=;
        b=YK9XVVAxeZovL4JdmfNsP0hLhDdMZEHGn8A7leFSnK6s90AbU2hNq5jXyYU/gQFN6n
         tGJQrngldrPGQsoHyGrg/EDmB/XhhyaGdpPlWRJvGF3ygR7LdTFlbydhueht3rqVC6Jf
         Dg/k5gMDT8KYMk8LoXvwcUERn0c2FMoNUEYe9n4+212TpLSbzbBLFujWyIHs7wOg2Dpu
         rnbmyW508qndnBaEP6w0J+EKh3qimO+L24HSSUNWVces5pHHrXSbZXvH82atF43+0K6S
         DixMc8TWDYbnkQM134jCoUchiHXrdLLDXCS/QIGqT+/zeDaifD00MaJEXohTpce3Ydny
         nJ7w==
X-Forwarded-Encrypted: i=1; AKwUvBxfwS/xpJIFjVNFsJPYCyLMfEcITn6snwfGAR3e3llTxPHEmcTURse0vcw3eXbTHk9c4kh6CfkQiUKD7Wo=@vger.kernel.org
X-Gm-Message-State: AFuF++mfMOgL7GSjziELhnoy2vSDvYNh/A0/qPf4TLF87Od95iQIWA4z
	fKMnxr7GtDqzMR6lzn4UxmIL7s7wZrMyL0zEONij8WPl76BUFE8CtPkI
X-Gm-Gg: AYBFou0yrD0YCijhkIv1HoZhv4jwAoBQKG/ocL+W0rQITgnZNd3t2Ac7EkeZVk74qRt
	4Z9R4lVa+R6X+v5pqew6whEbBCle+RMvhYcunm9n8nIStkVzI1bsIYC8YVYmTk8zjjhgvWWsJ47
	RjDmizeJ/nNblHLXhUTNtDoFJ0byCX+Pj2zLE/goZrXgk7gDQ+EAAQQpZE3AxqF6dN2LJj6dKCR
	ETwTwe9ePr/1Mus+wJbmQffKr0SG7wePjIe4dxTZzHXa1kSGQtSMpmaw9g/bPtnCJl8O2b3pMgT
	hdamCJv+jpZRsdSbletrlawmR3I97QuDFPLFaKOUBB5FHJA7NUOPjbjtxY4fFZAh+YEik1fP1Du
	J/K9sCnB/2wKW/dlyOTaAKKC7xseTpAL3fy9mr8WrSpwMUCLRDC+VDz4rfLCF/zm9ScvAMlmLSX
	7T1S/OSTKhXiclR3VzvetB1FD7oTOS2VnDY0N2RYLhe8lUXQ5RvPnO4jROG58EYch8VAg5auq3p
	hyp5CATp09FFb9adVt6Rbko+rcdpIaNdlRMGct1hmpWuimOFXbPvWdsmuwnkV2P9IbcrASufvDD
	ufsLOCZljyULIkMKRh7hcIs/9sWiN3tP1Mb0QEePl/OFnBw=
X-Received: by 2002:a17:90b:4ccb:b0:398:c0fc:6ea0 with SMTP id 98e67ed59e1d1-398c0fc7b03mr16400154a91.5.1788168307412;
        Mon, 31 Aug 2026 02:25:07 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0dc854dsm26587955c88.10.2026.08.31.02.25.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:25:07 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 31 Aug 2026 19:24:28 +1000
Subject: [PATCH] drm/fourcc: Add Apple Interchange layout format modifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-apple-interchange-modifier-v1-1-5d6e27f9f308@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y3MQQqDMBCF4avIrBtIDIp4ldKFTkY7RWOYRBHEu
 xvbLv/H4zsgkjBFaIsDhDaOvPgc5lEAvjs/kmKXG0pd1rqxWnUhTHn0ieR/mBfHA5Mo7BGtMdj
 YykEGgtDA+xd/vn4d1/5DmG4RzvMCO3nK/34AAAA=
X-Change-ID: 20260830-apple-interchange-modifier-cbcc311c835d
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2012;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qB8s8hgLiwwzQUS/BjiiGt7iGpPiuwlo6zbKh3mEro0=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFlTPfL+avkx3Lp3UlD4xNInzHP+ep1t2Xy+ZacqK8Ovu
 ake23786pjIwiDGxWAppsiyoUnIY7YR281+kcq9MHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1aTtGhmvcX4O+sO9pyQnYlzOjtWELp0FX/mlX46W/J0yxUPBLOMvwP4j9i8e
 i1ihlbpvvFgZL3dec0HANYF/Xzfj11ZyXzpbFTAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Interchange is a tiled and compressed image layout used
for buffer exchange between Apple hardware blocks. It is
similar to the already-supported GPU_TILED_COMPRESSED layout.

Add a format modifier for Apple Interchange so that it can be
used for buffer exchange.

Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 include/uapi/drm/drm_fourcc.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
index a103fdc0b3a3..aa51c116cd7d 100644
--- a/include/uapi/drm/drm_fourcc.h
+++ b/include/uapi/drm/drm_fourcc.h
@@ -1626,6 +1626,26 @@ drm_fourcc_canonicalize_nvidia_format_mod(__u64 modifier)
 #define DRM_FORMAT_MOD_APPLE_GPU_TILED fourcc_mod_code(APPLE, 1)
 #define DRM_FORMAT_MOD_APPLE_GPU_TILED_COMPRESSED fourcc_mod_code(APPLE, 2)
 
+/*
+ * Apple Interchange layout
+ *
+ * Apple Interchange is a compressed framebuffer format used exclusively for
+ * sharing buffers between hardware blocks (GPU, display controller, video
+ * codecs) on Apple platforms. It is similar to and uses the same compression
+ * scheme as GPU_TILED_COMPRESSED. There is no known uncompressed variant
+ * of Apple Interchange.
+ *
+ * Unlinke the GPU layouts, tile size is not dependent on bit depth. RGB
+ * images and the chroma components of YUV images use 16x16 tiles. The
+ * luma component of YUV images uses 32x32 tiles. Compression tiles
+ * are once again 16x16 with 8 bytes of metadata per compression subtile.
+ *
+ * AGX has limited support for Apple Interchange. It cannot be used for Z/S
+ * buffers or array images, for example. It is intended for scanout buffer
+ * sharing only.
+ */
+#define DRM_FORMAT_MOD_APPLE_INTERCHANGE fourcc_mod_code(APPLE, 3)
+
 /*
  * AMD modifiers
  *

---
base-commit: 08dbfad3f5040f5bdb6c529da20d6d4e81fefd72
change-id: 20260830-apple-interchange-modifier-cbcc311c835d

Best regards,
--  
James Calligeros <jcalligeros99@gmail.com>

