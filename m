Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E39221DB6
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 14:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787926303; cv=none; b=Mm3nJ9cW1MDufHvHgrJ11XDm12Gc0bxK6wCIdG267rm4FSH+LKN6kqUhffuguZq3VVpWV8uFYd75HoPxYS3LRhc0zhoVcg/QJyEQB35nZIO3MnkBHPsgJSspJtWXppuvMUPl6zMkRo+PGeEVLgBgdRO2SZ8HRBj9qg/wZCYrD0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787926303; c=relaxed/simple;
	bh=rfZQMJk0QojGeerF7VpON5SFK7fQIGAzTQKg6xW3DVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bycYqFRP6WcfmnzL+LY6d/LBu/iwWANU9yqjFr1z6wi/koSap64t/3tADgX0V1CI5dWNydV8S+z5C7kBpB9sy25nKqV5UrKafY0KhhVWUVGIwy43XS+qIJJLvzQMZtaI8Uazmduo1wKU45kw94Y2aBzvfnOJa/UvG9XLJIJ6plw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=Gbh+Ih4x; arc=none smtp.client-ip=84.16.66.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="Gbh+Ih4x"
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4hWgKx4LLPzpKs;
	Fri, 28 Aug 2026 16:11:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1787926293;
	bh=Yj5d/n0eufWls/mWi+Enje3aRRyT1QVDgQ/a+c+prIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gbh+Ih4xZbzVGBWwXmmWWKAmQyfPnihRUYXqYzt+4sicqqiMli5IrIlt9k5LweGmI
	 RLRvLaa1LJJiy9RO5KpxvxKAy/XkM3fG4AJyhF/RrJGG0E2wV29Bg9l6mFy3DaNb7N
	 cRvvFGm4eGUwYXaFlk5HnrtqgCNMoxqJlweikMaQ=
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4hWgKw5GhwzK0m;
	Fri, 28 Aug 2026 16:11:32 +0200 (CEST)
Date: Fri, 28 Aug 2026 16:11:30 +0200
From: =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, linux-kernel@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Bart Van Assche <bvanassche@acm.org>, =?utf-8?Q?G=C3=BCnther?= Noack <gnoack@google.com>, 
	Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v1] clang-format: Fix formatting of guard()
Message-ID: <20260828.ye1xoPeeweel@digikod.net>
References: <20260708105713.2073335-1-mic@digikod.net>
 <CANiq72nB6=EAeKmoWcsVR1YeUCMkFZTEdndLcSOEi1kQNPAc=w@mail.gmail.com>
 <20260708.yi2Ve3eeGa8a@digikod.net>
 <CANiq72kgYwB0CXizay_5ejvqzcxxV235sm=xEwBNTGpqGcdUnA@mail.gmail.com>
 <20260708.kae9Abuath6i@digikod.net>
 <CANiq72mmZF7QXdk+9s8jcWU5mfACy48gn6wZ1RZQwxaK9-03YQ@mail.gmail.com>
 <20260708.Ka2tahree8ad@digikod.net>
 <CANiq72nPB9-GpYFpyOxedtFRDGb+6EoGjMCYQ00S6wh6dth4Qg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72nPB9-GpYFpyOxedtFRDGb+6EoGjMCYQ00S6wh6dth4Qg@mail.gmail.com>
X-Infomaniak-Routing: alpha

Hi Miguel,

Could you please sent the PR to Linus and Cc stable@?

Thanks,
 Mickaël

On Wed, Jul 08, 2026 at 02:49:35PM +0200, Miguel Ojeda wrote:
> On Wed, Jul 8, 2026 at 2:34 PM Mickaël Salaün <mic@digikod.net> wrote:
> >
> > I guess parts 2 and 3 should probably be send for v7.13 (it's a big
> > patch) whereas part 1 in 7.12-rcX, so I'll let you handle that properly.
> 
> Sometimes I sent these PRs to Linus in -rcs, to catch new code, so it
> should be fine, I can do it either way.
> 
> > Yes, thanks.  I'll keep the Landlock-specific patch I sent.
> 
> Sounds good.
> 
> > Yes, but I enforce it for Landlock, which helps a lot:
> 
> Yeah, that is very good, and I am very glad to see it is useful for
> you and that you could get to enforcement.
> 
> What I meant is that it cannot really be "truly enforced" across
> trees, especially if the config keeps changing and so on; unlike
> `rustfmt`, where one is not supposed to push anything to linux-next
> that doesn't pass.
> 
> I mean, I would love if we could, but it is a very long-term thing.
> Over time, my hope is that more subsystems start enforcing it on their
> own and so on.
> 
> Cheers,
> Miguel
