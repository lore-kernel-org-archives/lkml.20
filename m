Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794551809;
	b=aT9EpRbdjSBIeLAuu7wOGHfbU/gNFpzFCz6FAXU2QyeYQdGugg24KX0JxkVTKHIwDSTn
	 n9TYlc3T9WUZAkk8FEUkgAzNQa7IIzRC5A1fu0a23siObV1SVxw8zNlFSiRkVR0pN1TVg
	 ZgVvdRaWAawpXMHSkG+TWApktr4KL8o41qeU6oBrcDpXx0X88OupuCrauRs+hDpdn/2yy
	 KtPru53MCTJ1VQen/yjVjJN4Q5+n1F0n7xtB2r2ynnarUaahLmjTT+e+A6DVBIbvZv3Gy
	 L64R84wDbQfI9/bcV1xC9ojn8ypcF/teQxFWh58adUBbYeNpwA78EbroMwWqAK+cGNg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551809;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
	b=j32l8w/dgKZ2xJMZWQhTEQNMOHMe9p8MgXMHAWhR31Ay+IMqgcjHul6RImKIJBS+aBK3
	 b7jOr/kczdEnfiqvO6QsF7B4L5UdkK5v0RpxqkiU190CqvNVBBssnuMq5C4MfsdCg5q1+
	 4M2X5ZqiAcfw5XjqXjjdbUY9Zm7qOH55gTdtjHJKk0u+1oLkM0VeyOaPrLGEjAqBWWf67
	 4iH5a92Kj8YlTtHhSvh9ABaN0IN9hk8Oq+YPNW74UDcKQJd23vObXP7O/kOOOVBTaJf/l
	 Ax44nWMx9uy15VQQtEQ17C61MBC5afXttJonVWVDHN3E7NNCGFmtqTAwYxGB1KB5y5w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8mPrAop;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15F7606A32A
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 06:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E15F7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=x8mPrAop
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso450398a91.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 22:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794551808; cv=none;
        d=google.com; s=arc-20260327;
        b=Zr3CsTC1Zc3mDktNu5A/YDiw+rHmdKnz/k4CZt6Qmqzxhc1pu/2LSRBPFwhdcae2br
         1rvySeiuC6Z5xIWIcI6/V1+r2tH06mTFVJjVrZjCN9KfJF6y7qEG7CjxdlE4vsCRJAPQ
         foglR8UU/oylpqCCfGAUmON225OvIQnpz/2c0mjEVw6u4369RIZgyos6JlSSgYwE3xp6
         6XVCfpMX2r5Tvdhgw1awIQ1msbAX3fh6dmtFMMouyAcDEVvPXlTjHaT0MPNxsfzk9urm
         3xuEhAu/6M+3tWZdUJCYE9eGZE97GJUlXfowQaUAoaxXQYZn3uoqDNtJSgliV7E5xFDx
         Fd5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        fh=mDkI6wRB/88M+4u/de5aJLRT/5/wWLFch6Azu2V/Zzw=;
        b=bkbDQqspmiU3GEsZc2iYXwVv8lUOSMbo736VYV98ZnDkJMe5Tu+o5o5i7x9fo9eNG1
         ETjOhF9EA/Yw8/9GpCQbujsmlDMNQfP4RaAwsJTFiW/M5nzyecbLKEgYQiia3W1nJa3r
         8DcZOtq7bYOgziuEe0Unh9Pc29fo0Zst4x/nEpyAFFynCyabmBdBR+1hqAMPnyGz/LSj
         RquyBttpT+2KmHAd0iA7q1h/GN0C/PefdWAh1EyFrYhtsxR+/7J44Gk+MJ/MKF9PDms8
         lUw9cMc1L6PzNG0bM93HKZwjFxFVP28MAnhtrmF0+JW76v8BoR8/B8/YSE8JW/c5xNwR
         2fow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794551808; x=1795156608; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=x8mPrAoptl7uy2+y2OSPgbGR4k20wDu0gRif7HK9CmhgAbclBzE34Fxt7BbQgi8WQe
         ZmB3XOMANPEiK4A/CZPoWL9ObT9oDg1iZHueJDO+bwmar2FXqbnTItOE/locGcj3y5j3
         jVrLWnvZFdCFh1Fw5o0s5Yja3s8AHT5gVPK92JyqL5EDVs5+90Ue8TICmUk4uj1SW+zY
         KaDbD1KHvtyMAIXaSVW7Oug61VGI+S6aANy2vZ83JL9xj/KYH8lU/U84+39BaFkiGcU6
         sikP8hgNEWSvbsmJPRJFG9n2cR42tHWF5J1uPFWW0g+8QWjsFCKkf7c15tNpPYlCt6ev
         ybmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551808; x=1795156608;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9FjdCGKO+IXvevdDDEoeEyIunJuJigz0McwLI1lND1w=;
        b=gcG/DmXjwbyg2vAjly4DxCuq+FXWPpVEIbEmpPqAAm+LXmoT0bHD2sRzPXMeP8GUKs
         M06lEppPHRINml2Y3LhA9FD5rbI4CENsTfHFfh4pmkn64kH0sgCmMX6GZqDaby+rPkdu
         t+agyeMplt1hqBIUQxK7DemkMTNw6vutUFB7NgGh0aunDZumegIgjL6QHQuqT1lk379n
         inq4FIkYcZkwzMcEiPX5i/2ucrOjX0u1nfVVq8Nn1ttK+A+XAd2fkLZr410DbTcYP/FU
         xrDosHXjvgYRxUPTHt8sXhAKKPNkU3vHtiLQlb2SdciEN0dGSr3VaFWiRbmTF7PHkZJH
         GZsw==
