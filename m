Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CBC3403F5;
	Sat,  3 Oct 2026 14:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791038066; cv=none; b=n4ap5eslb/hO7VYO6kzLdRLExQq2CoYmpNnWkbK0c2hB9sCgIYsYjoTuERQbDuFQ9w6yf6n6UFgdjOETxuQrrway+QjOUtLf5mW5sTUG2Csr29yywlPSqlvfyN6ye8Y/FEgZaf47W+ByTsJ07SdPrs3q6PtEvo7Oqrdvxt/+udI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791038066; c=relaxed/simple;
	bh=EUHTVU2Thlb9v5HDYZ9brf9jSxeVOJkLoCthUKqlyeY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8+139M+fHEB01D/nWsw8oys7pDA+1h9KPMJ9j5pO6VXBKSFykoxZITHueZcGigTW6MI1i/Y7bMDElcQnu9aOs0tA1xTEU35ErWtREUp7F9hbYsTSkhZ8KkXd5cFmie/q9vcK91jcDYf1D8aJGByiz3EQ5hgXOV6JdV2uyjQULE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VDd+ju+t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VDd+ju+t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A24681F0089B;
	Sat,  3 Oct 2026 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791038064;
	bh=EUHTVU2Thlb9v5HDYZ9brf9jSxeVOJkLoCthUKqlyeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VDd+ju+tGZ3HYnSZ4xnE2vL3ZUZHyHawSVnNiF0K1dMr0HzBPDBx6/2sry3ubHLRw
	 rkUPxXe5cJr7fF7K/GGWB9a61ufK3uOQHIO8MyvO0NCdsZLqCHW79Ob1bUyrCDvL5u
	 ZxCYA4wCj2sj9p6Tn+3a3z5AqMFtnL48XCxuNmB7x8fMB0HcixlN2FT3P9+4B7B46e
	 p2G2QP0Uj+g3H8KJUqfGiSXips5KWsy2WWbjMRFsp6jpm3TXIbc1otFBqkrJaSnHdN
	 GI1E9plAmdWwE86JDgcdU1ZmP5M3Dae4YoWM9yykkmsXXm3co+iUzNyMNQwUBrum58
	 Wxi8XYx4JYWVw==
Date: Sat, 3 Oct 2026 16:34:21 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman =?utf-8?B?U21yxb4=?= <roman@amarulasolutions.com>
Cc: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Peter Rosin <peda@lysator.liu.se>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	patches@opensource.cirrus.com, linux-sound@vger.kernel.org, asahi@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Message-ID: <20261003-adept-lush-beluga-09750d@quoll>
References: <20261002-work-v1-0-f0e53bc7331f@amarulasolutions.com>
 <20261002-work-v1-1-f0e53bc7331f@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261002-work-v1-1-f0e53bc7331f@amarulasolutions.com>

On Fri, Oct 02, 2026 at 11:49:30AM +0200, Roman Smr=C5=BE wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
>=20
> The pcm179x driver gains support for the PCM1795 and the PCM1796. Both

Driver does not matter here, it is not a reason to add bindings.

Instead explain the hardware briefly.

> are register compatible with the PCM1792A, so they belong in the trivial
> codec schema.
>=20
> pcm179x.txt no longer exists upstream, it was folded into
> trivial-codec.yaml when the trivial codec bindings were consolidated.

That's almost confusing, how does it matter? Drop paragraph.

Best regards,
Krzysztof

