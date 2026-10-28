Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793208087;
	b=ZIigNwzAVkA/CLO2atTZ6jwET0VDjTVZGtMUR7Hgr8swr3Lssz3DbGPJGfRwuYB52e4z
	 rx4AghnmuhtsylABRtwUnK/4hychl74v1i2uv+eE5655GMlFoJSXF6Sws/OCsR4a/GhUu
	 /3LSg20iaHhHar5RjG1546Sr7daGFcH/8EoHfST4FpneVg2K8FwYg9hnuPuqCvG5Ya4JQ
	 41M9cYb1cY7NQGOrUdAaod02rmoy7RNC92TmTmBXRoCBYnUeXYeB+KANCgvM1i8m9qZmY
	 ZvzI2xSzYFNVH8V+baxTrbCi8Gqmrse5mtAERqaeP5j4NQBjEINZTyR5S5CIhMtVXeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793208087;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=gKWv/vfGN+v0zoryVVsOrqbU4hq0g1uoOUtfYF5rLd4=;
	b=ZMBx8HKnuiu/bsQyg3RZTXhMR2vhLkEM2COcstRQkQH6Z/8pPTsFboerpj6G6a9k3UpC
	 pef3RpPH2KDW4+5TBnUYUfYp2h+Qbda23knT/rLryRB8llIZjoj5U8qjCsOiV0Nj8hwqC
	 9cdEfQdKRjPp05fM3ajdGLPBkgwKQljmVSKaNwnlrFyw3+AffDfVZV/YIqUP2wHv9j3S3
	 i/GTfjS+mQFjEak+NYwCCgkWjmJSIKlU65S05sVZSM8X6bW2CmyMgNJ2MaLHcH8ZiAqXp
	 t/ui3TcAUatlpjppmkoLwpQZ3yktQRdOrb49ImXDPntd+Hn90g5ZiEjNslQDX2dsgqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=SQlFBLtW;
	arc=none smtp.remote-ip=74.125.224.48
Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17096606A31D
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 17:21:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17096606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=SQlFBLtW
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-6774639a8a4so1186407d50.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 10:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793208086; x=1793812886; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gKWv/vfGN+v0zoryVVsOrqbU4hq0g1uoOUtfYF5rLd4=;
        b=SQlFBLtWetvrAOGwtD51xhjKHJMBmuVVhKXJUHggsefbsTBeA9lSUtBHLEvFQVQpwk
         5rxgza6m/fEullx3LCe/5EOf9NitilOHi/ZmD+JZoZrLhue8TEStDNUqIv6MnHIQn4BL
         ASJwtOkabzww4BdFogItYgHjFyEYahE+mlqAedNSjHJcjtmSyL93pQIFRzgVKyVw/q9Q
         81abU0Nq7hvVg258F3rlDeN1MY2edyUC5XbswXKuXMO7fBepqm0oxBuoEywcY0tTHB7W
         viLo1aeiP6zlrKoB9h1bFeSUMb6NEqE315HFQ0S5k0SQT/BxI3ijsPyYAnSyXqISjRVX
         A9cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793208086; x=1793812886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gKWv/vfGN+v0zoryVVsOrqbU4hq0g1uoOUtfYF5rLd4=;
        b=fozAMYWuEr62m2/zlKRlunad5iNr/T0d8gFCB641zB5Qg/dYE5tuGKSE2P8VN6unwS
         Bd4VKERwNnUuur4+3oUEFdCYp21RGXBC6i7saBe6glNbCc+xTTI2OPEGcqEhrb9WvdlE
         Vq85gGCw5R/8p7+7h+dcNP7dYxl7kNMYrtHX9j0HSSrNR65pXsIckKpEp4uWA0ZzR/+g
         3+rjiFfr+tDvVz3jWR2yKO1vSIudTOq68TQzr15Ynf34gEPlWUfHsXYIJCHO/1EtxLxR
         7Z2W2Uhr/i3oBy2RzThqbLAHZ3lcFJEVrgHzoii0c5jZk5V8n1lMWqEUA+PMenCELn9C
         DlsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfzPATpo7Kw5uvuvBpepykhsQW+YPmeT4weL3cVV8rT9NnFyeFhgcmOd421RksxoEQHseK9Je92DCHE3U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIB4mepE5/cs5Eh3ut0SIl+W30Nwmi/1BJuNTuRkSup3ywhAuZT
	cHcQEHNryICYGybB2k/z9fFpJf8JkCeV68HrJV2rXFp09yM3/SBZsTYgmXvL3P+u+p8=
