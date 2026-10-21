Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571184;
	b=1JX80Ae9kaddhIoxnuARRP9G1zd5fD1+Pt49LH+m54/mE33mIgqCkhigkJ2bwRLMwjup
	 vD8VxuZ8dKohNlfjrjWnh3rwYPuDJUeXqncrLVS1BggGRcs88ii+svSSxjBD0D+omV2o5
	 Ug0zK4V7XtWMjrC6uFH58MH7kSBCG2mfsVfChyiQWU331Sp7uOep7KgtJS6JR/MhvpM05
	 soVarpPkcGorrqdQu/5N+JQgLmNKyTLHqIEdA6JHqYVjF9eMyFyQMvYv9t/HRKU7Rz+Bg
	 MnwU7fcMVGHoABSD50xuS23xS0s30n1LUaCtMlKyIOexybdQ8iawc/7UpP721oyNB7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571184;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=F54D21K1objmsAiJjjGq1fpJPBej+JQYWf+LanDUQ6g=;
	b=zCPNzBrpau/uTO+kmmgHC8Hxp6iwzbeCaflVDznMR/Ad5oEYTqRxugLmkflnQfCHsHEB
	 FWWOs/38s7Vunz7hE7xXgZH5vnovKA9diD1JMPh07YiVET4Wh9aKxZlnOvq2TKfdxTO4J
	 Wt5ScSSCPvpf+40sc/NoDV/Wh+EfWbaSg64c+bexrT29xPFIQp6/MTY3c3Wg9cbJKNajM
	 bbk7HKGienK6JmqLiYkTeNuvprBf/0NY3OIYltCw07O3X2kPd8VhXuLcoH1OWHB/3b7gN
	 Exhg+hBMyqYRDHdoYdbqcf7DILQW9RupussO/1llAI1PDHlHbXr9DQSH15NR72iHTGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NnbNt3iM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s4Hai8Ay;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C38F606A319
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 08:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C38F606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NnbNt3iM;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=s4Hai8Ay
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792571182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=F54D21K1objmsAiJjjGq1fpJPBej+JQYWf+LanDUQ6g=;
	b=NnbNt3iMohuOB+2bUwPx+8fwEQzLL36hvI6hrU0YdtPssqYG7TgWC9Tnk3hzbFJvKzW9SV
	7xr8a0v1Z86ajEEXvHJ8n6aCoNqbsCnqFjvITUAETo3MLLpzi8Eq9/whCbVzAWfcXTJlBo
	LnMqHM+JF8mAccsc0izhGY9PP1NHqeQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-36-840qD_CpP6-7nGRhmZcCJA-1; Wed, 21 Oct 2026 04:26:16 -0400
X-MC-Unique: 840qD_CpP6-7nGRhmZcCJA-1
X-Mimecast-MFC-AGG-ID: 840qD_CpP6-7nGRhmZcCJA_1792571175
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48dea677afcso363772f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 01:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792571175; x=1793175975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F54D21K1objmsAiJjjGq1fpJPBej+JQYWf+LanDUQ6g=;
        b=s4Hai8AyrXwfJ4ythQ96hnncBtu7korBgLD5zKy8UQztPmsXsxD8eGCBI7ufxiclw2
         1t+snpuNGCz9FpYzHlt7Scxbn28FoW6wJYzjcQ73t0XQPC4zgWMP2Mwq8zZWuiKBT8BY
         t6drvno7tlNBoqjtjeCewKp2spFI00/V4UQhTKmO6EJ1Yt/cZ05QKmFpyHzdtJUUc/0S
         wZSaVzerGgqP0aE6qDFHuGIPLqyCMk7dwxFoslorPuojq/rod7fRlR4XLbt5bETpoti9
         g1ioA5cdYbeOrCeNeiCzfyyojsNYC83KeGzAUPDeMLu1pHu56azpnhDFn9egH0jSSqOp
         CJ1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571175; x=1793175975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F54D21K1objmsAiJjjGq1fpJPBej+JQYWf+LanDUQ6g=;
        b=eKqCkgVZXkRFpF0/cqEMamjT5r3KEI9vaHouD17DTXiWpm6anxy+ZmL6qD8wLGKFvj
         dJie3qFKA3W0NSzRuN2ztd4sDL+VWHtRtsDrpH/qZk9iuwgQXBatP4ZUdE2yzSNZicmD
         sdk39Q1TkMMPK8p3IBt6fPsdmTwfsOrKiStjwj5q1ZYZcoO506QP+MOFMrsgh9fPINbb
         X8Ivks1GnKSlWMyEaNE7hRklzx/ak36lAXG7FuA6p305LeS34KLqvLVJnuVFX/tAP7sU
         kauJAkZUUME6L9Uk+d1xwY+Qs5kEC5AcNQGtYyz1I5jV1s3Vs0tRhr8K9yXz2DKqWVc4
         8ebA==
