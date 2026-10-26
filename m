Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792984865;
	b=5kGiAh7r84yfDP9aWelED9m7KIERpJs5nJcRnAtedGdw8RBIvVylLpbleSWkYHXGIqxA
	 XmlBSwZ7TAH7nTjJnXvPYmVwKzkQjAG93KTr/tcHuCgaOk9i+fKSOMg4uJkc1kdhZPw47
	 Na1spDlIfv/CxEtVHAktVfdNl7jOcVlR91ogaTmUvSrkc1i9YYOIlhrZjqvpUu8elzcwd
	 wMKGwS+ex1IiDCLiQiipkPo8K87i2XwsVfSt0BUEh83NsGx4sP+ybKFXhedmsw0IHRSiF
	 7VYfSu9vOhqd9rk3lTO6+bCxNByXWafWKgybf2aXiHL5Hg150Ym6r2RJY1QC1M+U7Jg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792984865;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=c2bNxHpBVFwjQWzLjD3Pm497bjuMklPnp7NsPwkLJwg=;
	b=AbebYw4ppHObccw3WamTV74pfZvQ7pwNHltDgdVr5dMN0awuBSzmRIFj3d2AOQ4OP6ZH
	 KpHoWCzOlpNP1PsUon14tBKbk1CRSjQGZlnzDXIWSDsKU5tj8Vwi0TvaRrQt6DRpTYfJH
	 VGR3p2uQErKo3AwB2McfSe6kZoVd8bWHPwFVisR0JU3aOvCjkWmosxqzpM/QuRAdh4g2F
	 XS9dWz7r/T2SMSQGvp3m4uuTiISd6KruYqoHvlD8iTSS92YZGV9XHijGkE6vVW42J2KdK
	 e36+xaiklmmQH+BVK8vOo2WySwceB9bE3G6mUkNPi/oVIDEVMJw1P3rnFW6YOJMPiYg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qY7475o+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.230.72
