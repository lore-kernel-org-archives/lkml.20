Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9EB388E62
	for <linux-kernel@vger.kernel.org>; Tue,  8 Sep 2026 06:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788849419; cv=none; b=WTFJkp1neiCEI1dXcWRMquJ1npbVm42t9ALEuNhogI8SC2JDAooo2KIIoXT0pkPoL6FdIcz4r3m4jmdHBPcJE6W7ZB/nHmxRqG9T3IjuQqB4Q9M1new8OrCJ9NNbm3WyZT/iGLtIVrEHALMRR8fcPRCaPnPwHrgJvtML6UC6M6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788849419; c=relaxed/simple;
	bh=86bR2fjDOyZrBl/MkYtR05D2x/2su6RiP+C8nGmCZEU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jVxJ7C83qgUvhv0XQZLPnOCquInMm9AXTOfRTXrNl71S2IW5vbBlo4lPOTzbVrG+OFHCA8qZtFFi2uS0nZ1cLCJ/mE9pXdJN2EwU741ZRxNTobHQr+5Urj2pe9a+xTwM74KZTvaINtfOcZczdtPiCSec8X5SZhnA2BvDz2pUqxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrAmBSUv; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrAmBSUv"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3990173a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Sep 2026 23:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788849417; x=1789454217; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xm1rxSc0BVfymKk4bSWdt2MAj/JI/30d2pnBXYKFQig=;
        b=DrAmBSUv9f/CgkpoR8QWNL+IPX9qrDgMd9HR5KVGr7V8JwCZ21KaWbQlHIp6RpZBpM
         fQmEEcvAv+eI1GJMrss6Jq8mVAPRsVCIyN72L97s53X9A4vP1JOetQAhf4eG2vFO0rvU
         sQN3RTNH4KPDf0vXlj677qkCSYtsGjw0MKKwjZrbSDi5aypTR1rDWhDYYPUyigVGy4Ax
         E0DOsWpXrosrvDxZWc8RSysDEirsUWKvW51nZyUJKLBX8eWc3JoQb6GwGAFBWpod5AuT
         8rezLkEfDnwJUaTYHKMbtVUOn4Mv1tjnk+evonugMwj96v0+x4D80pK/4LpAafEzENIk
         TSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788849418; x=1789454218;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xm1rxSc0BVfymKk4bSWdt2MAj/JI/30d2pnBXYKFQig=;
        b=LLCBuKJBVDxrRDC/uwuOGD0+ICnGEVSYfz47kFk2LC65cDt4cbmN1nbOfwvV5ml6re
         M2iI54qZMM0C0kNz7DLBTvU0iruZPcQqJKzlstCjI/uSbpiZPX1q7MZw2lsXFSlrIUK4
         VdyLGSsp6MCceP5+PclQm1nEe+0+gHrCVwHuqbCKmQHMkdcrato7nsQ3sW0JuLcogs8v
         p9T9yR+flQdxMcWh1amRLwPySHxEq6m782vjSseo/218lS7A3NbA5GyYC7g1ql2JR1UP
         CwwuAqGtq2F5S+MXzuZBXUJ4rbPkJEpOTEkvmDuVJ6LnWtXlMhr/xq57DnwqY1KAX5EJ
         ABBg==
X-Forwarded-Encrypted: i=1; AKwUvBxXev+xtg6dr8rL8T9Qy1x9Ts/BW53ESniYC1NVzRGE9PiB0sMJUhPtHv3/woWs2XPUrE4Orfq8TkFOaag=@vger.kernel.org
X-Gm-Message-State: AFuF++kjIQnw5SPH/RfBPEyKkZqOUlusdgk08jrnpXtCgDEWKm88MdR4
	TPYbRmY/hso7pxLdlWhrdho/HOtiJ15JO9/w9YttfEbNIj0R5a9eFfbPv7R0RwrZkHU=
