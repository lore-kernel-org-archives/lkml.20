Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1672A3FCB10
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 06:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788763041; cv=none; b=Pf8xgUB1WRWkQOFq864oE4h058eVtLFnx29IW3kMgiOHQLChfC1aRD0cuwbiETF1+CZbb3AFx5HHDe/NbboMPx03CigyIBHIFmYnMoJUfhyEr5gfBugQri7kJ/QUJwWwI5/uqxItynQs9Z8sbOGSGdYrUiMrVrqfbeuMQmsJ8S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788763041; c=relaxed/simple;
	bh=VfXOymskWjliH7W5AKuapzYEj70Z9SmGq4OSMQOuDnw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWzYHAx6TNsbwQ2sOKdCRk0sftsrbWYiDARifc3LABideiNPLVz69Ip5xSkO5pGuT6XV8Kb9I70caY9OU3MxbsDxynPCgul+Cnb8g4zwT6owJ2TjKza1b6Z+1Znr62NnP4hA8CtcUZX8zznepAaPLlJD41Eet4Yxp7FsSrjfm3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfM4zCVE; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfM4zCVE"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-39647aa9d52so3146630a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Sep 2026 23:37:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788763039; x=1789367839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jDZ6oRwW/kw/814suAB5/ov64h9IKkzItyVBfUzYyT4=;
        b=MfM4zCVEph/ehYYMhT4GgOLAyADCtoHLT+kTZ+ipGe5h0cb2Shj+y+W4vmOOIVKdkt
         +J9WXHMgX/I1IiyroqoCPQY6NgjyaF33oxb/lXnzJg4FREjsAt55YPxR+Oon8Q8CFjic
         nLUQ8GCBnZCIJ8r77nESDq0WJbWXKqDFJjB5EvLfE64Ekohn+aVhnymQ2o60w8ASL/D8
         PyRAQC2du34Hgf9FCNCLIcDJYBQRl9utlEgT9+1pcLLzjLnjWaToSXOpRzw+sXEhLkIL
         s80QWiCn2klgiyJH7w8uZkjrMUiVQQVCnJ4gG2jT8rCuqF3+iy1TcrIcOs68TXBUCgzG
         134A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788763039; x=1789367839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jDZ6oRwW/kw/814suAB5/ov64h9IKkzItyVBfUzYyT4=;
        b=GpavTCKfByLouJO7YWcUgy7URSCDvhsWL7LeN74ByUW3O5tMETywLdVzdf1N9yfMht
         0qCLdpN8WSFkG3lNG1g23CS09Jv3KTsmg/FdKizPbVawKeZHkxZ580MzPes/iopYDXKD
         9mGocpRPfOYvy8GAfa0q2bvWxyHjgbBQuZNKetZBSwJZN6LBintcIX3tmwBZs2acdKx8
         krJmvvRbv8osCj2VDURKRzjDUUoN7BG3mQoAOkG7WD1DtFTXuSK6fxb/IFYo31gf8Lgj
         COcbk8Lo9iBcfHEM0AkEaCM6UfzaGGK2pUgTy/pomgMesl4SrJefO9aFPd4CZvnm9Vj4
         W1lw==
X-Forwarded-Encrypted: i=1; AKwUvByq3djQixUQ5e9yIzQLcUVGUXhXriPFpqYt0sx0tgpTku9aqeT4ZIdbcl0+EYotClqhDXWX3ePoAtLYFTg=@vger.kernel.org
X-Gm-Message-State: AFuF++nkK+EozD5a+pinbSBn9XI/Bmhp8v7/9S5XaBvf0FaUvLQ1YHhc
	w5DMgfbUwpnr3qC5ymnX2q1jOxOSl/8E0t5LCRVBmfDCfTFAQbWrtZuR
