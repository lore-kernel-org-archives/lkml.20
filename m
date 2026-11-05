Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871891;
	b=hRVwkEwSGK6YCZTmydn+t7IzsGFwiIDmMTvKOKzCoJjIcLA69XDuBw8CafV16OXcPJ7+
	 OKwqaxjMF1R7ejacRXPtKHVH57DXjN9AP5OG47eTxJkqfEVA/gJlTkdqsnCeTjmmCMZUh
	 u5uUZ2w7eZ0hvLzeorrBZUYVJw9SLwIUYJUYhZVtm6v8btVU5sr2byXhuh1NZKXLYC0Xq
	 zWlV3XKCjHVpHCyWg0GynTf2wEXJiFNZq5gZK64Yu+95xEpqm6dJfLUrP5fV4kdReFmlX
	 um8QIDOdWp7KgZAxRjK0il5EjlTlslyDxsmnRMFEHnqxxyhzJ8kjXLtE7GMi5kADzbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871891;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CTI1R5ENW/8u31rZEYKS4NOgl9Fn+gpZCc6eQVDaxPg=;
	b=X88SulvvVDJof/X7jkVgAE6EZD9TlRQ4uu1mkJBTGJDDDy79lBmvcFcYU+5a9BNv36O7
	 /ENIOtqvSpV48lS9enMLjVwSCZwuPz0F2p1bZKeU338Y30FSELYhKMY+h6Tv9usW5Gz8b
	 XHxZNR7vAcjs925aeUlhiw9pKtLY0BI5uFlb78KVoCmbpWQSgrHfxmxwh4HKvoRUSaWQH
	 xGuBT0ipqO3UeAbUMlJZuoqNDYtScSdSvYHV7HNM/0irxKpn9uc/GygRpDn3+Uf1o2ZZU
	 XMNMbXKSrthCFpAPYgIjpyJEFjcZu7P9eBiNq0mTtpWPmS+G0wcre4BtS19wYjLXblA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=WZypXXBn;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBF4606A330
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 09:44:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CBF4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=WZypXXBn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=CTI1
	R5ENW/8u31rZEYKS4NOgl9Fn+gpZCc6eQVDaxPg=; b=WZypXXBnCcAcXZ0C98OW
	+MNg/mlbGXR6c+cMa2epEMTf8OtDZAn9qN9pvmgNCsofvwxGBQyRQlN+V5+mre4U
	t4lCsyLRgfCW9wFqgGIwVVGulTo11QkItk2JCDT3edQPsqnvlD29dO3xFzM55rtL
	cfVrUo/Pn5oftn4GvV9tir7y0N1OGTdSsxYYbneRmNtTXso6pf/lJfl3BRSX3XY1
	UDyFITgkdxxOu0c5AfO9YZ8JReiQw7QEJT5RwJGkEn14QsKpB+9D6c6xEJt9lYDh
	a6XwF/2rXcVJ1Oc8KaOeij9cBhMUwDj0UeOaveuUaZzmKrV27JkFoAjiP9qpok86
	BQ==
Received: (qmail 1093661 invoked from network); 5 Nov 2026 10:44:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Nov 2026 10:44:47 +0100
X-UD-Smtp-Session: l3s3148p1@BgSfWIRf6KjAwtcC
Date: Thu, 5 Nov 2026 11:44:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v2] docs: submitting-patches: Clarify half-baked review
 tags
Message-ID: <auxQD7SNOOL3uZ49@shikoro>
References: <20261105082729.19622-2-krzysztof.kozlowski@oss.qualcomm.com>
 <auxDTdfMVS3yazCk@shikoro>
 <35983c5a-7deb-4b0e-9bd4-981754343200@oss.qualcomm.com>
 <auxHASG78dTviSz8@shikoro>
 <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>
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
In-Reply-To: <CAMuHMdWA1LNNaih3DHUM7yxpoyrnUndWDKpOjqb6_hSWWs7KHw@mail.gmail.com>


> > > Reviewed-by even with the "# subpart" still appears in person's credits
> > > and reviewing entire patch of 700 lines of diff code (like Frank's SPI
> > > patch) is not the same as 10 diff codes for one driver.
> >
> > Yes, if you want to spoil that, you'd need to introduce
> >
> >         Partly-reviewed-by: ...
> >
> > or something.
> 
> With a parameter taking a percentage or number of files or lines,
> to serve as input for the Big Statistics Calculation?

I assume Krzysztof addresses people playing number games. While I do
understand this motivation to raise the bar, I also know people will
find ways to jump over the higher bar etc...

Quoting Joshua/WOPR: "A STRANGE GAME. THE ONLY WINNING MOVE IS NOT TO
PLAY"

Maybe we should stop publishing development statistics? ;)

Seriously, the main thing I am aiming at is to improve code maintenance.
And so, the "# subparts" are much more interesting to me.

