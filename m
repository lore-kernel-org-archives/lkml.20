Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D88A4BE42B;
	Thu,  1 Oct 2026 22:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790894202; cv=fail; b=JV4Sw5lrbliIACSshq+UKsePJoXYLoEG6J6cC6TbDtGQ8XziL1jYMyXMBoPwq9w+vrnQ7/hM9n5Y4luP3mgvtf7JaZuFuV+dhE/OHw8Aop65NzxCyjxhgoFna164v8TO5e2smcNg+NfjXAgxV5IA1zqMmbw4TYDNubSI0fJAuOI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790894202; c=relaxed/simple;
	bh=F1i+V8goh8vu/Eh3mnvF30uRj8ZdTm/P+98wnSEN56E=;
	h=From:To:CC:Subject:Message-ID:Date:MIME-Version:Content-Type; b=Bp6mNcHwvpRE+Ra3TOc32mw67rdN1O8mYle20F2R4xYSdRIhu/cuyJ6iNfed1+haWeDICSgBMXIrWdo7BxOVLqQO4SpbRPENOJTyDHRBQzDeuXNBSG0TbApePX8BScx0zusdI/Jm+cxpyBYgvnGPnHvWuuv/VocTF3An4B01MFc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com; spf=pass smtp.mailfrom=axis.com; dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b=C2aWOoCN; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=axis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=axis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=axis.com header.i=@axis.com header.b="C2aWOoCN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jggpCqtd5eE0zktlD+LGsMrXNliARJGASNq+lO/ZCXHgJHZyHTOpLFSOIrLjW6sFMEHsZ4ogRabx+jXmJbz+ielffkuuawx8AcCdyOnZRhK/PupXpMAN6fytOTw+fVAZmTgRaJpmAXZ8qGnIT+cu5iqH/VufWCkrQLqgzCCtPsMN3Z2E7IEyfDBgOBlw/Tpzd+D7IerQoaO+03ljTwxbKetLbq4/E++3MEJlw2OwjRPnsLxP3kOmfbCWFMgsr/jht2+odTDhmGdNAoz7DFZEW/rVhQX6zOZbyQVGimtuulnh/qotFAXLMWdBnsObUE094QSAsagCPKzJ5n26e64csQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCe8R/ZrCDczGoj7xBIkaW1oqTyBlr4+UYT+3bo5HLo=;
 b=PvTgtoUwltTGRUegHIFX6ZHMwFfQtzgYMnHkEnZZ0BrBcx7Z1eDi/pUNtJcWweEPzM/e0y1RIWnWDbghRkLwy632pEgJQfw14GSQh0kHvpK27BCH9ilyGnjn54mpAvFbOY3NXH3TdCAlmIyP6n2mQe4BQ7iyXfhCFDY3nNr7Pl/mwTrzF1b0a5UPmc8jrGiERaxK4iG9lynsmi8cz+o0snFbwDcf+AOrMqczdzjFLsXRQ9UFGZLb4yE/tulb6b8vgzFF/81hriXRFGyebjIDbCjm3bDSQF3aBSJMxF4b20ABSwcEwANNY9Ur/KMhKu54X07W19RPBHUbmY3ITtTM1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=axis.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=axis.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FCe8R/ZrCDczGoj7xBIkaW1oqTyBlr4+UYT+3bo5HLo=;
 b=C2aWOoCNrYx+Mk1JSPC3vvZXvxPTIFPD+AWliE24ISvx/RQp27uEMXBuEerT6jdrfGLsyxasYt/jWJyf2P1Jy2ZEcP6dC7cQbUpQj2lJeB9sjWkFOz53Qa1sZplZUv0XbNu8CbgOaP8U+4a48M7w6vLosUGFzNqQRP8jE1BMx4Y=
Received: from DUZPR01CA0318.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::7) by GV2PR02MB003239.eurprd02.prod.outlook.com
 (2603:10a6:150:389::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Thu, 1 Oct
 2026 22:36:31 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::58) by DUZPR01CA0318.outlook.office365.com
 (2603:10a6:10:4ba::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Thu, 1
 Oct 2026 22:36:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 195.60.68.100) smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 22:36:31 +0000
Received: from pc67007-2609 (10.4.0.13) by se-mail10w.axis.com (10.20.40.10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.39; Fri, 2 Oct
 2026 00:36:30 +0200
From: Waqar Hameed <waqar.hameed@axis.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
	<konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>
CC: <kernel@axis.com>, <linux-arm-msm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 00/38] arm: dts: qcom: Format with dtfmt
User-Agent: a.out
Message-ID: <cover.1790892852.git.waqar.hameed@axis.com>
Date: Fri, 2 Oct 2026 00:36:30 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: se-mail11w.axis.com (10.20.40.11) To se-mail10w.axis.com
 (10.20.40.10)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|GV2PR02MB003239:EE_
