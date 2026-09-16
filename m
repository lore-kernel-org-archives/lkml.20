Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B53472F74
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 22:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789599172; cv=none; b=cgrFK/MSicMa9KThEn9iSBfXsn77u+YlXq7NwSmTKIhhcoIv/FWbWyTMQ8NiJvSVaB8E04iwuWZ+p9nl7bZEg6gGtfTDlR7LVB7VbnEds70xALff9rBITVHRT6BtVKHhRnUNyIKSrLEXEqGQJo/eCOM88NycbUNf1wD2re2xr/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789599172; c=relaxed/simple;
	bh=arXrzXw1ZVNnEqRDCo54MSPhISa4DKc9+YJ0ppSUDZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NoeTXpLVtPKyPY8Eu+Bd9OWDR0LjWv2quYkz78X6zJXnkrCkkI7dSaYHffu8pMqJZ+YvuSOPuutw7lf2U7b80yBWKUkcFmjLgd6edH8xLAWdqLWC+/vJD4dCxoV2F55dvNCw2fPz2XqALc/OJ34mMBiAtrFf+eRgQKyFgKeKXH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0HXXFIz; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0HXXFIz"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-85469e211a3so163435b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 15:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789599163; x=1790203963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcCVCZZIuCZjQ/QMXzHP9HwhT/qabKv1gdd0PxfrlCk=;
        b=B0HXXFIzHoRQfsOkjagOgQnzOD5eKJauqqcAoanm3c0TT/BHTAnMfmljIIinMzKggy
         WiAEZoMBhDTkJPoqWcsCz5Ua6al6hF+thvQyqyzXvU7YxcYoqMqW4CrShywunBp7IcwD
         jU6sA6qNeZZE7ZD9XCq4NLpKEUWlFX72G2Y4xz6MsMuLMFLuZjbgu0MFUAhdgolYpbe8
         r6wGqCSRiNSx39mLT6FKD/OnU0Fby4j+StghVBzsfenqHB3AhceKU8oBjDYgQEU6XM/6
         jX55+gAKgxQzmr2U6mods7zybSV4oh0x+HqhvdsHQdPMy5NVqvD4KdiX10Rle7A3xtEa
         BdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789599163; x=1790203963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcCVCZZIuCZjQ/QMXzHP9HwhT/qabKv1gdd0PxfrlCk=;
        b=gl50hMB3RFkObnLmhIeM5u0bBjV3bSC70sMQbh/Gg6j69vS16wFKCGvF3nXfleuwuT
         Tm9n0Did2FKWUi+1aiABGkbWYgpFjKWVeyh0uSmwSLPljq04ASvUaeb32rzWxWI6XJc4
         Bt/rZZGxELQhn8EP8Lae1IEHsMsPrYLf1POIyiaHSNkwz5RN0jNjVQXz6btqwhcs+8Nj
         j0k8T05AWywyyCZwjMURmFmdFbqNsLAu/75CN85sqaYOweALQDnQynncCFsvdih2sEA2
         AXpHVnppGFPGmCxVyW0Dr9E9YQCBqMeQKbzCC+2MWNTo+PfrjeypXi5QSF2aSzl/vehZ
         o4bw==
X-Forwarded-Encrypted: i=1; AKwUvBxIOQ8tngkbCxiPIaVxADi80F/tenZlaFtwX9+0YIT/w4jIS9ZOTYshnIatFnzWbeD2cllbq9MSt+N+PrE=@vger.kernel.org
X-Gm-Message-State: AFuF++kyvlVOvkRRySv64u4epNunfkmzQ55QaQuaBIGIp5rtzN9LIEDw
	Map2jpKAu0a/S13HHsJIbIA/eAkQIwT13gbNzzesmd33QPoMW5qJ5FnV
X-Gm-Gg: AYBFou3g1Jh2N8uf6A5Uae9JAihld4vRoA6wdK1SGrpcFLRp0tchRghfo28xAj5r659
	a0oz6HLKZcujo8x3qKX0kVQwhvoIA++yMSv2lAzYj6OJGHDeaI5cdfzB9j2AQWMSWIlwX5E0Ok8
	4a8vQks3cWk3Ug09V5b0foeyAG9gpTUTBDndUhkaynY8jgZE4jgwrHRLioyu2NQc7DTcQefV4Km
	e7k/Gd3wuGTgvmVJLUwJ6X9rOye8LnmzUs98J5NjBSqcLFGHrMnJcNTS6hrkSZ7Bw72/qH+2UBT
	G9i2gk1+kebv4wzE80FhEhSoY8eBUoWRtftNMpZ2V0TiPmPOAX7oobhqQHmVTeL8hWbOfBgJYXV
	xMarr/5su07ctXUH3JX6bfznBBh2d3p8Sf5krwcc28XmAriebjtOj+yQ9++M+GUydaT+lG+0uOu
	O01HxNmx196ALZ3ut3l20/c5BFdLBDEEzwO8xbSETvllqTzzlasJTSP/rGM/7lryF8IqS8LjdL1
	vpAaoTLcegnj4pwGjHqW62ZO6KS9X4A3v+v9z/2Enq6M/1RZk0ff54kIAZn6V8PJZBnKfUsduxV
	89TqZhmARHN1tyEsot/zrTpTcYzc+daeIGJ++nIMXJnwH7Vq
X-Received: by 2002:a05:6a00:4613:b0:857:72f8:dc98 with SMTP id d2e1a72fcca58-8723b87e91bmr8819108b3a.25.1789599163494;
        Wed, 16 Sep 2026 15:52:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-871febdd299sm1899056b3a.2.2026.09.16.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 15:52:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: dmaengine@vger.kernel.org
Cc: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] dmaengine: ste_dma40: allow COMPILE_TEST
Date: Wed, 16 Sep 2026 15:52:41 -0700
Message-ID: <20260916225241.280606-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver only uses portable kernel APIs and AMBA bit-field macros from
<linux/amba/bus.h>. Allow building on other architectures via
COMPILE_TEST for wider compile coverage.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/dma/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
index ae6a682c9f76..f16bd4059d84 100644
--- a/drivers/dma/Kconfig
+++ b/drivers/dma/Kconfig
@@ -559,7 +559,7 @@ config SOPHGO_CV1800B_DMAMUX
 
 config STE_DMA40
 	bool "ST-Ericsson DMA40 support"
-	depends on ARCH_U8500
+	depends on ARCH_U8500 || COMPILE_TEST
 	select DMA_ENGINE
 	select SRAM
 	help
-- 
2.55.0

