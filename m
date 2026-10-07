Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E394749D7
	for <linux-kernel@vger.kernel.org>; Wed,  7 Oct 2026 09:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791367172; cv=none; b=L0yJ1vXpOonF7lmONE40ydWjh/ZUfMWFDAmin1YIBYwFqJacSpSZI95oFUKStTsSeEc0PTTNizihyvqwB4tjf6mk8wIREy2CnpoovTyNUVN5azYhTvOKaLB3aSNhdmZ8CMvKe9wEg7UMOq1Nj7wTZ16J0aZp4q0fauJ0JCaapW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791367172; c=relaxed/simple;
	bh=7bGn4hzYuOiNl03NQRVJsJ8Gc8tm3kDOThzL5Ps6sac=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=h0o14fpFsKKNCilEloLBgHxHpGPV1I9WEcLeKYdhOYIZh6kE7CJ9rJ2ylU5Yrn587+Gf2VhaMAZG/QsiQO1KLsLsLwMxN7SiVGidM8YoOU4gD+WAZSc+YW3s6eApNYDRAXwJ0Ow9FSrsCogaWLhEBhV18yfLBqI1jltYRHtyWTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=df7mLzRB; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="df7mLzRB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so26925705e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 02:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1791367161; x=1791971961; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sTw1DYJ/lie8TNqbfg32Xyb6W/CErQFnYS5LqwGE1n8=;
        b=df7mLzRBcHJmRZN1UZ17d8JzdKL793PmGk0bkhjaxs9huTNVOdzU6LvuNEvbi7rb8e
         fnLEQT0fOn179ZtnCsnNUX2/w2tfokXncHaBGRxizGHUS8LQxGpUIV5dOE9hKRCoubYL
         8PLYtGXkYc02H1FeqDnZRFSZoSyAPwrqwJQZU+GecM4CS0d1GDtQdk3A+Ko6dwTelfDw
         zPMZAkC/473cVS/yAZDJT8GcQB8pPboa4Spy/jncvpw4ZrFNHbOziw91I2tiyZURX5rB
         s9j8K6m6bbUHKKqJUr70MODMUVocXGpoQS6NwWeWT6DJEoBKw8KyUY732S1mWVHk6WbT
         vo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791367161; x=1791971961;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sTw1DYJ/lie8TNqbfg32Xyb6W/CErQFnYS5LqwGE1n8=;
        b=ZZeUocpysUkZKrDqZ8xVlGKnDPSGD6cF5CRul9Y3BOOhTSdIIlTeK3TI09PDY+3CPY
         3XTiGZ0JWmWOLCNql8s89k23X8yLKbCCZ6j3M6PQsXc0VUL6ZNLC5ZeUDw2WQOYHPlRJ
         wxVMYeWR50qm0bxIB90CLIaBlxxEtMSfutV6b8HHUL/bi63W+zTEbs8TXbrsZ/XT5mxp
         14A9pXs26k+Zqxo/THghhg2vyLy4lkbHL1b14gHVWS7Ro6tkjvrraqd73tQ2LENo7oGR
         Pv10buVdzncDNNWE2G2mQrQqJkebuapJJ8w4xYv+XswvVi6zXNfzo4FhQOl9iWA/AfBe
         6/+g==
X-Forwarded-Encrypted: i=1; AKwUvBw3HBEkKeubqpKNTFRFmIsttZmtG26qwPwP/C053vvrlVP7Rtubh7caYab19Je+n/Do0EPrfEoF15e2/x0=@vger.kernel.org
X-Gm-Message-State: AFuF++ni54EbLHI2OOHRFDo5andtbA7s0VBY4FxQ50iBCtvV8Tcwl9+c
	8kswiJMsuuqT3axpw9k835PNd3eOEBK8Afg9UaSOmEuQ4TU8wgqfCnrTRTB5CBWKhj4yfaMz0zs
	+pkY8UjM=
