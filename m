Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB30C3EEAF4
	for <linux-kernel@vger.kernel.org>; Fri,  9 Oct 2026 22:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791584659; cv=pass; b=TN7aXGb/Qgntz+7OOqr0dKZYbfm16TJGY+QSmJYM8jSnSGdfb18cTZ8DWFgWExkotC8pfswKYBNw9bnwgqQwZGbceF2svyR8K10yPPKDgkgoqo71/vUQNhaTfY3WsiDSxS2varVHuJPOtya2vrgty/7ksciK+HJF5w5wQ1Vu5H8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791584659; c=relaxed/simple;
	bh=wkk9g/cv0bTiuOUVnmDTIZSymAhfjBKG4zEaCsZqHls=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LIzAOPeNCE4OlNAZnbQuFAak03KGYctFkvPOl5UCmFE/6ThDp0C20MK1eodGmOkAyrXMuc1qlK+tzLTuV0Wob7g1rUs865pj0c5UiMjOxZ6O1INWEQl5+p5MPCrRXUIYun+dSCcq2gyhSOUuQi6EU8cWbdKs8q5lfDeASFXGq+4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B0+FGfJU; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B0+FGfJU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b1762fb68aso179453a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 Oct 2026 15:24:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791584656; cv=none;
        d=google.com; s=arc-20260327;
        b=f5EROe5kVo8vxzKVTiZKKUf+CjAuxaWGW+pAj84pE5Jwz71lsPmN9h/O8ty2tI64pL
         heo0s16wbiwD1G+EmPqwFaUFKcPWK54vA1A8PfE5UrYDyostKgYzp9yafutILq94sMOw
         wuYwvQ5eI0sMfSd6yo0rwI73j5iMUNtLW0qi1u1ntJs4Fs8OD/NeNE6vtkB+QadLVrEX
         0cEU7UHpxpFehUgLGFN98n2MmbClSew0Y1JNy7WghY3U93vkxMW2q2+XDA496SSF9/YW
         3gKsVhfEmFQtL4Yy/oeFD9z59vR8YehGB+jk2cAX5b7/lTYqhIW94BZzpE7siJG9B+p7
         6Ovg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nTykBxHYQFwv/AfiJaRR8cL8wiizEDbLgP3Z94SeRcw=;
        fh=TF7Cb9aWrokeW0ZMuocoH7vMqZd0i55/ofu6fsa1ps4=;
        b=WpdF/XHJ5ZZ1XhZSy3eKXkS6rd0oiDB6pzXnhiT/f909b5/OQ5AjiY1weamDCd/dQm
         Uoam2XCSiUpBfkRq1u9WYLJ/JhKBYtnNXUM7WnFFLEsNSBgAicuBx9tlXPBAYUEhDmDl
         8qYImjxI9d25Nk8v6ncUHyIXRc9kEOPVR7dBZJcoBA6fvyB8+iteuO8jrhofIK8e/U7L
         ooPsJrnUdAbGfIsdHssbywi2QPKzblxqcJ56KfKkZWE5ZpSFzYc5oBrvVe9kxXjYqK/X
         TtKE49998DOq0bAEkAL75zcqgMm0wFA9hlrYLtJONQKLfmmlHCYyw6bOucHYG2Wt5gLO
         TCuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791584656; x=1792189456; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nTykBxHYQFwv/AfiJaRR8cL8wiizEDbLgP3Z94SeRcw=;
        b=B0+FGfJU4oGDH2QzGee7LwoLMFKfDFXzvHiUuHpkXtZeJLZGvJC4/aBDWKpB+1Ob0R
         c51hclIIcuqWA9M3ODHhX2yjSd2c+bxCUTVVoW8A5x33ItV7lZDZUS/Yt8Lad5hHBmFw
         s+tpUQFz2mUIhJ1ERawnPOF3efRCtHtAyYNVBeA+ujxtsTaOIBgJjUFXsAPRpcFmKsIY
         S9bHCC0bfQQe6OQbyFAFy8Zx36HAQupzHBK/bldYX8GR0JznoZqBS4ay9HPZt+8ZBQsc
         aSZdSfJmTpy7cJDXnAtxqhh8y3UvhSuDZRNvOlGGbxvhi9kRC1ztynbe1WL6P34Do8Ur
         BjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791584656; x=1792189456;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nTykBxHYQFwv/AfiJaRR8cL8wiizEDbLgP3Z94SeRcw=;
        b=y4Ncytz10mpz8SBJi1mbhYyJtNWe8UJTDkzjd7EqRlnY6IHpTz616ClRt4Xzom7Hzm
         dKqxaQCbRY6MzePtDorVUrCiVXMdvl+nAJTnBHgFqU7ACQLQDe1XT4aCKLExD2hV8P/f
         8r+X8Nw+cjF0PXrWPJuF5p4DpMPaXHKstPkwg992OM7S9jT4HEiIjLEup5uWud1RJqlU
         O5Iewdi79GJDmE2bLtZXlatG2xl6Tx7YIXacdh1Ooy6YmiOdZ4efXPhJvTYFzz7jFUfC
         +w5Cw4BSpTAby87OEu02PTCHLHEGdfCRKJiidjoh5ODfAFXC9gmg8RXVPoQGfebGuBpd
         PUYA==
