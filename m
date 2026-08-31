Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4C39E176
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788210831; cv=none; b=S/Om9SpZoUSFWsAMvdcyPxDZ+IJ+2JS9ZJ0/VZTKWeTP/iHdUCKyhdG6+syO2Hvm+iEVZLewwU4n6lmpmqQ2JuPdriCHFUY+iNVtaiUJ0p5aNlkZWgKfeUtfqAGCQzjrkR+NqlzmSc+FObyVaU5SakMzNRlNYLqPHCeW7HuKGqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788210831; c=relaxed/simple;
	bh=S0psc0GokPMG3r5dgQR0E3KceBkww71p70Ddzytet2M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MnEbC97guZLQ0/047UV7yAiB9/aml2OS0nOFTZHwFPN/8qQ3+peolbJFCC0WcD6yMD3Mtdz9r6e4scgyjkhNnrE3CYWPXWXx3Ariy4+HS2PG53kTl/FlBbFecFYOVGxm6WduQm7LxIrVXXPNm58oWHqPkQWZzNEmel+OgAwVUNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZsUCvcIA; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZsUCvcIA"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso28838545e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788210828; x=1788815628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BZLzJmQwMgWXL3sbjVA8gM6zLJbXj/mUC/hE8T4vkRg=;
        b=ZsUCvcIAOm9+R+7fP964cvUGr2pBAikOpWVPIMDCxUgEmCJ2Ghmxfe2WL2yT1w9i4m
         xByidXN6nnmlnFnyVucnhQBfrbjJy91/aFCagWlLrzTou8FF9qbG/Yq/ang534ONic+l
         8tdYVoEFn1uq2Zzvl1O4DEAunyuNSsIUSECjmXAS40cU3ZwvVjzDwOV4rjMnW8vZOM79
         DMa58brj2alhMqpfBOJAZTLfMbhANm36+q/ODIzgFJ9Mc+luOPBj7hlCUWNHPzod4euM
         x92CzM3ZtA/HEAUbM+8rJzpYRn3i/PWZJuJPICwZJ/lRZEUMXtJKROvIMWIuyHUTRSPI
         aX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788210828; x=1788815628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BZLzJmQwMgWXL3sbjVA8gM6zLJbXj/mUC/hE8T4vkRg=;
        b=pNuFTgptQVS9U+95P+saNPAnJJYiEU14g1M+8itwiTvOprl0+sWAY7pHRwYDNQAxgn
         zGZIyLKdToieUAfDYH/jyLtEaygQ2hazuvMppZ5gE3AQ2cwcbgbIuAq5g3zy8KYQfkTc
         jmLLDhnyrwcVUpWGvx1vMMtMfYU6Y29FXkRkzhoVB3GN/pURtgBASn5LMKpuDDhOGyir
         gr9gDFSNt5adB3IjPeT8+ElijZFsVR7XfpX5eBb0ybllyhNYYOSmRufKd65CjHh2Hbnt
         W+c/RUHrkSBRpeOcBDkohADOY3OqGpuNKEoPCXst8R7Kf7BE//8dPNja9M2RdO2Raa6p
         YOiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq2FdffNwiGHd+LkeBGw/95nAQEhfxUmBFpV4VrGvx9nC/1LcAzz8SZdZZV+HgQ4FnRcgpenU3a9F55daI=@vger.kernel.org
X-Gm-Message-State: AFuF++lRD2tXaKz2NLOesKqYpsbP4c65YsQ6EZTs/Ct3j51t/iivnsYg
	tVKzYfa9yMbg6OJJlihhaNLy1nGXqszyt1zKZEeS4sN1oV5OZ++8zdFx
