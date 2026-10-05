Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11023108.outbound.protection.outlook.com [40.107.159.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B3D480DED;
	Mon,  5 Oct 2026 14:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791210548; cv=fail; b=SGSFulGXGUBUzWzI2iI06Aob4xM0DG9YScSzO1M/RD3ETB6J+RH3OoIZGzMIKE9PQDGtfBiloCKGkxpdxIZse89DIaholfefiQUUeSVs7R4yfjzraKtwPJGGqjI0sMSPn8+JvUqb/OMSJkRPOG0iKZCzIubPDh35JSdXxZYs70U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791210548; c=relaxed/simple;
	bh=a+cIDmyKaaZwZuvxPX8mAYTwwqtQccnZ/A3pN351Vr8=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=RxRvOui0YehBMJARuYDbi3T8Y958uru0v61m3RQGNpSvc8h5lfUA1q7rJJV0AYkHZDzcCV/NldUMUd1ApXkhfGaZt7PGgCcXGGMR0cq1trIeTA/8TG5zxjCEhRr3Cohu97AlB1ABS3usm0CPYK4kH/LiGFYzkttExysKkriE+vk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de; spf=pass smtp.mailfrom=kontron.de; dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b=Ya3aFRsj; arc=fail smtp.client-ip=40.107.159.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kontron.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kontron.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kontron.de header.i=@kontron.de header.b="Ya3aFRsj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oGGkPVnlyQzUMt3AQ1F/u9kQWHj0QFjsgoHdkxzp/ILKbMo1z2lxrjdJ6K1e/K7CnIxAwq6kDxh+GoQ8V2fLvlPrJO1KJVyxlCzCF2X44PI4HAjks1VfHlp2jr51Lve8k0V/3XMsY4kgoUcp/BN0adYQDhxcCKrvjKFuousMFTo+WyEckan68kYdt7clnpSf12xV7COPSjUswrrix7ulDWD5odQSQzCzpW+JxHX8aDMYv/45xfiB06FAY6yfqcQSR5TogLhq1+OJrEOBaXnAAqcBHSF5IywWCVC9aH9k56GAfwnIrVFx8LIMVfumkDgbfmz9drW7gaQSEVubH2mQMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Id+RQgfgxoLWq+XkEIF0BuoZvG/WH/YkWvYsbTcUJCg=;
 b=CZ8Jd30Zh4/3MFaNu/pREvL7tf6kziTy/9Z22sqkyAh7j0TOSTFL1czkI7Jpwgk4HUdRYgCCmsR4Dw0qoToCRQ9ijF8WJcACsagPk8QWMIoHDw9VT2iioavVNPCoe+dUxJ5ErbHPBjintbNG3ox+yU72kqluEdQB+oc+ockj2cxVe1PIamEjVg/4EtYRiWm8AmMGlU3Ym+fY8Z8oYVK/J1YBpJQnwif7a6tq9faxbUmLr9WCF2DNk6jdhLK66qiRo0UZcsvHxu0XFjK6RGEwX1lTzXvs6HgcXGJv1GAm0ffjlX/4DDE34rGAn0e8P62tabFA1j/6BiC5cYde8GVT4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=kontron.de; dmarc=pass action=none header.from=kontron.de;
 dkim=pass header.d=kontron.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kontron.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Id+RQgfgxoLWq+XkEIF0BuoZvG/WH/YkWvYsbTcUJCg=;
 b=Ya3aFRsj2QIMVrnkAnx/6echOzXaaUfIWFduNQO+xZAmOhyxRSyJX5SKVbwlNM1pH7s88kewLixQ/GkTlh1QJSWHfELN01WvoYbTspqVPV+DIhktCWk02mxe/im6yjsrGBQ2bIpGW7mu68LLNgKDroqwzQUXAF7Z0bHs6gz2eB1cD350dKckr9oLRGX7uAaq7Qd04ZLiITmUC8KDA4h2qgctFklfsinccwc41Neujh0L5/gjx+vaXP2V4pnWuBn1FtfeYrZ4Hl3oRyxxDEJZ/JAz+izFOh9I0htwvdOJCbjmWSRj7garwCGXSmrc5DlvIFRgoTrTCIrMMdHU5vSU4Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=kontron.de;
Received: from PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:97::22)
 by DB5PR10MB7795.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:4a1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Mon, 5 Oct
 2026 14:28:43 +0000
