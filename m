Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180831;
	b=SH6eF8X51mx48qkmNoKUMK3f1MupLT7PUjIUCy8IA+L7wf+S5PhbqLvO8+KpLEg0YNBF
	 qkKheyyheGaFWm652oszruWi7XdVJHKTR7KdEKc4QDgPZic/b8x8Rxqn3xKm6gBYM7DWR
	 zgYazQb4raLUktSlw/1FeAfSNR+CNkJvNNF4KHVeZ213fjX5Bv3x4SamuiNCrjd/6XAMj
	 2Gt0Sy1YkPdoFacjeT6QbdKLvETdijtbfbMtlvT5hVSIL5ZL9sJHyw7KvcqM6jRbnvYEA
	 SgGsQ25OEyp8OPMgq9YTadxgQ4T/hBPXE+f1tGRcWgf2INQeuzVfpVpoT38IdqrrcTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ObsB3jKiA1dfTV0A4Ddm+ILKkKhn0WdS/9g9Axdfzxk=;
	b=ap7UXG7KwIDoHHdPkqNhV219jQsdq+MAHkPhHCvlLD3ohJHWWBcRPzTAVY6AqeiV+k5D
	 zUsWQ6cFJsBF1DRc05zywuoE2RXz6D2Oz9Hdx45v7rHE4EjyPqNYLP5QHQuH4r0XmnFu+
	 sYUUCe0ZincpQDt9O1FuqmBCjSCqpTLf0bKaiKz5bRh4dUKkhc+tago6TyNk2IDcFI9rK
	 CEMZR7Xv4PHsiErTeJYEMa02lZ01QBs/Kfsi9E/EoAdnVpE1FLL3fMKSAJkrXfd92dkVF
	 52uYzj/GQo5nFCwO7iuU4NlQogI4B8fRqfCFPB47Qsqft81GFs83qY8Mbn+/OcE/Wzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q3Df3SoZ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5DA606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B5DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q3Df3SoZ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so6349045e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793180829; x=1793785629; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ObsB3jKiA1dfTV0A4Ddm+ILKkKhn0WdS/9g9Axdfzxk=;
        b=Q3Df3SoZK5woo8kHQuBq/Jg9S1oEy0tgKJ7ACe+UiwXeVyiyMwbaB0LTuYJt44dkh5
         gOXHZykAYjOkCoBxm5ItKBzUWLU02tIz3v2RQ9qbuW32NFFAm/H1PGz+4kCXWPqYfUq1
         aK7/1Vxyou+EV90WRKKlX52Ct9N6mINe8mWbCbF7DZHsD6xRI/bPp6umcUfJ0o+z/ZOL
         35DH0B4bi3Qnm8X2j2OdI1ZwYGKyJowwIoRB0yok0tjcKs9Adbawf5vNVObMMgKh6+hh
         8dSuIRZAnSs7/poNXCDER3OCUmaKyUV9kLle81CLnTYg47dKR8if6CDVQIxZbtdBCaX7
         34bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180829; x=1793785629;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ObsB3jKiA1dfTV0A4Ddm+ILKkKhn0WdS/9g9Axdfzxk=;
        b=gEr2PXE7asqrHX1ifeXt6MJjaJgGKfhUpdFGDML9SKka4Rl4pZyillN+O98HbpVuD0
         Ruv6ISC/bL2t2PBr/yG0dWOUYhEj93exPEb7wxdulIBGexjHkQIMldeoo5HX96yclDyO
         xsMsLhfzdrh+hrgnkqP2i0nnozw5rifawgbcFkZ5ZXlUluoO+uGvItmkadryPZ+dkVsu
         Oy3Mq+0B78VZetRuErk6p+xiU8J6bkyg7rHpSIgdENrtEHL3qcAhlvrKA1A6oE9jUsea
         IMrhtRmKERuquDBmd/xcGuIoFofmEm8tTtHWfTq4wnBAw9EMCuTS5NUZQ1hnxjqSkBLn
         j0hA==
X-Forwarded-Encrypted: i=1; AKwUvBz3INOyaUJK5q7eb9RWRMOxnu7kKosK4HyK9HjIsG7T2rodOCI9MkDgfgUPHpuG4DoUM9OCwEM4j4wRrOc=@vger.kernel.org
X-Gm-Message-State: AFq9FYKtSdqvROm95rToEep8IySMzpr0MBcWGq29J7dAkrS9T8i4Ital
	DXhVtq/tJETRhiA1b+piJCJ0vz+vbgmRKoRcFRlCS8BqrkYNY5U06lYtOf3yL/A3RZE=
X-Gm-Gg: AYBFou0jjC52bduzWpCbtnI2isVP8guHvhlMuy1NjUFNS56r4VFaHq65U+HYvwgIJzF
	cEc+wnHrS+kPAqLayiIPAy0Z/nU/i2OW/ONda1w1CQh2QeDJQtwpoGSOhqFdUKmvvpMrymxtYYI
	OUjkU0vlKnMW4Pjfwza48jOAaTr8Wy8xHr35knJQ7y/KcGWQZYk60msMqm6I7ofwexPiIxOl2aj
	5Vxu6y80bcLZz59j9M5pFFnneDZMs9r7ykI1ZRDWTYRH+rwsgJqPmq5FWiIDdGvYVL5RB3Lfsie
	3XitQdTLuCiBbLa2IIdlBtHBHnIDdUyW2rvqxX4HI/IgmbIaV2xg/7xvGiuewyqLPe7O6ta5t1v
	BEKW4qnIt3foCL03xVyNlOTTGfWSvgyQGeNrSYiN0M3Jz1H8MMhX2x4EzvLij0RxEWAztCnKZKF
	JQvwOJw3I/126sWOg/t3GDmW1c3XX/psP/RlPz3CX1PvFbM54Ed6VP/7FkTwb/emeT41Cp7xmwi
	ekoKIlPsWP35VzvwZ48TkUCmTrXc/H/Raw42oFbNsq2J5vsH9JNwJ4KklErZso46pmiLkb8bztF
	7nM+NidOdTscjowAG+qUzQ==
