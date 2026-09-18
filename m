Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A1F51A143
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 16:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750474; cv=none; b=FA/YDEV4DDws25DNOlGKKuJAX0o+4zcDTcAi5AU+irGpWufIx1qsQuf+WobDX/f4Wm5uyNZBtSjVqphvRGytaQJ0bkamDmbfFhPVEdpYCuD3fGXiGfUcp26KrDuqpYyY2wZKE6UNi8R7A62TTVqQfW4YrMkNuFOueluoEDPCvvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750474; c=relaxed/simple;
	bh=sFmc55UAaHNbBDtVN3vYWMohL/LpvZSep9r6J267NOU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PMWhq1FkrB/AqfyJV5PzC+KRrSk/iSnh9ahnVprF9ymWYD1A71soPNBNudX8fJKO8t13j2sQqa+p0G+rfH679fgl3jGMVAQ+75H1vnxNBAEqPLmUQILUQEtLRV+SO3kJwxFkLoLePLr5QKx0dHRrs+ppwudI1fNDjHPYD12/8Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aaCSQhZZ; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aaCSQhZZ"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-39b350c69b4so915469a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 09:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789750470; x=1790355270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=;
        b=aaCSQhZZoSsprIxRsXivgEpN8tdknwT+wXSS4zA1vkjLNo5C8RLwzM5rCEW65CHMkJ
         hjOfJ1jDJQykV60lRai2qTAeWjlQBViACzoAe/TVXUTaWgkLw6yA8ZfLrglYtfBJHoUV
         q70meFtGVnxckHu9L36Agyr+3fEKqCe5nZO1O4/TATtQTLnKcY0wT2McIEdlr/Hzrr0A
         xc6TfdM1KGDEZ0XlaUPN23a3U8rVUEk0UC8JLcIl2ZyqyLKEUPYu6HOq5DRVeGcDQDHI
         WoHTUgA4SYa8OsXvslTtyFuMjQOOaLLPx6oIBWv6keSHCtI/5ZkAnDuytSE9dNax6+Ph
         ypgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750470; x=1790355270;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaTufouzUrE+fHGKjau0XKCchZCy0Yqa9z83nKb4F9A=;
        b=EnQ0acUK69NroGwzpD/CGWuLkGq8rmgWoF7RApmYW1bcJcKIUS0qzPeabmiNP2PBGz
         JupTjqMrnVbiKoq3DIdZi2/jpANbkxVKV/O0BLAQBSEfwU+d6py+PVCm399Qgdi4SZEo
         jKhRkLw0dCnwEtHBlP0Icowmwdn4JccvqPUbjDrt1VXVaFsjsyrFWvKKBRMCUU61Q8bd
         sPLc2GPrlhRJItDxRGyYuPdlZR8PKaFLO+VwNKXb7XrGbXgoUlNpUyAjnFqV2AYetM4y
         +AFBuaRvT+0+Ezx1uK5cLiFEIVCMRCA+bd3cUrwonhoVt9Mngda23ybUrOZo3oa4Bsy4
         3hCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfAFkcaLnf7abHWnFM1ElUthLn33koZ45PJUfYC8yF4gc2FECpLuBJDdCT3oPXJvSCIx7Np/aNrqH+MKQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k0G7zkjw3OIRmJaAPncgnMltcge2jnaF7XD9PkEECf4uJaPYx4
	FQflgey4Uy9CkKhSXR4ByNk3Pi796cPQdgM5mnYNKqsrFZeh872egpuA
X-Gm-Gg: AYBFou2JDRLtawklTQqkzinhb1alt1wNwsCIQ5U2aLLKmDCvnn9+XrHh/mBG9DO4E7j
	xXsb5SuN6KkKp7mVBuT0ubSg9bnS3x/1omtIIgbkr4PIN6TnvaxSyxPN9VTyEcTIths7fNkLab/
	QOQTH3V6105CSlvnb7Fv+Pg5hBhiMtybm8kmrzKRgzXuF7eiD+kLLeADOE2B8IS7XFjWmptKs1b
	YLc5peFbRLlg7Vxjl2JAgSqQ9iQ/btRvouj/wu8MoSSpT6+x/9X9Ix/PCRbGGjHxk4rNdS09S5x
	WeYNMGy8dmLK1oCSOgsIP3V8yqqiFVd+kZLzY/YkwwgbLGZGkzKCCjxs126SoRnE7HdJUXN1PVW
	IMeU/ypr2CWQFJ6XFSwDnC+blbgAlKJ9lmVIPs9XFeDAxrQmODqvmarcQDwtoWheaDU556nqLK9
	2pWpZDTyt91hetsLdtG12R0SlD+pu+PZSyZ6xmqds3o3tNf00v5HgG/+NGBbp9vc8=
X-Received: by 2002:a17:90a:da90:b0:39e:6a80:b796 with SMTP id 98e67ed59e1d1-39e6a80b849mr771187a91.38.1789750469839;
        Fri, 18 Sep 2026 09:54:29 -0700 (PDT)
Received: from archlinux ([207.90.239.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6cb0190bsm240270a91.13.2026.09.18.09.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:54:29 -0700 (PDT)
From: Mikhail Kalashnikov <iuncuim@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 0/4] arm64: dts: allwinner: add Teclast P85T (A523) support
Date: Sat, 19 Sep 2026 00:54:10 +0800
Message-ID: <20260918165414.1129076-1-iuncuim@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds initial support for the Teclast P85T, an 8-inch tablet
based on the Allwinner A523 (sun55i) SoC.

This initial submission enables only what mainline supports today.

Display (DE/TCON/DSI), PWM backlight, audio codec, camera (CSI/VIN)
and LRADC keys are deliberately left out, as those blocks are
not supported in mainline yet. They will be sent separately.

Patches 1 and 2 overlap with Andre's series
https://lore.kernel.org/linux-sunxi/20260914210115.28151-1-andre.przywara@arm.com/T/#ma8a2554315eccbccdb15ee7ac212a4d0afb45a5c
They are included for compatibility and differ only in the full company
name in the description.

Touchscreen operation requires firmware extraction from the Android
firmware kernel module; the file will be added to a public repository
later.

The values below were obtained experimentally via evtest:
  touchscreen-size-x = <1786>;
  touchscreen-size-y = <1128>;

With the values below the touchscreen and display coordinates match:
  touchscreen-inverted-y;
  touchscreen-swapped-x-y;

U-Boot support requires an LPDDR3 driver for the A523, which will be
sent a bit later.

A ready-to-use image with working display, audio and touchscreen can be
found on the Manjaro forum. Patches will be added as other contributors
add their parts.

Based on 7.3-rc3.

Mikhail Kalashnikov (4):
  dt-bindings: vendor-prefixes: Add vendor prefix for Teclast
  dt-bindings: arm: sunxi: Add Teclast P85T tablet
  arm64: dts: allwinner: sun55i-a523: add I2C0 and I2C1 pin groups
  arm64: dts: allwinner: add Teclast P85T tablet

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../allwinner/sun55i-a523-teclast-p85t.dts    | 420 ++++++++++++++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi |  18 +
 5 files changed, 446 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523-teclast-p85t.dts

-- 
2.55.0

