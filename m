Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F76F371D02
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 02:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791773786; cv=pass; b=OsoaaUyg74wlrYnQEkHDqSN7ZNdOpX9PyWt/zNO0ctKqgX9AsX/FymOuFyNPncUL2hWjZXbu2EWNJO5E2JT3+1vKKB/QhYO4ces1iwzrv3x0J304HVDvKhlfR6UvHgILcrevBYaCB4h94V3Qb3HiiuGAJNuRUPNuYRnBppHQRH4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791773786; c=relaxed/simple;
	bh=bBf7rkKS0FdNhJYMpvvZuNwTaVC4mSM3v4npQa5GPIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SIxT3o/4NKjkOOz1cZTAWbPCAQF8Rse7PBq/v9Up6yyifE3YEWC5Fa3S+PwoUErMdUz5+IVtc+OFp5nVhdlaSxHalEAVmCDo/9nW2eUAEl7xIZIon00IdY2KPLBVRA3cWa1j9ksedlB8Nzta50omHssM/z0WLq6Ojy+9ONufTac=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyUQ4eWo; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyUQ4eWo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-cc4c7fab7b6so790398a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 11 Oct 2026 19:56:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791773785; cv=none;
        d=google.com; s=arc-20260327;
        b=jt/5etbx4T4ulsu16wEaEVVCC8p7uERlxVraZE1k3nBauUyZVbzUWMAaAB0I3qkxX0
         pRIxZfp2JGXfhV97h/bELWX4pF6muXITiupy9vxg72qsNrWc2wDCVpGGqvNqOcwf/7X0
         uPuae1r5Qo42KcGlK68zv9I4RtcVYO3u9wQAve0THg7dSIdCzpUxsivwNIE31RqgYoYe
         mlSSvqjLNe5qWr0MuwVaN7Vgx4eSRwdKcA6akPJY32/lV0hP+vJ4erwz8frs7pouW2Af
         j02PUBxjgtoJS2IoSB9W/V2jrmIF3vIsdjXtsj1a8ZD59axQoC8JW5poBm0bZSTqqvEQ
         UlCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bBf7rkKS0FdNhJYMpvvZuNwTaVC4mSM3v4npQa5GPIs=;
        fh=Hu/i1S//Ejo2ZFgBGNuyjvGGgWsRLIN6HdRi+86N5l0=;
        b=sfa8cuQHHz3VQvjGpkRQa9L94HfJ6R9BKNqn7Rq8uk+EyiU2du+EMYpdUX06LS4pUu
         lx6vhcdVAYmWQhhrxd5ef0Y7+AMKUDZUEJGh/q/CPdnALonuHB1bs4xmERzVlQONZ41s
         +JJ7Wc92Yicia6bPGSrfjBDy58vZU8PpmESHb1IitftuE+AmxTKpH41uX01OYw2Vkta8
         TMGt1rnxZ74ootBsb1oFOeDj8/PwSymimTqULNyxnBYJoKb0vG8qoZmKT/Rctnu6ei14
         RlT3xnKXqMUwrOFegGki3WgJvlepE3Y2yl7BAaVDRwhFWx2sR1fCCrfgYCc0k5OoTkvl
         Ajxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791773785; x=1792378585; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBf7rkKS0FdNhJYMpvvZuNwTaVC4mSM3v4npQa5GPIs=;
        b=jyUQ4eWoHRPK30DCGpJqnEeqZKHCOCxdmepZWIrD4Lmr5R9BrMq+J94YTXCQnIfBmJ
         kLDYBoRqPTQq7LHvC+H5PfXLYOjZhiVgEzBgwMDyZFtB/zfiJD0pU/3LFRGaUyvYx/Rh
         jfykSRLuEaRcXs/nSRAY5/LWRCh0ZMASmoLa4GqxZHOORy/brOplYHVCS4k1UmMJ7ws/
         1yyC0BGrYvL28e6z2L+xnytX6NoMKFk5qgl+/h3xvdY2r5eEOs3bGo5FiO2EDBOxA2UN
         RpIfum1TWO52//i4qlhiPhfvmfq0EdWf1sPFhD2qxFZCqgi8MIMkOdFN+fizMQ8OXkZ1
         D6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791773785; x=1792378585;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=bBf7rkKS0FdNhJYMpvvZuNwTaVC4mSM3v4npQa5GPIs=;
        b=eHPihJQ3j6s0kBRC0E8XvG6dwz/GShph0yii64MRKGYnBZFl3sEQ2BOmLeQP2+mi33
         99dIWHDZDJHVLJkb3gIQdAnaIlhlIjKftskrJiwrn44IKsiAnV0UjJI3vmVZKkrkVaD1
         K7whBeGTzlNT2VIcXKajGLoXTe8ZFgr5l7uMjXYlv0GwPCm9BiuVKf2jh1yp++Ytcdw/
         7QvF8rxHpwmo33zXWE4s3Jc3ybcLp6jyPwO/M4Znl7CFxkYzFQeI7xY1MbIR+nSzgqyy
         DBdWEzjos4HqE0LYD+GS0ELoRdRLpNqhbQ8hvKZSBfLntWxFcC56FgSv+1PWawXiwac8
         QNDA==
