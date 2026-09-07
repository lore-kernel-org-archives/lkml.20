Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AB93442393
	for <linux-kernel@vger.kernel.org>; Mon,  7 Sep 2026 13:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786857; cv=none; b=Qg1E9dKbcrl/UUH63sel7Cp1zvYanIL7qzcxnyNKe+5YyEoB6LvWthoA7eBytYaDUPfICGOH875iWocSA1L+XZjXhprGTDbHV36OvTwwvnphxlT+PXjDQqOlBg9C5zqWpbZJfUHYc7X7gEGdISDw84cygjIJ3s/Lv+Zl7PoS8hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786857; c=relaxed/simple;
	bh=XWLt2OmFnj478hxlI5SLGUXw2C8SjtcuYR3m957GDEI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdn6ddH3XGsY8qDhKInWXTRnYj3ca+EpiCtzoRVrL+GibIzokN1yLVikICe+3qOXXHKC0/KBKKpM15c5OYDI8skgOIT7gnyu8PQmNkrOmUAufLE0e5biGfrCBQTPQRv4ZzShpqrVxfLmtkxl15RJerA5AqGQN2eko86Kxjfp3Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=DlIReHo4; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="DlIReHo4"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08C841476;
	Mon,  7 Sep 2026 06:14:05 -0700 (PDT)
Received: from [10.57.7.12] (unknown [10.57.7.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4818F3F7D8;
	Mon,  7 Sep 2026 06:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788786848; bh=XWLt2OmFnj478hxlI5SLGUXw2C8SjtcuYR3m957GDEI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DlIReHo4IXFAsHTh3mJ60nbj3okusPpJbvnauJK1CVeqYxdGOUmmuK3cOSzJsIJ+g
	 JWMitI4SSa4Cph7NPhgFStdu3qr3E1rg4bg1AweLFBfEvTJ+IfjrcZYlVKsqgol1Zx
	 HRqnqGsUEu7yqoUCUgbhZsitwnWZSzdz7tvB72d8=
Message-ID: <99baf0a9-e9e8-49c5-a550-78c10a3ef702@arm.com>
Date: Mon, 7 Sep 2026 15:14:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Ben Horgan <ben.horgan@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ben,

thanks for having a look!

On 9/7/26 14:59, Ben Horgan wrote:
> Hi Andre,
> 
> On 02/09/2026 15:37, Andre Przywara wrote:
>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>> error value.
>>
>> Check the returned value for this error condition, before passing the
>> value on to other code, which would hide the negative number in some high
>> value in the unsigned type.
>>
>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> 
> This looks good to me. Out of interest what led you to find this?

For Yin Li's RFC patch [06/15], I was looking around to find the proper 
type for cache-id, and stumbled upon this.

> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!

Cheers,
Andre

> 
> Thanks,
> 
> Ben
> 
>> ---
>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 9d223057953ab..a5e661eff86d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>   /* Find the L3 cache that has affinity with this CPU */
>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>   {
>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +	if (cache_id < 0)
>> +		return -ENOENT;
>>   
>>   	lockdep_assert_cpus_held();
>>   
> 

