Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F59B3B7B6E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Sep 2026 15:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536897; cv=pass; b=HUOEB9Kkk4TUxLPRtX/3eA+pYeekdDS+xR/4w3+dHH4o7j1c2h0R307EBpGUMImEL0Z5lc2j2aS8PM99aucRjjIhu13SLiHI3fzRgmuTOx04PAul8Uulxb50SJA7hoiTMS7se1XAF9SFSFYD+y7kDxBO+EW3pPrNpPnN+kK8h0M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536897; c=relaxed/simple;
	bh=fkgmLk7TSusFljKb5mNVGBWmuOfZ68VmTXa0yt0WmTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZTGH38P+KPRpKOUTKBi8COKz7gYLk08vcNd6Fdw5m0Y4bBg4mCezhLi4Y5UMA2x2oH+1Z67/AQbYXV9dE3NH2bCk5tg2cYMBYKMHuhjedYbNLBKyvh7u9PeQ40VB6U3XG82RdAS8u2EPjc5dyMy9TZtw0aTy2tDJwMj0CgnS+SA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=idw3hsyo; arc=pass smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="idw3hsyo"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-5300bdf61d9so13997431cf.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Sep 2026 08:48:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788536895; cv=none;
        d=google.com; s=arc-20260327;
        b=scAMqV/Ujlbo6777ZUZ8oxdYG3ZJO66e5g1WnyRnaQKDR5WvYixsBa06D5BA5v5ldG
         XL/stK19DDd1L3DiNj0r/ebWLyXgUWjRTIcOZ9ls+Vei3YhvknEcbTnQGYd+qi1c/9Wv
         uS+LLbwnGgXi3sz/rhherLv+rzH62hblpjy2pWxcXnUlcCaNh2CgYfWegl/IQXriVStO
         WamBhkIGAvYt7AxrU5xjM8SHr309HdD6IVp6mCYb6hIu4TZ7PjT2RLBeEdw93SxpoNeP
         mFasIMDWaYBDOw64MpDdh1Lifhh8TVNZvYNPQy0nWRUYkRBd08BoZpfRxm+utXGYDbfn
         jpZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bfiN6yz4NWjPVAo55cK10Jczdybpen++qz7Sb8+85g0=;
        fh=CJUCEg1LmgGSLoHYBoGcno9d8cpWhzgajKa/o/Ik4eE=;
        b=DpopdhLDtdk3maMIk9ocPoaDq2m9UubD/QTWWphSbtvKMpJAkKQ3GpqijYKnu2WkAe
         2zRTROBXwPK70fWZaJ3l8eB1ZQ6eRLArB1fEQN2cb81OC4UuyHGoEglyHfZ/aERWZfJW
         hAmXomwH5AgJvpgT/wUnxgEKjogrylYtV43L5Z4J8EAK3wcy9h7WZ2lR7JS7l/7hiyQa
         W5MzZLAFa1+uqM744haYjUjjmIQ9XWKG/GobbxSBSBeXUlKWfq4P+i06dprCM1KQ7M0N
         +Gal3PAFMr92rxCMoTem444z0Q9ITffyd+fps6cuB/P6nyQAi91A+7tJioeMu1g1nx5K
         rXTQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788536895; x=1789141695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bfiN6yz4NWjPVAo55cK10Jczdybpen++qz7Sb8+85g0=;
        b=idw3hsyomxGUPti09uaufr0mZpCXiGXkeT6FDlyX6tS28IgRgScs5qjiKI44LD7ByN
         mh7cFpy49kWeMuqtP8yBEOvvL531eNeAUWwDEad3X5LIfGk+TNeOzT8MbPqQgGU9RCyx
         w6YOZ8di4+c9V9Y8zTjodX3heR+YkJ6tMl/5Fx0cyHeBrVTkKbJNxDvIPvp2wd2UVdlE
         hX618tUqTbtLRoCZVwAPzbpJ5qBxBJPKe8zRdf0ui/dJigTf2dYWv5+sRSxE/4eywe7Z
         L8TIiD3jvFv0J1pNBk6/iG1Y5Cd1CUozSvKk8qGdC0mesWoRM1K2fPO1jzixkbQ+24xW
         DJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536895; x=1789141695;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bfiN6yz4NWjPVAo55cK10Jczdybpen++qz7Sb8+85g0=;
        b=IEO6qndVnC++2XmTosqWj/CLSPC4BEaiw7fFvl38p9B+adUymeKemM3QBcV5thMKwj
         wjOKVo/uFuZJg1Cqy/BjLdr0qnEidZq5LzBNP+6H06o7tjgRdLtV4f6xQC2ew3sb+KYH
         mTh2TIF9zM2t9xttAdDYMgo9EwnSOFkBtqlpugmpyJhHrSie2PRyMmEwZL0qwWOlbfeN
         KdCLsDMDUeLt2TZxImWKUu1iZT+PxArSMAw9UjB3uR0dkfGApYN0DYqLRdhIN7hqxDxt
         JetymKkA3c+yD8M0ZXUWa3hEXn+QZkA5ZBtvcN5SVfOdVYAM4nBleZFrhbU9rB3eqNT0
         fNyA==
