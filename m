Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792509711;
	b=dv2pv6yTDUUIjiCZ890XDcgVe632q5BiHa/HNov0Fo1NG8EYKvy6ocUWbDN3b0bk0Wz7
	 QcKNcJhUj6g6nTnsZGIzlubwOY0y3tcl1BAv/jDQ97Yyn8UKxWd4LtTZ+SNPHf/UOwplk
	 SiOmEZKJo4aipm1HKsZpRH8hCm5Vx6mISHNjL97WY4JuZcHiYscTHYskSNDomuzYD18Sq
	 AE45wF+1uiE5JUYY5uStpuHh8Xp+JNqXhzT80KuOYMb4wwT0thboRYmTrvXs6BG7X0lwg
	 lES6sUBKQCCaXLM/ShQ84IwB7HBRcqxO6S+ahulcu8sai6gho010cZkpvjUi+cpBrIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792509711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1seIWp3ctG+7IR0lg6vkqmMZtzQMv2ZC559JhpGCBKo=;
	b=bj3iMBNjO/Snw1QxfiF0lUsj0eZ+CaSPojvSiaIuAgZbJBvxSjsCEK9g4tUTYmgagG6m
	 A/tEfWsCpxZj1M4IR1JsvfF38886lclZxsQSvLUlcN6UsL08DI+6JTLcwuUWMwc3GQ/dt
	 1lSe8h3gix7Lu8fhdDVcMFIjSaNOGXXu6O4T4C8Bk1I4PQKlwJzxnsbLr/HYXY0KhLpT9
	 7+Zqb+mgAp5atFRpXxoY46Qu4YfAs37yCk/FBh620BtATnfA+Qz3BYVBtuujtnJy0l7Hw
	 N0uEQVunmRxVada9rI1Ct1bkZaO2dnuCdpc2ySt+SGbV+DU6pd2f2uG1cdqg0d2nJqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="PCHOpcG/";
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59D606A319
	for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 15:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A59D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PCHOpcG/
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-150b2fbd784so105791c88.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 Oct 2026 08:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792509710; x=1793114510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1seIWp3ctG+7IR0lg6vkqmMZtzQMv2ZC559JhpGCBKo=;
        b=PCHOpcG/Tgpq9Dnf2nzYKPrGpw6c5Qlq6/DHPcyPmQTRQuupGofZYPQkq5Is1JCikp
         OedWtasAHVy6YjYQZp7BwPFppblpQg6hNCzhg6HskMdIT2ZGV0MlX4M5JYNKxxPcnYEa
         SoUJspD3Wl33kKUmljjerAk7wxc9FS4bjkNJw3wyot4k3sn+jz8Auwl2Q9+akDK/Vujp
         jbITmKOZvGZg7gtl9yYa3I7YXZG7N+ZUoNkZZ36SfGXFCStWvgn5elZqPf+56OE3HoeE
         8w8qynhukrsxJyd9yUzaO/+Eee049wkeudsJKJ7G1bVJ6NTZtd9QIGUv3yYU57UkgDDU
         UJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792509710; x=1793114510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1seIWp3ctG+7IR0lg6vkqmMZtzQMv2ZC559JhpGCBKo=;
        b=nH8HdZugTyBu9YrL8NKdIXP2g/LAoZC5BUN0EWvzOxjOvFnnXYbCncu4EnIEIatxR5
         yzUIYv7GujQY33Wo1bVTWZOuJtGweg4V7CtDPhWnqzTKm7AaOu96DuB3PObjFzNVIzKG
         MSQR/lfLOVXxPRh2SNYn+N6EGQvfiTZyO30BNdmt16Vl8lWdg78GWomnv2K+Ubjg9IPt
         eM8uQz4QiV+lANWkke1WIZypvIXUfrhW3WDYt9kzyvXAvu0U5ir3Cu/j45oZEHGpNit1
         FqPl7Rpa7ZQgp4hnE+PqV2TxuFFVJy8HM80gvs9Wy/NYqm8cW5MBW99j8a4vDYWROAqN
         ARew==
