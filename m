Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2983D79E2
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719440; cv=none; b=m/k9vwc+JXoJPTHkJoUUYg/pj8BUZsXpi8XT4+f2Fg9ZoxhZ64eglz2bWko6DWb7ulmkkwYjpJxUFD0c0EXEyaveYtntJoRoUgj3Or0J/b1Z9p5Yi9IOM9BmfhcE/YkAlpWIy+sy/Wu4m+kr4Q9jWFwfI+SxMxUJyH6b4TEOyqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719440; c=relaxed/simple;
	bh=/u2eXRmSb4OcUZDZD3lQ9FKQXOfh/RXNS6kZGoIaOLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zx/MB7sodqXRP8kMGsPcApjXTOgs3uBKBVrpd8kU+1J+6Om3R0PUhok8wsMmmZJNwoC631qWTkHJ5H0Zw59YtglVy9rMo+SK2oBejXlAp/ci4ACtUjxvYbmOT0zdZNj0t58Fe3Cw+lU7JvjFNCP5J+bOHLECS1Jn4C5wOIMkEGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=0kPn+oNs; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0kPn+oNs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8769A1F000FF;
	Fri, 18 Sep 2026 08:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789719439;
	bh=MUrsCjZc6euzUQ7OuHMOKoSdi0r9jYkb2LhwvEX8C0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=0kPn+oNsVLh4AduVSrGyi9UaFNo8r7V7Z/dqYwyTZkD0JD1Mmk5f26Z8MHez0enAY
	 MdLOOMnCg2ljGGwdQfgKNLL9xGRTEe9ns46+toyogg/yvuNG2EzSzABy8/UTsc2nHs
	 2KfV3IiXjkqPNe9IFKuza1e+SeHgZLjV+crGqWJQ=
Date: Fri, 18 Sep 2026 09:15:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shyam Saini <shyamsaini@linux.microsoft.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] params: serialize lookup_or_create_module_kobject()
Message-ID: <2026091813-stuffy-tusk-3d31@gregkh>
References: <20260918013445.1849655-1-xujiakai24@mails.ucas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918013445.1849655-1-xujiakai24@mails.ucas.ac.cn>