X-Forwarded-Encrypted: i=1; AKwUvBziHtNMfl2G4PAKgfCQuiQFTKyQ792gFHzpMMwdNR+ouYwiG2VyNga4HdQ4iefWhsCNAF/JkkICNd9Amm8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLi9uV30zZWjYcJxE6cCPg0KxTKIp/p1sDX+aE+a3L0JkryVjSD
	ggNE9+vpnGCDUEQvjwObOtS2ku04qUHrX5bzUcMgLpanD9qIc8xem6EOUevqbbwyDOjhi+guS77
	s3kJXWS04nY4zoTv7RJ3S/PSRMtzYnic=
X-Gm-Gg: AYBFou3kOCGZcP63LPGpaSaWf3DxZoUrGqsu68ucn/BW0zugsLNGTMpzB8TgEsdgmKh
	c/lV1N/e6AOP+idg0+Ha8Dv0MjeU9WBlfO2k1YFZp3idImotlMwPcntFh5ErBvadeExpySWrQtd
	8rsrGPwojUmhvHh403iGUJIu5PwL5cZ2NMFR+ZfSXqfpRG4p2qssbavuvMQn8lBusA3uHMIfvht
	Bl3J7ZsZGsPxf19XuCOBbQvfOyXQ/n+Rc3y001ayIZVVQ219Exlk89+nT9X78eLRiW98+Q78YgQ
	oErYfG9C+bjm+abItz6xUkgJPMWMv1420WYaYxTdsMmBwszuZi2Q8MOPCjMZ/fePYWanG0ew8Rg
	ViEKpfJitkpzwJJqjxhrcj7fyaFwVuycqvXOXY+xgcf7yzoltFcSbGqh6lLukGbUQJP0=
X-Received: by 2002:a05:6a21:6494:b0:3dd:85aa:452d with SMTP id
 adf61e73a8af0-3e16be318d5mr6655235637.31.1791773784673; Sun, 11 Oct 2026
 19:56:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011051924.60456-1-jain.sm@gmail.com> <20261011051924.60456-2-jain.sm@gmail.com>
In-Reply-To: <20261011051924.60456-2-jain.sm@gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 12 Oct 2026 09:56:13 +0700
X-Gm-Features: AclHuK9HjP5BrunROTbTOyyi6-il-VsiuOisXbzNImZPrg21DQwgJ-cb2yVPcfM
Message-ID: <CAABR9nHpreWy28kYXssUCtHr9w97fvK78sEEetriwVFBV6Kchg@mail.gmail.com>
Subject: Re: [PATCH 1/2] iio: magnetometer: mmc35240: leave cache-only mode
 before the cache sync
To: Shashank Mohan Jain <jain.sm@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Mark Brown <broonie@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Shashank,

Thanks for the fix.

>
> Fixes: afc8e3ee8307 ("regcache: Validate cache_only state in regcache_sync_region()")
> Assisted-by: LLM
> Signed-off-by: Shashank Mohan Jain <jain.sm@gmail.com>
> ---
> Prepared with Claude Code (Anthropic), model Claude Opus 5.5
> (claude-opus-5-5).
>

Note that the wrong ordering in mmc35240_resume() predates afc8e3ee8307;
the sync in cache-only mode just happened to work before,
and afc8e3ee8307 only exposed it.
So the Fixes tag might better point to the commit that introduced the
resume handler:

553a776b7908 ("iio: magnetometer: mmc35240: Add PM sleep support")

Best regards,
Phuc
