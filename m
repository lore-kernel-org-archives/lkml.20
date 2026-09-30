Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011051.outbound.protection.outlook.com [40.107.130.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56264F85A3;
	Wed, 30 Sep 2026 14:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790778670; cv=fail; b=NsLukPIWJS3o1ujvT1fcNyMX+IbmLXbDG6pb3s7wtytQdDmWaHHW72NctMoDETd+nTAgIrbwSkmSrrhkW/SmF388tlFCAwCTrIAJLp8tlEDwNfJqSUZvCZANq9ckcBZJhhn39o2tyddLzKBz2Dd7s9OMQaEVBZSAarEc7IeMnKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790778670; c=relaxed/simple;
	bh=ZiKy1kWkEIdlSTis/nh7AaPDj3lq69NU8+AC943A3vQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MFwLd/uzXW8H6IHSfMQ080NhyRM5p75HwYR4f3isqPEsDBI90a8KigDIk/5o3XNr6CiPLhq5021iPnmc+CmHNXNCmwjvKi3EPOGT9ePiI6Sgh2GQex1erHPDh1mjfydv3pPbfzkQQ7XAJqp9SpU0kBlgaGh3oeGXLEGOilWCuzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qquOjvdf; arc=fail smtp.client-ip=40.107.130.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qquOjvdf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CEka1IfhScaRixbjEClRSAWWd3yncPj5BQWw4RYA3+UXFwwqftJKtWZPZtzEMczwFT8U9PUbjdp7sv4sVdRVb8+3MRAlGAYsgjgtm4eut/yU2TRbkYkT7nqmQYI8pXCj1fN+RYyQppNfKeXrUk2MaoJfZ1mcmTX+9X4ktJGdalJTKOdLLZLHE2RH9NFVVrCcRfwPS6lexnBdg6JDtado8SRPYZ+EsBhP8Ko6tc1Hzwm+3J5kAsNqe9qJh4EURmC0w40p7z4mrY6/6WICT6sAtVRXrjWEWUKd+W1895zwAgVv108C+mC74P7aq4xTc5ZUSK+xGKzkH2qTDIqeGDYBRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NVPmypwfmvhaRXceDyE89HUXkfqO2etr3BOBhCF0Fpc=;
 b=d6667iWnXqaw069M4gDO5qFxUja0bDzR9YydTEDcf3G/z2OPDoVaUygitXf8Z7QSfXiDrKrWa4+Ui+q+kdzCbeh41AADYGiFLIB+A0kaIxXJmHNvvwmHQO9bOvgxFztUr5IUjoOs0qj0mZhdcLlCVuGB0uYLdnPOxoLiE12k3WNN6GYOhgCg1UILCEl3MSMZOdW4qRm7976HZhlLsSlfcNdpvXGEvX7bTYIt+biQwZeAnNrnvoczQCFeHET3szE11jE2rDSyG1L/VtHtEKIYoHkLKq8ZiVLtD6RCdjLt93BHly6yXbqjrscvuq9LtEZTYQTEgchSURFQe1BfgwUaow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NVPmypwfmvhaRXceDyE89HUXkfqO2etr3BOBhCF0Fpc=;
 b=qquOjvdfZEvuGHOgjBJ2h4kbMLhOMd0JPyjdcbvVezLahnYwfagMwvmx4DwG2judYTNs5lSc4BnJqBu6455hBNkI7CiapKf8VarbGhxyDInN3m4rdARTnJI5yM5UV+sQ89lTnEOzbAxtZIwbu21L2dW3zq7XOzlzaDWrdJOMZw0GgIvQFzUIYsT1o5EbPh4KTWrDrZ+5WGJ8ZZyQ8W/uiqBOYu2/6kFnKM27kYBnAKuCvXZOQEQMJ3y88XioXc2DDhA0lAm6dNkxj8dn4t0QDSHHn4tUdUvFBoYuuldjnXDPaAoQrR0whXro1miJXPJ9lmUOBAIADN4RShG2vHXkbw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MA6PR04MB824352.eurprd04.prod.outlook.com (2603:10a6:250:50::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 14:30:58 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0451.022; Wed, 30 Sep 2026
 14:30:58 +0000
From: Frank.Li@oss.nxp.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Frank Li <Frank.Li@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: freescale: imx8mm-verdin: add gpio-line-name for CTRL_SLEEP_MOCI#
Date: Wed, 30 Sep 2026 10:30:50 -0400
Message-ID: <179077863418.520353.7820396796794402966.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260927110508.60922-1-francesco@dolcini.it>
References: <20260927110508.60922-1-francesco@dolcini.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH8P220CA0028.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:348::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MA6PR04MB824352:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e42204c-78b3-458d-d9e5-08df1eff71cc
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|7416014|376014|1800799024|19092799006|18002099003|22082099003|10067099003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	To6kf4OS4he3AApqNKYwkNmUVCBQP8JKQ3U2AYhrHYPIAjlbRHFyPu3ke1MEushzWIGHCSCabHaoC+glgZkq5izxiesiPlViA0fXipGKP8ZobBccZKiha61H+iVmof2zc4qH6vPKKjEP8MWwU7489oMkQmqFFjgrxxijOvl86dsy0LsVTD8mSJqCdSoImVmFVLKxKglhHjRJTIv9lUk7pVimpIsSDooqFvMXt5m1AppnG9Is1eDNLgx3NmW+abgILpU6AR3JCuWw0f/P8/HIcp/6PGvvkvxhA70pAkkgdZTxLX9DTYpe055S72RlreyznwrkXYYhY/a46pVtAP1DdeEVNebUaCXi4LmXRQXMe7GjGkachs/aZZ3teCuBVzoK9iY9PO7YFNRHwU99mHk4p7QPjbMUa747FyI+JlDWedrn8Nuc0a6rA1Hd+oYrkaPHn9baJC5++8f1D8SH1ssjCVI2I7HxUtpoIxQ0kC25UtDkpcHhM9Uw4/sl1zb+xMc5AExxGYmtqfJvlPlTkN5rcoMe8feJ0BOTgz36Muh2UNJiAdfH1C+hXPCUO29AyCi3WPCPCfskPIZFW/T8ebQDWqM4/SwPbK/Ic3aTrywSTiCtR5SraRyN17Gl2n84t6sZQ0Y/ZjLPkZW2WYCTMIM8rGwnzdhwCvCnhI9bte3bmMU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(7416014)(376014)(1800799024)(19092799006)(18002099003)(22082099003)(10067099003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?L0ZrTG84cUhkemdoUUx6SURxSXB5Y2dHMHJOMGw1a3UvRnRLYjZFNEI5Ryt0?=
 =?utf-8?B?TTVxUWFuamF4Z3ZwRnFsSERQWG9pTzJFZE5ESlZRQ21DZExVcSsvZnJ3Y3BV?=
 =?utf-8?B?YmY0WGZSUUpqTWJaT2lzN1dxWXU2NGNQc0RJSFRrcUFMb2dzcG01Z214MG5s?=
 =?utf-8?B?SDBvNlJ2VTlhY1hFMUhKNHBFSlF1a2hML1MzM3M4V3BpVE1CVFNJWmUzM2hP?=
 =?utf-8?B?bmVsY1k2TkVINDA0bC9ScXZ1TXlGNGtIMmlobGZnY3BlZnAzK0haQk1SNzlJ?=
 =?utf-8?B?QnVZbER2QXMvR3pSNVFTTjRwVWNnWDMwaFg0WVA4MTlhSWlWZUtycHJGRnVs?=
 =?utf-8?B?QU1TWEI2cnZYTjN3eFBsaWlPSzg5eFkrOEJRNXRETWdsNFEyVCtiVjFuUUUw?=
 =?utf-8?B?bkJ5YXNBaXpZSjBNNHdWSlVDVlZ1S0Z4bEFSWmlndDJJVElSdnhBc3cxMHdy?=
 =?utf-8?B?aXVXRGV1N1IrcnBDWStORjVGU044aEkxV2taeVlzUkh0Wlh1N2xQSGxuNHAw?=
 =?utf-8?B?YURkclA0aW9EYlBSSVpBaFlSaUphNmNaNEQxcE9kenVwNGZFcjVhRDVyMjhk?=
 =?utf-8?B?bXZXcVg1NkFNaUo5OUZtVkc4TjY5d3lNYS9BbE80ODRVbHJBZWpQM0VWWHBk?=
 =?utf-8?B?ZW5OQk5SL0JKeTIxcElRQUQzTEE1bTZ3NjEwUUZPcHpRdEhnblhtSDBMTHFl?=
 =?utf-8?B?SEFzODFXbStFbXl2OFRlMzAxc0E3WW0xemtzNUhIOWQ4ajY0aC9YbHdNbi9y?=
 =?utf-8?B?ams5cnZQU1NLVnFlZnNJUFF4alpKdDl6NTdabjVwSmZQeEV5dDkxWC9GVk1T?=
 =?utf-8?B?OTJqWjJWczNaNnU5WjQrNm1SMWh0M25BemtYSXZhV1l0MTRmY3Ixem1wc0tO?=
 =?utf-8?B?QlVWWjV0UXpwKzBxQlZFdm5IcmprcG9CSlJ0bUoreHlid0VyaDlyaE5EOTlL?=
 =?utf-8?B?aEc5QU5yZjdwakxqQStaM2VHOU5FMVBjaUNSNUNPUHN3dDc0WXh0S1VZaDBj?=
 =?utf-8?B?eFJKVjBMRnJjRk96QzFPYm1VR0t0TXlKb1JLRFpya1hiaEJlalVWL1N4cDAv?=
 =?utf-8?B?aVRpaVJ2bDJWRUIwOUpLVVNNMnNPWVlTYm12WGIxWkF0ZE41cUJ5d0kyaUVw?=
 =?utf-8?B?L2owSDdzQ1RPOGtmNjRMM1pEL3RHYjFlRFVLQ2RJM2V4QWNMSTZXTHQyOXpU?=
 =?utf-8?B?UTlCTEpzdUJCcHpYN3FLdlJEU1AvczVYbzdQK3p1NGh2V0ZtTUhaWGRzclY0?=
 =?utf-8?B?UHZEdURlZTNzeHc4TXJ5UGVaRlRIN1AreGd3VWNxWk5lYTBpSEtGQmRYa3E4?=
 =?utf-8?B?YWZyUzFMUEN0UWxKSmp6RjFYTm9uaWRqQmlkOFdleGRWUTNvQUgvWHlpL0ZR?=
 =?utf-8?B?eERUblR0ZTdsRi8xSjFMUE9LUFJWQ1JDY0NYSjMvRnNDSmFaQWlBQ2R6NkFv?=
 =?utf-8?B?cDdldnVMTkZxUGV5cEl1dVU1Y2ZBVk1MMy9MR056MFc3MGRtc3Z3enMzazBo?=
 =?utf-8?B?SUZzRkljMnBETEtBbCtOUHRTblpubGk3WDBib0E3SnZXaE5HY2JSOVdSTU56?=
 =?utf-8?B?dHY5TWpXOS94b3M2WFg2UkxSL3hTRlpyb1dZd2xoQ2tkbFRJNjM5SXZPNkR0?=
 =?utf-8?B?VUt0RlpDSkVJeTRtQVpjaU9od0pJb0t4MEhqdHU5bC9wVDh5TElsNjljSkN6?=
 =?utf-8?B?bDNvMzRoWE1TVDVjZU5ENWNGaW5mekpITDlMQkhQRm5LK1JXQ25qM015YnBW?=
 =?utf-8?B?ODFvRFFqUjZTK2NGdlVkc2VRclpibmRvOVRWR1NvVHVkSEE2VFl0ODRDamJu?=
 =?utf-8?B?emV3NDJqVE53VXlaUExwSFQrWUQ5d0VtSmZUaVNrZHV3NzRzS0Ixa2phSDJU?=
 =?utf-8?B?aE0xQ2RDQm1IK0Q5ejJicHZwbTl4emZydnNJbndOVGNjcE5kSUN3akNFZUVE?=
 =?utf-8?B?UGhVS3F3TWJvamZMRTJNMnJuL21xZ2FJY1ZXN2xrekkvYnloTTdZRGpoY2xU?=
 =?utf-8?B?UXdoWE5CV01FWWpTdE50OUlWdTBuZ1RuampqOXpBMXA3VHZ5SEJncjh4c3h5?=
 =?utf-8?B?Nk83a0R0N1ArS0xIZDRkQWxIQzU2MFRLOXlCclpZaTBQdlo2V2Z4Y3RQRW1P?=
 =?utf-8?B?VHBzWFQvN0ZRaGErVXhPNXB6b2t4VHZKMkd1dHBhU1c2OXFaWUhrSjBNOTRB?=
 =?utf-8?B?S01VWVRmZE94QUJ0dVdHUFJsTThhS2FIY0Uxajl3MHBwLzU1czFJSEFSZ2pr?=
 =?utf-8?B?cXcydWNTdkwyZHpReGYyNHRGRlFMTUszYnJPV1RkN3I3NmQwRDNoemZWYmpW?=
 =?utf-8?B?VGYweFc2RVgwK3U2VXp4V0x0eWc3ZEtERm9sWXN1cWQvUXJLVmF1T093YmF0?=
 =?utf-8?Q?ebfgowiTzNBlsvgwVMuhtwfP4DrtqE9TaLc98?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e42204c-78b3-458d-d9e5-08df1eff71cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 14:30:58.7053
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hDONxr8vQgYFHR1m4PgAJkBpgsLxsE02onCoOMENJrIkeQKhCbqkDJsAsOyGNZ/JNdd2yPpZgaFK/F232BAtOjfR1ccyffZaGdDcMN+g7vZ6616phlgAquq526nttOCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA6PR04MB824352

From: Frank Li <Frank.Li@nxp.com>


On Sun, 27 Sep 2026 13:05:07 +0200, Francesco Dolcini wrote:
> Verdin CTRL_SLEEP_MOCI# (SODIMM 256, GPIO5_IO1) is the only SODIMM signal
> of the module without a gpio-line-names entry. Verdin iMX8M Plus, AM62,
> AM62P and iMX95 all label it SODIMM_256, do the same here.

Applied, thanks!

[1/1] arm64: dts: freescale: imx8mm-verdin: add gpio-line-name for CTRL_SLEEP_MOCI#
      commit: e7a7fb1dc235053369094c3f8afdf67fefd67983

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>
