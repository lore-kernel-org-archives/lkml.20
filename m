Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B1B44AB89;
	Fri, 28 Aug 2026 12:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787918965; cv=none; b=SSzmitNod4Za4y07/1z+fH8mVEj3Hj/Cp6fwKxoSTku5LJdAoJEgKUeIWEn2egslSDN02pD+XCL/AEK5c0jw/zDnfPyp3I/qBTNFb24k0N8+Gdwc/ZegXbah0qnqlAtEjnamylAHj/CQwAASXItmEloafLOFcKdw7Pdz0OIQmZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787918965; c=relaxed/simple;
	bh=MljRQWlGTL3dzK1MXg4OIWw8gQgURX7U+bXzXlpvLmQ=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ke4xxR8/xsg44h1ULw4embdO/CGBZ2cV1CFf8OnocA/Phv2pMN7VF7fp3wR0cfwgj+SC+lp1pzCjpKzvUGMFNDVKH6TDJg0+gI+CBcV8rZHXN9f+pDlS+ry+NqMs6NJElWARvgf4PY/G0CsLsP+D7ScaynSXhj5VX4QqQXvQRAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ziZNJ6e4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ziZNJ6e4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED4821F000E9;
	Fri, 28 Aug 2026 12:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787918952;
	bh=48rzmK+HCqiY8vexqGfrnERuQwA101HhhU1exDdQKNY=;
	h=Date:From:To:Subject:References:In-Reply-To;
	b=ziZNJ6e4ibLphgse0OciC/Kx3bJvOJbYdKy1Jq2MHs+TGq8RmIwZrbCz+zcYrZyB4
	 XfuCL81+SgV370V23RwBXGaVlHU9byHsdWhSkMmQMlawMhVDBVxPiCeGfhAiu0yGp2
	 fE5VSh19EZh3D20kwzfllQD+Lx57N66TIdS04B1o=
Date: Fri, 28 Aug 2026 14:07:30 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Gao Xiang <xiang@kernel.org>, cve@kernel.org,
	linux-kernel@vger.kernel.org, linux-cve-announce@vger.kernel.org
Subject: Re: CVE-2026-80697: erofs: ensure valid f_path for page cache sharing
Message-ID: <2026082838-penalty-stark-190f@gregkh>
References: <2026082805-CVE-2026-80697-4e8a@gregkh>
 <apE9cS-ngksokyqh@192.168.5.19>
 <2026082849-janitor-stonework-71c9@gregkh>
 <apFxN8fDUzdfbhX8@192.168.5.19>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apFxN8fDUzdfbhX8@192.168.5.19>

