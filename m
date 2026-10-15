Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E137282F1D;
	Thu, 15 Oct 2026 09:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.19
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057250; cv=fail; b=D+TFB0m3v94iCKD3jdSJf3PnW4rveo1XXeQG3/Gu0BbSCgEy9QHfmxZQ0w/Tcvljh+n0GJwmOAb4Fid5KoGo6CO7tqdpBk8fFc40NtpCZ8OvMP/ezVj++Wn86qtCuqGPoJmxbGhLRmjCDGrT32oHelK5cl/D4GONPpIoLsqjqE4=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057250; c=relaxed/simple;
	bh=I3E2M6DcH/gPbP39bLsBrQlJrZ7wsSfl7WtEo/FH8aI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qucntowvCjXq4KK6+tnm/LDKzp5RR7DNSW1UVYxGVBZJItuBAlCU0bX0XT+MV8dR0Ce2bDmPwp0sPXMft9PpF9BbDTgqjy3jJVrqTRauStSESt9gDJSj0Nc7D4ro5RlBVSxzOmSNbB8i4D3iVeqtg8NFgMKSsa90EqMHi4Lu+fg=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WnudUHaM; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WnudUHaM; arc=fail smtp.client-ip=40.107.159.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WnudUHaM";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WnudUHaM"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=sHoP4jEOJI+abrQbQju4kMTIBwA8cgAVTQbFGOmvvCdlpqsq1tFf3bh3tgoHg3huzMINkgNKyGS4XjjAsP8RB6u0mSBim2WsX2BJBOjB4OtBBzTP4Bl1Zw+CsCLcsiP5bfJTfWv9HYXMf77VLjQbvTItvBQ6AEk/3qqYiZQRHiiUwio4hE7wr6lS3tQrsBdo+/0ZVCwJBCJzKOHx1iRPpE64ZKiqYDkSUU9FDism/7zfwcjdi53Sk8t9Tu/RoiuffUzkfeAISiH3bnmneCFU5dstWe7vI0r/OanDUSVALo97uoVX10eTRUyXhPQuDhNcCfBDBwVWqnIihe9ClKADhg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E+sMWfujMKEYnWuWvFp1HCmcCqhg/hDtbcbJQzYO6o=;
 b=QCLtX2thAL+nrwRWjrp8tE5HJPPdzjBNlaVXketxBhZJCm+6Lu3lGKA6g6jfVaXZj18YgQyGKXP0kJSpszyx078j/qm2yVj1TGXq2rsWnUA3mhnl9lVmPe2exDAZ/CnytjyC90c5EVyRO64f/tK8NuVy/Ty/vub5LrjRWjZkntzd1JP/qHvHDqsnmFqsArasaP4k1h10tgfQKGxi+G2+NpYBYX24VGZpblVoZ9oxEkvbWjDOUCJnDdwO40GUvOqi5+6Go2iI0Nh50uWo2HvJnseLhRnksKS/SVmE5/QOQgI0yF+o1SPUBKs1nBsggViDA3QDALyaPpdE3/HwmeZAZg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E+sMWfujMKEYnWuWvFp1HCmcCqhg/hDtbcbJQzYO6o=;
 b=WnudUHaMWZMqqkzZCESVtyl15gzRow+vGELldCxGCyJ8NJHgOXeNPp8bS1UJ7+w6T7NsW1VXHyrqbMMZ/gS8XAtuCO+F6ryRsBMiNq/6LCEvhaYhoVZuBfwPyr1aqMbOuWADanbgcdseyX6AMFlDLLjFcInhLNy4A4UMP8lJkTM=
