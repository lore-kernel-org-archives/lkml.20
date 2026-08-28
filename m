Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF25C613
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889809; cv=none; b=IaYUysEPP5md65G7elN3dV52Q39x0G7XItGquNDwI0pPKdWlFkDLcNjureS/4PWIGU54NSBV+yTwTzffIjlkSNxB7omSCfgr8ozQ18Qh4wuH+PS8Wsv9hwoAxSwy0OidjRrCz40AQSFNQQ8mnXxhjVkAjnLXH3n+OR1Hf+T/BYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889809; c=relaxed/simple;
	bh=+c9TrG6qF/RXwVUQ4mNgi8tG1UO/SMVAweFNSnaCzXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FIqoo8CXUd+iLuJ67rsEt3aITfEkLH6g8lLbtkPYtauAFUlnwL55j18CKCxVCp4urK1rbGrhFyWURKIyhYuTBjon/lvL+8IJwqGfgW6tgSMTQ1iJ22N+SdfN6QkHSBpIoLN3uv610iOEBPrvNHLhH/yKJOp6lmWszLTbyxjcPUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eMd6DlV/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eMd6DlV/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2d560775ca2so3318265ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787889807; x=1788494607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jq/31s+3lvVSdHJF5/gGzjaWQfMFo0wDOdnUMkxXYI=;
        b=eMd6DlV/t59r/v7Tp0v96bynXZZ41Jn8bDsIhxtpDvZ6PPzM+poka9KaPHvhzWsNDC
         Ogc8MOSHZbY1kwNYhj5UUvXOPRY+mqYahHZT0HupHycprdZW5l5vthso4AgylAssrHAs
         btgcO0abEJbqf2eUAprQnkfac+Y4TErTUOpGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889807; x=1788494607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jq/31s+3lvVSdHJF5/gGzjaWQfMFo0wDOdnUMkxXYI=;
        b=SxWHPoQP5mJ37q4yY0o1goLJTEBkA31aeAoAU6JwubBJShHFsr1v+aCWPWsYPIiomk
         R6zHF3RNTV2sNxOQ9OrB85TTcQUDcpBjkcWoIqrD8QFPM2TIqY8xHWd7kXGrgsDGFgzq
         s63wmkUYRpjXR49qOQIiMuZnRiiEQxhhXZQvY8Kv/Hz8tF/U8uqL8TTd5PHhOeRo9e9P
         qguNFrgnGQxX8RGfq8Vgqa+4Es5Cmk1Uxsk6wUT0Vc4GTjnG61dGf1Q2IbPV5ExE/1FD
         coFSCZOQ6+7jdQxrjeVIKDL0bhfo9DJKYciPxFrbGJPCbL79CSznMdPu4VkXHtxSgtxL
         9CqA==
X-Forwarded-Encrypted: i=1; AHgh+RonS/W8qxYf3BVj/0MzPSmUbvHJ8W+8xt7xtZcC41buEZa9sEw2dZNpoyuMGriyNT8Kw/HFGtwqSt+Ft1E=@vger.kernel.org
X-Gm-Message-State: AFuF++lA8aM5q9OC7JnKz5T+MzXXBVrtNcOxfHgirYPGH47NN8cPobhz
	aJErLVKaDz+dx9erpARtf4DStCYb8j5VCEeKqlSts1hvP/ZgSKbxDRQOODKO5oqHQg==
X-Gm-Gg: AR+sD11/ux66KAN5Xy6auyS++ip9O9bUTV8N9ds3zAE4WMtWbE3+zelR+QQvwWtlvvg
	Dw6z9eGp2/HIEoXq7K7jOAg35OsEj3TxFKYJWgWroH60d3UausYt5qx3XhdlHe9VK8zwd1r1E1A
	v2WU6ZzxcTPhytPvb2nRBRYFBhJQPF0EIEirlBLgGgL/+3dTFuaRB//qYJ234QN2P/Hdcnur4Ne
	s96QlzsD5wnrp13gUJU+UHS/lFtEubPkJQtBzfpyep6bqr38MpE8zE/ImFZJ1kKl6IUmvNkYiFF
	o3Uu5nQW4wChbEh4geIk7zbLS4TYLJ3XBrurAzXmE/WXoocwCOesIooIx5t2haV8/LEEVLuB6mq
	AQJjZmR+3WSPjyyKcAMs4IPGKVUJsbutfSRAqwzH7o2lKLT914ZcRxipaQmx9NYgp7ywa2pnChG
	/+jWQO4nOw3PqCYfZOsE57qPjGc8IgOQPt3GzDBWd/3xuNxrVfCD1x4Q8lNoRDL/MPGzmVZsmfQ
	PFMh9wfy5I//FeAkTMRkwGB/5I=
