Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792771947;
	b=mgUSg9XQOG5IIa6Yky4we9q9fYnLV+q1j2n8eNbvDagZJMo+CmruZR1esJamrvklSEvg
	 Be3pgyh36Hfrrmgioy+hTvWq4wI75ZRE/WFAH9TbugCuDjpekSBnZ7IA4OmXzPxJpOM77
	 ZwBta7/zDWIypxrg291tyu6YP7TPo9rwWwFnP1BR/V6RkVsXmXjioNgD+Ve02ijrX02b8
	 7bO0o6wnZKmbcilzo3qBt9oxKwr0WIHGXFbrw8ad9K/VEQH7NB3b05xnaVOk84aUDXNEN
	 mWeAIA3jw7HwI1Lfmn1x9uJKFcXY/OG06+Y0Twa5sQk45+r4ujpuX/huwfroHqHsSyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792771947;
	h=Received:DKIM-Signature:Received:Date:From:To:Cc:Subject:Message-ID:
	 Reply-To:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=Rgsi4sURnS/c5LhGcbQD/DuNP5k1Wm4ZhKEi7rj0iyM=;
	b=Md2xAft8Z4/FWI9W0KDaHVFtldRNiSm4M+WGm63DpsfENblxcXsT7KXVL71gYd5c+JRL
	 nBwEWirD267Dv7cFpAleYFlJpJ9F9JliL/cas3n9V6XLyok+TKFqI8ELZBxiULfXTIyK2
	 AfYq999vKJK6c2gJafekam1vergUA/csNpgZgv05VTI8W7sk4eAdm9xP/DXFLf5wtvbau
	 jmC6w7VEtRSWMOw4LVMOsls8qGNpwbYgRGIkqIukKbGolWvQlwEqtK/Q4uuDpqvKCHrr3
	 wZO313yL5LgzYrF9gz4YWGKKWDxSfJwpjhC7HfunnHWMhwJdhxzdCgcyb7Kf1tPSWKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V+MJjMwt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3BC4606A31A
	for <linux-kernel@vger.kernel.org>; Fri, 23 Oct 2026 16:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=V+MJjMwt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 247101F01825;
	Fri, 23 Oct 2026 16:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792771947;
	bh=Rgsi4sURnS/c5LhGcbQD/DuNP5k1Wm4ZhKEi7rj0iyM=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=V+MJjMwtQ6LB7JyboxACaXIk5bZTQcb4IUPaiYyAGnYan38+o9KnBdZSknlN9n3ij
	 sf4dQOJ36FRUr3CYzmqKWJqwXND7DEcto3cyTe5kW1AuaEG8GQnYKL30eEjhIxn4zR
	 nbKi6arzhj9pmc+6pM4TlVjLAt51i5dEQVl1GT/NWiR2+2j8RbbUyafmROujvbSHyn
	 m6ddGy/O63IDaHXz2unOpq3O0e4c0iAgVUyFQiTPthm/eSSenvI/NV4j+/HwaMn5As
	 0SUIKkQRZSup+GdalfcLOw5rulkaPhrToegT/YsHf4UyTTklEd+TLvfGFa1PlBxLHQ
	 bZKZtYBS7Yqug==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D1B7FCE0540; Fri, 23 Oct 2026 09:12:26 -0700 (PDT)
Date: Fri, 23 Oct 2026 09:12:26 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Jan Engelhardt <ej@inai.de>
Cc: torvalds@linux-foundation.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com, Bradley Morgan <brads@mainlining.org>,
	Arnd Bergmann <arnd@kernel.org>
Subject: Re: [GIT PULL] Add two-byte cmpxchg emulation function for v7.4
Message-ID: <6f24126a-7f84-40f8-a297-095b470beb8b@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <fca9b4b9-75e1-4837-9c73-6f28cb8237e0@paulmck-laptop>
 <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>
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
In-Reply-To: <4p5316or-75o2-s068-74s3-6q5011o75672@vanv.qr>

On Fri, Oct 23, 2026 at 01:26:25PM +0200, Jan Engelhardt wrote:
> 
> On Saturday 2026-10-17 05:51, Paul E. McKenney wrote:
> >
> >Add emulation of two-byte cmpxchg()
> >
> >These commits add a cmpxchg_emu_u16() function that emulates two-byte
> >cmpxchg() in terms of four-byte cmpxchg() [...] 
> >namely sh, arc, csky, and xtensa.
> >
> >There is reason to believe that these systems will soon no longer be
> >supported by Linux.
> 
> riscv64 also only has two exchange operations 
> (lr.w.aqrl/lr.d.aqrl/sc.w.rl/sc.d.rl). 
> (atomic_compare_exchange_strong with uint8/16_t, in userspace, gets 
> replaced by the compiler to a lot more instructions thanks to 
> implied -finline-atomics.)
> 
> Are you saying riscv64 is going to go unsupported too? ;-)

Given that the compiler can make it work in userspace, then the riscv64
architecture-specific code should be able to make it work in the Linux
kernel.  At which point there is absolutely no reason that Linux-kernel
support for riscv64 should be dropped.

Or am I missing something here?

							Thanx, Paul
