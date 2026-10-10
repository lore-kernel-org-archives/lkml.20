Received: from mail-lr2-f1.google.com (mail-lr2-f1.google.com [74.125.230.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592EC3955E2
	for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 08:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791621753; cv=pass; b=ChA7WmZXLNxqkz24M+qLuNyEIiX7UOtqsn6Mo87VCkuFzj2X8U8gshFGuDcYyHtmTYr2VTTgf1B5Jl4GlSU6BwR4ApkmxdLBncwUIGMah7fp3KYjzkG0sfNg7ij+G21Qzg7Wus+HnpOciuzlJJ0cF2z+1eaREUuS/mMA5Evd4Ec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791621753; c=relaxed/simple;
	bh=kEAJK6t3AaZ4TJkaGOBguzXov8/MwYCD79SWLuU4BkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LqXXUm9f6HIcRBjg7H9BYddAcmDArqI4QPFX51Skj0UgzU+rHVudK2igh8Q6DGRa2aGgxiCerYbSNxCA8Ct9rQGPBsNWBVD9L3AAiHvWkxJ9IJvGLyZcE+PtY7lol5URKn3ADeIkI1OBSU79ulmv0I+8CZgI47LhKnh8vzZKfgs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TIswBr1N; arc=pass smtp.client-ip=74.125.230.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TIswBr1N"
Received: by mail-lr2-f1.google.com with SMTP id 38308e7fff4ca-3a772511049so4207661fa.0
        for <linux-kernel@vger.kernel.org>; Sat, 10 Oct 2026 01:42:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791621744; cv=none;
        d=google.com; s=arc-20260327;
        b=bN7uoEy5Gqn1gOrzAbJb2s+buNJqX4TcVWsCk+pU9hpIE2fq3+1pScwZM5oWopo156
         H/A09wGJboXwizJ3FiOeGNb5as6au/Qgfi8vfoPoIw9VCJy2Zp2qbS4wGh5aSxeSWxbt
         rAC3Sz8xV35JbvsAbHuSCctqAqOaColxjzPJRU9N6QzUFhkzaJO88I83Q9aqxmfa5vpv
         DK7aJZubXiDE++2LmzuIbbqIYBMd3dncoR1eDJxoydn+cQUIygTJrmhbBUJlprdIncDX
         GQlgAxsQ5FolRNTmjvFgT15qlt1H4q4tLoWzwqpRYj/UVh+oXJy6cMbpKvufDg0Ar9zX
         HI6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hxPdm0/ojZ2eQ+UMru0TboR+11F27mAMb7+ktQmIsP0=;
        fh=RF1OH46ypgH6fz2OkDSUX9fG6QvyEFMnmmqV+FPaDWY=;
        b=KAs/bZJJYy8763GtABYLPq2dbutP1MNFkNAnFuyhl+CwGOhY+HQuU0q66jgnUKdVa3
         2A6WOHwSDMv/dR2Ec8z0oRreOrkHB4f2UnE1MR8DScPLT3GHTV2+6uMl7U7lQENrEf76
         gyuD482vDvY+D29EdCQddajefzdvmdaYoJl6FK+jz/KG6IXr611EpEhZPAhAiDigiBlt
         T74JlwxedC0xJtgybOVBuVhu2Op9uLlOZnPCSYnsVD09mmo87s7IcxWO+/hohJYbU5Hh
         PYHFtWY0QRn6gnkKxfCvW66Au/DtYggB64zjZcbqGEo3eXy5zoawtiHMgGfUAh4z/u7D
         6QJg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791621744; x=1792226544; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hxPdm0/ojZ2eQ+UMru0TboR+11F27mAMb7+ktQmIsP0=;
        b=TIswBr1NpfD6xTwQxmkWUE7h0fcIvUpWUHRuAp0JPN0/vOCUfAUOzHq07I3OhF5DE3
         ClKZcBkBf24UvybFmAuUUw1CY7N3vu6eRiS5+jiBvzgOft8Blh4UzFEB2quT46+cjdey
         J9ZMJhVWbCZgBwid9+ynPW9XrTMyLf+j7+6J0mQnHca5nAKmvPj1w3jmYwbqUCJGjhaH
         ijoFOHhWd5pEwxAqC1HvOj33YfYJ/EWGql5lBDzMDCDc4ektk4VkN8IRS9oORBFQPe6s
         9kKIngnYxRhkbnuYdHYfN8kdJ1EHHWdxea6ffkILpYENRMq5jJSAJST9sMjIhgXWm1M7
         ZlCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791621744; x=1792226544;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxPdm0/ojZ2eQ+UMru0TboR+11F27mAMb7+ktQmIsP0=;
        b=0L8W513e/PqA/ZHg3vSx7FFYyinKytn/5gtqc/iVTduLOZ5nZDeUc1DPo0cBujFcen
         L+5kfVpLHjvJmX8hxvWaLaIkTL67qBxcUJmMkMJk/FymBYfrdOH1rp8H1ypyF95v/SVc
         1OUAy6U227p6CeCBRz0vSzzCvcysYFRNSOEYiD+/UxpYQDEkD4CsBlkoofngsReuE9U+
         epmpw6BmMe5HH54SnmQtehH/JeLI1Gz6WkQTbfq6P7q70AHvfzK4ZBzgR0y7+DD/4ifJ
         jCklegVUo51gFKa58wywdFuvIlih3r8HxwEiAbZIv2Qf80RolAN0FTa617ZOFo7gu/f9
         do4Q==
X-Forwarded-Encrypted: i=1; AKwUvBweyU2ninKekKT1pPb40vOZRd1GH/Z8/36YM7r+qX4yGyCiEzwvzZ6d18DhP5QIzkCmLlzyVgS6KSOwUcg=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDR83NkI4V2ivFBSheGWIIf/Np/m+OQggpEAST2nxzDsQRUjNS
	mAeGaoyu1OUVaKqsZ9d7kfUe/7OrdSW5yhkxkp1C6QReYNOr6m34HKD/auY1gnYGnm6N1S9qzgV
	lmSUJCOwE+d4XwDOv3uDHYMHuCnWjAmI=
X-Gm-Gg: AYBFou1Lgxf+cmwTChe8tMe5R1MYOItyLqRa1OCSgcTjW6zgtojs8k5Yn8rv0BitmrN
	ZrbN9mc6k76ZIBPjZZynvWW+JWZRWJPxNqYBVyyN+WNH9QNYDd/oYgEWdJho6ZI+CzDUwElCwFd
	F91aDIBaiqf2uJ1gdOJ3BQR70mOlc2WDMo84MkWZXVkeXP7w/38jxbCDO/zebjsGkqoTmQFtWS0
	Af1e8rL2wACxMJ1k3X77EW1+lfJNAdUZIyw9eR+/cID/SJeZjv2FjAz55pYuHB6hwW3H/lvkwwm
	p5lFK6RCah8LObq1IAKqk5FkSr35o4CfSw71PeaxANM0rEFzAnhYzHzHGUuf1KO2/yY=
X-Received: by 2002:a05:651c:a38c:20b0:3a9:8546:ee13 with SMTP id
 38308e7fff4ca-3a9c5749725mr7307421fa.19.1791621743887; Sat, 10 Oct 2026
 01:42:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010072548.2869465-1-bsdhenrymartin@gmail.com> <CAL4WiipgL26xjM+0+wT-NUVx9ppjQEJj+oShdew-mbzrRVU=dA@mail.gmail.com>
In-Reply-To: <CAL4WiipgL26xjM+0+wT-NUVx9ppjQEJj+oShdew-mbzrRVU=dA@mail.gmail.com>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Sat, 10 Oct 2026 16:42:11 +0800
X-Gm-Features: AclHuK9ooXO3z8yNdOXPx3YQHo9QoaSrA5vIKEzFrmIGtggwd6d08SSXnanZZVQ
Message-ID: <CAEnQdOq+kqpBM4kB6HT-pAVt=LDqJuH3e8t95-OSVsJh2b+gRw@mail.gmail.com>
Subject: Re: [PATCH net] netlink: fix out-of-bounds bitmap access clearing
 stale mc groups
To: Eric Dumazet <edumazet@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Kees Cook <kees@kernel.org>, 
	Ilya Maximets <i.maximets@ovn.org>, Breno Leitao <leitao@debian.org>, Jeff Layton <jlayton@kernel.org>, 
	Kexin Sun <kexinsun@smail.nju.edu.cn>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Eric,

Thanks for the careful review, you're right on all points.

This came from static analysis; I don't have a KASAN report.  For
what it's worth, 32-bit x86 cannot provide one either, since
HAVE_ARCH_KASAN there is X86_64-only, and on 64-bit a reproducer
would need an out-of-tree family to push the table past the initial
bitmap.

v2 corrects the Fixes tag to 84659eb529b3, scopes the changelog to
the actual reachability (32-bit kernels with in-tree families, at
module unload) instead of implying generic corruption, and drops
Cc: stable.

Regards,
Henry

Eric Dumazet <edumazet@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8810=E6=
=97=A5=E5=91=A8=E5=85=AD 16:26=E5=86=99=E9=81=93=EF=BC=9A
>
> Le sam. 10 oct. 2026 =C3=A0 09:26, Henry Martin <bsdhenrymartin@gmail.com=
> a =C3=A9crit :
> >
> > netlink_realloc_groups() sizes nlk->groups to the number of groups
> > that exist at bind/ADD_MEMBERSHIP time.  When more multicast groups
> > are registered later (e.g. a new genl family), existing sockets keep
> > their smaller bitmap.
> >
> > __netlink_clear_multicast_users() however iterates every group of
> > the departing family and calls netlink_update_socket_mc() for each
> > socket on mc_list, which does test_bit()/__assign_bit() on group - 1
> > with no regard to nlk->ngroups.  A stale socket therefore gets bits
> > read and cleared past its bitmap allocation, corrupting whichever
> > heap object follows it; the corruption repeats on every family
> > unregister.
>
> Do you have a KASAN report, or is this from static analysis only ?
>
> nl_table[NETLINK_GENERIC].groups only grows when group ids no longer
> fit in mc_groups_longs * BITS_PER_LONG.
>
> On 64bit, 59 ids are free in the initial bitmap. I count 58 genl
> multicast groups in the whole tree, 4 of them using reserved ids
> (ctrl, quota, pmcraid, NET_DM), so 54 dynamically allocated ones
> if every family was loaded at the same time.
>
> I do not see how a 64bit kernel with in-tree families can get there.
> 32bit kernels could, and then only from genl_unregister_family(),
> i.e. at module unload.
>
> The check itself looks fine and matches what do_one_broadcast()
> does, but the changelog should describe the real conditions instead
> of suggesting a generic heap corruption.
>
> Unless you have a reproducer, I think this is net-next material,
> without the Cc: stable.
>
> >
> > Skip groups that lie beyond the socket's bitmap: such a socket could
> > never have joined them.
> >
> > This issue was discovered by Tencent CodeBuddy Security.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: b4ff4f0419ae ("[NETLINK]: allocate group bitmaps dynamically")
>
> This commit did not add netlink_update_socket_mc() or
> netlink_clear_multicast_users(). This should be
>
> Fixes: 84659eb529b3 ("[NETLIKN]: Allow removing multicast groups.")
>
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >  net/netlink/af_netlink.c | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> > index 9fdf964224ab4..8cc655aa927f1 100644
> > --- a/net/netlink/af_netlink.c
> > +++ b/net/netlink/af_netlink.c
> > @@ -1657,6 +1657,12 @@ static void netlink_update_socket_mc(struct netl=
ink_sock *nlk,
> >  {
> >         int old, new =3D !!is_new, subscriptions;
> >
> > +       /* A socket whose bitmap predates this group can never be a mem=
ber;
> > +        * don't touch bits beyond its allocation.
> > +        */
> > +       if (group - 1 >=3D nlk->ngroups)
> > +               return;
> > +
> >         old =3D test_bit(group - 1, nlk->groups);
> >         subscriptions =3D nlk->subscriptions - old + new;
> >         __assign_bit(group - 1, nlk->groups, new);
> > --
> > 2.43.7
> >
