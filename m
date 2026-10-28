Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200755;
	b=xTlLFYtd0WVcGB+EFDApDYYqI2jYn27yqjeo8Ke4LMr/jsAVZctF+JGiWr8oLX442ejj
	 oIh9iQjvdjdzGSdTV5JgXt40xaB3gdaTlL5rZdarycbqB++aejUMGYlQPZcq/d3NN3NCs
	 9ApOEoS81nMEDctrVgwhKyFY0qZZuvnL4ssf7twclK43KKG90XEANw51sQuAgyEtxb2jJ
	 UmZGCPd+PvGi4ogk+TjjxZJjHyZfiwy0bB9wf9SVZLiSUrPKjf4NBgSA3VYRP0tka9PcC
	 QKneWfYVGxZqf97HPmdyWEY6losk/JbpkQPzeAYVGondn04w1C1Erv3vy4RRVBXnJxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200755;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Bx7hw4DAGiNHt8n2+ovyeWcleIZQ4+n68Zz3MpzhkSo=;
	b=O508B5I4joNhZBkgum7Xu7NKdBiQa9TaiBfRrKujRNjWJ1dV+y1+mhWqxHtF8NEL8Hey
	 M4FBcpeDYvRqvBfSpH60tSzeCImD5e+cy0+xCA50el7vaqivYs354k7fi7ofesoFXG0rb
	 ydxvdL9WUjK9mVzdZ95TLArDJ7woQIZkNKSyV65l6wySCONQU4kyxyrEtlxnWItle0LM/
	 49y345g9pn7VE+6KKJwSX8+KcwJSOUiQTry7weP04MQemmUC2HCfR1VJaBblGY7t0fo1M
	 0wRA3R9ena9/QEd7Ywoht+YUq3FSMGvidujWMc0kLQ/voVB6dh/CCwuqVG3ZmzUeBQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmpxchg.org;
	spf=pass smtp.mailfrom=cmpxchg.org;
	dkim=pass header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=nhK8cGaG;
	arc=none smtp.remote-ip=209.85.128.174
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4A7606A322
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:19:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A4A7606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cmpxchg.org header.i=@cmpxchg.org header.a=rsa-sha256 header.s=google header.b=nhK8cGaG
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-8b0e21048f8so9562027b3.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 08:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1793200748; x=1793805548; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bx7hw4DAGiNHt8n2+ovyeWcleIZQ4+n68Zz3MpzhkSo=;
        b=nhK8cGaGFswEzQzn6jxV8d7rWrcdufVj9AiZWeEMEA/Wupaev46NciUKgGJUUt3ByL
         uao2VGURsbYEidWyayLH3DVOhUbQRhSYSuzIu28/fAoxmcIG0WedVAvdu5647p5yknP8
         kWlj+kneMmtUzA/yOYN4x6liHGLFt1vXF82qlxKhaZtv3f+2egWqfsBb2ENt6uJ2RXAK
         NM3tLDc6FE8jxJ7UEeKozD6X9whokC1ta0k/a68oKBzaoD7h1PjK5rMScjVHyC+rtG+2
         yJm2ktJusv8LTxfcvqDJq5ure6P22NbWO1Uf2DYmUx2A/mXHzlRtHpSXAc+UmBBZ4N7H
         mldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200748; x=1793805548;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bx7hw4DAGiNHt8n2+ovyeWcleIZQ4+n68Zz3MpzhkSo=;
        b=2FtlYPChRC4ZFB2eRV/UDcWXJfl1/6jOr1Nmo+OrWilOZYI7hyjoKE8CCWuf4cRRo2
         8r2UtMw9K7wckoNugBXfswIpt2epcNVxWCbWs9k8X67UmqFJUkRivVr0DgqSW0IB1FIW
         vNficyULpipsPszQwEmBfvCmvYGM8LdrGw6oLZaXqZ0lWLJ9BUpO/eIy3dBIG/JkG4rw
         Pg2UoIU4mhlzSi/XXc3Zpy6j+aaP/g341QKqDMqhq5iLq9Ft192O4eVe3zUv4xyez96N
         1jSmyRa0YnuSXPBH9rWCOnOZSOTPfcZrF41QE8PqBiF0B9mQ3okElfhzfjg1xr34AYHR
         thNw==
