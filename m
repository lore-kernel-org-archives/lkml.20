Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02F7455171
	for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 15:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787756770; cv=pass; b=YBln4tEoesuovXTgq4SJ45BTa0CHE3MgcolKyN8zbwE6mcALlUxYSoyJaCrFoA7EiN3ohlQnAekN3rmgDCG82Ov+/4ddoDuGnOhf7O5jtz967oRHpix00/sgP0RG9CZu0P2Sgd1DEQJIizN1yflnP54DQl+sFM+3kW1DS6MmAQY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787756770; c=relaxed/simple;
	bh=fKABmemTLhVq3rnCUFgsOz983VtCKrNjV3YZ5ISgLrs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N6jXRxklZN41OIApaj/CpKWM7yS8CZJak0nu11vg99hvSJbNmfEV4pTtR7HCbXTxZTekATsEYW2CR9TE/+ABKJI2I8aqx6nWwgOMTdGlPeU+u0AjOV9j7M4YK0cMxIQoVBa8E7OcCEHt/R4yHIZ2ycdpP6pQdxGeQKGeQ8cVvrc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ+dM1hg; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ+dM1hg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d5862bc921so2724985ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 26 Aug 2026 08:06:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787756768; cv=none;
        d=google.com; s=arc-20260327;
        b=oe0+ouT7uwEm9SLAn5VC6ZTaqH5xkqPgostLEBQ567Y+COCIvj7l0mGENieJt/eces
         R3BCn141vwJ75sF3CkLgo+bJzTqZXF+dC4IIagP43ax4gO9lFPwt1VJcxHztWNpFcK9A
         /d2MUB6ILXKqN+DtdYAg/G07v6Mvi53K8T+Pa8HEBePya37R/Oe9jzRAan3kYGPb8zUa
         LZ2XMsrDPB1E572LslHA8YSKygf7+aB63zaEGS2RlknCfabw+o/C3PoOBsuOU0EhfTun
         x5ldkG4yF+XnMqOvH1W3XKthGMIwkqQYgVLqZjqLlP9qxMYoNRUcJA8YwXnzBFmVnr9Y
         Ab+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mM06737N3KEocOk1ZcR67skwuuKDg90XAA91OQOAsGQ=;
        fh=GMd3qk5/PRbDUJbv8/cRc0yGRgN0x952IyMkSHAPY10=;
        b=XNGvgmOmCw7daBbX0uGrPX5cmp0Nzo5THrEzGAwh48HAA/mxqhHRj34F6+Il3/edHa
         64HCTt36SiHLY8JYsTyCkd5das2AkpfHxa7cPzC+QI3KqiXvbmajpuII0bMKR7mxf9Vv
         +FTZXJDXwGXYw7fpFtq8VRnYllQ5M6iFi8r4DO4HSDhxiVVgA3qju6YBhqxJffxCvjrl
         o2aAaWJsdVOMZcDlKG0edGpDcKICPYXOWjNQ1CWVziSIiFegut4BgumUn+CX9VHh9qr3
         0JFOWcQpG3cmv0DztzAe4MrfjYu8uuWc1t15c7pF5rp56+0NMCoxdjQMCBANEZ3YtObG
         pPKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787756768; x=1788361568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mM06737N3KEocOk1ZcR67skwuuKDg90XAA91OQOAsGQ=;
        b=GJ+dM1hgX/58wDJHXDa8UEzDZ3xWVgjBUiCLxGppVS3JOpVjsKDBNmebGxgZgk8LM4
         4/iUMHhvvQAHKegI1iaHUCJFzihjGUESm6hqrfpgJT4sMyYJL6nkBTKSbvz+K4qDLkFn
         /OdriwOnRFamPQspxCKOQwWPc3tptgxsba5v9eT6zNtXYgDj4WFyF/7u+ojcmqsQ7VPy
         7t5DthcAf2FU+W8EtKg70eant02XvERd0uaees1VVfJn9yiMKP2vFDmyA1VcQJc3eg0X
         D0sgDvoqcEq6uIFRdDXRpFN29I2oYnsKoSLsMU25qLUo1OFJlxjo6SQGfYTkCphsaKZh
         MqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787756768; x=1788361568;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mM06737N3KEocOk1ZcR67skwuuKDg90XAA91OQOAsGQ=;
        b=KYmaziWayNEMq3vPQfyISXMyCXa+VmzWATpEHrTItqVMWeMMYk6rwjZCLX7jTsL0Oi
         ESWx3gTB+VqhwX1Q97lC3XzfBp+5dxQMqXBHPb2IEHbjiH+tQRHzPJux8KQVJkVOBWy2
         B4aOU5X5tVCxqOoYkB4HI/5jHr//DE3abbM62ygYFmTT6kIw/SVmu6tp+c/niZ9NisWc
         AfoULrIrZ9QSSQRaKTNvc/BP/Juf/4BGSQtcfZshSeGBg02oibFVUI7Izsv/PDqTz+xZ
         5l315b7o6OWHwQqART903LJsxAdir+oFhjkyqoWyPBtmBf2HgxkaoV+cZap4ndsYHdOx
         9EVg==
