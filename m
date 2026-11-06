Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793993979;
	b=eACTuDghbB1831IHqbIoK1g8urhkp0CMEjoo4y7004enDKK3RudVwSxeAOL++ttgh14C
	 6oUZlpySGv5xBZsW9l3uGU3LUlonaKpM7HNiPpfE0ZhhwyHPlpPAJUIuuo8oIatvPo1Bs
	 H3730+g7VFPZNHNpksLrA5VbtWRmpYRo2CuXwnAE8hRDe8wTDE8PBMY50SYT6YQ08ktMI
	 onXlXxdg1xwrvNQ4GbBjyfVKWXk/aw3eZ7LCn3Qy6VQpXbLZOpyQEZvFEP+XaWL3ZmprE
	 YntuFzdbrMSd9/L8jbhvjgvMakcvkeoJlPBOMIdTUKvOE8WRZmhXnEjZzoDv26kCZQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793993979;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
	b=aBKRzF+5WPo/6w7eCFyZNZOyVVIyGMLrMU4aRSpEx8uhfBvKCN/WufbpSkuZxCuxY8+M
	 S0T+Ab6Ww4UyqBRYgalpmB6OBZOAgMRWGmCXamBfmKvTKvtfigi9JsTArozvF/3frZ1RQ
	 uJ5V/5EjbllJUvrmigKHSCMU73NRMsK1D14o5DDCxO5/QEWAfQG64AaB+eYI0Puj3V+OK
	 BvdMF+tBJ6ghFELUYqImJ/5NZG0v6uvFoU7mJLeaNiRpkz9mtsTyMqVrd7V5sb099AvY8
	 ude7Hvl3QMKMltBwqpduDcnhufUCdKgGYdgwg7RHOyWcfOrMvWWYOxibwLCB+473W2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y43U01z6;
	arc=none smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEB606A334
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 19:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00AEB606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Y43U01z6
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6b1dae0febeso1404043a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:39:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793993977; x=1794598777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
        b=Y43U01z6Si/iZBMBl+lqSzuq/ILFRhvNWJWSAlIH4aXcxNNEAQmmJs6Mj3FCX7Xe22
         appVHnGh/AYhPWArCIcOwav8xCPb9xSDhldufy99GWlYe5LHoO8/6X7b5Q5/vBGPYGV1
         ncpFYuvNTE8WdYFEAWzZX3zV4cuQ8b4IGrWVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793993977; x=1794598777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FJWXDTr7Z5MpSyOdE1LeYV/bbbLocx7Wgu/XQXU9+kw=;
        b=UVZdv3ZazL1EYUQVgHxaWxS1FOO56+leIXVY7oqsUp1G68M13q9WOfcV3n4qrmeVPO
         b/ZLs157x7fXSmgba9N8IxRZQDY2nswKJHqxJD77pC9XOdMRtun64poW5gVKnQCAHj7k
         PYO22VOnQSKgQ0K7UCQXtB0+kNWc18Y66DLmqkzUHGtWNy6S42aSVzbS66u/Jl7kL+ri
         P3s5smf1h4ImVlBBWuMPLxGCqKk1KHlLjZPRmcohADoJt1hFXvyOZasnu1MpOJLj2KTK
         FTlga/g8l0DZKnu+kBOdPR9S9An1JuE71kGRhXjfwv8YRparxuxU9nmZ3SRVp4nq3hf+
         MiZA==
X-Forwarded-Encrypted: i=1; AKwUvBwa1tgIjddOq85V6X5mwr9arlQKKa4zI/XaumrCR88nzrrfC0KIhd8PJprbq/0BZGIhOHfkVMa1G6+n5mE=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pxmO3Os/gdXWoqsYmy1Rk6eqbsiOlwUb/JP32IiyGJflHk4Ci
	pvRZYeHwdI0xLN1rPMQ/o0+QCxoMnMo+9Z96EXnAmkuL+/SVXA8M2Pg1U9UGvUKWJ7qRUvnizgk
	SsNwlSmWB
