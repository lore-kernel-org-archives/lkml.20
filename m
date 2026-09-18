Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A839E6CD;
	Fri, 18 Sep 2026 07:11:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789715487; cv=fail; b=cs+F1fGjhfKoJWJr1t2WnFbLccJzn0AaT+JukGOqtuKYYKiBzMFh4LkjupDQn1MdHyRcLfssbViaRd76iDZLDC02w0ZnuO3OeC/KfmyFHSn2fFcl+jcNFcMFqyULppv91H08i4ROq9ywHOVk8WRJSKaJC/IEen7jQyEHY5F/TIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789715487; c=relaxed/simple;
	bh=ZortTmC0bvJ2Laqaq9ZkOTz2cx1zYKUQwjY5sTaW0yI=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=WC592h8reXNW39zdWIjEVAboW48ArptxrLkdJa8WHoFgvKTre+9KeMP31dOyqIOy3Yux0bfvLjORtbgyQO7QWBhpEkhUxEnCQeYjR/ftZVu/TgzgSCNIiAY2HgntamldtbgcAGqG6+tKvCaR9ccPzy+xep0LksrzlklSl0Wnrk8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=elz85dEIR+KQlsA0rQ1SU25c6V9WRIosZgWpldpYXQYEvizZEY3lHBvQq3qpJnXjWd8ysCWliILmOsGw0rsdLLr4ZCuxxEpiL1o2TNNqPV512th2pwpX8L+VXen9vz27T3+FWIryD0K5/S6/yahuFN5/1RBR23bpx9sHFjM6ENyiEYJVdh9sqCD2jR1xvwCiNFq0OpZlh7x2q+9PbzUKC7Meu9ZaNw0ewMGpz0hpZOySiHxDx5eCWHzgbvSxrd9lfgjK9K5dorBWkP1ytfSeFmb3l5gD3UFskEo2nPWkl30Qt86xacTHu/YAm0NZss9kSaxOG5ZikSzmJ9Agyq0NSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oEiNCdmyuEHpQ55Hc9JLkZNuqp+jmPtH4VgUL5PjgE4=;
 b=Q0koBPEWwr8vFw8djDlp9aaRDJTjHf3engqZExY+FUUGIr/M5pB4l0zweyHOTMu7OrgsNaW8tXqc4eZxX3fjWTW0CvrLle3o1j3LT/nHyQp16xhaUAabAzOw/h9Q+BT99VHotiYtSHFk935keWxuX6l0lYdJXFxfG+PsfdM6be/mzj/gcCnC7B050TUR1i+AUJAfpdaNntkCtVilvx2+/Q4De06gWd8yib82wSKfob0Y28v+5VhUCMxOETteoZdHAvhW8i9/LFzceBV9ruJzX2m3ZGi6DmkLH3PzC23lOVOm275CD85HNwHoPTPN4Yh9ZPPWessCRFligQDhWF2X2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15) by SHXPR01MB0893.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1c::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.14; Fri, 18 Sep
 2026 07:11:12 +0000
