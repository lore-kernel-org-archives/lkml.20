Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793918274;
	b=iDDmNE+rMKod+h/HQS4hC9jqtSuNQXunuAHBdlK2mSXoSzpEwXIo24uW+NYPGIZ8cRhE
	 3cv1flvHpItn12eRP7CwO449iQTGTyJv+0HMDieB56ZqxTY/vq+hfGqxEmt18yUVK0JRd
	 kHgbbosJkRB3TjdQ8LYq71cHrYuQ1YYMHkybN93gfuQHbGQW1+b56i7q2Qv3XhEgqDgDa
	 4lGRzaaEkDxZfGvUHQY97RQu2OI+S9yQrVxagzbmYmkF1aWTagAYKmOj0xir4DbXdZoTK
	 LB69arCg226Lf8njWt6xBTmHipfjJ9SteO4Vn3JZnA7ewhAJHiCZe7WwIoIZg47zG4g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793918274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
	b=SEipa5Is8ng3mpTxX/Luanog8qUxM0giCUJriyGFjzyDqP1FPpEMaJTjpqrMJt/tRrne
	 oebvFwFFpG85Uc21UECVocsHXVKp9mm8qRXo4GDYW2tCX7dlDybqykd4y0wFYYYiUWaEs
	 TM2Vl0kQVBls3yBla0zoB+Fxcy0851rEJ5LA/CvgBNavSrBeXQ+2LO6sFENhlDWawuv6Z
	 oa9oSrtIuBv9k2+IximMFLzNMMEaaLiPhYeC80QTwRnET34L8V3R6dFLH5z2Wk/RcfUYi
	 ieEY1HSNb7TPs5xBN+XxpFQZhxBJmW0C9KGjWu/iacZtnBK06nIkCLPdJ3ly9TRjWLQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=opHuLUG2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56284606A329
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 22:37:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56284606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=opHuLUG2
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-4922dbcee23so35512f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 14:37:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793918273; cv=none;
        d=google.com; s=arc-20260327;
        b=eBJ66vpzYPGBNqzMdlKns7w2IMQq4nYhqM+xkSxdFc4uW+er2GgND1GZaNHpntOILB
         uRoHXwMeNp2rcoZRRoH6K26u1YDyTk3ARvJcP8XqgFHh5QiR9W1oo7GW7zFe3oAff3ya
         ve+Ud3lA09DfoL8l8b66yPkOtZdbizoM61DbYsQF9XWxssUPF0yWTBpnog8apr7VYpyX
         GrAiyID5sONMUv/EbTIcSOa2CMf13Yu47SkA5CAFSEixJ3t/QA1PD0GFPpScwDb14ICF
         9apZpD7cMnoXa0CpbfpUbAEHEaXEDqL15YqESxK+b4iMXHxI4GW9fYL4swSE/lb998K9
         O9aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        fh=IuNw6kV5cDU7zaKFvsxiySm+dZL2+ILNgtco6HxnzNo=;
        b=L0svLaVYSP6Nm/z0WhAJCWOOR4oAuKcdVS+HkUsVtmeMchjVvyjCvE2s5n8JbG6KuM
         Uq9fmJm/pXOoVK9J2DFlgfV5ILJTdOGhYrXMT3Kj47g1Pe3BztfHppbXuyUfhOShzPbl
         IM06klqmbZR+Bz6AOuDWmmDgZcSha2a1Sd/JLJ9OsfYV2GBieYLMnh6v+pAi4NngRszO
         pXxPoi0GlGVWxlAKHvxfSRv6vVv6ZjJyNFz2yFLgoHDMvsslf5b6KDKikgKhafZ6tKbk
         tGmWPhVwhXi8LWcALIAmohkOCbtwlUT1wsZUl68tmec/Z/ZkyBV8Rdn+KSMpwFygv48U
         yNtg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793918273; x=1794523073; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=opHuLUG2Ypj1WDXfEVKbren+oLeZ7tTP2atdz9P8ZLVMn5bWP98aqZ2tqSEJI3N2DB
         nuBkm5KX/67E4qBhrw6fnCpA5G1RGMwR0qeTPW7RyVab9S2tsa/I1UBK5nMljn1rMAiz
         XOt13rzEPcGx5qnVaycMfqu98U5KOuu6ltfT6v/2zVzVjuLqtZsfv5An2j9NqccasfY3
         +RTHJYMgNiNMaoUv6HCBIECQuBQzbBkdoRoOoTSc7zjezrVMPd+ax0NUn9lZeT4uE2YL
         6v9CJoYMMnbZH5MEDHwYgIcfLYNHONdgxYICT3NUUtSOaGe1cht0K8hkNmy5Hza0PbOz
         YKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793918273; x=1794523073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mBrXFKwhti0it+UCB6DEQ73OqL5QC614KYotSTfrY7s=;
        b=e7bYFgtYH7HMngxQjfR0Crc5GrxgbUptbYS+HVdRRjwM4MM/+DxiKKL/FpAkb/X8LD
         LOVHMFOg1/6C5iVJTGrm0BfcQfiXSh7+hV2lXm29CxYqeBsLSCUiuBu3LeHALqF+qTK3
         rV/kSxq6ybVD5pZjOt6f+uJ/QjB2WtjEaKxKZPw+0BCEwdxncKHwJLiSZe8Fq5V6avTZ
         yVA3pA2n8uykXwnUXYqw9SRPGp75ARbp2+rKSqWXAQqfdqB1dDXalmCCyxTLcNQERKqu
         q2EAsvduo94mj6uiT4Aq174YxbHFYeu0G8fUZPRJz67HQdOLXAZ39mLkmsqXQbYu6AJj
         iKeQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/QdRV1dSZ4gblluFHsadDH6Kb3/r3AyOucjO91VKDBW1QpUMNHuHoY/fXoZW9oqS9BShqJDI0Kpq/IbU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8NocigAk+HI6jTh8mIxIs1oQp5kBHzG8AwusSTBx6dw0ykSFJv
	gevQhOVFSSRMX+xbyogY8cd1PRs3aDyCsYuQPuPWz1RoGB8zV/q4CknmM5l83eldVfa1Z+xHNtI
	/XtBdTfYCCkXT5TWRU0LVLtp0ZOX59qc1WqlKcqbz
