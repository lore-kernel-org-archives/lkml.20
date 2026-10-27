Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142512;
	b=fjkpUgWYnKkc0dJiwu1FLOlfX6wM3q9MjPr4UKHVbUtxdVOs0MViAj9iGMV42t1laXXt
	 9zibLdN7PDSoK2FFWWPEjzhVxxninRzDCWK5AIhoY4BHZP54vTy4ycvwbX77RGNHkyE7/
	 nLQGhOGMF6/T58Ysa1ijWCv/WPXyIm2TZSNwZQH5CttPAEOpoLgZCTFYwYqj6Wr/28w0l
	 zSCRpMtaOqUwYPU3+Ee0nhvay10/SJ7slb2himBgPQNMEhWxIqlRLYT2QoAaSAMRFmWuw
	 Put0a9qkoFD0rFT/RuTO1BW168i8EhRKDa/WInCaiizT2KstczSAYc63o4R7yKa6PrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142512;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
	b=NsfWCWDny9YE0pwJ97RDNzucnRnvr+bC3lRj4/7LLlvtC/ZtjCuQMaByHX+soEjSI3ys
	 aM/AGH8n+OYyffpHKaTUEfCiPf3PYihvOA/AY+IR8Waw/7tXLyyEKLxPY/YlEfIUAWg7N
	 avptBs7ma6PmsZ07A1Dg6xXf7KS74iNLX75oB4bO8MJZrX+n9ouKzXAz8YT79sXpep9Lo
	 p+dEB4PIN377dSFtE6Ov7LWxors7o+J25QVlRjt2jHWxVRX/AOxo03Ygiz/5rNwuUlSRr
	 SIPqVDYq/RJ8PVO/JQKnxBA0JeaSJVnJB5Kcxrd+eVK4efnUP7Bw9oP719FPGU33M4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDPLUU6b;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C455606A322
	for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 23:08:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C455606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vDPLUU6b
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so2810245e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 Oct 2026 16:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142510; x=1793747310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=vDPLUU6bhwuiT46IocsLP05KNPdHPKlTtwnMel+V3yg8SRENI1X4qrt1yOFB0krlna
         G5wWYjgs3TZ7MTzg7jb1A7slOKkmvcWp61hbJS8M2Idwv1p5eeSmOXWXePaKsAowgxwu
         SFukW3X6XvwU+1j3AwXV0125vnsClqCM4HopEh53VGQkJJ1fKwH+9gxwTvRrjZtWbF+Y
         qBBmwvFF/4vC71rbutbuTAPs/g3LIsC8m90/2kCL33qv7bsjU8lcALmBQ8xLAycvELVr
         OU1iN2J/qPMEl+aRpFD+SjgwAenvvJRrOgMwM0bNpnO65NnY8GqQ31wsWii6FbQudwEa
         Oo6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142510; x=1793747310;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDHtD5ywbRxioPIq0YKT2Vds05KTerYZgbBjOpP/OdQ=;
        b=JLshodSp6+/yQLicpewoecdkMQRbDqXEfs6II+wR1PPxHZIUlgca4N1aZWsGDhCPXQ
         8Y8u/9OrYYbYAn1hgoO2Pzr5YSoFK8Kl6JaZXpqGkqvylhwQ/SaZiSqm149lV2EpkQoP
         UG1qkkmLSvmw01b0nXjiZ52haT3h1b+/jgfBUWFkDqT8DHP6PGA51/5SIIpw5/O7zJz+
         yCE2rRtQ+P+XzWCzkwt5S8ICfc5ekdiLYathP+Fseu0KHZW3ceGoEtaRRqDOxFr/9adL
         dUVQF5HMLPuZ/lYE1H0FfAfTeglM7D/1TqEXr+S8zafNREoMIhWZY3Sj+1ll95g5OfTm
         JCjw==
X-Forwarded-Encrypted: i=1; AKwUvBxDmc7iyYOJYG2N4yW4n7jp2c+46+TiHiilnxVD+IQUruSvwvxZvNYdK4X4BFnRrLmtNyD5x9Aahg9N5Ks=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnkflX2+LIcIJ2GKfRgh/OZ3wCfnZrHy5DIdtfWie4np+4AWlW
	pAcxbLb3/rbne+Tr2Bb5wn+mpsdi5DYUqAexJD+U3+ZSloLjacOQdIxS
X-Gm-Gg: AYBFou3Sk5TbKDyNiO4a/wW09gkryqMp1Bq9SvQueeYfH6xuiqTmwKuMxF28m0U3gOl
	yXu3T3LCaTwKsAMhbi5k+8n4/HYfI0X0TUiDDf+L95r3ORKChvbbH4QbaXrKZUUmkxYDmxh3PkU
	JcRfwJWFvTYnpoX1iF7DNHUpMFxSwQI74AqhlwVE11W/cQM6bSiv6N5wPTI5H32xf1BfruY7Pon
	eNUOM9QnVkKE413BZn1mcg4IjwJGatq99obBZdUgNjIvUmZps3UTxvU/50rjRQ0CE++zEixuVab
	AdAU95WLMA8FEugi+G+pWdt3MAdmPLUHfkCsJ/KIR5L4CZbedny1zzmF9pTwfMm/MKWGnnsyQnd
	jZKozYGgnKR+1ndtzsFbYQ+sLbTIw2q9KBi7tw/MQng4iP7C5umM49Ran+h1Epas0JxhvmmFQ4R
	ZwsWaVkOTuFwUIZiiuqY4PZSp1hYzy3CB5S1BP+jeruSH6Y5pUV3mhG7paq5CF6rwrHohvSx/bT
	05EFvx2QjJDJ23GLfgcxBIpUgKh8u6Hfzsn8f97tJZflXiIj7UBzc8nHcxPxx+2VMfiuIVLh2gN
	cIY=
X-Received: by 2002:a05:600c:348f:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4a9678c68c3mr7755225e9.34.1793142509776;
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:29 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 1/5] media: atomisp: sh_css_mipi: include assert_support.h directly
Date: Tue, 27 Oct 2026 23:08:03 +0000
Message-ID: <20261027230807.2407261-2-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
References: <20261027230807.2407261-1-vladurares@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

sh_css_mipi.c uses assert() but only gets its definition indirectly
through the circbuf headers. Include assert_support.h directly so the
file does not depend on that include chain.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cdb58b..83424b6ce1713 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -4,6 +4,7 @@
  * Copyright (c) 2015, Intel Corporation.
  */
 
+#include "assert_support.h"
 #include "ia_css_mipi.h"
 #include "sh_css_mipi.h"
 #include <type_support.h>
-- 
2.43.0

