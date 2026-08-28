Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B037FF7A;
	Fri, 28 Aug 2026 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914872; cv=none; b=XHsfpGDTnWRT/7eEFGxo8lFcXla4gomJxcwo/MGW+XowAmtalAR537WOsubLUxJipwzxfPDGRhulDcsOX5HgOzh3yxgosnzSe2kJPBIr0ZtsFpzdEc64p+1WTCtckeaBen74kxe4wuKppotLPqVKQsb7YtDNgLKIoto3FGlVGZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914872; c=relaxed/simple;
	bh=olt9JUXxDpO9fNxmZZj7IpOBgkbM7qx1McVa78ku3Xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkffK9rSW7s9rZU4AYEa9pjDALNwx05tbterjPaisQcfKdpzPl2JgWpPlptakDUnmsTl4X67TOdRh7kQtFWHo7xGJ8FCDcS33Kc28K5PIOXh8OONo102oEd5+nxPkoEdUANLZ6lz8cfSOfH5lSrZ4eWdQtEAwwqAs27ZvhBofXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=K5htBN/8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="K5htBN/8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBAE11F000E9;
	Fri, 28 Aug 2026 11:01:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787914871;
	bh=ejw9aTfCkM79YbcBSBZWsnRyPc0H70d7lS7NYKBCXWQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K5htBN/8PezULxGo2M9b4C3XAMrXmRiPCKf4Td3kGqM+T3XnXOhM335bbdivPzSbi
	 8vFfl0igHizh/VOWLLfCz6cQt9bJUVjMfATyXWtv/s9y4JN+X5p5bAGJ6q0f0GszAm
	 FPx3v7EGw9pKVAowIV00QsmM2XLbu5q0aTQkmQi4=
Date: Fri, 28 Aug 2026 12:59:29 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Farhad Alemi <farhad.alemi@berkeley.edu>
Cc: Peter Chen <peter.chen@kernel.org>, falemi@asu.edu,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [BUG] ci_hdrc_add_device -- KASAN slab-out-of-bounds reading a
 FOREIGN device's platform_data
Message-ID: <2026082817-trough-wasting-29bd@gregkh>
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

Why are these still being sent?

confused,

greg k-h
