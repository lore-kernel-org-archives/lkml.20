Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3F2285CAE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 14:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787842502; cv=none; b=aQQcNow4Ucckyw4AqmghANMuj2rSsXChUtLc3wSjSXw8gildKfsC8keDQ73MDrGWnL3bsDSahdBtSpMOVBAVHmLkPJuYZjX+ugSOvSch8kY0RGQutHQamTvPSWPfAfOy6TSbSn7BgnGbKeED3qEjEy61np8d/QRG57d31FQzmkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787842502; c=relaxed/simple;
	bh=PrK+ZTBPp9oMQZepAYrrwk/bXLxCzFuwkXY7dxFh4D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gr+49UoEEYumYRpP2nUKsV9uvmEPinET72iwtPDugwVwmHON2pCivNliHfrYTFA9GCrSQNY/AzZs5DzC4AE1UfhaGUtw+AdzQgKpVJXXyE8U01q4cJ5p1ifJJGydSUs76dtb4mhyBXabAZi9SsHxSOFWBe/aG/qQ7olmASWjkAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GY/UmWFr; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GY/UmWFr"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2d6f55a7089so27780965ad.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 07:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787842494; x=1788447294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z0BquGYPn2o69A57j1S92QvXaMtH50+KXNysShZUBXQ=;
        b=GY/UmWFr6bLIAXt98w9MRX63UrdBafAR/7f0ceRG5uMHGwbB3Xeru4DBEvEEixWyMs
         P9EoW7x0lQOkO7PxqoA108Hno1jaIohBHQfyRfOxp7QeSBfXDDQLrO+xMU2trwVxTH7z
         J4sU9jFs90Ce6IAJBgUSXiUpCe0qLMxr8xqjGCaIss2+2UIRnZjpJ3F1vyvS74oK4djd
         Mx098sbJIZULFYf/w17BGT78Mlig7Va7zvrsq1JpaZD3oDvImcbxnsc/rErKP4uLMuPD
         FYM430C1rHQfZj4qAZlf0Xfm3wg9X77ULVgMklcrHqbZjE/Kmqdt4Zp2t8KfMFWIeg/9
         tj4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787842494; x=1788447294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=z0BquGYPn2o69A57j1S92QvXaMtH50+KXNysShZUBXQ=;
        b=PH5JYEVV6KpD7ZtENABuHr8N+dN5l17z4jYIPiVwcJX5dnzKKTI3fFDJB9cVfSboXr
         dbbwYZGPc2TlrX05RmEGMJDZ64d3ijnjVZtHSRZGaSBJZQb4eAzsRWpQP4eK1hei4dKM
         KLZgwNcL0unVPDZQfl69HfKh2ox7sT5g9NyZfse/olHlM9d56osMFFlfxNNe1rvpXPW0
         4g38i9XWYPdyQUYwrYn3GBtJl0Cyj5OkrF5pZUox5SLSo3aRirwt4EGG0erIi6hqEag6
         i1rEI2rosGjkKT2CXuzGcrCAF9K80pZD+RTdqHXZW3fCSRlRMn8sL4l+/7EVpVM1B8Kx
         ib7g==
X-Gm-Message-State: AFuF++kwMj7uuFDcCnyaBhDEl23aA8kk0Ww+F8Ilkm2GI61YYUFAJvzX
	M9cXNfXYS+QidjnfhYJsuHT21My4ESJtuqau2tcpRM0d8pmipjrMTcRR
X-Gm-Gg: AR+sD10tS3HNSIMr1RFNPKuvYU03sh5L23LefXvlD9TTApQKv+sQFUJguerEgu35w6K
	rWJUcyP2EZ+oBtdoAXuIWEfMKKZaWLqSREylVtMHu8mjSVyt1k1y5OA70ZR35syk8vRfayzu25U
	2qIfbiLCSOrmg1fT3qndNEL36fYwuVHkog13+HtpVG9749IB+d4s2YLxFMRhYo3rEnhDYOUY2tF
	4Hoh+BejeovA6ONKMr7jxqPzBNDoD6ME1Bolm0aE5ej1rEhkCqTgkJWwGSftD8nqUh2HWbt5hwn
	R6muW/BTg4U0DFr/JEl84L7StTiPDTeDYRkjoQeFnPskWC2udpC3BGGsSLY8PqXSg3BFW1INIlN
	BtzTX/YVhHvWjl9U4IlXLbCyTbdbQ24++ByyloFPcenVfgA/DY7g122iCCv8vi92THdeXszMsSe
	fIymoKm2/BAkgCVP1A9DcaODlGXoy+eA5nP4VK+Otb7yWYEwb5FvNI9BQ=
X-Received: by 2002:a17:903:1ae8:b0:2d6:f3f0:3e7a with SMTP id d9443c01a7336-2d707957143mr289849535ad.3.1787842494167;
        Thu, 27 Aug 2026 07:54:54 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d704b9f555sm18725405ad.40.2026.08.27.07.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 07:54:52 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>
Cc: linux-kernel@vger.kernel.org,
	sparclinux@vger.kernel.org
Subject: [PATCH 2/2] sparc32: remove redundant memset in srmmu_nocache_init()
Date: Thu, 27 Aug 2026 23:54:34 +0900
Message-ID: <20260827145437.490605-3-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827145437.490605-1-ekffu200098@gmail.com>
References: <20260827145437.490605-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblock_alloc_or_panic() returns zeroed memory, so the memset after
the allocation is redundant.

No functional change.

Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
---
 arch/sparc/mm/srmmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/sparc/mm/srmmu.c b/arch/sparc/mm/srmmu.c
index 9a74902ad181..f9a92a07a255 100644
--- a/arch/sparc/mm/srmmu.c
+++ b/arch/sparc/mm/srmmu.c
@@ -279,7 +279,6 @@ static void __init srmmu_nocache_init(void)
 
 	srmmu_nocache_pool = memblock_alloc_or_panic(srmmu_nocache_size,
 					    SRMMU_NOCACHE_ALIGN_MAX);
-	memset(srmmu_nocache_pool, 0, srmmu_nocache_size);
 
 	srmmu_nocache_bitmap =
 		memblock_alloc_or_panic(BITS_TO_LONGS(bitmap_bits) * sizeof(long),
-- 
2.43.0

