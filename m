Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011059.outbound.protection.outlook.com [40.107.130.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC41386C0D;
	Mon, 31 Aug 2026 18:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788202240; cv=fail; b=kuNwrbHCU1lrPgPlXWmeAeg16mrXUtCj5RQlpvfjapuPT81tqk/8Ck5t5QKjQTS1Q7kZUeBUqk1krMiNgOvh+54q4n5hBYBoaGim2b1Xl9P8GFGFd80cQKu1upcnLVGygco6jamXv1enCWejwqreszzLN3rLa6QqPr+Y4rzAoug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788202240; c=relaxed/simple;
	bh=4zsbWCgZVbHcWN3dU1Fg3QtVVyemHOqtakbhwxVDkzU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PvmOYHfZAU5BfyUMNcTiSqebTqVbF4s0SRfSFmEnRVoj+MzEfXd25bY1g2/uVs9ankhpkCCXAvkX2+Ajilh3EZ8WooJDI3cWWAz0zntmyF+F8j35tzSrPAh4qkCZHs6uu5pncHXU4JXagtCTHu1mUAzKSQs39wEvhIrZwoW8Pno=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=thy1nDhM; arc=fail smtp.client-ip=40.107.130.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="thy1nDhM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OzOTHdjgbyGf4nhlr2LushkuOVKf+ziCSH/bCFtIT6riqPg9dHvJItuhkoQUncI2yeArlZFKtH7krFD5z+HeisvfUzs12r36fyDChXYUeAUBGUegQ/jq7C6+iyYibq7YN0cYVywTImT0kxjpWKVC6mvVumxigVm0u2Fd3xvrBPlvQy0NaDX7QgQdTjibXvFMHiERjFZ1LY6APiqv02jsRMhxp1j0z8w34WVz/S14LuAJ/hd8XEfX92v8JLt5tSWTJz6xn16HgDEPXvdMaR+Vv5JhAg6oWluEr9JpPDuUzxx3N1SeBkZWiQ1vyeaiCVuL57nCqh4OMm7o1IdqkN3I3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wiBklvXbq7CqzmBVVdyXwqqhN8pnC07+oo6rR9oIaOU=;
 b=CWavovc/lF8kI11rOFXhzx26jk7o9wTCAHSwbdGS90ie9NCQOThbX0SroyizU6Dl/rt2yJZUA6COdJWJMCVvHOLMaol7FUt4aVDOt8O+2nS4f0UMu5nOq7geurvRDBpqSZSs4KFuFjKTllfqGwYQG8RTVNigB9sQ3SJD7ZvwVdFsx5hTOVgQ/sU1x3hABRRyr2ilJPranqigHJIvHlVp5f4HVwVtoC4mWUj/fa+hHgBEICLHUUf4XKPkAmhDqZLPts2KgFHCsWSEOjf+jjFNBX6m/uteIKr2Ot/O6lWW0TvsTNriLA1iyai/mdQXWvdoql3KaDYVIIesnnXa1etZBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wiBklvXbq7CqzmBVVdyXwqqhN8pnC07+oo6rR9oIaOU=;
 b=thy1nDhMjvh7yeBewEnhmJEPP3yQ4rlJG29iMVvvU74uRVfD+Z8YPzGVUELs5z7hAlOWgRQAHJRiY14t/Qjm/mq1jS8LBZ7vTcLRpERg2HEK7JmD/OnyEm7LwNQDZjXAYpIrwydCeR0VxQJNQUdd7ZkTwA14eOrzJvWAwuI0G1qngyFCKsxdVykCKQXhUqLHxI25FbjgdkIzckCQcxHgIQiTJdaYum5OgIls1W1zH7RwBiNEDJrsfzCKdu6qOU56dlxUVwT4LfTwwWHTkTR5Ys+v5ETyM7c6wkKmhehy8WcXnkav9kuBFyKbxR7Ry/co3Krz7IMVT2+PXPTWrmbf/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AM0PR04MB11994.eurprd04.prod.outlook.com (2603:10a6:20b:6fb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Mon, 31 Aug
 2026 18:50:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Mon, 31 Aug 2026
 18:50:36 +0000
From: Frank.Li@oss.nxp.com
Date: Mon, 31 Aug 2026 14:50:19 -0400
Subject: [PATCH v2 2/3] dt-bindings: mfd: st,stmpe: let interrupt property
 optional
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-dts-stmpe-v2-2-f93d5f080443@nxp.com>
References: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
In-Reply-To: <20260831-dts-stmpe-v2-0-f93d5f080443@nxp.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Linus Walleij <linusw@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788202221; l=995;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=11kTs+03fDGrpONxcr0gVZNAQnZAN2wJe29Q2TQ+BPw=;
 b=8ajrGGk/eUjOiWVNCdvNoVz34bktdeCov3Dar1kaA8yUFLWZZUAgWNciTDFxfj2BvIXQ2Z+3I
 W6UP0SD1gIeBono+Uh0dehFde5WloVsNO8WDyYAHJOln7geZAQ4dTKZ
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CYZPR10CA0003.namprd10.prod.outlook.com
 (2603:10b6:930:8a::15) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AM0PR04MB11994:EE_
X-MS-Office365-Filtering-Correlation-Id: 8431dd06-03f3-4171-2d89-08df0790be8e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|1800799024|23010399003|7416014|366016|921020|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	gABXq63wlbeGYp1aPqrBT1f7S3EHggmsEikJj1meMMhvkqnLz0XX9g+ujqruOyZektjsQWwPEYpEcwKwTrDJ9ifvo3gSt3AjKx1925HufuUpr1sgylCOmLaOkDbuyv8we/1I17p/azC9VasP2IKsd8CTHb9oVAMVxFPFVULrh8Xbbmc8HF8cluOY0kEmYrW32DxB5+Pa9bngER2BWtwWIoHyL1AFIr8kE2a/XNbik+s9GBlMbPCZ01336qI2wctUl/cdyXj8lKwrnHdA/KQgBCr0VkjKkss4KkdMJ+StC4/JsJwOp3zL/kUpLAYOqAGrtUstq/ayT3kZpgc7Vu2JXQGee1IUefhyBevB2/41xl8JZlAmuhTjnOBXM2nJgP4P8ybpW4CdHBuxIlQb0d51vCWaFnG4OtQUSah+dZDdAroWooBnIpn2Dvfsvfsge+3U+WoBOEJkV/atvAFZgD6p1vWTsW/J/nAZavzhKyhCRfth4PTNMbX2yOL7YQypqPceONSn+140/6isN5wGztd72x/Ifa+2P/x44VDpeFLas5qi5jIUeeuOKe0z6nIszglGak+PriZxJueWM2qW7jVt+LpwMF6V42HE9fONHazdxyhCEwuxOlByM3FIkw5hqvJnsH7ruI1O4T76jIHBBkoP7OK4fSoLw0HfRlMgHh298YRAG3PsnAh3mxLWXB/gMlPtbkoupAmYQixK1gDKv8Ff6w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(1800799024)(23010399003)(7416014)(366016)(921020)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M3JVT2M5QWRwVUZVZnNZaTFCdkVIRGxwakgxMEhaZ1JXSDNuQlFja2owK3V4?=
 =?utf-8?B?ZGRvZS9LTHNLOXFYS1hMQlBCT2ZHSlp3eExEeHBnYVIwMUpLN2ZGa2dlbWdt?=
 =?utf-8?B?aFV4bnZ1ZUdZU1laNnpLU1BJc3hrR25tYnk5Q21nWTVpM3ZLTlhVYkJ1aXpr?=
 =?utf-8?B?d01raEZBc2NPVWNNTmZrN3JucUtHY0lDcXQ0dlNBM1VOZmlTNWtHSFNzbDJN?=
 =?utf-8?B?dE9tT1RqWGpTdHBmeXp2TnRNVU1NdU9USmxBTkFXQ0hQL0VHTVNCVm1Lellv?=
 =?utf-8?B?YXlxY2NzMDBlNm1tcnlFMDNKUVpSeFNLWExEaENkbFA4UVJieE5PVkVCYnVM?=
 =?utf-8?B?aVZLd0xGY2RRS2RZV0hLUXdvUGtvQ3VNRW9uZHUrNmZwVWltYlN4L2JJSnAy?=
 =?utf-8?B?UzVvd0gzazdnMzE1Rjc1cU9Ga3l0N1VMYmhqZ3FidzhET3lyT1dtWGhmMmJG?=
 =?utf-8?B?VURwNkUvd1BqU0pIOHV6MjFyWUh5N0pST0VKb2FTWFNXZ2JndlVNd2Frdy9L?=
 =?utf-8?B?bDRVbVpDVzhWa1ZDS1p3dXk5S3FPbndhRVZmcnY0VE9mdE9QS0NwOFZCZ09X?=
 =?utf-8?B?OXdQR3YrUjdmWUVockZRSTAxc2NMNllvODdiWm5WRVhWbUJGaUFqK1pwUjk1?=
 =?utf-8?B?S3dvaW96bmlmOEp1SjB4RW1lNTd2cTF5WVprOWxQYzZ5NXNCYUdkQStLY0tY?=
 =?utf-8?B?YUFIVkNmVm5jclN4dGdCcmhCOWxtRVg2blVmWFhDYnRaUWNPVUJUQmFZMWxZ?=
 =?utf-8?B?WEVTZDA2a2RzdTJwV0dsNmE1QVR3OTRvSFFrclJMR2pTSDhZdHNYOUVmSHF1?=
 =?utf-8?B?MXg4cDgvRUtXYllCVENNak50SFNGbzFiOU5ZRjNyS2dmcFJHQ2V6Y2tQZ01i?=
 =?utf-8?B?UE40Yy9VR2J3R0gwaDBjVkZDRXJwamlvbktHeW1KeUhGTGYyK0NVdVI3aDVy?=
 =?utf-8?B?MUxpYW9PY000TE9ROEJhZzN3S1ZkWkVkOHd0THFhemZDU0ZzQWtGVFFVR1c2?=
 =?utf-8?B?UEZoakM4RlZIL2pVV2VmWlZjMzgrYTRkNmJjYkc1WTBiRnVUUkZqZ1JuOHNS?=
 =?utf-8?B?Zzh0dk54a2xTREhBWW51RFdKNWNzdjNXODd5NlBiS2lXaHFTMTFhR0M3WC9X?=
 =?utf-8?B?bTcralBtZEVlOFVHU0xGZWRwUmpldHA5QXZSbDhOeVN0SjBDRzN6RytSOS9Q?=
 =?utf-8?B?a3V3L2hqL1FYMmZZOTBKVFVaam9WQ1huNTh1Q0VadkNLcGlobWRKQ1VrQ0hm?=
 =?utf-8?B?Q3UyUjZQdFVJdkJoclVDeXI4Y25qamtSdGYzK0VLTDE0c2pFazl4UzNGWlRN?=
 =?utf-8?B?dEYxTi90WnIrb2RZZ0ZPbll4c094QU9pT1lNM3M3aWpidDRVT3kzdGhUT3lX?=
 =?utf-8?B?cGxnc0dDWERCSnNVWE5TeWNaQkxQQVYxanBLSVByVm1nN2pMZC9sd0wxNjNW?=
 =?utf-8?B?Vk5oaVE1NWYyRW9tOHc1dXlSVXZwUzN2NHBUa2xLdUlENzZUdGRpL1FuMWUv?=
 =?utf-8?B?UmtjUllhMmxKWGNmMnVkUE00V0tuOGdBa0ZJbCtEODZkWHYvY0N0OGhMZ3lr?=
 =?utf-8?B?RWJQdFdUd0orUW1XalZkMEFtUW5hWU1Fa0Zxa0xncndZSkxuMjNWYmVJZ21Q?=
 =?utf-8?B?Q1BZK2J6YnY2WDVZZkg4M3MyRzRhc01QaFJxbEw1SVkwOVpjZURRT2xkNk5H?=
 =?utf-8?B?WnlTQ3B6L24zK2M2SWhpdVBFTmN6bjlHaDBSejQ1RXFnLytUMFU0U2lIVFlU?=
 =?utf-8?B?M2piaXJHc2RKV0l5eko2ZGFPZUdmUlVJelpmOW9DYks3VmlheENBSXRIa1FD?=
 =?utf-8?B?ZzUrREZ1cXRzLzJCZFI4ZEJTOUFvaXdZek9rOGhDQjY1VW9saFFvRFEzN2Mr?=
 =?utf-8?B?UWpkZFVPRGJOeEdQem10M0JGQ2xZMFBwRDRwRW9Idlo3aFBYS3dVQ1RIeHRi?=
 =?utf-8?B?VlFHYjlNcktSSEVpczl2MFdWdDhTeXBncGVqQXlncWU0M3ZUdWdsSGdHS1la?=
 =?utf-8?B?R2RMSUVBNDlYZExTbTdVUHBwcDZmUStpYjlyUFpSc0dDbG9DT2pVMDBsekFv?=
 =?utf-8?B?bXg5a1MxMlo4WURVR252TmJ6eEx1bzNLb3d6dzBFdU1MV3U2TnhndzBQaTVR?=
 =?utf-8?B?bmg0UFhwNDQ2dkJON2thMlUxeHQyM1BNZ2h1QUxNZGdHdlpaNXJMeFZMZm9P?=
 =?utf-8?B?dCtDYit2N0JvYncyb050TklETUNMT3FpUGNnQ1E5Zjl0dlRIcDlJYkcveGpB?=
 =?utf-8?B?a0E1VlRTV2hoNnZXRlRGSnRBNUkxTEhrMGxaeitKdGRlQ1cxZGtMU0ZXMjJU?=
 =?utf-8?B?YVVDNWpmQmZEUnNlTG9YVkkyamlIRFJGTFpIdmt4OURFY0x1NldJd3RiTmVh?=
 =?utf-8?Q?ysBac6kqK3UG7YWeuyAnveem5VQflE+kPq/tJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8431dd06-03f3-4171-2d89-08df0790be8e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2026 18:50:36.4979
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pu8H4Kx4Dfg+GhcV9eVqe8MH6BaRrc0eEh7O/8g4QdFShVXOcTkBfj8tfIomP0c19TaMWCKIhykJbO8LwY8OMwmNuJq6jRFb0aY61RowizF3STtc3OANCb0Wwc3KWChV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB11994

From: Frank Li <Frank.Li@nxp.com>

Not all boards connect irq lines. So mark interrupt property optional.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-phytec-pbab01.dtb: stmpe@41 (st,stmpe811): 'oneOf' conditional failed, one must be fixed:
        'interrupts' is a required property
        'interrupts-extended' is a required property

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 Documentation/devicetree/bindings/mfd/st,stmpe.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
index 592e8f17659f3..6fde068b526a0 100644
--- a/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
+++ b/Documentation/devicetree/bindings/mfd/st,stmpe.yaml
@@ -225,7 +225,6 @@ additionalProperties: false
 required:
   - compatible
   - reg
-  - interrupts
 
 examples:
   - |

-- 
2.43.0

