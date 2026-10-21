Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792579508;
	b=xIF7PGNr4rldX5yJ5Tp/YrwBQQmSD+ZVYs8RhtnxpK+e7cT0xrSN9HxpOJ5imFmS9GXv
	 jhwz7nk8mKdT1IUsheS15bhm7hEg91yXRbK5lIAkVLeUYe05BMGYUi7aHZeXDQ45dpMoK
	 8TdT7bTSs6xbbw0nLJpBpEt2yOATNspFgGNgsjA3gJPpTEweca8G+FeUvB6qmt9/DRAAV
	 CF6rai0WnBmUYmkUgORpgDjrKeXzn6Bm/r9CgVYKYMc2Bf7ShU00fhxfIC6p8zH7+BF5v
	 /aaS7ZIMGKDpNm/Wvkt0UhiohpDRSLw0z7/I3eVBI7DELjGCEC7J7boGT/m7NxPheFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792579508;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=XyRQ78BggroJWNa9YaJncJCpDhOnB5oue8lGhRg38uw=;
	b=LoBO06h37XN1ILIGlKeN3U85pgOQluuVkhicGmF0LSItbVE7QwDSC+Uv3qxEShWD+zEZ
	 xrFFv/xoV9FxKbgGOrN0kffyAXUbADKR53B41kvLuxEkRNMfYQHG+sRWVHEdvpPbh/D2N
	 U8/A98MeZN2S3IyHNscNqH/Jt/LWPWFQiDxRrOTVRTqmReddtY1/dRUcXd02WjIa7ctm+
	 KomSnMM/YpsSxaM4fLmV9VfJzueXJIDRERtFzzpWTzIQTEsN4KmZ/mWziSCWGEFMJUKXn
	 gU35ZDD3DYEMp7szLFvVrw2aC586qCq+VbjjjzvBiKkPw4cweMzs6AJ+XVuSgKSs39A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ROUpxDbw;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB36606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 10:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAB36606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ROUpxDbw
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E191D16F8;
	Wed, 21 Oct 2026 03:45:02 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 13AD03F7D8;
	Wed, 21 Oct 2026 03:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792579506; bh=nZ42BZQjh4uy5EZzLEdYqHCNeRbeEy9OOB18/q0M518=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ROUpxDbwu71P5kfieQdrfW7it2k2Nv6Bk89dy2okv34Ra1vf5eN45Prhjr5xaVk+V
	 yWR0T3p7OKati2Yn2DaWXcx+2TmzHQiJ+lBDTa0AI5cKmGRBd6NbylqjvTUVkn8CcF
	 6lP5BpLxc7Q1qk+T3pNRlvn3WskZU+S3SbRvvjfQ=
Message-ID: <d1efef72-5cd5-41f6-8389-53b62490e4b9@arm.com>
Date: Wed, 21 Oct 2026 11:45:03 +0100
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
Subject: Re: [PATCH] arm_mpam: Release the mon_sel lock on
 mpam_save_mbwu_state() errors
To: Andre Przywara <andre.przywara@arm.com>, Ping Li
 <leeonion.muyu@gmail.com>, james.morse@arm.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 reinette.chatre@intel.com, fenghuay@nvidia.com
References: <20261020114807.3915705-1-leeonion.muyu@gmail.com_quarantine>
 <d6f3b250-bfc0-4d74-b729-3791bc145e1c@arm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <d6f3b250-bfc0-4d74-b729-3791bc145e1c@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Andre,

On 21/10/2026 10:26, Andre Przywara wrote:
> Hi,
> 
> On 10/20/26 13:48, Ping Li wrote:
>> mpam_save_mbwu_state() takes the mon_sel lock at the top of each loop
>> iteration, but the four error paths that return after failed
>> MPAMF_MON_SEL register accesses do so without releasing it.
>>
>> Take the lock with the conditional mon_sel_lock guard class instead,
>> so all exit paths release it.
> 
> many thanks for spotting this!
> 
> Similar lines were in the last patch version sent out, but as Ben mentioned, this somehow conflicted
> with the other MPAM changes, so it got accidentally removed.
> The original version always returned -EIO, but we now always use this error code inside mpam_fb.c

For consistency we should always return -EIO on the locking failure as that's what's done in all the
non-AQUIRE() cases. However, I do think this fix is ok as it is and that at some point down the line
we can update the conditional guard to enforce this.

DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
	     if (_T && !IS_ERR(_T)) mpam_mon_sel_unlock(_T),
	     mpam_mon_sel_lock(msc) ? msc : ERR_PTR(-EIO), struct mpam_msc *msc);
DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);

Thanks,

Ben



> already, so there is no difference, and this version here is more future-proof, should we lift the
> restricted range of errors handled in the future. So:
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 
> Thanks!
> Andre
>>
>> Fixes: a3a94c13c442 ("arm_mpam: propagate MSC access errors for state saving function")
>> Signed-off-by: Ping Li <leeonion.muyu@gmail.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 12 +++++-------
>>   1 file changed, 5 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 48adc49b833c..c067b6d57d71 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2037,8 +2037,10 @@ static int mpam_save_mbwu_state(void *arg)
>>       struct mpam_class *class = ris->vmsc->comp->class;
>>         for (i = 0; i < ris->props.num_mbwu_mon; i++) {
>> -        if (WARN_ON_ONCE(!mpam_mon_sel_lock(msc)))
>> -            return -EIO;
>> +        ACQUIRE(mon_sel_lock, guard)(msc);
>> +        ret = ACQUIRE_ERR(mon_sel_lock, &guard);
>> +        if (ret)
>> +            return ret;
>>             mbwu_state = &ris->mbwu_state[i];
>>           cfg = &mbwu_state->cfg;
>> @@ -2061,10 +2063,8 @@ static int mpam_save_mbwu_state(void *arg)
>>           cfg->partid = FIELD_GET(MSMON_CFG_x_FLT_PARTID, cur_flt);
>>           mbwu_state->enabled = FIELD_GET(MSMON_CFG_x_CTL_EN, cur_ctl);
>>   -        if (!mbwu_state->enabled) {
>> -            mpam_mon_sel_unlock(msc);
>> +        if (!mbwu_state->enabled)
>>               continue;
>> -        }
>>             val = 0;
>>           mbwu_arg = (struct mon_read) {
>> @@ -2088,8 +2088,6 @@ static int mpam_save_mbwu_state(void *arg)
>>           ret = mpam_write_monsel_reg(msc, CFG_MBWU_CTL, 0);
>>           if (ret)
>>               return ret;
>> -
>> -        mpam_mon_sel_unlock(msc);
>>       }
>>         return 0;
>>
>> base-commit: 8ea457f746d915d55f78b43d33b1cd618f3d93ad
> 

