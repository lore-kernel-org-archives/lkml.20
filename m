Received: from mail-wr2-f23.google.com (mail-wr2-f23.google.com [74.125.225.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AFC4FECF8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 22:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790376604; cv=none; b=Ny0v25+JGnHlphUe+dwCeDz11n9c1D/arQRt55HljU2VSL6obeF2y3a+BA4Uyz/vUD/ex6yYOnVAgH7bjBl+chA02V6+Bx/E2gBWz/dlSnYSuwhy4oBpds+W+EWjA+UN5dW0x3o1Uv0Lg+scbNfKMqIOvxA1+95RtymU6BKv7uU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790376604; c=relaxed/simple;
	bh=wZL92ga+oBf0yLGmXmHDNy7Ob78EaoiXMloI0hnmArk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2ObugELYH01egwxTWIv9XIcMJ5hleY95YfuqWZmT2ds+b4FjBg6/7od0gsANJ3Ow0siU5FwgdTZ6Jhw82GWZWkJiQ4uPqaaVFkDe/byvYVEV0WLkkqPWg4C8uy9LLF4l9ezTcDytHhZ6LvmzhOKUcIySxzXIUlqruansH+GcpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dYjSRJvh; arc=none smtp.client-ip=74.125.225.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dYjSRJvh"
Received: by mail-wr2-f23.google.com with SMTP id ffacd0b85a97d-4888598e4f9so220890f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Sep 2026 15:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790376601; x=1790981401; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oOKPsClwaHbDld3hOUz+HmigKJvjjQBZ7IwdPyo7ZHY=;
        b=dYjSRJvh6dfd3Da9A7/OhhTAFZIY8U2apbvZoPhp6u3GYLiR7kaQ5uEY6T8BjsBbbM
         yKCBH+WQ6pNYSQBMb/fBN6VYe/krMr0VttYZphMjny166IuT7p9hgpgnFbZSUxX1AFjO
         jDsMwn3zLnDl4zG9o35/87aTUgz0ZANQYvKg/wPKo4fs/70HsaUpAfN6jS4AoC8vl7+h
         oJXp+aSOnvshDx6363aTfJUbZHI7+x7TbOwSKnSD91uf6gIWmPQ3zmkeJb5IWejCfmd6
         Opc3q18nXHOZgWBU+We66eoWTuVHhjWA1pcAz+fRHr3xqpiluXKd9eG0PQt8XKPHrIot
         K2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790376601; x=1790981401;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oOKPsClwaHbDld3hOUz+HmigKJvjjQBZ7IwdPyo7ZHY=;
        b=qTbjz1Tbzv++Co/8q1az/Fr7pNvaRppiwnv4LJl1JY20uDOrKf8Sp2DhBK/czJVsCb
         PbicQ2sZlRvlYE6sVr4ewQXvuc9XhBJ0QlWpxXv1eMiQ2sfsNO5c6XhKmFmLcB9mW4PF
         tqblQB3p1BS3kciJhGKs2O2E3+M0g7zypVDP1SwvmA36R0HwqYYd3vM+dpt5YMlGrwlm
         K+9kLU+PU/mymFSoVMwISUh3lHM7vAIIoI2wwTFyEsQcKb8BXjYj7hN9itAtaFNs5dSU
         673AsGoj8e/vjgOUosyOgMd30Za8JJPo8nSU/4JWsGVWApGUQ0OJZ4/QeJcE8h/ZaddP
         y99w==
X-Forwarded-Encrypted: i=1; AKwUvBwRrd8U7U8XQkrbQ+oiHPzFQhJBxgb8FMmCJvl4k7yigsxiBmvOOZNXdRAsLpfmfTdY1hwiGSwquDY2c+w=@vger.kernel.org
X-Gm-Message-State: AFuF++lbVC1tVUt1Mbsnj/YnlesVkgQ0vaT7IzdivK4SgSMDz090JBua
	mjGEMk9h8TfvYK4BAWIp5HiBHs2HUPTRybB6Dcm46GyzCuLCddXozU9W
X-Gm-Gg: AYBFou2OIZpW1HbL6iQbAd22QV8dABavLwF19yrZ2gd+jXo34ELLCnV4SZdXo3Kuvms
	oL9qK6LctraTFTagjwdwapFXdzkGim7JJYM6VEJyp7+10Y77JSUtcfXsU+6zyAXc/+iidUI8R6I
	HakwZSD+kt/SA5AXG5rkXaQ5UBRXggRv6F5rJRGJZWfpCCbsYS1hLxE4VwebKpwLM1ch29c+1Pr
	dIJk2kLg5my/K6jJFdtwCbJ1adl+H7CwDBZG/Hcv5MTgUycYU0A099tcfU/ZHwWGPjBn0Vp0Qp6
	hTJ3lQlZtvQnVflfnjV4oX1on3vIIvDjwhtP59cN10jgsaE+92xLkMEhmK6Tl/7Mgwj3HnP1HSt
	oqOqvPYfb37KPy5HK91NmpJYjMDUGKIKNrGx1YFp7HFOfVB1YzJQDk+DNRoCtu4N/+FwGQzcM1p
	z1g+88E0DjYWbVK/a0T7qYXmsdGFDsAPcmp1ywhPvurbMsovPPCWLpR0njCy1jeGrvvEf3tNt4M
	ELpDVVlTR7XfTCL+/Nq5HVw0ZPY8mWMWE1pasyqNHCW08oTtp/03KFQMGgudfyZ/zIK7tfdzAC/
	CECElx3w
X-Received: by 2002:a05:6000:4912:b0:488:8020:2454 with SMTP id ffacd0b85a97d-4888020286fmr6561405f8f.34.1790376601210;
        Fri, 25 Sep 2026 15:50:01 -0700 (PDT)
Received: from iku.Home ([2a06:5906:61b:2d00:8c30:a558:27e2:6b14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm10376145f8f.19.2026.09.25.15.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 15:50:00 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg+renesas@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] soc: renesas: Kconfig: Enable ICU support for RZ/G3E and RZ/V2N
Date: Fri, 25 Sep 2026 23:49:27 +0100
Message-ID: <20260925224927.14951-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Explicitly select the RZ/V2H ICU driver for RZ/G3E and RZ/V2N, as GPIO and
IRQ interrupts are routed through the ICU block on these SoCs.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/soc/renesas/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 5445fba0879d..a63df28df3b5 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -418,6 +418,7 @@ config ARCH_R9A09G011
 config ARCH_R9A09G047
 	bool "ARM64 Platform support for R9A09G047 (RZ/G3E)"
 	default y if ARCH_RENESAS
+	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G047
 	help
 	  This enables support for the Renesas RZ/G3E SoC variants.
@@ -425,6 +426,7 @@ config ARCH_R9A09G047
 config ARCH_R9A09G056
 	bool "ARM64 Platform support for R9A09G056 (RZ/V2N)"
 	default y if ARCH_RENESAS
+	select RENESAS_RZV2H_ICU
 	select SYS_R9A09G056
 	help
 	  This enables support for the Renesas RZ/V2N SoC variants.
-- 
2.43.0