X-Forwarded-Encrypted: i=1; AL+hErGaC0RpwVG8oPMYvQo4zg3BMfHhicfk11kbIxLrrL556nHivCrkzJCybSHe07tGN/lr1GqEDSAE/fK2oUA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+MXaqKJD/dAg4JvPqGnf7/sebXAQN5sRUUrboNqn7IFPxqsbym
	edMB4c46BA/GZVWPRB4vVJSTe/b85ZuTsdWqaymwOTE2QcDLz3kCNtoLceYzWNMhcQP/7qMycmO
	RldAVJpHM0VNPWf9tUPrDQ8Yr5bP0lqw=
X-Gm-Gg: AYBFou0BmgJykFK7eySHuMQg2W2FX7Jsu5hie23xCb3LLxP/781QbI+19GqP+9joNg1
	IMpYbNcEsRIwgEWv5I28SZh/JbKtRGwYcZ20iaI8ujTgfF+mpEFWTZa+cNoQbDGW+ysVDnZi9Oe
	IIyIFy9TAZLlnDYuAWTdSBS3Hpl7GlvJXM9EZRJSeWEQWbBW4lTsvIphx3co7Fdhr1XqbShXH8G
	/y/l2kdSf7FchXYZFt/wAQXGGnYOQVug1UjmkcHccurmIWf6QbO04jCOXX/Hxfx7SquzTkj1Mm7
	ovU7jLpupclyYGcxZcTP/wCOHdFTV+elAvwaJoyM8pBvNcvxv0i4oDHHZ6WuCetp4qPywBsFnGp
	2V3Fwo1uZjT40l900nxTNOqn5943KaIXNtgQjkxpJaxuQJIc3HmYqwHcfgSVw5CubQ1QlBUO+al
	NoYY5UpmKeNcGPPT/2WosIbGVj5LvFIGdMc/HAjzJw7NlGwzmmljXQJnfXvoCqKyUJRaLlGw==
X-Received: by 2002:a17:90b:1d04:b0:3ad:8ecc:5907 with SMTP id
 98e67ed59e1d1-3b1b0b53d55mr1291888a91.56.1794551808035; Thu, 12 Nov 2026
 22:36:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
In-Reply-To: <20261112-mt8195-dai-etdm-fix-startup-v1-1-2a9fb98b9f6e@collabora.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 13 Nov 2026 13:36:35 +0700
X-Gm-Features: AclHuK9Tq39ygLippNfyQDEwgJ14gA2IrkABaa-YFSuCcV67ahZWzbVvf6oujEw
Message-ID: <CAABR9nGLAEoSU58+PCTSAjTG+Hn-fDXm6vtN6_omx-EH795LrA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: mediatek: mt8195: Fix ETDM3_OUT DAI startup error
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, kernel@collabora.com, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi,

Thanks for fixing this issue.

>
> Note that the issue root cause was also detected by Sashiko during its
> "ASoC: mediatek: mt8195: Fix HDMI TX startup error handling" patch
> review ([2]).
>
> [1]: https://lore.kernel.org/linux-sound/20261109102536.357134-1-ghidoliemanuele@gmail.com/
> [2]: https://sashiko.dev/#/patchset/20261014112752.683032-1-phucduc.bui%40gmail.com?part=14
> ---

I wasn't aware of the issue detected by Sashiko,
as I didn't receive any review notification for that patch.

The fix looks good to me.

Acked-by: bui duc phuc <phucduc.bui@gmail.com>
