Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C129E4B1473;
	Fri, 11 Sep 2026 18:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152221; cv=fail; b=oT3bA28zumVTIjUWsHxDcEEi6zT78XIEWOZQlH0gxU4oeeELVni1SBTmfNF9LOkzmHn3QDIK9qiCs3pFbEQecb7AZTtHyBEuSdgCaq+b+dFMY2Kbz5fMP6do5td/DZqEQFULjAeM0W+jQSp+Oqlqgpk2I7xZDbCS+O4xSrfE1JU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152221; c=relaxed/simple;
	bh=NntIgyaxAKCIE/zSY4nkPFBbLMIMyHWpUP1w2TQqphc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ea6LEbCc4JImmsF8UMK07SZcBwASxniPMKcaYw01QyVHqgOOWsD5GaiYR91i0Gd6hvIhNjigVu+MXIarmIbhfRoH5miR8AEwDp8BZ3pJjW15KX8LT0UvpQ2b8PItUTFaQ9v5b8/2ls2ICCFxAC6DhW1nDwUvkN/mrlrgSlZqABk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Rjd/7tkf; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Rjd/7tkf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dxtWS/FZqRAn8zSvJxp77Mtnl0Au1+jXTTszwU3D5bdbI7vrAs5iAVMIx6pMSH2l5nzqPQyT+uKjUpZcRWS7la89nx8vIos/Jr24qEpjcY7C1JEHVVFjZHlFt/iWuiu0ydHoOvXgzPjLsq/9Iuzv5MxrYNP6DYwru8ajnln4JUMKhSwu50nUWKt92hyBDDhKS0Pj8Sr/37Qf5V89zYbe4UDGwYIkxz+mXFb5EEMH1oC7mKqwSFuIx3g11GTMdPQxFbank7n9wikprGExi+iOWu3Nj30NpZbfzwj1TyzzsoYshqjLq7ZidxVgcxRbmDAgegb9BAC+xOnJVP7yNMUDAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7EEBE14tY6ojxRMv6JTbOWDYxn9zXEUPpPq8PRh9nc=;
 b=ZUTinTlv5Uyj6ONm4tyk4NR5082qLPgT5QFhEkd/+t+W2N6EXpfv+qF7k5pDhfIOugPAEpcE6g2rPOlnAWFi0wIUgAylqDtoPfRC/YKju75iDd3AefrvMRNYr8MWeYk/8PKlBWItWCC8b0xXpb0VHAe6527EfdPTpEQ6dqorpyrRuuX/6aEkMTPmVWRKmUgJndjKmzVrZkEGAwNqKsYapFRvaUvTVrCL71M8FTlNZfk3OJGCIBoDf6BfbHJRTUYFIWJukb6a2aD/BP+8qBGIDB0wbMbLMU+9V5OdmJ9e/UzplilVB31eZsCChJ8NkIq+6ELTD+LwiJB/JVDeZ59UPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7EEBE14tY6ojxRMv6JTbOWDYxn9zXEUPpPq8PRh9nc=;
 b=Rjd/7tkf/u58zEhrg0EBrZQB+JjfTaT/hL0tMTNGZbh8me31N3bBQqXP9yfoO4S1efYCEgSfLq1rwhzx07vNHF/9vL5IbB190B5Hi7km1zIKowStbqfS+FGZGOmJhjv2DsFibbubslN8//aVv/R/Ro1HBP04j/xAYw1a7sOu3AQXjad04u9vSf3hhlVpD5RrwkAhe9xiut/WQfUIn2EU9sxLUiQmbuDmm/fXdZ2mjPB1lp5vAHuI/9oQ8N40Ffo3rQ42slznymhIAi5yPRGiBC0G3hFI/FU6q9Ck+qVN6A2/cBAlHX/Aaegg871jroY23tT7jgZIbOwQiBezWGpKOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11657.eurprd04.prod.outlook.com (2603:10a6:10:605::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 18:43:32 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 18:43:31 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Maud Spierings <maud_spierings@hotmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] arm64: dts: imx93-11x11-frdm: some fixes
Date: Fri, 11 Sep 2026 14:43:24 -0400
Message-ID: <178915219647.2910505.1476712574924535814.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
References: <20260906-imx93_frdm_rtc-v1-0-3fadbda0bea1@hotmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CY5PR16CA0007.namprd16.prod.outlook.com
 (2603:10b6:930:10::18) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11657:EE_