X-Received: by 2002:a17:90b:2f0f:b0:380:540:d499 with SMTP id 98e67ed59e1d1-396d0ed0023mr8803932a91.6.1787889807324;
        Thu, 27 Aug 2026 21:03:27 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396db196903sm790271a91.0.2026.08.27.21.03.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:03:26 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:03:23 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Jan Kara <jack@suse.cz>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Theodore Ts'o <tytso@mit.edu>, Andreas Dilger <adilger.kernel@dilger.ca>, 
	Baokun Li <libaokun@linux.alibaba.com>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Subject: Re: [PATCH] fs/ext4: fix ABBA deadlock in ext4_rmdir()
Message-ID: <apEIfeA6sftEfv3l@google.com>
References: <20260827125158.4030598-1-senozhatsky@chromium.org>
 <a5zm7znmyelavclrssrhtxcksozgkgjadefvdojpeabck7hstr@tn7yhv2dey63>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a5zm7znmyelavclrssrhtxcksozgkgjadefvdojpeabck7hstr@tn7yhv2dey63>

On (26/08/27 15:41), Jan Kara wrote:
> On Thu 27-08-26 21:50:20, Sergey Senozhatsky wrote:
> > We observe the following ABBA deadlock (casefolding enabled):
> > 
> >  INFO: task jbd2/dm-13-8:447 blocked for more than 720 seconds.
> >  task:jbd2/dm-13-8    state:D stack:0     pid:447   tgid:447   ppid:2
> >  Call Trace:
> >   <TASK>
> >   __schedule+0xc2c/0xe60
> >   schedule+0x40/0xe0
> >   jbd2_journal_wait_updates+0x8f/0xf0
> >   jbd2_journal_commit_transaction+0x321/0x1850
> >   kjournald2+0xa9/0x230
> >   kthread+0x226/0x2a0
> >   ret_from_fork+0x101/0x1e0
> >   ret_from_fork_asm+0x1a/0x30
> > 
> >  INFO: task Thread-10:4161 blocked for more than 720 seconds.
> >  task:Thread-10       state:D stack:0     pid:4161  tgid:3848  ppid:540
> >  Call Trace:
> >   <TASK>
> >   __schedule+0xc2c/0xe60
> >   schedule+0x40/0xe0
> >   wait_transaction_locked+0x8c/0xd0
> >   start_this_handle+0x252/0x870
> >   jbd2__journal_start+0x120/0x280
> >   __ext4_journal_start_sb+0x11a/0x250
> >   ext4_evict_inode+0x208/0x760
> >   iput+0x222/0x5c0
> >   dput+0x293/0x690
> >   ____fput+0x145/0x2b0
> >   task_work_run+0x7a/0xb0
> >   exit_to_user_mode_loop+0xc0/0xd0
> >   do_syscall_64+0x14b/0xf10
> >   entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > 
> >  NMI backtrace for cpu 0
> >  CPU: 0 UID: 1010216 PID: 4160 Comm: Thread-7
> >  RIP: 0010:d_walk+0x0/0x290
> > [..]
> >  Call Trace:
> >  <TASK>
> >   shrink_dcache_parent+0xb2/0x100
> >   d_invalidate+0x50/0x110
> >   ext4_rmdir+0x3a2/0x3d0
> >   vfs_rmdir+0x9d/0x1d0
> >   do_rmdir+0xf0/0x330
> >   __x64_sys_unlinkat+0x34/0x50
> >   do_syscall_64+0x61/0xf10
> > 
> > The problem is that ext4_rmdir() calls d_invalidate() before stopping
> > the jbd2 transaction handle.  Because d_invalidate() traverses child
> > dentries it can encounter dying or in-use dentries.  If a concurrent
> > thread executing __dentry_kill() on a child dentry invokes ext4_evict_inode(),
> > it requests a new transaction handle via ext4_journal_start(), which
> > waits for all running handles to close.  However, the thread executing
> > ext4_rmdir() still holds its active transaction handle while looping
> > in shrink_dcache_parent() waiting for the dying child dentry to complete
> > eviction.
> > 
> > Stop transaction handle in ext4_rmdir() before calling d_invalidate().
> > 
> > Fixes: b886ee3e778e ("ext4: Support case-insensitive file name lookups")
> > Co-developed-by: Sarthak Kukreti <sarthakkukreti@google.com>
> > Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
> > Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Good catch! Feel free to add:
> 
> Reviewed-by: Jan Kara <jack@suse.cz>

Thanks!
