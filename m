Received: from mail-yx2-f43.google.com (mail-yx2-f43.google.com [74.125.224.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DA82F7F15
	for <linux-kernel@vger.kernel.org>; Thu, 17 Sep 2026 00:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789604520; cv=pass; b=tzauPybndkbEVL3m2pBTDUYDgqZKwXXJjFR10WUUimaKZ+9CIdtb+09lndZxNM9jUkgowjexiodJs7lndHbMf9SqhwNG9ztPR19vUuTUWhTVz2Jn1PDc0iKjItDdXhhWBnYEtCLUkqolDEgoLlvFm594K/sNaUqCJVNasMsQVJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789604520; c=relaxed/simple;
	bh=eE/70tI5lHBfiicghCy5PNB/8uOoQM6gLV3a2ZfYFM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IXNBQ72XWuTx2wGd652Yt4ch8OzOLQzoHcdkDYdAoQR/+/s+tg7myHeDmYKOR0ERVtX82tRSWyc8fvyJbEg8tGw7wZDt5ySEkYy/GFtXx7TUhw3/atz0bCFj1vBdox0qOdW46weI9tzfpFA8s7OL9TjQsypbU+EQtWqEmiOszdc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XAf0Hcwx; arc=pass smtp.client-ip=74.125.224.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XAf0Hcwx"
Received: by mail-yx2-f43.google.com with SMTP id 956f58d0204a3-66e4aae314aso257130d50.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 17:21:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789604517; cv=none;
        d=google.com; s=arc-20260327;
        b=GyriACntX1GbUaTFbkSzj95gVg3HkKi0ZCn85CopoGgJjMTEDsMG+UQXWATluRmUlq
         Ej1zQls/hdVK/i1B+6NRfdRPQCyfsKYMcWHSP7w4sqXK9rUXr6cmY6wt53oj8/T5gdZs
         bPvzT6kpcuIyhSn0d09K/AsPYwiiY3mPNL3zUKoRnzN/Faq9C6WVZmqPJpPFB1aYbiCl
         choK15Vx2HPi7PNuT1MQ6CzcTSL3GlHezWU41+lYWycKKlenQokdT4AZraL5HKtk47Ie
         y2Az4R06QGhCVBB8TlMF+s+d0Aborfj+QqiwXxfUqJbW1UOFtP8z2/Fcrl9HOtiQ6Zs6
         BgHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MDCyJ4TOKuXbazw0rOc/QKvMAz2VNlILsoPCMfyFwJ8=;
        fh=F4OT36qLo68MoUpWdnbvca4f1wJktPWbNzKVIcwlMqQ=;
        b=f8u1JR2ZH1ornCrVGQeo7WVHP6fdoW2khDIYbpYv0Pl1SLgvzEn9+L69wb+GXSsa9s
         CD4CHKgrykjxtnWzLxNfU08Cxk1gjt8FOCGCxNhFf7wH0f0W9Dk8BzXrlzEXFVJSK5q6
         m5bTf+Oux7ALeatoW2l/nhfPiNwUuCix1fkpAxWX041tl7IsHrbGnP1+6MANfuMKGN3g
         +P6s7fvNU0Ct5tsColDfNthV+OLW/mO6ekgDhnZ60dviVDSBv2qGWPLl/+i4uBfxMTlt
         Lxf2VVq++//YmFh+Ka4LiQ2ZAzGzGhtKJQoVWqr7pJOKGXukgJyO2f8GXFi5wTQDdTlv
         olHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789604517; x=1790209317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MDCyJ4TOKuXbazw0rOc/QKvMAz2VNlILsoPCMfyFwJ8=;
        b=XAf0Hcwx0wGX1R/eahcYqcItKUB+ei7e0KMV4GnR24CdTGYaMdKYGr7mf9+AX8iSql
         RsVuoQ1OMmJ6BlqV3PChQ5GsQGV+4MdUdbl05Z5IS7iOAeZNpG7J8rvBRLMzSirKsiuc
         oIz4uKvI4TwBNsD8scJjk/PuQ1KRH85sa8azl6DDM7iEcBKkO1WkdNVUe+yyrmbzXyhd
         WEAgdtsKRdce4nk3PZ4WBsAw0+Innm2tSA2AJbqZDfeHb2o/cc33xjc+NElVB8ZsdtC+
         +9UkmcFZR37wrgVIf+wREgrwOMYnR596/rq8UFF17EfpGQnfK8Qn8XHE2DUE+lU/jHmN
         gbig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789604517; x=1790209317;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MDCyJ4TOKuXbazw0rOc/QKvMAz2VNlILsoPCMfyFwJ8=;
        b=PBlSCHaz1qwpUFZ1So4Kdvvi4yKjAfbkvBN5D9fqyeUMvxE9nS6ayao59OIGjvdXWq
         kVJa8AEzcXsGQMuw8+P4I+XR0Vox+Gs5jPqIEi9QTxdueKr0MyoX2tU7o/jcI5agz1LC
         0xoekaXby909+vpT7niF+nUHK0z/P5ww76FlLzEIBJ9EJN0PUqn9RSV9A2fLuBVkOnqh
         509oQlHsDYScmc9xiTNLQ7vY+AtpwTAlznRzHUOdCQ59U5zq2jVlFRhgyrIFPTRT0vHk
         QwxndpNL/YipbSqmSIF0T0I9kmWv4sEeFf61BMeM3dayZNlzotb4tu0CC2ojMzbW8Ald
         hIIw==
X-Forwarded-Encrypted: i=1; AKwUvBx0mRZo/362R5vpcxhhGRkf9RFvXppFErj1xrlN52cFWzsm04ZEAtViK7EZ0gxOSV5ysxOzQXx7X9fL5h4=@vger.kernel.org
X-Gm-Message-State: AFuF++lhrENaP+EvQq4830JNROF2g57aqrzzg8MpTqBLv9r+HSn8uF4D
	Xf2QhdivyiYtm30fAfigL6180dDIWN1iSKKK3hrcI84OIFdvJ1SFIWovl3x/FeT7aYo1lwyEYdk
	3pYNjMjmNHER1MTk8t3Qvls7w4uymq50=
X-Gm-Gg: AYBFou2aKxGGj/jHVNexW0j653BXjvkytJhXl0ZZ8LjcAP6JwJdR5X5jED2I0jyzvBU
	9hg+0w6ZJOnJwdQUZVS3yg/BZlcuHXD1HB17nJORHD1S8DpP/3A0WUyeax1uNfCTn70bdDMcU3z
	ZvXVcv8rS/Xu1K0FUo8FONPE5KEx2KOQ7Fw4kA+U3DjllV2+1yx7y23sDcA1sPPQ090cpGyumC9
	/vidQH+e1mMwo9mZU4zPoy3Ix1reFobFgPjIW4OxNIxUQaBUUUXS4oiVmkI9+Ixd6X63wF8+QGP
	owTg6esT5KNEty913mSdbohxSwy/l9JYWHWK+G1FOtSsAmQU54B0m6NJ
X-Received: by 2002:a53:d016:0:b0:671:4c1c:d571 with SMTP id
 956f58d0204a3-671632c9f51mr1604029d50.43.1789604516779; Wed, 16 Sep 2026
 17:21:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-psp-ktls-fix-v2-1-0eedc3b148ec@gmail.com>
 <178960039456.22033.8739239860645875280@kernel.org> <DLH4YA9CBAOR.302OMMH65TVUD@gmail.com>
In-Reply-To: <DLH4YA9CBAOR.302OMMH65TVUD@gmail.com>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Wed, 16 Sep 2026 20:21:09 -0400
X-Gm-Features: AcwNN1U4GDt9jigbNmv_Nr_CFF1szcdzklC14Mom0RTgeef43I5aY0c4jLpwzWQ
Message-ID: <CAF=yD-K2d4i2Jgc3v5okzuGy3GPLXD+E490r0FYBcW7+Rg1fxA@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: psp: avoid conflicts with skb->decrypted
 and sk_validate_xmit_skb()
To: Daniel Zahka <daniel.zahka@gmail.com>
Cc: netdev-bot+sashiko@kernel.org, edumazet@google.com, ncardwell@google.com, 
	kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	horms@kernel.org, andrew+netdev@lunn.ch, shuah@kernel.org, willemb@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 7:39=E2=80=AFPM Daniel Zahka <daniel.zahka@gmail.co=
m> wrote:
>
> On Wed Sep 16, 2026 at 7:13 PM EDT, netdev-bot+sashiko wrote:
> > Thank you for your contribution! Sashiko AI review found 1 potential
> > issue(s) to consider:
> >
> > Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 0 =C2=B7 Low: 1
> >
> > - [Low] The patch adds a new, user-visible restriction to two already-
> >   shipped interfaces without updating Documentation/networking/psp.rst:=
=E2=80=A6
> >
> > --
> >
> > net: psp: avoid conflicts with skb->decrypted and sk_validate_xmit_skb(=
)
> >
> > This makes PSP and TCP ULPs mutually exclusive, since PSP and TLS both =
use
> > skb->decrypted and sk->sk_validate_xmit_skb(). A new helper
> > sk_has_decrypt_user() is added and checked from both __tcp_set_ulp() an=
d
> > psp_sock_assoc_set_rx().
> >
> >> diff --git a/net/core/sock.c b/net/core/sock.c
> >> index fa60b7494c586..9489d9c479493 100644
> >> --- a/net/core/sock.c
> >> +++ b/net/core/sock.c
> >
> > [ ... ]
> >
> >> @@ -2670,6 +2671,12 @@ void sk_setup_caps(struct sock *sk, struct dst_=
entry *dst)
> >>  }
> >>  EXPORT_SYMBOL_GPL(sk_setup_caps);
> >>
> >> +bool sk_has_decrypt_user(const struct sock *sk)
> >> +{
> >> +    return psp_sk_assoc(sk) ||
> >> +           (sk_is_inet(sk) && inet_csk_has_ulp(sk)); /* for tls */
> >> +}
> >> +
> >>  /*
> >>   *  Simple resource managers for sockets.
> >>   */
> >> diff --git a/net/ipv4/tcp_ulp.c b/net/ipv4/tcp_ulp.c
> >> index 2aa442128630e..b58045df101e5 100644
> >> --- a/net/ipv4/tcp_ulp.c
> >> +++ b/net/ipv4/tcp_ulp.c
> >> @@ -136,6 +136,10 @@ static int __tcp_set_ulp(struct sock *sk, const s=
truct tcp_ulp_ops *ulp_ops)
> >>      if (icsk->icsk_ulp_ops)
> >>              goto out_err;
> >>
> >> +    err =3D -EINVAL;
> >> +    if (sk_has_decrypt_user(sk))
> >> +            goto out_err;
> >> +
> >>      if (sk->sk_socket)
> >>              clear_bit(SOCK_SUPPORT_ZC, &sk->sk_socket->flags);
> >>
> >> diff --git a/net/psp/psp_sock.c b/net/psp/psp_sock.c
> >> index 1a2a6b7516b0f..e9b53eedf8dba 100644
> >> --- a/net/psp/psp_sock.c
> >> +++ b/net/psp/psp_sock.c
> >> @@ -143,6 +143,10 @@ int psp_sock_assoc_set_rx(struct sock *sk, struct=
 psp_assoc *pas,
> >>              NL_SET_ERR_MSG(extack, "Socket already has PSP state");
> >>              err =3D -EBUSY;
> >>              goto exit_unlock;
> >> +    } else if (sk_has_decrypt_user(sk)) {
> >> +            NL_SET_ERR_MSG(extack, "Socket has incompatible state");
> >> +            err =3D -EINVAL;
> >> +            goto exit_unlock;
> >>      }
> >
> > [Severity: Low]
> > Should Documentation/networking/psp.rst be updated along with this?
> >
> > Two already-shipped interfaces grow a new failure mode here:
> > psp_sock_assoc_set_rx() now returns -EINVAL for the rx-assoc netlink
> > command, and __tcp_set_ulp() now returns -EINVAL for
> > setsockopt(TCP_ULP).
> >
> > The "Securing a connection" section enumerates the restrictions of the
> > rx-assoc/tx-assoc sequence:
> >
> >       PSP encryption is currently only supported for TCP connections.
> >       Rx and Tx keys are allocated separately. First the ``rx-assoc``
> >       Netlink command needs to be issued, specifying a target TCP socke=
t.
> >
> > but does not mention that a socket with a ULP attached is now rejected.
> >
> > The "User facing API" section also suggests a TLS-then-PSP bootstrap:
> >
> >       The expectation is that higher layer protocols will take care of
> >       protocol and key negotiation. For example one may use TLS key exc=
hange,
> >       announce the PSP capability, and switch to PSP if both endpoints
> >       are PSP-capable.
> >
> > and "Kernel implementation notes" says PSP "follows the TLS offload mor=
e
> > closely ... and the use of skb->decrypted", with nothing stating that k=
TLS
> > and PSP can no longer share a socket.
> >
> > One more thing worth spelling out in the docs: the check is not restric=
ted
> > to TLS. inet_csk_has_ulp() only tests icsk_ulp_ops, so any registered T=
CP
> > ULP blocks rx-assoc, which is broader than the subject line suggests. T=
he
> > commit message explains this is intentional, but nothing in-tree tells
> > userspace about it.
> >
> > The follow-up patch in the series ("selftests: drv-net: psp: test PSP a=
nd
> > TCP ULP mutual exclusion") adds tests for both directions but does not
> > touch Documentation/, so the gap remains at the end of the series.
>
> I can incorporate some changes to psp.rst into a v3 if others think
> that improves the quality of this patch and the PSP code. Personally, I
> don't think this suggestion is worth while. What this code prevents is
> something I would be surprised if a user were to try without heavily
> inspecting both the implementations of PSP and TLS ULP first, at which
> point I don't know if using up words in this doc is worth it.

Doesn't seem worthwhile to me either

Reviewed-by: Willem de Bruijn <willemb@google.com>
