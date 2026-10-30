Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365094;
	b=4g0BCUl67Sz5RoqhY9S1xtegij4vK+ojom2TAns8MGFLna/uwmV6BEN3jWupbPqsgUFE
	 6lLuvXrBMsSHQfMiF8wP2ZGrezIh2hFve++B/Yc7mr9mMjUx4I+qDKlymimVNV/BCJuxy
	 voa7MFQabCf0z+cz/neWgz1w3QgYgcomL/hho+zpiGrsj8veiepY+VaY9MVDetiXWn/Xu
	 2iDj7zyh5PcO9Rpo2ngH4VlXDAef3uFSUlJ2+aQGZad0UGnHPSxrcrt0fEaychJzM9SmF
	 LOY3biiPKNi4NCAM/+5QTry4CWtFbVyjyeYwFsADEh29rqib79bIvRCsy8MG74rG4cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365094;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:Cc:
	 Subject:To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=PmnqftHJnun8Cz4B15SsJX0+Edfef/U4Sq7UOqC3dwQ=;
	b=5tfbCZ+l8GwSQ5bZAMz5BRTYk/k0PJ/h2cbCHQYXqnxI4x33JqjeWT7IYhggusG0i2NQ
	 d0rBnv221FDtMFJSSBXUnMIl+35P7cOOrrnIBJiv2ZVORdQ/oNU4Zdcb9r97GWqZ2JVNY
	 5vB6w+oLsRkno2DFZF9RHmFpqAEXGcbZhqXnJ1B+BZmqWrII63w6m39oS6GokrBOCow/H
	 brWpnZ5ElowZQp5QowWYQ9myHVUkctgQXRnDuci4cIoUtXPC5qWe46tzR/ftmdTgRbiPC
	 DhXR626fnUl/ywNmeLSES6QP9doB0WHEAVw4bFaP+T/2q3uvVhUEynAuVf6T3s96OLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BDJo+bM3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46606606A32C
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 12:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BDJo+bM3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158F41F00A02;
	Fri, 30 Oct 2026 12:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793365094;
	bh=PmnqftHJnun8Cz4B15SsJX0+Edfef/U4Sq7UOqC3dwQ=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=BDJo+bM3jTsLk5K9r5T9WGXEpulE91QnNSc9EdQuG59Me5HCBKc2kGNAaEvCnrFz1
	 KBvuxV7rmZ93MA2X1SokFu9HBu2q+V7lFNL5SOeEgw3nvYYcmeXu/o6LI5YlC5sTSt
	 /+Li8kGxYgxJz9Y04bZYHz4Osy5Jd+/zlXXkeRWpGyQ5/mCSSIIijz7Gu/v8wGTvrK
	 qY7b11e7kda6S1CUKK3NY8o/rWXPO6rWhCgjY4/WXiyNveO3Lb76gaKzt63P8bDONN
	 F6pfypJpgjCcmP7hVLLUvFZCIp3sxacvvps/pcfwpnervsLf8lMUgAAcSpSC9EarUP
	 4Gdn49RHE30Fg==
Message-ID: <6fd5d995-776b-4e25-9ea4-e3cc018efda0@kernel.org>
Date: Fri, 30 Oct 2026 20:58:11 +0800
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
Subject: Re: [PATCH v2] f2fs: reserve space to be shrunk during resize_fs
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20261022165526.1539629-1-daeho43@gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20261022165526.1539629-1-daeho43@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Daeho, sorry for the delay.

