Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794236018;
	b=QxV1XB0wiI/vdJ1Buj8a24zL7/PJhrLkQvB6OHOr7LhW4kT0BVGoi920uJv0Fc+Pu+qA
	 3x50eKD85bFlNrODRQMJmMweVgpFdPKFbKCkrR7c2D3dY8dCHTOMAEdEhZ98+4c2Ke39Y
	 bKNUQYTNY1NeM1PQ6cKNpPsGAGNb7MEbMp6Qn5vS7TRxtOoTNcomrUlRsr0neGDbogbLW
	 SBkjQZZEiXpEmf/iJFp5lxGey7v/gX5yApxpUJWHoDhuP5unaOdbaFANFmDNKuvqu4JgJ
	 k4FlB91uZwcjVIXSnk5z6UOZFoPspz2xdcCqJ3hEC2jYrGQKYsON8HotvdgQ+57u3hQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236018;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hsgjUWa3q8VRooHlY31LuDCJH+v126xhzf92a/1gL4U=;
	b=pakMhkci4q8Xy76Bla8tVTOCU/MyLvqVlOP7JWDtiqYXOZbpqdanwXe3ZZK90wlhJCrR
	 he+64mIVJfj89eXnSWZXKVRqStwRENjeh/qB2WT2lUkCSn8CQ1wSU5sIaIAqHfCx1UjL5
	 z6bxXXKJ6SLX6JeIZorc+oYKTCF46pvRb8nXuN5+rgKwnnRq3OfnrnmM5ptFH0XdB6PmL
	 PSk6I3Po6n2Z5XVgoIa1ZsNlKgcR9sPMP3koBD7zqXy929mkItHhmr7qhos6fvuWrJz3K
	 BriLWeM6FH/1/T8fbNvYLjJdfVC0xTdPDSzOwxMulbciWrbSTsukHdmxxLIhLet1LFg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBiGfCXt;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.210.49
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A38606A322
	for <linux-kernel@vger.kernel.org>; Mon,  9 Nov 2026 14:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A38606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBiGfCXt
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-85f39332862so368502a34.3
        for <linux-kernel@vger.kernel.org>; Mon, 09 Nov 2026 06:53:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794236017; cv=none;
        d=google.com; s=arc-20260327;
        b=KnSXrnOMhc1yNhZ1+cmIOfd/9QL1GKkJNjRHhZEABL8l9yZMftL1GBkHaBJuT6wAhF
         myED6xTMwXoOqwVAJMSLEhbRwcDjLkKie1Goa5muLpv9eGjcFumtLlMIH0tDW/gk/Zln
         PZp/NN1rR0Fxtlz/0VpEd3+wNyyKXSgFPwQTVnet+O60HKsg9EJicm2rcnP0s71OOAaM
         seoRmj5Cr99Cd9/a8uKXQ21qUl6uezY4/Z80G1CGx35xlciDYpNSfy5JlIShS5j2Jug8
         TLM32OpnAMF3nsmuGJwgUG7bL407IHqQmnUh8IqRWopcYZGyTuOSH629kwmJhgT/lueS
         5iRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hsgjUWa3q8VRooHlY31LuDCJH+v126xhzf92a/1gL4U=;
        fh=q/Ljoe+dYJPrZMzwr+zNMuVjNSx/8UXN4VvXtgHtHmo=;
        b=eddFRzqG5iogtTz6pX9qQUsObdVWxOLRWSg9/SFNXwvyARFmAkE5YtRFdm8Jusvvxb
         ybuKnM0ZKx7tVXhkagNbkDIW5aXGgMaU/gas8GyOGr9b5qSW/4//cm4ocuE//BDiRdJl
         PiK6LJdYrigbpKCoHSbBZy9ANkYjYI343n0uBu5+LBhA8ocySCoAwC1vezPSbakIovZR
         P0eB2XGyob/RrRRkQ8MsbGohGfr1/UjFPLghsI3PO7stvwcRgykzlCl/NTt5GSezXsaY
         0etVFsr6NzO6P/6/Z5xDFEPwimLP0P/HQJ55bveAkHeQlbvgOk48haQDBAOACyVFa8zx
         Ckfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794236017; x=1794840817; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hsgjUWa3q8VRooHlY31LuDCJH+v126xhzf92a/1gL4U=;
        b=ZBiGfCXtJELjQ87H7qyBIDI9PStceN1lNbG5fmuz+cKEZgnrlK77ClbgtgCsW9k1Nt
         JMHo+xPfzMMTHelIOAiVx5Z8wDXei8yvfZd2Sr8KwsIcRjf7pmk0huuKVXfkuI/8dIhC
         izLUmSaUTIPkPR8OO8H9ZgUemxnAavQCApZrJ33d8vvVOqjLwHFKOJOGrFYmmXjRDoPc
         hVs2rTJgHv/YV/ozQc1teQImSfDNi+fF90E+WV4aF8A05WwyC6nG4zuSDa4Sq8/WYMSU
         PtArih5lwHCCHu/OvoLe4uqbXaFGy3CcxZQQ1vKmCmdwLGbPFGU5mA3CThRyGIX2JyNR
         BKBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236017; x=1794840817;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hsgjUWa3q8VRooHlY31LuDCJH+v126xhzf92a/1gL4U=;
        b=ucvU+TSx+EQp0iI0kO2d9CToVmF2+gj9mGNP+MXUm3gu8ZmXcrtW4Z9ZV1xSA04bX/
         QbXzC3pyS0O2KTUVMn+jjWVpYv1bhCGmamhuejDdem6CcEbpaZJv+NNWrErFaoYu+mfA
         /HPd7zd+rfBX3FF7C3htPe3WyWArokQTKNevT8EGmqzrI1sULf++iIAFeX6nT+j6UK/+
         ju4rG7ZFyQa67L6pMS89gmJDFTT1TGH7UCmH+xfNCNTtkqlFWKIedmxtKfzP4zFYYJLd
         5MhGj1749vrKbG2Mhwj4pIsid99XT/7/vMa3KqSTKfxK7RlAyT2hzNkgYu2HtyiQrnGP
         F6eA==
