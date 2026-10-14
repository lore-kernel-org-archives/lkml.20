Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EAF4349A2
	for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 09:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791968887; cv=none; b=UM+9WAdUYhG+MDiEXpgc1fhyvR+iGonSuzNqH91p8dKeZ3Gr2kyZtxxskujpbNG1kMds+aZ++2AZT/LnYY3PBOoMYEl9/gYASelHiaT0/anzTUFnEkcyTAwybMZKM8TIAlYSj7ZNrJek+FWioTgzvkN0bp5BgQPsm1vqcyPiOA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791968887; c=relaxed/simple;
	bh=lKiPfEj4GiFsESIXSMABmEWrbzmHHHXncq9jkZ21n/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+A9GfmvVDhoVZO5wvf40HgqA/UBkDktmNS4WGdTpuYb/5qtaazY7A+ULj8gwpbVtbOLTY9l8Brc/MUeDcMNQ3BLf/UMW1J1N5ubbi7iOOtYY5E9kZeDynBdO5vFmmyyV6ejQYCy1ZrHevh211MzO/7qO+NbqAGmkSin3UbiveI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxIIv81S; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxIIv81S"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c2055573c8cso468728566b.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 Oct 2026 02:08:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791968884; x=1792573684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6jLRvEdFUZOs356gfPWUV5PoYZmQs3hOKeg53YuPxY=;
        b=nxIIv81SyOUgNpr+UQvGbuCSoGYUXLwmsdeoSLIaqys3RpkLZeGHhHt2Amhli+1Ifz
         nQDK3nd1B/ZtW98dn57o6x7oA5LnZv975rHuDm9EyVxRfHyQBKty6jsQrIO46YSPURw7
         yD1CvR9skpiiIFR3k54lELHAez5LGmmstKwHM4zW73xlzf3IE30eiEXBERnvEPfHynlk
         Uog0x62Wkb4g7tozgkrtd3/ZjOhEBnW2AIN3UhbpamRXP5AFyEae2j3hm+F++g2mOj6L
         +gpULllYbrIJQToqseJDzoINy8/DTxv2pc4VQV0TNgFcJZUcanCAZMVGOV4pM20aZq4M
         XoHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791968884; x=1792573684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6jLRvEdFUZOs356gfPWUV5PoYZmQs3hOKeg53YuPxY=;
        b=sK6Oe/OYWpEvg8IMhyRTq28znIuv2OKWjdxNh0zRK6VYBPXWBUNtOaBVTutEEVlNjN
         9Bz7qtH44lFL1CkjwcukT0hMa21q/3mcH01flZzoxlpG9PsDfwKiYsvBvtrdzNZneVGM
         1Vqyk5ftiQmLaAkMmVvrUT1F9KSjkVoE0jHGTZ1MS3Lip8EKwFFCKDCFEzMVzk9fG99b
         ZxHXChnsn7CiUgt+JIOVwJzSsuT28W3eKZXnrYlw0JZooZuHJAILnmvmlSGY0a1QHvam
         fpDY0Mouo+erpQ3rHlYvJ7eIkvBp5xxQocVCLZZrqkUeRauXfiBw0mh3keEUgl0FjG9i
         GOXg==
X-Forwarded-Encrypted: i=1; AKwUvByCCXVJSKu4b3+r6TV1JvJWe4Iqn+KuJYB/XL419zZh6kmh1B/ZUYXKt2jO5kkAB91IN061PApg+0oJXXk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLRFF4G1lHuWfhHPJBeYPe63XQuJgNVDuOvQ/4j7qwcH6bmjlJp
	H12sMhlsaKFf/T+4ECIdo/s8JvLIfbB4sAzPtZungxL8bLgeZYgDVn5Y
X-Gm-Gg: AYBFou27m0MZRRB2QXCQrgRIP5ZS7iwQC/BtWyZb9oFi2LTEybW0TgNWdkXy9q+qxCN
	93tPt0+VkVxRxO2B55DyLttWh+DBpu9G1O6TSJIBf8pbBcfAR+TTghU+ZLb55pMGmTowBwlTWmN
	3tax+nrwUUwV1RMZG5wR33lkulW/32INY7ZBKUpl/qDsm+tIYHdHxk3/n3JJKIFkFBG+hn1JQnM
	oVjfFAYX2Xo2kD/J78yDKiZ6ouf9GYtzvfP0VYx7RJ0W+r0l1f0JoRFoqtNoulP07a1yokFxE0h
	bxBwZcFzcldO7mlmuKtq00ExNXNMegIPviQYPK6YtLe3mxR9qYLXxi5DzqogZj7PmBbsb+cxFM5
	EzBKjIi3AFzJ57wHmG2f0a5naHSbSZUJ9+Gp5UOjXMv121Dc8RcnUPmF7C0lvOCtaKbNwYR9a2X
	z8Ue2Jyv7BARA6bFt6paLaPeLmrr7fELjzsIOP20iKQYIGdAdAus50pt/QDwArB0xL39zWMgHj7
	DjTD9f7TNA1fHaXBPqzygW2nNKNg40OKdxzWVaJi6xBzPv5voU0WYC5Qqr1jyWA8Dqg5+JnM0zB
	lSnon6DPK2IHPe28MQUV/9Vqm40ItBe5XTTH8glN7AKe6qJqDuV6FbHrR2pWJaLGXMNICvZ55wz
	doNpRm+00pVHCII70K9DcrGzYYn+wcilh9Q==
