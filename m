Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.61
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793253118;
	b=a7l2kXOWzFHxjG3HtkBbBDFp68mLfdInlxgHxbos03/l9HMzfIb8GBMbQzMLPelRiAMi
	 0fcbysTk4f7AuzLmX51LU46MQuj7wi1flFqTJQuAuYqY4tN6IPG23jvEdBSbmPuwWQRMZ
	 CzlkhPZzJLkpvc/FELNzi7LWyG/2+8gGaB+wiGBSeM+6DmX6gJjeGMN/e/fsC+su3Uy5k
	 RrewnIAbiAL9RjESJvdZeQ/6t2M3/Hkud96SK0c9t1CNX/8X04rCbckb43/iM0Mp3u71w
	 52GjoPKCKLEhU6fJazDb3cnWTPTKUUIV4Ow/7UdTlEC1TSlIIH1nn8gIXTtEx8Q2ngw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793253118;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:Message-ID:Date:MIME-Version:User-Agent:Subject:To:CC:
	 References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=8GHIN+BezP5E4cFcEnKietJaaRrj32cVdp3XGBe+Ko4=;
	b=GXg3qp4OnsWpzOOaxzVg7ir+ZVmrx59690xjB2+UcamFZDJewUDLS2F1AgmJizuqZSdS
	 n0QwNpdvOMEbTwU/GoWfIUQXQCmjr/SsPpwGd7yU7TtzqzukA9JvYM1RMtqE9//ST2PG9
	 7LvV4z0pQwdJ+1a931UHWU9mjhJYbT3qbKA3ebJzboHVfcdRRtd2UgeHDzzgM2PUV4ag3
	 e1EcSydYOcEQu4+OmRU3mn//cB1tJfsEMlSFKOoEXiHyWLAg/aYre6skR5+TsIxYwa0HK
	 vktkyzkYBx+Sw6AHq/z+sTnohKfnpG9ppjh9gmM7U74GFw2CTTXhjsZHDqx44NDyMqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amd.com;
	spf=fail smtp.mailfrom=amd.com;
	dkim=pass header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0qFfRZuA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.61
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010061.outbound.protection.outlook.com [52.101.46.61])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCF0606A31A;
	Thu, 29 Oct 2026 05:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CCF0606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=0qFfRZuA
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hesJ3D/Ouiy6BHnb0pBueO+w8i7FkgjQVkOZACPW+3Erj+U4BuKdqkaEJpBiMqxOYaK7iFDm5JYvwBQKyV/HXDm0uq9WBydmN26TuvAIa3JgvUgpBTQkNFpDCckvnl5ql6/pSTbH/Io2Nc8+5uFHIc+kRNvzu6k56ALs155hZZErLxc+Scf0WbktkUyqpc4HsjUeuNmen6VLvI8qReuwEVFrUoqfKAvRHxqX0XG6xYyXJKl9AjQNjcDd/pKmgU4b4GyEyclv+mmHZL9BJltvxyS/T6Cwc22CXSxehH+/XylvuC4C5pe3D8HBdsfGXY3f2wj/YaqI1lTRqwf0VNOy9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8GHIN+BezP5E4cFcEnKietJaaRrj32cVdp3XGBe+Ko4=;
 b=kXKazXX37TsG2B3rsP7ntEm3xORMfepDNUZO8ftUVIx6S42DAIhAswfxZ7fmMSBSfHnou+af3oX8HEM5TDbRpHz49d9GGSx8NTpjEapGL/n7ovjyHiN3A3B33D51jRtp/boXfJqSMxScKrIIV6HGBW14sfzQORYzXrYNDFpqZnUSKN41JTXKCXdRW7cj92vL11jabyd4eygTuSJR4PRxSwiUrE8l6QItPN6B0rvM485AjdTZXpS+iBTGl8hFvEhXCFQf9RASGQwbw2IL2sH9HJmYGQHOvH99eoSjzjoxuKZbKR3MCnBlnaEAQanlCv3ffXluFOXfVS42ZVuw6IR+Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8GHIN+BezP5E4cFcEnKietJaaRrj32cVdp3XGBe+Ko4=;
 b=0qFfRZuA6fRMeU9eOdDQTByr/1y2tPFegzzm/KTBaDKHS5AyEcGDEVl6EMp1m6zse3N9vepB91RQJncHe+vW516Leo6PJ3APosmhoQ4t944geSOmu1ne/tFLpLdIMi1Vw/eLU2KqVhkAnjLk1GJmdLQPVjYvz3fHoAp+3nCzuag=
