Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75A834D382;
	Fri,  2 Oct 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925288; cv=none; b=M2lydA35WyV1svEIqIld333XWpc5Bogbw9UsCbBZpoSHCh9r4rbisMqa/zaAjDnNqZ5KUUP/p18ai+C9T30QXUrIbrWLbuwhiJ6B7B7JC9SHC6PkQXfl9r/UyKY3N/WMXuLwq4MViOcHZgZWbj3nKF4SAIqpXXpGuhoyOwBVo4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925288; c=relaxed/simple;
	bh=e5qU1U/SoBEX6oCfEVO6yRW0FuRAIjjm+qYz922Ju+A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qa9BsJTUyoVurJXZNpeT6aGfRurm99QVQuMNFgvrX0hnpqB1GNFUPWeay/XziPCyiKiVLekvKtBQWwk1kGq5CKqi2cDMwQW0xA+n5EGQrDUgTUsNO7rx3lyWJacINen+7XOMLyfy5tfyX6RpFJqFZcRF4p6asOJSHHQSwC3f/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=ou1wdllR; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="ou1wdllR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=eZrXGlX+EZMifV9sD1JVbsaTI6nB8lFWJi0Lwr2/Cbw=; b=ou1wdllRYl1Dw1ozi6wqiB0M/c
	ZnzBXWoSN/DdVpu31A9WQZW9V6FjIYAUfJ5SSc1E7R4i/7c53RXugX949wDAtW6pJkzL71FJWOCLK
	znHYxknUfFqEN2H3C5iAtY6z2oY2RtPVwC+u7nBb4ynrzF58tZ7+FNRxs00vB0mtHsXdc9ZRB0O9Z
	i01GzX3y6or+t+j3gVjzZ8RRMofwQ4DWQNxdMn1lo6dIrsI2CQGuMA8zciLOivlpZrKWQ9Wrnjvt0
	YidALhYblAMguIllY9TCLc3Ephd1fvrUgLDGE0o+oZXZ8tI2qjI53K4eM5iw0hbS9TYrM5SBYCbdY
	zsslijeA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50874 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCXTg-00000002ntQ-0611;
	Fri, 02 Oct 2026 09:14:44 +0200
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
Subject: [PATCH v3 1/2] ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties
Date: Fri,  2 Oct 2026 09:14:40 +0200
Message-Id: <20261002071441.2499132-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261002071441.2499132-1-primoz.fiser@norik.com>
References: <20261002071441.2499132-1-primoz.fiser@norik.com>
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

Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
swapping capability") we can handle touchscreen x- and y-axis inversion
directly in the kernel instead of user-space on phyBOARD-Mira-i.MX6.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- no changes

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a3c2811e9c6f..a7d6af162731 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -164,6 +164,8 @@ stmpe: touchctrl@44 {
 
 		touchscreen {
 			compatible = "st,stmpe-ts";
+			touchscreen-inverted-x;
+			touchscreen-inverted-y;
 			st,sample-time = <4>;
 			st,mod-12b = <1>;
 			st,ref-sel = <0>;
-- 
2.34.1

