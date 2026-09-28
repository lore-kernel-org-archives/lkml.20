Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF173B388D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 07:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790579758; cv=none; b=gHxepobh+HwbXnLC4jXgKmvK9OdfgP5B/bFejGKHYmpigiE78Kk6zoVqLkq+oXfU3A+vKOfH4jzTiHikrRki8YW2w/Vj8z0j/0YJyK6SNJv3KtyQ4d6elcyjt6rdX5QUiizZLIhjIPzljxG1gTJ9SAX6UKUjH/iYT7mtdNFonJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790579758; c=relaxed/simple;
	bh=D3TQgbHAa7bgHpbvllPTM89T+3o9FeErlVh1fyAHicQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mi95ZftpbHbw/B1qe0YBXw6cRy1hpI9JLELdVL/Tmr+utDUGZRIjkIrv2/rp5dP4qCbUKnLz0vUKY141w1/mARlt7kKUab9WiflL6HywsDohtJWiab57xaEO98u4xoGttLYpbJ1IfzMD7xW9sOmw3zqaO10gY+gt9cCWHpdX9cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TYeZb55Q; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TYeZb55Q"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d91ede8035so22961175ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 00:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790579756; x=1791184556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DXi+I4l8BrNGlWdGQtDQxjfoQArazMlTYKleiNGJPC8=;
        b=TYeZb55QIyKr5qqu6Tsv3EWt/oZcIoXDhyDURAK1GUSWMTIbaXE8H2e4k/IhI5jVrE
         W1oHgL65Y1JEOPEEuyxQFWwlOeCvq3I+Ab4ZeR1uL6X5QY95FCjfnKZD1nG2Bn8A5dmA
         GjidrFAMzAqpjz25cUGiirx77iR/XYQt2WVCi6GHWhSF9DSRNRwJmhBoMgmsJ9xuoH+v
         pWKueI5khS0ocCpxoD921peZGWnrHxN0UQ+D8T8j1LP4qu25QfvbnOOcSCIOaf4LUM/1
         ti2tF6s4d+j6kmDPqcJy5QMtT8a29+B/KwRi7wpQDpqQDU5f6rutNQTZ7OgVcjMQe8h3
         vADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790579756; x=1791184556;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DXi+I4l8BrNGlWdGQtDQxjfoQArazMlTYKleiNGJPC8=;
        b=vLq7PA6MtJadgA1ljZDwSEa/bOa+w/v/YGQkkqRBQL0NxnDVyGWB5qoYFrNLYCwh40
         omiCyYmChmv29CNE3/fXG7aTuTtQGB9RB5OLOsGdoMn9z7VSqkhlu3WalHT6A+yoPcCi
         bunjZA0VRbdcX0kb0BMeyGfVxE0WoRY4OFrdaRiVBloRW6H+PKb9G1FIPSrF3tzzwE8/
         SLz4OWfLEQF+EbCLgJ0RR8U1F5wz5fcloG5420Lhbi3n9PPc9eXDM8KqyEs7jMTzf37G
         MKGLb0xRl6qHMGUBKiBPXY65ywuJED+4Zke4dwbi9d0f9jFv9dw4i41nrpotFjFxwCiY
         2e1w==
X-Forwarded-Encrypted: i=1; AKwUvBzqpoVanzmyC4DigaeZGRnOxPpO42VfKd8XuglthloIyF/vKIH0L6CakG8UWLWy9+MH7Yj21hA9VTS1Mh4=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1+gBAtD6nDwxj905v4r1gQGo59loVf64A5kGVwG/alpnz7i/I
	5T9MsWC/+DQWp1rtFWc6JEYSuJ6OEYN007hhhAXsPmXpJ0eajj3ciHS8
X-Gm-Gg: AYBFou0uodGws2YF87FRvqH3Ss0shtR/QO5mPbQqA0Q/quoeZltJLHqdZneZlridv/R
	ho0c5kZ/nGwoLw7VPNLE40tBjdOXu4IrJgON8Dv2Digh6QvMiai3OWOVoI1DCwk0ZjXnSaV6wdG
	n2H2CWS2UOmyqpHp+QSop3Qh4N0JqIfzLS2ei7hYskZucvih3loA0sgLGbgh+0lz7/cGfT4HK9Q
	xemfBPd01gMEU4xPAmtd3Bjs99TucmkA/boNM6YD4KgzjlgMwYWCj6w4FPKV13/bfmosxp+jZk2
	nt4H9l7Oppm7Wr27daPuHOdGvZ1os/ObTP46E81ym4yE/lORBwxjrl9FCaNxfSAWi3Doawz9s40
	BN3zLy5JWrzpk06OBl12f/jw0D8J6YUBnaXQUE1uRJUEl9uwy2jiD7AMbQJj29JaXvR03doFAoJ
	JhPynkk/pTemSIKgkbPj+0r3Wl5+lfY0er5lo3kSWCA7iKxCoq+IEM2Q4xP5palliVCMey1IrrN
	8mFPTYMuxyLd4/8Hn4=
X-Received: by 2002:a17:90b:48ce:b0:3a2:b490:c459 with SMTP id 98e67ed59e1d1-3a2b490c7cbmr2149213a91.25.1790579756142;
        Mon, 28 Sep 2026 00:15:56 -0700 (PDT)
