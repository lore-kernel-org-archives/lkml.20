Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82022B8AB
	for <linux-kernel@vger.kernel.org>; Mon, 19 Oct 2026 03:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792378895; cv=none; b=aidTcZvpn5pnl7xBWd/SdSPVFlPaXNjFUOl564LkvXIKD31mX3dP4c/u/0UUX5dh4PlE645Ubov6yiQvf+OOc+iZGzHD+9KmtySCiVGXRBBl679+0J06gnQrXxHjot0vDcJdjZ9nOvQ9fR5l8xKIdAFbK84o9dNEs+5VoDfZnMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792378895; c=relaxed/simple;
	bh=FrNTlR4U8Qa0xBE+AtEzlNDQeO1NfeIDzp16ScHs28s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PbdVRgN76PrOSYn2S1Adp6hjup4gW46gIFGR2MimwSq0gSM4BrhdarREs7DxibPSl25cQ6f14Y+0BRVRMzb2Csm5luDiSCqznB1h1ghFPP7xgT/v3ksIL+zpgaSRi66HRAect54pv1uSpb2aK2G0WvT+0kR0VPKtDD+xg3d31aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZXjY2OdS; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZXjY2OdS"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93e63ee7b4cso198871085a.2
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 20:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1792378893; x=1792983693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=;
        b=ZXjY2OdSkA9EE8eAiNXmnnrB6RZ9LQOK2UmXZCt0uCAQsgFDaXOQhUm6hfrAbhAynq
         wdmPr48wcIU3gvyyKxp+AwnBD0BAKyHY8hPqduvDMBATHUV4rnxH1I/HRQau8WdGjeuW
         DDia2P/cYdWAEk2w2isYnsjbNh3S2qU1LRZkswwGsIN0IiAwr0J5zJoYscftRdOwc3ql
         EbVsJdwBaHWV7rDY4OSpANiKefkmDBveGPZKKZ0z0lX96DtVvYLNctvtnk6II4K4LvZT
         zoxsEGT9GT8imFn9cntiZ/SWd5XTzKPCmIftHq8TRlq3kqtcyi9MNzbTIyF+pPi2xtqi
         bCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792378893; x=1792983693;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLqDvu5I7JlAwNybBnp+q/NWLExf0+AtI016xe/bA7I=;
        b=ih/69pKlbaRTSGJm0MtnuzOl9oAMgXN0tUiF48zGxFtK1qijYWdoWbjbwidMuxJQEO
         TbenRv6VklHAm3hbPTqAtemYh4VJleWaqI8m1+ENue7LdBbocpEEVN9Aq7dC9JV54bJ9
         ov3HCk1A0rvUWyE1tm/7GiKbLvDipZD7YdeZRgvxvk4hyTQnE/EBZRBcS11SSWPrp72X
         Rb3jOvbNot1rKaZS/lu2Fbkpxtzcep26MwBR2+DGl9sSpRBURfwtxsDXqJKcApXyL+KI
         XcchhdRoC3fARn6ov3CqnZ6KL0j/38A1qiBqvGJ+ArSZCEikJK89v/Lle7ZqkvaawuZc
         80mQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5ndBNAhlKXF35QAcIx4eghG1UEZNRC9672Ptl4ApJUW4ZjAjqatjBxm2TYLr/xw+ITFM/xC0LjkIym00=@vger.kernel.org
X-Gm-Message-State: AFq9FYK0+2USp+2IrvxPrjsi6+9JwrmBg0df16r5+bcfaskaVCSrLLHW
	K4G7HEFZ4Hsv9z/bzJtLL9GoRPObhjpQ92bHHOAXgDi+hQabsfRHAKsz1Q+pweSxBTA=
