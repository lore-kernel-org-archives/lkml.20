Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F5D1A9B24
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791596441; cv=none; b=JShFE7EOhI93HH9iVbbuQavJGia/m7nZNtUbpUdKqbeLFsp/TccWws0RpVMoG1KLCq+GPt2C8ykMsgCaY9nuMtfy/fUGPlA7SUA9EqHdD4Ejfq+FgYiafeg3o+fN0MilQ4l7+AREZUYmAag8Zd0PVhQSTOFmK9KNdSEfGqRb7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791596441; c=relaxed/simple;
	bh=OZXxkwKuE7TPWEAxiJ6eGeH0HquzS0Gq0UdVJYDCD+8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=u3ivQffBfJiJYpsDf03ufD0JtRlz8BsHdtYOVtzYcX8fa9iTK9hYpDc+9J9yZsvW5qcW6pHAUqBeTDOOlBpNJwuvK/IS8UmsjTU8A6CMJGmBnlXwAqZSHYTkDXibXN4K5+j7SYFLmdK8A60ubXpTiZ4I1bDtIGdJUETt20jQGMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TuVtSeFN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TuVtSeFN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191661F000FF;
	Sat, 10 Oct 2026 01:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791596440;
	bh=SZl4SnArjiyXWWZ9ZgVuzgd9w33IJ6HXnd3SOcZyUFA=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=TuVtSeFNT/gJffAaYNL/Ilcpd6AwMuOY2Tzzt4aGBSYcT9twshC03XF6yybQW+thv
	 s0pm/3syuVqdqGksDn19C6GRsWeoPSBF1HfEt8gIoehF82IgP32y+TrVUV31s9jS52
	 hhvB/Pz8vXqLnk9pcyJ3DStlltNIWwYjUrrGGctTtKyl+joR1kUqHb4RSLB7n/zXa6
	 oRBI44N8mDgRowL0l0k9vRYTlEyNcWd99afSL0aJstyDT5MiZtpNwkW0EmfpFZE0M+
	 sp0+duEbKdv22K9suEL8dhPka4hvBwQ1UShuisU6W23Sje5Rq6iQPhQf1zaGh8EJk7
	 yGTiTIFrYU/fg==
Message-ID: <bc41a1a3-773f-4c6b-8c47-9eb622127373@kernel.org>
Date: Sat, 10 Oct 2026 09:40:37 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: disallow mmap write and data-modifying
 fallocate on atomic files
To: Daeho Jeong <daeho43@gmail.com>
References: <20261002171704.3652570-1-daeho43@gmail.com>
 <63812000-4677-4af6-a3e1-4e87e39f0d88@kernel.org>
 <CACOAw_w5uXiYqGObti+uiWwJSeaNCZc6+t3j2yopL-PLf226=A@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_w5uXiYqGObti+uiWwJSeaNCZc6+t3j2yopL-PLf226=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 10/9/26 23:05, Daeho Jeong wrote:
> On Fri, Oct 9, 2026 at 1:35 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 10/3/26 01:17, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> Stores through a shared writable mapping and fallocate with
>>> FALLOC_FL_PUNCH_HOLE, FALLOC_FL_ZERO_RANGE, FALLOC_FL_COLLAPSE_RANGE or
>>> FALLOC_FL_INSERT_RANGE do not go through ->write_begin, so they bypass
>>> the COW inode and modify the original inode directly. Reject them while
>>> the file is in atomic write mode, as fallocate already does for pinned
>>> and compressed files. A write fault gets SIGBUS and fallocate gets
>>> -EOPNOTSUPP.
>>>
>>> fallocate without these flags only preallocates blocks and stays
>>> allowed.
>>>
>>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>>  fs/f2fs/file.c | 10 ++++++++--
>>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index ef4d218e694..56c686b8580 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -140,6 +140,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
>>>               return VM_FAULT_SIGBUS;
>>>       }
>>>
>>> +     /* mmap stores bypass the COW inode and would break atomicity */
>>> +     if (f2fs_is_atomic_file(inode))
>>> +             return VM_FAULT_SIGBUS;
>>
>> Will we suffer race issue due to the check w/o lock?
>>
>> Thanks,
> 
> Hi Chao,
> 
> Yes, there is a race with f2fs_ioc_start_atomic_write().
> 
> page_mkwrite cannot take inode_lock, because the lock order is i_rwsem
> -> mmap_lock (e.g. fiemap copies to user under inode_lock). So v2 will
> use invalidate_lock instead:
> 
> f2fs_ioc_start_atomic_write() holds filemap_invalidate_lock() from the
> flush until FI_ATOMIC_FILE is set.
> f2fs_vm_page_mkwrite() rechecks the flag after
> filemap_invalidate_lock_shared(), which it holds until the folio is
> dirtied.
> 
> If you are okay with this, I'll send v2.

Daeho, looks fine to me, please go ahead. :)

Thanks,

> 
> Thanks,
> 
>>
>>> +
>>>       if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
>>>               err = -EIO;
>>>               goto out;
>>> @@ -2113,9 +2117,11 @@ static long f2fs_fallocate(struct file *file, int mode,
>>>
>>>       /*
>>>        * Pinned file should not support partial truncation since the block
>>> -      * can be used by applications.
>>> +      * can be used by applications. Atomic files should not either, since
>>> +      * these modify the original inode directly and break atomicity.
>>>        */
>>> -     if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode)) &&
>>> +     if ((f2fs_compressed_file(inode) || f2fs_is_pinned_file(inode) ||
>>> +          f2fs_is_atomic_file(inode)) &&
>>>               (mode & (FALLOC_FL_PUNCH_HOLE | FALLOC_FL_COLLAPSE_RANGE |
>>>                       FALLOC_FL_ZERO_RANGE | FALLOC_FL_INSERT_RANGE))) {
>>>               ret = -EOPNOTSUPP;
>>

