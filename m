Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011032.outbound.protection.outlook.com [52.101.70.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 300A746AEF4
	for <linux-kernel@vger.kernel.org>; Fri, 11 Sep 2026 09:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.32
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789117654; cv=fail; b=Eqbz6xqluf7ZCmtE89cvFUbplEHJSYCPF4wb5P3xugaNsgykUzAQR4Bpq3AoxbNSQMByajPNKxmj5YRiACz9W4xb9t9UDD846rsuO7Un5Ok8nhLdEPZfus4MnQpuO239D6hWhtllFDyjG1LbeArqujvcdk4ROJfX5JoqOuj3zgM=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789117654; c=relaxed/simple;
	bh=onGYxWk8ND5JXXu6M7sIEshZRdeoCpFlDEWlsHP48VI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hLw88ee4PGBWObwY2WSKWe0JbgGWIAg4rVh8oSy/l3lf+oFCo8CVeIUJJ3nzJGOxO1G/WDZ8VXdjodS3aa6xbo5Z/6tmA009/O5hbUHFaHtAEFTtM42QOOITKRmeUe4mzByj6bfOTgqGBB6hXKWxOcTsKZV6FAkaYaLMxChD02g=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cFmeSuu4; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=cFmeSuu4; arc=fail smtp.client-ip=52.101.70.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cFmeSuu4";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="cFmeSuu4"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=ybsFWVg3mc0cHEXsC1otHt3SrqkzDslV7SYe7wBi/saOISY0bVIUTihYYm2Bgu58ZJzuiKcSI/A6hZ26CKjDvdpZlZBoO7un4ghQCnKntKU1jPqPSbMgzGMD32UZyHsq2eivcyJ5F3b036zKDNV6yu91EAZY7jJBOxDrvb8Pb3J5bCv/yb9p7rmYt8ge8bUglZJ4t2QH9imRJ4bMuSkcCdtHZlFHjFFldYdUrgJEzgLTpZ+hL4j5+hquxrr7Lo0Rz0f0RfLOATlFG1H/sxzrYYzRyGyW8/cFbhvYSzNSdhQn07zxSjSN115PwKcrtr28nFm0eOA7aEusS2vOxnqreA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2pfPLVLUvvLoHosoYLT5vYg5doWTQV9UPEf7GGBET4=;
 b=UdA16CQErZE61yftDRgB2CMv9Z1uH1J0QFqU0ttx3LQ70n6U9UWs+lO/dx30AbHxtKwA+RkKjFVGaDng7aLK0/PLsmePRt2dy7TtcxKRv2KnKVd0yNopj10HXcHrNzI3LHkXx68fuPVlSIW902aPj6JBXfha0Yp9LHkmBbe9mu01RtQR0oBNhgBH6l60bTTmL6n+fpgd+BzYy/X/Oxnbgo7LglYHPhQGkZd1vkNpm4VAsBllwG9gjlUygbxYQSIhdjrm/QDiMlNE7KmhIlvtarCc6GJb8Q8JDLkSDzcHM7YykFa7xYEsZ2D/QBMyPRJwAdk5e3XxXP2OlJSu9xaFpA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2pfPLVLUvvLoHosoYLT5vYg5doWTQV9UPEf7GGBET4=;
 b=cFmeSuu4eWCG+3Z1mjm9W+EMCqr8SMGBSEQ3zSNSapDJ/N06ia/zQCwN1yr2CqUPNHFuTdlsYpFqhsmhYPlHSugLxIFyhbGnYX3VbEno5w9blst9bi+YdD4siqpDfV5E8KnCkJi4Ap0zIYBCfWMiICOF6mBwpqGd1PCXFVhAcoY=
Received: from GVZP280CA0023.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:276::15)
 by DB4PR08MB8125.eurprd08.prod.outlook.com (2603:10a6:10:384::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.8; Fri, 11 Sep
 2026 09:07:24 +0000
Received: from WA1PEPF00009B3E.eurprd05.prod.outlook.com
 (2603:10a6:150:276:cafe::8) by GVZP280CA0023.outlook.office365.com
 (2603:10a6:150:276::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.9 via Frontend Transport; Fri, 11
 Sep 2026 09:07:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 WA1PEPF00009B3E.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.5
 via Frontend Transport; Fri, 11 Sep 2026 09:07:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A9mmemZVKecd+I8EdIz8/FTEX1I4iF+PQJENFE+2zWhqDEZb/P9gXnaCAwo3VQtSwWcVBthNWlD2+BntjgosyGndpTFAoYbuIzWQYmtlUc/uSvURev21uZ2GZLKKRourtFrFWwRDnZJ9XbuGp6wH2/DvufBCvrTTN+Qr9VCMp4vNR4CKp3UxhsR9DHitfKh/wPkwOwMsyTf0VAwbubhkoxC35237keVfXGqiSqBMXD9hf6x0coADMyoEC34WJ4VH7JSZyGvCv2DCwucCcmMBjRmtwSNG4SQ/zMRDYQ+TznU8Xs/V6w6tVRtG9Ds02OrbD6bwlxR4NJhFXfjTOXPAOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2pfPLVLUvvLoHosoYLT5vYg5doWTQV9UPEf7GGBET4=;
 b=qpgNDvTgqWz+Hfiz8DzmXdN2SWIXsixy/I7djTVwHeIOZI2FPElYj6MW00Zf2PDl82h1f1quNhZjiucG0Qzl/zJh7ZpC0HGyS4w5LriOzHtzGfPfWXL/6rflSHi4s4wsiYpkeaFvyMzvOnh8VbyBNtKJuiAffpazZ+LPe/OFmjj4gOK0ELcAG9I91n9CXo1WopWUNdtWKBcsB+NXx0dlbt+5/Z7mHYN2HvBhDE9Spvzjf8qd873BRB7LZHsLUBEWcKY0mOU/J4jH5Ek+ubTJEPv9YctxJcwJCn0uchMr+AfE1PPWjOjywBNITZwTytAK6qRchOwx1GQh01BEHezjWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2pfPLVLUvvLoHosoYLT5vYg5doWTQV9UPEf7GGBET4=;
 b=cFmeSuu4eWCG+3Z1mjm9W+EMCqr8SMGBSEQ3zSNSapDJ/N06ia/zQCwN1yr2CqUPNHFuTdlsYpFqhsmhYPlHSugLxIFyhbGnYX3VbEno5w9blst9bi+YdD4siqpDfV5E8KnCkJi4Ap0zIYBCfWMiICOF6mBwpqGd1PCXFVhAcoY=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com (2603:10a6:102:31d::14)
 by AS8PR08MB8684.eurprd08.prod.outlook.com (2603:10a6:20b:562::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:06:49 +0000
Received: from PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e]) by PAVPR08MB9674.eurprd08.prod.outlook.com
 ([fe80::6f25:3681:7c97:ea2e%5]) with mapi id 15.21.0428.004; Fri, 11 Sep 2026
 09:06:49 +0000
Message-ID: <a41ede73-b603-49e1-9443-af7ad11ba4b3@arm.com>
Date: Fri, 11 Sep 2026 10:06:47 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/5] coresight: cti: document banked and missing base
 CTI sysfs registers
