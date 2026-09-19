Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8A231B828;
	Sat, 19 Sep 2026 10:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813849; cv=none; b=NwiC/wVLTHxe9HXwdACRR8x7QjBONIqK6LSbp9T5Y9J4YpQz97y9B0AGzSl8nFtT1TVdd2raejXan6dD84QY3z8gF1x5V5njDI125B4hqsFiw8ZL/5uXFvpaCxeJ0uR0fyiqeART5xLhhvLc67abacHivPZoNTEd8eFqc/uPNE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813849; c=relaxed/simple;
	bh=zvxAdTkA2ZWrwNIE2DeKnxDR5Yb6BuHPL60yDwDxNyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6s080e2+WKLh7XMnJajMs1rDyhw87l/J3BuOoTtseQHi90kLMx5RA5SctFLjiAojuMYnc34/k+16Co/2eiaV3zZi+OojcFwh0Q63erhpKVZpaGfyIrUDyUtzEi1Dv/WWD1ykvwsXbnXxf28H8bJM5muQx9jA02QTOr/6kwdAM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VKsMTWaN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VKsMTWaN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63BBA1F000FF;
	Sat, 19 Sep 2026 10:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789813848;
	bh=9+JrqZLESg83r/L9t2zw2SfCemYznfhEdAeJlo+kcjk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VKsMTWaNDouUFQBXPJJ/zwQz2/eQW04dtYhCYWsBdocdoSPjBUjL3SvfBap8x+zOU
	 5qJR53f59BAeel32x3bDrkqD5uAYsn7f1JwtZo57SaBFLtAJQGc22jrJ6tUpfuBydo
	 ZLe0/tBhwoo8DUzK8hEFTrwGtKV5txmMAhyOxNUw=
Date: Sat, 19 Sep 2026 11:28:51 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Hui Peng <benquike@gmail.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: gadget: f_hid: fix use-after-free of
 hidg->func.config after unbind
Message-ID: <2026091930-corporate-destiny-7b45@gregkh>
References: <20260919090724.3256109-1-benquike@gmail.com>
 <20260919090724.3256109-2-benquike@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260919090724.3256109-2-benquike@gmail.com>

On Sat, Sep 19, 2026 at 09:07:24AM +0000, Hui Peng wrote:
> The /dev/hidgN character device stays open across function unbind: a
> process can open it, then remove the configfs gadget (echo "" > UDC,
> unlink the function from the config, rmdir the config directory), and
> keep using the still open file descriptor.
> 
> hidg_unbind() does not clear hidg->func.config, so the file operations
> continue to dereference the struct usb_configuration that configfs has
> already freed. f_hidg_get_report() does so unconditionally on entry:
> 
> 	struct usb_composite_dev *cdev = hidg->func.config->cdev;
> 
> which gives a use-after-free read on the first ioctl() after the config
> directory is removed:
> 
>  ==================================================================
>  BUG: KASAN: slab-use-after-free in f_hidg_get_report.isra.0+0x401/0x4a0
>  Read of size 8 at addr ffff8881073d7950 by task init/172
> 
>  CPU: 2 UID: 0 PID: 172 Comm: init Not tainted 7.3.0-rc3-g5dd1818b15d9 #1 PREEMPT(lazy)
>  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996)
>  Call Trace:
>   <TASK>
>   dump_stack_lvl+0x70/0xa0
>   print_report+0x153/0x4c6
>   kasan_report+0xf1/0x120
>   f_hidg_get_report.isra.0+0x401/0x4a0
>   f_hidg_ioctl+0xe1/0x110
>   __x64_sys_ioctl+0x184/0x1d0
>   do_syscall_64+0xda/0x4b0
>   entry_SYSCALL_64_after_hwframe+0x77/0x7f
>   </TASK>
> 
>  Allocated by task 1:
>   __kmalloc_cache_noprof+0x16a/0x380
>   config_desc_make+0x1e6/0x590
>   configfs_mkdir+0x4e9/0xe10
>   vfs_mkdir+0x2ed/0x790
>   __x64_sys_mkdir+0x6f/0xa0
> 
>  Freed by task 1:
>   kfree+0x159/0x420
>   config_item_cleanup+0x148/0x1e0
>   config_item_put+0x90/0xb0
>   configfs_rmdir+0x816/0xa50
>   vfs_rmdir+0x2e6/0x810
>   __x64_sys_rmdir+0x4b/0x70
> 
>  The buggy address belongs to the object at 0xffff8881073d7800
>   which belongs to the cache kmalloc-1k of size 1024
>  ==================================================================
> 
> A second splat follows from the ERROR() call in the same function.
> 
> Clear hidg->func.config in hidg_unbind() and check it in the paths that
> are reachable from an open file descriptor - f_hidg_read(),
> f_hidg_write() and f_hidg_get_report() - returning -ENODEV once the
> function is gone. f_hidg_req_complete() only uses the pointer to emit an
> error message, so guard that dereference as well.
> 
> While at it, drop the report_list entries in hidg_unbind(). They are
> allocated by f_hidg_get_report() and were only ever freed when the
> whole f_hidg was released, so reports queued before an unbind leaked.
> 
> Assisted-by: LLM
> Signed-off-by: Hui Peng <benquike@gmail.com>
> ---
> No Fixes: tag: I could not identify a single commit that introduced
> the problem with confidence, so I have left it out rather than guess.

Please have your llm figure that out, worst case it's when it showed up,
right?

thanks,

greg k-h
