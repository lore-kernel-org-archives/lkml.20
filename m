Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=51.68.154.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793825233;
	b=nYebYUV3jkybQ4KqpQVNIfidZm0RqjFLslJ3SX3xH2GgIJqTF6Z4F96NRTvrF94zRxOH
	 WGyKzJ3aUQPe/hf1T4f/u+jnU+ZuaEz5Lk3YJlH1y6nueGmhJs1ayaQZl60UM2zYn4D0e
	 PLFo+Fh+wY7du2wgXft8Ecehtuu6Y0nIBTY2XOyrcVqpPTwgNaqLuYME7DPmzRwtAyPhD
	 WISC4D8EYTrRa9MxshIMNEaQEwSi1zUbKNTnHn2Kr4EaTRScVe68dVDp2wpmlp1RDhih1
	 4KiL1seGZWBDA9TiGx9D+5efxxjjizbHS7P9ZnV+3id28DU7/gVKMWOV0AJiBby3DfQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793825233;
	h=DMARC-Filter:DKIM-Signature:MIME-Version:Date:From:To:Cc:Subject:
	 In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=+rWeXBCnG2bPiyFYcz+aSr1pSzI4h2JfNW1yBA3JrYQ=;
	b=aOacKCPgftSTNW0NsaQo8QUxa2a3HcdIlqG+fbo61dXQZk4FxpoCi+2voBiVMpGn8jU8
	 Mekjci+x4gaDPDL1ZPkeGGE/ukROAUKjcu23kQlBN6SUF+bLiVEIUbyq7bB7FZVRJRkJ/
	 opJhDgP4+7zAKTgH+0HuP+H0k57VP8juJYMiXQIwUzILV/1gHBcG2RtV8kcrSSuo3AD1p
	 GYFWZBXW7mLLpg1nFXTLS20V94Y4mmL6mWKf+sGmKyweHk1TSH77t92w4tKrFKLmBBFrb
	 qH6ilMwifZcyw4nftGQDtsqa4yv1Vh6N+J5Zw1eQsjqgwSr4t0idd6tnLj7c9E5mqIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fromdisposition.org;
	spf=pass smtp.mailfrom=fromdisposition.org;
	dkim=pass header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=lvCoPKo3;
	arc=none smtp.remote-ip=51.68.154.128
Received: from 4do.net (4do.net [51.68.154.128])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D116096913;
	Wed,  4 Nov 2026 20:47:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5D116096913
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromdisposition.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fromdisposition.org header.i=@fromdisposition.org header.a=rsa-sha256 header.s=mail header.b=lvCoPKo3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fromdisposition.org;
	s=mail; t=1793825224;
	bh=+rWeXBCnG2bPiyFYcz+aSr1pSzI4h2JfNW1yBA3JrYQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lvCoPKo3VtWq0PrkYK9Ggzvu+aO7MmhG0iJvAM/Rxbn8AhrNbt1OPAckzY2zF1tQX
	 Ayk+hv0vPCA1LbeTRADkjmEoOkXQI7R4n8HAQ8MhjfLSOjXDOsSWudaBGkYzsHyefj
	 Zq6Gv/coOVwpmAPVuh2r8WqUDjTkSMoaBo3rpUB0FavPpilA9VhEpGmPPYnK/cnU60
	 gWBqlm2tZQSFPMbp+XqSGTGn1r8kZl+DDais7iAjHYbD8qL2s3i9ZEZK6GXf7vMPqJ
	 ldB24j8PXn8qtJaboFaAIKfMU5lPEuIzVfI1KlvQAPI1O/hMQhObdKjQTiS/BdM9w/
	 EWB/DmX7WTARw==
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 20:47:04 +0000
From: Demeter Barna <me@fromdisposition.org>
To: Michael McAllister <me@michaelmcallister.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, Mark Brown <broonie@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ASoC: qcom: q6asm: Correct the 24-bit capture format
In-Reply-To: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
References: <179355993304.51321.11135059681945648585.q6asm-capture-format-v1@michaelmcallister.org>
Message-ID: <f3485a790ffdafe635b84b5d68730dad@fromdisposition.org>
X-Sender: me@fromdisposition.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-01 19:05, Michael McAllister wrote:
> Recording in S24_LE on my Moto G10 produces badly scaled samples that
> wrap at full scale. The PCM V2 DSP interface places 24-bit samples in
> bits 31:8 of each 32-bit word, but ALSA S24_LE expects bits 23:0.

I see the same on SM8350 with v7.4-rc1. Without the patch, S24_LE
recordings from the DMICs wrap at full scale, while the actual signal
sits in the upper 24 bits. With it, capture offers S32_LE with 24
significant bits, the recording matches the S16_LE one, and both
PipeWire and plughw work.

Playback has the same problem: the DSP also takes 24-bit samples from
the upper 24 bits, so S24_LE playback comes out barely audible. Offering
S32_LE with 24 significant bits for playback as well brings it to the
expected level. I suspect this has gone unnoticed because userspace
hides it: distributions for these devices tend to force S16LE in their
PipeWire configuration to work around quiet audio.

Would you like to cover playback in a v2, or should I send a playback
patch on top of yours?

Tested-by: Demeter Barna <me@fromdisposition.org> # SM8350
