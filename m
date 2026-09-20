Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1C831D39A;
	Sun, 20 Sep 2026 19:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789932856; cv=none; b=RNHyW74v1vqNeeMhNZPjOE0nO6H0crqiLV6lQiDaIvn0UZXf/kueG9y9iS6/Z+7M30geBBKiOcBhVdM25dOdSoAdx6WSDkGnOAKR2YZCcn1yutgJ40HGVjBDZ02mSfFMg3kiqPwDT6eqxBY1Y7Fd+BKkeNlhR7VxEf4ZQ0fWYRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789932856; c=relaxed/simple;
	bh=hlsd3m3XaxlMnkyj2kXHq1KaQ2IZivGdNU9KPFfZs9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s9qERXXIDb4kNOCM8TEqe8tzaiWFyaswK97rqTc5etNESFvJpa1Pc4Nz9kPO4Zgs7nyF1AswQ5XzaZNyul6l13OxG8JrEveBc4oV5bO/nN+jvgq9rNIa2z1Mnu5pPGDmDK/1v++Fo5jS/nJBUa0777fcDYGYBKAjzsUHu3r175U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=XkuWG9Vt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XkuWG9Vt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0131F000FF;
	Sun, 20 Sep 2026 19:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789932855;
	bh=Qrfc8pidtDCiYkdw3c4V5IP4Da46wHe+8fro0S4zdfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XkuWG9VthLnFV0MIWprMZRholWN+0GG2fzyguMxtkUZLQDMPkvCY5cIdgXgC4mG1V
	 hasqMI8cwMkCGwsB/iJ9bAGXOp91KJBC8u6oSUmOQea3PxRtWyODTFJWpUCzRSQzi2
	 bOz7VTnk1TrJjNCeipOvL296Ooll1U5LS2HDYJH4=
Date: Sun, 20 Sep 2026 21:34:11 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiale Yao <yaojiale02@163.com>
Cc: Johan Hovold <johan@kernel.org>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Kees Cook <kees@kernel.org>, Martyn Welch <martyn@welchs.me.uk>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: vme_user: kill fake VIRQ tasklet on exit
Message-ID: <2026092012-deuce-untitled-2254@gregkh>
References: <20260920170223.2068463-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920170223.2068463-1-yaojiale02@163.com>

On Mon, Sep 21, 2026 at 01:02:21AM +0800, Jiale Yao wrote:
> fake_irq_generate() schedules int_tasklet, which is embedded in struct
> fake_driver and receives fake_bridge as its data argument. fake_exit()
> frees both objects without waiting for a pending tasklet to complete.
> 
> This was reproduced on v6.18.52 under QEMU with the following sequence:

6.18 is NOT the latest kernel release to be doing testing or development
for.

>   1. Load vme_fake and vme_user to create /dev/bus/vme/ctl.
>   2. Issue VME_IRQ_GEN ioctls so fake_irq_generate() queues int_tasklet.
>   3. Concurrently unload vme_fake before ksoftirqd runs the tasklet.
>   4. fake_exit() frees the embedded tasklet and fake_bridge, after which
>      tasklet_action_common() accesses the freed tasklet.
> 
> KASAN reported:
> 
>   BUG: KASAN: slab-use-after-free in tasklet_action_common+0xee/0x6f0
>   Read of size 8 by task ksoftirqd/3/36
> 
>   Call Trace:
>    <TASK>
>    dump_stack_lvl+0x48/0x120
>    print_report+0x191/0x580
>    kasan_report+0x139/0x170
>    tasklet_action_common+0xee/0x6f0
>    handle_softirqs+0x159/0x4c0
>    run_ksoftirqd+0x1c/0x30
>    smpboot_thread_fn+0x385/0x700
>    kthread+0x5c6/0x730
>    ret_from_fork+0x15a/0x380
>    ret_from_fork_asm+0x1a/0x30
>    </TASK>
> 
> Unregister the bridge to remove the userspace entry point, then kill the
> tasklet before tearing down the bridge resources. This ensures any pending
> callback has completed before its storage and data argument are freed.

What about on the real hardware?  As per our previous statements, that's
the only way we can take LLM-found patches for staging drivers.

thanks,

greg k-h
