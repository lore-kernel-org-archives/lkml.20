Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793329875;
	b=A/0P1wyDnDW3qTvlceJJC7hHO0bNjl+roS4lz2KVKH5Ej6J0SzgWrsyLPb9mYL4eB2uk
	 aF173sxx9gIxghEyi64RDC1mMoipe/qSwyKpGH3nUAwMGkELVdk/BoD7QIjkTVdr1X62O
	 Pbyu3eWj3Ay0MBogfbClfgJENoSlo8q+1mDSDN1COpeaNjkb74A6pdLXg5NLi8crQ7rK/
	 MJWG2Wm7FOHhf0pWO5wiAX5D+IFnMV+z1yzWunU8yqauyVdSaNNNiUXaBrp7YIS2lr5bV
	 SBx4mrEMWKpvSDcY+4RA+OBOk3NcPo9XHmW4KmkLcnwTMVCB5bu3RefV/sUsjVL8bnQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793329875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
	b=fqXB/VmoSZnyJY8qbpyn/naEoD5gdAo4Ko7AL6RtBjJ5EQWsX4hUzAFdOXcq6wTzYdxH
	 sjs7crNB1U3m5jV5XJYhbVK6TbboMXuNTbRWCLDuPM6o7t24EiHP/975UFtvsRyOF94nv
	 xBeJ4tcX6kNSLlHf59vwt+yomJ/UNRSVTvoJbBLppd2yuA4BQu6B/wcB5efWfkSsDWVv+
	 uXjI8BllFig5j/idPejuNf+rW4fUSjWiGHw/8K5s+s5RwUpbnscztMdpOFhidyBUL90SU
	 FNRnivplodzydXsoYQ6DCd/8l+riT3fOYVPCR4J1uJkTlMtClyLqK0V6ji2mnzKWxKg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kh2HrdRU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1240606A321
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 03:11:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1240606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kh2HrdRU
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5383c97c8cfso105441cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 20:11:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793329873; cv=none;
        d=google.com; s=arc-20260327;
        b=V0HgrN9RRX+ajj+Ei1ylWZhKIQGC8SQSD+549QObJakDeuyYpeNbSP77ST9qbq6fa+
         F3Lt/pdey7PnmzHvJY4Ej1UXjH7CDgm0OoUbOnHMhSG8AMLvMcecX5YhNZ9+k1kbS4t0
         Ahds2tSQiwmShPn9i8X5nvAjJStUGbqZ4/oYVgrRZXGvH0bUqKJRqRuOiy499bVdz2T/
         pUNPVbi94xoKQnGEeJ8j7fj442gJE0Jc0hZsHKBCpfHfrOZdTanpEQ2+PJublQ1S7YbK
         gZSb00GLBCBhtrlXbKKmxO2WKA/U6tNr5JuHLF/VvS/XSkdB5N8KRFiOTVtVEI+LTsi7
         UGfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
        fh=yIZoC7Z3VERne/FD+qnMDB1DBKoDlOuUDie3WhJ0ec8=;
        b=b+cE9EuK3yKJL+xD4uW7Ykt87OL5cZpBLQXjwfO0j8rIe6T1dkfh9byHx1GCw+X9NQ
         cgV0WmazSLW4c+IBAZvIWljoiO8cV6mE72oAvMfGcHBcq/mZIVbW0N4omJRt/VDIPrl6
         Oa0Iej8Hl52+GWs9gVan8B+pfWOz5E0nQMGoXRpfJwAHn9xuMclCAVuPNiNVXNM5H0ME
         +CCB8gZbmz2F4JuAlBiglGWqPEhyCHM17i4gZ3wAByyRbJhzGH6Vpwoko+SA97UU+U1z
         pVcuXw4H/rauo3P6gPnirAKWipHE+oSHmisckDHHXfulbXUqiHz7hKPsn2fO8pyxjVzw
         GT5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793329873; x=1793934673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
        b=kh2HrdRUmrMNIG/6fwizpyRV2s3ZGcRq8l+qhBw8D3lvG8emEl6JjqraKmxtxX2X2O
         ZVgvajWvOtpUnbYl7ZWbzrX3gx+Nz56XLrBfUp/MmTdYPJ3VGsBg83OgypsE+VVnTee0
         B1zec4y+h6QhIc4Iu4oy6WYjms9OJRLgyK3xNdLlO7bckZRnUc/bDAtF8JBpXU0XMUOn
         1I8oAMJqjNaCzflStpKVCF0Bp9tH4SII9WfY81WZQT/FvfENzypAo+IMJO27Nyr6kjlf
         vYvY0iyeiRpFjkQcCmE8mKfeZW5WkPkXWbwrjjVJ2hhNOQ+832Moo79dOhNjQ7s/j5df
         umBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793329873; x=1793934673;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hoVHC65GR8n9FjINMXnaahKi7WXhnhvguTlzPVQW3pA=;
        b=H7J9GsZWtV5bgi8RG+mthywKitWbRtNaNU35BVeEKj+bHRIbM6gYFChB46/yso6mk8
         Bx7+8E6Esu5TEW/Za4AW/fPF9h5je+oMU7VwxLiG2P/1p4bMUTnsD29zwCDcxGb1Sbbp
         kk+j7z0F3ZX2j6OUNYTi3UXstcVFTtSjmiwsUJD820XK93hZOTM+FJH5Pq2lrWi/53I3
         RUuLEQGSaNWk4hSuE6TOj9Dp/15Ng57wzo12G6jFPkvnWf92pGRr0yJwtGGxaLCgefsa
         bZAZm4dkhoHWuYtUGfkUi3B5+Wiz8rlFF0/1jJmgRMTwYBNprUGsXCu7h9t8xzSwiGGM
         tgCw==
