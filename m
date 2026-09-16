Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26BEC4BD362
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580582; cv=none; b=L/ophe0aG2+ZqC+nMnLxqVR+0cUFqEYvC5r8F51kGvLsIx6Czh8HuFYVMOsIITSxHse2OkRKtehZrikLAD6WtiD/u6KvFZzCjibRnfvDznFGbl0XM/zybFaOKsHtdZka4rO+nFz3arXuqd5Ec34DMVCtYoSBQ7IgcA31Ay8Pt10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580582; c=relaxed/simple;
	bh=HGNIvqMsniyjFCXq9xFvhYDTLciJsYL/vhVQM3VfuYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c3zoJ1Wx03l5oYFi8zLvq/YS7pvUIgDcZeMJ2nt18Ci90mPF297hxKGfV/Ylu1ZL4rMtukE/iyuy5r4C4kuB61t6/f2KxUyeJklggIxq4ULF3bqr9L/PQ6dwj1JWl43NFJj4mQUkRtIYaIOHgfAnnL6tT9k/zjQ5pAF4BQRjf9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lChBWklq; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lChBWklq"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccafb752so1139657a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 10:42:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789580557; x=1790185357; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SwgEhBXTngR3El+sf5PzSxyA5w4YUY1fd7mrK0Hv9aA=;
        b=lChBWklqhZnPDIkS75OXdgTL0BppdLUvkYjbFLlxGTn9qVv4Zy9AurKhEhblJDVI9O
         ypPAtT7kEEMldnLt59tT2x6flloPkI1wA0kvt//u1cIhqpCV9XIICakY8UF0SuL3Cz1l
         juYcQNGOTynGBC5NoRJVIDVGISAW9mqeKQhzyEgfy9Z55AKym8qvgm6Qx3RaXzMDPY+T
         cKoP8dppyLHgWNmArfqaG/nrkXg43l+VSuI3BnYKe6Zj0DqXsKxdu/8gf5cJzD+xVl6T
         M00skWPRBa/HKmo8Sd7XggiIpN5BuVQx73b8yVK4Ra16KT770Fxa4xZhThdPgsFnUUb6
         k8Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789580557; x=1790185357;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SwgEhBXTngR3El+sf5PzSxyA5w4YUY1fd7mrK0Hv9aA=;
        b=ByJh0FQzxLpYhNzzzdHsjI48JOhLHwYhELH+K3xB1aD7HYUxGrJbQlP/mcaBkumeuL
         rpVCzYREWtkiHscnoCp611tGLkTG50DQ3yPiR7Vc/WyckgrOwE7tXBfa0ZgOW27O6XVs
         oYPjVfiSKso0ZPLGTGyKVI9S+22pyRt8aGKrvl09np6TsXLxY7YjDJ8l5BNk64ci4DHw
         vgZ4RHBHdrWzsha7JqF8ZjxpJeAvWco/az0OhweNI7917DHZa8XJ/KMSiHE8TAVeaxzg
         7qHhn2+/wX6ml+iHwpcgHWTzZosXtz4xuhJUXdtOL/fD184EAkYHCEAK9GJkJCDV48zG
         mLuw==
X-Forwarded-Encrypted: i=1; AKwUvBzEGmOMSPXk8fCG3Pn8mjOS0XKWRISsAoPzacplxvyQxRmTjZnkQsSWjePPvG2llW1HCYJQ+M3XzL9GJQs=@vger.kernel.org
X-Gm-Message-State: AFuF++lNdxmra3sTJgkfehVHZuIV6sAmg1Blzpy7D59adLJFoJSQaG0y
	2VsgTHdccbVlWj558x2MebsnBNCO9OY1zQz/qbtKns8iASwHURVkxsgC
X-Gm-Gg: AYBFou2uTBrfrxEXZHVJN2w3ggh7W5EPes3YAv8SW2n8BCyPUY1FKUNIjJcjcov74u6
	TWaE/N3dSLVr9CA3HQ9ImagoGa1QIdmkODwaRaf+eeKIW5wdgVYUAGHWqKM78lwePr+ceQwNJYG
	rU27g1zBKImfHoMrvOL9Cvsj3zUsyduU3x3p85ILoEZN++SwyQ/Vk4aNasYVGhfj4XAY72WPULX
	cjhdWE5+GQ/3ntzlXWF3CbLVIyk8OrCYNPX5sNuFgRmVwJXQRGpJrsai0VUA3BnqNu14UHDsz4n
	Kcd212PBSYkgAQAB5aI5LRbCrrxNFndrLgUB0LPRCI3woDdFSuok1zhh2TQQdV2PxoUobivgUEf
	i5dt0dbI+1tY4s/bsIpygf/W6ofxJgukQZyPgPVpXBYtksS0e6XQzSqo+g7gnx0oPFLQRctYbxm
	5lJCJEQG6TaUtdmuAMVVYX5SNDSn819O+NxQ+qZHjB/1g+Jj/RpGfg9himidUvBEuAYpj+Xy8Tr
	IMkWoLLnb4icfl3DQ==
