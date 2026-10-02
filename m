Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2181FDF59;
	Fri,  2 Oct 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928873; cv=none; b=Ch/shdR70s8pyKLcVXYkvY4sgpV7INsvq9iGyd6f3LriG8TEXs0qcqEya7EcHh2E1jzVzGzExKaBUuwBj6w4491nB5B7v1a0ZOhpRJE6yboMkkvN2xY/H7lrbTNtQzPwiqDqwKkUO/Qlc0BmvZzAy0cy3rZ5eUvUijMifXfQxe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928873; c=relaxed/simple;
	bh=JEyVgfCDTLKokr2ysYcGaVXbW3W0ZDrkrl1I9QS6Oto=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p8eCKrn4+ET6mfYayCi812vsP7LiEcfLueh4gUUevg2kOICHzQGGwew2C7k25Pc4A7mnsUeZIpCvmNvTVlXRI0m+rF4Fx+C3BHg7gqi+BlVOz8q074spBKnvzV6MDCeAWwdXrNERmkvG1tlPNyitIAzXMik1Sp59+hmYchFFHok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=gdJMjugm; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="gdJMjugm"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=15C1/PrEf7ZjkNNplh2i9I6O4gZf0CPqQkVg1ifly/4=; b=gdJMjugmgDTA+n8/TrvZ7YEp5f
	IMKFCkh5qODnCNDVQADyUcPvXW5b09QId9WHoyNFQ4MBA3eMilx2MRNoOPqjYw2r1Xu9izSkfHpo0
	9IvtnIOrzUHPa4u+LIsxOm9OGnBpfVNErL0OHGkfimDpsv+QunLmx8eDq9jJDiaQ6tk/r8zyqz4AO
	hYnPI58pSgKcPfg+gHijOtssLvfJumUtYSt/nyof0fURKL7fMkoJa3Ym3R9p8SS7fD0luixWhArlL
	MKwSBgM96ZIfdQlFTaW+JleWdMNFmDy1rgm9KdCoORdVrLxWw5xEbhcnzBE2abVGL6skUcvyewkZQ
	KQPrZF+A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-0003OH-21;
	Fri, 02 Oct 2026 10:14:24 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-000FgI-1U;
	Fri, 02 Oct 2026 10:14:24 +0200
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
Subject: [PATCH 6/8] ARM: dts: imx6ul: Add parallel display DT overlay for TQMa6ULxL
Date: Fri,  2 Oct 2026 10:14:07 +0200
Message-ID: <20261002081417.2092471-7-alexander.stein@ew.tq-group.com>
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

This simply reuses the .dtso files from TQMa6ULx.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index 3d34af776a5bb..e86b9c1a63005 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -424,6 +424,8 @@ imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx
 imx6ul-tqma6ul2-mba6ulx-cdtech-dc44-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
 imx6ul-tqma6ul2-mba6ulx-cdtech-fc21-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
 imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ul-tqma6ul2l-mba6ulx-cdtech-dc44-dtbs += imx6ul-tqma6ul2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
+imx6ul-tqma6ul2l-mba6ulx-cdtech-fc21-dtbs += imx6ul-tqma6ul2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
 imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
@@ -431,6 +433,8 @@ dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-cdtech-dc44.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
 
-- 
2.55.0

