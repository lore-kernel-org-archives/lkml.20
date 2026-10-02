Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77795370D47;
	Fri,  2 Oct 2026 08:14:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928874; cv=none; b=FkArSl3yGQp5DJZAmxMvU3qizIbswIqDN2CEyYhLqP4cUAdsU/JJAg7R2yRSwAHYDwjv6jsd34pd3Ng1A1asnh9ROf52rBdjvg1cWpLBE5D5U68MpS1gzpdPHXqHMwC8oWDF34729SQhDLkb/aqN3fR9vTDagepPvWAR/23YVlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928874; c=relaxed/simple;
	bh=c3ZaU4AhtEBP2fq+3Ed22+Pt2w6kG7GlIwr4xue+BK4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ENeOqasHENeH/9jFe660aZMwkBFPqF6btv9POw8txTfjrp1CR7zYXITzeCBCn54mNmFILQ5Mg40Lkh+dfX/clEUb5+GtRXd0hOD8Zk3UZIP7TD/qiDil5PFqPV9deBkC4+vwVtwVR49xYmDJr1TpTO2VXBV6+NOydpw2FG6mksM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=LiBTnYP9; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="LiBTnYP9"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=ZamOMuX8MjxB2Lt+kgQ5ZiA6K6uBqGHTdwsr76SIOFw=; b=LiBTnYP9ABQcIS0KSC8iySTdMc
	5ILZP8qppLxvLzzFeOpRTxQ6XOtUX7o3x1HEAlpDygcvtspw8dQmDhUMsVji2rKvctYWcUY6j21K+
	fjpicrsjAwD+//FIODNJhJxbJ5tUrUxhTqBMkHjvqGomS1afjXza0QwLh6wX+2/xLP4KedOFiZ5Bx
	dvuuBaJ3KlZi9Cgr34O9OVgZd0Y4Gt/qtGhkdhZ+vSBaNpQfNaamkF9Rn7Rnd5SVPL+wFyZRNUb8T
	xmk1p88Lus8apdUqh2Hi1QP/aDy0MkJ5FdzLJpydWleqo9MvDolwCaypPhxpkIXruZIFJhCfjn1JJ
	eBytEc7g==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPO-0003Mw-2i;
	Fri, 02 Oct 2026 10:14:22 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPO-000FgI-2J;
	Fri, 02 Oct 2026 10:14:22 +0200
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
Subject: [PATCH 2/8] ARM: dts: imx6ul: Add LVDS DT overlay for TQMa6ULxL
Date: Fri,  2 Oct 2026 10:14:03 +0200
Message-ID: <20261002081417.2092471-3-alexander.stein@ew.tq-group.com>
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
index ea0799ba1893e..734d40b8d389c 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -421,8 +421,10 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
 	imx6ulz-bsh-smm-m2.dtb
 
 imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
 	imx7d-colibri-emmc-aster.dtb \
-- 
2.55.0

