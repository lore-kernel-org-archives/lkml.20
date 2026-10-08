Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB1331F989
	for <linux-kernel@vger.kernel.org>; Thu,  8 Oct 2026 02:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791425465; cv=pass; b=NeOzakAgCIStDSGQ/nsDLMksK3ORFiyzBfv+wmEaXi7cShX6aTdVELxT8R0ayd+wb9b9aMAjBvLKFF+Y1ystbZYma8gq+NbLvI0862g8uV55+6OaWf/+VnOSwCQ9ICb8iNA3gRQ/N8yBB9gUOmTq8kRf2wAWTZwCh8s+3yaHgeo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791425465; c=relaxed/simple;
	bh=tRcdTjRQ5UTW4DHDrkJ/ooF5c3DO+DoLfJDkOdlVFZI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mDCr3Clw4Sz6mHd3IVB82qRkA+5n4j07vF5JY0lIuGk83IafO54ZRBGuOq0MKIqNVcniZuPtMB+QUooPyyf9sWoMJn33WYK0hnAmAfZPQbYsJg0qwwI8c4waunPa2QB03bP0RyO2Sp8PhOwvYZkwDvEgsHvfltVmumHJBikBrI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I5EMnMyN; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I5EMnMyN"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so3479a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 07 Oct 2026 19:11:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791425460; cv=none;
        d=google.com; s=arc-20260327;
        b=mgtCX48kdTg9CW1tClPATIlS8sNL1tWM5TrD88WaCgG55+k4cdL5vBel9Ks3MG6X5z
         q799R2yvPh4h39cYpMiztMYP+BU5XxEdf5XVy70t13GeaK9IM3c7Hq5eqruMLq3mBW+k
         9ZOwuBX3T6LodiH76Zvq8MVmTRFUNvs9DkmSXi9xnoVDw7gLMRKLDnKFQjoKat3oYwhV
         KOlGLCGZolzE4+UpZsGqvDByeXBZ95VQdKWUx9VXf8B++M9mkwqs5GBUtCBvsogtzQ8x
         wJ1wTTvDqbHsCVo+q84t62wfeLpLTbim1TiWtPIMki3+EZ/yagpiYLBe3jpVw5YI141M
         Cgvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mlmGRFd0U28wTy12oRP1z3Eel/hj8TBM+KWP2O4byi8=;
        fh=Ih0lihuM7YYYHLINnNXqefWX+5R2z93zBhSt5GZM5NI=;
        b=s6TevpfINMnoqdc0dN2UiqB0R1hXt/MgLW09WWcLCyk+yff4W6NIGqpOB77B6ezhac
         QbZUAih5LDkHVQJgcxEhhHFpwb2xHvngFJTC7k9kxztC7RHjVhGmzf/I6NbQdfimrx0U
         vPrk6PJfU2MsOX1QtuKGesevlUVmFS3ffmhveqXZhnoWdwxUxvOpgSxH1nHRJKNa+Wkh
         w3fA8uk3sVibsY7jLt3LxkViMhUzENaXYiUaV9iW7DQ3IFKr4UrGxJ1D08QDIXfORR/w
         kN6Vkbb1o9lXYRuFLng3FmE5dueW97NhJ9z3bOZdvMHmoVk18ffD7hD/M68f6T7Jl5iF
         59Rg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791425460; x=1792030260; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mlmGRFd0U28wTy12oRP1z3Eel/hj8TBM+KWP2O4byi8=;
        b=I5EMnMyNwBCKYJCIs/h/xX5KJX7bNOo+0PYb/stAlNBfJvn0JC3k7SszWWtFHhFvYd
         SM7dt9heTzBwPrZ1vDo3sHVqhR80CEMXtwz47ChBpq26B2UigRNdecmZzLDeZyv/ZtsE
         hc39fNd5I31Ovznoj7Tg9K36yVoKOFP33RXXE1Bv66dprnTHKRMgKwNltJTgSCNOW97f
         cXYiWHV9xkjWyChFDxTCeDUWBEWOx/z7E4xDKwQWbSSkNXr8OBuWhrcnjug7eNy+u3bc
         +tAoxIu71q81QrEQabZtLrMcrStAES/XYJu73LVcuAcAfLKkk1c8fO/XR8NVNgrDhGBP
         NcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791425460; x=1792030260;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mlmGRFd0U28wTy12oRP1z3Eel/hj8TBM+KWP2O4byi8=;
        b=ZoA7dOgKiLJcxDwVHo9e38S4RnqJ+wcgZNpUHFkkZedWTTpF9Ev+2sQQExmQTV5T7+
         TCkEMAvmDJIYx6XzaMqnGKGAcX98w+kc14w/pbI3ZT2woNqZWEwpPySwDtwbGm8vlllA
         ci7hhaSqWcNOv6wpuu3SHIQJxwF+YJeSwN2jhuP79shSsD6zYlmDarWKzyEYn/vv96H/
         z8cCKwPw4V2fkx6AGKeliFC3Qi2+VavtG6kIgHsw1OngXQXhjlvK/+CaztVJweX1ZUYE
         UV+vpU/fugph1xxp+m4TNh79Gzuw6tSjsMig6XPZfCSI9nNmYtRrG+6iGo1LAQsT4pS6
         vB7w==
