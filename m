Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E05F3E8C77
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787906306; cv=none; b=JZX4fKQxU315Txwyt1rzyMCTfu2MzHWr8Eg9x/wPE7314D6JbHiLsH4GX5XAjY8U1mTC6Mc+4Pfz7CXtSfl9/dq1Wwt6IfLKaC1Kv9DY3w97BZM+9zVa+5tiJL1FbjVZSwryjnzWBAmhM40MSgVP4AXR/1EjvOsf2m3NhcXzx38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787906306; c=relaxed/simple;
	bh=EhykqiPJLq47BZjoeaxdikIclxj7Y5+ukgWZVwOFnkM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xu5KiliScsu0yadmVrUsli7F6BjDPCnXNJo2YVy1IGE2Qr3zPI+R0sWagea8ZpGoWG7cYCh6ileaugv6UNOSJRfVEstkWo8CoL2OlAh86qr+EeYIfABWK4NKVNXI6ccqgMWpEDSXr/NFw3TMV+RObLlIQ69+Pd0irlcbcRQ10w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=advSsF6F; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="advSsF6F"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfbbdfa60bso8363685ad.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787906304; x=1788511104; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fR5H0F/Ck8m7YL57qzikpM3HgEJcl+V81mzJ0tARUcA=;
        b=advSsF6FPsjoIWWLauCXCMld/EDUHWEyVP1WVajZ7P0Yr4VAN+0Yiwi9mI+v6QEEWP
         Go9VyktEazvpIHx2FQDYEYqrCqeCVy3+qMjSYxwWD3EjDWRdCZWle5ZADSA6j5ET2mPk
         x/zmPY2Gpd3Su7msKW433OMUYT8tRRbVAirbSQzgVGCBlZtnrfZr2G7Zjbn8eEn+FgoB
         XVSXojF9BPpUu2158Ne50QylMI5gbai+d8ItBViR81ift83b3ELO4FCfco2yQcHx2Jnd
         c6v9F0smXmQdAhYX8IirU8krtAhWECLWLQav5XuvaponaVoV+MPdFyOUt/XJDlq4741r
         EnUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787906304; x=1788511104;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fR5H0F/Ck8m7YL57qzikpM3HgEJcl+V81mzJ0tARUcA=;
        b=nLQvaNznkbCIS2+eDHTkVHtFVhn4BItzGWwLVt+j1j439Lyl9FX5wWo8cwY9VBvexk
         5ReOgtznLEOwKVoAWNg4H4Munfv4QXMghRcVAvQC7QTAHdaCdOxLFFMngIj29fuJ/tMQ
         S7sg6tHRZE+rYJDSY1MGfV6drcxKp5Ds4FOyYnaRfIwstMJXisRk5W5YKY5HJzpXOzPy
         Jk4hWJzwd2L6GM0vba6H1wSA6lPRLAiaO14nqN0GgBnWsNILApvarivKDDEj883enTBW
         Atb9XUQG9sk9S1KLHOVh3f4Kp8P2Ja7tVv7ws1r4jokDyqnc+sOCevJ4LpJ4FUV3G3yo
         XGGQ==
X-Forwarded-Encrypted: i=1; AHgh+RpN4hPiQIyi5Gml+lUh0F47UkpN8QBAR1Nf+0EgWFckJB0SmKkGPZlxuToUnfOJ7ysVOSW31yxIYMmUd98=@vger.kernel.org
X-Gm-Message-State: AFuF++kA09uHuv8Q8Xu0ca1dMXx1ML1R7n/oN1iYB6UZjFgbIYHffBcf
	eiAuZViX0/XSTMOHX0/vLatcwszMUIuYHkMdVmhCxcIl3uAqco99WPSY
X-Gm-Gg: AR+sD11iEBcblR8Tb3NX0ihmzHNCPYuR8+P6i2bZOOgO1OyCxOvjpJA7sEGJ8JaouFK
	/iXsnL5p62gDyeImLreZJyjMzdf+yIQzUKhDPUH8sfISbE5+2IPWPWLIlAXqoY0jkKFw7Ff+CM5
	olgymSzObkO/fmWEIewRUVxBwtZ8riMe+Xvt8hnyEncdXGciOmEC9HQvdpb9PXMGCJtkW7/0qDo
	lo60PP5bEUEeWYUSx8+acCXTHDnVYShphWmJBfWlD2jlZdaomAKYGJsgLCY/VJxIrhZ0HfKVl2m
	yPWTVG46SmogmtHY3CiT0ky5C5LflCm1NXBBzz0Zhu6Po4/QOTSmoe5oXGzUsakcQD2r9x9JHUi
	kFUgcEUEKbNdMWMdUb7iv1OVaYf+Z2ATfLZ6qO6HvdwTBurVER4cZrpRbSv1ccdcI2+TVUFcABq
	GnN06PwqzGF9g3FHzX2LjOxep9kOyxtdYvE2n3iucE14O9yNFEKW+tRQ4EySX0uGLksOaRHb+Da
	q2DdbI=
