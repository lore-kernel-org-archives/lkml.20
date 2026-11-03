Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793676903;
	b=hKbbwd9DVHRcwXAi58KRQwWi6a4rLSiFtwRAwISQmF/nbNsDuwIjD+3wO7ck/zPTbpH0
	 pZbpwDcn20wxST1nU2rOKw3ViGnjxEBF9jQTO1M16g+8oTysE0+BHvyD6pxeGIKp1fUZr
	 OmvbNGcFaK7KmRDbQ+UEMKPvFJzTBTi2Zp4lJghLhKhxdya2CkUuK8EskquqQmOIWmct6
	 Ufxcvoug4aSEphW63WoGd6g0WIBh2wzq7JGoGx5hzufCTx560pXk4IJ6LzLY18lQ61eb4
	 ADCtVcxY55uJtYbVJMcES03SSCnQ3T7aYI+syedXMAdXWC7ViiDtE9ERT/2+r2QEgXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793676903;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=FwzgYSRN9hNcEfzLdX1zj6STYMaMRQVIaiDUVw0a9U8=;
	b=GfEQQPR/EO9eEbIsl04+LZQszv+Ro43XpaEMlwodWu1CvkLTDjrsnP57BzYgBhN3GYpa
	 FTf1wenzPkffSX3Bfp1aM8IQYqrOv3UBLWlTCW17Gvr+G3Wk5xx9wE5VTOD2fyS+xCwJD
	 5fTgbmu9q42dzpSEC/qQcS8wYnpgS31O6BZ2F+flzXMB6EPk8/Ees/SjkbbrW+2EbFWQ9
	 u60xmyp3uw7BgBfnTpIOly8JzeaM2rl/0K/xfuXaUBtPv/bkeGvHsDMWWrFUVamOHpM/G
	 Vdo46kVjolV9ka2slTSWkp6F5VcB9cLuOr4Ym4sUu+Gw0dfVgGpckKryiBvZd5wQidA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	arc=none smtp.remote-ip=113.46.200.219
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5FD606A32C
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 03:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D5FD606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=FwzgYSRN9hNcEfzLdX1zj6STYMaMRQVIaiDUVw0a9U8=;
	b=imsLF2GeusxpIWZN4VDrVc+VwRWGYPSOlIjC++TogSe7lTDuZo4inWciMRN7rp6tJ8jCe+rmx
	qlZKEPt0IkV7LXtZiF1mfI7EVeNZhSrIOJHAIPmmbHZ/BNYr8GMn57B5f1J7JLOjWRkTOnmZL1Y
	33MkA71sDupgQRgcJTnQLwg=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4jJZ2P3qRwz1prL4;
	Tue,  3 Nov 2026 11:34:53 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 6256140561;
	Tue,  3 Nov 2026 11:34:57 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 3 Nov
 2026 11:34:56 +0800
Message-ID: <e2ed5936-205a-4976-8bf1-5fde2621cd55@huawei.com>
Date: Tue, 3 Nov 2026 11:34:56 +0800
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
Subject: Re: [PATCH] fs/resctrl: Fix CLOSID propagation when reparenting
 monitor groups
To: Ben Horgan <ben.horgan@arm.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <peternewman@google.com>, <bp@alien8.de>,
	<x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261031101052.1692230-1-ruanjinjie@huawei.com>
 <3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <3a637631-c8ec-4e26-a03c-5ac80d16fab3@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/2 22:46, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 31/10/2026 10:10, Jinjie Ruan wrote:
>> Renaming a monitor group to move it below a different control group
>> changes the CLOSID of every task in that monitor group. mongrp_reparent()
>> updates rdtgrp->mon.parent and rdtgrp->closid before calling
>> rdt_move_group_tasks() to propagate the new CLOSID to the tasks.
>>
>> rdt_move_group_tasks() uses its first argument to identify the tasks to
>> move. For a monitor group this is is_rmid_match(), which on MPAM compares
>> both the PARTID and the PMG of the task with the parent control group's
>> CLOSID and the monitor group's RMID. After rdtgrp->mon.parent and
>> rdtgrp->closid have been updated, the match uses the new CLOSID, so no
>> task in the monitor group matches and none is moved. The tasks keep the
>> old PARTID and continue to use the old control group's allocation.
> 
> Ah, that's pretty broken.

Hi Ben,

You are right! I found several issues about this with mpam.

> 
> I was previously under the impression that moving monitor groups on MPAM systems was not permitted
> as the monitor bandwidth counters are required to be always running and so would glitch when moved.

Got it. Then this operation should indeed be forbidden. Unfortunately,
in practice it hasn't been forbidden yet.

> Peter Newman posted a patch in 2024 which added this restriction [1] but it didn't reach upstream.
> As, the moving of monitor groups is already broken for MPAM systems I think it would be ok to forbid
> them.

Should I pick it up and rebased on v7.4-rc1 and send out it again?

> 
> [1] https://lore.kernel.org/lkml/20241205153845.394714-1-peternewman@google.com/
> 
> Thanks,
> 
> Ben
> 
>>
>> x86 matches on the RMID alone, so it is unaffected. Now only arm64 mpam
>> affected.
>>
>> Save the monitor group state before it is modified and use the saved state
>> as the source of the task move. The updated group remains the destination,
>> so matching tasks are moved to the new CLOSID and RMID.
>>
>> Fixes: 8da2b938eb7e ("x86/resctrl: Implement rename op for mon groups")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> Cc: stable@vger.kernel.org # 7.1.x
>> ---
>>  fs/resctrl/rdtgroup.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
>> index 57ab090072c2..33b23b59a6de 100644
>> --- a/fs/resctrl/rdtgroup.c
>> +++ b/fs/resctrl/rdtgroup.c
>> @@ -4322,6 +4322,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
>>  			    cpumask_var_t cpus)
>>  {
>>  	struct rdtgroup *prdtgrp = rdtgrp->mon.parent;
>> +	struct rdtgroup old_rdtgrp = *rdtgrp;
>>  
>>  	WARN_ON(rdtgrp->type != RDTMON_GROUP);
>>  	WARN_ON(new_prdtgrp->type != RDTCTRL_GROUP);
>> @@ -4338,7 +4339,7 @@ static void mongrp_reparent(struct rdtgroup *rdtgrp,
>>  	rdtgrp->closid = new_prdtgrp->closid;
>>  
>>  	/* Propagate updated closid to all tasks in this group. */
>> -	rdt_move_group_tasks(rdtgrp, rdtgrp, cpus);
>> +	rdt_move_group_tasks(&old_rdtgrp, rdtgrp, cpus);
>>  
>>  	update_closid_rmid(cpus, NULL);
>>  }
> 

-- 
Best regards,
Jinjie

