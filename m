Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793688533;
	b=Etcm9VP7C8I3oP45w5LjgFRbbfwo1peTbNFum92B0kx4FMpmHWXrtyd9r7fPPR3fKBkL
	 djEAunuawpVq9VMDPQqSiKz9ThzV+OwSynL8Gg8OuZVc48aWttE4/oyIQJQ0KVD7WCpEt
	 ZBid3TKxwmC2wkujUP+V6yyVFO5MuQI8fNOlJeM88RqECnGetKSE36cQ/M4pSs8psbwOj
	 bgb00ohMOv2B3uXs4FK+UZt4Fr8Cpte+B7JVIGoq14rNsO7UqOpEa6w4x0o1sMxQ8DtVD
	 sQ3/IzDk8Kna2NbTOFHxNJ3QTf60kRfn8xNAsOp6+1J2Xz1jN/4uJlsZ4ZqclTLMGVg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793688533;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:Content-Type:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hZ9yzXYulAI0DZeIv87D9/qBTKb0T6Gr0A9vEkp/pbQ=;
	b=XES+IXTw0GYH+ekkWkERszyepI91WVDRsWk6ttSiagjindrHgoUne1uWIlbltHg8XjHT
	 JfOkPC+dY2+2unqDYMun+vf0VFh9MD4HSPC8ima/0UpSRBSu8TPd7Ewwuz9cFfTnBbcFU
	 ySVs8wmhGn7JqN+7iZy8qVUKFyM9Cdfwk9y/pTTlwUlKBAfDD4rGF3LPI/K8suLm1TT8s
	 BbHjQskAEC3dmnUCrVmYiZaH8V6ba2D+KADDS4lt66kUGeAyZyKB1vnSt0YYgb5nB1zT4
	 EPW/CqPdoqS+H7JodEwx6hNqms22fZ2G9ms8weYQFuEyqkjPdXrG0nrJPkysel4gPZw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.116
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 982A5606A32D;
	Tue,  3 Nov 2026 06:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 982A5606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=adpMP7fYfiwOPeqfBrhN8gyIO0hrmsozsfmNZZd5rzKeBrsS5pMAlHC+8uPfqHt4g4d38NGIww+0D0nqCu5TEfAMOC5ZTgtkzQnYvApwP2fhYAmCwYrya/QykQtN926b7xx/3kvSiLrD5c+ctSW3X30sHP23fdnUEbfA5EbTTsr54TWgDwq3k1hsHQ2X4SCC00cT9DF5t/3PdifeBtjslnzHoVEx3OPdKYkdQWt0lZOxVPpTsR5NX6c7/puIW3ImwoJSd4y3g0jkRMBQfbdHl2pSnzPkUCo3poHCPnOpiHeIOXk3sz5a1mPg38tyXmCn2gLg7ynHR8kxAx+jCj2P1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZ9yzXYulAI0DZeIv87D9/qBTKb0T6Gr0A9vEkp/pbQ=;
 b=By8PEz6Op/vNVjAJ4hW+ZXpuBEsuGcujllkMyXjNSuYxSqgCZnF15fgv3/x4OZPlLYAQTE6pRCExQ+YSRmitxeBu1bYxLlA9a4NNyI1aX4VDpOjUDR4XL8prTgLTv/IiasFULvhHkYvhPJmrowt8xVraHo6N1sFGo51Lo99BX+K7jhae3A0nUfouOCXFzQKZcn/aIAVOJplTNl9qZf/zEyQqP2tt8a65GDQ/l4MQZ95CJfOr5DA5OfS3yTkEBWppeRK4nH+O53wsmVBvZSTRnJzSD5lJXfrZoqQFC3GEN+h2TTTzly7KJykZKIi6C7GLGCyTzeKKbbWDKsYLl4URVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7) by ZQ0PR01MB0982.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Tue, 3 Nov 2026
 06:48:43 +0000
Received: from ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 ([fe80::d777:e23a:d111:5fa1]) by
 ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn ([fe80::d777:e23a:d111:5fa1%6])
 with mapi id 15.21.0569.011; Tue, 3 Nov 2026 06:48:43 +0000
