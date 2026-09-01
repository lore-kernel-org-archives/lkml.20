Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5AF432BF5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Sep 2026 15:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788276807; cv=none; b=JvHk5mc2BAdeNFCM+4xrOAiXL1SWTGsii2qLEW1X91ySfvBzdTbSYt8SD5pnkjbyInGxYZloej+HcdSA2qbMX3dEJasBd0GYPKYJNEbC0WMESUT8VOegHGsN0K9dvzGSPtEQXwLCrZTS6zNRDMe+PdoG5eoOHoKM1J0HuRBP+pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788276807; c=relaxed/simple;
	bh=265EXKY1LpSnh+xYZaVde+XE9Ub2EQ+extj0SjJz2p8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=CBzUiXp1okpBSKplUYnAhL6dLFu+6Wn10UJXYds1m0b2fwjg6475CgKUIyiOgdk38A1mBFjNCDr5ElvXXAEJFq0cmBy0HWm0ZcWZOaKZDeYu39UUUzuf7kLLxn3LBV1eVoPP80xWv7O4mVZgjkRa0KCGF0r2cb1zdXJtjDvhw8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=LyOsI2RZ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="LyOsI2RZ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso11069185e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Sep 2026 08:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788276803; x=1788881603; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=KFq2GkDfRXlsOR078AWttqIDotbtBYpQKPjXjcs2jO4=;
        b=LyOsI2RZDXiDRwtRiRRUUjrEZxuzO8l+Klujx1y7iWjW7FSd+zSicoEFGLiRmuB7qg
         9F1CE5opUA5O5aL4ukNBReiCx3dhTtEb13IQn+481gh6SOmDXy95o5SkIzXc8GiUnE/S
         XjP9uvAN31jCRVdliuL+M/7jWohzG/ljAuUjKLaj79nIS85h+w2M0j2cu1I1Odhm+IjS
         W4ZjGpDJG6Mepw/baA3+9Helpvr7wa61yGBg/GC2PQp1/La2biLgNAXxnEJcdl6BJHlc
         6k/Np8CmsddhJ1Fz6354ulYP2apoO2ltR2V4pKz3q9eeEzeVQMIE9dDaGHfMg/iY7YOx
         /F1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788276803; x=1788881603;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KFq2GkDfRXlsOR078AWttqIDotbtBYpQKPjXjcs2jO4=;
        b=JeEsvGTdQUU61wVMZa3wqjCdSs7qROPkqE+3iZInaUqts+XxOwh6Y9CSyXOzvkYSl2
         sPChiknGPAo6gv6RpPNDcnRCvSlZb8JtyfaIx4Mt1kEqY3kYO/GhOLR+1j1olYPiN8Sq
         pYj0ywEoVPmk2jh7aDmMt0RPbmx0NJsfhaLBLMC9O96gxNzkSUl7jJRHGrhaigxafcWm
         FPN0P+uRVaIeo2NBvgsOkU/d4oicl7ShWx69Mp2uDldKSt5NS0cBmPMEh4HLJ2tjIQWC
         qBcoHzSHABeRu58YKD1Af1m+GHQ+nWdjcSNWbgOJNITWFv0HCL+eqHTEX3Vsuf107NG3
         bZzg==
X-Forwarded-Encrypted: i=1; AHgh+RodmsZh5BJZ6IWSBQ5tGmkgPbYHpzkSwPirboqOhXcTqm2Lr5ukmh98kfpk+eOxfU6oUE+rrkn9kKSuyms=@vger.kernel.org
X-Gm-Message-State: AFuF++kbXzUEslpfnSn+g+VPYcOgkaSSctHg8X5MFDveyh8KeaNEkWZQ
	dDJWRZeTaz+ufJNmQIl0NyNVkuAk41Yp2qwUYnwHpyjXdKoSxOfli7ppfPl7YPm9YmA=
X-Gm-Gg: AR+sD12kPKjqxY3Wl1jdeEsm7PM64EsSN1q8zORdhylw9H5UXhtUOHCZRZ5tVc9vLPa
	YK4/OM26qJeQIw0+bSihtLz/88E2Z+URhC1jPwhERjkYKp/MTzULPM8KsRxh0FXZK/gH6D9cg40
	yDZTgW9Yp45rxdqgdsSauq7GgNOuYhrJXdadyeB+zBumHuwjWMRJuhi+/2zVYIpS40JlV9X9ScJ
	8lNoINdPTH6UuOK9txXeh7TYeP6e8zkB4QrfPUZXv+Dsrpr/km5OvGtlG3yyavJ/6KdapbaNfeM
	pJ6fnhi/pGAmZnTb4fdPwUwELf1gLh7QV4xPs8OiqSnBhGnYkIh1iP+xvsuRGOFK/1eW0+qXO9x
	aczuCH1EpN6BiHeYTDuZu/81Vof6pA6FR1n/R5vGcsWc8wXcNEOCYfl4dLKZB3EvFncKsD8fEad
	daqpugmBIM33Y4+viKCi8UE9PlgexXfTFhvwCAmOKvrAQw4PnKZerpY9dHA8nzJdga+YQIaF3Km
	Khx74R792dGrFKEpn8fEzqAnIMuy2Z4NGOZ6zue