X-Forwarded-Encrypted: i=1; AKwUvBwEI6qjVula59Uv/Uuv0Al9n/0Xm0qPe49QU+yO6894vtqvFTmnLxObgNy1rhakldEkht2IX8ohIu0dEGg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkWCyQPbUZxvNfMKjFz49vP0hdiAfUWOeAYFh6KlvT7RVuZ8JJ
	ZCs6evO6ChJCka1krvO0EfPMI/zxrsoi4f4Nqmby7Q1kQ+4DGQYuuFeA4nfHyo4xANRVSbmKD29
	E0wSnaeYcZ67LP8Sx5OqcFHanRAWhtXQoZIflR5CK
X-Gm-Gg: AYBFou22GeGN0x75Ktct0q5uoPC2jpxupqY7JBhdLr6gMQyyjoofwL0kBP8cKJRxPiv
	DHk2mQaoMtJD/f70odr4CFqUJDG94ncU3uh0jWhqSsMeDc0D3niQoHvZgReLk81Y7waB0u1kBaI
	AJgBPNGM3v0EBXJLOHrcUBA7xLeq8P56gyC7S1/D2+CXsN4L8m/6iiuuDgFW+CDZlBcLodECTTp
	mYC2btzFUL8LzWZZKRabskXkQkeDIF4s9LpZtdPVJRmdX1njxUGLEqvdtBCX210ThsXSOnNSYJD
	yMEBDHwBgTZxF+7prCLwhvvtTPePqu+Ttqq5JFo6UhICgXXSsaGIqQ==
X-Received: by 2002:a05:6402:46c3:b0:6af:97a9:224a with SMTP id
 4fb4d7f45d1cf-6b01174ca66mr37674a12.2.1791425460145; Wed, 07 Oct 2026
 19:11:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005004958.3603059-1-almasrymina@google.com>
 <20261005004958.3603059-2-almasrymina@google.com> <4818da7c-be7e-4f97-b5a3-bee05ada500a@kernel.org>
In-Reply-To: <4818da7c-be7e-4f97-b5a3-bee05ada500a@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 7 Oct 2026 19:10:48 -0700
X-Gm-Features: AclHuK98bUqu0UNfrer7PsXheWlbUfZxQHPGdS03OVcyzs99X4ytv2QdoZrorac
Message-ID: <CAHS8izOmh+cjHsF9X39=Gxsw-wMHNrkxBD9OTPApVw=P43Cfbg@mail.gmail.com>
Subject: Re: [PATCH net-next v1 1/2] net: netmem: document netmem and memory
 provider design in comments
To: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Luigi Rizzo <lrizzo@google.com>, =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 12:43=E2=80=AFAM Jesper Dangaard Brouer <hawk@kernel=
.org> wrote:
>
>
>
> On 10/5/26 02:49, Mina Almasry wrote:
> > Clarify the netmem, memory provider, page_pool, and skb fragment design
> > principles in header and code comments:
> >
> > - Memory providers allocate struct net_iov or struct page, cast them to
> >    netmem_ref, and pass them to page_pool; page_pool, drivers, and the
> >    core stack operate on netmem_ref and must not downcast to page or
> >    net_iov outside dedicated netmem helpers.
> > - Memory providers are not restricted to net_iov and may supply
> >    page-backed netmems.
> > - net_iov is not inherently unreadable; future readable net_iov types
> >    are allowed.
> > - Per-provider logic belongs in memory_provider_ops, and per-netmem-typ=
e
> >    logic belongs in netmem helpers.
> > - All frags in an skb must share the same backing netmem memory type,
> >    and skbs with different frag memory types must not be coalesced.
> >
> > Cc: Luigi Rizzo <lrizzo@google.com>
> > Cc: Bj=C3=B6rn T=C3=B6pel <bjorn@kernel.org>
> > Cc: Stanislav Fomichev <sdf@fomichev.me>
> > Cc: Pavel Begunkov <asml.silence@gmail.com>
> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> > ---
> >   include/linux/skbuff.h                  |  4 ++++
> >   include/net/netmem.h                    | 29 ++++++++++++++++--------=
-
>
> ./scripts/get_maintainer.pl --file include/net/netmem.h
>
> Returns "maintainer:NETWORKING [GENERAL]"
>
> >   include/net/page_pool/helpers.h         | 18 ++++++++++-----
> >   include/net/page_pool/memory_provider.h |  8 +++++++
> >   include/net/page_pool/types.h           |  6 ++---
> >   net/core/skbuff.c                       |  3 +++
> >   6 files changed, 50 insertions(+), 18 deletions(-)
>
> Changes LGTM.
>
> I suggest that you Mina is added the MAINTAINERS for PAGE POOL.

I'm thrilled to be considered and more than happy to help.

> And do we want a new section for NETMEM ?
>

I'm fine either way.

--=20
Thanks,
Mina
