Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793628730;
	b=pDVRkq59I4LeinbPKr9Ud36qcMN5rxQe97+1kmCHewpKJPoZGKhImXvyWrhUajwbrlQg
	 3T3z+YnO/+Q6PQRC0/rAliJ7m0oiYgRP93P6ru3RLs3ZA6t5Dqp8mE44KlBaly8e2dE34
	 RKuX3hfGmsOTu0cDIzJG4T41Zc05JHqIDte47TFAyjQq5wOkQ8ACpxRhIocsbMITQiL8y
	 2ggQkKFLfTZezMv49QklU2m7HcEAieP3gXcPMCG5+611Gauh/edikuzJM7qQxaXA3J9tH
	 McOPOerPAnRJGarbelLCJnCXSZL4w7ULbGCxFegJbnEpRD/f/KO/18mz/xQ0RZcGfNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793628730;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UMzkwej9sONqRjUkOOOOMEfkHZMfziYAnI4NS8BW3FM=;
	b=HKydFu8I2cLL0myY2YMRMkw6yFZ05/BKTRxdkcs0BlXJYpnSMxtVGIuPNj579pXI4yr6
	 I4ZdEZbKkuOsxYqu09D3C/bAYilc3gKhFMtFQsQbseKLa3YESQpkAVGUNOAJE09mOkyds
	 gJIzDi60sV9QP3eJet9w0+Hrht0Gq6cE6yMR0cHpZXXMyKecahOSYQvZQl+bT1SBMXtZJ
	 SaRksnQqquz4h9K5YA5fbJ0E/rTrTsNSXdgdwcqoY4lWAad9P8wiT00ERIQJO3Hrb+yVW
	 MAqr3aFqyGnBvDlUv5hNbOzsjdDAMCE+hFKwvBdFEMFryYV8p2+lQKWxRqrpZ6N87dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DCDCf9u7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB1A5606A326;
	Mon,  2 Nov 2026 14:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=DCDCf9u7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0DE61F00A16;
	Mon,  2 Nov 2026 14:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1793628729;
	bh=UMzkwej9sONqRjUkOOOOMEfkHZMfziYAnI4NS8BW3FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DCDCf9u73+CDPLlJ/T0pC7VAr8PnukNlUVCYXJjxtZlPT9yZfNT0FgJ+rSVMnq2AT
	 k5CbSFJJ+p+CWGH2EeHvIwkKreDG7s17FuElMnIvlWkHO+MIK4JGkAd0BZyDPwh8Ke
	 uAj1MYOQvNfMR3JTiJEJj9yx1UiN+k14LnRqZjis=
Date: Mon, 2 Nov 2026 09:12:06 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org, users@kernel.org, Federico Vaga <federico.vaga@vaga.pv.it>, 
	Akira Yokosawa <akiyks@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Chen-Yu Yeh <chenyou910331@gmail.com>, 
	Weijie Yuan <wy@wyuan.org>, workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	Petr Pavlu <petr.pavlu@suse.com>
Subject: Re: [PATCH v2 0/2] get_maintainer: stop sending every patch to LKML
Message-ID: <20261102-smiling-binturong-of-gaiety-f64c1f@meerkat>
References: <20261020-get-maintainer-the-rest-fallback-v2-0-162aea473488@linuxfoundation.org>
 <20261102093206.50b6c9ad@pumpkin>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102093206.50b6c9ad@pumpkin>

On Mon, Nov 02, 2026 at 09:32:06AM +0000, David Laight wrote:
> > LKML has become mostly a firehose of patches that are already going to a
> > subsystem list. The reason is THE REST: it matches every file in the
> > tree, so get_maintainer.pl adds linux-kernel@vger.kernel.org to every
> > single patch. During the week of Oct 1-7, 2026:
> > 
> >   - LKML carried 13,641 messages (~1,950/day), 90% of which were also
> >     sent to at least one other list;
> >   - with ~2,100 subscribers, that is about 29 million deliveries per
> >     week for LKML alone.
> 
> That sort of implies that 2100 people are happy to receive all the
> patch emails.

Doesn't really matter, since those who are at gmail.com aren't really
receiving "all the patch emails" anyway and they are impacting everyone else.
Gmail is simply not usable for high-volume mailing list traffic.

There are other, better ways to get all patches that doesn't involve
subscribing to SMTP deliveries.

-K
