Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793225070;
	b=zzrPBXPHG8wxS7N25pRSjXKndhGk5OC5gyQGBzGREv//RMiXhqihALzl16Hf+yXy0GcJ
	 OaovDx79ueYpjdxyTsLRoQMudDqqXeVupNLqZCHts5fq6j4x2WYnzyrH9ZoYAFodXMh7e
	 6/51NDdFOElbaFy7x3IoanlYmjAZH1deVfRiY1RG65bnH6CG+LsbhDuqSlG/eMxDUliCd
	 OF1JnXa1Wi8UdkwZiD10V3GsbPGwL60W5SLcMxU4z+beBBGdevcyxWDo/TJpyetBazh6s
	 Uqd3MniNRXP1qcCW72i7Tr1BOqLsiE0fjYMCYXQzvv3EaDTigKqcqtwJ+hTWGxGUtYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793225070;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
	b=UiLoaR+51XNsj1Lyix8ul3Ks4N+V4oM00X6Mzcv4voy/DuwFq0zKcnb62BNhQ0egebqX
	 f+PbhUDx+hn27saTtpfPjBCQ/YOtt451TRjuD2lsnxIOiaYgA8RwnuHADEi4caO741bVD
	 6sACNQmmE8X31yVvydyu7MJRnOfvdOAQdbl8UAUXtr9Y9UtIAujcBKRyJ5Gjs9vskTeYh
	 iv6USCYUbncJRVJ0gZIcCnqiyExE+I0mAEgEkQFowmkxSwjbR5PeDQTXv6/FYoNJsOZIE
	 xjsqad5Xqlj6WGcGftd50iJD9YqOzTaPrIJJREgya3T+ZReijUEZk0JYVF8rZP7Vobg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q0YhmiXe;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064EF606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 22:04:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 064EF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Q0YhmiXe
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c40f29667e6so179704666b.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793225068; x=1793829868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
        b=Q0YhmiXetW5QCf+YSFiyTdcBPSjkIiTxOipGKLiMyzRRNz/97kMOXarCCByGwkZ2P1
         joR1lPkpQWJLdqWOpJt5n6vrnqBmFJYUumLW3zI+NrJw0D515lV3EjGpuydKEDeAfjIx
         rPw2vMizUNwmLcBM2qbHmP1uSBcatWoO9ropc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225068; x=1793829868;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yvSpU1RmCwpqp69YfdVcFdLUU7Lktr8hu4x+f1G9b+A=;
        b=ohHv7rc+OxvxZxZmi72e1oyqcuEEoIvNMsE/mvJFCCp2j99lLJocVCZ282EEExFJPg
         Apt1rG7WEob+s/PbrC95dC6FKnTodpzS/3y0BaIKwhZ/4UgxzBV9mMm16ovzxgnhMNcF
         5/gfcbGvvjQSUWIIscHHYBq8Vo8Uj87+hH3XF2et6sO9KkRBe1aTqdgPcacAQYNPmXX/
         HXEAmmoqtYo/WLW6GbQ16rnDbB+ypYWoHWNOZvGXvbXPkRCtHNbRCetmfK42BKTRpzjB
         NSoLyuWDh4fBhLrXxlQXSGHJHRyT3aYUp8ZywcdOb7uZmLOvU6B8WaMPQtVGAbJWMooI
         59fw==
X-Forwarded-Encrypted: i=1; AKwUvBxhOqm7vHh2NCQlqw/SZEPclB5gsXdBAogTDZdqHPaRGfsdCVdqE4eJyvRiNXWk80/y3t7v+5iBYe8roe8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJDNTuIvCUEBannpFTsfXuT/19KjZv0eMTy14gQf4SFzScCbtgn
	UQJSsSKqaPIYwIRI13T5gr6jyGPd9ClASx4ZJj+qqcARpgHYV9Xvu+jIPzyfe2J3GdK30BK77JV
	GBeiq+joN
X-Gm-Gg: AYBFou3siTMUvqMTB7ogTyJZfzOJUhx3swaoZCODugr1vdWdps8hV+cwIO+VUSOrKdt
	O3fVZfhnFHJD4Uoi6NKt5VmVIVL5rC1htMYg4RCc0O2Bx0zgltAx0XWfimw1e8s1goxajVJjH2A
	6tjoWvMoIBQ6Z9Tgz2H1zgsJn4b8w1p8eszKWzTTgWvR5D0OFUXX2u5wYK+GH+6utknQnM3PqHG
	jTHkYCVtOw2G2D/a60dCLHyF38EkOSYQhW4sFEoNRjwNKPuifvPw8SM8zMlGCp4qxwHwY1A2otK
	sB0pn1A5HOBo9r/P374x37AIvN3EDEigIdknmcY0DSnuOIkxV774nB8Pk4Wp3t7jl/djlhITFn6
	4TEtvBNCvMroaNCuiADzjaEZ04VUgzcT/3LyYuESmDKpCEx/cBVhDTa9SZ8qwlX+zozEBK2iLHP
	Sdis8kChboj0rYD4ScqT6mHRLOzbjBUG3EP9+H+3QlhfCgVmkgk2bXT6z0BYJAIe1hiFyIhnBhg
	/nQK2Bfma+K4YopphYSNdbdqQLcjwy+K4HicBOeD8vmEh83eVB3nk9//2GL7qH1FxUKjIAj+zm0
	bGyYRkDo7g/Kf8otfOOnFxIazJVdi4lIFkKTq/6U//35WjgPVzXoiOOCuQGkN9vzG01q