X-Gm-Gg: AYBFou1y7j3M5zHI41PvCqXnNdVdTFwWtKROvIUXBdRdnd16IgPpLppWA2790KGu38Z
	NzjnUrGMcikrTpBp7Slj8kyHmBsooofLXanagD82mmbXaGxC5vzvTnU2RTD1Z11uqVgoBS09CZv
	YKD3dZ25voRKdTwVbkA9gLiXACIzLAFMZbfVVmrOmr0V8pj4qhGMz4WxcRQig6IheGVOKwDrh5W
	NFh3brLbvJOjjvPNDIdQHUWbzYoz8fuWCPlLLX4hFQSIkyWjXyrV6SkfziTGtrtgXg6x6zkPr/C
	d7cDrBbMf9bsfniMTmZNUEdbQ3b4yeLRTo69mxAZBgsrYyuvumejOqNJ/693cpNdU471UxalPOP
	rqotDbhecLUFtQ+76sgIWchnN5J1sRAJrtjISi6QFKiZoDkLLIr3oCGT08QWcUaHP2CJzDNU8FE
	EMli+Y4xgv3olBduvkqj0MJk7Xag5e3cLH2P5U3gPvfKju/iPOUVZafwHhfXQLRcJ2xGsK6dgCy
	eT1fPOFFXgwOj34934PsNtalT6dp26+qv/O
X-Received: by 2002:a05:6000:25ea:b0:48d:f39b:83de with SMTP id
 ffacd0b85a97d-492732dc7edmr1852328f8f.3.1793918272221; Thu, 05 Nov 2026
 14:37:52 -0800 (PST)
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
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com> <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
In-Reply-To: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 5 Nov 2026 14:37:41 -0800
X-Gm-Features: AclHuK8wUx6mjaq5nmDzGyrOyknjILFX8cjQ_WCJLMf8UUGbwiTYmUffT-QGEo8
Message-ID: <CAKwvOdkRAB7QUApoYyKU456GF3bY67PKqQRfbtmW1gcFbpAFGQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Doug Anderson <dianders@chromium.org>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Yi Kong <yikong@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> >
> > 2.  The recommended usage model for kernel AutoFDO (as documented) is
> > to use the same source. While it might help in an iterative build
> > model, I don't see a strong reason to use it if there is no source
> > drift.
>
> Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
> for the exact source. ...but from my experience, that's not what
> happens in reality. If nothing else, developers locally working on the

Right. Rong's recommendation makes sense from a google3 perspective
(who I suspect is continuously regenerating profile data), but isn't
feasible for Android or ChromeOS (who are not).

> kernel still want to keep the AutoFDO optimizations so they're testing
> as close to what's in the field as possible. However, the act of
> working on the kernel will touch _some_ of the source. Keeping AFDO
> working as much as possible seems nice to me. Of course, I'm by no
> means an AutoFDO expert and mostly just got dragged into this issue,
> so happy to defer to the experts. ;-)
>
> -Doug



--=20
Thanks,
~Nick Desaulniers
