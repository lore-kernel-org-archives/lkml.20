Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84AA12FABFB
	for <linux-kernel@vger.kernel.org>; Fri, 18 Sep 2026 08:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789719491; cv=none; b=loKd4xzFSYSSNoLYPQAsJ5Aq+Larnmq3D9Ctlbas9hHHB/abZD4/ogdUTxCdqEi4qo42ek7+VyAzsPg0Nbez4bPsQDY9+cXPwrBhWwYOl2fSgETHUdl7/WwTWQ+HiLPqm8zQbklJSgnv9QHSLxPzTmkKYXDMf/pW5qPSF/GutS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789719491; c=relaxed/simple;
	bh=ePX6YI9j6S9cQxpxPCzpaXHm+MqZpoE8HXpQP8CClV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OjDKYETjC2dxY1M1nedwZivSPq9atPgH3ZlVwkc6RE0w/OEZlx+k4MbhKfhfb8Ywvucf1lIdbWNEKjeqNTTi3Oyg8aKxLcxK7CqysGtqNrv4YU+G91imFvLypjM9O3schjw4PE2jKqkAR8o4GgqAPvV+TcNxgnM2Rhwq1XpSuvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lam2Sabk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lam2Sabk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EADE1F000FF;
	Fri, 18 Sep 2026 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789719489;
	bh=PrhDJTaRmGc2ySZ8fHp4jd6SIA9/f4tzn2Rwl+FB2wE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lam2Sabk9J4NPhr6XGijKjHNiIvxGgqmCLZWCUvcP7NGIngQsSa4aVVPyvH5wTiZt
	 7obyb4BOYYCUfy2Phe9JLjlZ5kugUAPCDA1lJ26Pu+h89cS6jw3TPm4fZ5GV6lBXAP
	 0gyuhXtDz1x2KJaDIF2M5hTAKhsLDYXDYPGChggE=
Date: Fri, 18 Sep 2026 09:16:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jiakai Xu <xujiakai24@mails.ucas.ac.cn>
Cc: Petr Pavlu <petr.pavlu@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Shyam Saini <shyamsaini@linux.microsoft.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <kees@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] params: serialize lookup_or_create_module_kobject()
Message-ID: <2026091832-thesis-implicate-ba51@gregkh>
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

Did you forget an Assisted-by: tag?

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

Wrong coding style :(

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

guard()?

thanks,

greg k-h
