Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.28
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792460750;
	b=VqA9S0w31xrxMrBeBjxku08fkJOcSGT9tcnhCZAvzseCmhiRqGknnp0TLhl6FXTAAZaV
	 Ilxgl4xXvImrJ6Ly6ewY/BNCMWr3uknbnKiZty/ksfzy8IfT9+DZu9eMMv+D9C4557T4a
	 zqPCc3rz1jyXAO0mGrL77oBotz6+MIRfu0YrhxIOVSoC67DSWFu+58eabULnq/iIlaACo
	 j1mjD/++d8+D/p1ZAFodlq7MHUrgXlajg2Pg7TvFfhp87BNxZnSq2Zyskj8RNzQ/xbPDU
	 Gg5zK21uOY6gwneYMqe+VcaZvGGGzsh/+g5wNWNSQkLpGf1AYNHkEYsHw1vqUzzfufQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792460750;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=wWJgLl899/e4WLkbeKxoGIPcz8yvTnQ4udN5+v69aeo=;
	b=0Pm+jM3EuStClLyi33GXhQidyrVR/lSGYeSUiJdSid7yHOHETkmY6WzIVKrcJ5zD47Vk
	 Um7QWSWrumJxO3kKs8o9KkaqIzfEf42+ZSorxw19gBrntswZ9Ss8IlUdLnbX7PfOoeARj
	 ZlA3RVrLeh7QoC8i6e6RCZlqNEFxnrNjqEYKzvrrR4/z7u3BtgYNSc+nuvozF9dup0swT
	 vX1q7pwCF57Z/t+aLFiXS9TbdOUue01enuxu2VFV8sOJVw/9lTkSmNSbQkFOnadbbFfug
	 scMqWSdEHo+hOZon1EU4B7+l+2eS/QrXELE4X5ZryWBW/Uij0h0uGBukVcuHRmRX+VQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nxp.com;
	spf=pass smtp.mailfrom=nxp.com;
	dkim=pass header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fUuUWP6n;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.28
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013028.outbound.protection.outlook.com [40.107.162.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4F2606A319;
	Tue, 20 Oct 2026 01:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4F2606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=fUuUWP6n
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S9YYXD09Xfy/yPyYnoY8tKAhNXLL7/fV5XvLoz9+YRUuqhODqSv07Xr3V49DEI5fozqM+NOe620Lzrfo5GAJEhsOr3nqcJpbm8dw0hsqb675CPWRWuLHzWGCeU+NT4MoPnISDYo+3TcCjvSlcdb9/WYcWaF65t9kvLnLe5ZoF/6K/kIOcKOwnRcluV+Cb9qL1IEzT1PXe6fQNwN+CzAfwSelJTLqzuOK485VWho3fAmRBO9MYZaIq1XUgjG4mHXKYm6wYpenEXpGSLcBTi3HGSdbLnt7TOupUvYOOq48hsiTQF7d6pXauOXd3CWRj+4zlmkd9E7WVJ3GHZQ8Q7S+Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wWJgLl899/e4WLkbeKxoGIPcz8yvTnQ4udN5+v69aeo=;
 b=nENQU26EeqLaXkHfC7QlK5lDQD29doJ7C1sbLoCOUbkakAFkpUqFCeQzbHscGjc7Q0YSFRFY2yB/MVU+6VsHgb9pxqP9HJIG3/dJ80ZbyWkv1GBxenfyIx0mw7iSGWD9rpJPRZIbY5TECM7NoPVHh4OnafstGBF6UbnaiSKk3Uj5sgBKqqfLVweL5+vDtepiJWwLoMFliYfpCUyzBV8UJcnA8R465Jkxz0cJof1slUCLbezvln3aC9KqDNdEguMnMqTIFn3jC846JtDo0tb7hH4M3YAHduyKHe/N7x3VzOg9+HrT5eMcdFPK1nNfd55VA35RWpTk2GjybyQvqTQLMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wWJgLl899/e4WLkbeKxoGIPcz8yvTnQ4udN5+v69aeo=;
 b=fUuUWP6nkxeo5SZuGtOD3j81XjqeHpYqymwZvDb5xvJpwnQWCQHKsdFePEd/kFNRZQemHlW7Cuun3b/e0mfzWb4sKBPR8OeDYDABwRedh/fZ4pX3TQ8DZz0QXvChixWiuIghKCp1Rie/e/afSaBYdHajZGEUudSiTzzeludF6zLEE5/NkbXlps1Uh/O+tkPRHtMpMkK/M81g26bLEjuUcHF9hPRwOqS8TVeyMtOCJ69j78zL/3qfXf+TikhPSS+fWd4rQXrut63NQm/zQToZjU/zDnK1fajw7h7zYMmlEb4JMS/25Hp4wNB2HQf/F5Z9pWDei4mH/M6uBu/v9LjWcg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com (2603:10a6:290:c0::7)
 by GV1PR04MB10396.eurprd04.prod.outlook.com (2603:10a6:150:1c5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Tue, 20 Oct
 2026 01:45:43 +0000
Received: from MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151]) by MI9PR04MB350878.eurprd04.prod.outlook.com
 ([fe80::8537:1cdd:6c49:6151%6]) with mapi id 15.21.0522.017; Tue, 20 Oct 2026
 01:45:43 +0000
