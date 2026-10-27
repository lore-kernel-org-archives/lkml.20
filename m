Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102112;
	b=y27YfcRdga9mZil2tPONMXX1BRkZ4h9XV9ZhEK7qxeE8sQ207ZfVAkRT7yLwVoQFQXBT
	 itoyQa6BjOzvQCipduuCSSnROfpp5MpqK92nVRFJHQ1JlJE59IM2ZSr7UcGCUGLOxuZnJ
	 c+i26mP488pFKv900gMElzZ1ujzILip4j9aQrRGtAEK/KTCf3dEdgMYem+USVVqeRprk8
	 S1lg4PQ0NQK/+rxBSFdfF3tCttsNzII5Z96XyCEoGhXmZdIsWMD0yxiGtdF7QtqyXZnHc
	 n9RrDSxPzSgPk+6vSFfiv5z5M0Jcev4bFv/5t0sdpBgOq07HmYH9j9i4kVHDeqb7Big==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102112;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=PA0aAaFh/9H5HFt7Di8mduI1kjnyfcgklhevJ7k24bc=;
	b=fJT3kAiH5+Kp1xxu1lWMFLe1pZZ0MNJtVpocQkhbB3AwwygcZTpOD3VOYGyOknpytPor
	 zJeQr4y0qwM/BULlWKFnHB4pNWbyVWcT8ZvYOZkZrxhJDdPM3qITsBiHT0VQsn2JqOF4a
	 ctqSfs/pcmlqN/hrbs7+avEh9+DFzI7I36FCM/u76AfeH2ZM2poc8KbiOrArlc4RRqmmt
	 hxE4tfK+GGSnMGmCHvdfkbXGkJbJEyMOidvGziuCWPSRdMzTdlksMoKHmzVNGi8SVnHqI
	 n+ZOmi92yiZ5OGog51+KS6X2aSt29nVlFLSJ4jTGJ2CwPMc5jApztM/XZsqRGPwN9Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6Lj7WTg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF97606A31A;
	Tue, 27 Oct 2026 11:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M6Lj7WTg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18B7D1F01825;
	Tue, 27 Oct 2026 11:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793102111;
	bh=PA0aAaFh/9H5HFt7Di8mduI1kjnyfcgklhevJ7k24bc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M6Lj7WTgp5gOXXOANVLTc/TCAGYF0TTH0Q/bmEx9u26HEmAyLHrPRDioFRVydnlcp
	 ePjOXeP4WnrsZCNG9mUGeJ4OkA4iZ39ouqY1XUIrColIvGvcdmss81HOwvzbYTiliW
	 4LJmjJILFU2jwmNxGggNwz1EyYD1zdsrntfVmVl9wMKAKmxrhHvlkjOb1+lLBCyubz
	 h+XYmjsdx0wOoaCuACCyih8A0bd60Q4tW3TCuGsPCR54pAdTDVYeY7gxLX0SuK10Ok
	 evgVYl0RY52hgDlICBN+YoV2ONjRKELcoy5HKDTzxnaw2YqT7Z9890B/OxWQCHxobe
	 9PPLstGTXZHWw==
Date: Tue, 27 Oct 2026 06:55:07 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261027115507.GD3598537-robh@kernel.org>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
 <CAL_JsqLA2F0oB=7LsoxZe-=AboOJu7FotpMACNsuV==jGWB8nw@mail.gmail.com>
 <43ef0af4-0594-41f1-9ad3-499bfb3352a9@kernel.org>
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
In-Reply-To: <43ef0af4-0594-41f1-9ad3-499bfb3352a9@kernel.org>

On Tue, Oct 27, 2026 at 08:28:06AM +0100, Krzysztof Kozlowski wrote:
> On 26/10/2026 21:12, Rob Herring wrote:
> > On Wed, Oct 21, 2026 at 6:55 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >>>>
> >>>> All these tools should just work on top of linux-next. Requiring people
> >>>> to add base like "next-20261021" or "tip-of-obvious-maintainer-tree" is
> >>>> pointless. I understand that base is helping, but helping and requiring
> >>>> an obvious information just do not go together.
> >>>>
> >>>> So again: base has ZERO meaning to the maintainer process. It has
> >>>> meaning to tools, so fix the tools to work on known and obvious trees.
> >>>
> >>> So what is your proposed algorithm to apply an arbitrary patch when
> >>
> >> Already provided that, so to recap:
> >>
> >>> there's no base-commit?  Including any historical patch (from
> >>> months/years ago), patches with dependencies, etc.
> >>
> >> Dependency is something else, but for every other patch:
> >> 1. For testing/CI: you apply on top of next
> >> 2. Every other case the maintainer knows where to apply it, because it
> >> is his HEAD of next-branch.
> >>
> >> I am repeating myself, but I really had no single problem of lack of
> >> knowledge where to apply a patch as a maintainer or reviewer of some
> >> subsystem, thus maybe I do not understand the actual problem you are
> >> experiencing.
> > 
> > Look at our DT PW. There are numerous patches that don't apply and
> > then we silently don't test them at all. Here's one example[1] (3
> > actually as the whole series doesn't apply). The more base-commit
> > tags, the better. If b4 can't apply it, then I do try just linux-next,
> > but is that today's, yesterday's or 2 weeks ago? That still doesn't
> > work sometimes.
> 
> I have doubts that DT CI would know these mentioned bases, unless
> everyone develops on master, which is obviously not possible. It could
> work if CI has all possible next tags fetched, but then I argue that
> without base commit such CI could apply to closest linux-next tag by date.

I fetch the last 5 next trees or so. b4 will also try to guess the base, 
but that doesn't seem to work all that well. If this is "easy", then b4 
should just work without issue, right?

Rob
