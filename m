Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=203.254.224.24
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567066;
	b=Mk4rvpxsQLcqNM+3fNNCkqHJ2lLUiTCD34UzpDtLqn52+Sd1bObAZ9fBFsXEDKB7h0CX
	 mMd69yJN6noGyLXm3yH2wav0kDnLYdjxrI3Dtm4CvMxqOrYrMHO8FwQlaC/vqqstt+o/Z
	 GHU1hotluAkdIFfzdKBXZrFTtzjp5BZWirLUBWp2XZEfOyvz5sBFmviik+yDNiJFXyLsO
	 gd/LS5WdWGaJQrdYhLOWJZmtw33vlyY6NiCD//WZ9cwy0y+MBI+D8mVfXgWOkpSYqOXU+
	 pZ1d7Z7zYdgRLl3AzmhCryUSvrgMmRyhf3YPCnva77VTBZ8JRVbNOs98PBSvH5JPuPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567066;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-CMS-MailID:X-Msg-Generator:
	 Content-Type:X-Sendblock-Type:CMS-TYPE:X-CPGSPASS:cpgsPolicy:
	 X-CFilter-Loop:X-CMS-RootMailID:References;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	b=QeOqcan38ePct8PD6zz2rECRZ0KdnNJ2kTKnXfW4/5I9OXvnr7cZaG1x36bULuz3qSc/
	 03OQf4mKJEOLGIsYdKAdq0u+4WmhZmJWwoIDjU0cU47hiYb+S64m0dE1lXOJIFtlrZ4hC
	 j9nXJ+E369bWWA6tvQvlFiiAly+ustcDcbh+4EFuCMTPDPnad0kP3KYp4mJ+67tmzGpdF
	 +jDxx8iNGu9+1aTgaqgVtglzkeqcW7FhTYisx7wwyXUyknYZaygmqcuihE9NkESYRnlrY
	 g9ke1+fQ3IkI6o6GpvfTc1n4C71AipwdUM3cBMDIMc5uqRc9n7r+mRBrLTd4gvGPZ3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YO3uMZ1L;
	arc=none smtp.remote-ip=203.254.224.24
Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA4A606A895
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BA4A606A895
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=YO3uMZ1L
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261113105102epoutp01863aa6d6f827ec761ee9a0f3b8a39cff~nlTwi4-v10722007220epoutp01G
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 10:51:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261113105102epoutp01863aa6d6f827ec761ee9a0f3b8a39cff~nlTwi4-v10722007220epoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1794567062;
	bh=PM96lafS/rwv826v2LZCH6guF3z+x32g3ULBEqHU5jk=;
	h=From:To:Cc:Subject:Date:References:From;
	b=YO3uMZ1LKk3HCzxl7OnAt/8z/BO8/f2rg9Jt8hOFV2XVXnVmp4r2s6E/PAd0mu9+h
	 r7KBVHYg2SMPx6FI+E/rDrXjPrmhOXbePwEynWxlhz9hvD90avkZZxPnHUGy5z2ipR
	 6I6f29rfTQ+0xnCg7mwoLvYESfqCoAUHialrK6NQ=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261113105101epcas5p100e5c266cd26e579976a9f322a776c23~nlTv160Ni1299812998epcas5p1G;
	Fri, 13 Nov 2026 10:51:01 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.92]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4jQvF04Fmrz3hhT4; Fri, 13 Nov
	2026 10:51:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20261113104829epcas5p13695795bc337b89816b05eec610a0dba~nlRiak2-X0455004550epcas5p1i;
	Fri, 13 Nov 2026 10:48:29 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261113104826epsmtip2c360208ef38f5550884792f7a48e171a~nlRgCU2-52451424514epsmtip2-;
	Fri, 13 Nov 2026 10:48:26 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v3 00/14 RESEND] Add clock support for Exynos8855 SoC
Date: Fri, 13 Nov 2026 16:35:58 +0530
Message-Id: <20261113110612.3265841-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
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
X-CMS-MailID: 20261113104829epcas5p13695795bc337b89816b05eec610a0dba
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261113104829epcas5p13695795bc337b89816b05eec610a0dba
References: <CGME20261113104829epcas5p13695795bc337b89816b05eec610a0dba@epcas5p1.samsung.com>

This patch series adds clock support for below blocks
found in Exynos8855 SoC
TOP & PERIC
PERIS
HSI
USB
There are many other blocks, for which the support will be
added in a forthcoming patch series.
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
Chanegs in v3:
 - Addressed Sashiko review comments
 - Collected Reviewed-by tags
 - In patch#2, added samsung,sysreg property to the binding,
   somehow this was not cought by dt_binding_check
   Have kept reviewed-by of Krzysztof on this patch  
Changes in v2:
- Removed name duplicates login, as pointed by Krzysztof Kozlowski
-Corrected the sequence of binding, driver and DT entries
- Removed <linux/mod_devicetable.h>, as pointed by Uwe
- Added all the TOP clocks in single patch
- Organised the patches in the order: dt-bindings → clk-driver → dtsi
- Added Automatic Clock Gating, as suggested by Peter Griffin
-Since we are adding ACG, we need to add SYSREG, hence, added that
- Followed the name mangling strategy as mentioned in clk-gs101

Link to v2: https://lore.kernel.org/all/20261009120137.2801911-1-raghav.s@samsung.com/
Link to v1: https://lore.kernel.org/all/20260728121111.2077860-1-raghav.s@samsung.com/

Alim Akhtar (2):
  dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles
  clk: samsung: clk-pll: Add support for pll_4313

Raghav Sharma (12):
  dt-bindings: clock: exynos8855: add top & peric clock definitions
  dt-bindings: clock: exynos8855: add peris clock definitions
  dt-bindings: clock: exynos8855: add hsi clock definitions
  dt-bindings: clock: exynos8855: add usb clock definitions
  clk: samsung: exynos8855: add block top and peric clock support
  clk: samsung: exynos8855: add block peris clock support
  clk: samsung: exynos8855: add block hsi clock support
  clk: samsung: exynos8855: add block usb clock support
  arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes
  arm64: dts: exynos8855: add cmu_peris clock DT nodes
  arm64: dts: exynos8855: add cmu_hsi clock DT nodes
  arm64: dts: exynos8855: add cmu_usb clock DT nodes

 .../clock/samsung,exynos8855-clock.yaml       |  196 +++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    8 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |   95 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8855.c          | 1378 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   11 +-
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos8855.h    |  233 +++
 8 files changed, 1922 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: b810335a0699d1810683796b0e3ffe8827ddfe6c
-- 
2.34.1