X-Forwarded-Encrypted: i=1; AKwUvByf1I/9afm29h+igv11YkOjZqmOR1iaeA3wNke5ckxRdbeJY5wuJwyskqZ6KJC27XgxQGYwsXH6nIxlcpI=@vger.kernel.org
X-Gm-Message-State: AFq9FYI5oFatbqRij9v57jxD8MKTsMre00HLHH0ofpnVD5qNwfScUcid
	sAbA1ssyDYLBPUPG16YwaPJ74K4ykvZKWPn25ZAkZKRL4FPE7ULAH0s1zzA5rIn27T+Dtc63Nd1
	5/HbdO1K63cA7rYxP2v+dBlV4s7q51aRb4EtYLr4S
X-Gm-Gg: AYBFou1obsmXYIM7pIibLBWT+wg7YHwx3Nk5u4gzKiycuV19cK9iHblaXAylYmj0/TG
	9MfD8dffk73R5dS+UF2dwBMOJsvUfGA0yMIbS/69OwrzF7kzgmML0plp1UFCqELEUaySoYuaMFU
	1ql+LLjcGFYwynl6+Ze2dbvbR3k8Ezvx+XnX9mSLgVVQ/s7vva/N9JSLS74nMT+XwbB+kngpiK5
	/v+mMBDYr0Sa3/YoPPia+fdTIL2Nnt5qAU1yu9rQdIHvhJRIWYWyxzY2vxt5lzmDf63/ZejRavC
	2BD/AX1UYfTnE+GybzV4jTLuzVnPiX/00Wcc90bKnk/p3dkb0D7pdKAvxg6YL52s9OYN2iP9gKe
	2Q3mkpk0VwmBXHBicf4VCBaHn87sm5E32mp9H7Q==
X-Received: by 2002:a05:622a:1b0e:b0:536:6d88:600a with SMTP id
 d75a77b69052e-5414de1cf2dmr34323151cf.9.1793329872551; Thu, 29 Oct 2026
 20:11:12 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029162958.3224280-1-irogers@google.com> <20261029162958.3224280-4-irogers@google.com>
 <d1267d81-0ed8-4b3f-a535-88ddba51af88@kernel.org>
