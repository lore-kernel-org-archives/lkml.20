Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35339331EDD
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 04:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889837; cv=none; b=fobr9uC8GvnGDJKWcljxWCUjrgZ8RIvHxfLGgfU/uS3qKAnLOYbXz8wrVQ5lShNCsKQDLdO4HGAO8RRIlc+1XC/PRSSAZwnxNbS609VeH6tdYiTnkAN2gMvYByTkOfsB4dQGz0Nmlaby/iCbA6as0xcjvL4gMGfYgygRnUrei3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889837; c=relaxed/simple;
	bh=at4MzCRYdMWe5DyiKp+7K+WQ6IbelNnY0yPVNg0swdI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nw/aX+ZYHvV0W/RWkZM2mCkhMPDirmmhChiOMTpei4/BB3BGFeUDqYbz3P2k/+5e6aWWSUVuSu8S4gYC+tS9Vp9Qq/SyYoZSi7bXFK5k8RFUoXZLBAnSln8x0s4a6FXjg7sfNkWZxjkA7qKOHbVO6avj/ez4wDmHX1XNjn8wy0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vm5P/11f; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vm5P/11f"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-84e0688b7e8so300166b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Aug 2026 21:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787889835; x=1788494635; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J88uleibP0ZQrKnpifT+h+3IiWnC2AfPyx6u85pD0DE=;
        b=Vm5P/11fMldg/aGI2JEw/l5FhH/ABV9+pZC4mckUMc9lJTHp4DOGXJB7EeEm/f9Yyj
         YhhmhYJSDfw/Mlw0Uy7HkmTPH+PLy1uApd/wiRRYxFQ3Ui+76ACqxgaBBtZkezCCGUqs
         pOuWU0/dyf94Tz57F+2ry5AcxUDgd2PYAdTDA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889835; x=1788494635;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J88uleibP0ZQrKnpifT+h+3IiWnC2AfPyx6u85pD0DE=;
        b=OkNv3BmZnaqy7x9Z9ZzKj8+evsfLNJr0WjvJs6qCohSx/qAejnvJQsFb0Qy4qPyAXK
         C9SHUBGNoq+fWCuQh3OT1GYzG67HILiWv9RMaAjCIAAJgxpn+9ELqY1X5T8w7z8U34Ik
         n4Y7FnejowR1TTuMe65crvzTNEq30kZTrgfeK5cjYhVZCZBS5shjx9I4xfhzNGNtKPa1
         3TauxbmEHq+V8ssEdFacxaWfrXW3eV5pEuDcr8+juCvc64mRCkbVOUHX7ywhl8pSHG5F
         g7rXR0nU/TsDSOvy+skFYVYNXYH2sNAvFBiy2rKuvqskao7/EJTfi6SbWHaV+IH2OYkY
         sQzw==
X-Forwarded-Encrypted: i=1; AHgh+RqOaBIcX5PHiPtwNMzncsx3PHPY4Um/3g2xSR+0mxH3BkSaW/7LM+hCHPCjB5dTLK4BmlX491+hqJR7KCY=@vger.kernel.org
X-Gm-Message-State: AFuF++mJaadSKx4TrdN6ttv18GVoV1aPz4SH38HuYk+B4noE/Jr8vkmU
	Ni+YJA3WWNQB46BQ+x0JZjS+7hcnKQUjBwFwqusiTKbKlZstjALbacd9JgUXrFhjTQ==
X-Gm-Gg: AR+sD10YTzKv+hbX4QDVBPd9PvMaLCBLtKCVev9rvhEmc8X81dIHe8uvS4aMtlzjQyu
	K96DO9O+sXc7fUkMMQ2HTBwQf0aIRic2YdDx9yzwhkefKw9AboTVKaqA5pewaf9O+gcZEFKkxra
	TvRqlQXYuwbeu8C9bnYRTe87/6xBFPcdgWMQVbLrgSz3UsMKuq5/aawY7o8BTsjYd0hw2r/ukWW
	hP4z8d8YTGyxG76EtH3MFroKei7kVwRoQLhDRn3eHtis2YUEWwnzbovNweA3O+E/C6OrnP/iw3Y
	dnwuYab6JEg13XSvk7I6dZamFCTpRCXomXIfKf3lz+K+dN3qmCteM3SGcm4whGbSCBZ0BSGJWMJ
	Bbqgrvsd8prQL20bkepFP7r9qBbEH1MiH7WtK/834IwisSQXJ5mYA2H3ijPo6oF0Azm5nWje7Vy
	gpZOPZQpxptAdOBqS/50qDpxWvmY/t5BANyUsDzx7392nKXPyO4rPoOPtHVNM+aToKzj7IWNn6W
	jmVggF/rnOd6okIk5/2VqJEDDqh
X-Received: by 2002:a05:6a00:c8d:b0:846:4d4c:23f8 with SMTP id d2e1a72fcca58-85628988cb9mr8260004b3a.1.1787889835546;
        Thu, 27 Aug 2026 21:03:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2031:6:ff0:ad84:24b0:9e52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569fa79c1dsm179543b3a.16.2026.08.27.21.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 21:03:55 -0700 (PDT)
Date: Fri, 28 Aug 2026 13:03:51 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Baokun Li <libaokun@linux.alibaba.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	Theodore Ts'o <tytso@mit.edu>, Jan Kara <jack@suse.cz>, 
	Andreas Dilger <adilger.kernel@dilger.ca>, Ojaswin Mujoo <ojaswin@linux.ibm.com>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Zhang Yi <yi.zhang@huawei.com>, linux-ext4@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sarthak Kukreti <sarthakkukreti@google.com>
Subject: Re: [PATCH] fs/ext4: fix ABBA deadlock in ext4_rmdir()
Message-ID: <apEIlXQvvZ542SK3@google.com>
References: <20260827125158.4030598-1-senozhatsky@chromium.org>
 <3d3a1fdc-9d65-4524-9957-a872595e3621@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3a1fdc-9d65-4524-9957-a872595e3621@linux.alibaba.com>

On (26/08/28 10:48), Baokun Li wrote:
> On 2026/8/27 20:50, Sergey Senozhatsky wrote:
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
> Looks good!
> 
> Reviewed-by: Baokun Li <libaokun@linux.alibaba.com>

Thanks!