X-MS-Office365-Filtering-Correlation-Id: a507c73d-579c-433e-5f26-08df103493df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|7416014|1800799024|19092799006|376014|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	+051Cf/gJnUuPWs6qGtqov0RELmD3VE0H8gZXcUhyp10maZC30tCQnESSbVmNvh1Uf996iMbtdjqeVO90U1Lgd2H875+ZCGarH+XsB2ue9hnSfJjmMN3eeIsycuGtivmrKJYPTjRWtFBqVxRt/LTLMAetmieO15p7II+1Jp4WVkHAqKuS76zCc6zx36AolGzwNeI8zUTdJ0cYpsAgAk0tleJq52L56aU92MB7HJY18j1lFT+dVPNZI8atuUjVbyL2Bnr06k75l32yPoZISfGqZt1uAGak/HaRH181vHFBZZbX+O4l/DL9JqMKys28xGlljdQ04oxexhIZvJE5IUYrjZqa3CLhPvYFm3frozDVwwqM9go1cw98aG1FVIVy34ns+6mxrItd+35AAZerVD99U1CciOW8XAdAW55MypgOT424ZHbBPDRh2Ss9KBKZLJR8nzEX51SeeDiP0fAyrO99355PeQ1z+C7l1fckAHZQHd9NjqNX38m6ZQzyzx20XDQ6Ik16HXO1dk7Gs4dOdZ+tCq2WAYTE9OWijU3rgmXgf8THX8Nyxks0+e6ExI314RCzRDQFHUw4ItlTww3iYDecdwCuLNJ5OQeAwG+D55M1FAxcA48e13XDM/hmLdfhcmOF4T/Fjh9DJG07wNVsIKjBXtFmpmDiSS5NvEA9gTdZp8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(7416014)(1800799024)(19092799006)(376014)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?blEwdEZvLy95dU1Ga29IbklzRDFuZFRqcjc0VmNpYyswSThhUnlqbGtFUFJX?=
 =?utf-8?B?WHFxT2s5MXdwYVR6VXBGdHhzbmorWXFOYmF5MEVEb1I2eEtvQWhUZ29tYnli?=
 =?utf-8?B?NlRVREY3RGdjRXlXNUxYL2QyU1hnbUIwb2h6Ukc3ZGl4L3Y1bFkzZ2xwaXNu?=
 =?utf-8?B?bVRORUYvdkc3b2FHZlgwVDdwclYyS1lBMEM2eWdlRHZLaVFFYWVOSmVIMEQ2?=
 =?utf-8?B?ZHRQUlVMOWFvUE9SdG5GYlR6Ky9ncUViMmFTSGd1cTVwTXNaY1llenBORjF1?=
 =?utf-8?B?WDVQdDV5WHh5Y0lMNm8rWXFMakh4eERIb3QvY0pDS1VPbmxQWkdKcER3T3h5?=
 =?utf-8?B?SDB3c2VtRDJKWVpRandhY2NRSW9FQ1QxZFRJd2FNaWRmSjdXeVM0THEza2VI?=
 =?utf-8?B?TGNseUp5YlNTeGlMdHoyajk5RWxNYUdOU0dBajRxNnJNMEF3ckg4Zjd2OWlt?=
 =?utf-8?B?Mmx6Qi9BSE15M21qcm15Y0xsc2t4ck4yTFhodzd3Z3RReHRMOU1OZ0krb2kw?=
 =?utf-8?B?aGRiU29TZk53Z3BDNlcwSHBEQ2pTZmhnYkRPeVZuK2twYUJmZEpSK29MRHZi?=
 =?utf-8?B?dW9KQVRKQjg5Q3dQMkhnSkNkYWZKQmJhRHRSZ1EvNmMrTlNjdXNFSldGcE1r?=
 =?utf-8?B?VlZtZHVnVmIyZnFtYVhsQWY5QTJHaE1jSHQvQ0xqTDZBZzN5UVhRSXVUWE9h?=
 =?utf-8?B?R1lCN29xZlZDUGNoYURsVGNWNmg3bGwvT2w4YXo5M3R4NzhNeFdKL3oyRTU2?=
 =?utf-8?B?NmNPWU9qZkJXbFdrejIvMUNFSlc1aStvZkdXM0hES2IzMkVSRDlEa3RXK1FN?=
 =?utf-8?B?ek5LRjgxSUVLYkZUQTNWRnJvTnc5MTAyUlZrRS9GOWtTMk02V0N3cThIdFhP?=
 =?utf-8?B?OHg1K1E2WG0xaUxWUU5HbW5xbS8zOFRETmJSSUVGYWt1NnJpVlB3WHNOK0lF?=
 =?utf-8?B?Qi8vaGNjUnBUU0FGT3VxVHoraDB3ZGxoNmt0amJLUm1oTi8rUXNBWUljRVl0?=
 =?utf-8?B?ckVteXdRdklEQ1BUdFB1Sk4yYUU3b05PMWZIYTFJbWpYQU9rSVBVbk1MeExI?=
 =?utf-8?B?bURjNlo2dDFxSFRsRjBVUTN0QVg3S2lBMWhDSmdQRXdFeUVXWERvSVlkM2c3?=
 =?utf-8?B?a05OdFFES29UbWhRSEFyYmdLMC91VnNUMStIdzlVNHFrVUZYN0luNnl6ODNj?=
 =?utf-8?B?Z0hYQ0JmNEYrR0JvZnQ2bmcvVyt5WW9BL05YRk9JL1ROZTdnWG14Q1Q5OXpB?=
 =?utf-8?B?NG9TMUUzK3M1Uk8zbU9pdlJIY2RWQWFQYjJJMkF3Njg5YXR0d1U1cmRzY3dS?=
 =?utf-8?B?bDRLVG0xZHh3ZHhjTWFrc3NEK0lPWG1PWTdTTWJZSCthd3I3aVJDQnROeVdu?=
 =?utf-8?B?R3JZMTZubFBkMXJWclRzZHZGU2dvcHF2SU1DSndyNTl3QWZGdFhhTURpVUY3?=
 =?utf-8?B?TUxDS0VPUnZMbDlFNVhOTUh3aWVBTGhHL0pIK1k0WlZXU3oxcWVCYytYRzRE?=
 =?utf-8?B?SyttQm5ZSm9XNi9yYldaZDV0cVFqS3RFV0xTSUtqYmhnQmF5MEg2TU50Sllk?=
 =?utf-8?B?c2xDRVQvRXQ0cExqbmlnSllkT1lwWUVIbmdqcisxT0JJVjB3dGxuaEpZSHo0?=
 =?utf-8?B?ZjhJeXcybDh6dVJ3ejhpcnVYelgrbUdZL1g4SHZzbW9uUHB3OWJJZERtbUwv?=
 =?utf-8?B?NldSTUVlcDk5cUZ4WnlXRHJTaGt6dFg0WFg5NFJwT1pydmJtSGlvU2xJc2VT?=
 =?utf-8?B?TVV0cDFCbGs3NTVrUlJQc09lSWhubjR0a3RrZ2k3U1NVZ0FFcHUvY0xCdVhw?=
 =?utf-8?B?TTkwQmJTOURwQ3BORHJBRFFFZFZKY21KL21SQ1orZllMdGgybDFEdlAwbXp5?=
 =?utf-8?B?MFdwQzhyUW5qNDJQU2FTVlpuSEQwQ0VnNDJFME02elBkcjBmaGJlWXZzaUYr?=
 =?utf-8?B?YTVsTHFPVms2eHRGcVdWTWQyRytPN21WSG5KNjlvaWd6R3NTSWtMKzRhNlV4?=
 =?utf-8?B?RElaVXpLYkpTYmN4RnZGTEtvdi84am1yR1VYZ0VMUkF0L1c3MmVsNEp6YnNO?=
 =?utf-8?B?YlFLcWYzS1RyOHdyb1NMK1oyRUNISlBZKzZGVEplQXEzVHMxOU5QT3J6VitN?=
 =?utf-8?B?ZjIzUzhqQzQwZVdzNkhIK2ErM2N5Ukw1MmM5SWRjbDk3WDc1dXh3blRpWGNn?=
 =?utf-8?B?b0FkT1EvL1U3RDBCNmFIcG1IL0p4dVZwakxSRXFRMVFyWHpnKzREeXJ5SktI?=
 =?utf-8?B?cjdyb05NbWxiRHVZQUVjczRmL1EvdWxpOWR2b2k0OGtITDU3WWlBK3hDTUgy?=
 =?utf-8?B?UjlrUjl3STVPTk1NcEFXRzZ2WTVPYlVJclNxcm5NQWZmQXFXeHVBL3AzdmJZ?=
 =?utf-8?Q?gm+LLDI3S1MZuqKG349JHzeOMjEVPI6wb7J6c?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a507c73d-579c-433e-5f26-08df103493df
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 18:43:31.6953
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Xz1cipePzACCuhjtb8bg42C5jsXtFsgUjbiQNlqZJgsgFt35xROKFKrb2IeUOaqsuBf0Rj5OeajGbiFb02pS4ivsV0JPjuMIf8rGBvkkJ0CN57b01DUl8/ZHysNc5LP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11657

From: Frank Li <Frank.Li@nxp.com>


On Sun, 06 Sep 2026 15:58:20 +0200, Maud Spierings wrote:
> pcf2131 has been assigned the rtc0 alias, but if the bbnsm_rtc gets
> probed first it will take this name.
> 
> Properly assign bbnsm_rtc to rtc1 so that this doesn't happen
> 
> Add the power supply to the pcal6408 gpio expander, it doesn't have the
> dependency loop like the pcal6524.
> 
> [...]

Applied, thanks!

[1/2] arm64: dts: imx93-11x11-frdm-common: fix the rtc aliases
      commit: ef92c79a1e4a3e272407d9ceb01327c0b0e32c76
[2/2] arm64: dts: imx93-11x11-frdm: add missing vcc-supply
      commit: 711ccefdf461c2d448e009116e1ac51f7ef2c10b

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
