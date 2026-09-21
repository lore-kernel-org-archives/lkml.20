Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011064.outbound.protection.outlook.com [52.101.65.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 568FD4A3D3A;
	Mon, 21 Sep 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789999477; cv=fail; b=O/2R7qJjGrfmWqiumDu8BP1soEHaoVgx97Y4DehLvq1IDLeyUnegeXVFjKuwKqvCa/he41vrGX66N4ilcZRCZ6aL24WD69U5WCTvl2Sc6NnEFCYjQmW0US22OzE7NsvCWEjBkXyjEXx8cwXb5jjr2xu/IfeOA55fHIOOFIW0+p8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789999477; c=relaxed/simple;
	bh=CMPRHpY2TQguawyCALFr3c1Go/7b6gQHKxaBqhryn0A=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uarxiZvQ/gcM2iHlVPVvdtSU8HHJZAE7XBY59Rbq2sugZ1C7r9R6w/JcCQQ5MQUj6BEdPgA4bOT2bRd6GlceyDBcLaNkeKE8QuUjktDVqknntVj/3Txore0ZTdQ1uCmMkPzUtUWOkqgQOOm7+5r52019kQbbN6GgZLe01Jiuy4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=ZEQYx3S1; arc=fail smtp.client-ip=52.101.65.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="ZEQYx3S1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oH3gCpL7RHJk9Al+aL7PWnHEfUZyGVbDVbDOAVzIx7IrfPF6tZGflm3txxIQl7HiApoBzJ5crGfwba8UQg/01eDAaNgRM1WuiOJKb8vNlhTnF+XzbhevQPJtJeYckV2gDvfNbjCkPAlt8sU0UQnRV+LchHWlp11Oa+AU6dD4hEC9Q4ElUQzffEgUhTV+vTJFvsAeM8ERlMR51vZ6F9BtrBKXIr0iXnBKjPRcT/PvBYxaDv3dfvuPB10+rOyfLAke+H9+df0yGciOLDNPcw+vQHX70i0gUcqZrpoWwv8LrC+cUySemHbpXKZd6WOgLVOBdM2ycAOv2UHvdSFHVDmOig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CMPRHpY2TQguawyCALFr3c1Go/7b6gQHKxaBqhryn0A=;
 b=QQonSamHTpOfbrO4JttOhs1zDeZvJYpUsYvzsY2TK3YtnPGQeAYe3A/157BpIcLV0N/surLwgEqDd2ttelI6kD8tUiWjg831OtBff+8DiCXbzriYmZ+F1Xc0D9aPKyo+U8XOysdRAHqjwPGZuulyNcpnAelSxcTMn0fVM/yqjg9qQH0dsk3WMF9UO60cEaFuIEnzdXnaMdIG05Lr+JaWCtmkZUJe7RezuVJPGksHeU9ZIgEmgffVRVFA8P9kfugOM93fWiAgpAICH16RMVi6yplPLE/LCS8htXI+FMAaEDWTDoTTyUfvoiotDnW9C+Z5HzWoSjPfOESQZU4rpEutUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CMPRHpY2TQguawyCALFr3c1Go/7b6gQHKxaBqhryn0A=;
 b=ZEQYx3S1qNvsBjKJWvsmaLhTpHyVc2uRlvBZysIMmdbu+AyHLYYCnYA6DKQ1XBA5ZdXub0q5tl35VdyBwdeB+9JJCpdFWFHkvwPBtoFZInZy92DY2V1o25yjV4O2yI+S0YMa5pu3hD/nwdQMntWndKb0Q6oZP2kvupPbls2q/c+E7DHuX/6I5LSwGLgNHZJQ8oikzZpUzwnB1RCmeNo1qhVYFP2Mk+zmrQwaVLQJPMidJrZTiipGolMpxxPW8vyI35KHwTuwwZE9gfQdfQxHtnoRgq0eezRuh6J/UKGfSlwgN55T9dXbqf9caw34ewZh/dViA7D0TJVkiHBzFQiCZA==
Received: from DU0SPRMB0016.eurprd04.prod.outlook.com (2603:10a6:10:350::19)
 by GVXPR04MB10754.eurprd04.prod.outlook.com (2603:10a6:150:225::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Mon, 21 Sep
 2026 14:04:31 +0000
Received: from DU0SPRMB0016.eurprd04.prod.outlook.com
 ([fe80::1d94:6e4e:ee8c:2725]) by DU0SPRMB0016.eurprd04.prod.outlook.com
 ([fe80::1d94:6e4e:ee8c:2725%5]) with mapi id 15.21.0428.015; Mon, 21 Sep 2026
 14:04:31 +0000
From: Elena Popa <elena.popa@nxp.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Frank Li
	<frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>, Ahmad Fatoum
	<a.fatoum@pengutronix.de>, Cosmin Stefan Stoica <cosmin.stoica@nxp.com>
CC: Pengutronix Kernel Team <kernel@pengutronix.de>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] [PATCH v5 2/2] arm64: dts: freescale: add MR-NAVQ95 basic
 board support
Thread-Topic: [EXT] [PATCH v5 2/2] arm64: dts: freescale: add MR-NAVQ95 basic
 board support
Thread-Index: AQHdRD0f2WEapyF2y0i/Bp5xw7Uz87bZGzew
Date: Mon, 21 Sep 2026 14:04:31 +0000
Message-ID:
 <DU0SPRMB0016A4EF54E5A03DEE09D66890842@DU0SPRMB0016.eurprd04.prod.outlook.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
 <20260914113010.988-3-laurentiumihalcea111@gmail.com>
In-Reply-To: <20260914113010.988-3-laurentiumihalcea111@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Enabled=True;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_SetDate=2026-09-21T14:02:32.0000000Z;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Name=NXP
 Confidential;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_ContentBits=3;MSIP_Label_0d9c909a-577b-4ba2-96de-69ada94b137a_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0SPRMB0016:EE_|GVXPR04MB10754:EE_
x-ms-office365-filtering-correlation-id: dc818558-2e1a-4a35-59ef-08df17e9420c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|23010399003|1800799024|19092799006|10067099003|56012099006|3023799007|18002099003|22082099003|4143699003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 CQL8/z2tF0ZKzWhNYsd8XHf4NMqp5Nlbw8H6ONrWqa8rGFijvwzgsbSSZIe+jlvgYpwUKGmho5cPRBZ6iUWoAu2yhqm7sA9IC8pZ9xPSEirNiQ9NpYS1wY+kuxjN1vj1cL4OVfKok8zNcT4bHkdfQRsIR8OEWUCroPZhDruM41yK4H1ZLfMlWEDq5+lO0VQBBI5LPK4/rd7Hnwxl01B3qYXjaEfwGCQxIiGTjYGSlqXn6YlzH/EUJxnMtdDjIXNkd3Fj8Zyk6M+wEEfx0Bsjlc+Eb3YrWqnZvKFHtcltYm0QKjfK8KaXzIiGQ65q1FCUI/vpMptFN2+F8j+Y6IPKOyaj8JutC4A39bmASMIuGpJQYfXs+J8wyJPHsctVJ8GQfQj/CiAnw2wpQc3ZUACJihOcVi0u4uchG7fzdot6sIV0igytQ7j0rsup3kwfmI0E42BQS+TdgqJhsdgfFjx5CUTufzmiZn2Nw00tWtL2TyTCVsFXOMF2w/wBRltMGfTC4a6XSPiwY+DV5FRJU1vdzjhuCmD6olz6iF6VX4JjXNR/y+ohaCFpieaV8JH0FiNbSQXTbTklwSWTtLQmQpFX2zn0rBXQsKuVrLr2agX442SX/kmqWSkclyQWA4OH3GIr9RNU2Zo71lyvIF3C/X8nTreNivmns0+kVcozhMn5GBHv32mGe0aRA84Kx+LKXfR68Es+vHkXd8xKz7s0mJrh77G+HviFakbplkSHxKx2sEg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0SPRMB0016.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(23010399003)(1800799024)(19092799006)(10067099003)(56012099006)(3023799007)(18002099003)(22082099003)(4143699003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ps9pAly2umC5roNUrOaellOM70VFXmy44gwYRJv7v5I7HTlyB6r4uKXJQAIh?=
 =?us-ascii?Q?5KDIH+vRzASEW6GX6n4qBPxUIouAcu2U7LwYcCEsucVpdzNNnm7yRDPJsFHP?=
 =?us-ascii?Q?W0tHoOc+ZaT1onJjvb80+t+35N1p7JHWyLr6WcbjIsjD5VbEmeGr8zrKeOZ9?=
 =?us-ascii?Q?/6OPam/0v7oa6EclHI4VCpCgNUtLXExrIjpvppzexAbVy81wQ9xG0225Pbgb?=
 =?us-ascii?Q?i4eDrpCABjchUANAim4PJohLMzCvs1Wvn/EmU6IBuDLW6bbcFlCGP42aanM0?=
 =?us-ascii?Q?7MTYKzjuej6eb3P/rpsUL6XdgrxH41sYh6U1zm69ylfcVjZPELvK87ziOTVU?=
 =?us-ascii?Q?hE0QiNHMz17XP9fo2ACNWinl0tp0OLykRsGM2wXg6lOYUDcnCmtS6z0KA9Ni?=
 =?us-ascii?Q?4flNl3R/t22wd1qgZlV8WMBvZWPYWZrjsaeSpZ8HpdBxujkFAPD+xk9YPLb3?=
 =?us-ascii?Q?BPphJWUaXzA07KoiIl6/kUrk/o+dYSuVxlLvlbv5w7aRjQdjZFGxwcIUSbF2?=
 =?us-ascii?Q?gvL7a5M9a+bw9DnoOwCRSAj8D/qPquBROLzBifdeoRAjhaLEk/ot2UWZ6Zbp?=
 =?us-ascii?Q?WYAmNNIZOWzUKuQRJeegSlG6/4yaaJ8ogZ9FmmtLgDOuKC0ds84GkX4CFB/s?=
 =?us-ascii?Q?4boN1OnbEy3wTW2cnE95Gz2cmYKk+9WHhxwWdUnHieteaURoMdYvo2OPvkwR?=
 =?us-ascii?Q?Nd5IVes764A05V5No9E871cPLWDfjY++F0t/F0Ab/zJU+C2nvWlOTR5OPXB7?=
 =?us-ascii?Q?AaYFMe3TQC+K9oM8tNNMLN1qJ1nFfdNMdkfw4wP8bhhlFv1xlDcowLHJhDXR?=
 =?us-ascii?Q?bvGga4UAG5x4BlQrRH6xgly0Ll71xOd+ZfeMLUqzeI9L7IuD+KkCR7dh2h+h?=
 =?us-ascii?Q?sgI9BLGklNKzj4xQTrml2U0kMdv155bUUfSEb+xB8yo0onmj5KSYH2F73EHe?=
 =?us-ascii?Q?6ROMYrmI3ZNX6iGMlf7tlaziXIfL48GOGNs4s7gtflqX61zbvz+STGh+5cjg?=
 =?us-ascii?Q?qDl7dB6LyQYHVwsrmClRccxpeyC9SB1DBJ94ivq9Liti+KmNf1T9My1dGSG5?=
 =?us-ascii?Q?io541JXZW3eCc+RoT9VJf6Tv1G410ziBgprSx6VDh6iMNymy/a+R4hqrpnCZ?=
 =?us-ascii?Q?LjHsT1AK2kuHhSYlfRfRUKtCQ9zqYqbx7172HgAySkn+FlF7xzsx7ozcQPO1?=
 =?us-ascii?Q?gsrWF5ynp1C5/r++wEem4fzKMWD2glooDTl/apxfl0n1IAssKhMdklooe51/?=
 =?us-ascii?Q?AttHHymqFBiAtpaVZdQ9CBqWnWdEpweNuJAKy0E0MQcY/D7nOeIZ+ysKK2os?=
 =?us-ascii?Q?xawQXbExewPjroKxPUG9I7blt0ZXZ10c479Y7mXAfw4PEe5rak/T7PBXXDjy?=
 =?us-ascii?Q?9br8OwU+9JgqpCMBTOQtrGvVWbv7C/vvfCdr4dGQuZ5EPdx8/vUnt1eXVmhI?=
 =?us-ascii?Q?XUzKUw2YqsI7OlGfUIMhnRceXcbrPB8ewNWzvcqciPNHqupnRXTn3rY04Vwu?=
 =?us-ascii?Q?hbk27hzfThYjN9Ajkdk6nb4hSabTBjrglQJfNMueGMGF48ZAoWP7Nd0ALoTF?=
 =?us-ascii?Q?a3LOKwF+maxdFBf3QHrC81ayBkQE73o3E6pUuXQ5YUP7xv8LVXDebr3DscgS?=
 =?us-ascii?Q?QAtmsnG+dwFX0i579i6mlvmbax+uK1KDMiNc4v4PXMkuKH8EswguQ8iBFuO9?=
 =?us-ascii?Q?BOwGIohLLLFEE5/u3cmfx6tbBXtBgaKb3836QQ/QUOhllXHi?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0SPRMB0016.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc818558-2e1a-4a35-59ef-08df17e9420c
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Sep 2026 14:04:31.2812
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dldSbNsclVr/321zuMIQpa0YxEc3BP5a/lHyyUYPdLIU/ZclFuNcJ9TwLAYx1UPyLFLl9YPLx2R3mXv8K7STFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10754

> Add basic support for NXP's MR-NAVQ95 board. This board is designed for
> robotics applications (e.g. drones, rovers, humanoids, etc..) and has the
> following hardware feats (list is not exhaustive):
>
> * based on i.MX95 19x19 SoC
> * 64GB eMMC
> * 16GB of LPDDR5 memory
> * 1 x USB 2.0 TypeC
> * 1 x USB 3.0 TypeC
> * 1 x RJ45 port with RTL8211 PHY
>
> The support targets revision B of the board.
>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Reviewed-by: Elena Popa <elena.popa@nxp.com>

Thanks.

NXP Confidential