X-Gm-Gg: AYBFou0BRDX/X+9KPW3rECzyJ58a789lXcw/wL+f7E0+doNJ0O3XnwB4t8gDGXC5UY8
	9dBQabFuST52exNPoiTWJ6uUBORskv/R6g7m5i9tOzeoxFJ/Rm5hb6oDyWhVtKbF0VFZMGCHMnk
	yzB/f9QIoP6FIf/rKMzgZFy3fb/OSsq+MntAFdtEBbAk7WFVkrGztYj58Dgtb2RZOFhhaIa9j3B
	nyXngd9KMj2bER0bCx/VjFRqxyR4m6TinwG5+CNKmohrbVO1b08U1aO1Xb2Pkkgudo3cJtotrR2
	5kwXwbk2OLU4KV8DWOx/DEvnAhiCpsbFHyw1XkeJA2Nz4wZmfYgOK1KBDs6RLG4w1GYWqjHDFkI
	vUaNS6YXvwjx1FKdqCIAB8cevxf/UvrN1GOSECIs8E2eFppUO71gHeohak9wqxuFHAZkWwf1vvT
	Tbzl6KN72gR3uVW187kn7zpUbqjw4j9ViWWZmIv97zNSUv5emHAFQxhXnjN+RtDdDGuxrGJ3apI
	GlU4y+q2d2wjw==
X-Received: by 2002:a17:90b:518c:b0:38f:cfe2:fd3a with SMTP id 98e67ed59e1d1-39b0865357bmr28966580a91.15.1788763039344;
        Sun, 06 Sep 2026 23:37:19 -0700 (PDT)
Received: from volcano9f6e-hostos.amd.com ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b314cfcsm25325131eec.19.2026.09.06.23.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:37:19 -0700 (PDT)
From: Hemanth Selam <hemanth.selam@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>
Cc: linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: mach-omap2: fix typos in comments
Date: Mon,  7 Sep 2026 12:07:13 +0530
Message-ID: <20260907063713.25757-1-hemanth.selam@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix typos in comments, reported by scripts/checkpatch.pl using the
misspelling list in scripts/spelling.txt.  Only touches comments, no code
changes.

Assisted-by: Cursor:claude-opus-5
Signed-off-by: Hemanth Selam <hemanth.selam@gmail.com>
---
 arch/arm/mach-omap2/dma.c                   | 2 +-
 arch/arm/mach-omap2/powerdomains44xx_data.c | 2 +-
 arch/arm/mach-omap2/powerdomains54xx_data.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-omap2/dma.c b/arch/arm/mach-omap2/dma.c
index 830cd4e7eb44..cc10439eb856 100644
--- a/arch/arm/mach-omap2/dma.c
+++ b/arch/arm/mach-omap2/dma.c
@@ -118,7 +118,7 @@ static unsigned configure_dma_errata(void)
 	/*
 	 * Erratum ID: i378: OMAP2+: sDMA Channel is not disabled
 	 * after a transaction error.
-	 * Workaround: SW should explicitely disable the channel.
+	 * Workaround: SW should explicitly disable the channel.
 	 */
 	if (cpu_class_is_omap2())
 		SET_DMA_ERRATA(DMA_ERRATA_i378);
diff --git a/arch/arm/mach-omap2/powerdomains44xx_data.c b/arch/arm/mach-omap2/powerdomains44xx_data.c
index 37fd1a567094..ef801e5f3202 100644
--- a/arch/arm/mach-omap2/powerdomains44xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains44xx_data.c
@@ -258,7 +258,7 @@ static struct powerdomain cam_44xx_pwrdm = {
 	.flags		  = PWRDM_HAS_LOWPOWERSTATECHANGE,
 };
 
-/* l3init_44xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_44xx_pwrdm: L3 initiators pheripherals power domain  */
 static struct powerdomain l3init_44xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.voltdm		  = { .name = "core" },
diff --git a/arch/arm/mach-omap2/powerdomains54xx_data.c b/arch/arm/mach-omap2/powerdomains54xx_data.c
index 5506da2ceaff..8c8b5c0ac216 100644
--- a/arch/arm/mach-omap2/powerdomains54xx_data.c
+++ b/arch/arm/mach-omap2/powerdomains54xx_data.c
@@ -216,7 +216,7 @@ static struct powerdomain cam_54xx_pwrdm = {
 	.flags		  = PWRDM_HAS_LOWPOWERSTATECHANGE,
 };
 
-/* l3init_54xx_pwrdm: L3 initators pheripherals power domain  */
+/* l3init_54xx_pwrdm: L3 initiators pheripherals power domain  */
 static struct powerdomain l3init_54xx_pwrdm = {
 	.name		  = "l3init_pwrdm",
 	.voltdm		  = { .name = "core" },
-- 
2.48.1