On 10/23/26 00:55, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> f2fs_resize_fs() drops gc_lock and the cp lock between the free space
> check and freeze_super(). In that window, others can allocate the free
> space, so the second check after freeze_super() fails with -ENOSPC.
> This is easy to hit on a busy filesystem, e.g. at OTA install time.
> 
> Reserve the space to be shrunk via resize_reserved_blocks once the
> first check passes, and deduct it in __get_available_block_count() like
> alias_reserved_blocks. Release it on success or on error.
> 
> With the reservation, the second check should not fail anymore, so:
> - allow root reserved blocks, which root may use in the meantime,
> - recheck DISABLE_CHECKPOINT, which remount may set in the meantime,
>    since freeze_super() fails only when the fs is still dirty,
> - keep the check only as a WARN_ON_ONCE() safety net.
> 
> Also exclude the alias/resize reservations when updating
> current_reserved_blocks via sysfs, otherwise it can underflow
> __get_available_block_count().
> 
> Suggested-by: Chao Yu <chao@kernel.org>
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
> Changes in v2:
> - Exclude alias/resize reservations from current_reserved_blocks.
> - Allow root reserved blocks in the second check, with WARN_ON_ONCE().
> - Recheck DISABLE_CHECKPOINT after freeze_super().
> ---
>   fs/f2fs/f2fs.h  | 18 +++++++++++++----
>   fs/f2fs/gc.c    | 54 ++++++++++++++++++++++++++++++++++++++-----------
>   fs/f2fs/super.c |  1 +
>   fs/f2fs/sysfs.c | 12 ++++++++++-
>   4 files changed, 68 insertions(+), 17 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 089a62c054e..6b9e1d0e71c 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1897,6 +1897,7 @@ struct f2fs_sb_info {
>   	block_t reserved_blocks;		/* configurable reserved blocks */
>   	block_t current_reserved_blocks;	/* current reserved blocks */
>   	block_t alias_reserved_blocks;		/* reserved blocks for device alias */
> +	block_t resize_reserved_blocks;		/* reserved blocks for resize_fs */
>   
>   	/* Additional tracking for no checkpoint mode */
>   	block_t unusable_block_count;		/* # of blocks saved by last cp */
> @@ -2666,16 +2667,18 @@ static inline bool __allow_reserved_root(struct f2fs_sb_info *sbi,
>   	return false;
>   }
>   
> -static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
> -						struct inode *inode, bool cap)
> +static inline unsigned int __get_available_block_count(
> +					struct f2fs_sb_info *sbi,
> +					bool allow_root)
>   {
>   	block_t avail_user_block_count;
>   
>   	avail_user_block_count = sbi->user_block_count -
>   					sbi->current_reserved_blocks -
> -					sbi->alias_reserved_blocks;
> +					sbi->alias_reserved_blocks -
> +					sbi->resize_reserved_blocks;

Can you please take a look at comments from sashiko? it seems valid:

https://sashiko.dev/#/patchset/20261022165526.1539629-1-daeho43%40gmail.com

__get_available_block_count() can underflow here: avail in __sbi_store() doesn't
exclude root_reserved_blocks, so once valid_user_blocks() < root_reserved_blocks,
current_reserved_blocks can overlap with root reserved space, and the unguarded
"avail_user_block_count -= root_reserved_blocks" wraps block_t.

e.g.
user_block_count = 1000, root_reserved_blocks = 100, valid = 30,
reserved_blocks = current_reserved_blocks = alias_reserved_blocks = 0

Thread A			Thread B (root)
- f2fs_resize_fs(shrunk_blocks = 500)
  - 500 + 30 <= avail(false) = 900, ok
  - resize_reserved_blocks = 500
  - drop gc_lock/cp lock
				- echo 500 > /sys/fs/f2fs/<dev>/reserved_blocks
				 - 500 <= 1000 - 100, ok
				 - avail = 1000 - 500 = 500
				 - current_reserved_blocks =
				   min(500, 500 - 30) = 470

Now for a non-root user:
__get_available_block_count(sbi, false)
   = 1000 - 470 - 0 - 500 = 30, then 30 - 100 => 0xFFFFFFBA

Thanks,

>   
> -	if (test_opt(sbi, RESERVE_ROOT) && !__allow_reserved_root(sbi, inode, cap))
> +	if (test_opt(sbi, RESERVE_ROOT) && !allow_root)
>   		avail_user_block_count -= F2FS_OPTION(sbi).root_reserved_blocks;
>   
>   	if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED))) {
> @@ -2688,6 +2691,13 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
>   	return avail_user_block_count;
>   }
>   
> +static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
> +						struct inode *inode, bool cap)
> +{
> +	return __get_available_block_count(sbi,
> +				__allow_reserved_root(sbi, inode, cap));
> +}
> +
>   static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
>   static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
>   				 struct inode *inode, blkcnt_t *count,
> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
> index 926e6976bc2..955224f4166 100644
> --- a/fs/f2fs/gc.c
> +++ b/fs/f2fs/gc.c
> @@ -2374,6 +2374,7 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>   	struct f2fs_lock_context glc;
>   	struct f2fs_lock_context clc;
>   	unsigned int secs;
> +	bool reserved = false;
>   	int err = 0;
>   	__u32 rem;
>   
> @@ -2425,10 +2426,17 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>   	f2fs_lock_op(sbi, &lc);
>   
>   	spin_lock(&sbi->stat_lock);
> -	if (shrunk_blocks + valid_user_blocks(sbi) +
> -		sbi->current_reserved_blocks + sbi->unusable_block_count +
> -		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
> +	if (shrunk_blocks + valid_user_blocks(sbi) >
> +			__get_available_block_count(sbi, false)) {
>   		err = -ENOSPC;
> +	} else {
> +		/*
> +		 * Reserve the space to be shrunk so that no one, including
> +		 * root, can allocate it until the shrink is done.
> +		 */
> +		sbi->resize_reserved_blocks += shrunk_blocks;
> +		reserved = true;
> +	}
>   	spin_unlock(&sbi->stat_lock);
>   
>   	if (err)
> @@ -2442,29 +2450,45 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>   out_drop_write:
>   	mnt_drop_write_file(filp);
>   	if (err)
> -		return err;
> +		goto out_release;
>   
>   	err = freeze_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
>   	if (err)
> -		return err;
> +		goto out_release;
>   
>   	if (f2fs_readonly(sbi->sb)) {
>   		err = thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> -		if (err)
> -			return err;
> -		return -EROFS;
> +		if (!err)
> +			err = -EROFS;
> +		goto out_release;
> +	}
> +
> +	/* checkpoint can be disabled by remount before freeze_super() */
> +	if (test_opt(sbi, DISABLE_CHECKPOINT)) {
> +		f2fs_err(sbi, "Checkpoint should be enabled.");
> +		err = thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> +		if (!err)
> +			err = -EINVAL;
> +		goto out_release;
>   	}
>   
>   	f2fs_down_write_trace(&sbi->gc_lock, &glc);
>   	f2fs_down_write_trace(&sbi->cp_global_sem, &clc);
>   
>   	spin_lock(&sbi->stat_lock);
> -	if (shrunk_blocks + valid_user_blocks(sbi) +
> -		sbi->current_reserved_blocks + sbi->unusable_block_count +
> -		F2FS_OPTION(sbi).root_reserved_blocks > sbi->user_block_count)
> +	/*
> +	 * shrunk_blocks is already accounted in resize_reserved_blocks, so
> +	 * this should not fail. Allow root reserved blocks here since root
> +	 * may have used them after the first check, regardless of resize.
> +	 */
> +	if (WARN_ON_ONCE(valid_user_blocks(sbi) >
> +			__get_available_block_count(sbi, true))) {
>   		err = -ENOSPC;
> -	else
> +	} else {
>   		sbi->user_block_count -= shrunk_blocks;
> +		sbi->resize_reserved_blocks -= shrunk_blocks;
> +		reserved = false;
> +	}
>   	spin_unlock(&sbi->stat_lock);
>   	if (err)
>   		goto out_err;
> @@ -2510,5 +2534,11 @@ int f2fs_resize_fs(struct file *filp, __u64 block_count)
>   	f2fs_up_write_trace(&sbi->cp_global_sem, &clc);
>   	f2fs_up_write_trace(&sbi->gc_lock, &glc);
>   	thaw_super(sbi->sb, FREEZE_HOLDER_KERNEL, NULL);
> +out_release:
> +	if (reserved) {
> +		spin_lock(&sbi->stat_lock);
> +		sbi->resize_reserved_blocks -= shrunk_blocks;
> +		spin_unlock(&sbi->stat_lock);
> +	}
>   	return err;
>   }
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index d683240040f..28e49e8d71e 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -5345,6 +5345,7 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
>   	sbi->reserved_blocks = 0;
>   	sbi->current_reserved_blocks = 0;
>   	sbi->alias_reserved_blocks = 0;
> +	sbi->resize_reserved_blocks = 0;
>   	limit_reserve_root(sbi);
>   	adjust_unusable_cap_perc(sbi);
>   
> diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> index 9749da70089..ce70d81eba3 100644
> --- a/fs/f2fs/sysfs.c
> +++ b/fs/f2fs/sysfs.c
> @@ -594,6 +594,8 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   	}
>   #endif
>   	if (a->struct_type == RESERVED_BLOCKS) {
> +		block_t avail, valid;
> +
>   		spin_lock(&sbi->stat_lock);
>   		if (t > (unsigned long)(sbi->user_block_count -
>   				F2FS_OPTION(sbi).root_reserved_blocks)) {
> @@ -601,8 +603,16 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
>   			return -EINVAL;
>   		}
>   		*ui = t;
> +		/*
> +		 * Exclude the space reserved for device aliasing and resize_fs,
> +		 * otherwise the reserved blocks can overlap with them and
> +		 * __get_available_block_count() can underflow.
> +		 */
> +		avail = sbi->user_block_count - sbi->alias_reserved_blocks -
> +					sbi->resize_reserved_blocks;
> +		valid = valid_user_blocks(sbi);
>   		sbi->current_reserved_blocks = min(sbi->reserved_blocks,
> -				sbi->user_block_count - valid_user_blocks(sbi));
> +				avail > valid ? avail - valid : 0);
>   		spin_unlock(&sbi->stat_lock);
>   		return count;
>   	}

