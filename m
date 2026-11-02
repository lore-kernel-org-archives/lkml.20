Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793588756;
	b=VD5f3FGBvrr+nrdl7ua4Q0WDqG9l+AlqiLlirVaBoBwsi9Yd9A/G3nyPZTjB/FoTcVSY
	 hOQ50Jud9ZsZ/pEXav6hZkS96smqVk7VuZtEmhACHPhDPmyMMbSMEd/H7CDHC1mj3J4TZ
	 ezQr1svUrgPVyQ3RWCvoz+tDDOsDpTnfeaVSWIgK21JcxEREviMTOBDSqznwCPOSZOiDs
	 p7hzaaoVcQ7aa2+xG0hM+kp++KhF5sacUydHTLBkIv7tqcaXM8nmVDZOR4BDRWe5FvY3q
	 rSeMf87A0/091sjDPLpIlJNdI6PjPzHmYtaT/AfE4fOJyB1zW9gVjsyQgyFLgAWYQKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793588756;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=A/6+kBlzwlsk4cBSFQS9p/QrJg3Xfn4u3eXyo65yo88=;
	b=3qo8HCMp7dUZRTdFo0ycIbSctBXgYJXGVwbwQZIf24WZ9LV1yaCBMRpMLNRohKJt/+2M
	 5b2t5Qbo9qdyDnYpnpq2ueGvoX4BP/HYCMm7arqm4I3jktM6SxFA4K0FfGYGGwiiqyQX8
	 Xa6pDHkp84CGy48WdHMLRK/+7WcxS/QTY1b4ZrhdUnXnWzmuXL1C7aSvhdFb0Lks9ZoNN
	 sv7qmcPplHis4VdjU8q+sb1Ywwwnz2eDGn0W7cOREf9IalMG6i/LTV0tZUL0wb1jWxMeO
	 GUVKPmWiMXl3FLD3+8WyZbEoc89VGd0pkb/inROegA7KrMLaUOKsf7HxIy0EgL62RrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1cQ0jYL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B87D606A32D
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 03:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f1cQ0jYL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82C8B1F000C1;
	Mon,  2 Nov 2026 03:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793588756;
	bh=A/6+kBlzwlsk4cBSFQS9p/QrJg3Xfn4u3eXyo65yo88=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=f1cQ0jYLxgvvEoDciMRRhDMuwurH6cNVfo+3zRDujWLmtMTfKd1TyH4SDkP7YZdth
	 /SoTpOxmAPxtH6/p0+WK23cH/2/GLseCKUvlqDjsv4aMAwOQJ4pSAAgLOd/BVL+cLu
	 30XbMM9spPAaNkVtgh/ZxhsthhZYCWlYY4O3c4dRMn8eSg5Lnn/Xb6CWEF+e62zp3H
	 1Q/7PItcpwYizNCvRMLH3TB1bFtN3LObFsgSN80XAP8WrC4/pDtHDLGJBWabMiyGwP
	 YuhRmudJq4I2m+4nn6f9Nm8pWsXfvyydYh4Yj5N53UG4AitZ8HDgIgH0Mdy5pzeIkt
	 rl9jKhKC+m1mA==
Message-ID: <6b95dd7b-4e49-4c7d-a3d2-70341e183289@kernel.org>
Date: Mon, 2 Nov 2026 11:05:52 +0800
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
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com
Subject: Re: [PATCH] f2fs: reject mount when block_count exceeds device
 capacity