X-Received: by 2002:a17:907:2d10:b0:c31:91f9:60b7 with SMTP id a640c23a62f3a-c49bdf43869mr336755266b.34.1793225068366;
        Wed, 28 Oct 2026 15:04:28 -0700 (PDT)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c49a530f520sm333387566b.23.2026.10.28.15.04.28
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 15:04:28 -0700 (PDT)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a642495d81so2589961a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 15:04:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBz5ZKQXymP4lQk/qBkIAP14PmPUI+FvJh/13qzdpIT8oe+UADBB+bxub6bO/CO+9Esp9WMhEUCnmzPAacg=@vger.kernel.org
X-Received: by 2002:a05:6000:1862:b0:48b:d9:cb52 with SMTP id
 ffacd0b85a97d-48e5d2f0870mr9207532f8f.27.1793224645061; Wed, 28 Oct 2026
 14:57:25 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261015182221.2931742-1-dianders@chromium.org> <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
In-Reply-To: <CAFLszTjB-wcxTEKVNo-z0PctkhqavGEh+eiRyiPsMZBPkQbHtw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Oct 2026 14:57:12 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WKNgv4s6sjwhmFGsdwWT0hoH7aeT10yFukfGgKJG7Otw@mail.gmail.com>
X-Gm-Features: AclHuK9JLI1NV3Vu1fFwtBgddt7vzex8tSoFo5s_xXqgH3jZvlT38aEpTZKBlME
Message-ID: <CAD=FV=WKNgv4s6sjwhmFGsdwWT0hoH7aeT10yFukfGgKJG7Otw@mail.gmail.com>
Subject: Re: [PATCH 0/4] fdtfactor: Introduce fdtfactor to auto-factor overlays
To: Simon Glass <sjg@chromium.org>
Cc: Devicetree-compiler@vger.kernel.org, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	linux-kernel@vger.kernel.org, Devicetree@vger.kernel.org, 
	Brian Norris <briannorris@chromium.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Julius Werner <jwerner@chromium.org>, Saravana Kannan <saravanak@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Simon,

On Mon, Oct 26, 2026 at 8:31=E2=80=AFAM Simon Glass <sjg@chromium.org> wrot=
e:
>
> Hi Doug,
>
> On 2026-10-15T18:21:33, Douglas Anderson <dianders@chromium.org> wrote:
>
> > The fdtfactor tool can either work directly on a set of compiled device=
tree
> > files or it can work on FIT (flattened image tree) file. The idea is th=
at
> > you'd create the FIT file containing all of the duplicated devicetree
> > files and then fdtfactor would "optimize" them.
>
> This is an excellent idea. I have been thinking about something like
> this for some years but then when Chen-Yu Tsai wrote something which
> used the kernel build (Linux 17c31aded9a1 scripts/make_fit: Support
> decomposing DTBs) I forgot about it all. So thanks for taking it on!
>
> Ths script's post-processing of a finished FIT only works for a narrow
> set of images. Apart from signatures nodes (where I think it should
> error), it also rejects FITs with external data[1], which mkimage -E
> produces and binman[2] uses a lot. Of course, mkimage does support
> making the data internal, so it's easy enough to work around, but also
> likely easy enough to support in this tool once the initial version is
> in.

Sure, if you want to make additional improvements that'd be cool.
Keeping it out of here since this patch series is already giant
enough. ;-)


> As an aside, this would be a great feature to add to binman - trivial
> once your script is applied.
>
> > Add 3-board test cases covering default mode and `--strip-local-fixups`
> > to the `fdtoverlay` test suite.
>
> Please can you move the tests from all three patches out of
> fdtoverlay_tests() into a separate fdtfactor test set? Then they can
> be run on their own with run_tests.sh -t and skipped cleanly when
> Python or lz4 is not available.

Done.


> > 3. Better savings than just a simple partitioning, like between SoC and
> >    boards.
>
> It would be worth including numbers for a plain SoC/board split on
> trogdor compared with fdtfactor. The whole set compressed with a
> large-window compressor would also help (as David suggests). That
> would show how much of the 87.5% comes from the factoring itself.

I decided not to do this on trogdor. Trying to make the trogdor base
SoC compile as its own base dtb seems like it would be a lot of
trouble. Maybe I'm wrong and it wouldn't be too bad, but instead I did
something even better (at least, in my opinion).

Instead, I ran fdtfactor on the downstream Pixel 10 devicetree files.
Those _are_ already using a play SoC/board split. I'll include details
and numbers in the cover letter of v2.

As I responded to David, I'm not sure I can test the large window
compressor since device tree files are compressed separately.

-Doug
