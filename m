Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793368166;
	b=DT0JFTcAoGhSwBntODDuPo3kHO+YGTlzvQxTM6fpeJFgAUWLI5r+NduF5UOE9lXxkhK2
	 ATCtRwfb+qcM6YzwBM81VKQo3VIL/kUfBZ6jkF5Hf2/P6j0O8AkdK8Vq11Bc6f4ijJguD
	 qgfNLSt9I4X26sFmvpfyyvam7aWFNSZgu7HGqHQSG3nLfu3GmUUOE+iSgQVBjtYkjJMF+
	 EfB0lk680g5ydjufGFuk1jQykCTSHKsxJ2tS+ZrelzRPg69Q/bCCGkKLHJtMLzObDQRDp
	 QPXOE2CYmTsp7hEcTq5xBc237GNZHUbAKt3J7nCsXrGn0KHoEW+jA4Ph0lwPsiMxo8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793368166;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=nn+jn8+lqiXUwD3ns5MqLxQ+r+SaZCIl/wCETM3rP4Y=;
	b=p8iakJzkq5m3TVCGl1/SrsNyfkkctxNGSvhGGQdDn35BRQLlE80H1Xorf7u3g53VaySQ
	 9kxlX4ZRmzZPqnhGQI6MZjCExW28z45/7/SHmoetVU9zbVt45BpuMlGp7fD/Ikkbmx/iw
	 zqVNzbNmI2FBFUB2BJDrhB03+9riIHMFVVfw6mW8EcFXh8a7W/vpRfpg7ZmQ198Wxcfub
	 SRZIieUvD6soKVKMT7BBcrU2KBdYrzUEBv/IoLko1Wu/2cwwuOAlBTvMtyNk0vuc4e0kP
	 cSvdEaV2ZZ1o5CeEVPy2tjN76MJsiP9eVzL2LTB6WyTdkCz160wOzNuuDF7YSb8z+Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YA6OwD6g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FED606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 13:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=YA6OwD6g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D611F000C1;
	Fri, 30 Oct 2026 13:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793368165;
	bh=nn+jn8+lqiXUwD3ns5MqLxQ+r+SaZCIl/wCETM3rP4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YA6OwD6gCFUdcopQhcfr1tj6zksgb0rhxfmiZ4rx+ZTLQPHpUmYkwz+DOQyaqUHQf
	 LHQxS4eM8cYRcOMZ5+qTm+SKtbxdEKZ0P4q0inqsihBLU17eLXhRkJROFAfujLCpZe
	 MmIOuuHF26TKqpEbQssGhHA/Z3TfIRSaIepFmh5o=
Date: Fri, 30 Oct 2026 14:49:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Josef Bacik <josef@toxicpanda.com>, linux-kernel@vger.kernel.org,
	stable <stable@kernel.org>
Subject: Re: [PATCH 0/9] w1: a bunch of llm-found fixes
Message-ID: <2026103016-amuser-numbing-6d09@gregkh>
References: <20261027-llm-char-misc-w1-v1-0-d2e6bfafb6a4@linuxfoundation.org>
 <b7f69d8d-3f2a-4258-b19c-8d9d2f0494c8@kernel.org>
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
In-Reply-To: <b7f69d8d-3f2a-4258-b19c-8d9d2f0494c8@kernel.org>

On Fri, Oct 30, 2026 at 02:45:54PM +0100, Krzysztof Kozlowski wrote:
> On 27/10/2026 17:04, Greg Kroah-Hartman wrote:
> > Here's a series of some small llm-found fixes that have been sent to me
> > recently.  Most of them are just minor bugfixes and locking cleanups,
> > but they are good to have from what I can tell.
> > 
> > Submitting them here to get a solid Sashiko run.  If they seem sane, and
> > you want me to take these directly through my char-misc tree I can do
> > that now, or I can gladly wait for you to resend them if you wish to do
> > that instead.
> 
> Thanks, I went through them and they look fine. Please take all these
> directly. I left my Rb-tags.

Great, will do, thanks!

greg k-h
