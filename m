Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2088E4FECD5
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 12:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789648373; cv=none; b=RHduspUBUHZkQPt1qGM0ld7/q+MdogCQpOejximsmk1OU+CwnHRffINuMdtpAffrn6cjBMHIfXfJMMnioW9A8h6N7g0kErTw7yRqNW3KTgjsM/OyrI4N/eiHZyqNmXAnK8WivG7MahpSa3kp3aZb2s1tQxhthRbfnDVISbJcXk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789648373; c=relaxed/simple;
	bh=Xa1IsGUxXNZyPx56uY6l71cj0MjnLhOAqncuS8+Vjcw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qutHCqNzuZU3LGaZ7XULiGPJ3LtLl26fd8QpmEhBF+Pp23t1MlDeeKupFM+Ln1V51JGWKgxM1KO2S28aV2xCdTtw65AEFtB5HpZd8Rj2uWB5X4uaeVNBAE4Exi0ZKJQErSiE3fwCA2CFtw0RYNrpKf1rLIlNwwJW8oiG9Z3WeBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hjcXjMtD; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hjcXjMtD"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccd5cef0so551498a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 05:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789648365; x=1790253165; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX0fdZFc2RLefcqbAqYKYTVdyFNxhnyETiiYgD7pF2c=;
        b=hjcXjMtDRnxivV5RUwe4t7f8G1xCyCNdN8hpGAmvHPWJPjzqShBjOQDsYzOMLXbYwR
         xoq4s8fgi0/7l6kzwwbC2PtKx93Znq7uPk3yS9loWfkr9LdBAlnRhtWsLqgRtzAXOV7O
         EZgvXAV8GwFgE/lMd4pSmhwY0eZmJ4fpWvJpEU9u45btB6rjO0E7KKGYzGOsbHqUcWrM
         zVHC9aEc6ArGcsq+juf4DIR0TdOU45VQQy1vokAM+tWnXmtMlSCS7Tz2/Asv3WMj7Mti
         4+VUMkwLrCu1aNMYTbfVJvthg4BRzFey46NItDsgwlkGQyrb5Xx0r/HjumMIEfsBcjCO
         Rqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789648365; x=1790253165;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX0fdZFc2RLefcqbAqYKYTVdyFNxhnyETiiYgD7pF2c=;
        b=rC4wH4V7Upj2pMZciHc+sYCs88veHbZN4jY5IBIBlKQUhD4QKgwx1DjvrzSQDdZuSh
         HKvRFkDLDZwuy1lRAa1Rd82mbasev5wwn5Gtr2rWKwmPa3KfOzaDfwRqhvxMS4YqwuPe
         krtlkovp/PaCEjRbvQLZjilj+W69fAh6YzHz/4IPArXJPFnTE89EYYWavd7qMjH96Lkb
         qduNLdKr02cJ82bpnMF+d43gVJrRPuqOMi111bUSuyFWmpbykC2LCiTKNGTuxbHv0Ctv
         iGtposI3KId+D7Ub1AvsB1h2JR7ooBl7nsvEu6Uo8f51CUft/QCbRYQum5kG9Rr0fxYe
         nICw==
X-Forwarded-Encrypted: i=1; AKwUvBycmrcCIqopMHoEoRX7zXydJI8EFsSgH3SSiUjG0iDvISga2mXZ3C9adPiBN9vY8vAoe3JZGy4mRKQdLOk=@vger.kernel.org
X-Gm-Message-State: AFuF++kfF85S5EIKNPzSQp5h+kJ6QmDKfWWb8Atj2pEvwhtJ1h9C61ed
	5a6iBjn0jgReDKF2GUIbCSJ/RzwchWK1qqwjRZ57SNfAKG9NQfPg3dE5
X-Gm-Gg: AYBFou1bPBBfEbsR2k+hZ6miG6hI9dpd8jXdfSdcFnkLmmuoLJMrBDbRTmHD1eosaHD
	F6GLHgVZSfDlQhHcXgwitWFz1ctPrCLL4Pd7zyTxxeNyF6iWt7IfXK9OdEivwOlHN59UFeiRhck
	kZ/9Q3sI+wz3Y7Llu72pfb4yP3aDXtsfrA95F0a8gK9EP/Bx6P6elKas/C5qpz9WvFyjYcOPzBU
	OgItk9YapegG52AXGQxcSWs6uNXE14tMfxGBeRdz9PzUZMV7OMtETGSKlnPbyLsNzmaQw43umcM
	wimUF5fLbYci0m3k/le1oQJvaeHDvVkAtlmGKlWSfNLGhmU6Abfp1xssX8leABy+W0cV4WzJnJQ
	DbN4cDCgUDsgtHpsMf3CqiN5H6g4k7zmKa69oqyf8HBpqVUZPDFAqjeNH7US2MVGLZ5fNpFy05g
	uagcf9WpURNpM6aFXLdP+3NaIlyTjXBRlNxstvzM6klUHaQqdq9HzOtf0FLiFqO+V8w4Hx1lzyY
	XAiG6+Oh7OOcDVKXUU=
