Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8452D3A9610
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 03:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789616460; cv=none; b=p8v8BcKmAv2DSKHML4MtqLeH3Ez6AEgMwrtJxIXs1/+Y8viYwUd2kLCP4++pjm/y9XZU6wQmVA5dUjqDjbfd2epg/mbTFplQ3ouhy01T6xqOPo3ROEgXmA9bpxER8AnlNc06zP8bbYqGWnQeQKFsKjcfjfptpjA/UwuDNyRYeMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789616460; c=relaxed/simple;
	bh=hjdXtHl8coxbgw6KhLARZO92mQI8spGSx8rXxqI9z3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M0rT6tJDyyB5+sXIvrOxh3DBEUICeJmT9FNAsSmmBf47IgfR79M/r/4t20VfiTzCmACiY+A4BDoBpCBbR2zVeXDSJSPXIIOJSaGDQgs8C5B7X8YHv3cz/4MuU4lDL+zbYASh0ICaIOB5MhzcTq39BWTUP3t7wbt3cxMtKU6SqPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oOetpGb+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oOetpGb+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC481F000FF;
	Thu, 17 Sep 2026 03:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789616458;
	bh=WdZytDFux5XnrW+jquReOqJ2UV3d87OKKRnUrIg0b2Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=oOetpGb+e6zC5JtDULljJXRYZmTaL77xZsZb3CaO2VuDPqqH43otufbeIpOln3v+h
	 dgZ7Bl+sXyZW0ve86v8vgu/VGC5fIrJuXKJx/+bSQRvGR5r0GyzC27a267Nwzkwk43
	 pvWdIyOPxgrnQ8GUiElptWhIA4frlcqRUDnY8pOm/6BRHHs1DtcBZnSPQDoa6HGFN3
	 krr4OgTdw6oOQgUlafgDaeR5ZpFYqvP5Uy7agG5RTtxyF1KbPO4Oqr1OgKxOddowml
	 LQ4d5nJWxlyom5P0djiPWYs/QxuhOg8aIAkVpW2cHgHL94kKMmVOCgg3Gmo5CqFZqg
	 WkYg0wEJWqtmg==
Message-ID: <cda5c92e-bc41-4cae-a199-8a7fdb9eb187@kernel.org>
Date: Thu, 17 Sep 2026 10:40:51 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] nvme: work around -Wformat-security warning
To: Arnd Bergmann <arnd@kernel.org>, Keith Busch <kbusch@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Christoph Hellwig <hch@lst.de>,
 Sagi Grimberg <sagi@grimberg.me>, Maurizio Lombardi <mlombard@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Hannes Reinecke <hare@kernel.org>,
 Nilay Shroff <nilay@linux.ibm.com>, John Garry <john.g.garry@oracle.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-nvme@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260916114533.237863-1-arnd@kernel.org>
From: Damien Le Moal <dlemoal@kernel.org>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260916114533.237863-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2026/09/16 18:44, Arnd Bergmann wrote:
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
> 
> Fixes: 26acdaa357cd ("nvme: fix crash and memory leak during invalid cdev teardown")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research