Received: from DUZPR01CA0185.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::11) by AS4PR08MB8242.eurprd08.prod.outlook.com
 (2603:10a6:20b:51e::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.7; Thu, 15 Oct
 2026 09:40:34 +0000
Received: from DB1PEPF000509EE.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::6f) by DUZPR01CA0185.outlook.office365.com
 (2603:10a6:10:4b3::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.21 via Frontend Transport; Thu,
 15 Oct 2026 09:40:33 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 4.158.2.129) smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DB1PEPF000509EE.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.522.6
 via Frontend Transport; Thu, 15 Oct 2026 09:40:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CcQ7t82wRFNc27LDUv/aLt5U4cfwjxomsw4wGnu5BF0OXujIgfZAMZNmLufOO8ZtuWFU1DLtx2F5e1krOj6M9KMRe+SKdISqiG0vrnU5cQXVySmj6Mmc53kEOh3jn8akbOyoolQFOdVFDZ2QCnANDMhrUC9ZMN0jqCAaHhqDYm2/6unjapaXhgk34IGLZnpt1fyXWAZCC3BDsbyj1QHLdqA6rSasecSoevkIANfa7P1FK4rMM4tFbKi+hRMTRUZwZSeGwpX3DyQmzXhQN2kSC00NqASJXcpMobHNtDEjfXN5ZgnwNDAGS4ROjYBXYaV2bVynq50xj2nsLLZSUH7rZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8E+sMWfujMKEYnWuWvFp1HCmcCqhg/hDtbcbJQzYO6o=;
 b=iiHRfnqEVBzl4Yc7AC7j3Hk2tH5b2rM57MOqnjhWeVRq3ZDTspCYi+38dQIAjJX2AYTpGF4MI+R8APtLgSsSsYHYW72lX9t2PssF2gZN3z/QkQTRhBjFirai+ArqfnR1X6/RyR6oDh6CzVqykO4A/XfEe5flaLYgzUwMsbMpP0izl26fxuJi9/PJye+LxcHNQBhJplDWPG1mMAP5A+KQTmqvbHpo3j83b3VYAD7EsJfh8GHxfKlHuz8SfY8f/AH4T3wHAau2OOtzW1w9QS7fYJBS3XlVdjOZZb2zcUhwVelj06q79clWS/CmI3A50n7wSkrnVJKKVPsHmrq628gdkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8E+sMWfujMKEYnWuWvFp1HCmcCqhg/hDtbcbJQzYO6o=;
 b=WnudUHaMWZMqqkzZCESVtyl15gzRow+vGELldCxGCyJ8NJHgOXeNPp8bS1UJ7+w6T7NsW1VXHyrqbMMZ/gS8XAtuCO+F6ryRsBMiNq/6LCEvhaYhoVZuBfwPyr1aqMbOuWADanbgcdseyX6AMFlDLLjFcInhLNy4A4UMP8lJkTM=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com (2603:10a6:101:1d::23)
 by AS8PR08MB6295.eurprd08.prod.outlook.com (2603:10a6:20b:295::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.8; Thu, 15 Oct
 2026 09:40:01 +0000
Received: from PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e]) by PR2PR08MB4889.eurprd08.prod.outlook.com
 ([fe80::8bda:5986:a1f1:cb7e%5]) with mapi id 15.21.0546.006; Thu, 15 Oct 2026
 09:40:01 +0000
Message-ID: <9ee56f06-4b4e-4355-b8c4-68d185eb3ce7@arm.com>
Date: Thu, 15 Oct 2026 10:40:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] irqchip/gic-v5: Fix standalone IRSes OF driver probe
 and DT bindings
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, Marc Zyngier <maz@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, nd@arm.com
References: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
Content-Language: en-GB
From: Sascha Bischoff <sascha.bischoff@arm.com>
In-Reply-To: <20261015-gicv5-irs-no-cpus-v1-0-d4b337b7f000@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0587.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:295::15) To PR2PR08MB4889.eurprd08.prod.outlook.com
 (2603:10a6:101:1d::23)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	PR2PR08MB4889:EE_|AS8PR08MB6295:EE_|DB1PEPF000509EE:EE_|AS4PR08MB8242:EE_
