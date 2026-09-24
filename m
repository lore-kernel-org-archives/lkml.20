Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6F641F357
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 10:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246247; cv=none; b=X9F2nE6G+LVWOTgjzFz48ivRRgAOERtZx4sDLqLH4tsD6nZJvMfxdZeKcmRyNVUJRebJIkhmfNVUroKr4wZaLfcnuw8XP5aZBq7nhlEx+/a0frIvK7/BIBoUucaxA8eJgbk4QhOjkvYq589MW7aw26TZlR/AZnDiajbOQ+O4gsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246247; c=relaxed/simple;
	bh=KItYYmTb1hqzPFBT7AHYXiYDuHHx1H/geRCugysntMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NNrdqVdUMRO3An9SsUkz8vVbqOxrF+FMiQ8WG3e3+mFOOn3Nx/nMzQdh0vm+PyYboRo8r5KR4LLozArSUAvl5OzVx22tU0YOJsEbomTv15JUJSZYalw6Q575+bgzV/GbI4xVFaAgVHDw22fjxSjRBVZtoZEx5K/8mKTUkTdDs8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=N3RXK5qj; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="N3RXK5qj"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2507a0a24bso20513566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 03:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1790246244; x=1790851044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=34DvOH57h16Ry/MZtJV7+YneUNCdGFkltPA28JgRicA=;
        b=N3RXK5qjutitWSsooPHFtev3a8Onl942NrUpKdXchDpWFJ+UCalNzFMVwYKFQZaSG2
         VG9jYl7tJwZ0T9XYtfPSazJeW0YjCims8UAzSo8taYV4lpK6nh3TIrNqWJxfJr8JDSAR
         HNtbe0QoTkJxK4o9gxg1XMDPT7V55XBaz0ukEzE3CM/LpqaDT0jue4cRZMS7/c72JdbE
         gt0ObQxDvvfpPPkG3fYhUlmFKGdLXdfOxLLzAR58oAZfKcXI7oCSxCXh4QLPfhqIo9sr
         Uagr5Hs7L2HIL8DYrT741z08uVC1Y9aJqhZq1mS0aZVEE8KAAJWebD21uXPlMHwKrEOe
         ODxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790246244; x=1790851044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=34DvOH57h16Ry/MZtJV7+YneUNCdGFkltPA28JgRicA=;
        b=Q59J9FvFJpaCGmbw9zWm3kjf2eOgel6A/kLpbFwXSUy/Vy7v1Q9gFihUCPGQO7/C02
         AThaD3UtAPwYmeE2k/8844A01AHbvPn3K1G67Ya6lniEVdXo7k/xoYyJRiqIF9WDc6J4
         Q7Px6yEVzLdOwtyDSaChf2U1GUpmMLDt/pgGorhB/Q6W+YoVFJLRo8ZiOQ+1dPA3pywy
         LnuN/3tz0MfvIuhq1Lk9eK3S6BVzulgiE1lUfZVO0DkOH/Vv5U4GhauEKbXARZvoT6q9
         8G4DAAmNlltFrB2HLmoOIFGLRLBDlH2O1y6/OFSa7f6i/D2GqOkjEzV5u2jpX4dx1SUi
         lFiA==
X-Forwarded-Encrypted: i=1; AKwUvBzOoOwCt+GmWGIzYfjl57vTTTApzxtPJzvSZoHNjEFaxpF295m+hE9WL2OnvpI/iuu5pXmtFgH8TUwqsXw=@vger.kernel.org
X-Gm-Message-State: AFuF++leaZ9cKbOz9akz/4pWTVM5Aa4cMSrMPOqcc3A9yDI4jHyaRh7M
	rLnAjwivSHAtQ4yhZNIu+WGed7kkPcCTRRZ5rypzmmLCVUUoe+EWSsdyxGcYPRPI7hM=
X-Gm-Gg: AYBFou2g13Jp3MnQeg1//2THs8MDLpbMYwJTtc6alMPDFXSLssHww/AdlWBy2zvI08l
	HMiwTTgHkqo2w23Sk1U67wkhrpsh/dQkJ/wPQ05aLHDhzjG3879b6ASp07dTjBVdSLFk9DWqYFQ
	UtjXCXyIJtcwSn3p8J4fARZ+g64n6kJ+Z5KpNl+CLOOSZeec59WOlCh5W4U7bC+5fj3zHOhxtfG
	UbzWFB6F6scSxta0vaHsVE75s4N4dy507z19QaiSltjbMp92N7/xerw1u9nWM7BsxDjkmVf0ZLq
	dcUUUheASrL77Djg01qVh97OmvWvNluUhCLC0PKn6tGTVh2zKfCMGlCzO6kqyTczfJkg+6Rl4OL
	GenEBb7uecxheKCniJhkcxNHk+mLPDZ56WDNS9fWFjceNTYkpz+KGOvTndpKrAJWdNK54xEmKCS
	ZL7xKb5PBQ4mWatXqBSPFOwlV1j53VLhk3T3PguKTyzkLNM5pshNo3QlEYy7XEmc499oEpGjyrX
	0k3eH4=
X-Received: by 2002:a17:907:6d13:b0:c24:908b:4e2e with SMTP id a640c23a62f3a-c2ac25a5a03mr172545566b.4.1790246244095;
        Thu, 24 Sep 2026 03:37:24 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3f4173sm2449097a12.20.2026.09.24.03.37.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 03:37:23 -0700 (PDT)
Date: Thu, 24 Sep 2026 18:37:19 +0800
From: Heming Zhao <heming.zhao@suse.com>
To: Deepanshu Kartikey <kartikey406@gmail.com>, 
	joseph.qi@linux.alibaba.com
Cc: mark@fasheh.com, jlbec@evilplan.org, akpm@linux-foundation.org, 
	brauner@kernel.org, jack@suse.cz, zzzccc427@gmail.com, ericterminal@gmail.com, 
	ocfs2-devel@lists.linux.dev, christophe.jaillet@wanadoo.fr, linux-kernel@vger.kernel.org, 
	syzbot+3025e3e8fc0b928af8f5@syzkaller.appspotmail.com
Subject: Re: [PATCH] ocfs2: fix use-after-free in o2hb_region_dev_store
Message-ID: <arT8GTxhKeGu6cAW@p15>
References: <20260904235710.16317-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260904235710.16317-1-kartikey406@gmail.com>

On Sat, Sep 05, 2026 at 05:27:10AM +0530, Deepanshu Kartikey wrote:
> Concurrent writes to a region's "dev" attribute can race, letting two
> tasks both allocate/free reg->hr_slot_data for the same region and
> causing a use-after-free. Add a per-region mutex to serialize
> o2hb_region_dev_store() against itself and against
> o2hb_region_release().

Hi,

Did AI generate this patch? The commit log says "reg->hr_slot_data" should be
protected, but the code protects ->hr_bdev_file in o2hb_region_dev_store(), not
o2hb_map_slot_data().

Just code logic, I prefer changing struct mutex hr_dev_write_mutex to hr_mutex.

@Joseph,

I'm not very familiar with the heartbeat, based on the syzbot report, it seems
hr_slot_data needs protection. Does it make sense to fix this in cluster world?

Thanks,
Heming
> 
> Fixes: 1d3aa0b97c55 ("ocfs2: port block device access to file")
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
> -- 
> 2.34.1
> 
> 