On Fri, Aug 28, 2026 at 07:29:59PM +0800, Gao Xiang wrote:
> On Fri, Aug 28, 2026 at 12:59:00PM +0200, Greg KH wrote:
> > On Fri, Aug 28, 2026 at 03:49:05PM +0800, Gao Xiang wrote:
> > > Hi Greg,
> > > 
> > > On Fri, Aug 28, 2026 at 08:53:20AM +0200, Greg Kroah-Hartman wrote:
> > > > From: Greg Kroah-Hartman <gregkh@kernel.org>
> > > > 
> > > > Description
> > > > ===========
> > > > 
> > > > In the Linux kernel, the following vulnerability has been resolved:
> > > > 
> > > > erofs: ensure valid f_path for page cache sharing
> > > > 
> > > > Previously, backing files for page cache sharing were set up with
> > > > f_path left as NULL (only f_inode was valid).  It worked, but a recent
> > > > mincore fix relies on f_path.mnt and crashes (found by "erofs/028" on
> > > > 7.2-rc4):
> > > > 
> > > >  BUG: kernel NULL pointer dereference, address: 0000000000000018
> > > >  #PF: supervisor read access in kernel mode
> > > >  #PF: error_code(0x0000) - not-present page
> > > >  PGD 0 P4D 0
> > > >  Oops: Oops: 0000 [#1] SMP PTI
> > > >  CPU: 3 UID: 0 PID: 675528 Comm: fincore Not tainted 7.2.0-rc4-00002-g[]-dirty #1 PREEMPT(lazy)
> > > >  Hardware name: Red Hat KVM, BIOS 1.16.0-4.al8 04/01/2014
> > > >  RIP: 0010:__do_sys_mincore+0xc0/0x2c0
> > > >  ...
> > > > 
> > > > Specify valid paths using valid disconnected dentries together with
> > > > erofs_ishare_mnt instead of leaving f_path empty, so they are more
> > > > like real backing files in a pseudo filesystem and standard
> > > > backing_file_open() can be used directly.
> > > > 
> > > > The Linux kernel CVE team has assigned CVE-2026-80697 to this issue.
> > > > 
> > > > 
> > > > Affected and fixed versions
> > > > ===========================
> > > > 
> > > > 	Issue introduced in 7.1.4 with commit 04ba248d02d9eaa3d9077b00a6134caa75fa3e90 and fixed in 7.1.8 with commit 3879657c4ffd81b9a42cf575fc6cb60201032587
> > > > 	Issue introduced in 5.15.217 with commit 7368bec565bac3e536cd43579dbde1e715e6ba61
> > > > 	Issue introduced in 6.1.184 with commit b2f3d94ea310bea9d36d53e9d9b3f45e86c1d893
> > > > 	Issue introduced in 6.6.145 with commit 744b23aa430d52f5c8e4dbff7d71496d6643bed2
> > > > 	Issue introduced in 6.12.96 with commit 8344bdf0629457e532797b42d9d2bbf2a2900bbf
> > > > 	Issue introduced in 6.18.39 with commit 5c942ad7df75925ee166e7f0fb36892d8dde376b
> > > 
> > > I don't think that is correct, although commit e187bc02f8fa
> > > ("mm: do file ownership checks with the proper mount idmap") directly
> > > causes this issue, the entire page cache sharing feature was introduced
> > > in Linux 7.0.
> > 
> > Yes, but it was backported to all of the above stable kernels as well,
> > which is why they are listed that way.
> 
> I know e187bc02f8fa was backported to these kernels, but as I said,
> this commit directly caused the issue (without e187bc02f8fa, there
> is no panic at all, so "Fixes:" points to it), but the fact that
> backporting e187bc02f8fa to older stable kernels doesn't mean the
> fix ("erofs: ensure valid f_path for page cache sharing") need to
> be backported to these old kernels too since the page cache sharing
> feature won't exist in kernels below 7.0 in any way.
> 
> > 
> > > There is not any codebase below Linux 7.0 so it's possible to fix
> > > 5.15/6.1/6.6/6.12/6.18 in any case. The affected versions are only
> > > Linux 7.0+.
> > 
> > Even though e187bc02f8fa ("mm: do file ownership checks with the proper
> > mount idmap") was backported to those older trees?
> 
> Yes, it's just impossible to apply "erofs: ensure valid f_path for page
> cache sharing" to stable kernels < 7.0 since the feature was introduced
> by upstream commit 5ef3208e3be5 ("erofs: introduce the page cache share
> feature") [1].
> 
> [1] https://lwn.net/Articles/1057769/#:~:text=The%20filesystem%20also%20shares%20page%2Dcache%20entries%20for%20identical%20files

Ah, that makes more sense.  I've fixed this up now and adjusted the
"Fixes:" tag to point to the correct commit.

The report now looks like:
	Issue introduced in 7.0 with commit 5ef3208e3be50aa08b4e7a2832f34e16d42c08b3 and fixed in 7.1.8 with commit 3879657c4ffd81b9a42cf575fc6cb60201032587
	Issue introduced in 7.0 with commit 5ef3208e3be50aa08b4e7a2832f34e16d42c08b3 and fixed in 7.2 with commit 96b2dbbe58a1ea5df8d29c2fe24b5f04715f4443

thanks,

greg k-h

