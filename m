Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940B8388393
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 13:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789564646; cv=none; b=DaSxb+3DDYhq5UXXmp3TviP38+zsRmHOMo7uTUluzXp0PxxlUwjkVLiZiYXinTCfbP0w208yqhXaT1FZLz5ovJ2lELawcDVAaLZZYTyfv4ogqiBbSM1ztdTcBItbaqfDwZ9Kd/fSagEj831jaTBs4TX/UGYY049S/wSdPjjMvLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789564646; c=relaxed/simple;
	bh=OXCTiYZ/7caImlsv50eWp1ZJeayCZKJU7MD6X5Xk3f0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sPGA6Rhi7wFdtcORJotX77S6AzUYJY9zF0JDe0GmJXke5Ac1WCP8RzyQMT3tHsOyBIKN0ZoEEv4rO13/7WO7DQU7QqvxTSBLUnAw2S0wDV/z9iMUMC/ZmK/HxIAVAcvHGBBvcXKlkGz0TFBbf0DsoE7O7YiPwWsZ0EXdBbeEY6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KLQn0MjR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Or7FiapI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KLQn0MjR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Or7FiapI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789564640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=docZh/8sl7dXFnUbYvGXsVtko0JDj9j3X/6xWphAisg=;
	b=KLQn0MjRdXFoSE8QOzhk/q3eytvh0ONahO8v1+McGNBZnCIM4B1hSwsI1ccTwlBTlDKl5X
	gxAwTEAQ1hg2jZQ78RvhghQqpS+cUfQaICFQNKH2n2hSEqvaVsQNNV7qsyzehbYV8uXqcI
	Oh9Ape+yDMIZRko4DmS1RdPdQlnRf0Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-JCExvUcOMEitzogG7fSjUw-1; Wed, 16 Sep 2026 09:17:16 -0400
X-MC-Unique: JCExvUcOMEitzogG7fSjUw-1
X-Mimecast-MFC-AGG-ID: JCExvUcOMEitzogG7fSjUw_1789564636
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-49d0ae342b9so41181895e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 06:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789564636; x=1790169436; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=docZh/8sl7dXFnUbYvGXsVtko0JDj9j3X/6xWphAisg=;
        b=Or7FiapIX/G9hdpf9ma6d/qAalvCtD/wVkK23SvAp+xWML+2Xk9Qi2lKz7SOpefo92
         gjv2W5RHYzcmh6t4U93w/9Jz9OCwP2Txvqt1UPLLW/XrX79Z7dC8JDaP++YMqwytVrLZ
         7pDpxYwu+l70Ad/yVIumW9g6940szsYMAnwN06DqyO17hdB+kTgoopTEbtYWZ4h2BCQj
         64QpSRL5II2o1yn7+ODZgsMItk5t29L1aKSMt+ql9QpqwtNpTw47KCLQq0yBIbna2TIF
         wA7YucgT8duwwaWcThpeZAU9evPfUVvsLpz+qzr0853ZhTP6nsbHiDgE1tkPXUrkkgwH
         oUdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789564636; x=1790169436;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=docZh/8sl7dXFnUbYvGXsVtko0JDj9j3X/6xWphAisg=;
        b=TsPod4oslWKqzNvn7VWo/pk1wibqy0TEiPs4/EtqdxWkrk5oeO/UTo6zu/h7Vmj8sC
         V6YOlaumbHb+I5lV+90da9ISQHZ4YUgU+zGiriMrim65yDi9di+XRuGw0zYd+0FKchfq
         pjD4JvUioGfx6w2HoWC6qqWRJZQ9Ejj8wbMNzhAse8Ni0QwaOmuvBiveNsz6Ov7qE0yN
         UPnHPntwmu/5fzYMjTKW4RiJiSkC/8ipA7y7p/xK+85yZ/M3VX02fPpsrKNh3J3ZHTTj
         QDZ7TZORqSjNbEJU3YKjULRnOTBaH/MzZhnUsZAoOm9inluQqoaNHL0If+HfppAkYuJP
         T5gw==