X-Received: by 2002:a17:907:a310:b0:c2e:4e08:19ab with SMTP id a640c23a62f3a-c31a9afb4b9mr1447672966b.16.1791968883457;
        Wed, 14 Oct 2026 02:08:03 -0700 (PDT)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3b7ee45694sm25010166b.34.2026.10.14.02.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 02:08:03 -0700 (PDT)
Message-ID: <ab4a8b2c-0274-4423-8d10-04e7efb6c120@gmail.com>
Date: Wed, 14 Oct 2026 11:08:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 2/2] net/sched: taprio: do not replay missed
 entries in advance_sched()
To: Vinicius Costa Gomes <vinicius.gomes@intel.com>,
 Jamal Hadi Salim <jhs@mojatatu.com>, Jiri Pirko <jiri@resnulli.us>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Simon Horman <horms@kernel.org>, Vladimir Oltean
 <vladimir.oltean@nxp.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+e044a9b6370ed8ca9737@syzkaller.appspotmail.com
References: <20261009123309.284193-1-krystianmkaniewski@gmail.com>
 <20261009123309.284193-3-krystianmkaniewski@gmail.com>
 <87ik36lee9.fsf@intel.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <87ik36lee9.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/13/26 00:53, Vinicius Costa Gomes wrote:

Hi Vinicius,

Thanks for the review, and for the Ack on patch 1.

>>  struct taprio_sched {
>> @@ -902,8 +909,19 @@ static bool should_change_schedules(const struct sched_gate_list *admin,
>>  	 * plus the amount that can be extended would fall after the
>>  	 * next schedule base_time, we can extend the current schedule
>>  	 * for that amount.
>> +	 *
>> +	 * cycle_time_extension is an unbounded signed value from netlink, so
>> +	 * clamp the sum instead of letting it wrap. A wrap would make this
>> +	 * test non-monotonic in end_time, and advance_sched() relies on it
>> +	 * being monotonic to check it once after catching up instead of once
>> +	 * per skipped entry.
>>  	 */
>> -	extension_time = ktime_add_ns(end_time, oper->cycle_time_extension);
>> +	if (oper->cycle_time_extension > 0 &&
>> +	    end_time > KTIME_MAX - oper->cycle_time_extension)
>> +		extension_time = KTIME_MAX;
>> +	else
>> +		extension_time = ktime_add_ns(end_time,
>> +					      oper->cycle_time_extension);
>>
> 
> This one I could argue that it could be in a separate patch. As the
> wrapping could cause issues even before these changes, no?
> 

Yes. With an extension larger than KTIME_MAX minus the end time, the sum
becomes negative and should_change_schedules() ignores the extension.
That is independent of the stall. I can move the clamp to a separate 
patch with a Fixes tag for c25031e99344 ("taprio: Add support
for cycle-time-extension"), before the advance_sched() change which
relies on it.

get_interval_end_time() has the same addition on the txtime-assist path.
I can cover that path in the same  patch as well. Would you like me to
do it? 
>> +	struct sched_entry *entry, *found = NULL;
>> +	ktime_t cycle_start = sched->start_time;
>> +	s64 offset, entry_end = 0, elapsed = 0;
>> +
>> +	if (ktime_after(now, cycle_start)) {
>> +		s64 periods = div64_s64(ktime_sub(now, cycle_start),
>> +					sched->period);
>> +
>> +		cycle_start = ktime_add_ns(cycle_start,
>> +					   periods * sched->period);
>> +	}
>> +	offset = ktime_sub(now, cycle_start);
>> +
>> +	/* The offset is less than one period, so an entry which ends after
>> +	 * @now is found at the latest at the entry which reaches the end of
>> +	 * the cycle, or at the last entry. A schedule has at least one entry,
>> +	 * so the loop always sets found.
>> +	 */
>> +	list_for_each_entry(entry, &sched->entries, list) {
>> +		entry_end = min_t(s64, elapsed + entry->interval,
>> +				  sched->cycle_time);
>> +		if (offset < entry_end ||
>> +		    list_is_last(&entry->list, &sched->entries)) {
>> +			found = entry;
>> +			break;
>> +		}
>> +		elapsed = entry_end;
>> +	}
>> +
>> +	*start = ktime_add_ns(cycle_start, elapsed);
>> +	*end = ktime_add_ns(cycle_start, entry_end);
>> +	sched->cycle_end_time = ktime_add_ns(cycle_start,
>> sched->cycle_time);
> 
> Having this side effect here was unexpected. I think this would make
> more sense outside this function.
> 

Agreed. I can make taprio_entry_at() return the cycle end through an
extra output argument and have advance_sched() store it explicitly in
oper->cycle_end_time. The helper could then take the schedule as const.

I can wait for the rest of your review of this patch before sending v3

-- 
Krystian Kaniewski
