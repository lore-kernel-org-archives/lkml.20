Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06DB9448B87
	for <linux-kernel@vger.kernel.org>; Thu,  3 Sep 2026 08:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423314; cv=pass; b=VqOCGz0T4zxZWq2NuSTzGjVvR9pWu/z/4Wt1SvP7jz8i22EH6v7nQNl6dCIxGs/FxFySSLuQMfubaNrcelhbqtVdWC/EsZ8w28c0QObrRsBWUyv4faGg6h5a2a6vAgN0dPqhGFNiq+WpCzhmtRP7Fy/zNNBUEuJ/kxodorGXoio=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423314; c=relaxed/simple;
	bh=OlQ0YAVC6ujdBBFpljayXmVKSTR3LjTuNS8fAxNdB4k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rbNBuYc4NtV+Q2iWFYdK9LIsiICn8Q9kWFiKfP/gvXTR/99HqwcG+d+qBpsXghmCdwuurOcz0XdRZSqfk/CR9A+X5n6gX3L8zxyz/ViAuT9nAvlqo4ioJqya5bH8GXoYZKad8IvsHC5zNvJEVLWbudPNanLxSUkEX+PIc3Xbr44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lXHBKX6O; arc=pass smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lXHBKX6O"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-90cc39e06bdso23091936d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Sep 2026 01:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788423312; cv=none;
        d=google.com; s=arc-20260327;
        b=Lz8R5V1tRsHqxNt5mwm+1XUpvAhLrLVhEjMnvgkYCwv4bAnn3lmaiCqyxlqw1z4m1r
         8DOyXzMVGTaGeC1YLY936p/oGGWwObb4COCGZvg4sRchPIdirbdkdCk9oHjANaJF4+Mr
         zTlUVYJO8BUbL1XLdsAIm+xvXHySUUp+yVTdm48jz5Od5SutWPyvSgGg7rKfA/cREEOD
         RDJH3RIDZwIy6/sl2m5QOqpAUtPJsq+yDTyklzIhf28uc+kAcrLNRhdKtVQpI6Frnttt
         a0pqsfjjD0x1vRDrog9dr7obpfyIut/QmxaDN+L0truEnb9aYkPLnF2jHTqMwGmBnABe
         t7pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7KdfSLURFL5msCoh/intCikQgtAh5MxrzCcW7QWmj0w=;
        fh=B4C0dRMCMuUudSAEIWNjLPffbIsGxuUFwQuylnl7xfs=;
        b=nfL7oDMOZimsF2KWJ9ex+QfrdL5SLFxe56w7MjStpYShYDQzh7FilvWZ+GCoZ3UiRx
         BZjowulemjpnTz1Kb0TVw2OI+kXuYmPxuRs6YLglhcNn5sHfsgr2WTmPwUbcXrZvaHPe
         GHlUq9bfWO2VpB5ockh7nrvKKp6WnzpRcpY13SMnxmN/iIOFcQ9/jF21VPlRyLZLWPw1
         EikNgzy/b4r8RmLRgWuFhqFw8zyDFXy/3p+g5Nem0pFVthLXB99NGRIwR11HiC/TW54j
         /B+EfUOX5pTCE7HYOyoHMNnK/TKghPUcSgd3F8C9pghV7pLqgWWTOBKRkNm9FwCMuPNj
         hRMQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788423312; x=1789028112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7KdfSLURFL5msCoh/intCikQgtAh5MxrzCcW7QWmj0w=;
        b=lXHBKX6OWuVtNef1bAymwI9OdYEJBD/9ePlJDOxT/tBlwfBMs1DqInCVwi+yez5kik
         h2jY7PB48Yp6hUH7PeUzK5PfeRuXS1NFo1JmAjzdR6thJjWHMjPqd5J8kG9iChOBvMhH
         0N+TLgG72IGctTb58jkKEwTA35nnHDYjk5ZQ5rsDjgv/5eSqBcq51RFm+jEinYPuB5Si
         ZAYeC+o0hqfiSGLtnE8QWGcNE5ikJx/qlGUxOKeRqzqMRoE6VKdPG0fjdbY8kXK1V+u6
         hEBYdrmU3aW27QOJB1Zudxw8zTRk56cH97jq3STdwPLZyVGB0WvQ5w4T6myO92sSw7yO
         rwfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423312; x=1789028112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7KdfSLURFL5msCoh/intCikQgtAh5MxrzCcW7QWmj0w=;
        b=EbON/pG5/b5dsVFeDEv6RurA62l835sXGe+iYOA3Df+mxpj9EgqooJCgk+WIjgp+X9
         CZT+2n9owElbzVjhSwEGbcLBXjZhfCARMoJgqhLW8YQa3Mi9UCMVjMPE6zzaj8aWD82m
         DTKAymKQerWj1uzFAVXMURoBCbev+ki9P7NXBH2HdrvWfbbCxoorjPDrwJPSl0hX5drS
         gL53kzgZ/WjDXu/4Ax9eTuKyfpTqs16xw19bxoezfnL9fP4Hc59EpEVDP7OZj0KMHsoZ
         k0pBiCCxQ6k3Yr4ywAzUysA5ombhoFtsqqNRrZAYuW5vW6ULyQoE3R+o2GsjEUXHEpYc
         Dl3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwrrC/QCJbyUbypoNB8ujsxQbi3R9myWOYmPYn8K1eFfBjLFfATexWxxsjT7UyBJwgiBFivxxVDq4ilGfQ=@vger.kernel.org
