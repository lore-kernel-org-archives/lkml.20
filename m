Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794422717;
	b=A/Y7668ANC6oHpsxwHCF2zicfqgzxnEZk9SbuysIlw3d1ZUV8kJNrF5bmqQmkO9nZlxM
	 isikEz//MXOu9sqJCazbG3bcnfjfhlcGo1AjE/lEULxAJzWUFMTboc9zNpyFAXPC6Ulps
	 czmyPWwJ+7C2r+iGBqcwYhryyM4E3VZZtEI4pIkFyfIaQjZRgmLRG2xq4O3U5U4gzPW9M
	 gSLZkI6IlDIinfA3XiQEfo19XbOK5h2+Dgip+Pg2wgqErY49fufwZKRCUcyHnfmEoiNml
	 +EyNg0d7vJ7BphK67Dthv4/ieuPHucD/CyIUqMlWhb1B+J8ikzn+Bw0Vu2bWtuAJETQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422717;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
	b=MN2sFnaWeI12S3q9vI20lraBuO1uqpZtg2UKdCK3TQAl4HpEstYgmQMQdt7wukUexzkI
	 tlIWClImOGnGmueyJod3lz0mSZPnfmlFptXEMQwZShP4rUIIwdhtreroj+ysIeZo+Wa9L
	 Xwwe7ByxHnSCicLeN5/v/vN/v2qGy+zwwzJVBxP2DJylluDfgGg3/a2sXeJeCefC5WEJA
	 ZtR0Z01Teco+m7QnKM2MWLedFxuDXj/aRDCtaanE66Vocb4CE6YXGfDTJZcUvep7xidss
	 u72F3EVXgNzOrUTGU7gFQr6GHHqdW+BXhXV5PPRsNSoFadGhRZzM7MkhFPOrT1tkFIA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXXM1Ttj;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56D606A324
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 18:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C56D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=JXXM1Ttj
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-491846221ffso2453775f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 10:45:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794422716; cv=none;
        d=google.com; s=arc-20260327;
        b=O+fIqzDEYHzAdcfo9RNqJ7GTBDVml7cnmfPA5TDFCJzFhmy9DPl3F++O43gC9qPkxj
         ZEl07d3O2AFXdEjBFmik9n7G/bhtKX22bqvCWfv+BhMAmFNxGojIRmlL2EswafiWgAr2
         fQWsU5x01R7ZXQ628NHdEpmp1365GRJ5+xp5nLD2sZ64gu07HeMJPabUqoq+EDVGnGr6
         olmfgIJr5mBkAeD8ziHfrSafuva4UtrjfPdQK0coZw0lt6+fwrvu9CxkEpJUM8PXtCS6
         Swscsbv6vwB552cFj+qcBlgDr4c1YEmmP/XTcbcDhZahQrVXoLasT5hpNRZXFP6TnSBF
         AFCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        fh=ZNqTQe9q8JwlvAKIpRSswRKKPBh7vLJlKoPATy0ySh8=;
        b=Vx4Ke1g8TBau4gW5WkGvSpmjZz0W3G2YhliOU6jXx3dEXvFnPIDLN7yfz3QsIgI4kT
         JKMjQKlwMojA/B2OLT4EiUxpTC3kN9Xc2iGEDbv7bdYQmfsqRCXK2v68FiPKMJUGwTyh
         nmxF6EAmF6q4ysihYcYYdXYACSjM4DLqqGOK1bfwKvBLKSg6YGWDG7AslGucSlPYAdBK
         iWhgUKvFf32dDI7YKlOCusdQGF0autiNaRSev0B0tKyv5pUqieu2PaeZ+UZ96tK3+kZz
         iqc4yuh6eIugqw0bzI5WS4rccIhT54VhtojZjYLVWb0f/SqMpH/G3t75sJhCaBIb0U+q
         3DIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794422716; x=1795027516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        b=JXXM1TtjDXwiDsfLqVlRuk1lVGRHwb6LfIxwSfTu8ARBL6aiD20t6U7AJVxFhPkBtM
         RYtrqICSag00Hg+2cOlBon3aDKhEb1FuYHTu+iNWhYF3blrYV9C4JJDS/FD1KYUMgA1j
         3QGKvbOlM6zAHaLjPG60Ao00OIkntbDLz79n73rFB/Waf/N3n2D+akPsVv3d71kuI019
         Hhv0MgY4cdXV08+w5MjG959J4rGhL01/xOzApzS27IOzenVyxCHEqO4277ImmzxwDYDf
         Wj+ixUHTByKcUkK8xMWrhenHEI2c0anEWiKNTwdn+/mcHo1QTDfLxGvvyuvivmb4wNyT
         R5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422716; x=1795027516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qN6v1dbYSFGlwHtt/ghkjuZGFvfVELfCgPaf7QsuhL4=;
        b=WZzhjTv44YxALBVssV91fe0iMZ5N88N6crKY+e1h3aEbkF+x6nUaE6+oa9Hr2xAeqn
         PVoABHzo38TX3qmwdOPxEr9lsx5JsfqlsBLVESWMv552PohTR42eHEAZQ2M6IGs7qZO0
         0WOU7LbyH7zYoTvBI5Yw+dZ3ICWPwqhAIK2PIak+pO4S6eDdS/xGIBlqPEmU6P1Hhe1x
         h3w28MG35QVkKY7KhwtRuzGzeT4RFRp8P5wQjY32lTCjH8lHUoh/ODmPBzYPVxVlTiY6
         h+OsHWf6jATQpXojtqrVm/JcjiXhEY8m986EMvCdH1F2PGN8GR9IXJy8DgZaKsMVpukQ
         PmMA==