X-Gm-Gg: AYBFou1s/NrF2JLTaneSeYHUbJDH1D83v4At7WPHE+rqjTsPFE6ZAauwmWy5s8BrzIG
	2gt9kAXd65w+ph2lNE8qZukUD3DrUScgRFo9VHsqAIFbeDYfSEosgn85YBktrwAccYAfYJAv6u7
	eKzETaoa4mToeGREkZjmFYbvBJYcFsfVb8yU1zhLb7irJv7VXKkbbmBr7QQ/is+hm/W6yxYy8IM
	7C5H49nn1outnIbtfCDoK+jDTzkDWAwDOOPYHpBfqFHcYjWoyEFkxN2DPmGM+7Zt4kLkEeQn793
	1PVWDEKMNUdiXx30ly6kj0O7BRYS2zDWuM297pLVOS9jvHvjBZ81uhoxWN9JTLUi9ohQVg+lpWy
	ZIZar1gaXVbC21zyVtZ3ZgFBn18rSWJBAnyZwcaHvDQoYqTzpnnan9shLyYV2SBo+jDLiC00kBy
	8wThjWqxIJ3fkBP0m0rhNF6mlpSnAkXq9fZwz9E3+psdfycprrF5n40/ZUx6ndMVpJn1UMEruyd
	rC/IXPsBuH0ge4HBBU5cELzYXWHM/50d2TtpMJwDs5IxOi5Ov+DnwQyb3TuF5TvOf6b7aEHZKqk
	0oKdw2smzxWFYfWyV8RMz7nPtK/RmofiaswDXDqVxecIQTM3HaX3t4DRzBhL9cweXhPrXzLys5z
	b8MEAHMWpsC7K
X-Received: by 2002:a17:906:c113:b0:c40:b477:dfa0 with SMTP id a640c23a62f3a-c4d35446967mr304015666b.18.1793993977340;
        Fri, 06 Nov 2026 11:39:37 -0800 (PST)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d356eab3esm101989466b.87.2026.11.06.11.39.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 11:39:36 -0800 (PST)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so13032015e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 06 Nov 2026 11:39:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByo+N1JpszfeXr6Jk1I0ScPibLta7PoACWptaEJx/iNZkuDvmbKyXXSkvNEQlC9CcztMkApoNarC8yToZg=@vger.kernel.org
X-Received: by 2002:a05:600c:8b01:b0:4a3:5a7b:6002 with SMTP id
 5b1f17b1804b1-4b6dff841afmr64687555e9.28.1793993975424; Fri, 06 Nov 2026
 11:39:35 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
 <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
 <CAF1bQ=QiP4fb-+Kn8wzEH7wqjAjZaagxUd3sYpv2SkwDcnFPWQ@mail.gmail.com>
 <CAD=FV=WGKOnDoY1W7CuZw=s3e8f3jrXzkJ5_Qp_Y4WfT0XwXDg@mail.gmail.com>
 <CAF1bQ=TWZ=u1h92Nt9NgGcaDNTo=BOHmUp1DCWEeUMfwBb3WhQ@mail.gmail.com> <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
In-Reply-To: <CAKwvOdmTaMQf4Wyk_sygaushmMd9dRR3xPZ6K9rbKYB25uz7jg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Nov 2026 11:39:23 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WHjRTmAd9XO4HaenLWH+H+CEPzQzT=LBrtczeLQjKbZA@mail.gmail.com>
X-Gm-Features: AclHuK9tP02VsIUFVmusvGUU0-cT9m0zdYlZ-nWofELLkEPHJWUUFL-DsndX4ZI
Message-ID: <CAD=FV=WHjRTmAd9XO4HaenLWH+H+CEPzQzT=LBrtczeLQjKbZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rong Xu <xur@google.com>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Han Wang <nesthanwang@google.com>, Snehasish Kumar <snehasishk@google.com>, 
	Nilanjana Basu <nilanjana.basu87@gmail.com>, Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 6, 2026 at 10:17=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Fri, Nov 6, 2026 at 10:13=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > As far as I know, Profi is enabled in the Clang front-end initially. I
> > remember reviewing a patch that enabled Profi for the Rust front-end,
> > though it's possible that has already been merged.
> >
> > It seems strange that these flags diverge between C and Rust. Could we
> > add a comment to indicate that Profi is currently not enabled in Rust?
> >
> > Rong
> >
> > On Fri, Nov 6, 2026 at 10:06=E2=80=AFAM Doug Anderson <dianders@chromiu=
m.org> wrote:
> > >
> > > Hi,
> > >
> > > On Fri, Nov 6, 2026 at 9:43=E2=80=AFAM Rong Xu <xur@google.com> wrote=
:
> > > >
> > > > Just one thing: I think we should also have this flag for Rust so R=
ust
> > > > and c are consistent.
> > >
> > > Please see the commit message, which says:
> > >
> > > > RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes beca=
use
> > > > SampleProfileUseProfi remains false by default in the LLVM backend =
and
> > > > is only enabled by the Clang driver.
> > >
> > > Is that incorrect?
>
> Probably better to be explicit, rather than rely on the implicit
> default value, which sounds like it may be changing over time.

Sure. v2 posted here:

https://lore.kernel.org/r/20261106113800.v2.1.I0b27923381ef34cc99cdf8b65fea=
2e1bafce6370@changeid
