Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793924426;
	b=vnKZgTpDCiAg8kMEv1dDOeuQSxWwNMoXPIV7vqeRKYSolCRweu5Vm/uJqaKhxNJGBSsG
	 PoGiO0gkH8t4AQAFNrG13VCD1epQOKHGpd6puDhpk656PTdExPua3wBbD66ktLVXUThBM
	 ODL7fef77/h85euTUbqKfzPMOtj2nzCZNC7oiRFykfMyPmT2vWBbZ1mm1rpOCYJbsTwxr
	 IIWHt4LGgcaFrJh3CXsFW+rB+MNSVr2bvJolubk5V19MtcV6dNbt+3D7C/xnD0d0VJtr6
	 ZZMhB+0xMAIIUUEwOWorJ9qZzFkWyfYZRGE+Nz61VBzXd7SCNpy4cO2A2GjqYoslqJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793924426;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
	b=nYPCORiP2CaDlvltswWV9jWnJNufp2+a53ih1GJTbd+Bb5+emHS7VdYDtUu0oXw6cQeV
	 I1/vpVjpZJQ1gh1TK6TFVNJpaoqDzA5T3YrA3i8cUjyS1Lw3NfD/ZNusX2Rvg/ITn/Jei
	 GbtOZTvN8vYg7RTN+y44g3R8+TbseBQ+2gjVZ74HQ7cIwDuGwNA/BGPbET/HFRWSmFK7U
	 zVZjkGAF7oWszNEkOXs7R7tgI5bqUl9Ft7C/shW8zSLsEh3v2jehyaw2/B2HocD+Yk1Lj
	 i4gBzYdB6PDnHOp7uC+D5VEHEJxf4X65qHZfeel0zFnkFx4MKHUT2kXlCXCg7tmcF/Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fay24KIV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748D8606A32C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Nov 2026 00:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 748D8606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fay24KIV
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso55129f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 16:20:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793924425; cv=none;
        d=google.com; s=arc-20260327;
        b=hHLHVT+dgtM/4UQMe+ruGsBtL5VQEOBM4L660+5PUj0mZV1I9ZGdgxRFrzxGZdTymU
         4h2GTe9oU5FSXzp++Crz1uo4/ZxctGsdNuiFV4dIPJ+QeNZkeMBVSYNIbLTdLy1t/Lm1
         owXbHBK9soC/lhH7IbYeQSKsDN6+2pKYEzO7vvlpfj8tK5+kbAWVUKeUSvlH6WOUUZjy
         aDSkCmV8/AKGRU6iDcF3hHB3Glpslf6xAXDH2AJyH0ZjlhevIjrs02AiGfLfaR/xKMNR
         JWl9vox7R/3ZJ9WeHs4uotaHQmbAfYfoqfpNwVVLfjAFhJrTgrpiwqfrZ4D/EMzDShdy
         h5ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        fh=0QHtjwvGtXdd0bsVfSt/P7XRE/IGECiLo/Eiab/PLfs=;
        b=BNPA1eXrJJZnuNcan9JPWtBZJOvtnvbdGbA6No0RAonljZdYBQCW2j22WosEZdQQ6k
         wSvz2oiLJwfw1ESHh3hKuMLV513ykM1KLuyC/VvEDj1/z/DserN9YBw+jeIxSlW2sd5q
         aJyETCZ188iJpHswrz3Og/HNJFm38hip1MLS351dbeF3DiLrxaO8swo47SDna5jHQ9Yp
         LZ5Bp/KLjgnBXoApf85LdWnRUoYL72ephva4wXw/N85Iuncqjuq5pr7eVW6Jj0fXkMuo
         MLzB+ZjpjSkMZQWE+yAkD0idTcDq4cqZYCfYLhE9dibYlJZQQd0p5UljjLsziDJ0KxXT
         FaQw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793924425; x=1794529225; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=fay24KIVxX1g2XaFUPj+mSXS0xXbKerfwx/+Af3Za6F+v3KzLCVGFA82hk3eVshmQI
         l5D4k/97mNlDjxYLlOZUaKQc+7NUmJlY2NoX4n9hri/6orTNKUxn8wwxy4cxZ9kYH2Hq
         O+puo6RCbSeCUfhHi3T+TA0HKeQ82eLArpjTIQ+uaFN34+nCb5OSArcPlM/Kv6xMLab4
         1QY5Aw7vRJErWJ+KkwRK6hJ2VW2adTKLDsM13sc7EFcMx3tfROJ5LPQ3c0I1QdtAxW8t
         IymtPLLzIfLeQCUkKKz051D2HX3Yy1Xb6F5Ncs3S3+i+DUxWATCarQ0JUC21JHU/L/hA
         w4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793924425; x=1794529225;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e9LMdmFOmC6rg0VE0eXoC2u7iQIIpm6odUVAIwSl6rE=;
        b=ett/veDT8840+ZQafqv6qzh64Q+Q09af84pQaol9zea+MHCXGaerzMk3XtW+2tWMyv
         xYPiqIs2NKwwFUMsD87mnilcaDzq6eEb1PNesAfJ6kniaF203sC89E6eCNNtW5Qt40nw
         8/x/S55oGelNiS9bwfKM9C7VIYUiWWxhu0ti7iPtVTpDWW9OLCuh2r2hZH6R/PQCxI7s
         PZNpm0y3UkR1UnIYQ0yqZvz3VK13f1AybISRZ+8cHRbDZmVqnfl4bsO2XihDsxXPEn0Y
         haj0WEPDfNM251t/saTR+SXgUO4ntca7yKgIkA4x4TvCD0X6xifK9LO2Yn51UUemc7zE
         LA7Q==
