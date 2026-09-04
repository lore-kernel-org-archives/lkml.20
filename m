Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D1B346ACE
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 04:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788497168; cv=fail; b=e+E54h51j9ltAYhkDrsav13vlE4P4y0BpZ1vdaiIPQfZf2kvb1qPWuVDbRBJKL9gdTGU8WY0mP6cSgXOuO4kZWB13YeuneBLMRKy8EfKkHE4MR/xfvcPTK1ut83UCVNye7KTx6v5XdalXL81gmnbjcY7RZks2sk3Y4hOa0KK0gU=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788497168; c=relaxed/simple;
	bh=oqZ5x51di8d1YX/05vjW3dP3S00aSzI/+pTL7gaoZmo=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LRKHpEjFV/OUUg8mAAcr5c6LyO271k3cpsqq+TXfa1IMbfyKYBN+rJ7Xx5uheiIq6zjyYyuY1GxLh1TTahm02AhD5hNurbzcLSH+kTSqt9YNnvxSBSzrLtQOV7ClNCHeBEnpsw4epBTX5xzZNhembV70An3YrhYHXkEOd3+4d3I=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qJ25rkwk; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=qJ25rkwk; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qJ25rkwk";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="qJ25rkwk"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=thSWO+WhAJ1XlugVv+frEEULK6zVbR09OmJu7IkrMeKh9VrKypXbm7mAMBtH/9oh6gJARMLZX3HVik3T/hbbDl3Tyt/nP/wF7F/8Bwm7whleaUoq2cYDXC4WrJTMtmuzXq99ZsRiWyiidi85tAvsrG0Q6xqwfJweMko4iaopj2wog9UhXqRwOrzlHXNLi3LdizkxOptErjOoVxHZIESYo7NJZIsqZSNk32OkGHpOETI/N9nxDp62UyqyXGgf9gBTQ23abu3WRsn6R64C0K4sfk/d720m/AQG/O2kPeNgiiCRk3yeB0SC70Huoh/McGiKV1HQL1r/7z4qzqKxiDVZqg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9szKMuYiuc53/9UXhnmzCnC/rHL9+J+WZpe9w0AaJk=;
 b=RzBNpqcjxmOnj5P/tXbQDqk9XfYq976mNt6wCw/WqPcwEW9seegXt/Wgv3XOY2ou4GY7dUEC8fLSzbs8wl2bSHefg/Pj7Ro+KaZG3rSG8I0kufWARr2Oyf2iqlotyqrkf6BOkcHpGhBlhbRuXyEvnRcS0Fv/0MEorV5mKKdgVPEwpz9F3R3Gs80LupEd7sVh3xsYcb0sr+l09Ewmxmwv9mvjJZgELcULZtFrPC5Xr0aSUbk6IrYzQZWJApPFzP2JlIVBQh36bYfI+tajmoHcJj/39M504VHCpL+PdoDSuNYzD6RwbHAo70Jnyq1+rsiny4eaF8TrVk0x7OYoESD39A==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=kernel.org smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9szKMuYiuc53/9UXhnmzCnC/rHL9+J+WZpe9w0AaJk=;
 b=qJ25rkwk8ui/JiQXrHF2BBHkN0XGA7xV56rRR1uohR3/G/l81tSFcdGDaSBhpGo4YCsV/wR3Ew5Y75fwU6W9scR6RwdjLXfPcLP746WQxWz9GapE19Jz5CYQZ4n6gI569y8KzxdMRLmQXe6rFC9Ga3jDgxmtC9kjIzsnJuh2X5k=
