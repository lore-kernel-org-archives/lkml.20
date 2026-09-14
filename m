Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729347F3DD
	for <linux-kernel@vger.kernel.org>; Mon, 14 Sep 2026 14:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789396766; cv=none; b=ag/l9umRDPrwDVwClL5vFqvxtzdUL5e0yDyQ5R0GIhY4dUbCr/lF7pVw4C75cePvJmRCd49flEKnP+y7M92VEass6ef1GmL2A42zgAHpGMTcBa7l0+vMu3e594y1TYHIYQOhdgThXl2df3GRM9kj3CviuaESWdIzWqGoBTQ0fRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789396766; c=relaxed/simple;
	bh=S3kiUryi7ys2gWqYZn4Qj5z61a8AqX+Y1KsLFE3pDEQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a3NsXCb4bmqBZaePoE6eUPq9SOYOO7GP659drv7p+DNlryksNilHSpE/EHbIiagdIpz3XYPRGZMaDlmcEf8gySikDklfGgKyRl/POKHKIDWjpYMuupmb1Izn84qQGVNH5j80LvxYRsZJYxanqDHX9mBF1ouhF0ZAKfQeQQUeKjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HexKKt3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HexKKt3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E72B1F000FF;
	Mon, 14 Sep 2026 14:39:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789396764;
	bh=S3kiUryi7ys2gWqYZn4Qj5z61a8AqX+Y1KsLFE3pDEQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HexKKt3fFac6sIZs49+idp+3Xm8EsD9lAHQ8szU+YT5j1zbdyHO0H1b/VMiZTyaIv
	 v4Bhd7KPFnP0DkGoBOSbKWWBlmzazu8tkB2wcldkSc/gtD469tt70gMR4SFlt+Gk+t
	 jHyirFXJ7pdhrDiT9bDUvYvyQo15Aa6PvOZhSBj8o1q8LhdtKD4eqfmpP5wbq52O4Z
	 wS8XhkqjDqoaeuUkZsX611IU5Vffmz5AXrTbX2VJ4AAQeeAA7p+284KgJfz05fr/ZO
	 LT/jctvYi0Yy5rcqBsEDOCfdA9yi+DEbHfoSgvutk6/wwHYdPEo3TTdlz4F63alVOg
	 E4NWik788ZfQg==
Date: Mon, 14 Sep 2026 08:39:21 -0600
From: Keith Busch <kbusch@kernel.org>
To: Mateusz Nowicki <mateusz.nowicki@posteo.net>
Cc: axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
	linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] nvme: bump genctr when cancelling a request
Message-ID: <aqgHGefyCPcoNoB_@kbusch-mbp>
References: <20260913124053.86565-1-mateusz.nowicki@posteo.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913124053.86565-1-mateusz.nowicki@posteo.net>

On Sun, Sep 13, 2026 at 12:41:01PM +0000, Mateusz Nowicki wrote:
> The cancel path is taken when the host stopped waiting for the
> controller: CSTS.CFS set (dead path in nvme_dev_disable(), no CC.EN=0,
> no wait), or CSTS.RDY not cleared within CAP.TO. Nothing stops the
> controller from posting completions after that, and the second
> nvme_dev_disable() from nvme_reset_work() reaps them in
> nvme_reap_pending_cqes().

I think it was supposed to be that we don't cancel a request while it's
still possible to see a natural completion. So with that in mind,
perhaps the call to "nvme_disable_ctrl" should be called unconditionally
instead of only on a live controller.

The sequence you're describing is weird, though. Your controller
has fatal status, the driver hasn't done anything yet to recover the
device, so why were there no completions available the first go around,
then completions became available on the second? The controller
shouldn't have done anything in that time, nor should it have been able
to since Bus Master Enable was off.
