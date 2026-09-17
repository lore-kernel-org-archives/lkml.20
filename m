Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011030.outbound.protection.outlook.com [52.101.62.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3AC54DDB33
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 16:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789661697; cv=fail; b=I3+U/VjZiFgUM0+h5YMZ3WsDK5cJf9gguJpccpm3cSST7ktTppBz8cw4gOgu0+dIWKh6g/pxio5Urheu4ghMRrO0fkwNqDI1AgHfiR1nN9NHEVqz6/PXUzL0yYsZDK9ZmSSS1S+HI0d6RVZu2q/yzy3ap0dABCMjoRXs8YL2CGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789661697; c=relaxed/simple;
	bh=ed8UbeqOt5+sdy06vZtmRVNakWWj/+sEIymMzNaEdw0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=gTC8JPK2mjIfZi05styUfABQRx536lq2GQdkO106QLd3sFt7UY/m5vRt3yUX+pCnZh3ORwjdkjauoE6ghdIgJc3983sCM8dnaR3VYfWdWNQWgjF5daHnrrnMH1zU7jKaGtYquCD/JgLaDfI5Yl7cSEll/HW3jeRBsiYkWjeCQ98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KvG5RpaL; arc=fail smtp.client-ip=52.101.62.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KvG5RpaL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ML/Ml4ZRPgrnXINhQ2P1AF9140I0a7Sq60kS2bQowIQo9ACWuNTZW1t/I1/lb0+o4mLhgQCkm5JN9nO7TS3y+7twJcCk6jBMZ9R9Lg+FvRhkLGDhKqeRgzhbAR6mWa2k53lK1VqssdjsD8814A1xNF/MVTPqGvAOFiH2w7Kq7saRB1Nm4bJGY0eewhhfkEbfKpA3QcZdvAdJyk9xf6/qtsneGeq4xgifsVqbip+ID6ASFOKg7qVeavU3xOUgq/SQmIFex4TKdqrCoF143RBpclsqpjoLtGZ+0weRM3/LNJxbdM4+brG+gyHNCbYv9TUv7VeSl2SKgSmeuFbLvJuKkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDrl2yYF6YZYB5E5YkfQYKruceXWUQIesJGCnY53vtE=;
 b=jG6PN2WfWf9WRQVgKwiHQgD8qUcmg0/0eFZPU2bYW9XbWOW+Ws+K1+A5q4czRHFOqvFQgsya3X/q4KfnycvIPxl8+16dQGDKVE65ApCqkj3j8l2tHzRy5Zf3trCa7I/KC6KI7sLk9W5h6doDDWy4wxUlCVekGm7kljNSDXPKpB3iRhVnDzpZucVbr2kchg0wDCTzm3Oa+wWwk5OiOPMsYRUh9wdd7u3AaK8DnaMy7vABZ9wvhl93+ni0LvuWKsr1eQwZHMUP3qDla+37GBCPSXtXpE/Wy7q/zfGl3AQqu/YqkmE3jqbPTdMIV2bD/uKKJRQ1fh6W5aX1M2pEitXvjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDrl2yYF6YZYB5E5YkfQYKruceXWUQIesJGCnY53vtE=;
 b=KvG5RpaLRprbWa7r1xLYGnKWpO/P/sn0XvQn5hlW+BAw5+Td4jS8EhQSIjlj572Vx7jIYqJxwVxZVBh7SSphDTqYMFbuWrbuYyQc3I7x51orf+kaMOP6S0j4V6LqnbWvCHFwPR/1pYPmmlqVmShgw5Qv/GuWIQa+D8l/1Qr6KwI=
Received: from BN9PR03CA0038.namprd03.prod.outlook.com (2603:10b6:408:fb::13)
 by SA1PR12MB7442.namprd12.prod.outlook.com (2603:10b6:806:2b5::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.11; Thu, 17 Sep
 2026 16:14:41 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:fb:cafe::a8) by BN9PR03CA0038.outlook.office365.com
 (2603:10b6:408:fb::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.11 via Frontend Transport; Thu,
 17 Sep 2026 16:14:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Thu, 17 Sep 2026 16:14:40 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Thu, 17 Sep
 2026 11:14:40 -0500
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Thu, 17 Sep 2026 11:14:39 -0500
Message-ID: <1a8685d2-f91e-ada0-ff61-710cf68e2fb2@amd.com>
Date: Thu, 17 Sep 2026 09:14:39 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Fully initialize map structure before
 registering notifier
Content-Language: en-US
To: Max Zhen <max.zhen@amd.com>, <ogabbay@kernel.org>,
	<quic_jhugo@quicinc.com>, <mario.limonciello@amd.com>,
	<karol.wachowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>
References: <20260911163907.1193852-1-lizhi.hou@amd.com>
 <e8e52df0-c0b5-4823-b5c7-58ef3d341818@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <e8e52df0-c0b5-4823-b5c7-58ef3d341818@amd.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SA1PR12MB7442:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d2e6ef5-5fb3-44f6-df47-08df14d6c74c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|1800799024|23010399003|4143699003|11063799006|6133799003|56012099006|18002099003|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	73LqRFCCtfeANbGW6VY6eEsQTg3twYgbGBjnba8FKrSPibBGHZ6sYlOc+xsRtxgNOQUq8HDoawLm7bbMekMpUu92HCiYNwkqEpz/rm/PZbLUW7td2r9u2PKcQXRRhkWx1/eePX5Hhl8DhWZp/hL2v9yKjvCCIPzdr+gmMdqliMzRZ/ymGt86qYWNqLzznEKlXd/IWdCk6V0LyLTHzi+7l/F2bfbKM8e2LTUmWpdcZ6MRxBB8un3UV9PEOZVqO99aTb4wsJWntArdy/52lh5X3Pj3hVcro9NSyZ6OPHVWwZfQPoGhH9Q5agvnqAsBkwEMcolGCSBceMv4TwCj+HVTgMVLGqS0P9vlTmkZuHJMmmN0+4nWItMAjifn72m5vAL7FzkFRPd6e1RzQrW0+PJjTv9B/HCnsjA7/RLXVtQ6w91MLOLUirxPWr27e1y4c6iLRMmkNFCvsOSqS+ViKFwb0Um5Sk4epWD0sMPNCiM1+Lw9A9LWNuA7D7MVFFSfsXTnofXrFXait4+zM/Yfu3DbA4zTIbHW+0VLLEnKg8VFt+iJVJQc/3SGNlDUkrJmDClt9zQY+RRjssR71ND1PGT9vM8PiqxMLIC3qWP3M5OMgda+fKHPwfTGdhRZOiGuXLY/Yj+D4VKUzl4k4lE22CeqWcmZp69tEnZ+K5eYwcC3UIP8gk4e0UDsjMhOzn7j2WUpM6YQml8DCgwyeKP2u4quKg==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(1800799024)(23010399003)(4143699003)(11063799006)(6133799003)(56012099006)(18002099003)(10067099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	U5D0szL03vRr5rymE0fWzVt5FStNkCM6VA4OeShiE6NwS70d/+Lu+DboKJ5nlCICnutvq1cECb6hx8G3mh/tDhAzxpAp7/k5YdsXGJG8EJ43chUYJRyFcMlK2C4UGE3Cnkswtex8zWwzcMioGRmL7lQpqkhX7n/NQg5E3ZE+2Irds3Dg/o09eUfxTcKZ+zvXuGRxmwtq3inHSWULzmygvj22XhbFcHRLQq0Ung1h06alRu3WL6Irce37C7W1p+kHpQ6BC25n12My5eS45uLfXTj98g8z18zWk6DPfN+3JS4tsS4Qa78Ln44A2dRbFsYWx4Y5y8bmYoxTGy9PeN9vlh1qt5v5Rz6u8cQuz0y/z1tjLDTjxel2MxT3yQRb9J+gyi9qbSy4d8g1wmdPa+fFh2EOoGUSFuDs35c9VY9C889xI2WAKmeh9ZbQ/6nNcDqU
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 16:14:40.8709
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d2e6ef5-5fb3-44f6-df47-08df14d6c74c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7442

Applied to drm-misc-next

On 9/11/26 10:11, Max Zhen wrote:
>
>
> On 9/11/2026 Fri 09:39, Lizhi Hou wrote:
>> The map structure is currently only partially initialized when the
>> notifier is registered. Although holding mmap_write_lock() prevents
>> the notifier callback from running before the remaining initialization
>> is complete, the ordering can be confusing during code review.
>>
>> Fully initialize the map structure before registering the notifier so
>> that the structure is completely constructed before it is published.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Reviewed-by: Max Zhen <max.zhen@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_gem.c | 18 +++++++++---------
>>   1 file changed, 9 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c 
>> b/drivers/accel/amdxdna/amdxdna_gem.c
>> index 5a1a2ee261b7..e861db6f9369 100644
>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>> @@ -415,6 +415,15 @@ static int amdxdna_hmm_register(struct 
>> amdxdna_gem_obj *abo,
>>           goto free_map;
>>       }
>>   +    mapp->range.notifier = &mapp->notifier;
>> +    mapp->range.start = vma->vm_start;
>> +    mapp->range.end = vma->vm_end;
>> +    mapp->range.default_flags = HMM_PFN_REQ_FAULT;
>> +    mapp->abo = abo;
>> +    kref_init(&mapp->refcnt);
>> +
>> +    INIT_WORK(&mapp->hmm_unreg_work, amdxdna_hmm_unreg_work);
>> +
>>       ret = mmu_interval_notifier_insert_locked(&mapp->notifier,
>>                             current->mm,
>>                             addr,
>> @@ -425,15 +434,6 @@ static int amdxdna_hmm_register(struct 
>> amdxdna_gem_obj *abo,
>>           goto free_pfns;
>>       }
>>   -    mapp->range.notifier = &mapp->notifier;
>> -    mapp->range.start = vma->vm_start;
>> -    mapp->range.end = vma->vm_end;
>> -    mapp->range.default_flags = HMM_PFN_REQ_FAULT;
>> -    mapp->abo = abo;
>> -    kref_init(&mapp->refcnt);
>> -
>> -    INIT_WORK(&mapp->hmm_unreg_work, amdxdna_hmm_unreg_work);
>> -
>>       down_write(&xdna->notifier_lock);
>>       if (list_empty(&abo->mem.umap_list))
>>           abo->mem.uva = addr;
>
