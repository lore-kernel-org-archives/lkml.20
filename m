Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F51050AC29
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 20:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788467867; cv=none; b=FXtVwhKCoENj879za24422jNLhvd0sEbrHMtwcAhWcY2NNAjboLmTQEnHXl2+i8oiwDyzKawAV5wtWhSniSAXOVq/U/oqzvSjhr2HwH1oVGo+uLtARuHU657SnzyUxDjFZOyCvNtA8ruIT/45KBcvh99D3TJmbpedOtnexOoJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788467867; c=relaxed/simple;
	bh=mDzPWkMoO7yK7FwJIXdb8RjyDxLK4UW08E3phGRlvnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HhIo0JMRAOqDalFkvWmpKpOFOJq6wVkbDJrS0BgyzrKlvG+em0Z4AIvmTYaE5YO0dVeA+oeCICv4qX3a/olwXJOFpG6Bn+VP6XNMCcvEQax9N5XPDRxpDiZ/HJzRvAKfwofMw6CTz8nQjIS3kIBeAARLxptf32onTJjOPdnEZAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=phZhNiB2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="phZhNiB2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48441fa5c37so187269f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 13:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788467850; x=1789072650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0p7OiT9IYtJ0QF28DnbFmBCLEmI8cNswVbeL0gIZVk=;
        b=phZhNiB2JPwOVzfbjODU/rVBuCzEUk1yfw11MHjwlCgydOdqH4cYudgljkt9/Or4Jp
         Bh1dCCWwe2fV3EDwbj1VEW/UMU6KW+g5D8Y6/Xfn79UDSn2WuVHtn5PM1LneBBkfXKZW
         6AOZAXCwECymuAf6m03WlDwRD8jjP3AfNcC2G4jIbs9C2cGoOjUhVHrtNIzw3CFPhe4W
         ZARFTQPAehdcg/6uzqwVJ90PSlZM1ZVKAHKdhLIq9jf4I4zzDkUScuPzhNo5ZN3RinAI
         grAFU6CEAVwvARcBri3M9OHoCTiNFNRtuLNekGhKVkdr39zMrVbOTrFFpgczcxVr9bLB
         3v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788467850; x=1789072650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0p7OiT9IYtJ0QF28DnbFmBCLEmI8cNswVbeL0gIZVk=;
        b=P9UdbDIV2vCSuQRHYICGIIIkPtNa1y/pvVBBY46bRqQG+CXNuvbUIgMKDAJaLxCoqP
         ZYq6F2HFW+SFC5YQzI/kVtOtPE227O0LW+UXNAcALZ4Do2LHvLjuPIofkxRfcVHjY0lK
         SxrUO9N3ByKzaWn+Qe4M+WewoiTDyJ/yEwCUGhLl3+2pF8vPeaGf2P2fSFUZzH+cZOYh
         54HaHAYBMAaP0+LdOVsi53MkGP/JpUG2F1fxud8tK0Hvb4r5pVfxgbJjJhuzYyYaK2ZS
         BkWjy3P41SVQ505FVmGU3TM3jt077Bww+8JNlYL+RByUUhsaMpxT9HSybAM9JHtTpRjm
         Y8QA==
X-Forwarded-Encrypted: i=1; AKwUvBzKU6hu+hai3HOf0BgDl2idIJ7dL//HdhuE9N/gjzd9JZapsEeCxYRuJrXjeMYhiBYzKA5UgNEw7FaHsAg=@vger.kernel.org
X-Gm-Message-State: AFuF++kzTSwfxTtvGY6FbnRYfbzSdOSB50kdtzDqzF2SofGpUXlCrLpT
	Z+kxApj642t6NkI5PxFP8p4xuWp3x0+Slh6iopNwSZVTZngaEO55IF1n
