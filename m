Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 863024F799F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 17:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788456023; cv=none; b=odlYSeI1hfRnjqGrbfObWfgB3c2Mqs0pHXVt39c6W3qI644lb0GflPgdbiFAgeqLZrQX+n70yzMKofY91dFvR/MZfWv7oh2GZKxrmY1LDAqGe0gmFXfAFQME72a2O8Lq9nW1XAohkMN57QVvkUPmoFS0EllwRFCTBgwfVsbkCys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788456023; c=relaxed/simple;
	bh=XckZyXRA0wdQ2t/rQ8UQFXAwi1VWzGG6EOxNNhqHRbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hw5DHrCikikGy9Wc4SL1U53VIqbds1Chv7gkOOLDEZfnYI/P9Zb/eUHV8161gUOfAWqfQGTemeMUAWz22sKOe8fkcCWrmCwMqkdA02cblPr8GeOPjryfnk52D9Py/y99FsbqhHIylCt5qw2cZQBK/dZHdG/QGc9yOgrKJP2AtwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WNSOVNbd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=suy8bmZZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WNSOVNbd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="suy8bmZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788456020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=U9SlpKBC41ZAAv9XrMQhlqWr3QRc3I1Zse/kq3Web2k=;
	b=WNSOVNbdaov2n6ZJ/PClrDBAuVr8u70xn+oxh0/sQW9C/pNuZax8fgj7EPw0nnpZnEMo53
	cLOqAEJ5mbjD5puqNP3uaBO0cIMRQq9nhbgzDwzAKlZ35x0EcJMMdaUvL9n0L2Y5HmHmEL
	5w/lkQn2hSqQ7x8K2rm9vM0Ak6M0+zw=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-RXKkeczmMJWlHi4CC7efNA-1; Thu, 03 Sep 2026 13:20:19 -0400
X-MC-Unique: RXKkeczmMJWlHi4CC7efNA-1
X-Mimecast-MFC-AGG-ID: RXKkeczmMJWlHi4CC7efNA_1788456019
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ff59f2c47so1512171cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 10:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1788456019; x=1789060819; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=U9SlpKBC41ZAAv9XrMQhlqWr3QRc3I1Zse/kq3Web2k=;
        b=suy8bmZZfjNfgRDfaK9ZBd8o1ouh90LMiQK/I5jczUDchkJobgkAFDmF9dG9/R/vJg
         SRh6zzcnIiEAzUu0xn94eso8jgWmPtOyLctTVD8sWl9gZ7rDQP3xQ3LZMrJsY8A0l2Fh
         cGF8prgzj4/+DStASlHxJAUa88h3metcQz20cme4p/phU7dW/y/V81Vv7cfiCl85mlkw
         sZ82KutNeuBUtSaET+ni9/FEdiL2Br+KwHwCKs5fJBejWCF4B18XFEuqp+ZU5x+KqL89
         Q4azK7sX9LdORVoG0g7t6eJpYKdcjIJl8i/A+55BxXeG0OXnpk2av0NBFGndgrl/Q8Xt
         WCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788456019; x=1789060819;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U9SlpKBC41ZAAv9XrMQhlqWr3QRc3I1Zse/kq3Web2k=;
        b=MGCZDvcVwTiGh7vcSyOBil8dUFN+LuJToGolFzKXxnM8+obMUH9JhkGNW0Eejvde/x
         eqsPbmFUs8gAaTFx7ADVhUu2e/hF4Fvbfh730cQjfPkGR08Jr13TDbndpRBrFTbcdy8O
         I01+/zmjQ+5zvVBYMECgVavW6mbKxTysN0xtR53AOhfjTIyFR3sz8CtiD6tCw9rOdw1T
         uWgPUKgSYvOPQqV11ZOwfGQ+MzcZ7iqo9CpS/vY6YFqZ+UER7ykInvW58R0qtU19QelW
         mtuSG8P3PfdVNOjRpX4QubLG9j5Wsa7LYBZoupEn9ZGzFdSOmPw893B1fkrtusWc6wWB
         tFhQ==
X-Forwarded-Encrypted: i=1; AKwUvBxxvqOxeUvgWEI3nBIRNdgkud7tplM9ciBkR6mJXA9hovZCy/gd36J953Le1qzsmhaf8JNVIKPj9S8RrSI=@vger.kernel.org
X-Gm-Message-State: AFuF++lrP04cLY1ZJEkEeSV3ygQohXQm9nQvJjI8ipx3AoE/KsYDOBPK
	39JPiviqKXCkXf3lb2NEWTm49tf9nZx3kZMGat9FXO1WvfRcd3sIABiqNst7E5r3fgw0tpewm02
	DhSfvkX9GpPDohP+k/TKhywolp0QKJISnwylOpQzkZU4h/hQmvFT53H5qE5knlBUFNQ==