X-Received: by 2002:a17:902:a518:b0:2cf:b68a:340 with SMTP id d9443c01a7336-2d74e0b1e52mr71919505ad.10.1787906304395;
        Fri, 28 Aug 2026 01:38:24 -0700 (PDT)
Received: from [10.125.192.78] ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d75963fc5csm3306965ad.33.2026.08.28.01.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 01:38:23 -0700 (PDT)
Message-ID: <55c09f16-4b0d-58a8-9413-f88279ed69fe@gmail.com>
Date: Fri, 28 Aug 2026 16:38:05 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.0
Subject: Re: [PATCH] zram: fix idle age_sec underflow in idle_store()
To: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Hao Jia <jiahao.kernel@gmail.com>, Brian Geffon <bgeffon@google.com>,
 minchan@kernel.org, axboe@kernel.dk, akpm@linux-foundation.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org
References: <20260825092316.69658-1-jiahao.kernel@gmail.com>
 <apEK-yRTQR8VdT3e@google.com> <apEkQSC5PLQAsrqj@google.com>
From: Hao Jia <jiahao.kernel@gmail.com>
In-Reply-To: <apEkQSC5PLQAsrqj@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2026/8/28 14:02, Sergey Senozhatsky wrote:
> On (26/08/28 13:23), Sergey Senozhatsky wrote:
>> On (26/08/25 17:23), Hao Jia wrote:
>>> After commit 2e8ff2f51dde ("zram: use u32 for entry ac_time tracking"),
>>> idle_store() computes the idle cutoff as follows:
>>>
>>> 	cutoff = ktime_sub((u32)ktime_get_boottime_seconds(), age_sec);
>>>
>>> Because the left operand is cast to a 32-bit unsigned integer, when
>>> age_sec exceeds the current uptime, the subtraction wraps modulo 2^32
>>> and the huge result is zero-extended into the s64 cutoff.  mark_idle()
>>> subsequently marks every entry as idle instead of matching nothing,
>>> breaking the intended semantics of /sys/block/zramX/idle.  For instance,
>>> running echo 86400 > idle on a machine up for only two minutes causes
>>> all newly written pages to be marked as idle and handed over to idle
>>> writeback and recompression.
>>>
>>> Drop the explicit cast to perform the subtraction in signed arithmetic
>>> again, restoring the previous behavior: an age_sec greater than uptime
>>> yields a negative cutoff, and one equal to uptime yields 0. Since a
>>> cutoff of 0 is now a valid computed value, it can no longer double as
>>> the "all" sentinel. Switch to KTIME_MIN instead, which no ac_time can
>>> be after.
>>
>> Can we instead just reject such cases?   It should be an error to
>> request writeback of pages that are 2y old on a system that has
>> uptime of 2d.
>>
>> Maybe something like this:
>>
>> +             time64_t uptime;
>>
>> -             if (IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) &&
>> -                 !kstrtouint(buf, 0, &age_sec))
>> -                     cutoff = ktime_sub((u32)ktime_get_boottime_seconds(),
>> -                                        age_sec);
>> -             else
>> +             if (!IS_ENABLED(CONFIG_ZRAM_TRACK_ENTRY_ACTIME) ||
>> +                 kstrtouint(buf, 0, &age_sec))
>>                        return -EINVAL;
>> +
>> +             /* No slot can be older than the system uptime */
>> +             uptime = ktime_get_boottime_seconds();
>> +             if (age_sec >= uptime)
>> +                     return -ERANGE;
> 
> Or perhaps, instead "return len" and make it a fast path out, w/o the
> need to iterate any slots, take locks, etc.

Thanks for the feedback! I've sent out v2 of the patch. Please take a 
look when you get a chance.

https://lore.kernel.org/all/20260828083149.45760-1-jiahao.kernel@gmail.com

Thanks,
Hao
> 
>> +
>> +             cutoff = uptime - age_sec;
>>        }
