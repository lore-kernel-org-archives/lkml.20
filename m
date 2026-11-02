Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793614790;
	b=MB35YoO2rophEDAgV7qdacZlsWzhunjqohACTtmNuUGhf+6CgNQwCTqfyIf3cmDOuUIO
	 89ynSD78ckCijPESk99r3gPPz6qMaMisrljtiyb7slHMT8R07RzRnylJcaaX+c/XSyG87
	 iDCMq5BYTmBIFuEncWX/0uaEBfWy8HLI3kiJqIYq7ALHAQ5ldO29jggD46WTYRCnxX1ba
	 nLVCdZdFvKRK/WWnJTGQWlm2iktAxFKgz0+SCzpob7cwHOQo1IVVkWgHVEIiUKZeDMEBb
	 IHzR2gTD3mI0vI0Pv27KKRkj0LXi+ljMSthj+kwp+LcRMwl+0IyzTC3NV2R4FI+PSeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793614790;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=zbRFxtn0bmST4ot7xJOZ3J8yhLdMWFCd3X8j2ANvOdQ=;
	b=GJpWCeya8P/OERXoGBXSg2Vqt0wX0eynlBN4T21mlehv1xF9v0wxpmjliY9mOOvBGPOG
	 9EAyCxX/+HMqTGdk5VJ5WmgoOLWLGfPBHBGeXDvjuZ8CgRotp71Y//WniRBSlIamtHJGm
	 seyfDnful61k6R1t0U07QhbGt/hlXg3QwWuWCit55eNeQnIhVD8VQXpnwlbZdGFxFLI5l
	 dK3C8+wfBg6OpgaP1kk4yQFBTsiXMK5GlupIFpQ5FMO8Il+uqUUBFHr6nRT1g66HsUfDi
	 Iioap4A7GkWfWo3HwhX1KoZd9ORWjilEkVF0TieRiSmyNE+plQm8W6JzmcxGCpvuY6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzT0M4Hu;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF2A606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 10:19:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CF2A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fzT0M4Hu
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so28535335e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 02:19:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793614789; x=1794219589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zbRFxtn0bmST4ot7xJOZ3J8yhLdMWFCd3X8j2ANvOdQ=;
        b=fzT0M4HukfUlzDn4yWiRhIKlBw1T28PUkGkOSKvaaObOSGlsp0qfW07r6pgJLFu0yG
         frdDj3JLSWTwBqs3mbc4RCIBYRtua4AkFXTx1ymThRpZnfqQgeMDxgDLR31XAmufd740
         ULpXuAaOJ+7TGgRk1U1Du4DOgxOLxXrq9Rfw5gQ/ubThWV7ZahIdQGQmahB6yg/yA8Sd
         at6LR2C1wgTgoiMS6OzVZeM9XwJhofEAHjKq3KKjvGPIvv5pFt0zbqu4dZx/3isfQbpB
         XqQ3lW99clHzSkevKhgq+DpU06/3X/zsesE2GVgZUDLDFnBjQDnIOvffeBlp4YGS0ZDY
         gBsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793614789; x=1794219589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbRFxtn0bmST4ot7xJOZ3J8yhLdMWFCd3X8j2ANvOdQ=;
        b=Bm+Z3Fbl/L+sExQhOflyhz4RBFwVh1PWDilhq+y5ke3ixjwOYgbDrU/28cXuK/tsqC
         CySb8Ca7xn9RmXJeuvuVNvYIPSZfdxGjiOE8sf7SoW4BFHQDeMRsQ4kGM3tHiZD7gfqQ
         rP4IOW220IcJfan1uFzMx4rOvX2lvVrG2weHoFjpwp//Um5PEURrWgU2DaobnLqAtBeJ
         M6FHJ8kPnyKUVsGT3prJaeTPP+GqkFY263wPgfJSQ/gaikPpN9raUC9ZrKHS/7nTMInm
         q2uZXfdGUBFzyh5Z7oXVblF9ccilHTfxVENQgUeKNmGtXyLJLGmLW/L49WPUdcpsq6P+
         IhnA==
X-Forwarded-Encrypted: i=1; AKwUvBwxEEfwibip3q+2bert15ghdlUhylyxKtonEaG+5IZr1cQ5a+nDdhd0Q5tOvBzeL+NESePH1VnrBAQmYCQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ8wa+E+9jeuux/ZmuqFQebJoU9za5vfPOw6MuHmrez9XXM/Unf
	ZFOqzOlrfo4HY0gXWemmzLzrcuHCbsk2v8ORop7PC4Ppx5wiEKWRZSvL