X-Gm-Gg: AYBFou3um08nMiTFsa9CIWUHeOHZeMIlvuRPOB+dyKDi7XFarr++STj6q6iz3g1rgBS
	2io6qutYCx+Bj8LiXpbEsDRvPzN8yRx/di96bHLJdtxerwpsMVLvmrZmtxZcQLioezJKjBPc2UZ
	pSAIgQHts7LAsWkIEw55eklYeXXRMcGjWCBjpRMwTlHNeN8JLnggBzBrWwPZ1yVEYpigjPXfwA5
	p64whNJbu1z/UTk7PAD5V+jG7YsxrPOjvoSWuaNphjaS/khiNxvyBcmyX6SOhkMSAJcBqooTZGM
	NK75wC2IRd7NFn2xV8eKEcg4KdXhv9Ug/t5McPL82Kx9kx/jxUkbhrDC6RYME4rZaKQ/H21UtRw
	bEkVLaPc2//L1KfTJGLCC54XJYMrrTWls4k7iXXkRuUTAozOHRQxHkwGrQBeTiRN4GG5T+9uNAU
	Z2gmiacuIqmff83XQvNbGPeSWGmOPkfGGoHPa9zXonbgri+lXY2o8WNBe7OIyfzCsWkyNkRaZnn
	5sICmg=
X-Received: by 2002:a17:90b:1a8f:b0:398:d2a0:87ff with SMTP id 98e67ed59e1d1-39b26101029mr40740639a91.1.1788849416965;
        Mon, 07 Sep 2026 23:36:56 -0700 (PDT)
Received: from kernel.tail6741c6.ts.net ([185.220.238.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b4b72f62esm18814349a91.5.2026.09.07.23.36.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:36:56 -0700 (PDT)
From: Kunwu Chan <kunwu.chan@gmail.com>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: lianux.mm@gmail.com,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Kunwu Chan <kunwu.chan@gmail.com>
Subject: [PATCH] mm/damon/tests/core-kunit: improve nr_samples_per_aggr test isolation
Date: Tue,  8 Sep 2026 14:36:35 +0800
Message-ID: <20260908063635.2208922-1-kunwu.chan@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The damon_nr_samples_per_aggr() test sets both intervals to zero,
which exercises two different fallback paths at once.

Use separate compound initializers for each case so that each case
tests one fallback path independently. Also make the overflow case
use an explicit non-zero sample interval so that it does not depend
on the zero sample interval fallback.

Signed-off-by: Kunwu Chan <kunwu.chan@gmail.com>
---
 mm/damon/tests/core-kunit.h | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)

diff --git a/mm/damon/tests/core-kunit.h b/mm/damon/tests/core-kunit.h
index c01e6a75cad..ff23208c181 100644
--- a/mm/damon/tests/core-kunit.h
+++ b/mm/damon/tests/core-kunit.h
@@ -627,12 +627,20 @@ static void damon_test_set_regions(struct kunit *test)
 
 static void damon_test_nr_samples_per_aggr(struct kunit *test)
 {
-	struct damon_attrs attrs = {
+	struct damon_attrs attrs;
+
+	/* Zero sample interval is treated as one. */
+	attrs = (struct damon_attrs){
 		.sample_interval = 0,
-		.aggr_interval = 0,
+		.aggr_interval = 5000,
 	};
+	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 5000);
 
-	/* Zero aggregation interval doesn't cause division by zero */
+	/* Zero samples per aggregation is treated as one. */
+	attrs = (struct damon_attrs){
+		.sample_interval = 5000,
+		.aggr_interval = 0,
+	};
 	KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs), 1);
 
 	/*
@@ -640,7 +648,10 @@ static void damon_test_nr_samples_per_aggr(struct kunit *test)
 	 * overflow
 	 */
 	if (ULONG_MAX > UINT_MAX) {
-		attrs.aggr_interval = (unsigned long)UINT_MAX + 1;
+		attrs = (struct damon_attrs){
+			.sample_interval = 1,
+			.aggr_interval = (unsigned long)UINT_MAX + 1,
+		};
 		KUNIT_EXPECT_EQ(test, damon_nr_samples_per_aggr(&attrs),
 				UINT_MAX);
 	}

base-commit: d118502628f8b673be9023db8bdf878f64a7ed45
-- 
2.43.0