X-Gm-Gg: AYBFou2pr2cL2m++53n2tjDVaDRqz7I4B7VSz/PnunJ2WIIprp+6SB7YSUgqIf811go
	tv6qoxPUjFqVFP8mpih8k0BOnfhUk1aijZqDL7I2vX7tS9i+bAu47Mt0O5ALc4jH/BS6/Fa9Mgd
	8rc8iwikSLPrtrUGg3LreHS8KkBlJKNLJerLTQ1cksZnqeEBiznT5ELxaYLv2Y6ck+AeQL8ZRUF
	ouHIfK+7HvV7iulDIwmfv3k1XyXsdTZvRnySJMsdez4QXkR1k1sY9sz/NMMo7+R3hrrc0nzGIMy
	TKaP6LsM58RG6ZqO+nLHVcJ6gt1LaG8ihx29g1oSatJ3xjxoiZlPQizjPjQgbU/I+M6hna3hlWB
	9dhgQekh+gABkk9+PKSrg7oytN8bnCaQtLIkmb1FS1na/bZn+pUV8mvJppuKOvSks9iDBB2mIBi
	LdeSvoYcarAUYwLr1nxOxKF1+w2aHC4+65guqjpdeGy7K8LJAsqYfL4KYv9wUshdQ=
X-Received: by 2002:a05:600c:46d3:b0:49c:dada:30b7 with SMTP id 5b1f17b1804b1-4a1800d42abmr23981425e9.2.1791367160821;
        Wed, 07 Oct 2026 02:59:20 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e604852563sm7217615ad.62.2026.10.07.02.59.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2026 02:59:19 -0700 (PDT)
Message-ID: <55739226-436a-42c3-a5fa-c699b01f819e@suse.com>
Date: Wed, 7 Oct 2026 20:29:14 +1030
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] btrfs: fix use-after-free on quota enable allocation
 failure
From: Qu Wenruo <wqu@suse.com>
To: pavankumaryalagada@gmail.com, dsterba@suse.com
Cc: mason@kernel.org, fdmanana@suse.com, shuah@kernel.org,
 linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
References: <20261007090656.20609-1-pavankumaryalagada@gmail.com>
 <4851139b-6cd0-4b1a-9a6e-1af947d49098@suse.com>
Content-Language: en-US
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJqqw0NBQkUl/JeAAoJEMI9kfOh
 Jf6o/xYH/3AaWnGSq58XnY/T3/YYjr6g+TUZxa7MPyiYTELNpNlvmNlbtbAL0nW0LNvkeiqf
 SmYA+xkwY4RbxnZYQK0H5iv2w1eqa9qqFZb4bIBRmTapu26GEEkpad0W0ZhoSPMO8bV2Bwkf
 YdtPZQLaeUKvHZqNqBKnmtRLQj2Cgy3kuXX3bEGvWjzUOxPUSCj/S++JWBewMdMBPT62vZM0
 3156gfn5mHA94s2p+NFJoWkERY+JPTMu9NISkpD7yuGhXN88qd/aqD0RrlhxvKsrQogdPwn9
 vP18FGG3CRlHtOvOLVoY5NKSOWTDc+o+8t2XEETFTGbKYTcqeTzi4SxhvBLtTinOwE0EWdWB
 rwEIAKpT62HgSzL9zwGe+WIUCMB+nOEjXAfvoUPUwk+YCEDcOdfkkM5FyBoJs8TCEuPXGXBO
 Cl5P5B8OYYnkHkGWutAVlUTV8KESOIm/KJIA7jJA+Ss9VhMjtePfgWexw+P8itFRSRrrwyUf
 E+0WcAevblUi45LjWWZgpg3A80tHP0iToOZ5MbdYk7YFBE29cDSleskfV80ZKxFv6koQocq0
 vXzTfHvXNDELAuH7Ms/WJcdUzmPyBf3Oq6mKBBH8J6XZc9LjjNZwNbyvsHSrV5bgmu/THX2n
 g/3be+iqf6OggCiy3I1NSMJ5KtR0q2H2Nx2Vqb1fYPOID8McMV9Ll6rh8S8AEQEAAcLAfAQY
 AQgAJgIbDBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXWBBQkQ/lrSAAoJEMI9kfOhJf6o
 cakH+QHwDszsoYvmrNq36MFGgvAHRjdlrHRBa4A1V1kzd4kOUokongcrOOgHY9yfglcvZqlJ
 qfa4l+1oxs1BvCi29psteQTtw+memmcGruKi+YHD7793zNCMtAtYidDmQ2pWaLfqSaryjlzR
 /3tBWMyvIeWZKURnZbBzWRREB7iWxEbZ014B3gICqZPDRwwitHpH8Om3eZr7ygZck6bBa4MU
 o1XgbZcspyCGqu1xF/bMAY2iCDcq6ULKQceuKkbeQ8qxvt9hVxJC2W3lHq8dlK1pkHPDg9wO
 JoAXek8MF37R8gpLoGWl41FIUb3hFiu3zhDDvslYM4BmzI18QgQTQnotJH8=