X-Forwarded-Encrypted: i=1; AL+hErFTY9aeyKmCNnDAih+ivH0tGkJ4EuYFtOfnP0F0MmGLoDT5ZWY/4bxWwIm8ndg+rHdatlWJOiYt54I6T8g=@vger.kernel.org
X-Gm-Message-State: APuU4Z/G49Sh/3kwD0/00FYKhZcOeLVwkvQYba/bL3JkE8F/J63xheLR
	cZRauT2MMWg3E6d1pMv9H7ZWa9b9tkh0FnC1KzwQbyIiBKn3/wl7HFKZh2dO9C0PMO+yMqll8n3
	qOq3GmW+pP7duXrtnbQrBWM83kSZgiFs=
X-Gm-Gg: AYBFou2zC4xRzUbkudR0wJNBQaMTv7Yxg1aOLN2K6qBc3kONRhT/obwHmM11UViS3ks
	4pa09CXK09l7Sfk4W+7W7seAvwEIITV+H4pE3LcH6tq4+fHJ9cqGBcssFpUHWxopoWd433TFwLA
	Sh/zSkcsLygDcHr/TUqHhy4npgjb1rVOPLNpNYD38x1zUyarxXX/vTxsJ4vf+//5akyPaOwWmo1
	KJnBnxajn3b3DyXs/Di1r2W9MWKQu1X0uw3htGww+Sn/sAT7v6VTtN0gnYk9QLXDUOU/nOmS9R3
	tKQIdqQy+okpJRWnjYE6w0tkRZuuZnuT7HoVTfUQWBB53jJmcAy9PBP6gRx5pbixvSFt6H4k1Yg
	ajxwqo70weE2cfcmY5MwlvFPClbzIRV1Rmn9B1J/eD0KAYDeLA6lquPt68vLwiedhmMNaA48=
X-Received: by 2002:a05:6808:4f4c:b0:567:cbf5:bb95 with SMTP id
 5614622812f47-568141204c5mr3074501b6e.7.1794236016577; Mon, 09 Nov 2026
 06:53:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109144705.1737460-1-mmyangfl@gmail.com> <179423591750.488859.16025770326702158514@kernel.org>
In-Reply-To: <179423591750.488859.16025770326702158514@kernel.org>
From: David Yang <mmyangfl@gmail.com>
Date: Mon, 9 Nov 2026 22:52:59 +0800
X-Gm-Features: AclHuK8GlVRWcIBXTah3vZEYSUTseoisYI_J4pmRZs-QyYbT2RYguGW80JIs1pg
Message-ID: <CAAXyoMP5GRbCoArr2CA__ROs3G_PhpQTNq9cSpsa=3cjk9XrGQ@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: dsa: motorcomm: Free the MIB block on
 port teardown
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:51=E2=80=AFPM <netdev-bot+sinfo@kernel.org> wrote=
:
>
> Hi!
>
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.
>
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.
>
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

not a fix - explained in the message
