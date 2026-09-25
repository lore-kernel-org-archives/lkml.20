Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2338348F84A
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 10:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331809; cv=none; b=WI/7R4HuSAZB9N/6/syLEyI11d3CPMGGQ+SgX+pofzzlYsUn9u3aq6wVedVuHGjcg4W8N1/4fvxC9hr4LRkUrgm/LfFTTx85ePJPXJtG/QLis2jq4eLKKx9fqdsSRTZo4zPzIX9PdcIURg8VvFdVzAraSQCle68NLOM4EqT80/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331809; c=relaxed/simple;
	bh=RAqsfPAVKJLcjT6l/y8YXDAd3o4CD7vf1FTusngFvQg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=d304pkUy92/Q/guKMrlMDs0Ng1HRjJh3bGtTZ0vUreFFFS1QyODKbfs9XHhvVTOnlOHTuKpzQW4xArVAVkaXZNdXsMeqKxcnKGwqToNumnZgNiA0rcp0HmVjn80OnHen+eDUAGNA/X78Mp1hNsdO9XXE09ZkxIOXwmlwm+ElAJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FMr5gXlA; arc=none smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FMr5gXlA"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-33e46a156f4so381646eec.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 03:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790331807; x=1790936607; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0vTxubhCnQ23iHAJp3yQuxnxwQgZ+kjDaKcVCCIEpeo=;
        b=FMr5gXlAIr/IYs03dVFpILQQYR9+sEcEGPclO3A1N0CZdpWZq8QajLQzGsnvYe7RQl
         yyxQRwUX2hkfKQHnl1U1KLptN1xH0FqeEk85MFia9V5gd35kc+hLgLPcRLQxWyffyfsf
         4C39MkH6hbohGEX71Py/7IOIPq5+xE2kt98AfITYHGKoujYtzJo++jBWsAEEou+sz6J2
         1/bGZwSzC6ZrD1BAOd+07mjf2ZyMq7rQw0Ho/p1q+cV25Ag6NeT45i0zDJm8S4NZTRHC
         wggx5rw5RFtKEMxB/ElqskFr4p5KC3jfp3BLtgBUv3bo/mJD8mbJCATRUKz5BEx0YXjT
         w5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331807; x=1790936607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0vTxubhCnQ23iHAJp3yQuxnxwQgZ+kjDaKcVCCIEpeo=;
        b=sf+DWBbpzXpJ+Uvsaqhp5rJBnUxmJLixDXKZZzctVIm+gew7kDQ4QKaoh60PBVz7dF
         pmrh5KT/+p6y4tpSWy4cqHhyPTKy78cJyc/8akE5iPnKh4vdi0iwb0gsuuc5sBv+kgWW
         yM7jQyHlOJIzuL98A+7LLQa4UWt2k4SkUkAz0wEjWjc87/51V3kdfI31jb2UN1pbDIoN
         hkyQO+zRlilOyVC4JMoVVTxFTaM/oj+KCG3uJvAAqZpT0ukZVhvDjQINjnL8k3VfYDCV
         Vcs5lhHLpU3Qn7rqtlBBReVjLlJgknhJhs2tKC0a3HijDApsi5zJG42mZENxn9CZmZx7
         reog==
X-Forwarded-Encrypted: i=1; AKwUvBzKH+Myr1iy4zFtIMy1W7zViUMwIrbT9aLs3HsmVB6dIHhkzVvtpKPlIJxqmD1QBjF9Wb8KKZ9Z47NjiWI=@vger.kernel.org
X-Gm-Message-State: AFuF++mvlObCHKSmMPAetfY1UoBVglUYP7HVNWBR27LMswrez9Dlct1d
	kRLURjfytAHwvcUJ9VqYfhKWU7a98fuWSFjwz2H9md5vsmiDxOsvsQii