From: Minda Chen <minda.chen@starfivetech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Minda Chen <minda.chen@starfivetech.com>
Subject: [PATCH v2 0/3] Add StarFive JHB100 host field USB device controller driver
Date: Tue,  3 Nov 2026 14:48:33 +0800
Message-Id: <20261103064836.71059-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0001.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:5::14) To ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:e::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ0PR01MB1111:EE_|ZQ0PR01MB0982:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba44a99-6b6f-43b7-cadf-08df39768061
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|1800799024|23010399003|366016|10067099003|18002099003|261102123227099003|261102130727099003|56012099006|261026121527099003|261022105027099003|261026140227099003|261009223027099003|261028144727099003|38350700014|261021121427099003|261021123027099003;
X-Microsoft-Antispam-Message-Info:
	B1TPgWfNUS8+tvwW+RsyARtutiqoKdJ90ygT2JiEqm6Mk0LW5Ig6Ch9TOnSo+4nwsV+adgrTyrDH8xDojuAEIsZhEXbiv8+WkgDF/NUiH3VEwVIiy9DcPsowi8DI+TPJgKte2zb+GgpgCsI/wKmmTOEE8D1NHhtb/aKB0wq6pD8TZS57Gja6ONFv4HSYgJeWM1D4TH5uayu3hlY+R7oWti+Y54TBqIx3qYYD69NY8R9LyETtIT4xYr/+4fes5Hb8Xl2CP8C8HwacJ081PzBLGN99g3RKICc4q0R/7gU4vtR7Swn3cWJEKShxwHssxlnce9TBOWops6jsJ04Yq+QJYBR5qIcTnbtv8uDcsezxqtTogshUyfn7j+B7HpPFn4WvKIa+TXQiLzvhB46iWsQKWiXT7zb6eAPZ846EGto4MljxE3pHLSBtgVcmgsVZm70bn+Gh0Z8ok/Bl8x89wPm2dHk6os0Yq807J2U8uNJWN4Y0cqaglQjOOgwIof6Gi5MYJRH5pGw+BV0WRZD6hl3N7dUvIBlU/w0QYE+i5ui+cLbnkXbzD6Sw++Q//0Uk5kHu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(23010399003)(366016)(10067099003)(18002099003)(261102123227099003)(261102130727099003)(56012099006)(261026121527099003)(261022105027099003)(261026140227099003)(261009223027099003)(261028144727099003)(38350700014)(261021121427099003)(261021123027099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UNFi4XGVBsoQjlmQmeS+NHPLHCH/6VupgP6xif9JUQZ0LlJc//KPsshYKm2G?=
 =?us-ascii?Q?im9nobQbbSfnhFJy3IMhf3K7/xm7XTIpQUY0VNplsIrDy0qbJapeYnsz7OiK?=
 =?us-ascii?Q?7joA9FBLNk6CxfJ9s2r3Iv6nI2GZh55AWUct1S1wkanUeTjcFVbxkBAk0yiB?=
 =?us-ascii?Q?r0/ehqn3l+daY03FNFNhYCT1SKFevpOuZaxQJ3Fxomzl3Qcio4GiQQmz8unI?=
 =?us-ascii?Q?chIqOJ+bOeYiK5t+8oG84hpXqifrX3WoxpAVnSHVR/cGtHLyBLpKbr2wQ/6D?=
 =?us-ascii?Q?a34oiwX8I67ISKxVdk6VSeHomBsLPSmaQ2AFgY/p2PrCSslD/SsB0bL4RLoK?=
 =?us-ascii?Q?yLVBtDj4M89dkgWzHNMFksGNZNXghPJdxaKe9vH/k95pAI5J62vvpBB/u2ND?=
 =?us-ascii?Q?PwNN64NKPGgtErVztqLPZIspEoomS4+G/iLIt6WFIKkREtuo+U5S966dikvJ?=
 =?us-ascii?Q?185L9L49dFQtPHJkJ1GvFZudvWn1W93PhUWNHwQfV4MrxUTqFIPeU0n2h67c?=
 =?us-ascii?Q?nqlMEwWFvRkcK/2QRNSKU05yOkEMvuf0wbS60FEq8aTnYs7fRftfDY5rmZVB?=
 =?us-ascii?Q?ZqP8llH2+o2OXiIziF6MS1abTa0UTBlnpuCnK/phrHwZFbBoXAWSZK87VdWj?=
 =?us-ascii?Q?QIBVBLawMkUMSexe9tX7a9t96Ceae5qQj6Cdw4/h2XLTjW7PeITkeglwplXX?=
 =?us-ascii?Q?HP9yyS7nFeHtBYAEUVXbw54dv0zrKa/f1xMSEaTO1Gt2mV36+ZtEki/BzTk9?=
 =?us-ascii?Q?PuP1X42WMgFc9YFafmGHuWxHKp0S3qqHT5wcLOFD1m4zAg9b3LUDxrFlHSPN?=
 =?us-ascii?Q?EqVTp0KxnPkNE4W53bJZ6y9oOTsBDffXJeXRG9Cz6BT1brLz2LhJbdr01l2y?=
 =?us-ascii?Q?DGZuTpvPu0m4kkoWJt8TKnhEfdQ+1NtsFtHSCXs20J/1bsoI0suc3zZ373/v?=
 =?us-ascii?Q?UBkz6hYCiyMDEL75VexYWaTbFqXHyb0PgcKy/6g+cFfUFAvvzRsjZjuWot7d?=
 =?us-ascii?Q?RScmx4EJ5ADUz++sBSA1z0qFP7ltBg25kqVuJde3kQIZrFH5FVuhPMfCkrng?=
 =?us-ascii?Q?u4ZJWOi9xzzFl05wqCVFDqbwvgY4FWbrNJHnQcsEyeNt2wA8grD5MYEHxzrG?=
 =?us-ascii?Q?ddKWorob0eaOHxGV6cC4D3RwwMPesnXHnlqioWSb1J5dYCjOl/YbGI1cwnd0?=
 =?us-ascii?Q?O2HF4McdUz8g4voebD0c4Nk2ATz22uwVFqUTjUC5uu+zgkseRzEUFo27LXm2?=
 =?us-ascii?Q?JV2s1jetUEn3cWwqilCKw4VTbT2j7ZPD+o/DcBpTuy6uR4JOYfhi6O/RaI65?=
 =?us-ascii?Q?mdKfE/t54AV6zl60j6XSwkWRLGI+7YIczIkOYlHbfk1Xi8dy3B09F1BFjA5T?=
 =?us-ascii?Q?JkzMwxo1z+4c3+C54a6iCvCiYcERUb0J5yuE8U7C//ObBSTePdhgc7jNu/76?=
 =?us-ascii?Q?GpP1zUxEYOa9ubSUybGFW3batNxz6A+/mRAiT9EwBSFnPn2F8ojfOudVf4eN?=
 =?us-ascii?Q?KepMeprvYnxHk7CLdcZAFawB4wYVFZW8CF9eU8E+rG/a2vDVKBNL83xRJlgD?=
 =?us-ascii?Q?4dFg6OfqyLPgXLITEmYByclvuLWB6DwN1uMJNSyempOVSRf4LMl5LrVgnNLy?=
 =?us-ascii?Q?uC1dSmlhPB02Jvg62PXOZTstNOGdkZhwXc+8wl6iyBeT//nJGL7G4/L6oXPu?=
 =?us-ascii?Q?FGo4ISQS1Wo6/NACGqRLZfpvJMZUWjX0FbxxQmp6x/XlMLNuKrpr+6Z2ZA16?=
 =?us-ascii?Q?2VAdPGnlK9lGvgq9xKyyHG1TfYeQkPg=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba44a99-6b6f-43b7-cadf-08df39768061
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1111.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2026 06:48:43.5270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EU/lcaJcqdZJE0ye/htRQatjOQQYOSjyGjriYiniC6VOMIlMy7iJaG0apNnEvFFc3t5kxp5pffxQgPTYckDxZQmVUolFTiwreOD0YnVEM/c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB0982

