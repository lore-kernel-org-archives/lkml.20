Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2871836B05C
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 17:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789149349; cv=none; b=m7l+xqbHADTLZFlQYMLl4aRSoHRCKyw/uKXFiPLoBySpM4rYG06nOSyMm6BtHzFKETQJ6sna2JfJBYAavPSikVsH+G050IBDKLY1qH3jKhcMutNj8IZEmGPv8OGalnPWQBU0qvARiXX9KZYIgLbm8Yvvf6S1CReq3EPgTfN4P/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789149349; c=relaxed/simple;
	bh=iIbBS2ec/z+iQjgkAeqMnfpSXO+TZAwvggSJRNq0mSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LLbLUoIf3rsKNzkxnbvqmaPFieowYlnXtWDpIRFQOqC+CFrS34ujd59My1nqOmgkqrrAvUJTYWAhXpghTiaznnVq2GcO1h1S8m/nzBzNT5gRBOrW4revKP4GPHBwP74OSrQ2UsqVVhNOXublewPzGxVMvxgRNOxv3fnklV2cVds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbyGC6H5; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbyGC6H5"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53091987029so15528441cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 10:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789149347; x=1789754147; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqvLGIHG2oj22qS6S7v7hgOcUPXCRCaDbQKNUy7EC3A=;
        b=cbyGC6H5mbRDfdQRwo0bL7SGP0xm3suKKCeS9Cs/6PQWWYuccavk+z0K9iap2ghTpC
         PeTEP4pcLn/Se3OvBR5Q10TRXVUfDSL6Y1TD4iflt9HwETfUYyJ3Tc2JYCvsSZSm4geM
         28ylbNYr0IJEJYwX2GTma4JbZj35eNJnyG5RLtlEJYa1g+QvEJcICJRiI6HPLmdy4FtQ
         KSRlhHQJnC/Z/Xq4jBQw28EemSldEDFX+XRqjae/2A/W0PDSH8PcZMXqFETjjv17f7LJ
         rAS5uAi6uqMytstyhHKiK8VirIQIs5xVd5M5Ea1WF7PZ5DudbX9CNFH7hrHGOEA2MXCT
         FnrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789149347; x=1789754147;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqvLGIHG2oj22qS6S7v7hgOcUPXCRCaDbQKNUy7EC3A=;
        b=DK8fG5h2I7ZmzoFPb3QLtyLRyEPVMZQz9qhJ8rxAb7wzrbkQZVAe8RpE0gXAPlRkBr
         EuqLYgXfMQExk1KERkKbFaPifP9DiOOWiCo6/uxEtvp3HV54VPrdkvWdxoBknNq724YF
         weuXwB/HiPp8SufdmCh51cPkN7ecbkA2WjpU3c5RJf2KBj9krkEnGjoBCp1fQ5MbzyLA
         suT+ZAxa1uzyOXZZdruoLinx0AWx6B27CukqNF01pvrdvrd16Q2q1eFUfY76XG/o3k8R
         Jbwl/VvEm5DzBuagFfBxpQhG+oNhqlmhoR9GuJVI8joIvScLTDxnD93oDjIqs8NUMoQc
         liyA==
X-Forwarded-Encrypted: i=1; AKwUvBwio5YKvgxLXGuhFvauD21wp2ABqIXyrSX73gL0JVPmvbfbukvkcaYNGVocBWU7aoEl5t3T3/54S/wMT84=@vger.kernel.org
X-Gm-Message-State: AFuF++lqm2WOX5k2sHq1VeULAbn1LHOP1df7EFonL/7nQ5L5+qXUZzZM
	q4uIe+wtyoLu7aA+x38nup/+c0ALEeHknqYYHmRSOnrqX2e18q+fRq4=
X-Gm-Gg: AYBFou3nV8Tarpe0QnCQtW6fPUI0iAc2eC4Ob5bROMXN94G14SBB0ompK/m8YJzpdu9
	yYgKBH1fVMNs4uHUrKxXPkgkcmcKCHfrNEAb/m0wNSEwSR7Wv7Gm6nRbKhbNZCWrpEfB9O452G7
	E48wTJgB4F4XMykDeuc5S/XvizO8zbFVefS7YNAYkHLZHXkGnWfUaZty+VVYLDD57ADwl2Ru1jz
	HR9PEadksULW+PJ8aZJv7r/4MxcBGH8yBgsfShWH4Im6/D4kN1EmJYLiGbBLNOyI2B2wJ04ZJJM
	Hth1nPcFWwPzucMQfHeidicizXue5zh6zbU/T2/6PpHNdT+5Xg+SyBB1MKMuBxbGtpd42AobQzT
	3oCxAlvBrwYbjLB0QVUlto3nVLYLg9ZrsImYX5Zqaaf29UFw7otJer8mh4HNIyZtu/MYilBXr0Z
	x5ncBUjGLVltY5GUGKKits0SdM48FNgVpUhm87M/eOIw5JYTbz0gikDjVfZCuQpWFSzhXtZT4xM
	3iyjpOHU9oHbH8t+QHqJOyKnzI+A+9PHS7V7Xi51/16zMGXkJ8LhYoC98IQwFE7DPKjXVSLxYGQ
	35efrEzu6owKxH+vKEIfBQhg+MKoYAgkOA==
X-Received: by 2002:ac8:5f07:0:b0:530:5411:ef3 with SMTP id d75a77b69052e-530c871fcf2mr76191191cf.41.1789149346741;
        Fri, 11 Sep 2026 10:55:46 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f45f1fdsm26209046d6.16.2026.09.11.10.55.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 10:55:46 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Lubomir Rintel <lkundrak@v3.sk>,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] media: marvell: manage the MMP camera clock provider
Date: Fri, 11 Sep 2026 13:55:37 -0400
Message-ID: <20260911175537.87996-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mmpcam_probe() registers an OF clock provider before requesting the IRQ.
Neither a later probe failure nor driver removal unregisters that provider,
although the underlying clock is registered with devm_clk_register().
This leaves the provider referring to a clock whose lifetime has ended.

Use devm_of_clk_add_hw_provider() with the existing mclk_hw so the provider
is unregistered before the managed clock and camera storage are released.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 81a409bfd551 ("media: marvell-ccic: provide a clock for the sensor")
Assisted-by: OpenAI:GPT-5.6
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 drivers/media/platform/marvell/mmp-driver.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/marvell/mmp-driver.c b/drivers/media/platform/marvell/mmp-driver.c
index d3da7ebb4a2be688f5eea298daa06263f7d02477..4c31b62751a12a2734ec62d5e1cc6ad7aecd70c4 100644
--- a/drivers/media/platform/marvell/mmp-driver.c
+++ b/drivers/media/platform/marvell/mmp-driver.c
@@ -25,6 +25,7 @@
 #include <linux/list.h>
 #include <linux/pm.h>
 #include <linux/clk.h>
+#include <linux/clk-provider.h>
 
 #include "mcam-core.h"
 
@@ -269,8 +270,8 @@ static int mmpcam_probe(struct platform_device *pdev)
 	/*
 	 * Add OF clock provider.
 	 */
-	ret = of_clk_add_provider(pdev->dev.of_node, of_clk_src_simple_get,
-								mcam->mclk);
+	ret = devm_of_clk_add_hw_provider(&pdev->dev, of_clk_hw_simple_get,
+					  &mcam->mclk_hw);
 	if (ret) {
 		dev_err(&pdev->dev, "can't add DT clock provider\n");
 		goto out;
-- 
2.53.0
