Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348641;
	b=mm1/IzEVDQl0RRBJL1753dl9hEZeBOsGkeAK/CNRTdX31jlLmlY6nF+MGdeJX6graqBX
	 PxN0ciNTEJz6u/qfkPjcwB8fX05qOlpJl/Cwdd11G4aF8gUlp0F8h8jOKjjetLmijiIq7
	 zqj33P/sW69W9CQ30e1+VGiVWiAFvF2GKJLUaCkIIo0NaCrbVhS2DWUy+bVmRWlktKZzk
	 UTX9W6dcvbPtu5/jd4qBCEfw8NXmPMb8+C7ygjI0lwBw0kj1kV/mGlJjE0bRj5VJpUuN/
	 GjfeO7AhGISuOe27njnq4TV0OssfhNbCiEF/bRCYMNXcIzhOlP5LM8DVRLnhDvT19MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348641;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=rJl0p8S3DutgTGRmx6NitpapyW521dA7vOSDUqq2e/g=;
	b=suxdg2nzDGf9UaiCKAUhOtaluozPd9r3q8w7Rc1uQck4tKrdi3123ZF5xj2WzXlxKuYC
	 4iZBznUGSlDtGHErcdHa1QB7JAEKDvl08GBWXT+g3a5mMmaAfR1VGIEwbaoPnHZrt2UT2
	 7dAGXLsw2+RXZp06gw8qHD1xILRFuUKhbAWD++XR+Vjd9q8j4eb3iHVI4hOq4yJFYA5Ny
	 f8d1E+oCNlgEzFF3OXlHl7U0FBtDf1Jn4LoRYIcHm7AWkXVT7ld9z7Jg9Z0kcQB+sIB5W
	 P0zWTIOPwPyZw9Ddr0EJmIMmGpFQhYyb00ta7BetFhoeHa8G5F63+AVKpld7qOa6BJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnXgiBs8;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A6B606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 08:24:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04A6B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rnXgiBs8
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-36a18fc7a38so1228260eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 01:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793348640; x=1793953440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rJl0p8S3DutgTGRmx6NitpapyW521dA7vOSDUqq2e/g=;
        b=rnXgiBs8F5aUgu6xtvv7qnYYqN8bF2hyTC4vXJju+7CajSG0Gf4w0pMKRnMqn+y2t+
         3ZwRpyie7brIqQaoL0m8rK4ii+iBbLnNgJVECErG8zftbFLJRyBC0GO+6Po3INGVT5sx
         3Ar0w8sNfIY69feN5wV5ueF1q2pgS0xYmJN+Hj+SlThZsRq9YVg4ihM0nZSdhTGG3YQC
         NE8FEHkPxkSRP16RglHqnkVPB3AybTwQiO2gaIVbYxVfdGjJr7jlmSgYhjBl1Ga0bmcm
         1iV66f5OzUjLMnuCZruw9jHXzUx0GjLvw5Wvo42Qozc0BDCJbWc31qE2fJdAuxefrqDN
         Ic4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348640; x=1793953440;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rJl0p8S3DutgTGRmx6NitpapyW521dA7vOSDUqq2e/g=;
        b=F1tGqhU/eYL4FxxSz/51IqYqQ3h8GenUzZZSNmm7oHCxVxlnV3XIZk+DN/RatTp/Cs
         8krcDqngrN1ip49BVjIr7BshiosHJQNygwMjQgjmpQt6PLVsGmWEK4w8r8tqGES/tbd7
         LwMRGX8nH5irzrXeuLoeIvTXnT6fjtCF2UL2CH8+mckANyfZi1FWvX3/qvxnjpo5lqo5
         f8m9bvQrOr5drCKdZKX++Xqqrvv7xcVoq+d4dLq8ij+FqWaPtqtRqsAHV33/GZBV1x7E
         PaZN+vxgZGdYeGEDVwf+mgohvooJUomHA4g2M+66IAkeNg6lhJ3Aca2xCS7H159yrr1m
         gRFg==
