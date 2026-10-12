Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3D436A017
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 23:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791849391; cv=none; b=TD3HsNz55h/U13FaWmY75p7J7rBb0ECCz8lNgyf5Oyye0i3Ry+OF+a8Rr4hiHbNHX3cbir4s1EiMFBDvWCYUOb5C6Xq7ilqG8ghFtAOT7wglSwid7jWAVYOIh2MG5TlevUfCAH7Cz67Lr85W1mY8ARrpRBygp4xTQWz+W3y6D3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791849391; c=relaxed/simple;
	bh=07zRKt+iURfkbu1QFEt/0Wl2s591iOQMk67RKiSaS2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XKRZB6xOj8jY8BoKoT5RaNL4VDe4X/iI4dcc7lwwhN7CLr8TLhf0GVctnXSRFmMV71qGnguBJtvd4FCSdwP/aOmwC/3DVMKYahCeYnWnyTidRNmOQstLp3owxfcFwDblCsTxwA2mM3hbYivqHIOlXN2k8JtI6Wv0KiYK054rqhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IP4vtR9d; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IP4vtR9d"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so4468787eec.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 16:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791849390; x=1792454190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1VeLk5FpKsQq/qjV/WEYAWBiUl9W5UJD8Aw3U9SBRbA=;
        b=IP4vtR9dsiiVDwGRi5QnG0WuJVW8rTUKBPHM8AktVx6kAu5tNqlJuVkmfwcNPuRBw+
         N1N8POprdLhfaEEuQuv9OgvwR4Nyh1rHNxuToWTF8jHgBUbIiVE4GedYNgDRhsZC8Khl
         KaS0iBTksKzx6RmXclbssRPdhNWbUwUJA8cBcd9d/D5kz/Zn1tp1oAc4vaKJtESZ3FCo
         91A10U4dZlF+LZ/WxJxb4A3qMDAViL8SkCS1daOo0P6ZFhJiFN5yDY+mcRoIJmiKwBQj
         JdjIinDPRSTC0FoSyM03p/iTlBpaFUSTaymqwmpzroNwvP9FZrJRfhDN7dfP2vLqnh7H
         r5FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791849390; x=1792454190;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1VeLk5FpKsQq/qjV/WEYAWBiUl9W5UJD8Aw3U9SBRbA=;
        b=zJRJLNIHQA1+KRUnod5FrUHULto67wkfKUHN4Z93yLPKC8gJR7sQqz+lQ5zjZu4cm4
         DhaB/SHtLvfm2SfylN/lPt0fVCQDPQHbAHBb9sXGoytvggEQqA+3B194PwCqy3qRM9kI
         uZ3G4b3sHhG9LJ57yfn+ewz7vPfWZV4B40pzDL5/Az99mLY93tfpkxR8hMscIqe+hUtA
         qVqofsj1sUJbrzexOt7VvLaS6xPAyoQRiuOKc5slho3GnqQfI1d1SsZMCTAFE/r/5hCD
         JaXgY3iU6P18bPNvZRaJ47LgdAn6A7Jna4rKivlMmSlGY8sAo71amOS8mEmK/U//TlP0
         foMw==
X-Forwarded-Encrypted: i=1; AKwUvBzfomyMnmnWq3SiYP7XgGLvTCdpUVLll8uNTxg4Th4B9VSRHYYxaZCeykKj2AceJEmENz1++0b//YRe1bU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpBgi9eexFPk3JZ7EOax8z0qNsqtEdVTz3OuelpuLgDDtGkcNd
	wZyw6/5jtXc0iaV/ILNWlKRacRkfnY7RsEkmJKoHajHujlWO635k5htsGcg6ac6BQ2Q=
X-Gm-Gg: AYBFou2HR4lG5gAaTrnwcBj218qVtVzSvjwVpFF7DQpPXGhNIxhlP42F1pupjmwS0Pn
	pI4DzcH+IHjg10TkOg7Sei5c5IBf9fadJEKtpJcOAf39HrhdJ+6BBVZKOB7Bu8W4fEePib0Ur/J
	OXpLWAbgXImE1yQej1cPyAqqWuz2A0T7cjkrQhwMKatCG0Uyi4moVxBfqLI4tdtyABf5m9QC7Cf
	2r3kcJUGuoTu/MoTSMo96Xr9z5UJeLdPNkbL4ylC6TEQTvAVyZ9EAtBNMQH8OguNBfp960Wa742
	NmSWnog85zz2jdCm0YkthDrgmcKS38QDT/UDd6ZTNWEJQzFoCKr7iCCkup3tqvL5849KAY2+3Br
	7yyyQcMI7Nbpy705RjP4/kYOzEQXly3qKBv/eJRMUuOgJ7Uz0WXKKOF5V15gm9ax6sJMfrYk+zj
	YKU5nijr4G9DFMufuZpCMpK9X4TJzWuEo8l6Rx0uTKx1UE3hdXuIgMaZ+unpO5EDgJBYTA5armV
	AODT2swLPSCKSpHMYyutyKckxkRcE6RvN4z9eFWWv9R4Sjgh+/H58U/l8sUXbWNNzM6kNGcyfRH
	PeA+xKC69lmhfllHiYC8IrTYqI0O+NG9mtwk7Sld4ZYS3s7i1QMjTO0wAfzguvEE
X-Received: by 2002:a05:7301:4e88:b0:35a:efce:6190 with SMTP id 5a478bee46e88-35aefce65c3mr6631069eec.28.1791849389564;
        Mon, 12 Oct 2026 16:56:29 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-35b690af3easm8686145eec.1.2026.10.12.16.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:56:29 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Tue, 13 Oct 2026 07:56:22 +0800
Message-ID: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi. Patch 2 tags the board-specific
EEPROM, PMIC rails and SPI NOR on the boards that have them. The set of
nodes matches what the mainline U-Boot SPL tags for the BPI-F3 and
MusePi Pro.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  8 ++++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 12 ++++++++++++
 7 files changed, 53 insertions(+)

-- 
2.43.0