X-MS-Office365-Filtering-Correlation-Id: 5beff81d-7bb6-441f-4e9c-08df2aa05c0e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|56012099006|11063799006|5023799004|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info-Original:
 Lkh4LrGBHPt6bBmnYm1GMUHc+YrZ6symH+8Xnwq7C/b2J+jmJU4I/lDtQ3ENRr/xlSTJ+VsehxNtZLR9LI9OFrEsSZyoHp//I5FYxTU7VGNG4CxiHFN7MW+/Y8ejV/LDUZdlfxulIBLaPMSiXI7gO6M779FePxpZZbYj2lxeeZMBKnPApz1GSqLPkljoRVKhZ2A6IQdmymuBqtrObwaiegTKviYbVTsmUtKazt3nAROYsmx8/ZXDuxIZu/l3yXvS9u0/of+C1JOzivKjAqcK1SHwmmCf5jHJWwWhdaaq1SsSgYQYUyopmXG2WpMQFJa5HpG7jR8jjUIkZsDdM5r5ibN0FGNR5f7/e+qTy/32JhhsEgpPld+TbxKl087rMSInyyxW4XCGaHM9UOwsCAL4zsVjsiq5OzDf6TOWmrBNlw8jR9ax4oR1rKYGQEq6Vm6SWSzRRxmQHbBvVxVBzI/UbVi0ajjrNcZR4NKjAr6rrmdOtgIMSkSVnWAL1+r7ug/DvloMi+jJAB3DHELS9lz7NSFxReY9WE64beJCS3c0hUaW2h+iJXsDs6D2R0Hhru0de3wJfGcfPOgpyrd4Y9ZDwKm8VzRbUN9uT1F7JwREvN/FPrgoIuzlCyh4EafrRqrUC3SWgreDsz2E2gatVcX4l2q+ryN/WDhCWstfLUo4Ox8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR2PR08MB4889.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(5023799004)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 rZ8DRNUeQgRRhYC0MC3uE5tBgxgeVYl37+MZQd/LYcKxUnBx0PtBxC45v1J6cqq+Tww6f+IreNbQwI2mfFed2ppNpDLlCh5coALzWZARdFuF6Dsnlzc6IKWCQ/s0afKURrqaFuxdR69mPPO8PlFOfXhT/IBNWxwP2/9Hc2Q2SBEVch4D/SblASzv9OaSZ6egh+zWGhPrbtrXJ5f1xv9kojI/Ia9TbIWwEUOKDOlHnIaMpyQUDg8nHotQpwibmonoOXX/LPBAwO5AULpUrfcVRPQpQeI8EQeSvIuysF1+WpWmwOMcMgWpohNyq96Z/X7v+OVJNE3lCQSbX2lo0r0UhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6295
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5f1de65e-ce23-4908-7d27-08df2aa0487d
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|35042699022|14060799003|22082099003|10067099003|3023799007|18002099003|11063799006|5023799004|261009223027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	mpkk4qogxjwSM8N3pEpCH2nq3JAg1D6jmPmCR5jL+k1JgH/XcaqkVC5M8qqClVdPhX5dNAwumnayeeT37YsSfpUZYJ+4PUZrmF3EeMoU1E9poFNx3+tLYqQE0DQXZAGAWL690owCwB4CUOL1AIAqnmYRifVy2cOR3DW3eoyjrXh3dMqY+8WRyVv/VP5oReATFWNRV7QZT49lpNgllS22BM0s37UEXT9gb8ejDp8xmAkn5vhvJYxysCFAOmHYqtByT9QPwGNUN2VR6JKhG6BhGOOyoXH/7GYuhiAUpJsgzynOn4UDGStjuCJ+51JheYhsER2uBkM5HQxaidatxdcA2gUuCAZ/3iwBUYc6VJbwYeVu7WZ5zzcTUD7QaTLD2f1L+KdiZe7rhfXCcMePSj//ImNU1gR598FvR42t4zL/Nyotf9kbjJPjc1nCImwy8YF4qe5x9qw54FtfuSfkCrDsUEy178AuDqtyt9X2CG6kmt7UpVTB77kOiUZZMMmUsmrb+ue+mfk0gimVwZmtruxHL0qwqPJFx+lHaOFlViFDTZQGP6dAQisocWl6SpP1qBd8AMeg+zt6o1nPchMzRJK5ZpJTX9WyAwsZKUUTSU94RUBZQvUV7ETx6fBaBKSs9lFbsWmeVEgLBBNafC+7NpWg3mgHx/JTZqPoEIMhDfu4oy+8jvgSjvXG+7psBF8OHXNKNCfbj0mh5T1UF9vecH/how==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(35042699022)(14060799003)(22082099003)(10067099003)(3023799007)(18002099003)(11063799006)(5023799004)(261009223027099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	akJ9iYaRIW4Wly7ZtMgOCLSMS86HdWKlmivYmebIM46yB9mfSchTyJt4FQew9ieyz/FDoCA6hz5tnFYAUqkSPiglsHA7NOvwnhG2H4r8wcz4Fba4Yhdi8FsMxbM8MuzX218dINf4cMwsMmq7bs4d1e2BTBiX7sZxUvm/zWs2d/X6ScGHRVQHrubDKEijbqHhU3A9tR7Wzfg7FD3WlknizrGV2tQ7yzOcqPC6GttIZDVPJpOe7UO0MptpDk75gzYLaMiPmfYGPfF6tc8E9k6LbHeKKKK53IaGyDv0f84y2M79a/q6Y7YYQIUa1r322JV+kGEFeCK87l6fYhlkzY+l0FsH1SG8osf3CtsYuiHitXYR1ymFymhlfiXXlnFNnyDTq8M3jHAOAmkDnhsStTOO3AQBbGT7QuIetAf141QTOhYiyCTfHC3VGHIhsLgYOPuj
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 09:40:33.6408
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5beff81d-7bb6-441f-4e9c-08df2aa05c0e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509EE.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB8242