X-Forwarded-Encrypted: i=1; AKwUvByt0xHupL8286cMoOkpLUDuz0K+6Rb6d00K2PFo2ovYioU+mxuB3umpSgZffZ3Rh1LnR1vrlzFbD52vs08=@vger.kernel.org
X-Gm-Message-State: AFuF++lCMsR89/pVjvOQgEH6p/yomMYyAUI/lpMgL77TZ6ttUP12xZrN
	UFdz2udQ+0dX4/BJrmiWwfpdTSLMe7PFRg83zTlC55ccWndAAg81A1HqhAVhap6T0Al0at49hwi
	c+NpAwdWs4SI6+HbgwlpuuTCkpFbC0A7/iHhzehYXXFHqWX183tOeSdRVk2sppQjkLQ==
X-Gm-Gg: AYBFou2WPsE0jok8Zsa1TzHSBAkHZR9azX83NCL9DnabV/SiF+1RkwpjNue5ZDxMugu
	XoLEcB9SIq+gnKSbqZUf62tYUQ2EBzErpD2OJvMMJFOT6yTkxbJYgjLbtha90zK4J9aWdDaPZ1u
	IngSKQRxnx6lqp9AfyJrUbgoH0+jD2lo720C4GxF9gAJSo4zVcuyK+QlQYV9oUrQ1aFkTWbPliB
	GMVv+mPIPmVc6VKzJjX9x2RXeBIY9qBzzUaubGpAY+ionkl9UdmWHdwAge3uMD0d/5jnjdd4/yc
	V/s9ayg9fjR2+48BCw57NROS0Ic+7u73D9/ptxQ7qOCTlxoWKd+48kAPXXG8hsYBF3wgcraKqw=
	=
X-Received: by 2002:a05:600c:1986:b0:49e:70b2:66ab with SMTP id 5b1f17b1804b1-49eac40f67emr32595505e9.0.1789564635545;
        Wed, 16 Sep 2026 06:17:15 -0700 (PDT)
X-Received: by 2002:a05:600c:1986:b0:49e:70b2:66ab with SMTP id 5b1f17b1804b1-49eac40f67emr32595095e9.0.1789564635086;
        Wed, 16 Sep 2026 06:17:15 -0700 (PDT)
Received: from [192.168.2.83] ([46.175.183.46])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bf413dcsm7232759f8f.31.2026.09.16.06.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 06:17:13 -0700 (PDT)
Message-ID: <c93e917a-6c66-44f1-a3c1-5c5f5b3930da@redhat.com>
Date: Wed, 16 Sep 2026 15:17:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH iwl-next 2/2] ice: don't offload drop filters that bypass
 higher priority filters
To: Simon Horman <horms@kernel.org>
Cc: netdev@vger.kernel.org, anthony.l.nguyen@intel.com,
 przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 priyalee.kushwaha@intel.com, kiran.patil@intel.com,
 wojciech.drewek@intel.com, michal.swiatkowski@linux.intel.com,
 intel-wired-lan@lists.osuosl.org, linux-kernel@vger.kernel.org
References: <20260910154824.3603687-3-poros@redhat.com>
 <20260912083645.145790-1-horms@kernel.org>
