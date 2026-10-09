Received: from mailout1.samsung.com (mailout1.samsung.com [203.254.224.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD784DE731
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791546234; cv=none; b=jYLAHlI5wK+xoJXufI3AlznzMH8JXWheecQVyCkWTZa19qb67A8DF2kfKFdD2VaU+TQsvfERk2yiNI+0egmaQOIV0R5Z/F7G39kqaQOXrNy5dlc/ARc/h0ZfbEC4N3HmXf3EGBA7LBoeSCY02gGVv6442F2IcePMV57N/fgAFk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791546234; c=relaxed/simple;
	bh=dvF+//kJBiuZFF3EvS4E1KQWB/fhUJHNXMJbDYPgIyo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 References; b=I/04cMZDwErigO8T1w/MmVK3tWecjqZPY//lm2XLYvtCN/DMp9sLrrMAA8zu7fVFx/xQFCctv0K6YeYMHArMFf3rM6uRHP+QNN8zKFhXBlE6sL/1PASfxIX/Bh0UO25OZQDMoGWWCNrGne2exAVmIRX6oUAF1YrfcdAxZXtiFMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=Pxz4/4TR; arc=none smtp.client-ip=203.254.224.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="Pxz4/4TR"
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20261009114334epoutp01bf529f488ff7c8a418b66fc2818d38db~c2cowOqsp1385013850epoutp01I
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 11:43:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20261009114334epoutp01bf529f488ff7c8a418b66fc2818d38db~c2cowOqsp1385013850epoutp01I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546214;
	bh=F5Vy/YwEGeTk+1lMKsuWeWXc6SaIHmiMxLZ/s5WSiMc=;
	h=From:To:Cc:Subject:Date:References:From;
	b=Pxz4/4TRlRx5uLILVhiIUd/6rVXz1WGz+j0vgFVoAxp/pxyH0+f1gOpJoDhuhJANo
	 UG5dEP/K8V+BNLmRnA/o50E/QHj8ASaKXGOgeZGe1yUL3x9vc9izcAN3Y+fZ/GTGBs
	 cHCqWX43rq/GG1JLJd7UxpKZbQ58cRfiUSBwqfX8=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20261009114333epcas5p1374d0b179fa2d04eaa6f9ab334fc0211~c2cnp2T701432614326epcas5p1x;
	Fri,  9 Oct 2026 11:43:33 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4j1Q3m2H24z6B9m7; Fri,  9 Oct
	2026 11:43:32 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114331epcas5p37f60df8cdaf502a0cc492ad5eacf5e05~c2cmUuXD50307503075epcas5p3Q;
	Fri,  9 Oct 2026 11:43:31 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114329epsmtip2a2723a73dbcf714ffaacb71972767234~c2cj-jlrw3087430874epsmtip2M;
	Fri,  9 Oct 2026 11:43:28 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 00/14] Add clock support for Exynos8855 SoC
Date: Fri,  9 Oct 2026 17:31:23 +0530
Message-Id: <20261009120137.2801911-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114331epcas5p37f60df8cdaf502a0cc492ad5eacf5e05
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114331epcas5p37f60df8cdaf502a0cc492ad5eacf5e05
References: <CGME20261009114331epcas5p37f60df8cdaf502a0cc492ad5eacf5e05@epcas5p3.samsung.com>

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
Changes in v2:
- Removed name duplicates login, as pointed by Krzysztof Kozlowski
-Corrected the sequence of binding, driver and DT entries
- Removed <linux/mod_devicetable.h>, as pointed by Uwe
- Added all the TOP clocks in single patch
- Organised the patches in the order: dt-bindings → clk-driver → dtsi
- Added Automatic Clock Gating, as suggested by Peter Griffin
-Since we are adding ACG, we need to add SYSREG, hence, added that
- Followed the name mangling strategy as mentioned in clk-gs101

Link to v1: https://lore.kernel.org/all/20260728121111.2077860-1-raghav.s@samsung.com/

Alim Akhtar (2):
  clk: samsung: clk-pll: Add support for pll_4313
  dt-bindings: soc: samsung: Exynos8855 SYSREG compatibles

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

 .../clock/samsung,exynos8855-clock.yaml       |  178 +++
 .../soc/samsung/samsung,exynos-sysreg.yaml    |    8 +
 arch/arm64/boot/dts/exynos/exynos8855.dtsi    |   95 ++
 drivers/clk/samsung/Makefile                  |    1 +
 drivers/clk/samsung/clk-exynos8855.c          | 1383 +++++++++++++++++
 drivers/clk/samsung/clk-pll.c                 |   11 +-
 drivers/clk/samsung/clk-pll.h                 |    1 +
 .../dt-bindings/clock/samsung,exynos8855.h    |  233 +++
 8 files changed, 1909 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8855.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8855.h


base-commit: aac26bee2287c88af5be5a5ff96d783b19a28790
-- 
2.34.1

