Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E003B3BF1
	for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 08:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787904319; cv=pass; b=cYLrFBprKJHCX7J3r9nVFM+BhvXht/zyBCVEBSwAvwj/AgpSZ6sdn4FTw/CqOPE+aKan6Uzv/pAOSbOkoWWbGssDSLj9mYyr9NzYNpwC/iSuUiGMUuppb4wnK4rYLyFPcDMkd63PiZ23LeFr++OBPsgNOQ1R9Y3J1r40tC3urOY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787904319; c=relaxed/simple;
	bh=wNKjtN+MdzP2+0PxnbbIkfIy4RRpZSunCNBJJz47CWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ipd1gGpvaO/1y7U1r7mHr3lbGVYDCqF1OjJC3tfTDOURzZkQfbVZcdlINGAgrl+OFETZbX5v7plnoRkqv/r0m2fDMxStZ/tVHNqhMEJxBxLn+DYfs1xqKYiJ5ySfdgFlByxzBR8aR1aMskJoGE1F6ufGyJgORPmTfBl6mSsvIic=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai; spf=pass smtp.mailfrom=nebusec.ai; dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b=rH5Z6PGf; arc=pass smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nebusec.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nebusec.ai header.i=@nebusec.ai header.b="rH5Z6PGf"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so4119261fa.3
        for <linux-kernel@vger.kernel.org>; Fri, 28 Aug 2026 01:05:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787904316; cv=none;
        d=google.com; s=arc-20260327;
        b=YK+neMdrPcOy0qnJbG71JhJp6pCixacQ0X5W5P3yIxkWJ9BlEp+oPASO/IYZnhEbmW
         F/shSQgAu8Pnh44GuUUL/dSWfE1LSpZCmop+eKe1AFIGy3kf+Kxlk8rMOrZHITUqN1El
         U9+6o9YXIFufn6CYtuIQY8/pZTgFXlFhhmlOo1qBO86UX/terNkCANObH11L6eno6eQF
         /TbDpVNeIMNWEu6DzTqcfQQJaK77vHDJHu0OfOhEOF5rdEhFRjzpvF/tRTW4O1pfTNKS
         3J+pvmen75+WStojSq46KoVSp4U7oU2ODSKEIuv9LA1rVGHGvrOVVtZMyL0gc2vCnb9A
         PkeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7+GGXhNyLGMH/bPEz2IJgnBSX0Z9WNgkMR811qYVvJ4=;
        fh=G/RYXG4v5hSQqXr32/PHyYqMLfbMDz1Y5FFlBS3Ya6Q=;
        b=dvgs665+yov2SsgzCGHwGhYJ6ekms9Tg/bgs9dzBiovW0KDqzYqu+oD0rZrcvsIZO0
         N1b0ymYznBhDU2YUT40mpEI+2h2IVUvrxt+fLkCp0BgvVUXjBrNOh3kNOmwVY8cdAf+3
         XKjpvys7tYc8qyc9moTNZmUtDAvdKAj6QlGRLseKpzISJgpAKJ13IVqdx8Ug0JsWp9DG
         gQzYKdtuXZmM+5a6XqJQFzNke+se1S3Sdxu+WRhag017LNRaxElTsgFo2PXWIInGgLXe
         jmbvCPC9Xyzs9lofaE2TuudNGxisAYq9yfF4nYLxyOBZmrGOFKvprjDUy3qw/Aqg8fBU
         E/tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nebusec.ai; s=google; t=1787904315; x=1788509115; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7+GGXhNyLGMH/bPEz2IJgnBSX0Z9WNgkMR811qYVvJ4=;
        b=rH5Z6PGfZobIrvYjuJ+XbKuJPxRdB4tXweOjDGzShjfC7YH9FYmpaR1V+ZEPck9dRl
         /T/5KxM89SzH38qZSkc/0AABOVSiGfM9TQnnibVutbTO8npLmx2Njyi2SJ/UreEP5vjQ
         1GOrmPj5JUybbrr+XJ3TkYjWX+m5MB0QJEyU8LzMq1sFf++S0DDuOwaGB09dN4ykZin1
         oAbKTgfX8YNo3vHLZzWIF2HJVQYocmBNrnS4e2R8Ng8B7vu4YKVCKBCRnekHtKd8VOVI
         Y5GTAEeE7GM/GQzhMu/95mPSTcn6NsujWpmE5tafi3kNFxKuxMMgYlQpD0zYBfwNN7fC
         0Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787904316; x=1788509116;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7+GGXhNyLGMH/bPEz2IJgnBSX0Z9WNgkMR811qYVvJ4=;
        b=atXYexejJnl4MB5xlxOCrQAFGLaCzQc2PP6+VPGGMnpip+ZISgy3QD9+7oxx6yig1d
         bQy/ZkQSlZD19XQC3ENC3jl61hNmCPAuXyW1QC8V40wm+cqrfQ/gReeEKLVRgVXCLHq0
         zwCGlMj+p7BYz4QTH7d/4wKNQpXdw905JKbjCid92lwnLv6eKNAiMZ7GsVkhCnS2IIFx
         lt6im/yNaIZ0pGn00xmH3JI2ayTG6IFpXuy8aETGVhWlzfnjPw/RbkKinDUWo/nvr7e3
         T2gzTXxmdJ9tB7b3jDrZ+6JPnbc2OCtyudfGcdb5AvBq7fzC9Kewrdqo7nvKOuLxjAkA
         +jWA==