X-Gm-Gg: AYBFou3iwu9EnDT8S55IicChkDQegyTKh1bQX2PgMQB6cFvD26uCny1zhuMe9uJ4GUC
	0bZrujDYHSRba/WLt1GO5KJvsjucMkRnx4BIXQiFWIkwGpqwvnc9mXpCnO+uTBWDjE3b1M+5lbh
	GQekJ6/x8VYPlv8+QyMx7tEB+9EqUZm1A4Yw/tEQMegWUPgM2uL7q/9nttNpChNtWKcziTt/5Es
	h873sadnASKfFMN8uVCQulm2wqLcoIkjtfUlhMij9BiSPwe0td8r1UWenW3e29/LpuZ/fL+pwzN
	V2tV0iUQH26b2a7OkrtE/ShLT4qhE3WxE4xICK93HSelFx9j50k8wXRiHaGVhPPRXMGkOML6h1f
	GJqFeq9uI5v19EVxizpEQ8ajX8vFZcTGt76VYKHdgaPYXOUHRuDcaMMvrOCKZmL9zs58un3vOp5
	YpXaZg2bU7YzJufqscWcTWWvwvOEHm4kEJxjtVhRsJcOK6AQNaon/GIYGae6PmXej0t302wWCd9
	F8G+65Xf+JbPVtYDrAIR5FjZoUC0aUoo26VF+YgN2rgE/KqgtcmXoBeRAvXQDKBpQQ/6XAVwc73
	s0Z4++6j0rqUD30slE6p/uuK7e9bDxwcA6HthYtoJxBI1cVIbEG5QynBHkLLoTZ9sk70XlVG8vb
	2XfpMDor2S0nNY9cTPec9c53jZx36OqRVyjwJRUEkG1sJkkVhWQl2e9edSlVlOTJI9oCMzKwIZS
	CamUbUpo7hD69i82mcuXoMPnwGkyxfy63u6LR08tlma1/ilEIYyxYp21zVrnUUUaw=
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr239535245e9.2.1793614788494;
        Mon, 02 Nov 2026 02:19:48 -0800 (PST)
Received: from [192.168.100.100] (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723bfsm18041307f8f.15.2026.11.02.02.19.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 02:19:48 -0800 (PST)
Message-ID: <ff74c290-3093-49ec-85ce-0e2385419366@gmail.com>
Date: Mon, 2 Nov 2026 11:19:47 +0100
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
 <87ik36lee9.fsf@intel.com> <ab4a8b2c-0274-4423-8d10-04e7efb6c120@gmail.com>
 <874ieoj990.fsf@intel.com>
Content-Language: en-US
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
In-Reply-To: <874ieoj990.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/14/26 22:51, Vinicius Costa Gomes wrote:
>>>> +	struct sched_entry *entry, *found = NULL;
>>>> +	ktime_t cycle_start = sched->start_time;
>>>> +	s64 offset, entry_end = 0, elapsed = 0;
>>>> +
>>>> +	if (ktime_after(now, cycle_start)) {
>>>> +		s64 periods = div64_s64(ktime_sub(now, cycle_start),
>>>> +					sched->period);
>>>> +
>>>> +		cycle_start = ktime_add_ns(cycle_start,
>>>> +					   periods * sched->period);
>>>> +	}
>>>> +	offset = ktime_sub(now, cycle_start);
>>>> +
>>>> +	/* The offset is less than one period, so an entry which ends after
>>>> +	 * @now is found at the latest at the entry which reaches the end of
>>>> +	 * the cycle, or at the last entry. A schedule has at least one entry,
>>>> +	 * so the loop always sets found.
>>>> +	 */
>>>> +	list_for_each_entry(entry, &sched->entries, list) {
>>>> +		entry_end = min_t(s64, elapsed + entry->interval,
>>>> +				  sched->cycle_time);
>>>> +		if (offset < entry_end ||
>>>> +		    list_is_last(&entry->list, &sched->entries)) {
>>>> +			found = entry;
>>>> +			break;
>>>> +		}
>>>> +		elapsed = entry_end;
>>>> +	}
>>>> +
>>>> +	*start = ktime_add_ns(cycle_start, elapsed);
>>>> +	*end = ktime_add_ns(cycle_start, entry_end);
>>>> +	sched->cycle_end_time = ktime_add_ns(cycle_start,
>>>> sched->cycle_time);
>>>
>>> Having this side effect here was unexpected. I think this would make
>>> more sense outside this function.
>>>
>>
>> Agreed. I can make taprio_entry_at() return the cycle end through an
>> extra output argument and have advance_sched() store it explicitly in
>> oper->cycle_end_time. The helper could then take the schedule as const.
>>
>> I can wait for the rest of your review of this patch before sending v3
>>
> 
> I am going to try and review this by end of this week.
> 
> 
> Cheers,

Hi Vinicius,

Just a gentle ping on patch 2/2. Did you have a chance to continue the
review?
-- 
Krystian Kaniewski