X-Forwarded-Encrypted: i=1; AKwUvBz/Z1C3BscqaHPamRE+h24XVVot2JHMPySK1ATYLyTGIMXRPZEN/bwuo+fTvCWKOc4gyyXtfaDzkpZ/BqU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJzXp/TsjK6uh4UH2Pi1zEqJz7Br71CYm1fHPZ9/Zvy5bHebZG0
	SzScVm/GfFB+bB9MWlDqQkukacOfgPbKNZTsjuP4DOrzSBFimQFnMPfvoBrdv7sjVxHkk6rbUGT
	ks77elE+mdj+WPFH3DegTlGSAG2mQ0+jdpwo2Mx7dNPtMy7588TN3XZquc6yem+AO/A==
X-Gm-Gg: AYBFou2RFov3fYwDCBckzcKbq8dmwzKbJPn5raLypZM9iUxzNUCXSO0/Kr3F2L+hvIF
	oGHGfz+ib6C3ZlD4vbLzJcNQ9N0tlXUPSYykdP7fk5hj5cB1nL5S3FqK9mrcSPz70ksQCIX+a5K
	QHrdwfFQQgQETef0SMJPbIzpij9ky8Wn044D2scl+s4OAaSjJ0dBmvuZ9FycCANexnLNJ0ZqLAE
	/7eycb7LKMQpcH7DDlNgV/dD0H+suUmUk5/l96lT9+LSd7kw1yYRUhfXqPqa/FwVfrjP/3KQZdU
	whmR+t9ssfvhp4Rgk6ZBGUYBuYyiTL8kEVBeq5HxbfP+ONHXKsH2p7Du01r4qS5vkPteb8mBVHj
	mphYJFzlHGWyifimqZoyKYQYKx2V65WGuvU6DZ5PoueweT7ALRrptFV3CxgNpCWx5ocbIcD6wEw
	==
X-Received: by 2002:a5d:5e06:0:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48e1e754ca1mr11104935f8f.3.1792571174683;
        Wed, 21 Oct 2026 01:26:14 -0700 (PDT)
X-Received: by 2002:a5d:5e06:0:b0:48c:69b3:6114 with SMTP id ffacd0b85a97d-48e1e754ca1mr11104866f8f.3.1792571174210;
        Wed, 21 Oct 2026 01:26:14 -0700 (PDT)
Received: from [192.168.188.234] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25841b5bsm4076306f8f.47.2026.10.21.01.26.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:26:13 -0700 (PDT)
Message-ID: <68046007-3737-4f85-bcd1-559daa5835d4@redhat.com>
Date: Wed, 21 Oct 2026 10:26:12 +0200
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
Subject: Re: [PATCH net-next v2 1/4] eth: mpnic: count packets, bytes, and
 drops per ring
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Jakub Kicinski <kuba@kernel.org>
Cc: Daniel Zahka <daniel.zahka@gmail.com>,
 Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>,
 Stanislav Fomichev <sdf@fomichev.me>, Eric Dumazet <edumazet@kernel.org>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
