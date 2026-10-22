Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792663510;
	b=bwsISZj2+csXWr4ZpmCV7rmQTYfuCi7x/AaCOKz6A6+D14vZCdtgMH/7GlhZCkx9X3SA
	 OGWVvG1YaYEviTZm0cH/i+umGF0HxIm8CalmXi8C7JuIpPMo5AA4Jqvkfs6Ab6ib0Y1Yh
	 AbMKYkWzOlwNtl4m0FElIU2Sgtx31XzXk8pL4fRlXJojev5CaQ5M0b3ihc+Bpt22KMyDM
	 uSJkH4Q0iormVNIYquTytSuTqgWr4ytadgYDRv7MEi4VQJwA7adDX/Uw65gWDr9iCBJRU
	 PZqmjl9cz+tpUxyQnRRjLBXE6DdXQ1/bCTMCVANNh9onu6Z0gpshPcX1JH+LwWJissg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792663510;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=AmtBa+LxL4SvVmJcPn57Ipgp4NVdoxGD7DbFVBLBg0I=;
	b=UJuQcKKMtzNLu8o+sgDnhcrmCZd0iYPyobno/mBu3HpHqGkt1kclgcJ5FFqK3H/zQmbh
	 fBAZS5Gd4AA0eECR9pJlGzjp+OucuVuRATylj/dDP7KFRTm0Q1wCibHN+AZ+XrFaYVd9J
	 Bvg+MeM97fvrWn+b8Bx0NozWknNDFKc/Jizh4BS3YmJ0crjtPN3NJHW2u4eye1bt+0CoX
	 z6k1+I4QBFeA3DfEy3EFGy0Nz859zgvttPEnFSWm2H2E7aiTt1pGm3tI2LWz1zpgBTkrJ
	 iqif1UEklqmhlG1gAD/nMiPpjTH9bRBw9aU5eAO/Fmieo2b4e5flzYZVCKpoJxefTrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.51
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9B4606A321
	for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 10:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E9B4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-98fea7e52b7so926744241.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792663508; x=1793268308;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=AmtBa+LxL4SvVmJcPn57Ipgp4NVdoxGD7DbFVBLBg0I=;
        b=GXB2WrEXGzDQ+cGEk5l00lNdFDxk9qpL2sc1Zbx7x0cwoY+X/fOprQ7754XVeM+IZN
         BI1b/u/fOATmatk3/058q3eIkYZ0G+K5AqAVYLqGLhM02glWQ8G6yXG3AQoEqUdkjD4k
         eu+3dOZWwzHdeumyJfEe3jd1AGA1ovhF9+iuQQVHtWT7PpOQLaaotFEeGLLb3qlK1yE6
         UJHTz1jUBjZHL5ZMdhp00n/7o80wpS2B/D1q+75GuOSZ0648B2tyvwryuUeNDbheI5Ss
         f3cMRLaMFirOpRH989wZuAB/oMorZCQwKf8Lfu1pWXccd8AJkpAAvaNlxdaQ8GQ4bi8S
         WqGA==
X-Forwarded-Encrypted: i=1; AKwUvBwvitm1W5o8j9ox36ZmZkBvUx2vH5eZwuAzKq2REoBM0T+aV7EHwA6+PfVcR4FavaI0QYxGkazDa+3Qwlk=@vger.kernel.org
X-Gm-Message-State: AFq9FYKKZUqQ/xSnjvJ5rvJN2uU1Nh6nUxSP3kNrqXP8Ye6NLlLxBOqv
	jllwGmBU2BlC6H5gO8tQ6cheLXvPLc8DZk6AJY4lFovGzSLGJfYjYOmUFW6weEOM
X-Gm-Gg: AYBFou3WTOJjUOaK0c582/sueqIbBU2oufdeExAOtk+N0tFMQiwt+CzaSTMWnc64dew
	5bV4vumQCGtDSqMHsThvfufxRUVv4I8ih1t9K0owUzYbSChAwOrzNeyAv4XJsPxY4kSDzUpvvKG
	cJaKHMMf+1UuYI5qO/fkjWEuDIpqmF7gqiU0BaCQGUdbYzkqIdUwSgfriXR0Ys6PBQhy71w1W5z
	v/GAv+q7nb9sQ+ZCKTvjRtamhN+txuCmfpleitCeuY3QQHZ+efSg/N4Z4vKV5zW5XjmYN/c8w/c
	+ULzqdQIUPvlhzgvUe07OKl62+YAgT0Vsi0PuLUDL8PVHIlfIAp7ansH/kWgeKQKGZIb0XwgRCD
	F6RpACt9N88maBwUCqLbW+GBs7ZlR+jYegnQopTjLCdCfwSxr8mkJVc9sPm4b2z21pS9WJHX3H6
	LAtBt2myDCCtVI8W3ax28b+G4nWTJWPUvRRFgEDSrfOnoP64IjmSDhCtoNjZSv+YxGmeKJHE8K+
	A/eBN83gQ+JU/IUBMxuKwaxhzLpwjopl1CQhji125DyJlyyTPeTAmdCdHif7nff7keCn2u8W4QT
	N7trh7FKs89DL2yNeA/jD8THG4/GVpHw8UbF7V4=