X-Forwarded-Encrypted: i=1; AKwUvBwUVctiK58nlV8sC2En3ALe3Bsr+gyxif0h3GvDOKxjzMOui48lz5JSClaMAwYtOpK2ptgsZjE/Zr/XKxg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTy7B1y4B3sv+BHqjC+I/e9VJRomAG7DNeSphkBYdhsVn+yYwv
	i8pnfe5prnUeFobFBnnYmTAGU6Dy5l21JiPP7mahFo6KfutTvYEHYtuHxSN+kcccHnSe66U+qv3
	HHTps2FVeiTb+n0yUhwD+Ne4RkK8XGLk=
X-Gm-Gg: AYBFou0tMLfTX5PB7MjMg2juTlBfv1EOTQV7vcPUSuhg1a7YydjIXrgePn2RSadilo+
	GbAg7HfJ7KiAPN301Awx/l4RYyqszqE1RS+8qsdJbWa8+Kv+JWvBFeI+612bHPWrk/2J/9GLzdZ
	MeQAlhdzKbkd3At5N04N4aceAuFN8zrlUAO1JFV0hby7brfKP4xqcoruzqvr2e1p1X8VwI84V3M
	CJUCuPnx+niKORxWehdNIFgye8d9VSVfJ90oYPeuX/c4LzMSE/XEzvN3+KZnHKnqAk7+Sdl3CWt
	FI5/nLYa89N/X8VSU+QamTvrHHzwKAhZfj3+veWuhq14WW2GAx8b/O8a+u+EO06ZsQ0T71IoWuJ
	+nVKr3RuLK+Y+Rd6R0zrizdJmcXJ6jeRdGkIlhumw520r+kKCNqv7MDYHHeJW1gwvPqOlRHpdxk
	a211mwFt68xh0eJQhJg8Q39xnPhCVZA/jhBZQBDbIDoCZpHM+j7clvRtezjecbgfkHEg==
X-Received: by 2002:a05:6402:321c:b0:6af:9bef:cf75 with SMTP id
 4fb4d7f45d1cf-6b17c1e03e9mr3017169a12.4.1791584655827; Fri, 09 Oct 2026
 15:24:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261007183821.928263-1-rosenp@gmail.com> <179139868898.2527009.7529803204490860855@kernel.org>
 <CAKxU2N8QddjJfx377npH94+Uaw4kG4GkAFh-6wofN9iXO-sNZg@mail.gmail.com> <20261008084246.03aedeb9@kernel.org>
In-Reply-To: <20261008084246.03aedeb9@kernel.org>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 9 Oct 2026 15:24:03 -0700
X-Gm-Features: AclHuK8b8aS8TctL0na76GkKIfshYPCXcVIs96gCmA0GZVIiKoz-U6FpaxG9OuM
Message-ID: <CAKxU2N_vk0bL_+12a5bq7KF1z4b5C=uVyTGkos+x5b7bQgZaEA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: emac: mal: replace devm_request_irq with
 request_irq to fix probe error race
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev-bot+sinfo@kernel.org, netdev@vger.kernel.org, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 8, 2026 at 8:42=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 7 Oct 2026 12:20:08 -0700 Rosen Penev wrote:
> > >  - How the issue was discovered, e.g. hit in production, hit during
> > >    development, syzbot report, manual code inspection, LLM or static
> > >    analysis tool scan.
> > LLM tool scan probably.
>
> probably? Are you being sarcastic or you don't know?
It was. I asked it to find memory handling problems in the driver.
This was one of them.
>
> > >  - Whether the issue was actually triggered, or is only theoretical
> > >    (e.g. found by code inspection). If it was triggered please includ=
e
> > >    the symptoms, like the stack trace or error messages.
Just code inspection
> > >
> > >  - What hardware the change was tested on. For driver fixes please
> > >    mention the device (and if relevant firmware version) used for
> > >    testing, or say that the change was not tested on real hardware.
Not tested.
>
> Please answer all 3 questions.
