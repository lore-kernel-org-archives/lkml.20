Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793649196;
	b=vPLYPD6UKQkm37SBN9BOVUqCpuxSgNyh22SBQFue3zsmE+0iBuVh31HiBnRMSnhn9w/n
	 vlL7avOWUW2+z48kPPUD4p/t0MUXPDDLB762JAjEY3AkOqfB8CuOHTC8U+wTUQQem6Zme
	 pkBZUsHlrLNPg42GOC1URjj1ytPFgpWNTyINtGtyAWlBuIYurkpKlR3gcIDIfdMaOH/m0
	 1xDATwNYiMay4xkKHdL/wper6hjYXwebxWDha+TJ4fivQV0O70Say83RrjbtnY0f/qzny
	 8HicvAClpv4qmPHxEwCTncDaXneBYLA45cKypNBz0LkYg+64jHvhauqbwdGaO7J5BSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793649196;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=G9rBYTm1BGA4Qyci64xTdBqx4Wsui0Y7a+J6x43ZfpM=;
	b=L1FC5BRKLG64/giHkW3FT6zW1FbVJykRxSiYhZ0bLHdQ43WalQeQO/a4BfwjvUcWixL+
	 XI7RyUfrkZ9IgpVKM5DsGlkDBwkOj6w5BKg557g3DKAEA1KWklTDYK3lcMuzuGFo9PSTN
	 F/LEDRlO4ypsDgynNDMgHubSGZKfev6RxEjB2ZAZATkLNex5ndQDW+B9HoNn+CtBnUebJ
	 s3nAvMbBWdU9zR5ZG+ETlNM0539kf5XEHnSfJEI9yr9xsRXaDJ27HBt1T2k5uYLJYCF+l
	 iPgo3i7S61kYLlzefZwwAKgqcXtaDoJddW9vBIFrSUlauSVdo+UKhTI9A/6QW0awrMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWT8kw3T;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6650606A324;
	Mon,  2 Nov 2026 19:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KWT8kw3T
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76FFB1F00A16;
	Mon,  2 Nov 2026 19:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793649195;
	bh=G9rBYTm1BGA4Qyci64xTdBqx4Wsui0Y7a+J6x43ZfpM=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=KWT8kw3TuEY4Y+JqZ/Xl5nCOf4Xx7ep8VLh/q0d3vXcqKPGne7QBZc5ANWQbxMHRi
	 OdDbCqAJt+/xtIyhWyvy4NS6ugeCcu2W5iDv9GOQT3/uoO1oLZkFjmoRu4UUj62fxe
	 5udCwUJJwRwRQK6f2cxhDExHyTz64wOpT5aeyvG/niyhHxT/MzVpAAHTuwTCxZZ5hm
	 c6VvpN/SCeHHVVi27Y3bZd7X6HZpkWqr7wij5qnJCLc3iKm3G3/3yBtrYAMla3VpzR
	 bZIvsEghRDnU5OlSWjbxpfBBLyC79iCBbv57EJpEJp3isLOYZFFwpuW8g+u5yG8C+3
	 BxKV7eLP+Aqyw==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id A496523E0125;
	Mon, 02 Nov 2026 19:53:13 +0000 (GMT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 2/2] ASoC: es8328: set SLRCK for the ES8388
From: Mark Brown <broonie@kernel.org>
To: Bob Hui <bg9oxa@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261031-es8328-vol-init-v4-2-5bdc00b25948@163.com>
References: <20261031-es8328-vol-init-v4-0-5bdc00b25948@163.com>
 <20261031-es8328-vol-init-v4-2-5bdc00b25948@163.com>
Date: Mon, 02 Nov 2026 19:53:12 +0000
Message-Id: <179364919249.2167617.689644477347115207.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=832; i=broonie@kernel.org;
 h=from:subject:message-id; bh=UPBWEGJYaPm7g+8poE6yPsFGg/MvLVeZuxxTeGcimMA=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJevNLcbSpgUKXaf1xwjdexpcWb2LqevOFk6ZmZkBXCs
 0HP72tQRykLgxgXg6yYIktcFvfL+pLXa/gOLmyDmcPKBDKEgYtTACYy6Rkjw+OgvOmNjrJxy66v
 sFny8P07gRSvylDvGywKpfMOci5hX8HIcKXjSvrsk0or563xvq46vadqUbjknfinBYUTGDx426N
 cGAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The ES8388 has a single LRCK pin, so the DAC and the ADC have to take
> their frame clock from that one pin.  With SLRCK clear, which is the
> power-on default, the capture path never gets a frame clock and records
> digital silence while playback keeps working, so boards look like they
> have a dead microphone.

> +	if (es8328->type == ES8328_TYPE_ES8388) {
> +		ret = snd_soc_component_write(component, ES8328_DACCONTROL21,
> +					      ES8328_DACCONTROL21_SLRCK);
> +		if (ret)
> +			goto err_slrck;

...

> +err_slrck:
> +	clk_disable_unprepare(es8328->clk);
> +

This is sensible unwinding, but there were two of these unprepares
added in the first patch directly in the if rather than jumping to a
common label.  The label should be added and used in patch 1.

-- 
Mark Brown <broonie@kernel.org>