Received: from PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6aec:a389:7814:860f]) by PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6aec:a389:7814:860f%4]) with mapi id 15.21.0472.015; Mon, 5 Oct 2026
 14:28:43 +0000
Message-ID: <f3e1e3de-6abf-48cb-aba7-7b231c38ec5c@kontron.de>
Date: Mon, 5 Oct 2026 16:28:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v51 5/7] firmware: imx: adds miscdev
To: Frank Li <Frank.li@oss.nxp.com>, Arnd Bergmann <arnd@arndb.de>
Cc: pankaj.gupta@oss.nxp.com, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>,
 Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260915-imx-se-if-v51-0-4a7dac612cb5@nxp.com>
 <20260915-imx-se-if-v51-5-4a7dac612cb5@nxp.com>
 <2034fb2f-f169-46a5-85e8-fa723ddb0360@app.fastmail.com>
 <aqqqDnOMmlfqit6u@SMW015318>
Content-Language: en-US, de-DE
From: Frieder Schrempf <frieder.schrempf@kontron.de>
In-Reply-To: <aqqqDnOMmlfqit6u@SMW015318>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0376.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::19) To PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:97::22)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR10MB4288:EE_|DB5PR10MB7795:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f3ee888-4a64-468a-a21f-08df22ecf57d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|23010399003|1800799024|366016|10067099003|56012099006|4143699003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Ozb49VMc51lNNO4iGAdvOZPCSZXJ6InD9s8HCGk2L3DFvqxsdBKRPSp2RvokAYHlcxMxUnYEPf/fqUvuFK8kQowlPnjtqMNKEVuxalEmWnsg35Vah0zUBPFjbBcMQYuThoAfsGaGsUK+XDeHfib/9TPnQYhPc/Ego/Du5GVC6XsLupxC6WsEMRa2wthZeuv293xi379lBLpkdOpv3Vd6neAGwCk6tD/E2Fnv+D1PChzCiU0C1cceVmlBpL8/5H6cjEZ3AC3qmKB2ct3LJlRS7XI2eFyO8SEFsZbAwqSPXxL17jGGNmGfQ+hSeWrFuurk50L9SUQFbsaeJiSigDR1l+zBtiRI8E/6qWq25yyMx7cAQpBoJ29VdLJXVB+tDJpeb0Y6oll9J8E4rZ9G0K990bPc3lV9Q9xgEoaIN8rfg8UkNsgrk1SYvJLrHikLjcGh2vuK9E+Y9AgBkjy2drOe/wHSuXJE/wC53WAWmUIbSE8A1l5ERyBgZ+NuKwuhUtFCgkqF0Rfs+Nplu5Wthm39SwUwOMBvWBJFEK3DbcpyrcuzZ1HNFiNcG9TU55NW4OmCT01gmkmSxqlZHBaI4c21fryO7tarYvPO5H4+B1vKC1b5lRkqlTPEC3BkoKI2K3fUonm3zsrAPo7oIXRCSoNElkg+x5rJJNbF1nlZYORnBNE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(1800799024)(366016)(10067099003)(56012099006)(4143699003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K0lFVVdBVFA3ODArMlIyeG1xSlE2cmU2SVp6VkZHTnZIY2RmNG1IZVRjMEY5?=
 =?utf-8?B?VThWY2hmYVROeG45NEgxSlBYQWttSEl3dllhK0tWb1l6Q1hMcjNQNFFwUCt2?=
 =?utf-8?B?bVFPWlcybXBVMVErcnYzMlBIZUJpbEk1OHBBVzNjalVMOVJLMlA1ZFNWbC9x?=
 =?utf-8?B?TFlOeHVscjk2SHlqcG9aV1RIYmRROTNiOEJuQnBmVWwwV2hnaHo4Zkdrb2Vo?=
 =?utf-8?B?UUR4S1M2UFl0LzlBMDZ6Wi8rNWhnSnVrZG9ucnZGaDhMQWxXQUJHTVBKbkFR?=
 =?utf-8?B?L29EVUtNdnJ4dnBTSFdUSmFpTC9jU2ZaZ3NRbDA5eUgzTjZUVGIvdG8zajFZ?=
 =?utf-8?B?UG82ZkxVdEJBNDZLL2JQOUM3Zi9nSjcxNmVyKzlVWlBnVFZaK255Q21hQjJS?=
 =?utf-8?B?TWo2LzlkaWNmck9EL2pwOVFuWXlJcmc1b0tCMEZPMGRWS1c2RUpkbEtia2pk?=
 =?utf-8?B?bU1NSlY1NG5URU4vMkR1K21Ha2FvaE1OV3lWVW1TQ3JoaXFQak80MUIrMWVp?=
 =?utf-8?B?Y0hUQldIcmZkSkNUTnZHUnBERWlqZVlQVC9pYjhCSFNXa3k3K1FGcFZZeU96?=
 =?utf-8?B?Ulg5K3M2U0p5STY2Tkl6YmozYkZVNG04NTQ0OFVEcVJIeTdwYkFqT3YrRVFV?=
 =?utf-8?B?SVIvVkVDL0NRMHc1U3NyMWx5MXhsRDZvbGNNcjNVMXZSVFpSajFhOE5mL2Ur?=
 =?utf-8?B?ZEJkSEtTc1ovM0tkaUovTk1aN0JrK1pTRUdDVHhKeVViTG1Ma1U2ZVVpZ3E0?=
 =?utf-8?B?NWg1M3FOQnJNaklXTTdxcUZ6R2Z6SENKRkdURzRHVVVVb3MvTndFcUNXREJv?=
 =?utf-8?B?UmUxM05tS2VVTVVDOGx6RDlITzdITnRlcUU2eDVsMzNQTW5CRTJrTms3Wk1i?=
 =?utf-8?B?bzhYV3ZBOXFKWEt1cEkrK0xES3BnL2hHcHM0SXZvbHBHQWs2cStwOGNuYXpS?=
 =?utf-8?B?cDlRajQzRnoyUnVXWmlIVGF2YldqN1ZVSjF4WXk3YWNGT2p3cXNGb2ZjUGxJ?=
 =?utf-8?B?dkNrZTdJTmpST25WM1ZveUJqaFdiOWN0SFhJYTloWWxXc3lQY0tXQy9rbkF2?=
 =?utf-8?B?c0EzWHhYc1h0MGE3Q2tVWEs5WnZZNG15UXd3N0tpWE8vY2F1Q1hRY08vQnNx?=
 =?utf-8?B?THBVRlc2S1UyZ1pGaE5IL1pnNENFNGlFM0R5NDNsRXpZbFJmWVVTUW5INmpi?=
 =?utf-8?B?NU1VOTg5VkhseVRpYTVIOFIzKzlOYWZheTBwSXFhYmRuQXcwUmRULzgzbEtX?=
 =?utf-8?B?dkNQcDVhWXJJZ0I2SW4vVmp5NExpM0xRTGV6ZFRUbzJ6Rmc3bm9QenNQb3gw?=
 =?utf-8?B?TEhWejVNazMyVTVUMHZOZnZMMkRsMVB3YTJKS1M3RlpuSWtjaDVJR21vekcw?=
 =?utf-8?B?akZVZFdqNmQ3eVpPbWxZaVlBaWZrU1lPN3ZvUVhYUHZlT0ZsNEEveGtwWVlB?=
 =?utf-8?B?bG1iaVhJTUtsNVBQNGJHR21pcGJCb3plUVRHZGFGY0J4VFVhWEI2OUMzWklF?=
 =?utf-8?B?OWgwUW9JeUNPbFJETExXak52a2NFVFRrS2lvUFF0MXV3VjZHM2c0NWdSRzFV?=
 =?utf-8?B?V1RzQ1hWa0g0QkFwNmd4UDhYUVNqa052MUZpSFNod2puaFpjcHNYMjIxZUxu?=
 =?utf-8?B?bWN0N1k4bUJzSE5zcEI4K0JidEJGanN3Qkdjd1FDRWZvczFJa0Rzd0dqZXgy?=
 =?utf-8?B?QVhXZndlbXVKdFJiKzBHMTdMcTdjVnptOExBY245OW1pMXdmZnRrREo4V1NS?=
 =?utf-8?B?Mi9xYmxEdXdPbzV4dFo2Z3p6bDh5RzJPclV6dmR6eFRxcHcvUitsejVIbGxD?=
 =?utf-8?B?QkVWcGtlaTBwVHczd1piUWVUTWdja1paSEpyRXhlY1VCL1FnaU5IZmY1a3hn?=
 =?utf-8?B?YjYxSXZJeWdyQ1hWdUtZU2svbmtoRytBa0RuditqcmV0alhVeXQ5WjI5Z0tD?=
 =?utf-8?B?QktqdXpZaXU3d0E3VFpkdHFIaUlGU2l5UXpua1hOUDJzOW5OL1RJMnVmTDhD?=
 =?utf-8?B?b3J0R3hSNy90T3htZ2p4M3hKYXhOUWVKWDVGajRVVnFIeE1tYUpZSGZqc3Y4?=
 =?utf-8?B?a2hxN2pEcXFhYkRkQTN2RDdWZ29ST2xZM21SR0F6aVgzc2dWbVJ0K1plS1N5?=
 =?utf-8?B?bSsyUlk4NGYvQ29nKzM5YXFtZ3I1bDdlWTE1aVRjS1IxbWdXeUV1cktFTzN5?=
 =?utf-8?B?YzBtelBhdnFacU01YkorWmRLcHdKRlI0Q0dhSS9zdm9DUW0zOHBYRzZaYS8z?=
 =?utf-8?B?QTFwZXcrSlptRDN2bVpPdVlHYS9QQ3ZzQWdCKzd3d0NHRUU2MVJYQnpoMmxp?=
 =?utf-8?B?OTRjNTdGeGtOeXYra1ZoZTFZcGhYQmptTmZKdG5xbnNFdUJSckpWU29YL3VX?=
 =?utf-8?Q?EXZT/nOoEQ7tDawU=3D?=
X-OriginatorOrg: kontron.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f3ee888-4a64-468a-a21f-08df22ecf57d
X-MS-Exchange-CrossTenant-AuthSource: PR3PR10MB4288.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2026 14:28:43.7615
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8c9d3c97-3fd9-41c8-a2b1-646f3942daf1
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iWXZKeh0nzYszHxX8EyzZy+azyAMlduCLr90prj4LyQRcjUOOT5D+SHq77GLpIllFBuxmnOa2U4ResG8Q8uRJviSrdEChPrV/HHp6J41VJ0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5PR10MB7795

On 16.09.26 16:39, Frank Li wrote:
> On Wed, Sep 16, 2026 at 03:16:13PM +0200, Arnd Bergmann wrote:
>> On Mon, Sep 14, 2026, at 21:40, pankaj.gupta@oss.nxp.com wrote:
>>> From: Pankaj Gupta <pankaj.gupta@nxp.com>
>>>
>>> Adds the driver for communication interface to secure-enclave, that
>>> enables exchanging messages with NXP secure enclave HW IP(s)
>>> like EdgeLock Enclave, from:
>>> - User-Space Applications via character driver.
>>>
>>> ABI documentation for the NXP secure-enclave driver.
>>
>> I just saw this in linux-next, where it has caused a build failure
>> for a missing include of linux/slab.h. I hadn't see the series
>> before (even though it is a v51, which seems crazy), but I am
> 
> It is in linux-next about v37, but build bot find many problems, I dropped
> it and request to fix it. And sashiko is online recently and also find many
> risk. I request to clean up it, and local AI environment have difference
> with sashiko, so bump to v51.
> 
> I put to linux-next again to make sure that pass all build test.
> 
> Other two problems, need more time to check whole review history. reply
> you later.

So this is still in linux-next, but was not sent in the pull request for
7.4. It's rather confusing to me that maintainers add stuff to
linux-next for build-testing and then leave it there, neither removing
it, nor continuing the mainlining process.

Frank, what is the plan?

I'm currently rebasing my work for the NVMEM driver onto linux-next, but
as there have been so many iterations and this whole thing took so long,
I want to make sure that this is not another dead end where I'm wasting
my time on.