X-Received: by 2002:a05:600c:4445:b0:499:900c:9c69 with SMTP id 5b1f17b1804b1-49b91c44fbfmr487364265e9.9.1788276801577;
        Tue, 01 Sep 2026 08:33:21 -0700 (PDT)
Received: from alchark-surface.localdomain (bba-2-51-220-108.alshamil.net.ae. [2.51.220.108])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b91c5790csm314541845e9.0.2026.09.01.08.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 08:33:20 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Subject: [PATCH 0/4] nvmem: Derive Rockchip MAC addresses from the OTP CPU
 ID
Date: Tue, 01 Sep 2026 19:33:10 +0400
Message-Id: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CMBBA0auQWTvJ0CKCVyEscDrCaISmBWJCu
 DtFl2/x/wZRgkqEe7ZBkFWjTmNCfsmAh27sBdUlgyFTUk05hre93kqcZo/sF3X46Rgt12QK66i
 qCkipD/LU72/btH/H5fESns8X7PsBL2E1JXgAAAA=
X-Change-ID: 20260901-rk3576-otp-cpuid-mac-3c90243d0884
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Michael Walle <michael@walle.cc>, Miquel Raynal <miquel.raynal@bootlin.com>, 
 Finley Xiao <finley.xiao@rock-chips.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2718; i=alchark@flipper.net;
 h=from:subject:message-id; bh=265EXKY1LpSnh+xYZaVde+XE9Ub2EQ+extj0SjJz2p8=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWRN+2DnU7Gh6/4Mn5hdmn/laj6bZar7X7yrwmsYVtp9/
 JG/1cKujoksDGJcDJZiiixzvy2xnWrEN2uXh8dXmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHWMeIgYtTAKaaK5Lhf+m3u0Wrlz8oMrOT3VPHc+n2ojDpS7MyCstc1CsldpW2uzAy3A/u0Lg
 +/+CNNxViTpySi7QueS68sTeWTV8pb6vMZcYsNgA=
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5

Rockchip SoCs are shipped with a unique CPU ID in their internal OTP
memory, and Rockchip bootloaders use it to give boards which have no
dedicated storage for a MAC address a stable one anyway: they hash the CPU
ID and patch the resulting addresses into the device tree they hand over.

Kernels started without that fixup, e.g. straight from the SPL in Falcon
mode or by any other loader which does not implement Rockchip's derivation,
fall back to random MAC addresses which change on every boot.

Formalize the derivation in the DT binding and add a Linux kernel driver
implementing it, so that a Linux image can use the same stable addresses
regardless of the boot flow.

Only RK3576 is wired up here, that being the SoC I can test on. Other
Rockchip SoCs keep the same CPU ID at a different OTP offset - 0x7 rather
than 0xa on RK3588, for instance - which makes supporting them a two-line
addition to the driver's match table plus the layout node.

Patch 1 is a prerequisite fix. The OTP hardware has its own internal state
machine which only works correctly with serial access, but the current
driver serializes nothing, which results in timeouts and/or corrupted
reads (e.g. returning splicing a TSADC trim value into the buffer of a
caller asking for the CPU ID, or mixing up trim values of different TSADC
callers). Hence the Fixes: tag and Cc: stable.

Cross-checked on an RK3576 board: the addresses fixed up into the FDT by
U-Boot match the ones derived by the new driver, and the driver correctly
assigns them to the network interfaces when the kernel is booted without
U-Boot proper at all (via Falcon mode).

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
Alexey Charkov (4):
      nvmem: rockchip-otp: Serialize reads
      dt-bindings: nvmem: layouts: Add Rockchip OTP CPUID layout
      nvmem: layouts: Add Rockchip OTP CPUID layout driver
      arm64: dts: rockchip: Derive GMAC MAC addresses from OTP on RK3576

 .../bindings/nvmem/layouts/nvmem-layout.yaml       |   1 +
 .../nvmem/layouts/rockchip,rk3576-otp-cpuid.yaml   |  73 +++++++++++++
 MAINTAINERS                                        |   7 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  12 +++
 drivers/nvmem/layouts/Kconfig                      |  13 +++
 drivers/nvmem/layouts/Makefile                     |   1 +
 drivers/nvmem/layouts/rockchip-otp-cpuid.c         | 119 +++++++++++++++++++++
 drivers/nvmem/rockchip-otp.c                       |  10 ++
 8 files changed, 236 insertions(+)
---
base-commit: 89c07d98716a13454ec3fd9f97689e812cc71bd4
change-id: 20260901-rk3576-otp-cpuid-mac-3c90243d0884

Best regards,
--  
Alexey Charkov <alchark@flipper.net>