In-Reply-To: <d1267d81-0ed8-4b3f-a535-88ddba51af88@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 Oct 2026 20:11:01 -0700
X-Gm-Features: AclHuK9rCNoYtTV6H1GziiI59-c1QFU3f9f-3J74Fr_QKbxS-WGNb4D7UrtMMqU
Message-ID: <CAP-5=fWaLj-ToYvAowp-_dk5tL-_Ju+i=U90GRK_obFNqn5axg@mail.gmail.com>
Subject: Re: [RFC PATCH v1 3/3] bpftool: Prefer zlib-rs over zlib when available
To: Quentin Monnet <qmo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-perf-users@vger.kernel.org, 
	bpf@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 29, 2026 at 5:15=E2=80=AFPM Quentin Monnet <qmo@kernel.org> wro=
te:
>
> 2026-10-29 09:29 UTC-0700 ~ Ian Rogers <irogers@google.com>
> > Add zlib-rs and zlib to FEATURE_TESTS and FEATURE_DISPLAY in
> > tools/bpf/bpftool/Makefile and use feature_rust_lib to configure
> > ZLIB_CFLAGS and ZLIB_LIBS when zlib-rs is detected, falling back to -lz=
.
>
>
> Hi Ian, bpftool doesn't make an intensive use of zlib (mostly, it's a
> requirement from other dependencies; we may also use it to unzip the
> kernel config on the host if necessary for probing BPF features on the
> system, but only on some distributions). So I'm struggling to understand
> the motivation for your proposal, what do we gain by switching to
> zlib-rs when available? I understand this implementation is in Rust, but
> I'm not sure the added complexity and feature probing in the build
> system is worth it.

Hi Quentin,

At my workplace, we are transitioning from zlib to zlib-rs for both
security and performance reasons. I'd like to keep upstream tools
aligned but they don't have to be, it just seems nice. I agree zlib is
of a lower priority to users than, say, zstd. For attackers, like with
brotli, it is probably an area of interest. Knowing the implementation
is memory safe is at least something in favor of zlib-rs. I sent this
series out as an RFC because I obviously have no way to mandate what
upstream should or shouldn't be doing. There are things that can make
life a little nicer and easier, and this patch series, for me, is one
of them.

> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/bpf/bpftool/.gitignore |  1 +
> >  tools/bpf/bpftool/Makefile   | 56 ++++++++++++++++++++++++++++++++----
> >  2 files changed, 51 insertions(+), 6 deletions(-)
> >
> > diff --git a/tools/bpf/bpftool/.gitignore b/tools/bpf/bpftool/.gitignor=
e
> > index a736f64dc5dc..ea2222373634 100644
> > --- a/tools/bpf/bpftool/.gitignore
> > +++ b/tools/bpf/bpftool/.gitignore
> > @@ -6,5 +6,6 @@ bpftool*.8
> >  FEATURE-DUMP.bpftool
> >  feature
> >  libbpf
> > +libz_rs
> >  /*.skel.h
> >  /vmlinux.h
> > diff --git a/tools/bpf/bpftool/Makefile b/tools/bpf/bpftool/Makefile
> > index b0f7168e7943..a193cf89a034 100644
> > --- a/tools/bpf/bpftool/Makefile
> > +++ b/tools/bpf/bpftool/Makefile
> > @@ -1,5 +1,6 @@
> >  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >  include ../../scripts/Makefile.include
> > +include ../../scripts/Makefile.arch
>
>
> Looking at the GitHub mirror repository for bpftool, I'd avoid including
> this additional Makefile if I could.

Ack. I also acknowledge that the CI failed because the patches were
against perf-tools-next.

Thanks,
Ian

> Thanks,
> Quentin