X-Forwarded-Encrypted: i=1; AHgh+RqEjR9VaHhGfuUXjHcD4NEXnthSlctkE0J8uyY045Oej2lctk3dwjXohuDFsZYDIsYQoJETQL0XNl7lpD0=@vger.kernel.org
X-Gm-Message-State: AFuF++liKTMQ5Agfm3i+zof6Pfun3h6rxEezHELc30fviOQ6uXUAxPGD
	nY8hynuMWXiZvOYnupoFnAQ7Tq01PLGBM6/oRI2SXxbqhuP7/AS5WD15jh11vunGGF+1sS5V14s
	5yMXSs1GW1iIkY2d78XV5FkzMpIu1hqk=
X-Gm-Gg: AR+sD11SoAV5G2FnJHBmzrkVtBg2ZXwOt5hyqwdokLEKgcpG8I+F7ktIZ5fjYTXwslh
	fkNX5Swjj3xiEN/9UgajhksKzJQ11sYJaujujJkInowpJue8uQQNTQIVpLiE/68o+utyx2BJwLT
	wD8jVH6+KfXq6FyJfE7UsFMKGtfuQFEfgyLn2OMGJtb4r3g1pFDJ3GO6BA2Iuhy6Ygu6pK+MGr6
	cfET5fSBJag2s4yEObCm55FbeOjMjeSYcA6JdgHIaxJfmG9A8eOq3ekhj8NhMfPnL/mVdINRROr
	+Pg+MZTMXHoGWSsa5EydXYbzUjOPcmXQ02KzpNxDznR99d17UL52+uuGO2r1Bz3GzPkTftVE1Uw
	ZiyDq6DCzg0Nf5Cxis2Hs1TiiK0FQmpeAhliaiXQrKU4+q5ipkvZGlxvs28lD
X-Received: by 2002:a17:903:4b2b:b0:2d3:a50c:5e19 with SMTP id
 d9443c01a7336-2d71e2c078cmr10095615ad.1.1787756767876; Wed, 26 Aug 2026
 08:06:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260826145832.42387-1-elouandacostapeixoto@gmail.com> <CANiq72=NtS=YHkCbB3ui1vVkHoVpHh2S12XAC=0vqHcurJFX+Q@mail.gmail.com>
In-Reply-To: <CANiq72=NtS=YHkCbB3ui1vVkHoVpHh2S12XAC=0vqHcurJFX+Q@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 26 Aug 2026 17:05:52 +0200
X-Gm-Features: AcwNN1UsGpHEz0OUQTEfI_QDht3IcZH63XGHNlppQWaLF0Cq9K4L96CS48RPuPE
Message-ID: <CANiq72m_XpF=ROywGCdz4vqu3TYPeN9uzvHG1NMyepWOZq7FEQ@mail.gmail.com>
Subject: Re: [PATCH] rust: zerocopy-derive: Remove the BoolExt trait
To: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>, 
	Joshua Liebow-Feeser <joshlf@google.com>, Jack Wrenn <jswrenn@google.com>
Cc: ojeda@kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2026 at 5:02=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Aug 26, 2026 at 4:58=E2=80=AFPM Elouan Da Costa Peixoto
> <elouandacostapeixoto@gmail.com> wrote:
> >
> > FIXME comment was saying that this needed to
> > be removed once the MSRV >=3D 1.62.
> > The current MSRV is 1.85.0 obtained by using:
> > `scripts/min-tool-version.sh rustc` command.
> >
> > Signed-off-by: Elouan Da Costa Peixoto <elouandacostapeixoto@gmail.com>
>
> Thanks for the patch!
>
> This code comes from upstream, i.e. it is intended to be vendored
> as-is, so if this were to be taken, then it should be submitted
> upstream instead.
>
> Having said that, their MSRV is different than ours:
>
>   https://github.com/google/zerocopy/blob/main/zerocopy/POLICIES.md#msrv

Cc'ing Joshua and Jack for completeness -- the full thread in case you
are curious is at:

  https://lore.kernel.org/rust-for-linux/20260826145832.42387-1-elouandacos=
tapeixoto@gmail.com/

And I see Sashiko doesn't know about our vendoring -- we could add a
hint to the prompt.

Cheers,
Miguel
