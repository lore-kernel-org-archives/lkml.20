Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BFB49E5E5
	for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792062340; cv=pass; b=Wl/JzJRLyNDcs42aQt1z10Te/70HBo/7hk1DZJz27R81hFXF3trbVod/Wig/P4OrTUwOCkMlerjxc7ULg+vT7RI53PiVyE8OIO7XZJkuF2dGnqmHGAFmXuX2QwZAhD6vqJuWTSei/fChw1THWe7Z/gJDIypc8z4TI3qju4y1AYc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792062340; c=relaxed/simple;
	bh=yPSLsauNWO+8YHpLu3P066P8SvE3P0pPuLQr766NovY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ni649TGMCeF4PitR1WEUgyuXDVc/EMYhHvRFnZwhcXBoOfnRAjPJntSG6D3/zLM6wyocH8+weVoMInEoLXOcYEfukCDDaWwAhOMcAbHw99z1nySC9M3Ipjbed2zZyfPA0TZvX93SO3k0m+Bi7WaVVeSUF8/kj8bmEyD6oZcqLjI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xxeg+l4K; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xxeg+l4K"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6b1aa377c61so6274283a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 Oct 2026 04:05:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792062337; cv=none;
        d=google.com; s=arc-20260327;
        b=RH6at4qzxDZJVQn3ujmCk8yw0wnwJwcW3b1SXdT46vJp195q/CJiq1n8EwYEE9lUUa
         CwlSah8D2SLkHsp4ZHnFFPNA1dck/wg9S5nXSqqSYg/lvFxGVAksOiGpj3CQIvwKKkIJ
         kXQW4/vlcWwsS966+FJSA3Ko9ZdoR0DskKjXKkgrbCR6ZXq0955woeyMx1+lFbAR5oAl
         D1C1vPKtf/jE80NNBpdY8VfJ+9fn0weALdCagn1I9DgJt9z03ixcM9G9wX8GEievtijf
         5/Vx97PsQ/VblW5LJkKkU7fglJgVLi0PKNknTH3T59ZjMg8j+TrF9kA4wbFiDpV+kx71
         nPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rt6zLrcxhkT/9F91e1q6oOlpV0iVcuAdHVJ3g/kDDn0=;
        fh=z5B6wVRFvvQF7yhUB4G3DLe6ELidVBbgYpODWYvB5p4=;
        b=TYBp1RL5xVU3f2XucS87qgq200kMtn7Za3J15sNkRaS9sy4tMIy0gBXvoXv+y/SPwN
         2i05MSIYK5F2RH7WwsjYeRvYPw5pzEhiXWkTG8y68eLvTtFwfaYE4zKAuAcwufxZyyXG
         SlBXe+FBzm+JY/Ksk0f9la6asmChxWlTHDdxRvybPALQUDEb6wzNjDvE5kpwC2knrYJT
         +blHtli5j1r9e1Ng3BfNPGF5hpJFqluqJz+SrOvsQuvq60piBARoPwxPaBNGAbd67dCV
         QXfoeIRYOo6OrnJoNbsWF1uZ5c+z4jjuz9QklYFFlFWwmG1MDYQNLj3YT7Y5LKBbYnZ/
         oRTA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792062337; x=1792667137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rt6zLrcxhkT/9F91e1q6oOlpV0iVcuAdHVJ3g/kDDn0=;
        b=Xxeg+l4KOR/hsGeSlEtXAcxY2ztBs/3XMF9Zf5ioIf4704ptJCJ9M0CbGOlx+WtEg4
         pjjTBpvuLzPEZ+R3zsErZQqDbyGffSeDsMIO2aNLa7I8i7WGf0EELZibZoIUGPTNz4Uz
         kAo8VazbOQXtmOoXZBr64vKG/t+mc2sgPOTHgeLEbmJhtfwjhU+cROP1zn0PU9xj+UFG
         /AFjLLEvuutKivJMy0178xoMDWnUkMjLPCJCKaQ6E/ZCTp9hkc7crEyha8UHVwlpnNQI
         kw51zaMdvwlYgcblAxEc4+3oZx52SyrTWG1H3tDDu198O6pbsRQggTJhoMI1ji0QdPGK
         qz/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792062337; x=1792667137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rt6zLrcxhkT/9F91e1q6oOlpV0iVcuAdHVJ3g/kDDn0=;
        b=sXcfMmpEIk0kTHuW3svlWbdgLsAoZF+4ycKdf2NR5dCXWZq4f218wJA4gehSYmUMh0
         RxVRBepxsXcXc2ph1ixudcClnj5G2eZyoF1vsm/Ak4PhKcIVoDPv8AAWkV4iT9MACsPn
         T9EBivX0k0xTl/OjjMC0QJIaeVB3c651zoQaPMLQWC+5gvSitadfhhN1AeAbl8cFGD1T
         i4SxLGjMy+rUcp8scIj4PinS+KT6VOVHupSfezRbnW3czfMkt0fKzrEZju4EjtwxDzf4
         nFALIAD48J8IfUEAQqq/eKhQdVZ8Tn2hJq0HifRUAMaf67j4UbwTuvcb3bc/O8kEFQa5
         iX4Q==
