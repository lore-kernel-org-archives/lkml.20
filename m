Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793180578;
	b=DQ5+bHOMWPr8nqCW4xnkuct10RSE027eHBPPJF6nP+gG98j9m8ncVKvrrpQkxl1NFx3y
	 CmC03jsZ0okSOqBiJf/KM/xo2Y17GkyOYlJF4f5F1cr0qpiSqQrrwb1yOc+szS/OUydhu
	 jSvBdarbMsjq4x5ipePkpyyRZganHWCJfcp9Wxspzdw4wzrv0S8UAUrNdgH8kNXlR9V6p
	 i6ZgPQKNw7GaMHENcq76KdfAVvHZguOvgi8CV/ZMhC/B2cX78p5iMedJEeeCwp5dej+Dk
	 yfi+SSXlhBcjDzi/1gbymQI2AOIelYSvn4lmJr+clIpWsZ8S+yAg1NAHE4PdDN746aA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793180578;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ueELwOQ2FDXG5TiDh44KESshsBtDoYUCI0yAAS1GQkM=;
	b=ivQlFiIc9aJecid0n35osDkQlD+GHZlCG9DzTbBQ+bBmPxbbxAvel8TYyyPDHwe6soIw
	 6C4lHbaiVShv49Y+t4g1GRIQ5a44yOfr3LBI+Wxmq71iyfEBGFuSXHSvLRPzbUxh8SQ0b
	 diRKEWGKglfeoUaTgLYt04tmQ2/PDz3sTQU9985syrHfoDvDN3TDRovb3YhhaIk8ebkja
	 HM35nLgEL9vnLO5uOYnDgvkc1QM4EfbLZiiIKwF8+5DbumwgaALfBg5KyaGdVpx9xM6Sv
	 N9a1Oaq/ENr4Bfq5ndk4K/KoseiPVFxcxE3HxXj/N6Cg5D/n1gsp2PsJlmGzexvHuIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PQbo2XTs;
	arc=none smtp.remote-ip=209.85.208.53
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3E8606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A3E8606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=PQbo2XTs
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6b4883643ccso1018736a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 02:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1793180576; x=1793785376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ueELwOQ2FDXG5TiDh44KESshsBtDoYUCI0yAAS1GQkM=;
        b=PQbo2XTs7+JUGRlUTGTxRJcLFYhBLPTAshSkvaFFlLlYksL0EQpA98PaJOvbXAjLC6
         PNot3kPgSWYUxNOFPqraAZDoxNxXQCo2Af/B9Bu700JashLq2YAwe8BCZoCR8NSV8a8J
         5T6i2xwk+1dQ3H6KBVjctA5LDZmzfK/m8MjsFrddK7HxiXOAdyyA7/Vi9KYhfx2+GsaH
         o0WgW0D+FrQGnhHI+cy7kn5eymCH9o3QQR1eDPSQzsXhf+1+WXZzDk15aUIzrsBzvHwK
         uIPJwAGw9L3nZ1eCw4iSDjNASRZUhMNAUyQzonqf+S8EhiDNGmXedfKUtIzq2VlwKjcR
         BK0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793180576; x=1793785376;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ueELwOQ2FDXG5TiDh44KESshsBtDoYUCI0yAAS1GQkM=;
        b=yqnj+lIIJac2AqDnmCI/0wj8MXVFT3aUbtyZD2FlJmjz8hzfKcFANzVJvsofx9JRxB
         tByTD0dtoVbh4Jfn/mUveNEHIDXEybYeJRw8K0q0DdtuKdeduW3mUP4A0BKkrfYy5moC
         6a1G5suFHGHF4kno1qgDcMLglGTVC7JzRTUsUb7PLTUXYtK42HUl+Wasx/V40IKHhCsn
         8SszPCkyynJObPx5G3tr3240A0qj3D8pXcB1DsOCY6mORIPXcI7073J0fPfKFHEHoGpA
         uRiCShg6ehEhGkgHC2Znfq48MUKojIrDa65Ki0R5GuJLYeXgK2oTpdJOdgKX4mCclIJF
         M4vg==
X-Forwarded-Encrypted: i=1; AKwUvBz2M1yOb7+YCjckzoi33C99VWTDT3ZJtc7+sYGCOOasiC1Gs3A1KS5SyScMzYY47ABmcSLZDNQm9pfakuo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKnSNrD6QzKUO3i7aklMUFr8I6iXLlZxIDxICiVz6BgrkXneKaM
	9TapuUDcvBzvNaBlqcZU3idvEHUDANiGf4LpbLiqtCPwxPN/BsQWYwsGpJq3FPob8Ks=