Received: from SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 ([fe80::9b99:12dc:a115:b90f]) by
 SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn ([fe80::9b99:12dc:a115:b90f%4])
 with mapi id 15.21.0339.017; Fri, 18 Sep 2026 07:11:12 +0000
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
Subject: [PATCH v1 0/3] Add StarFive JHB100 host field USB device controller driver
Date: Fri, 18 Sep 2026 15:11:00 +0800
Message-Id: <20260918071103.24482-1-minda.chen@starfivetech.com>
X-Mailer: git-send-email 2.17.1
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0049.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::16) To SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:25::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SHXPR01MB0863:EE_|SHXPR01MB0893:EE_
X-MS-Office365-Filtering-Correlation-Id: a553b811-5fdd-44c2-54e7-08df15540587
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|52116014|366016|1800799024|10067099003|18002099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	W/ftKi1p8ilEOnIinUQkbtB7QHhqVXsiExhD4u2hz2OYwNbUeLPm24Rt5wHDIUt7QKCS4du2tRw7HuXctnPeyVS1bXRCrU4ClV2k79cdcwOtN8AkRagUrn6dAPz7hw05R6i6D3NdgOjk/OckRRAe7TgB26qW8VRjFSOjKrImVG5TepkOJ9zX1t+Tamks3Zf3IpMaCFX6VGcSib9B9pA7+IHr/9Z2a51n1Rtma2J0nsVulGQIPm8i5CLXk9kelArtsMnuT2DFWaU1YksBMCVU/JMK9H1IrPMvlIDFGvY/QQ+shc9z2CV67WqO1KvrQtaikHyfP4It6CEzkyj4BlIxhm4qGVJ8kVbSXDiVh6j2FjbtQuazdMMQJ/zPqeg4gRA4HB62hEv76heIOr3qduo8TBzYNbSYzGK8lfUHp1GSRsx88iH/T4lkgQmqKRkTp73Bx9gjR/pAtguFncSYy/tsnL1nTtFUvxfxvbrDRVupSFexEgA1/pjWyVDTM869C6VwWAD0rMXVFDKiV7j6302F+evpQYJ8eolk9RM90XpHTbGoBtwTcJoILT8RApC1HA5X
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(52116014)(366016)(1800799024)(10067099003)(18002099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?g0ZShCAM5FjGT5OH4+lyYzESVSv4ZoZ3Fbh0j+RdzO5r9sgGGX18o/bfaBU+?=
 =?us-ascii?Q?tEmHh/nD2K6jCMkWvpDbx/nAz99v/GyNxApf3s60+47zqSB4CMj8XWlb6ldd?=
 =?us-ascii?Q?wUU8gbsT0O6Z7HU5FcMxUHtKAMew+1dYejngO9AfyHtlQFB5rccc8MnOXAFx?=
 =?us-ascii?Q?wS8lYH3u0kLhRO1HVPd9WU1kUb+A9ri5ZENEU438l129v7sx/a6HXxggW8IP?=
 =?us-ascii?Q?3+8kMAHDA+dJ2LUsIJW+Gmml+Zzb1HWenUwIAe8vo5Q5G0FR1ET8oaMEYPMM?=
 =?us-ascii?Q?LZTVS3JzuIUkHp85Al+Mq32Jq6lbbzGNtxN9Q7oPnrKDdTBk4L+7VX7fdSEI?=
 =?us-ascii?Q?H+rsnrAxtnEs6sT6f6kqL4S9tPcZhFHo8s2Hm7TwGEV8NYYJ+ifcNS8eLymo?=
 =?us-ascii?Q?JQMxdeXl67o2LEE1vzGZ3Wq2SGO38eo5aCEcxFwo9KlWQnvRfntSJf/wwwQR?=
 =?us-ascii?Q?2Cd6/qC/MnnIkR4/DERXpjxCaCHXc3F0kw84xE6QvNuROXJBTmV/b3oCSRiP?=
 =?us-ascii?Q?xRmePqg8XMNOUyep73iyhT+ctCZ/s7tstibATKxZQADMnjXIyt+rYG29jlF4?=
 =?us-ascii?Q?7ge8NAzYAXxM19K7fX4Cf2C+uDahMd+1qvdL82wCIkyDwJc4bAw/OfcF5BzS?=
 =?us-ascii?Q?OEcNSbEKm8/03WFHC22V/PV02B0XmCKmrL+mH3ACTR+6uJCRGTbWGJakHCmj?=
 =?us-ascii?Q?wkbtvnaDF64Vi9CPMIzvRGoRzvXJvpv92ALX9tLLTnW9LrOxbqV6WNuVfc/r?=
 =?us-ascii?Q?GSnLf9tvqbfCbPpprgmHEcV7aKbEMT7IODWqNcx4qgVd402EaeMRNktCFxA6?=
 =?us-ascii?Q?VOPrCqTJCVP+4sgmNc2Ela8/pTUthTnJ9/ZNkgTVewiPPsJEY7wMrssZiI+9?=
 =?us-ascii?Q?M9MF+gImp0UAdi0wErNBHlr2+MzK+DunWljOYdg8Th7XF2f8pG8ZEBy4/Uby?=
 =?us-ascii?Q?jvPsRPR0OscMn+YF1WX6bQKPwLX9BQ3UEDqvCz1BtYMkSZYqKE2Zayt4OHaK?=
 =?us-ascii?Q?VRxi9k89qU+ENkKxcdLmq+4vqqWfWwns8JE229rR9FBVd5rX9wXs52YDmlKw?=
 =?us-ascii?Q?cXhJXTwsC4rYQtz5NAbkHHfC/xX3QjNQnVcewZiacZ0DM74swtNcyrOSPkfa?=
 =?us-ascii?Q?CgXkIfdwnRucOA9Bi0cxm81WaBRYrGczHHWcRfV6t2b8p2cL6EOCBKm9wdbk?=
 =?us-ascii?Q?QqQbMeqz4et41KQqAhapSL/c9ZqZTaGvPtI7v653Fo3BrVQV5flkHxo8ivdD?=
 =?us-ascii?Q?ByAW4KPJw1ClnIo3w8aj4U0Si3reqbwxTFZyA2NdbflMZdgC/flezIqr5m1c?=
 =?us-ascii?Q?P0h+Po1LcKksd8vrAQXojXwJHdmSZsEtiU8bdW79ZoqzTt5F1vZJHY67+zMc?=
 =?us-ascii?Q?2SuBTK+R7z83HNuFY56pme/NGmW+U7Me+iR+/dhyASuxG5E43rGxeopCUlCA?=
 =?us-ascii?Q?TI8P4UfCwZ24G61upfSX02tYYCqIaSFWO0eHCVV6nXnL9u/NPdgU2MLQxaa3?=
 =?us-ascii?Q?faRu4Lq1EjooNTvagrgeqLeGVEpf+fzloMr0nCU3gaJKVYvvZyWiyE9/tDHV?=
 =?us-ascii?Q?9sOnwE86XGQauOlr/B+LxR6FrpXTPJuojERCen2IWupIwcmg/+WTAMA1GKgY?=
 =?us-ascii?Q?bSj5PmmktD6jTT1vH0FosJ5XutmVsOcmNjU0oW7NyyTYzrRTJvFxGUG9Eryc?=
 =?us-ascii?Q?DTpJjQwO98sWr9YrfWyz/yVyhwSo/907THNObneG0E4M4NutE75vlZDLiXx7?=
 =?us-ascii?Q?lzOEt9Cub/pf4QplqwnI639ByItCQOQ=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a553b811-5fdd-44c2-54e7-08df15540587
X-MS-Exchange-CrossTenant-AuthSource: SHXPR01MB0863.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 07:11:12.5528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IM5AUQBypZmUsL2AUU7CnN7ywGmmwYlVLsEPCAluTGo7Q1KKwVmha9X1C10+zPkhoUNx4dJUwnbGQ/MdjErX0qLLenYqJIbQYmXI9j7Atag=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SHXPR01MB0893

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

The patch base on kernel v7.3-rc1

Minda Chen (3):
  dt-bindings: usb: dwc3: Add JHB100 device controller PHY adapter
  dt-bindings: usb: dwc3: Add JHB100 USB device clock number limit
  usb: dwc3-generic: Add Starfive JHB100 USB 2.0 device controller and
    adapter

 .../bindings/usb/starfive,jhb100-dwc3.yaml    | 13 ++++-
 drivers/usb/dwc3/dwc3-generic-plat.c          | 47 ++++++++++++++++++-
 2 files changed, 58 insertions(+), 2 deletions(-)


base-commit: 89a312991dc6e638a36adc43ccb91dbc25504c04
-- 
2.17.1