Received: from [100.125.248.95] ([124.70.231.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0974ec5d0sm27622396a91.4.2026.09.28.00.15.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 00:15:55 -0700 (PDT)
Message-ID: <7993c203-3172-455c-a3ac-a27f195fc1b5@gmail.com>
Date: Mon, 28 Sep 2026 15:15:21 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/31] ext4: recheck extent status tree before block
 allocation
To: Ojaswin Mujoo <ojaswin@linux.ibm.com>, Zhang Yi <yi.zhang@huaweicloud.com>
Cc: linux-ext4@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, tytso@mit.edu, adilger.kernel@dilger.ca,
 libaokun@linux.alibaba.com, jack@suse.cz, ritesh.list@gmail.com,
 djwong@kernel.org, hch@infradead.org, yi.zhang@huawei.com,
 chengzhihao1@huawei.com, yangerkun@huawei.com, wangkefeng.wang@huawei.com,
 yukuai@fnnas.com
References: <20260903123543.2302999-1-yi.zhang@huaweicloud.com>
 <20260903123543.2302999-6-yi.zhang@huaweicloud.com>
 <arUj-7QI2U12y1i-@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Content-Language: en-US
From: Zhang Yi <yizhang089@gmail.com>
In-Reply-To: <arUj-7QI2U12y1i-@li-dc0c254c-257c-11b2-a85c-98b6c1322444.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/2026 9:22 PM, Ojaswin Mujoo wrote:
> On Thu, Sep 03, 2026 at 08:35:17PM +0800, Zhang Yi wrote:
>> From: Zhang Yi <yi.zhang@huawei.com>
>>
>> After acquiring i_data_sem in write mode, recheck that the mapping
>> found via the extent status tree or disk query has not changed. A
>> racing truncate may have trimmed the extent between the earlier lookup
>> and the write lock acquisition, since writeback does not hold i_rwsem
>> or the folio locks covering the full extent. This could cause
>> ext4_map_create_blocks() to allocate blocks beyond the truncated range,
>> potentially leading to quota leaks in the upcomming iomap buffered
>> writeback path since the iomap writeback infrastructure caches extents
>> beyond the folio range.
>>
>> Therefore, if we find a valid extent and the sequence number has
>> changed, retry the entire lookup to obtain the correct trimmed mapping.
>>
>> Suggested-by: Jan Kara <jack@suse.cz>
>> Signed-off-by: Zhang Yi <yi.zhang@huawei.com>
>> ---
>>   fs/ext4/inode.c | 16 ++++++++++++++++
>>   1 file changed, 16 insertions(+)
>>
>> diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
>> index 84991fe99071..b71b1d2588ae 100644
>> --- a/fs/ext4/inode.c
>> +++ b/fs/ext4/inode.c
>> @@ -734,6 +734,7 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   	else
>>   		ext4_check_map_extents_env(inode);
>>   
>> +create_retry:
>>   	/* Lookup extent status tree firstly */
>>   	if (ext4_es_lookup_extent(inode, map->m_lblk, NULL, &es, &map->m_seq)) {
>>   		if (ext4_es_is_written(&es) || ext4_es_is_unwritten(&es)) {
>> @@ -784,6 +785,8 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   	down_read(&EXT4_I(inode)->i_data_sem);
>>   	retval = ext4_map_query_blocks(handle, inode, map, flags);
>>   	up_read((&EXT4_I(inode)->i_data_sem));
>> +	if (retval < 0)
>> +		return retval;
> 
> Hey Zhang, I think there's a slight change in behavior that we return if
> the query fails now. Earlier we would have still tried the create_blocks
> call and, in case of transient errors like ENOMEM, might have suceeded.
> I don't think it's that big of a deal though.
> 
> Rest looks fine and I agree with your reply to Sashiko, I think we
> can tweak those things if we ever encounter a livelock.
> 
> Feel free to add:
> 
> Reviewed-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
> 
> Also, if you don't mind can you add
> 
> Link: https://lore.kernel.org/linux-ext4/b0781809-4759-4e12-be17-71555b764f48@gmail.com/
> 
> (or the call trace) to the next version as it explains the issue pretty well.
> Looking at these things later takes some time to recall everything and
> such traces help a lot.
> 

Hi, Ojaswin!

Thank you for the review and suggestion, this makes sense to me. I will
add this link in the next iteration.

Thanks,
Yi.

> Regards,
> ojaswin
> 
>>   
>>   found:
>>   	if (retval > 0 && map->m_flags & EXT4_MAP_MAPPED) {
>> @@ -820,6 +823,19 @@ int ext4_map_blocks(handle_t *handle, struct inode *inode,
>>   	 * with create == 1 flag.
>>   	 */
>>   	down_write(&EXT4_I(inode)->i_data_sem);
>> +
>> +	/*
>> +	 * Check the validity of the mapping found via the extent status
>> +	 * tree or the disk query. A racing truncate may have changed the
>> +	 * extent, since writeback does not hold i_rwsem or the folio locks
>> +	 * covering the full extent.
>> +	 */
>> +	if (map->m_seq != READ_ONCE(EXT4_I(inode)->i_es_seq)) {
>> +		up_write(&EXT4_I(inode)->i_data_sem);
>> +		map->m_flags = 0;
>> +		map->m_len = orig_mlen;
>> +		goto create_retry;
>> +	}
>>   	retval = ext4_map_create_blocks(handle, inode, map, flags);
>>   	up_write((&EXT4_I(inode)->i_data_sem));
>>   
>> -- 
>> 2.52.0
>>