X-Forwarded-Encrypted: i=1; AKwUvBybqmhLea+JclD3JO7GdUZtlHZvZoj/IuT3HdZcJ8g2lOJdQvcZxQGo/Tl4UjAypItdUzEIjy/vymFLlI4=@vger.kernel.org
X-Gm-Message-State: AFuF++myilvU7jCiPnjP0L7NjaLotK3B57fi/wPnakv2WLJeYgpzOFsl
	SPgPUBTvGZlbmvc5ouKVQRn+srgPbr6kqaXIFqQ08FlVDESJeJkY6N2Bz0TJ020yuKKC73uX9TB
	PuNcEMqjjsv983pzDtEL69gjeBov1Ofs2e87RGU90
X-Gm-Gg: AYBFou09Q87BTw0F1qWIqwBNN0d50pZu1ytMz8iuO7varVRh4nxkkl5WcHYxL8aAmPT
	wxQHjiPeQODsiLPgCDhospGXovdGr5jG8fhpS0vVfTm45R0oAUIY92Xt9Nq/daBJDdIzkA1AVQz
	6qDc4NaBKOBfCsqMc9xkC/Ml+zq8FyP1SXHrTlBpfLzJ0guigsEw4dvvLGlpjMNsBz7nYXCgtYt
	2l3uyjPZ2d6RKBbFJcppf9coMiu7mxoHgBbOtCX2bIMAekea4C/C4T866eYZ+n+k/3AYAKuAkp8
	PkJf3QeFQfdgKSoxsqfJZdwrcWey33X94t72jVqNOyRmqOIN+r5vtja5EnzBLPisgFBraJA5fdd
	76nXeHPoP+9ERqnHYziEaOgIbIM+xVQvh65Weyf0mfQH5z8sphB7QjDDNpQ==
X-Received: by 2002:ac8:5945:0:b0:530:42d4:4c9a with SMTP id
 d75a77b69052e-53054a34924mr69388931cf.44.1788536889636; Fri, 04 Sep 2026
 08:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904144636.3443342-1-maoyixie.tju@gmail.com>
In-Reply-To: <20260904144636.3443342-1-maoyixie.tju@gmail.com>
From: Eric Dumazet <edumazet@google.com>
Date: Fri, 4 Sep 2026 17:47:57 +0200
X-Gm-Features: AcwNN1UCRx-BhO87n2SxGRB6ALivWRgeLz2pUjsHm8KdlVoypTzmG8EH1Vlq018
Message-ID: <CANn89iJRG6UbnYX2xo1ZJR4k=Jr+PQEb48qELK9gpKp2QATKyg@mail.gmail.com>
Subject: Re: [PATCH net] netlink: render SCM_CREDENTIALS pid in the receiver's
 pid namespace
To: Maoyi Xie <maoyixie.tju@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, kuniyu@google.com, 
	horms@kernel.org, alexander@mihalicyn.com, brauner@kernel.org, 
	adobriyan@openvz.org, akpm@linux-foundation.org, leitao@debian.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 4, 2026 at 4:46=E2=80=AFPM Maoyi Xie <maoyixie.tju@gmail.com> w=