In-Reply-To: <4851139b-6cd0-4b1a-9a6e-1af947d49098@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/10/7 19:47, Qu Wenruo 写道:
> 
> 
> 在 2026/10/7 19:36, pavankumaryalagada@gmail.com 写道:
>> From: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
>>
>> The quota root remains on the transaction's dirty root list when
>> kzalloc_obj() fails and btrfs_quota_enable() releases it without
>> aborting the transaction. Later add_root_to_dirty_list() then accesses
>> the freed dirty_list, causing a slab-use-after-free.
>>
>> Abort the transaction on allocation failure to clean up the dirty
>> root before releasing the quota root.
>>
>> Reported-by: syzbot+947286c775f432b073a8@syzkaller.appspotmail.com
>> Closes: https://syzkaller.appspot.com/bug?extid=947286c775f432b073a8
>> Fixes: 8d54518b5e52 ("btrfs: qgroup: pre-allocate btrfs_qgroup to 
>> reduce GFP_ATOMIC usage")
>> Signed-off-by: Yalagada Pavan Kumar <pavankumaryalagada@gmail.com>
> 
> Reviewed-by: Qu Wenruo <wqu@suse.com>

My bad, Sashiko exposed a valid but very rare race that the temporary 
quota_root can be added to fs_info->dirty_cowonly_roots list.

This requires enough subvolumes to make quota_root to be higher than 
level 0 in the first place, which is not common but definitely possible.

Although all readers of fs_info->dirty_cowonly_roots won't be reached 
after the transaction is aborted, there is still a very small window 
that another thread is already holding a trans handler just after the 
transaction is aborted and the quota root is freed.

In that case the other thread may access the already freed quota_root 
through fs_info->dirty_cowonly_roots->next.

I'm afraid we need to call list_del(&quota_root->dirty_list) with proper 
trans_lock hold during error handling.
> 
>> ---
>>   fs/btrfs/qgroup.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/fs/btrfs/qgroup.c b/fs/btrfs/qgroup.c
>> index f68b696b4bf7..42be06675c90 100644
>> --- a/fs/btrfs/qgroup.c
>> +++ b/fs/btrfs/qgroup.c
>> @@ -1204,6 +1204,7 @@ int btrfs_quota_enable(struct btrfs_fs_info 
>> *fs_info,
>>       prealloc = kzalloc_obj(*prealloc, GFP_NOFS);
>>       if (!prealloc) {
>>           ret = -ENOMEM;
>> +        btrfs_abort_transaction(trans, ret);
>>           goto out_free_path;
>>       }
>>       qgroup = add_qgroup_rb(fs_info, prealloc, BTRFS_FS_TREE_OBJECTID);
> 

