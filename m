Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903427;
	b=A39LHm9wusSvuAJvoRkB6pxYpMRAHC0jcpyVSTj4tXoNinOZWHNufLE8hqYOi60XtMuq
	 /jliJa6zLa+LJpd7X2jvVwx8yVijsZe4jn7Sr7DXmylB2A4oRVu2HKZksYh7SnRHQShD8
	 RVhYPnt4ovSnhRvbjcpQPbc0RpVYHPXyUMzjfh77ohwZcG08aAl6BbOFq8sw1438Ww1jg
	 DGd8KkmoHwrPcm3YL7nNfMcoUlSUqVYltX8cxmDZvv6IV/dmmlL6J5rr1Yu8L28lbPTMP
	 EYdHN89GamJdV/9iz+RCHqLY8XK4qUGwp1DwQCqOHKLy2XUSyFs/6xMpBIW8hQgl0dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903427;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=NxQB/E4FFBYU14/qaXkuIhD1qEYHqQSnTEyULJ2nk+o=;
	b=DkjDQnpiMqkDWWl2pgIoK1jp5mX1K0fVWcugfETX+5fdC+luH/+MosCTtgFg6lIuyXqd
	 hOrN+vrOoI4psvk0puakpMZgpWFn6sA/nZCJGd9EmSHZxUeF39MPZwDRJQIMvj8IaAiAR
	 zoauYDWqiMIA3+bL5X8OLl0bHs/wYDknU2v/ffnlA8IEXAfcC0KO71QO+7dLj4dvaOi0a
	 L76e/IoieiGILr69Fs++U8fAPjGGPPBYretUMFQCvl8ryyakMVFhEUmX2yumPsJyQpA0v
	 Mmqb9d9sKKWlx9ogfUp+Ph9LBkuogknU/0qtGTysOqwU4Ml+84OSYUiKG8BlwaEyiIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cpZ/vflR";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 73CB4606A31C;
	Tue, 17 Nov 2026 08:17:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cpZ/vflR
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 82B2B1F000C4;
	Tue, 17 Nov 2026 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903427;
	bh=NxQB/E4FFBYU14/qaXkuIhD1qEYHqQSnTEyULJ2nk+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cpZ/vflRiGeeOYPGYwRmaF/T8em0XsoKNAfRLOtN/l9Lws7f92Dc9d+h3YFWptQDB
	 wQVwSF7mBNKjO8gkAOCs4sEWGj+ly3aWzzd46w6oNDUKk3N76QSs26AgnR4nmf8GJ1
	 cn+gwG/EaA/DFSuU8GttrZKzGRBL6zfA7md0q22pw+ApERZGlb35mtMAWAyVM91oGS
	 4rqC8dOInUtrtm9bZtlMZKJnqORpvt4eD6RIPMBsuyUVWJ0X2rhPIEfGQJX94hRHfB
	 FN2tANebxX8YAOYlgWwBV7T0m7hvoWhK/nQ4PRPeZj+QOFtqq3WlUIlCBQjLLATep+
	 F1Wlc2s8iX4XA==
Date: Tue, 17 Nov 2026 09:16:59 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Subject: Re: linux-next: manual merge of the gpio-brgl tree with the
 gpio-brgl-fixes tree
Message-ID: <pb6e2wsemefeqkrzcvaqr7nfcsmufttvoooy6y3emypswaqnld@bflexif6xdgg>
References: <avtjEdUWiljJ5V7o@sirena.org.uk>
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
In-Reply-To: <avtjEdUWiljJ5V7o@sirena.org.uk>

On Mon, Nov 16, 2026 at 08:09:53PM +0000, Mark Brown wrote:
> Hi all,
> 
> Today's linux-next merge of the gpio-brgl tree got a conflict in:
> 
>   drivers/gpio/gpiolib-shared.c
> 
> between commit:
> 
>   7d1d799d6251b ("gpio: shared: use atomic set_bit() for descriptor flags")
> 
> from the gpio-brgl-fixes tree and commits:
> 
>   c402fd2961dd0 ("gpio: shared: factor out per-entry teardown helper")
>   cda42ff53c4b5 ("gpio: shared: factor out per-entry setup helper")
> 
> from the gpio-brgl tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 
> diff --cc drivers/gpio/gpiolib-shared.c
> index f34315a2059a2,cbb68ad646498..0000000000000
> --- a/drivers/gpio/gpiolib-shared.c
> +++ b/drivers/gpio/gpiolib-shared.c
> @@@ -532,7 -643,8 +643,7 @@@ int gpiochip_setup_shared(struct gpio_c
>   				 * This is a shared GPIO proxy. Mark its
>   				 * descriptor as such and return here.
>   				 */
> - 				set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
>  -				__set_bit(GPIOD_FLAG_SHARED_PROXY,
>  -					  &gdev->descs[0].flags);
> ++				__set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);

This should actually keep the atomic set_bit(). In any case, I will send
a PR with fixes to Torvalds this week and pull back v7.4-rc4 into
gpio/for-next once tagged.

Thanks,
Bartosz
