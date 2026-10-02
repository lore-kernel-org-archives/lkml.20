Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2199941A563;
	Fri,  2 Oct 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928873; cv=none; b=lsygCW+ooxneOyQv8gFGODE9W2+/k0oFG16uuZA2dSPuILVPlmDqSYCZJ8gGjs9a814wXOAGgUO50aP7e+9uXXmy1kwJBtN+mQIidWKvpPOJTD2lDI8gYRujbe4cI4ohDycpTE3F9ZW1MILfw7hPxZIjYmqd7BOxzFWDoLEaR5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928873; c=relaxed/simple;
	bh=CeH+/ZMm1WiWur/ylajbbm8fAXKjlGS5UqiLBWWVWhs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKpkOJtNlxTAdmU3AXFGmUHiZLKiZIKsIqzItMG6eeEMf2BPa5h3wZPlINIPjJjUCOZ9DllHCr3L81BLT/2bDtt/E759uvE9uxsvW+o48v9eUHnQMcjsJ2nfTZde4J7Zeh2K+MwFjuLsS21bbPl19tCu4PXfYg8lyfddLAH+2AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=oTBNFV9n; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="oTBNFV9n"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=pFNOETbNbTtMIOU6B9QL7UsZgovwmWkZI+ERbhiiZ7w=; b=oTBNFV9ndqzZsy30hg+Xbsjvtw
	8f7txofiHum0vEFD6WxwACswwPllQHE982l508YpYD+aDXOFpHi5TARp7HcZXh/fZ2GzTRRQeTfkf
	8+KuH+CF1YkAOm7lfgVZ7lq9ltUIlD0cTcOhjVWzDMz2jVMvCXWJ1InBLkJSRTgkj+4niOnHOLQEQ
	Hx3HJeXcgZa5EJN3lI2yUuzT7kz1dBhxHahhIQyGHm18LqbpYp9wiQ044ndo6/81C6ZtuJhvC8b20
	usp8+EgcLJqt+9tOQmW+gJMAZXJTh64eRwRYxCQ6t+s5WLj6+XdV1AyV+D6UQQGaETFHN28Y91ycp
	45LK/KOw==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPP-0003NU-2G;
	Fri, 02 Oct 2026 10:14:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPP-000FgI-1t;
	Fri, 02 Oct 2026 10:14:23 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 4/8] ARM: dts: imx6ull: Add LVDS DT overlay for TQMa6ULLxL
Date: Fri,  2 Oct 2026 10:14:05 +0200
Message-ID: <20261002081417.2092471-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
References: <20261002081417.2092471-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28141/Fri Oct  2 08:26:12 2026)

This simply reuses the .dtso file from TQMa6ULx.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 1a84026e6df0f..08d88adce2b7e 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -423,10 +423,12 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-- 
2.55.0

