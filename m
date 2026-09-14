Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397202D7380
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789367761; cv=none; b=FXFlR3IFBiYP7G2LYy0bN2nm74R4x3nCbkI7eg55OmftSkN6SPVn+np7IhdekGvpo+OsCsQtc5RxTstDCJAMqtM4OcNI8yLMJmeGrmbJvkDqst9b2Dgeikc47AHWsNlDbHehD2YBbaNFVf6UsxWFvFhgZq0RybrxhHJ83RWCnbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789367761; c=relaxed/simple;
	bh=CO2/kZ5AMt1vYaBfK47M9hVwzE1/6jmZb7vGEaLSO4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p89Elihqj2jnE5exBEMvd5Bvnc0pZLuRcKHc/mEoGIA9Gnn5ysjh80ZofydZbaNp53CXhhB1SDVbh9eMg+Yd5MgfiygAgNxz99Y7hnvC53QlqZqQyX8lVu2mrGiskX8D45MxYmcUOs9+vWlGslKj1mr3rMsrLdQ7osPjiHPLUdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NpINEak9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=W+T0uids; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NpINEak9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="W+T0uids"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789367759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n1jnbA2+0m8jMcSOTI7kteKRffo6NH4qkfWO74dnZxs=;
	b=NpINEak9Dm8E5k1jIxBKkJ50ayFoORINTJL+akUzuDKm0BERKEMQ/0NOuogiC09mRXM74P
	Oqo7DBhF/GunFQUTgiC0KGLzYofTJ/kyM7dt/2lw/qEA28BOOknMATNw/MDdK1c8WwSqmf
	PutD5hxA+s+DA0jTzWRVP6HeCMk6cT4=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-542-wvqLABcMMIqCcsrN_yMx9A-1; Mon, 14 Sep 2026 02:35:57 -0400
X-MC-Unique: wvqLABcMMIqCcsrN_yMx9A-1
X-Mimecast-MFC-AGG-ID: wvqLABcMMIqCcsrN_yMx9A_1789367756
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4e496e5c3so886297a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Sep 2026 23:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789367756; x=1789972556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n1jnbA2+0m8jMcSOTI7kteKRffo6NH4qkfWO74dnZxs=;
        b=W+T0uidsEVQPnsRpYdqs0dQcdbzctNOHFdCYnlisUComTSiRUp/UfLdF90EExRrr8Q
         THbtT3Gky7AM6aJ32vmH4TD5wZnjstOA0tnphpaxRLXJILNBh5neWSarKaeOi33fhgiX
         SZvuVR7+VC+lRtK/U9Dk1j3dfeG/qEw6uABOBKLB6ir6pa5BgWgSe45h/lPS1ju1Jsbd
         mHmVHW2ryDhSknimJ/wHQFqKJd4RRwWDn5BwGwwICmTPanQbO1hcmtAckAGMp7MZ8eLm
         ovSFhPQRcL/5g44Hv+CFeaiOdS551EjmRC+WXSp712/E4JRSLjAfQSvQ9Dc8zvvv2ZRj
         EEPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789367756; x=1789972556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n1jnbA2+0m8jMcSOTI7kteKRffo6NH4qkfWO74dnZxs=;
        b=jJePxHZYvPeUK606vj7myBSmvB3DFvIm2V/9SFG7edZs//B9bniar1DPK7QQWEDo6P
         d9rvJdbD1GLXK7MQjEzH7Kcivuo27B16gUL/GmqIOrtFeIv3EQez4XIdTZUkE4Bb1bKE
         BSxN/N3rUQrxy715HemtZgkoktl6kLU+lnEhJu9Bwt51ue9e83YuzUo6nYumC1HsQJtr
         71bmnZXx+WZAruSj8cdUNpos4DACSJZpKkE2oUwEjrl0eH9ranW1ziChlRnW2FVP7L2h
         qjJKxzF1XzCn7CGpk+SQlZdpxR8LGkyslPxm8NPO6UUJBt976gZuaMwZApxjtLfucNNH
         lmSg==
X-Forwarded-Encrypted: i=1; AKwUvBykYeEc1JZP3WOM1vzlcWxznYLzSfSqHiIFm9ySyc8rW0vRMYi5TVi1BmyzO3dyy04t0dqrxV2HQr/ohao=@vger.kernel.org
X-Gm-Message-State: AFuF++kpA0tO5Oi99yje3BXP3ovZHyDuYcPAeQY5F31fkutKD2Aj4TZp
	Fc+WYHm0xIljW7/rN49l57d68ETM5FPIdBWqMsyxeHdzPqlYgO6OF0VD+EZvd11PtiIzrlrjgLQ
	upQZR7siyfg2Ir5/1cnq3AhEjB/83FVDZQqhcFNFZd2BL9oZ7zlSa1m44BQgaCKegrg==
