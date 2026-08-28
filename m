Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AE646EF78
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787927285; cv=none; b=W8QyvclTeqXcNyZLTjuJBp/sElEbiDhyM2S0j6xUxUuwDlUYI1Tw7E+wrSBTF6iRgBGUS4zoUWYsjn5EQcxijNRwyjlk51pUB2Ft0QzsSwtjDjbMycEcZUhFe7+amCG1x01QVTuiPD8pz8DNGLSgZIdVDzZ66cRTx8KluXeRSAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787927285; c=relaxed/simple;
	bh=+CmXSLbNHQ2k6FnrUgFLVIdY8e6LhxBGtZUeweq9nb8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=N0EU5v7EI6Qce2QHbm1w5qPlTB953UKBuoxdXu0a807nlkOf1sZtcB/iWOIVwnRlJpdmSWrh2GOxaRJh4cIAkQbtISlaclw6Vp6vgy+JwwUKn4LVDYu/mWaAebSqgxWP9nY0kMNJUyAU5wn5AqwWCrVwJmRp1VPE4qZ+Ei3ag9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WPekUtfk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WPekUtfk"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-480001972b8so556490f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 07:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787927276; x=1788532076; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mSBKytCKHqfN5xOe1HlyHmsYxw1ixy635M//OyHPkKY=;
        b=WPekUtfkT0K9ibVqZbvZY1VKyaX7TnkC048jsqZARKcHCEpOJN0sFM/SrOTUgmd+2W
         M35+BaCBBnzYl4emGsvEZhcRdPW8ZrvXE5atnI312qZ34QnOhJm4o+ZrXiRKdUAcR6pQ
         zrbeO3tuNIxDn5AeirpkFxilZu1f1UuEDBsRsKGQd2zXL4kTeL7Ta1VOmVvYrIBgFiXl
         Au4RmCUQptr7b+mMzxav53wdFzZhzidJEws1HEp/JjQAbAvmJUvRHNJMAEhUvJv7LIu3
         Y6IhgMeAzh416Ci0iGd0/DZ53GJd+CaUmDCcIJD7EMHjvn5MlRqjcKbVAnVqxe/HU6Cp
         c91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787927276; x=1788532076;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mSBKytCKHqfN5xOe1HlyHmsYxw1ixy635M//OyHPkKY=;
        b=r+QTPXnPyAKbOYdwVahsBY5BwKTLkgflwdVmbAwmBzr5z4qaqiO3mXw/F+y0Ucddax
         F96+3rHdFjPJaMHZhGIrMQNUwBBK7XkQ8EV/FaAFHRNZ0BfegwlQ9mLoLf3i0H3XJY5H
         wKvj+Z8EnVTsU1qiO18LAhs7PSwiv5EPWiN6rhAbYVEF6qZHGAXqyJMiQLZ9zOA0vMsC
         mC2YG4oeT3IqlyoflMAqKvwHLSx69ovcIzyL9NoshFka0/OdV3XbzRLwB7+gvaTMAE5h
         K/L/Zzn2YKURKnV+4X/FkSTq4Iij+EpV1+MXrFwBrKY0m9y7QA7I2WLr5zplENplei+q
         nvLQ==
X-Forwarded-Encrypted: i=1; AHgh+RpbQNfki6fZ4hl5vl1BI3XXGgOS5c3n2nxLK4LRZNLB89rx2S8+BjFE2426lLqMfNc0bJH446mrkO5NLS8=@vger.kernel.org
X-Gm-Message-State: AFuF++lZhAkfYPKPP/WGeBitDvUiHWrIiZM8YcuzE7Zma2CUVXuseCxl
	bC8gQk4SF9ZE/Uua2NE+o1QWK3rcjCoU9JbRCbdF+qm/yUj/OiOZ1Z2k
X-Gm-Gg: AR+sD11wEqBHooxtmyfiXAwJSlqYs4tnXFjicflmr1uxYDQTbAfwzmtNcGpOpPAip4v
	iNljPfateBMgRHGkJenpkXEUU0Vs6hQEl6kDgey1/BT/KduD0xTFA+wq2dZ2JAhbdqGd3GubLBO
	siRpIzYviJoU/d4bM2AcsVF0OlaiEY6MVXKgQdXQTGgHU3OUEfOplwdqeuQVyGFNZFe8oGbaRvY
	1cKsdJpc1T+kb8v1Bc5e5G/AiAY/yeamsrt4pNv4Qk2pwHx2HlQpNx0HeqfSe0e1ZKtZ6yy2hJl
	64mi9h7TSfMEx+Yb+6oBEj0mTsQmvcgRrEIw2BbBfnNIP9fTPfFqN2UK0SJucfEb64/tY/uPgKM
	HTu3kz/MKt8P9kg5a53f8KByfJH5tjTdumueS2f0lD1L/PcWJT8XCFSZq5x3CS3DnJSoYesAM1o
	+vgUUPCCLHle7aFXLWoUPWqLDzPdwUo5JPUiQuOuzrLLC6lUOYyc/o++3QLf3sjJoLIJFKxpdPJ
	SeSE7r3e4fn7y7nmoB03M0kA+7+wtU=
X-Received: by 2002:a05:6000:2401:b0:482:eaa2:7d85 with SMTP id ffacd0b85a97d-482f782b50fmr11013049f8f.0.1787927275570;
        Fri, 28 Aug 2026 07:27:55 -0700 (PDT)
