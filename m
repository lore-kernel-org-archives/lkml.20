Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959664;
	b=hBq+ZuXTks0i6cwynFquQHGctPDG8D0fscKu9huft6GMMXfkhWid2IMa+kRTPvcz9Fx0
	 xIuB5HC+y3MIOUuxk5vToRC0MEFrqfJAgCUtbfSguthHbJo8Wk2jGG8TwP2rKapvWuOqz
	 3AXuc353k+clEc64HI4WdovFfvdYZtiN34/yB3OU4zSwGZPmnLdb+eB1VGWQtl6XBbE7X
	 hbK/jjjRRr9gyB9yxFrM08Yw8ljed08sJzHA6rOEt6Hg3tPg8BK5kmbzObNmuq8eYERrq
	 DexJnBe1FZK5Egs8XO3qeX/wQh4sTdOwtQzHVJSEgcbBygvCdRagQ6CLhnvmHQHaKXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959664;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=xISrLrkizMl7yJxaTlfZqoeJnZK8a6hbzOaniZGY6+w=;
	b=0qPiiQGmg0zPEEs4pC56E3zIHfnUkBwu8geS3H1nEZoUJfJGGIssHMTY8u102x1U/XVv
	 lYnDMdGU6JaNTEOCqIjrz6CQk5vyey4cd2/lU4mUIyZA5XRCfADhwH+dXZkw2erDH14zd
	 3ZezYU1HnwYhTbP2tGtnj5WOOmPJS+3jCqh6VOqkk04JpFnxkrK9wP4jPjfQvKX4c5i87
	 c6IuKebHix1lhQi/iyX9RmCXld54hDYHSFxEJO3z8U4+Zxoc4poNrhxtvGMTMJcD9bKE8
	 MYx82xzZONhbiUgm/ilk9vk9Hrbaabgxudl5HHFfF+ZKTMiPbZxjZg02V9YP31tGwTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3mJJaGU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2221606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=O3mJJaGU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47991F01825;
	Sun, 25 Oct 2026 20:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959664;
	bh=xISrLrkizMl7yJxaTlfZqoeJnZK8a6hbzOaniZGY6+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=O3mJJaGUydflanSZMujzW4Lz5+ki/LlS/8cAwnZMQdOGkLDkb/3oEpKev5dDk1sbf
	 l31fhyRiyvVAKdogj1+4+8nu9nbS3HsEhEXNAxWhDCJNEYC0b5rSHKTDMNwdfW402F
	 uhev+vAUtUlZmKzJ7hjp/bMAMSmu2lMwQFeZx2a8RdMKqZnq3hdbmY/Eege111tAyf
	 NEw6jyb+3eUjwq2eJVKHh+X3g7upRDnSWYoI9weMVNQQsaR6vpqFkvzp7v/UwKdeuR
	 RUfGWM4gRMUUG7AwHGe7gKbAHocKmp2ki63HTYcBp5cO4FB3K8QJIq469eLzpzFF8T
	 sA8yUNQiOhhMg==
Date: Sun, 25 Oct 2026 13:20:59 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Antoni =?utf-8?Q?Kuczy=C5=84ski?= <antoni.kucz@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/build/64: Prevent native builds from generating
 SSE/AVX code
Message-ID: <20261025202059.GA1945927@ax162>
References: <20261025174336.8857-1-antoni.kucz@gmail.com>
 <20261025194411.GA56787@ax162>
 <20261025200735.61814-1-antoni.kucz@gmail.com>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261025200735.61814-1-antoni.kucz@gmail.com>

On Sun, Oct 25, 2026 at 09:07:35PM +0100, Antoni Kuczyński wrote:
> On Sun, Oct 25, 2026 at 12:44:11PM -0700, Nathan Chancellor wrote:
> > This option has been in the kernel for quite some time and I am sure
> > people are using it. I wonder why this has not come up sooner. Just
> > unlucky timing or configuration?
> 
> Configuration, on my side, sorry for the noise. Following up on your
> question I found that "gcc" in my PATH was the icecc (icecream 1.4.0)
> wrapper. To be able to distribute the compilation, icecc replaces
> -march=native with an explicit list of options for the local CPU:
> 
>   /usr/bin/gcc -mno-sse -mno-avx -Os -march=ivybridge -mmmx -mpopcnt
>     -msse -msse2 -msse3 -mssse3 -msse4.1 -msse4.2 -mavx ...
> 
> so the expanded -msse/-mavx come after the kernel's -mno-* flags and
> win. Plain GCC 14.2 does not have this problem: the reproducer from
> the changelog built with /usr/bin/gcc-14 emits no SIMD instructions,
> as explicit -mno-* options take precedence over what -march=native
> enables.
> 
> So the changelog's explanation and the Fixes:/stable tags are wrong,
> please drop this patch. I will report the issue to icecream instead.

Ah yeah, that makes a lot more sense. I guess the easiest solution is
probably something like this patch internally where the expanded value
of '-march=native' is moved to the front of the GCC command so that any
overrides can happen naturally.

> > Maintaining two copies of these flags (and having them appear in the
> > command line twice) seems objectively worse than just adding an extra
> > 'ifdef CONFIG_X86_64' and moving the block up so that this happens in
> > the naturally expected order?
> 
> Agreed, and FWIW your diff on top of current master also fixes the
> icecc build here: -march=native now comes before the -mno-* flags and
> arch/x86/boot/startup/gdt_idt.o contains no SIMD instructions. If you
> think that ordering is worth having on its own merits, I am happy to
> send it as a cleanup without Fixes:/stable, but I understand if it is
> not worth the churn for an icecc-only problem.

I guess that is up to the x86 maintainers. I would personally be fine
with it since the workaround is basically an extra ifdef and comment,
which I do not see an substantial maintenance burden, but they might
feel otherwise.

-- 
Cheers,
Nathan
