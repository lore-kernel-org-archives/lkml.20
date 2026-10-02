Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A619E2C21E8;
	Fri,  2 Oct 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925287; cv=none; b=YXVo8CajpZx0Khqr2Iw88JZBuPkcBX3JUPk8W2pT5FjtebHmKqXh1ND0JP7JHQLD/yAiJV/lqqt4QDMCGDTgTogTxI52MpdKd9+VAFVLJh+AbMbX0E2ikdLugzHU5T3tFvGH+96jhG3uyrJHa1SLThSAS3iyT7/sr8sOLOyXWmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925287; c=relaxed/simple;
	bh=45GoacllJSHWIvh2XsuQEUb98NILfBE7qEZuiQ1J1ds=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n3pomEz9v4Y2rl58plNQhiiwobUIE7mVhsZgWaY1JdKPUdl4aGMDJzdiAAipfV0UgRX1We6sDOd8Ot2HhyTYX8Yhivca5vflbblgtC1CtbUwiTiVVhDEV9ITMNCnGduFPw5CiBJC2cRmrF5sNExvv/zyh2gFCLKsFDFG9OeqLm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=fid7qIYa; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="fid7qIYa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=fFdBoFaX4j9Up9APcXN+v0Y044TuolANszoR1h2qSeY=; b=fid7qIYaKfM0+OIjsbb1IrIgEO
	IH4e8U5l99KfbxzrCtp3at3c74eeix4FriNYsyzft5S/pF3MxlcG46Whs/q6gkSQabU8baIbQLdrP
	9zuQMPWmfFubF30zN2CPghI3TZRzuf9DmO8tMOCfYNUK84zD4mnCnD+ChaNQkHujXknPp38AQMnI/
	NL7XvNZ5K+iriLY4rryRxX/C7HwD9DNbQ8LSDNuJwbhbrumBocKIFU/aw51G/AGdQFMoa9j3Ptoto
	F7XRhrD7CRQJatTygbnoW9l5kfWVQ9NwHHzmbj1hpBYOo0TYYHBHEdLw2tJbUwMB9oGfqcIGpYvwS
	xm/y8xoA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50874 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCXTf-00000002ntQ-3mWV;
	Fri, 02 Oct 2026 09:14:43 +0200
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
Subject: [PATCH v3 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Fri,  2 Oct 2026 09:14:39 +0200
Message-Id: <20261002071441.2499132-1-primoz.fiser@norik.com>
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


Link to v2: https://lore.kernel.org/all/20261001081005.2209755-1-primoz.fiser@norik.com/

Changes in v2:
- Drop patch #1 from v1 
- Add new patch #2 (CTS/RTS swap fix)

Changes in v3:
- Add Fixes tag to patch #2

Primoz Fiser (2):
  ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
  ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

-- 
2.34.1

