Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792724561;
	b=MEFPIyGnvbLg7YshK8lnW4a4DdY10NTik1k7SLCc+119dzPFKDIveSvUjnn7CVIv6T+4
	 GV6pbFPfxpjdg/gwWYX6cRLJ7ZkiDJNi1T1qfKCnasL2cnE/WgzYjEjr7Zv/D7XYplb07
	 jiyfLIA6LhZHMNl5YHZ8UvSf2GToPB0WhSjMr3nWhGvoFgSWLm2sFhzv+mOUIQpS2F6+g
	 btemO5S8JTliDQeZw0fDZKtDB0+NS2Ps6WYBSluBHpzdtNUr5bQ1C+tWBtw+VfdnfVqFH
	 r2LlE380pRYPqnpwekVnEKvxR4pV/WwySptccMlT3kb9qzAtLlii8dMO5takriuYDRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792724561;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=i2LKfdGda6ZY97Aypzo1toCAh7ibNeXqCUursQfhIhw=;
	b=Md6Pd2wKlvUEoZ/Nzk6VDUCDYSbnS0MxB8EZO4atXvA+fa1u+/WZk2j4HjNRgQ7qMdvx
	 g0aO3fc7eBIHM60AcizMMrhoPqr79+LEE7AWtX5vVtxKXeJCUs+6BfB3zn/zXPd73Ve1y
	 RMXMhY1ww9OSzfLJxD7CNT2kuoqBO8EVZiJ02qRtCEyOW1C8LhDacZ1I1qKtq8LF9OBza
	 dbm9N8gtJ22Z2PUQKmANw5ISedbH9e9rGSQwhj57rb57fGtDiEoVexYh5GFhr9Oqbt7SG
	 2Kh0j62+8rNa1D/JBrsV1h1MWBnLxo+v35MA/sIBtBrSo9YG0/fHzc5RRI/Pfj193Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jowNzdSy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD5606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 03:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jowNzdSy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92E811F01825;
	Fri, 23 Oct 2026 03:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792724560;
	bh=i2LKfdGda6ZY97Aypzo1toCAh7ibNeXqCUursQfhIhw=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=jowNzdSyxndERVt3YJ7D6GzpVNlFX/p45KKMps2uugPEUzG96kLDmFjSK9bivdZvL
	 jmWGU5uzCy121SKbZgoE4NZ2uaf9oO0GVgf7FoDKjNGCZZloL0JaFlH5L5eawfi+Tb
	 HWgF5gYrPadDlavikJIiofBcpGDOKe7mntnuWYSk538KbFofwabrfNz8qE0t2ft9eA
	 YyClTCWY79DVS8TGXOn/8c3PSxV1nDGlvT2wMRgysUuvSna9iJ7G5UyR5NYud5bz9W
	 TmCDj04qOUGkAcvar7WsaM+6zjvMpvT6L9Ltq/jHCshpGBymXusbW35yfMUwkk1WuN
	 nS4OSdlaYC0WA==
Message-ID: <3617b48e-513f-418f-be0a-bf9d08d4ac60@kernel.org>
Date: Fri, 23 Oct 2026 11:02:37 +0800
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
Cc: chao@kernel.org, Daeho Jeong <daehojeong@google.com>
Subject: Re: [f2fs-dev] [PATCH] f2fs: flush devices when a sync checkpoint is
 skipped
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261023023118.3460118-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261023023118.3460118-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/23/26 10:31, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> When fsync needs a checkpoint, f2fs_do_sync_file() writes and waits for
> the file data and then relies on the checkpoint to flush the device
> write caches. syncfs works the same way through f2fs_sync_fs(). But
> f2fs_write_checkpoint() skips a CP_SYNC or CP_FASTBOOT checkpoint
> without any flush when SBI_IS_DIRTY is clear.
> 
> That can happen even though the data was just written. A checkpoint
> does not wait for F2FS_WB_DATA writes, so another checkpoint can commit
> the new block addresses of the file while its data writes are still in
> flight, flush the devices before they complete, and clear SBI_IS_DIRTY.
> The checkpoint requested by fsync is then skipped, and fsync returns
> while the data may still be in a volatile write cache. After a power
> cut, the file points to blocks that were never persisted.
> 
> Flush the write caches of all devices when a sync checkpoint is skipped.
> 
> This was found by generic/455 with compression enabled for all files,
> where every fsync goes through a checkpoint. On a 4KB page kernel, 3 of
> 100 runs lost fsynced blocks without this patch and none of 100 runs did
> with it.

Seems we only find this issue on compressed file, can we fix compression
case only? If compression is disable, it will issue unnecessary preflush
during syncfs?

Maybe we can add a reference count to track writebacked compressed page.

- increase it during writeback
- decrease it in write_end_io
- in f2fs_write_checkpoint
  - skip if it's zero
  - otherwise, wait it to be zero & issue flush

Thoughts?

> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/checkpoint.c | 18 ++++++++++++++----
>   fs/f2fs/f2fs.h       |  1 +
>   fs/f2fs/segment.c    | 17 +++++++++++++++++
>   3 files changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 1ed38c668fc..158d97fc349 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -1973,10 +1973,20 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>   
>   	stat_cp_time(cpc, CP_TIME_LOCK);
>   
> -	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY) &&
> -		((cpc->reason & CP_FASTBOOT) || (cpc->reason & CP_SYNC) ||
> -		((cpc->reason & CP_DISCARD) && !sbi->discard_blks)))
> -		goto out;
> +	if (!is_sbi_flag_set(sbi, SBI_IS_DIRTY)) {
> +		if (cpc->reason & (CP_FASTBOOT | CP_SYNC)) {
> +			/*
> +			 * The data that fsync or syncfs waited for may have
> +			 * completed after the last checkpoint flushed the
> +			 * devices, and that checkpoint may already point to
> +			 * it, so flush the devices.
> +			 */
> +			err = f2fs_flush_all_devices(sbi);
> +			goto out;
> +		}
> +		if ((cpc->reason & CP_DISCARD) && !sbi->discard_blks)
> +			goto out;
> +	}
>   	if (unlikely(f2fs_cp_error(sbi))) {
>   		err = -EIO;
>   		goto out;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 1f9bd8e3b52..a4a38818988 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4265,6 +4265,7 @@ void f2fs_balance_fs_bg(struct f2fs_sb_info *sbi, bool from_bg);
>   int f2fs_issue_flush(struct f2fs_sb_info *sbi, nid_t ino);
>   int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi);
>   int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
> +int f2fs_flush_all_devices(struct f2fs_sb_info *sbi);
>   void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
>   void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr,
>   						unsigned int len);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 06fb92fc847..5b015cf9071 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -822,6 +822,23 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
>   	return ret;
>   }
>   
> +/*
> + * Flush the write caches of all devices, regardless of which ones received
> + * writes since the last checkpoint.
> + */
> +int f2fs_flush_all_devices(struct f2fs_sb_info *sbi)

I guess there is an existing function f2fs_flush_device_cache(), I feel we'd
better reuse it to avoid missing any functionality inside it, right?

Thanks,

> +{
> +	int ret, i;
> +
> +	if (test_opt(sbi, NOBARRIER))
> +		return 0;
> +
> +	ret = __submit_flush_wait(sbi, sbi->sb->s_bdev);
> +	for (i = 1; !ret && i < sbi->s_ndevs; i++)
> +		ret = __submit_flush_wait(sbi, FDEV(i).bdev);
> +	return ret;
> +}
> +
>   static void __locate_dirty_segment(struct f2fs_sb_info *sbi, unsigned int segno,
>   		enum dirty_type dirty_type)
>   {

