Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9105742124F;
	Fri,  2 Oct 2026 08:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790928873; cv=none; b=oa1QRIgBA8CP7Fxho1/WZ3a07o6D4bffYoC26zb2KVDTvzraQhw0SkQHqTewKnA3rDT8nTD2rNrdnrPbb183QUlGotTVOp4q2I4cwQyCzxFIwiKicDHF/V5NIpqICusa3XrFtbbihJ5FfaETNk5uOTLo2mAd9QjDkTn5lh0/EH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790928873; c=relaxed/simple;
	bh=aPd9UKKG080e9mf2yF2UkRH5oQ9+/DqjWoKtTvod1CU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDC9EF2Ei9qjbqhFsWYX9SXV8JiYsBgQHzMpVGrR+6kvHNAvb+3zQi7UKVuS09ih0OW+/qMq3UpKR+Lrr7vTuH6nGXWnJPGXAaa7+5XDE/fu6aQCc1MUmyxAh9qh/6z8yM2ihOgzpTnUFEWfCtdrd15VvS1eQ0ha2AK9Ywm0ePM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=nzHODN3+; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="nzHODN3+"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=mBCw8pns3Yy1YTb0ugMeG3QUzggR1ln+om5qVhUBd0c=; b=nzHODN3+AnpUFeYjM0d3Uv1UOu
	l44XvruTPewNvaSxLx3EQgQg6CqunIn7b/d2Gv33flS1ImeDj6H2CCQx3rPd7H5aoWNDvZP3yStNw
	qnA9MmK2L8Wf97vEO/goLNUcZrjy6fEI28dOsmxhi34SP74mIOsk5czAy83Kgqx01FaweRVxIQTRP
	kauF9LyBUeKcG7lj7KocjUMHmlKItBsE7sT2uCCFNDxMEeCTBvWdx9dKMczKgOuaq8nJH8T+eHp5g
	7O7MT4N3pJ+JQyByLsaCqMpC2KuZEbdtGKWvrBnR7AR08fJVLZ8Xzq0GrGyDwVGxhBcsgHv6xFjb8
	oKGX7s/A==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPR-0003Oc-05;
	Fri, 02 Oct 2026 10:14:25 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1xCYPQ-000FgI-2t;
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
Subject: [PATCH 7/8] ARM: dts: imx6ull: Add parallel display DT overlay for TQMa6ULLx
Date: Fri,  2 Oct 2026 10:14:08 +0200
Message-ID: <20261002081417.2092471-8-alexander.stein@ew.tq-group.com>
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
index e86b9c1a63005..5f190900904ab 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -427,6 +427,8 @@ imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ul-tqma6ul2-mba6ulx.dtb im
 imx6ul-tqma6ul2l-mba6ulx-cdtech-dc44-dtbs += imx6ul-tqma6ul2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
 imx6ul-tqma6ul2l-mba6ulx-cdtech-fc21-dtbs += imx6ul-tqma6ul2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-fc21.dtbo
 imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
+imx6ull-tqma6ull2-mba6ulx-cdtech-dc44-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
+imx6ull-tqma6ull2-mba6ulx-cdtech-fc21-dtbs += imx6ull-tqma6ull2-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-cdtech-dc44.dtbo
 imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33-dtbs += imx6ull-tqma6ull2l-mba6ulx.dtb imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtbo
 
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2-mba6ulx-lvds-tm070jvhg33.dtb
@@ -436,6 +438,8 @@ dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-lvds-tm070jvhg33.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-cdtech-dc44.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ul-tqma6ul2l-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-lvds-tm070jvhg33.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-cdtech-dc44.dtb
+dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2-mba6ulx-cdtech-fc21.dtb
 dtb-$(CONFIG_SOC_IMX6UL) += 	imx6ull-tqma6ull2l-mba6ulx-lvds-tm070jvhg33.dtb
 
 imx7d-colibri-emmc-aster-panel-cap-touch-7inch-parallel-dtbs := \
-- 
2.55.0