Received: from Abds-MacBook-Air.local ([2a02:3037:27f:67cb:9899:2c01:3637:5f2f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb27936sm4198160f8f.28.2026.08.28.07.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 07:27:50 -0700 (PDT)
From: Abd-Alrhman Masalkhi <abd.masalkhi@gmail.com>
To: Edward Adam Davis <eadavis@sina.com>,
 syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
Cc: song@kernel.org, yukuai@fygo.io, magiclinan@didiglobal.com,
 xiao@kernel.org, linux-raid@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] md/raid1: prevent a race between write and stop request
In-Reply-To: <20260828103957.245658-1-eadavis@sina.com>
References: <6a908777.1d9ded08.62e62.00da.GAE@google.com>
 <20260828103957.245658-1-eadavis@sina.com>
Date: Fri, 28 Aug 2026 16:27:41 +0200
Message-ID: <m2y0dqmiaq.fsf@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain


Hi Edward,

On Fri, Aug 28, 2026 at 18:39 +0800, Edward Adam Davis wrote:
> A race condition exists between write and stop requests, leading to a
> null-ptr-deref in [1].
>
> CPU0				CPU1
> ====				====
> md_submit_bio()
> md_handle_request()		do_md_stop()__md_stop()

do_md_stop() must never execute while the array device file is open.
take a look if this rule is not meet.

> raid1_make_request()		 __md_stop()
> raid1_write_request()		   mddev->private = NULL
> wait_barrier()
> conf->nr_pending //trigger [1]
>
> The intervention of a stop request causes inconsistencies in the state
> of mddev members (such as private and pers) while a write request is
> executing; the mddev lock is used to synchronize write and stop requests,
> thereby ensuring consistent mddev state throughout the execution of the
> write request.
>
> Additionally, when a write operation reaches the RAID1 layer, if a stop
> request acquires the mddev lock first and releases mddev->private, the
> bio is terminated and the write request exits.
> 	
> [1]
> KASAN: null-ptr-deref in range [0x0000000000000120-0x0000000000000127]
> RIP: 0010:_wait_barrier+0x8d/0x700 drivers/md/raid1.c:1066
> Call Trace:
>  wait_barrier drivers/md/raid1.c:1154 [inline]
>  raid1_write_request drivers/md/raid1.c:1506 [inline]
>  raid1_make_request+0x484/0x31a0 drivers/md/raid1.c:1696
>  md_handle_request+0x824/0x1230 drivers/md/md.c:417
>  md_submit_bio+0x1e9/0x350 drivers/md/md.c:458
>  __submit_bio block/blk-core.c:681 [inline]
>  __submit_bio+0x20e/0x3d0 block/blk-core.c:670
>  __submit_bio_noacct block/blk-core.c:724 [inline]
>  submit_bio_noacct_nocheck+0x736/0xc00 block/blk-core.c:792
>  submit_bio_noacct+0xc93/0x2130 block/blk-core.c:925
>  bio_await+0x1fa/0x240 block/bio.c:1580
>  submit_bio_wait+0x19/0x60 block/bio.c:1598
>  __blkdev_direct_IO_simple+0x4cb/0x8c0 block/fops.c:98
>  blkdev_direct_IO+0xbee/0x2030 block/fops.c:429
>  blkdev_direct_write block/fops.c:699 [inline]
>  blkdev_write_iter+0x703/0xd30 block/fops.c:767
>  new_sync_write fs/read_write.c:595 [inline]
>  vfs_write+0x6af/0x1050 fs/read_write.c:687
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
> Reported-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=3fe892ea5fc292e1353f
> Tested-by: syzbot+3fe892ea5fc292e1353f@syzkaller.appspotmail.com
> Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> ---
>  drivers/md/raid1.c | 28 +++++++++++++++++++++++++++-
>  1 file changed, 27 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/md/raid1.c b/drivers/md/raid1.c
> index f0646fb24371..3b9f1fa65e65 100644
> --- a/drivers/md/raid1.c
> +++ b/drivers/md/raid1.c
> @@ -1674,6 +1674,7 @@ static bool raid1_write_request(struct mddev *mddev, struct bio *bio,
>  static bool raid1_make_request(struct mddev *mddev, struct bio *bio)
>  {
>  	sector_t sectors;
> +	blk_status_t status;
>  
>  	if (unlikely(bio->bi_opf & REQ_PREFLUSH)
>  	    && md_flush_request(mddev, bio))
> @@ -1692,11 +1693,36 @@ static bool raid1_make_request(struct mddev *mddev, struct bio *bio)
>  	if (bio_data_dir(bio) == READ)
>  		raid1_read_request(mddev, bio, sectors, NULL);
>  	else {
> +		int err;
> +
>  		md_write_start(mddev, bio);
> -		if (!raid1_write_request(mddev, bio, sectors))
> +		err = mddev_lock(mddev);
> +
> +		if (err < 0) {
> +			md_write_end(mddev);
> +			status = BLK_STS_IOERR;
> +			goto done;
> +		}
> +
> +		if (!mddev->private) {
> +			mddev_unlock(mddev);
> +			md_write_end(mddev);
> +			status = BLK_STS_OFFLINE;
> +			goto done;
> +		}
> +
> +		err = raid1_write_request(mddev, bio, sectors);
> +		mddev_unlock(mddev);
> +
> +		if (!err)
>  			md_write_end(mddev);
>  	}
> +out:
>  	return true;
> +done:
> +	bio->bi_status = status;
> +	bio_endio(bio);
> +	goto out;
>  }
>  
>  static void raid1_status(struct seq_file *seq, struct mddev *mddev)
> -- 
> 2.43.0
>
>

-- 
Best Regards,
Abd-Alrhman
