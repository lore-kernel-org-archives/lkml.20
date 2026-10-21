Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595061;
	b=eOM4HILYINiuJLyXltvKuGP/fNOHrEPWQXMSIxTmeBOIujLCczqK0mvrfnvuhXdMuqhE
	 pFhqjx28CCfeIDKnO14n+/8ejK8ayNpSwRd3PF56LoYknRWQxWWNH2eAApC0tF44Ki9/x
	 dHhXBKvphl9uFCe0S9Ff+ads8IkkLKIRqDXdoq2rFCjVFxkE4gG4NtJfi/RoSSafax9e6
	 ZtuqY8cN3T40/6adfkkSnAdrZYqDF9sI39Bb2zkin+vkDN184Vwe8nmGrIPSk8mKfYZzB
	 b+jxkTJ5IR2+3ygxp4YI5yKDTCaMKdTJtzGYjd96iY7PCCag7X55uBZ0fDQT6XqQieA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595061;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ZSxyEI4AsGYUJT5acb4ZBGKg6gQOIHPiQd5kF/QQLZg=;
	b=WQ0smKm1F97lfylpG8S5qUI6AufNgYO5raJ5ItOylew1MlIx0jkQ/jodEZ7PqlxMT4hc
	 ieX41NN7PJo5g1gdDAQpew/UQbz58hhiZ44b17/rw1hvr8gO4qVuoR+2h0bab6Zz6Pb39
	 amBGazTDT2j4l6Gq3hHvIgGWAYtxxrRrrqeIgg2Tiu5UleIzUdH+AwBv8jKkmdHB2CAhM
	 fN5RVHrEnY4GmRuq6GVnPmF0cHSx0q/j0jGdN29PypbAxpr8hNBb843HibXWpFEnsDIWE
	 VIBiRrx3XK86R/eCc1a2rflqO4mTsQmb9mKFccENBPg/vWpSG0YClT53rKkqF7vs2EQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=amW+ICYO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF71606A319;
	Wed, 21 Oct 2026 15:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=amW+ICYO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062211F000C2;
	Wed, 21 Oct 2026 15:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792595061;
	bh=ZSxyEI4AsGYUJT5acb4ZBGKg6gQOIHPiQd5kF/QQLZg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=amW+ICYO77hrYCXI3wxQUrwhumFowu5yCjiD8M5x6qQ7V+NQlqBJHhyRzHjm0sWXe
	 khn0AEQaR8c7op+6XCCV+sQwM7a3zC5HTcr4NXdLzHPbxUoxFDoU3ABBKZ06m3xhPw
	 cFGFBLPGog/oW2lnWWSQMRrh8arlZRXs8AE4JgWI=
Date: Wed, 21 Oct 2026 11:04:20 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
Message-ID: <20261021-origami-groundhog-of-radiance-78baf9@lemur>
References: <20261020212235.1143086-1-ebiggers@kernel.org>
 <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <20261021063927.GA31908@sol>
 <d5d0801e-371c-4836-8b4a-26bff33df46f@kernel.org>
 <20261021064940.GC31908@sol>
 <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>
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
In-Reply-To: <aea2328d-4ea8-45bc-922e-9c1fed94083f@kernel.org>

On Wed, Oct 21, 2026 at 01:55:37PM +0200, Krzysztof Kozlowski wrote:
> >> So again: base has ZERO meaning to the maintainer process. It has
> >> meaning to tools, so fix the tools to work on known and obvious trees.
> > 
> > So what is your proposed algorithm to apply an arbitrary patch when
> 
> Already provided that, so to recap:
> 
> > there's no base-commit?  Including any historical patch (from
> > months/years ago), patches with dependencies, etc.
> 
> Dependency is something else, but for every other patch:
> 1. For testing/CI: you apply on top of next
> 2. Every other case the maintainer knows where to apply it, because it
> is his HEAD of next-branch.
> 
> I am repeating myself, but I really had no single problem of lack of
> knowledge where to apply a patch as a maintainer or reviewer of some
> subsystem, thus maybe I do not understand the actual problem you are
> experiencing.

From my perspective, I don't really want to force contributors to manually
provide the tree information, but it's helpful if tooling includes it
automatically.

Specifically, I am working on a service that eager-builds git bundles for all
submitted patch series -- the goal is to make it simple for CI systems to
fetch patch submissions as bundles that are already applicable against
mainline. Knowing which tree and commit the series is based on is really
helpful when figuring this out.

-K
