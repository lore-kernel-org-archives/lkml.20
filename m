Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6904A015A;
	Tue,  1 Sep 2026 22:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788301605; cv=fail; b=SnBrx+WWajn7azJnryyw65wG94jMJiGh9oaxWtEocqFOLEzVBa5cwlCdrCcJ+FDGNOH3cIy360xu4D5pLBzQkJbR72X8hzq99YWVSWygSjAwlUbqg4Nl6g70IN79CZnr5/E560J/KSN812VprzIgqM261YkfZP9uaLIvTw9uueI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788301605; c=relaxed/simple;
	bh=sGyBZGPRfk05Vgx3yjMEYNoBAzhx1D7e6zg8smiFHDo=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=l/TCN5ErUJ2dnrCF2xbS7cqqPJAYz6UbcdDKntzEE4TdseExX8xSYaDXWfhyvKhW3oUYFjNbrAqqXJY2Wf3B5EL0OG8Bim9S8YnpCQDJjhk2ZzpEq9In8EiHyNq6PigJOvYWoucsdZc+l+5Q/LQOTkKuYB8QOT1eTMCcXfggyV0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Dx28+42h; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Dx28+42h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=URsz85edFXkY2aCuEOtlcXSE8NxzTlY/NcA35/vHkod1YnaLx2+cepBTQ6+WWIvk2MdYGuFvvCCgPyLYcmP7m+FAN8NAUa1ym8vZ4QPKMA9bd47Txq1jan0Hkqf2sRtIWcwXwSw2o3rhmjifJwNrXRNIb3HPqg40ukyXU4Q1UwlZPWLCKGSFER4FFzv8aDWhpN1JxiH3vpbJt5Arg6d9fur4yAIolZPHMY0vY+81f2mhk8clq6vMGYGaidkf23GmI1uwpw40tQoVkcqIlRAzQnBbu5mgLSFNw0buMaBNuiBqps+aG6mbGC+iXplcwc4B7HFOqpmSv10mV+vmhHGz3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NKXhut9z8TmHqeIRRY5slpDGbQyplaPPBYrVjl585ns=;
 b=cmImrX2Bi2wz0YHsOQpSRJnSeXeQ/Hn/XrsZVAkKq6ogZRw5pIPkA/vYESqgt44w0cXnHk58I24WgDl/IKiW+ugoN+l4rnUMId56JJnupGM3BUXvOQr0M+BzwQekdM2KnI4ofq3uTSCcE1N/SzsUeFDXROtYXuNuK8V0O2NIAm3AS0YJz3tsZg+DC4RoudL8prpVcNu9DqIlR4Q34VVfOblU3Kjvg78qTtYANv1yqMSKXPlsuKz7uDXuloErwOCZ0taLaeWHJ7aTfTh1fWaobTRxqAYmKBGpWSDSwLsu/AT7v8wDiQQnNq8oBEtNUJuGj/DzvR5IT8JV2+xpU/cF2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NKXhut9z8TmHqeIRRY5slpDGbQyplaPPBYrVjl585ns=;
 b=Dx28+42hKp3xreRPq7Vcq1UpeEip7tO4Ui8mf5G8JgKN36oez82QxB5sPxLQy+L7nIqtLuyNUV3Apy0R6nDet8IrvUAsyqJhX45Sx2g+T+xNZjaXe1uBRoBQkvoZaAgAnRnqBhp54tOuBF23KMJhBlElHEPaVIacYxeKVNerwOiJocqkZOY2bygbGFkSAcsENfwG4gpB2l5cGrW3Gtsv2BoeR/jKlHPtrHOT0bn+SRe2qtaUmACCmfG9G0oy1+69j2fOkG5nWi/w1DYHEwgiZ1jqxNfv2qj7GTwZTudfeaaY7k57ME9y5sCEUkOXGsS3j5g3yIOJ+h98h3jl5OXliw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MMZPR04MB319484.eurprd04.prod.outlook.com (2603:10a6:190:3c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Tue, 1 Sep
 2026 22:26:33 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Tue, 1 Sep 2026
 22:26:33 +0000
From: Frank.Li@oss.nxp.com
Date: Tue, 01 Sep 2026 18:25:42 -0400
Subject: [PATCH 8/8] ARM: dts: imx6ul-14x14-evk: remove reduntant bus-type
 under csi node
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-arm_dts_clean1-v1-8-db741f37a1f4@nxp.com>
References: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
In-Reply-To: <20260901-arm_dts_clean1-v1-0-db741f37a1f4@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788301547; l=995;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=2JNfbw5vI1/z3/pqQN+epuJQJbSvlbmSs3QSwdkCKbM=;
 b=6tEDWOx4GlT4FZu8JFIrm3bBB6yoWVwE0ZCcPmk1H796L+mB9nt5PMa8Hxsj5/h32tVPQcdj0
 Htt9RmrGfFsB4urrcjWJEOcaS5KpLQDRuqjcj6u8VmsJ/QkoT4oza4n
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: CY8PR19CA0005.namprd19.prod.outlook.com
 (2603:10b6:930:44::8) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MMZPR04MB319484:EE_
X-MS-Office365-Filtering-Correlation-Id: a8bc6feb-6f0b-4137-457c-08df087813a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|19092799006|1800799024|23010399003|3023799007|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+RTNk1tSBH2doxXQAIy9CDdrtR1kscFuNkAh2R5O0vdJLfxzEwAz2eMC0o9MMvztPEYwBBsruXTYxr7vwfkXkWYNCaF3d6LebolTk9DPyXnJ7UH5udTpCOrMHaO8xVn43fCgGvc6AjzqBA4xM6nsc3iJVbDlDMnvjCmvnVdc5sH6wWNNWwd6qdEiZQOcRGjWysHX+v9uShUTwp3kBeikqXHW6s7tzd+kvzUH5/pW+wHh03IFZWBVz2CnEyGiq/Jsk6XsFku+0swExViwlOojytj5MaUyaA7ru45utvFGFvAfGv/4S0nu26Cky661QDlN/zKz+rzgfV9LPBFcefIYncyibvAhs2HHCpkWUWEyllqhM7RkZFbNbnzb6ar0Ve4k/cQNyUuFgUO57dCSxf+vHFWzN6eGn1OAHhfG1CasjoN6vloldSEmN5N3cwoHIr9a+h5+JgUHWatqsG/Rb+iafN5wrwGgI+B3sdzslk8sUFbWovxeB6KDjIjoD8VxOkrQpHMbTNA3ozCy1/+KxAfAR/NLJYZYUYZRUuCde4/ggzvfCf1hQv4KuIEIGC19zbw2VsxhcBXdBXmXieIsZ9o8OTunpijlh4nfHM3GymDi9rbI6+SHsKaLJfDmfxcpE3z5
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(19092799006)(1800799024)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eDZFMjRCa282cHk4K3Y0NXJUMlJkclNGNE1zWXhzemg0V2xKTGw1dkFzUmls?=
 =?utf-8?B?OFpyVUZTWEZQMlVtQUYvT0ZDNGVDYkRFaTkxOStBYkJKTys0OGdhUkpXcE02?=
 =?utf-8?B?OTByd1hpQnVzcFJZOG1EaSthaUJsaTRGeXMzM1VINklJRGQ2ZXBHcTUrSnlH?=
 =?utf-8?B?UXdodGpDZGhoVWU4K1hZVHBEWTJVL29IWXYxVTFXN1BqY0l2M0FDbTR1YnNJ?=
 =?utf-8?B?cFQvcXRaTFplMkppV2xxY3RLZ0RzdGNFNHNJZVMrT2lkSXZrR212YStjRG5K?=
 =?utf-8?B?U3lpSElWeVpVVnhTYUUvcE1DRmhpcjlrcVU1ejlVZ1JLak5KY2NxRDVkTE1V?=
 =?utf-8?B?NnNHTG8yMHZHQXlFbmlaVFk3UWRsRGFlTVNHeFVtUzRPSTljMXBVTzlhc0dE?=
 =?utf-8?B?SHBFNngyakxVRml5MkluMm1kcUR4eE9xK1NYQmFwUzVpTVVZMTZZTU02RzRL?=
 =?utf-8?B?VER0Wmp3SUxGRm5OQk5oSGorRTJ1TGFOeE9HeE9JSjBIUllzMDNjaXBVQmR6?=
 =?utf-8?B?YUJFUDFrK3RZYldCV2plY09Gb28zY0ovKzVxN09lcTh5OEJuOUFPUy8wblFF?=
 =?utf-8?B?RlZWR2pYK2F5bG82cEpGNThVWWdYaHpYR0J3Ymx6RS9FL0w4U1R0RExLaENT?=
 =?utf-8?B?MTBqSVA4ZlpQL3BSWnduVElCby84THNlSkR0dE9VU2dnTzZoYnZXalFtbWJO?=
 =?utf-8?B?OUFEZ1hsQWZwQ1MyVHlaOVM5ZHJTNlJ0SmxINExWeit6Mnk1ZFBJM1lJeFBO?=
 =?utf-8?B?MS9DMmp0TmVKZmFpYlYveWd5VDlkclhzVWxvTW56TUQ4NnN3clRZaUxVV00w?=
 =?utf-8?B?TnU1NWtCenVYZHVrWW1BTVUreitVQ0RmeHdTMFlZbktjaUI2MEVGTHpRY2VC?=
 =?utf-8?B?QVozejErWnZvc0RUNjVGd3BiWGlpaHE4ZU1nY2VoKzIzaFcxRlp2SERPempC?=
 =?utf-8?B?OUR4WlhJTCtocEhNWUhDMjA4MDZUNTE4TlBqc1BlNkVNSTBHNG5YYXV3ZXRI?=
 =?utf-8?B?eVNLRTk1WjVWRFpmOHJYYzJaemhleDRpQngvaENWL0daRUR2L1dvTWh2ZUxo?=
 =?utf-8?B?ZXFVcjk1b0NyVWwyVndjSjM0V0ZVZ2VQSmJwdmlXSHZ6Qk96VndJL2Exb0Nh?=
 =?utf-8?B?Q0p6RDJndnlNbFdnQksyNXRoL0FMQlV3RVU5NmlGTWQ2SnNwV3B5WVdrN1du?=
 =?utf-8?B?VkZVZCtYdCtNMUpQLzJPWnlUb2Fkd0w5U3NUL0RDS2ovMlRRTk01akEwdk8x?=
 =?utf-8?B?VWZUT2lNUFI1cWNLbDVheDgyY202eldOVG1YclMvMTFDWlhmcXd1MVNqMnZY?=
 =?utf-8?B?TmM1eGxRK05jU05nSkNKNVg3ZnFWbEtHT3BIdjRGNXZ3K3F4M2owd3d4V3VP?=
 =?utf-8?B?ekw5OWtORTI4VXZFQVNsK3VYSzdIUVArNzRVL3Jnc3hnVWFjTm5VUm8wdlhv?=
 =?utf-8?B?bk5LMGI5RkZmeXhwSGo5NnNKdDFSVmNRUkVIZC9CUnU0Y2ZQT3NHcUw5NEtW?=
 =?utf-8?B?dDQzcnpVVWtRUy9IU2h1NTF0V0p6eUo4OXo1eDlWT0xSWG5kWm5OVkJGVFEy?=
 =?utf-8?B?MXB5TlMvbFlUbzRCMHNBOGFjekZIdCtWVDd0c1VwcG9jcVFUZW5OY3cyQ1JB?=
 =?utf-8?B?aTFTY00zTnJyZUlwZVU0TEN1eVFyZWN4Zm80N0lhV1VqYVRoSXlLYmhZRlV0?=
 =?utf-8?B?UWdYb2tRcjVDdnNNSUwwSndNZnluZ2h0bzhBamZRdmExZGhwNWsrTmNsQTdC?=
 =?utf-8?B?cWpvajVBRTQrd2RVZThXZnRKZEhOOXFCV0QvY0NGbmZubkpGOU43L0V1cEcy?=
 =?utf-8?B?WmxHeGlpcG5IcFRyeURHUkpyY1kvVURqQUxuNGdMQUd0N0lqZTBvQ3pGa3p0?=
 =?utf-8?B?VE01dXlQNzJSa09Ka3dUSEVYUHhNVVorUjFheHc5WEVsVVVCY3NTOG03Y1ph?=
 =?utf-8?B?ZW9DbnFCWFh6SnBoRk5qeG8yYWsxc0drRnlGK3lVc2pjbEVtODZxS1pUalU4?=
 =?utf-8?B?QlFNWDk4WE1nN09ZaTZYekRMUHl4Vks3YWsrLzRJMkc5SnJHNjd2RDRFTm52?=
 =?utf-8?B?Sm05R0xwSEFpUWZobUNybkJlZS9JZG1UNXFTMDFIMkplR0tmSFd2TzRacVdP?=
 =?utf-8?B?aE1sSnFmd2lSa25oNHdrczVLaEZuT00wcmcxUXVNbmUwVDY1MklwcUpHQmRD?=
 =?utf-8?B?WDBJaEsvanp2QVh5STMxaHdpQUFZTk9xZHFhdi96Sk5FV0VoVUFqSVhaZGJO?=
 =?utf-8?B?ZkluUmh6WWxJL21RYmszM1BQejV2OVhaTUw4d1lhQW1aQ1Nzcm1iQ2h1QXJG?=
 =?utf-8?B?Zk5wMUgwdER3bXNndTlYeHFEVHJxSVkrYWZsSUZwckJTRjJUMzA0R0ppL1pq?=
 =?utf-8?Q?OeQw0lSmDrhS9mKz/dKPtwqHg1BuEVqBasGM4?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8bc6feb-6f0b-4137-457c-08df087813a9
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2026 22:26:33.0315
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LQVZIsSrvw35+9I13Fnpn9zvcP3iEqZAI+NDWsrKkaaoAP/DQqXkPkkOXjPU4TE+6gLx5Wd04q2ZAHIH6C86NOKwqqgNdIQUEVqvvRNbJKMcotEah7DS2ex4ndVl+9sZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MMZPR04MB319484

From: Frank Li <Frank.Li@nxp.com>

Remove reduntant undocument bus-type under csi node to fix below check_dtbs
warnings:
arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtb: csi@21c4000 (fsl,imx6ul-csi): port:endpoint: Unevaluated properties are not allowed ('bus-type' was unexpected)
        from schema $id: http://devicetree.org/schemas/media/nxp,imx7-csi.yaml

buy-type already set at remote endpoint ov5640_to_parallel.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
index 32afe4130e211..181676cd3b60a 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ul-14x14-evk.dtsi
@@ -236,7 +236,6 @@ &csi {
 	port {
 		parallel_from_ov5640: endpoint {
 			remote-endpoint = <&ov5640_to_parallel>;
-			bus-type = <MEDIA_BUS_TYPE_PARALLEL>;
 		};
 	};
 };

-- 
2.43.0