X-Gm-Message-State: AFuF++k6OqBY2sdfE0a1hTPRN4ZRuu3Zr/XWi1GgWeNtnFAx68FUXCOg
	TwoQSHd5K8V5qw0DqgiQbdG853tpcZat/wKCy3jCuTdVR7uo7hf/ivhqJtDgSwXJbpisSXQAl8T
	cHZNCZuR9n8QjfZpvODsavh3YUOkTMpdDjKlQkbjS
X-Gm-Gg: AYBFou2l8w25O+NxxRbFNKiS+OsacLflayKGuq9KlGmfhim7LjvoeIl2Fq4I7Fyjabu
	sv46eXpJKmTXMcI2tW2bDbMJ7Fx+bpT/rWbD3LArKfLMlTjsfE01jdYe8muRxR1EpQcuT3rwbtA
	skZOw/KJyCU3MreonNdqItd1goZO3NZQXQLA4KEZo8wpTQ30yvMsBfD6Hj/JIg07KLJWCQLUInP
	svVTic8CvFW/xg5p009psPSzekonItwfUkuWvkAepPSZxQ8w/Fv0UasMyHnu90/wyXRH9o+vbw4
	cxjPPotmaJmpGMJQ8x92/Yb9oAcwqn6Rk/Ah1UnR3Wym/3NYRtvu7k/rID40zo53pb0uiBvXmIj
	15or2YnM+IkCLF2rEhCHmR7chuIyvFVceZn77iyJCXOmER1zkls/2WOhEmQ==
X-Received: by 2002:a05:622a:303:b0:530:430f:630a with SMTP id
 d75a77b69052e-530430f77d7mr49522131cf.48.1788423310957; Thu, 03 Sep 2026
 01:15:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901023539.6986-1-zhangcoder@yeah.net> <da990dc8-a7c5-4870-89f0-ad8e7dad0e0a@redhat.com>
In-Reply-To: <da990dc8-a7c5-4870-89f0-ad8e7dad0e0a@redhat.com>
From: Eric Dumazet <edumazet@google.com>
Date: Thu, 3 Sep 2026 10:14:59 +0200
X-Gm-Features: AcwNN1WMWij821xOv26UsqrEoLcMh-Z44UxeGO9PCnqsEdYxBlY9DRaWPIqH9qA
Message-ID: <CANn89iLzwR40o3VmPuz+6GD62ndJFMo=gv5cyVEuTYdCmFSutg@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: fix mdev comment in tcp_rtt_estimator()
To: Paolo Abeni <pabeni@redhat.com>
Cc: Ziran Zhang <zhangcoder@yeah.net>, Neal Cardwell <ncardwell@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:08=E2=80=AFAM Paolo Abeni <pabeni@redhat.com> wro=
te:
>
> On 9/1/26 4:35 AM, Ziran Zhang wrote:
> > The old comment "mdev =3D 3/4 mdev + 1/4 new" only describes the
> > common case. However, when RTT drops sharply, the code applies
> > a finer gain of 1/32 instead of 1/4, resulting in:
> > mdev =3D 31/32 mdev + 1/32 * new.
> >
> > Express both cases with a unified formula using variable
> > gain g.
> >
> > Signed-off-by: Ziran Zhang <zhangcoder@yeah.net>
> > ---
> >  net/ipv4/tcp_input.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index 0f60a1dbf..2c9feb181 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -1108,7 +1108,10 @@ static void tcp_rtt_estimator(struct sock *sk, l=
ong mrtt_us)
> >               } else {
> >                       m -=3D (tp->mdev_us >> 2);   /* similar update on=
 mdev */
> >               }
> > -             tp->mdev_us +=3D m;               /* mdev =3D 3/4 mdev + =
1/4 new */
> > +             tp->mdev_us +=3D m;               /*
> > +                                              * mdev =3D (1-g)*mdev + =
g*new, g=3D1/4 normally,
> > +                                              * g=3D1/32 on sharp RTT =
drop
> > +                                              */
>
> I'm sorry, I have the feeling the above does not clarify much. Also
> AFAICS it's not a 'sharp' drop but any negative delta.

I agree, this is a 'legacy comment' that should probably stay for one
more century :)
