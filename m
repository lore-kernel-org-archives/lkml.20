Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013031.outbound.protection.outlook.com [52.101.72.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6452239E9BF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 10:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.31
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790157930; cv=fail; b=NzN9SV8mBCJRgMZSe/KcN8CZB7NaptzNkjcAyVQ2UAiWaLe0bqbSW4mj0RNOzJrE02KXHDdbp/jZlup2+6GhnPa69TZuwTIELMdwcB1zDlB6pRAECtGBE6WZ/fyzGLCMEEy/74Hdnm7WxCLVqc4rWLxg+gu+lMEP63tHcOzCW90=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790157930; c=relaxed/simple;
	bh=UXSeUlTb/ileBHtpNwdeAXYQvKSVxcHkR9l49zP45s4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JDnbn70hEA3g//RpsAN/BEpWizt15hFNL5vOqUUdisnC/+SukVs1cpi4z2o0ltr4HaMes1aiPjTCZgFOLT/T+0dBEVDZu2kCLg/Br+D2E6RpPKLNsYrH4BzY0WtiVMsU73NQInDjEKpBZ1J15wJ6BOi+8ukvXG+8VfyrxAUcZfw=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LSs9sNTS; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LSs9sNTS; arc=fail smtp.client-ip=52.101.72.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LSs9sNTS";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LSs9sNTS"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=bkMrPOQp5ifSCX9SO2G6+L67pSx9G3RaebqqmFAudF/baPGBam9XRaqOJ850xgUyzr5+FANbTVyf5+IlcqQjddRNjIO4czx7K4zOHl7JlCiSJeNZouUqP0ypKJcUZK9+sXPNmBwb29iAe4DMD3SSIE2uduazBXnPspZZVeWXDgDhSqd4YE1vWnJmZAB4s3UQwg4W3pn/v4uldnywClTLm8vVK7D8cDjQq5jX16E3FsY1Ul3rG12tCoaAOFL2O+PDwhZgzvW9F1FYNRThFHLg2Eio+jCq00ac0Gp3HO54bRC6dBIi/yg2A3whU4I20du7k/3tfABxseVKzyiHmzaHfA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNT2ziZPfSxGRcrVS1jmcFBUOZCJMmwb4/3ZFVwC9jk=;
 b=cEx3/z4f2QJDKpgR8utt5lTEUqeJknNxBLV5aZf+b60FWSDwZJ9RpY34igQ89O+rCzZPHRB+d8Zak9Rn6wOU0NYvmARx5NWn3EkHP10/lsZFmgmR+2BxfwurYE+xC06PC5H8tWgI6Ow6cbUAl36iR73Sav5oZp8h1DetYo/IvrnFk042FBbKrWreSnVnnbfmwNtU6mSjidXl3gD+i4vGjsLELggI/BFsrKEz67oMl+e2PiaEnIyRZeAsgDpBI4RRZqBmhCsHrG+MAOr2zWUrZRk/4Qb98oL/mBQKv+GMUiaJhiW7IKqczgm2G3NFQjfmMwuTArPtVqcqJJcrWVrl1A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kylinsec.com.cn smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNT2ziZPfSxGRcrVS1jmcFBUOZCJMmwb4/3ZFVwC9jk=;
 b=LSs9sNTScI+YR1OnGlyRpXaBJ2nuuniliTGwge/npnwWDqJTKf3yTzoRFNP2V9Ve2fxcxwaXbYHrdEb+E5+9Qg29rXa7MomeNxJtJu4xtC4XRF09dm8cHcXZjTE4vEQ9BMnvwglj+x0r1ado/H56h4zcvFdLxmdq9Yv9/fJm5yA=
Received: from DUZPR01CA0045.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::20) by AMDPR08MB11366.eurprd08.prod.outlook.com
 (2603:10a6:20b:71e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.4; Wed, 23 Sep
 2026 10:05:24 +0000
Received: from MAD0EPF000008BA.eurprd04.prod.outlook.com
 (2603:10a6:10:468:cafe::27) by DUZPR01CA0045.outlook.office365.com
 (2603:10a6:10:468::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.16 via Frontend Transport; Wed,
 23 Sep 2026 10:05:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 MAD0EPF000008BA.mail.protection.outlook.com (10.167.241.169) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 10:05:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh/NfhNiRSWt8ZYIpHhUIyy4EtuLT3sFvQ/Lq+zks5xopmt1gvk5wTtM15gl1m86DhgsALWh04fgz9CCU8r7ETAY8Uhmf+FQIXJ5NHHeppWbHWTF1odTfCRlM33h2hiphbbS8B9sbVnapYUeThoxk0ahp4ikxaCFN20iO9Bh3sLaInusNsXvIt+9h2JdQYp0dPXAai49bUSqV7Uw8sDMp/jordALDULXn9AOEXvXe1R72VSd4bSXNcctkTEY+1CT4ws6/Uoh/zdla7mYVkBSQWcLvxWzeoPOL+5ly87DVy2FC57OypoYYzFA+NvWO1P6HZzDdV/irr9cyvRvTa4hvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yNT2ziZPfSxGRcrVS1jmcFBUOZCJMmwb4/3ZFVwC9jk=;
 b=FtaygnVuVqmZkMyz65qdmMPIbuEqyWNC0vmBRL96Zed7eWuDuls0+llnM6s6IMzMteu+uvv1ByzEIPPf4rf+8fYu2UIqRO1lBbJhnQaDE6/jwaTuDlSL/iI8uokNQzfdUPxnLjDyg1lFNK4NmqKNwrHSvTrBlaDbhLX0WZxaLmCBZ8k32YE+VBKBReeOOD10XNvEx+DumfgZIXHLuIml2phsOkFT1tLkBgzBJePX3ZWVkot3pMxh0ZsQboLmmDtYKydBtjg5pQjmYKlOVaV9vM80YxqneL+b0jUklG/0Jjvxnx1BWGvveOiKUjMpSnWawJTeq6vMMtKJphF1BA1ASA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yNT2ziZPfSxGRcrVS1jmcFBUOZCJMmwb4/3ZFVwC9jk=;
 b=LSs9sNTScI+YR1OnGlyRpXaBJ2nuuniliTGwge/npnwWDqJTKf3yTzoRFNP2V9Ve2fxcxwaXbYHrdEb+E5+9Qg29rXa7MomeNxJtJu4xtC4XRF09dm8cHcXZjTE4vEQ9BMnvwglj+x0r1ado/H56h4zcvFdLxmdq9Yv9/fJm5yA=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by DU4PR08MB11005.eurprd08.prod.outlook.com (2603:10a6:10:576::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 10:04:49 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0451.012; Wed, 23 Sep 2026
 10:04:49 +0000
Message-ID: <5c29acfd-a057-4edf-b885-3ad26c303179@arm.com>
Date: Wed, 23 Sep 2026 11:04:48 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] coresight: syscfg: fix deadlock on device
 registration failure
To: Yingchao Deng <dengyingchao@kylinsec.com.cn>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, qinyungao@kylinsec.com.cn, nd@arm.com
References: <B16F90D29FAA2B3E+20260914074524.1694-1-dengyingchao@kylinsec.com.cn>
 <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <6CC680FFAC60931F+20260914074900.1711-1-dengyingchao@kylinsec.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0115.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::12) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9674:EE_|DU4PR08MB11005:EE_|MAD0EPF000008BA:EE_|AMDPR08MB11366:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b5c972f-7278-4126-9549-08df195a2ece
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|6133799003|10067099003|4143699003|56012099006|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 YiXCaaWQgUHWrUvns+2DzcWYgvbcWWvelz5jVxi0DfjmJ6CaGsco8rxaGGuC/RJT63mfmxzOwN7xJv30uBZ4iVpmsRcC6KuOMHd2EA8iXKBanKCEZS7MgNkGRo1AuTNb2+dYETEcdZIe9TN8f46zO7F8iWYfTx6T2E0EVlRWRg3GDLqFqQucY+4pAF8RulOMy2FzDg4dW+SDRMwrLWyejJ5rbviTDqVulQI+qc9tSFjKsB7baWKP95MEch/B0xaEyxXkIWyXtDTjOEc7HVOEHVOScOgSRj6bvbwk2MmbCM8SmxWzbxYiEy9Ldz3goive2jXLeVQbOG/FeLAiDmSwed36wY9Mvif8hiy0Dwjj1W5oJfLbgtm/2HkX7Z7okFjkkdiVgQsSV7Kx7T65JdQomuD34dXt5UmgUUm8545y7vBkl3+2vIJllDb+IBJ5TxVjmVN/pPNstHbGtiTwYG4arMEvpDiMveuqQ9oQ8KOtbu3GLcQpRMsavrKASgs2oaRK1b9DLWwOT/tUQIH0Z1JsAJHha46GUxHWHxly5Hl3kJjkWFfqYnNtfg48u2/9/CkshedMtNkluColJFoiy/gz5bAE4DhK3oP1CJgGBtseFPEb7FwYqPd/O+4hzhs6Bgn8v5bPdizzcrhGKhWXSPuRrYrNAY0fpVAo69jukqlvIEI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(6133799003)(10067099003)(4143699003)(56012099006)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 Istj9rbRQGR/pAE1X87j8Xkwmhjk/qK+axj+MaIC/x21h4sITsYkt5MEy+hY16WTzgecqaiQnR6C+aEO1aq8dj3SRY7ypY7uMtBqVy/a1LZ+zXOaN5YnIo5cJDnR3r9cumeovAn4EnQRE6TSd7ogbHIpJv7xgvv8FPFRVQ7nVhWOlwMWlkFwlZ01WU2OOl4iO9GK5LDGrBLUmy+J5gHP2sIi91fnD/UstoCaDh8dib+GkY+Fl5nT6rmD8Dfnr+fizX+PEhwkP0i/W3qN7+8hZ4MyQk+Fo9rVbMP4t/APHbxynnfBxvtgrj3aaRzUM+s6DDy8GW6SN0tw3qxWti6ayw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR08MB11005
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	21b58239-dfaa-44c2-7c01-08df195a1a5b
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|14060799003|82310400026|35042699022|36860700016|6133799003|10067099003|5023799004|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OUehP5ZsNuuBIk0j1cxSMmrgFA4rlAyBuIdFOcJNkOnUoklpHBZgiHHnteXNuncgLhFiHxhcnxPEFhkTlgJ3KR1/yW7ND4PgR0T9wMQ6UQHxYRjr8FFJBtGHEOo4BUlewR4eL5e8aJnyFB7d0vfITBpoDa1TMhIkwZKqaPnnmYfbBmGSJpmIRg6mXsFA4db78sPr582Xr1lgxpLX1GX+hoGZd7qtkJqGsJRhXFU9w1KJ78esLuBH3KlHSWqxdMkvJva9XKNklV3Cf7TuEMQZCSyB/FGWVNkhnTqrKgdhS78HxTBti258htObZSn9xIhSX+Y4V2s3DEwr3NrekeyUktXsd9QPTUf6pMIzfQwtCjiBj0u4umuX3fs9gxklMoao+MLOZx077qoz4qrrgdmB8p1UzCmaj/Aw0/Oac0lLaRAwM+kMGwanw6eKVSpM46Pvb3lLmQ/5eF7MuZm+xPg6GiH7A+x5/R1RcJQbasi29sRMFigEiaJeVjqG7xFt+7slxUUk6uP0PuUGroMHxeJSrcfRBJaWDTnNoP1gR1zog+LfmwQQqblA8Y0uhFekiaE5HNrMqxRKnqlaNRdbvKzPA+iHu5b8PEJeC30bOrvDggPClnqjjD4UTjsryR8TfXLtbQ5jeSiuwvx3a4qOAD+hThh+GxZ3zoXHSGOSjRd+cO+vVYtFMOwazC+gzlxxTNHbw4e5ZWOVC2apNK2oEyYTIA==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(14060799003)(82310400026)(35042699022)(36860700016)(6133799003)(10067099003)(5023799004)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HEdoBrrOoMPwAXDnPMabw/EAt+nZTFSNNlD/hFx5kyIEsziEHphe86Z6ETXEnhtk+TojLmZKZ+zPzDhBJT/5vdjW+tFwoGw3h6JPbavi7C6GLvyu4ddVVyKq4XCosUHZImHQHrmgxgdA7CFNldIkL0ZLMQq9O4MmeNxyF897uvP8cet9tS0TUHuVNIv2T0v8Mo2YxkTXTCiIUCeMTDu0kpqK8Rcd+H45UEBQmlJy1f+4UclltGIxRUKS/7JnP+FpCsI3yMPnW8PmtDZsR2OA6pf4Gr7HkL6nPqmLVV3MPSWirif3n4tW/CYWZbSOfhH5yBkVE7S/F5IkkT7Ab46KuQHlpthUFnnMgnkRLXO7/wTqREbm7Yddump+xD7c/yenpMzFYEpLTADJoSSBgze/NR1fK32hVR5F7+2U1cm3SH08MlOcGLFKFnOq6ZXR30yx
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:05:23.1340
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b5c972f-7278-4126-9549-08df195a2ece
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BA.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMDPR08MB11366

Reviewed-by: Mike Leach <mike.leach@arm.com>

On 9/14/26 08:49, Yingchao Deng wrote:
> cscfg_create_device() calls put_device() on the error path while holding
> cscfg_mutex.  If device_register() fails, put_device() drops the last
> reference and invokes cscfg_dev_release(), which takes cscfg_mutex again,
> deadlocking.
> 
> Module init and exit are serialized by the kernel, so cscfg_mutex is not
> needed to protect the allocation and freeing of cscfg_mgr.  Remove the
> mutex from cscfg_dev_release() and take it only while cscfg_mgr fields
> are being accessed.
> 
> Fixes: 199380decc5f ("coresight: configfs: Fix unload of configurations on module exit")
> Suggested-by: Leo Yan <leo.yan@arm.com>
> Signed-off-by: Yingchao Deng <dengyingchao@kylinsec.com.cn>
> ---
>   drivers/hwtracing/coresight/coresight-syscfg.c | 18 ++++++------------
>   1 file changed, 6 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
> index 2bfdd7b45e49..2dd0b29f44e4 100644
> --- a/drivers/hwtracing/coresight/coresight-syscfg.c
> +++ b/drivers/hwtracing/coresight/coresight-syscfg.c
> @@ -1173,27 +1173,21 @@ struct device *cscfg_device(void)
>   /* Must have a release function or the kernel will complain on module unload */
>   static void cscfg_dev_release(struct device *dev)
>   {
> -	mutex_lock(&cscfg_mutex);
>   	kfree(cscfg_mgr);
>   	cscfg_mgr = NULL;
> -	mutex_unlock(&cscfg_mutex);
>   }
>   
>   /* a device is needed to "own" some kernel elements such as sysfs entries.  */
>   static int cscfg_create_device(void)
>   {
>   	struct device *dev;
> -	int err = -ENOMEM;
> -
> -	mutex_lock(&cscfg_mutex);
> -	if (cscfg_mgr) {
> -		err = -EINVAL;
> -		goto create_dev_exit_unlock;
> -	}
> +	int err;
>   
>   	cscfg_mgr = kzalloc_obj(struct cscfg_manager);
>   	if (!cscfg_mgr)
> -		goto create_dev_exit_unlock;
> +		return -ENOMEM;
> +
> +	mutex_lock(&cscfg_mutex);
>   
>   	/* initialise the cscfg_mgr structure */
>   	INIT_LIST_HEAD(&cscfg_mgr->csdev_desc_list);
> @@ -1204,6 +1198,8 @@ static int cscfg_create_device(void)
>   	cscfg_mgr->load_state = CSCFG_NONE;
>   	raw_spin_lock_init(&cscfg_mgr->sysfs_store_lock);
>   
> +	mutex_unlock(&cscfg_mutex);
> +
>   	/* setup the device */
>   	dev = cscfg_device();
>   	dev->release = cscfg_dev_release;
> @@ -1213,8 +1209,6 @@ static int cscfg_create_device(void)
>   	if (err)
>   		put_device(dev);
>   
> -create_dev_exit_unlock:
> -	mutex_unlock(&cscfg_mutex);
>   	return err;
>   }
>   

