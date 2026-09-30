Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C3C0375ACB
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 15:45:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790783132; cv=none; b=Mj6dh3z6GIomWqRrxpqJ/62aJm8+DO1rdWq8DgPIXRe4OHlTVnWgODS+q2tTBVQIiBQNk6i/kZMVFpTokDJYyhoghmOUihOORD/8FbZTYIo4FqLR5XddeUvdqOfIz/zAIaWTQ9WsQLT0LkwPJnHznfb73WutCZMNKc+Jw7bnV9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790783132; c=relaxed/simple;
	bh=JWFui58/GxxmDrg6Md9OZYh8gBH1AFTPCOugh8MoPTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RMzgIwQyTomx6BJptWJvU6FAHvZnwFgG72ilA2a79WKsPv2/GB8Pw97589ieu0EaTrWWeWMzXjSSiUMAl+Hnviy4eNCm6hWi9qriJ/cE/cixv3KzYbIL1KpzUtEULR6WDPrsr9clefCXwSIC4ct3HWmQ1cpVUxXUf3Bp2vSehbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZhAjl2cH; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZhAjl2cH"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4aa80a73so36215105ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 08:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790783124; x=1791387924; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OOQp+aPy1YIhVXXImsjlU5lD7V9ccWT+lH0A+xwkL1U=;
        b=ZhAjl2cHGEJsrWtWWUzuAEBgpRKrFM9v0x78QBL84Zcuag7IzJP2lbkfShgF0ve/KD
         gApGvHNjD0xfblAXwzMFsu6o1qz+MuqSX+MJFFBMd5WLHJI6kETWFa5OReEMQuBbWjge
         g3Kz4lbB8JdqshhETG21PbIZkc+514XYPigBOQQ6bhzo1KHurzER/JwgN9jaI2CVUvwb
         nix4jAU1l0T3IghQfSIY19GRMnkBVGn0T87nzCfBVTj8MFmyTHjWm58xlpNm9kYG3n40
         COyRyXd2BWwyo2t5OKwlMDG+vViw/sKUh1V7JcaKpXbXiQIR3cOYfnBwX1irjJsRJv7H
         qytA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790783124; x=1791387924;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OOQp+aPy1YIhVXXImsjlU5lD7V9ccWT+lH0A+xwkL1U=;
        b=Vyn9YFWL8o6w3mSFyAJH6tpSx5q32hrqhE4qYp5/oHPyEWdv1cKVl8C0QV3vQUOxa/
         M+ZVa660+UEnuCEICMgcIDZkUt7tANbmxjA+C8+LkNZDpmqOzMdveYuFIKXjrxor+V3i
         NUnF8ML9bphfOf/VgcuT87MisFw9KIHoU7CoGpsf87SMU5nUKBiTtqe80zkkR3DVbCzl
         BTz4hVCYCnhetDa7bl4DGJiOLFBChb9EpBc/1qLta9RoyTpO96amhtFvQ0ws5bv4Obfl
         TdDCsDissEEGdGC8fxyodLRPOyhx5KaFoMqGRNuMM7sJMQEzTqj21gK2YTnh6dUlI5rh
         ZX2g==
X-Forwarded-Encrypted: i=1; AKwUvBxE3OkmAfq1utnfG6yBwx2v2yk8VJXiBEJgFv1Ecrnw69zcU0nPO4LKG4uWv1NIGLKCYkxXd+lXFPmllSY=@vger.kernel.org
X-Gm-Message-State: AFq9FYKZDunxRqNW1uE09Jnm0ntodBxrDFqCWC41Z8XxTkk6fNhTM0DM
	RCYemjGGdQ+xlyOmPMf7LJTCLhGK0+y26WZ1wiytTxJazTAHCPJQbQRQ
X-Gm-Gg: AYBFou11zh3jg2kUY1y4z+Qf+uCtOmPV4uFhex6BNZwyKBPoC9xM57zVV/u50j2HnG9
	yllGa77eoe3DBWcY8OGC/sUvXhNAl1BsI/uN3kn3CRbF/0qxND3u8hXxzN+wFwvdmSMW9EQI89L
	asKGlI+mk4LvH+jnlMc3sXAf99tDX1MOCpnmEOP2xwgzpDTiOLadiOsoej98vix76e71y6+4q3W
	l9uDKGkU5AAypO7OxUZrTNfatcpY153YHpfk6p/vupaZYHxa9vB5FWNxGJLX3tl42PXpt7kqzIW
	fhsHvQQxLl1Q9XyQLK2vZz7aE6L46jSSqi1+/L2b8cwWnGRLLkkrufRWrF9k8LeM/InWBjJa26Z
	9k0WUbKRpq0bvb59wX1cQwaH6Tmzn5L5eYUAp+8n1/YaID6otqglpAP8nfb/m57VdrsJ31nXFhk
	YHvR+uLTovTF1NjToUyYgladu65pUiL3D57lpDyjpGJEitutBM35L4x8MEmwZUrzVvaIDEVfE7x
	KxxFRMekpo=
