Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.58
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794304007;
	b=F2twGkf/ksYh+/E0Oe8xQWcLosZaXCs1HKIUq3Y8i8dfihiL7Yd6z1GOcWoDkzr66yEq
	 YexeFZDmo6n+IF9fyq2bbtUAdXuXiwnK1PB1cOtXsjuekYpx3eIsGGId6yaVAHAZYAj5x
	 U0nyrOC6jRVGoszYlao2vnXTXvl2YORIhLNf4gk4WYUAMMfdpDPny+kuy+2ZUgWBKhrnb
	 GD5AKCGeFem+fwhReyBjIn+srnO6jVnIoaNspEIQjct8Xbq2WeOQCaBp/x6zap6/AvGiL
	 zaVuKxO68G7d9txvwFDwiN+VsVfk5nOlpUk+WMgSt8ouuEd7hWikcYh9aqCnEsrAlCA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304007;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=zn9X6t2hm0nmjSfiVd/uA5f4elR7HuJ7qx60s+VK2HI=;
	b=lF61x/edd7btO8p5uu4+4xgJjsPEqvs0oymQtEmciBJmxQW/AhLEgVaVs75D3h6vWU74
	 JCRBzjYw8AK6BlopYig6bG0nZh5JTTruhjjULKYUYpJTeC7H36HV8PqWglXdjppxl+N7l
	 x4IMOWY7NMyQ2TtCSiWgCEaITDvj+cGMTe3L4RADpECIJe+SMuJrCdDLpkasMnLodphtJ
	 OGC7TRTUClsfkNZV9wVf1gBjTVHEuK8B5Qlu02QDCj9Cq50xY/mlbKc66Yv9+m3ODa+T5
	 4R8cVSDU4VmWI/GttmcL+AcprSzcA01pGwZh/jzAKMM/5M2r0UG5dkylYEePPoJNimQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="eBd/xl87";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.58
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013058.outbound.protection.outlook.com [40.107.159.58])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB711606A31C;
	Tue, 10 Nov 2026 09:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB711606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=eBd/xl87
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U46sB6HKDhdGnrlN7/kB2ULWPrZCKIm6YML429CHk3h11pN7SvUHqYUxdXJJhARL8XnVV21hUV27F875y2v8nMoDqHPpoxGIGDUfTv6FCIKhtbPg9tROaYcVgyNaegfV8h+hRXhZwUIKm9phcImYxIwbvJ5f+WALDeBFzKuAQ/M4KqnuUa5VVbTqb7JP+OUZ5iuANgMr6dwGx+fgLhqM2ZYEiEaQUzclvwJ4K6REAR/1UsDXp+1aHK++LsK4dppWlHP4/jvlVArRqjgRap6Wf1ziuJIgjGYF56aZzbtK0phpKptOBN8IBh89U+4hvw6/9pc0lqekcRincpiDcSKN1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zn9X6t2hm0nmjSfiVd/uA5f4elR7HuJ7qx60s+VK2HI=;
 b=W70wGMk57IL/HcAPeHkhw/eYQXH59U1hOa00ApmEstAnzsvSqMI47DFc3RyqWvfLXSN3JrwHZt5NOudenGI7m27nSuQqJsKZ6qmQVcyewBjZIaYZnlEeYvsI2JjtGcFrUkk2N2+cxCm2EG1/Ijr+da5ylyxlT9Keeh0TmMDWLTNAozcExAI7HvRFUThmVDHx3icLaB0jyQJ+gswI1ZQWpIMfjvkky1MEwu9C5p6EI2b6hQwYesB96u6govBNHmGP2Li1F+89PDG+e00XbNgsSCnGOtFZRTT6G8Ni1VNjUriLwRz6ND4REDcu/Iv/6NNo0fB+qGVOiakglxXBqncbQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=pm.me smtp.mailfrom=foss.st.com; dmarc=fail
 (p=none sp=none pct=100) action=none header.from=foss.st.com; dkim=none
 (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zn9X6t2hm0nmjSfiVd/uA5f4elR7HuJ7qx60s+VK2HI=;
 b=eBd/xl87W1ZDXVsc8dxBBzCBRLRdtPHZXHG7HM7F3WJP9O6HlB3euLtOzGXWulNKVRZw5R38tLtEJZQX7LwXcIJQf75EcEaMNwZAV/2TP0N7xr+L6Tq5B7ycQ+7d6DVnB4SEA/MC1W8p9XNkYQv7PQzshXW8bI4lbRTvbRjpHeLYumqe/ZzqRtbrGVv67Se5ZRvwhq5tGoo4lPdI2S2n4WanEN/H5uFXaRXDLSzLrIt+1U+wyfnTsbc/bbWM3iUtyiHShtnwFwGVGTXJVpMrnz3+a8RM1Mb7BmjH7wZ1Sl+nN3DXhuCCYVYJvg7xStYTBBzVKSA0s2fgVt2r+aAQig==
Received: from DUZPR01CA0315.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::6) by PAWPR10MB6781.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:335::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 09:46:39 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:10:4ba:cafe::3f) by DUZPR01CA0315.outlook.office365.com
 (2603:10a6:10:4ba::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 09:46:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 09:46:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 10:47:35 +0100
Received: from [10.130.78.67] (10.130.78.67) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 10:46:37 +0100
Message-ID: <3750472c-5a49-48f6-a8bf-0bae45e4c01b@foss.st.com>
Date: Tue, 10 Nov 2026 10:46:57 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] media: i2c: Add ST VD55G0 global shutter sensor
 driver