X-Forwarded-Encrypted: i=1; AHgh+RrxdLqZaiklZ5eNfr7jpSebNoAIe1+6YpvAAG5QOWHsogY9eD055y+ami7wfJWa8B00begaAh19VsarGVQ=@vger.kernel.org
X-Gm-Message-State: AFuF++n9WfaB7TXWzj8GoPingT9ZZEXHHej9vOUqEqquYV2rt+Ik0AhN
	RxR2NAiZfTTNpIpChDzsPvlZte/B1G7yrlrlvjMegNevbK+oL8GCcHUAPKUbB94kmYt0Ebaw62y
	X1m9N97QKGsBnsZNe/UsOhXlOiFe/KtVV+9fCiPbXoqI=
X-Gm-Gg: AR+sD12yd90SAR0FjvPlvwC7IY28OuLo50EL5tsvJk+GdTBymZufMwYRTc+ih860JJw
	0s9Fu6O7PxC8zM3WpjmZAxUjXceZFNRr7MkpU0EAjjpsc8evY+PUyue4XF7+s92XMiYF/hW+pNc
	9hWG1PwNjDyZP3cgwJjff9FMMGexETT7dn64TTQyG0NuzC3cuAwwAzZVe8ex7qiJ2bNUvupoRHY
	M4nj5v6hFUnhThHeQ4+7e/MNdyfvTtwnDcDOu7GuqdT4bu7kwMYGNf/hUDiujAS9XusLa95Q1s8
	d220fYMaMsFjbVvb3llFXo+Ze+GRPme4qqr65lsoRM67rQoPuGzBXKNfMyDR2B9hNCVhVMl6s6u
	zNw==
X-Received: by 2002:a05:651c:2224:b0:3a1:980f:5907 with SMTP id
 38308e7fff4ca-3a301b3c0f6mr7257361fa.8.1787904315593; Fri, 28 Aug 2026
 01:05:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1786962220.git.zihanx@nebusec.ai> <ao1QMuGwSzhtlmo5@katalix.com>
 <CAANe3eR857ZyGa_2PdBOVaehCoHr+6qH1J0jid66-z_0nCEgMw@mail.gmail.com> <apE_bzlcmIK1FOs1@katalix.com>
In-Reply-To: <apE_bzlcmIK1FOs1@katalix.com>
From: zihan xi <zihanx@nebusec.ai>
Date: Fri, 28 Aug 2026 16:05:01 +0800
X-Gm-Features: AcwNN1XTmmPxj7tQJkNiRC_RdZzTSoOlxQ_xDSWXXRwyJ4KxPdUxne8uge797HA
Message-ID: <CAANe3eQZB4v3ymhcuPNdC29r+b3TurO-K34KQ9u4kc2BniGYug@mail.gmail.com>
Subject: Re: [PATCH net 0/1] net: l2tp: ignore multicast notification errors
 in netlink commands
To: Tom Parkin <tparkin@katalix.com>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, bhong@brocade.com, 
	stephen@networkplumber.org, sven@brocade.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:57=E2=80=AFPM Tom Parkin <tparkin@katalix.com> wr=
