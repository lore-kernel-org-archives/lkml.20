Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794757810;
	b=v4rW9mLvHRD1FvHjEeI8QibWd5UHR1DQZXZfnh0A+h6iGBCrQubG+RJU03dGwkAy2Rkm
	 WKmZfSFOonwh8Kkv6LQcDXMDDV4cmGWkOnDzYih6RsCELSGTAeiU2rJ5CFMXUfnUP1l+V
	 dx1+nV97TLAJQDC0mOxnqdVH+FIhFdyUV7R7eFYxrLdmodXVDyPc77UL5kDmGM+xe/zUT
	 XcqAM87CtFrMCjf0de1UtTwl+uzSg48kjHt7Uvh00mp69y8P0m+sRKzf8ZM2fyqLUGeX8
	 8CZ43nzTpiLdptV1PDOvYQ4RSw16bd6MawRzG/gR/t7eIePbM/cC1Q3YkNRiItOhQoA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794757810;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=lFBXZH74vWcYYZEl9ttEX3rp67WAxy4DNbzoeffy2Q8=;
	b=02/67cw+nG4h+ZHIL9s9nRY5Wht/4mTJSZHNZBnB7cJisUXYTiiTlP2yToT2BvWjOQUK
	 O10ed70Wu7qVE3GTpU4yEkqQ4Zgx53nu7ON5Rvz+kXGpMlALI83pPheUxF/vOQ8PaI1Rg
	 YWDzJoIVdyUzP2QpRywVMeVOhr/+IVHB6aeQpFkoi5LJ20STFVwCGBHAotgdf7kFu3JY8
	 AN0GKqGoggzi7EE27qhLj4/OqV1yXhlBKyRB3rfIibjj9zsDzgd2RE5WJ/nM6CCm4KAsz
	 Rb4GlUZTbb5/QND/j2zNcbSQaeqSfhAUixEJQwiopKUk6Wq2Rm/sH7RLikA3HbyW5jA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=nXqdp2Z2;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB73606A31A;
	Sun, 15 Nov 2026 15:50:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DB73606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=nXqdp2Z2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=lFBXZH74vWcYYZEl9ttEX3rp67WAxy4DNbzoeffy2Q8=; b=nXqdp2Z2IJDSVspORvKT7As2t0
	4ldH7v37KEPQApEgZKKUJKvperbtnrvfdLu8TSxgK+2PejLXkimP7CkdNXmSYYsas/vNfnwkhTE++
	YDC7rEUA3OprRU7s9v/sqRMgUGzk8wbMZ7hvwNaAsY+DQvHUxjY3hIH/GHv2YNXfemSo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xScUV-00GdWb-BA; Sun, 15 Nov 2026 16:50:03 +0100
Date: Sun, 15 Nov 2026 16:50:03 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Janis Edvarts Lacis <janislacis06@gmail.com>
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	wellslutw@gmail.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: sunplus: check budget before calling
 napi_complete_done()
Message-ID: <26c5c08f-d6f5-49b2-9fa8-de6f8c244a78@lunn.ch>
References: <20261114222744.535158-1-janislacis06@gmail.com>
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
In-Reply-To: <20261114222744.535158-1-janislacis06@gmail.com>

On Sun, Nov 15, 2026 at 12:27:44AM +0200, Janis Edvarts Lacis wrote:
> Sunplus drivers currently do napi_complete() after each rx/tx poll is
> done without checking whether budget was exhausted or not. Interrupts
> are also unmasked before the call to napi_complete().
> 
> Replace napi_complete() with napi_complete_done() and add a check for
> budget_left. Call napi_complete_done() only when the budget has been
> not exhausted fully, e.g. budget_left > 0 and unmask interrupts only when
> napi_complete_done() returns true.
> 
> I do not have the hardware necessary, this patch is not tested on real
> hardware.
> 
> Fixes: fd3040b9394c ("net: ethernet: Add driver for Sunplus SP7021")
> Signed-off-by: Janis Edvarts Lacis <janislacis06@gmail.com>

Does this bother anybody? If not, net-next. No Fixes: tag.

Given that you have not tested this, how confident are you it is
correct?

	Andrew
