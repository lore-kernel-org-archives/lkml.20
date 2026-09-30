Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13039483832;
	Wed, 30 Sep 2026 10:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790764470; cv=none; b=BLHetyFWBPVaWg1YJotkO/qIx+TTHRS2hAfdCEbR3lZnPhoaZYUWF2hl+h1gxrc1ISG1luBlcRjtDlXxyBRBAtyRxSrKUnnUkpPLtcBThKZ2inT2UlD8AxGijeqE8ClO0JopX52WMOekdUhWV2YhTe8xga7FmZzUC5SoQe/zfmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790764470; c=relaxed/simple;
	bh=ukCCdctMkNx+zbqOAcgTBacNhDYqQTU5G7RR/j5HpZk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=I7UtppJ4OFehbfB6kV44klR3FE4Lde1fWlS2tV6NvHrCc0LAfoo3GlEgC4hZ/SwTpqfLcANH2jcqgIU9YJxKEcGXDUlnfl46+6iMN/cfUMvYHtrkR4h6XQLCrWtYMZ3fooArJskiDv3lQW2cVrjRlhQK9R+2/mcAWb0O4IvebXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=DeId9KKC; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="DeId9KKC"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=oNXoQLGJPYIyqmegQF8ZeOlBHbHDVMfq4HhnXwXvDpQ=; b=DeId9KKCEjwRWHlVV0tRxH9sYE
	aMgzvJs8P7Ebt9EUX5mFU91NAOQbXQJLdoH0AlEFD5kOA9kUY3tiIJy9tcKftbembo2eZr8t26NuG
	zqnLGU/1FswFRVSlOsaXty8Qe8Bpz935C35Sunz3YGuEV81UFc/7O3mliB5eMZGdZwKVxRzds4y6J
	CAJp4SM4o7fcoqakGgv9I2s2XtaLMdriGguSWzbf+taEnGwRMYWT796MECyeHoyRMiSdm+QdGE0Kl
	COo8k83OPWAyfN+f8BjxL8loW192l0UVKQlZrSjMMWnUasvL/rFgbGd4lQ//8mKKyM40/khOtxnJy
	jjoEheAQ==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:46122 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <primoz.fiser@norik.com>)
	id 1xBrds-00000000Z3d-3ED7;
	Wed, 30 Sep 2026 12:34:26 +0200
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
Subject: [PATCH 0/2] ARM: dts: imx6: phytec-mira: phyBOARD-Mira fixes
Date: Wed, 30 Sep 2026 12:34:23 +0200
Message-Id: <20260930103425.2315286-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
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

Two small fixes for the PHYTEC phyBOARD-Mira-i.MX6 boards:

- The i.MX6DL NAND variant was still described as the LC (Low Cost)
  board, missing CAN/PCIe and capped at 100Mbps Ethernet, while every
  other in-tree phyBOARD-Mira .dts is the FF (Full Featured) variant.
  Sync it to match its siblings (1/2).
- Since commit 888e5fad9b78 ("Input: stmpe - add axis inversion and
  swapping capability") landed, the touchscreen axis inversion these
  boards need can be described in devicetree instead of userspace (2/2).


Primoz Fiser (2):
  ARM: dts: imx6dl-phytec-mira-nand: Enable all peripherals
  ARM: dts: imx6qdl-phytec-mira: Add touchscreen-inverted properties

 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-mira-rdk-nand.dts | 8 ++++++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-phytec-mira.dtsi        | 2 ++
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

