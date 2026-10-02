Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83594E9C0E
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955099; cv=none; b=HHd5jtOQozFzSd1SeJB/dirVhAZFl7SJsQdyktEg7BAGi1sFSrVZx355TQ8VWS5RqlulB5pxdG2XEu9PyEDdaDSGfe74b5aDl0w2pSatvgMv9wFmc/LdrFSWeu6cufZ7bt2lsvveeR+/8pXnaqnBr9FVlrcs/yDCEQf0yQoHO9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955099; c=relaxed/simple;
	bh=waLTXygKBCktHFWWQLS7oUUGuXCOyf/dKmOnz5GRwSk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cEAHm78qbqsjVW7ogOCyPk3BzBf6Uy3sSLepwJ7NV2xISjkwm78jQ+ogckAN36+sRHHDqdJvSvjAszc0ZWxrZLg5olJWAglNUmKZvLTj8YLglyOwc1MmHh+vMxeXr8ky28QYyGMHtOq+WzkZNeiBpBbg4Ank1+0JQqYc7/k5bmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nv80etwF; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nv80etwF"
Received: by mail-pz2-f40.google.com with SMTP id 41be03b00d2f7-cc74520b20bso2107601a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955097; x=1791559897; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=a924JpHyOL6O0gTjq5zDam9XIZaPuYCQ6ZzQWo3jo2Y=;
        b=Nv80etwFMWnDQjLo3NqLXq2IcUbqyjdbK1zlgAWCu9/noaanVhuUi8kkLxtmLowI5/
         FOmomr25NtsGBJY0vXuBStiJFhIlxf88tOed9i/SBwcUoY9fLEbVngV5F+Qs6E5kX3iQ
         jY0TbjF+IizuYf95SjsTO/CKyOqNxUtDor/bRcjxxcc4wlN96wCTIiKb3lbkHlEX1QOE
         jsSwN/+eCWADbCWYwj7jc/AAM7XI81+aLAkQyI14Am2z6o9HZ4z4zO33B6RokAfT7LxN
         PCRqnYe+XyzBCrOxohL3aSLqZIMOhdZp9o6s8q46fYpo37gfwrpwPWT7xCT+19pEXYCF
         5a9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955097; x=1791559897;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a924JpHyOL6O0gTjq5zDam9XIZaPuYCQ6ZzQWo3jo2Y=;
        b=jZwiIU/5xd+sVli+tNBtmqDUR8+Xvha02n5JBY3CkDziB4MgJyjiDOYUEti0idiosm
         KGDl2gZ96EyOlSZphyehPTbri1MVE85gdVfwTCP13hq0YX6cQwCU+E+paNTHp0/BF0j8
         +M8c9P+aF+2jGUmpJtca2/+/OB6P7bghDfmOQzIPUPBW0VZX6OZJM8mdiOYCzMiu6GcA
         hDbJl9HkyA6KkWwQWQFuwwsj1CYZRoSqsGusIk75m4vwkQeJQYfsHqHNa77jGnxIi8il
         Bc/WvSdVJ6Vo5erC2xBor2+UU5Hslc85aq5NQygteVjqgL0mqWPRWz6x1eGc2bHiBy1T
         db7g==
X-Forwarded-Encrypted: i=1; AKwUvByOOxxLDZ7up76gvF1guD4fpibREIo38qMTJxFbk2Klh0q9VIxcl1LPIJig9oTZ87zda4ylh3nMxd4Sotc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJzm6nPPPIewzJcGSho9LCgI8uYLH78Fu1CluCnnqF6Z6DIjut
	FrsBijRH7BZdxwtLTDl9y9rJodtmkTEmRyfy7msp9VNxpqFboTYqQU6j
X-Gm-Gg: AYBFou05G4p/m18rfEf6cBQ8+nNvkSQ/61TMW1n6tB2+hcfG3wh5WxFdjM8EHyZeZze
	CyYDU2z6L04JKuFqPYTXUta7Ggel1l6geAAc66aGtoW2AxeK/1j/e0Me/AEh3mrngyNQZS4U2Wk
	8KRwIRlgRVH9rD4cWcpdqlqJsToNM49BVyW9tU6XGKVQD2SPfIZXFvgZVWvaWo4WvPKffM+69vg
	Px/Ey0+xqXYISiys9Ky4G9nKAXILFbeBaVyI8HG9sLFmnOrxYFC2rbYPHz9MdwIVoZi92IZmn00
	ze+IjV6gB3xonEn7SlIPAapMeQmZUJdsxgrSXl5qVyfBhr/7ZIjL2Y12lyedT8Bw2YU37GKCkqj
	9oRd0je6oxOh+1LiAU/SMjF185GRofhl2o7GuqraczuZlgRsbRZYdIZSfI3jHyVsJLHn1zN0jkT
	NlDD414AwlfY2uCXVbCCEWnpplg+P8OEdgxV5lruZeglSKa91sImpSMtzEirdH1L/qoK5goa6WN
	FsIWMsvuUGLD60Q6SvZ874=
X-Received: by 2002:a17:90b:5483:b0:3a4:b509:88be with SMTP id 98e67ed59e1d1-3a6ce981729mr1746671a91.15.1790955096935;
        Fri, 02 Oct 2026 08:31:36 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6fc716b5esm1649468a91.14.2026.10.02.08.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:31:36 -0700 (PDT)
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
Subject: [PATCH v7 4/5] vdso: Move BITS_PER_BYTE and BITS_PER_TYPE() to vdso/bits.h
Date: Fri,  2 Oct 2026 23:31:02 +0800
Message-ID: <20261002153104.1347978-5-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
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
Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
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

