Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61663353A7C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 19:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787773351; cv=none; b=IFEvQT6VTHOuDxWEIptYh6mSOexQ9tOg6e2AQUhl28SnWRp1w1QdsXqNFh7FFHZnXHS+OYztEefnZS+L+Y7aPjqNak/7ZU0Aw/XwgiMWz6nr24nIavooASwqckv/lGgkffoRyKath7mNu793au+BhoA4Rdbvaz01EOSohOCBaBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787773351; c=relaxed/simple;
	bh=b/iOc0VADcQUCvPs+ALENYYXlH6jAvA8EeEOqy6VYzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZuhC1eh3jChJMVwB+BFW0ddGALBSmLDKARM8XHXrUWarYKV3j686PMvEJbJgdZcvijGgE7q1jCZRHX4yX5/PfYe4W0c+sAZqnHXqkLu0pdZ/uhYTZF8b9lJvzFQmC8xMEv7nvRbobDJfitjaZFxig1jFSRDN8sjo9JU7aaL2W2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BWFX1sDA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BWFX1sDA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE19C1F000E9;
	Wed, 26 Aug 2026 19:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787773338;
	bh=YR+YZ9wjwVV1E4RGGSJhY2Zry69pNRcovb4gZje1bwc=;
	h=Date:From:To:Cc:Subject:In-Reply-To;
	b=BWFX1sDAVz+MBlU9+X5JmD5F5AaApeomXst0w1ucUGPs7zNeFohwwlxS7aWZpcbxQ
	 W2gTAgrMtvrJ29X6SUJAnGXvDEeD4/XcifP1DcEOIZSrvhdAJz8rIZRJ7LQmiqNxl7
	 9q+Fh0xfveT4x9MAzFcJta7RN8KZAIPodWdrWN/SPKbDQJztcra1L1Qkx3R+kPPu9b
	 rfGobKWJU809iIl/YLk1PVr13Wm/XIFADRqXBoPr69T925zbuRJlCnGtorClupF096
	 S+1U90HpkL7NMoTJ1TVMxPAlw6PoprmlHFZywbU5cw3U+eEmO9+PoDJzT+B4wINC6a
	 nZsuCIcAsI1aA==
Date: Wed, 26 Aug 2026 14:42:17 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: drj19981414013@gmail.com,
	DAI RENJIE via B4 Relay <devnull+drj19981414013.gmail.com@kernel.org>,
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
	Bradley Morgan <include@grrlz.net>
Subject: Re: [PATCH] resource: fix lost wakeup when waiting for a muxed region
Message-ID: <20260826194217.GA1552174@bhelgaas>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821113457.8622c5d35c9aec838490b013@linux-foundation.org>

[+to Ilpo]
On Fri, Aug 21, 2026 at 11:34:57AM -0700, Andrew Morton wrote:
> On Fri, 21 Aug 2026 14:08:17 +0000 DAI RENJIE via B4 Relay <devnull+drj19981414013.gmail.com@kernel.org> wrote:
> 
> > From: DAI RENJIE <drj19981414013@gmail.com>
> > 
> > A task waiting for a muxed region can sleep forever in TASK_UNINTERRUPTIBLE
> > even though the region it waits for is already free.
> > __request_region_locked() queues itself on muxed_resource_wait and drops
> > resource_lock before setting TASK_UNINTERRUPTIBLE, while __release_region()
> > wakes the queue after dropping the same lock.  A wakeup landing in between
> > finds TASK_RUNNING, does not match TASK_NORMAL and is discarded; callers
> > hold a muxed region only across a bounded transaction, so no further
> > release is coming.  The task is unkillable and its caller never returns.
> > 
> > The window is one store wide, but an interrupt is enough to hold the waiter
> > in it, and the machine this was seen on runs PREEMPT_DYNAMIC in its
> > voluntary default.  Since v6.11 spd5118 exports the DDR5 sensors of AMD
> > boards through i2c-piix4, which takes a muxed region per SMBus transaction;
> > a third of the in-tree users of request_muxed_region() are hwmon drivers,
> > so reading a world-readable attribute is all an unprivileged user needs to
> > drive the contention.  The blocked task sleeps holding the i2c adapter bus
> > lock, and 27 more piled up behind it.
> > 
> > Fix it by setting the task state before dropping resource_lock, as
> > prepare_to_wait() does: the releasing side needs resource_lock to unlink
> > the resource, so it cannot reach the wakeup before the state is published.
> > 
> > Fixes: 8b6d043b7ee2 ("resource: shared I/O region support")
> 
> 16 years ago.
> 
> > Cc: stable@vger.kernel.org
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: DAI RENJIE <drj19981414013@gmail.com>
> > ---
> > Reproduced by building a kernel with the two orderings selectable at
> > runtime and a 2ms delay inside the window.  Switching only that knob, a
> > two-thread barriered reproducer loses the wakeup 200 times out of 200
> > before the fix and 0 out of 200 after it; without the delay it goes 20000
> > times through the wait path and loses none.
> > ---
> >  kernel/resource.c | 2 +-
> 
> Bjorn, please consider a MAINTAINERS entry?

Maybe you'd be interested, Ilpo, since you're doing so much PCI
resource work?

> > --- a/kernel/resource.c
> > +++ b/kernel/resource.c
> > @@ -1350,8 +1350,8 @@ static int __request_region_locked(struct resource *res, struct resource *parent
> >  		}
> >  		if (conflict->flags & flags & IORESOURCE_MUXED) {
> >  			add_wait_queue(&muxed_resource_wait, &wait);
> > -			write_unlock(&resource_lock);
> >  			set_current_state(TASK_UNINTERRUPTIBLE);
> > +			write_unlock(&resource_lock);
> >  			schedule();
> >  			remove_wait_queue(&muxed_resource_wait, &wait);
> >  			write_lock(&resource_lock);
> 
> Yup, that's a basic waitqueue usage bug.  
> 
