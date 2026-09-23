Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0E923BFAEA
	for <linux-kernel@vger.kernel.org>; Wed, 23 Sep 2026 09:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154345; cv=none; b=eO6I98J5HdO6zAjw4pLkOHOdgKXZ39zNlPsgx1qWxXCyp26fqE0iqUFuTIYVk4q2NqDso/j2pOq6ykitr8kVmE6VLzBY8scDf4mqWRuWZVCha0CjnjTZunTEk88vaWUWnSmgktCPg6dQCSe8EtldO3tRkpkbg/I6Ukfw9jTSvvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154345; c=relaxed/simple;
	bh=R2i5IfA5jKQQBqoNQ4EokdkrgNEVVJacynwAXh+d3W4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hLDv2ZiW6MK8xHIb/BtsvbBK6PxN2m63VvNij47sQo16lkgPvoHWUpLWFOHsouDPM91dbR0mwOlmtxl0It5jcWbn8mpav/ekIMDKFhwZsPZyRJrzZ6kfaogXXEz9RzjSm/UBWFbOhY/Ljn8HE3LqOyyzRS9SEjb+N4DPGHzXk5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=l3iPaizy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="l3iPaizy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A032D1477;
	Wed, 23 Sep 2026 02:05:39 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 621EC3F86F;
	Wed, 23 Sep 2026 02:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790154343; bh=R2i5IfA5jKQQBqoNQ4EokdkrgNEVVJacynwAXh+d3W4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l3iPaizy8XYvY5EjAgwFVFcScyTsDg+MFRknXU9CDXJKpx0s1X6QW/Oloor1Q/JY9
	 tjnp/5dosX7qQ66tGkoujfsrI/U6sTTnvZ/1QRPT8/xYWusppnxrebVCkIKkamy5TI
	 ee1lvNcwPxRbNw+oTBB2QORCYrIL5EB9lYqvY/sA=
Message-ID: <207b08d7-c542-4d8f-b9c2-894f0335118b@arm.com>
Date: Wed, 23 Sep 2026 10:05:39 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] fs/resctrl: Add schema_name to struct
 resctrl_ctrl
To: Drew Fustini <fustini@kernel.org>
Cc: reinette.chatre@intel.com, Dave.Martin@arm.com, babu.moger@amd.com,
 bp@alien8.de, dave.hansen@linux.intel.com, fenghuay@nvidia.com,
 james.morse@arm.com, linux-kernel@vger.kernel.org, peternewman@google.com,
 tglx@linutronix.de, tony.luck@intel.com, x86@kernel.org, yu.c.chen@intel.com
References: <d258a32f-12d5-464d-abe9-4720fb3e44b3@intel.com>
 <20260921135702.2874931-1-ben.horgan@arm.com>
 <20260921135702.2874931-2-ben.horgan@arm.com> <arLh15FAVib_554X@gen8>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <arLh15FAVib_554X@gen8>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Drew,

On 22/09/2026 21:15, Drew Fustini wrote:
> On Mon, Sep 21, 2026 at 02:57:00PM +0100, Ben Horgan wrote:
>> In order to properly align the schema in the schemata and size file the
>> maximum of length of all the schema names needs to be
>> known. resctrl_resource_ctrl_max_len() makes this calculation but stops
>> short of actually constructing and storing the schema names. As the schema
>> name is based on the resource name and the schema name with some special
>> cases for legacy controls this leads to a lot of conditional formatting
>> when displaying the schema name.
>>
>> Construct the schema name and save it to struct resctrl when mounting
>> resctrl. This makes displaying the schema name easy whilst control of the
>> naming stays within resctrl.
>>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>
>> ---
>>  fs/resctrl/ctrlmondata.c | 51 ++++++-----------------------
>>  fs/resctrl/rdtgroup.c    | 69 +++++++++++++++++++++++++---------------
>>  include/linux/resctrl.h  |  1 +
>>  3 files changed, 55 insertions(+), 66 deletions(-)
>>
>> diff --git a/fs/resctrl/ctrlmondata.c b/fs/resctrl/ctrlmondata.c
> [..]
>> @@ -638,18 +608,17 @@ int rdtgroup_schemata_show(struct kernfs_open_file *of,
>>  	if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKSETUP) {
>>  		list_for_each_entry(f, &rdt_resource_final_all, list) {
>>  			for_each_enabled_ctrl(ctrl, f->res)
>> -				seq_printf(s, "%s%s%s:uninitialized\n", f->name,
>> -					   resctrl_ctrl_is_default(ctrl) ? "" : "_",
>> -					   resctrl_ctrl_is_default(ctrl) ?
>> -					    "" : resctrl_ctrl_name_str(ctrl->name));
>> +				seq_printf(s, "%*s:uninitialized\n",
>> +					   max_name_width, ctrl->schema_name);
>>  		}
>>  	} else if (rdtgrp->mode == RDT_MODE_PSEUDO_LOCKED) {
>>  		if (!rdtgrp->plr->d) {
>>  			rdt_last_cmd_puts("Cache domain offline\n");
>>  			ret = -ENODEV;
>>  		} else {
>> -			seq_printf(s, "%s:%d=%x\n",
>> -				   rdtgrp->plr->f->res->name,
>> +			ctrl = resctrl_resource_ctrl_get_default(f->res);
> 
> I think f is only set in the for loops, so should this be
> rdtgrp->plr->f->res instead of f->res?

Yes, it should be. I only ran this on MPAM so didn't encounter this.

Thanks,

Ben

> 
> Thanks,
> Drew