References: <20261012-mpnic-counters3-v2-0-8afba81c2d5a@gmail.com>
 <20261012-mpnic-counters3-v2-1-8afba81c2d5a@gmail.com>
 <20261016220930.i32JEcqe@linutronix.de>
 <DM8U47F4MNK3.2V54CCQ9YTNBY@gmail.com>
 <20261019215405.OCzrrKYw@linutronix.de> <20261019190543.419e70bc@kernel.org>
 <20261020212155.47v0ot4g@linutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261020212155.47v0ot4g@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/20/26 23:21, Sebastian Andrzej Siewior wrote:
> On 2026-10-19 19:05:43 [-0700], Jakub Kicinski wrote:
>> On Mon, 19 Oct 2026 23:54:05 +0200 Sebastian Andrzej Siewior wrote:
>>> On 2026-10-19 09:04:38 [-0400], Daniel Zahka wrote:
>>>>> Why do you have the two mpnic_base_stats and fold the stats into into
>>>>> it? My guess would be that on stop the counters are reset and you want
>>>>> to preserve the stats.
>>>>>   
>>>>
>>>> Not sure I understand. I think you are asking about two things:
>>>>
>>>> 1. Why have two mpnic_base_stats?
>>>>
>>>> To avoid a separate heap allocation that can fail. Handling an
>>>> allocation failure in the ndo_stop path when doing the aggregation into
>>>> the base stats is tricky.
>>>
>>> Right. But looking at hinic3_get_stats64() for instance (I just grabbed
>>> a random one) it simply does query the stats for each queue, add up,
>>> return. It probably does not drop the queues on down, just reallocates
>>> them while changing the number of queues (and maybe MTU).
>>
>> I don't think pre-allocating stats for chips which supports thousands
>> of queues is reasonable.
> 
> I don't mean to pre-allocate stats. If device-down removes queues then
> the stats gone, so what. The queues could remain.
> 
>>>> 2. Why split stats into base stats and per queue stats, and why reset
>>>> the per queue counts when the device transitions down?
>>>>
>>>> This is the way the stats in netdev.yaml are exposed depending on the
>>>> 'scope' request attribute. My reading of the relevant kernel docs is
>>>> that the per queue counters are counting events for the current live
>>>> queue, so it makes sense to reset them and fold those counts into the
>>>> base stats when the interface is transitioned down.
>>>
>>> Is there any other driver doing this?
>>> There is ::get_sset_count() and so on for the per-queue stats.
>>
>> You may be mixing up queue stats (netlink) with the old ethtool -S
>> kitchen sink / garbage dump.
> 
> The statistics is folded on device-down into a global counter. So on
> device-up the statistics is still available. At least that is my
> understanding. This means the per-queue stats are lost and global stats
> don't match the per queue stats anymore.
> 
>>> If the interface goes down and frees all its queues, then the stats are
>>> gone, true. But preserving them at the price of two (down+up) forced RCU
>>> grace period, I don't know. It looks like a bit too much.
>>
>> This is a modern driver, the down / up path is not taken when interface
>> is reconfigured. It's only taken when the interface is actually taken
>> down or bought up. Which virtually never happens for a datacenter NIC.
> 
> So if this never happens, it might not be needed to preserve this. That
> force-RCU might not be needed. This does happen on down and I would
> assume that the device is no longer processing packets.
> 
>> I don't mean to dismiss your concerns, we agonized over this off-list
>> for a week, and don't love the resulting flow, either. But I strongly
>> prefer the RCU grace period that never really runs, but is easy to
>> reason about, to more advanced fixes which use memory barriers etc.
> 
> Right. If you think is all makes sense and is needed then why not. It
> just looks odd.
Sebastian, my understanding is that your doubts are mostly because you
are unfamiliar with the current reference NIC stats scheme. That has
evolved significantly in recent time.

I think the approach here is actually quite nice, I don't see blockers.

/P

