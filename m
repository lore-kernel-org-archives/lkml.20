Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B8CB3164D6;
	Fri, 28 Aug 2026 06:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787896883; cv=none; b=cMqwsPJSmKf9B5D4KXSTDfaNxC/xx1ywlCQkm3tUmnxa82NCM62i7LXW51y3XcZ+3cZYz6jZHSr7LsSDwFPVihB4dWKhUgnxo95lxe7Xpy5XHT1oZZqiPiojlzmZjL04I8OBHGLkocem4Pop9EzAWPgC6AH7lEZDYTK3bG37u/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787896883; c=relaxed/simple;
	bh=VPAbRQr/jWbkpXbYRBRH8KfU3WKR8YVoUxa9dcxykuo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aVDE7sZoI5APZs1XpHOjTvKwYMjVdoQQ7xkJH0rpFZRIKD0WXBKo9M8OrN7MeB4sYe9d2ZpQXRsX5H3RsDjxHNwFu7KEOZiRI/ts1cioIayTQgTgbHCM0z/x6G2q93JoXJGTLi1T02OI7yg1Dmw/Se9zf3Dsyqda4gxu/CqqzxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=BctbHs0u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BctbHs0u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C301F000E9;
	Fri, 28 Aug 2026 06:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787896881;
	bh=Z4aBYto3g5DKBcfBg5ZRaifJbJJzScL0/wgdons7Ujk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BctbHs0uTWhDWeFB94vl3e7Bqks9COPmmcsWPj0WOaC6Nnw6yUhMSYzBaT2qiyP9t
	 AK6tFxbH1jp497RvI4UY3O3wiXhtx2AL+DHAYSWQBFqR1kyKTrj00MbPx/FZuqe6uO
	 np8Md56ktvdA305rVTeSxMECYfGO9bDwbbviz/PM=
Date: Fri, 28 Aug 2026 08:01:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Peter Chen <peter.chen@kernel.org>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
Message-ID: <2026082846-lethargic-ability-93dd@gregkh>
References: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+0ovCi63OBqOySpNgU5xND840CDhi3B1dp1QsxhmcOOo-7w1w@mail.gmail.com>

On Thu, Aug 27, 2026 at 10:34:56PM -0700, Farhad Alemi wrote:
> Hello,
> 
> As part of the kernel research at ASU's SEFCOM
> lab, we hit the crash below. Crash reports can be found here:
> 
>   https://github.com/farhad-alemi/public_bug_reports/tree/main/150-usb-chipidea-foreign-platform_data-oob/
> 
>   BUG: KASAN: slab-out-of-bounds in ci_hdrc_add_device+0xb76/0xd10
>   Read of size 4 at addr ffff88810e9061c8 by task repro/9505
>   Call Trace:
>    ci_hdrc_add_device+0xb76/0xd10
>    ci_hdrc_usb2_probe+0x22d/0x370
>    platform_probe+0xf9/0x190
>    really_probe+0x267/0xaf0
>    __driver_probe_device+0x1e2/0x350
>    device_driver_attach+0xe0/0x1d0
>    bind_store+0x1d0/0x220
>    kernfs_fop_write_iter+0x3af/0x540
>    vfs_write+0x61d/0xb90
>    ksys_write+0x150/0x270
> 
> Our reproducer.c is available upon request.
> 
> Happy to test a patch if that would help.

Please send such a patch.

But again, stop messing around with root-only sysfs files without
understanding that you get to keep the broken pieces of the kernel if
you touch them :)

thanks,

greg k-h
