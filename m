Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD223A83B1;
	Fri,  2 Oct 2026 07:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790925288; cv=none; b=eu6xFYM4Y56+kOWU9bI+OJubUbWXC/oXn72kE+KzOlM9yfOYEF2GzIuNljg3IyYRc044mK7Qif2Dd0XHjhsQpVmysLMTJ971xJYvXg97acI1wGNTRyS2OMK00qM5dQdxVnuR27PzlYDOxvsmwqLtoVF1Q17wlZXP0j2PGtTDvUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790925288; c=relaxed/simple;
	bh=lqYgtkHfcGG1Hc07mh2tfwZkVLkpruwUU8I4k09G54Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X+KsHiM5+4G1sZutAdwXNgGzFNUBCnxEjKgumGwmRiQaOpiGrCkcqZP9gDKiewDUiLVisqqXcQ5A6q17oHMLubvrKqwmHzHis+e5pfH2gt/oIuJ/UDCl8sFwrUMDq4D+akZJtzZaMbwB83FFU+1Y6gRVTl18LFTDCWwGq2nKfc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=UKqQXx99; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="UKqQXx99"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Unsubscribe-Post:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MNzDwuLi57xshjL/neWiu2RuuYKEMPl9QJTsvFxHCEg=; b=UKqQXx99EEYgsShGpnFPdXae/8
	2fR+SMN5tTGWrcCUJA+moinM/H1A1lmBHjCS6jRbtqcHUL9B/lY88B/BCvPtyDS2/eaEGErSnUSGH
	jY3VFuKNtPHCTTyHQLPxkK5Dszahj1bkSiiuDWj53YPDktFSHMX0QQzN+TRaaOOpg4Seq6l6fXcwp
	LqjIL9P5dYtP4RJEBYwC0yH52BJ9FZBCa4EgkSa/qWQR1DQ2Xbo076CkUQ5H8MGrG1duM6bgZrkrh
	1oQEvWaM2U3sNbjZ3wqrfUlvdC4eNsVHbzJe4wNuLwCbxBs/3lcEJU3HNEYpI7bxjkJ7/GD0qnBcj
	wTCkY6zw==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:50874 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCXTg-00000002ntQ-0e4H;
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
Subject: [PATCH v3 2/2] ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing
Date: Fri,  2 Oct 2026 09:14:41 +0200
Message-Id: <20261002071441.2499132-3-primoz.fiser@norik.com>
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

The pin muxing of the UART3 CTS and RTS pins on the phyBOARD-Mira is
wrong. They are swapped. Pad EIM_EB3 has to be muxed as RTS and pad
EIM_D23 as CTS.

Fixes: 800d595151bb ("ARM: dts: imx6: Add initial support for phyBOARD-Mira")
Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v3:
- add Fixes tag

 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
index a7d6af162731..8b2b4ed76328 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi
@@ -374,8 +374,8 @@ MX6QDL_PAD_EIM_D27__UART2_RX_DATA	0x1b0b1
 
 	pinctrl_uart3: uart3grp {
 		fsl,pins = <
-			MX6QDL_PAD_EIM_EB3__UART3_CTS_B		0x1b0b1
-			MX6QDL_PAD_EIM_D23__UART3_RTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_EB3__UART3_RTS_B		0x1b0b1
+			MX6QDL_PAD_EIM_D23__UART3_CTS_B		0x1b0b1
 			MX6QDL_PAD_EIM_D24__UART3_TX_DATA	0x1b0b1
 			MX6QDL_PAD_EIM_D25__UART3_RX_DATA	0x1b0b1
 		>;
-- 
2.34.1