X-Gm-Gg: AYBFou1yRijeF0rXhDD9Nk9MVvD82fJHqdWnRmWoV6sgg9Ya+PNsaBdJb9AYnFmRzIr
	BNZVdPOO0+K/gT/Vj2bERrbeM9kcTpnyIWCJ1adVp8d3UBS7Uy3QaIdQKGG162f7sEYyR8ytSzf
	skqfwdmt2fX4jqF/fl5Mwtfet/62Y7/H6FnTilJKxA9m6FdCWdhwjFjXA4adt2yaELPQszzh5hG
	J2aZx8ymzbahFk13xtGCEY344a0jiNzw+0QS0beV0Ell44Ibu/AF/8ljhg8EklWvQksMHDnrquS
	y7OmbmWKME+zxSIKSKfHll23qQIkZUwW6g4NukjnBaGHp1OYfzGIBvewuq5h/g1UMG4oBMjazsa
	CNVkw64febwlyjZRgXysln63wu5oJSz6s4xxNmZL8mL8XHtgvzPrR5osyuUV2trnXADwYtqNRNG
	oyWfc/eH81IGQMBHFMXjhruEUSEm7MYm808iXmzW/czROr8NASANf9eo3yMydoirE6LUl1k2t64
	vazJ/Xwpkl1S9JIsMIEfcPVEi6I2rll3qs/G7T5lhw4HtuPkEo1j3l9mjWYs//VwOAHt13BOQf4
	0jf+rbAuPOqyt00efhpMMY5gR1ANu3PL2k//3oGIsQR2xzgqY24s+UkHVlTECG/mIynlM6SooRV
	J/b1f
X-Received: by 2002:a05:6000:46cc:b0:484:3f15:15f2 with SMTP id ffacd0b85a97d-485872bbf40mr1870059f8f.24.1788467849852;
        Thu, 03 Sep 2026 13:37:29 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-a979-9501-3df6-d7fa-8a5a-06c5.310.pool.telefonica.de. [2a02:3100:a979:9501:3df6:d7fa:8a5a:6c5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48588394fa1sm1005070f8f.8.2026.09.03.13.37.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 03 Sep 2026 13:37:29 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v3 1/5] slab: align ZERO_SIZE_PTR to ARCH_KMALLOC_MINALIGN
Date: Thu,  3 Sep 2026 22:37:16 +0200
Message-Id: <20260903203720.63689-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260903203720.63689-1-kmehltretter@gmail.com>
References: <20260903203720.63689-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kmalloc entry points are annotated with __assume_kmalloc_alignment
but return ZERO_SIZE_PTR, currently (void *)16, for zero-size requests.
This violates the annotation when ARCH_KMALLOC_MINALIGN exceeds 16.

This can mislead compiler optimizations. Clang's UBSAN_ALIGNMENT detects
the violation on armv5. GCC and Clang retain the ZERO_OR_NULL_PTR() range
check but eliminate an exact ZERO_SIZE_PTR comparison after an annotated
allocation.

Define ZERO_SIZE_PTR as the greater of 16 and ARCH_KMALLOC_MINALIGN,
retaining the existing value where it is already aligned. Assert that
ARCH_KMALLOC_MINALIGN remains below 0x100, the value of LIST_POISON1
when POISON_POINTER_DELTA is zero, so the sentinel remains distinct
from that poison pointer.

Fixes: 94a58c360a45 ("slab.h: sprinkle __assume_aligned attributes")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/linux/slab.h | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/include/linux/slab.h b/include/linux/slab.h
index cda126def67a..563dadc16d82 100644
--- a/include/linux/slab.h
+++ b/include/linux/slab.h
@@ -262,13 +262,16 @@ enum _slab_flag_bits {
 
 /*
  * ZERO_SIZE_PTR will be returned for zero sized kmalloc requests.
+ * It satisfies the alignment promised by __assume_kmalloc_alignment
+ * and keeps the historic value 16 where that is already aligned.
  *
  * Dereferencing ZERO_SIZE_PTR will lead to a distinct access fault.
  *
  * ZERO_SIZE_PTR can be passed to kfree though in the same way that NULL can.
  * Both make kfree a no-op.
  */
-#define ZERO_SIZE_PTR ((void *)16)
+#define ZERO_SIZE_PTR ((void *)(ARCH_KMALLOC_MINALIGN > 16 ? \
+				ARCH_KMALLOC_MINALIGN : 16))
 
 #define ZERO_OR_NULL_PTR(x) ((unsigned long)(x) <= \
 				(unsigned long)ZERO_SIZE_PTR)
@@ -625,6 +628,13 @@ static inline bool kmem_dump_obj(void *object) { return false; }
 #define KMALLOC_SHIFT_LOW ilog2(KMALLOC_MIN_SIZE)
 #endif
 
+/*
+ * Keep ZERO_SIZE_PTR at most 128, i.e. below 0x100: LIST_POISON1 is
+ * 0x100 when POISON_POINTER_DELTA is 0, and no architecture currently
+ * has an ARCH_KMALLOC_MINALIGN above 128.
+ */
+static_assert(ARCH_KMALLOC_MINALIGN < 0x100);
+
 /*
  * Setting ARCH_SLAB_MINALIGN in arch headers allows a different alignment.
  * Intended for arches that get misalignment faults even for 64 bit integer
-- 
2.53.0