To: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20261030111112.20953-1-Dmitry.Chumachenko@cyberprotect.ru>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261030111112.20953-1-Dmitry.Chumachenko@cyberprotect.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/30/26 19:11, Dmitriy Chumachenko wrote:
> During fuzz testing, the following issue was discovered.
> 
> INFO: task kworker/u9:2:981 blocked for more than 122 seconds.
>        Not tainted 7.1.0-rc4-00103-ge94869f14310 #59
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u9:2    state:D stack:25800 pid:981   tgid:981   ppid:2      task_flags:0x4208060 flags:0x00080000
> Workqueue: writeback wb_workfn (flush-7:0)
> Call Trace:
>   <TASK>
>   __schedule+0x122f/0x6530
>   rt_mutex_schedule+0x96/0xe0
>   __rt_mutex_slowlock_locked.constprop.0+0x13bd/0x3280
>   rwbase_write_lock+0x5df/0x720
>   f2fs_down_write_trace+0xc8/0x320
>   f2fs_balance_fs+0x6ee/0xa50
>   f2fs_write_inode+0x5e4/0x15a0
>   __writeback_single_inode+0xcda/0x1360
>   writeback_sb_inodes+0x767/0x1d90
>   __writeback_inodes_wb+0xf8/0x2d0
>   wb_writeback+0x723/0xb90
>   wb_workfn+0x8e6/0xc10
>   process_one_work+0xa0e/0x1980
>   worker_thread+0x5ef/0xe50
>   kthread+0x370/0x450
>   ret_from_fork+0x72b/0xd50
>   ret_from_fork_asm+0x1a/0x30
>   </TASK>
> 
> The superblock declares a block_count larger than the backing device, but
> sanity_check_raw_super() validates block_count only against segment_count
> and never against the device size, so the oversized filesystem mounts and
> its main area extends past the end of the device.
> 
> On the first fallocate(), f2fs_balance_fs() runs foreground GC, which
> selects a victim segment located beyond the device. The blocks are valid
> per on-disk metadata, so is_alive() accepts them and do_garbage_collect()
> keeps issuing reads past the end of the device without making progress,
> while holding sbi->gc_lock. Writeback and sync then block on gc_lock
> indefinitely, producing the hung task above.
> 
> This only affects single-device setups: on a multi-device volume
> block_count is the whole-filesystem total and legitimately exceeds the
> primary device, so the check is restricted to single-device images and
> compares block_count against the backing device capacity.
> 
> Fixes: aff063e266cb ("f2fs: add super block operations")
> Reported-by: syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
> Signed-off-by: Dmitriy Chumachenko <Dmitry.Chumachenko@cyberprotect.ru>
> ---
>   fs/f2fs/super.c | 7 +++++++
>   1 file changed, 7 insertions(+)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index fabcafafabf1..ba484a32f292 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -3445,6 +3445,13 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
>   			  segment_count, le64_to_cpu(raw_super->block_count));
>   		return -EFSCORRUPTED;
>   	}
> +	if (!RDEV(0).path[0] &&

It needs to cover multiple device case as well? can you please do that?

> +	    le64_to_cpu(raw_super->block_count) > sb_bdev_nr_blocks(sbi->sb)) {

static inline u64 sb_bdev_nr_blocks(struct super_block *sb)
{
	return bdev_nr_sectors(sb->s_bdev) >>
		(sb->s_blocksize_bits - SECTOR_SHIFT);
}

- f2fs_fill_super
  - read_raw_super_block
   - sanity_check_raw_super
    - sb_bdev_nr_blocks
    : access s_blocksize_bits
  - sb_set_blocksize
  : update s_blocksize_bits

So, update like this?

	u64 dev_blocks = bdev_nr_bytes(sbi->sb->s_bdev) >>
			le32_to_cpu(raw_super->log_blocksize);

	if (le64_to_cpu(raw_super->block_count) > dev_blocks) {
		f2fs_info(sbi, "block_count (%llu) exceeds device size (%llu blocks)",
		le64_to_cpu(raw_super->block_count), dev_blocks);
		return -EFSCORRUPTED;
	}

Thanks,

> +		f2fs_info(sbi, "block_count(%llu) exceeds device capacity(%llu blocks)",
> +			  le64_to_cpu(raw_super->block_count),
> +			  (unsigned long long)sb_bdev_nr_blocks(sbi->sb));
> +		return -EFSCORRUPTED;
> +	}
>   
>   	if (RDEV(0).path[0]) {
>   		block_t dev_seg_count = le32_to_cpu(RDEV(0).total_segments);