X-Forwarded-Encrypted: i=1; AKwUvByUkzrsAGJ9a+rjqbF2J8eNJtOqHC1+jUvuKa4R3DgO6milMoXRBDEbWUGawM+sOrId++zCHFuQMYA++1U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIkAKeKax/y1xw9qztg98QPA28FVSvA2AKkxGJATrqYH5NrJMaw
	HPncepXnPwY783Czhzz0p+9ZzF48jgH2CuxEqiN6UYnoYAmPA2jgpsasNMhLcqVS
X-Gm-Gg: AYBFou1JFDZw5/iodEfsavxp9wrnMQ7+xTkseFq3YoDug8j1UMwAqb1N1pZsBxJN56R
	/3e8Q5fhmsgia7R5ArJTxRdahB+3A0Yi59J7fLTYOUsUDw8tgK4kcAixzuKSLBRRagTPHZul8/W
	mFrZnOeIW+pSq7EC0e4EHZBNpIPrqF91E95mEV3Tdr3H77W0LlPSntBkq52ugVWfsvlVp71B0op
	ASl+5DU24GgbKrJh2T2iplBx1w3czBVLCFtKCYcK/rXtB1eiLf22NXv7XK4CU20BrbCfxAziq9i
	4K87Ij2PsLQZNZq6m91cLKXPbO/ztWVowA3boBZir76Z3u13uEf5ZtS3aikb0v5lAj1wFgodFYj
	02B2o+NkgvWNa5IFxCorT4H+IUvu9iiWVVRhp4q9+Jvjghms68O5I1ZoAr3cfU0AofGFRoVIMuU
	QaHbNGvMtSG1D8+7sMZMLVAbRCVayF3eMpq7AL5DBPWYpAbLWmm1AIGpBhJHfRc+441QU9Otl3j
	whKV+203EMDHkzN2lIWAmr2ux9iyJx5mCJ2k1fPBq4hMGR5datIKprzLTRuRs/JRdBa
X-Received: by 2002:a05:701b:4212:20b0:12d:c389:ae54 with SMTP id a92af1059eb24-18510d6790cmr25881356c88.2.1792509709877;
        Tue, 20 Oct 2026 08:21:49 -0700 (PDT)
Received: from subhobhai943.. ([2409:40e1:7:197e:d6f5:c443:63e9:fc37])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm50682637c88.16.2026.10.20.08.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 08:21:47 -0700 (PDT)
From: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
To: catalin.marinas@arm.com
Cc: will@kernel.org,
	mark.rutland@arm.com,
	patrice.chotard@foss.st.com,
	linux@armlinux.org.uk,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Subhadip Sarkar <sarkarsubhadip604@gmail.com>
Subject: [PATCH v1] arm: Kconfig: Fix spelling mistakes in help text
Date: Tue, 20 Oct 2026 20:51:22 +0530
Message-ID: <20261020152123.16589-1-sarkarsubhadip604@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Fix two spelling mistakes in Kconfig help text:
 - arch/arm64/Kconfig: 'unexepected' -> 'unexpected'
 - arch/arm/mach-sti/Kconfig: 'targetted' -> 'targeted'

Signed-off-by: Subhadip Sarkar <sarkarsubhadip604@gmail.com>
---
 arch/arm/mach-sti/Kconfig | 2 +-
 arch/arm64/Kconfig        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-sti/Kconfig b/arch/arm/mach-sti/Kconfig
index e58699e13..4dd5d0592 100644
--- a/arch/arm/mach-sti/Kconfig
+++ b/arch/arm/mach-sti/Kconfig
@@ -32,7 +32,7 @@ config SOC_STIH407
 	select STIH407_RESET
 	help
 	  This enables support for STMicroelectronics Digital Consumer
-	  Electronics family StiH407 parts, targetted at set-top-box
+	  Electronics family StiH407 parts, targeted at set-top-box
 	  and other digital audio/video applications using Flattened Device
 	  Trees.
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index cab741a69..68f0a94f4 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1164,7 +1164,7 @@ config ARM64_ERRATUM_3194386
 	  * ARM Neoverse-V3AE erratum 3312417
 
 	  On affected cores "MSR SSBS, #0" instructions may not affect
-	  subsequent speculative instructions, which may permit unexepected
+	  subsequent speculative instructions, which may permit unexpected
 	  speculative store bypassing.
 
 	  Work around this problem by placing a Speculation Barrier (SB) or
-- 
2.43.0