X-MS-Office365-Filtering-Correlation-Id: 56dd2634-11e0-4a66-dafd-08df200c70e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|30052699003|376014|1800799024|13003099007|11063799006|5023799004|18002099003|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006;
X-Microsoft-Antispam-Message-Info:
	e8aF58iMXaQoJBsaKVau91sETo1asdW/v5WIO5MtTVBj65NG/sMcVDr0sq5TyReECe5QZ/6dygFjM2Gi+iORzDKsCz9ZtSwehqDDnHhUGgWebiZbYp86jU9HKVekMz2iIb7mJyzXbWGPgOAAZI+TaDzrDK5uIgTVeGhYdziX/7Fpy5iizgnJuCtarvLs/cOrdVgMyzysNLYL0LWOphXlQpvTMU2COnvdw9KjYLLhSq8+5zBAMirtmUVPqDY6esc3FGq1WDn8I0jeeD+HH5O23Rs00Dn1dHGyIFzohSH6XEMq04CPdRJvq70SXHhHsgl9jf0PTn9OT7hbLg824W7i20Wd834Ohmzj+4G3lJst/oAhk1t6Dp43y2stivaGm+GM9G4Vieqs+JDFmhdFnMFkE5mQb5C9RL2E5g6b+p8wr+Ng4XtmtAUnSsqR7h5TvV/MmReofaqjbsAATRNYfl7wql5pZe/pbFk7XeUmM9xJrLMwfCXJNrADJfFsDtwPVdljEmtWdNHICe/gfkZaXr+F48W7zHBA55IpQSUrTwRBHteYTx/Q5UO+XHsvVojX+mYYj0Ejsf6gbXC3y30TBEptMRPzsuBNInSoi2L0F4bdbvaARSDSvvEBZHIdkLDBcTpg6OQotNreSZAqhAYQLdZWPA==
X-Forefront-Antispam-Report:
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(30052699003)(376014)(1800799024)(13003099007)(11063799006)(5023799004)(18002099003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	S5fxzujQjQDNK6WNzdkfKWeU91c8D5Y8iJm8shiKOxEYolTwfwZlkI9U23NN4w28rS5j33wtKqr1z1LHe597p13a+jvObkojovWb9u2veRtX2rutQYEZmwKbqBGOBahoHBLvHeGZu8DFx4kGkDPNAQUoInr7JI/SL1gFA/xvDhIeRH+2Tc1R4LfxVylF/5oeCHaoGv7Izt2VAf4wbkE+yhU/6ddtK6U5wIhEmXNj47dxXWiXVHn1Ba+rbd4zOn07fBinKmvmdKbhYO2WmsHpz/RKnxfnAKfIVN7jeLIwzLyPZjaK5ld1FidBGhW3ApCplr5JpIn/LI78PdF/rM6+KLZOfNrubY/If4sE6ReiAK2y2bIApq0+p9/eKy5HMhy1ppJRYtQIovVAw+tQzHV1rLmOCk0Z2g2AC+7QIEu7twLoahUVRVivPCkDgFiGgfHN
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 22:36:31.4875
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56dd2634-11e0-4a66-dafd-08df200c70e0
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR02MB003239

I was looking through the notes for the last Devicetree microconference
at Linux Plumbers (LPC) 2025 [1], and realized that the tool I have been
working on might be of interest here: dtfmt - a Devicetree Source
formatter [2].

dtfmt uses a parser with lexical grammar (tree-sitter) directly ported
from the actual Device Tree Compiler's (dtc) lexer/parser, also
(hand)written by me [3]. It is primarily designed for the Linux kernel
and currently parses all 6872 devicetree files in the tree successfully
(found with `find . -iregex ".+\.dts[io]?$"`).

This tool was developed out of frustration when reviewing devicetree
patches internally at my company Axis. I would have published it earlier
if I was aware of the on-going discussions at LPC 2025. It only caught
my attention since I'm planning to attend LPC this year (especially the
Devicetree microconference and would therefore love to discuss this more
in-person!).

This patch series is only a small demonstration of dtfmt, primarily to
get Konrad Dybcio in the "To:"-field (who did the presentation on LPC
2025). Obviously one can run dtfmt for all files and generate a much
bigger diff. There have been patches sent for
`arch/arm64/boot/dts/exynos/` previously [4].

Please note that since we don't currently have a _definitive_ style
guide for Devictree Source files, dtfmt tries to be pragmatic and try to
"guess" the intended style (e.g. alignment of arrays and comma separated
property data). Some things have been left out (for now) or manually
edited, because it's too hard to implement without any concrete style
decisions in place (e.g. alignment of comments, long line wrapping
etc.). dtfmt will continue to develop and will always align with the
Linux kernel. Feedback (and collaboration) is therefore greatly
appreciated!

[1] https://lpc.events/event/19/sessions/237/attachments/1713/4459/Notes%20-%20Devicetree%20MC%20-%20LPC%202025.pdf
[2] https://codeberg.org/whame/dtfmt
    Mirror: https://github.com/whame/dtfmt
[3] https://codeberg.org/whame/tree-sitter-devicetree
    Mirror: https://github.com/whame/tree-sitter-devicetree
