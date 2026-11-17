Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.201
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794935799;
	b=vD+RHdOIb3+n7RXjv8Emy9wdVbKc978zeElXdqvxC6BKx5uto0GxiNrWTOhJMFK/7UAV
	 1QcMMrMep9JaOSpvBkFBmjOjwlhK7g52Nt1keeQK3rHJzG03actQ7d1+fF31rMTHm2Syy
	 oHgxgLU00Fyw1ECw8YwPVr8xUF2F6h1hwjcfVj0mSPqbmLWAhIxsOjLDL0QLwW/VyFzdJ
	 cCEty8wI14wtynhp0CFxl4JQffa553dGZ711WwwNrmvZK2q2oVuPg71zeB4cxFq52nHgz
	 BoiGw0LFlREquiy4KMErG8xoLRGM5noUcqSblNtxe3Sj/BabolAobbCEV48VYbxmsng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794935799;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
	b=kbuRKRoR1UKBCevkA1hXsAx1zR+Yy1zkBMdDNmlTnai4NLNsvXePiAtIMxiYvqASczLH
	 JufJKQzFHT0W17/GW65HtEHDmodFDKEh4Faka2sfqHhN/bD9EmIwDlw4ZNKR8RVhmwLos
	 cqUNnqhQK9yts5lUSVYYFgnqHVMcSFTSXPSgN4S8vcLlbnw/eLxTNIPuWsj+EdssEARvP
	 tc59ncL+F/Ao1KmEfiqbMQ99P3ASjqtypgVDRc352VxTDsT6ZsDVLWyj5zmmW0cBHBPAz
	 3KJE4hL8iW7Qo26NtpS/uikiqxYh2/T/dISw47VlFjD5rtEBFFR7fV+HCYcB/oZ0p+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKYnmSCx;
	arc=none smtp.remote-ip=74.125.227.201
Received: from mail-pi2-f9.google.com (mail-pi2-f9.google.com [74.125.227.201])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2A606A330
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 17:16:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AD2A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sKYnmSCx
Received: by mail-pi2-f9.google.com with SMTP id 41be03b00d2f7-cdd9d0d40a4so29056a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794935798; x=1795540598; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=sKYnmSCxuvyXlPnhX+NgDfDEHb6kMZX+1jxvCLEL66zeTME5s+nDqB0/DpZPakleKF
         4q3V10iHl+uX8ujRm9JJzgV62Hy8Fb9ux5rxydcrrxuCwHnpS7wJSuX07g0m40Envljn
         10T6xSsG7vp5EgUkpzVGnHjiTP2k/CXhh8Dbd9Jtiw0O+2Y01Nckjj+msHuIEwFEyDjY
         Sb8OnRxh6Qq2AREL52KDknUFMmXGxvwdqwOhmDoLK6zIKU3XPMLW1NIUWNK4V6acg68E
         99IijfZPFHdvO22PL8Jj783Gg99xevvkBUKlISVEmyokXsbg0DN1ERpVPvCerDl+IytP
         w+Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794935798; x=1795540598;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ROucTsPnyYTVcMujmRdSC63nWVbZidpBxQo25fxVF2Q=;
        b=uRpKrAi86wWsc6oDbrdd6l4mi6lrOF8lLboQvlxAXJOLwJSw3RCvJbj5P7ZRmDyb5N
         ofoSqBJAEXFHQrhQx0qQid+kJxn8yUH3w9craAgKJ6F5/Bgu/jG3E0N1QLBVABDmg0Ch
         c8wwMqlG5SyGSJzjGjy9mZzCT17XRT6ZVWr10A8OGUGDjnSFtv0cCcoIH8B3zbzN/KAw
         fuXldg4nOqzv12znQA48YTECmjECElGHttWtuUVv4JYtEbqscTuk0eLr3T7PPi43zNUT
         OwCk4nwoCF+JQ5A/UdrMFNGrbPB1xKhn6bbG0wQ+xeR4lIORz2SRjOoYD99kP7cPlI95
         5TNQ==
X-Forwarded-Encrypted: i=1; AL+hErGFU6r7a+JmHzH9fgvipTKpOjcEeRqXIEjsNHR9xlW3YodEIvYCdoqHEgyRt4u2EPTy4TGCBDroTrkj+Eg=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aAUCLgMKuOWcvxmiVA/ZjMdUB2jruoZpCdxydrTc7Esc1wuZ+
	PfuQs83fuslXaC/ujudO6aRx0U6lYqHCTUPpaHq8nHBRZdTP8IOvUuAv
