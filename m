Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2960346D091
	for <linux-kernel@vger.kernel.org>; Tue, 22 Sep 2026 11:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790076724; cv=none; b=emIStr5VEqOSGYWc+74yjdpS45fLXw7iVhbXnyBpMDPF6KV60yHe2gGi1CUV6poikLNnE+lX0W5osJj/NZBKZw1dhDXtn4rYdOGdN4ZMBtql0qFiHtiGuUuG54YCxMxIkTokOQsAh4pEuJBwmwCVQPWrmJp0X040AshblusZafk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790076724; c=relaxed/simple;
	bh=W6dyptcdYv1AljCpegANpHD4B/lZHl86KKt8dL4PKEw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OwewztfHjH/YEEDSV83uHqcFY4VQdv1MrhLyxD7j9IBckqjr6F8etYN9Ab0Gxi65rNi6ZQxEvT3czwE5CAG5ZKAh4bnkorlTfD+98XaxATV526MP5vATT9UMMX6kycNwVtaLPn8e6UkyuG0p/CKtQJUM4bZc/c+KP3TE5OqBNsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=qjypkmlg; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="qjypkmlg"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790076706; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=7DnIfBYPEwCKwG6O3NEJtkRmI4QLxdhkaqD/KlGxkOo=;
	b=qjypkmlgJCrHzyGBEoi2u5JLqHAYBHvLZakl1ON767p1Vo9xI94E8yPaYCgxCcDbY+9z5XPFqHsBtqlQ48hh+lLfBAgVcvYl9v17JeC+RLexkRVUSa2Kbdze3isd/eO6wD8YFjGurwZnGDJnsVO/VDdL1cBjSMsg3IxeCSaoAcM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=5;SR=0;TI=SMTPD_---0XBTk8qF_1790076705;
Received: from 30.221.129.227(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XBTk8qF_1790076705 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 22 Sep 2026 19:31:45 +0800
Message-ID: <3a0f5c01-e782-4303-95ba-f7f475d1b081@linux.alibaba.com>
Date: Tue, 22 Sep 2026 19:31:44 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] ocfs2: assertion failure in _ocfs2_free_suballoc_bits on a
 crafted image
From: Joseph Qi <joseph.qi@linux.alibaba.com>
To: CJ <firefly0158@163.com>
Cc: "ocfs2-devel@lists.linux.dev" <ocfs2-devel@lists.linux.dev>,
 mark@fasheh.com, jlbec@evilplan.org, linux-kernel@vger.kernel.org
References: <6a202941.4a55.1a0c7aeef7d.Coremail.firefly0158@163.com>
 <226c8e43-c943-409d-ae6e-f2f05de6643f@linux.alibaba.com>
In-Reply-To: <226c8e43-c943-409d-ae6e-f2f05de6643f@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It seems this BUG has been fixed in:
https://lore.kernel.org/ocfs2-devel/20260901125221.1634686-1-joseph.qi@linux.alibaba.com/T/#t

And now they have already been included in linux-next. Please confirm.

Thanks,
Joseph

On 9/22/26 5:17 PM, Joseph Qi wrote:
> Out-of-date ocfs2-devel maillist, resend to ocfs2-devel@lists.linux.dev.
> 
> Joseph
> 
> On 9/22/26 1:55 PM, CJ wrote:
>>
>> Hi,
>>
>>
>>
>> I am reporting an issue triggered by a syzkaller reproducer on Linux
>> 7.3.0-rc2. The issue is reproducible with HEAD commit
>> df2908090cda368b01ff43709f51890076c56157.
>>
>>
>> The reproducer mounts a crafted ocfs2 image with commit= options and then
>> removes a directory, which makes ocfs2 evict the inode and release its
>> suballocator bits.
>>
>>
>> While freeing the bits, _ocfs2_free_suballoc_bits() reads the group
>> descriptor for the target group and checks that the range it is about to
>> clear fits within the group's declared bit count. The check fails and
>> BUG_ON() terminates the kernel. The call path is ocfs2_evict_inode() ->
>> ocfs2_wipe_inode() -> ocfs2_remove_inode() -> ocfs2_free_dinode() ->
>> _ocfs2_free_suballoc_bits(), reached from vfs_rmdir() in the unlinkat
>> syscall context.
>>
>>
>> This looks like the on-disk group descriptor and the suballocator chain
>> disagreeing about the size of the group, so the release range computed from
>> the chain falls outside it. Since the image is untrusted input, reporting
>> the inconsistency as a filesystem error instead of an assertion would keep
>> the kernel alive. I have not determined which of the two metadata sources
>> carries the inconsistent value.
>>
>>
>> This failure was reported earlier against the linux-6.1 longterm series at
>> https://syzkaller.appspot.com/bug?extid=3b664d98a77a329be77e, and the
>> reproducer below is the one from that report. It still reproduces on the
>> tested mainline kernel.
>>
>>
>> Reproducer:
>>
>>
>> syz reproducer:   https://pastebin.com/raw/9vVANXgZ
>> console output:  https://pastebin.com/raw/AZMvqBm0
>> kernel config: https://syzkaller.appspot.com/text?tag=KernelConfig&x=6a5cbd268406bf43
>>
>>
>> Kernel:
>>
>>
>> HEAD commit: df2908090cda368b01ff43709f51890076c56157
>> git tree: mainline
>> kernel version: 7.3.0-rc2
>> tested tag: v7.3-rc2 (annotated tag object 5e036ce12de91c6fd674dad33b169c6150be2a7a)
>>
>>
>> Let me know if you need more details or testing.
>>
>>
>> Best regards,
>> Changjian Liu 
> 

