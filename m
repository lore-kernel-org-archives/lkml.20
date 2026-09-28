Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013031.outbound.protection.outlook.com [40.93.196.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50F28505E
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790568815; cv=fail; b=TJt454ct18Ga8dBXiWbwGwTeLSoB1oUvjVg7Q9J5FkjACpHCv1p2zGymY5KwKWt0boNCRsHC6MRRlLvW6ivW3orPg/YNnTIRzOTu8xSrsa4P2nUzbcFP5KFVJJTqHdkOkS+Dq+LU5OJLvN8MrHjA/dJQD2RD22g3/yOFN8pAy48=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790568815; c=relaxed/simple;
	bh=TIoa01LUP/HxGlqSf2QxLNeI2BdxfYZ8bC6pouPDJ54=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Gcik7GdoBC6s3DJl9ZiwcxxP9Uyqmt6rcv2oMkufs3KhGtK4pQac27kcgF0HS6zmx7MAcP1U6GgVrIv+n3cixlPAapi1Zv6Dhube2Wn5WML1RvXUIIl1q4v3YEbMRjXOWFTbtfB1qG0NuM7TaR2YWPbsYFRJqWv2ATABwA2PGaM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=GwxzdWkg; arc=fail smtp.client-ip=40.93.196.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="GwxzdWkg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0/cu8CTn9Cv3ES7fx0vzDm1xcimpc979hgCqeTvqiWg5taBcc3Jk8cB2NNTDU8V2rLcif3OeF1orq0Xs4WS4TFpe71bkz/fuXAlgZrK5JPfql69Xo/6Wm7wDw2NM+tNNJUjrxRHdpkhYk8U6F0NDn/JPRSPrcJ0of8DYBNG6SCkWmAmgre0xWcFBCvqROqBetuckVY721dsiubBUzOdLawuAmBemfo5FgUACy6BM/U1yKFsCVc2JvLosN31/iQ6DVuovQxA6612EO50ojH1Hp+0vBVYCyGeBzyAkUn3kvLjtnyPZnpYmW55NVtGucdiGzZ7rJha9DoqFG/dIFZWwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7tzOgc3YtTp2JfO39g/6gr3vfVVI984nTSoG28FHy98=;
 b=tlrpr5Yt14qtrEZYw2OmIngOsjYWw6GrwswHmPWwjdRPphN/137gB+f9M00IPURgMaiamSUY0bxGPQfanDx9pOxAq3G/NSnfTwzWnREEAnQFWU4cI5F8CtVg56fguQJlGuU97PsJEvB6z/rLL5u54c2SAchQXoe1cxC9xjO9F2K2LoXPc3oHIWOxk4BRLrrBG+iqE44b5CjDsvtlm8aOqZjjR8A5h/SjYqkDEiW98Q4t+d1KviOMdg5fFQ1mpIqAH9ZgDvn+SDuymiL0tYVzmstDzzLQ6fwuonUlEnNdWBG63i7+ilIm5pYJTm8Xuxwjq+cW0OLhws4o4imcIwXucQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=stgolabs.net smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7tzOgc3YtTp2JfO39g/6gr3vfVVI984nTSoG28FHy98=;
 b=GwxzdWkg9uVvvuTQvjo163MY47QqE3YAcXUbHGPEp9qog5MA/wHf7Yvr7IUOuDBFpc5DzoSNj2spLszHZq6DDRArCxXd9eL+qgnYkMewRfUSCAd1mfwk9v0hCOC0P9t/ArT57RYl+LvMpxVSKN7sQlOFxooojJ2+kJrnHibVUHg=
Received: from SJ0PR13CA0219.namprd13.prod.outlook.com (2603:10b6:a03:2c1::14)
 by DM4PR12MB7672.namprd12.prod.outlook.com (2603:10b6:8:103::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 04:13:25 +0000
Received: from SJ5PEPF000001EA.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::34) by SJ0PR13CA0219.outlook.office365.com
 (2603:10b6:a03:2c1::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.14 via Frontend Transport; Mon,
 28 Sep 2026 04:13:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001EA.mail.protection.outlook.com (10.167.242.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 04:13:24 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Sun, 27 Sep
 2026 23:13:23 -0500
Received: from [192.168.0.152] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Sun, 27 Sep 2026 23:13:15 -0500
Message-ID: <e0526c63-f6aa-4b4f-b5eb-1c76434a0857@amd.com>
Date: Mon, 28 Sep 2026 09:43:14 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/8] mm: Hot page tracking and promotion infrastructure
To: Davidlohr Bueso <dave@stgolabs.net>
CC: Joshua Hahn <joshua.hahnjy@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-mm@kvack.org>, <Jonathan.Cameron@huawei.com>, <dave.hansen@intel.com>,
	<gourry@gourry.net>, <mgorman@techsingularity.net>, <mingo@redhat.com>,
	<peterz@infradead.org>, <raghavendra.kt@amd.com>, <riel@surriel.com>,
	<rientjes@google.com>, <sj@kernel.org>, <weixugc@google.com>,
	<willy@infradead.org>, <ying.huang@linux.alibaba.com>, <ziy@nvidia.com>,
	<nifan.cxl@gmail.com>, <xuezhengchu@huawei.com>, <yiannis@zptcorp.com>,
	<akpm@linux-foundation.org>, <david@kernel.org>, <byungchul@sk.com>,
	<kinseyho@google.com>, <yuanchu@google.com>, <balbirs@nvidia.com>,
	<alok.rathore@samsung.com>, <shivankg@amd.com>, <donettom@linux.ibm.com>
References: <20260911210859.1359875-1-joshua.hahnjy@gmail.com>
 <f871efd2-06b4-493f-87cc-919b6e0945c0@amd.com>
 <20260927232130.smxstw7f474k2qcl@offworld>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <20260927232130.smxstw7f474k2qcl@offworld>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EA:EE_|DM4PR12MB7672:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c9f743-ddda-4cfe-e576-08df1d16d716
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|23010399003|36860700016|13003099007|10067099003|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	hjPm8HDxR2U548x7qaUh8PxKTVBeQY7t1CcHs08p7swUB8CbVjXk3oFk1Nwr0xkLCnzh05iduG+BbTaS+r08Zpa+3qQgO2KJ0IGV2y85AQeW4lFeMAmZVeMgcTBULR6TakFgbVNmg/CmlXYFywrWQxFJBMH4oK0gQ6IE9BdPD7UBJXId8SbgeY84sSVtJSMFsSTX4rtJaU+w3Zq7ii/NeN4BT+WVB2Zbf+xA7P3DIQCCUCQ+bzY6Wkfa347AIKEof9HmH5WOnq7fWHoP7gAXnBHMNK30qrB3Ow27WmzZ9nU4GG0+Ze+2GWSO4Oj3/wDbSK3Q+9OeECIEa85DmitZbreL5exqti/yNF2zfKOkrGFxOY5PBSBCKVb/sq54XcHsVMefUSS51wIKgyprby5KId51jKVBfON2ErkxlaFoMZsAqDxur49AYDJjkLEOdIG3MpWeXX8y76bE59LrAIM00HH2YN2Z92zXI6UTCCjabd7X1RCCopYd5EWd9BqUn2krp4+AYTPTFKw/Q8u2EEs4sencqf3md/siCzwUd48KvWVkLvubCt03NUkcKPWL48B/WIGjpP7xysA+lkKJU8N4wbtcBNZSJmA+0Fq+Ap5pt5AEyOyHdcSAS4Cp4kZOrNNIhDOGU0/ey9LrS65FnaZPlqoA1Pg813CnIJwvap5t8HXLQKAxDxw0hxltWwbQatG1hHoWLMXp2nRlcRR3bTp3KA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(13003099007)(10067099003)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FRtusxOZdi/JTCPgDON+fdOLIZwSGkyaagdOzY1ecw8MFEUhpLoDCndckQlv6M/zDVGEXv2HpaNYzzX3Zo3BfSbnRqgleHO1hlDb62zjpKgkhr6HTQedOvSn5ObJ4RVfcOTw+wI0mwaSnsCzk5pEYtOR3NFHQAROQXZ65E1BiOeLEPUmqcsWanwl7g+XeIDOmRmqrS5g6C3XlYVIX7LYLXMD0gJu5M6wLIvIzIGEtpz1nIOvACkzKvV7kbmJdKEowJAQTLmTxQN7Xf1TvoOdui2z9z7Dm+lC1MF1Hcu50WYYcjNRhSKDJbavihADcQzyh0cNUr6yDO0mMloqSKis8jqyMGgGj8V3K2JvVTnUCMvru9nn9i98yC6rheKB4es3UmYxUz22aHJKUpHm352tzNRt7ti/8RJj8auQ1aLGVTTlvkW/MEi82n0K+V2Kna/q
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 04:13:24.4236
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c9f743-ddda-4cfe-e576-08df1d16d716
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001EA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7672

On 28-Sep-26 4:51 AM, Davidlohr Bueso wrote:
> On Wed, 16 Sep 2026, Bharata B Rao wrote:
> 
>> On 12-Sep-26 2:38 AM, Joshua Hahn wrote:
>>> - I also found a bug where the kmigrated thread isn't created for nodes
>>>   that are onlined later after boot, like CXL nodes that get onlined
>>>   with memory later on. I've been using a small hack commit in
>>>   pghot_memhp_callback that just checks for the MEM_ONLINE case and
>>>   spawns a kmigrated thread.
>>
>> I will take care of this scenario (CXL node online after boot) in my next
>> posting.
> 
> I was also running into this for chmu integration. I have been carrying the
> below in my own testing, fwiw.
> 
> Thanks,
> Davidlohr
> 
> -------------8<------------------------------------------
> diff --git a/mm/pghot.c b/mm/pghot.c
> index c7f523a61683..2f1e16e5091d 100644
> --- a/mm/pghot.c
> +++ b/mm/pghot.c
> @@ -602,6 +609,18 @@ static int kmigrated_run(int nid)
>      return 0;
>  }
>  
> +static void kmigrated_stop(int nid)
> +{
> +    pg_data_t *pgdat = NODE_DATA(nid);
> +    struct task_struct *t;
> +
> +    t = pgdat->kmigrated;
> +    if (t) {
> +        kthread_stop(t);
> +        pgdat->kmigrated = NULL;
> +    }
> +}
> +
>  static void pghot_free_hot_map(struct mem_section *ms)
>  {
>      struct pghot_hot_map *hot_map;
> @@ -707,6 +726,58 @@ static struct notifier_block pghot_mem_notifier = {
>      .priority = DEFAULT_CALLBACK_PRI,
>  };
>  
> +/*
> + * The first memory block of a node is onlined before the node gets
> + * assigned to a memory tier (memory tiers react to
> + * NODE_ADDED_FIRST_MEMORY at MEMTIER_HOTPLUG_PRI), so at
> + * MEM_GOING_ONLINE time for that block node_is_toptier() still
> + * returns true and pghot_online_sec_hotmap() skips it. Backfill the
> + * hot maps once the node tier is known.
> + */
> +static void pghot_alloc_node_hotmaps(int nid)
> +{
> +    unsigned long section_nr, s_begin, start_pfn;
> +    struct mem_section *ms;
> +    struct page *page;
> +
> +    s_begin = next_present_section_nr(-1);
> +    for_each_present_section_nr(s_begin, section_nr) {
> +        ms = __nr_to_section(section_nr);
> +        start_pfn = section_nr_to_pfn(section_nr);
> +
> +        page = pfn_to_online_page(start_pfn);
> +        if (!page || page_to_nid(page) != nid)
> +            continue;
> +
> +        if (rcu_access_pointer(ms->hot_map))
> +            continue;
> +
> +        if (pghot_alloc_hot_map(ms, nid))
> +            pr_warn("pghot: no hot map for section %lu on node %d\n",
> +                section_nr, nid);
> +    }
> +}
> +
> +static int pghot_node_callback(struct notifier_block *self,
> +                   unsigned long action, void *arg)
> +{
> +    struct node_notify *nn = arg;
> +
> +    switch (action) {
> +    case NODE_ADDED_FIRST_MEMORY:
> +        if (node_is_toptier(nn->nid))
> +            break;
> +        pghot_alloc_node_hotmaps(nn->nid);
> +        kmigrated_run(nn->nid);
> +        break;
> +    case NODE_REMOVED_LAST_MEMORY:
> +        kmigrated_stop(nn->nid);
> +        break;
> +    }
> +
> +    return NOTIFY_OK;
> +}
> +

I don't think we should allocate section hotmaps from node hotplug notifier
callback and let it get allocated from the already existing memory hotplug
notifier callback.

I have already taken care of node hotplug in my latest tree from which I posted
only the IBS Memory Profiler part.

https://github.com/AMDESE/linux-mm/tree/bharata/pghot-mprof-rfcv0

Regards,
Bharata.
