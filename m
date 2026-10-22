Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792670376;
	b=OrATcVoXFkkK6Q5pOH6BQ/9rEtGW0WMVgmUQKbTdzXezo1+wXiGw7hKDlUyG/dfwvBe+
	 8nrHfxKY0PpXeTGYKH1ro4AvCag1naE7TDkIKNTS/YC2hhbMpeK2U/BBLfrhJKO8Cyl/u
	 LSgpQdkBa0SG55hk0g69jxrh2LwVV8uam8ARtHHtP7QTGixDO8QcC0YB2nGi6FVx0HFg0
	 rffoc8FFjTndVLXLg5rTuywpHzOfVqucf1f67g9rpp39kjXk2ZaSftA6qVziD3uec5nke
	 uM/lZtMoLLmVfeJIDeHcIdIfr/ZIoi70y+sbRdX9GOwXYzC09A9A7vLTLhoib4Esr/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792670376;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=XINGVnXS/59fmZDTv/3fLoxUfeQVR9Y3Vo1ejBBatBE=;
	b=gxaWyk5pinrB2b6RfiZCrdW3INgb6okAFzDUwtpnY+76bY4yV6ED//0q9heI7RMnT3Lk
	 N2DunHfpTx288JF8AOc1DXkNfUNjN6RRpThiZP56iGYCf3tRskTHZHQ+UpXtN8dRcDtiP
	 Kl1iuHxba8DyWriyQM8HFkh+LWIVCdzLveRzHwPYhIBuQF2/8eQ8gcTzzdXTDX6LLbHgc
	 HaIURxNknyDpaA9qJ4hz7bk+srXcVG3uooWnqI5ZEHOdO6mLbyvfC+Sv/5JzZf2kPpeQ/
	 NZKnqhNSbnTOOH40ZK3utyjoJiU0kF/ivGMHyyzL5sAwBJMLeKo1K1BS3O16rBVuN2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H8MV5mHe;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5238606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 11:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5238606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H8MV5mHe
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc502d509c0so576871a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 04:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792670375; x=1793275175; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XINGVnXS/59fmZDTv/3fLoxUfeQVR9Y3Vo1ejBBatBE=;
        b=H8MV5mHePY61sZTF1PItFLG8m+SDaYKHDRqB1gr5Vk0h4SfvTU4pYNyiZPg0K1UtGX
         sOlN/iywGbBkOgN8XVRD/VqYX2zs3GMNNE9jX7GPoIc4s3VAqly7omE37kAtT8YZMn/z
         jRnpFa/jLmT3sHPgV/+BE0TthFw3r/rnYFCjb3NJAqfGC6Ls0HIJM6wM9pKJnMI7lS4L
         spW10lbuM/JoZQFK7Cq3leTxmQbymKQVyg+lfXJqQmWUejs1IsMgzhfQv90o4KmQRbTp
         DhL04C/PhxI3aS8HZZrrw4YXzhJ+G6t6vYVGV2KbRqoUNyQ1IICC5+534NwP/Gkfbpba
         alyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792670375; x=1793275175;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XINGVnXS/59fmZDTv/3fLoxUfeQVR9Y3Vo1ejBBatBE=;
        b=MHZinFuJRqwuFbZ2TyysT5DqtR1v4+4wGvv7v0lOJu4nbztub7fHoYIrE0ynehLB4s
         8F+q/V5dO66jHU4BS7Am+1HTTFa+Nd0QbTQD21YwLaLii+2UTVyzPtZ2BQYB1leTE+ZE
         g6C1GzTDefVgVfhzfLj+xIf0gXauZc9IZIPlhFwBo3BMPKyNFel/RQpw4/hvqsf2DCKX
         ZJgP7/OcnP4WEaxZ9VKO8HBgtUP/VUrC6P9C+G1xZvjCJEHow3dKc5OPqar490DhJq0H
         8whpy8NEjxxnPiAmIe7Yir+YIpQs7Vy0xxiilJUQY5YXBsE4YX/41/jt3gNO98I0/Wzt
         SJgw==
X-Forwarded-Encrypted: i=1; AKwUvBycywLiOa2uIYL87QfHdCEKdwB85oWbI+j9guV6dKav5pb55dHSD5sbQ4Ky2XxV4aMJ+oo2RRcXgg3fMuc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtqNSPG9tovRmwNCBZ407i5bRaojw6V/q6tGZGBq9ZYp2dHiiT
	QneuWhO5WcLi7H6j8jlq0LF9itmOQZdJi8MZzpLGvUx7980VyDHuB++o
