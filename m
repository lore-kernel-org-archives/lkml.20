Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A723249BD80
	for <linux-kernel@vger.kernel.org>; Thu, 10 Sep 2026 14:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789049546; cv=none; b=ZVQu6wrMYK46vmrA15pydDo82ETCztYjRM7sQuuQfLdNE3uuRzJ/MHQf1dYfZ9VxXJKB1ZlBUTnVng0kpexCKOeHY+02l/s5VAkPRUer1OAbPDGT6UPA/3tjC3jJ6Y/Wkl+VRio+vxYHGQBIp6P7FCpGFZaPcwmUidVOR2KQrd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789049546; c=relaxed/simple;
	bh=0Mhh4OUnCgSLgw0dCoDJwchdD8Dvz9j909zdSSyHCeg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ZVVMsz747gYuekLTsWwaM8GSQWOddB6Zd9zTmWRuLsOr4d9CgE/0vJr9kTLg1FP9uEgfcOujPpJnqLbl/MII5z4/VymGPE4HpO3G9fxxO0EHgZZYAvm4vmYyW9Bps1q/aay34aciyVY8q2thAnqaCXn16LnM1AIKYIzfj7aLUQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DR6cm8ko; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DR6cm8ko"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE4A1F000FF;
	Thu, 10 Sep 2026 14:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789049545;
	bh=yktsf0ORBBGvD3SUCnSD4sWyXidehM6lXLw0baTYOAM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=DR6cm8ko/3qgt7iRmoOIc+GkqzbQjdop9yWq5Qik1mdngrStdgw91yb2SUbPXRgbW
	 +BwGaOl0FycosQqQyaUBgDbkqExHUPG+pOv2sSls+AsxWJg54mEnXl52PjWuCrreGi
	 hwCwDtwMH8OgDzuEjzEznCDdswRjeUj5abQ7ggKoPngUWt3BtZBfFdRcsxW0QRDuz7
	 n2TOMEkhjmrSdH8t1oY+Y4w6VHgCKAwBLDvc/SfIxmb3hLjbdI3UPxIzNjk6rWWrSW
	 u7T00RS1twz/70OYQ+4j4WksFSYOKY/C9f7gbGrGpx6iSrBeiVtAzffqbAPx7Ny/Q2
	 acKYLC0X1B4nQ==
Message-ID: <8b3df80c-2cf6-4331-89ac-4ae75edf5b40@kernel.org>
Date: Thu, 10 Sep 2026 22:12:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, jaegeuk@kernel.org, stable@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to handle race between
 truncate and writeback
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20260910022258.3308187-1-chao@kernel.org>
 <CAHJ8P3Kah8NTiSMsXdb1PF9yA59UE+MZTg8MkcYcH4OrVQVjQw@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CAHJ8P3Kah8NTiSMsXdb1PF9yA59UE+MZTg8MkcYcH4OrVQVjQw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/10/26 15:22, Zhiguo Niu wrote:
> Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
> 于2026年9月10日周四 10:24写道：
>>
>> From: Chao Yu <chao@kernel.org>
>>
>> fsstress reports a kernel BUG in f2fs_truncate_partial_cluster():
>>
>> kernel BUG at fs/f2fs/compress.c:1238!
>> RIP: 0010:f2fs_truncate_partial_cluster+0x292/0x2a0
>> Call Trace:
>>   <TASK>
>>   f2fs_truncate+0xf6/0x210
>>   f2fs_setattr+0x6b7/0x770
>>   notify_change+0x33b/0x520
>>   do_truncate+0xc2/0xf0
>>   vfs_truncate+0x153/0x1d0
>>   ksys_truncate+0x78/0xd0
>>   __x64_sys_truncate+0x16/0x20
>>   do_syscall_64+0xbe/0x540
>>
>> The root cause is that Thread A (truncate) and Thread B (background
>> writeback or fsync) can race as follows:
>>
>> Thread A                             Thread B
>> - f2fs_setattr
>>   - f2fs_truncate
>>    - f2fs_truncate_blocks
>>     - f2fs_truncate_partial_cluster
>>      - f2fs_is_compressed_cluster
>>        return 1
>>                                       - f2fs_write_cache_pages
>>                                        - f2fs_write_multi_pages
>>                                         - f2fs_write_raw_pages
>>                                          - f2fs_write_single_data_page
>>                                            dn.data_blkaddr != COMPRESS_ADDR
>>                                            (cluster converted to normal)
>>      - f2fs_prepare_compress_overwrite
>>       - f2fs_is_compressed_cluster
>>         return 0
>>       - return 0
>>      - f2fs_bug_on(sbi, err == 0): BUG!
>>
>> Writeback path does not acquire i_gc_rwsem or filemap_invalidate_lock.
>> When a compressed cluster fails compression during writeback, it is
>> overwritten with raw data blocks. If Thread A checked
>> f2fs_is_compressed_cluster() before the conversion, but calls
>> f2fs_prepare_compress_overwrite() after the conversion,
>> f2fs_prepare_compress_overwrite() returns 0 because the cluster is no
>> longer a compressed cluster.
>>
>> To fix this, remove the f2fs_bug_on() and retry checking the cluster status
>> when f2fs_prepare_compress_overwrite() returns 0, so that it can fall back
>> to f2fs_do_truncate_blocks() to handle it as a normal cluster.
>>
>> Cc: stable@kernel.org
>> Fixes: 3265d3db1f16 ("f2fs: support partial truncation on compressed inode")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/compress.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>> index ce88092d9ce2..e1cc7185428e 100644
>> --- a/fs/f2fs/compress.c
>> +++ b/fs/f2fs/compress.c
>> @@ -1222,6 +1222,7 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
>>          int i;
>>          int err;
>>
>> +repeat:
>>          err = f2fs_is_compressed_cluster(inode, start_idx);
>>          if (err < 0)
>>                  return err;
>> @@ -1233,11 +1234,10 @@ int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock)
>>          /* truncate compressed cluster */
>>          err = f2fs_prepare_compress_overwrite(inode, &pagep,
>>                                                  start_idx, &fsdata);
>> +       if (err == 0)
>> +               goto repeat;
> Hi Chao,
>   some comments here will be easier to understand？

Zhiguo, add comments in v2, thanks for the review.

Thanks,

> other LGTM
> Reviewed-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> thanks!
>>
>> -       /* should not be a normal cluster */
>> -       f2fs_bug_on(F2FS_I_SB(inode), err == 0);
>> -
>> -       if (err <= 0)
>> +       if (err < 0)
>>                  return err;
>>
>>          rpages = fsdata;
>> --
>> 2.49.0
>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

