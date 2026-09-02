Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6F0494A1B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 22:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788387627; cv=none; b=KZEK3twPjq0nYgOu6H2ko/fMAx1Gihau1sY3CQTHvXnFJue5oQ5KCatsKUqd9ADFbisdAFLOUPkCIpctvFZ7ZRXF+L/YTz08x6lbntcQUrwS/ek+ssYPMh0wlY4j85ytNOWRON0awJvUy4jCqo6+b4w12ppn1sHS9AijA1qErhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788387627; c=relaxed/simple;
	bh=/C5ZwwcZDfKm6vqVr6NZjcpRrsJ/gd5orG3+Q9GIVyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ud9YL34cxN7Y3Lph9UP6tce1RirgQ89sQC1uvwELoxV7xnme2EWbgMoE8aBvXD/nDkO+ljNpVCrurAGGXdVNzWxoZx1lfb+kTDwPgetSfFoVxr1thmGABSf0kSnguf0hslXGx9/hZXePV+U23QgD9bSI/4b/4ZRP+XFBiqBH5II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=GcBk1diC; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="GcBk1diC"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so16702635e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1788387621; x=1788992421; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nU1P0PllgaqOdRVPyNJj2lA89FbCNDthmut5RZLbvw=;
        b=GcBk1diCUV3ZacY2fAVjoshafVWdxErPYBsakH5l+BWmatVvYabkMIE6p5ga2kEsU+
         +o3kFAiZHI0YDOPjcVQB9HfcPI7+SZZnzngmuCcsCGzaOVcew6/hK0Yi2KsXkHnlkHWO
         MFhunIMEAOHKrpo0s6BXtClzlU6CEOUUiapkrKBymDJ3i2mHyjEhmPvs38x9HB4HUfOb
         aOC6CGCc4roopn/+oq/emCmJNmbNoKKs/Pv2g0BimGH5Jp/QK+l89KqO2/YVH5MkoghB
         T9R+uZklX+ELSyHfFJus/Oqu5eutJBtEbPkBh73h1frdnGQcT2buONcuZ5iiopOOT0dA
         Jd0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788387621; x=1788992421;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5nU1P0PllgaqOdRVPyNJj2lA89FbCNDthmut5RZLbvw=;
        b=sY4J8DTLgXsUs1jBc7EzPnZyWBhZhIIs3g0fcCxG7FVD4gZBYP8LqcZXT8OkyMV9jx
         NYVwJPFGs9xs55wfcyVat6Z0Jwl2oVQSvdAzyx/o/zt2faRrDV5U3AmkmQRXlMHXr8uQ
         FTMCgve/M6TFHgV3+PwBazUGDTVQ1/bk8T4Lt6lYRiBO8o6s9shQ+u4fDWqUTI2Ocyuf
         c0GLLAlhXG8dPBqc8hwHns29rA8WAuBEFcmXDoMIv+e1uVc0Gmxhtq6rf7RUmnDcwM8H
         FSL+dyPSBTsccFVGZJHLpDLR7oyWRd3s4e0hgNFMut9OVNrBZeBnkKVS0HTfoe9TlJBC
         4SGg==
X-Forwarded-Encrypted: i=1; AKwUvBxnQXkBSTrRPTyZgmVDyAap7DB//1mOWlGhUlfK+zezYEWvSutP48t/Zj8uVVehzCqnv2+1+0ydVK+STtY=@vger.kernel.org
X-Gm-Message-State: AFuF++n2llS0BvQKROO3Ulpt8gZ6fIN/Vhkq1lOq0XUUJNUMKdukKVIq
	m7lh6xUlMpyq0eVHa49HfHdlvBY/BGR5mNI0qdZeewig0hDHBP/nnvVHRlH5+mN1v8A=
X-Gm-Gg: AYBFou1O2ns1OQHGqpPWSkofmY9uW0KZAir4/5iEbFgm/qLxVspbimYpwXU4482gE1H
	uoFHIAd/h7fDv26RDx2UelVAsbR12DczwzsUH4iWIHobT9n08/x3eXGpbrrkd6ggP8Y/bPfq+OM
	X2fQIy/34Wt4BQ0gRI235lHPx4h2JTl53j9MdqcVyrg04khv7dNf3xJo2oX4Vu0/elryOoRHGcP
	qf2LvGgeQV1Cw7xGOVVjAEJrT7zm4XlP5abiULqBX1kcCfV/HUGdQ+1rdVUCbJHZ4z8N5/sBT61
	X3EatnDPTHGlDkeAeexry5IMxV5xVdz5ERtSZhLykIgQyqzuSst7pA9LQkYM4sEvjyNKYoS6J3O
	oZ3+09a5OQIV5cqoozdqiExLMfudBjHE9IrBCYKymAjsyYuAj4baebPsUr88SZqux8MM9UzGgwW
	k0706bqqJMHVSelAeaS5MabBTXrglnkbIv85MZ4E79g54Ec3Ssyvxc
