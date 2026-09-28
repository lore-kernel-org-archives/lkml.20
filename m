Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010040.outbound.protection.outlook.com [52.101.69.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5019E4F7CC8;
	Mon, 28 Sep 2026 19:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790624284; cv=fail; b=Gp3907wqnXgbrHNAn6CvWIcQ35pwRiTR1dP1EAZwQMsgow4WzwZHLqlkFPQuZI1YRWMjRe3yj7kdOuWy7nQ7uP3cG2mc2WZlflAwsEeA+D9hmfDTlmQR1HN24yF8qWYJ2ojCFrMwkiBnO4XvN5m3cOQG9fJrsvpCI9nZCqVgvYA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790624284; c=relaxed/simple;
	bh=0FqXVSH/4iFMSfoCAab0i/La537GDBDtu2ADXnZUlV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u680Dem/IVlwkm7Yg/AMHXqHQBpnJ9kH0T6HSNdMXvSg4iN56JBrZV4t/BGyHn1oFoY9/JJb0/1cBq1h3QNSD7gSqYwub1ia+n15o7gDeeGvJFD+iV6DeoQ6jrllNEXPfJjDDnCge9TeWz+G74HqF0T7/ll6mxxunHJ2RsNThmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=QdoBV/jv; arc=fail smtp.client-ip=52.101.69.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="QdoBV/jv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qd9HDTmS1SR6ej2v2z79bGzxCYOwaZYuvcl4l9Q/PpSvZqCTGOt5Gi8LbpFX+W89Ix8ATPQLzGn3HbqeVYJBNP3ebJi0cErmn64QSv21IJruqbjcDG9y2oasoRVpHR8Ilw02hII6Llfg3nNUVk4WXOR7Ct+e+UvR/DlRXLEurzDIDTkBHoObDNPhsbEzqZJeHDRRocN6oDRwF2f2ldtvrMwo+wHVR3dcR+hnh/rMZidTHjh4uIJrTzOEc6W6MrTRGrzRqMziQuk4innxG40kLho0ZnVYtP5WvqKoKntGpR5p61K2esmrZU6hjqSvGNjMWYWLitjFas3UINpGgLNdzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wU4yZ7sk2kf2kgxT1wkn/1VG2fR6bqN/sf8ukRxPHK8=;
 b=nDQ9VgudVRBZBNDeIOZj87OupsFrFMX+1WK0VFZAzpy4Wk1637CUaFLR27GSH4mjbDeIdjSJC73TlYprYJZe+bdKk/qG6TNSIOGnLatL00LGZqAtAFND/IB9iUyHeZxnUkT3SF9G9L8QtUN8M9kU9+be5CZBCBM639yyBAbNI4u9rijQUVyisyGlZL9tM6Ci4bG4hozXTpe2b9lQ6c/bOMaLYhWLew7cw2eFxJN4pwSo+u6WiCJ42aStpYEfL1fkCXK+kaSx7f23tvOv5nrJ75Wr69+ujG4md+DykN3oa9VNhpRbGBSYzVllykbgbjomwQ1KAXYn35jTPLCsojde3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wU4yZ7sk2kf2kgxT1wkn/1VG2fR6bqN/sf8ukRxPHK8=;
 b=QdoBV/jvaqk+tkRi3+HDOVn+eBdcTUzYzeqlIAxp6wiSU9b2ICKL2dxKh7knEPeVSUI4hJ2A5if40tUFDdZf7wTefN0zV6O38dkqGsUINCgGxOAEK8E3W7V6KafO+/XK9U+HQTGgqfcPQwNq6vKFxJ8BXwAHTec62usVweW0rWaVFVnveSUFPfef8GWUZIIpjQolQc50RxHy0SaKOuxUeTS/X9ot4krjQQOI3+eZ+MyESYr3uZIBWtqLQuhf0DriHjrB4kd4AQis3a5TtxIzYnvUaj4bKtdMUn5DsHML2499XdGx+npmaEF4m7hk+U8PPpFnQPW0fDYI0jKdvqnnuA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com (2603:10a6:10:623::11)
 by AM9PR04MB8633.eurprd04.prod.outlook.com (2603:10a6:20b:43c::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:37:59 +0000
Received: from DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de]) by DU4PR04MB11791.eurprd04.prod.outlook.com
 ([fe80::11ca:6b74:3234:d7de%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 19:37:59 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 0/7] arm64: dts: freescale: Add Toradex Lino and OSM iMX91/iMX93
Date: Mon, 28 Sep 2026 15:37:52 -0400
Message-ID: <179062426379.2049704.18178590319982336755.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924065735.17678-1-francesco@dolcini.it>
References: <20260924065735.17678-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR07CA0019.namprd07.prod.outlook.com
 (2603:10b6:510:2cd::18) To DU4PR04MB11791.eurprd04.prod.outlook.com
 (2603:10a6:10:623::11)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB11791:EE_|AM9PR04MB8633:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d63e079-ab1b-41dd-b905-08df1d980087
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|19092799006|23010399003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	NvYDr/vEhDKs2e40a8IqVIykvMfZgBm4f3jtv6iKfNBtEC3rFqJU09bXHJEapW+vZRjW///bjtA0RbFwUft91KUSQZZMcCtaZlS7/BY+wQmidZfMq8wQm0EKAxHiOr/8L84NkrswUe2UVW7ZmrDKE9rVpQSHelKoTOH5UfEndO2m1NkCQTdWzfwbtbUWDVA0LhPyj1IIM4w267wOUydTCXAVyqOBFL6dOhQvE0Q8ch2CY1nXKj/ULvFYqkZ1I0ZfoVsLgbIgY/y7j4mrIrjgWGy9dc2SLaNHXrMaI1gUmQ0FSqQgfeFWGDrx0RIvqBsfkxxqDCgpk42qXPJcVrJurFvWKUjJlZzIuZu3ig6EC+vJOneMB5PO8JbWMwZtlVbsvQRMdj2pYW/J1AKrcwO5/O7vkbDVXSEKTGBveTm7px76TZjI+9tzk2yAYJm7A+n3pGCHH7dReK7JRBPmljJJ56K70LvM85MvCAePL1hKZrBXa9oRRX78lpfMfYjvklGjTkj+bvuerf4w4ad24WPdfeM9BoXZLf5Jp2yT3McFXxbepCWL4RZOOCPWMLySfoZt3E/mAb5BaPbyVZDsqhn1Ujwnq5YGa1I/07lLpBqnKO7z6rz5Ru/AAhQNPQdK1XOo0577b6W7F+2KyOT/F/SjWeX/3ZAxbN8vB6HFF2gv0pI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB11791.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(19092799006)(23010399003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDFEN0VRbnBmTnNoWGw4N3BxK082L0I1YTFpY2xOcTBPTHFseEVkVUUwVE9N?=
 =?utf-8?B?ZXEzblBxRnNha1VXY3lnRlpMM2wwUVZsdmUwOFVLaDVkbVFlT2MvbmRsMzdP?=
 =?utf-8?B?dDROb0ZlTkNBd2Z0bS9rNkthZ2J5NjFUWHA4elZoWGRDcFVRRURHYzBSNUw2?=
 =?utf-8?B?QjBDSGJOaXFpWityeWtqU2dVem1tOTQrM1BzUTVDNTE3NnV1WnRLYkxQaExs?=
 =?utf-8?B?aklBdysrMkJKRUV4RTdsK0RJVXpCNnFSNjRmV2I3ZlZHQWVvcHdMN2tER0lO?=
 =?utf-8?B?c1R3eldCN0xZdXFxVVYxNWxoNWIvQm8xYW5MUGNKd2RsTmFOY1hqYzBqbHBv?=
 =?utf-8?B?eWt5dFhVaW9jeUdTeUVRaVFldkVWS3dZM3BIZStPTENtdEFTWHp0NnNwaXY5?=
 =?utf-8?B?OC9NVWlIdzJ5eDZjaVlhWHg5SlBlSTRmMkUyK0RHOCt5eUc2RklseHVDbnBh?=
 =?utf-8?B?UFdkZDVvSEhwUENBN2VBdUlKQURCYklQaGkrVkdvalRZR2MzSGFtNVJ6N2hn?=
 =?utf-8?B?eEU5NDBNYVpqNEx6aHVURkl3L0EzdVBWZUh5YVNRWG91R1B5dDR4MzBjMXRQ?=
 =?utf-8?B?aFBSdHBLZ24zZ1JiZVFGQjNLK2pFYmUvWit2RUd0L3B4NnJKUnRURnk5Myt0?=
 =?utf-8?B?eWd3bTh0UzlNVEdTbG5FN2YySmJhaHlnbzZOYlVjcGcwVTdHM0crMUNaUDNo?=
 =?utf-8?B?TGtoQ3Q5Ync0QmJoUFRIcUtRZHFZUTltVG5XWjZQcGdrVlJwQzZoRHg2elhR?=
 =?utf-8?B?K3kvc1pEYS9PVUlnV2Z0cWo0SlErYkI2aEF6ZGlJNStYYmQrRUNFN2cvL0R6?=
 =?utf-8?B?WDcxQk9COExXOGUrNy9RUlBkbXlDSFJSeDBEUHppTmNnMGJ3T2FkUVo4dU5j?=
 =?utf-8?B?cm5rN1RvRTJEeEZXaytQYmtKVHRNZkdxZXhGUElBcDZqL1hzdWlFV1hzUlg1?=
 =?utf-8?B?Z0tZUVcrbnM1TU0rb0x1b1FNZ0lKckEvWGFoalFoaDV3ckpyay9hUGF3alBR?=
 =?utf-8?B?UUVsYk9WVE5sMTZCOGdTTUppTE9IY0FYdThSVTl1N2xFWU9hRGJXd2VqeTRW?=
 =?utf-8?B?WHZ4UVRYREg1V1kybWlsRmdjSUZGRlpGejV4dnQ0WGY2N2k5U0h4L0VjOStX?=
 =?utf-8?B?V1NlZnowTk1oQUt0ZnVTQ0tscVRFK3NyNHdWUWErSXNWakNwVytwRWc0OEVw?=
 =?utf-8?B?anZkRlk0cWhRUDloMkJva0RIWFNvNTc4d1BBVFZUYkMwbHY5NWlvakt6SndO?=
 =?utf-8?B?RUpVMmliUTA0UVVieTNKbGo3RGZsU3IwMUh0MXFZSFM4VmQ0ZW5hYVlTWWov?=
 =?utf-8?B?aTloNzYyMWhySWVqOHd5WG5vSHB2V1VxaUorZVp6aEFJbmloMDU5TWI0cURn?=
 =?utf-8?B?alB1eVBlTU5qM09DdWlLd1RXbzVrOGQ3dWlWaGRXcGxTMlc3cDJBeXIrVUZ0?=
 =?utf-8?B?Z3dZQk9oZ0M1b00yVFRyOUJabGZnbEtBNCthM1BMWkFRTzlKVzNadEpKNTMv?=
 =?utf-8?B?cnJtdTlGUjI0OFBjMHVXd2x2VmZkMkovT2Z5VElnVEs0V25aWHIwTHNkMkFG?=
 =?utf-8?B?ZE0xUVV0OHdLeHN5UUErZ2d0R0R1WDBST3hkU3NqcXBwRUppYXMxR0taRUVw?=
 =?utf-8?B?bWFzVHVPVVNxY01haENwN3cyWmVQdVRkZjhIQmUrSVZtNkU1dnBZWWNlaThD?=
 =?utf-8?B?NHNnLzdLQWljNDlmakZuTzFQZ3dTZnhLcThTeHZQdVV6c1pYc20rdlVROExJ?=
 =?utf-8?B?UmJEdDJPS0ZjYjRLUW8vRnJwYzJNWk10cWJmWDVyTE5NMkVnTGNaSTVQcjhv?=
 =?utf-8?B?QzBidXJ0ZDJON0YwbVp5YVdzMTJuS3ErNkxGdTBKTDRFWktoYzBsS01vbmNs?=
 =?utf-8?B?NzR0UExFNkJLaFdFNmIvajRtNk53b1JVRjB1M3RaUVVxdUJQY3FiZXRCV21E?=
 =?utf-8?B?WlZhYkNhTmRWWlZuanZzS0xtN1ZWK2FkcVFuc1k2eHZVT1cyTjhiT1JjQmdQ?=
 =?utf-8?B?c2VROWUzeEQ2MWVrZG9EaW8xYjF5Z2F6WmhvN2tuVGg2TTFDMHBORzdOVVpP?=
 =?utf-8?B?NTBSTmFLZTNiMEJBbU16eVBhcFh6MEJ5UHdKTmM3eURPWGZzVXdrUU53UGt4?=
 =?utf-8?B?R25pdzVic1dQWXlaVWlZUmNLb3kvcjNhY2wySjZ4cG5vSk14V3RwUnplbC9w?=
 =?utf-8?B?R3ZzejlxUno2ZGRFNHp4RTlydm5IUmJYd0tVWUlzYVdjZ2RsbVBkN09BQlZr?=
 =?utf-8?B?V0dZZlVGNGVyYXdPM1VXRmdpZTgyb3FkRFZIdTFjTEprVkFGbStwa3E0M0Zj?=
 =?utf-8?B?bTJGaWhSOS9Temoxd3BGQWNHTGt3U3FkeWV6TXhVRVpNZENQZFBIZTVDZmdj?=
 =?utf-8?Q?V/agKkd/nndIGevuZRQnQ247TeBUC0v92f+o5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d63e079-ab1b-41dd-b905-08df1d980087
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB11791.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:37:59.4123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qHLQyUBNbDCRJrU7x3B8SPoC4BYMVoI6nQOOnhKEzRneqz3GCMg/sbybKjW8SMJBk90DFaoh87vgDeUMQTX7dYBfhb25qAtPRv/ax6MZB8Ll7IRWDhgnQekHNilkoOh9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8633

From: Frank Li <Frank.Li@nxp.com>


On Thu, 24 Sep 2026 08:57:26 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> Add Device Tree support for the Toradex Lino and OSM SoM families,
> based on the NXP i.MX91 and i.MX93 SoCs.
> 
> Both families are available with either i.MX91 or i.MX93 on the same
> PCB. Since the two SoCs are pin compatible, common Device Tree files
> are used to share the hardware description between the two variants.
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: arm: fsl: Add Lino iMX91/iMX93
      commit: e43e23cd502c1b154ed2e2c2d587b262663d2f7e
[2/7] dt-bindings: arm: fsl: Add Toradex OSM iMX91/iMX93
      commit: eea8de941daa56f75227b6778529f4ec78662bc0
[3/7] arm64: dts: freescale: Add Lino iMX93
      commit: 2f05e2f793b2282d591dc662d4e574929593669c
[4/7] arm64: dts: freescale: imx93-lino: Add dahlia
      commit: b3e94243b499869b7c91aade2224c02cb9ce677c
[5/7] arm64: dts: freescale: Add Lino iMX91
      commit: a1dea6c558ebe2bfcf905f51b81c08cd398121f8
[6/7] arm64: dts: freescale: Add Toradex OSM iMX93
      commit: e8a8c86875f4f636bee56b9ba923ba44aee9e640
[7/7] arm64: dts: freescale: Add Toradex OSM iMX91
      commit: 73c898143ce0f2b76d8495a5ecdef3bf84e01c43

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