X-Gm-Gg: AYBFou0hn8vNDdTHDziFQ+qGGQLcU0aGKJP8JHhkMwf/4n7RTEbbG+aUKGF8a6icqjl
	U6piMrqwdgB3Sj20j6cfCAC/omYGN47t/LlX70kOMKYRjy8m0TkfbtZTnSNHS2l6BFwRM7Zttqn
	sruvKVEhu9V/Uf5DVi0jEaAf+YHoUuDXi4AZ+w+7XvBCirYLShYo9BDbWNtJZQ/aOPl/KAsCFk+
	+gShfvJ42yCisa4aeVc1Tdw5I8d+iwOjqjoO5FO4lGmz1HrwntNbWST+oA2qGl+cE4SoR51M0oc
	rPgzJcJ8GL1ra1hhxXA66PnAqXcZj7K1TXi0wL5lc3UTW3a7PPH8sRLkkiDt1fd6StU7Eht402g
	wABCHrpe3CwKa+a1h6K/5M+PJfN7PN1puXZE=
X-Received: by 2002:a05:622a:3d3:b0:516:82e2:7788 with SMTP id d75a77b69052e-53042f6ed28mr70704491cf.1.1788456018653;
        Thu, 03 Sep 2026 10:20:18 -0700 (PDT)
X-Received: by 2002:a05:622a:3d3:b0:516:82e2:7788 with SMTP id d75a77b69052e-53042f6ed28mr70697611cf.1.1788456013149;
        Thu, 03 Sep 2026 10:20:13 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530541eab6csm1956071cf.26.2026.09.03.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 10:20:11 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:20:10 -0400
From: Brian Masney <bmasney@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	we =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>
Subject: Re: [RFC/PATCH] clk: add lockdep_ignore_clk_prepare_lock cmdline
 option
Message-ID: <apmsSsXdc32Z09_f@redhat.com>
References: <CGME20260828131428eucas1p2cc2d9767d5ed62b8297c2cff0295226d@eucas1p2.samsung.com>
 <20260828131409.962825-1-m.szyprowski@samsung.com>
 <20260828133803.GT776954@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260828133803.GT776954@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Peter,

On Fri, Aug 28, 2026 at 03:38:03PM +0200, Peter Zijlstra wrote:
> On Fri, Aug 28, 2026 at 03:14:07PM +0200, Marek Szyprowski wrote:
> > The clock framework uses a single global re-entrant mutex, prepare_lock,
> 
> There is no such primitive in the kernel -- this means the clock people
> rolled their own. Why ?!
> 
> > to serialize all operations on the whole clock tree. It is taken by
> > nearly every clk API call and it is held while calling into the clock
> > providers, which in turn often take their own locks or trigger runtime
> > PM. As a result prepare_lock sits in the middle of a large number of
> > lock chains and lockdep frequently reports possible circular locking
> > dependencies involving it.
> > 
> > Such reports are often not real deadlocks, but once the first one is hit
> > lockdep turns itself off and all subsequent locking problems - including
> > the ones actually being investigated - are no longer reported.
> > 
> > Add a "lockdep_ignore_clk_prepare_lock" kernel command line parameter,
> > which marks the prepare_lock class as novalidate, so lockdep skips the
> > dependency tracking for it and keeps validating the rest of the system.
> > 
> > The option is only available when CONFIG_LOCKDEP is enabled and is meant
> > purely as a debugging aid.
> > 
> > Assisted-by: Claude:claude-opus-5
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> > The problems with clock framework's prepare_lock are well known and
> > there are machines that always report lockdep issues related to it. A
> > good example are Khadas VIM3/VIM3l boards, on which prepare_lock
> > interferes with locks used in PWM subsytem:
> > 
> > https://lore.kernel.org/all/adqtn6iljcguv3m3ovhltusbbf4mljzlwg73yklaudvjjtazxv@vyf5fvuzic6x/
> > 
> > This new cmdline option allows to hide prepare_lock related issues on
> > the test machines possibly enabling lockdep to catch other issues.
> 
> This is horrible. Why not fix the clock framework?

I'm one of the two new co-maintainers for the clk subsystem. Do you have
a suggestion for how you would change this locking in the core clk
framework? Long term I'd like to see more fine grained locking since I
see at boot up on my Thinkpad x13s laptop that it takes ~10ms in some
cases to acquire the prepare lock.

Brian