On Fri, Sep 18, 2026 at 01:34:45AM +0000, Jiakai Xu wrote:
> lookup_or_create_module_kobject() first looks up the module kobject with
> kset_find_obj() and, if not found, creates a new one with
> kobject_init_and_add().  The function is called at runtime from
> module_add_driver() since commit f95bbfe18512 ("drivers: base: handle
> module_kobject creation"), which means two concurrent driver
> registrations for the same built-in module name can both miss the
> lookup and race to create the same kobject.
> 
> The loser of the race gets -EEXIST from kobject_init_and_add() and its
> kobject is removed from module_kset by kobject_add_internal() before
> the failure is reported.  The error path then calls kobject_put(),
> which invokes module_kobj_release(), but that only completes
> ->kobj_completion and never frees the dynamically allocated
> module_kobject, leaking it (96 bytes) along with the object having been
> detached from the kset.
> 
> This is triggerable by unprivileged users, e.g. by concurrently issuing
> the RAW_IOCTL_INIT ioctl of the raw-gadget driver, which registers the
> "raw_gadget" driver on the gadget bus:
> 
>   sysfs: cannot create duplicate filename '/module/raw_gadget'
>   ...
>   Adding module 'raw_gadget' to sysfs failed (-17), the system may be
>   unstable.
>   ...
>   unreferenced object 0xffff8880188dacc0 (size 96):
>     backtrace:
>       lookup_or_create_module_kobject+0x47/0x100
>       module_add_driver+0x73/0x1b0
>       bus_add_driver+0x1d9/0x340
>       driver_register+0xde/0x170
> 
> Fix it by serializing the lookup and the creation with a mutex, so that
> the second caller finds the kobject created by the first one instead of
> racing with it.
> 
> Fixes: f95bbfe18512 ("drivers: base: handle module_kobject creation")
> Fixes: 7c76c813cfc4 ("kernel: globalize lookup_or_create_module_kobject()")
> Signed-off-by: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
> ---
>  kernel/params.c | 29 ++++++++++++++++++++++++-----
>  1 file changed, 24 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/params.c b/kernel/params.c
> index 8b25133fed242..78f00d3f6a165 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -20,6 +20,11 @@
>  /* Protects all built-in parameters, modules use their own param_lock */
>  static DEFINE_MUTEX(param_lock);
>  
> +/* Serializes module kobject lookup and creation in
> + * lookup_or_create_module_kobject()
> + */
> +static DEFINE_MUTEX(mod_kobject_mutex);
> +
>  /* Use the module's mutex, or if built-in use the built-in mutex */
>  #ifdef CONFIG_MODULES
>  #define KPARAM_MUTEX(mod)	((mod) ? &(mod)->param_lock : &param_lock)
> @@ -754,13 +759,24 @@ lookup_or_create_module_kobject(const char *name)
>  	struct kobject *kobj;
>  	int err;
>  
> +	/*
> +	 * The lookup and the creation must be done atomically, otherwise
> +	 * concurrent callers may race to create the same kobject, and the
> +	 * loser of the race gets -EEXIST from kobject_init_and_add().
> +	 */
> +	mutex_lock(&mod_kobject_mutex);
> +
>  	kobj = kset_find_obj(module_kset, name);
> -	if (kobj)
> -		return to_module_kobject(kobj);
> +	if (kobj) {
> +		mk = to_module_kobject(kobj);
> +		goto out;
> +	}
>  
>  	mk = kzalloc_obj(struct module_kobject);
> -	if (!mk)
> -		return NULL;
> +	if (!mk) {
> +		mk = NULL;
> +		goto out;
> +	}
>  
>  	mk->mod = THIS_MODULE;
>  	mk->kobj.kset = module_kset;
> @@ -771,12 +787,15 @@ lookup_or_create_module_kobject(const char *name)
>  		kobject_put(&mk->kobj);
>  		pr_crit("Adding module '%s' to sysfs failed (%d), the system may be unstable.\n",
>  			name, err);
> -		return NULL;
> +		mk = NULL;
> +		goto out;
>  	}
>  
>  	/* So that we hold reference in both cases. */
>  	kobject_get(&mk->kobj);
>  
> +out:
> +	mutex_unlock(&mod_kobject_mutex);
>  	return mk;
>  }
>  
> -- 
> 2.34.1
> 
> 
> -- 
> Below is the crash report:
> BUG: memory leak
> unreferenced object 0xffff8880188dacc0 (size 96):
>   comm "syz.3.569", pid 12998, jiffies 4294992047
>   hex dump (first 32 bytes):
>     12 4e fe 86 ff ff ff ff c8 ac 8d 18 80 88 ff ff  .N..............
>     c8 ac 8d 18 80 88 ff ff 00 00 00 00 00 00 00 00  ................
>   backtrace (crc 8dccd85e):
>     kmemleak_alloc_recursive home/zzzrrll/tmp/kf_src/linux-7.3-rc2/include/linux/kmemleak.h:44 [inline]
>     slab_post_alloc_hook home/zzzrrll/tmp/kf_src/linux-7.3-rc2/mm/slub.c:4696 [inline]
>     slab_alloc_node home/zzzrrll/tmp/kf_src/linux-7.3-rc2/mm/slub.c:4996 [inline]
>     __kmalloc_cache_noprof+0x1bf/0x420 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/mm/slub.c:5559
>     _kmalloc_noprof home/zzzrrll/tmp/kf_src/linux-7.3-rc2/include/linux/slab.h:991 [inline]
>     _kzalloc_noprof home/zzzrrll/tmp/kf_src/linux-7.3-rc2/include/linux/slab.h:1312 [inline]
>     lookup_or_create_module_kobject+0x47/0x100 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/kernel/params.c:761
>     module_add_driver+0x73/0x1b0 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/base/module.c:46
>     bus_add_driver+0x1d9/0x340 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/base/bus.c:767
>     driver_register+0xde/0x170 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/base/driver.c:174
>     usb_gadget_register_driver_owner+0x50/0x140 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/usb/gadget/udc/core.c:1752
>     raw_ioctl_run home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/usb/gadget/legacy/raw_gadget.c:596 [inline]
>     raw_ioctl+0xa26/0x1830 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/drivers/usb/gadget/legacy/raw_gadget.c:1307
>     vfs_ioctl home/zzzrrll/tmp/kf_src/linux-7.3-rc2/fs/ioctl.c:51 [inline]
>     __do_sys_ioctl home/zzzrrll/tmp/kf_src/linux-7.3-rc2/fs/ioctl.c:597 [inline]
>     __se_sys_ioctl+0xbc/0x130 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/fs/ioctl.c:583
>     do_syscall_x64 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/arch/x86/entry/syscall_64.c:61 [inline]
>     do_syscall_64+0x12b/0x350 home/zzzrrll/tmp/kf_src/linux-7.3-rc2/arch/x86/entry/syscall_64.c:84
>     entry_SYSCALL_64_after_hwframe+0x77/0x7f
> 
> 
> <<<<<<<<<<<<<<< tail report >>>>>>>>>>>>>>>
> 
> ---
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