[4] https://lore.kernel.org/lkml/cover.1790629313.git.waqar.hameed@axis.com/

Waqar Hameed (38):
  arm: dts: qcom: pm8226: Add newline between subnodes
  arm: dts: qcom: pm8841: Remove superfluous empty lines
  arm: dts: qcom: pm8921: Remove superfluous empty lines
  arm: dts: qcom: pm8941: Remove superfluous empty lines
  arm: dts: qcom: pm8084: Remove superfluous empty line
  arm: dts: qcom: apq8026: Add newline between subnodes
  arm: dts: qcom: apq8026: Add space between OR-operator
  arm: dts: qcom: apq8060: Add newline between subnodes
  arm: dts: qcom: apq8060: Align multiple property data
  arm: dts: qcom: apq8060: Indent property data with tab
  arm: dts: qcom: apq8064: Add newline between subnodes
  arm: dts: qcom: apq8064: Remove empty line at end of node
  arm: dts: qcom: apq8064: Add space before line comments
  arm: dts: qcom: apq8064: Align multiple property data
  arm: dts: qcom: apq8064: Remove tab after property name
  arm: dts: qcom: ipq4018: Indent closing brace properly
  arm: dts: qcom: ipq4019: Add newline between subnodes
  arm: dts: qcom: ipq4019: Align multiple property data
  arm: dts: qcom: ipq4019: Break long property array data
  arm: dts: qcom: ipq8064: Add newline between subnodes
  arm: dts: qcom: ipq8064: Align multiple property data
  arm: dts: qcom: ipq8064: Break long property array data
  arm: dts: qcom: msm8226: Add space between OR-operator
  arm: dts: qcom: msm8226: Add newline between subnodes
  arm: dts: qcom: ipq8064: Break long property array data
  arm: dts: qcom: msm8226: Align multiple property data
  arm: dts: qcom: msm8660: Remove empty line at end of node
  arm: dts: qcom: msm8660: Remove space inside array property
  arm: dts: qcom: msm8660: Align closing array bracket
  arm: dts: qcom: msm8916: Add newline between subnodes
  arm: dts: qcom: msm8960: Properly indent subnodes
  arm: dts: qcom: msm8660: Align closing array bracket
  arm: dts: qcom: msm8974: Align multiple property data
  arm: dts: qcom: msm8974: Align closing brace properly
  arm: dts: qcom: msm8974: Add newline between subnodes
  arm: dts: qcom: sdx55: Properly indent subnode
  arm: dts: qcom: sdx65: Remove empty line at end of node
  arm: dts: qcom: sdx65: Align multiple property data

 arch/arm/boot/dts/qcom/pm8226.dtsi            |   5 +
 arch/arm/boot/dts/qcom/pm8841.dtsi            |   2 -
 arch/arm/boot/dts/qcom/pm8921.dtsi            |   2 -
 arch/arm/boot/dts/qcom/pm8941.dtsi            |   3 -
 arch/arm/boot/dts/qcom/pma8084.dtsi           |   1 -
 .../dts/qcom/qcom-apq8026-asus-sparrow.dts    |  32 +++++
 .../boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |  27 +++++
 .../qcom/qcom-apq8026-samsung-milletwifi.dts  |   4 +-
 .../dts/qcom/qcom-apq8060-dragonboard.dts     |  54 ++++++---
 .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   7 +-
 .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   1 -
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 114 +++++++++---------
 .../boot/dts/qcom/qcom-ipq4018-ap120c-ac.dtsi |   3 +-
 .../boot/dts/qcom/qcom-ipq4019-ap.dk01.1.dtsi |   1 +
 .../boot/dts/qcom/qcom-ipq4019-ap.dk04.1.dtsi |  11 +-
 .../dts/qcom/qcom-ipq4019-ap.dk07.1-c1.dts    |   3 +-
 arch/arm/boot/dts/qcom/qcom-ipq4019.dtsi      |  16 ++-
 arch/arm/boot/dts/qcom/qcom-ipq8064-v1.0.dtsi |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064-v2.0.dtsi |   1 +
 arch/arm/boot/dts/qcom/qcom-ipq8064.dtsi      |  29 +++--
 .../qcom-msm8226-samsung-matisse-common.dtsi  |   4 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi      |  18 ++-
 arch/arm/boot/dts/qcom/qcom-msm8660-surf.dts  |   2 +-
 arch/arm/boot/dts/qcom/qcom-msm8660.dtsi      |   6 +-
 arch/arm/boot/dts/qcom/qcom-msm8916-smp.dtsi  |   3 +
 arch/arm/boot/dts/qcom/qcom-msm8960-cdp.dts   |  18 +--
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      |  24 +++-
 arch/arm/boot/dts/qcom/qcom-sdx55-t55.dts     |  10 +-
 arch/arm/boot/dts/qcom/qcom-sdx65.dtsi        |  14 +--
 29 files changed, 264 insertions(+), 152 deletions(-)


base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
-- 
2.43.0