X-Gm-Gg: AR+sD109RpVjf2lUwUZ1Z2/6G2i5VsyMz/K/x+xxi5Mm6rUptGe6crxEEOVJbk7xSOx
	m41abGuFBNgs4yV2P5zFVy9ZeJwIyeMm5tTVqf/c4Ahz3YCou/N+TDR6Ya1s8yhIbVA+HqNiMuz
	ADeQMXu3ei6/9FgWjwDdaxP3TYo/AEQ/bwOgHqECNW+iQ7ykXB76Cf4+JPCpOljlhvD4MBvD4td
	aqwCkVGT4YEEtn3QMER+wSXPaOibrKG2HXR+qMHiODoP0YWKw0e8TS+84p48tMjupVthIQ2P880
	gEUYKMjWqgK0v0mGddVcheGXs7Mh1YGKzXdssWF2/NWMPXE6LfSMdYcWyBMQFQiSb00LWFcveQq
	61H+PQHtFgOwjptL4zCjedHz+idKVU+uL5hT34HvgikhfUqgjrCwNZjaDJUw6SBU4XKaHR1v7tt
	g7aHkxOIyV1ufUKMGJD+2jWdcG3YxyJ1h1RbIi4Cn98DA2OpZ5LyX1+qCvRqFt4Nr2R/aUVbIKT
	7kos0WSjT3n8peMc1UfJho2NzQNISOWqyuJPtkJyW4d4TK68tkG6EcgUZ8+kP1yBJcoKv7wr0TJ
	jhd08WBCHq3jgDiMWAY3hBWbCFEFwnVWfmcNV1hhHzXENqc2wpaB04UdGpCQAUoLH5cnbfPyPDj
	cWZfm75QrY72vjoedSYYTCHiy
X-Received: by 2002:a05:600c:6215:b0:499:593b:a15b with SMTP id 5b1f17b1804b1-49cdc422c50mr67567885e9.1.1788210828027;
        Mon, 31 Aug 2026 14:13:48 -0700 (PDT)
Received: from [192.168.1.187] ([2a02:8308:4092:11f0::f9f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce1754csm17695925e9.10.2026.08.31.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 14:13:47 -0700 (PDT)
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 31 Aug 2026 23:13:36 +0200
Subject: [PATCH v2 06/11] iio: temperature: tmp117: sort headers
 alphabetically
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-kernel-header-removal-v2-6-b92b580ef5eb@gmail.com>
References: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
In-Reply-To: <20260831-kernel-header-removal-v2-0-b92b580ef5eb@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Crt Mori <cmo@melexis.com>, 
 Puranjay Mohan <puranjay@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Joshua Crofts <joshua.crofts1@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788210819; l=928;
 i=joshua.crofts1@gmail.com; s=20260530; h=from:subject:message-id;
 bh=S0psc0GokPMG3r5dgQR0E3KceBkww71p70Ddzytet2M=;
 b=Bi5LMlu2NHtnbcUH9zCVbESPx41H1U8BXpXZ7VyzptCnG7IBK55Vd7dRuuebmXwInnSyvrSP7
 qHuc2Y4CYJRDqghAnEANFvwE+YTiTlX9rQ/AqRs8a+nGc2t47B66E6f
X-Developer-Key: i=joshua.crofts1@gmail.com; a=ed25519;
 pk=RTDOoVwgeL4oFdASj9U+cxJuIjXuXk73zkjnGOJKbEo=

Sort the headers alphabetically to improve readability.

No functional change.

Signed-off-by: Joshua Crofts <joshua.crofts1@gmail.com>
---
 drivers/iio/temperature/tmp117.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/iio/temperature/tmp117.c b/drivers/iio/temperature/tmp117.c
index 74cb8d62bef3..fed8af2d81eb 100644
--- a/drivers/iio/temperature/tmp117.c
+++ b/drivers/iio/temperature/tmp117.c
@@ -10,16 +10,16 @@
  */
 
 #include <linux/array_size.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
-#include <linux/module.h>
-#include <linux/bitops.h>
-#include <linux/types.h>
 #include <linux/kernel.h>
 #include <linux/limits.h>
+#include <linux/module.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
+#include <linux/types.h>
 
 #include <linux/iio/iio.h>
 

-- 
2.55.0