ote:
>
> On  Tue, Aug 25, 2026 at 18:35:21 +0800, zihan xi wrote:
> > On Tue, Aug 25, 2026 at 4:20=E2=80=AFPM Tom Parkin <tparkin@katalix.com=
> wrote:
> > >
> > > On  Mon, Aug 17, 2026 at 16:53:17 +0000, Zihan Xi wrote:
> > > > Hi Linux kernel maintainers,
> > > >
> > > > We found and validated a issue in net/l2tp/l2tp_netlink.c. The bug =
is reachable by a
> > > > non-root user via user and net namespace.
> > > > Here, that reachability statement refers to the finite state-commit=
 trigger;
> > > > the OOM transcript below is a separate root initramfs leak-mode run=
 (UID 0,
> > > > PID 1) used to make the leak and panic deterministic.
> > > > We've tested it, and it should not affect any other functionality.
> > > > Regression coverage includes the root namespace and an unprivileged=
 user/net
> > > > namespace, with notification-queue pressure and successful ACK path=
s for all
> > > > three commands; no broader regression suite was run.
> > > > The finite fixed-kernel runs returned ACK success for all three com=
mands in
> > > > both namespaces. The leak run returned ENOBUFS and reached OOM afte=
r 41984
> > > > hidden Ethernet sessions.
> > >
> > > I think the underlying point about allowing l2tp_tunnel_notify and
> > > l2tp_session_notify to impact the return from l2tp_nl_cmd_tunnel_crea=
te
> > > and l2tp_nl_cmd_tunnel_create is not unreasonable.
> > >
> > > IMO it seems relatively silly to allow the notification to cause an e=
rror
> > > response to be indicated to userspace for the create command when in
> > > fact the instance creation was otherwise successful.
> > >
> > > That said, I think it would be worth clarifying the behaviour around
> > > the "hidden" tunnel and session.  From my reading of the code, at the
> > > point that the nl notification function is called in both tunnel and
> > > session instantiation, the kernel has already performed checks on
> > > input arguments, allocated the instance, and registered it.  Even if
> > > the l2tp code then returns an error to userspace, the instance is
> > > present in the kernel's tracking structures.  I would expect that if
> > > one then listed tunnel and session instances the new instance would
> > > show up.
> > >
> > Hi Tom,
> >
> > Thanks for taking the time to review this.
> >
> > > That being the case, it's not accurate IMO to say that the tunnel or
> > > session instance is leaked, and the fact that you can cause OOM by
> > > continuing to allocate new tunnel and session instances with new IDs
> > > isn't surprising.
> >
> > Agreed. =E2=80=9CLeaked=E2=80=9D was too broad a term here. The tunnel =
and session are
> > already committed and remain present in the kernel after the notificati=
on
> > returns -ENOBUFS.
> >
> > The PoC does not use `ip l2tp show`; it sends generic-netlink GET reque=
sts
> > for the newly created objects. On the unpatched kernel, the relevant ou=
tput
> > was:
> >
> >     tunnel_create returned ENOBUFS at tunnel_id=3D1040
> >     hidden tunnel is live: tunnel_id=3D1040 ...
> >     session_create returned ENOBUFS at session_id=3D1000032 ...
> >     hidden session is live: tunnel=3D1040 session=3D1000032 ...
> >     session_modify returned ENOBUFS as expected
> >     post-modify session state: recv_seq=3D1 send_seq=3D1 lns_mode=3D1
> >
> > So the OOM result comes from continuing to create new live Ethernet ses=
sions
> > after userspace has received failure responses, rather than from an obj=
ect
> > being lost in the kernel's tracking structures.
> >
> > The more precise description is therefore that a best-effort notificati=
on
> > error overwrites the result of an already committed operation. This can
> > cause userspace to retry and accumulate live L2TP objects.
> >
> > The v2 wording was updated accordingly, and v2 has since been applied t=
o
> > netdev/net.git.
> >
> > - v2 Link: https://lore.kernel.org/all/cover.1787247008.git.zihanx@nebu=
sec.ai/
>
> Hi Zihan,
>
> Sorry my review was late (I saw the v2 was applied right after I'd
> responded to the v1!) -- but thank you for taking the time to expand
> on the above.
>
> Your explanation makes sense and aligns with what I was expecting, and
> I'm glad the underlying issue is fixed which I agree is an improvement
> on the previous state :-)
>
> All the best,
> Tom
> --
> Tom Parkin
> Katalix Systems Ltd
> https://katalix.com
> Catalysts for your Embedded Linux software development

Hi Tom,

No problem, and thank you for taking the time to follow up and review the
clarification.

All the best,
Zihan
