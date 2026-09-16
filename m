Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B9FCF4A5C34
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 09:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789552175; cv=none; b=TI4NtQwbAl8aAidBC9lJsFQEsJxQ8oO/4dveLw5yJXCg8FTOEqQJ0+7Tptf43hr8QOJL2HokDfVww1yiUCKUiBFUn1q84X3mfQbZ2Ncbnj2HXhD6+xmFDTXaGKkD1NUNqrLSywmsRdKusIa6tN68ZTQu1BBn133675/0HgU63OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789552175; c=relaxed/simple;
	bh=KuO14YuSIMliHThLNP9CFnL/2L6g8T7HPTMoBngDAQQ=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ORCaQPHPRMq52tjhFw4JiP0+HJfLDh5WHPaZCXa/ncTegmuA695MVRkxkGiL87C4ahHYs6sdnW+VTWaeoIAx0UNP4RYYa3tJ6KkBjLuyp+yNTXbq9G7mIbTWFeonmNYlVCy93AoQqv7hl/1uHw+RucGghQcFFL0xCDkgsA4GX/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ARyNLCNZ; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ARyNLCNZ"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB8041516;
	Wed, 16 Sep 2026 02:49:18 -0700 (PDT)
Received: from [10.2.212.8] (unknown [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 445E73F86F;
	Wed, 16 Sep 2026 02:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789552162; bh=KuO14YuSIMliHThLNP9CFnL/2L6g8T7HPTMoBngDAQQ=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ARyNLCNZkGUYpKmy5uBK9NEea7T0DnlON4jVwojrWrqR+y2L8389NX9ZkBoDdHaH7
	 SDH1ldmrUffCGGg/ci8ztuMCsrDMA+f1d32D5ipJKsuFnkU+sgU8NvKUyv7fpshSKm
	 EKjwNkN9yrL/JG7dZahf5u/oa2a8XSSY8QGckcW4=
Message-ID: <2c682691-3037-4d62-a941-bc41baca35aa@arm.com>
Date: Wed, 16 Sep 2026 10:49:19 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
From: Ben Horgan <ben.horgan@arm.com>
To: Andre Przywara <andre.przywara@arm.com>, James Morse <james.morse@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, Yin Li <yin.li@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Language: en-US
In-Reply-To: <ea42f2a7-f4f7-46ab-a5e0-239c74174499@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Andre,

On 07/09/2026 13:59, Ben Horgan wrote:
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
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

I seem to have been a bit hasty here.

Sashiko points out at [1] that 0xFFFFFFFF is the only value we were previously considering invalid
and that the value coming from dt or acpi can provid other valid values that would after this patch
be considered invalid.

[1] https://sashiko.dev/#/patchset/20260902143757.3469690-1-andre.przywara%40arm.com

Thanks,

Ben>
> Thanks,
> 
> Ben
> 
>> ---
>>  drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
>> index 9d223057953ab..a5e661eff86d7 100644
>> --- a/drivers/resctrl/mpam_resctrl.c
>> +++ b/drivers/resctrl/mpam_resctrl.c
>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>  /* Find the L3 cache that has affinity with this CPU */
>>  static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>  {
>> -	u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +	int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>> +
>> +	if (cache_id < 0)
>> +		return -ENOENT;
>>  
>>  	lockdep_assert_cpus_held();
>>  
> 
> 

