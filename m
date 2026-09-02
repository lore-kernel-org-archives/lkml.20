Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011020.outbound.protection.outlook.com [40.107.130.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB81E3BBA04;
	Wed,  2 Sep 2026 20:10:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788379814; cv=fail; b=i7evXTqm0VXbS76mf1PBQXs2hxO6zbW8WT1LMNzl1Qf356l/RikCXOK+s45AUChkNZzoANgbNSDlPPxxLiRlZuNPU9YEHtdIrNvl8ekBnDVSr3JoYZoWscwVc3VTM9sql6WwBf+pR9snOKPSdKVvnLaH2tq/Wb3KhMi5udtW4jw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788379814; c=relaxed/simple;
	bh=GMsa9g9qnagswanh9WPC4UW95TNvrYJZHTKmpoPJU+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K5lSSBoKoC5YdE16c5C+KwaT3Ix5IRpqqzzkwS55okh+IDRU5Hf9H59Fp3cddN/PuuQ6u5Fc2UbRpmyBS++dMMeRO675R0aIQxj1CrS7F1cjdRuIYjTGE9r9YSksZnevVDsK/KcEPy5ALFSbSKc+cbQDzEaCiXAF99oImhKVCwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=UqYiQC9D; arc=fail smtp.client-ip=40.107.130.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="UqYiQC9D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NJIPi2Mp1oYefIfmAlmUeyOioijCSnMOKX8VMwIOok1fbQmNy9NXUlxzRovMZuvc0lrJ2EqxNZL8DDWloong1OQfVno6x43h92ANEOFVRMRbZ3j94U3IJEug459BKXGl+jsKVhI8Jn5hZ6soSoVtS488muyCvunPtZaETggGkKkbudE2dnyJgd5z1yo7RxFkFVGXwR8kfi12DON3dWFzQhlAiQ/1xtVuTizU8gq9VAVWXtdtpQzWJRZXSsqev3+uOX+ZGqVYzvKJm9E6AdvidrGJYeHQYQVG5AqhyhF+aoLPP8eaX3jee0tkY/NYQwUb/AjqwLB9zL+pOk8JbPRsTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5++zhHhJ4JGuyVV5Cc/wYCxr209ddsw3nwaI3P35LfE=;
 b=YbZ6H2Ao9ZkWjCEDn4TLBii2jJD5ywFG8nyO5j4SFm8ue5kK6ygLEYk3T5DKP9G8E23Xybs9hUKlRODdEE4T1rzhkO2HneSy1orrsHPztVvwnEMwGWBECTX1G8IY6O3gLnzPH7BoNyTeAP0bZScoeXm91t+mjdVDqoZFVSzpmZtxaHqjQOsLDooJ8BLWXrF0WB1r9jWlG7/tatlB24qXptDAAwZQACGJPdnRjgeFtZQUG6mVCIF/hnxsM4rQAtfaltZnJTy4fAEBkGFyTbEt/nLANSR6GVXBGAbTAjiSpRsCvy1GakkMcDW7wd2u7TOzmfMQufWVhZJcSX5+SS79oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5++zhHhJ4JGuyVV5Cc/wYCxr209ddsw3nwaI3P35LfE=;
 b=UqYiQC9DafMRCB56RNQn+7mHnGOJxmuPp2ktQLfqlKDjk6K4UnjoIc5lcj4pzD7OxI0FALwob1pCl8rD3qdNIgT/jLI4CXjpaEdThMyxDNCQCqD8M9DJrQdvM5QW6bxaiRC/K7Oe/cTaK+u7yi/yKyb9ziToEUfwqW0ES17C7oBylzvzmn1xsKXyCwt8NhYQ2B6KYeJTACNCprHDybKutT6mUVNLSspYdLZTy1TBvcJEOyqKYc5VlAkZSeAaU0ggBOd/1umdF//9euLp1oTEY+NeuyfcDnzGbtPFhCg4A2dx6GekCPSPBcpdrpuUteBuXrYCTxdh8TvXSv24TpKPwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS1PR04MB9384.eurprd04.prod.outlook.com (2603:10a6:20b:4d8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.10; Wed, 2 Sep
 2026 20:10:09 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0360.008; Wed, 2 Sep 2026
 20:10:08 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Frank Li <Frank.Li@nxp.com>
Subject: Re: (subset) [PATCH 1/2] ARM: dts: nxp: imx: Replace spaces indentation with tabs
Date: Wed,  2 Sep 2026 16:09:50 -0400
Message-ID: <178837970338.2138489.15555674084189116957.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260829194022.107807-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8PR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:510:2da::22) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS1PR04MB9384:EE_
X-MS-Office365-Filtering-Correlation-Id: e0716cdd-98a9-40bc-817e-08df092e2ff2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|19092799006|376014|7416014|921020|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	LU/Qj0fS5knSjnU03XmLRSZbbbYF1gJEkBzmcNdWsbeWaX5SXbysu0fq1ronA0TJSFdE/d/TxrTI23WiCXUsTTBLy9berJaBogVEmClGVUiR2YYEIsHT47WwpyU0437P6BQ5ook9X/iq7LJZl5hmZxtiiTLU2seSbwYlVTRJH0x8QGzl2EWNwSZ5oPdZaiv0Ds8+BNyuOsdBKD/fDB/Ca6EN6uxylW1rCXldKrITm3ecHYvAmeh36yQbnOrw1d+zv3Ga3kcMoUhdQ707VPbrvsLd6Rz7fg/SQUxCWPMYLC10a7CH6Jcm0m3Ki7vIrKTMf+XG9nrRV+V1ApA/K09aH0s2043NXZn0Iqmw+T/+Jih2Kq2axR1csJtZ/vmq0jD0v0PvC0oH44X9KOjh5ZRWdIMkNjkR2gQOP756r1lBP9Zfa1+5O2x4a6gcsnvseebZkakPpr2mtg0aeSxlT/T0Th/PeExVK7SpCKmsoz35H2A3GIUdT/xkrzA1GExB1wXSzptSgHZok47GCPw+1JNyDBg9XbGTYMFxpKLQ1IhHaSawQdgn+QFBVRZKy1oZDWJVJzQt3VfxEWjmRnXyRvjB30tVnFo1b09Q8F8DmDj83MKoktF/3+9qb0KKMzmr59pSGkfPLvYmFUsTRFTiH/6Acb6+5bdRhhOnNNZYRJ6DDMSj04uexwwrWH/FJ483PzjRFynU4OkT0K1FAu55InYv3w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(19092799006)(376014)(7416014)(921020)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0Z1UEV4SjJsVU9DQ1c4QllqbFVXS3BBKy9GTmJFNExPOEJjbkd5ZjJNKytB?=
 =?utf-8?B?b054MkpZTXk0ekt6VHpVbE1qR0dOellqc3c5aGdPZk5zT3VCVkluQnZBZ2JV?=
 =?utf-8?B?cWVUQTJ2WXZ3OEtUMHFLclAwbjg1RWxVK1g4QkZkQzdqRmxHZk5KUWJmSStD?=
 =?utf-8?B?N1RYbmRkalZ2a0ltNEU4RUd2anUvMHBUZHBlNGNHcEtFVTRmNGp6em9JbS9n?=
 =?utf-8?B?eitvRldZNEwyMXY1SUI0bDZWc01VWHh3RjAvUy9DNFdPSTZKNFo1VWN4QVNF?=
 =?utf-8?B?MUZCMllwWTcvVHpCS0RDZkVXMXp6NzFqbTkxYWVKS2VkdjJ4M0VnRy94Mkto?=
 =?utf-8?B?THdYM1NhU0N1WXM3L3czQWQ3WWkrM2w5OGJPMkR3Mm1lT1BpQzRCM3lZK3gw?=
 =?utf-8?B?Q0x6TzkrcnhHNUpFUWs0ZG82ZWdpRzNzU1dvNWJ1YkE2L0habGI5b2hrelFn?=
 =?utf-8?B?eXFsRHlyOFJhb0JxRW0wWXZxZFRlVkNiaWQyNElIRzlmMDRXdUc1UC9tL1U4?=
 =?utf-8?B?VU93dlpHY1VrbDFHOVFJYTBWN2EzdC85dEhjcFNGN2VoYTdDOUs5TkJqUUNB?=
 =?utf-8?B?N25iNGR5TC9iYkJ4WjBkWTVzdGVuellPSlkreER5MHoyMTUzK1VqMnR2WFRV?=
 =?utf-8?B?SXcrUWV6VWVGbXRRWnRFQ1NkelR2UnlYVEtCdHhISzVXMm9qQjNLbjZ3V3d4?=
 =?utf-8?B?NlZLbm5BeUxJMk8wMXEzSUZMemxYY1JabGVsUjU3b21TOWFPbU41S3Q2dC9U?=
 =?utf-8?B?TEJSOGI1TUhSS0oydVVjSTI4Nm1kTnkraWU1SXRtVkViRTNHVk5zOUpuWFo1?=
 =?utf-8?B?QkE2SDhnanQySEVaaUtHKzM2N3JjV3dUY0hacGdON0dWdjlidHBUZTVHR29s?=
 =?utf-8?B?WFJad1ZLZzJSOEl1aEFWTXorT3hhYkdNQU5qenRTc3M5YTdrTEdod1JnMU1W?=
 =?utf-8?B?WjAxUmh0aTJLazJWZGZLUVRQc05yRDdnQ05KY1pSMlNjWVJlR2RWVDZRMUxN?=
 =?utf-8?B?UkE4VXNQL1ljY1RiWkVyckdlS2oxbEQzWU1sSU1pNVpQam85elNiMk5NYm9x?=
 =?utf-8?B?L1hScG5QUTNvRVJndjhXUXlxYWZoUlBEbU96VXNEK0lER0ZVWTZUM0ZZajY2?=
 =?utf-8?B?LzgxdDcxQm52ZmdHNkhPczV4TDhrSXIwalMzS21xUWFFVThjbSsvRjN2NEFy?=
 =?utf-8?B?U1BMRTB1RXV0bURManZhdGVEVW8rcU9sbGxIRUZBcHc1QmwrbGVDYUZYVDVY?=
 =?utf-8?B?dkg4UURQY2VEWTgwR0w1eG5FSHRzOGx3MzFoaFRLTDJXMjNVbitDTDd3R0t5?=
 =?utf-8?B?ZEVNWnhMekwrNUhHY2E0UnFHYWJMSW5RdGJmZDYxRDdLUzA0c1JrTUJaUGhK?=
 =?utf-8?B?QWY0dVFSM3FlNHh4b3RRaDNsZVJnYXpmbEJBZ1pTUFZ3VldIN2xIa2Z3cU5G?=
 =?utf-8?B?WUVjM0VjaDhoYXJsNVpZcU9WMURMVUlUM1lWUVRHbDZtMTZhekJiaVRlSjR1?=
 =?utf-8?B?eVNaZmpBTldjRnp0ZVlUck5SUTVuelk2OHlzRWZKZGhIQ2pnOG5aYzEzSlU4?=
 =?utf-8?B?Y1UweEhmekhhaE9PMGF0bUJqV09uZ01rYlZLcFM1clNkcnBtUHVGMGxYK1pr?=
 =?utf-8?B?NHhvcTRCQkdqWUM1WmpEVWtHaldhcXhkZjlhckcrTmFoQTZNZ0hYUFBGY3VL?=
 =?utf-8?B?OFMrNENmYnFCRzV5QzFrZlZGajFhUWRRYnNDdUxJV0pGY1hQQmU3TytYdjVT?=
 =?utf-8?B?QWR2dVh6YWJOWGxucmZBeFBENE1kYnN6bDNGUEhSMEZjMWt4SWp1Y09lSWFZ?=
 =?utf-8?B?QXhsOEw5N2pwNXVxd1RpaGtabSswRFdzVHp1KzVBcDZDMjlSMG9lVW5hYlZN?=
 =?utf-8?B?NVF1Y2tNejkwUzZFc1poZWJQSmJOVm41bXlRUWQ5R0JyV0ZneWJSdmV2RHRw?=
 =?utf-8?B?amh6OVI3YzliY1VyS2x5N3V6S0ZCUituanZyRWpSNE03cU1NM0xMNmlEcUZ5?=
 =?utf-8?B?LzRzbjM0a3lRaXVISXN2OEpPcjQ3RHhELzU1SHFMVEZtTkRqRDdBR0w3RURy?=
 =?utf-8?B?V3ZOeU5Ca1lmZyt3cEJCYndtVmZZNElTWjBmZjYwc2paNlF3Rk5pcCs5cXVT?=
 =?utf-8?B?Nm5YZmdUN29YbnhoYXErTzJwZEQxcXdiODNPanNlc0UxdjZXYUZTQTBPZFBo?=
 =?utf-8?B?WFZqei9ZbDdWREdJZ05VY01FbVRGdm1mcE5FNU0wRGE0N1Q3Sm1uN0I0TWJV?=
 =?utf-8?B?bks2RXFXeVNDdG9kR1RPS1pBN3YzWmNBYUtJRWhjK2lpOXNOWjV3UEpRNUto?=
 =?utf-8?B?ai93anZ5Zk04L0NnUjZSeHV6Q0x2dFp2ODVvWE9vQUJyVEZKVDV4OEFuLzRG?=
 =?utf-8?Q?XGb8UiR0nraqf/Uh5LsehJjhyDNDaXPFDF/y1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0716cdd-98a9-40bc-817e-08df092e2ff2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2026 20:10:08.8955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7W+kFBiZjFvUzwHNnplKHQseHfREhK0TAQN9Mkyhi66gEVVbxhbAyqnff/SYOehpgF9pMnzHRAqz6RpCJVbvzno/cihtu7+ybb+aL3Z9XByNFPFJ13lS1mUKtAiMMlAt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9384

From: Frank Li <Frank.Li@nxp.com>


On Sat, 29 Aug 2026 21:40:23 +0200, Krzysztof Kozlowski wrote:
> Replace excessive spaces for aligning indentation into tabs.  This will
> be reported by dt-style-check ("[mixed-indent-chars] too many space
> characters in indent (more than 7)").
> 
> Also two GPIO values should be really separate <> entries.
> 
> 
> [...]

Applied, thanks!

[1/2] ARM: dts: nxp: imx: Replace spaces indentation with tabs
      commit: 2966ab5708e704d4ff4a15f8ade2ee2b33ac8bf7

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
