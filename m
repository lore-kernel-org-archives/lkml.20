Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08DD2377A8E;
	Wed, 16 Sep 2026 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789566181; cv=none; b=jh4y0A2k6nhxbM6QQ4PVDGCgRj2psRDQ2fO62s2M1eF0FaKO4jVNIYoa7a4vtWZzfHpQiqOhosmqQ8crYHoAlh4QLigR8BGiu/hkS0GNkgi5EiSinbO63sFxZVPG0Tmz5zLssCKD3xOzTV4sl9JSTBx4u2Yg3vCwTpmVEnWvxl4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789566181; c=relaxed/simple;
	bh=r7R8Rl9QXttxDQa8M3ISCfFVBD6v2n9Cco1J472JFqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PXpZY3hxqpwd4nrlN1lYqUG+9cC3SjXOFxOe28KuZoTbznkn7rMKV2yzwShZwiKY64pBobLBUESmd6dFOw8R0Zw6BjyL5glAS2hDVs5MZR+9Kj0+Me4KItxnzhdYjY0TiKAHUEk5SK8WYnJbKHyUIvykERJdP1wv+ExWgUoMQ1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJI5UvLV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJI5UvLV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DDFD1F000FF;
	Wed, 16 Sep 2026 13:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789566171;
	bh=BYPB8bAbwAMeutxJDiV9oZQvHzjkHscvMyLXgFR1TSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YJI5UvLV2CEqFxo/fFVbyfPRlpjFzZ3c9KsymDxn9LMhAt5UvXj4wEedLiJgHSCFS
	 /zWooU96U02tpyOIMhIYkcR493IAGGMH/vbKzWkzAQ/fAdlZX8tzNjhnPXHHiUl1xA
	 PmjKOjzxV0Ms96rQCf1BISKK7zEt2yG4DuNqkZ82C7Az9HDG17+jkrY/XYbyiZL8ZB
	 cgr3PnmVWx6bxQ4HuElL2TkXRAnZxOAcudhanutYCmaNgjQ+m/zYleFQUzaWuYluMb
	 EqBm3VimCq+DQLdGnMQ27qlaPkYri7fmniUZLZDfXFQLFd6KLvoIXN7cvTxxfZ8pvV
	 QVeYpusB1MQtw==
Date: Wed, 16 Sep 2026 14:42:47 +0100
From: Lee Jones <lee@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maria Lisina <sekoohaka.sarisan@gmail.com>, mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] mfd: intel-lpss: Clean up and modernize DebugFS usage
Message-ID: <20260916134247.GT11487@google.com>
References: <20260916-intel-lpss-debugfs-v5-1-99295f534067@gmail.com>
 <20260916102732.GJ11487@google.com>
 <aqp3FMncWrzR1adT@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqp3FMncWrzR1adT@ashevche-desk.local>

On Wed, 16 Sep 2026, Andy Shevchenko wrote:

> On Wed, Sep 16, 2026 at 11:27:32AM +0100, Lee Jones wrote:
> > On Wed, 16 Sep 2026, Maria Lisina wrote:
> > 
> > > The DebugFS API is designed to handle errors gracefully.
> > > Any explicit checking on return values is considered an anti-pattern.
> > > 
> > > This patch removes unnecessary error checking and converts
> > > intel_lpss_debugfs_add() into a void function.
> > > 
> > > While at it, this patch also clean ups legacy and deprecated usage
> > > of S_IRUGO macro and debugfs_remove_recursive() function.
> 
> ...
> 
> > Why continue if this returns an error?
> 
> Because we don't care.

If you engage your Embedded mind, you will reel at the wasted cycles!

-- 
Lee Jones
