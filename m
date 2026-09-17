Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2124B4E324A
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 19:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789674696; cv=none; b=JUkU183qizUNk7p3rgJ27HC+wYUxprr07bhUFDuRiMeLO+FhVTTvjakAe8FqjLPYU/xG96xkTL3Ejx6nP+h9ScovBkaTMEAuSeyoVRtsislibZrhH+kGwQRkmfjFUEoAffsZLI5QshVLpcOZz7FWu3Wt6Z8pxCBKNHPdgh8siMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789674696; c=relaxed/simple;
	bh=cnmnDNmuM5/t6RHT2YWu4h0QpQzgHzv5CGThSi+AsRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaYPbQ8NYnUmEDlfsxcOR0ZOEhMyyNvxtsGWzzhlLkgNqzKC4bSchyFzZAv5cQVIhfkTv4gMOXQpiSgOWfEFC99KEJ30uHGYLssuaz3RqFAhuEHdfTmPGtBXz624BJ2BMOVm+1/rGhlAGLw2ahbThrcfhUPKvK03l/J+OfZxvOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gB9PTePX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gB9PTePX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0306D1F000FF;
	Thu, 17 Sep 2026 19:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789674694;
	bh=286m7qqU+1+My40bWAQal2p0ydHLws71vmZkeNKrn+E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gB9PTePXbF3dauZ1CP3Ma7tHqUqd5YHVsVecXPlfNJ+NUCfHThYFSDLNzMr4GjILJ
	 3qHuCDIMjzIq1xBGE7WugEHUGgsTY6tq/n5mzrD9U8XDFkOfzyNvsxrrONnPUv/nrM
	 aBQh2VZzECZ0r394i/BXUwUcjcusRsxGgM6kP+25IowEDpZ82CjD3ODQS2g8QPuFBu
	 x190+xbzPh6rGFMk9MT4pz5LPAyE4NnYwXkw4vuLCComMUx0KvaS1+mNz11WyCnTuX
	 /PvalH5Vgv6+eLGaRf+ptzbFQK6VyTjvMOYz6i8kuZhTA5tK0LpJcwRSSAlODPHD36
	 ZYuQkFxd+1oGQ==
Date: Thu, 17 Sep 2026 13:51:32 -0600
From: Keith Busch <kbusch@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Maurizio Lombardi <mlombard@redhat.com>,
	Arnd Bergmann <arnd@arndb.de>, Hannes Reinecke <hare@kernel.org>,
	Nilay Shroff <nilay@linux.ibm.com>,
	John Garry <john.g.garry@oracle.com>,
	"Martin K. Petersen" <mkp@kernel.org>,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: work around -Wformat-security warning
Message-ID: <aqxExPzdo2VMII7Q@kbusch-mbp>
References: <20260916114533.237863-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916114533.237863-1-arnd@kernel.org>

On Wed, Sep 16, 2026 at 01:44:51PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Passing a string variable into dev_set_name() causes a warning
> when building with -Wformat-security enabled:
> 
> drivers/nvme/host/core.c: In function 'nvme_cdev_add':
> drivers/nvme/host/core.c:3911:9: error: format not a string literal and no format arguments [-Werror=format-security]
>  3911 |         ret = dev_set_name(cdev_device, name);
> 
> Remove the temporary strings and let dev_set_name() do the
> same thing internally.

Thanks, applied to nvme-7.3.
