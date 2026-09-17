Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6041C3F8250
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789624619; cv=none; b=uD8zaYE7Wj8FFbsgpNOO9EPnynkxBzVq8gYux/RGRV1o/umAwV70Beiz7JkPb63p9erenb2AXk+f9VzNY3VnHWSSr7wKfM++iwa+kY/R0o8pNoA70zAYQ2e856jMxIuPNSpdUAgrKe5Aps+lNeghu/A5BXrVMxD9ag0CpRzIls4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789624619; c=relaxed/simple;
	bh=axjKGAd5Z/3bPAjXWt5In13wd/F8lTzuocyx1Fp1oag=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Nr8uur3BDwr5cJQsDytdB0CNBZfLJwSqWwNmOO560z8pm9ILw4X4GJolBT/luBEQULdMpJts9vkgGNx6gXC9vzavI4VyvkUidxuRfcbX7Wqyf687S5UrBHtoSIIfwvsFIrBzInIYsZusmJ+SK32T+3lAzUtWWrr+vNHkfrk7GN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Is5sYCTW; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Is5sYCTW"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b912d391aso3170535e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789624616; x=1790229416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TXa2jqQKkTliyGqricPHkYJ8GTisx6eCrgeiQ3lmh5M=;
        b=Is5sYCTWeKu+bYQiM7B63cAOJ4NXKZMHIlOUp3yaK8FDUJ1KZcoqjSR1X/xWKwnM1f
         jVroKGDczKboO785tS2sjWOQFbNE27Vamk1fuf3HV83H7xU1UTPEJnWuiEwcSi2gI+hO
         IBfCWz7SPEcShWvkoND1vmR4cBDHVVNQhDz1JDn6eBTMKsPOhe0bFyYCKgMjMspmipwB
         Fa+fMNzl6fijGcFfsRQ/XBNuLIYcggAY7cSPhNoXTRrMoKywa6hAUstG8EDxh2QhjM8r
         Jv2F8MldT4XWRNOTczerGxCD4Pl8fKHSk+kB5zf0IqPMm41uHVc/NfkH/0RR2n98lSQv
         kRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789624616; x=1790229416;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TXa2jqQKkTliyGqricPHkYJ8GTisx6eCrgeiQ3lmh5M=;
        b=1VpwSxvVqk7lOBUXcyedPSw+rkBOChj85VAQd11xyqTnQvE93yw8OHckWA06I9Oub8
         n7meIIUnNzvFWHwB4uuBJPznBH8G+WQJjXpdOHLLFfLo/7FWHs0PZZZekXJgJANmPT3B
         IFmg524GtecMnxMyvg6GFwpNhI7NFn7/p+5amLy3miUpkv1I2VArPmyi+TAb6y9NUNN7
         QwszGgOJlTAXq/bFYT1CAjyIslOD1JN1TrEd5aWdH3IPpuws6Go6BWcZs+WR00FSka3p
         JuxkXJQ+0e6fNJKk83MbzQV/cVvi+1AaMoJ9qgF3H1no7VfQXVm15Hnd4m5Qktdha8Xe
         2I7A==
X-Forwarded-Encrypted: i=1; AKwUvBwNHMvnvSLuypZPJBraESqjO8foxVNpL7MFmkAfGY6KYCNni93FqqthdzfhRHG0abJyemCGL94y8rb9vSY=@vger.kernel.org
X-Gm-Message-State: AFuF++kaNd4+OwY4JCkD3nEM3NAuL5dSjq7VuM6CHWTaWE4Hs1XXEjCX
	fq7d+TVtuTKAyGqQfc79FVZR49uIGbAHcYFiXGuia4odSqA+RWgNqC4g
X-Gm-Gg: AYBFou01L7SPP5BwTQ1S2VupQatHnZsa+Cl2xmXTy5n7ZFTzbLJCMK0k6WFgvCYzoKM
	3Hd+l9MvY2VzwIS2+FjgXqknE2IxwQsvzu37dOoMtK7IOMA/qpULoeb/1swtZarJhYsoBtmOJar
	gxqCBmga1eGhEUiJs4asCrXtX42Pb/CrRyqI+rJywepRUKJ2zazlUa5dTHb5lHW2925tx77rIrB
	ramfpNCzpacpju/CW7Kd4GaeWl2QVEyN94AJy45qhnaUk4xjmgGoq85mJzh5hJ/c3qb8VG5EL6p
	w4rG+BIoZDt6TD8h2eBdd7WPnDJkJGg3GpCSTS0l71jwpvFlNSB5HfLqkAu9CQjkWOIcL+zXDP5
	ZBh8wMdW8lwD6BN6+JUDKQKmeOAtOTWI8I3FxAdbAnDtIdy8bvfJ+LxJDM31bgWjfxOa0PTaBei
	WDUOA6wFf9DDXnkBPj2nwLz2atH/DYvOkArXoPesX7HjMIrVT0f/GGQrQbnlHKJXNeBWAkYpdmr
	TMg4/uB3G1DdkSSq1Iwrt5sHEzIt0GseaGAm2OWyxMsMi1IMNj5OlLnBgOS+jAU84j16Aq0QQ45
	6ijq+GhNqPIr1O1Wy3aB05621RAcGfmzhXScZjd8a7NktDXp3ExbiarfFupd/g2b4lIlkHZ6q9Z
	G6YT4AVjo44z7NO2jGUorPZeYww==
X-Received: by 2002:a05:600c:c8f:b0:49c:fc6c:be15 with SMTP id 5b1f17b1804b1-49eb733c62dmr64900215e9.27.1789624616385;
        Wed, 16 Sep 2026 22:56:56 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-9dc6-c001-54ee-4741-4927-0a28.310.pool.telefonica.de. [2a02:3100:9dc6:c001:54ee:4741:4927:a28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e847eab65sm76230685e9.2.2026.09.16.22.56.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Sep 2026 22:56:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Haren Myneni <haren@us.ibm.com>,
	Dan Streetman <ddstreet@ieee.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-crypto@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] lib/842: depend on the decompressor for KUnit tests
Date: Thu, 17 Sep 2026 07:56:45 +0200
Message-Id: <20260917055645.26780-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

842_DECOMPRESS_KUNIT_TEST selects the decompressor even when no other
option needs it, including through KUNIT_ALL_TESTS.

Depend on 842_DECOMPRESS as required by
Documentation/dev-tools/kunit/style.rst. This also prevents the test from
promoting a modular decompressor to built-in.

Fixes: cca072cb1423 ("lib/842: add KUnit tests for the decompressor")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/r/CAMuHMdVcZ5cV4-HrjLYfFKh6UshiVxq5eXCNyp0Z1k_SMAvF5g@mail.gmail.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Follow-up to the accepted commit, based on cryptodev-2.6/master.

Testing: Checked Kconfig dependency resolution for eight x86_64
configurations before and after the change, including KUNIT_ALL_TESTS
and modular/built-in combinations.

 lib/Kconfig.debug | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 48201092b3df..49f74005394b 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2228,7 +2228,7 @@ if RUNTIME_TESTING_MENU
 config 842_DECOMPRESS_KUNIT_TEST
 	tristate "KUnit tests for the 842 decompressor" if !KUNIT_ALL_TESTS
 	depends on KUNIT
-	select 842_DECOMPRESS
+	depends on 842_DECOMPRESS
 	default KUNIT_ALL_TESTS
 	help
 	  Enable stream-validation and boundary tests for the software 842

base-commit: 9e06d371730b841ad8fe79ebfccf0def9470201f
-- 
2.39.5 (Apple Git-154)
