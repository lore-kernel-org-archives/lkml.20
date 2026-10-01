Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655453CC7CD;
	Thu,  1 Oct 2026 08:10:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842213; cv=none; b=JLsE+Oi65Q4hvljhkJgAkJXKq1xlk0gvkdJKqstvWzkyIzvSdiln7uLBKjuryBKlR5DopttfEtTbpInj8PtAJU8RwkrFt91BuZIvLA2JbKkfLocSR+8I+Adp4cb60wX3mE/FzhGytk65+3zsnR45sKjcbWG++inaiTZFhqmAouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842213; c=relaxed/simple;
	bh=SnDnW7CqZ806GxEmRL+azCp6ZV2OjF89RT/x8tnFRK8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=K4DbPJMTXu3dwu0TDFDkTnDG0YN5sB6/0X97dBafYCulfUvcxC0I8FIbS8WVahenfZvppN6ZKQaM/dY/cbqaWWcbq/NCWjKtR8ViyIQDyKBr1fCiJ0PUqR1EhRQOJjccSgmG1kbHlGwM4PbQRN3RqSpg6OjGlsrPhaGCnb1DROs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:34824 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xCBrn-00000001der-0UkL;
	Thu, 01 Oct 2026 10:10:07 +0200
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
Subject: [PATCH v2 2/2] ARM: dts: imx6qdl-phytec-mira: Fix uart3 CTS/RTS pinmuxing
Date: Thu,  1 Oct 2026 10:10:05 +0200
Message-Id: <20261001081005.2209755-3-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261001081005.2209755-1-primoz.fiser@norik.com>
References: <20261001081005.2209755-1-primoz.fiser@norik.com>
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

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
Changes in v2:
- new patch

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

