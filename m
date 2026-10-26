Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793016544;
	b=d7nci25KQ1ztLHrmchZpxU/BU8k65xE6VUy5yxkNBsoQKCaur1h06AtBstMy29XvgAWR
	 Iocnr9ejO21er5RWYYmY2E71OE3HKY+tL9DRoXIvRNP3c81+ixY9jUkiYOnoxxzuUg8ag
	 aZnBh0U+4L2J9NlwkrbddWug6A8Nz4d/O1FuqmPGXj7h6DSc5v12/7jUhwHhUpvbNKFnl
	 03spTKBrOP8bVAeh09fbuugLOky+mHsob3vG4Cf7lePyF+EF8AeBavd5t+8V7g/+jt3iY
	 Zojv4vCMbty8Lg+Y4teR0n5EQFgLSivIbgCcF2rrNx6otUN2/iaqMv8PaAMC4CnE4eQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793016544;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1mxdk2/B/YCJP5MK8xvtbavi1p9mbpHxdgzu7pEuep8=;
	b=GDSozvp3Ekelo7cBj1kKHob/cTPiCNFWSt5enQEw36eWjlUSlQhvrkRX0HryrVj8Zgv/
	 DFwkY24B0JcN0kCUxWcF5x7WIfvKxzpObg5SZhZNHj81d02FyyCmAwIfWaqW3sYF/x85N
	 Zlq1P7HViCf5KUHB3ow/mO7evDPjfe3uOAxC+JZB+3XshF/2bit72XCZF1AHuaYYZ2WFS
	 GKYsIq51nUErVq7JGmij4AzZ5MxEleMYBo1B3sOguMWU0q2WDi7c1ju60IEgXb9Ehwj+M
	 uzvmZXJHX/6XIqtXVOzIT/no4CtFO73tul8ftWvJH51w5rKbPy98XITT7dC7Lz8f1sQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vLR5VNW9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D3D606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 12:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=vLR5VNW9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69FF21F01828;
	Mon, 26 Oct 2026 12:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793016544;
	bh=1mxdk2/B/YCJP5MK8xvtbavi1p9mbpHxdgzu7pEuep8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=vLR5VNW9j/K/tNV01XJSKI06qXwsZKrBAqIAtEZgOVZsE4sMcbbuox823Tzdhtdwg
	 +oizxNKEu+Dkf2pXs5TaoGqrYBMI3Lau+q8InbiY5eTrHG8VsjP27aMsUThTiHIKRP
	 aVqcra9+/yrnYBf89YLnhD3eK9Q+SAmGdgAuU9jA=
Date: Mon, 26 Oct 2026 13:09:03 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Filip Jensen <dev-Felipe.Jensen@duagon.com>
Cc: Johannes Thumshirn <morbidrsa@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/1] mcb patch for next round
Message-ID: <2026102636-eligible-parasitic-8e58@gregkh>
References: <cover.1791206167.git.jth@kernel.org>
 <19804b63-1c41-e6f1-bf53-3ec8a7a4b4e9@duagon.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <19804b63-1c41-e6f1-bf53-3ec8a7a4b4e9@duagon.com>

On Mon, Oct 26, 2026 at 08:59:19AM +0100, Filip Jensen wrote:
> Mr. Kroah-Hartman:
> 
> This is a friendly ping for this patch that was accepted some weeks ago.

It's in my "to get to" queue, sorry for the delay.  Given that this is a
very low-priority issue, it will be handled after -rc1 is out, thanks.

greg k-h
