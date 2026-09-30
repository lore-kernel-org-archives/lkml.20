Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013023.outbound.protection.outlook.com [52.101.72.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE4B501283;
	Wed, 30 Sep 2026 14:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777482; cv=fail; b=VcK2I/y/yCiF1I4ZQU/wCZAw9JabBlqhHqcYvRAOmpx2qWuITMvM6/QV37wlD0vWtM15Z1Xr3KVsZXsKbxeVP5P7sZco5N7AVWaIbL50LsCWe/exyQA+8cU2L6p3xmiFQu0V6rk8tRfkqHulDbofbn8XIU8OyEpzCUVeWdeDAhw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777482; c=relaxed/simple;
	bh=ZFoMe36+bAVfKUp0CNt38wleymXzk35A7uclTwz15ok=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Eqq1E9qZT2IhArajHxwLRnKcgvSSAcB5BaE8F7aTf5I164udF61m5B64TYGg7s0aXt9gpl08xEcBwl1W9woE9mvGBcNIisLFO60HvwqgOpzK7G1OPum/41h9+Jo/72OfXmDIgtpp8KzWfoMJqePFJp6hRaJTG5aNg4ggV0J4Ax0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=taCcCiCv; arc=fail smtp.client-ip=52.101.72.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="taCcCiCv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kEc2FieziO4/ZsSqtPSwKsO7Heg5Kh9C4fDzIrnj+iOnsR2mQzZBNHWiSJKbd1vEoaRWKVocjhk5TuG89Err5UqBzD75IZGpzPRnHaokyi8R9uZKtT+Yb8OVBw4f58v7ShmVffVHzCS4ATt9GdytKsTUlv9vN6N5QwTs94F5CZAUdx2HkivbFe932q359SI3YKTay27HgSLR2IiWiJciDBbGkZkVcI69zDtDViTf8G7f5v/HvqBhSV8JWEG1+U4gz/Un/Zj8/CeZVrmt6SU9MUsjNc8/SAI2P7igA2QOMLq9teha3UHPF/7ifFjJrnGVdk9SpZMEoViqRMiuesBQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OzW1Om5duv4xvDdRYOQ8FEcRwXFVcDQY0nVCOCgeghU=;
 b=vkimWopn+H2Eg7YainQ4ocLKPaw1VoONASYpmvFPVBdreq+6MWN8lSvVlVwDAzTKDUj5HTubvEsxgvKKQQry/T06ycPouiQ10ThCOPcqbT+gzyva5axAGnJAUt81dV6XHPelPIJaG/nDNlQp6sruhIUnpERBZJFFxVaygO22wmifX278iB4Qb56nJv25qfOW0S+pOJi4Ziu/cXVEDl50osr+INyQvWLz/qzWdiu0uvhlaseB5NKhpBBpV2O258b6fH0+zmmEWS9VTh59nJu4+rHEzrOwagC+ZXAp9c/gAsKLPs7jTA5+zmXpTUcnjtp9MR9ELsTBXanAR2EXT7pBuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzW1Om5duv4xvDdRYOQ8FEcRwXFVcDQY0nVCOCgeghU=;
 b=taCcCiCvF6DWFY/BVz3FFXwmiC2AzGjl8itEI/+y+8ICkwh30bc7/RQkfZhMYyQyOVUmj15M5w/Nx1GsxvCW8B4KzmbcoDR1r7vEzTFL+uDGOCUyIK8BAHv/gv1fCz27edK5Y2+edOn367cE0hSXvoGAI4WGTBuLRN2i40iHEAWJ+WmDNUFyh3Pb69A4Z2iUSuXvjBVDaxYTlLxtI3K+2QuN917tbZu7+bOAXjASzCP0I/6xj659Pt0Uj3rNuXkwES882JeQDeJH5oKzaxG9I5a1WJQxdgnBD2nuVLxWIBZG77zs2ACB0dKMcq1gh8VNEOUCERbYR9c3rdQ0k/nzww==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB8201.eurprd04.prod.outlook.com (2603:10a6:10:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:10:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 14:10:53 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	elena.popa@nxp.com,
	cosmin.stoica@nxp.com,
	Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 0/2] Introduce basic support for MR-NAVQ95
Date: Wed, 30 Sep 2026 10:10:45 -0400
Message-ID: <179077742839.498465.3810580176902136919.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
References: <20260914113010.988-1-laurentiumihalcea111@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P220CA0144.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:327::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB8201:EE_
X-MS-Office365-Filtering-Correlation-Id: 30351c96-4ae2-4ccf-bb46-08df1efca363
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|19092799006|7416014|376014|18002099003|22082099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	xvG4efl3cMV4IvhX9eAFV1LgqNkiD0A2Yq6zvaI7BEIhJBr6KcfqpUp3E6U41ovkwBS0k/2RpntfGg5emRtWXZknAb7W5I41hrkUInxQvKjeck77K/5CDtHkkQvWHvuiJnLRe80FDhU4V2kSASUj7BY88H1hz2Q13uDYi16DPrl3yLDol0/9ppeuonY471J5s00O4mi56XA+WI7TAbA4CwQkRgp8lPERFJnxvmEg9dojbsiQidFQ+6CZz44EUrVu+EP4iHC/sLZrKQCiJdvIE/HPH55TyVIz/ahzS371m8kMyeKv9yhYxLEq3txZEJDdUwAAEBqfgLj/cqxVzdIwCcKR//Jidh8Dwfqnhr2vmeEJibeVtRXv8WB2A4BweTQRIOe0PlBAObDhqrVGqZ2cZJuJW85DRLTvYE0Tq6kaoWb/b/RV7ZhcrtOzaPkQpTtZB34yEwgiIlVU2gX50WgtpU8fXk9v3FKpKUY5LQ6oCKmGYiCs6t+5T2s651XiMUr5HKzBgaeii1jhT3Kfs1zmpDpVzZDs8o0x1BzqnliQOcMadaMfcpDlQRlkk3pFnXqZ74oMXxn6DSlAgVA9etthPcDgdf2RM1TgXWQUO2hgR91oUCpXqIJr9negDoIBy8HcLJww2uQUghzvY7mjOWDcKWAn5/0RQ9K3pn9YQ7JvWNw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(19092799006)(7416014)(376014)(18002099003)(22082099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUJKS2RoeUI4QTVTR3hiZDM3ZlppWWcrWTFqeWJSRHhSNk9OSU1obXdZeFpK?=
 =?utf-8?B?MWJ1OEVuTm11WVdlWmcrVCtCaGtBY3VoWGkyWnYvZjRvL25qR1dXR3BQL1Jt?=
 =?utf-8?B?aHFGUkNVUk1mVzkweFRFaGduODBGOWlNWTV5N3pHU3lJU2JGZkpqK0JidUUy?=
 =?utf-8?B?TE1SeDNjcUphcUN4K25xYUtjbHZiM2JTaEtlNXVTWWMrZTNobndLV2dSNG93?=
 =?utf-8?B?RmhGOVlsT0NWN2FVdXFrWHZSdm9jZ0ZxZ2RNQkdBUW95OXB5empjVUxSdXJO?=
 =?utf-8?B?ME5yQ3dSWFExYWpsWnZvN1RUZUhnWXM5OGdqNVBVWmNGcDRCUU1GK2dNVHlG?=
 =?utf-8?B?QklONHZtNUdUeEtqSTNzNHhQeWllNlZqWXFNUDVFU0lka0J3ekJmMEp1Q0Rr?=
 =?utf-8?B?aDh2S2hvb05wYUN5azBWSEE1T1RqVmoyOSs5VmlZanNCc25LSHhHZTg4OXhN?=
 =?utf-8?B?RHhETjduUklIMC9pMFNrYWEwTllEbGZGeFp4aG95K09wYmNCb3RqZEVOUkhW?=
 =?utf-8?B?Q0RjcWZtSmNCS3RGMlgyZitQYWxqZWxDY3lnckExTWV5dmVNVElYeERpbVBV?=
 =?utf-8?B?MUxnc0lEY0JJaEw3V21MNGEwZU9ybVFZNHcrS3RNVVoxRDhta2RwemVueGRF?=
 =?utf-8?B?bzhZOXBNUk5uQndJUkM2VTVHZmZsTktWZzNoTlRUMnphb0FDSU5oQVAxWCtw?=
 =?utf-8?B?NVZsNjRiQmJOVlZwWFVmdnd4KyttZ1VVTmVmQXBKeWpqbHRaSGFDQjhzL1Ru?=
 =?utf-8?B?eFBBZ2t2MFlzczQvNFZ0bjVVZzYzV3BsMjd6UWltbmQwQm0rbkhLaVcvQWZn?=
 =?utf-8?B?VENLNTNGSjhuYnRMRENEWTR4Mi9jWTY0eHVtWTJMWlNORTQxR2dXd2N6UHFl?=
 =?utf-8?B?NzJkNnk1UTI4OWI5Qk5MMGtzSVJiOXMyVy9wZlZqWjRqL3psdFpQSVFOaTRY?=
 =?utf-8?B?UWFHdUxuYUdiV1QzQnA2ZndNK2xLVGhLVlZjZVNEUkwxS0x4OWpuaFNzUnlH?=
 =?utf-8?B?NTg4ZzN0WUt1NUZPWTRpRG12aTcxN2VQaEt0SjlXN2hSY21uenhQUVd5T2ha?=
 =?utf-8?B?N2Y3TlMvYWZaUDZMZEljSmpVM2NQMm9ZOG9xTVlLaUJIYVFRaTlJaCtaYkMv?=
 =?utf-8?B?MzU5Y0JidWNhaEJIblJHZEQ2SGFZdWVKTGRlbitwTTI5blc2RTNITm5HeDJS?=
 =?utf-8?B?WXhXRkxWUGo4WWQ2NUZ5d3BWL0V3ZTFwQnpyWk9USERZK1VqSGY3dGZLVURK?=
 =?utf-8?B?dFhjejBBdVU0akpadE9SZXVBYTdHSXhsUEdkdzU2NE1pY253M2N6YUVVcXFH?=
 =?utf-8?B?UmlmWWpmZktaRzcvMmFQWkczTGRuVW95ZXYyM21seC9yZHNSUUJCcDN3MDBs?=
 =?utf-8?B?a0sxdDdpZWdVUnZacS80VE1Cc3R4aHBVSzErdDVVZ01Cb080cGd4RC9kclg5?=
 =?utf-8?B?Z3BzU0VqOXcrSFIybzJNd1o3V3U2Zm5OSWd3QXNnRUJmdUE4SmVzMnE1d0o3?=
 =?utf-8?B?VVB3OTAwV2RNQlVpVUk4Y0hVNHRxZVZjdjkvREh1VDlNU0pwWUJzcUtKWEhD?=
 =?utf-8?B?a1B3NWFlQUE4TW9MbWllNW1oSGtFK3c0RHFmU2xBR08xby9yOXBhTTV3ZjZQ?=
 =?utf-8?B?NzZ1TEg4UHRqSEtNNHdPRi9kQ25kSVg2Q1ZrK3VUakxBS1ZrU3lIa3lUNE56?=
 =?utf-8?B?SmxkQkFqYVBUVEI3eG54d08wcy91MXQwRi9GVHB3VXYweVhWK2ZZS0FrK1JO?=
 =?utf-8?B?RXBSNkdRVUFuRlZoa05wVnFmblRvdmdYVkl6eEloRE9NN2xQNXlMSmdheEto?=
 =?utf-8?B?d1JuS0pFU0pWRUp0K2h6ZFM5VG82VmNJN2h0MVpITnBJU0cvSjlHU3paUEgv?=
 =?utf-8?B?OW5aOStzKzhUWkZ0RndtVXFSemIxSk5BRTl4a1A4K0lQWkdTU21CbTNZcGd1?=
 =?utf-8?B?UWdpekp3MmpUblJGamFuNTdUWitzS3FML2tVcWRRU3BtcjdJRVF3akNpSHho?=
 =?utf-8?B?bThodUpYWDdyMVhud3cvQTRPUWZ3VGI1bmhKQ2tYTzYwbzBUa1pOZmJoWkwr?=
 =?utf-8?B?SVNUNE9FaTZtb0NUeGVKa25kdVZDY1UrS2MwNzh3VFE3TmZtT3ZMNVRwaHpD?=
 =?utf-8?B?YjJ5RXc1dG9NbmM1RTNwZi83M0NraXYyRXF2ZXl3d3U3SnNNd3VBQnNzSlNi?=
 =?utf-8?B?SGI5YXl0azBzSXpLZDBSM0poRkRlTWJzUWxXalZ1a0NUM0FVTkwveExQNEsz?=
 =?utf-8?B?OUlyK09xYXk4d0ZDREVKL2tPSCsrcWd0V0x6amFMaUM2REpxYjJ1NHBpaWZ0?=
 =?utf-8?B?am9XUklsSkxnekZ6VTlpeHdDS2VPR0dPRWZPRTZrZjVmblIySlJRYWk2eS81?=
 =?utf-8?Q?qGczeGFxRRW9EZXRu6yvg7oi9U1amtMaOzZTa?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30351c96-4ae2-4ccf-bb46-08df1efca363
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:10:53.3845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fTjn8eRZSTbKDn5Pq7tyvrHgl+sswpro5GcqR6jz2WBYJB1pGCZ1Kbesg+HGpAiis4LeFoVMYXvKZ4S7KaIpIzlGS+MR3ybEX4BXrntejmlHct/0hfCMvCcDT/XD1vio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8201

From: Frank Li <Frank.Li@nxp.com>


On Mon, 14 Sep 2026 04:30:08 -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Hi folks,
> 
> So, as the title says, this series attempts to introduce basic support for
> NXP's MR-NAVQ95 board. The "basic support" refers to introducing a new DTS
> and enabling a couple of peripherals so that the board'll be able to boot
> from eMMC/SD/NFS.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: arm: fsl: add MR-NAVQ95 board
      commit: 90b24441dc4a1803f9f68aaeb6bff0517cc90579
[2/2] arm64: dts: freescale: add MR-NAVQ95 basic board support
      commit: 3893cb7b467476878dc2de1b8b313f60ffa6c369

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
