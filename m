Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCFD3B8D78;
	Thu,  8 Oct 2026 05:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791437944; cv=none; b=Mbekd3zS0srt7WQiVXKqx3r7FMMUihD1Cd3m+5dPxq/NecNiNRtjR258TdQSjFYPTWtBYH8T/jw8J/kjz8DfpAxdfPomaHJJ3eZl7+Pf7OI85yAuiF3KIeD8Uou/fjTEb4YT8MvV/FBD2DRSd8e0CEK9e8Y4JJ6ssgnylhd51bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791437944; c=relaxed/simple;
	bh=YI4CnZX8s6Y7XpVJgHXDSyN5ayF3LQMlPgYNuz8D7RQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jRZGogrk0OTvHrNushJr2VHo0FyWV8hzav3UbYozZ528ZkzBvb3PB055q//PzZ9pXCL1PkUEciqwb7hPu9ucTNiPDNYbzuybU+s/RYzF0IS6CDalxpm1TBiu+Qqk8EZzZf0Qn5Vsh+ohnWTX8CkJCITIFQiTcwnPObvWqHEbo1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=bJrPcDPG; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="bJrPcDPG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Qf8C91/YkTRnGhfkIBW7/sOYo/dvYKzyIqnJrU16xfU=; b=bJrPcDPGtxII2XFGW41gZ5lOe8
	yZA26pWprcJK+VMw0cBpu6Q/l2aaMNCDC+52aUpai61oOtMzjt7Fp//bIK/iMICXWgxmqeMs93F//
	mroakPTElf8Fx/agfVzIJYXC4yqZQieES2CaAZcprBzjQLZupdXv4qUCEm9yizpnXdXksJKN5PgHf
	iHoCFD74lcYXiuH9bSWm2amrG7mgDidJbKK+my5a6Wmn4LB6ONr1Q1jyKfZW6sEfp+XF+5/p//uKA
	YdAwy167asC6KhZpWrN8AU2DRmqXT+zMTDpiw+1IE4vrhLXBfPuzQmXRK4u/It4rOWZwezAsR5Gyl
	SjZHLS0w==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46684 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xEgqG-0000000AIc8-3Y18;
	Thu, 08 Oct 2026 07:38:54 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] ARM: dts: imx6qdl-phytec-mira: Switch LVDS panel to 18-bit data mapping
Date: Thu,  8 Oct 2026 07:38:50 +0200
Message-Id: <20261008053850.2941955-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261008053850.2941955-1-primoz.fiser@norik.com>
References: <20261008053850.2941955-1-primoz.fiser@norik.com>
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

The phyBOARD-Mira drives its LVDS panel at 18 bits per pixel. This was
previously done by always overriding fsl,data-width on the LDB bridge
alone and leaving the panel node's compatible, "auo,g104sn02", resulting
in LDB and the panel disagreeing on the format actually in use.

Now, declare the override on the panel side too, via the data-mapping
property and use "jeida-18" which resolves to RGB666_1X7X3_SPWG, exactly
matching what fsl,data-mapping = "spwg" + fsl,data-width = <18> produces
on the LDB side. Both ends of the link are now consistent instead of
silently disagreeing.

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index 8b2b4ed76328..50e5bb22b9f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -121,6 +121,7 @@ panel {
 		power-supply = <&reg_panel>;
 		enable-gpios = <&gpio2 28 GPIO_ACTIVE_LOW>;
 		backlight = <&backlight>;
+		data-mapping = "jeida-18";
 
 		port {
 			panel_in: endpoint {
@@ -204,7 +205,7 @@ &ldb {
 
 	lvds-channel@0 {
 		fsl,data-mapping = "spwg";
-		fsl,data-width = <24>;
+		fsl,data-width = <18>;
 		status = "disabled";
 
 		port@4 {
-- 
2.34.1

