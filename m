Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793334665;
	b=D5eq8gDjH+SW9jk+xq+e4ZytlS8RwxOeCfgCKX/yDigLg60HRccTd/3LcVswSZbGrXYI
	 XLyLsd4blZdJ2rzirNvthjyHX0iIMSSXXkRaWRPyjlP1d55TaW/rMTbv7Byp0xMty9d/C
	 ulhqgaXd089ytf00oCTjEFKMdZsjIrxYoMXmMV3tp3zUllf2tMCrZgUP+l0CqkVL05v2g
	 AJu1xvY6/KTGrnQFLoDxsUmANwkyhW2A2WKyNnwfip5W9XmxDRNszdzWUfD5LUjqSnnmR
	 kKNU7+UrOjrCrFvKGkkdUMnWAqGirwl7nwT27WG8QAKRLYqnRPQrumfzdP7sfLybjHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793334665;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4IW+eTP3qlFhNM2ajwGDdQt1qVWs4834B+J6XwQpvms=;
	b=YmNiUGD69AWzxXLTbto90qtZ2CkwCmi12ghvp6Dw+xqrbS/Vw8gzjuDCNLpu/PNzIoBv
	 91dK+SWQ7KDtUufdKHUFqizlXUgwDUKjly2nwftrmS0S0ekfpU6N1K9LGVy+3xyXmLE8r
	 D78LFBLaBAGhHcnLgkIgkxWh9xbLsXn1/4oRWUqBne5HXuinxfELxhW9R+Caujq0svUW7
	 b/9OtfIdDxKegb7UVY3gAkKrsQer9m72YbaM+ZQIHmVrYHH50f0UvNHRnsSoUTqESCQRN
	 U6Nu7CS/wWnDAMNjQo9cq5wG3oR/V7omzVLp5pLThrcwHwfDmDPfrN/VTOYSdbAHsFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHRLmm8t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8820A606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 04:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eHRLmm8t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 527CF1F000C1;
	Fri, 30 Oct 2026 04:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793334665;
	bh=4IW+eTP3qlFhNM2ajwGDdQt1qVWs4834B+J6XwQpvms=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=eHRLmm8tqPMW//AXrXY5DTpcZ5X24nfz4hCUds6P/c4j0RQZSnVRTVw/sf4fShl+6
	 b9hpNb9g7UsPsHg9J4lb7Ao8lsPz6euSZXaL1UeX2DOltH4WsvPPPEjFmaIdYdUbFO
	 UCRgmBFii4mMPj5L6bpqbyMQp7Sd7FkA8Cl1NkKvFtb5RhMz+aKgGh0+kL33odmvnS
	 Ey89o2M7yVxNAkN8jHq68pLWwt1D3GsvnZ6lmc3Qmp6vUBV8VsT0EdzvoHrFEodEFL
	 QOW8FAWO8gzANXL+Z/HW5uszLtcf3oNJTGRTTl+e/AlOP9+ErGgXEEUHp+3fJDxuHx
	 Lg5Jiozr0TIjw==
Message-ID: <8264bbea-10f9-448b-b88b-529c34ea2f9c@kernel.org>
Date: Fri, 30 Oct 2026 12:31:02 +0800
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
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, stable@kernel.org
Subject: Re: [f2fs-dev] [PATCH] f2fs: do f2fs_zero_post_eof_page for all the
 time
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261028050615.259268-1-jaegeuk@kernel.org>
 <c87b011c-08fa-4e65-8b22-a6bf5a2efd5a@kernel.org>
 <auIUOuuiz3rbwSuZ@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <auIUOuuiz3rbwSuZ@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/28/26 23:26, Jaegeuk Kim wrote:
> On 10/28, Chao Yu via Linux-f2fs-devel wrote:
>> On 10/28/26 13:06, Jaegeuk Kim via Linux-f2fs-devel wrote:
>>> This fixes xfstests/generic/794, since the issue is not related to the
>>> posix=strict mode only.
>>
>> Jaegeuk,
>>
>> Actually, I fixed this only in fsync_mode=strict because I don't see such
>> scenario (described in original patch) in Android:
>>
>>      Steps of generic/794:
>>      1. write 4096 bytes to file w/ 0x5a
>>      2. use fiemap to get PBA of first block in file
>>      3. truncate file to 4080
>>      4. umount; write 4096 bytes to file w/ 0x5a directly via PBA; mount

I don't remember there is any case writing via PBA across EOF in Android, let
me know if I missed something.

Ah, it seems a common issue, I can reproduce reading stale data w/ below testcase
which didn't write via PBA:

1. pwrite -S 0x5a 0 4096; fsync; sync
2. truncate 4080
3. Checkpoint without writing back data, then power cut. Two ways to cut power:
  - sysrq-b: f2fs_io checkpoint then echo b > /proc/sysrq-trigger, a real VM reset.
  - shutdown: f2fs_io shutdown 1, which checkpoints and drops dirty data.
4. After recovery, grow the file with truncate 8192, falloc 4096 4096, or pwrite @4096, then f2fs_io checkpoint, umount and mount.
5. Read [4080,4096).

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,

>>      5. extend filesize via
>>         a) append 4096 from offset 4096, or
>>         b) truncate 8192, or
>>         c) fallocate 4096 from offset 4096
>>      6. verify the gap is zeroed in memory [4080,4096)
>>      7. sync range 4096 from offset 4096; shutdown -f (flush meta before shutdown)
>>      8. umount; mount; verify [4080,4096) is zeroed or not.
> 
> I saw your comment and I think we should not connect posix=strict to who's
> using that. It was supposed to handle the myth of the recovery on rename().
> This sequence looks general which seems we should guarantee.
> 
>>
>> Maybe we should only enable fsync_mode=strict for 794 to let it pass?
>>
>> Thanks,
>>
>>>
>>> Cc: stable@kernel.org
>>> Fixes: 5eced87b7d19 ("f2fs: fix to zero post-EOF data when extending file size")
>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>>> ---
>>>   fs/f2fs/file.c | 14 ++------------
>>>   1 file changed, 2 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 8b4a7a9d7dbe..823df06ae0f2 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -74,15 +74,10 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
>>>   					loff_t new_size, bool lock, bool writeback)
>>>   {
>>>   	loff_t old_size = i_size_read(inode);
>>> -	bool strict =
>>> -		F2FS_OPTION(F2FS_I_SB(inode)).fsync_mode == FSYNC_MODE_STRICT;
>>>   
>>>   	if (old_size >= new_size)
>>>   		return 0;
>>>   
>>> -	if (!strict && mapping_empty(inode->i_mapping))
>>> -		return 0;
>>> -
>>>   	if (lock)
>>>   		filemap_invalidate_lock(inode->i_mapping);
>>>   	/* zero or drop pages only in range of [old_size, new_size] */
>>> @@ -90,14 +85,9 @@ static int f2fs_zero_post_eof_page(struct inode *inode,
>>>   	if (lock)
>>>   		filemap_invalidate_unlock(inode->i_mapping);
>>>   
>>> -	if (!writeback || !strict)
>>> +	if (!writeback)
>>>   		return 0;
>>> -	/*
>>> -	 * In fsync_mode=strict, when we expand an unaligned EOF size, we
>>> -	 * should zero post EOF data and writeback the data immediately,
>>> -	 * so that it can avoid exposing stale data after metadata flush
>>> -	 * and POR.
>>> -	 */
>>> +
>>>   	return do_zero_post_eof_page(inode, new_size);
>>>   }
>>>   
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

