Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDFD426ED6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 21:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790284686; cv=none; b=a/bHvwgYaR+o+4F9RVeHRWTBn0Ke3Dyy7SjzTwPS+a+S4wf1WGikWKeCmQUQngFKY8gJM2CsXluTecjxgOKwLeXzcMDI5Mj7LYXcOyBCCvv0G+IdGYRe1oStzCmQsA3oqSakXWjMEfh4728Zg5pl+6tAEP0pLm2u2dstv7IBQMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790284686; c=relaxed/simple;
	bh=zp1GtFAWNLSN7+BfopZI5W35y9BoiCnO65i6+zRDnoY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AVIZ5s4Lf7JK7S6q+1lUNsmz9PnPJSUzuhkXlQb7t/GSxeUikrulCEgwwGXJA8gAq9uSeA6SNsPTqgF6rjdZmSg4avnqS3oCRWtRcdRGSzg4nRT0oI7zmFf24ejcVkHAgTdi6W0OHw+BUut10JpeQ6k63ih6RWyd/wYHVockRVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmVD5QDS; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmVD5QDS"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39d654f02baso151210a91.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 14:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790284683; x=1790889483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QD6KVQmWiWZCi2apQJykDCktIAOK2lbc8NkdM91LUdQ=;
        b=KmVD5QDS9d6OoxzPnNgkdkgRi1hs5EwrTwZhv6Gr/fy/ij1+eYPW2u7T6FVkk53zji
         YZ9KNnZ5dT9j5wXuE5HPnnpbriBikZ51ZaTBpy5oeH+bbnLtpwDHY9Ph5qvIW9+GSuQS
         +wairQSu0Eloh86B2S9fBA7g7XBWs4bBDp2zhSgrnQMVUE3h3pcGaJYrA8pLZZT39v9L
         y9/UKj5lTuHpQAQnIc2BLWJC6UdYvW9redUgP4c7BKbaPioSYGWIFyfLGd/s7s6KajLg
         4KkkhyacKvDXoJwrZjmkcGmKBUaWVs4RbGVRtM7WuaCa/SpsBWNg+jhKkQ1LQNLo0YPY
         ePyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790284683; x=1790889483;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QD6KVQmWiWZCi2apQJykDCktIAOK2lbc8NkdM91LUdQ=;
        b=Lafoh24YPp24On17E7PGpwLpgelkxVJRlBJFEICwGEZgTSSK8loAS2fX3+FYoTd++M
         RWf9vzY8tMe+Hp652IrBrtZ3FLTPSNAtzZjb3pn5/5Mz4Qhdw7dEQjiGmH95M4SSZDo5
         WaZTtLi7ZFm2Gd4F3zdDWa22uTJjXusSwRcxuohRt8kOTxc7hM9gqvR/RFv4Toycoh5S
         vryolJlSn8Qp6XBxjVPxeGA2HYk5kaH0oFDF7EYvfWpC/37IH2qR+UX8GAiubaFnRStF
         1KzwNxBlYImdQyN85gRnxZ+6qcKakLvsv/zyTRPNH+xo7hyLElpRgAVzBIaXB3fjOnEy
         k90g==
X-Forwarded-Encrypted: i=1; AKwUvBwjtd3bbHn7J7kmcpJd2o2lWkdKLf6z/3H0CiArJ5+u0PCmBQGQFy8mrfy9qxl5NT/7WLWKosgHer9KGpE=@vger.kernel.org
X-Gm-Message-State: AFuF++n+/pP+nKNxbAbgGNyGHb9n6hAN0Z/an9W1OyKrRpLKqr7yedAg
	cjZLxzVnxU3chjfK6JdmMnquxOOXjpTU1uZFdP7eYaWKH+cJwvJJ4p1d