X-Received: by 2002:a05:600c:a086:b0:495:48d7:f178 with SMTP id 5b1f17b1804b1-49ce5815dddmr155922185e9.11.1788387620809;
        Wed, 02 Sep 2026 15:20:20 -0700 (PDT)
Received: from [172.16.0.229] ([159.196.52.54])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39ae9065483sm1960455a91.4.2026.09.02.15.20.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 15:20:19 -0700 (PDT)
Message-ID: <4aa4fd04-e009-4585-bf65-9c628e3923d5@suse.com>
Date: Thu, 3 Sep 2026 07:50:13 +0930
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] btrfs: use bio::remaining for async checksumming
 synchronization
To: Qu Wenruo <quwenruo.btrfs@gmx.com>, Daniel Vacek <neelx@suse.com>,
 David Sterba <dsterba@suse.com>, Chris Mason <mason@kernel.org>
Cc: linux-btrfs@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260902165137.3781696-1-neelx@suse.com>
 <20260902165137.3781696-3-neelx@suse.com>
 <b54b679d-18c7-492e-a4fa-ce797c0748fa@gmx.com>
Content-Language: en-US
From: Qu Wenruo <wqu@suse.com>
Autocrypt: addr=wqu@suse.com; keydata=
 xsBNBFnVga8BCACyhFP3ExcTIuB73jDIBA/vSoYcTyysFQzPvez64TUSCv1SgXEByR7fju3o
 8RfaWuHCnkkea5luuTZMqfgTXrun2dqNVYDNOV6RIVrc4YuG20yhC1epnV55fJCThqij0MRL
 1NxPKXIlEdHvN0Kov3CtWA+R1iNN0RCeVun7rmOrrjBK573aWC5sgP7YsBOLK79H3tmUtz6b
 9Imuj0ZyEsa76Xg9PX9Hn2myKj1hfWGS+5og9Va4hrwQC8ipjXik6NKR5GDV+hOZkktU81G5
 gkQtGB9jOAYRs86QG/b7PtIlbd3+pppT0gaS+wvwMs8cuNG+Pu6KO1oC4jgdseFLu7NpABEB
 AAHNGFF1IFdlbnJ1byA8d3F1QHN1c2UuY29tPsLAlAQTAQgAPgIbAwULCQgHAgYVCAkKCwIE
 FgIDAQIeAQIXgBYhBC3fcuWlpVuonapC4cI9kfOhJf6oBQJnEXVgBQkQ/lqxAAoJEMI9kfOh
 Jf6o+jIH/2KhFmyOw4XWAYbnnijuYqb/obGae8HhcJO2KIGcxbsinK+KQFTSZnkFxnbsQ+VY
 fvtWBHGt8WfHcNmfjdejmy9si2jyy8smQV2jiB60a8iqQXGmsrkuR+AM2V360oEbMF3gVvim
 2VSX2IiW9KERuhifjseNV1HLk0SHw5NnXiWh1THTqtvFFY+CwnLN2GqiMaSLF6gATW05/sEd
 V17MdI1z4+WSk7D57FlLjp50F3ow2WJtXwG8yG8d6S40dytZpH9iFuk12Sbg7lrtQxPPOIEU
 rpmZLfCNJJoZj603613w/M8EiZw6MohzikTWcFc55RLYJPBWQ+9puZtx1DopW2jOwE0EWdWB
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
In-Reply-To: <b54b679d-18c7-492e-a4fa-ce797c0748fa@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2026/9/3 07:32, Qu Wenruo 写道:
> 
> 
> 在 2026/9/3 02:21, Daniel Vacek 写道:
>> We can use bio::remaining counter to sync the offloaded checksuming.
>> As a result we can slim down the btrfs_bio structure by 24 bytes
>> and simplify the code a bit.
>>
>> $ pahole | diff
>> -    /* size: 328, cachelines: 6, members: 15 */
>> +    /* size: 304, cachelines: 5, members: 14 */
>>
>> Moreover this will allow us enabling async checksumming with encryption
>> where we need to checksum the bounce bio instead of our regular one
>> embedded in btrfs_bio. And so we need to extend it's lifetime. This is
>> the preffered way to do so.
>>
>> Signed-off-by: Daniel Vacek <neelx@suse.com>
>> ---
>>   fs/btrfs/bio.c       | 4 ----
>>   fs/btrfs/bio.h       | 4 ----
>>   fs/btrfs/file-item.c | 6 ++----
>>   3 files changed, 2 insertions(+), 12 deletions(-)
>>
>> diff --git a/fs/btrfs/bio.c b/fs/btrfs/bio.c
>> index 19b4855969f5..771b7d598aee 100644
>> --- a/fs/btrfs/bio.c
>> +++ b/fs/btrfs/bio.c
>> @@ -103,7 +103,6 @@ static struct btrfs_bio *btrfs_split_bio(struct 
>> btrfs_fs_info *fs_info,
>>       bbio->can_use_append = orig_bbio->can_use_append;
>>       bbio->is_scrub = orig_bbio->is_scrub;
>>       bbio->is_remap = orig_bbio->is_remap;
>> -    bbio->async_csum = orig_bbio->async_csum;
>>       atomic_inc(&orig_bbio->pending_ios);
>>       return bbio;
>> @@ -114,9 +113,6 @@ void btrfs_bio_end_io(struct btrfs_bio *bbio, 
>> blk_status_t status)
>>       /* Make sure we're already in task context. */
>>       ASSERT(in_task());
>> -    if (bbio->async_csum)
>> -        wait_for_completion(&bbio->csum_done);
>> -
> 
> But what if there is still a running csum calculation at this stage?
> 
> Without waiting for the completion, we are going to get incorrect csums.

Forget this. We no longer need to wait because we won't even reach the 
bio->bi_end_io() until all remaining works (including the csum 
calculation and mirrored writes) finished.

Reviewed-by: Qu Wenruo <wqu@suse.com>

Thanks,
Qu
> 
>>       bbio->bio.bi_status = status;
>>       if (bbio->bio.bi_pool == &btrfs_clone_bioset) {
>>           struct btrfs_bio *orig_bbio = bbio->private;
>> diff --git a/fs/btrfs/bio.h b/fs/btrfs/bio.h
>> index b7bd377a0162..bbf362b8668b 100644
>> --- a/fs/btrfs/bio.h
>> +++ b/fs/btrfs/bio.h
>> @@ -58,7 +58,6 @@ struct btrfs_bio {
>>               struct btrfs_ordered_extent *ordered;
>>               struct btrfs_ordered_sum *sums;
>>               struct work_struct csum_work;
>> -            struct completion csum_done;
>>               struct bvec_iter csum_saved_iter;
>>               u64 orig_physical;
>>               u64 orig_logical;
>> @@ -93,9 +92,6 @@ struct btrfs_bio {
>>       /* Whether the bio is coming from copy_remapped_data_io(). */
>>       bool is_remap:1;
>> -    /* Whether the csum generation for data write is async. */
>> -    bool async_csum:1;
>> -
>>       /* Whether the bio is written using zone append. */
>>       bool can_use_append:1;
>> diff --git a/fs/btrfs/file-item.c b/fs/btrfs/file-item.c
>> index 5a5cffb18922..50dcd448d936 100644
>> --- a/fs/btrfs/file-item.c
>> +++ b/fs/btrfs/file-item.c
>> @@ -817,9 +817,8 @@ static void csum_one_bio_work(struct work_struct 
>> *work)
>>       struct btrfs_bio *bbio = container_of(work, struct btrfs_bio, 
>> csum_work);
>>       ASSERT(btrfs_op(&bbio->bio) == BTRFS_MAP_WRITE);
>> -    ASSERT(bbio->async_csum == true);
>>       csum_one_bio(bbio, &bbio->csum_saved_iter);
>> -    complete(&bbio->csum_done);
>> +    bio_endio(&bbio->bio);
>>   }
>>   /*
>> @@ -854,8 +853,7 @@ int btrfs_csum_one_bio(struct btrfs_bio *bbio, 
>> bool async)
>>           csum_one_bio(bbio, &iter);
>>           return 0;
>>       }
>> -    init_completion(&bbio->csum_done);
>> -    bbio->async_csum = true;
>> +    bio_inc_remaining(bio);
>>       bbio->csum_saved_iter = bio->bi_iter;
>>       INIT_WORK(&bbio->csum_work, csum_one_bio_work);
>>       schedule_work(&bbio->csum_work);
> 

