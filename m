Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010003.outbound.protection.outlook.com [52.101.69.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C151E455
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 12:21:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.3
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684504; cv=fail; b=lalcIOxXWn90WjQmkz9VZj6DHrpO0TXKpXSZdkef7xCZrk5aGfYqfqcnpglSE0giKz9XuNbAXSHyzIz+QIciNQGenLk0l/fyTODzYLUP17GyNjwbHJBgM0bKSlg+rk+togqrPjJHl2hZlvMLKYxfvrF4JHAIlJ7Vxs0SkN2As7s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684504; c=relaxed/simple;
	bh=rgWqvbvF5sF2oRgU/YJrJdev7+FIsUKk3+5g9ipW30M=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AixrihgdpWcgOpnQ+yssNLDONtR+y0zv+b/6IK2Lxj6tIgyB6/5oXgnzOyH0nNsHdsVCPrwc9+TL3etQm3AsHiHqPqhdLGs0iYtyCOxTecdSXwPJN4prS3zBR6rVfj2SDBxv47bfOmxSWLLqH8Y4T1YRwTud1uIXIqF7zxASgdI=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ym+dRGEP; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Ym+dRGEP; arc=fail smtp.client-ip=52.101.69.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ym+dRGEP";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Ym+dRGEP"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=negvxNE1+BTjkSgG6ngBPaivWGBCke7pyA1SPtztXEWgs2lWHL4EaV0k5KH9cPaorZO6wXlZ5w1kWvDprEA9fOlYaD8OqZTNVAFJ28MWJCmZWH8IBz7Zy0ohQDUjyE/WUV2BfCP1KL3hM9yFZnYeQ/poWNtOEElZ1u0IBnMREi+Cpc2ZvUjpHZ2fF94zPVL2Iua+UzMhA2uSTBGihmBM1Z3E/Bj9gCYjpg9/Nhyah16DCV1wzQmJlKDTnw6sHP/p0GuN95XPPfKWOE0yFRo8vMEKPXc4PCNZZjF3Lm2x91rlz1dsF/2tqfHdnTX1apB2h0EoMnd8YuM2F7ug5cKl5Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po1J0odtjG06Jn6CopZl3x5TJwVKeGH6cPusXe2go0I=;
 b=PP4aMzhlm9wPcju7FTK6cy7Fe048MiySIOkeRbpIYyqyy8DpW/DqGKSSsQegICpPkAyXuddJiOwsTilO0vklts6DJMz24MmJPFc5WzEPQVNvgm4GMK2+lARyKqxmXv7yyQIpLPtlrdVj0xUydQ1ZsNDvufkA9vW/DRyC4Sb8Dc7qW9tJxAGJfxPINiFVnlDbV1znIDAxVfy9Rm4KAjzpbwLO+ydcg81b8iNc2/1ZxJTqRHrtfbrEjoWmAu3wC4Mhl0armM4zawpEtaScG2BNYeh/hyiYJfXKpSrwnKnWUnG2TNIhvRHe5i6Umes5Bz/VJgvRFsKB0+cZ3JdaRzJ89w==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kylinsec.com.cn smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po1J0odtjG06Jn6CopZl3x5TJwVKeGH6cPusXe2go0I=;
 b=Ym+dRGEPTFByoTUgDpYsTp0/glO7ZRL8Edorz425PdXSlTSk0oA0PJW7CGhiiU5Zku//DtWAB9XqzIJOn5DuR3R8cJMVLFgJg8gePPtD9mfnuBRmnB1jr1x968Ed559FK1zQvyD78w7ErHoXSVHHTB39BaALZFphTsmcHSt+9H8=
Received: from PAZP264CA0077.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fa::15)
 by GVXPR08MB11471.eurprd08.prod.outlook.com (2603:10a6:150:2e3::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Tue, 29 Sep
 2026 12:21:35 +0000
Received: from MAD0EPF000008BF.eurprd04.prod.outlook.com
 (2603:10a6:102:1fa:cafe::4) by PAZP264CA0077.outlook.office365.com
 (2603:10a6:102:1fa::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Tue,
 29 Sep 2026 12:21:35 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008BF.mail.protection.outlook.com (10.167.241.168) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14
 via Frontend Transport; Tue, 29 Sep 2026 12:21:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IvV2KAlVXv2M1AptqGR8hEAMwmJSKP1D0puyoKfbxahIfDKdtDesFRDAAwlTG3WUXcrsW28gQ+A0B5KWQRHTxMT6Yzt5vRyb44m8UekINJC0+scmbE78BIenJ80XUQ2fUTM96/jXvldHlicW3JVtLECNHdAduu4WBjxLXRD9MjwbILoYDeReTRDwgH3UCmv+61pY+GeRKfm+eNRE7p5dO9NGfhcGdyfTj3DA6eUFq9p+wN16kaZK0M/yjekFdy+plesAXbjymziU6FbAObOSPhCS5r0B89hnexvzMZrCRs8b42nBtz9L+Zl6MP4G6EdFX3Kl405zcU2T6Nknmr0ZZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=po1J0odtjG06Jn6CopZl3x5TJwVKeGH6cPusXe2go0I=;
 b=xU0qF/viezf0RGZEcy6i4kQ75wlrodpaVny71t6Q9D+93lgSBg8ysvUI6T5/4ZBTv453c9zKaiTcuBsfnr8Zp36sGUEbGsl4NMphor8LV4xNSBI1d+l+HfhIobIUnZndvCtOpalfJwAbdZbGXwlKLCvXFulygwNGwco1sjGMT2PVr++y/jy8Q2rv8d3nw0uA+Chbg6BTti4I01A6Ur86AuJRCzue9FfFCHSnnO9RCZRyYGx4dCaEtgUEBddPepBEu8+o+dPmw94d4UjtwGyz6Ele7h/NzuxTVFSLWFiaczpVRTlTP9J7r+Oms5bMIV86dx/AiBQBy5Dh4x8P7Lw+fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=po1J0odtjG06Jn6CopZl3x5TJwVKeGH6cPusXe2go0I=;
 b=Ym+dRGEPTFByoTUgDpYsTp0/glO7ZRL8Edorz425PdXSlTSk0oA0PJW7CGhiiU5Zku//DtWAB9XqzIJOn5DuR3R8cJMVLFgJg8gePPtD9mfnuBRmnB1jr1x968Ed559FK1zQvyD78w7ErHoXSVHHTB39BaALZFphTsmcHSt+9H8=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DU0PR08MB9464.eurprd08.prod.outlook.com (2603:10a6:10:42c::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Tue, 29 Sep
 2026 12:21:01 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0472.005; Tue, 29 Sep 2026
 12:21:01 +0000
Message-ID: <59e10194-cc34-4535-a8c9-6cfb808582c2@arm.com>
Date: Tue, 29 Sep 2026 13:20:59 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] coresight: syscfg: Fix null pointer dereference when
 configfs init fails
To: Yingchao Deng <dengyingchao@kylinsec.com.cn>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, qinyungao@kylinsec.com.cn,
 luoqiu@kylinsec.com.cn, liudalin@kylinsec.com.cn, nd@arm.com
References: <C73E0F9BDC0A8FE7+20260928123515.2032-1-dengyingchao@kylinsec.com.cn>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <C73E0F9BDC0A8FE7+20260928123515.2032-1-dengyingchao@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PA7P264CA0340.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:39a::7) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9674:EE_|DU0PR08MB9464:EE_|MAD0EPF000008BF:EE_|GVXPR08MB11471:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f54e7f8-886e-4d7c-d150-08df1e2433ce
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info-Original:
 qD/CnUAH6Ev0CuLkRWbv1dJS5zNJtV8kd+/O4Mzk8zHxNP0gYZeI/Z0Fi7eItYZUSdvm+2hex+5TKxYED8KjfoG37WP6zMHhgs5dq/FzHUChtuVhT6TS6y5I2lKPBs9agvR9oyG89+ZGQwXz7RvCFd+hT6TevOP2S9YantEQSGnrzRCb3Te/JJVzhxr3OKDohljvgK5DVz8aA2il2qS7qQW5AjcYm5rY92oQkQEMHR22UIwKpKcITMUaByPhT6PgIe7WXuq516bPWEOtZU8f861YGejrrHbqGxSbSA7s8We02+F/MZ9Os+vurDZBbdocvtdMsrLWR+DoWMZjCvhtlrE+4kDu6I+DvXSBX6Y4bdi1gPilEjxeols1S8ByKfiIrytvb1BbCEP5Rw/lOcSdcNU1Yg34/ZqqESWu1unVnGr3bVkwVwX37hO7imEEClOL1FUbsSwdt7+trljwDpgfXBqKvjXdqWxbJrQRwn0dCgNO5EiMzbtyYXHfRuGsuhkyGHwUIhQ2LtQeg/JPAsXldIar16WYEuUOX4cAaSY0nYcaY7Zn/WqMycP2kwUefEctzp1ZG8r1FaY0xgs/78MY/bJMEEonDtlJia7iGgPJv/Q8rjRl6LuqElt6fqLo/Pfk
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 LgZFwdVJrEmiRc2WI3EF3a0SftBTCeCyY88G3st4vCKd3jymYwcWA+iDhuum6XEw+XSgta4Of/HbUw8j25qcej5xdsMIUIZix9fW53O7NNz+/XOVxk320D7Gjvb4fWnrMPSujiCsKbwwZ4wDmZxwGK2EB6E6GM5RQLEgLE9I2uuXNFXhjWl72UUh71gKs4wai/kvXUkI2QUob4rj8i1olzIJ523rg5tK4eGnzUPkdUpX2uOHoj274rjk9tPf/GrWn0YRrBfQ1abszAU3RLgDOKVPSN+REJxFNZ160qYPBgzansL+rNnM5wKlDWHWFOunlv0qe/D2TC52gzBVXYujiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB9464
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008BF.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6e93c87b-f61c-4074-b5bf-08df1e241f9e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|23010399003|376014|1800799024|36860700016|82310400026|14060799003|6133799003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	7sv99CVYxd8MyXk7uoAh9g8w40ztW0Wn+0Hor8imJT5iAEQbCa4tz1gTWcb7NXlJNet8qQc/teNb8xN8ZbyPTkUwndhoXO40/oN6sNz5civ4v9vrrYdlA+HlP9KSZxWzbyfMMAPsGg5JTarjFJfl7kRJ6zwwCd9MITshnunz2ITpHSJgSyJSx31pzboV3sRfxyKz23Q+7UexWC9K2aF7EU30OKYlM/3Sxz+L4myxerW5YTf39b/68VUC2t5qaoFx6wfTglVeUNl6iWddPsmbnT+z6pFEE4EHmHVxiVLb8dvlAQ5rkk5rlFjt3Kz32Jq2mJPMBkuMmOZZoCu4qkBUNe7M/Ee0SISIGH2kz9WK2Gpq7bmOvqviQE/qQSLuN8bZMW1uyJUvy27ganveI8gECdTe0/gkpFbMEgzyM2x0tXzC7f6zugp1GvD55YKYW3ChokWO/7EO5WExh4aMFOJ4I5Qr3DJjnJUEX9W1JDtCnQi4uz6Ic1heiMjPX0DxBsoIXDcIVpVKtpUbt6030N3ovkIF0meoYyv6wzuX7W2U1HPop4iIQN7RJKHFEz7jk7tp6cABKMBTLGYw+/LLxyQ8q1UOH0XMTnKs3nlULRhJWUhM+DhO+ul6AIsk8xRe22Iv9jIkIM7v01BU0x26X6wH+2UHj4p8gGSaGEJ7RBhKlEk=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(23010399003)(376014)(1800799024)(36860700016)(82310400026)(14060799003)(6133799003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OeNd3nPUmYCGH4ENG9qNIZmOE7ArbZ1Fzp8zB55P3FOaqY1LDKwj24NJKLcANxjkUjYugmoBWyAAU3ODX8VNdbwgHn4uuS8YTlEL4pQtdDCuaG2kzuh+P21Rl30zjFiAM1qVd49WXMvTy6l1NYk9SSUg8MjQtD54zoxCNWhNaNf6uv+yZ2sb96gVUaS4uL2NYeL8GdKAIndEcFk7L9nsssN4Oii7CpsFzsF+fIepbI+UDHV1nQbgJG91d+6ZYXVbUb6Ntqf9XhtY/ge/iEj6/KEZPUh67AvI+PmRK6lMInm90asdG+pY8/iom/8Xs91JdUvqpgFnml2XGEBoQMTBxF4BJ6p4EX9MHlPPvx0zSl9kxuyo10sucKu+prbXE/PJKGOA7ApLPNvR4whJN2g4o32NE1ZKzzrhRJQxt0VW72+Iry2gfbh8ltV7iLeRhTcH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 12:21:34.5142
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f54e7f8-886e-4d7c-d150-08df1e2433ce
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR08MB11471

Reviewed-by: Mike Leach <mike.leach@arm.com>

On 9/28/26 13:35, Yingchao Deng wrote:
> If cscfg_configfs_init() fails, cscfg_init() takes the exit_err path:
> 
> 	cscfg_init() -> cscfg_clear_device() -> cscfg_configfs_release()
> 		     -> configfs_unregister_subsystem()
> 
> which tears down a configfs subsystem that was never registered.
> configfs_unregister_subsystem() begins with:
> 
> 	struct dentry *dentry = dget(group->cg_item.ci_dentry);
> 	struct dentry *root = dentry->d_sb->s_root;
> 
> ci_dentry is assigned in configfs_create_dir() only once the subsystem
> directory has been created, which never happened here.  cscfg_mgr
> comes from kzalloc_obj(), so ci_dentry is still NULL, and dget()
> hands a NULL dentry back unchanged - the next line dereferences it.
> 
> Handle the failure in cscfg_init() directly: unregister the device and
> return the error, releasing the devres-allocated config item type and
> cscfg_mgr without touching the subsystem.
> 
> Fixes: a13d5a246aca ("coresight: syscfg: Add initial configfs support")
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Link: https://lore.kernel.org/all/20260924162404.GN200420@e132581.arm.com/
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..00b29d1656c0 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1299,8 +1299,10 @@ int __init cscfg_init(void)
>   
>   	/* initialise configfs subsystem */
>   	err = cscfg_configfs_init(cscfg_mgr);
> -	if (err)
> -		goto exit_err;
> +	if (err) {
> +		device_unregister(cscfg_device());
> +		return err;
> +	}
>   
>   	/* preload built-in configurations */
>   	err = cscfg_preload(THIS_MODULE);