X-Gm-Gg: AYBFou3VL/kUhB2dojPpT9gq7zCHVnxMF6DyFq+T1pidjGgJkN/OGetzXCIbUDRf0XB
	9otTxQotaxFk8b1t+dclxic9Ht/uyCESQbtbkZ5eotWuViQRTkWX5BVx8GWlKcG4Fe9Pho0CAh1
	Or2dg6iQ5xJv6EiAyIm/8+NYpDOi7LjxffK6RiqRETm/3MqnvTpdLyQ+Rin5HmKCIFllJUQgeSa
	qLPYHKsNEOtAt/RBj17Y2Hsc/wO5oUucSnjG9Cu2Hy2kuwXqRNf2+BH4GnzUxOu4pvzT9tev34P
	ySDqE27lIhMj5k5x3U2LuKgEOn0Jzikuv/LlHCivdSw0tVvs4vju4Aj92xyFO2ImBvHB52g+H6+
	4vuDAv3Y0le6uxqwzxL5foaIlAkUmPhsc4KV/58tqq8ra7bvZHvOVIPMfOT77QPZIJtECtvMFJE
	xC5rB0V7qllX8Y5aOKa/l626qNZu5zoTjLvjA8D8+8L1pWbGswB45y07xH83Tl+Y7Fsym4Gs3OU
	ejhRq9U0jP44/NeMxt1+3WJbUuQeJ8lag4zXvpUIVSMgDTfeFPuSjqQqmsVe8JadhQIHlsbPkHd
	j1asbuwaaJLWJdCK5f2hEHg7RtJ1P/k+QWW9h0ETZRrjoWsITO4MfYo7u/8=
X-Received: by 2002:a17:90b:1c84:b0:39e:6a81:5a94 with SMTP id 98e67ed59e1d1-3a098e39a55mr3083632a91.40.1790284682689;
        Thu, 24 Sep 2026 14:18:02 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a097663fd0sm6613523a91.9.2026.09.24.14.18.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 14:18:02 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2] dmaengine: mv_xor: use devm_platform_ioremap_resource()
Date: Thu, 24 Sep 2026 14:18:00 -0700
Message-ID: <20260924211800.79208-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the two open-coded platform_get_resource() plus devm_ioremap()
sequences with devm_platform_ioremap_resource() for the low and high XOR
register windows. This folds the resource lookup and mapping into a
single call and returns an ERR_PTR on failure, checked with IS_ERR() and
propagated via PTR_ERR().

devm_platform_ioremap_resource() reserves the region via
devm_request_mem_region(), which requires non-overlapping reg ranges. All
XOR nodes in the Marvell DTS describe two distinct 0x100 register windows
that do not overlap each other, and sibling XOR nodes interleave without
overlapping, so the newly-reserving mapping introduces no region
conflict.

Assisted-by: LLM
Signed-off-by: Rosen Penev <rosenp@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 v2: remove build message
 drivers/dma/mv_xor.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/dma/mv_xor.c b/drivers/dma/mv_xor.c
index c4e0dce3ca64..481a34f2384f 100644
--- a/drivers/dma/mv_xor.c
+++ b/drivers/dma/mv_xor.c
@@ -1315,7 +1315,6 @@ static int mv_xor_probe(struct platform_device *pdev)
 	const struct mbus_dram_target_info *dram;
 	struct mv_xor_device *xordev;
 	struct mv_xor_platform_data *pdata = dev_get_platdata(&pdev->dev);
-	struct resource *res;
 	unsigned int max_engines, max_channels;
 	int i, ret;
 
@@ -1325,23 +1324,13 @@ static int mv_xor_probe(struct platform_device *pdev)
 	if (!xordev)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res)
-		return -ENODEV;
+	xordev->xor_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(xordev->xor_base))
+		return PTR_ERR(xordev->xor_base);
 
-	xordev->xor_base = devm_ioremap(&pdev->dev, res->start,
-					resource_size(res));
-	if (!xordev->xor_base)
-		return -EBUSY;
-
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	if (!res)
-		return -ENODEV;
-
-	xordev->xor_high_base = devm_ioremap(&pdev->dev, res->start,
-					     resource_size(res));
-	if (!xordev->xor_high_base)
-		return -EBUSY;
+	xordev->xor_high_base = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(xordev->xor_high_base))
+		return PTR_ERR(xordev->xor_high_base);
 
 	platform_set_drvdata(pdev, xordev);
 
-- 
2.55.0

