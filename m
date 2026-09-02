Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010048.outbound.protection.outlook.com [52.101.84.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9B9A394798;
	Wed,  2 Sep 2026 19:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788377544; cv=fail; b=jDtargYvXeSh0hnRecv4Xll6a/dUiyb4nuEiaNh06Ujsk9PKybXKovErqNbBBol+Iq0i4rsPf3zvHmUEEmW+DAEV2a/RYUmNzn1OMIIuNysxmlWkCh75HKqEYQ1cNpw8UTYM36HbfWoaT6F0AFO5xF8cHmu4QZdj9XarU7IffaA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788377544; c=relaxed/simple;
	bh=uClrSOOP6674swAnurTsEl29VpGXYTl2mwt+1EyLssU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l0ngQyt/3uH7yNBkOkq+Pks5DCHAvC0bgh3Su3sOaefmZc4xAD/MdDxvm/he7XMNi8lQQdnOeQj34nw5PfynWQGHqATBsf3mzQ+phy2rDuYF0jBXoIHbtXvJOGE/1ianshkmKZKC3RP8IPzDvsA5L2hqNbehTppmpLO3aoL4UfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ZiHg1dsB; arc=fail smtp.client-ip=52.101.84.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ZiHg1dsB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ps9R3tJ2r+Ge9YnhrA5nPI5QXFqkmIBDjs0Da8e9NG7FvwYPWlQ89JlTp04zHsMycbf3Hm28qWvFj8eP9eHyLPtWtH8owme5HyQOCzED6tbcQyV7nBHVlut7663Z0r0Ezb2VxFVjf38qzRvRP5ZOxHQHxAGNuat/qmClEms/bAG7DUuq76i/hGF+7d8C25YLhxNp3SNkFTrOAHmMgRlPrF4fX/W0qcZp62zqzqDbMhvgmgQGVxWz2YsurJQTapHeNPA2nQMTGyamaOupXR5O8mtz+l7LdJm1pbmU7pJtvhB0Gxc3QwvFOFbT86wpGnZ775kXGC1wTP2bCAlEHtCgtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZWLgG9ksi1Ls7sJd3AN/KHXU2KagRsaDaPGrj1bqbqw=;
 b=DScJd2UYb3FjGR1aD6YYMGifDU5tgpxTRat11WMr+l4LM4+eK3Q7gcCsuAkFMyKZgITPW5i/TB6und+OnyNAjrFAJyhfyPc9IXcMoYKWamSOSeOMCz6UdgWgdrKv8B/3hnROr8JZOtYpHbbin8qMlUTSLpoviNRNMxuvuWMoUOMtiZ/C35wlw453FOT09JPBVL8wqbC0Q1T/PxvIMUO17Limhg8ADE8b4zkeM0GXD05/Bi3xC1KLxT0bk1dXJQ6ZdZBZw7FgvlI87p/zCwqlvpFbsCI7Xt+KrdRbsF9L1xdGl4gn0D1sT+Qy2liePL68JwIjIPTBs2JAUm/2LdZGiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZWLgG9ksi1Ls7sJd3AN/KHXU2KagRsaDaPGrj1bqbqw=;
 b=ZiHg1dsBWvvsYJJaU/5WhKpo14rHpJddUbakJSg2jhciFBXlTdq2POdo9jyADCDi7Zk7E6GBEpxIO3Ceqjw1pYGjONLraCQJMJz2SqpfI+oFluP+qJVoK+YpOQMbreszcnbLJLcFDu0txNlIMDdh94qMA+VatbR2TyHurfHHShlmMhYmYmODNuyL1md8ZIWXhWOfXeeYlwxR/NMRH2oGT+hXFMI/Q2eiFcOmphXxdzNswtMK+Wg95y+Q/LJsBrUbULTyn/eaUvV3JOurHFQj2yvmwu/DPHLYI8oUGDixGj62ybf/4YObYSpZ+P6IhoBM47rkP6h8YlyoxCVlT1APzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MI9PR04MB284075.eurprd04.prod.outlook.com (2603:10a6:290:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Wed, 2 Sep
 2026 19:32:10 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 19:32:10 +0000
From: Frank.Li@oss.nxp.com
To: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Primoz Fiser <primoz.fiser@norik.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board
Date: Wed,  2 Sep 2026 15:31:58 -0400
Message-ID: <178837751077.2107517.6560577524532273478.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260827075754.2739119-1-primoz.fiser@norik.com>
References: <20260827075754.2739119-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P222CA0011.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:2d7::35) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MI9PR04MB284075:EE_
X-MS-Office365-Filtering-Correlation-Id: 15f1288c-b2b0-49ab-043e-08df0928e1ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|7416014|376014|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	NMUHtZhIpj991aZrFe19pAIodHwsVbbxkHrYDwYCJ8M4PcTF8wNGaweUtk8K03lN3JHlTfRrX1wDXtv9mdybjxnLAx3dy1/TLSfxBOGWT++/8p89S261dbxGuDCVjoDNB0IRTn9cVo67rBKgFshdpUuUSKr+URbEEVWMik04sImT0N4RQakW3hmGNJ0xY0DBjIgLBToCl98N+Mrl2P6xBev2GBKirNXYsvzxA2JqSVs6cRR+1lgm6Jb1raFpDdqvKG0KZktONLve6USc5KIYSpynNMP2ECBc7WVuzJKn3Ia3IbUmuaaadvONm43K6gD7Bo3JoKqpaAnbcXSwel7nM8jssFKCfkY8lDHoZjisaduCYktyrgxhG4ogFaK/9i5wJBrdke4/oOOGgJDVY+OESqujFCQknJ7dUriKUfADCTadPTWDdUrXl8N3O1NcPiOUhh4XOJX5gKb/e7D6EOjZ1CKZx/5XUuSZg/yyZTKcpDVprJ0XkJwYrJvR3wM/0GKZDtultbRAyC/q9TVIMFQCXs6Ei6EWneacbTMHdyKflD4D7nSuJnJARuh9rd6TkoLIWvQ8MM/3P6j8VfwRXYzVJJDoh8OGQWk/v53xC4pbGgELW4xWI18MRavBd4M2rNKp1wkmxb59lZf3VSRUaiZq7vEd/nWS/1WELu7NqNy/whU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(7416014)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VG1wZW9wUWVZYkdDb1RMajk1bnJoZkNxM2VoZFpXcjVzRklZWU91TmdQQW9P?=
 =?utf-8?B?LzJKVVVDWEFsOHJObnF6N0dBck84Q3h5RnhBK01GNGtWYXJPR0dDMXhGVGxZ?=
 =?utf-8?B?WEdhb2NXL0lGcTl3T3JaUlEwLzlLK09DUWxpYmR1bUE1MEF3WVg4NGlWRTcx?=
 =?utf-8?B?aVhkbkIzbk84NXprNkNuVngvRGsxZjNxMWFTOEZQSlZ1Rm5UY1lpUTdFcmxM?=
 =?utf-8?B?RzZRMkMyUjhxcm9BUURoaGlCT1Y4WWdlQThRRmlEYkVjVXk3OTdVUFEyWG5I?=
 =?utf-8?B?NjBaSVphMWVXaFg1cG9mcDBUQ1Z5QzhsNzRmQ29haGR1RXhBQVdOOXBkQVJQ?=
 =?utf-8?B?T0sxU3EzN2tkSmx2eDNJeTF0N2piZXl6T1BSaFQ5OWpQYzNkT1grVG1qZVpN?=
 =?utf-8?B?RTBIN0FmRTdzajhGTmVCa2xaa2FBYkVOSFIwM3dUODE1V1J2UCtnY2szZHpH?=
 =?utf-8?B?MEhyVVZTUUlQQnQxRUlHUDZ6RS9zTDRCYXF5Ti9tZHVMWWNEY24wWktpWDhS?=
 =?utf-8?B?NDNsU0xrSFBHQ2pKSXZiNXV1SElLNzVRWi9UalpPd203M0hHMmVIM0NTZ1hO?=
 =?utf-8?B?dmkxdm54UEx6M1p2enYrUWp2MkVndmUrNWMyYkMxU0dlOTVrRkpjUDZIU0NH?=
 =?utf-8?B?eUR2MnlhTXFGSW5iajR2bXIwNUk0cVdQZ2xWQlpqZTZGTkNoeHJIRU1qbXhV?=
 =?utf-8?B?eitMdGJDRlhxYVp2Unl3amxLMWtyMG8xMmZHakZJMFBsMmlmejUydnMwZzcy?=
 =?utf-8?B?SWNKcFVqUGFOblllU0tweldSb2orNU8rNlVRcDRJN1lsVE55cStrWm9xNzlJ?=
 =?utf-8?B?SWRNWW5aOEFGcVA0NTJOTDB0Q2x4UEZtT0ppZlhCOTFuNzhWekk2UGV6WFp5?=
 =?utf-8?B?ODdmeEFsdUNoOWVTZWFqK0FZVUdJelpnbHc3TjBnREpqT1kvYlZwMXNTQ2pw?=
 =?utf-8?B?MzFmbTF2LzQzaEJQTlhlOUdQa3N5VVpaeDdydTVOWG5zWmFLL2RQL3NGYmww?=
 =?utf-8?B?WFJYZ2xFUGtCaWtEbVdTOW1ET0g4QU5Xc2FWVXdkZ3RBelJaUCs2c1NIQW1B?=
 =?utf-8?B?VHlTaU81R0hXazQzYnhpNjI2YTFaM25VWnBIZnhQSVBXSElhMmNvbVd1cGVO?=
 =?utf-8?B?d0VkSzVJcVpvYUczYTlCN3pYb2g3cHluV2F0TSsyZm5Tb2IzU2YzUU1aSUo1?=
 =?utf-8?B?dHlWTVJMQ2hkZElMWnBsZExSZTMyOTFlb0dxTFJyMnQ4MnNWaWRQSzZXODlU?=
 =?utf-8?B?NVJNbUNDMEVSc2Vtb284clB0UXNPNVFRdUJBYjNyYW9vVEtpNXpUZkQ3S3FV?=
 =?utf-8?B?SmdmZTdoUU1yankzeXBSSC9GRzhVMWQ4S2dzNTJKTC9PcnpZa1RDQUh6cFho?=
 =?utf-8?B?RWl3SzRJeHhvQkNOSkh4VFJKY2l5RWFxNnRCYmxuaWJlVlZQZEtuamdWRW1B?=
 =?utf-8?B?ZnpwRmswS3BCRlNYU2dLd3JaN1BHaHM4NmZNdEZuRVhrUHpuWTFYdjN2R3Y3?=
 =?utf-8?B?cW1EbWd2czZNNWIvY0xOb1hHNk4vSmtNdVJIYzg2S2pSNkdBSGUrZkNuSXVO?=
 =?utf-8?B?VUFtVDU0aUsvYzlrNnkyQzBrbUR3VnNyWGJFR0tya3cwUWx5eis0bDVqUnhl?=
 =?utf-8?B?RjlUL1VUVllQMkpYbDJBNlFBUmJheWRNcGh3aGlGb2hpUkkyLzgycXlqdVhC?=
 =?utf-8?B?OWh5M1c3STJ5WDN3U2gwaGJqaTZiRnJ2ZlFHUjRBSER2TDZtWWdkM2t0cWZJ?=
 =?utf-8?B?QTVyQUViL3Nsd0NhbThGYkxIV1lPeW91OHhiRUFYY3lES0VQa2J3dkpYZGZL?=
 =?utf-8?B?UE1EbDI5RENNT3NaY09sejl5QjR2MDJOcUNDdGdwVzU4UlFzY2lIT0R2YUlB?=
 =?utf-8?B?NDVnRkxTdVRrcXd3N0pRMnVxbFBHZ2ZqVWs4NXFMUksxY25WS2pXYThwNlQ2?=
 =?utf-8?B?azZCa2VFOHltaHYyVURHaDdzek5uUVVCWTI4N2dqaW43WTY5WEl0Vmd2amJQ?=
 =?utf-8?B?bXh5SDJmbmh5ckxEWWVmZzNsODIvOTdDa0ZWOGpPVjFRNjh5d0Y5SG9McHN2?=
 =?utf-8?B?UVB3emR4b0hmNnM4Sm8xQjVOTlNucFhBUUhoeWZ0d1Q3ZmUvVmVmZlN0V3dZ?=
 =?utf-8?B?SUVzSGkrdU41allDcktIY0ppRUlhQzRubmxONVQ2ZmNMdFYvaURMYVYxTkho?=
 =?utf-8?B?UHBnRXhmNVZLWS9KSVRXa3RhVnJxRmZxb2ppN2lPZHl3T29BYklJQXFibm5F?=
 =?utf-8?B?K0I3dmtRNTErYnR5UmdjaDgxR2hTcXhXRExycFdOWFVvcUhmK2xxdVdaWjJr?=
 =?utf-8?B?RHMrc3VLaW1NdEtka3dWYTFqY1l5OWVCV1ZlYzNjcTlZdkR2c1JnYnZvanBa?=
 =?utf-8?Q?fj5cR0c9wvqw81DJHXvh+Oo5wuBQ6xLbOF9EJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15f1288c-b2b0-49ab-043e-08df0928e1ec
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 19:32:10.5217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OMuUebyfSg8hfL8O2jR4PG1HP2uTQ4dkUXbDyX8fg7fWHxA//D8SN/Ky3gvatENNTZxevVSWF/MRoCBomEdDK/aZny9/ql37/70LkGYVKNg416XVHLnv+a4wLPRX/oye
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR04MB284075

From: Frank Li <Frank.Li@nxp.com>


On Thu, 27 Aug 2026 09:57:54 +0200, Primoz Fiser wrote:
> Add support for PEB-WLBT-07 which is an expansion board that provides
> WiFi 6 and Bluetooth 5.4 LE functionality. It features the u-blox
> MAYA-W2 module with the NXP IW612 chipset.

Applied, thanks!

[1/1] arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board
      commit: 3dc0aa7dc7de2d927657699219ae4751a72ebed6

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
