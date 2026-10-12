Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D82471D05
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791797932; cv=none; b=IM3ltp+C/riV8SdYErAMD5QVXRJCAChXVcTTcYDTIQ3jylhKSM509wj/0P8qd3OsuEEDeOJLGgM9i91lEv20MYn94jGqW3mxfp9/UVShylhBgldysfpMFN9zC7loSDFmn5hJbWj+Khb6TL4w6uAU0VDk/D6Zzz9q5nG2/myjP9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791797932; c=relaxed/simple;
	bh=ocw6F+/JpQko8Su2KxcSodphiS83Zozub9+ZW+tY0qw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nYdZuyaQcL+3zE9s2iAXFLomC19gxUHVYDbgiU0YjMNXga8b+pf6mhhPC+EmkpJWtifB/lTFjeFRHYcQuO1ned7cJ/DECDm0KzbRgXRLpHHX3qQTxl59XMk/kkBktNHGadcEdksmqKqmEf1pFDPHO6XxfszO+0gGuGX5DviXpew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OdhGYgjW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OdhGYgjW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475281F0089B;
	Mon, 12 Oct 2026 09:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791797931;
	bh=qei7fDvkuQRiBYxatpdlUQgfaRmAZ/ZB2QCvyOiZ9h8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OdhGYgjWxk+e6iSwTjYq/PY57Qznn550C/T52TTgJv+88Jq0FSD79TIPqkXJvHCaA
	 5mt0WidLTSoUAw9zCJTta4YZf04Dyou6cXda2InkEl/cE6rm+yDQjCLXsypNSAER+e
	 8IT8QpWKItZSy3aUzD0pBlPScyq0lLsBkiXlCQOqmS+JcjPjIB5gpWK0mmuk/81kbe
	 6d0AqDtJJQKmYiULG+vSzzOLbb7dd4kU+V3ruGhcbU8tTEDmZVMr+P47L6xfBoAT/S
	 KpsRJpMuwCBqTxls4Y0rayeaT88/bQPy59iRdt7JzbJSyS1O0ppOq132smThtzMWXe
	 PuDe79ogaupEw==
Date: Mon, 12 Oct 2026 11:38:46 +0200
From: Christian Brauner <brauner@kernel.org>
To: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>
Cc: Tao Cui <cui.tao@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	linux-kernel@vger.kernel.org, Michal Grzedzicki <mge@meta.com>, 
	Alexey Gladkov <legion@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Jan Kara <jack@suse.cz>, Tao Cui <cuitao@kylinos.cn>
Subject: Re: [PATCH] fork: fix active reference underflow on unshare() failure
Message-ID: <20261012-gefeuert-klargemacht-unstreitig-2d5bdc376f16@brauner>
References: <20260927095450.3017586-1-cui.tao@linux.dev>
 <12cfdf66-d37a-41a2-8e2c-4a477ebf0cf9@virtuozzo.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <12cfdf66-d37a-41a2-8e2c-4a477ebf0cf9@virtuozzo.com>

On Sun, Sep 27, 2026 at 08:33:57PM +0200, Pavel Tikhomirov wrote:
> 
> 
> On 9/27/26 11:54, Tao Cui wrote:
> > From: Tao Cui <cuitao@kylinos.cn>
> > 
> > When set_cred_ucounts() fails in ksys_unshare() the new nsproxy is
> > released with put_nsproxy().  But the nsproxy has not been installed
> > at this point; it is only marked as active once
> > switch_task_namespaces() installs it, which happens after all failure
> > points.  Dropping the last reference therefore deactivates it and
> > puts the active reference of every namespace it points to: for
> > namespaces created by this unshare() call the active count underflows
> > to -1, and for namespaces carried over from the caller a live active
> > reference of the still-running task is dropped, which makes them
> > disappear from nsfs file handles and listns and causes a cascading
> > underflow at task exit.
> > 
> > Use nsproxy_free() on this error path, which drops the regular
> > references without touching the active ones, like the setns() failure
> > paths already do; see commit cefd55bd2159 ("nsproxy: fix
> > free_nsproxy() and simplify create_new_namespaces()").
> > 
> > Fixes: a98621a0f187a ("unshare: fix nsproxy leak in ksys_unshare() on set_cred_ucounts() failure")
> > Link: https://lore.kernel.org/r/20251118064552.936962-1-ptikhomirov@virtuozzo.com
> > Link: https://lore.kernel.org/r/20260213193959.2556730-1-mge@meta.com
> 
> Reviewed-by: Pavel Tikhomirov <ptikhomirov@virtuozzo.com>

Thanks, already fixed upstream! :)
