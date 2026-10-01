Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655F93E5A36;
	Thu,  1 Oct 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842212; cv=none; b=GSSfh/OyN/+yLx79CfGepmA3cK4uFlOaQDzRybAcADktmtCRqWvJ8qKMWp85WuYkRBiNn2rEw6QRaVhl+C0csDHDc2iuRK1UsITgL/LPueHMFpGBmJy9ea4iIeEe93C/z7Icg5067KPTE/FobEK3dL9OBAIEp5ikcTtL7NRSqK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842212; c=relaxed/simple;
	bh=h0N0fJI6BAPv6CV8f5lZ4DWJCEt5mF4R8FpUBYR52Bw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ppX7bgVCGhaA3O2oMwp5qx19xQ8Hc8C7V+PGwsHRG+jyYL2bpBhFu2Q7aAephf8z7s13KH7zfSMP39eag51pp/L+9cmlWzTSsDP9Oh6ppmqoc9PhXLHZYySAgWtTp1kg4QSMPV7rIdYmO+Wj3Z/AJd3Qd4nA3ojTRW2Iw7ltjGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:34824 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCBrm-00000001der-3so3;
	Thu, 01 Oct 2026 10:10:07 +0200
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
Subject: [PATCH v2 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Thu,  1 Oct 2026 10:10:03 +0200
Message-Id: <20261001081005.2209755-1-primoz.fiser@norik.com>
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

Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

- Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
  swapping capability") landed, the touchscreen axis inversion these
  boards need can be described in devicetree instead of userspace (2/2).
- Fix uart3 CTS/RTS pinmuxing since pins were swapped.

Link to v1: https://lore.kernel.org/all/20260930103425.2315286-1-primoz.fiser@norik.com/

Changes in v2:
- Drop patch #1 from v1 
- Add new patch #2 (CTS/RTS swap fix)

Primoz Fiser (2):
  ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
  ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