X-Received: by 2002:a05:600c:34d3:b0:4a1:e0db:8cf8 with SMTP id 5b1f17b1804b1-4a9643d37f7mr35973865e9.3.1793180828727;
        Wed, 28 Oct 2026 02:47:08 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a4fc578sm2341111a91.9.2026.10.28.02.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:47:07 -0700 (PDT)
Message-ID: <84084d31-eb64-4c11-a3f9-dc5ceaced6c2@suse.com>
Date: Wed, 28 Oct 2026 20:17:01 +1030
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
Subject: Re: [PATCH] btrfs: do not leak -ERESTARTSYS from FITRIM to userspace
From: Qu Wenruo <wqu@suse.com>
To: Luca Stefani <luca.stefani.ge1@gmail.com>
Cc: zhiwei.liang@zliang.me, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Filipe Manana <fdmanana@suse.com>,
 Robbie Ko <robbieko@synology.com>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me>
 <CAO0HQ0UE5BtevPHHfV9mQo5HoqzxzDDjAkj9e=pD_0AaXmSYFQ@mail.gmail.com>
 <65fd2260-78e1-4521-9df1-b042788ae7bc@suse.com>
 <CAO0HQ0W3rALzPX59mVONjDtK1otyS8bo6_hGG6og3qwyLepmnA@mail.gmail.com>
 <84d8eb19-4264-49a5-b9b0-733c4e971433@suse.com>
Content-Language: en-US
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ujyBQkUpLw5AAoJEMI9kfOh
 Jf6o8OIH/0mqW+TQM4m2x3hCsnK+oB4yJH1qnGvIhFF/Lhs48wI02sGh6/4aA0hkCDfd9LHQ
 +ci4FUepZ9y4VS01+oIExbg/8ytzGYTzLtb44jK2GBOBVSJkMiha6jp22XFt7WUkT/tvbreu
 WWdGsaJIRQaZChy7xsMI8lqQ2WdmluZJ4LT0wD3l/l6QU1ZseMGySebdY9sVOQEOJNV7Qj92
 /KOAFNmeZshV/qDI8Iw1RTs6TvLqCcqmlZLCmJkYSVhT1RonWRren8xIRcFEgMe004IDnt7V
 qdQhk/nhTS9x9MBAhMRl0TTE1VKDLvVALsud3iZLrmmtYvwPApzGJk052f0m28vOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJq3ukKBQkUzDspAAoJEMI9kfOhJf6o
 SNsH/1ysUWOKmzY0rGS3ZdS61QgqMGhSWD/EJ4UiPw+xO4l4+GtX0fOAqxqsmBKqje3vyhBa
 Z5o/1Y+gNiN+E6RBcSz4b1TAd78sQ2bvT5DWOvBjeeVxHdiuQMIn4S8xk5ZpySBw5ifjoiuL
 0M33UVtJOzM8yfAeL+d/Rp4leJw72SutjkLyZTG/gJIp4pJGD/kFHn24OLL0IxEcO0gOekNZ
 os5e1R6jAJ2ILk7+MDnvU8wXHcCiVzuDhJLI1tih1uUIE50muHQJWbYuVBbdJeu8WlIDDssx
 UOCxLylNG3gDXV5MhLubPTOpp9OiFc/XC37nvkgEcrlmlOFBv4/NJCbECpo=
In-Reply-To: <84d8eb19-4264-49a5-b9b0-733c4e971433@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/28 20:12, Qu Wenruo 写道:
> 
> 
> 在 2026/10/28 19:50, Luca Stefani 写道:
>> On Wed, 28 Oct 2026 at 09:57, Qu Wenruo <wqu@suse.com> wrote:
> [...]
>>>> I don't know what the intention of btrfs: handle user interrupt
>>>> properly in btrfs_trim_fs()
>>>> was, maybe we should just swallow the ERESTARTSYS case in those 
>>>> scenarios.
>>>
>>> I agree on that btrfs is the exception, we should follow ext4/xfs, not
>>> rely on some tricky signal handling behavior for suspension.
>> When I updated btrfs_trim_interrupted I used the same "checks" as
>> seen in ext4 so at least on that part it's identical.
>>
>> What differs is our error handling: we set/handle -ERESTARTSYS, ext4 
>> does not.
>> ext4_try_to_trim_range only ever succeeds by returning the count of
>> trimmed bytes
>> even if it checks for trim interruptions.
>>
>> I think if we remove ret = -ERESTARTSYS; from the
>> btrfs_trim_interrupted branches
>> we'd align the behavior (plus reverting the previous change as that's
>> now useless)
> 
> I think that's would work for most call sites, but there are some call 
> sites that we may want to know if it's interrupted.
> 
> E.g. btrfs_issue_discard() is very deep inside all trim calls, if we 
> drop the return value without any other extra way to notify the caller, 
> it will incorrectly return 0, which is definitely not a good idea.
> 
> A safer solution would be keep the existing ERESTARTSYS, but change it 
> to return 0 for now.

Sorry, I mean to return 0 at the fstrim entrance, btrfs_trim_fs().

> 
> But if you have a better solution and can completely remove ERESTARTSYS, 
> I can't be more happier.
> 
> Thanks,
> Qu

