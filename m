Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010014.outbound.protection.outlook.com [52.101.69.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E4801B4F0A
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.14
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684989; cv=fail; b=IaBD/SNw2WmCWzM4Gu5xv6SegeeECA7sUtiZaVz1oY3ZLZqrJJxzuSSh4tc8x1z7ATrWMeUvZ/o5soMlN6hnDuSE5Q/PioTko7vx2bi2/lAqmt+2b/z6r5mVfW5N8YzpD4PVcUKT0Ms5puNPY+J4kY2x3CSF5Vqnpr+wWXV+fRU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684989; c=relaxed/simple;
	bh=oI1w3PSz7Tt/mQrhgQJvlkTb/bnFDc5IX+sMQkWtpjE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=rmOH+avBtDSj56F3za/f2cofy5PvxT04cmiUnWnYdbvao+7ZeanIUd/rq0s2JajG1NURgD/PxBsxcOD5hpltB7jp67V2LgfxMIFdVOaJvt/fHWPm8vjUZ7SsOO0qgzp/V+k0TQTuGCVZLiUK0/XISDh0MozAJLrH9cb2tpz5T2A=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FF1o9YuJ; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FF1o9YuJ; arc=fail smtp.client-ip=52.101.69.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FF1o9YuJ";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FF1o9YuJ"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=vfCTU+IP4wc5bwHTmgpbekB88GVkFHblGsb2mIdZz27dLIeC8Sa//80UNeQ/h/GAJePV8lH1Glb1dw3VslrTH/aAPlZGzHVsUA8Xw1cC16vepRdU9pPfd2HX+ZrvC5Swz/HxxQt1fpJTgOJbxBswmRl0OORejnMJfLSLmrUMxVhyW/uu9/ChqgBLsmS4kc0ty2yLsDKjaa4EsekQmoO+HWmuIi8coi8a/apCY99pJHp5I0zxZFVBVitjviAG4daXurKaJ8SV+fDANS80XyGJJg7RUkLlIKYKv6wGcf5L/t38L3LYfFntLgZp9q01Dlfv4xjhEeUEk+g7wyEwrLRCWg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFFxgBotYKIXeButYfN9uXRYEGcxSThmCjeFIxuaPSA=;
 b=MjvWtRICnQ6iZ6evn2PSH//U+JyukcyUXujfcLB3RO78sXGduzXB6W96lgz2K2sslWi7Hr4v5DDyAzKeS4NosWYqokYp6PNdSKaIn/w7K/xuVx+Tc1zA+KsRjbhIsWObYPC9Y9EKvGAJDJd6uvNFBUO3SzGMU0r19b1Te+QLaFZyTxd38yVCxkbq41zNJK0yMON5eS1v2MqWG91btBmQcNmYthOeX1XjYXyWHK36UfHK2iZBLvWpk5Vi2WBA5u8RcMEen+aoehGUiSdERZNLLLsYDzhk+CIGd7xV9wrYa/7IOCU8HQVscd87E/tLg7VAb9xlh5fJz/63GqmXry4FxA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFFxgBotYKIXeButYfN9uXRYEGcxSThmCjeFIxuaPSA=;
 b=FF1o9YuJWt1JY4/KeqqT3cMGT9hxDS04L1TX2hvMT8Y/mKBTIAC6CHs2ZKz7a2c6ITtKHPanGJj6s8JnjaY1NY1l3wchCQDDIktPJpMvHcIJkQL7zJgqBWhSCwNZKWNrucDIshiR2RF8zSk/dKLi//KM+RlYQdCwi2MYAIgv6Ds=
Received: from AS9PR06CA0264.eurprd06.prod.outlook.com (2603:10a6:20b:45f::9)
 by GV2PR08MB763876.eurprd08.prod.outlook.com (2603:10a6:150:3a0::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 12:29:41 +0000
Received: from AMS0EPF0000056A.eurprd02.prod.outlook.com
 (2603:10a6:20b:45f:cafe::6c) by AS9PR06CA0264.outlook.office365.com
 (2603:10a6:20b:45f::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Tue,
 29 Sep 2026 12:29:40 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF0000056A.mail.protection.outlook.com (10.167.242.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Tue, 29 Sep 2026 12:29:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LFK8BL0ly9Ek7TcldASRRy9LSyFeettojRssNQ0ul3eLVesKZxaeqdRQO7mSaqwwDPJ63hUuZ5h4nzWKx6uOVjsiIr2YYPvxc52Taqgx2fs7+yTHeSnKWgro6Mo+cQFihkxpkMzT0MmAeu5307/Po5CtBaz25gkoO0i0s53JNIG83QrNJ0r7VADKKiqWcQVNU4tg2EcTfoR1Q+b7IHcVkIFbpZvFRUOyMBic2jREOW1YZcP8wnzSA4sqBN7rbGtK1htMLc7PGc/SsYimOAlrThQZoLaEBh/xDWaKbg+Ux46UpyVtcknGk79dI/jbTOZG+dmzYOy30NLhsrJBqDFRBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZFFxgBotYKIXeButYfN9uXRYEGcxSThmCjeFIxuaPSA=;
 b=rP6AOYFISuMQIBRUhR4CwRZck0lVqqT3fZZHZtf3sdXaBfrq+uvb+5rya8YRfV4PCp222D56I2EvR1Zv2V87ViNNA2MPKDvQLR6FSIQBSi2gCT6h5EZWYNt3BWAvMC2+GgfYpYMKAo1wvfPj9UekyVjuxBoJLOM0hb4PAisDR0mC+uDCzEQrrdB4re6cVYUccJYzXhVbUiN0Gu2TmOLl+BkS28e+hhBNXr3WRyJqaMEPOQmECfvfY7TcjtRY5beItrhEaP2HWuPUt2RYj4K7NvmE/cuxSXyVP4dDnpxqL0u4BxVapjuWMwrzsbCfhncTGRNcO7bCOpMXvaqc3dicWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZFFxgBotYKIXeButYfN9uXRYEGcxSThmCjeFIxuaPSA=;
 b=FF1o9YuJWt1JY4/KeqqT3cMGT9hxDS04L1TX2hvMT8Y/mKBTIAC6CHs2ZKz7a2c6ITtKHPanGJj6s8JnjaY1NY1l3wchCQDDIktPJpMvHcIJkQL7zJgqBWhSCwNZKWNrucDIshiR2RF8zSk/dKLi//KM+RlYQdCwi2MYAIgv6Ds=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by DU4PR08MB11771.eurprd08.prod.outlook.com
 (2603:10a6:10:63d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 12:29:07 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0451.014; Tue, 29 Sep 2026
 12:29:07 +0000
Message-ID: <3ce86981-ee64-4cda-8699-3c010ff496ba@arm.com>
Date: Tue, 29 Sep 2026 14:29:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error
 out if there are no handlers
To: Jonathan Cameron <jic23@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Conor Dooley
 <conor@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>,
 linux-kernel@vger.kernel.org
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
 <20260922-cci_enxio-v1-1-00bade212729@arm.com>
 <20260922191808.b82fa138c8bc80a1285e8ba4@linux-foundation.org>
 <a5456d59-aad5-40cc-ac89-5c0c113b560a@arm.com>
 <20260923183141.5a9b9c44@jic23-hlaptop>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <20260923183141.5a9b9c44@jic23-hlaptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0266.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37c::8) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|DU4PR08MB11771:EE_|AMS0EPF0000056A:EE_|GV2PR08MB763876:EE_
X-MS-Office365-Filtering-Correlation-Id: a82a13c5-29d2-4fe7-0127-08df1e25554b
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|18002099003|10067099003|56012099006|6133799003|4143699003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info-Original:
 TDQMlyMxHG5OrxqFJhW8ZVGHGm9G+xDZC8R3bnhVKHq0s6qu/pWpkx+Aj5tCnWLvmD8h7oO9kliiOrG2Tlv9YcvWgme4aet6gG8OfRyMLs/e3CjkuGwEcva7SpZkGtF4752VQuxXjPjAlcj6bnckNXRITURAMDYFSvlyrhiC0V2eKPT81uwwnG8vwh0+m/Ks1CVjJXPPBbpeaWW9r/5I1lA0btOgJ64NnrHHnroS8+Yv9bGPOuBZJxQFWFdKzlqeJJpAlKRT70yUBnv09mxcG1Tk9Hj9vj4qgJ0tLnuJXT08iwItVZ85sA8s6OJGu6YpoecksX06v5d17GeKNKE5Cy6f9dMfJMm4bFj8CCo7KaFOSbkCxerSpTVljtDK2Ye3mhw3JUIwynD0q0sa6ilYriQiMppdAzzqwaGBpfVpg4w/v7D1CstRioIRs+aT6mev9va38JJfDzBylRdso5R8ZfBEvcx4eLbS3La5aYNhCby+/LCwMkmuHs6rspFDRoQw5K9KBK3bBDt8eXRoBtrh4fZDNvvI1U81yHvocvWVwAk6eUnRY45UI2oTBaeGzJKEzVqmg8yKkQEfutvoIf+3jgp7D4i6XqIERU7qx8KjCw7ruGpoj1OMeHwfrdsvdrFI
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(18002099003)(10067099003)(56012099006)(6133799003)(4143699003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 eP7JNRwCbPO1UOu6K8slJVahsq/xA2VdyRrDG44Vodynpo4qiGhAVdTYX0n9CkNnIGoezA1TVA/KzaUChsGed3HxbLaxglw6dW0x4OcK58XCOZAjNbx7m0g5VcSntQQmSRfZftFnWY/eU7xZ9WKs+rGqW2zVkp0IIbdCQrQjwZ4RIwhj+iqi0j6EYXm15eErXgKHmGugB65L8L4hRKA7AmA6086RPkVADNk3abNrp6KGOoUSfyWDiaPi16VrupshmvJvoJ5sPTeQkLd+mXLUd8Mw4ONSslwx/G34ylBV2VxIh2fzoCW44V2KWPOa+qSK4fwOKzRTizBDlXbKud/i2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11771
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	13bed94c-893e-4c7e-7716-08df1e254193
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|35042699022|36860700016|14060799003|82310400026|23010399003|22082099003|11063799006|4143699003|10067099003|56012099006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Y8lQ+JXxhJ3RBPMqNBoxejntBO4IgAT/IlRtMsx5alMTH7LL9IdK2d1mdD8TcYC47cMVoziixDP55TnVbryVyeypLMbkg/LQouFvai9U4krqBEKCWAcC3M2nyMzdOv7VpLeiFJN+td1tBppploRVN0Bh7xxu6iQQVu8OZeKMvS6jBis8eP/8dJOBgtAfbq4dH5ym5Gn928yGdNi7RQl6DQJIdw4eqZyIzICIgAK7Ra4q/FItqEqsiKKAcUWgPmfB68cR2oJJJ2YCr2LsYAKw5kTi7Lv+qW69dqqM5o6045Mij8zjOM/kzkvokXAI+RfJ1t41Zh++p5pbNXwC5CRhDOdHGmafipq+zjl3lOyZ5JJHKh4XorW1/tydgPn3Wc0rzjK+3p7OZ4upq1th0TGTVU3paXHgScy7oT0DqXOyZIKsH4VTOP6RRTTNi0x6EH1HzYM8V4LDWljgwZfXUhBB8wZJCQkXJtvjq3GQFc6O8mz4opnjhj09zNMlzk41XxvkvVNePazY1lNZzhSarlQ5NNEEKYB7XHtgJz5fD0zisjb4cXhz7O/6HKinX3hi3tx89fYZH1HSqEUfsrLFFPR/OCbBQYwDyW2ZzSGtxuVVAsHFZEd9vqA8RbcvhpPH1g6+RPI0Oa38kCncJT2F0dJNsw==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(35042699022)(36860700016)(14060799003)(82310400026)(23010399003)(22082099003)(11063799006)(4143699003)(10067099003)(56012099006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Rekj76aeBwb4Kh0aUf577OuIKgi61ZWLEGTwoCmPopwP0chj5MlJlDhzK58YGIkBqW7eCWubNfWldUlj14dc5V4DG9GEx+2t5VA9A/Y6/66vVKMEAgzhA97+koRoVub5YVmtbrEGME+ZI1rmJGiPLA+4Y+PkZ82zQ/G5NdvblFGC2sSyF40YWdbnxNkOSq9rGOHLoEDyw0osTiDIxbUS9zosLfk4Q9CocR7UIOf7Schh8uPBAABOoCCHMgWCmRYxdssbG3p03pqwpJj9OQNUwtZo/krDWrtZKeLqPdM6x45oHE03jwAze7CdTZAq4yBtzRkR/YCwftTAH4bkVkdESEwJmsDC9wXAoHKJrktBjkxaDL/XrfF+1pEHkDYczwgVmFyATmDxTLCsm7CwBLd0rT8DRl1ovTRk0M3CuEPPEHmezsFnPpl4vkUtb9TlIgpg
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 12:29:40.1239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a82a13c5-29d2-4fe7-0127-08df1e25554b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000056A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR08MB763876

Hi,

On 2026. 09. 23. 19:31, Jonathan Cameron wrote:
> On Wed, 23 Sep 2026 10:21:15 +0200
> Bence Csókás <bence.csokas@arm.com> wrote:
> 
>> Hi,
>>
>> On 2026. 09. 23. 4:18, Andrew Morton wrote:
>>> On Tue, 22 Sep 2026 09:29:31 +0200 Bence Csokas <bence.csokas@arm.com> wrote:
>>>    
>>>> Currently, if there are no registered handlers,
>>>> cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
>>>> cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
>>>> of calling this function. If a caller forgets to do this, they may
>>>> erroneously think the operation succeeded. This is in contrast to x86,
>>>> where cpu_cache_invalidate_memregion() itself checks if the operation is
>>>> supported, and returns -ENXIO if it is not.
>>>
>>> Do you expect any callers to be altered as a result of this change?
>>>
>>> If so, full details would be helpful.
>>
>> Current callers, not necessarily. Future callers, maybe.
> 
> There is a race condition if someone unbinds the handlers that might
> expose an error after this (correctly) when it didn't before.
> 
> In general that race exists in the setup path as well because we don't have
> any way to know 'how many' devices to expect with assumption being
> they have all turned up if any have.  Not great, but short of adding
> something to the firmware specification there wasn't a solution and
> that process would be slow.  We can revisit that if it becomes a problem
> in practice.
> 
> 
>>
>> Presently, as far as I see, there are 2 consumers: CXL and NVDIMM, with
>> 3 call sites in total.
>>
>> 2 of these call sites [1] [2] are in the form of:
>>
>> 	if (!has_invalidate()) {
>> 		if (TEST)
>> 			return 0;
>> 		return -ENXIO;
>> 	}
>> 	invalidate();
>>
>> These types of call sites can stay as-is.
>>
>> The remaining one [3] is in a void function, and in the form:
>>
>> 	if (has_invalidate())
>> 		invalidate();
>>
>> Lastly, while not a consumer, here's what x86 [4] does. It's possible a
>> future caller will want to replicate this:
>>
>> 	if (!has_invalidate())
>> 		return -ENXIO;
>> 	invalidate();
>>
>> These types of call sites can do away with calling has_invalidate()
>> going forward.
> 
> I'd be against any callers doing that as would rely on future implementations
> of the interface.  No support vs got an error tend to need different handling
> and relying on particular error codes is likely to bite us eventually.

Yes, if the callers need to handle these separate cases (as in call 
sites [1] and [2]), then for sure keep the existing logic. But some call 
sites may not need to handle these cases differently, and will simply 
return -ENXIO if they find no support. In those cases, they may simply do

	return cpu_cache_invalidate_memregion();

(I now realize that I forgot the `return` in my previous post, sorry for 
the confusion.)

But at the end of the day, I don't have any strong opinion on this. For 
now, current callers can stay as-is, and for future callers, we'll 
decide in that thread.

> Jonathan
> 
>>
>> [1]
>> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/cxl/core/region.c#L242
>> [2]
>> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region_devs.c#L93
>> [3]
>> https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region.c#L113
>> [4]
>> https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/x86/mm/pat/set_memory.c#L372
>>
>> Bence
> 

So the consensus is that my hunch was correct, and this is something to 
address? Should I resubmit this patch as non-RFC then?

Bence
