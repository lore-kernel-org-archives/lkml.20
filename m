Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC544A205D
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 08:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.195.75.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792051519; cv=none; b=kp/S6Biac6O0VLdSsm24Ii+4LniYPSQnNu8YDlGji2GtWpHSdKHcdR+ynJSWmZ+RLk3ZDhUAkodnq2dq2PU7aOyqPtufx+3aY5ja0gzVQmUOcgVtCr6piXlX362otRShUfeCxlZz0rBu56ERCPZAQKlANZtb512/UA0fYajPJ94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792051519; c=relaxed/simple;
	bh=PU4TMiFUAtyrgJ+fKl5nRy+WoMEfXJHew5Hura8Jokk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tBThaU7JhfY9GXN/9evTpJy5TLZJoLG8AL9omoXb/GyvYnt7s3vH1odGkUgGpJNqJdVR4Dd+kUyASXxEg0iz/OZOUBeo6McvXT32VuFVt5r6gUiIxXYFscVF4BwPOa4cboV8QHLG86qu9ezystZZWKabqnSd89txru27yw8jVd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org; spf=pass smtp.mailfrom=debian.org; dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b=BjX3Z++2; arc=none smtp.client-ip=82.195.75.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=debian.org header.i=@debian.org header.b="BjX3Z++2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D5axZDp8rw+vTX8OqG51xUeAD7a6Rewmf5U0WnmVQ4Q=; b=BjX3Z++2IDzeb2kd2M4xnagLf0
	wMObfeGnaZnX0yOypYVb9ruo3RignmsHUvTFPpz7K2NDp3FfwmTolDG1XIKFstG0iQqYW92V76+IC
	yJq298m/Ue8oo4TK5FKVw2FPt/hbNrXGcinJ0Bx/R5vQWpKJwyu//H2SNG2vU24IZ82qdVLKKI/kr
	rrB1Lf1r6d4zkboi9Nesk+7cElAI6gDBdg9iDzDEbqD6by7KnR7P1aBA6Zu2NmqzJVO7sIgBYbRhX
	5KGLcTwUVCLKk8kXkVriBaS6LkVJV8XDPRWOgYwtHUzTxULotvdyYdJi3ctqXoCMR0grt2dgili6O
	tBmgtp3w==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xHGSf-0053Al-0n;
	Thu, 15 Oct 2026 08:05:13 +0000
Date: Thu, 15 Oct 2026 01:05:08 -0700
From: Breno Leitao <leitao@debian.org>
To: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	linux-kernel@vger.kernel.org, syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] workqueue: mark pool->nr_running as __data_racy
Message-ID: <atCJKit7SNhI87fV@gmail.com>
References: <20261014154342.20661-1-ngocthang2710.1999@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014154342.20661-1-ngocthang2710.1999@gmail.com>
X-Debian-User: leitao

On Wed, Oct 14, 2026 at 10:43:41PM +0700, Nguyen Ngoc Thang wrote:
> wq_worker_running() increments pool->nr_running with only preemption
> disabled, while kick_pool_pick() reads it via need_more_worker() under
> pool->lock, so the two can run concurrently on different CPUs. KCSAN
> reports:
> 
>   BUG: KCSAN: data-race in kick_pool_pick / wq_worker_running
> 
>   write to 0xffff888059c2af24 of 4 bytes by task 3007 on cpu 0:
>    wq_worker_running+0x114/0x130
>    schedule_timeout+0x16e/0x180
>    io_schedule_timeout+0x4c/0x70
>    submit_bio_wait+0xd7/0x110
>    blkdev_issue_flush+0x4c/0x70
>    ext4_sync_file+0x60d/0x6c0
>    aio_fsync_work+0x7f/0x270
>    process_one_work+0x4ae/0xa00
> 
>   read to 0xffff888059c2af24 of 4 bytes by task 3001 on cpu 1:
>    kick_pool_pick+0x7a/0x3a0
>    __queue_work+0x72d/0xcf0
>    queue_work_on+0x9d/0xb0
>    schedule_on_each_cpu+0x11a/0x2d0
>    vmstat_refresh+0x23/0x140
>    proc_sys_call_handler+0x2b9/0x4f0
> 
> The race is benign. The increment in wq_worker_running() is the only
> lockless write to nr_running; decrements and the reset are done under
> pool->lock, so a reader holding the lock sees either the old or the new
> count. A stale 0 costs at most a spurious wakeup of an idle worker. A
> nonzero count is correct because the incrementing worker is running and
> re-checks the worklist under pool->lock before it stops counting. The
> increment can also go 1 -> 2, e.g. when a worker sleeping in a work item
> wakes up after kick_pool() woke another worker.
> 
> The lockless increment is part of how nr_running is designed to work,
> as the comment above the field documents. Mark the field __data_racy
> so that every reader is covered, not just need_more_worker().
> 
> Reported-by: syzbot+8922e6b8343f70be92e8@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=8922e6b8343f70be92e8
> Signed-off-by: Nguyen Ngoc Thang <ngocthang2710.1999@gmail.com>

Reviewed-by: Breno Leitao <leitao@debian.org>
