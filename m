Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB0713921DD;
	Fri, 28 Aug 2026 11:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787914844; cv=none; b=TbReTJA/VwLS8Ez5IGl31c8ZYzJBdm9cgF2l2FoSY+pAsOM1Zf0s9OCgoKHSw8frUeo6WxYC+M7tynmGkOoVc+ecVzY/Xbalw+WyJbT5/C9H9aUHLb4LKql8gaGO3qZ9z0/kU/lugtAxVA/C1re4vdIgnyPgavB/L+Dam4yFtUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787914844; c=relaxed/simple;
	bh=/qhUprrDNLX/tJneZQd+Poo4n0a3K1dWxMXFQZHDfSs=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rjhlZocQVcPhSLp3N4/bJ6ct+bkmipQ/qtlKOvxB7Sek/U80ZKQuk9nPrKtKbNcCY/eTrDgSNvIKniLYUoMtchPy77PSPEyTMpYk1M6jGX4YfOXpQAaJMpI5Q/QU/U5b0EFtib6Xn+fkYQ8e487piAFfW5od6mKphu8CM9NTKpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=erL7lPk3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="erL7lPk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88B6A1F000E9;
	Fri, 28 Aug 2026 11:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787914842;
	bh=Eb1BvKKwTtbIY42JRUlbCa0/eJ/kSVwzFFKhEii/Y4k=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=erL7lPk30gNdLuGbtgQEDUIJdyTFOoXD4zT8bjrO/8SUl/gU7/+ASWfPfKDMejgzx
	 ZFRtdHQUmkqRff9WVfJAUet/44zEzCyx1V4naln+tmcYUoOB7RWpoUkotfbHSgqbbU
	 xg4tnXsLWXZQxn/xlXo1xmoT9qh6gYpePUC+0tSc=
Date: Fri, 28 Aug 2026 12:59:00 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gao Xiang <xiang@kernel.org>, cve@kernel.org,
	linux-kernel@vger.kernel.org, linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2026-80697: erofs: ensure valid f_path for page cache sharing
Message-ID: <2026082849-janitor-stonework-71c9@gregkh>
References: <2026082805-CVE-2026-80697-4e8a@gregkh>
 <apE9cS-ngksokyqh@192.168.5.19>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apE9cS-ngksokyqh@192.168.5.19>

On Fri, Aug 28, 2026 at 03:49:05PM +0800, Gao Xiang wrote:
> Hi Greg,
> 
> On Fri, Aug 28, 2026 at 08:53:20AM +0200, Greg Kroah-Hartman wrote:
> > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > 
> > Description
> > ===========
> > 
> > In the Linux kernel, the following vulnerability has been resolved:
> > 
> > erofs: ensure valid f_path for page cache sharing
> > 
> > Previously, backing files for page cache sharing were set up with
> > f_path left as NULL (only f_inode was valid).  It worked, but a recent
> > mincore fix relies on f_path.mnt and crashes (found by "erofs/028" on
> > 7.2-rc4):
> > 
> >  BUG: kernel NULL pointer dereference, address: 0000000000000018
> >  #PF: supervisor read access in kernel mode
> >  #PF: error_code(0x0000) - not-present page
> >  PGD 0 P4D 0
> >  Oops: Oops: 0000 [#1] SMP PTI
> >  CPU: 3 UID: 0 PID: 675528 Comm: fincore Not tainted 7.2.0-rc4-00002-g[]-dirty #1 PREEMPT(lazy)
> >  Hardware name: Red Hat KVM, BIOS 1.16.0-4.al8 04/01/2014
> >  RIP: 0010:__do_sys_mincore+0xc0/0x2c0
> >  ...
> > 
> > Specify valid paths using valid disconnected dentries together with
> > erofs_ishare_mnt instead of leaving f_path empty, so they are more
> > like real backing files in a pseudo filesystem and standard
> > backing_file_open() can be used directly.
> > 
> > The Linux kernel CVE team has assigned CVE-2026-80697 to this issue.
> > 
> > 
> > Affected and fixed versions
> > ===========================
> > 
> > 	Issue introduced in 7.1.4 with commit 04ba248d02d9eaa3d9077b00a6134caa75fa3e90 and fixed in 7.1.8 with commit 3879657c4ffd81b9a42cf575fc6cb60201032587
> > 	Issue introduced in 5.15.217 with commit 7368bec565bac3e536cd43579dbde1e715e6ba61
> > 	Issue introduced in 6.1.184 with commit b2f3d94ea310bea9d36d53e9d9b3f45e86c1d893
> > 	Issue introduced in 6.6.145 with commit 744b23aa430d52f5c8e4dbff7d71496d6643bed2
> > 	Issue introduced in 6.12.96 with commit 8344bdf0629457e532797b42d9d2bbf2a2900bbf
> > 	Issue introduced in 6.18.39 with commit 5c942ad7df75925ee166e7f0fb36892d8dde376b
> 
> I don't think that is correct, although commit e187bc02f8fa
> ("mm: do file ownership checks with the proper mount idmap") directly
> causes this issue, the entire page cache sharing feature was introduced
> in Linux 7.0.

Yes, but it was backported to all of the above stable kernels as well,
which is why they are listed that way.

> There is not any codebase below Linux 7.0 so it's possible to fix
> 5.15/6.1/6.6/6.12/6.18 in any case. The affected versions are only
> Linux 7.0+.

Even though e187bc02f8fa ("mm: do file ownership checks with the proper
mount idmap") was backported to those older trees?

thanks,

greg k-h