X-Received: by 2002:a17:90b:2c86:b0:39e:4c80:f67d with SMTP id 98e67ed59e1d1-39e4c80f73cmr236031a91.28.1789648364901;
        Thu, 17 Sep 2026 05:32:44 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e35d9869csm5164981a91.4.2026.09.17.05.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Sep 2026 05:32:44 -0700 (PDT)
Message-ID: <997ebbdf-efc9-4dc2-91ee-254c66176c32@gmail.com>
Date: Thu, 17 Sep 2026 20:32:19 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] mm/truncate: align truncation boundaries to
 mapping minimum folio order
To: Zi Yan <ziy@nvidia.com>, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-ext4@vger.kernel.org,
 akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
 liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, hughd@google.com, baolin.wang@linux.alibaba.com,
 willy@infradead.org, jack@suse.cz, bfoster@redhat.com,
 joannelkoong@gmail.com, djwong@kernel.org, yi.zhang@huawei.com,
 yangerkun@huawei.com, chengzhihao1@huawei.com, wangkefeng.wang@huawei.com,
 yukuai@fnnas.com
References: <20260916092450.654408-1-yi.zhang@huaweicloud.com>
 <20260916092450.654408-3-yi.zhang@huaweicloud.com>
 <DLH1V7L6ECGU.3AIRGWUODR779@nvidia.com>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <DLH1V7L6ECGU.3AIRGWUODR779@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/17/2026 5:14 AM, Zi Yan wrote:
> On Wed Sep 16, 2026 at 5:24 AM EDT, Zhang Yi wrote:
>> From: Zhang Yi <yi.zhang@huawei.com>
>>
>> When the mapping has a non-zero minimum folio order (min_order),
>> folio_split() stops at min_order instead of order 0, so the sub-folio
>> containing a split point stays aligned to 1 << min_order rather than to
>> a single page. The original boundaries were based on page granularity,
>> so either boundary could land inside the min_order chunk at its edge,
>> and the truncation loop would drop that whole chunk, valid out-of-range
>> tail included.
>>
>> For example, a 64K (order-4) folio with min_order = 2 (16K) punched from
>> offset 0 to 36K:
>>
>>    split @p0 -> [p0-p3, p4-p7, p8-p15]         # non-uniform, min_order
>>    folio2 = p8-p15           # straddles: p8 in range, p9-p15 tail valid
>>    2nd split of folio2 -> [p8-p11, p12-p15]    # success
>>    end(old) = p9                               # BUG: p9 inside [p8-p11]
>>    loop truncates ... p8-p11               # p9-p11's valid tail is lost
>>
>> It has gone unnoticed so far for two reasons. A non-zero min_order is
>> only used by filesystems with a block or sector size larger than the
>> page size, and those either always write back the affected range before
>> punching a hole or truncating, or they carry filesystem private data on
>> dirty folios (e.g. buffer_head), which makes filemap_release_folio()
>> fail and folio_split() abort with -EBUSY, so the folio is never split
>> and the old start/end boundaries remain valid. The bug only becomes
>> reachable on paths that truncate dirty large folios without prior
>> writeback and without filesystem private data, such as the upcoming ext4
>> iomap buffered I/O path.
>>
>> Align both start (rounded up) and end (rounded down) to the mapping
>> minimum folio order so they always fall on a folio boundary.
>>
>> Reported-by: Joanne Koong <joannelkoong@gmail.com>
>> Link: https://lore.kernel.org/linux-mm/CAJnrk1bQYUe6+1ryyJur5EEnZYrC+_5AYsy=OWzVRgD4202y1g@mail.gmail.com/
>> Fixes: e220917fa5077 ("mm: split a folio in minimum folio order chunks")
>> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
>> ---
>>   mm/truncate.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
> 
> This should be the first patch, since Fixes is older than the one in
> patch 1.
> 
> It can adjust start and end in truncate_inode_pages_range() instead,
> since shmem's min_order is always 0.
> 
> Something like below.
> 
> Am I missing anything? Thanks.

Yeah, this makes sense to me, thanks for your suggestion.

Yi.

> 
> diff --git a/mm/truncate.c b/mm/truncate.c
> index b58ba940be474..803ee61ebf624 100644
> --- a/mm/truncate.c
> +++ b/mm/truncate.c
> @@ -374,6 +374,7 @@ void truncate_inode_pages_range(struct address_space *mapping,
>   	int		i;
>   	struct folio	*folio;
>   	bool		same_folio;
> +	pgoff_t		min_nrpages = mapping_min_folio_nrpages(mapping);
>   
>   	if (mapping_empty(mapping))
>   		return;
> @@ -395,6 +396,10 @@ void truncate_inode_pages_range(struct address_space *mapping,
>   	else
>   		end = (lend + 1) >> PAGE_SHIFT;
>   
> +	start = round_up(start, min_nrpages);
> +	if (end != (pgoff_t)-1)
> +		end = round_down(end, min_nrpages);
> +
>   	folio_batch_init(&fbatch);
>   	index = start;
>   	while (index < end && find_lock_entries(mapping, &index, end - 1,
> 

