Received: from cp2.siel.si (cp2.siel.si [46.19.12.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E214944E658;
	Wed, 23 Sep 2026 07:34:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.12.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148844; cv=none; b=XZFwL9yTiLQ9+P7adYDGxANMQ7RcayXAeemdsS48ssToV40R05CUAiLz7o5vaf1MfBle+Vxp/lOT50e71JmLyRVBvLrwexqiou/S2BB2I9/+1nAc12kCs/a3fbQTMADhOXgJDhkJVQTZ5AWtPVTemfDvTwBPy+FwMA+yMI7j+QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148844; c=relaxed/simple;
	bh=jyIUsqld6shd2NWiEvRlNWYJOZn9XbwoKpzwEcfVTvU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BIXsJbdKPxg3rLTpnUK3dmth4SbbC3bQE+NeL5RxN1IBwqU0ztJN3eRDds3vNhIclT+g5eeM3Qd5aFrtCJbqvC4Ge6bkmxXVAg/HymxKQtcGOvDdZq2+gyo6RlinXg2I1YKmAjs3GmGAHJ+vRPq6nrjw+YhfW5Ro3phSqVsqw68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=TpYJ+srk; arc=none smtp.client-ip=46.19.12.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="TpYJ+srk"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=0YJbhOWQ6P/BFcdb7ioetfj13r5KZyDInuOILu/nbQo=; b=TpYJ+srkLVbZQR1ayxWpydpWJ7
	rxlQ2Xs+uNUK1QTBRYSAOvsrAeyp/P673JfUNytwVGGjk8tOuCeDIMHzq1yP4+lnfCyTBXJ5IoZQR
	f1rVeEzvmU1Jaearlv3k8S7B9dP4kRGAyQZcy6ThwD5zh9G0TWxsxjp1RL9hP5ChZDpJJfNtQ9hC6
	nH68fVaxlqc/N6OZzH2pmDLOgZYj6yhCUhU0Pt0EZTL+ntl8yTsRrMHHIjY3/xlmiRuBt8e1rT8jU
	9Y+TFNVFZP9qwK9ThmqeB/BKjGJ97FbpzaaWEQidCCEsB13TJa3qvy3PNSTSH2mzBZp9JGRFIyQwe
	olLOmtiA==;
Received: from 89-212-21-243.static.t-2.net ([89.212.21.243]:33340 helo=localhost.localdomain)
	by cp2.siel.si with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.100)
	(envelope-from <primoz.fiser@norik.com>)
	id 1x9H2S-00000009mhH-1tJA;
	Wed, 23 Sep 2026 09:05:06 +0200
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
Subject: [PATCH 0/2] ARM: dts: phyCORE-i.MX6 custom OPP table
Date: Wed, 23 Sep 2026 09:05:03 +0200
Message-Id: <20260923070505.494949-1-primoz.fiser@norik.com>
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

This is a revival of a series originally posted by Yunus Bas in
February 2022 [1][2]. It adds a label to the imx6dl cpu1 node and
introduces phyCORE-i.MX6 SOM specific operating-points tables, since
the phyCORE modules run at slightly different voltage/frequency values
than the generic i.MX6Q/DL tables.

[1] https://lore.kernel.org/all/20220209223258.1672425-1-y.bas@phytec.de/
[2] https://lore.kernel.org/all/20220209223258.1672425-2-y.bas@phytec.de/

Changes to original series:

Patch #1:
 - update path to nxp/imx
 
Patch #2:
 - update path to nxp/imx
 - reformat operating-points/fsl,soc-operating-points as a proper
   uint32-matrix, addressing Shawn Guo's review original remark.

Yunus Bas (2):
  ARM: dts: imx6dl: Add a label to cpu1 node
  ARM: dts: imx6qdl: phycore-som: Add custom volt/freq table

 .../nxp/imx/imx6dl-phytec-mira-rdk-nand.dts   |  2 +-
 .../nxp/imx/imx6dl-phytec-phycore-som.dtsi    | 23 ++++++
 arch/arm/boot/dts/nxp/imx/imx6dl.dtsi         |  2 +-
 .../nxp/imx/imx6q-phytec-mira-rdk-emmc.dts    |  2 +-
 .../nxp/imx/imx6q-phytec-mira-rdk-nand.dts    |  2 +-
 .../dts/nxp/imx/imx6q-phytec-phycore-som.dtsi | 75 +++++++++++++++++++
 6 files changed, 102 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-phytec-phycore-som.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-phytec-phycore-som.dtsi

-- 
2.34.1