To: Sergey Lebedev <lsa.uz@pm.me>, Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede
	<hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall
	<pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao
	<hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D.
 Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261109093353.3757-1-lsa.uz@pm.me>
 <20261109093353.3757-3-lsa.uz@pm.me> <avGwRaKSqXdtXkII@kekkonen.localdomain>
 <20261109124610.85065-1-lsa.uz@pm.me> <avHDwGAe99WYaty9@kekkonen.localdomain>
 <20261109132746.22125-1-lsa.uz@pm.me>
Content-Language: en-GB
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
In-Reply-To: <20261109132746.22125-1-lsa.uz@pm.me>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|PAWPR10MB6781:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e39ff05-01bd-4421-8dfb-08df3f0f8460
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|1800799024|7416014|376014|23010399003|18002099003|22082099003|10067099003|56012099006|4143699003|11063799006|261009223027099003|261026140227099003|261028144727099003|261102123227099003|261022115727099003|261022105027099003|261021121427099003|261021135927099003|261022075727099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	2bX3oZ1AKxiK2dW/IIpqVDmF70TWToPxEEHN0QFvJV3Mr2qsmdNOqVCy/km01WRtYSvGLm7Zm+dY8+QSgREov0IojGkYVWpyeKm1kA6O7yB7jQ64/ISsg4GZyyS7CDkTAl2uhPC5mR7zGdo5Q/2ERuequmSQ2Fyx+Qr63PbEcM6VajhaH3m6Oou2Bb2OuSevDY7ociV1wiozhHmANI1+cRwc8q7PEKcvSwzzkcdZKAkWRLg5BNZJqIkahuJZfS+b1VP4rtUz9vd3yx/COSMCRgkB74/NNyJSA8Uw2EZi8RH6JiDXdvFu1rh5XucBjWII65BoCnisHWQeuDEivS2D4drGuC49Ga9yx4hagFTBra6OY2YXWgicLi8xnyMXUUbOj8pcELS3HaLovXMFyaqgUY2CNOA+pqTxGYYcP7YYgoH1FCBRLoOxokvMO2Ri01djoGLRTTeGpZPJHHJviqFi0O89V9p3DF8x7bWZg6An285CuYeFK3KvykMXJlqbSW+w/JNJNrH93sEthHwqDqovbXRgw5YjaJcBPsw7+ViZsaI0M/MnZfoE3L+Yy60McSvvdyUjNaRZxG37rU7qe8nG5YjoV71soCGU79j1rX4OB+UEZHR1QaA9ZO+03Cz37vqr4SFiSDtkq6ZVfTM75xvUvdsLwA1B8PRh7xHZkcXnpmv+St1Wyn/h7HQ1fUFem8th0q0K9YdzwQKmKEU17NMFqQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(1800799024)(7416014)(376014)(23010399003)(18002099003)(22082099003)(10067099003)(56012099006)(4143699003)(11063799006)(261009223027099003)(261026140227099003)(261028144727099003)(261102123227099003)(261022115727099003)(261022105027099003)(261021121427099003)(261021135927099003)(261022075727099003)(261026121527099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	vTdOeMXfx0/Y4pRf6m63tcwYoAO5F9vo4Hv45Xfk9HbwcCmUtqkD65AtjGDmZY1fGNhervxAcGh/DjdwQYnIQSoqSjLLlWXbg72BtDHMY/37ySIIPawAaw/P4qqS2e3nPeplEkg0dzTrr/WuC7izISLpq+RHnMDtN26zH1ZWQv+rNHA85KGNBiJ01ylIy4OA6xcUTXNv8dcZHm0ec5j6Mn/h5Z82n8MwpFAUQWGbOnVttqf7HSAOcAFb8EBevz3y113HU0uX5jh+/jOzCgsBFDjXmUUp1F6Iu7AysYuVAQSnIgV79sWHNyz/67mhuf09f3YvjmNerZMG1n25xbxNmRpRkmww9X8KCEIJqp4eFab/ACX4cz1LYlg8L4jSyRL/vCH3kPNtIIDPAXvyCQQwhRXOLjQ+FovTmdfXL2FemsP/Tac/WoJP8RMh5xlCeWUz
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 09:46:38.6761
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e39ff05-01bd-4421-8dfb-08df3f0f8460
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB6781

Hi Sergey,

Le 09/11/2026 à 14:27, Sergey Lebedev a écrit :
> Hi Sakari,
> 
> On Mon, Nov 09, 2026 at 02:59:44PM +0200, Sakari Ailus wrote:
>>>>> +static const s64 vd55g0_ev_bias_menu[] = {
>>>>> +	-3000, -2500, -2000, -1500, -1000, -500,
>>>>> +	    0,
>>>>> +	  500,  1000,  1500,  2000,  2500, 3000,
>>>>
>>>> Is this
>>>
>>> The sentence seems to have been cut off here. What did you mean? The
>>> table is vd55g1's, in the control's 0.001 EV units.
>>
>> Uh, yes. I meant to ask if this is a firmware limitation. I guess so?
> 
> No, it is the driver's. The firmware has both a target and a
> compensation register (UM2829, 14.7.3, Table 39 [1]):
> 
>   AE_COMPENSATION       VALUE  15:0  SFP 8.8  Compensation in EV
>   AE_TARGET_PERCENTAGE  VALUE  15:0  UI       Percentage relative to saturation
> 
> where "100 means saturated image". The driver writes the target from
> this table, 27 * 2^EV, as vd55g1 does:
> 
> 	static const unsigned int index2exposure_target[] = {
> 		3, 5, 7, 10, 14, 19, 27, 38, 54, 76, 108, 153, 216,
> 	};
> 
> So +2.5 and +3 EV ask for 153 and 216, above saturation; I have not
> tested what the AE does there.
> 
> v4 keeps vd55g1's table, unless you or Benjamin prefer the compensation
> register.

From a user perspective they are mostly interchangeable. vd55g1 uses
AE_TARGET_PERCENTAGE while vd56g3 uses AE_COMPENSATION for instance.

The downstream driver uses AE_TARGET_PERCENTAGE and that's why you have
it here. It would make more sense to use AE_COMPENSATION semantic wise,
but this is not a deal breaker.

> 
> [1] https://www.st.com/resource/en/user_manual/um2829-how-to-integrate-and-configure-the-vd55g0-device-from-a-hardware-and-software-perspective-stmicroelectronics.pdf
> 
> Sergey

-- 
Regards,
Benjamin