X-Forwarded-Encrypted: i=1; AKwUvBy/zf7UdH1mwalj8l9qUlkbt5XT1oRxr/SeNe4+Vci9FrzZxu+nC7SVTZBVjGOfPXfppgk/QLkhp9xJpYc=@vger.kernel.org
X-Gm-Message-State: AFq9FYJOpdb7Q2mPb+vJsX+Os1YuZohBhzACoMuGuSwke2qrNhc3xOJ+
	Q0E3gmNSaeziRLMoqozyDqRgYiZkOQ+Q3sqmezFUNqWUWe7vCgHEF+Ndz3LhE+Ur5WVSx7kBALE
	pzBuRufF2urAqoo4FF0BsQ8+4/ib1sBo=
X-Gm-Gg: AYBFou2BsHYGjrEs2SnyLdtoSU5ipLN5c7TuTJUxjhCas6p2kbz6Y12Tp2UcRBSvPLi
	JssDXfCjQqyjzMB5Hro5rTV6kb7hHo/DcBnXv9EZ6QrQ1VijAgfNEnMNlbKrwDdENtOM9BJVdKn
	RSg7l4qw4CfF/och02IAKszWBe0tVqofMJwjxzU801e9TnCI9kmDqJ3/Qm6AL8XAQvhkFk/B3iW
	qj5kNnlup+Sjaf7CZap7O1vB6H4jMdMrpplZ1p35wIk746UjZFUXFaa/9fkB8B+bdqj4qwMLlKP
	ff0wfWqdcH9X0TUPpg5ODAEj+/41WfubOOq6V7A2QlDPkzlg5aaJFQYGd4jsG3tPGpGGkpVT3jP
	1YP/eVyZnDXLt6Wjmv23u1KTEVg1gbsopsV3wEsQBip0UhfIZmDEn9k0eNaW9L5istZ3CMJEcSH
	g=
X-Received: by 2002:a05:6402:52d8:b0:6a7:ea54:38f with SMTP id
 4fb4d7f45d1cf-6b17c272132mr13118289a12.32.1792062337050; Thu, 15 Oct 2026
 04:05:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261009165710.1320233-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMRc=MdcWS0c9E0V3cJj9B9WMAe0vSs9e2s2EauRH5zFkOng+w@mail.gmail.com>
In-Reply-To: <CAMRc=MdcWS0c9E0V3cJj9B9WMAe0vSs9e2s2EauRH5zFkOng+w@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 15 Oct 2026 12:05:10 +0100
X-Gm-Features: AclHuK9XNtyctc4-zz7ILqGJPTJfzfoX5rtUFZXlnBV5qOrrlt95vuLzAJaAEjs
Message-ID: <CA+V-a8uVxwP+AFbRYb-weN+EHQ5rFxo7gXPus4muSrMri1QAAA@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] Add ADC power sequencing support for RZ/V2H(P) and
 RZ/V2N SoCs
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bartosz,

On Thu, Oct 15, 2026 at 10:43=E2=80=AFAM Bartosz Golaszewski <brgl@kernel.o=
rg> wrote:
>
> On Fri, 9 Oct 2026 18:57:05 +0200, Prabhakar <prabhakar.csengg@gmail.com>=
 said:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > Hi all,
> >
> > This patch series adds support for ADC power sequencing on the RZ/V2H(P=
)
> > and RZ/V2N SoCs. It introduces per-SoC probe functions for the
> > renesas-pwrrdy power sequencer driver and ensures that the necessary
> > Kconfig options are selected for these SoCs.
> >
> > Note, the ADC driver and binding patches have been posted separately.
> >
> > Merge strategy:
> > option #1:
> >  - Once the pwrseq-renesas-pwrrdy driver is merged in only then
> >    the sysc driver can be merged via renesas tree.
> > option #2:
> >  - Merge all the patches via renesas tree.
> >
>
> IIUC there are no build-time dependencies, so the pwrseq and soc parts ca=
n be
> queued separately?
>
Yes there are no build-time dependencies, and since renesas-soc is
closed for v7.4, the pwrseq patches can go via your tree.

Cheers,
Prabhakar
