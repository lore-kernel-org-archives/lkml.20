Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D06BA3DC4DE;
	Thu,  1 Oct 2026 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790838594; cv=none; b=qT5keSv7dOQdRqbc8cLlFqcN9uSLTdZ4SyX0Nwqr9o/cGKx5DYf6myyRGJyRShs0Pqgvyk1pt1GAmkqAav8FD7wt8CMUCnSgZq/y2wjCQDFv/N2Kn3YmmgPLYd+WKZfp3HI/1MKKxe9YYk/M2Chkq71RgFUkpSwxr5qFgyZ1dK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790838594; c=relaxed/simple;
	bh=+v3Jga9Ob8QUQLmt05TRrSn34heKO+eaOCT1t0h71kk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=FMOGjIJZDIvGrhfZyIPUt/qTlfAL60ohrh06MfxSBzTOZqlXF78aXnCqTgBqVDSVvt6q8AhkFifT3kLZg3g99qtJj5k69UmJVJptnYG9aZUfw9O087mRiJ8RneRw8UomyjPtg9/ey4fg9KJM09m1sPRxiKbUloxXKKQJH1DSlRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:41660 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCAvR-00000001Ztc-04YD;
	Thu, 01 Oct 2026 09:09:49 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v2 0/3] ARM: dts: imx6: phycore-som: PMIC and PHY fixes
Date: Thu,  1 Oct 2026 09:09:44 +0200
Message-Id: <20261001070947.1815279-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cp2.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cp2.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cp2.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

A few small fixes for the PHYTEC phyCORE-i.MX6 SOM:

- Pin the DA9062 PMIC watchdog to /dev/watchdog0 (1/4).
- Raise the PMIC's SOC/ARM buck ceiling to 1.5V, needed once the
  1.2GHz OPP tier ([1]] requests 1.3V for VDD_ARM and the anatop
  LDO's 125mV dropout is added on top (2/4).
- Add phy-reset-duration to fec node for more robust reset pulse (3/4)

[1] https://lore.kernel.org/all/20260923070505.494949-1-primoz.fiser@norik.com/

Link to v1: https://lore.kernel.org/all/20260930102532.2262700-1-primoz.fiser@norik.com/

Changes in v2:
- Drop patch #3 from v1 (converting to reset-gpios) due to potential
  backwards compatibility as suggested by Frank
- Convert patch #4 from v1 to patch #3 in v2 (use phy-reset-duration)

Primoz Fiser (3):
  ARM: dts: imx6: phycore-som: Set PMIC watchdog alias as default
  ARM: dts: imx6: phycore-som: Increase PMIC max SOC and ARM voltage
  ARM: dts: imx6: phycore-som: Add phy-reset-duration

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-phycore-som.dtsi | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

-- 
2.34.1

