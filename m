Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013033.outbound.protection.outlook.com [52.101.72.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B63DE451;
	Fri, 16 Oct 2026 20:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792181518; cv=fail; b=nhKb/8VXCAJIY1pRzUJBnMhx0OBFx+D+WoJzqtMB/UXyei373CCWpxnU1UPvm6LPAWk7NxCZhTWaOp/FFbd/5w9NFKT38ivzphCoOMFk6BW98HCCjjCbkX19ZlrWI8SLiInjMllKVSbEPtj7mcDMFjnFSjx7887t3MrVpQXe5Yw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792181518; c=relaxed/simple;
	bh=8q7cV3eIp2YjJ9dzlaTWPqpUsJ3dD095TJqpWP5t6Wg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=MsUsyaZ8K2mHmNlRYvYMcBO7dV1vTu+fnhQViOCGz7WvCYlZSPzBxaxcdFYolxHeIflNvOEuJXSQDbXXEQNFWlrrJm39Gl6LO2nlqRv7vQe3O+u1aSYsorw1jVZDUBJEHw1sHLJ2Q8p3hHFdi8kJZs50NUEsPRTllVBnNHILRhc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=fkHSYEo6; arc=fail smtp.client-ip=52.101.72.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="fkHSYEo6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EJr0z6ZDtC+hPJQozdrMnx2GX/zooCR95AZhFBNQefKv+CfGU6jvRAhlgxgtYBy30X2fj7+S9pUTFLqlNsTl8/LnVdn1Vff10C0dqtL3SYvYkvh7kQG4X/LoJYuJ31HqhkKo+lGIwr36ZuAdpo9Gqw2W9eive2WjbZgPwXzDEpWcJTd+nPx3OZNgR2j8U0fdjGM9Jiao7ztUDnlj8Arf4uzwr+LocM/mXbfqyJHwyDbFKNAoExF3IlNChM4HY4iMNwvqNdX2V8JO2FKfkOhsO6ykTbx3O6TUM8Mypuh7YttdytcwOzsh96zPHDVcD9lzPJaD4I6LfkfieoCNjs+yPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PQFC7QVKhKkBdYiJ5jG2GZbWp2CIiVOtjgGyaZRXNx4=;
 b=dvMBbgHRlNwzRuHi7tCEgH1Q4PPC5KW4eOa9X/fylmYK7zeahu5rYTth3gStFaYRCVuKPgTMrzrwsvRYErqLpEig9OTIPfKwDfOTAtc3wzsDQIPaa6te+VktTc+6babu+5a0J1ZmMxZ8M20v9AAAGEpbOnPJ0pbljVHmFHafQhEodoOC2H9szwOZypibc99fPqam7Offm1t26iCft1VRyNxx/tvPKio4FRxgnWRe34REwBLuFQDJgrivwgfUrK+vx9yEW/4P8C1pXk7oXxGiSXhEtjJdJ0dY1bU5Ge5BCvLW+BEJOJzvfXiF/UKE9KwTAbMuy4CHo8y9KHG69VVAkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PQFC7QVKhKkBdYiJ5jG2GZbWp2CIiVOtjgGyaZRXNx4=;
 b=fkHSYEo6dWdhTbAKXLUxomAUk9ma7QbgaNh3WVJXlzldAlJKJ0A+Ds443slIn16XXES0jOTNNefzjtaClWwoQtVhyuKf2BKX9Wsqi6IhVLAUbZgGPLiemC83a8xETNvQgqzeG612HE9blIIAZncRv3z8vB/G53JQ5Uo9lw1Nd3WIW8YRR1sMF9HtwLQeJxpny5mKCU0jQT3lYtCtHJRFy6nSio6644EMXMrmFugzxH6wse3yBZEAxNgS3jCC/2by6kKkItjbL0/HZaNAaki6m3RDoBZE6H6/WHe1osAxS2lRHyuqiQJyjDRM4j6RuoKHNTQ4pHMSUHNKxeUzkhNLIw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8738.eurprd04.prod.outlook.com (2603:10a6:20b:42b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.15; Fri, 16 Oct
 2026 20:11:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 20:11:31 +0000
From: Frank.Li@oss.nxp.com
Date: Fri, 16 Oct 2026 16:10:50 -0400
Subject: [PATCH 07/14] ARM: dts: imx6qdl-savageboard: remove undocument
 avic,tm097tdh02
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-arm_dts_cleanup2-v1-7-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
In-Reply-To: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792181452; l=1088;
 i=Frank.Li@nxp.com; s=20240130; h=from:subject:message-id;
 bh=NBygXTj3eia0bX3n+VpW9iAJlz04N29DVQxsBbVEy94=;
 b=0M33lgAH0EX7NgS2Ntj4Fs2bBh+6zY0chiKWB1KvdvkOYNHPS+JxxzwqxM033RLWZ4O/2pNEh
 zo9CPz7P0dPAZvMpDzBv/Q1TPyhELYJuntMhropaaZXp40ozJiVDr5t
X-Developer-Key: i=Frank.Li@nxp.com; a=ed25519;
 pk=I0L1sDUfPxpAkRvPKy7MdauTuSENRq+DnA+G4qcS94Q=
X-ClientProxiedBy: DS1P223CA0021.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:8:44e::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: 1333574c-56e1-493b-a7ac-08df2bc1ab3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|1800799024|376014|7416014|23010399003|10067099003|18002099003|3023799007|22082099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	WCPWBczmpWXowWnE0/28hJPGAtPoJVyCC0WlMlgoAg2oBQPYupGTcjkcRwr4pJbyliy7K573TP5d+X91vwaSZ0ND9EJnDCygC53BdVf6o18THrOKWNTREO2OE8exUXWAnXAuVM97lca6FFxSN3fZy7m5LrXnk3WVHK7WLX+lIEsO38VNRq151sSa9nrgaVyf2NdCQ8bpblGHx1KtmkjWCASIV2hUuwk54hl1YR828OqL/umirk7oGvK/oWdWHdmmujn85Db2g5kMwwB2s+teVmWTBXTw9YsbGYhF3TrV7llpFh3un3y8cwQgEv268/onT86A/l3XXXWcHeYRqQM76+dT41s+m3fhtw4MoQXLZLv4dpsfonqS+0+mPusohFyu4nAMgmoryOTSebpmOmncFxQncTuzXv5qABevFBhpdDbRNirnw3dl7ghCUOastrZNv9uAFJJqF+RnqMF8UPUec/3GOb3egr2kJ/sfJzmje/2ZLei19lAXGz76v1pI8Ii7GgC96Qd16j872Oa2Xd3lZ3ys7jQfa8Bviib16R2AreKZpTRLsJmZFz7YCEvycg2BBpDjkGsBzgIy0arS+Z1Zay7OLLhY5hnk7NVnhcwGcbo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014)(23010399003)(10067099003)(18002099003)(3023799007)(22082099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TFFySGVkZUx1M0F0TUYzY3hyQ0pwaFlJcGhYUEw2UlE5UmNiN2NyMjFWTVU4?=
 =?utf-8?B?dXRhZi82Zk8ya3N4TlphTUVpNm5JNTQzTGVmRGsxNDhzYTk1S0VlV0ZDWWFk?=
 =?utf-8?B?dUFtWVVyc244TFk4NGtpa0xZZkV5ZFdvSkErVEhCWVkzMWMwc2YxSFpTT1Fr?=
 =?utf-8?B?Z0lVTEx6Q2Y2WHZWTmpDdTh0dlQ5QjVzcUMxT2N5TWxEMzVvMnJGc3BYOXgx?=
 =?utf-8?B?VkdtZFJubmcxazBCejFQQWRaOS9RM0JQSHh0eWVpTTRyMy9IZWhiYWlGVWlJ?=
 =?utf-8?B?TzB3L2FiQmFjZThMbG5IWmQ2WWQyNWpqdmkwNjNWSWUvSndDem5rdWZ5Mkph?=
 =?utf-8?B?d0JFbWYrRzdRUVNCdFEvcnlrZlFZUno5MSs5T09ZZXAxTGVzMmdMM2JabnZH?=
 =?utf-8?B?eEZ5UmpxcnFrUFV5WWR3R2RIa0MyTkw1c3lURFZlakZWVWE0VFRMSlVCMElJ?=
 =?utf-8?B?NWJkUXp6aThWWlcyL1ZLVndUUmVRb08zcXE0am5BSzJadVd2MlVNZHhaVEtq?=
 =?utf-8?B?R1JFb0FUY3FzV3Y0Y1U1b1JsMGFyLzMvSVJiWWg2SDRyM2lHMVF1R01RaS9C?=
 =?utf-8?B?UisvcHl5Vld2MjlLb0VCUUw1c3liQlNXY0Q3Y3BNT3FDMFEvTElWVXRNUXRw?=
 =?utf-8?B?cXhtUUxGUGhIZjB2WUFIL1kwWXNQc0ZQOWNFMG1NaHNuL1BqMmNObHR3d0Vp?=
 =?utf-8?B?MGROYU9RakFHbFh1RCtReXZXaGVyeUpSbFNFN0JoV0tKVS9UNDlZOEE4R0lU?=
 =?utf-8?B?SjV5aTc1YTVwcmN6U2YxT2xzMnlsVTBTbXN2YUczd00zV1c3N3BTbzZPcm5i?=
 =?utf-8?B?YU42TGNZNXdIYTNENmJFWkFtS1lRU2JBOXU3b2hvaE9OWHZZb2Ntb0lqT25i?=
 =?utf-8?B?NUNGbTUrRSthbW80VkV2SEF3c0pyMFdnbnMrdmREeit1elpJc2thaEhlZVE0?=
 =?utf-8?B?d01GT3ZMRWhCTWZCT25EaGRBY1prRkxTTnRabUg2NGNUOERCUFdlTFNJQzJX?=
 =?utf-8?B?bHErQzIwSzNYYmdBR3lqeFhMQlYxWm5IMENRMVgrZzQ2cUxTeEpnd2RVa1lV?=
 =?utf-8?B?VUNJMEU1bVNUSkRaOFNvRXA1ZjF1ZE12czlLL1UyQWxWM3o0RGVkNmxuNEJw?=
 =?utf-8?B?NnBpTEwwUVVQREt0Y2o5bUJIa0FGN3dWMWY1R1dZNDhiUG4xQllHalhvWkQ3?=
 =?utf-8?B?ZElDbWpkclgzWG9zWXZLOHU5aWJneU1iWkh4N1NvdTdWczd6K1JqK25FM3VG?=
 =?utf-8?B?TWRKZWI2R3RielNsVG5YTmtFUWhwVjlzTGNMd0YreDRYL0NKM2FPTXVPZ2Ev?=
 =?utf-8?B?SmFHZiszSTJSK1VsTFBGOGFvZXk2UWhrK3lzNHpwQk9VaEgvaHdHM0svRXVm?=
 =?utf-8?B?dEhXZlR6QXVnU0JwTjBvc3NkWnlFQWowY2dFalExYWFJTXhTY1VUekN5ai9O?=
 =?utf-8?B?RVA3Q0VXd1EvTTVQVHROeHp1RC9nYmkzVVAyakpKTGlDTno3ZEVzbk5KOTZK?=
 =?utf-8?B?cm0vN2U1QTN1eTg2R1ZENDRLQk5hcFpiRGhiYmpDNHQrSTBsWU52aW1FNHFI?=
 =?utf-8?B?RnRqdnFqMlJGdFlLSy9kRFhGSjZzekNpY1p4QW5Zb25BU2hXWXkxRUdTNEk3?=
 =?utf-8?B?UDBIVjNNMGZraUVGTUxEUnVJd2o0MGExZ1kvNUFhU25zRDRZeG9TejU2bWhE?=
 =?utf-8?B?RnVXNHJUTVRndXQxY0NBUFpocG9VWlRxcERKMXpLNGZQM2NiaC9UNEY0cVo1?=
 =?utf-8?B?QlIvOXFocFpLcW44djhpZmx3TXg3WGhSaFFJL0Ywc0VFZFBrL0doeGViUlhm?=
 =?utf-8?B?NUJESXFFbmtZT3V1VHUralVTdy93a1pwMEJ5ejc1ZXBlKzl6RGs1amk4UnZ2?=
 =?utf-8?B?QjduSndqYXlOeUVDVHUyeUlyM1p6Qlk2V2lzdHBUVTkzWngvOVRIemRzYTZi?=
 =?utf-8?B?UDI2VmtBTzBJUnZYOW1PRGU2cXlaQ2JzZXZLRzk4UTBBSXdMQ1lONWJCREdy?=
 =?utf-8?B?U2FlYXo5TCtGaVhES1lXeklrRHFYdVM5aVlIZTBHVVh0ekMwaHdoNHJhR0x3?=
 =?utf-8?B?WU5CTEx5dEEzZ2FnS1lyREU0OTRVNnFPWGNXTGpwTU8wVWJ3Mk1JOTZkdjF5?=
 =?utf-8?B?SjhMM1pYd2ZRVkx0RWMrS2NQek9QaVFoRVJqMjBWUFhqZFB1R2Z2NUJ5TTJB?=
 =?utf-8?B?bDBZQk9XZWc3Z3dNb3pqUHgza0NIczhqT0MwVkNKZE9HdjIyQ2hQUlZzUmUx?=
 =?utf-8?B?cmpIZ3F1ZlArRURya2M2V1JVOU1pUGtxZ3V5YjlDdktVWFBubmsrd1lJMXJ5?=
 =?utf-8?B?WHBTM2p2cEg4bU1OVitsekpoOXpHN25wZjVtQzlaOTBlcUxubjA3U1llNUh1?=
 =?utf-8?Q?VDjoMrPG/b6qXGqtFog6OVI5N3t2R3wm/9nAo?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1333574c-56e1-493b-a7ac-08df2bc1ab3a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 20:11:31.2662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk5WusALqB/zr+k/rVdqsykB2cs+P+wbizKS+YIVb88bqyoLFNQtpCpqwxyS+nqy3YEWNhp5wHOqWeVbJ30tE0+P4ITzFfjkqgFbWFCLawHnoyoL3kRm1z3KXrQk4/Fm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8738

From: Frank Li <Frank.Li@nxp.com>

Remove undocument avic,tm097tdh02 compatible string, which is not supported
by simple-panel driver. Use fallback compatible string hannstar,hsd100pxn1.

Fix below CHECK_DTBS warnings:
  arch/arm/boot/dts/nxp/imx/imx6dl-savageboard.dtb: panel (avic,tm097tdh02): compatible: ['avic,tm097tdh02', 'hannstar,hsd100pxn1'] is too long
        from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi
index 2daf2b6af8849..8b476b39aaaf3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-savageboard.dtsi
@@ -67,7 +67,7 @@ key-power {
 	};
 
 	panel {
-		compatible = "avic,tm097tdh02", "hannstar,hsd100pxn1";
+		compatible = "hannstar,hsd100pxn1";
 		backlight = <&panel_bl>;
 		power-supply = <&reg_3p3v>;
 

-- 
2.43.0