X-Forwarded-Encrypted: i=1; AKwUvBy2kgkJ4FLcXCCOrlVSDXS0F5Wv5UsKse3j+w0v2AjZGiHi7CebTR4glHvQvBOpQXXv7PUAS6/pJeb9+oA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/nMV4X7z9Ur6cpZ/yCfV4F1zEqpbbV/IVlySGlGid6Arnwjx3W
	HvihAA3dyx8fEuTnmd5hVbQWWNf28WYbpy+++X7SveupNABgz9HBziobhsmB17tC2Q2uG4FAqDQ
	ZkUFTY92gMD67e+/ejGgMHmS41eDXV3ee+oPIcUh5
X-Gm-Gg: AYBFou3NXxQx3VTuE0WaOnUt88zT+FntgpVqk822cn5gS4HFrb9jQ5Ro6E3lxteOLWa
	ojAooqC5SRnR+mY/st15IpfrqCX3zqRrp1SS8+wSE8pMc+SgEX9z1eoiIflCk15XWqAoQInEC2t
	5fLRe82lpbkpdBzK2VBfc/JzLsb8o04w4MUcvLC2RAPkkGlI9F0MlY/If3tn6vUkvePjdRuZDZn
	7X/ZKds0AoV5DxeDvuVmjZ9NpPmjuBzabmugAti0Z+scsaoSTHlasXo3pQSoLWDFxAr1r/fWfYm
	enk7H+0kPKnGcHEd24TSO14uBSANZToCASOX97t6r+yWUoOmQKi6Btsc5bSRAvaopPMbZQr7Ux3
	CrLwy1E5amiTSkNS5kDLxcYaGA2AaKHriUV3JqYafw3zHMZ3qMGpARx5UpfpvghKMw6lVUeXa8M
	5ibvI2OEIIfdwnhslc9hour/gxq9eGSbfj5nFMM4MPW5CCxe+WYMD+sp87rDcxmu6GaEisOByOx
	F/WzngtQBQgZPp2uNVds6O9f0WVIfmtigYX
X-Received: by 2002:a05:6000:4a03:b0:48e:412:3829 with SMTP id
 ffacd0b85a97d-492764aede3mr2311906f8f.15.1793924423911; Thu, 05 Nov 2026
 16:20:23 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
In-Reply-To: <CAD=FV=Wow=+pDDu=RHkr5nekOjDNe5wGr+WsV_WFgh4YYnm5Hg@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 16:20:12 -0800
X-Gm-Features: AclHuK9ycOqos5AEuWbFkVouFGAMYO4MjJByfnQj2RCd2P8bwTy6_fG6ZmWTcd0
Message-ID: <CAKwvOdme+2Lrm7Ds8vp71WVzDXfW61o2eFRjjtTptpskLTuyeQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>, Rong Xu <xur@google.com>, Yabin Cui <yabinc@google.com>, 
	Yi Kong <yikong@google.com>, Han Shen <shenhan@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, "Sriraman (Sri) Tallam" <tmsriram@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 3:17=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
> > restore the old (tested) behavior.
> >
> > Should I send a patch adding that flag?
>
> I went ahead and posted the patch:
>
> https://lore.kernel.org/r/20261105151159.1.I0b27923381ef34cc99cdf8b65fea2=
e1bafce6370@changeid
>
> Obviously that patch and this patch conflict because they touch the
> same lines of code. If folks think we should still move forward with
> both patches, I'm happy to rebase.
>
>
> > > Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> > > reservations about adding it for the following reasons:
> > > 1.  It is heuristic-based and not enabled by default. I am unsure how
> > > thoroughly it has been tested, so we should assess it further before
> > > enabling it.
> >
> > FWIW, we did find that Android seems to enable this globally across
> > its userspace, which suggests it has been fairly well tested. You can
> > see the change here, which landed about 1.5 years ago.
> >
> > https://android-review.git.corp.google.com/c/platform/build/soong/+/352=
4291
> >
> > A few notes:
> >
> > * That change _also_ adds
> > "--salvage-stale-profile-max-callsites=3D2000". Internally, there has
> > been debate about whether adding that would be a good idea, too.
>
> The conclusion of the internal debate is that, yes, we should add

After Doug sent this email, him, I, Yabin, Rong, and a few others met
and decided we probably want

-fno-sample-profile-use-profi

...but then I stepped out of that meeting and ran into Yi who
extensively tested AutoFDO for Android userspace and suggested _the
opposite_.

i.e. Rong suggested:
yes: -fno-sample-profile-use-profi
no: --mllvm=3D-salvage-stale-profile

Yi suggested:
no: -fno-sample-profile-use-profi
yes: --mllvm=3D-salvage-stale-profile

Yi, can you share with the list why you hold that opinion?

I suspect we'll want to disable "profi" for now, but likely will end
up revisiting these pairs of flags in the near future.

> `--salvage-stale-profile-max-callsites=3D2000` too. So if we decide to
> move forward with this patch, I'll send a v2 that adds that flag as
> well. For now I'll hold off until there is consensus. :-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers
