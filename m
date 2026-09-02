Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013017.outbound.protection.outlook.com [52.101.83.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C14D4A9D60;
	Wed,  2 Sep 2026 16:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788365795; cv=fail; b=tDzFpX99gFx+XaMuct4oAsPNxbssAmFtR1jy9+Ij5N22oJDOXV+VDvJScE//z5kGVw2WIYqL+zk3EWJjhLBqUDvK7B61zsKKZHuCT3sXxgzmyGvQ8/4xzY1xzezyGwN8B2bd0FkKW+J+IcBQRV7Homy+u7NtWYSBIrrzydBflhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788365795; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=alWAkHr2flVuCX4w7T0FwD9GnOvEuLTlUXmYPiGgd7MDTwibOAWEN5FLSsfe94MkrihM9c+hJvLBQ8yYSM/70xDUxsB3aqrrJBSCIiOu9UqnaipIhT9/TBEDvjD8hPQ3rBc6HzzYaEH38LYVj3ugCoQ8WGfrUyYJqvsHZ2p7ii0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Xuw4XpVL; arc=fail smtp.client-ip=52.101.83.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Xuw4XpVL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ephrosZs2jVmdUFqi2g6sOr8aviCMXwJO/r/xVOZva0xTciQi4+HgmjhaaxQ0I+A6LP44jCBG0BmHEw7avQJNf7IUuXYubeA7XeAt7SUPRxzhzo0IYtUBXxZyCZz268TgiPMRn3n8WH4ViV7np+be/8zAq/rVUS/V9WzLaIs6Q9KRDce7x47EOyzcvprJjk+NeJSW1NpgmKsxm7B68FnMc+meazVgnlYqatfLxmrNU6QafUAAHIilCxhYR+4EjxwHEGG5qAUK4sEbAObBqmcvJWxJgQxYePb4ANE8v9I6fQ0fCLSVFchqvQ+DXQVJsl4l76x4bn8eVeSyjMDf1Z4iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=y/uPNgL1W5zXKxhjEprargwI9ZG3SnWP2jIFjo9poxxPm31K4aF8zWGap2fNwtCIXOavgb7EaMgclLR83+Bz/Q0o15TGOVHGcQX72n/pxJQ0+bWl7woZRudhzqAF2wD8LdqzYGgnKgHZ1KQjNXhpxmXtRf2C+9hEdG08NCt8XZ5h0RZrlll5aE8HDCXCGM8wiC5YUqZxMQHmEeEnmNsp7XSM+TFP76HqTAIYd2yMdLe2Y2nwyU3iwRupA8f3O3LPaE0xNitxROb2CzzAJdjHVtaO3y67uK7aazDnS59J7lnMeV+UDRJ/LxlENkBnQW2q7x718gDWF52w3cutPZWhAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6rHFjSqf+6DCLeGgGMXnp2u+e8Dc03oxwYB+p+SScKQ=;
 b=Xuw4XpVLlMm9afA74BWE+WQuPtftq6x1K7Ol8Xxele1b7dOHAijbSEN8aRgXdsIFaHsJT4v4AbyIPxZIjFNZJVHSH0YClJPyh9NNJqYC1fiLt5bJ/ap1m7yzXGrqdlZ0g9vcVJwU3PP0A6Va2aboACaYYVi+Qj1a0OzOw4InKDN2ZG4ubI/j5UnKmHxwNVC30Gwfipv7UeGsDKk9U/7B4P5QdroUfSWri0jcAi8V4kpDMxgnkLQejrG2/KYK4RBHBAoeZBdegRzhtAyLwvypgtqd1HA4axB+yhowr6wWH2WOTBIUEq33SrsKiNvQLM2cCdcyPiWB/9L6jkM0/RjzzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com (2603:10a6:20b:414::15)
 by PAXPR04MB8392.eurprd04.prod.outlook.com (2603:10a6:102:1c5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 16:16:21 +0000
Received: from AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c]) by AM9PR04MB8469.eurprd04.prod.outlook.com
 ([fe80::1f31:d3d0:6150:b49c%3]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 16:16:21 +0000
From: pankaj.gupta@oss.nxp.com
Date: Thu, 03 Sep 2026 03:16:09 +0530
Subject: [PATCH v46 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260903-imx-se-if-v46-2-aefaab525034@nxp.com>
References: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
In-Reply-To: <20260903-imx-se-if-v46-0-aefaab525034@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788385573; l=3245;
 i=pankaj.gupta@nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=KbsOAFpHACplNAPmGRd2lWbRwZlDd8pxruoejy3KybZvt9bqplcM3DB9+5Cq/BTQ3MF1K6cI+
 urL9PteAGFCD/6WoMSHEYiGhslMm8XpYMUXo+YVut6it02AGckxxXxd
X-Developer-Key: i=pankaj.gupta@nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-ClientProxiedBy: MA5P287CA0257.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1f1::12) To AM9PR04MB8469.eurprd04.prod.outlook.com
 (2603:10a6:20b:414::15)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8469:EE_|PAXPR04MB8392:EE_
X-MS-Office365-Filtering-Correlation-Id: e4dd55ee-9442-4d42-8e84-08df090d871d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|7416014|376014|1800799024|921020|6133799003|56012099006|10067099003|11063799006|3023799007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	R3MQAx3xt11K79ns3Dsk1Jl0hX7CBzi7EfAdrdDvQDn5UlC0XzDHPBJqLM30hicuYbD8G7BD0BUrekZ1ldciSJWu69m95701gZmruKJRx0qpKr6z9G7pRBLt1D5sV3KOpKMMxAHGf60kbAxa9oNXbFxM1t5HPLD16yRhyEcx0LAEFejnKk3MVPELtVXTPOajD05XFpdr3oFch/qTwqMHCb4N1Xe7SgS2QLbFOxdo66lDt4j3x75E/9kpVVKOeF+nM5VkY3M3gdCGea5yKPmDF5ItihjK3CLjgdT6aiJy+YmzBWUruIL5VX+eRvq77RwR9SoPsbP3RzdoBlCtv6NS9jFDiRJLdQlRCOhXQm0rl5BL118dgynH5a35VDF5n1ZpkZzaFii5fE5QD3KlgdV/T3sy0oatRBjsi7JU0T7K3zldoHxwYAMWemf0BV8dRkrwYbYcyX2lnwnSaC4hbpAK+4NxPunHiNvzOTXlqfhP5e+0rVcgyXd7wdeVaF0LdwA+06w536KV9LOgle/8NVpYhGNIDFfX80bpIX03zYd/u6Xo1iJQh8OMvtHHuUypkPp11IR05ftwCx9+BwNnUu3j8OtO/2dAb1f4QgdA2nGdXz6Y6CEdbgMKEMDXgAE5Wgi3ZTSE0Pp+0vSklWv+QJlcLwLp7DG0FDX4CDcznijTil0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8469.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(7416014)(376014)(1800799024)(921020)(6133799003)(56012099006)(10067099003)(11063799006)(3023799007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjlDc2llaHhqQXZ1aXhMY3JSYk9ZaFpiVldWQ3R2TURvSGd5ejRYTCtZQ1Rw?=
 =?utf-8?B?VGlVMWFWWFNPSmZxU3hoS0s1a2JWWW1uZFAySzlsaDJ0YkV6OWp4OU1yUzhL?=
 =?utf-8?B?WGNhWTkvSVU0eWlJUG1HeGx5Zjh4SGFxRnJMNk0vSXNZZlNJeFVxWjhwREtD?=
 =?utf-8?B?WDc4QjFEZGhuU0w5ZFBxSHRvdzdnOWtxd0hpVVl1SC9POSs1TmRsWEp4d1JW?=
 =?utf-8?B?NmYzZ3k5NElSMUFhdHJCMmpXRTh1UGpxWklMMnVtdTdyME1XVi8wY0FTRXpS?=
 =?utf-8?B?OGFFTzlRQk16S0VlUm5mQ1RCWUdtSlFYK0ZXZHZTV2crOHhHblJ6Ty9BbHYr?=
 =?utf-8?B?dHdMd0tEUjF3cE55eWQ0VVJlaXZrN0huMGFlYkpmMlV6aW5QNTg0SlI0cXg0?=
 =?utf-8?B?QUNMaWhXSTdpN0I1S3oxME9LYlpJMVhCbmdmbHZ2bFFkV0RlVWpRT3h5VXI5?=
 =?utf-8?B?aFZST2RwQVZwbVJxM2lMd0NmaTNybW5BaVVySnZyWTJvQ0Q2OFpwbFo4dkFm?=
 =?utf-8?B?Nk9xZmxFMDZkN2VKT2VxQTM2UTM5TGM1OFFtUUxod0czdjFwV1FYaUhHRFhO?=
 =?utf-8?B?Tjd0ZldLZGM3aXFadno0SjlBa21KNUxtU05raDNKTWFya2pET2NoVGJvL24y?=
 =?utf-8?B?U0RaQVcrbjF4c3I0cVVZbEdORVhRdUlRKzdpOUpMT1BLaWlkVTFidC84NVJ2?=
 =?utf-8?B?WlllMU1MZzcxU3dHRmNybGg0RmIxajA5VzhvcDc4QUZidEErc2pheHNOTWdJ?=
 =?utf-8?B?TFhVS25USTVZVzJqUksvWGxSbHFOMkFYMUJtQzlLVU53R3hhbVpPbVdCMmVJ?=
 =?utf-8?B?OE00MDdyUEVjS1paYlVrRnU0L0IrdStvd2VNbzJMSVM3bkxadVdwakc1OVlE?=
 =?utf-8?B?anpmRFJBTXpKM1JMSHA1UE1BZHNSeXJ5ZENmeG5abEx2QStDaU9CSVRsbmht?=
 =?utf-8?B?STlsOERYNjhUNEUrS1IzYmVQZFBOT2xFcGVLZmxnRHo5bEkxUk14L0ptQ09u?=
 =?utf-8?B?Wmo0eWJ4YU9LYnIvTzJWK1dHdXlxU1JQZGNoVEFCY1RVMUVnamJiNlZwK2Er?=
 =?utf-8?B?aFh6S2labG9tVDZFeFkwaTNpd21vcTVNcytFWWh5WWJxK1NRcmhuZUhSaG1Q?=
 =?utf-8?B?czA1S2M4RHE5eEhVV0hrbVB5a0RqbktqeG9EL2NuYllBYUFYcllDaGRBd2xX?=
 =?utf-8?B?UnN4S24rYmtiTGFDL1g1ZU5tMWRleFZsdnBkc3FKVGU0WFpzVlNEa1U0UFEv?=
 =?utf-8?B?TzM1T1BlYXRXeTFKWmZ6Q1paUDM4TVFrcWhFZUxuY3IxenhGcVdPUGdvREpn?=
 =?utf-8?B?ZkNCc0hHVlZYVzBqcStiVkNldjJ0SHlxY2RXQTJOOFE0VmNya2VHbFRGeWJK?=
 =?utf-8?B?V1JrQ0NBWFZNL29OOGFiODRLOUEzT3Q0bWZwTDJwbmptc3BuNlRzTU1NYURC?=
 =?utf-8?B?ekphaWU1cER0YjVTZk1MQVQ3bU8rTk40Rm5QUktDakVTOFptVXpvTFFNNGVM?=
 =?utf-8?B?RW1qdXpCVEt5eERuZCt1SWFsdnBwMlhVZ2hmMjQ4Z0tuSXg0cGw2S3dzMXFs?=
 =?utf-8?B?cDE3VUZNSjM0ZUVkRUtKbU9HQzZJaFV2Z2lURWpydDJGSzhZMlU1SjhkQlN2?=
 =?utf-8?B?MHlmbUdINnNuaXcwL1htTStOYjAxekpPcEV5S1B1ckRnd1lIUFlpU1RFcE5Z?=
 =?utf-8?B?VlovTWpkUzRVcjE0ZVRWSlAzNUhJOXBhQzEvcW1BNUlzUCtCRXVid3VDV3gw?=
 =?utf-8?B?aTRPcDZSWUJ3emxOMnArOUtDUHcxMVFXUUVHdHlLMGQ2cTQydk5aVGVHUkR2?=
 =?utf-8?B?NitsSkZUSGl0YTExa1h2Qm5FQm8vcW1YQjZxczM0a25DdWk5TEhIQ1I4WGhC?=
 =?utf-8?B?ajNWalUxMERSOU9VK013MlFzYXlqNHc3b09KV25tR1c2cEF6Ukg0VlpjcUVY?=
 =?utf-8?B?QVN0bGxsOXpFS0dxSHZLbnZRSk9CMVpneXMrbGFaQ2t5eWNvTHFCTTZlQVVX?=
 =?utf-8?B?WFY5T2ZuT3lqR3EzVmhTL212OUkzQVkvY3gzdVQ1OHd1VUplV0VFTHpPY1Fx?=
 =?utf-8?B?aWZXSkRNSXdSa1B0Z1VTV05iZWwweldySXdia3V0cSt3eEU5U3F0R0YvNDJk?=
 =?utf-8?B?Zkd6TmRLdVlEd0Mxak91VS92TEs2eXJoUHF0cHIvY3Y4ZHBQemxDTUZ1TVBF?=
 =?utf-8?B?Ujh1TUFUeERkUW5ZV1UvakN6ckJ1Y0g4Qm9mSnFYU3AxbFAzK2NXUGJDcDVV?=
 =?utf-8?B?L2U1eUJVMS90SGZpd2VIa2R4MFpqQk9BSFIyV1g0QTNhdGJYb3MwQ2tJRW4v?=
 =?utf-8?B?cUtNTWRGK21PSkIzR3JJUXdtSnFlUTlRQ3EwblBNUmJYOE1SRWVXSy9RK3dn?=
 =?utf-8?Q?l5h7b1Ym6QK8opEqzD1/7/F9tjEAZjbqa0ncx?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4dd55ee-9442-4d42-8e84-08df090d871d
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8469.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 16:16:21.8347
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLjI8IzRJraw3Q2vUGOgkeDzU8UpHAp5ErIvRRiBQLKUKavIBKmRueg4D/JqM1WfOfZM47rP9z7B8QieQCugVsCu0xEjQ4F7yKarWyS+j+TEZLL1XidKeL/mmF5adjU6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8392

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0

