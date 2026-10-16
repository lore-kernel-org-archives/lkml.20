Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1076753C3B3
	for <linux-kernel@vger.kernel.org>; Fri, 16 Oct 2026 16:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792169969; cv=none; b=svFhTqU62mcXh9vfi8137LIpo+JTgQRLByFAh72mPdchHLRdldh5swg8xHiXzvJpe/RbTtbzNaMY4vbfDuckHePYpF+IHNpAl/gaJB7PH4alYDmiZ6HzX5d/2L+pDJfIPHkc+Hz4pCiEag95Ta4nyb540N01QZPzBotiOKMq7Dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792169969; c=relaxed/simple;
	bh=SXOr6/YcNmZx6SwoKJPpy0ilM17R9BH1qxVME+/Ts9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6o/lPla8P8b2hkbsTIDkcr4PuzY+uRMS3hiXITEwKatJJbvLStngtGF3CfCPgmVufxoeqS+Rq38E44Zs7cL7KswYlm+zflaIfjSiEdcUbf0pfLuv6B1EG7LReGi0QY5ve8O4UHnTZFHhgMTqw30nt02HY29d7LWah4eDkkCL/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHqKKplf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHqKKplf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E3B1F000C7;
	Fri, 16 Oct 2026 16:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792169965;
	bh=ICV+tD8MUKphV2rsEaHGc3fuOS0Uaff519cMMdwXri4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gHqKKplfuAkpvA9UcIbdv+dLlAP2m/R98E2/fl12X47UwNo/kKi6d2IAs929GtV+P
	 HZmStUJo1FnKKorXDj46giH5NVhVbNvGtKaXp0CZDCXNIJ/LnS4Hor7cNsqPtW4O0R
	 TPKRIEF9mdQelvBfsTLGBRf7YKHUHy4oN7dXdgHxRlBWe1Ee1ZwTXye9glxH7ag5Wg
	 4ICRD/GoayD8N9M8E1TIYyYWYkObhcvC8piZdwZiSRR/MDWVjZ+wmgdtMVHHVwN1be
	 xCFBK0cHMPyHFeo0324h5GY+L+d+2xurBmQO8XIOA+LNJQ8kgKOvHfS2+ZHDrFbgG7
	 AJP5rI94vAqYQ==
Date: Fri, 16 Oct 2026 06:59:24 -1000
From: Tejun Heo <tj@kernel.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Dan Williams <djbw@kernel.org>, Thierry Reding <treding@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] resource: report a devm_request_resource() conflict
 under the lock
Message-ID: <atJX7GgA1xnUEPSz@slm.duckdns.org>
References: <20261016140043.790048-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261016140043.790048-1-nickolai@csail.mit.edu>

On Fri, Oct 16, 2026 at 10:00:43AM -0400, Nickolai Zeldovich wrote:
> devm_request_resource() calls request_resource_conflict(), which takes
> resource_lock, tries to insert the new resource and returns a pointer to
> the conflicting resource after dropping the lock.  The error message is
> then formatted from that pointer: conflict->name and the %pR argument
> read the name, start, end, flags and desc of a resource that nothing
> pins any more.  The owner of the conflicting resource may call
> release_resource() and free it the moment the lock is dropped.
> 
> The conflicting resource normally belongs to another device.  With two
> devices whose drivers claim overlapping regions (two PCI host bridges
> whose "ranges" windows overlap, two instances of a controller on the
> same aperture, or a stale claim an administrator is replacing), the
> following interleaving reads freed memory:
> 
>   CPU 0: driver B probe                  CPU 1: driver A unbind
>   devm_request_resource(devB, root, resB)
>     request_resource_conflict()
>       write_lock(&resource_lock)
>       __request_resource() -> resA
>       write_unlock(&resource_lock)
>                                          devres_release_all(devA)
>                                            devm_resource_release()
>                                              release_resource(resA)
>                                          put_device() -> kfree(resA)
>     dev_err(..., resA->name, resA)        use after free
> 
> Both halves are reachable from userspace on any kernel: a write to the
> "unbind" file of the driver that holds the region and a write to the
> "bind" file of the driver that wants it.  One in-tree path is
> drivers/pci/bus.c devm_request_pci_bus_resources(), called from host
> bridge probe for every bridge window; the windows are the embedded
> struct resource of kzalloc'ed resource_entry objects that
> pci_free_resource_list() frees when the other bridge is released.
> In the common case the "resource collision" message is garbled; with
> the slab object poisoned (CONFIG_SLUB_DEBUG) or reused, formatting
> conflict->name oopses, and KASAN reports a slab-use-after-free read in
> devm_request_resource().  All of this happens in a probe that is
> already failing with -EBUSY.  The window is a few hundred instructions
> wide and exists only when two devices actually collide, so the race
> has not been observed outside of analysis.
> 
> Do the same here: take resource_lock, insert with __request_resource()
> and print the diagnostic while the lock still keeps the conflicting
> resource in the tree, then drop the lock.  The return values and the
> devres handling are unchanged.
> 
> The change was built for x86_64 and RISC-V; the resource KUnit tests
> pass on both.
> 
> Found by formal verification of kernel/resource.c against the kernel
> binary.
> 
> Fixes: 8d38821cbcf5 ("resources: Add device-managed request/release_resource()")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>

Acked-by: Tejun Heo <tj@kernel.org>

Thanks.

-- 
tejun