Received: from mail-lr2-f8.google.com (mail-lr2-f8.google.com [74.125.230.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BBE606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 26 Oct 2026 03:21:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2BBE606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=qY7475o+
Received: by mail-lr2-f8.google.com with SMTP id 38308e7fff4ca-3ab28382b92so15171731fa.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 20:21:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792984863; cv=none;
        d=google.com; s=arc-20260327;
        b=Omm1vfEPerpUl75WmoShPQuh1AAv7w9oQZ9KoZUsaX+sjH1SF/ixBTUSwLj7ZKTYlX
         G9Tf6EtjrXJNU827MwnDK4bzh0vOOpic4GWQ9J07XMAv3gn2NM4pmcoSR4h/8s4ZNhQm
         2tG7A8+6fyofIVor8OlV50cYY04mWggj8lUH5x2q+FnZnW/yBWAdaSs0lVSkIqfAjbcr
         CUtIR1XuPcblWUVpViHCiXAS/CR0EDt1+GBoibwfvtjnrclRlpHI+oMmU8qPNp2mozoi
         80jBaK3HU7I2Zq0zDW6peTel3ksJVq4QDx9MO1px8FZLxokbXkD1ADOXuEUSgpsnCatM
         c5JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c2bNxHpBVFwjQWzLjD3Pm497bjuMklPnp7NsPwkLJwg=;
        fh=uvaiG12Am7tkAVJtPYIdPGoh6f8mixrkUCcVdmk/D60=;
        b=dY1aTBKnWUji1k+P5ZlGX9Rg21DG0ONjQMZzdlZIs4KlCNTR21M+mSwq3t27z9F7Cp
         +XfwfB9vk25AMUBzq2U5+sJV8gzYZZ1xtoX8/eeV34VKSTgXNpG9tD09TYnwxDWTalBn
         DvVYKLryjCia8TLh44tYi13+uHO5LlXY/4fOT/38zqi6HsB8nH0yjky2fIOWIby4NLFs
         o2EU6BB/7KOlIpwGdoAe7Y351MQ0Xugpab2ChyHoVDwN/cbsm2OTbMjugCn5FeJPApgK
         g/xRLarYFudNGTyedY1bqb7f86jyR1/DA1lVnuhRgsjEcbtexWupdwnIzoD9B1NR78hO
         W72Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792984863; x=1793589663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c2bNxHpBVFwjQWzLjD3Pm497bjuMklPnp7NsPwkLJwg=;
        b=qY7475o+AgJu8W6LB8j38bWm/8OZjg2PwUfoqiF/Ul8AKyWFGKzdhBtEpgciOxFtZl
         O6ts8GnGeDdaNEmUj5xRW7lb6pXnu7MCd+SnW991XxAcJiy5QV7cZjef/tj2JHvuysxg
         NPJBKIkdJmG53FvoILyxBH1A/WScIoKojTSMfSxAsE9ra8Vln+lzSorMgNwdgXRdMNBH
         nUFl1o9jZmCi6XUcTI0y6oXT6zsw5+4ObDnCzrGozcNtpXsJlOTWhbvK6plpj88sK4TR
         eC343sSwCCCmS3hVWcGpRFNwLur+Wrh31eiEs3LQwdNSnga48k8CXoLYHfSV9T9DU9pl
         KYJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792984863; x=1793589663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c2bNxHpBVFwjQWzLjD3Pm497bjuMklPnp7NsPwkLJwg=;
        b=KK1Q5EGS72zTLaS24ho/Btj9SYUEj7FxWMCdh9GSASLmbWpLDRO4QflyoVpdeNZBOl
         bJbbN1L4ickKVFv+zLGBoEfg/njnrxDe2BnKI9xYUYSFKWl1GMgsIdKiaJ5a6PmRjOh5
         A80W3uFKshUJl6sqYEtNRnNHgZunJoLxfTGWPRMpxQgAhjZ1fCIoadwFCPmYdhWlkVaK
         XgsbIrzDnaLEhjfILJlehMD388Bjdpg7oVZBfBfXpw6zjRXx7WCFuVhRLjyIFhIbxYb7
         XziAusBGXp/8TILEYL6FC+dl38+Jb/IGDLLjvZnPTWPGofWnn6T3CFN7aKhfwW9GMRbI
         CP8w==
X-Forwarded-Encrypted: i=1; AKwUvBxFKO8j/OPmUta6zBeUR8TyLNJLEhXqigAyTBoleF+i8KcJtuWQB/+Z8hSSaqFyN+3GNFKTCT4+NTdSSbM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJvlnmD3GqxOYbs74r5UZQVuJughvKJRrmFi57+kjIjQDm4ePb3
	3vAC9bCf5RFlzVkaAy6IIL9hnB/uqK633qf1YmEqNmKO/6uo3HuHjE+KbJceB4/QCR3bzHWv+Kb
	cXxVJQb3TWsE6CvhDHEOzxFgDs8X9y0o=
X-Gm-Gg: AYBFou0HgtjeZZwynK0bWQ7P1sfaFZWq4Zel3Baz310lkKl7Kovc6TD+2oco03Mn0xa
	5E7FHN+iRYQgCxByWR610VME8Ok7v9QV2D8e6b7zGEQ/i6/lnozBrKJLkOfzCi7zHpi1bNYI3q5
	zQSZYttRAmMFOf5Qk+jurat8aBa/rFPnIkeYiPa8t5KUtAiftu6qIZNepDa9GAg9S6MhjiQSQEX
	ZhqoKFyRqiMM7k7JiSy6V1p3NbmC3y+xJDmNWkFUNeXdmoMyUwwxmercd34JGTec+JqHpdCqb1s
	dZ/9cLylHVB9v0QWWA4n75zElxIbeYf6EBPosLGi84cgQ3PXg68RmngXuKDdOc20obYsW4n7stT
	u4+bSU4Ov+Flx4sMokZRP4Yd0FzFE4FzPmb5QNsU=
X-Received: by 2002:a2e:be84:0:b0:3a6:772c:2757 with SMTP id
 38308e7fff4ca-3ac6fcf0290mr12214031fa.12.1792984862553; Sun, 25 Oct 2026
 20:21:02 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261020032119.1334986-1-bsdhenrymartin@gmail.com> <20261023151506.4f5e5b15@kernel.org>
In-Reply-To: <20261023151506.4f5e5b15@kernel.org>
From: henry martin <bsdhenrymartin@gmail.com>
Date: Mon, 26 Oct 2026 11:20:50 +0800
X-Gm-Features: AclHuK_A69ahCShImUhR_EA8i09FMtRchCro8gY1e9OSOiiFRSkbQH70QAM732Q
Message-ID: <CAEnQdOp+K84BhZ_x8OC=vqZNG_CLes1PCbn0Wqm7VF5u_k9AOw@mail.gmail.com>
Subject: Re: [PATCH net v3] netlink: fix out-of-bounds bitmap access clearing
 stale mc groups
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Dumazet <edumazet@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Nicolas Dichtel <nicolas.dichtel@6wind.com>, Kees Cook <kees@kernel.org>, 
	Ilya Maximets <i.maximets@ovn.org>, Breno Leitao <leitao@debian.org>, Jeff Layton <jlayton@kernel.org>, 
	Kexin Sun <kexinsun@smail.nju.edu.cn>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Agreed, that's the better place.

Thanks,
Henry

Jakub Kicinski <kuba@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=8824=E6=97=
=A5=E5=91=A8=E5=85=AD 06:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, 20 Oct 2026 11:21:19 +0800 Henry Martin wrote:
> > netlink_realloc_groups() sizes nlk->groups to the number of groups
> > that exist at bind/ADD_MEMBERSHIP time.  When more multicast groups
> > are registered later (e.g. a new genl family), existing sockets keep
> > their smaller bitmap.
> >
> > When clearing a multicast group of a departing family,
> > __netlink_clear_multicast_users() runs netlink_update_socket_mc() on
> > each socket on mc_list, which does test_bit()/__assign_bit() on
> > group - 1 with no regard to nlk->ngroups.  Skip groups that lie
> > beyond the socket's bitmap: such a socket could never have joined
> > them.  This is the same guard do_one_broadcast() already applies.
> >
> > The overflow windows differ per architecture, both needing privileged
> > module (un)loading.  On 32-bit kernels the ~54 dynamically allocated
> > genl groups already exceed the initial 32-bit bitmap, so the table
> > can grow there directly.  On 64-bit kernels the same in-tree set
> > fits the initial 64-bit bitmap only while allocation stays
> > contiguous: genl_allocate_reserve_groups() takes the first free
> > contiguous range and unregister does not compact, so an
> > unload/reload sequence can fragment the ~59 free IDs until no
> > fitting range remains, forcing the table past 64 bits and reaching
> > the same stale-bitmap overflow on the next family teardown.
> >
> > This issue was discovered by Tencent CodeBuddy Security.
> >
> > Fixes: 84659eb529b3 ("[NETLIKN]: Allow removing multicast groups.")
> > Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> > ---
> >
> > v3: Correct the reachability again (sashiko review): 64-bit is also
> >     reachable - group IDs are allocated in contiguous ranges without
> >     compaction, so fragmentation from an unload/reload sequence can
> >     force the table past the initial 64-bit bitmap too.
> >
> > v2: Correct the Fixes tag (the clear path was added by 84659eb529b3,
> >     not by the dynamic bitmap commit), drop Cc: stable and describe
> >     the actual reachability (32-bit kernels with in-tree families)
> >     instead of implying generic heap corruption.
> >
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
> >       int old, new =3D !!is_new, subscriptions;
> >
> > +     /* A socket whose bitmap predates this group can never be a membe=
r;
> > +      * don't touch bits beyond its allocation.
> > +      */
> > +     if (group - 1 >=3D nlk->ngroups)
> > +             return;
> > +
> >       old =3D test_bit(group - 1, nlk->groups);
> >       subscriptions =3D nlk->subscriptions - old + new;
> >       __assign_bit(group - 1, nlk->groups, new);
>
> Dunno :/ I would prefer the following fix, otherwise it looks like we
> may silently ignore a netlink_update_socket_mc(..., 1)
>
> @@ -2163,8 +2157,12 @@ void __netlink_clear_multicast_users(struct sock *=
ksk, unsigned int group)
>         struct netlink_table *tbl =3D &nl_table[ksk->sk_protocol];
>         struct hlist_node *tmp;
>
> -       sk_for_each_bound_safe(sk, tmp, &tbl->mc_list)
> +       sk_for_each_bound_safe(sk, tmp, &tbl->mc_list) {
> +               /* bitmap predates the group, can't be a member */
> +               if (group - 1 >=3D nlk_sk(sk)->ngroups)
> +                       continue;
>                 netlink_update_socket_mc(nlk_sk(sk), group, 0);
> +       }
>  }
> --
> pw-bot: cr
