Received: from mail-wr2-f34.google.com (mail-wr2-f34.google.com [74.125.225.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CFFF3C3F64
	for <linux-kernel@vger.kernel.org>; Sun,  4 Oct 2026 16:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791130341; cv=none; b=MVJ7t7PlOuxOQRWZRSEmcxyOJB8U6z/R/RY+QS4mnT87urYiNuqSRnnL/Be/67cJmrOTJw3JnFYPZsdTOmVboCmysG4AXkUV6dArJ2y6XEqF04+hhIGXimEmrrQVbaJGd0l+AwdJEn7BZgReIIDovFEoCkdSNwDS/Yf4YWXtAJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791130341; c=relaxed/simple;
	bh=Un6VFoUzNIA1zX4fd2jPLpBAFCh31oplfjJyQkX958w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I3sFvCGBtVPffVEdXSiuM13aEvyH+2B2+uXHnCRGyDmCWGllZ1TlqKESQfrPLZD6sHQOvZZyOjxmGHG4I53Ioeo16sPlfoOW+1bC4unD0wYMzjaVXyzzXlIwb0A259SKD5UyFgC59eSnUvG4+HGMZBDPfrcvJAJ/81Q0BVXE9ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b/lvRLzL; arc=none smtp.client-ip=74.125.225.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b/lvRLzL"
Received: by mail-wr2-f34.google.com with SMTP id ffacd0b85a97d-48af9f88c95so293590f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 04 Oct 2026 09:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791130338; x=1791735138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
        b=b/lvRLzL9wY7KRlaEBGmSDQ+yerfsVZ7JIhMRbaxRg96hEI7dsAAu1+RnN+fHEKFXW
         pYaoDeeVnOqpeZDEij/giTi+B8s8Ics5gg3M5fuORxkdHX6a6f2OkjtQVIta+G+8rCYs
         ORR0IW8THHj9MfeKsJbtpgmXy5/kQppTgQQdXjiJHu5mnXbKg3JbCQMkIHR4x2Hox5m3
         GQbsgsFWiXx4aGgdcNuYBFdObuR75NRsqtPciF7HHePgVXMjevoZWiHLBULWVp+j5+EO
         HILBiFiYa2fSan08ed6zY4MkCflmMKmePZbGJZhAWEVSgyZ3xvuJTvqu67Xw366ESQEn
         pAww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791130338; x=1791735138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LHAtp8jh3tg8sZgSTrZofD//NCXqUDMaM03E6Cj5aZA=;
        b=UkzwVtzW8QDLbxgM665zW2HEbfd38u4s1rUrVHznGdM4DRVsfoHbhyEUaPObTbBUsa
         e62Y6pLWluYbB+GI4D27oF5xcgXM5FwGXhql679CWAmEx349ltfQdDY6czFjTfrLgubP
         LTwxblYFuGsIHcFXZmOjl/exzgXuY/i/iIvNJ/maYhKDLAGif/fjJgOY9WJbR+Ps0Q9h
         aaeiQQReG1HrSqTynyszYw0M+fAo8Mn3/tVjGJFu3OvdSQI1/QMrJXawSbruwsmA3y6Q
         3Ktz83RnA61qhHIF1DT6jG3K3iUInKUmr2Kr1/IUcs4A2IL1iqYGgG7IMQPmpEgm2kpS
         8Ixg==
X-Forwarded-Encrypted: i=1; AKwUvBxANgSGWBgrTADQ0PJA/xARyLeE6TQJAk2HgahoAw1JQWsOI3MXwWl+WU9CC5ryesFTfsu+HJUSvE1dEZM=@vger.kernel.org
X-Gm-Message-State: AFuF++kak+jgxucoJ4hNSq9V7J6Nru106fFsM2ZPbWxGZ8f9wtLtl/im
	YsgZCc8v6QtkvzfqwSTfuLXa4lfAY8xMAARZd+ZLfAvWdRiRWha+ueqU
X-Gm-Gg: AYBFou3+j+syfuaGw+i/5jBlDKfWD8qwBUa10dPdUcZZ4DWPDuwc0AIF07D28wtwEjr
	4feowJ0/wnOtN9fY4KMgzRA5rs1sKSrEG2L2s88na4MKO5sEjblecdO+lIvGbszd4S2/Y83Uk7f
	kr+cL2hRTZU/1IYUoXBmjpOvW+Tff2+9ZN1LCh3ToQM/Rmhix/eVGMUnkGSUKGMXKXRbxaC6qrk
	xk20zf4qPGO1cfX5IYrw9oH19OOLepQb8o2xnpsHrn8rZ6ZRMfl8Iruj0lCNInwhF/cLOvqrw3T
	CRna8n9LqHJwQO0BxDBnOOKFr7dCjepJQ3ZTBKdbmaFOEVXdRiJ9mbYnuBGWo9E4JaFXQk9bTX+
	lf78petAQQZh/OAzdIFMimLoDSYxErldRRd3AFdAPapOse2zr3Mikz/D2zrauW6lV75BLHVKnyI
	G0e/vvcIVRBF1ZY5AJMDym3bhPm3wulMXKLrfy7WM3y9p3VNW2ZDnTzDxxg6Ih0vj1xl/lkrcV6
	CtSoAVl7rSjZtzY4CX6iqWgju39puOGxgNNOw==
X-Received: by 2002:a05:600c:474e:b0:49f:fbad:29ae with SMTP id 5b1f17b1804b1-4a0275758a2mr164184985e9.17.1791130337513;
        Sun, 04 Oct 2026 09:12:17 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027725c6asm308438195e9.8.2026.10.04.09.12.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:12:17 -0700 (PDT)
From: IS20 Tomer Maimon <tmaimon77@gmail.com>
X-Google-Original-From: IS20 Tomer Maimon <tomer.maimon+nuvoton@nuvoton.com>
To: andrew@codeconstruct.com.au,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: openbmc@lists.ozlabs.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v10 1/6] arm64: dts: nuvoton: npcm845: Drop redundant timer clock-names
Date: Sun,  4 Oct 2026 19:11:46 +0300
Message-Id: <20261004161151.803563-2-tomer.maimon+nuvoton@nuvoton.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
References: <20261004161151.803563-1-tomer.maimon+nuvoton@nuvoton.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Tomer Maimon <tmaimon77@gmail.com>

The NPCM845 timer0 node references a single clock, but its clock-names
property is not described by the timer binding. Drop the undocumented
name so the DTS matches the binding.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
index 35fa206..ab8a01c 100644
--- a/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
+++ b/arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi
@@ -73,7 +73,6 @@
 				interrupts = <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x8000 0x1C>;
 				clocks = <&refclk>;
-				clock-names = "refclk";
 			};
 
 			serial0: serial@0 {
-- 
2.34.1