X-Gm-Gg: AYBFou1NIPnKVnfsPCPRxQTn1cTjeQZzKhim0xoXVzfAKYDxWP9Rf9+FFy8Q0JSlqJi
	5dOUNlRTjSX4MdRN+qmzcthkcHXwpezlPNjbp2NL8ksUBbCLS35AJP2leerYIl/eaVRAwq/Bf8U
	7KrOhIrVqmYg8JgRj+VGM+HLA132Go5qOU3djBiysB1QLkuf/vp0DTLbTDS+x4l+jpzTFB88pbZ
	abILo7I7mumEnQl7spbgdE/Ok9Dk81UH8uTA1jGcXiJHQlw8qMZA80zzMzT2WqdeGnIq9xT1/u0
	XRPGEl/Nv92wcToz3El3IJuBWXEfE/ba7/6gc7ftQy0+3CMNOnLFi1uCXeW9mDxZ7zrTL17U10t
	5Wj9rWyEyJj5WQSc5TbymdEHRGJIGzpnlmX9HTvj3nkCJgPY6L+fdpLqGTOmF83y1L+4vb6GKem
	aMrzahbdEk5bwbb0daQJEI8FXDE+Xl1I1UVc2czF7yynOQOjRrLdS84VQYWSDZv2ojdGVx/AopY
	RP6vLWkkO0TmOIKCRd7IKAkS5Et4VNj0QG4eolimB99Krr856/x/iqkw/7oXPGnlgiS2ucJ5BNc
	oF5ybpad6RlVRFhDIiXOrh3+plKYM+OpwAvQiaETp8Dek+7gzoZThKsd361DqdmRVjjAiJEdsg=
	=
X-Received: by 2002:a05:7301:8601:b0:33e:4475:5e02 with SMTP id 5a478bee46e88-34002be16c1mr4164418eec.5.1790331806689;
        Fri, 25 Sep 2026 03:23:26 -0700 (PDT)
Received: from FT6N242TWK ([223.181.117.176])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-341463ec3ecsm5927610eec.31.2026.09.25.03.23.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 25 Sep 2026 03:23:25 -0700 (PDT)
From: shashank <jain.sm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] bitmap: bitmap_parselist(): don't wrap around on a huge group size
Date: Fri, 25 Sep 2026 15:53:06 +0530
Message-ID: <20260925102307.49513-6-jain.sm@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925102307.49513-1-jain.sm@gmail.com>
References: <20260925102307.49513-1-jain.sm@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In the "range:used/group" form bitmap_set_region() walks the range with

	for (start = r->start; start <= r->end; start += r->group_len)

where all values are unsigned int.  bitmap_getnum() accepts any group
size up to UINT_MAX, and bitmap_check_region() only requires it to be
non-zero and at least the used size.  If start + group_len exceeds
UINT_MAX, start wraps around to a small value that is still <= end, and
bits below the start of the range get set:

  "1-1:1/4294967295"    -> bits 0,1 (expected bit 1)
  "15-15:1/4294967281"  -> bits 0,15 (expected bit 15)

The loop still terminates, because start keeps decreasing until it
wraps past zero again, but the resulting mask contains bits outside
the requested range.

This needs a group size within 'start' of UINT_MAX, so it is unlikely
to be hit by accident; all bits set stay below the end of the range,
so there is no out-of-bounds write.

A group larger than the range simply means that the range contains a
single group, so stop the walk when the next group would start beyond
UINT_MAX.

Fixes: 0a5ce0831d04 ("lib/bitmap.c: make bitmap_parselist() thread-safe and much faster")
Assisted-by: LLM
Signed-off-by: shashank <jain.sm@gmail.com>
---
 lib/bitmap-str.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/lib/bitmap-str.c b/lib/bitmap-str.c
index b58966864657..cafd6388892f 100644
--- a/lib/bitmap-str.c
+++ b/lib/bitmap-str.c
@@ -8,6 +8,7 @@
 #include <linux/hex.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/overflow.h>
 #include <linux/string.h>
 
 #include "kstrtox.h"
@@ -186,10 +187,12 @@ struct region {
 
 static void bitmap_set_region(const struct region *r, unsigned long *bitmap)
 {
-	unsigned int start;
+	unsigned int start = r->start;
 
-	for (start = r->start; start <= r->end; start += r->group_len)
+	do {
 		bitmap_set(bitmap, start, min(r->end - start + 1, r->off));
+	} while (!check_add_overflow(start, r->group_len, &start) &&
+		 start <= r->end);
 }
 
 static int bitmap_check_region(const struct region *r)
-- 
2.43.0