X-Forwarded-Encrypted: i=1; AKwUvByvmgV//p9W2AXRVeelnBrbqH9GaCODGBYTpGwk5hi2N6mPDLIzG1P6FR1/gSsCkbsYPeXUZZbdpDqM06g=@vger.kernel.org
X-Gm-Message-State: AFq9FYIdzhUetZ9ZF+Rxmbzxj4ipg8fQCngc6He1iQx0li72uoEH1TlZ
	hP+ST1slAxHBQoBv5MzWWOE4D7mIJVuB90nVCdMoRi5g0NG+ukm/SzyHCgD36QBh
X-Gm-Gg: AYBFou00jly32jZ/aLnUkvdFwyZJdMn/E1co3fqXdtA06UME865Lx8h+keRjL1D/nzA
	SpqHz+dOCZdaFMAiede3f7EORcs4Js4SMs1dV91zNkyvIZdnHjjyu3UP7Z4ZLUqEVaneWdLxsYJ
	4gEvK/PbAfvGs7wwyCf51M+yV1adw9RAXqbTPisR1u6yHUUCuaERHTPESx0GpG6vrtsI+Q8vzNB
	tByjcIuZxVYDg32kiiFQZF9PnKt8aLEi8amyucUjfJ6TTKZmg4QLXahjGm/mrn4NpZCZ+fx8AWw
	XagTJy4DgsKi+fZ/JZs1Y+U8gIPOpTyWtbNzbjMg8ctswYkaOomNqjpOz1qSDyrwNUWZvYG3VXe
	YAXglLee+kM8gktPBHXLJ73Q3nG41Av5UM9NoZ8fe+TyMzKxZI588sBrzZSOhyWgS9ha4fkrkU1
	YhLfK8JVGw57S+1aC+nIk9DID2WPx3HhG+CuC9NeV4jAI6Map0eSIKjnSghkxVMRxfhhrSF8edf
	GZHVvvk8tQ1ulDTuQTKB72qpBce3o0+7UBsFRCBno0sKpCLqfLm+g5/voFKi5v/j8ulRco40aSQ
	eYk2JcHe8ZQTK+cTfeXEwduRB/M1QqIPOg2nw8UrsUel10pnSjpNSd/gv+icZNq8Ow==
X-Received: by 2002:a05:7301:7306:b0:366:dbf9:32bd with SMTP id 5a478bee46e88-36a4235f4a1mr2488003eec.9.1793348639867;
        Fri, 30 Oct 2026 01:23:59 -0700 (PDT)
Received: from chitransh.. ([106.221.205.232])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a77c0dsm5999986eec.26.2026.10.30.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:23:59 -0700 (PDT)
From: chitranshmandhaniya@gmail.com
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chitransh_Mandhaniya@dell.com,
	srinivas.pandruvada@linux.intel.com,
	david.e.box@linux.intel.com,
	irenic.rajneesh@gmail.com,
	qipeng.zha@intel.com
Subject: [PATCH 4/8] platform/x86: crystal_cove_charger: switch to devm_mutex_init()
Date: Fri, 30 Oct 2026 13:52:58 +0530
Message-ID: <20261030082303.284271-5-chitranshmandhaniya@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
References: <20261030082303.284271-1-chitranshmandhaniya@gmail.com>
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

From: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>

Replace mutex_init() with devm_mutex_init() so the mutex is
automatically destroyed on driver removal via devres.  The driver was
missing a mutex_destroy() call on the teardown path.

Signed-off-by: Chitransh Mandhaniya <Chitransh_Mandhaniya@dell.com>
---
 drivers/platform/x86/intel/crystal_cove_charger.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
index 425c7eb32442..8ecfec2c8369 100644
--- a/drivers/platform/x86/intel/crystal_cove_charger.c
+++ b/drivers/platform/x86/intel/crystal_cove_charger.c
@@ -94,7 +94,9 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	charger->regmap = pmic->regmap;
-	mutex_init(&charger->buslock);
+	ret = devm_mutex_init(&pdev->dev, &charger->buslock);
+	if (ret)
+		return ret;
 
 	charger->irq = platform_get_irq(pdev, 0);
 	if (charger->irq < 0)
-- 
2.43.0