Message-ID: <7e41bccb-4ab4-48a0-8cc8-26995c5ce2ba@nxp.com>
Date: Tue, 20 Oct 2026 09:47:21 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] arm64: dts: imx8qxp: Add display controller
 subsystem
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux@ew.tq-group.com
References: <20261014071657.118378-1-alexander.stein@ew.tq-group.com>
 <20261014071657.118378-3-alexander.stein@ew.tq-group.com>
 <atBLglf0gSLS7XkW@raspi> <7640235.DvuYhMxLoT@steina-w>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <7640235.DvuYhMxLoT@steina-w>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0074.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b3::8) To MI9PR04MB350878.eurprd04.prod.outlook.com
 (2603:10a6:290:c0::7)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI9PR04MB350878:EE_|GV1PR04MB10396:EE_
X-MS-Office365-Filtering-Correlation-Id: bba9818d-6c62-46ee-b0ad-08df2e4bda52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|19092799006|23010399003|1800799024|261009223027099003|10067099003|56012099006|22082099003|18002099003|4143699003|11063799006;
X-Microsoft-Antispam-Message-Info:
	1kOwkLePh7lAJwEV61dk89xyti4jbnlHm0rwRPet4G5dTNv+VvgFbQ1ZCMCtGSKAld+j1yBQ0EdQhToLgrdxWkefDQHmTZVhKo3BSkIJ76imEaVVNbKg6dwjwgoil0nTWhsQKDrop8aBh0SOYoUsisv24bg3ELhX8kM6IltsaD+r9xxyYEPdbldTWSmheR1lKgnfVIinpMfJ+KhV5yuZhsbzVfYNuwIr4MaI8VfLkhHaWjesM/MEopQsnm/O9hn31rPh5jTh04HifyBnxrqa3m+N0nKHcnb8cdq1KReTYWerlBrocPTzTW2dDTC81ODDM3KVI5pygD1xETPDsqOR+lproQ24VRNfZoirpBdjR0Z8JFhNmIVaiVCgGEYiI0OrEdralSCj74n26+NcyRkFatEBXi782xj9R5OSOxRii7mCb5fO0qfu/APJTad3iHvcU2hMXiF072mJuShj9ywybPGr1veCqbbaDbtg2ED20BGAhGy/mhbsqDweh8qt8pP1eZcN0GIWLimwmgY5tVp4HeHU54t1m9/9yRGMW/LTCzVNLDe6o7LNRRZ6oGzOqlMHixEx7ip8toWMK9DCRvwGjLr9UMFrPFd33iwMUSPVzQZZX9Gbwca3KqU3AVomKxILGYruM17wZ2LwNRRqOcQhmS6KhMu0yeni7mGzqPALrfY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI9PR04MB350878.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(23010399003)(1800799024)(261009223027099003)(10067099003)(56012099006)(22082099003)(18002099003)(4143699003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aDF0dTJYcFNjQWw5RGlHUDFDWklzS0ZDdWlFMFJsNVEwUFJDZHJoM2xVT2k2?=
 =?utf-8?B?NjNObnhwNHJFamZUckxuQ2VobXRBQzFlNmNZdjFCY3hNbU10N2Z5QXRSMHRL?=
 =?utf-8?B?Yk9jNVFNaEdsbGFsL3R3ZVEzU2w3dTFaa1lldnllcjA4MkhHT0xnakkzSkNy?=
 =?utf-8?B?eDhiMnkrZFpXVlBMZVNmVTV0SUo0VTU1QlVtem9wWS9ZV1pTY3ZnWlIrdlhp?=
 =?utf-8?B?S3F1QWtQSlBHZDBRZGoyQ2tPdnhyekdEK1hQejNYS2xPUzRmVnJ1WERzVDdH?=
 =?utf-8?B?bHlDdjZwbzQ1TUJML3hlZUFvSHJFVGo2dGIxTFZ1VkllbWkwaUF1b1RuNkJh?=
 =?utf-8?B?Z0hJVHNnSjIyemlPeWJOSnB3WDE1cXd2azF1QWhOYlZGRG5reFlqS3lCV0w4?=
 =?utf-8?B?eVp1akFBamRMWVFnMFE3S2UramkzZERMOXZIRnljM1ZFV25RUEZERXBHbU5Q?=
 =?utf-8?B?M1hLZEhKd2FGQXNaa0l2REZqRlFWRXBsTTJ3UW51Wk01VTNNWnhqMzJIYXQy?=
 =?utf-8?B?TWJHQnRlVGZrUU10eFk5WUJpK1ppVWFkTk9GL0hUZUhWQ3U2U1hzb3NldWRK?=
 =?utf-8?B?ZTIrUUFsWkprcVJjS3FpSzRWRGI5SEc1dkd5N0gyMFdUc00vMFNneTZZSTdF?=
 =?utf-8?B?dVR6YXNSenhscjRYVGl3d0ZrR0lYVHRQdXNNUGJCVVlDTE5hOGcwcHhDbEp0?=
 =?utf-8?B?T2QzMVRwY3BSSHRRUTVpWDlVZHluSGxDWER2My95NDArb1VqNzVmaFBuKzlI?=
 =?utf-8?B?SmRPM1R5NXdVSjhQVlpSOExaR3gyRGtSL1lVR0ZIKy84OWdIOHNXNkZoZGdi?=
 =?utf-8?B?b3B2b1MxQVR6b2IvaHhJYTZGQzFFSTVjMWhxVnlBeWhFNVVBRlh0c1NkdXVw?=
 =?utf-8?B?d2RBeVZKZ09vMThicmdRUlJLR2ZxNnhKeVdkNWJCNnZKV1BMdmVqazFsRGEw?=
 =?utf-8?B?QUsxY1RZRGh1SG5tS0I3OWxjNmVUSWVxK09ZY1NqZkpPZHdXZFVZNFZ2bjhZ?=
 =?utf-8?B?eENhRkZvTGVOV1hLVVE3QURaMzhwbTBsamh6T1VWUmNiYndKZi9TRGpQMnNo?=
 =?utf-8?B?bUFvMlNjaEJNRjBiTE9JaUExRHFIeEM3VGtXdjJHQ0pLbjBDTTlXbjl6NitY?=
 =?utf-8?B?NUJoMWppTVNqTjU0a1FZRlh2R0dRcTVvL2x3ZG1HUGdYZnRabnhPRXplWGJy?=
 =?utf-8?B?ZCsyMWY0SnN0WTc0bG5tSFFSYy90bTNCMGZaa3NXRjdySGo1Q3dVNVpkQTFW?=
 =?utf-8?B?T2JHT0RoSUZEaXp5TzBETUtxZ29QdEoyUDRIT0dBclNmM0VyQ2k0Vm1ZdGNB?=
 =?utf-8?B?Mk5xeTQxRWFnMHlocFpBM3JCS1FQWENNc0xjdlltd0FUQ2lpejRhQkpsa2JR?=
 =?utf-8?B?ZDRyc0ZyeFd1aW5ldSt2TGRBaldGYkNUN01abDdmR3hKNFpyU0VlNUFHNGVj?=
 =?utf-8?B?cGpQaEdTOWYvS3lJYWNRRkpaRkljZWJ3VkZSaWNUVkdBV1ZMdTV3ZXFhSS9W?=
 =?utf-8?B?MjJMRisybmoxcDErRnFhNzg3cGNMUFJCVVNralE5VHdpTWRwMlRYZURqcFVv?=
 =?utf-8?B?WkV5NDExRVFmUnhvbHF3QTh6bW5JRFJicVJpUnZhMklFeWxjMFVPa3ExY1Nr?=
 =?utf-8?B?TWd1d2F3L3lPd1NpOEJTT09BaWIybGM2OVpTR2Y1WjZCeHVPZnpmYkRQV09U?=
 =?utf-8?B?ZDlzRzVlczY1WmlLZ0FJbUFEbGhuZlViQ2gySkxzS3JaUGNhYUFxNFRuMEhY?=
 =?utf-8?B?Nlh4M1M4d1d4NkM2dUZQSTNWc0xDeExYS2twRC9hWjhXTWJnYnJhbVMyK0dx?=
 =?utf-8?B?cTdjbmd3aENaSUlvMm4xK0NFaGhpZ3pEVzBsbzh5VkllYy9qNUMzVmZYMXhI?=
 =?utf-8?B?bW5aWlVtdGNCamt4S0V2STB6VFh5bkdnYkRrK3JGM1gwU2ppSk8ydnJzQkgx?=
 =?utf-8?B?Lzd3RzhMb0NaTkFVazRlRURURkdOSFZueDk3SVp1QUE3Rit1SnUzbUVEMnVI?=
 =?utf-8?B?bUhidTA4N0o2dFlOdVlxZmhKRkpIRlBzZjZ4cTRjWFRKWkVER1ZoWWlIODZW?=
 =?utf-8?B?SEdOTXFHUnVSVGxOSjVQRjJUYWFnTWp3dklxN1ZYQ1puUVQ3alY0TzZIQytO?=
 =?utf-8?B?VTlrek5pRm51UDBlUFFzNUxEbmVwaWhDdlpJalZuWUlmbXo4RSs3QTBuVmFJ?=
 =?utf-8?B?VzY2VXpMUWF4Y2JvVndCeWd2Y3VKeEtYTm5nTUpIYk5UdnEva3l2NUpiMVV1?=
 =?utf-8?B?TjJXRkQycklkZHV2d2pKU3FKTVJhcTdsMEJNU0FjWnhXM3d2aGEzcFAwcll0?=
 =?utf-8?B?dTY2RVNRb2MrZHBiSG9FMVhySkZHVDJEYXMxalg1OHRLNko1Q2hhQT09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bba9818d-6c62-46ee-b0ad-08df2e4bda52
X-MS-Exchange-CrossTenant-AuthSource: MI9PR04MB350878.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 01:45:43.0935
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qf3jM+U15g9p4lUBC01+kK4vjwefBBa7LvFA6CVx8QzPfnlPcxroRv7Q83jDMlLYA+Cs1h9KQw8nJCiKSYVZHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10396

On Fri, Oct 16, 2026 at 02:46:47PM +0200, Alexander Stein wrote:
> Hi,

Hi Alexander,

> 
> Am Donnerstag, 15. Oktober 2026, 05:41:54 Mitteleuropäische Sommerzeit schrieb Liu Ying:
>> Hi Alexander,
>>
>> On Wed, Oct 14, 2026 at 09:16:46AM +0200, Alexander Stein wrote:
>>
>> [...]
>>
>>> +	dc0: display-controller@56180000 {
>>> +		reg = <0x56180000 0x40000>;
>>> +		clocks = <&dc0_lpcg IMX_LPCG_CLK_4>;
>>> +		power-domains = <&pd IMX_SC_R_DC_0>;
>>> +		#address-cells = <1>;
>>> +		#size-cells = <1>;
>>> +		ranges;
>>> +		status = "disabled";
>>> +
>>> +		dc0_intc: interrupt-controller@56180040 {
>>> +			reg = <0x56180040 0x60>;
>>> +			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
>>> +			interrupt-controller;
>>> +			interrupt-parent = <&dc0_irqsteer>;
>>> +			#interrupt-cells = <1>;
>>> +			interrupts = <448>, <449>, <450>,  <64>,
>>> +				      <65>,  <66>,  <67>,  <68>,
>>> +				      <69>,  <70>, <193>, <194>,
>>> +				     <195>, <196>, <197>,  <72>,
>>> +				      <73>,  <74>,  <75>,  <76>,
>>> +				      <77>,  <78>,  <79>,  <80>,
>>> +				      <81>, <199>, <200>, <201>,
>>> +				     <202>, <203>, <204>, <205>,
>>> +				     <206>, <207>, <208>,   <5>,
>>> +				       <0>,   <1>,   <2>,   <3>,
>>> +				       <4>,  <82>,  <83>,  <84>,
>>> +				      <85>, <209>, <210>, <211>,
>>> +				     <212>;
>>> +			interrupt-names = "store9_shdload",
>>> +					  "store9_framecomplete",
>>> +					  "store9_seqcomplete",
>>> +					  "extdst0_shdload",
>>> +					  "extdst0_framecomplete",
>>> +					  "extdst0_seqcomplete",
>>> +					  "extdst4_shdload",
>>> +					  "extdst4_framecomplete",
>>> +					  "extdst4_seqcomplete",
>>> +					  "extdst1_shdload",
>>> +					  "extdst1_framecomplete",
>>> +					  "extdst1_seqcomplete",
>>> +					  "extdst5_shdload",
>>> +					  "extdst5_framecomplete",
>>> +					  "extdst5_seqcomplete",
>>> +					  "disengcfg_shdload0",
>>> +					  "disengcfg_framecomplete0",
>>> +					  "disengcfg_seqcomplete0",
>>> +					  "framegen0_int0",
>>> +					  "framegen0_int1",
>>> +					  "framegen0_int2",
>>> +					  "framegen0_int3",
>>> +					  "sig0_shdload",
>>> +					  "sig0_valid",
>>> +					  "sig0_error",
>>> +					  "disengcfg_shdload1",
>>> +					  "disengcfg_framecomplete1",
>>> +					  "disengcfg_seqcomplete1",
>>> +					  "framegen1_int0",
>>> +					  "framegen1_int1",
>>> +					  "framegen1_int2",
>>> +					  "framegen1_int3",
>>> +					  "sig1_shdload",
>>> +					  "sig1_valid",
>>> +					  "sig1_error",
>>> +					  "reserved",
>>> +					  "cmdseq_error",
>>> +					  "comctrl_sw0",
>>> +					  "comctrl_sw1",
>>> +					  "comctrl_sw2",
>>> +					  "comctrl_sw3",
>>> +					  "framegen0_primsync_on",
>>> +					  "framegen0_primsync_off",
>>> +					  "framegen0_secsync_on",
>>> +					  "framegen0_secsync_off",
>>> +					  "framegen1_primsync_on",
>>> +					  "framegen1_primsync_off",
>>> +					  "framegen1_secsync_on",
>>> +					  "framegen1_secsync_off";
>>> +		};
>>> +
>>> +		dc0_pixel_engine: pixel-engine@56180800 {
>>> +			reg = <0x56180800 0xac00>;
>>> +			clocks = <&dc0_lpcg IMX_LPCG_CLK_5>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			ranges;
>>> +
>>> +			dc0_constframe0: constframe@56180960 {
>>> +				reg = <0x56180960 0xc>, <0x56184400 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_extdst0: extdst@56180980 {
>>> +				reg = <0x56180980 0x1c>, <0x56184800 0x28>;
>>> +				reg-names = "pec", "cfg";
>>> +				interrupt-parent = <&dc0_intc>;
>>> +				interrupts = <3>, <4>, <5>;
>>> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>> +			};
>>> +
>>> +			dc0_constframe4: constframe@561809a0 {
>>> +				reg = <0x561809a0 0xc>, <0x56184c00 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_extdst4: extdst@561809c0 {
>>> +				reg = <0x561809c0 0x1c>, <0x56185000 0x28>;
>>> +				reg-names = "pec", "cfg";
>>> +				interrupt-parent = <&dc0_intc>;
>>> +				interrupts = <6>, <7>, <8>;
>>> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>> +			};
>>> +
>>> +			dc0_constframe1: constframe@561809e0 {
>>> +				reg = <0x561809e0 0xc>, <0x56185400 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_extdst1: extdst@56180a00 {
>>> +				reg = <0x56180a00 0x1c>, <0x56185800 0x28>;
>>> +				reg-names = "pec", "cfg";
>>> +				interrupt-parent = <&dc0_intc>;
>>> +				interrupts = <9>, <10>, <11>;
>>> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>> +			};
>>> +
>>> +			dc0_constframe5: constframe@56180a20 {
>>> +				reg = <0x56180a20 0xc>, <0x56185c00 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_extdst5: extdst@56180a40 {
>>> +				reg = <0x56180a40 0x1c>, <0x56186000 0x28>;
>>> +				reg-names = "pec", "cfg";
>>> +				interrupt-parent = <&dc0_intc>;
>>> +				interrupts = <12>, <13>, <14>;
>>> +				interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>> +			};
>>> +
>>> +			dc0_fetchwarp2: fetchwarp@56180a60 {
>>> +				reg = <0x56180a60 0x10>, <0x56186400 0x190>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_fetchlayer0: fetchlayer@56180ac0 {
>>> +				reg = <0x56180ac0 0xc>, <0x56188400 0x404>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_layerblend0: layerblend@56180ba0 {
>>> +				reg = <0x56180ba0 0x10>, <0x5618a400 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_layerblend1: layerblend@56180bc0 {
>>> +				reg = <0x56180bc0 0x10>, <0x5618a800 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_layerblend2: layerblend@56180be0 {
>>> +				reg = <0x56180be0 0x10>, <0x5618ac00 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +
>>> +			dc0_layerblend3: layerblend@56180c00 {
>>> +				reg = <0x56180c00 0x10>, <0x5618b000 0x20>;
>>> +				reg-names = "pec", "cfg";
>>> +			};
>>> +		};
>>> +
>>> +		dc0_display_engine0: display-engine@5618b400 {
>>> +			reg = <0x5618b400 0x14>, <0x5618b800 0x1c00>;
>>> +			reg-names = "top", "cfg";
>>> +			interrupt-parent = <&dc0_intc>;
>>> +			interrupts = <15>, <16>, <17>;
>>> +			interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>> +			power-domains = <&pd IMX_SC_R_DC_0_PLL_0>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			ranges;
>>> +
>>> +			dc0_framegen0: framegen@5618b800 {
>>> +				reg = <0x5618b800 0x98>;
>>> +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_0>;
>>> +				interrupt-parent = <&dc0_intc>;
>>> +				interrupts = <18>, <19>, <20>, <21>,
>>> +					     <41>, <42>, <43>, <44>;
>>> +				interrupt-names = "int0", "int1", "int2", "int3",
>>> +						  "primsync_on", "primsync_off",
>>> +						  "secsync_on", "secsync_off";
>>> +			};
>>> +
>>> +			dc0_tcon0: tcon@5618c800 {
>>> +				reg = <0x5618c800 0x588>;
>>> +
>>> +				port {
>>> +					dc0_disp0_dc0_pixel_combiner_ch0: endpoint {
>>> +						remote-endpoint = <&dc0_pixel_combiner_ch0_dc0_disp0>;
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +
>>> +		dc0_display_engine1: display-engine@5618b420 {
>>> +			reg = <0x5618b420 0x14>, <0x5618d400 0x1c00>;
>>> +			reg-names = "top", "cfg";
>>> +			interrupt-parent = <&dc0_intc>;
>>> +			interrupts = <25>, <26>, <27>;
>>> +			interrupt-names = "shdload", "framecomplete", "seqcomplete";
>>> +			power-domains = <&pd IMX_SC_R_DC_0_PLL_1>;
>>> +			#address-cells = <1>;
>>> +			#size-cells = <1>;
>>> +			ranges;
>>> +
>>> +			dc0_framegen1: framegen@5618d400 {
>>> +				reg = <0x5618d400 0x98>;
>>> +				clocks = <&dc0_disp_lpcg IMX_LPCG_CLK_1>;
>>> +				interrupt-parent = <&dc0_intc>;
>>> +				interrupts = <28>, <29>, <30>, <31>,
>>> +					     <45>, <46>, <47>, <48>;
>>> +				interrupt-names = "int0", "int1", "int2", "int3",
>>> +						  "primsync_on", "primsync_off",
>>> +						  "secsync_on", "secsync_off";
>>> +			};
>>> +
>>> +			dc0_tcon1: tcon@5618e400 {
>>> +				reg = <0x5618e400 0x588>;
>>> +
>>> +				port {
>>> +					dc0_disp1_dc0_pixel_combiner_ch1: endpoint {
>>> +						remote-endpoint = <&dc0_pixel_combiner_ch1_dc0_disp1>;
>>> +					};
>>> +				};
>>> +			};
>>> +		};
>>> +	};
>>
>> I'm thinking that it would be good to have a complete display controller
>> DT node in the first place, including those prefetch engines attached to
>> fetchunits through the fsl,prg property.  In this way, display controller
>> driver's life would be easier - all child/grandchild devices are always
>> available.  I'm considering to adding a check to the Linux display controller
>> driver to ensure the availability(at least for critical child/grandchild
>> devices).
> 
> Well, this sounds reasonable, but this is beyond my knowledge about the
> internals of the display controller.
> FWIW it works (at least in my case), any additional DT node could be added
> later on.

If someone says that new kernel must support old device tree, then the display
driver's life would be not be easy.

> If there is something to test/review feel free to send it onto the
> list. Please keep me on CC.

I can try to CC you, but in case I forget to do so, the proper way for you
is to get any patch in question by yourself - lei + mutt is a typical solution.

> 
> Thanks and best regards
> Alexander

-- 
Regards,
Liu Ying
