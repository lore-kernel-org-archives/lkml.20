Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E6323D7F4
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790955082; cv=none; b=F4EXuzhCUKYSBukdl1/G/Y6/ET8Kft18iwzHK4ndb0I2vm4P4CEu9aYm+UUzrU1DN7a2UfWMU02+oC0F0KLcWk8oWkyR04Teij6U++/SFcJa2/vuylKKTvONyzsxYIDX9fRZrNLw6ge+BK52+4HLOITPg5iOuS9GHLD85wY3kSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790955082; c=relaxed/simple;
	bh=yPhaaMIMqdinYwqzh7eH+hI9D0vxNHp8uetSHZ2/q78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zxo113VSzscM94ZPTGaII28IUibnulJbf3dv80P+4o1tw1aZWoFMDBH4LWKuYoPNYc4OFwyvcanESobUGxN9PciWCkxM17ihVYAY7/uvOIzDxGrAny8HY6JabwZZv/ip7KjrCmgrwU1+hsUok9YnPnp5jiEbUrCN2L7yYgKcrrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFtcwsmV; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFtcwsmV"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccb65437so36533a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 02 Oct 2026 08:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790955081; x=1791559881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zMsCJsAMcAAtpAZGNPM1HZrT95gTCkHLatQuwaQZtx0=;
        b=ZFtcwsmVOyAwgCfUNc6shRSaCv/6pBeBlMtkAFXcwXqLjweeC83ONTu+QpRUd7UhKc
         SA654fohG3AGCRvQ3F3ZeGezgMk0D7kbGxaMsI0O6qX3wRTPn17PqDnQQglbRZzfvn9L
         gUjydEVUlegR7J1RSPIXP0PqWA6HUn50AxD5vPO3nUCg9ehIofIQzDhfVJd03/D/+wFP
         ZZd4+oQCUld/qobNnjGyQk9SK806wt5tvQ6g5iRG7tuWIW1DHkPnobmJIanFhO6ilUIj
         21s2w/lzTL6wGlGNXzMfdeP6TnlL+hq31gIdzQF6f70W1mT5uT1bEXthL5NgsmNZAaQl
         Z5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790955081; x=1791559881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zMsCJsAMcAAtpAZGNPM1HZrT95gTCkHLatQuwaQZtx0=;
        b=Dc5G0ZlQqvhisM/VrS/TVvgVCrIOdh2cgta+gRAGV3o7rcWDmXXQMtvkXaNBmwdRIF
         VPE/aidDaUqlMABq3ND7lEJGhYQrfz/rnYjYpQfbxuXROkm2se0R2pYuBuwOLu0ScBKq
         kH3UwuAtoJZdqijSN800Eh68/altrSxmL0ogXEfzCIJa1wZ0/fdAdyVp4Wr8zvJVzr5F
         4fQ1G2gfFISFnx4Q51tej/6pv4jIsg/2CFDdv0Q7vFxobZ7iM21/Jhd4JrPenqo4vmPh
         9l6ss3bhYqYr9WHwkkiWVtDjtBxSEa7rJBslsi7Q89ojub5T6W4wTs++Z0fH52o6jx4T
         wx9Q==
X-Forwarded-Encrypted: i=1; AKwUvBwtm9zn4my+8M5aNwJml9N49K2Uci0VODctlcahCa/jfkwUUuoNyhgD0/LhoX+JQ/1V+ayQXa+/+utPr8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIWgW3sVp0GCGLfB09OzRFBhIAutlNoUKT+qRpamsP6g2IEaqh1
	ZBL0Cs0OUcwS8EpZhjO6oNI64q3NkmtSgN84urKNhkhaxUcvdHJFoSqr
