Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB7A3CF213
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787900820; cv=none; b=dZSBRE38QC6ZKXugtLaakOtOqkr5LU2qd49nDrh2UcfGtyYHNiZtBNTqVULfpecOiaXx5jnxKyNUoCSHreHeLpLb/7H5KbnVbIicn2yCnyrVripMP2x0Y2QHk2H/RbVUtps+ahcE6IP+PiP12rkxM8nimMvZ5mUxDynGyLwSPTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787900820; c=relaxed/simple;
	bh=q+uUWKbteVHBNsrmiZDt9jvkxpBQwUM/isMMROqJv4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyMofzRk3VDf8kF4ch3qhPDxuiauO+8vC6IIh5Jd8IVRI1+GTlfGfhTscbLhoGvfIABIkMI55Q+q/8i0Yngik1t1F9W/oUKJMNK725pgyGAm5FmaqxaS9MNGBknm/wmu+PHbHDjioY+CA/f5asJkwIxiwpYMYSCH8lbmUZJG/LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=JY/QC6IR; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="JY/QC6IR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1787900815; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dq/lDqOIiqJ2S0HN9ku9JoDDbkgW2wlaSm8NvGTXkD0=;
	b=JY/QC6IRKzr0gTIh20CYcpH1pKelWcqeUc8gv5ey8zJkmzZY+MBkYL5lv3SSumyV0aJg5Wdh91t/owFivso2Czne9aX+PkmVtl51LQBY9nvL3sZ0Qzm7yFKffnD7hY37i5j80Gg/EIlsZ/Ji1J71p+W5d/tCQJltuUZv8yg31vI=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R341e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045133197;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=6;SR=0;TI=SMTPD_---0X9llYsI_1787900814;
Received: from 30.221.129.54(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0X9llYsI_1787900814 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 28 Aug 2026 15:06:54 +0800
Message-ID: <b0c3117c-5fb4-4cce-b29f-cfd72a3f93bd@linux.alibaba.com>
Date: Fri, 28 Aug 2026 15:06:53 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: defer suballocator block group reclaim to
 workqueue
To: Heming Zhao <heming.zhao@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Mark Fasheh <mark@fasheh.com>,
 Joel Becker <jlbec@evilplan.org>, ocfs2-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260827124313.2692416-1-joseph.qi@linux.alibaba.com>
 <apEeXAAo1wd5E5Or@p15>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <apEeXAAo1wd5E5Or@p15>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/28/26 1:47 PM, Heming Zhao wrote:
> On Thu, Aug 27, 2026 at 08:43:13PM +0800, Joseph Qi wrote:
>> When the last bit in a suballocator block group is freed,
>> _ocfs2_free_suballoc_bits() reclaims the group back to the global
>> bitmap.  The reclaim takes inode_lock() on the global bitmap inode
>> while running inside the freeing transaction, adding a lock
>> dependency of
>>
>>   j_trans_barrier -> global bitmap inode i_rwsem
>>
>> This forms a circular dependency with paths such as
>> ocfs2_shutdown_local_alloc(), which take the global bitmap inode
>> lock before starting a transaction:
>>
>>   Task1 (dealloc):
>>     ocfs2_run_deallocs
>>       ocfs2_free_cached_blocks
>>         ocfs2_start_trans
>>           down_read(j_trans_barrier)
>>         _ocfs2_free_suballoc_bits
>>           _ocfs2_reclaim_suballoc_to_main
>>             inode_lock(main_bm_inode)  <- wait on Task2
>>
>>   Task2 (dismount):
>>     ocfs2_shutdown_local_alloc
>>       inode_lock(main_bm_inode)
>>       ocfs2_start_trans
>>         down_read(j_trans_barrier)  <- wait on Task3
>>
>>   Task3 (ocfs2cmt):
>>     ocfs2_commit_cache
>>       down_write(j_trans_barrier)  <- wait on Task1's handle
>>       jbd2_journal_flush
>>
>> Task1 waits for Task2's inode_lock(), Task2 waits for the
>> j_trans_barrier down_write() held by ocfs2cmt, and ocfs2cmt waits
>> for Task1's running transaction to commit - a real deadlock,
>> observed with aio-stress direct IO writes racing dismount.
>>
>> Fix it by deferring the reclaim to the per-superblock ocfs2_wq
>> workqueue, so the freeing transaction no longer takes the global
>> bitmap inode lock.  The worker re-checks under the suballocator
>> locks that the block group is still fully freed (it may have been
>> allocated from again in the meantime), takes the global bitmap
>> inode locks before starting its own transaction, and performs the
>> same suballocator cleanup and space return.  The inode lock order
>> (suballocator inode -> global bitmap inode) is consistent with the
>> existing "inode lock before transaction" order, breaking the cycle.
>>
>> Reclaim work can still be queued late in dismount, e.g. when orphan
>> dir recovery frees inode bits, so both ocfs2_dismount_volume() and
>> the mount error path flush ocfs2_wq right before the journal is
>> shut down to make sure no reclaim work is left running.  The worker
>> also bails out if the journal is already gone.
>>
>> Tested with the ocfs2 testsuite (including aio-stress direct IO)
>> and umount/mount cycles on a CONFIG_PROVE_LOCKING kernel: the
>> circular locking dependency is gone and freed block groups are
>> still returned to the global bitmap.
>>
>> Fixes: 4a54331616b3 ("ocfs2: give ocfs2 the ability to reclaim suballocator free bg")
>> Assisted-by: Qoder:Qwen3.8-Max
>> Signed-off-by: Joseph Qi <joseph.qi@linux.alibaba.com>
>> ---
>>  fs/ocfs2/ocfs2.h    |   5 ++
>>  fs/ocfs2/suballoc.c | 202 +++++++++++++++++++++++++++++++++++++-------
>>  fs/ocfs2/suballoc.h |   2 +-
>>  fs/ocfs2/super.c    |  12 +++
>>  4 files changed, 191 insertions(+), 30 deletions(-)
>>

......

>> diff --git a/fs/ocfs2/super.c b/fs/ocfs2/super.c
>> index c62e389d4dd6..c1aafbb9500a 100644
>> --- a/fs/ocfs2/super.c
>> +++ b/fs/ocfs2/super.c
>> @@ -1779,6 +1779,9 @@ static int ocfs2_mount_volume(struct super_block *sb)
>>  	if (osb->local_alloc_state == OCFS2_LA_ENABLED)
>>  		ocfs2_shutdown_local_alloc(osb);
>>  	ocfs2_release_system_inodes(osb);
>> +	/* Drain pending suballoc reclaim work before the journal goes away */
>> +	if (osb->ocfs2_wq)
>> +		flush_workqueue(osb->ocfs2_wq);
> 
> The flush_workqueue() calls ocfs2_get_system_file_inode() to grab main_bm_inode.
> However, after ocfs2_release_system_inodes(), all the cached system inodes are gone,
> And the _ocfs2_get_system_file_inode() uses osb->sys_root_inode, which is already
> freed by ocfs2_release_system_inodes(). So we should move the
> flush_workqueue() calls to before ocfs2_release_system_inodes().
> 

Thanks, sashiko also has ponited out this issue.
I've fixed in v2 and now it is under testing. Will send out later.

Thanks,
Joseph