X-Gm-Gg: AYBFou19gk9xNAD/IqZJUf5yDKEMuHwgHeo1bpi7dFGPIT8uNl76pjUlzctzBimNsR9
	PK2Y+gOI1rdzxCW+GZd1E6r0W41Hn6AUvcQUsXVaHxVXrwdbS7LNdjU5ZhVdFRZWjnPH2zF0b8s
	w4OVku51LDP4KYnObfu+QyVBrdeQ0TxEeSnddlZv5w6IU3aV6fHXDcA1pxBLwqZBMPJNddpZeIQ
	NWl04URpandvSTUtirCj6qMAK59rlvmNo60+lyPBV3ghJtBjS61KLDmu+ESpu3eqhYNHm8wTeRU
	Y3/ETQ65jJAcGdSM+Wj8qBfX5Hsctv3fRmYxPR6RA7ZNekah6qqWsWNbYXGlvMQLDw0/ZHPIxug
	47iMD4XBY3nraCG8qw0VZb7SaWUKWHCFLoWQU/fLH+a0gHmgb6aEhpzKzd4AmYMvAGCsaANl73m
	H2ZpeN2+j7yxKJvmHsCgqR8YbaBQIvhAOTMecSM76SFjAhjbliNWdSWJibnLWnpijoNRvJAF38F
	wd9viHk3gX6BwpbJXSRZx6bjWNi9nIZgWsLnFZJMe7wqKQlBq+N4wrobDimcIzlxSlQw6NowKub
	ddgaG18U/MStU9NRsNX0Dg==
X-Received: by 2002:a17:906:9fcf:b0:c46:7ec3:fdfd with SMTP id a640c23a62f3a-c49bdf2b6b9mr156981366b.14.1793180576460;
        Wed, 28 Oct 2026 02:42:56 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a6a67228ffsm926320b3a.32.2026.10.28.02.42.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 02:42:55 -0700 (PDT)
Message-ID: <84d8eb19-4264-49a5-b9b0-733c4e971433@suse.com>
Date: Wed, 28 Oct 2026 20:12:49 +1030
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
To: Luca Stefani <luca.stefani.ge1@gmail.com>
Cc: zhiwei.liang@zliang.me, David Sterba <dsterba@suse.com>,
 Chris Mason <mason@kernel.org>, Filipe Manana <fdmanana@suse.com>,
 Robbie Ko <robbieko@synology.com>, linux-btrfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261028-btrfs-fitrim-freezer-v1-1-0ad1d58aa94d@zliang.me>
 <CAO0HQ0UE5BtevPHHfV9mQo5HoqzxzDDjAkj9e=pD_0AaXmSYFQ@mail.gmail.com>
 <65fd2260-78e1-4521-9df1-b042788ae7bc@suse.com>
 <CAO0HQ0W3rALzPX59mVONjDtK1otyS8bo6_hGG6og3qwyLepmnA@mail.gmail.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
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
In-Reply-To: <CAO0HQ0W3rALzPX59mVONjDtK1otyS8bo6_hGG6og3qwyLepmnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/28 19:50, Luca Stefani 写道:
> On Wed, 28 Oct 2026 at 09:57, Qu Wenruo <wqu@suse.com> wrote:
[...]
>>> I don't know what the intention of btrfs: handle user interrupt
>>> properly in btrfs_trim_fs()
>>> was, maybe we should just swallow the ERESTARTSYS case in those scenarios.
>>
>> I agree on that btrfs is the exception, we should follow ext4/xfs, not
>> rely on some tricky signal handling behavior for suspension.
> When I updated btrfs_trim_interrupted I used the same "checks" as
> seen in ext4 so at least on that part it's identical.
> 
> What differs is our error handling: we set/handle -ERESTARTSYS, ext4 does not.
> ext4_try_to_trim_range only ever succeeds by returning the count of
> trimmed bytes
> even if it checks for trim interruptions.
> 
> I think if we remove ret = -ERESTARTSYS; from the
> btrfs_trim_interrupted branches
> we'd align the behavior (plus reverting the previous change as that's
> now useless)

I think that's would work for most call sites, but there are some call 
sites that we may want to know if it's interrupted.

E.g. btrfs_issue_discard() is very deep inside all trim calls, if we 
drop the return value without any other extra way to notify the caller, 
it will incorrectly return 0, which is definitely not a good idea.

A safer solution would be keep the existing ERESTARTSYS, but change it 
to return 0 for now.

But if you have a better solution and can completely remove ERESTARTSYS, 
I can't be more happier.

Thanks,
Qu