X-Gm-Gg: AYBFou33uzP6M9/VopzUWw30BYSoZrLA8bXreBIgtvbVBFqcXKrrG/UNDaiwFa4bhRy
	462BxQJfyQw5RMDWAJUf6a1t5RihrCEPGzn4keMFgJ668SpFyIOFtc/si2xKSMYq3/6Z1oNaXD5
	Q4m19KF1JjSBrum44NAuiMMuQq7NGwV81UTH3hlnTkR9RfeuwI8Ba565Xkw5JdD14EIx2XbFkKC
	pV4e63F3ghhAWKQHfMkn9IYCdxEC31VX3WFL3VqfEtpF6gOCIfL7L1Wwl2wY8dK1+XjvOjOpUGu
	FObdij3rzPM61K5bGAGMt0xaofQzO8cOAh9TN7yucZGJjehdWzPgMMWESxiXUCanOFCN1UQZfvE
	4Dq7LIkYJsvp4RAW/TrplxRJTcvDANjQCCMw4D0nxzHH9NC1d8GybnWdrZNRA1NimeNA/TPseoh
	ptX7Kygib9dXhTwdJzIIbQWJBvusg/sBPI5kjINZrGnqcnLs+zTj7SlRSqP9F7b0T1IJOUYhNft
	ifjalRomZBpV5Rmhpq6uB6J0eAeOYiawYP67+FeJQruVEh7k83EtqDitN1dS61UJRcGphuixCHI
	plEFFKE+Ff0teqsYdWM71t9MgJDT
X-Received: by 2002:a05:690e:1183:b0:678:fa71:301c with SMTP id 956f58d0204a3-67a7b992b9amr1910178d50.7.1793208085931;
        Wed, 28 Oct 2026 10:21:25 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a0c31cfsm2144554d50.9.2026.10.28.10.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 10:21:25 -0700 (PDT)
Date: Wed, 28 Oct 2026 13:21:24 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: Salvatore Dipietro <dipiets@amazon.it>
Cc: abuehaze@amazon.com, akpm@linux-foundation.org, alisaidi@amazon.com,
	blakgeof@amazon.com, brauner@kernel.org, brendan.jackman@linux.dev,
	david@redhat.com, dgc@kernel.org, dipietro.salvatore@gmail.com,
	djwong@kernel.org, hch@infradead.org, hch@lst.de,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-xfs@vger.kernel.org,
	matt@readmodwrite.com, mhocko@suse.com, ritesh.list@gmail.com,
	rvvandan@amazon.com, stable@vger.kernel.org, surenb@google.com,
	vbabka@kernel.org, willy@infradead.org, ziy@nvidia.com
Subject: Re: [PATCH 1/2] mm: page_alloc: do not give all non-blocking
 requests reserve access
Message-ID: <auIvFBlNU5N_PVyd@cmpxchg.org>
References: <arFBr22V60BMmVpl@cmpxchg.org>
 <20261027150002.318916-1-dipiets@amazon.it>
 <auISZ5w318zwUZuc@cmpxchg.org>
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
In-Reply-To: <auISZ5w318zwUZuc@cmpxchg.org>

On Wed, Oct 28, 2026 at 11:19:08AM -0400, Johannes Weiner wrote:
> On Tue, Oct 27, 2026 at 03:00:02PM +0000, Salvatore Dipietro wrote:
> > 
> > Hi Johannes,
> > 
> > Vlastimil asked that v6 of my page_alloc patch [1] not go to mainline
> > before these two patches land, so Andrew parked v6 at the tail of
> > mm-unstable and dropped its Cc: stable until then.
> > 
> > Are you still planning to work on 1/2 and 2/2, and if so, do you have
> > a rough ETA? Or would you rather post them as a separate series as
> > they are? If anything is needed on my side to move them forward, I'm
> > happy to help.
> > 
> > For what it's worth, I ran both stacked under v6 on v7.3-rc1 and saw
> > no performance difference on my benchmark with or without them.
> > 
> > [1] https://lore.kernel.org/linux-mm/20261001082152.2879289-1-dipiets@amazon.it/
> 
> I'll work on this today, will have patches before EOD. Sorry for
> dropping this.

https://lore.kernel.org/all/20261028171719.2043421-1-hannes@cmpxchg.org/