X-Gm-Gg: AYBFou2dI7zgX989QwuayCXu2ehFYNdxp/z4iumZfHUUzGt55Zq1T3vDA1TEd0nlohH
	zFoVJB50XvdZiGvTB+bfPj71PMFrkGzKWqrXIc/1pu0NcU9WaqnQ2Zt55RZwX2U2RiM2zMg+Zu6
	aaIaPtLF4K03wj04Mxx0PBX1Ioe4NdEaMA7ZAxogtB4Odu/qAiNzQHMCKs2SlazLPDqlBn/yiTt
	8Tq5Ax2JlRXHIesBrLczbxtjU9FsloU2O3rUEubV5x0f5s+mdiGl2j9DS3jXoWuhZVTBrfqOOdX
	LD/DvkjRTJighQS9aO464+7p4Yn6sx4eti01zbgkYUbyWmiRc/FQH9svU0NNmi3F8HtkaCXzqvd
	l25/BlaOKvR6m//Fh5D5UEeqPrCBGVkFdmkf/O20gYQ0RlUSee6Fe4oDfqSdO49Q8pOGce6ikRo
	n7xMwa5ToEC1rDMFKz8wEBTwDxbEj7w25arOv7NQzrOENGan/uf45rGYIbbG6posqdtBstewXq7
	Mk=
X-Received: by 2002:a05:620a:25d4:b0:93f:12d4:67cb with SMTP id af79cd13be357-93f29e0edf8mr1056254885a.80.1792378893364;
        Sun, 18 Oct 2026 20:01:33 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93f3c61c440sm216840185a.10.2026.10.18.20.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 20:01:32 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: maxime.chevallier@bootlin.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	richardcochran@gmail.com,
	p.zabel@pengutronix.de,
	peppe.cavallaro@st.com,
	joabreu@synopsys.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	daniel@riscstar.com,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net-next 0/5] net: stmmac: enable Toshiba TC9564
Date: Sun, 18 Oct 2026 22:01:23 -0500
Message-ID: <20261019030129.1470307-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series enables the two XGMAC interfaces present in the Toshiba
TC9564 SoC.

The TC9564 SoC connects to a host using the upstream interface of
the PCIe switch it implements.  The PCIe switch has three downstream
ports; two are exposed externally, and one implements an embedded
PCIe endpoint.  That endpoint has two functions, and each of those
has a 10 Gbps capable DesignWare XGMAC interface.

This support was originally submitted earlier this year using a
PCI driver within the stmmac source directory.  This version
instead implements a platform driver, "dwmac-tc9564.c".

					-Alex

Alex Elder (1):
  dt-bindings: net: add support for Toshiba TC9564

Daniel Thompson (4):
  net: pcs: pcs-xpcs-regmap: support XPCS memory-mapped MDIO bus via
    regmap
  net: stmmac: dwxgmac2: Add XGMAC 3.01a support
  net: stmmac: dwxgmac2: export symbols for XGMAC 3.01a DMA
  net: stmmac: support the TC9564 SoC

 .../devicetree/bindings/net/snps,dwmac.yaml   |  26 +-
 .../bindings/net/toshiba,tc9564-xgmac.yaml    | 327 ++++++++++
 MAINTAINERS                                   |  10 +
 drivers/net/ethernet/stmicro/stmmac/Kconfig   |  11 +
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   1 +
 .../ethernet/stmicro/stmmac/dwmac-tc9564.c    | 590 ++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  10 +
 .../ethernet/stmicro/stmmac/dwxgmac2_core.c   |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_descs.c  |   1 +
 .../ethernet/stmicro/stmmac/dwxgmac2_dma.c    |  70 ++-
 drivers/net/pcs/Makefile                      |   3 +-
 drivers/net/pcs/pcs-xpcs-regmap.c             | 169 +++++
 include/linux/pcs/pcs-xpcs-regmap.h           |  13 +
 13 files changed, 1214 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/toshiba,tc9564-xgmac.yaml
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/dwmac-tc9564.c
 create mode 100644 drivers/net/pcs/pcs-xpcs-regmap.c
 create mode 100644 include/linux/pcs/pcs-xpcs-regmap.h


base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
-- 
2.53.0

