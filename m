Received: from mail-pz2-f38.google.com (mail-pz2-f38.google.com [74.125.228.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27D8347BA9
	for <linux-kernel@vger.kernel.org>; Thu,  1 Oct 2026 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790859813; cv=none; b=jhClMETsFsA3fS+bIq/d1oOnmz+jDwo3FWNx+b1SlP+JrSqZr/S6kKo99qX4N6Hm237tM1vZBxFb9BjUyLr8tYLcJSZaEVleEIn0kyUFtd7wlFvxD+7y2qEpEuJZwGUqn8mvFIT1q83sVqPBJCKIDV0xf8Fn55hbj3LbZZ7sH6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790859813; c=relaxed/simple;
	bh=hPwjqibiB9koRt+6y+SayjWl14OE90Z+UGmvnV9nSYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CIx8z6iphpBXV3Cwxz9AgHc5VTWlQ1aXPlf8AT/bhRmp9WClX3y3ZbwZpxjHGC/EjH+tHGTQWFqj7UO5zk9NK+6k/0sE46EuMJ62iQ87aJGBkGil9a9OTkwkF4Q523ghPcCuZgpwa0kFkWKvVUB2rUKSa42MRrXWB7bZr02B2Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbSjBoC9; arc=none smtp.client-ip=74.125.228.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbSjBoC9"
Received: by mail-pz2-f38.google.com with SMTP id d2e1a72fcca58-883a16b758dso954946b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 Oct 2026 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790859812; x=1791464612; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MinJghnSBypyMzn9OcYSY7JFWoBLc24jRn4Lm5g0pDk=;
        b=UbSjBoC992jVuPko9WbDrdJKxqig20E+wfx2Z5eZ0uPbCJYxHZzdcvv7Nz2npBql1Q
         /O992ad+yVX5tNEZ2hsuZCkEPB7vR5PUKl1ySeVRNjXXdhd+0xgblY6G1OJuykMC0grj
         jmRTYawxyNAKZlFP72Irb0G2hBEnhBGdBWZz6JtFw+lXWNR/cMKRVux+viNV33MmrKJ8
         psCnDWst9T3YC2K/dwfb2QfJ9plWWV3gHsqJZqzpD4oMHTJfPgObfYHjy3NjvqSwqR45
         1UJXwm9pg7F0Hn6WBjdPQ9sCHWo/5vJ3THkKQ9txnIlWrmX0fiBX/0IRdj32IqnWPdSw
         EElg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790859812; x=1791464612;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MinJghnSBypyMzn9OcYSY7JFWoBLc24jRn4Lm5g0pDk=;
        b=FOxiNi8wAxLqSOgh0UdtFWesUhNS42YMWTTxO/FRpY3Ks/Wv8kVd3AlxR5EwOiTECK
         LUZAmQq7ob8ah86MqP16xyNQUdIeuy/z00jfmoQc9ImwF4Ec60JYfGvkXRWGg3RxkVqQ
         KfO1r9svx5cvk3hWr7qCF/HfkvOLXUeXMMbvju5RBpkRX10sNuYZtdlYe0/IuNZ7UU0r
         m8SxoGoFIqbmjlC+/yy+kWyccy9PWZtB9nqXoC4N6hAWhzLQGcRvGWdbUh4UgrbU+HyX
         7OXGT8klGlyp66UDaqiv7E/MO7IOyya6DORxfYuc9tZ8zrbX7edOepnxLOE+U31jKZ6g
         aVmQ==
X-Forwarded-Encrypted: i=1; AKwUvByJQssqW48DvR1X+nK0eTyK4sPayDRYWNYf4IeNV6IrWkY2iDi5L7oBFfcB0Mm7GsiL9H+fSr8gfYUgUcM=@vger.kernel.org
X-Gm-Message-State: AFuF++n17EVKlB+5Jo2cyE/GSUj2S5znqduv6cItUnbjMIa3OnVtXG2F
	CJNO1d+GPp3tHPbrF//0utB1H0GVQLlRnC5bpoD3aDL/Rep7zLJlP8Q9
X-Gm-Gg: AYBFou1Wn4aZ6RH0B+T7lIg4Bm1+/WCH74nh9vWkYeZMGZH56M8yR3HDtWM7gVFJkYv
	FBbyNEycBEnM3JS7/FrGG3Qh602D6tJ2wPVSHdYimr+bu2waata6IVFFzT7VC/607CFZWhhUjIA
	7kYVCpONbwn6Nfl+0AOjgwJ9FLL7k72LiBh3jkIH1pNF3jEwHgScBLetU55OW3GSSXlPsXQ5Goe
	ho7f3V4kmuaH1/muI+YsbOHJXbQzNXhpu06RB9pcHOU2cgs7PnGQbBJ2uE51SPyEb8rrm8aCZTf
	9NlZk10NtAH7qeeyOlkUV6Buo4QBmkiq7lltyOA0A9RNxS06ysW51n3pYS/tiLMq0EJw9gaXeUm
	8CKDAGMIXd9Yz49f1zbVOjEwWy6aejePwpC4svKnb5Xv9FXo3ZRMRYxN1eHG8C+WeMDJmXGomJU
	Na6V246gSBwYtXG1EHu/FMCMPxxFgb5sQBxAyb/vR785pogLWHyk7SuITFKtX2KIpe+VZEgkzi9
	X5URVsUNAnrT9rxtU8=
X-Received: by 2002:a05:6a21:498:b0:3dd:a196:ffcf with SMTP id adf61e73a8af0-3deacaed83fmr2468264637.31.1790859811706;
        Thu, 01 Oct 2026 06:03:31 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e548677fsm1442223a12.15.2026.10.01.06.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 06:03:31 -0700 (PDT)
Message-ID: <eb3d1d25-dfeb-4bf5-bd66-95216a5cb87b@gmail.com>
Date: Thu, 1 Oct 2026 21:03:01 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ext4: fix shrinker scan budget accounting in
 ext4_es_scan()
To: Jan Kara <jack@suse.cz>, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: Qiliang Yuan <odys.yuan@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Baokun Li <libaokun@linux.alibaba.com>,
 "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Zhang Yi <yi.zhang@huawei.com>,
 linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260929-fix-ext4-es-scan-nr-scanned-v2-1-f4e8f6f6b8b1@gmail.com>
 <f8e677df-4896-415d-9795-e15362be6b92@huaweicloud.com>
 <shfd6lmgopxqvcwaq6dqrm2x4ovlnzvspmatpqxtaf6wmb7z5p@lqog5ma575x7>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <shfd6lmgopxqvcwaq6dqrm2x4ovlnzvspmatpqxtaf6wmb7z5p@lqog5ma575x7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/30/2026 7:48 PM, Jan Kara wrote:
> On Wed 30-09-26 09:45:26, Zhang Yi wrote:
>> On 9/29/2026 10:20 AM, Qiliang Yuan wrote:
>>> @@ -1774,15 +1777,41 @@ static unsigned long ext4_es_scan(struct shrinker *shrink,
>>>   {
>>>   	struct ext4_sb_info *sbi = shrink->private_data;
>>>   	int nr_to_scan = sc->nr_to_scan;
>>> -	int ret, nr_shrunk;
>>> +	int ret, nr_shrunk, nr_scanned;
>>>   
>>>   	ret = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
>>>   	trace_ext4_es_shrink_scan_enter(sbi->s_sb, nr_to_scan, ret);
>>>   
>>> -	nr_shrunk = __es_shrink(sbi, nr_to_scan, NULL);
>>> +	nr_shrunk = __es_shrink(sbi, nr_to_scan, NULL, &nr_scanned);
>>> +	sc->nr_scanned = nr_scanned;
>>
>>
>> I'm a bit concerned that modifying sc->nr_scanned here could actually
>> end up increasing the number of scan_objects() calls in real-world
>> usage. If there are other background processes running and continuously
>> accessing certain files, they may keep producing a small number of new
>> reclaimable extent caches. That would mean nr_scanned stays at a
>> relatively small value on each iteration and never drops to 0, so
>> shrinker->scan_objects() may end up going through more loops because it
>> can't return SHRINK_STOP. So I'd tend to leave shrinkctl->nr_scanned
>> alone. What do you think?
> 
> Well, I agree but lying to upper layers about the number of objects we have
> scanned doesn't look like a proper solution? We could return SHRINK_STOP
> when we scanned everything before nr_to_walk dropped to 0. It isn't perfect
> but would somewhat address your concern...
> 
> 								Honza
> 

Yeah, that sounds good to me.

Thanks,
Yi.