X-Gm-Gg: AYBFou3/iOcsnD/I4xy/sN05C+q8FQHhaFBYl8aSg1cCo040qIKkNaBKf1kcM/prxKd
	RK+aNiTktlsUsxjBlvw4iAaR+mqOYLbslZ9KDRp0H6M/n5wHAiPXhGlXOLWBf7NS31AL0nUP+CW
	4n/+KhNZUJ64cT3gN6Dg35KZF/8hjDQzthUeQilS1p7O9ZI4ryuzyxJ0ezVvUZYQhOsOAS+2SxS
	25Lcz6tOweuMB2rPA5boewke8MVD8lKwdqrIo5bKOw9iabkXj+JGOYyDa2NuJpr9tXv3sbXSO4l
	I8EeKIfHd5MLhUCRPUGnU/DO7qOk67G6laQhDSd96giQ2rj5Pwaz4BOsW/Z/TIe+ih0PaPhz8Zq
	yW3CmHYUdTEc31KzI4s/o8q1z4jWhCYHN6EYmG09lWA==
X-Received: by 2002:a05:6a21:9183:b0:3d7:3cab:c72e with SMTP id adf61e73a8af0-3db405340acmr2425199637.16.1789367756129;
        Sun, 13 Sep 2026 23:35:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:9183:b0:3d7:3cab:c72e with SMTP id adf61e73a8af0-3db405340acmr2425136637.16.1789367755712;
        Sun, 13 Sep 2026 23:35:55 -0700 (PDT)
Received: from [192.168.68.52] (n175-34-8-244.mrk21.qld.optusnet.com.au. [175.34.8.244])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc4f4e5aa58sm505037a12.8.2026.09.13.23.35.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2026 23:35:55 -0700 (PDT)
Message-ID: <a347c9e4-cbaa-46ff-bb54-a634da32ef9e@redhat.com>
Date: Mon, 14 Sep 2026 16:35:48 +1000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm_mpam: resctrl: Catch and propagate error from
 get_cpu_cacheinfo_id()
To: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara
 <andre.przywara@arm.com>, James Morse <james.morse@arm.com>,
 Ben Horgan <ben.horgan@arm.com>
Cc: Reinette Chatre <reinette.chatre@intel.com>,
 Fenghua Yu <fenghuay@nvidia.com>, Tony Luck <tony.luck@intel.com>,
 Dave Martin <Dave.Martin@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260902143757.3469690-1-andre.przywara@arm.com>
 <095ebf41-e3c1-4e7e-b6f9-84b6f94da3ce@redhat.com>
 <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
Content-Language: en-US
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <7c6b728a-38e8-41d0-b99e-85a09a79a0b1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Yin,

On 9/14/26 4:25 PM, Yin Li wrote:
> On 9/14/2026 2:14 PM, Gavin Shan wrote:
>> On 9/3/26 12:37 AM, Andre Przywara wrote:
>>> get_cpu_cacheinfo_id() can fail, in which case it returns a negative
>>> error value.
>>>
>>> Check the returned value for this error condition, before passing the
>>> value on to other code, which would hide the negative number in some high
>>> value in the unsigned type.
>>>
>>> Fixes: 36528c7681b8 ("arm_mpam: resctrl: Add support for 'MB' resource")
>>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>>> ---
>>>   drivers/resctrl/mpam_resctrl.c | 5 ++++-
>>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>>
>>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>>
>>> diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/ mpam_resctrl.c
>>> index 9d223057953ab..a5e661eff86d7 100644
>>> --- a/drivers/resctrl/mpam_resctrl.c
>>> +++ b/drivers/resctrl/mpam_resctrl.c
>>> @@ -786,7 +786,10 @@ static u32 get_mba_min(struct mpam_props *cprops)
>>>   /* Find the L3 cache that has affinity with this CPU */
>>>   static int find_l3_equivalent_bitmask(int cpu, cpumask_var_t tmp_cpumask)
>>>   {
>>> -    u32 cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +    int cache_id = get_cpu_cacheinfo_id(cpu, 3);
>>> +
>>> +    if (cache_id < 0)
>>> +        return -ENOENT;
>>>       lockdep_assert_cpus_held();
>>
>> find_l3_equivalent_bitmask() passes @cache_id to find_l3_equivalent_bitmask() as
>> a 'unsigned long' argument. Actually, it can be 'u32'. It's not directly related
>> to this patch though.
>>
>> int mpam_get_cpumask_from_cache_id(unsigned long cache_id, ...);
>>
>> can be:
>>
>> int mpam_get_cpumask_from_cache_id(u32 cache_id, ...);
>>
> 
> Hi Gavin,
> 
> Thanks for pointing this out. I've made exactly this change in my MPAM
> DT series (v2, in preparation) — mpam_get_cpumask_from_cache_id() is
> changed from unsigned long to u32 there, along with the related cache-id
> variables.
> https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com/
> 
> I'm about to post v2 of that series and will make sure you're on Cc, in
> case you'd like to take a look.
> 

Thanks for head-up, please keep me on the cc list. I would like to review
if I get bandwidth, but no promise :)

I noticed RFCv1 series of DT support for MPAM was posted to linux-kernel@vger.kernel.org
instead of linux-arm-kernel@lists.infradead.org. Since MPAM is a arm64 feature, it's
reasonable to post the patches to linux-arm-kernel@lists.infradead.org at the same time.

MAINTAINERS doesn't indicates a maillist for MPAM patches in section "MPAM DRIVER". I guess it
would be something worthy to be added.

Thanks,
Gavin


