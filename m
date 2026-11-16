Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857812;
	b=ddVK+UHAOaVSPB9EK8UMAatPtkk+tyjpZe2HH8p82/n8jHjrdPXSe+gbFMGg7W7I+GZQ
	 ZLgJZfkxHmxacGNaUr4gfeswSr2Tv5jBz5kJIqLW1D9hqOwM1LtpOyjp4ETuntQVSc5PR
	 4bCiP26ihaYlIsYxIcxXG3VfoOepwolbu1I+D+Q/BOGH8aKqc5ImVFP37Ui63uSc9kKy3
	 6qtXgLeTfxKik55LHhiPWSJDqB/nwPform0O81qUN2TaWb4nh3uODOfa/Iyy5SfoOYsxJ
	 R3wp4imjw9Pp7au0tboSYTXUVU5KqSXJWc0NcSnQ8B45dXO1sfiZ2tQfoLLyiJtxbPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857812;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
	b=HXgZ1XQKpod7ZAdlIPbSB09tlD13TAvtF8Jg5q05H+wBDAIjFHyGE+uhMemUQwkA5lge
	 LKNWZS9poO2fMbcTlp5JkVugock4oq0LQ11QlilwDLhRjLGzH/YkyyrqMeRcvVDmHwEFF
	 OwS4O0LoSGseXW3M122GmI6CkJ9654XQTJE31csfydbuHm9Sug3pBcolS+f8GcN0xbKIM
	 yfS0I4wJ7D/cb6Y16HPM+suvt00YOB/8HaYjVu3YR/IkVWY2BX6TMUSFMStM/3mn6Pe3x
	 ObBhbyP6UsZv0auwiO12h1J5rtWA++UxosCJatfVHyJYWILyZ2xDZvN149XzHIMjRSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LplowID6;
	arc=none smtp.remote-ip=209.85.208.52
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B2606A32C
	for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 19:36:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282B2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=LplowID6
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b6e7a05225so5982409a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794857811; x=1795462611; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
        b=LplowID60eMGSrF2nTWWGRIQiyjRflajGAnsTAVRQasEzYSY4mohwAUjX2VD+JZ05g
         SbT6UChkEZ42LiPLmebs2bcYvdPjQXofl4z6sxd1qp+OD6BJ7pZ0dk7YEvBcJ0P9fTUm
         IGc1lZOAj7H6/0UuPNM8BBQTogUS8bc/yVxJA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857811; x=1795462611;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nh4pWMvkRsPEst/kCwIp1wxFa2k7tAfx6b5lfGN0krQ=;
        b=xKITxzzXzyPz4qMussOT3oKfu8/3pr6g3ZN6iURQSvgX8s1nYrRf1qCrrbpEcY5TgO
         HcgYyB3CPZwZBPPTx8Cr/0xmaXC/ZOOWXMJj8xqhIZe2I+W7N9JSNcjmaY53uYlEqgJ+
         lMC2uTYyDraior2lnypU79mfS5pD4+auFEbHAFNdfcQNyH1i15ov0BWCY+c8OrDVkanm
         0Ghavga+jt7eNSGxOotxwnwmU02s7niJKaETI0uZ/m5unFF8UTCJX0csltBsiNrs2E9B
         v9Y5wASZeSN5S98pAhxywlQyxZOgqgd2cQsLyjdphsLjtcDdFLM/0Oe6ByuG/S4ODx7I
         13XA==
X-Forwarded-Encrypted: i=1; AL+hErGpvD5qUGw/gBMUBiRzdq0/QbV/SgMA+fJb6+2iIxQ4PR8Qk91kq7wrazTPwjZNKSd5YkIj3yyt/8occN4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+RYT/0cBNSut/rLEpZiLvj8CCrl5aqd8vIJHxdzRgPqidd0L0
	/RxqGD0Hci6yc8Nsf01nRm9tI6Rl3mytBmygSN8gGU1U564K9QwfGRINzTKchlsEkFZtlVzCAGw
	i6bgPEKEXSA==