X-Forwarded-Encrypted: i=1; AKwUvBzhwlVbifpZ+Xw40cv1led8DmcrptWyXL6XVFHiiV6ncY4fZKCAx1EACes2uQwG9dfc6lm7zieCuHk3EtU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJtw4sGRa0M/XMgGQb8ljXHlcnnxOsnT8wY7PwtcFxiJ70iz4Pi
	+ar7vbx/o0AlXYtxkZXHoPiQhgZpYR3dil+nukV9irF2ca35etyD4HaojwM0tg6jOMk=
X-Gm-Gg: AYBFou0yyO7So7doxydhm20+QRdJMwG6XBu7IsC1UvZF3OiZE0dj7FB7TtZoblms0Nw
	T3TsatfPfGc1kGr0DZfb9qYp5uUz+R+FDkLYh5ONAEJnXlOBwC1WsUtDCtcGTt1h9SnMt72kJpU
	okL0hq9Vef/X6EoCjqW68SygswOHIxqJ3VS53Noi/8vZV7eJxAdQI0a/66LD32NvjmJTWBPMCr/
	OjomMluzoInnqqW9VNwhzIGsAvkRCzBj44ITLrV7ir9imrFfymVJe9e/oy/OHR5Se+qm+SzkWMG
	I9MyefHandZWre7YlO8p6YFk67QrT0h5GPM8W3NSYvFqfXcanOseDxMVp4QB2GsjnjWUxAx6EFy
	16rskbhtdvjTwyWKTl8stNjNUQtUqdCiTexov1vGgQ6soZ3DExFA4ckqpBCKqiwvHzlBXoVnB3w
	nq62oDWEijn5dL+MpUNKaP6rdQ70ZrlgNtuYHxuIL4doUWDJ0NM3hcNdKLJ1esdsRtZvXT/SjYx
	5dFI+K6ABF5STL0XyypztXLN3olJIlj2s/WnDCWQV5k8i3qGg5VZHCAEr/+SuO35qj9h6Dzkcy6
	7FUICNsMJddaSJ1xZ0Z7OjENJo/b
X-Received: by 2002:a05:690e:438e:b0:671:4cca:b8ce with SMTP id 956f58d0204a3-67a7bcdc2f1mr1541191d50.61.1793200748154;
        Wed, 28 Oct 2026 08:19:08 -0700 (PDT)
Received: from localhost ([2605:8600:200:14e3:365a:60ff:fe62:ff29])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a7a19ac69sm1870050d50.21.2026.10.28.08.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:19:07 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:19:03 -0400
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
Message-ID: <auISZ5w318zwUZuc@cmpxchg.org>
References: <arFBr22V60BMmVpl@cmpxchg.org>
 <20261027150002.318916-1-dipiets@amazon.it>
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
In-Reply-To: <20261027150002.318916-1-dipiets@amazon.it>

On Tue, Oct 27, 2026 at 03:00:02PM +0000, Salvatore Dipietro wrote:
> 
> Hi Johannes,
> 
> Vlastimil asked that v6 of my page_alloc patch [1] not go to mainline
> before these two patches land, so Andrew parked v6 at the tail of
> mm-unstable and dropped its Cc: stable until then.
> 
> Are you still planning to work on 1/2 and 2/2, and if so, do you have
> a rough ETA? Or would you rather post them as a separate series as
> they are? If anything is needed on my side to move them forward, I'm
> happy to help.
> 
> For what it's worth, I ran both stacked under v6 on v7.3-rc1 and saw
> no performance difference on my benchmark with or without them.
> 
> [1] https://lore.kernel.org/linux-mm/20261001082152.2879289-1-dipiets@amazon.it/

I'll work on this today, will have patches before EOD. Sorry for
dropping this.