rote:
>
> __scm_recv_common() translates uid and gid into the reader's user
> namespace but copies the pid as is. AF_UNIX gets away with that because
> unix_skb_to_scm() re-renders the pid with pid_vnr() at recvmsg time.
> netlink_sendmsg() renders it in the sender's namespace and stores a bare
> u32, so a reader in another pid namespace sees a number from a namespace
> it is not in. The sender chooses that number. An unprivileged sender in a
> child namespace made the receiver see pid 300.
>
> Carry the sender's struct pid in NETLINK_CB and hand it to scm_set_cred()
> in netlink_recvmsg(), the way af_unix does. netlink_skb_set_owner_r()
> takes the reference and netlink_skb_destructor() drops it. A reader in a
> namespace the sender has no pid in now gets 0, like AF_UNIX.
>
> I found this with a CodeQL checker. I used Claude to help write the
> reproducers. The ones that reproduce the bug run unprivileged and need no
> kernel changes. Tested on net with KASAN and lockdep, no reports. The tre=
e
> has no netlink SCM selftest.
>
> Fixes: b488893a390e ("pid namespaces: changes to show virtual ids to user=
")
> Cc: stable@vger.kernel.org
> Assisted-by: Claude:claude-opus-5 codeql
> Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
> ---
>  include/linux/netlink.h  |  9 +++++++++
>  net/netlink/af_netlink.c | 30 ++++++++++++++++++++++++++++--
>  2 files changed, 37 insertions(+), 2 deletions(-)
>
> diff --git a/include/linux/netlink.h b/include/linux/netlink.h
> index 882e9c1b6c1dcc..26266754e27c14 100644
> --- a/include/linux/netlink.h
> +++ b/include/linux/netlink.h
> @@ -30,6 +30,15 @@ struct netlink_skb_parms {
>         struct sock             *sk;
>         bool                    nsid_is_set;
>         int                     nsid;
> +       /*
> +        * Sender's struct pid.  netlink_sendmsg() stores a borrowed poin=
ter
> +        * taken from its own scm_cookie.  netlink_skb_set_owner_r() take=
s a
> +        * reference when it takes ownership of the skb for a receiver, a=
nd
> +        * netlink_skb_destructor() drops that reference.  A clone starts=
 out
> +        * borrowing again, because __skb_clone() clears both skb->sk and
> +        * skb->destructor.  NULL for a kernel generated skb.
> +        */
> +       struct pid              *pid;
>  };
>
>  #define NETLINK_CB(skb)                (*(struct netlink_skb_parms*)&((s=
kb)->cb))
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index e6b1d9758c9c92..170d90d472a0db 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -379,13 +379,24 @@ static void netlink_skb_destructor(struct sk_buff *=
skb)
>
>                 skb->head =3D NULL;
>         }
> -       if (skb->sk !=3D NULL)
> +       if (skb->sk) {
> +               /*
> +                * The reference is held for as long as skb->sk is set, t=
aken
> +                * in netlink_skb_set_owner_r() and dropped here.  The po=
inter
> +                * is left in place: do_one_broadcast() orphans an skb on=
e
> +                * listener owned and hands it to the next, which takes i=
ts
> +                * own reference, and the sender's scm_cookie keeps the p=
id
> +                * alive across the whole broadcast.
> +                */
> +               put_pid(NETLINK_CB(skb).pid);

I really have a bad feeling about this dance and these assumptions,
maybe this is just me.

Please include a dedicated selftest in tools/testing/selftests/net/
exercising SO_PASSCRED / SCM_CREDENTIALS
over netlink across PID namespaces to demonstrate the issue and
validate the proposed changes.

Thanks.

>                 sock_rfree(skb);
> +       }
>  }
>
>  static void netlink_skb_set_owner_r(struct sk_buff *skb, struct sock *sk=
)
>  {
>         WARN_ON(skb->sk !=3D NULL);
> +       NETLINK_CB(skb).pid =3D get_pid(NETLINK_CB(skb).pid);
>         skb->sk =3D sk;
>         skb->destructor =3D netlink_skb_destructor;
>         sk_mem_charge(sk, skb->truesize);
> @@ -1880,6 +1891,13 @@ static int netlink_sendmsg(struct socket *sock, st=
ruct msghdr *msg, size_t len)
>         NETLINK_CB(skb).dst_group =3D dst_group;
>         NETLINK_CB(skb).creds   =3D scm.creds;
>         NETLINK_CB(skb).flags   =3D netlink_skb_flags;
> +       /*
> +        * Borrowed here.  scm_destroy() below drops the scm_cookie's own
> +        * reference, and every delivery in between is synchronous, so th=
e
> +        * pointer stays valid until netlink_skb_set_owner_r() takes a
> +        * reference of its own.
> +        */
> +       NETLINK_CB(skb).pid     =3D scm.pid;
>
>         err =3D -EFAULT;
>         if (memcpy_from_msg(skb_put(skb, len), msg, len)) {
> @@ -1971,7 +1989,15 @@ static int netlink_recvmsg(struct socket *sock, st=
ruct msghdr *msg, size_t len,
>                 netlink_cmsg_listen_all_nsid(sk, msg, skb);
>
>         memset(&scm, 0, sizeof(scm));
> -       scm.creds =3D *NETLINK_CREDS(skb);
> +       /*
> +        * Render the sender's pid in the reader's pid namespace, the way
> +        * unix_skb_to_scm() does through scm_set_cred().  A NULL pid giv=
es 0,
> +        * so a control block that lost its reference reports "unknown" r=
ather
> +        * than the sender's own untranslated number.  scm_recv() below d=
rops
> +        * the reference taken here on both of its paths.
> +        */
> +       scm_set_cred(&scm, NETLINK_CB(skb).pid, NETLINK_CREDS(skb)->uid,
> +                    NETLINK_CREDS(skb)->gid);
>         if (flags & MSG_TRUNC)
>                 copied =3D data_skb->len;
>
> --
> 2.34.1
>