Received: from DUZPR01CA0172.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b3::29) by DU5PR08MB10822.eurprd08.prod.outlook.com
 (2603:10a6:10:529::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 04:46:00 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4b3:cafe::d) by DUZPR01CA0172.outlook.office365.com
 (2603:10a6:10:4b3::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.12 via Frontend Transport; Fri, 4
 Sep 2026 04:46:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 4 Sep 2026 04:46:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CXkpL7De90Mfit1wriStTb7B8sswL7L7ygJDAy3rCu9gCdayHP0mwdo5afb1TDP8fWaYmNuKHmZr186dOpZXjIuNco7Hywf0xjmlfzArQBn9tmTO6hj4RLL+AmmySuPS42uh7dzI8PzcC5yvEWDxJxtha4aLRn+KZEi+qCboASlF58+s4RRx9WCTkIqGmmG2MejLYCK/UBrz63PxszYDXe2LOKSuqb2GeK0AkEczkkQ7VGUVTb+2ctzgWK9jPSn3es6pBDLibjuWZEQl5qaZ0GwF7YCw5kezXedvQdayLf0LjXdytFwr/ijG3Dq8kPtRmPXyRxywEwqFIe/2Qyu7ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w9szKMuYiuc53/9UXhnmzCnC/rHL9+J+WZpe9w0AaJk=;
 b=v8a9nivX8d8BDknRzr4ElfwGyCmhXL2g/ExVxKfrzsHPHgSv0sETfJt5SwmhK27dihAezZDqrTIcW8szmC2zkcWBhbs10uyuZqCEjVm0GNOso4jSeMWKGv/L/+kF14Ja0GJRYg0W6vMZdpayQUWz2pbiWiGkNEXkz3JPBzsXDtzJbpDLJfUyLtrmY3FCFMA/oWcSsVqmoVAMD0ycVKHJ5T7V4ijDVz5Ai1i0U50I1muXmdgoJYsfgywICcMtxqwI7ku/pVCa5SseaxbDFl7AMpy6oCkM01JVLIqagPDi8cmDYn4e08Wf7tSgILsOMBJp3KVTqe6mD+O8flOPeQWNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w9szKMuYiuc53/9UXhnmzCnC/rHL9+J+WZpe9w0AaJk=;
 b=qJ25rkwk8ui/JiQXrHF2BBHkN0XGA7xV56rRR1uohR3/G/l81tSFcdGDaSBhpGo4YCsV/wR3Ew5Y75fwU6W9scR6RwdjLXfPcLP746WQxWz9GapE19Jz5CYQZ4n6gI569y8KzxdMRLmQXe6rFC9Ga3jDgxmtC9kjIzsnJuh2X5k=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com (2603:10a6:10:417::12)
 by AS2PR08MB9149.eurprd08.prod.outlook.com (2603:10a6:20b:57b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.10; Fri, 4 Sep
 2026 04:45:27 +0000
Received: from DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047]) by DU0PR08MB9203.eurprd08.prod.outlook.com
 ([fe80::f1e:73f2:57df:4047%6]) with mapi id 15.21.0382.007; Fri, 4 Sep 2026
 04:45:27 +0000
Message-ID: <8015b54d-340f-46f6-8b84-f11b5b1bf301@arm.com>
Date: Fri, 4 Sep 2026 10:15:21 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] mm/gup_test: safely calculate GUP batch size
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20260903115033.162218-1-sarthak.sharma@arm.com>
 <aplp-uM2oQtjuWnZ@thinkstation>
Content-Language: en-US
From: Sarthak Sharma <sarthak.sharma@arm.com>
In-Reply-To: <aplp-uM2oQtjuWnZ@thinkstation>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0205.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ab::14) To DU0PR08MB9203.eurprd08.prod.outlook.com
 (2603:10a6:10:417::12)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	DU0PR08MB9203:EE_|AS2PR08MB9149:EE_|DU2PEPF00028D10:EE_|DU5PR08MB10822:EE_