X-Received: by 2002:a17:903:8c4:b0:2dd:c053:82ef with SMTP id d9443c01a7336-2e2e4b566edmr15362105ad.38.1790783123908;
        Wed, 30 Sep 2026 08:45:23 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e587d178sm10313265ad.1.2026.09.30.08.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:45:23 -0700 (PDT)
From: Zhan Xusheng <zhanxusheng1024@gmail.com>
X-Google-Original-From: Zhan Xusheng <zhanxusheng@xiaomi.com>
To: Thomas Gleixner <tglx@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
Cc: Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andy Lutomirski <luto@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	David Laight <david.laight.linux@gmail.com>,
	linux-kernel@vger.kernel.org,
	Zhan Xusheng <zhanxusheng@xiaomi.com>
Subject: [PATCH v6 4/5] vdso: Move BITS_PER_BYTE and BITS_PER_TYPE() to vdso/bits.h
Date: Wed, 30 Sep 2026 23:44:59 +0800
Message-ID: <20260930154500.722828-5-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
References: <20260930154500.722828-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

lib/vdso/gettimeofday.c is built into the vDSO, where linux/bits.h is not
available.  The next patch wants BITS_PER_TYPE() there.

Move BITS_PER_BYTE and BITS_PER_TYPE() from linux/bits.h to vdso/bits.h.
linux/bits.h already includes vdso/bits.h, so its users are unaffected, and
vdso/datapage.h already pulls vdso/bits.h into the vDSO translation units.

tools/perf/check-headers.sh tracks both headers, so update the tools copies
in lockstep to keep that check quiet.

Suggested-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/linux/bits.h       | 2 --
 include/vdso/bits.h        | 2 ++
 tools/include/linux/bits.h | 2 --
 tools/include/vdso/bits.h  | 2 ++
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/bits.h b/include/linux/bits.h
index b7509f15718e..7f48e6af1fe7 100644
--- a/include/linux/bits.h
+++ b/include/linux/bits.h
@@ -9,8 +9,6 @@
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
 #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
-#define BITS_PER_BYTE		8
-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
diff --git a/include/vdso/bits.h b/include/vdso/bits.h
index 388b212088ea..a0b6d404495a 100644
--- a/include/vdso/bits.h
+++ b/include/vdso/bits.h
@@ -6,5 +6,7 @@
 
 #define BIT(nr)			(UL(1) << (nr))
 #define BIT_ULL(nr)		(ULL(1) << (nr))
+#define BITS_PER_BYTE		8
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 #endif	/* __VDSO_BITS_H */
diff --git a/tools/include/linux/bits.h b/tools/include/linux/bits.h
index b7509f15718e..7f48e6af1fe7 100644
--- a/tools/include/linux/bits.h
+++ b/tools/include/linux/bits.h
@@ -9,8 +9,6 @@
 #define BIT_WORD(nr)		((nr) / BITS_PER_LONG)
 #define BIT_ULL_MASK(nr)	(ULL(1) << ((nr) % BITS_PER_LONG_LONG))
 #define BIT_ULL_WORD(nr)	((nr) / BITS_PER_LONG_LONG)
-#define BITS_PER_BYTE		8
-#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 /*
  * Create a contiguous bitmask starting at bit position @l and ending at
diff --git a/tools/include/vdso/bits.h b/tools/include/vdso/bits.h
index 388b212088ea..a0b6d404495a 100644
--- a/tools/include/vdso/bits.h
+++ b/tools/include/vdso/bits.h
@@ -6,5 +6,7 @@
 
 #define BIT(nr)			(UL(1) << (nr))
 #define BIT_ULL(nr)		(ULL(1) << (nr))
+#define BITS_PER_BYTE		8
+#define BITS_PER_TYPE(type)	(sizeof(type) * BITS_PER_BYTE)
 
 #endif	/* __VDSO_BITS_H */
-- 
2.43.0

