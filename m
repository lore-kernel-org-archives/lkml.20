Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013054.outbound.protection.outlook.com [52.101.83.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F48F470433
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 08:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.54
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790151721; cv=fail; b=dQMXD/OiKFLewxvMSXOkzWN6t5gWQQUOrSFMZNgDXcwJyZX8ZhXuk2jG2sCsgMUVgcFuLkJaHPVjhUs4fayyxb9T6fCnSStYJBa/58mVuVVurfR+DrDpY4KJsjOCn5k2BTGYGg3esbHyi5IPqKwIFvDypX6nqpwtg0YHvZdu2x8=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790151721; c=relaxed/simple;
	bh=mr9I/qnRy/dcIA5te0O7VOrdi4cGXJJsmxe/oxd+NdY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=PY9a4ihcLtUkeEDmIpIqLBuoodJ0sO4cTLmkfBMYWC+wox/xUPe42gVIyYEHDgO0Iy6T6wkDu/Br8/pVu+XQKmlH3pLIcvo6lp7fKXABOAyKArWHMSDajzUAdLoMKt6eJCgp+7cohiINFiB/QikujdOMTCUDWmyIpMp7UKxSUK4=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TJEsjxIr; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=TJEsjxIr; arc=fail smtp.client-ip=52.101.83.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TJEsjxIr";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="TJEsjxIr"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=hnkbPPTJoM8uPlFqaifVGAN3xnegvsBJpkZU6hw1Qn30LS/8O4Y4mBe7HAhj0eSNpJ/DnhqAo2M5wIY26uUBi3a/eM4Gwecy/F357Qiv8V048YAuorCLpCRuWPyCktLVX8YZj5lCWCMt+tWTPViBCLlLW1FdAhHp4fYkOSTP5JpQBNS3lffraA+7wnuMUUjzFOEUJ/Awd/YYDEQW8sUusjjd0LtDbBFigFCf47XIso1TZ2Aes6sX73MlqrE7/FziM41JUkUhWUqQFqSV32sHPyop+M7oWHFZbn4zk+mqmqUEC3jIjRfmOuq4w6fuzgGFUgqYyGAyK1aNmNcRvhRCxg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+6LYXaK6tFtch8lAZ5t7yTQydzuG1SnW9jeB6750lY=;
 b=KQ3Ukm5R51kZQuxomksUADzVkmrSvA2yLumXP/QWbhMX5Jcxp1lHF6xqT3ui9dzNQdd3TwiH33LsWtuyldPSDXOWRx2MxTXbD61HerSXnto0eIhg/IzjtgtcJdVTyUlsfOS+PCmF/uxt5kGVzy6zY8G74e0NpVWWCNU6H311KScDV2PgEFny+Kr+v57cfsGEMR1wEimfW2urcu8g5epz2MscI4LbnmV+NgmQarZ63OBZ9r24HHaBWn9JXcjDljwCJTCATrk9daVIPOH/cIgHYpHz5NMTnl9RhUPHO9wYNQwe0ncNAKA9cw2sndpGZxwBSU0UfIVAQQKcQI3ijibGOA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=linux-foundation.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+6LYXaK6tFtch8lAZ5t7yTQydzuG1SnW9jeB6750lY=;
 b=TJEsjxIruwSyFofNPmT5TIcVrLrwngnm+D9kFtRuKDbVH4gb6Rij2r9vTYXUI9ZRW8bBkXLdmh74Sw98xc1X4td2d1hsTptMAPh3xU0prbOaLi6Ltb8gJvZ+raqCQbxg8n8x5gYz2tc2kJw9Ywe187Vw7bUcNxv5bViUgP8WYoI=
Received: from ZR0P278CA0134.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:40::13)
 by DB4PR08MB9358.eurprd08.prod.outlook.com (2603:10a6:10:3f2::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 08:21:52 +0000
Received: from ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
 (2603:10a6:910:40:cafe::55) by ZR0P278CA0134.outlook.office365.com
 (2603:10a6:910:40::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.14 via Frontend Transport; Wed,
 23 Sep 2026 08:21:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 ZR1PEPF0000E6B1.mail.protection.outlook.com (10.167.241.88) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.8
 via Frontend Transport; Wed, 23 Sep 2026 08:21:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5u0Kb6ktLDuSB+LMvruIBKtRUIuB9hv9YJ1Ie4Dday891YrnAhzDSsz2UJUuLQq5ltmfk2sIGX4mGUZYSiSpkxAzBpzMBdGO41lhz4EFVwHEM/TFbXm1h7CSV5HkBKinSvgnyzEkRCM+NhJ3GVc/GKfxw0SQAFXO3LtQa78bfgVmwmcZbyPw50vJs+qFcSxKvlREhDjDcGYpc0DhYnB6JTEt6bT/0A5v7gfvI2/mzau6t+IlkytxR8neInziop+hbQO/lzb12p6Czv7TIgsV2ZuCkD+1fjnkipjWBGSTMJjDB2dUStxGgI+pD5H9vuFv57tLqQcXZbN3PwMXRUx/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+6LYXaK6tFtch8lAZ5t7yTQydzuG1SnW9jeB6750lY=;
 b=lEKtPhsE6qBvXTZTN+e14+Cqx9PNsnDFAaT39kKa2FWwQAIoS2QGvJ0w9PC1sUq3mpUb+gdf/GKp9InHVUy9Pkz8wC4J3Tt9tY+/gVYomr092nIVawHglRUmGRDJyVLTAfRDuKyCYrVU/E29UiKK1hieXiRp4+5awLXQpPls8dLUAD0Gn+78txQtY8FrsBxXna1plaPfCpb+kohe2+dZ5mszzbsfQAmC9Yz10TdI4pDGSHZYGwf/0CjVSphGhcl5AqdVGEipClFiXM5yhMvKqBB8UNEaGLWpRaFwPAxrmJjqE0vcC6MGV2h9LhEbDDdKRbrZRHVH+f9FXjcodYrVDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V+6LYXaK6tFtch8lAZ5t7yTQydzuG1SnW9jeB6750lY=;
 b=TJEsjxIruwSyFofNPmT5TIcVrLrwngnm+D9kFtRuKDbVH4gb6Rij2r9vTYXUI9ZRW8bBkXLdmh74Sw98xc1X4td2d1hsTptMAPh3xU0prbOaLi6Ltb8gJvZ+raqCQbxg8n8x5gYz2tc2kJw9Ywe187Vw7bUcNxv5bViUgP8WYoI=
Authentication-Results-Original: mx.microsoft.com 1; dkim=none (message not
 signed) header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by AS8PR08MB9020.eurprd08.prod.outlook.com
 (2603:10a6:20b:5c0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.13; Wed, 23 Sep
 2026 08:21:19 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::af66:6019:a08:d04%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 08:21:17 +0000
Message-ID: <a5456d59-aad5-40cc-ac89-5c0c113b560a@arm.com>
Date: Wed, 23 Sep 2026 10:21:15 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC] cache: Make cpu_cache_invalidate_memregion() error
 out if there are no handlers
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Conor Dooley <conor@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-kernel@vger.kernel.org
References: <20260922-cci_enxio-v1-0-00bade212729@arm.com>
 <20260922-cci_enxio-v1-1-00bade212729@arm.com>
 <20260922191808.b82fa138c8bc80a1285e8ba4@linux-foundation.org>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <20260922191808.b82fa138c8bc80a1285e8ba4@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIXP296CA0035.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:36e::8) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|AS8PR08MB9020:EE_|ZR1PEPF0000E6B1:EE_|DB4PR08MB9358:EE_
X-MS-Office365-Filtering-Correlation-Id: 03425880-20b9-4bb3-aac0-08df194bb8a5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|56012099006|4143699003|11063799006|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info-Original:
 op2ml9VRrenw9Np/DrYy4wLycS7roH5RVo6h5mCXfJgiKZpGJUUbywZkCRCv20k1ONCap0OVnRkmwA3XgP1BeCFN3IuXXIjz5UVlj8z87kv5MSgnpaTHerQcj0oEd+O0hrTQ2fjfCKi8HGv9ufeJMrqhXA7Ai5kJCuUZs8rekbREJyFWi2X8+zjXrNM+9DRrEXqrwi5EWEcowDtE+OX5SDMwtyTMppPv9tZtumSnBBH7yyeyWFH//Uju+dlu299OqMjhvdTIOsglS73IB+cAkjPI/rthCRcS+VeKkecmTHserTNYDf+sznDeI+K6IMWiZ+ATm5Jtv+16L7foLMJ6NioklSu7iZ5Mis5Ms39q0cAVodPGvUR7zcdeEBRCBQvJ4RKjmdxuEAJHHtJ4rkm2STERfd/3iV5ITMUbKuDY3WrfHj1I5MaN/dOv/8oVb2X2CB9vZ3SsMN4eVJPPibDRzzdE5D5y9O3v6AJ6mjwBueqyFH/JW2Rrr9UwIMRA41s2FJ0BAnMtaeRRZV1VUTphIR2Ks9ukuhth4rxyNPOdBWGMLh2wFkugBPDPzw14L6y2noo542fyQCzLRkz9+cuWsQiAWMa+ZdcDregl2gdDOj6rL7oHNd1IEm/zqOnt13nX
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(56012099006)(4143699003)(11063799006)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 WyFcLV0Zl1ytBfMfN4M0wfNrZVPzRrWgfhW0jqsYF8cFHdQ83QuMSsywh5sRt70F9TYDYskHzacLx2UNYn3P9IGj8kO5VaWKkCO14hQAfEcMHxVqE0Ix8JWHsR2zgsbSiLFBdm/x8DRTEUM1rNVLEWi9XVTbJ4O0xnrYS03NxbQbvbWYj1Me8HaB4WzlytybnUSlWd5RRqKlqrJqwMv46Xouf/8HzHaM5wH4Cte4vmsky0dCU660YIMRGPL3zSM24dav/UvqAOUsm4JbnyCee+icaDpPlJ8ca6wtibUwFDzzCy7KGWIULmGkyt4g5wysEeNkcnSX6NypoQOASurguw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9020
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	4ef59e6c-9f2e-4223-6714-08df194ba40e
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|1800799024|14060799003|376014|23010399003|35042699022|4143699003|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	AegbhS0Gf7px6ffCaRp3hLCgqpQtBjNmx9c/TB1NqtUz/yBvFh2kGEE7ZUCxQbJYTSrtuYIxGy98trocZYKIzP9TI4lieIluGVMvNC8re960uDOwbvzk1h7VTf8M5jinP2enW65Vb7VQabVmTBJy1pi1a7BCgN7n+s46QHjspvI3YKpwIQG7nPE25pGzpXy/Y3kC+4OtxnYGikAlFm1Vuf31MjqdAADAiyhEJj+h3pHscm6GX+dNoBJIboBnds8UDV0SYCmdK2Abg96x+sc14F7efcHtXQCsdxUGg349jXm6Y71wMhN837T4l+BcHIlavghMpE30XnrNBXCQFFpifU1I1Cygg7y6z9DpLuqPKKy7aUuepj+zKf7LCydKG0j/O5ukTqdpU3QvXvmrfvkYRd+L0uRZAKgioCQoVpLwX8L+Sy+cv6/argDCpajKvvMlxPxvxupcxiGofdkx/jOZI00nVDYXrZiKxxDdM8eD5a7mpI/0OCou9eRtpWuSPFJgzDbWbyt6x0naiJmqJ7zRsrASsKeyq/Gazx0gIHJpLAFpARHJNabdviruwDxIdWJbdo+EFd7gsSZ8ewOS9FzlWQvaNPUZOqZozXFqEG0y3dMbnVHd5+w6v6Wu7Slnv7M/QDPig/AwlwiExaV+jYW4cQ==
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(1800799024)(14060799003)(376014)(23010399003)(35042699022)(4143699003)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	LktygSK8bcLJrIJ5DyC4B3rCTrgRcWWFlhT4HPCmXnzGZr8ko9eNgKMThv9dHemQXA5vUaym86QYWgm1YBIyfqe2w3+Ag9nrq1mCh9BWtxX7KDCAjkGl85VPPSsfo5rUDhDZxHRfQjUr9XSBQUHof3by8uGI/pcGAfGupOPdrUHZQLkd8STJhDO1qjka6VBnNzBt9WQY0sy8ioInX5nVuj7+l5PUL+PiEFKuM+ZFU4O/irODdmD3q+6M+Fku1xFEhDi4wpgHQ5fjaBfrdobte3cvdhMzA2yIZsr7jtck39c5NBO7tLExw8OBq+/83lAUwfe/UdEPJKqsfg85nvBzxqwIdYjiXL+caJ7lIRsfgZlapnNT0whFJKzPatW5AelBGe3k4DjgrycsNwrAMInIRokCoILn2nAHlT3w8dEZ6QNr5uD6V8br1MyA+9/UTZUH
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 08:21:51.9494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03425880-20b9-4bb3-aac0-08df194bb8a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	ZR1PEPF0000E6B1.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB9358

Hi,

On 2026. 09. 23. 4:18, Andrew Morton wrote:
> On Tue, 22 Sep 2026 09:29:31 +0200 Bence Csokas <bence.csokas@arm.com> wrote:
> 
>> Currently, if there are no registered handlers,
>> cpu_cache_invalidate_memregion() returns 0. Callers are expected to check
>> cpu_cache_has_invalidate_memregion() and return -ENXIO themselves, instead
>> of calling this function. If a caller forgets to do this, they may
>> erroneously think the operation succeeded. This is in contrast to x86,
>> where cpu_cache_invalidate_memregion() itself checks if the operation is
>> supported, and returns -ENXIO if it is not.
> 
> Do you expect any callers to be altered as a result of this change?
> 
> If so, full details would be helpful.

Current callers, not necessarily. Future callers, maybe.

Presently, as far as I see, there are 2 consumers: CXL and NVDIMM, with 
3 call sites in total.

2 of these call sites [1] [2] are in the form of:

	if (!has_invalidate()) {
		if (TEST)
			return 0;
		return -ENXIO;
	}
	invalidate();

These types of call sites can stay as-is.

The remaining one [3] is in a void function, and in the form:

	if (has_invalidate())
		invalidate();

Lastly, while not a consumer, here's what x86 [4] does. It's possible a 
future caller will want to replicate this:

	if (!has_invalidate())
		return -ENXIO;
	invalidate();

These types of call sites can do away with calling has_invalidate() 
going forward.

[1] 
https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/cxl/core/region.c#L242
[2] 
https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region_devs.c#L93
[3] 
https://elixir.bootlin.com/linux/v7.3-rc3/source/drivers/nvdimm/region.c#L113
[4] 
https://elixir.bootlin.com/linux/v7.3-rc3/source/arch/x86/mm/pat/set_memory.c#L372

Bence