On 15/10/2026 09:20, Lorenzo Pieralisi wrote:
> The GICv5 architecture allows IRSes to be designed as standalone, ie with
> no CPU connection, to support system topologies where the IRS is separated
> from CPUs.
> 
> Current OF code fails the IRS probe if "cpus" and "arm,iaffids" properties,
> that define IRS<->CPU connections, are missing (which goes against the
> current schema because they are "required"), which is not correct for
> the aforementioned reasons.
> 
> DT schema for GICv5 must be updated in that "cpus" and "arm,iaffids"
> properties are currently defined as "required" which is not correct
> (unless there is a way to keep them "required" and empty) and must
> be relaxed.
> 
> I do not think it is possible to keep "cpus" and "arm,iaffids" as
> "required" and allow them to be empty lists - I would need DT
> maintainers feedback on that to see what is best.
> 
> I did not mark patches for stable kernels because I would like to get
> feedback on the DT binding changes first before sending any change that
> is potentially ABI changing back to stable kernels (strictly speaking
> I do not think the DT changes can actually break anything - the only
> potential issue is DT files that do declare "cpus" and "arm,iaffids" as
> empty list against the schema - if they do that they are already broken
> and this patchset changes nothing in that respect).
> 
> Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>

Thanks for fixing this issue, Lorenzo. It would be a shame if we 
couldn't describe all possible topologies!

These changes look good to me:

Reviewed-by: Sascha Bischoff <sascha.bischoff@arm.com>

Thanks,
Sascha

> ---
> Lorenzo Pieralisi (2):
>        dt-bindings: interrupt-controller: gicv5: Relax IRS properties constraints
>        irqchip/gic-v5: Fix standalone IRSes OF probe
> 
>   .../devicetree/bindings/interrupt-controller/arm,gic-v5.yaml     | 9 ++++++---
>   drivers/irqchip/irq-gic-v5-irs.c                                 | 4 ++++
>   2 files changed, 10 insertions(+), 3 deletions(-)
> ---
> base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
> change-id: 20261014-gicv5-irs-no-cpus-8c5fba3f9940
> 
> Best regards,
> --
> Lorenzo Pieralisi <lpieralisi@kernel.org>

