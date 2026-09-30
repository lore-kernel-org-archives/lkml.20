Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010022.outbound.protection.outlook.com [52.101.56.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5762D343D8A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Sep 2026 01:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790731008; cv=fail; b=RXy1mpRd+imnnf5t93KWatfXz+K3Yi3NCUkNqvnDBfKNL+pCnodr9rQOKpVGXrEGJUuSdM9FKAQmIQxv9GxYfj/9Vhd8ZshQaSGfdMU5KryHCx5s3AxYaAP5EC6p7GgunpwtCyVIRgCkJora53IZIurc60Hzl0ECr3GkeDPKYEM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790731008; c=relaxed/simple;
	bh=UKvwdmuZ3u+zEDfCO6CTRYpOrwj8mX7WYPiaeVV07P4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=FI5Z8qxNQr5KrAUJwHR2exbODASIDuPP0ZDb2zT8fMToL96nFqozhA+3/ywz+Vukf+3o1/ULXI8xFyv8ciV4nJl6QvuGhwSj+1cpJevsHJi2Q2v65iyk15zQG/KhfEtDdH14LlS8ruChq1/MEN7XuDtan5/DlOltK/sOGAdPODY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qFs6xLyy; arc=fail smtp.client-ip=52.101.56.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qFs6xLyy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xxXebT/npNMbKN2JoltTmI7Q8u3p8TKFi0aW877Qtzf1BoxLaxuV6BBl/gR+LZbY3DEVMdQOF8KmW0huT4MIHPQ7MBcAh+Bu1lp4VgwaNtUmp7Z/h0cnxf3CW8Et+v7NfNL2d5ylUG1OSUXBMRUEWtMvcltCHPqZ34NRTAKtbbCyY7Ez1fvhUpMubkhsQS3JusZob+hKc2chSFbyp5IZTXfdWUGmNNCpMzwXyCr21W48jEYa5WLKD9oTSmM9M3pTJcUKjM0XkwNHkZ8PEn3fd1uztUXnqFTzB7cPaEhLEkgmBuR5dEkpKCYZ1novKPwUanFSUKEWoTudmc5WYnCMHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XqcjM6mGnP1BhzzPPQg6XbAsNtOFLKObPJbv+VZQo4=;
 b=elUpF7XaN9Z/eXe64k81sRzCJRg8Udq2DmxxZDVIdY2JtAgAAqUUrYwnanSqnuzGAY0yFjhm24oGFm5CIWoihbVXWH1lZvIHYGV3lPLYVXSUJlLjVNGA3wcZJiEnsINNwJ8EK0Pis3XXAF6F9tTe0UzLAcdQ5jlTmlwCxoiIy/5Unl08KCuflgv6S5jk+CjdTSV2ndaXpaWz1gXTlfNF8XH4MZ80e57MkdFU5CRLgoGHJRzkD/M+5+neq6seiYYQQvyNR7UawGyQ6P3N10MCgmv77nf/m4b0pvItWYGWSSognqQ6DfxE5nemPO4NN8vBdlcXhv91eZHNwk6FMTGCbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XqcjM6mGnP1BhzzPPQg6XbAsNtOFLKObPJbv+VZQo4=;
 b=qFs6xLyyXrrzG2FOM048I7TxCvbu8UqbZDXyg4nl13xWasKpCXhDk1jZ0Pyz+qOELl/26upPUohfi3cXYcfNSa3y23ZUZeMHT29XNdV3S8zHtXppHRk9lQUGkmIa0QW5bnV/aVOoQ+L2ZCzx3Oii8l/aQw4AOgcgzHx6t7Oa7U0=
Received: from MN2PR08CA0011.namprd08.prod.outlook.com (2603:10b6:208:239::16)
 by DS0PR12MB999103.namprd12.prod.outlook.com (2603:10b6:8:2fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Wed, 30 Sep
 2026 01:16:44 +0000
Received: from BN2PEPF00004FC0.namprd04.prod.outlook.com
 (2603:10b6:208:239:cafe::d) by MN2PR08CA0011.outlook.office365.com
 (2603:10b6:208:239::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 01:16:43 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 165.204.84.17) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BN2PEPF00004FC0.mail.protection.outlook.com (10.167.243.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 01:16:43 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.49; Tue, 29 Sep
 2026 20:16:43 -0500
Received: from [192.168.0.226] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.49 via Frontend
 Transport; Tue, 29 Sep 2026 20:16:39 -0500
Message-ID: <5a5015bd-ed61-4ef7-a4c9-e759603c4cea@amd.com>
Date: Wed, 30 Sep 2026 06:46:38 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] sched/fair: Rework/fix task_h_load()
To: Kayra Cizmeci <kayracizmeci@gmail.com>, <peterz@infradead.org>
CC: <bsegall@google.com>, <dietmar.eggemann@arm.com>, <juri.lelli@redhat.com>,
	<linux-kernel@vger.kernel.org>, <mgorman@suse.de>, <mingo@kernel.org>,
	<rostedt@goodmis.org>, <tj@kernel.org>, <vincent.guittot@linaro.org>,
	<vschneid@redhat.com>
References: <20260929085320.337703476@infradead.org>
 <20260929174648.196105-1-kayracizmeci@gmail.com>
Content-Language: en-US
From: K Prateek Nayak <kprateek.nayak@amd.com>
In-Reply-To: <20260929174648.196105-1-kayracizmeci@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC0:EE_|DS0PR12MB999103:EE_
X-MS-Office365-Filtering-Correlation-Id: 9292c2ad-7fb9-4d7e-ff94-08df1e907d67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|7416014|376014|1800799024|23010399003|10067099003|56012099006|11063799006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	0bfLUB8n8y2sIGLVdGyqLYKUkJS1IYe6sRcmQ/cVvxf4EV6zL7w3IjmW4oGJ1UdH7WHDXAew5oQSrVbr+eq43UI07XFgWif/fEZJR3NzZEUCXUN5tl/SVhqJ8ZH/VitlV2F1Ivgw9h6REI+riUIzfkx6E5WKf3Cshwpv4hqLsLQoRr2HYli1HGDY58//1d2WirdDeojStJ1Si38wUKdLuzejrB91XZaA/HL+nZc9JX2ko14XQ1Q9nOep25v10iE0s0h6XyutQQYVh2AwIzxiGqWDt3HfU9xHLpSB9S2eNVGVfC+XLDopb3/YnJX/cRQik13F5BwmhcJ7Jg4sEi8I2G9ydaVAc8rJj7x+W0wIyCdM9/DfU4jDO02M7OAkCqdWSdb7biwaBtYbav+q/yznt8tOgHFjnvTz8mEZ7Rx3rdZbYTKOwggx5B3fNK6JD47u5hbgfPn36JiqzXLOh0CUiK/duTxj3EYqkiZBQfBBjf2ZZBcYctSJNZxNObtVTphmd0Q8diPqN3R8GuxQ+Nblway7C20lwtI9uB4W6oz8tGqEVCnkk7qf3N9446vtVNAGjahhKHjNUE/9abN62ojUcipHM15JDx82334xhbiTeH73SXqtcALMEAbIWkkkjDx9lgwxtF9cE0W/uCeSITRWipt5hYB+chXe7DO0ZIfvLLTR7AJ7ENj2nEj8brbdwJpk65dyzWBXmtDVf0e32NRciA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(7416014)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ERzHI0cpywnsB5CD6AlhZjkfRjly3xA5Nl7Ie1Pa1NXe4roTBPMAy9x//fgl3BgDqkeNX8odwtE7XY1hkFw5q7dJaNy08OzEqhlhvWtXECgXfj6P/NaexxeOPV+ThOlvb8hWzWT5voq9BtuwOMN5gIZuvAWlInbcIZl2FYJMHgaiW7sznEafi3gPkHgU0gD2DJOYzT+EYiTTTlY5pDSr/6oCsqkFHG0mHK/W9afpeeD0g3+Wci5SJbSmgv9L3u799CEH8qIPWvO5D3zt+aseWbRLFG8PzfbBwCtj76EsqW/cfyN5xS1ZJb0Mio8DCKP68fZ+8Hfdse4PMSd6tZ+ghSjUwNOQPswz6LcngI8wP9DlYh0LBJOgaTONh/RqJV3u4achyU/J/k3+90mZXsrLQGIUc2ioNpKJD+04fb/KdurnVt35CZ9o98JV006pbb91
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 01:16:43.7569
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9292c2ad-7fb9-4d7e-ff94-08df1e907d67
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FC0.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB999103

Hello Kayra,

On 9/29/2026 11:16 PM, Kayra Cizmeci wrote:
> Hi Peter,
> 
> (Fun Stuff):
> 
>> @@ -15731,6 +15766,8 @@ static int __sched_group_set_shares(stru
>>  			update_load_avg(cfs_rq, se, UPDATE_TG);
>>  			update_cfs_group(se);
>>  		}
>> +		for_each_sched_entity_bl(se, cfs_rq)
>> +			update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);
>>  		rq_unlock_irqrestore(rq, &rf);
>>  	}
>>
> 
> So, the code is this:
> 	#define for_each_sched_entity(se, cfs_rq)					\
> 		for (struct sched_entity *_BL = NULL;					\
> 		     (se) && ((cfs_rq) = cfs_rq_of(se), (cfs_rq)->backlink = _BL, true);\
> 		     (se) = (se)->parent, _BL = (se))
> 	
> 	#define for_each_sched_entity_bl(se, cfs_rq) \
> 		for (; ((se) = (cfs_rq)->backlink); (cfs_rq) = group_cfs_rq(se))
> 
> 
> (While writing this, a suitcase tried to assassinate me by falling from top of the closet,
> what follows after this part may be the symptoms of my brain-damage.)
> 
> Let's say we have a *thing* like this:
> 
>   +----+    +----+    +------+
>   |se_a| -> |rq_a| -> |task_a|
>   +----+    +----+    +------+
>      |
>      |
>      |
>      V
>   +----+    +----+     +------+
>   |se_b| -> |rq_b|  -> |task_b|
>   +----+    +----+     +------+

