Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ADD44CF37;
	Wed, 23 Sep 2026 07:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148840; cv=none; b=niVBTrokYcdFpvlWz8zGGDSgfGspMQjzeIPKJf5sFqC/wRLOutpEztV6IyHw5cO053bUe4aU6TjYq7KpR6OwA3yMEhAheor49oxxcXqo7cKljLS7YTrRhFAhsXFgwH9VFs3M9LJPuTdaN8iu/eGzakXhiK/wtbv9Ajsjj6RrJoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148840; c=relaxed/simple;
	bh=M39+igoGLIwondFbgByGrW/eWy9yRSeWK1t9WWtncuk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P2a2zqtnpz3BtSv1x0yETUYmV27nWgDJiX2HoVi5II40cs+joqykRR9rVXaGQz/uuZkK/Iae7yDRM8ZVriUYYJbB1dHgVfsJGU1FV5SGy+mPgNO2LL7mvZpVSobh4dOluOQcHSjzEBPo7tHn8LxzhzeJ/WWmRDLSxhdMyJvdEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=cIbtTtrc; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="cIbtTtrc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ga3qyzMoZilCY7ey+Tpyr8hgVvSITFqdTm2ZHDsEJVE=; b=cIbtTtrcmPW3vkTjiYSTMTHEmI
	m6y3WBXG50ncm9PliRTCtrzIATWBuGr+xW7U+ojHkzKS0ZPT+TPdibE+nZr0mmB8vgnpllV8Y0M+5
	GjAr273xZACx/SmmsHVgpAC3iZkkBuA24HpOrvLmUNOn1AklI2BD9ZnWehzCnT42EHTmQ+CtjcuD+
	apsfhDIr+vdngzl1ZmvoOBanNI5AQ8Xlj5V5jzftpUnb/y6WOj+f5L99MDQ8cUduKcv4wY3l68Av7
	WbK3sj95a/MufKj7+pYZdflFMglQfHVXlvaHrhcStvPsaZMSF8C6iuCjwyQbeQgS6pHhzDBMyxV3c
	vTtf4MYQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33340 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9H2S-00000009mhH-2NHf;
	Wed, 23 Sep 2026 09:05:07 +0200
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
	upstream@lists.phytec.de,
	Yunus Bas <y.bas@phytec.de>
Subject: [PATCH 1/2] ARM: dts: imx6dl: Add a label to cpu1 node
Date: Wed, 23 Sep 2026 09:05:04 +0200
Message-Id: <20260923070505.494949-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260923070505.494949-1-primoz.fiser@norik.com>
References: <20260923070505.494949-1-primoz.fiser@norik.com>
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

From: Yunus Bas <y.bas@phytec.de>

The cpu1 is missing a label for further reference. Since cpu0 has
already a label, add also one for cpu1 node, so it can be referenced to
add or modify cpu specific properties the same way as cpu0.

Signed-off-by: Yunus Bas <y.bas@phytec.de>
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6dl.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi
index dc919e09a505..78092d94f265 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl.dtsi
@@ -48,7 +48,7 @@ cpu0: cpu@0 {
 			nvmem-cell-names = "speed_grade";
 		};
 
-		cpu@1 {
+		cpu1: cpu@1 {
 			compatible = "arm,cortex-a9";
 			device_type = "cpu";
 			reg = <1>;
-- 
2.34.1