X-Gm-Gg: AYBFou39peHWnrqtRd6lugKypGlGM0DMOEq7Mpts7DWrnA6UO86p5oTeXMKODckVrlC
	JsV+J0WCbVdVuF6cdQEAfWjbgTP8V36Qloz1tAfxB65v1NHvc5dYPEY2eG0vMANLKqfb8Bwhicn
	j9HRW5/SFFnA38dW+N8T8Z6h0Ag3IH8JHMpumBh7bhl2aNplr3PyJpmqQuwl8r5N3tuFV7P3XcR
	bJHngxg+MLU5yABQAvYUh6YxP2JDCLdXkG9ICEQx8PWmFeXMZPUSlYSwetnJHSIeNdG2ohdZWbD
	0l3eJaHl25pXITtwy+nfctQwL83gEhVafrDxJWAPj0bbyRQUCscPWxBc0VY0xOiXxoWHhzb50EE
	l0XFPrwIZfeFkC4LzQvpCagZLSoazV7k/eiNmVa/lQH9PxVFdR8fhXRUZS5eXbJDJqPQ6IDO+q9
	4EmP64uW9DTCeIWaVyExtz0g25bfo1jSmJjBL0NqeHrpjKPPObXfvNC1YmFCGpvAXvIytEI7JCi
	Ur/qiTVGgskpq5VKJpPzv+GGZYZR0S5niEX8isX+xEVqW1sgX9KVfjRckCg
X-Received: by 2002:a05:6a21:48b:b0:3dd:a195:fa25 with SMTP id adf61e73a8af0-3e287eea3a3mr3590304637.74.1792670374907;
        Thu, 22 Oct 2026 04:59:34 -0700 (PDT)
Received: from arm-a100.. ([140.112.28.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0894b49d1sm2035007b3a.12.2026.10.22.04.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:59:34 -0700 (PDT)
From: Tzu-Ching Yang <shingekinocore@gmail.com>
To: Guo Ren <guoren@kernel.org>
Cc: linux-csky@vger.kernel.org,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] csky: bitops: Use the compiler builtin for __fls()
Date: Thu, 22 Oct 2026 19:59:22 +0800
Message-Id: <20261022115922.1210342-1-shingekinocore@gmail.com>
X-Mailer: git-send-email 2.34.1
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

The csky __fls() is a C wrapper, fls(x) - 1, around the ff1 asm
volatile in fls(), so the compiler can neither fold it for a constant
argument nor merge repeated calls. GCC implements __builtin_clzl()
with the same ff1 instruction for CK807, CK810 and CK860; CK610
(abiv1) cannot be built with upstream GCC.

Use the asm-generic builtin __fls() instead. ffs(), __ffs() and fls()
keep their asm: GCC has no ctz pattern for csky, so builtin ffs() and
__ffs() would become calls to __ffssi2() and __ctzsi2(), and a builtin
fls() needs a test for zero that ff1 makes unnecessary by returning 32
for 0.

__fls() now returns unsigned int instead of unsigned long, like the
asm-generic version; both are 32 bits wide on csky. __fls(0) remains
undefined.

With GCC 9 to 16, the text of every defconfig-based vmlinux tested
shrinks by 128 to 320 bytes.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/all/affe7da1-41aa-4710-bee0-5e3c2b8a8dfc@app.fastmail.com/
Signed-off-by: Tzu-Ching Yang <shingekinocore@gmail.com>
---
In a test function, __fls(x) takes 4 instructions (return included)
before and after with each GCC and CPU tested, at -O2 and -Os; with a
constant argument, it now folds.

CK610 needs an abiv1 GCC; the only one I could find is the vendor's 6.3,
older than the 8.1 minimum and without a clz pattern for abiv1. There,
__fls() would become a call to __clzsi2(), which lib/clz_ctz.c
implements with the fls() asm, so it would still work; a builtin fls()
would make __clzsi2() call itself.

Testing: 35 defconfig-based kernels for CK807, CK810 and CK860, some
with KUnit or SMP, built before and after with W=1 by kernel.org GCC 9.5
to 16.2 (GCC 8 has no csky port, and GCC 9 to 11 reject -mcpu=ck860): no
new warnings and no calls to __ctzsi2(), __clzsi2() or __ffssi2().
allmodconfig with GCC 12 and 16 compiles the same objects with the same
warnings, but does not reach a vmlinux because of GCC internal compiler
errors, before and after. Under XuanTie's qemu-cskyv2 user mode, the old
and new helpers return the same values for every defined 32-bit input,
built with the kernel's flags by each GCC for each CPU at -O2 and -Os.
On qemu-system-cskyv2 -M virt, the ffs and bitops KUnit tests pass
before and after; test_bitmap passes with GCC 12 to 16 and has the same
one failure with GCC 9 to 11 in both, from a test bug fixed in
linux-next. No csky hardware was available.

Against the linux-next branch of c-sky/csky-linux.git (abb81e5ce7d9);
also applies to next-20261021 and to bitmap-for-next. Full build and
test data on request.

 arch/csky/include/asm/bitops.h | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/csky/include/asm/bitops.h b/arch/csky/include/asm/bitops.h
index 80d67eee6e86..118fb0df5267 100644
--- a/arch/csky/include/asm/bitops.h
+++ b/arch/csky/include/asm/bitops.h
@@ -49,14 +49,7 @@ static __always_inline __attribute_const__ int fls(unsigned int x)
 	return (32 - x);
 }
 
-/*
- * asm-generic/bitops/__fls.h
- */
-static __always_inline __attribute_const__ unsigned long __fls(unsigned long x)
-{
-	return fls(x) - 1;
-}
-
+#include <asm-generic/bitops/builtin-__fls.h>
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/fls64.h>
 

base-commit: abb81e5ce7d995baa41556b8125fa59e28ba3be8
-- 
2.34.1