I'm having a super hard time understanding this hierarchy.

Is it like:

    root
    /  \
   A    B
   |    |
 task   task

or something like:

  root
   |
   A
   |
   B
   |
  task 

?

> 
> When we start as task_b, everything goes well. Both groups are updated.
> On task_a too, only se_a is updated. 

I'm assuming the hierarchy is like the latter then if traversal from
B updates A.

> 
> But when we start as se_a root's backlink is NULL so we don't update anything.
> While on se_b rq_a's backlink is NULL and update se_a but not ourselfes.

So for that specific section you've highlighted from Peter's patch,
in __sched_group_set_shares(), we first do a:

    for_each_sched_entity(se) {
        update_load_avg(cfs_rq_of(se), se, UPDATE_TG);
        update_cfs_group(se);
    }

That sets up backlink going until se->parent whose group_cfs_rq() is
the cfs_rq of tg_se(B) aka the cfs_rq just above the group whose shares
were altered.

Then we do:

    for_each_sched_entity_bl(se, cfs_rq)
        update_cfs_rq_h_load(group_cfs_rq(se), se, cfs_rq);

Which updates the h_load all the way from the root until the cfs_rq of
the cgroup we altered.

In case of:

  root
   |
   A
   |
   B*

  *shares of cgroup is updated

If we update shares of B (aka tg_se(B)), we update the h_load
until the cfs_rq_of(tg_se(B)) which is till tg_cfs_rq(A).

Now if you have:

   root
    |
    A
   / \
 *B   C
      | \
      D  E

Yes,d you'll still update h_load for only A and you can have stale
h_load for C, D, and E, and for all the tasks queued below them.

Since full propagation is expensive, we do those propagation lazily
when the task is picked, enqueued, or dequeued

Note: We cannot propagate this up further because we have not yet done an
update_load_avg() for the cfa_rq(s) in rest of the hierarchy. Next reweight
will see the correct h_load starting from A and propagate it further when
needed.

Was that the problem you were talking about or did I totally confuse this
with something else?
> I don't think this is that of a problem tho, and
> I could be missing something.

I don't even see the problem. Maybe I need glasses :-)

-- 
Thanks and Regards,
Prateek