X-Gm-Gg: AYBFou1NqM1aNSEsJ7erxvJeHTBa3NlInMiRsq8rTQIfUo7QzICrkCyroxTKZygSszt
	HvWEq70CMmfaZ6mxAACQmhmxFB42AL1K5EtCwV481rekpdQpup24w2cQx17XJ8vaI5bPtDHLwdz
	3KJLYLhi+jvZajdkdvfo67vhiwwmYr0nRsbOVoBEUsafrHOttvHy+h5cozJsvUhaxRVI6GlN4Dv
	RpIylR8FNxtnPVHQAz/yIXOKdSs8YKQkQZQiJRhBRma6ejFlo/Op+3U9fGcyNLi0IxeDWJA0pqj
	A6uIat7z3rGiUWv8otvKK/8UL7cXKHVBOzocfvEcs6Emzqu59/zdXuUtPvAkYY6i52ObP7D6aID
	V+70hLADzo1ioAUGQHz87F9lJTMI8oS+eJzVR9YJEuhAyDe4E5ut3gIOPHrtMPQ1ZDs4igFJbX7
	OmCiwpT56GjyhpI9RHvbBcSjNodplcrtd3W4iBnBw/uE7aKvqLWOmJxxoco+9VEiVns11EZudg0
	jMjdZMMozlR9FxknktcDfaS7YSVTifqvLDyZVxme9ThNq+/2abyXuo1cPWQNC3oJCV3nfMSG9bZ
	cp9cwp9VRW4tKA6KXDOj/SS3qe0onOLbjKrEsE7Rj004rE3CggLIlHrRklNR4DT6W4u5loJ0JUF
	LR2kEjAYwow1WK2dta3XiCeoM
X-Received: by 2002:a05:6402:3135:b0:6b7:63b7:4e7c with SMTP id 4fb4d7f45d1cf-6b7c0bde9afmr6153161a12.17.1794857810701;
        Mon, 16 Nov 2026 11:36:50 -0800 (PST)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com. [209.85.218.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b7c25ded92sm5098080a12.31.2026.11.16.11.36.49
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 11:36:49 -0800 (PST)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so624121966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Nov 2026 11:36:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGNiBuyAU4JVqq/jr2+aXJ1aTQf9p5Xupd2LAcoxxDKrwjN7HEVCE87dOUczQgFEy1BkqP7jK9bn2XPSN4=@vger.kernel.org
X-Received: by 2002:a17:907:d86:b0:c50:4b6e:329 with SMTP id
 a640c23a62f3a-c5096372173mr926077766b.15.1794857808907; Mon, 16 Nov 2026
 11:36:48 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025164719.1831477-1-sashal@kernel.org> <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
In-Reply-To: <CA+1xoqcxAsRij1j10TyhNX9JXNXNkdWO3sMaVRXCqYdEXi45fg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 16 Nov 2026 11:36:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
X-Gm-Features: AclHuK9wFvPLbk2hT2Jt-YCf9KvKeXcURMdq1CAih03odFDrPYf2QaCfvYcr5qU
Message-ID: <CAHk-=wgCX4=ZSPALxR7VHKKAKipU1nD_Am-Q-0z1SRKxr-VRRQ@mail.gmail.com>
Subject: Re: [GIT PULL] Kernel API specification framework for v7.4
To: Sasha Levin <levinsasha928@gmail.com>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
	Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 16 Nov 2026 at 10:14, Sasha Levin <levinsasha928@gmail.com> wrote:
>
> Ping?

So honestly, I really don't like it. I don't think *any* of this
should be inside the kernel. I don't think the in-kernel side helps at
all: the comments are too big, nobody will read them, and the whole -
and only - real use of them would be outside validation, not at
run-time.

IOW, I see only downsides to polluting the kernel source code with
comments that aren't useful to humans.

If this was a spec that is maintained in some automated format - not
in C comments in source files that aren't useful as comments anyway
purely inside something like tools/kernel-api/ (or Documentation, or
even an outside repository entirely), together with the scripts to
then validate it, that would be one thing.

But polluting source code with huge comments that aren't for humans is
right out. Particularly when it clearly is a "first step" and the
intent is to make those comments bigger and more extended in the
future.

And I see *no* upside to any /sys/kernel/debug/kapi interface. Nobody
cares, and any excuse to make it dynamic ("We might update the API in
the future") is actually the complete opposite of the whole point of a
stable API and not something I want to make easier or support in any
way what-so-ever.

So all of the in-kernel side to me looks like actively detrimental to
the whole idea.

What I think *can* work is an external spec that is written so that
tools (read: AI) can actually then verify it against kernel sources,
and that can be used to also drive automated testing. But putting any
of it inside the kernel is bad.

                  Linus
