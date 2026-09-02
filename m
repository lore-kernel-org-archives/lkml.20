Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F0D415B8D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Sep 2026 09:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788341052; cv=pass; b=rNWXjFi3/m3M7JRib7NPLNjv+woHrmy47+oxNylxNyq750RMxKBhjvhVsT708lWHYtnu9yNx0013KMOcZKU0Ry0EfbJPp0/R7sfmZoAVoV7YgJGNfT4ptvyKxGAc/2Cs0nqknmKuW4NyQ79esU3Y5TZzNF5fu6kdP09t9S+tMLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788341052; c=relaxed/simple;
	bh=Ztg/iuQclPd7J/lDVuGJccxiw/xoO54Q7eyscqFYx+k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ILuoeV+qRvGDOeMn+24rGdExl61qJqs6SfkkexDDSYfDznNM/bnEN25MPXDIX0nPnp93wa/JLPU59pLej1v6GHRSJkiYdVNVvOApWKHEWP0SRFj4oRcVJzYKOycZgLLDNFf9YCvo2FbCaFv2cCvaEtb8kI6YmSYOiEYCxRY5M+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=tA93ivPS; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="tA93ivPS"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2d8f265cbe6so7510195ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Sep 2026 02:24:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788341050; cv=none;
        d=google.com; s=arc-20260327;
        b=lKvAsLAOiJUmMOFH8bHFN1K/XuAOOdQIBgQz0oUO2RcBC395raf+5JFuZq6nOwCb+L
         Qfj3sM0nWVuGufgAfeFZcHFIbfVSphdOWSZInvB+eAuyrYBoNtxyVBhVSkQ/8C6NeFaF
         yj8bIglk62vIebODmCFxXhI87bjptmLoEMknRhnh6FmBKWtxpIXZYWj1kQ+jFtxovvhQ
         6iyR3SPqUfLU3Tee3Zrv/MrGhIfUcr7u0s6LAKaboYnYpthfU5gna9tzuadupatcCSTW
         hiiYJVP8qqD2tl724WcqaKWaKnXjXBDd7Lv+fAm7jpU+h+nhYPRh5qWwzzcAD0YsuudM
         cOIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        fh=9PjhCDGhVbLa9GRNFzkXmT0EZoUaaadBOm8hTTPEwQ8=;
        b=fv7VMO/Rt7AtuTba9/5FaTZ/JdPDhD+c4ChGAI3ZgDZ/I4/sfWqj9P0RuYDHMPYw/l
         yUJKexkLl/uV+USrYAki8O2dcljljh1YA2xuNt0gBHZA8nuyIXezAkxb9RRqCNx6P6uy
         eWr8/axUUODi8KKzzhWAB4en9Z2gG0sInuqocUJqbmPnTtoKMFrCx+pyK6dkoCk9mVr8
         8WPsi055S8tw0l+Qgl85byY0NXJQwaZ+af9javhZUC3haLVzczDBIj2Oq02nP4qox50l
         H8EIOocejxHOXVm2UWpcebh5NNl6RRHTACUxUAb8g/V4XNJyoDoEMmYlu5ZK8QSC0/Je
         zhnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1788341050; x=1788945850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        b=tA93ivPSkpyOt+jNZM//pU3zX/HrR/P3Tt2g/ksqfdK9UTDuOXLEGaDqbX1O3WDg25
         u3YMN0pGGfVTGBG8I9q7jb++TWSAWoluy0DP8vmxhg0YR8N5W2jGPvVv0TZ+Z8lfkp+r
         ZLC14i9NKPn2PcbDDVqbVWkLbl6vRpErfBBGje5Tm4rEFF43cHBVJVkvJKRsir0CVagu
         cbGM6nPiBcxGIEIJfAPGlxkcOIkoaRXid+MskD3jBUAxc5+U3YbqgkcNz5CTAbR0gxX5
         SvCRqzwWOiBJp7am8o1qXO8LSzN6ZYUurO8USFsZFT5YGzTVLKOOpSYSKaU1n0GOP9WN
         wEoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788341050; x=1788945850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ytaSS9E97s/JULLyGWR20qPV51uikwUgTS3pF5XmIPU=;
        b=q2pz63EeXXl5S7jCUlt5UAoIs+nJAb4cxcwrd9rqsIGhRGXoupYBAQJMyJEYh5H0hs
         qV/Wqd4WZmFA/2seHSGLy9lAWyeSsqOQt2K61F9sMg4h3KMv2AvcmYaSGlY1Dz6T/CzG
         ZxQOPAuvlpzpNnqFq7NJypsOjg2Bugk4GmBvd3lWFbfPNCO+XJQvwdWXeX+hZDfecKpv
         48f6dxE/e/rJ2N46Cca5S7qSLueHmUMoLmG2qiBkC8zxVEuZVKk/pcT6NsAS9gQmvhrC
         B8sz7z7EH2QiMHwoNFQmT4yc1jIv0L8TOuAIid4GXmZH9dN+amPjsVYP/VRO1dsKyli1
         FlaQ==
