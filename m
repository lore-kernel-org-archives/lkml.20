Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8185747B432
	for <linux-kernel@vger.kernel.org>; Fri,  2 Oct 2026 15:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790954692; cv=none; b=jYXaQ1KsAPBGxkG4c4fCDktr/mS2h7vLV+ZcWblDHd2kd3yyEIefhXKEp466txsSwv9TqKZl6NMyMruFAK+CpVbrstzlz4yNohqGJurp7/hQB6CPOPtOyyDf4n3kCg2XU+UhfcmeOPCTtHNhtQL7xgRq31rJ1rsgi7Aa6Jpn7N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790954692; c=relaxed/simple;
	bh=xnlgs42XdKqbQTcU4z+/UmT6K9FjiGZ2s9DZoBILceM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f/jJ8Pdip77cVEDJ07F5wiZfVUHG4DgwvvBxMiAglBcYqH1IneX5bf/yoxlrK8MmYXqVsK7UbRj522xx2a6kiOsFcg+6sIvmKWOAHtzVE/0yAahG61P2J+OihUk6NsPL58ty+9p7uQQCD5NK4X5YEa/Vu1yr96syCyBoiDlwqrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Xb4OIyBo; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Xb4OIyBo"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9DAB3143D;
	Fri,  2 Oct 2026 08:24:46 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 992463F85F;
	Fri,  2 Oct 2026 08:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790954690; bh=xnlgs42XdKqbQTcU4z+/UmT6K9FjiGZ2s9DZoBILceM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xb4OIyBoZ5rbDQrDtuphfB7vn5BkZ0VOq7KmL0YI86OEb76pDNrPfRhRtos1xr+EE
	 4Ze4rtI7Td5RX2fDZH1HQwrFL9c1/K065lnnoqQFzZe7FeJPmafat33cnUZMNnKinh
	 3htFJZjG4bH6OOYzWFPYfekGfUVtBvcNnkU7GKag=
Message-ID: <d92066cd-dbc6-47d7-b218-7dc8c97721da@arm.com>
Date: Fri, 2 Oct 2026 16:24:46 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH v2 05/12] arm_mpam: Ensure MBWU counters are reset on
 restore
To: James Morse <james.morse@arm.com>
Cc: reinette.chatre@intel.com, fenghuay@nvidia.com,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 dave.martin@arm.com, andre.przywara@arm.com, Gavin Shan <gshan@redhat.com>
References: <20260917145617.2202986-1-ben.horgan@arm.com>
 <20260917145617.2202986-6-ben.horgan@arm.com>
 <b61f8b82-a872-4d50-88fc-845287305011@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <b61f8b82-a872-4d50-88fc-845287305011@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi James,

On 02/10/2026 16:13, James Morse wrote:
> Hi Ben,
> 
> On 17/09/2026 15:56, Ben Horgan wrote:
>> When an MSC becomes inaccessible due to cpu offline CFG_MBWU_CTL is set to
>> zero in mpam_save_mbwu_state(). This is very likely to mean that the config
>> will mismatch when restoring and so the monitor will be reset. However, the
>> state may have been lost and so there are no guarantees.
> 
> Power management and kexec are the reason this is done.
> 
> I have a niggling suspicion that some hardware engineer may allow 'running counters'
> to inhibit power-down - which means the cache could stay on when all its CPUs are off.

Ah, I see.

> 
> We may kexec while these CPUs are off. Leaving the hardware in its reset state is
> the least surprising thing to do, and also means we don't get bitten by the above
> (theoretical) power management thing if the next kernel doesn't know about MPAM.

Make sense.

> 
> 
>> Ensure the reset happens by setting the reset_on_next_read
> 
> Doing this makes it more robust,
> 
> 
>> and remove the unnecessary writes from mpam_save_mbwu_state().
> 
> I think this is still a good thing to do.
> 
> 
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index d39d210574a6..6cba3ef21cc8 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -1652,6 +1652,7 @@ static int mpam_restore_mbwu_state(void *_ris)
>>  	u64 val;
>>  	struct mon_read mwbu_arg;
>>  	struct mpam_msc_ris *ris = _ris;
>> +	struct msmon_mbwu_state *mbwu_state;
>>  	struct mpam_msc *msc = ris->vmsc->msc;
>>  	struct mpam_class *class = ris->vmsc->comp->class;
>>  
>> @@ -1659,16 +1660,20 @@ static int mpam_restore_mbwu_state(void *_ris)
>>  		if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>>  			return -EIO;
>>  
>> -		if (!ris->mbwu_state[i].enabled) {
>> +		mbwu_state = &ris->mbwu_state[i];
>> +
>> +		if (!mbwu_state->enabled) {
>>  			mpam_mon_sel_unlock(msc);
>>  			continue;
>>  		}
>>  
>>  		mwbu_arg.ris = ris;
>> -		mwbu_arg.ctx = &ris->mbwu_state[i].cfg;
>> +		mwbu_arg.ctx = &mbwu_state->cfg;
>>  		mwbu_arg.type = mpam_msmon_choose_counter(class);
>>  		mwbu_arg.val = &val;
>>  
>> +		mbwu_state->reset_on_next_read = true;
>> +
>>  		mpam_mon_sel_unlock(msc);
>>  
>>  		__ris_msmon_read(&mwbu_arg);
>> @@ -1701,15 +1706,11 @@ static int mpam_save_mbwu_state(void *arg)
>>  
>>  		cur_flt = mpam_read_monsel_reg(msc, CFG_MBWU_FLT);
>>  		cur_ctl = mpam_read_monsel_reg(msc, CFG_MBWU_CTL);
> 
>> -		mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
> 
> I plan to drop this line,

Ok, I agree.

Thanks,

Ben

> 
> 
>> -		if (mpam_ris_has_mbwu_long_counter(ris)) {
>> +		if (mpam_ris_has_mbwu_long_counter(ris))
>>  			val = mpam_msc_read_mbwu_l(msc);
>> -			mpam_msc_zero_mbwu_l(msc);
>> -		} else {
>> +		else
>>  			val = mpam_read_monsel_reg(msc, MBWU);
>> -			mpam_write_monsel_reg(msc, MBWU, 0);
>> -		}
> 
> But keep this. With reset_on_next_read the driver won't consume the stale value, and
> that approach also covers the hardware resetting into unusual states.
> 
> 
> Reviewed-by: James Morse <james.morse@arm.com>
> 
> 
> Thanks,
> 
> James

