Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD4694A2079
	for <linux-kernel@vger.kernel.org>; Thu, 24 Sep 2026 15:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790264639; cv=none; b=lbF8jHbU7vD+jD2thYNoytGtVZx+oicqOUxnoYUaO9maQCOQlv3gkRjhcVZCR557lMvuRjPAVM0vEJe3C1UDHwQG7bOHJM1CImKMKiorkJo7GHnGxAHVKqiPA3goUiebG8WbS3fAFexb0dJiOFKjo8Oy5BtWiq6mAHHKlZudqy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790264639; c=relaxed/simple;
	bh=3mth+udyl4shJuTkd6p94FaAdssxMiU2m/RJPfhfFqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYWbZ/novFui3PVV+k//9gUUuQJw5b/2WPnK4X9OjKE1RbMByptYFYEKs/9h0HCBEZa8b1zMdnAXb+E2yK0ggr+Zdzj8tAZnCSDmiGQWqVH+jOA7eyYNifdhuEratd/efrgmhHj2kHeOR7zkpa7XDdf7bsGVupN2TV7vO5ZvhXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Uns0tLZ9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uns0tLZ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B3B01F000FF;
	Thu, 24 Sep 2026 15:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790264638;
	bh=3mth+udyl4shJuTkd6p94FaAdssxMiU2m/RJPfhfFqY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Uns0tLZ94/wZQNd9IxDW++FfeLwvvbl/fmfWaGlUaXDd5grtwvV55NLgTxiG7FIWu
	 iA0U2nPP4f4+LSQa9XXTIhDMMUsRbWur3PZVfXAMO28HdT3lTE4xPOugUd165Zems/
	 upYUjWSP2JkNKoi/YXdhAeQiLRnat4hqx9G9gmVHI/9RL1Iedn+uvUJIyCIidrwDxW
	 ScN4GUNyO+JQbIgH75xqH8XO+AZNu17ON+2RLYDqqKtFq9BHKqx7763/2B4rBo8/ym
	 kOZLcHssKDqM/1ADG5esDZKy0C+eZqFO3esE+iSCS3Kk9FXp+3ILaBsbu/xU6kXCc2
	 8dL1TGi5KQGiQ==
Date: Thu, 24 Sep 2026 09:43:56 -0600
From: Keith Busch <kbusch@kernel.org>
To: Krishna Iyer <kiyer@crusoe.ai>
Cc: hare@suse.de, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
	nilay@linux.ibm.com, sjpark@crusoe.ai, saravanand@crusoe.ai
Subject: Re: [PATCH v3] nvme-multipath: add fail_if_no_path sysfs attribute
Message-ID: <arVFPIKeT-HoYF2K@kbusch-mbp>
References: <20260923004959.88440-1-kiyer@crusoe.ai>
 <arRJLL4ki-sVQnHf@kbusch-mbp>
 <20260923225753.49224-1-kiyer@crusoe.ai>
 <arR3zlpx3Xm2mRt-@kbusch-mbp>
 <20260924063524.26807-1-kiyer@crusoe.ai>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924063524.26807-1-kiyer@crusoe.ai>

On Wed, Sep 23, 2026 at 11:35:24PM -0700, Krishna Iyer wrote:
> Yes, exactly. Some namespaces should keep waiting out the reconnect
> while others should stop waiting and fail their parked I/O, decided
> by a condition only userspace can see. Here that condition is a
> killed process stuck in D state on parked I/O that nothing will ever
> consume (for us a SIGKILLed VM the host must reap), and it could be
> any consumer known to be gone. Failing that namespace lets the
> process exit, while namespaces with live users behind the same
> controllers keep queueing and carry on when paths return. A
> controller wide timeout cannot separate the two, and there is no
> duration to pick up front since the trigger is userspace observing
> the event. Reconnect itself is untouched either way. So the kernel
> provides the per namespace switch and the decision stays in
> userspace.

Okay, I see. Pehaps instead of having one controller export all the
namespaces, why not configure your target to have multiple subsystems
the client makes independent connections to for each namespace?
