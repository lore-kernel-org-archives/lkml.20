Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 723653EA955;
	Fri,  9 Oct 2026 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791552363; cv=none; b=XWEIiMjxx7p5SAT5qMU38xz4Qp5kbyApSj4dy39hoZ2AOMBtUZBDzxGF4nopHzY3KwB6DLpUgxgCOdOMf/BAGkXjVokJaqMHuQqe/VYqei3TTJPQ816mWiKxCTiWd/xZ/2qNh+mcLVFQQr3+l03fI6CFL7yRubHba4eyc0B4DFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791552363; c=relaxed/simple;
	bh=NRH/qbPacvl2o4g5rpTxQnNXgCsgo84BgpCadEHsy60=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KtTA/bpZylQG8FKRKKHuVybzyU7HxVQ0AYEAxJ5wczZUSwZehDt6U3oN+3Uurz/f6PUzby0Rs2U8iwL+X/5AoDIs6AfxESwOwIZQqvMRIi4uONHKRMnywh+1mcTvUlv6uJTkvFRkzOE16TRQtJhw+ISHaYI9MSClYbkpG9oaciM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=pXreqyPS; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="pXreqyPS"
Received: from francesco-nb.. (90-182-211-1.rcp.o2.cz [90.182.211.1])
	by mail11.truemail.it (Postfix) with ESMTPA id BEA021FCCA;
	Fri,  9 Oct 2026 15:25:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1791552358;
	bh=Z8Cz9UcWjAsiWLhCbUep462Inxeiieahrt2pMg/j+eg=; h=From:To:Subject;
	b=pXreqyPStB0ZpIQDqLInCmIk/4JP7QcIYVQ/wZWzAxrNv5d45ysXDC/vDsSFmc6zu
	 HlCdOg/CBDizKPWHgGOHlE8Rb2V5fYWtxkwzpKdazPlx2rLAdNk8UVwWV49rhSKXKh
	 OYsKSMEBZUdUcNCuLg4IUqPAIyppk9Ii19poH/i4ujRg2m8kXvlbQ42h1AVpbmeNrQ
	 YBmscAd7wL0DoHgknmzuA4UtYikQYvcJrT2e1MfjzHa5wSHuI44Fo61uiyhkLSjMmi
	 b/zrS5djWA6m58xemmQMjbRDmGH58rLAN84NY2fXE5FdilkYHGxQwKslylfsn0jKk+
	 A7NiWXsFWeGUQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev: Fix USB_A source PDO to 900 mA
Date: Fri,  9 Oct 2026 15:25:47 +0200
Message-ID: <20261009132550.20793-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261009132550.20793-1-francesco@dolcini.it>
References: <20261009132550.20793-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Correct USB_A source PDO from 3A to 900mA.

The USB_A Type-C port on the Toradex OSM development board can source
only 900 mA on VBUS, but the connector advertises a 5V / 3A fixed PDO.

Fixes: 39be5a7e3ecc ("arm64: dts: freescale: Add Toradex OSM iMX95")
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
index b3d54be07c43..e9646b3ca899 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dts
@@ -207,7 +207,7 @@ connector {
 			try-power-role = "sink";
 			self-powered;
 			sink-pdos = <PDO_FIXED(5000, 0, PDO_FIXED_USB_COMM)>;
-			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
+			source-pdos = <PDO_FIXED(5000, 900, PDO_FIXED_USB_COMM)>;
 
 			port {
 				usb_c_a_conn_hs: endpoint {
-- 
2.47.3