X-Forwarded-Encrypted: i=1; AKwUvBzrl/9UotYXob77WGTGJiZ9kD5QdVYxWraOwwvFrE/iFnmfnlBT8bHeMj1TRGlD9dgv4SJxpVlhjsSXwv0=@vger.kernel.org
X-Gm-Message-State: AFuF++nvSkZU9mhK+IAC4bvv9YWMcg+mwp8NdWxjQZurfD4R69TfcsBm
	IiUrkGONPrr5a6PudLRSryY4Q/gfvYBj2/7NgCGYI8Da7lXdhbbnX0wWc8Yc9WV3sfzOL7lgKi/
	uvDy6mXI0wz+saBCwfZrbcQHwaoyGl0dw9eCeuDx24w==
X-Gm-Gg: AR+sD13qXHn94NMXBNf2Mwrc0HEdO2nVN0/FNXMS9EsZyoEcqSwaHss3VFPHQi5Kp3y
	jpFdVQCb8jm6RvdiXVRwRb1F5fza2EL0qm9QOAdY6ucw8P3vZqAMwtjZidCZJ/xNtrdG89ylMBf
	BALjCjdJ0WDo5KznQfLkuTN7YiPWakJ95VNq4SFLs/MaoAPJezITdHFHFPYrkUJoy11ioNYMu8y
	IRN9JcvmkXebeXkeA66pJ7QBCX6bfa/1ClO0PqJJ/fUFaZDBjFV3d1aId/CYN+kubsdSsf4ZYPQ
	UXf+mw79T4NnetaaRtFFvY0w1rWDGziW6KLkzqZgK9Y06Xp9SF8AIpp6G/0yeWgsx+D2vIs5M/S
	qEw==
X-Received: by 2002:a17:902:f682:b0:2ca:f21a:a6c5 with SMTP id
 d9443c01a7336-2daec5ad6d8mr40455475ad.1.1788341050320; Wed, 02 Sep 2026
 02:24:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-rk3576-otp-cpuid-mac-v1-0-ea9135270fc2@flipper.net>
 <20260901-rk3576-otp-cpuid-mac-v1-1-ea9135270fc2@flipper.net> <87ecfc81e9.fsf@bootlin.com>
In-Reply-To: <87ecfc81e9.fsf@bootlin.com>
From: Alexey Charkov <alchark@flipper.net>
Date: Wed, 2 Sep 2026 13:24:00 +0400
X-Gm-Features: AcwNN1Vwt1UNue4ueZiVCGXuJAETKqvfhojim__xlQfGqQYcvUB9rCpZaBk-bcY
Message-ID: <CAKTNdwH5S3MxgR=5s2LXPquCFRXE-61LTTsZoHP9+YmXo_P4Ag@mail.gmail.com>
Subject: Re: [PATCH 1/4] nvmem: rockchip-otp: Serialize reads
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Michael Walle <michael@walle.cc>, 
	Finley Xiao <finley.xiao@rock-chips.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 1:10=E2=80=AFPM Miquel Raynal <miquel.raynal@bootlin=
.com> wrote:
>
> On 01/09/2026 at 19:33:11 +04, Alexey Charkov <alchark@flipper.net> wrote=
:
>
> > The OTP controller is driven through a single set of registers holding =
a
> > state machine which has to be stepped through for every word read, yet
> > nothing keeps two readers out of each other's way. Concurrent reads
> > interleave, and the outcome is either a reader bailing out:
> >
> >   rockchip-otp 2a580000.otp: timeout during read setup
> >
> > or, worse, one of them silently taking delivery of the other's data.
> >
> > Reading two cells in parallel from userspace on RK3576 reproduces both
> > within 150 iterations - 53 read errors and 9 corrupted results, the lat=
ter
> > either losing their first word or, in one case, ending in the two bytes
> > which belong to the other reader's cell - whereas the same reads issued
> > sequentially never fail. Concurrency is not hypothetical here, as six
> > thermal sensors source their trim values from the OTP and reach the dri=
ver
> > straight from asynchronous driver probing.
> >
> > Guard the read path with a mutex. Reads are the only way into the hardw=
are,
> > as the driver registers no write callback, and they always run in proce=
ss
> > context, so a plain mutex spanning the whole clock-enable, read,
> > clock-disable sequence is enough.
> >
> > Fixes: 755864feb729 ("nvmem: add Rockchip OTP driver")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
>
> Reviewed-by: Miquel Raynal <miquel.raynal@bootlin.com>

Thanks for your review Miquel!

Sashiko complained about mixing a scope-based guard into a function
with goto-based error handling, so I am replacing the guard(mutex)
with explicit lock and unlock calls for v2. There won't be any
semantic change though, so if you don't mind I'd like to carry your
tag into the v2 version.

Best regards,
Alexey
