Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867546;
	b=bZRa6unZvcNJ1/XQWaKFbJ7FGHa2rC5E0wRWUTrSQVk8w5MZX4tkYloSblpkp3XcXVkd
	 FqVNxHYYxuPYDzo+x/02H1E6PNdo2SomgXDSijyGlEy6Sp2CFJN7N4MZA9f0RcnPTaTlW
	 U+DzHVJofI2P1ja+Y/O9sJiQk8/S9LjBhtRACvIjm+FsHqBa8iIjKiHrMRP9ihISr/61z
	 tLsFxIz6kXNar3RKD98W5guYEb9Wusb00AgbrZAHIuXlTjHKizMjyZFCeoP9f0c3B2Lqn
	 igDFDEJlRMU58NdPK75ZTDIrblvkIe/OeX89gH5F0naqfjaFR+l9tRRDdKHDlUqrPJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867546;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=i3ne+SSwWw6GtBnu4GWRuEzvOz6IHxseWXQpOCOMdbM=;
	b=jCqv8lcqqmSrydPELFv0QQ+UvZymIdndMXuNoTmHbFHPHYpS8AGAbNLGiJg99nmnpek6
	 BE4lv0Zn+H1n4LpWAs+XI4DpM/XV88y0/AfKW6kpVZjrnQWSciYTgQrpTaVgbUC+IgKeX
	 uqTkBJ5nu9B9LcgL3xe9ELYpebT+yZvhXwBeWk0p7tCwzT5FDAlF6JPAhtqMb6gGpj2yb
	 v3QaBStGBEHzM8XLDI93DOGF9Hq5xzsIxRFjUMQTFY9ZBuJ3Qswo0wFrvFcZnKfZx2n/S
	 viYJ7joOBlJ4WrKAUJdSmqtgt6NIbtwVtTDiu/l2YK6TZ/quuuA5UyU1h0zkbTPrDGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=225RiDew;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84FAA606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 08:32:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84FAA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=225RiDew
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=i3ne+SSwWw6GtBnu4GWRuEzvOz6IHxseWXQpOCOMdbM=;
	b=225RiDewzfXYs7sbxsRIaMXz50OfoExOjqVi+DMiugIXbULc7nB7TI8jVzRvUr2XV9m+72Q/8
	UPGxtrqboY2rSQPtxYtu4Eyg3FX9nrADA8dYaueQUmyhmUpFMdTqwnDjxSpyF3eFqEimUb0Ltlc
	xqteJ/7Eyu3wPBkS+VKXLI4=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jKwX833h3zcb3N;
	Thu,  5 Nov 2026 16:31:52 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id EB2B24056E;
	Thu,  5 Nov 2026 16:32:20 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 5 Nov
 2026 16:32:20 +0800
Message-ID: <5e6fc827-d5ca-4e72-ab8b-3ad63d530c19@huawei.com>
Date: Thu, 5 Nov 2026 16:32:19 +0800
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
Subject: Re: [PATCH] fs/resctrl: Report why a schemata write failed
To: Reinette Chatre <reinette.chatre@intel.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <babu.moger@amd.com>,
	<tglx@kernel.org>, <x86@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20261104102304.703535-1-ruanjinjie@huawei.com>
 <0bece210-cd99-4f4c-83cc-c58b59b7ebec@intel.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <0bece210-cd99-4f4c-83cc-c58b59b7ebec@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/11/5 3:18, Reinette Chatre 写道:
> Hi Jinjie,
> 
> On 11/4/26 2:23 AM, Jinjie Ruan wrote:
>> rdtgroup_schemata_write() clears last_cmd_status when it takes the group
>> lock, and records a message for the input errors it detects. When
>> resctrl_arch_update_domains() fails, the function returns the error to
>> userspace without recording anything, so last_cmd_status is empty and
>> its show function reports "ok".
>>
>> resctrl_arch_update_domains() fails when the architecture code cannot
>> reach a domain, which on MPAM is a write to an MSC with no online CPU.
> 
> How can this happen? Domain lifetime should be connected to the CPUs
> associated with it - if the domain has no online CPU then it should be
> invisible to resctrl.
> 
> The fix is reasonable, the motivation is just unclear to me.
> 
>> The error code is the only description of the failure available to an
>> administrator, and it never reaches last_cmd_status.
>>
>> Record the resource name and the error where rdtgroup_schemata_write()
>> discards the return value, so that last_cmd_status reports the failure
>> instead of the previous success.
>>
>> Only arm64 MPAM systems are affected today; x86's
>> resctrl_arch_update_domains() always returns 0.
>>
>> Fixes: c377dcfbee80 ("x86/intel_rdt: Add diagnostics when writing the schemata file")
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  fs/resctrl/ctrlmondata.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
>> index cafebdff70dc..cfb59cbc4135 100644
>> --- a/fs/resctrl/ctrlmondata.c
>> +++ b/fs/resctrl/ctrlmondata.c
>> @@ -367,8 +367,11 @@ ssize_t rdtgroup_schemata_write(struct kernfs_open_file *of,
>>  			continue;
>>  
>>  		ret = resctrl_arch_update_domains(r, rdtgrp->closid);
>> -		if (ret)
>> +		if (ret) {
>> +			rdt_last_cmd_printf("%s: failed to update the domains: %pe\n",
>> +					    r->name, ERR_PTR(ret));
> 
> Please instead display the schema name (s->name) to user space as that is the name
> that the user use to interact with the schemata file. 
> Is it necessary to print error code again? This is the same error returned to
> user space, no?
> 
> I do not know what resctrl fs can claim here about hardware state - could such
> a write then partially succeed on MPAM side? If so, best fs can display may be
> something like "failed to update all domains". If so, could user space follow this
> with a read of schemata file to see which domains failed? User may want to retry
> in such scenario ... but back to earlier question, this sounds like a permanent
> failure (until CPUs are back online) when attempting to make domain configuration
> changes that does not sound right here.

There are some cases not permanent:

- PCC/MPAM-Fb MSC returns -EIO in case of protocol errors or timeouts
（mpam_fb_send_request() or smp_call_on_cpu()）;

- -EINVAL when the calculated PARTID is out of bounds
(resctrl_arch_update_one()).

Both will roll back and retry after the cause is resolved will succeed.

I verified these error cases using fault inject for mpam_touch_msc().


> 
>>  			goto out_clear_staged;
>> +		}
>>  	}
>>  
>>  	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
> 
> Reinette

-- 
Best regards,
Jinjie