X-Forwarded-Encrypted: i=1; AL+hErGVoiJr487RqeIX0gVup3okI/xKdAwb1aJCqUGe2MicyVFXLWBHjH6btiX84/1aeg9h98ilD/n/u2S0d04=@vger.kernel.org
X-Gm-Message-State: APuU4Z9DkSknboCXZW7zCIBNZ5AykORc90ouri14stSzJagFJwowyh6v
	4U3z0gXdyIkhooM+vtvGcjKr9lilvmGYnvMAAVjt4cbaw63998782+vF2mhFYiG8t/+y2hfJnNf
	AOKmiTwDNsYmBvUFqhgBE305VrPVQXqFtVOEJl7pj
X-Gm-Gg: AYBFou35F3z1ZwgOAVrYrl70FPG/Uvkdeoin2ZaEs02VqiI5XLFNUvlJa2x0DQwNagB
	tOcpSedFwaE3CbLeD6V+tS+1f7w4Meh5sqXfJL1IL8OccPOWfDSPnZEJ2BbEEql5u/l4w9Toqwo
	1LZPSg4Jw3VvzrV/2MarR8vtGfLDLnQSeDdnDz19HbppEluKI7td65QmRmqXX8/ixJ/IKueBoIp
	cii97HLeIwxVqkSJPVZeLjd8g4+v8tyAQFRFh8RcHCz2ZKrXHaIO30He1p+jL9im3fEEtS9z8AO
	GXGVkfbSU4hj/yfvI7vUbFzeOpT4Q3Og1VHSp4z4tWqzIFCqFVk1/MgyIscPBlqaWP46Mh6uBgE
	/VVRyEQoua7Z3vM9UQyK5GLVwbsqsOadteIn2pWXaY05qxGJIQzrXQENoGmaTmFN85axTjiTBM8
	Hh4Es/LM+uv1SrMD94CqxzggbEFcNZnno0bprKiFhoxOPvyn3sngQvLtITnDAK8s8kvmTgvZzpX
	2RfpWon1LdQVzBWhyzqVS+1St2wCG6lutd/pw==
X-Received: by 2002:a05:6000:2003:b0:490:50c1:f359 with SMTP id
 ffacd0b85a97d-499c708323emr6448339f8f.39.1794422715208; Wed, 11 Nov 2026
 10:45:15 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-2-6d4fb636290e@kernel.org>
 <CAKwvOdnFG1ACEvGPXGW1XK_3QN+5UaR_9EumhmrsyKOs0aYCPQ@mail.gmail.com> <20261111183611.GB1452558@ax162>
In-Reply-To: <20261111183611.GB1452558@ax162>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 11 Nov 2026 10:45:04 -0800
X-Gm-Features: AclHuK_9r4Vz5uKygUGZIUoOcqYm2micCjZcbpAhINBsrpfAWKW6AJJEGMK37sw
Message-ID: <CAKwvOdnmJ6TCdtr+LPK9nBtwF24QY6-cQA3PRocuvd_gQUpJ9Q@mail.gmail.com>
Subject: Re: [PATCH 2/4] scripts/Kconfig.toolchain: Do not dynamically probe '-fno-addrsig'
To: Nathan Chancellor <nathan@kernel.org>
Cc: Jordan Abrahams-Whitehead <ajordanr@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Julian Braha <julianbraha@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 10:36=E2=80=AFAM Nathan Chancellor <nathan@kernel.o=
rg> wrote:
>
> On Wed, Nov 11, 2026 at 08:51:05AM -0800, Nick Desaulniers wrote:
> > Jordan, I know you were playing with -Wl,--icf=3Dall recently.  Looks
> > like the kernel does not use it; AFAIK, no one has ever tried.  Even
> > -Wl,--icf=3Dsafe.  Worth a shot to see if it boots.  If we did, we'd
> > have to update this kconfig check (the linker flag is only supported
> > by LLD).  Even if the result doesn't boot, it's perhaps worth doing
> > builds with BOTH to see what kind of savings are possible at the
> > limit.
>
> FWIW, ICF came up once before through OpenMandriva defaulting it on in
> their toolchain.
>
>   https://github.com/ClangBuiltLinux/linux/issues/1341

oh, I forgot about that.

maybe worth researching at some point. Low priority, but filed

https://github.com/ClangBuiltLinux/linux/issues/2189

to track this at least.

--=20
Thanks,
~Nick Desaulniers