X-Received: by 2002:a17:90b:582c:b0:39d:f18c:1ad1 with SMTP id 98e67ed59e1d1-39e1e2501e6mr10461602a91.3.1789580557234;
        Wed, 16 Sep 2026 10:42:37 -0700 (PDT)
Received: from kernel ([45.251.35.123])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d4cbc9sm7286360c88.11.2026.09.16.10.42.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 10:42:36 -0700 (PDT)
From: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
To: herbert@gondor.apana.org.au,
	clabbe@baylibre.com,
	davem@davemloft.net
Cc: linux-crypto@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	jkoolstra@xs4all.nl,
	lkp@intel.com,
	Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
Subject: [PATCH v4] crypto/amlogic: Use devm APIs for clock management
Date: Wed, 16 Sep 2026 23:12:27 +0530
Message-ID: <20260916174227.5581-1-raizudeen.kerneldev@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver currently gets the core clock and manually enables it using
clk_prepare_enable(). This requires matching calls to
clk_disable_unprepare() in the error paths and remove function.

Switch to devm_clk_get_enabled() instead. This lets the kernel handle
enabling and disabling the clock automatically, which allow us to drop
the manual cleanup code and keeps the probe function simple.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202608310329.QgxCCMs1-lkp@intel.com/
Signed-off-by: Mohamad Raizudeen <raizudeen.kerneldev@gmail.com>
---
Changes in v4:
- Fix typo in meson_allocate_chanlist() function name.
- Add error_chanlist label to properly free chanlist if IRQ requests
  fail, preventing a memory leak.

Link to v3: https://lore.kernel.org/all/20260916154941.7254-1-raizudeen.kerneldev@gmail.com/T/
Link to v2: https://lore.kernel.org/all/20260901024302.5407-1-raizudeen.kerneldev@gmail.com/T/
Link to separate IRQ fix patch [1]: https://lore.kernel.org/all/20260908160120.4805-1-raizudeen.kerneldev@gmail.com/T/

 drivers/crypto/amlogic/amlogic-gxl-core.c | 31 +++++++++--------------
 1 file changed, 12 insertions(+), 19 deletions(-)

diff --git a/drivers/crypto/amlogic/amlogic-gxl-core.c b/drivers/crypto/amlogic/amlogic-gxl-core.c
index 169c6eeb51e5..f292bb25674f 100644
--- a/drivers/crypto/amlogic/amlogic-gxl-core.c
+++ b/drivers/crypto/amlogic/amlogic-gxl-core.c
@@ -243,34 +243,30 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	if (IS_ERR(mc->base))
 		return PTR_ERR(mc->base);
 
-	mc->busclk = devm_clk_get(&pdev->dev, "blkmv");
+	mc->busclk = devm_clk_get_enabled(&pdev->dev, "blkmv");
 	if (IS_ERR(mc->busclk)) {
 		err = PTR_ERR(mc->busclk);
-		dev_err(&pdev->dev, "Cannot get core clock err=%d\n", err);
+		dev_err(&pdev->dev, "Cannot get/enable core clock err=%d\n", err);
 		return err;
 	}
 
+	err = meson_allocate_chanlist(mc);
+	if (err)
+		return err;
+
 	for (i = 0; i < MAXFLOW; i++) {
 		mc->irqs[i] = platform_get_irq(pdev, i);
-		if (mc->irqs[i] < 0)
-			return mc->irqs[i];
+		if (mc->irqs[i] < 0) {
+			err = mc->irqs[i];
+			goto error_chanlist;
+		}
 
 		err = devm_request_irq(&pdev->dev, mc->irqs[i], meson_irq_handler, 0,
 				       "gxl-crypto", mc);
 		if (err < 0)
-			return err;
-	}
-
-	err = clk_prepare_enable(mc->busclk);
-	if (err != 0) {
-		dev_err(&pdev->dev, "Cannot prepare_enable busclk\n");
-		return err;
+			goto error_chanlist;
 	}
 
-	err = meson_allocate_chanlist(mc);
-	if (err)
-		goto error_flow;
-
 	err = meson_register_algs(mc);
 	if (err)
 		goto error_alg;
@@ -289,9 +285,8 @@ static int meson_crypto_probe(struct platform_device *pdev)
 	return 0;
 error_alg:
 	meson_unregister_algs(mc);
+error_chanlist:
 	meson_free_chanlist(mc, MAXFLOW - 1);
-error_flow:
-	clk_disable_unprepare(mc->busclk);
 	return err;
 }
 
@@ -306,8 +301,6 @@ static void meson_crypto_remove(struct platform_device *pdev)
 	meson_unregister_algs(mc);
 
 	meson_free_chanlist(mc, MAXFLOW - 1);
-
-	clk_disable_unprepare(mc->busclk);
 }
 
 static const struct of_device_id meson_crypto_of_match_table[] = {
-- 
2.53.0

