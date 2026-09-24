Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EAD347ECC6
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251642; cv=none; b=g0FQksE2D7vaY796YFNbEIuzxDCORt2Qmn5fEBwD1PKDJmkq0XrjSVRM7zYlOGqagM3F8mLKgQqvDXo0cksrPXq70mUkX+A6Dz/vWKYwdRjGj/cwKuUGyUta7gFMazdMnRhVyjY1/wYmWKICBGBP5cDJRxEB/YMoB6BU19Zh5hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251642; c=relaxed/simple;
	bh=Mso0sky39EEROqdih+CokdvsW1u+9gJLNKkFXdUVA1s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bPD5DBjny7A2wNSkdvOJo7W5I1tIuT2JWzDtV0bWhbajnUQM8xTFN1xbNuOlxqlWJDeUXreahzuGNQ/WrZwawPSmB0A/rINkOTswxJrJ34tkSYq2XW/TFdu7MiQ6jHAOd7IJG2OmuGqizmGLPfkoFzcFt9wWCe+YD78elT8Wo84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=cbLxaTN8; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="cbLxaTN8"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790251633; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=z86tkUcU5jZYQinPJvFfHddrX7AIj6e3haB0k6sqePo=;
	b=cbLxaTN8j3WKgZOI6DNM6wCPA/WsHCu4bLn1TO0hSBsaEBwFyoloKQvo5KH4YO5pUYgjs7x47OiPRoJ0xReD6JP8forTmsNu80l6TiwPLR9TDBpyByOuXAYxeziDgTrYuANFpb9+EjUZlDyWzBOPPpClfv0oEShNvqudDXEJ7Pw=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R171e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=joseph.qi@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0XBZi-PU_1790251630;
Received: from 30.221.133.221(mailfrom:joseph.qi@linux.alibaba.com fp:SMTPD_---0XBZi-PU_1790251630 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Sep 2026 20:07:11 +0800
Message-ID: <4f62bfee-857e-4343-a194-9afd6dceeca4@linux.alibaba.com>
Date: Thu, 24 Sep 2026 20:07:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: mark@fasheh.com, jlbec@evilplan.org, akpm@linux-foundation.org,
 Heming Zhao <heming.zhao@suse.com>, brauner@kernel.org, jack@suse.cz,
 zzzccc427@gmail.com, ericterminal@gmail.com, ocfs2-devel@lists.linux.dev,
 christophe.jaillet@wanadoo.fr, linux-kernel@vger.kernel.org,
 syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
References: <20260904235710.16317-1-kartikey406@gmail.com>
From: Joseph Qi <joseph.qi@linux.alibaba.com>
In-Reply-To: <20260904235710.16317-1-kartikey406@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 9/5/26 7:57 AM, Deepanshu Kartikey wrote:
> Concurrent writes to a region's "dev" attribute can race, letting two
> tasks both allocate/free reg->hr_slot_data for the same region and
> causing a use-after-free. Add a per-region mutex to serialize
> o2hb_region_dev_store() against itself and against
> o2hb_region_release().
> 

The description is too simple.
Please describe the issue in detail, better with a race flow.

> Fixes: 1d3aa0b97c55 ("ocfs2: port block device access to file")

Why blames commit 1d3aa0b97c55? It seems it just renames hr_bdev_handle
to hr_bdev_file and swaps bdev_release() for fput().

> Reported-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3025e3e8fc0b928af8f5
> Tested-by: syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
> Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
> ---
>  fs/ocfs2/cluster/heartbeat.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/ocfs2/cluster/heartbeat.c b/fs/ocfs2/cluster/heartbeat.c
> index 1c3def99bb07..6f03de1b6d4a 100644
> --- a/fs/ocfs2/cluster/heartbeat.c
> +++ b/fs/ocfs2/cluster/heartbeat.c
> @@ -273,6 +273,9 @@ struct o2hb_region {
>  
>  	/* last hb status, 0 for success, other value for error. */
>  	int			hr_last_hb_status;
> +	/* Serializes dev_store() against itself and region_release() */
> +	struct mutex            hr_dev_write_mutex;

Please use tab instead space.

> +
>  };
>  
>  static inline struct block_device *reg_bdev(struct o2hb_region *reg)
> @@ -1616,7 +1619,10 @@ static void o2hb_region_release(struct config_item *item)
>  
>  	o2hb_quiesce_timeout(reg);
>  	o2net_unregister_and_flush_handler_list(&reg->hr_handler_list);
> +
> +	mutex_lock(&reg->hr_dev_write_mutex);
>  	o2hb_unmap_slot_data(reg);
> +	mutex_unlock(&reg->hr_dev_write_mutex);
>  

Seems frag_sem in configfs serializes store and rmdir. So don't
understand the race.

>  	if (reg->hr_bdev_file)
>  		fput(reg->hr_bdev_file);
> @@ -1879,9 +1885,6 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
>  	ssize_t ret = -EINVAL;
>  	int live_threshold;
>  
> -	if (reg->hr_bdev_file)
> -		return -EINVAL;
> -
>  	/* We can't heartbeat without having had our node number
>  	 * configured yet. */
>  	reg->hr_node_num = o2nm_this_node();
> @@ -1906,12 +1909,20 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
>  	if (!S_ISBLK(fd_file(f)->f_mapping->host->i_mode))
>  		return -EINVAL;
>  
> +	if (mutex_lock_interruptible(&reg->hr_dev_write_mutex))
> +		return -ERESTARTSYS;
> +
> +	if (reg->hr_bdev_file) {
> +		ret = -EINVAL;
> +		goto out_unlock;
> +	}

This seems buggy.
We have to do this before the hr_node_num assignment. Otherwise it will
conflict with the logic in o2hb_region_dev_store().

> +
>  	reg->hr_bdev_file = bdev_file_open_by_dev(fd_file(f)->f_mapping->host->i_rdev,
>  			BLK_OPEN_WRITE | BLK_OPEN_READ, NULL, NULL);
>  	if (IS_ERR(reg->hr_bdev_file)) {
>  		ret = PTR_ERR(reg->hr_bdev_file);
>  		reg->hr_bdev_file = NULL;
> -		return ret;
> +		goto out_unlock;
>  	}
>  
>  	sectsize = bdev_logical_block_size(reg_bdev(reg));
> @@ -2029,6 +2040,8 @@ static ssize_t o2hb_region_dev_store(struct config_item *item,
>  		fput(reg->hr_bdev_file);
>  		reg->hr_bdev_file = NULL;
>  	}
> +out_unlock:
> +	mutex_unlock(&reg->hr_dev_write_mutex);
>  	return ret;
>  }
>  
> @@ -2149,6 +2162,8 @@ static struct config_item *o2hb_heartbeat_group_make_item(struct config_group *g
>  
>  	config_item_init_type_name(&reg->hr_item, name, &o2hb_region_type);
>  
> +	mutex_init(&reg->hr_dev_write_mutex);
> +
>  	/* this is the same way to generate msg key as dlm, for local heartbeat,
>  	 * name is also the same, so make initial crc value different to avoid
>  	 * message key conflict.

