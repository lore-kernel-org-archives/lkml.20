Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010001.outbound.protection.outlook.com [52.101.69.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9373472528;
	Mon, 14 Sep 2026 19:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789415759; cv=fail; b=aX4FTBfGbc1Z801BiaqWmKCHRw/eExdJwpCpo3VS/9yoHrDxtw3MiBV8m5wHS4Qm/46qRIRl1qLaO/bbtaaNd40ntr9chYwwez3yA/sV48CBqDlLGnrpRcO6A52S2vnb3pMJaF0Kg4otmfHNvasb3KhfqHIASqPbzluXDVqWJig=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789415759; c=relaxed/simple;
	bh=x+U5XnsyoXFhJoymJaU+VM4KSQjlI7WRGl9MUnfZxEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c1Zi8Wt4RxvvfHOd4hcFe1TGdg/XSJ2WQbDI9L015sB8eS/I3q+CNlpw4DDUrXdbvO7+OWvdaUOCyqjDNF6wykl2Olfg1uzoqkoatW787LZHN/+F4OXvxdvsmH5Fu8olZWunqA1f4gQjN2R1WLFwFzqth8l1QtHmoKh6Ccz7lWc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Cwg68r+X; arc=fail smtp.client-ip=52.101.69.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Cwg68r+X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v5ejb62gr8DlwljFzxE+QbPvV6ngokdiv1epjCexWkU2XZEFfTsxqJKXVveSsU2svZ19gQ8WYbSG3n7p3wrG3UkLSOE2yfkI5OtPZL0De3q+y+6AiiYpfcsQshhh2y/tWtWQiGUUOjvBE7X2cChhtifEqe72gwX6k7ab2R+pevLMqo6jFppMzYoh9b+/Ne9C/UpG4SSAGbkwUj/NN/bFbpS5L1b38UILXxDoym8bxKMAVZDKwufeFh7lqGpCQntihape83HLZxv3VyExR5b0HbT6aIf8h6qOWeSCSYxrmexAHDqPB1lP9bi/toCKJnoawQNhsOGNHaVkk5cBDGtYbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=URZRINbc2Yoc4mMXiaLq4BFnORAYfz8qMignsRGgJ5g=;
 b=RlKwujX5oKHSUUPXIwTUOwFThMo+OUfTlnzqbiwZ8YdjtELXUhlfc18oz1pTRQP6MKvJVyV8MWlySkGId6BUA2mKpqnMwIw2/ZzxAlYBi18T/hrQqzXF4GbHy8b34T3BIZoip2EU25Tlye74HNJ9V/O0+mH+kWohC1xRuGjJep2aRuGfRSuiMJp/1qx23JSYXE3I3BlRd2tpZNAGXQEhMHYwjBJbAetAU14JXmo8NNc3JRfPnjJr9rmFWAbwU6MdiEV/bdAjCEmI7vpfAxB//2RJuh1SMwTEo9qnGyyeTOrylJznLY0gloyrRj9+tVErLnjzC8fhpv1NasSMG3od8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=URZRINbc2Yoc4mMXiaLq4BFnORAYfz8qMignsRGgJ5g=;
 b=Cwg68r+XryxKDQHdP9drQ4dYi6JCLKb0oUifKTXmAUruuWJheDQgujfEvg1ITEmq30sfwp8IkIDqfqSeE5koa4sv7v6Y9d0R5Z4L3d978Ibf6DCzkgC6GiO4sTBp1Jw5qpVuVKk/Hqfjy+IC5e5p6KeM6nzh4E3xkEvFACcdb9jW7IR53OffhWhcRUgrOtJIIVVRdwIDlpklODukwslpImxxr0B5b8wCuGqbFtqDE3su0L/dsHTv9VjUdQTWI2CV2vFnm6jEKPUBKQAeM+Wn6mDo+GQyT38yVh4IzrV4KIsin8z/uiPMO/y/u3iyQhjrewrSuuPWLUa/a6ZotzxXxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by BR0PR04MB848598.eurprd04.prod.outlook.com (2603:10a6:2c8:35::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Mon, 14 Sep
 2026 19:55:55 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Mon, 14 Sep 2026
 19:55:55 +0000
From: Frank.Li@oss.nxp.com
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	gregkh@linuxfoundation.org,
	Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: remove unused header includes
Date: Mon, 14 Sep 2026 15:55:45 -0400
Message-ID: <178941572934.1839134.12278124479118536939.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
References: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7PR03CA0009.namprd03.prod.outlook.com
 (2603:10b6:510:339::33) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|BR0PR04MB848598:EE_
X-MS-Office365-Filtering-Correlation-Id: 63bbc87d-b536-4717-275b-08df129a2ffc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|7416014|376014|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	CemNJ5xBJm9Jc0LKEzBODy71XBOwf8lTGGyFMexF3vxJwaHhfRaT5+vejQBcN/eJf+4hp+uQ6eV9VnloFBuicQ9IBO9vblf7CkQGh7DrZJ9GsVbG0mT7TyD6wyq1b6epKGPV4k4M8nmKZq5HN7JikZATQ9K7viPFit7DT5bpzMdBAqi4oUmCei30hFftFzUmFJjiJJ7F/BaohfAMFQ4IS/gxaOyNeBK/dtaCEG7C5O9qaBb4eij7+t6cT3vK9TdSMyaZ2RUY8UTZkDOXuIb5iEotxqAG91JojxlImHI++cuQuCnEJKhyBhNprxuJGplT7oEjUAaRqRkdXxg1r4aqpAv5hA1E22AjWUNZ8bu0CSnrhDjdy1XPTGD/pp95pbdgK53KQOU5+dXEZHuav5OYF2Ok9mT9whrYi4gBMF7mVLnHexwwQwhwSM5H2OQwMcVM/zpMjp38IlSO7V9zOhVOyhi531xo625kLLN3H1WSkrkyG3dJbD3WCMYFyn/VwzaRIGz/blMnUTpMKxdEy6ohwQQlK4c7d65V3fDnXsZbCgt12uH5zrsJW1efcmZVU1QzsDS8fZpr5KO97slP7fbM9nLzyjDkU0ncg9zDGXr43jgw0VFh/up5V2OElsgFFKM49rWb/+FUl14j8uNk//afiYfH0Rv2HvF8kKDruB4Eec8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(7416014)(376014)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Rjg4RFlQUW5xdHl2OHZqVWxGRnNPRTN3MHlNSk5MOHY0L2dHNlJ3UW81S3dy?=
 =?utf-8?B?OU03azBIWTdNazNSeXQyRkRKaHJZQnQ3TmEyQjloZE5TVEhzZ1dLWi8xbkJZ?=
 =?utf-8?B?VktFdmkwMUNBWEtRQUdEYTZheEF6N2lpOS9aNTZTeTRJNTkxSHZtREdLL3BS?=
 =?utf-8?B?S1RKTkFETkN2ZDV3T28wZnNMUDFRb29qVEg4Z1VnMjdrS1BMb2FnNzZFb0ox?=
 =?utf-8?B?RWNXZzZpMlp1aEtkNTFmVXRtQmxibm5sNW4xYUN0SVVUM2tQZXJ3alFMbDM0?=
 =?utf-8?B?UWxERldOVy9zVXQ2WkRJYUV3OS9hTHU1SWhDbStTdmdhdjJENjFROGZhbFRC?=
 =?utf-8?B?NVRtQit2TmVFUXRWUUo4WGJ3a0RzTDNGa1ZwTWR3dGdFalFTVlBjY1UzZjg4?=
 =?utf-8?B?WDZuMGkwZ3AwSzV2ekVpTUdKSE56bkJMQW10SVZkUE5LZDhYZ3RVTWd3YVo5?=
 =?utf-8?B?L2wzK0N6YnNJNUxZczBPSFFUMkJRWkFCUGJRdGxZaDhyd0RVNmJjLzl5cFU4?=
 =?utf-8?B?SVVXQU9UdTBJMzVkNG94TTMyL0xtcmYvd09rSGpkRkVZSndjR29yMWFmbEVj?=
 =?utf-8?B?SnQ2eWVVZ3MrZkpSRjdGcEdmZExDRWJVb21HbzNoOEk2ZlQ2SkVxOGZZdHF4?=
 =?utf-8?B?VTM2KzBtTzUwd2xHQk9mWEVYejdoSkVmcnhhU1VVNDZLQWxYUVBQbVZZa0tL?=
 =?utf-8?B?LzJ4YWQ2RFd1RWU5RE1CNk55YU1ySGhBdW5aNlJxSG5jaFJHcDBNT3BpbzdH?=
 =?utf-8?B?L0tTaVdIV2hrM1BZdzhzN3VFY3NIdllCUzlhRTM1TWF0cG5WbTZ5Z3BRT0Nz?=
 =?utf-8?B?NUlJV1BlTVoxNFM4QituOE9CRTZuV00xN1hueXAvWGNYL1hGbkNvbkdiSnBB?=
 =?utf-8?B?eWJPejdVaS9nZ2l3TTZCNXNPZWRjZUxPNHZHRm1WUU9kdTBjWk94MlBNVkJF?=
 =?utf-8?B?WEdmSEhXRGpCRzhUbkoyMERnS213bmNUVlVKazdWVXFNMldOeHNuNFd5NTJ1?=
 =?utf-8?B?TnZ2Yndmb0RGK29yLzVSSEEyYWxKaFhkR244NGdMQ0tzeTNMTlhlbTliNFBY?=
 =?utf-8?B?QnlGc2JzQmhzY2h3ejFESTE5T0RGekdtUlVjQ0F4SmczMG5QaFVrSkQ5Umpk?=
 =?utf-8?B?NGRlaTNSL3pVYlJJVnUyK2tSYnpxUXozcFU2TDdvakd5L1NsN3hmWEhQUDJr?=
 =?utf-8?B?aTVqN1VMcWJjNVUyOGVOdUdSWllZdDBjQkIraHNseUZva3hTRUZNSThYcDY0?=
 =?utf-8?B?bE5FNHdHSDVxMWRjeWNuVFJnYW5QYU85eHFyQ3kxcHY3bWxFb2taM1N2YVZz?=
 =?utf-8?B?amprZ3RxR0c5NnhQTHJYSDRDZHkyUWRHL1dmL1Y2MmdyQnFKaHRFb3pnMDRS?=
 =?utf-8?B?U1pYcEtETjVjUjJIN1E4eUU0WDhFYlh1K09UOExXREZBMU1Kbmx4RENJL1hz?=
 =?utf-8?B?Y3lEQUMwbGVOWkcvUDUyblUzV0ZLN05iN1RFSUR1SnVVdzV2ZEhCclFReXI1?=
 =?utf-8?B?S0liSkFiTlpMS041TUZHa2hUR3lXYk15eW4ranoxcWpldy9kOTloMkJnNTVn?=
 =?utf-8?B?ZXJDUjQ2Yms3OVIyUGRFcG1CUm52Rmd6SFBzcjNoRG02NHVlRmFLZzhPMEND?=
 =?utf-8?B?ZlZxajltZmtaeTkxcnF0SmFQaVNlK25EVW1CL3hwZlIyVUdnVThiWUpwVWJ5?=
 =?utf-8?B?UFdmeTJPUk84Q1IwQWJvdmQzSjZzalI4R3BPUDcyMVRSQ3FTZXMvR2tLdlp3?=
 =?utf-8?B?R2N2dWhldEFaaFFxcEVPZFZyQVluanc5VGw0QUwwYTlHWlBFRFFjVEZwNFB5?=
 =?utf-8?B?OVk2azVLNjRjTzJWMU81MG5iNUxTVkNyVzZzdERXbEpsVGc4WXF0dTZjRHQw?=
 =?utf-8?B?YnlXa2hUakNRUlBnRTFiSFpTTFU1ekUxL1RlekxXS010Zm5uVWNkbFZJVmFv?=
 =?utf-8?B?MHhoQ3VWODd1REZ6SzlhenU3V0hrM2dsUjB2Y2VKVUpCL1lEL1FqMHc1Mnhr?=
 =?utf-8?B?M0RzM1JaejNoUms0K2ZBRzQvY29GMUhvK1FKN1F4QWdZS3Jsc2wrbkhWR1Fs?=
 =?utf-8?B?WGdUbGpzSnRxVjJMcUNwbEJXOWwwYmNMb3NoZDlUM3I2Q1NFcEVBRnk2R0di?=
 =?utf-8?B?WTJIbmF6dlFld3BONG5qQzUvOVhadTFGalJ2eFFROENwbUxNR0NpQUJlYUxh?=
 =?utf-8?B?a2duWktNS1dwZGZXUVo2WWFoWWhCbFhGczN3YWYrdVZjNGIvN3I2cnNlV0hh?=
 =?utf-8?B?TkgzKzRDL0k2dXZ5bXV3TTYrUjhXWVlkYVIxcW53Y2FWUUdtajJrcTVaa0Q5?=
 =?utf-8?B?cmlHVmRBRFVlQVEyckEyc2ZMamRKTEJoT0dtVlY0aUJGRFBlRXhRYTFhSlFK?=
 =?utf-8?Q?Yp6GyYZorv6VfFJRHWdU4IZgbU8LVGS1A5QTb?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63bbc87d-b536-4717-275b-08df129a2ffc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2026 19:55:55.2194
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E/D23eRHRRYKJkvUSodblEhkhpvL+LuZKeit+7+nUKGnv83aq9p3M6N5QzRksgMudlqHO/iYQ6qxkGQ7df/ssKBVE7Gk5kDoVQV2/F0V7JmbCLc1oL4cUXFPSFYGOAY7
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR04MB848598

From: Frank Li <Frank.Li@nxp.com>


On Wed, 11 Feb 2026 19:52:08 +0530, Rajveer Chaudhari wrote:
> Remove unused header includes from
> imx-ic-prp.c
> imx-ic-prpencvf.c
> imx-media-capture.c
> imx-media-csc-scaler.c
> imx-media-dev.c
> to reduce unnecessary dependencies and improve compilation time.
> 
> [...]

Applied, thanks!

[1/1] staging: media: imx: remove unused header includes
      commit: 863f9621178ed5786547b61456d9f76393e6cd29

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
