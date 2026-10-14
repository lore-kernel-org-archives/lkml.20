Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013037.outbound.protection.outlook.com [52.101.72.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7197C5476C4;
	Wed, 14 Oct 2026 14:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791987638; cv=fail; b=kq6t4ypa+RJ90uky51ygIFFpVSfn6dV2IYg8Qa+deE0dCSrw/5TAOo99NQybQm3crkOyyHayLI+/XkqWPQ7fEhWJtSKO2d/MkFhjm1b3PrqFMc4WGh/QCQJhy2JvpIIQy7nce87RtBSv5TMMACD8g2cj/kCdOogZWRbWyeh1kz4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791987638; c=relaxed/simple;
	bh=tmLunUlzIamUD4bseg60v4LcY1GnIdEhkvySB+RLniI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WzNPsk/A077wscL5dABQM5JuWdgJMJJnUVSiw0oJ/6OVeTKjRYElN/16UbAklVUZCCy//cRDvn2/HVZbjXeyP2dNgaJKlCDbDDeKZubJrVfD8klWBrt81H5661C4HQG+5IBbCtspc9yICw1im+jt0eNR5/mh+nwSly/t7M0EB4Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZXUStdpT; arc=fail smtp.client-ip=52.101.72.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZXUStdpT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nd+JSgLdAj7utx5AYxn/s7cR90ubPpPxyB+sbcOgWf/laepKUUUb1+Fta3mFITSA0kwPRVWNSErJRf0fupzEr2xRmQU9RHmL95ipnB0sEQ3Ml+U2WugWus8IXRCEhKQOF/IZjQrhXeiAoDB9HLkWFovG/cxf4g3aCGZhc6UV24MOCStd7pxhIssxhXlDq2rYJRyhikKa4MQNloafmHyzJ5gfLznu379qEUvPwA2ezCnLfBeu6m/ZNJK0StN31jNixcukbd5cNqb58T/nrI3xoOrs6wf+xwX6eWXVAYjK6aFC7qGIuqkKs/Fc2XjjTS7LKWd0y3f++LfUhK8vEQ6Gew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tmLunUlzIamUD4bseg60v4LcY1GnIdEhkvySB+RLniI=;
 b=WpcOdfoN2/wUjLyGcNiiD785v3lDetyf8NmSDcylCvg9Kl7vXL9S8xZd4Ls89ifw31nsAOmO4o1AdC575f+8mkySA2ndIiKofwb4A8uQLMXwIjl8/DCUE6DRC6vX4B0+usN/EOgr2IqwSv0wOLhBduTEqWi+2Z83Wtqer5bSCxqw0z7Nc/xexg7Zv6kZFR+v2sT6MPwgrMTuau1UHPfzhMlIsVZpbdhyMSXfrjG9tY1qtlYGaoCOxofOO6PwXH9zCuae1Tn4ArXS2JTf/WvdDV5WyvDQR1mxXVxk1aQkWjtkM+LU11tYMDkUvu4prp+UXVwVTF6a6gln9zdLLwTo2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tmLunUlzIamUD4bseg60v4LcY1GnIdEhkvySB+RLniI=;
 b=ZXUStdpTnu+Sn9XW9ZoK3oDsM9msy4Z8KtVfXJYJQD+/YHTTDMjmUWzMMlNxUmnLdx1eG+hiTM53X9WKMI1D+MHx6N7tzr0arb+h5UwwpCkxUZpyAAOAD3k4F0IFXTQyJF4hL6A1CKbYn62nglEhsZYZCsL4Ct7quMLB6mUThUoFy50hPQlVw3FtquHWfCuP9w3z0bCXK20LJZZ9fiUo1ZTaDLDoZfiff4NKg8vNEFpOIY02yEgW8niETsS0R8lWvDC/WEB3zVMp8GwI7NUj+nbfxINoMSrQCwdgi+E14/L/KIeJoVNsL6xykCnGiEKqAaNSmkPSXBrvgbMpyy8qRQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AMBPR04MB281941.eurprd04.prod.outlook.com (2603:10a6:20b:788::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Wed, 14 Oct
 2026 14:20:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 14:20:33 +0000
Date: Wed, 14 Oct 2026 09:20:23 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: freescale: imx95-toradex-osm-dev:
 Remove ETH_A PHY interrupt
Message-ID: <as-Pp99xLXk0nRJd@SMW015318>
References: <20261014075812.29154-1-francesco@dolcini.it>
 <20261014075812.29154-2-francesco@dolcini.it>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014075812.29154-2-francesco@dolcini.it>
X-ClientProxiedBy: CY5PR17CA0022.namprd17.prod.outlook.com
 (2603:10b6:930:17::12) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AMBPR04MB281941:EE_
X-MS-Office365-Filtering-Correlation-Id: febc04d3-3831-45b0-de66-08df29fe4f0c
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|19092799006|23010399003|56012099006|11063799006|4143699003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	MylxZ+i0XPXDBb/5cLwO5psFe3ah3ZeJSO8PClbCGiZ1zcmeaSjJUD45CUvWSq+ENhZw30tLUhY3xoYdpFSygvucNfXLLnK37xf09BWXeUCQ64TxR9gEIvyfMdUw/Y9snwr5SmUGqvm8z+LcIbCzEmSUYY5A8AGjyujQlO7OlXBZzNA/Un61PlrkYOZKknlY5RnGj45xwtg9rnn4aZIdPmDIrRstG5wZX1yFgx/QdlaCfwXchNfEejgd/eDU+TXyooPcml8+R4r+4s5/a5Y9E046JEpoPXNPfad7ZsxaxeKzkCAP+7+seGm0vaXnZpBgeS9vnOEMNzza7NCEf8EqASUz5ZRVP1KdwC8fP+y8LBZxoiCw5/D2mYy/p8/mq+2kOy+YrN9lUanRLmrgi1jmineQTZ5XJHuUH4OR2c402OVe+sf0pw1xDIq8SGQbnJ83TCXLBXo0MnMzJ01RWdTmosdkkVLFxrjhgQZMtaleKsdlY1RXeF//oVXkhIprauMI7PwIunJYBXVA2Iz7iZG8wrSbCgtGEQXXc9M6tuRW0H7f+ANCd+KnE67Dj60npAx0zqJsPVBxU00obJBeey6tHkFrtbw6CVX2xwuVU4QrSCINv6SRayGhhgdST837sDpZiQQQBu8Ay8dXZI6nTRsnCjP3OnzsNpQc+J5IpovpIR4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006)(23010399003)(56012099006)(11063799006)(4143699003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?phTP7pJMos8OdR2GfSVZO89+TazEYtMcS6VU3s+eoQ6PqV1YQkzIvZ4tUwRK?=
 =?us-ascii?Q?cxX0bma9x4s8FOjl0g+xJ9NSOzxc5cbXuR2t5ICFp5t6YE/0cKeDYyZqEQa8?=
 =?us-ascii?Q?DcYviD1+4i/bTEtIkgMGdxHo9BW//7aOZyzpNPzfcs1Pp8I/4qSTAOzVu/B7?=
 =?us-ascii?Q?yZjQzBOfMqxVBnLgf7bdWUc4809HVmwfR3jqTbg00TBfTLrKQNhOaPFwO7dT?=
 =?us-ascii?Q?W/z/T+ctKATzl2iczFyBu6vAyDO714ujlZ7301XE+7cEIrH4uvev/uKGnPUp?=
 =?us-ascii?Q?XW/ZEbrM9TiUuQQ9MBkKwqe5n1q/4rdxYP49SDb70C7JoI+sbGEy3m6T+3/b?=
 =?us-ascii?Q?bhlP3Zg/hxghQkupmgicBEmItKaPTxWQIemGlyaHkXUZ0wSKodjhyZnkO8zi?=
 =?us-ascii?Q?wVq3cwoZYCKpbHWTU18XWwVbK6yKxR6eW6LmuY5SmunqHlKr4NRQdUZUWMmw?=
 =?us-ascii?Q?44k8ORs/quHBe4hb6W6vgV6PbZX0QZDsXO5U97IFbJKCPezIYvnWcMXj360v?=
 =?us-ascii?Q?h7H84jsNWda0lVo31BKrReD2t0Fl3ZdeJKjizasp/aZVGpo+s9k6U2hL9Pb1?=
 =?us-ascii?Q?k5OAPN4rtOvPWdbJxpqPRA3gvv4GAZcAoThNgHNMEuhyoehuVnKsBnNwy452?=
 =?us-ascii?Q?H+YsnF2zTYrHQRAV8ZsXt8PdO3ypscTvNtuf/NqJHt9M5AwumvxHrfMBN3hw?=
 =?us-ascii?Q?P1nypAM57QFAa38XO4vGuDnUtafpw7k2pr4W9Ud5qRnTAorxgIF6rdsi6Csq?=
 =?us-ascii?Q?PW0eDRamvKUhvQMxdmfdrX5zZEWRRULwqEfo3GAxN2vIUjXJ/bOJcb6NcZmT?=
 =?us-ascii?Q?a9EAW/K4NAtUfaOAwEPcgR5usezRRO7gYfmw2PmVvcCEMkyC5flyxuUAQS9u?=
 =?us-ascii?Q?bJx9une0xIY1lKAykGYDno+Abj5Y7D7xy9HlgP7Elel7HDYOVi8yUoLjOLWd?=
 =?us-ascii?Q?xo/vexVolNsc2KALvAPRSgLS4UYESf/gzyKz0Ovt66EG9Uhii0AEqhCd+a4Z?=
 =?us-ascii?Q?YFEr+wDOCu5nvV369k6olbwshlGGbEFWrJkP0m+wnKIeuMOk1FYqgUeSicVG?=
 =?us-ascii?Q?ZwM7O5tZC+rdMszk04sPyHoeAzBSMTAJj0CtuUhyWWubSZsILsK6tmyjtj2K?=
 =?us-ascii?Q?F/JrE3PnAhWKKAgvAaw3L8q9zWm0gfTIgtVL33II2h3qLSm52q/f4GFwtGrI?=
 =?us-ascii?Q?7lGpdWHa2mKJLkQjQkN8wzUZNqahsBkCmFs6fzEMw6mtzjTJJ82y2LVWaon/?=
 =?us-ascii?Q?KckRl0dEKIdbSD/KsME57pwXd+VuEq22WP6JPWCUeGVZzrD4snpCVn6N7udS?=
 =?us-ascii?Q?XdOJzA04Qbqt4f/NX9k0jP1OuDGmodbg3Hg/hyVCgrJ9BDSL5awMMntKt3rr?=
 =?us-ascii?Q?sMzZ4fSydu0RfWWRxO5bXR8tRLf6VxkmqdvFi5UZLH3MwYAjl2wNFS8E86mV?=
 =?us-ascii?Q?Il+ahz+le4MnquZB1Ul0UgOHSnGQ9peLvAB+FvFzcJqIfvS6BzqY1EohHyF5?=
 =?us-ascii?Q?aYcE3L3C52b+9cW9e9o4JeGLTxIu7qhYLBGyHsaMO4gqNAIP0zrECr5cjxiR?=
 =?us-ascii?Q?PjM6DqWF8aJyzJFQyWi4tMRVaX5+dWdxjM5rOyi7iFsC8GmQC7qVDbWGAynM?=
 =?us-ascii?Q?0ZAQf61AlXHrp6ivBwMutrNpfS1xYbOl4UJnG1tASVEUcrbR6TIfejlqNep/?=
 =?us-ascii?Q?k7AMNAXpYZPSY9g81qIFG4z6S7yD9kkJARHHkBfNRd5bDCFME7edmX9gyoCs?=
 =?us-ascii?Q?IhCLbzKvq4T4XFW3UBxdM7lQzudz/JMe0dD9khB+eQaQymcnU17J?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: febc04d3-3831-45b0-de66-08df29fe4f0c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 14:20:33.5968
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JQth6ezbDqrcv5L8sgDsOc1aT4VdQsUYrt9STxvRc8q0tvkdlpCVNR/AB1MfrkVUEe+z8RO0wewDGe0+CeBzDDSQ4CWvWtqiFd7HQZ27ju++lIrNgveZW90xjMjqdmmS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB281941

On Wed, Oct 14, 2026 at 09:58:09AM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> GPIO_A7 is a boot strap on the OSM iMX95 module. The pull-up on the OSM
> Development Board Ethernet PHY interrupt line causes the module to enter
> USB loader mode instead of booting normally when the reset button is
> held for more than 0.5 seconds.
>
> The PHY interrupt connection has been removed from the carrier board,

Look like it is hardware modification, can declear the version number here

Since V_x.y, the PHY interrupt connection has been removed...

Frank