X-Received: by 2002:a05:6102:4410:b0:7cc:2946:7f80 with SMTP id ada2fe7eead31-7cc927441e4mr2229861137.35.1792663508499;
        Thu, 22 Oct 2026 03:05:08 -0700 (PDT)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com. [209.85.217.41])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-990d109018dsm5801348241.6.2026.10.22.03.05.07
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 03:05:07 -0700 (PDT)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-7a6e560f580so1096563137.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 Oct 2026 03:05:07 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByCG51l+IsZqU7dNm40Fk+l7pwopqBjlJA61krQ5HIM1Y8fh6tF2lhitiXJGJsk6f52pUDVPIEJovyEbxw=@vger.kernel.org
X-Received: by 2002:a05:6102:4410:b0:7cc:2946:7f80 with SMTP id
 ada2fe7eead31-7cc927441e4mr2229849137.35.1792663507671; Thu, 22 Oct 2026
 03:05:07 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020212235.1143086-1-ebiggers@kernel.org> <363b228a-7e96-481a-b70f-195ba55d025e@kernel.org>
 <87y0br3zln.fsf@trenco.lwn.net> <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
In-Reply-To: <9704f11c-4c2e-426b-87df-13ea2ffdca3c@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 22 Oct 2026 12:04:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
X-Gm-Features: AclHuK_CDyU6-9WYZXLSnQ7yP-CtCllBONPjh-ERk93EX-FDKMuOE4BuJWpX_k8
Message-ID: <CAMuHMdW6fLN66GzWt1C+zpCwW99UCaN=C2xCrxL9k1P7K7VKHg@mail.gmail.com>
Subject: Re: [PATCH] docs: submitting-patches: Require base tree information
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Eric Biggers <ebiggers@kernel.org>, linux-doc@vger.kernel.org, 
	workflows@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,

On Wed, 21 Oct 2026 at 18:01, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/10/2026 16:19, Jonathan Corbet wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> writes:
> >
> >> For many of my contributions base is obvious and not needed to be
> >> explicitly defined. For all the patches I accept, answer is the same -
> >> base is either obvious or if not and patch does not apply, then the base
> >> does not matter.
> >>
> >> Requiring it is just bureaucracy without actual benefit.
> >>
> >> The only benefit would be if maintainer COULD change its base to apply
> >> some patch with odd base... but this cannot happen. Maintainer base is
> >> fixed - it's the HEAD of his development branch for given category of
> >> commits (e.g. DTS branch for SoC maintainers).
> >
> > I fairly routinely get docs patches that don't apply to docs-next; when
> > I'm in the mood, I'll try to figure what they *do* apply to, then
> > cherry-pick them over.  Base information would make that process easier,
> > and even automatable.
> >
>
> Some maintainers do that indeed and I propose not to. Every two months I
> see one of my or other folks around my area patch which is being changed
> in incorrect way between mailing list and Git. Change is done because:
>
> 1. Patch did not apply cleanly (a lot of simultaneous work, so base is
> obviously old the moment the maintainer applies such patch)
>
> 2. Maintainer tried to resolve that by applying to the correct base (so
> followed your process) and then did git rebase or cherry pick to his
> final development branch.
>
> 3. Maintainer is overloaded and has no time to investigate whether
> rebase/cherry-pick from above is truly correct, except building the
> code, so every two months result of such rebase is wrong.
>
> This is a real issue because it is very difficult to spot - your commit
> is applied, but you never verify whether is applied THE SAME way and
> maintainer thinks everything was applied cleanly.
>
> If (1) happens and patch does not apply, the solution is to ask the
> contributor to rebase.

This happens a lot in DTS-enablement patches: multiple people are
working on different devices for the same SoC/board, so half of their
patches insert new device nodes at the same conflicting location.
Perhaps we can teach to git how to handle DTS addition conflicts?

So your solution is that I apply one new patch every day and publish
the result, and ask all other N-1 series to be rebased? Obviously this
not only applies to queuing patches, but also to applying patches for
build/run testing during review?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