JHB100 is a Starfive new RISC-V SoC for datacenter BMC (BaseBoard
Managent Controller). Similar with Aspeed 27x0.

The JHB100 basic driver upstream is in progress:
https://patchwork.kernel.org/project/linux-riscv/cover/20260910100357.130134-1-changhuang.liang@starfivetech.com/

JHB100 BMC soc contains Synopsys dwc3 multi-port host controller.
And export its xhci controller to host server through PCIe. xhci
contains 8 ports and each connect with one dwc3 device controller
through an PHY adapter. Server host USB subsystem includes
one multi-port dwc3 USB host, multiple dwc3 device controllers
and their adapters.

The simple arch graph is below.
|-----------------------------------------
|Server PCIe field                       |
|(usb xhci working in server but it      |
| located in BMC soc)			 |
|   --------------------------------     |
|   |    multi-port xhci controller|     |
|   |       .....      port7 port8 |     |
|   --------------------^-----^-----     |
------------------------|-----|-----------
------------------------|-----|-----------
|        .....    --------- ---------    |
|                 |adapter| |adapter|    |
|                 -----^--- -----^---    |
|                      |         |       |
|               ------------ ------------|
|    ......     | device   | |device    ||
|               |controller| |controller||
|               ------------ ------------|
|   BMC field				 |
------------------------------------------

The patch base on kernel v7.4-rc1

previous verions link:
v1:
https://patchwork.kernel.org/project/linux-usb/patch/20260918071103.24482-2-minda.chen@starfivetech.com/

changes:
v1:
patch1 and patch2: Correct the title and add more descriptions.
patch3: Correct the get iomem code and follow the comments by Thinh

Minda Chen (3):
  dt-bindings: usb: starfive,jhb100-dwc3: Add adapter register region
  dt-bindings: usb: starfive,jhb100-dwc3: Add clock number limit
  usb: dwc3: starfive: Add JHB100 USB device adapter port enable quirk

 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 13 ++++-
 drivers/usb/dwc3/dwc3-generic-plat.c          | 48 ++++++++++++++++++-
 2 files changed, 59 insertions(+), 2 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.17.1