X-Gm-Gg: AYBFou1bJvzpKwedRphhbh23l6RGZpgUSmwbaPasV5XgphBugF1Hd2mbSKKoYnr+tX1
	3kWS7O/1j7GC88GSp8o0sr3UgNGwe8Sexg29OH+a4aPzfQ6BIeFGK3HPSo4RfxVrSXTRiIclbAr
	mvURuTvYyeBdGtSvKd+SnaPbsQZY2x5CghhpE3Fq7SC11SpllLoPu0+BYDSYiNxglHhOV1HCabZ
	Te7CoQlBcfQAMVarbW5M5H+/rXinv1JTEGYE1XZzxwCIgnTWd+Ztl/7yv+u4G+jrkrElYAT3aNX
	Lm/MEgA4fLLuhSfRmhIssklgLMUe2nFevPwevhxP/cbYaIzPnVZxW7v+jqVmXc8f6Yv75N08f7X
	r/ckn+vmRLkKSY4NeM0rXgSGZ6Z5bKJpzSAxCVQm8hnf3foQCX/FCBcI2zC8L5dHkRKliS+6j1L
	eV1gan6WrbmtKZmKYpT/w/xjgQmFVymw8/sZx/PBjS7nwzDYaHnC55S+mdb0RBYq39cdwwWjxEW
	zFMexKvFbdwHO7twCv3Df5MvxIMdzI6q4B3vZ19xLla1Ed9xfxPRXNrvqylKxdRUZwAQ0lTj4fJ
	HUTsole23PvADtRQMurAT8yeMRXmIXV1NGc35BtVEHUA910dA9QBNZWn4dS+UGZPQxZcxbJgDqX
	pWO/l0khBhK51t/JmJWHlkYd/n7dL+M3cDZLu9NZFsqNuzq9ehiA2YPMrrMPVW+DpAeyKe/zy09
	9OMjw8frA=
X-Received: by 2002:a05:6a00:3008:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-8beb374dd2cmr12162924b3a.4.1794935797654;
        Tue, 17 Nov 2026 09:16:37 -0800 (PST)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5b38f2c39sm99770b3a.34.2026.11.17.09.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 09:16:36 -0800 (PST)
From: Aveline Noir <jm5905938@gmail.com>
Date: Wed, 18 Nov 2026 04:04:33 +1100
Subject: [PATCH] mm/damon/paddr: avoid truncation warning in high-address
 KUnit test
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-fix-damon-paddr-sparse-20261118-v1-1-3a0e943406d5@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NOw7CMAyGr1J5xiLJ0AaughicxNAgkVZ2QUhV7
 04CAxvj9z9XUJbMCsduBeFn1jyVCnbXQRypXBlzqgzOuN5a6/GSX5joPhWcKSVBnUmU8ecH4w/
 GDb1PA9SVWbhWPg+n85f1EW4clzbbEoFqPwiVODap4f7PA2zbG7eW2xe2AAAA
X-Change-ID: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7
To: SJ Park <sj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: damon@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
 Justin Stitt <justinstitt@google.com>, lienze@kylinos.cn, 
 linux-kernel@vger.kernel.org, 
 Linux Memory Management List <linux-mm@kvack.org>, 
 kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
 mm-commits@vger.kernel.org, Bill Wendling <morbo@google.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, oe-kbuild-all@lists.linux.dev, 
 rdunlap@infradead.org, sashiko-bot@kernel.org, 
 sashiko-reviews@lists.linux.dev
X-Mailer: b4 0.16.0

Hi SJ, Andrew,

The kernel test robot caught this issue in my earlier addr_unit KUnit
patch. Feel free to fold this fix into that patch.

Thanks,
Aveline Noir

-- >8 --
When phys_addr_t is 32-bit, Sparse warns about truncating the u64 address
passed to damon_pa_core_addr() in damon_test_pa_addr_over_4g().  The
runtime kunit_skip() does not prevent Sparse from checking that
conversion.

Compile the high-address assertions only with CONFIG_PHYS_ADDR_T_64BIT,
and keep the test skipped otherwise.

Fixes: 7a983cc1b573 ("mm/damon/paddr: add KUnit tests for addr_unit conversion")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/20261117170155.fEdeuuhm-lkp@intel.com/
Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
The reported warning is gone with the original i386 config, Clang 22.1.8
and Sparse v0.6.5-rc1-21-g84ec0658. All executed DAMON KUnit tests passed
on x86_64 and i386 with and without PAE; the high-address case skips
without PAE.
---
 mm/damon/tests/paddr-kunit.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/damon/tests/paddr-kunit.h b/mm/damon/tests/paddr-kunit.h
index 9839cc233071..2b11f0e67a12 100644
--- a/mm/damon/tests/paddr-kunit.h
+++ b/mm/damon/tests/paddr-kunit.h
@@ -26,15 +26,16 @@ static void damon_test_pa_core_addr(struct kunit *test)
 
 static void damon_test_pa_addr_over_4g(struct kunit *test)
 {
+#ifdef CONFIG_PHYS_ADDR_T_64BIT
 	unsigned long addr = 0xffffffffUL;
 	unsigned long addr_unit = 0x1000;
 	u64 pa = 0xffffffff000ULL;
 
-	if (!IS_ENABLED(CONFIG_PHYS_ADDR_T_64BIT))
-		kunit_skip(test, "phys_addr_t is 32-bit");
-
 	KUNIT_EXPECT_EQ(test, damon_pa_phys_addr(addr, addr_unit), pa);
 	KUNIT_EXPECT_EQ(test, damon_pa_core_addr(pa, addr_unit), addr);
+#else
+	kunit_skip(test, "phys_addr_t is 32-bit");
+#endif
 }
 
 static struct kunit_case damon_paddr_test_cases[] = {

---
base-commit: 7a983cc1b57309a875a9e07a934c9944bf3d088d
change-id: 20261118-fix-damon-paddr-sparse-20261118-fb08902768d7

