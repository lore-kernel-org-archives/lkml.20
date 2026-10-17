Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A403BE178;
	Sat, 17 Oct 2026 17:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792259132; cv=none; b=HfA9gUXStamEZJq4ZzoXeS6BpidLmy+PPzC7lrQLIjz1icevgGBCBGlEoqA3Q40A1cuUcQ3Mn/a8Z8X9cdVP4x5Bl7SH18kjSJ1kPGYxgYWAEzDvy/yBB30ibQQveLRVCMDMXquVYc8q+ZHVj+aqJqTAAx4nfVuzpCf8+krbhbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792259132; c=relaxed/simple;
	bh=owzaTet5v3EgXi5SdOmanPONyS+RQRW3Vx26RCaPIP0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QtM6iwnPG7ejOFLQkMnKOwW15LslD/DR9HjVydQSofEoiWUIErhiIMnDEWIhGn0P7KMHq6K2Utmr8M/UQSwEZL+Gp2evujQmxBxBxO6hnT73LqsvhJNvSVTnWVHS8EsoidXNsOutLFyVRq2WL1R8rj6C3YSkvyj58lI1eAgcO9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b3PgLbaH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b3PgLbaH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79F81F000C5;
	Sat, 17 Oct 2026 17:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792259131;
	bh=GPzCo40LEnNwcaTb4CaHpuAV9iShvhyOmUd7WqaMELc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=b3PgLbaHEGLiLpHaf3B6QCRkw87Ww/ZQ+CksWs3f+U964DOpyTFvb77Zm1PHDPCr0
	 nJxd8W1Amz5ukzR52U3/KEoFkNVAD8bTK2FGyG+C+S0PovixxnAQ+KhUO8VwS642S5
	 sWd0846YLvW0Hm3c/Bmz2RNqQkdvRjBw3Uf4u/TG/YHmuHp2MJkeUdZTXif09ROtCm
	 ML41vGf5KMyKFedqae0ephevU0gI9vjHK9O/xhJ6r1i4Adv3AiMs39q3TUzUG4byP9
	 8H65cvKYtfDISGA1YmRJxGbk5IkrvsYyc/ZvmBXraPoL6EWKBqEq2idZdP4V6kLbVl
	 J9wNbbRM5UeSg==
Date: Sat, 17 Oct 2026 19:45:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Roman =?utf-8?B?U21yxb4=?= <roman@amarulasolutions.com>
Cc: Peter Rosin <peda@lysator.liu.se>, 
	Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	asahi@lists.linux.dev, linux-sound@vger.kernel.org, patches@opensource.cirrus.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Michael Trimarchi <michael@amarulasolutions.com>
Subject: Re: [PATCH v2 1/5] ASoC: dt-bindings: Add ti,pcm1795 and ti,pcm1796
Message-ID: <20261017-predictable-faithful-orca-3265f2@quoll>
References: <20261016-work-v2-0-9340b9555fbb@amarulasolutions.com>
 <20261016-work-v2-1-9340b9555fbb@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261016-work-v2-1-9340b9555fbb@amarulasolutions.com>

On Fri, Oct 16, 2026 at 12:33:54PM +0200, Roman Smr=C5=BE wrote:
> From: Michael Trimarchi <michael@amarulasolutions.com>
>=20
> The PCM1795 and PCM1796 are cost/power-reduced variants of PCM1792A.
> Both are register compatible with the PCM1792A, so they belong in the
> trivial codec schema.
>=20
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Roman Smr=C5=BE <roman@amarulasolutions.com>
>=20
> ---
> Changes in v2:
> - Updated description.
> ---
>  Documentation/devicetree/bindings/sound/trivial-codec.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

