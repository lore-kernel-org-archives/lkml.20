Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCA6446859
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 10:49:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789642207; cv=none; b=jTUVZ3tqO8UsKKCTX4akqbQX0D2dkJMUNjW+ZH+sNFkKSVR/7YuK8TrkRIlB4ZntyP9AJAzb+XBLgKQDBPbr59HfHSkfmmHSqQ/5rrIKueujlYwCOSbywRaLbidqB8Fc4IAuNqUVUzSug8ghNW+IEFwLSsXds7+xwRyRGVoIuxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789642207; c=relaxed/simple;
	bh=X1GV84Wq/vFzYUv/sfCUjMI1OdVSf5hhLntbftA070c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=u9D1fz2rWOhda/hc+GO9lVlxix/NLgq/+VCZyZvJHFwrHCm/EjRHzkhVJN5KQBAPnjMZudVYudlog6llzHmAqDBv48ePWiYAhEaPO99mzFtGGGZxMbLZdz8PzhDztHNtP8gjga9GAQibvev//uyjfMKuRIv7X5ZXuq8y2LBeFKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qUQAfV7o; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qUQAfV7o"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4d04d73b8so525514a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789642191; x=1790246991; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JgGGToNc2v5pflrpzy2awJuFvrt52U0TkSLrIqd2nHA=;
        b=qUQAfV7oM83XALympYEzhjoTAMttA/ZYu1sk/4RDCB+s2SOY45FGjCyXbiruKfiY3Z
         jm0vTZgXYgsOabq76AVg9sMdCLlo1vpSksbVDQ6p9G1iB+ElITpJ2CdjA4L2z+S+DSTq
         43RC7kasT4/5rl/QOaGWoAKEhp4KatiQ2cyzSt+E+zoDumLIEt+LkMjoZsbXMZbHKNeM
         eP2ojssu83ymto06MRKtk5ZXzIsZmoLjdKBpEewC3HGJMAI2nXGeHUkhU64zHxaGXAkf
         2CO1SVy4V6xHtbgI4L8fJWkpMRHHOOp3v3z5VC03g1KGHQh+SkVBUU0ILmMUTfyzngT7
         JEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789642191; x=1790246991;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=JgGGToNc2v5pflrpzy2awJuFvrt52U0TkSLrIqd2nHA=;
        b=MUqUXFqel0623hg16zl9LbiDgiBC/qEllyGbUFSaWoA32zi6CRzkSukQLG0+0EM9l3
         yXq1wyF+5yEXgN0S3x4W6QsqoXGkamBZWPvO3oCnsm94BMAu7ZdQb0ChTbgNuICRx95a
         QDxndyC3+Zyns3vaTFwG52zCHmlRVchbEtHL0QPDG9/0lQRqR8rRLPNyj7AlGzHZOY/y
         ZzeQAbYRRm/jT9UaX6TkyerpT5d+QFa6mc4JchbHuylPpvDEC8q4uzTG0inLBGTdG01U
         YKOQZHNVvFxgPKrz/5/Y7DjFLWcHs7hfm1+yN9ThrMbujlrxGTwETXAiKimpDeWJTS2m
         SFzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxIv5ppFPFX3rtD3GNEhwgjGCq5mtLRlHb5DBxbDN8/AzoyOPV/ydglZok3qVFnH+f98pvPwMivQ7DumuI=@vger.kernel.org
X-Gm-Message-State: AFuF++mKuvgPmct2gJJK9QUTGdt5T1XC5NJ9748oH2dYa4iPGPAdOJ4k
	ew35mNdZdmcQvyDsdqAdZgin9Z/9Ol7rIRbryD4rS5g3arFUZUkbUYffIg2w5Q==
X-Gm-Gg: AYBFou3zpp5lumdnxbyAJchHvh5f6UgDYcQLnbI84IwrXxFmRklRthfGSPBuej3YMqs
	Yk0/xcBtNxGDX/Y9J91Zng5Q1mQFGb19IrIhKpVRKWLBPiODetoh+o7zqpU0AE6tZAU4nVf3JQ+
	94IxLFOivLXm/WpreJS874FKnPaBQikIN+johsvOPWwJ9E0W/miJnF5Pwf8P0K4/hjxzxJ+qSkm
	JtLgUxSG3RwH6pFP7RtvU0QBNoaSsjZOkvtT8RG7B4g2lOe9nX5vEEl13NcGTo2kBbsIvhtURa3
	JgZ/+zWe+Gn9x0pdkGc/gWxQlPxYn3uR41MWkCd/YPsiXWzw45nQvWoczwtvElk1LpXFDsjHGYF
	/p+9l2QYaSWqAoUH4E//ayerIg5UZ07GJxCkQG3JJrUxM3g0c21U63JLpIThJc3b2UFhcKl8dHE
	+fryr6H1VB/9CPgzcN5FuDwi/g8PXabeXppPtxAFotPB5SL4Sc0UAEs5vXQP6uPbf2yBHn3kF92
	1HfFqbx8mIRGsAMDOvmwjB1BVMbNxV16nCaA+6CHa0ICk/9oKZMnGp8rF087s9NXyks26PRkmwO
	hoBsPXlOuEXBk9CVMmmLh4ahOIcTUpf8RhFl1r3EtVnnL7U=
X-Received: by 2002:a17:90b:4e88:b0:398:cb56:e92 with SMTP id 98e67ed59e1d1-39e1e30ba45mr15259032a91.11.1789642191459;
        Thu, 17 Sep 2026 03:49:51 -0700 (PDT)
Received: from [192.168.2.3] ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e39bb3f1dsm1062109a91.3.2026.09.17.03.49.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 03:49:51 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Thu, 17 Sep 2026 20:49:29 +1000
Subject: [PATCH RESEND] drm/fourcc: Add Apple Interchange layout format
 modifier
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-apple-interchange-modifier-v1-1-875294689c48@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Oliver Bestmann <oliver.bestmann@googlemail.com>, 
 sofus <sofus.c@icloud.com>, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2059;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=X1GV84Wq/vFzYUv/sfCUjMI1OdVSf5hhLntbftA070c=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDFmrjx7fMcmxc0PVGZ9HIrxaxg9nG8kejncTsVz6OcDp/
 Jn8/9vVOiayMIhxMViKKbJsaBLymG3EdrNfpHIvzBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjrGPEwMUpAFMdFsXIsF1l057fpy2nK83nbVmU9Ex0n02S09e+U2nefeUd59dNymdkmHVg1ZT
 sJwbz/M/uleJP44+qa6q95nTvsPtND7dLJmuaeAA=
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
-- 
James Calligeros <jcalligeros99@gmail.com>