X-MS-Office365-Filtering-Correlation-Id: 4967477f-6203-4744-d1fa-08df0a3f6b1d
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|56012099006|11063799006|4143699003|6133799003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info-Original:
 8I+oQJDzkaYuBB3XLCl+HqVuR+rh6yHY0q2ph40P7UBLvRCHUE9Dg+AipL5MZ+ZpDmnK6pPvopSZGS8iDGuQsRuVWPRt/8pYZqQ+eZEpara/PSMHVccwIJMuHdmwtqXQFO8egumW4iG2oT0aZnjXbjGEDdwhRtw864J4yX0GenIx6ML3782QWCtPEriF9rsZ2Sl8I8mQp0Wh9TzGH498GysYE5YxUszHZBDXfScu5IX82XCgMpvf3PajqHu4hanU14lJSOlqkbiI+myLsZFE3txM1LxCWK+ddoKAkVxOU4UTZjmXBTKzsE1TocPQKqeq2tG6AvCAytJGEJ1Q8hgi+FwLNlqQodG8AUbOSCJcz5RtEom6iJrFDhUe7fo4xWgIEK8UzfuBPPCe1SVkes86wimDEuQ3uozz1cJ7sOFFTRWK8rSwU1Rlj1UQTXmXDgojDHuFpqij1+C5J2eITLDO220f9p0K2cGEJk8IDbuVsGKJgGkhqJvzC+l5cxnoLR9VcGveMvkhzyju8BdDBtnffzG6zgjZv5ivoMjYKnvvviR+Qgi+KfNygPa8Syt8qljlySMyrPY9fjkrh9it77wEyklRGVWyfQ45E3cZAPKxyTEJJu57JIvB7qZMlw2ZsQoT4RqegC4rsIyE1xR9nr2dyiEEsuAY/lmXYzOWf6SQJcY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9203.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(56012099006)(11063799006)(4143699003)(6133799003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-Exchange-RoutingPolicyChecked:
 SwGa7o2cnZtbU6xF3Qgbt5JjQ0wcRLV3tbYIisTd5fDgXhiJINxqp0DAj60wMe+85erSgBXjVkHD6ncnso6OFUwKgy/u1Ncap85RjZDzltKr+M8T0izreD2A/65JHHl6OMi2F9Ain2Ucxoktt4giUZnFM2gN/y0nxoRuWow2U4XSTwzNDGSvwTmTto96D/NljpqUsjfJiIjukjksY6Ap+O5BIE3aGKjwm50/ZcF0Q29erzrIA0J1Ycg43QI9MiqSwR0H2WllYaGXkpgWveuS8njfJzIkb2/WFcV1icVqqg+DLiAnamKS6CMwk3DY1uSRL5M306mbqtLJNDrbt3skeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9149
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	efe139bf-f5c0-4931-5246-08df0a3f56f6
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|35042699022|14060799003|36860700016|376014|23010399003|1800799024|82310400026|4143699003|6133799003|11063799006|10067099003|22082099003|18002099003|56012099006|13003099007;
X-Microsoft-Antispam-Message-Info:
	4/qLH/82Y2vtb5n9vvsjxCcVjfLoAYSRHOPBiUjyB6Ey2s4/CfBvItl6z+Idf0dz70MoJ4/i13gPt4IzULZy9sEvuyq8eE0DeFcFGgEBsO1Ze4PgVetI6hGko4BxJ3sYgHc2jUBeMO1Rj8zwJ07rZAgWs8Nb/j+J0vUGYeecsg4EG4aw8FDZatj1uHskKgurRhnTJ3dC8fWtNVb/3Q1hNVpV8PlDYMjo3pq5rqH5ygfQR33lybpS3Ak/QuHc/sKAOkAvmrexbrbyNg+TjtSCaRPDObUszxSx/IC6AnifFameSvE7LreAQRCCQTMppijemQia7RyraA5iDl5V77hfKgJ2m28roH5KojSxyE487ElvXOmTq6dL/CYnvsotC8Snk47erWB32rzRQPdZqIfgme2oXAqWcO/HEC26KLUPnXH/d7ztRzQjl1er5FOHX5l9oB7dz362egbbEQN49ld47lvKywG+7wJFTtgHNMJMmMJtymrnzfwfO+kcB5J7jsJNxQ+/TvFs4J6xXgulcWhJtNl9sywn+9DzFEpAdCbrvAQ4pkysPszwsNSNjUK/BBeKW6TnEjcLJTA5Qsfg+cu4qRM9CvWj6023i8gIynouHI2nbdOuwlMoA5UIHQ1mOZ2AwSXOiFmCg3RcYFFj81LH/UfLES8F75KxuyRap9PHaws=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(4143699003)(6133799003)(11063799006)(10067099003)(22082099003)(18002099003)(56012099006)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	oy56AXDYmv+kKVsF+qEIZmcZuNNTRk/sj6CcTDiRvgav9e8PMa/rn7ItScqL49TG+D3NdVT6GAgBIsQEqXKN765bJYQITJJDJAI78VddIcaMNf2yk/+HJRcZGG6A17e0reZHQQd06etDQzXTNzxagSD+Pa0Lox0aCDfFQrioajxVhFIkU9XknIGhUNEKP8fW3/MIv+qgiSNotw58cCNqKKksEFrU+aiZjAs+JL+4PWZEMUB3GP+BpDGj2bDo43fDyG9mnXTYRSKI73zLX/XlcM6knFOoyq5AiZFJjFlXBWjo6NMHdluI1fv6nuc0qot1LsAw2gfjCvxy/PaBDSn4+Vst6tz6DaXHfHT7p7B16EttamGtLniy9ISSX6YCDLKIItZTiPZy59z8+lOcHSiNDwQTt0DqXP9aJT8Y7wfxqa17Mdnyt4tCMKVYuAN89b+4
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2026 04:46:00.5202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4967477f-6203-4744-d1fa-08df0a3f6b1d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU5PR08MB10822

Hi Kiryl!

On 9/3/26 6:09 PM, Kiryl Shutsemau wrote:
> On Thu, Sep 03, 2026 at 05:20:33PM +0530, Sarthak Sharma wrote:
>> __gup_test_ioctl() calculates the end of a GUP batch using:
>>
>> next = addr + nr * PAGE_SIZE;
>>
>> If nr is too large, it can cause next to overflow and wrap around.
>> If it wraps, the next > end check is bypassed and a large value
>> of nr is passed to the GUP call, even though the pages array was
>> allocated according to gup->size. This can lead to out of bounds writes.
>>
>> Also, when fewer than PAGE_SIZE bytes remain, the calculated batch
>> contains zero pages. The code still calls GUP functions with pages + i,
>> which can point past the allocated array.
>>
>> Calculate nr by taking the minimum of the number of pages per call and
>> the pages remaining in the address range. Stop processing when no
>> pages remain and calculate the end of the batch using this bounded
>> value of nr.
>>
>> Fixes: 64c349f4ae78 ("mm: add infrastructure for get_user_pages_fast() benchmarking")
>> Signed-off-by: Sarthak Sharma <sarthak.sharma@arm.com>
> 
> Reviewed-by: Kiryl Shutsemau (Meta) <kas@kernel.org>

Thank you!

> 
> On nit below.
> 
>> ---
>> Sashiko reported the issue fixed by this patch while reviewing the patch
>> "mm/gup_test: report actual pinned bytes". That patch has been applied to
>> mm-new. Since the two fixes are independent, this revision contains
>> only the GUP batch size fix.
>>
>> Changes in v4:
>> - Simplify batch clamping logic as suggested by Kiryl
>> - Don't call GUP functions for an empty batch
>> - Drop the pinned byte reporting patch since it has been applied to mm-new
>>
>> v3: https://lore.kernel.org/all/20260901083452.115365-1-sarthak.sharma@arm.com/
>>
>>  mm/gup_test.c | 9 +++++----
>>  1 file changed, 5 insertions(+), 4 deletions(-)
>>
>> diff --git a/mm/gup_test.c b/mm/gup_test.c
>> index 185ba3bb8ed1..1b64e932c4c5 100644
>> --- a/mm/gup_test.c
>> +++ b/mm/gup_test.c
>> @@ -139,11 +139,12 @@ static int __gup_test_ioctl(unsigned int cmd,
>>  		if (nr != gup->nr_pages_per_call)
>>  			break;
>>  
>> +		nr = min_t(unsigned long, gup->nr_pages_per_call,
>> +			   (end - addr) / PAGE_SIZE);
> 
> I personally would rather have it in two statements, as I suggested
> initially:
> 
> 		nr = gup->nr_pages_per_call;
> 		nr = min_t(unsigned long, nr, (end - addr) / PAGE_SIZE);
> 
> It seems to be more readable to me.

Both forms are equivalent, and I would prefer to keep it in a single
line instead of having two statements to do the same thing. I don't
think I need to respin with this change unless you feel strongly about it :)
> 
> 
>> +		if (!nr)
>> +			break;
>> +
>>  		next = addr + nr * PAGE_SIZE;
>> -		if (next > end) {
>> -			next = end;
>> -			nr = (next - addr) / PAGE_SIZE;
>> -		}
>>  
>>  		switch (cmd) {
>>  		case GUP_FAST_BENCHMARK:
>>
>> base-commit: 178b3d97bf1f15f598ea7cc615a40c115e528e1c
>> -- 
>> 2.53.0
>>
> 