Content-Language: en-US
From: Petr Oros <poros@redhat.com>
In-Reply-To: <20260912083645.145790-1-horms@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 9/12/26 10:36, Simon Horman wrote:
> This is an AI-generated review of your patch. The human sending this
> email has considered the AI review valid, or at least plausible.
> Full review at: https://sashiko.dev/#/patchset/20260910154824.3603687-2-poros@redhat.com?part=2
> ---
> ice: don't offload drop filters that bypass higher priority filters
>
> This commit tracks software-only TC filters to prevent the hardware from
> incorrectly offloading lower priority drop rules that would override them.
> It tracks un-offloaded filters within a device block and rejects conflicting
> drop offloads.
>
>> diff --git a/drivers/net/ethernet/intel/ice/ice_tc_lib.c b/drivers/net/ethernet/intel/ice/ice_tc_lib.c
>> --- a/drivers/net/ethernet/intel/ice/ice_tc_lib.c
>> +++ b/drivers/net/ethernet/intel/ice/ice_tc_lib.c
> [ ... ]
>> @@ -2269,6 +2269,112 @@ ice_find_tc_flower_fltr(struct ice_pf *pf, unsigned long cookie)
> [ ... ]
>> +static void ice_tc_track_sw_fltr(struct ice_pf *pf,
>> +				 struct net_device *filter_dev,
>> +				 struct flow_cls_offload *cls_flower,
>> +				 enum ice_eswitch_fltr_direction direction)
>> +{
>> +	struct ice_tc_sw_fltr *sw_fltr;
>> +
>> +	hlist_for_each_entry(sw_fltr, &pf->tc_sw_fltr_list, node)
>> +		if (sw_fltr->cookie == cls_flower->cookie)
>> +			return;
> [Severity: High]
> Does this early return break tracking for TC shared blocks?
>
> When a shared block is bound to multiple interfaces, the driver will only
> track the cookie for the first interface because this check returns early
> when it sees the same cookie.
Correct. For a block bound to multiple devices of one PF only the first
binding's filter_dev is remembered, so the guard protects the first
binding only. The impact is a missed refusal on the other bindings,
never a false refusal, but it is easy to do better. I will rework the
tracking in v2 to keep one entry per cookie and filter_dev pair, so
every binding replay creates its own entry and the guard covers all of
them.
>
>> +
>> +	sw_fltr = kzalloc_obj(*sw_fltr);
> [ ... ]
>> +static bool
>> +ice_tc_drop_bypasses_fltr(struct ice_pf *pf, struct net_device *filter_dev,
>> +			  u32 prio, enum ice_eswitch_fltr_direction direction)
>> +{
>> +	struct ice_tc_flower_fltr *fltr;
>> +	struct ice_tc_sw_fltr *sw_fltr;
>> +
>> +	hlist_for_each_entry(sw_fltr, &pf->tc_sw_fltr_list, node)
>> +		if (sw_fltr->filter_dev == filter_dev &&
> [Severity: High]
> Because the tracking entry is bound strictly to the first interface's
> filter_dev, won't this check fail to protect other ports sharing the same
> block?
Yes, same root cause as above, fixed by the same v2 rework. The
per device comparison itself has to stay because TC priorities are not
ordered across blocks, only the tracking granularity was wrong.
>
>> +		    sw_fltr->direction == direction && sw_fltr->prio < prio &&
>> +		    !sw_fltr->is_drop)
>> +			return true;
> [ ... ]
>> @@ -2336,6 +2471,9 @@ ice_del_cls_flower(struct ice_vsi *vsi, struct flow_cls_offload *cls_flower)
>>   	struct ice_pf *pf = vsi->back;
>>   	int err;
>>   
>> +	if (ice_tc_untrack_sw_fltr(pf, cls_flower->cookie))
>> +		return 0;
>> +
> [Severity: High]
> When deleting a filter from a shared block, the first net_device will delete
> the unique tracking entry here. Won't subsequent callback invocations for the
> other ports in the shared block fall through to the hardware failure path
> and incorrectly return -EINVAL?
They will, though that is what every DESTROY for an unknown cookie
returned before this patch too, so nothing gets worse. With the v2
per binding tracking each DESTROY invocation removes its own entry and
returns 0, which fixes this for tracked filters as a side effect.
>
>>   	/* find filter */
>>   	fltr = ice_find_tc_flower_fltr(pf, cls_flower->cookie);
>>   	if (!fltr) {
> Later in ice_del_cls_flower(), the filter is removed and freed:
>
> drivers/net/ethernet/intel/ice/ice_tc_lib.c:ice_del_cls_flower() {
>      ...
> 	/* delete filter from an ordered list */
> 	hlist_del(&fltr->tc_flower_node);
>
> 	/* free the filter node */
> 	kfree(fltr);
>      ...
> }
>
> [Severity: High]
> This is a pre-existing issue, but is it safe to modify tc_flower_fltr_list
> and free the filter here?
>
> While this runs under the rtnl_lock, the background device reset task
> (ice_reset_subtask) calls ice_rem_all_chnl_fltrs(), which iterates over
> pf->tc_flower_fltr_list and frees filters using kfree() without holding
> the rtnl_lock or any driver-specific lock protecting the list.
>
> Could this concurrent access during a hardware reset result in list corruption
> or a use-after-free?
Confirmed, this race is real and pre-existing. ice_prepare_for_reset()
runs from the service task without RTNL and for a non PFR reset with
mqprio active it calls ice_remove_q_channels() with rem_fltr true,
which walks and frees tc_flower_fltr_list entries concurrently with
the RTNL serialized cls_flower paths. It predates this series and the
list reader added here runs in the same RTNL context as the existing
readers, so this series does not widen it. I will address it in a
separate fix.

I will send v2 of this series with the per binding tracking rework.

Regards,

Petr

