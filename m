Received: from mail-pz2-f40.google.com (mail-pz2-f40.google.com [74.125.228.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EAC47C0E4
	for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 08:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790584625; cv=none; b=a1BakxF5xgrprp4I8XMtzsPIc23TGYy6htXpRAurG8STTryOugczk7jFRBDRzTcE6VcsCLbX/8dHtK7Okqa5GKjNyCsNjcsgxyg1aCZv7gUDOeDYLo6Kp2zxLZIoo2a1E3iwZPtLsiX5uCHL2YSgvfIZ4dSxFoh6E+iE+T/iTt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790584625; c=relaxed/simple;
	bh=bou7TJ3YkZiaKpToPQifua9CF+5Fr/E4naT+CbeWrEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JR0HGCb7LjayW1DFydl/CZ979NYwB67KbJ0aOhA6dMLueUxN9pYev0LW0lZRTA0VChi0mf6XNjMJnaMGehdX8fxkC3YnaBb94zt70UO5N9C7ZszpucNxEmrNVOC09HfelOXmS+bCMjiF2BdPtbRWxcDWCC4rgFbVAK2Lk1TYsIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UoKE/C4P; arc=none smtp.client-ip=74.125.228.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UoKE/C4P"
Received: by mail-pz2-f40.google.com with SMTP id d2e1a72fcca58-87fd84c0bfeso978092b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Sep 2026 01:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790584623; x=1791189423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L5Wm5UF55+eRvTGHYgcr5kp8lSdkEISneNj5ZBpIilg=;
        b=UoKE/C4P3RgL1wqYnKTpzBgKth3pAhlMOpCUMZeBzpO0hLs0Kidce59jGcZnyqw9Lc
         Q8WxcIKQVgFjYx9VL9mukzRPJiqidRgu+HXP+WlvdgQtKKEdiacuMqcF8Kg7LlzisBMj
         YiXKvJ3+IhBMF5++3G8uPz7IImD0oTDJTAbPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790584623; x=1791189423;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5Wm5UF55+eRvTGHYgcr5kp8lSdkEISneNj5ZBpIilg=;
        b=Gy8/4mjJ4fYok/5FwPbCYaC++4RBdSa5myLEN3JSlL7Vni1rYjih6k7NTNa43lgA8v
         LScwwFLLC8xavcLYRnohwPNGN7DbguP7DxgHOP0sqs2nPG7Ar0fwLEdGBE74gKY5Y+i4
         ATwe3jZhh74vjwMHmG+6GiKFF2fCfN5TURxHTXh/12qbKubTGIZKP1QjV6TqM1wkWv6G
         uIIoLD/rBazIxWg8RdOyghF+aNgRpLuopKPRwSxo8XxhirN6OH1AtxpRPA8C+ZhuPMUY
         rjbGkD8tkrqteAfDdo5Vs60P4zYOs807yaJmFxFrjZrcPYP5gInB4gmSnQ4yoe+4hrzH
         g0sw==
X-Forwarded-Encrypted: i=1; AKwUvBz32TPTjZDOZd9NyzerVqiGN5oHcuTrwW+VRZW1fHHyb6zUGMZDJjTLttxvs09ftx141LQ7I0GgEX1zyfc=@vger.kernel.org
X-Gm-Message-State: AFuF++mSkyxIu1O7gditXbeYlFdr8anrxrk19FavVDvzt0MlsNetHoHo
	To19uCwvohafVVJAyV0eELk8CYNMRGQMzARNnYBNlKpuCpwi4J6GpzIkHvahRmPsIg==
X-Gm-Gg: AYBFou04UCiwMiB5F/kYJvAWQ7qNAk8eyBLe3MbXmGzgRrxdv9bHFaJmX0leO/bT390
	8zJzw13eSqDBhi7p7ZhtbsdqKmdSq6dsVRla83ubst5vSdTYkYzRZPauEkzQRmIlalRKa+Ls1pm
	vQq/Tck5bg0W8308LdEW9lKPvWpDygTtHmVqhPMYCyCnY4u++Eo53Vvq0oGOiOkNuAvLyrvfAm4
	SXE/ETDc9Tv6pM9Gz8llv4bj3Kd0f75CRLhzf0i/FLNll2GNa81QRYOIzqquL4YhbO64b9/qwLI
	XNMJiK9Ptx8JF88gwo95DUqn77TQI4nPX48NLc8uxYvSlFch+atq0rcvaFxlnXKogkfmK1rS75H
	fv5u1EeuuqHiedGeSoEIKxO5LwHDTmG2lkwxJBqjo9jclSQZY6WI0/CHInhV7sBO1jNzCI5ZZDo
	oeIR/s55uiD0A4MHcVDopcXpgHOY1U7oPyb96POsjo+PRDzmRYrqGW0sbEPGu1xIYsMdC0KqcgN
	nQhOFyDuzrw9v8Pj4Y7Mw19By2DLE9/in9Kxq4=
X-Received: by 2002:a05:6a00:4f90:b0:851:8bde:7873 with SMTP id d2e1a72fcca58-87e9869447cmr9941237b3a.8.1790584623017;
        Mon, 28 Sep 2026 01:37:03 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:fdbe:318b:98fe:bd96])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-87feb67dc92sm3768582b3a.51.2026.09.28.01.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:37:02 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:36:58 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Theodore Ts'o <tytso@mit.edu>
