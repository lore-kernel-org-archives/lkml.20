Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A022336F42B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 07:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788334217; cv=none; b=DEiZRyxVu7iw783NAJprCiPZw1zlvlXS6ihjjCuDtnKdF+9iic0fUxKAm+mn6yBMpdBTzWi1+IvZS0vGe8HvOGIGiSHwDg4xbaGmdvQ1TVMZKGPn5HDPBSBWHGGtN432Yx+Ydrrg0MuEu8f+K6qLOzVodqmA0alk+4Mf666VtxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788334217; c=relaxed/simple;
	bh=dTooKwSlqL28iEIT2qxhs7fHswH46qfp4HKT8ji9onA=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fjD5X2s2l9wT4/ZUvIG42X9T62yLJT0XjhUIYCZK7s6wrWtA/Dz0/L08Ao82NoZAAMzkyFmg+Widh7X0wh6lnDQj3PBYahBdq3/mAQlOnEeC780t2peHpVyQ8u2qjGupl0wtnk0zrtHawzd5I9ifvI6Ex4kVfcBtZOqocSs3MT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhUB+Uvy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhUB+Uvy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA5871F000E9;
	Wed,  2 Sep 2026 07:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788334214;
	bh=GJhNlkUX6KPd08Vsb4016VKYf4nuO78eW1N9kEqdouM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To;
	b=JhUB+Uvy5v8T3KH7OViyBaP7klEVuHYO85aewfhpbNYm/Nq9ntdcZku0ImYhPj5/a
	 Lxzo9xjHZUhHJcTcjWUTQelWCj+lc1P9AdBhV408C0umCfUEFKhAZGOkzo67kqxLLG
	 6v3Ctfo2iiVUxnNM3LGKvAkTv15C0vPgb50riS4egjIkepsNF9e7IZqPcIOD+rTA/i
	 717GYBNLNoLRjT8RCqO5SfC3irG3e6UbON59CKrzDfB+C0AN5ZrALxnx4cfBAdwvcI
	 DohLowQ3KAxrlC7HMMkLiICemC+6AG2EqXppO8mJQZ3tyA4eEAfWkD4TZVP3KfCRzo
	 s8+m69fzY5Gpg==
Message-ID: <afbed6d5-0c11-4041-ab8a-68f0264dceda@kernel.org>
Date: Wed, 2 Sep 2026 15:30:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com
Subject: Re: [PATCH v2] f2fs: wait for inode record work before clearing ino
 bitmaps
To: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org
References: <20260901140849.3405971-1-qiwenjie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20260901140849.3405971-1-qiwenjie@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/1/26 22:08, Wenjie Qi wrote:
> APPEND/UPDATE inode state recording was moved to the inode eviction
> workqueue. These entries were later converted to bitmap values stored in
> XArrays, but the workqueue drain was left behind in the list cleanup loop
> where it is now a no-op.
> 
> During unmount, inode eviction work can therefore remain queued when
> f2fs_release_ino_entry() destroys the bitmap XArrays. A delayed worker can
> repopulate them before the workqueue is finally destroyed, leaking newly
> allocated XArray nodes when the F2FS superblock is freed.
> 
> Wait for APPEND/UPDATE inode record work before destroying each bitmap
> XArray, restoring the required ordering.
> 
> Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
> Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
> ---
> v2:
> - Remove the no-op wait from the ORPHAN/FLUSH cleanup loop.
> - Wait once before bitmap XArray cleanup since APPEND/UPDATE share evict_wq.
> 
>  fs/f2fs/checkpoint.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 4b59f30ef45d5..642a771e0f63c 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -887,8 +887,6 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
>  	for (i = all ? ORPHAN_INO : FLUSH_INO; i <= FLUSH_INO; i++) {
>  		struct inode_management *im = &sbi->im[i];
>  
> -		f2fs_wait_for_inode_record(sbi, i);
> -
>  		spin_lock(&im->ino_lock);
>  		list_for_each_entry_safe(e, tmp, &im->ino_list, list) {
>  			list_del(&e->list);
> @@ -899,6 +897,8 @@ void f2fs_release_ino_entry(struct f2fs_sb_info *sbi, bool all)
>  		spin_unlock(&im->ino_lock);
>  	}
>  
> +	f2fs_wait_for_inode_record(sbi, APPEND_INO);

It may missed to wait UPDATE_INO?

Thanks

> +
>  	for (i = APPEND_INO; i < MAX_INO_ENTRY; i++) {
>  		struct inode_management *im = &sbi->im[i];
>  

