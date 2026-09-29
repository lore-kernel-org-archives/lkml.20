Received: from mail-dl2-f42.google.com (mail-dl2-f42.google.com [74.125.229.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22B05505E6
	for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 18:31:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706718; cv=pass; b=GQDs6lBCHUQnEoZumwyAX2/wKW3semd0nAt/sdUj8BtfDUcs9usy65WdoWAHmfyo5ozzYQCV3k4aPA/xN+bpZfLsxOch/+l4YGTvHAxcDO0DoH61/fYgkQqE0cdhEaJ1xsJ9BrrFvfxlQ+dJGHhh5OxwjIT6/dN2x9O48QbXX9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706718; c=relaxed/simple;
	bh=qWjEYaStd/oVywPQuQU4H4r1EBvFvWLTPGQ7OKRH+DE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d/ekTekKW56CZ6qwA/ds2m7/zjHHAbnIkIzgO8DEA5qIvTXrbq7tmUTcuSkPsWhWYSlY6WhRsbumZisCRS67WF4+ZqN1eN43jK1jrXDeSJ+ly1d18jtj+5HoYa/i1rq/1YzzGuP6K3YCHLBljeGoTWVVJumP64NH1FrbloGuczM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BwsFDg/G; arc=pass smtp.client-ip=74.125.229.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BwsFDg/G"
Received: by mail-dl2-f42.google.com with SMTP id a92af1059eb24-144f47a9b57so4026762c88.2
        for <linux-kernel@vger.kernel.org>; Tue, 29 Sep 2026 11:31:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706716; cv=none;
        d=google.com; s=arc-20260327;
        b=TBzleawfHIzvbonaxXDKzY7tnaNFzEKWDUj8lVXIv6dy0ipGxiEuLyyUPEhNEKNvKC
         T0omYE+7ceoxZjxUZiD/PMX0sImau4s/pAPPCrSO7rNKPZNf86dimbvSistjSNireu01
         Qko3vJ7maJ2gpb5wjYrnPuw+fGYA7AHk9iHyLNrT285NLya6wKvilxDEHH+algW2AUMS
         CaHQGGE+nfKHMPtKqwhfahFt64RS2yfSHogBZaWCe/I5+KiHDgOMskIshzZjl62K6J3k
         ccCwr5aGfqYZ6ifnQTDsKbcQXwcvJQyuEkDVrVvbrp/XFzPsCKk+/m/Pdtxcc6ghusQd
         6v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QL+31yB/3pr3YcTjuo55arVZQnRMUw6vTN5sIsky9hs=;
        fh=AwX9wvqElt4eNiYpTrF6bTRfw7p9hzXJH1WTqGP791g=;
        b=Rau+V2PnwSORwiglEbNVlDKmgolydRZMsGUdfCn7lI2uXT09O5gUmm9OGOpaC2ql9t
         JkMi6trnbUN3damasy9mUbNXTLcCMAHMvvD20Xpfbs8AOPs1ekdH9hMvcn0beMUQuZcC
         h1oclto7tEl1QVKsytnZliY7CNKxYtYNL6uhCQcv5rGbth4poC1pR4rMyHnKrzob9RVj
         gmmkz1/N3gB3pHNif/gHdxdRSvpDOh7M2mngzX4FFlWk0NWNWEa/nKkScEi0D7po9j1M
         JakSgN7nFNvidnhPPK6KzKHm6G7o06ECsJWlCECM3q5gc0MEFUgALYQW2Ux41yoqhjTX
         MqUQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790706716; x=1791311516; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QL+31yB/3pr3YcTjuo55arVZQnRMUw6vTN5sIsky9hs=;
        b=BwsFDg/Gv4ukAzEhuxzhve2EDunqulHxV+ODFZYafQ3zbCmYUOst+aEa1xR2+EIRTJ
         spRkMwPnH7ov09ct7wyEMz9BgKKcWRpOi3kZVfOAYFReKIqguPI9eGkJEzjWbEuQ9d+j
         pRMowgfZx+7SoxazG/lG87/mRlIaIZJyGeIySKkJLq2DhkEFnBwERbKCywgNeMhsNdwz
         TfHhXMK+rQJMe83EqE9DT0at/VbhWeeD1NahN/WLnsQKdyqaoYDJj3GEViXPIec40H9V
         8VLLZMmGzCMGUckeHalzxuMC5O5CKbnt3hkFySbnBl5LgBwAVHexd0ZiRw7WxF4zEdgg
         BTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706716; x=1791311516;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QL+31yB/3pr3YcTjuo55arVZQnRMUw6vTN5sIsky9hs=;
        b=behwbkqxck+mlbCk34CA+0SW/6KwjR3rJ9OGRZ/By6SG4QxEemKqwYhllxLOpxEovx
         b8V1OUDzS7G3IkPGWgTDD19GsCWG5SEzpX5wnsJKNywhobLGT8qneJwFO+eX+LmaTpSF
         GY18RsOP6Inm8OgeDwXFKtRYhGvUATkyKo/werdZIYjKElFERDe/T8R4KN9fu6NoeFLh
         GXJGQXXq8xmB9hkE2+5fegv6Qo+7Ub2MyuQJEKP6r9kgbkDzeqBL9HjFlcBvUi6rvTfe
         voenV1yU+cA1Webvk4Qw3d3hYHl9Gg9EWqfyaNb8k1pbpVyygNJff2P0oLRtgbdsF79N
         onxw==
X-Forwarded-Encrypted: i=1; AKwUvBz80Y58wOQ29amprsDzYzoLH+vQNnQfTBFX9o4PDskoKilQAL3UQse72sWpgpEuD9O0a4jJ3caWebQBV4U=@vger.kernel.org
X-Gm-Message-State: AFuF++krxuDnvSKVWSKjeTWd17IbpQAfZgoZWCikqlcLPCboF7Tiluta
	hsg+5SPm8J/mVfvfGTS1cr3cU9lt61qtc3v3roAMYkvVkTyNPQ/aPfhZjY0G0Cf6OZwMh9wmza6
	R0CZn1Qi/CpCW8eXwH8SpICjld5I7cuZsRpH50gFJEr4F37oT6dnckFLZFyg=
X-Gm-Gg: AYBFou2BcCMQq5e82rpQE6StX5lRmJ9a8fV88wEVgDiZsWJJQXAVofBdVV8zkkLmljH
	Jcfl6mictEOtVM6+4+Rwal+0wJ9wpHc3WVAPzIi5XBhdVR7Z0j1obj2kR8TQfj7GZw8zKrd0Pbe
	6Qj8++VSLkpNTboyak/mWp3aeSzOeCPNuFQTkbkpK+E9P56Qn6dOLXXdB/bqTSuLJeR+KVSERF+
	416zVjDW6ugNtrOAyY0wbpm4rZQaVIbF7vOaf8tJuDjs/59k9iiVM9K7/X5tQd628OHHtog+4fC
	O6uQGB9Y7DORLtYe0tc1NZ/N6pFzc8OP7U2d7XO8N+J/4CPSqnfSc+g9/NlHG15nGp1QQet5i+G
	enNdSkMUrw6m9rNc4UGTZ8iYAQyBs0RNbQlxeFNv+PllBj3qi5p09z8eV2ul2y0tCz1QI+ULkOJ
	FRZsuCf3LqdIiusnmBVxOqPg==
X-Received: by 2002:a05:701b:205c:10b0:143:26f5:c617 with SMTP id
 a92af1059eb24-14c9f219e28mr16546c88.32.1790706714675; Tue, 29 Sep 2026
 11:31:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6E4F8645-9453-45F1-B068-52E1B14E8B0C@doyensec.com>
 <20260928174546.4022833-1-kuniyu@google.com> <E620A4AC-8FC3-437D-AE14-31D50C7E2007@doyensec.com>
In-Reply-To: <E620A4AC-8FC3-437D-AE14-31D50C7E2007@doyensec.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Tue, 29 Sep 2026 11:31:43 -0700
X-Gm-Features: AclHuK__0wlfIuQn5YoIbWiwSnDEbSvDEt-dCblHPCpJMwXVhpCzSggWiEdv3qQ
Message-ID: <CAAVpQUDB8_K0xjGtDzXNd4AjBgD9WOPskJjWMMT4cdYQodEsuA@mail.gmail.com>
Subject: Re: [PATCH net] soreuseport: Fix use-after-free when a socket is
 added to socks[] twice
To: Norbert Szetei <norbert@doyensec.com>
Cc: daniel@iogearbox.net, davem@davemloft.net, edumazet@kernel.org, 
	horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	martin.lau@linux.dev, netdev@vger.kernel.org, pabeni@redhat.com, 
	willemb@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 29, 2026 at 8:31=E2=80=AFAM Norbert Szetei <norbert@doyensec.co=
m> wrote:
>
> On Sep 28, 2026, at 19:45, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> > This has long been a known problem, and I think it's time
> > to fix it instead of working around it:
> >
> > diff --git a/net/core/sock.c b/net/core/sock.c
> > index 2948dffcc3e1..a33cdf99368d 100644
> > --- a/net/core/sock.c
> > +++ b/net/core/sock.c
> > @@ -1324,6 +1324,8 @@ int sk_setsockopt(struct sock *sk, int level, int=
 optname,
> > case SO_REUSEPORT:
> > if (valbool && !sk_is_inet(sk))
> > ret =3D -EOPNOTSUPP;
> > + else if (!valbool && rcu_access_pointer(sk->sk_reuseport_cb))
> > + ret =3D -EBUSY;
> > else
> > sk->sk_reuseport =3D valbool;
> > break;
>
> Thanks for the suggestion. I tested it with my sock_reuseport.c change dr=
opped
> and I was not able to reproduce the issue, and migration and resurrect st=
ill
> work.
>
> One question before I send it as v2 with Suggested-by: you, unless you
> would rather post it yourself.

I had a few more patches in my local tree regarding this kind of bugs
but I didn't post them as I thought no one would stumble upon them,
but it's no longer the case, so let me post the series.

It will cover SO_BINDTODEVICE as well.


>
> Should the check be restricted to TCP?
>
>         else if (!valbool && sk->sk_protocol =3D=3D IPPROTO_TCP &&
>                  rcu_access_pointer(sk->sk_reuseport_cb))
>                 ret =3D -EBUSY;
>
>
> The closed section only exists for TCP, so TCP is the only protocol where
> clearing the flag leads to the double add. With the check as it is, a bou=
nd
> UDP socket also starts getting EBUSY from setsockopt(SO_REUSEPORT, 0).
>
> N.
>
> >> Clearing it between shutdown() and listen() makes that listen() skip
> >> reuseport_add_sock(), and with it reuseport_resurrect(), so the socket=
 is
> >> hashed as a listener while it is still in the closed section. On the n=
ext
> >> shutdown() __reuseport_detach_sock() does not find it in the listening
> >> section, returns false, and __reuseport_add_closed_sock() adds a secon=
d
> >> copy of it to socks[].
> >>
> >> sk_destruct() calls reuseport_detach_sock(), which removes one of the =
two
> >> entries. reuseport_grow() then dereferences the other one, because its
> >> loop runs over every slot up to reuse->max_socks:
> >>
> >>  BUG: KASAN: slab-use-after-free in reuseport_grow (net/core/sock_reus=
eport.c:291)
> >>  Write of size 8 at addr ffff888132359988 by task poc/621
> >>
> >>   reuseport_grow (net/core/sock_reuseport.c:291)
> >>   reuseport_add_sock (net/core/sock_reuseport.c:350)
> >>   inet_hash (net/ipv4/inet_hashtables.c:810)
> >>   inet_csk_listen_start (net/ipv4/inet_connection_sock.c:1359)
> >>   __inet_listen_sk (net/ipv4/af_inet.c:225)
> >>   inet_listen (net/ipv4/af_inet.c:247)
> >>   __sys_listen (net/socket.c:2014)
> >>
> >>  Allocated by task 621:
> >>   sk_prot_alloc (net/core/sock.c:2246)
> >>   sk_alloc (net/core/sock.c:2308)
> >>   inet_create (net/ipv4/af_inet.c:333)
> >>
> >>  Freed by task 0:
> >>   slab_free_after_rcu_debug (mm/slub.c:6570)
> >>   rcu_core (kernel/rcu/tree.c:2919)
> >>
> >>  The buggy address is located 904 bytes inside of
> >>   freed 2624-byte region [ffff888132359600, ffff88813235a040)
> >>
> >> Only move the socket to the closed section when __reuseport_detach_soc=
k()
> >> reports that it was removed from the listening section.
> >>
> >> Fixes: 333bb73f620e ("tcp: Keep TCP_CLOSE sockets in the reuseport gro=
up.")
> >> Assisted-by: LLM
> >> Signed-off-by: Norbert Szetei <norbert@doyensec.com>
> >> ---
> >> net/core/sock_reuseport.c | 4 ++--
> >> 1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/net/core/sock_reuseport.c b/net/core/sock_reuseport.c
> >> index 29948cb44b7d..031b641be317 100644
> >> --- a/net/core/sock_reuseport.c
> >> +++ b/net/core/sock_reuseport.c
> >> @@ -479,8 +479,8 @@ void reuseport_stop_listen_sock(struct sock *sk)
> >> */
> >> bpf_sk_reuseport_detach(sk);
> >>
> >> - __reuseport_detach_sock(sk, reuse);
> >> - __reuseport_add_closed_sock(sk, reuse);
> >> + if (__reuseport_detach_sock(sk, reuse))
> >> + __reuseport_add_closed_sock(sk, reuse);
> >>
> >> spin_unlock_bh(&reuseport_lock);
> >> return;
> >> --
> >> 2.55.0
> >>
>
