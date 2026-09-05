Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE54032B112
	for <linux-kernel@vger.kernel.org>; Sat,  5 Sep 2026 05:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788585748; cv=none; b=kLjZCIkSk/Senww6JfZ6/YLzGst3oS1W9p1RcLZkBu0hl0w7/Ga7DzMN1SkveG15X0Y+KKJ+rbtQQkgM4AtxsVd9upDqL7GbZRp0vXysVPoJFEpg20SLB4mZ+I2FJVjlFFrXc+wn8NO5rbji1aJW9BOFDcJtPcRPdQEg/I/AG5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788585748; c=relaxed/simple;
	bh=mCYwkpSBA7nQPXmu86fcBv4w6bzMHVo7Rsf7nBHmsKo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jufqL3Qk6TbTz2CbNshjH9njXMxtFzWGjpjVG1Tr2dJ3bhKr3DvS5xKMl73Tbd6ZhI3iJsfzfIkXLx41EL61kIrdKgcf6poi11h5/Y/qjRYeGeHrK59cg889L18Jdns/xbBWbYYDFUSB10mSVKnRfHX3IFnnWS3/P0rk+LLklNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/1W98Ci; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/1W98Ci"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso21124845e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 22:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788585745; x=1789190545; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W6LzuWxJpMnBn9aKpi+zBOEnJnyIuwuuYGfuHrQdAgo=;
        b=B/1W98CipZPFItzS7FRVaM/4WWPfqPsECuBsWwr/zBUn43wUv2mpdzJxCLoPfopoI7
         7Vj36XIxYnz8jNuluHlCT2i4RCFLq6vyYuaDrmAGLtSQiYlQjJ2cRuqKp7UU54ZMaju7
         2DZ2YiUIhFusHwwzHwxYOsi0xRH0fkTMDX8cFhQyLWPsLp0XLtrKcQYDgBcYcVQnJpFJ
         KerXtJLTXZxJkuDKubWvT47lsryQePgc2UvLq6TcBE2W1aDSL6k855LjwyW+ihKehRR1
         UfnDhXcyErcMEGLOyZ7ry3l2cTy2oDDOakkOBncn10YtCe3Gl33LGKH33dtxJQtDWJWj
         HW4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788585745; x=1789190545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W6LzuWxJpMnBn9aKpi+zBOEnJnyIuwuuYGfuHrQdAgo=;
        b=pwTVH+Tz7l7Ka91zPEEYBA2HDleZrwOtStKUGBpfyY4VQaiS1i1rmF7PkUbvFF5WWu
         cn8ltVEij758J6EQYkb7HLucB7rNfy1pPETnK6YVcayGXOg71sHEUN2npgRgm+HehKYS
         zPgMvz4Mw6NLNDcIZUF1l91MEnZlVc+0wijCUXIYLr2MY9S/g6p9CIEcppXSDJe4Bq98
         plzdA78CN0+BmcBR761Z0jI9yP0HjQQOCXEKhYEJVjZC7SxueiWRPSf7Nb82Kp6FBqXS
         +n0k0M2dyKPuxs73aYBJFdvRq6LFz+URXHYY0eM/GAh4B+0UI1vyIATFYyoIlI71HMMJ
         8bSw==
X-Forwarded-Encrypted: i=1; AKwUvBzt5WElRdb+RjNYen08oq2wBTIkknlVaLsoGDgRJfz6h06T/V9Ek73U7J3P5udNW7615m7BSLdNxV7m+8o=@vger.kernel.org
X-Gm-Message-State: AFuF++mNF7fSTddqip0rXFrIFooSeuIfbkGxVziQWzrHaP13Sl53hqtE
	XI2U1ZwmKzFO3VwjqyoobV3TgYtd66EmHnnttqQfFiStAmV+WvKnnjoO
X-Gm-Gg: AYBFou14fSPRGacicLs+sY++wwTD46WVURU3KAAfkqkJEupsYSScdeP2N05M44qx8mL
	DJIGiiRxAjXf8tDuSrPGCmtIK/y4vWgfqaBPsOZ4sGJ7Jwb0qGmrSu2KLh5biVT4N6sKfeU9j7w
	PsGdzEvl6miwFAavDWLo8gX71jFeF1KbhrZVLcM+rOTP8eD0Yn3EVLQqfF0d+ZkQr+D3ctVwSn+
	Z2h0/X5ya7Vsq7lQj4zNYJq2677lAlc2TmjYd0Tj/+mdYaRNxN0+3QySsB8bd9pAjawes0iX820
	K4Qrr+sbtahACNnmiqBdD1vYacKM13xriWriuES55Bqxnrst/gIE8a75dWID8HtOB0i6uctVvH1
	OnDvbZ75T4yU1yvLCnuvXB0sBfsHNnezVoA+adaqDIyj1HWIFFW44zbD7gZnOEnGAv3zld20gfw
	Q9wJIc9yx0pBaJVv6Uvh/ytqqgL2xz9AR/sQYKn/dSKf6cs/xvo6LzZ4uOXbXKS2BVI1JD12WcW
	l0HeHOGjDUScNPlG9vHXA/97yXTLBzjchUV0uRKemb1hGjXZM1Jho7k5aIjs+62sF2Mmj95ruSQ
	G6VQEcfbTjEYWwgdXkTrz6nGOsge6eYynBzpgBEMW9HaHScqOlGoyhyUCi33rl9PQno=
X-Received: by 2002:a05:600c:474a:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49cf825d722mr95046655e9.10.1788585744908;
        Fri, 04 Sep 2026 22:22:24 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858ac2b4cdsm9598692f8f.16.2026.09.04.22.22.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Sep 2026 22:22:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: configs: Update axm55xx FS-Cache options
Date: Sat,  5 Sep 2026 07:22:16 +0200
Message-Id: <20260905052216.11986-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CONFIG_FSCACHE_HISTOGRAM, CONFIG_CACHEFILES_HISTOGRAM and
CONFIG_FSCACHE_OBJECT_LIST were removed in v5.15, and
CONFIG_FSCACHE_DEBUG was renamed to CONFIG_NETFS_DEBUG in v6.11, so
none of these lines has any effect any more.

Drop the removed options and select NETFS_DEBUG in place of
FSCACHE_DEBUG, keeping the debugging support this defconfig has always
asked for rather than silently losing it.

Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/configs/axm55xx_defconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 541e38e2205b1..7582c964fba0a 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -196,13 +196,10 @@ CONFIG_EXT4_FS=y
 CONFIG_AUTOFS_FS=y
 CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
+CONFIG_NETFS_DEBUG=y
 CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
-CONFIG_FSCACHE_DEBUG=y
-CONFIG_FSCACHE_OBJECT_LIST=y
 CONFIG_CACHEFILES=y
-CONFIG_CACHEFILES_HISTOGRAM=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
 CONFIG_MSDOS_FS=y
-- 
2.53.0