To: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
 tingwei.zhang@oss.qualcomm.com, Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 jie.gan@oss.qualcomm.com, nd@arm.com
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
 <20260615-extended_cti-v10-5-1c1694b6d8ed@oss.qualcomm.com>
Content-Language: en-US
From: Mike Leach <mike.leach@arm.com>
In-Reply-To: <20260615-extended_cti-v10-5-1c1694b6d8ed@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PR1P264CA0158.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:347::7) To PAVPR08MB9674.eurprd08.prod.outlook.com
 (2603:10a6:102:31d::14)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PAVPR08MB9674:EE_|AS8PR08MB8684:EE_|WA1PEPF00009B3E:EE_|DB4PR08MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: da95284d-e3e2-455c-6cbe-08df0fe417af
X-LD-Processed: f34e5979-57d9-4aaa-ad4d-b122a662184d,ExtAddr,ExtAddr
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|4143699003|11063799006|5023799004|56012099006|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 BzD8UX5ahgXP3kdrEYDM15a8LYTfX1HglqO3Di5+BF5NUtJelqfxzl10f4yy7SvzuYlYUZbOGOa1D+i6Ra37DvuVWqXdWrXg0Ri31krD+vjCPMwar58D1n95+NaowdCmIqO0PIX2jk68R52kbBeGSkX7uDdKoP/SQirsIt+96SkpcvGIlGFckvEABARc5ZVG8Q/eziWE+cWXm+fXWtZm29v+isqYt3YwLvbF89YKdbYlnTfWjzQ3WdMuJ6H5V1EPrAQGfknTEN1ZRuuqyZbe+1jurp5GMtzW1Egq3NYgUu9EwvcAeLmGOjp0njFZDlCBUK9vaKH8WiZuZ9Mji55TaIWfo6ckG9FPfnjedoOBZvMTVD+rGfNJs2Q5SePCRq7lUt/n3N4KmzQrVjhPr6VGsAizT5o8oiblahu5ZJLUgub+azkknfBYQvsCQXdbcZZ7N8jiGuVnd9vktHZP3cuHrW+96Cc+1UvInm+2DUtCTBtc3bBFGF8iKpUWEPe35yv7/lfA+lljFq3m6sgQ/r0BpEMmNSy9LLx/sHlDgjCSc8U2YKZcfehTWprUQiokETrXCNkSd3FzLy8iPUaEfLgk5Ct34BQyqvaszriFQdXtQYMLE23OaQxiKK1chyxIN8d6g4MKCkHaWIbvPZP+/sdFge4cLx9FDnFua3J8MX004Cw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAVPR08MB9674.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 eIGswoE29o9x34Z/NJVCwvA2MkoLcaFYNGzPHoklLSz0e5x6KY8hT/p29bBd7jHjtzv7qp+hiyLvVsErT9yLxOO9NYkk8ZNlZUooW34f0i3pxPfCLNl6MnON+ryJs/GfmMh8MyYQ8cqWxUv7lcNby4e4znqUFxydIdkybjLyfvBLcA7pj9YVfFKIz38fLbF2nAwepz6cz907hNpAhF9OFzYtdA5ztyTX4rK8ksuqmVqzSuwx728zPzRODbzbVlFluqnUUCLX4UmldAnLgG4WXDnKPPxvPXv2dJYpiYphW8oSdTdWa423iQ3nHfVqK9A0aheKmqP/nSzoZVlo8RiRyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8684
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d0e30496-2f15-4eef-ad73-08df0fe402f8
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|14060799003|35042699022|82310400026|36860700016|376014|7416014|6133799003|22082099003|18002099003|3023799007|56012099006|11063799006|5023799004|4143699003|10067099003;
X-Microsoft-Antispam-Message-Info:
	hQQQJvkwoDP4CpoMgz0eg7zVQTn1t4BIsDDGei6QzUpejJhDf+pzpn8eynaTgM36AsOFAtGcGz5wlHbDCZ8CjvYeCzNdWk6ivh8+v5PdH4WtWMiaHXjYWIUD0bUPdEzRU6IQ5pV9p+lW89LlL+Nz/reyFqM9jK/kv6PyH4fcVGP1VlFq0mujtifWa4zHel5Pi3pkEG2L04n7iAPwHeBE5yLpYxZDkOyRhr0pe/x7fY24dV7Guz6n4RlPxjiJsbBA56N06gW+UmhGQzJ3moWJGyvtZilGOYMZa5wgh2q6rfXXqzF171JiTiR74nAKV+/MJX/1VJT+JPk3gi/6/9h9jQIsxzRckQyRFhEvjMn5X/JgzyQDEyuBj7bg8luCzkgkHXLdmg33M6eHtBZdCv/mM9wDCnFiuS6kP7hVDDuyqLIBbHc9m/edQTiGNYN43xda8qiNluy/yY1Bp+mwSug75QUqxUTojYIf2l7zpzh7Ab1B9Ke8tLQvWc9DmG3/p59bKMgUW6wpyAdLj1unaa9Ueuy9OHh40Nmd3w16g/OtvdpssiiJdna41+DJ3s4qYuoKXGCJs9CFyUw6KozuIjpbaCtdxq9G+PeS6Xp4M5Ry+k3TJTyc+MVkPHNaApdD5FDxRmHfZD3+z1ZkQ0dQFLEpnBQfOjwrwVKBD+dlALuZZ4gcygb6q0Cq1mTm3W1GK7DhEfRfUFfg/JGsG/fJBDoTwQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(14060799003)(35042699022)(82310400026)(36860700016)(376014)(7416014)(6133799003)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(5023799004)(4143699003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zLSMXSjC1PUZzxbeOwK3PhR31v9xlYfXfcyu3vuVF2QEoX+c94fZ7D8xxoXYm1yMYR5C15N0fwtd/5Cdqhj74WacS4HNeErgbXAyTwmz9bfozMAEVSHNLL1jSXoiWwMLIiE/lynxc6euQyTTaJTtVkVz8WBOSy5kf1CmvEoj5dXem2Mne1KeEQeuskpGSJiQ9nF84/FvZC18dWFrdT7nhDITnjSC59KYuV32DGbNHjBcacWlzrkbIpPLqLRJsCwHkevQlOE6LrtEdGGO3wVwBH1ZCWp6Wy7ZkqrSw+O9hGi2swybc+hyhSirS90+b6FMl/lnb4kLJgn3CCBji1Wb9f6UvXqMDociz+ugG7nnWdsQQ2SSROWg2Qe4pTyIWFUC0tXahmk1TaFXLXGXaV4vAHbOTjC9M9z/pkt/2LBexv3AEh5sQOqHqTi57eDco2QI
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 09:07:23.2124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da95284d-e3e2-455c-6cbe-08df0fe417af
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	WA1PEPF00009B3E.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8125

Reviewed-by: Mike Leach <mike.leach@arm.com>

On 6/15/26 13:32, Yingchao Deng wrote:
> Document the new sysfs entries triginstatus[1-3], trigoutstatus[1-3],
> ittrigin[1-3], ittrigout[1-3], ittrigoutack[1-3] and ittriginack[1-3]
> in the coresight-cti ABI documentation.
> 
> Also document the previously undocumented base integration test
> registers itctrl, itchin, itchinack, ittrigin, ittriginack, itchout,
> itchoutack, ittrigout and ittrigoutack, which were introduced in
> kernel version 5.7.
> 
> Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
> ---
>   .../ABI/testing/sysfs-bus-coresight-devices-cti    | 90 ++++++++++++++++++++++
>   1 file changed, 90 insertions(+)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> index a2aef7f5a6d7..9d7831ac455b 100644
> --- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> +++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-cti
> @@ -128,12 +128,102 @@ KernelVersion:	5.7
>   Contact:	Mike Leach or Mathieu Poirier
>   Description:	(Read) read current status of input trigger signals
>   
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/triginstatus[1-3]
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> +Description:	(Read) read current status of QCOM extended input trigger signals.
> +
>   What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus
>   Date:		March 2020
>   KernelVersion:	5.7
>   Contact:	Mike Leach or Mathieu Poirier
>   Description:	(Read) read current status of output trigger signals.
>   
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/trigoutstatus[1-3]
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> +Description:	(Read) read current status of QCOM extended output trigger signals.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itctrl
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Control integration mode.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchin
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the values of the CTCHIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchinack
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Write) Write the value of the CTCHINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the values of the CTTRIGIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigin[1-3]
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> +Description:	(Read) Read the values of the QCOM extended CTTRIGIN inputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Write) Write the value of the CTTRIGINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittriginack[1-3]
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> +Description:	(Write) Write the value of the QCOM extended CTTRIGINACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchout
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Read or write the value of the CTCHOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/itchoutack
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the value of the CTCHOUTACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(RW) Read or write the value of the CTTRIGOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigout[1-3]
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> +Description:	(RW) Read or write the value of the QCOM extended CTTRIGOUT outputs.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack
> +Date:		March 2020
> +KernelVersion:	5.7
> +Contact:	coresight@lists.linaro.org
> +Description:	(Read) Read the value of the CTTRIGOUTACK input.
> +
> +What:		/sys/bus/coresight/devices/<cti-name>/regs/ittrigoutack[1-3]
> +Date:		June 2026
> +KernelVersion:	7.3
> +Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>
> +Description:	(Read) Read the value of the QCOM extended CTTRIGOUTACK input.
> +
>   What:		/sys/bus/coresight/devices/<cti-name>/channels/trigin_attach
>   Date:		March 2020
>   KernelVersion:	5.7
> 