Received: from DS7P221CA0017.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:25c::7) by
 SJ0PR12MB7082.namprd12.prod.outlook.com (2603:10b6:a03:4ae::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Thu, 29 Oct
 2026 05:51:52 +0000
Received: from DS1PEPF00053453.namprd04.prod.outlook.com
 (2603:10b6:8:25c:cafe::22) by DS7P221CA0017.outlook.office365.com
 (2603:10b6:8:25c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.569.7 via Frontend Transport; Thu, 29
 Oct 2026 05:51:52 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 DS1PEPF00053453.mail.protection.outlook.com (10.167.23.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Thu, 29 Oct 2026 05:51:52 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.53; Thu, 29 Oct
 2026 00:51:51 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.53 via Frontend
 Transport; Thu, 29 Oct 2026 00:51:45 -0500
Message-ID: <8d6f589c-4427-465d-be5a-17eb99f41a91@amd.com>
Date: Thu, 29 Oct 2026 11:21:44 +0530
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
Subject: Re: [PATCH v2 2/3] sched/numa: do not feed tiering promotions into
 task placement stats
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Li Zhe <lizhe.67@bytedance.com>
CC: <akpm@linux-foundation.org>, <bsegall@google.com>, <david@kernel.org>,
	<dietmar.eggemann@arm.com>, <gourry@gourry.net>, <juri.lelli@redhat.com>,
	<kprateek.nayak@amd.com>, <ljs@kernel.org>, <mgorman@suse.de>,
	<mingo@redhat.com>, <peterz@infradead.org>, <rostedt@goodmis.org>,
	<vincent.guittot@linaro.org>, <vschneid@redhat.com>, <ziy@nvidia.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, "Huang, Ying" <ying.huang@linux.alibaba.com>,
	<riel@surriel.com>
References: <20261028041253.74839-1-lizhe.67@bytedance.com>
 <20261028041253.74839-3-lizhe.67@bytedance.com>
 <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <CAN+CAwPM=-sRDypP0+ZxX8_CziBRjXbxKEE3UZGLzkmOWrajNg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00053453:EE_|SJ0PR12MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: d14bb7e2-dde3-4cf2-ceb3-08df3580bb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|7416014|376014|36860700016|82310400026|4143699003|5023799004|11063799006|56012099006|261026121527099003|261021121427099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	1/RONOmcmKtj7VreU/UAZKabmKjOwiWVO6M+EGfnT39ZgHFvlciIOaj2454ZwbJFSxbIFbtqjQH+H3IpD4HDpJ1miOPIYA+FVirBUBiRRstE/AS7jsFIu/JDHrTaxfm2Aju2tZC+WvdMhiyETTWyZ3wua3ZbFUQnuSvMiGKFuYTgR8S+I5TQWas4r3q+yLW8Wtw7p/awkI06TkdBDSERhgS20HGrmzu+pwCJaxYvULjvH9UTvMTUSY/Ujq/Lv0scUQCPgMnMpuf4lPluBrh3VVh7L1MJxozhpZ/oAS2ihMhUK93h5Z6I89Zki2JaTwPgE2swK2U+bfI7gZc4pdwCmHJK7XmI+0eQOTBodcosme4WEPj2XOdyIX+4YKepejLxMr1I4PBJtS17xKj7ZIXhg6tf4Fb8w5GMWEgEuOs6JIydG3OQOYgn//yYtsmdB2UhKfvOzjtzB4x9Oetwn9ta+bo5tgyXLTWKp5VfObdcAVE+rQwRIrBn+L1Fk/QR5XWZl6iwIh2bv7CNmWyYxH0OFQbeQiswOXpkuT/gMPiwHsYtETYDjk7OklaZnUedtUnBDl5UG/i2OG8i1NCpnotAf71Fo33Hkbkewrkdz/khTH62eeDsuEdh/JI/cFBSmR/Z43TYs7A+Tlf5wG9Tz3STXUMLpbpiHDuwLop+SekkUViijf7OJ+7bayeI66+YLLh9zNorwCYuSPircHwcwrb0gw==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(7416014)(376014)(36860700016)(82310400026)(4143699003)(5023799004)(11063799006)(56012099006)(261026121527099003)(261021121427099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KBYThA9IEIuxPiDNQQ1U3hCxSH9yBVoD3L5nYd0jlEdOxIsqmfdh6jdyjvSHC52b7GQQVULxDv0F8tj8xi33SWKwuothJhJjLfhP2XEbFQAg7bDfbWCRL2WBOTAskA0vEfFVdoLgZmBzcLkxjaeK1D1Yl10Kle5llcUFqNh08clqerYa2J73aHQuqGNS7KBOmbvwwFE7bhYYwxk9tgzQBm8kZHUcHznv4FlW3eVc8zzuboD3/uEpU2GqsIK1Z+dJ3/xmqqGTJqGZVfi1MtVy3Obx/nBbuAzc5JtkfcBiVf77BtAZuCEAwhZBWhvw0/N2Oqc9crncibx3vhbOt2+WKMW6kItZreIOCc5vO2HgGBKWjoEZ3lQoHHon5hMEgQ3IuASSFY/vH/ymYt+gdUvlJ2ynvy2c9wK1OPfUdjxaHQk7o6qLL4ihmXAzh8E+MvNk
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 05:51:52.3027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d14bb7e2-dde3-4cf2-ceb3-08df3580bb43
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00053453.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7082

On 28-Oct-26 8:33 PM, Joshua Hahn wrote:
> On Wed, Oct 28, 2026 at 12:14 AM Li Zhe <lizhe.67@bytedance.com> wrote:
>>
>> NUMA balancing has separate mode bits for normal task placement and
>> memory tiering. In memory-tiering-only mode, NUMA hinting faults on
>> slow-tier pages are used to detect hot pages and promote them to a top
>> tier. They are not normal task-placement faults.
>>
>> For slow-tier folios, memory tiering reuses the folio last-cpupid field
>> to store access-time metadata. numa_migrate_check() therefore cannot
>> return a real cpupid for those faults. Before this change, it returned the
>> same all-ones last_cpupid value that normal AutoNUMA uses for a first or
>> unknown access.
>>
>> That can make a memory-tiering-only promotion look like an ordinary first
>> private AutoNUMA fault. After a successful promotion, do_numa_page()
>> reports the target top-tier node to task_numa_fault(), so the existing
>> slow-node skip no longer applies. task_numa_fault() then accounts the
>> fault in p->numa_faults and p->numa_faults_locality, and
>> task_numa_placement() can consume that sample to update normal task
>> placement state even though normal NUMA balancing is disabled. In other
>> words, hot-page promotion feedback can leak into the CPU placement
>> heuristic.
> 
> Hi Zhe,
> 
> Thanks for the revision. To me, this looks more like a fix than an
> optimization, since there really is incorrect NUMA balancing behavior
> happening that could be visible in userspace (unintended
> task-placement and related accounting). On the other hand patch 3/3
> doesn't seem like a fix to me despite the name, since this one would
> mitigate the incorrect behavior.
> 
> How about we pull this one out of the series and submit it
> independently with an appropriate Fixes: tag and cc:stable, and
> discuss 1 and 3 later on?

Currently only successful promotions feed stats to scan period update.
This change stops that and nothing updates the scan period for tiering
mode after this change.

Though the direction of the fix is right, I think this can't be an
independent fix until there is some alternative which patch 3 in this
series brings in.

Also it would be good to get a view from Ying Huang as to why only
successful promotions drove the fault stats while unsuccessful promotions
didn't in the tiering mode.

Regards,
Bharata.
