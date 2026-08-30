Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B350624293C
	for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 12:08:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788091683; cv=none; b=dkY1DSTj//R80cgXapk1hLKM0AC981vofOg3B+MNmp3J57JWNichcoXF4XErIuifFVTvRuOX6wh8+c4H2c2uYya6488T1SrNj3XHaWU4YZfZnNDRBOEYhncX/dTCLPwZvNs6/byQvkU0qSgwTnQ9hWko22Vr0/h3bnTyXg+BUNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788091683; c=relaxed/simple;
	bh=kBYbgY9C1IVSMpDCAy1CI3kRgaJc78wxHYafgcraeKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qJwxoDkWDae0Uw/TVqcWrhfs1xHOwZpKAVYkLmzbS0yHz5Hi7sEf3mBTktyetKZHpfYPfb6AXvuzpMtqHCazGs4DXSeNtENaQEfBPiJlJmtsl+uKpRU5GOv0LMopj5ZKinhdiM/MiyhUFYHuJDxTUjgBYFS4oZVJ2LaB3BOExlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZMKFqJt; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZMKFqJt"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c1712a04ddaso407690966b.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Aug 2026 05:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788091680; x=1788696480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7o67oyyTyEc09pnUJGRRIXfdxc355uJN1B7XMFhIUSM=;
        b=EZMKFqJtQmOB8gT4GU5ZCwQFZUrkm/BDpyWV3b3WTfleh2sj+Yile9pGGXq2LF8ebo
         F1zlMGUfiP+08hv1dmaGR28BQHFbkPAogwtlNrN1KykSFx6n/zO6rTTfTDbRunTh4cWK
         Hij2eweYEnB0PVLVppoy9cbhukOYGOQNyIr3UBxWn2vBCZz3cCAOEl/0W/SO+/R9V2JS
         6cjiGE6oDq8J1dSWy9h8IGSfRhfoP3bGCiMP/B2ZbCtIZUlIJpOCvC5C329mkiSzN4dj
         RUti3J0btPhsTO10EK7Oi+yr8XJ9QBUDf0mFxGpn91fPmsXyUz/pQcWCEWQBdrH2If14
         pYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788091680; x=1788696480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7o67oyyTyEc09pnUJGRRIXfdxc355uJN1B7XMFhIUSM=;
        b=JPakrA1QqOyOd337WdpsxPJVgRHgtQJVU9g8El4dbbBluwpPRb3b9AJyJzAgHPvcCy
         ctuJFR1xxFoqWJPswaHLRo69kPXy5eXajC3PMErzOyj8d9VV5BsWcaM4VNK6bB7Y0YVR
         /RpTNLL2MHtgBrNcT9KY3YMshGt6dmQh5PCThOFID6vPQPWDFikOh0pqEo5zf67/u1Rr
         XLoa2TsfZ5v8xwxVIL2pI7EX/wxPb6owJ8BNZPkRA9AWGIVysdn5GZawo+bdf5o9t3zY
         e/ahg2kHF5KIqElN2zxqQDmi0AXppLO1JIXQsVeJ53weLndWhzG4nozHJDuJwVGNPcBH
         k4Xw==
X-Forwarded-Encrypted: i=1; AHgh+RoDX0HTvBV4dwg0H6AQZjw8uxfUn0odARrkR40uZPwTiE1A8DKDlgs2Gl+qpnhhX+kAs5BFFT9762pqxcw=@vger.kernel.org
X-Gm-Message-State: AFuF++mlvU86ajk9pkLtt+2j8uKwqro1UkutLHqa4Z3R0/v3bzjFaHf8
	Yr/Az3ILxehkGJNOsXCt5K+5WdxMfFimTTGoeJLpaGoYz/8EgQkxIsuE
X-Gm-Gg: AR+sD10Q0EjO1P0KSEOJATrWiviz8Kl1npjeJ+RS6EZKbt+2od8Yc2Fhf37kon8PXQm
	nnG1xXmkcNAoWq1yCBYBqwMOtqc/2vOkOB70WzmxYUpv7BO3Z5le/J7feKaETXujGDLPWSD8CAc
	hS8thTjPyi202GqVtxYLMmSXgL7ygMl3AhGSMJMSpmd0MqzVG2Z/VE81FBHxK+8OyL/lI0NMIX+
	mBiWxTTGSOgC36ED19LK4EFO7pILt3QA8d37IZgJWp0xErmeEl0sBuPBeVhZmvmM+HtfwGpXl70
	2yp66Gg+o5zPSOitXF9gJHaoVT0s1OPDqZonEdg2nZ2SW3X1KO306H/4t3xBsBT/MGzBiwob/uS
	MRaA3ZR998R3QZDfPs9TMLKLCTACQxkbvfrsFa/7yB+bQZ1TJxihAAOy3pN77aabYSgV/vs5HNG
	e77g/+HZYbk+8oVqKuC9ThovvuvGqdKs+BSuATn+DTVoDLn/25Z9yVfyhVG4OiRft2MP1jHx7IR
	AHhW8bjXn/7ToezJnU22IB4M4MJBb8f51ZFOUPHgg==
X-Received: by 2002:a17:907:c01c:b0:c21:382e:9a38 with SMTP id a640c23a62f3a-c2556c18e20mr1323915266b.2.1788091679662;
        Sun, 30 Aug 2026 05:07:59 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c255ee09eb6sm304287966b.10.2026.08.30.05.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 05:07:59 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: sparclinux@vger.kernel.org
Cc: davem@davemloft.net,
	andreas@gaisler.com,
	linux-kernel@vger.kernel.org,
	sam@ravnborg.org,
	glaubitz@physik.fu-berlin.de,
	Magnus Lindholm <linmag7@gmail.com>
Subject: [PATCH v2 2/6] sparc32: use memblock to find available system memory
Date: Sun, 30 Aug 2026 14:06:41 +0200
Message-ID: <20260830120742.20950-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260830120742.20950-1-linmag7@gmail.com>
References: <20260830120742.20950-1-linmag7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SRMMU nocache pool is sized after memblock has been populated. Use
memblock_phys_mem_size() instead of summing the private sp_banks array.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
---
 arch/sparc/mm/srmmu.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 483235458d69..3029527a5a9f 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -226,25 +226,13 @@ void srmmu_free_nocache(void *addr, int size)
 static void srmmu_early_allocate_ptable_skeleton(unsigned long start,
 						 unsigned long end);
 
-/* Return how much physical memory we have.  */
-static unsigned long __init probe_memory(void)
-{
-	unsigned long total = 0;
-	int i;
-
-	for (i = 0; sp_banks[i].num_bytes; i++)
-		total += sp_banks[i].num_bytes;
-
-	return total;
-}
-
 /*
  * Reserve nocache dynamically proportionally to the amount of
  * system RAM. -- Tomas Szepe <szepe@pinerecords.com>, June 2002
  */
 static void __init srmmu_nocache_calcsize(void)
 {
-	unsigned long sysmemavail = probe_memory() / 1024;
+	unsigned long sysmemavail = memblock_phys_mem_size() / 1024;
 	int srmmu_nocache_npages;
 
 	srmmu_nocache_npages =
-- 
2.43.0