X-Gm-Gg: AYBFou084PXZCUBLAUpZe69mi14fwJ0uhkL9thctx5pZoO0fDoj4EwXWKDU+/bx33jY
	iKu6wQrX0A/xhjMfINGgPzsxQPMGvVen0XWmDuBvwEKjbTskekWSjk6W2vebbMhE7w6Hcmv3hlT
	9Jlhz325NEyil5g0kR6gbB59dEgz37QurAEWRDsggZmLIGmmPFl+nPsqqsofobrX7NBZSUA+Gfr
	CQmsGq/VBq0PCsMInw7EQXEPIMcMQz/v8R0qUvdUW/2St0p+w1DPJZ/aEOhmRp2RyWDkwiDswPn
	7srDNCCdW5T3h14NuD2aqnwPG4KyTQtbdm+9n9O28a/MKAEn3W+MakuOxO6SlHtv+EaDpoMULJk
	McPZDnpsLaH+WsCKVaBEEZh1PAQYXgtLY6xkXYyf2xz7pBfykXrelEuQQ1Rl0SE4T9sKRANAm3r
	XmYXPS7nh5E2ceBUiY8rOhzKp8oq5u/OW2IfzJa4NcaoM94JC7apHX7GdL1lSgcoBX91EfS46gd
	JCzlFMlvUg=
X-Received: by 2002:a17:90b:4a10:b0:3a0:9640:802c with SMTP id 98e67ed59e1d1-3a6f910f530mr1244170a91.3.1790955080536;
        Fri, 02 Oct 2026 08:31:20 -0700 (PDT)
Received: from osman.mioffice.cn ([43.224.245.178])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6fc716b5esm1649468a91.14.2026.10.02.08.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 08:31:20 -0700 (PDT)
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
	Zhan Xusheng <zhanxusheng@xiaomi.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v7 1/5] vdso/math64: Use OPTIMIZER_HIDE_VAR() in __iter_div_u64_rem()
Date: Fri,  2 Oct 2026 23:30:59 +0800
Message-ID: <20261002153104.1347978-2-zhanxusheng@xiaomi.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
References: <20261002153104.1347978-1-zhanxusheng@xiaomi.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

__iter_div_u64_rem() open-codes an empty asm() to keep the compiler from
turning the subtraction loop into a modulo operation.  That is what
OPTIMIZER_HIDE_VAR() is for, so use it and reflow the comment.

The macro lives in linux/compiler.h, which this header did not include.
vdso/math64.h is reached from linux/math64.h, whose includes are
linux/types.h, linux/math.h, asm/div64.h and vdso/math64.h; none of them
guarantees linux/compiler.h.  x86 happens to get it through
asm/div64.h -> linux/log2.h, m68k's asm/div64.h only pulls in
asm-generic/div64.h and linux/types.h, so the macro is undeclared there
and the build fails with -Werror=implicit-function-declaration.

Include linux/compiler.h so the header no longer depends on its includer.
This is a no-op for the vDSO, where lib/vdso/gettimeofday.c already gets
it through linux/build_bug.h, and vdso/unaligned.h sets the same
precedent by including linux/compiler_types.h.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609300626.zwNjKaO6-lkp@intel.com/
Closes: https://lore.kernel.org/oe-kbuild-all/202609301300.uAawkHuh-lkp@intel.com/
Signed-off-by: Zhan Xusheng <zhanxusheng@xiaomi.com>
---
 include/vdso/math64.h | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/vdso/math64.h b/include/vdso/math64.h
index 22ae212f8b28..3c08909e742b 100644
--- a/include/vdso/math64.h
+++ b/include/vdso/math64.h
@@ -2,15 +2,18 @@
 #ifndef __VDSO_MATH64_H
 #define __VDSO_MATH64_H
 
-static __always_inline u32
-__iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
+#include <linux/compiler.h>
+
+static __always_inline u32 __iter_div_u64_rem(u64 dividend, u32 divisor, u64 *remainder)
 {
 	u32 ret = 0;
 
 	while (dividend >= divisor) {
-		/* The following asm() prevents the compiler from
-		   optimising this loop into a modulo operation.  */
-		asm("" : "+rm"(dividend));
+		/*
+		 * Prevent the compiler from optimising this loop into a
+		 * modulo operation.
+		 */
+		OPTIMIZER_HIDE_VAR(dividend);
 
 		dividend -= divisor;
 		ret++;
-- 
2.43.0