Cc: Andreas Dilger <adilger.kernel@dilger.ca>, 
	Baokun Li <libaokun@linux.alibaba.com>, Jan Kara <jack@suse.cz>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: Re: [PATCH] fs/ext4: fix ABBA deadlock in ext4_rmdir()
Message-ID: <aromzrxZZbjuekYs@google.com>
References: <20260827125158.4030598-1-senozhatsky@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827125158.4030598-1-senozhatsky@chromium.org>

On (26/08/27 21:50), Sergey Senozhatsky wrote:
> We observe the following ABBA deadlock (casefolding enabled):
> 
>  INFO: task jbd2/dm-13-8:447 blocked for more than 720 seconds.
>  task:jbd2/dm-13-8    state:D stack:0     pid:447   tgid:447   ppid:2
>  Call Trace:
>   <TASK>
>   __schedule+0xc2c/0xe60
>   schedule+0x40/0xe0
>   jbd2_journal_wait_updates+0x8f/0xf0
>   jbd2_journal_commit_transaction+0x321/0x1850
>   kjournald2+0xa9/0x230
>   kthread+0x226/0x2a0
>   ret_from_fork+0x101/0x1e0
>   ret_from_fork_asm+0x1a/0x30
> 
>  INFO: task Thread-10:4161 blocked for more than 720 seconds.
>  task:Thread-10       state:D stack:0     pid:4161  tgid:3848  ppid:540
>  Call Trace:
>   <TASK>
>   __schedule+0xc2c/0xe60
>   schedule+0x40/0xe0
>   wait_transaction_locked+0x8c/0xd0
>   start_this_handle+0x252/0x870
>   jbd2__journal_start+0x120/0x280
>   __ext4_journal_start_sb+0x11a/0x250
>   ext4_evict_inode+0x208/0x760
>   iput+0x222/0x5c0
>   dput+0x293/0x690
>   ____fput+0x145/0x2b0
>   task_work_run+0x7a/0xb0
>   exit_to_user_mode_loop+0xc0/0xd0
>   do_syscall_64+0x14b/0xf10
>   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> 
>  NMI backtrace for cpu 0
>  CPU: 0 UID: 1010216 PID: 4160 Comm: Thread-7
>  RIP: 0010:d_walk+0x0/0x290
> [..]
>  Call Trace:
>  <TASK>
>   shrink_dcache_parent+0xb2/0x100
>   d_invalidate+0x50/0x110
>   ext4_rmdir+0x3a2/0x3d0
>   vfs_rmdir+0x9d/0x1d0
>   do_rmdir+0xf0/0x330
>   __x64_sys_unlinkat+0x34/0x50
>   do_syscall_64+0x61/0xf10
> 
> The problem is that ext4_rmdir() calls d_invalidate() before stopping
> the jbd2 transaction handle.  Because d_invalidate() traverses child
> dentries it can encounter dying or in-use dentries.  If a concurrent
> thread executing __dentry_kill() on a child dentry invokes ext4_evict_inode(),
> it requests a new transaction handle via ext4_journal_start(), which
> waits for all running handles to close.  However, the thread executing
> ext4_rmdir() still holds its active transaction handle while looping
> in shrink_dcache_parent() waiting for the dying child dentry to complete
> eviction.
> 
> Stop transaction handle in ext4_rmdir() before calling d_invalidate().

Hello,

I'm not sure I see this patch in linux-next, has it fell through the
cracks?
