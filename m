Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E12A3C456F
	for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790545430; cv=none; b=sQhLum9a3wKmTd2jzEA0NKjM6C8k7ooUtS1HTcCFcZlxhdhYEL9gqzHZAmo3Uh2MrLMeb8PLa12v6J5W5TsB4qGc9MY/DUg6TYeohljgGYwrJfXYiWXjtyt/DQbQKi9gJZQP38SRTjm3eAzUD7yduTcv12Us4Bxl1H3F947Ndk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790545430; c=relaxed/simple;
	bh=+7B04P3KtWGS5Yj2YGU8kpSoOlbeBAUVoQM7IwEIbXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZjVTULZSwyrTlYddYd0Vxs9VRIkTNHMhj6EJMWZHyvKpFu9/7rWF31qI8v+yBNjEeAVo2lnkEkk4h0SFF75wVRXYcWmoEgOxPhcwwSrCSQ9yENpzxE6SaaCuBh5z9sRUohPMUFRlY+iWS9Mw9VBXk443cj/OsL5hqdVXnBLuTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HqIii8TZ; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HqIii8TZ"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2b40e4744eso173542666b.2
        for <linux-kernel@vger.kernel.org>; Sun, 27 Sep 2026 14:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790545427; x=1791150227; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hF4GBMeX+jM3tIEPITZKNJjLTuPGbNXnyD85O+h6i7I=;
        b=HqIii8TZUkSgI7m7b35EHBJ2kOdTa5ThBnOGuecUclb0zcMQjVHLffN75B6v8m2czt
         BmaEP9gWE97X37qnb6HaIhC0PTB8PwFxt6CYWXN775gE296LeCOORcnwYeQ7wEWPMWg8
         BZDrmyzB/1Ys+9ju/bfFmNdR0svmVtmv+X9ilsSdXdRGNuovwb7f+HJ4e1oit4HfBfk0
         TNazXWHAKyp4rXiaz6k4BPlGNQV4O4sUApgBKO3RmopfI+g8CIJ9Li6bS0G1gQHaT1RQ
         +bHKWHEtPmb9sGSiZeD7Edh2Nh1XwhIWNtL/YvGvvcTeOu1tlNo9+YVUqhQTj/4IXBpY
         Enbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790545427; x=1791150227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hF4GBMeX+jM3tIEPITZKNJjLTuPGbNXnyD85O+h6i7I=;
        b=Src71u/GX7BLqtF118ejXLkJyLoOBYS/IW/htknYO3aVm78l2iP7icBZqYwBFI4NS0
         Irt1OL8CrMBAYm4RxTSQerKQFDl5OMiMEVwG2dfMMsKCC29UM0cLv26p2c72aQA84/b8
         qPKteUmPZ5ZUU4mWPsXFMseWhyMNApa0CdTiQ1WrTrRBshseW32C2HSeNuMYNTzKxhIH
         EZ5o5JCFqD/fTo+L+vL7AyFovsDvsLE8Rim3wArbeOkTemA15t7Msr4aRyd5Hqn69mxX
         nfdD4AWCTv8P6kcskhlmnryFRC/8gP2AOEM1gqaf7fS/lKKchUpsNORNDcFt0oImgNLG
         NPWQ==
X-Forwarded-Encrypted: i=1; AKwUvBxS29jEkA6RmNw4LRbPSHsx0WznDFOf0plPHTB+D/4PwwAhXzjacUu+YAIkIw1ZRNMMWo0jsJKWoVkRml0=@vger.kernel.org
X-Gm-Message-State: AFuF++lXi0b+4PC9C0FrIsz0qqNfXa6YSoPYmNTPux5o0qo7/nat2VkS
	SBGr0bJOfMg8gPZ63NqMlWaHPcShXYSOIt+LIQ9H3WdoWIcKvdG7b+gu
X-Gm-Gg: AYBFou1DQ0C5jb1A9sxad9/HW1AtLNFjm8o7D16Bj5YOph4MYts3SmcuP9RyPib8v1u
	qcFldSlrePekmLFOwiz9i4FzzR5djVBnPMgFLWoyBpS9iadFCqMhMJFT/pu6m+KOCKEicPzAiTG
	3ae2Hq1hBVLfWTCOIygXuyVkSwQ8jh1zVZFRxI0GWIy0/t9+waB3tFQUOeHqHL7WBbR+YPO4BvD
	irSHJdb+HeaJ8taE5D6MNVvBVv2ycx7rsKkYtvYx0SfMyAp3LvZprEr3sVxWpjpUhpRfn4AiXU9
	6KfOlt2mrQv/KdRaD7m/bDJcNl1zsO5MkJT4r6jIkC/s+XNovFPW64xTdgDURU6O9HewnQv+OTZ
	v/s+q5BqHjvj3q552l5N3S0Z12TXGDdzMIBgAIZDf2uLLIVXOamOvmqCEY3iKKPyAxVLZpk1rVl
	c4qfPCYsA6AvgNGmVER65A7wjtLVDHOcIzvaH4R0wXbJ5Oy9g7uocie3s5ff3Umc4/vX/O+D6ZM
	Bf31DSdB3uiiTX/l0ziTHIxeuAgcPp/cEffHaJe
X-Received: by 2002:a17:907:8e11:b0:c2d:c739:30e1 with SMTP id a640c23a62f3a-c2dc7393f1bmr204864966b.32.1790545426573;
        Sun, 27 Sep 2026 14:43:46 -0700 (PDT)
Received: from buildhost.darklands.se ([2001:9b1:ff:d701:51eb:176f:63d9:53f8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2ae757b9c1sm376091866b.33.2026.09.27.14.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:43:45 -0700 (PDT)
From: Magnus Lindholm <linmag7@gmail.com>
To: davem@davemloft.net,
	andreas@gaisler.com
Cc: sam@ravnborg.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linmag7@gmail.com
Subject: [PATCH v4 2/6] sparc32: use memblock to find available system memory
Date: Sun, 27 Sep 2026 23:43:13 +0200
Message-ID: <20260927214334.886582-3-linmag7@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260927214334.886582-1-linmag7@gmail.com>
References: <20260927214334.886582-1-linmag7@gmail.com>
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
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Magnus Lindholm <linmag7@gmail.com>
---
 arch/sparc/mm/srmmu.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 110e2f248c60..7b57a10c961f 100644
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

