Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E9C137A839
	for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 08:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790412221; cv=none; b=H4wiHBRRvLtyPmKfwrS+ku9aCl2yp/oSBGAFcp+p8hTeY5QbNzGMDhCHiTkxinNKg91jm4lhoRlcYGm1KJw2r7KbAVpPTC6kjJexQEmvKHu706zkCGmrVgubZpON8v4762Hm8IkkOU3CSGatU4kPPwEpXzx16qk8hIWIZxcpsAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790412221; c=relaxed/simple;
	bh=12EUdsbFiHBURzlJjrzAK8K4NZINHomEF0ijgoIRkOM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxAyjUEmocoRk7y8mL+IwR9APKDpKT0/8hXJw7APK1NBfXjo2RYH2O4NS2PK5TDG+VYh20VjfFeGpLSXCbmJtr6G4Yf4Dvta16OhVULK76j6tPbWeDRH555oIpGIXP3wIGhnhig9voGGSt9JY53c+JWnoMgbuoYC4YkR6cJrffM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sQ9waO3B; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sQ9waO3B"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-48434392b02so1285844f8f.3
        for <linux-kernel@vger.kernel.org>; Sat, 26 Sep 2026 01:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790412219; x=1791017019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QCwVdOxjrFD+KrFGvyZLlA0okXbQCYf9gkSOoPwm8f0=;
        b=sQ9waO3BnTOzJMYOCXCLbcxZZobeBoAgwyUF4n0Itanw/bT0XnLu0IOpdVYUqDMUuY
         CnYvDX+CzGQAPCE9CBJl/4b9zolIuYpJdWuzZZP/X1bfrfu3VV856s+xf3mp+oW4W5zs
         c1u39oZiHrZBS0alTPpBNkqJ6VlGFu8rTRCMFgsBuJKJrxw+XN+ZLHC3z5fa5R635lLB
         0eSu9NAao1vCpTbLcwWb9F3I1ThGBdLeIf2TNcjEXTMRYY5UHGZatJHphdTfjGaa4xyi
         PayrediRnZ/8NO7cBojsw9lOfUsUjNUq/k/XM6+hAvdfDehzQlgpo/9tOOIwoqExXVjt
         VKEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790412219; x=1791017019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCwVdOxjrFD+KrFGvyZLlA0okXbQCYf9gkSOoPwm8f0=;
        b=sJ9dqnkadcMQHj9h1J/MSdGZyhnC2sIPp6kvXISILB0tTMNhQJF9RsmUt7ioE4yZV4
         L8kV5S+nSzADBhW8k1rh9MRB3bUcyVLn/OiTQltFwnBBsi8wRvuqVAYqcHFzbCiPCiFh
         94X9UWADE4EZnU/riNqnbbygtiVqQYjS9T44zhdGPcJ6PMGM68pkZCnaAXbFh5sL3FvX
         GJd3ZTv7bt+En+bu1m+IOx/aooY7DncMG8Ia5f3i1vkK0MleYZQQ6DsXh88hlSjTOwyG
         wbZYyQ07rk4tOw7RCMA5AmAjrlKQQx3YAO6m4ro2tjiDasY7FapheSkZJp5KzgQBgZnc
         +4lg==
X-Forwarded-Encrypted: i=1; AKwUvByS/PrXNGRbxZLCxhEBn/y05TW3DGWsHJJ1ZeM3rsorJ22ZlXN0H1ogrT6+7HjtzHJLo9bbyTvG4EkDNWw=@vger.kernel.org
X-Gm-Message-State: AFq9FYIwEpcwGjVNACLeSfTaukn4YS2YZC+0YGhzggIPynMI8zgd+i/g
	Bsg4zCoxWslm/xqfKiw/VYhyQbvtxHupYcOdAdjt6k+rdaBO23YXho+O
X-Gm-Gg: AYBFou0T8YylH4Wf5kYOxx9levUGmJClZBAOb6flb2TFRJIBQelsBA7zs0uaEqA0tRG
	SwFEzzIYU7hSgYVi+/p0KAQiOcoekIp3U1mFZKvZFCBQYdtZLNTV4agSH5gR9+fkncO0UDq9tpI
	N2SPwk4b1AkjIAvN6Co86oW02vwsYkmmSibfM6x4z/qw392O4BS3O0mEhLd/ZRLXVtYZJxb8Y23
	RRjQmfWCrhTUb3zFY0aP7tXl8a2fzbrTzABQ1V3BY9WWvKMdcdUJNZSQ6TOEWstr8FS5x++I+Ok
	qU/jn6WeRdm5QoJlTjuOnU9vgQ+Bewo0qezlTvsRchOFPfvHWK0LAYPyF6VIm9SqJK2ri2hX5Ex
	/LDRX1nsTBWriJMvcdjRNfATL92NyGx4Ds65FAHAQTMvA0K1PHExgIASZrluQFF3lRp5jbFJKgk
	2gjDdiejPXrbAq1TmrQYyXbzs919pnOwZLtYAmGdyIEgRDwPLhXggUrA0/4RqP4fddSdJrgSsCh
	FdAQpsNn/op/AbmlOWF1i/M4XMbvzOX9jxu4GkUUqYZnayN7vOislswmNSEzBkdY6F66iMDPBCY
	TjYBvybaVwy/FAMcyTyQlZ5lOw3A56Zb9DgkMzJdkndCsDAQyLwbJwLo0n9Qhe7TC8JzqT7Yt83
	OqGi59t8S/ZRSqU1TIWojxg==
X-Received: by 2002:a05:6000:1a85:b0:487:ee4:b5e4 with SMTP id ffacd0b85a97d-488716b6cd7mr15679810f8f.8.1790412218418;
        Sat, 26 Sep 2026 01:43:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-b162-c701-4960-a998-3de8-2fce.310.pool.telefonica.de. [2a02:3100:b162:c701:4960:a998:3de8:2fce])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm12979497f8f.4.2026.09.26.01.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 01:43:37 -0700 (PDT)
Date: Sat, 26 Sep 2026 10:43:35 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Jeremy Kerr <jk@codeconstruct.com.au>
Cc: Matt Johnston <matt@codeconstruct.com.au>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: mctp: Stop selecting flow support for
 KUnit tests
Message-ID: <areFT_yfInT01o2r@gmail.com>
References: <20260925192510.93840-1-kmehltretter@gmail.com>
 <8edc4e71edceb124e2dca233cddb75e198b53a51.camel@codeconstruct.com.au>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8edc4e71edceb124e2dca233cddb75e198b53a51.camel@codeconstruct.com.au>

On Sat, Sep 26, 2026 at 03:53:28PM +0100, Jeremy Kerr wrote:
> Hi Karl,
> 
> > MCTP_TEST selects MCTP_FLOWS, which also enables SKB_EXTENSIONS when no
> > transport requires them.
> 
> But we want to test the flows support, why disable this (and
> consequently skip the flow tests in the vast majority of test runs)?
> 
> > Remove the selection to follow the dependency
> > rule in Documentation/dev-tools/kunit/style.rst.
> 
> That suggests "depending on", rather than removing the coverage.
> 

Hi Jeremy,

Thanks for the review!

OK, I can change that.

I was confused by the existing !MCTP_FLOWS fallbacks, but now understand
that you want the suite to retain full flow-test coverage.

Karl
