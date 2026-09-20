Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 256F5245005;
	Sun, 20 Sep 2026 10:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789899667; cv=none; b=Y8IEjDH/t3QEFf9qDx16fvQ401OFgYIsVDoQkSsuH+F7Q5BVFnydM/NdLSb/5h2ioSs+rXGbrxpZzwpHf8I5VbL1EY7jhBcwylDvV7VNKQlJeGTaXvGqOuzCv9DSQ47ozloE/4Eg7ciyfBADSHm7GpT59afSMmNoHYlYC/oD36M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789899667; c=relaxed/simple;
	bh=fwcTcuIHtMu8uqEnJYBTUUq0cy0vq/LelTQZmSvRU1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKM5VdzgGGpq7JgwRy6U+vcmC0L89H76fYs4J6cFJfRVUDFnARRQRa+gG/GHz9kGvgkCpm6juZNvTqTHph+o7yD/Z/RK03J6cd1nveEyF6JxPL1dBLbSoQ71BGrYfShUFgmkSdJO3vQtTfmdcKxSXzPQkcL8nGbbvpqnMpyynsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=apxr9IeY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="apxr9IeY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 109D61F000FF;
	Sun, 20 Sep 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789899665;
	bh=U0MlVOJ7wY2/ClrALmR8GObc4ipvyNcrXp98cMX13Xc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=apxr9IeYxvULV19cFz8JMx/d7ej/msiZfxNWwa0a/bG6CbXDn+qJLPpfa0emZdDcm
	 O0I4WUm1w6axpWeFMPUoJLznB+4w7dbwknchalh6Nt0pzpNpT9+Th824pp4ip+t5Ek
	 0HHvOmLr+jRCRXT8dK5zY1bvESGvXPZ/kPhPjqKo=
Date: Sun, 20 Sep 2026 12:11:27 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Omer PALA <palaomer100@gmail.com>
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Bryan O'Donoghue <pure.logic@nexus-software.ie>,
	David Lin <dtwlin@gmail.com>,
	"moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] staging: greybus: change mutexes to guard macros
Message-ID: <2026092039-greedily-jailer-80e5@gregkh>
References: <20260920094058.9664-1-palaomer100@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260920094058.9664-1-palaomer100@gmail.com>

On Sun, Sep 20, 2026 at 12:40:54PM +0300, Omer PALA wrote:
> Convert mutex_lock()/mutex_unlock() pairs to the guard() and
> scoped_guard() cleanup helpers where possible. This removes
> error-prone goto-based unlock paths and makes it harder to
> forget to release a mutex on an early return.
> 
> Signed-off-by: Omer PALA <palaomer100@gmail.com>

Did you miss the review comments I made for the previous patch like this
a few hours ago:
	https://lore.kernel.org/all/2026092014-despair-secular-d579@gregkh/
?
