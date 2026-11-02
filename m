Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793630314;
	b=tzbdKFSwB0lroOO36BVuvRCSuvMrCvRbrE4wEf6VFo7Oszzi8wvq8R/B2Op0owMfr2UE
	 ANtxlLuIqP1JTUZ0jWBnfor3hoYvuiqR1LHUhMXg3Ys6mlsLye5VfP82SUJncTrrIb2JG
	 dOtIbItdIeVXgwqwEnXc0Ljkt3QjJXDWTbL10KZ3sI6vb/K42Q3WgDg0jHUzhSRAyWgoF
	 MYK1NquJmzeQZrkMTeVlBuwgUsS0rs7xhOH8iqKhlNjg4Sjcw62MvwZfv+H+HhJWGHmzZ
	 JKHzlPaC3XlkomLF2CNBZJ8Clx1BNAQlU/PhgRjhKb0h34u9FC/JQuPp7JEYRwcCj4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kdpMoDfxV/kxyd283/cgxJ9yYcL9JRHgCdJXPdOv5hk=;
	b=Zfdk+vLCRCFjMaC4kstJ6Bw71CDJf7o/6GCtrt5shATyC8MKnJyk1O51WNsx+WfXCnSM
	 NDx+bODbxvzVmPIfWvtsJXdEMTzIv1AvSDEmNZ3AFqbwqRXSrP+h67dpEADmgYhA+lTEC
	 92Vi2GuZJo4QGrOAZ7ofujjBX8/jtjtShODI6D2diMryoJxgCAo02RrliOIWsSzRA1RDP
	 hSySyE3hPURbwRq3pFGTgpjBe4paqRQpxxogsNzUajw19LAcn2r39DrwNcev4qVt+3Jeh
	 EE1UE2jWihLO7J4vkKxM3oLg2zB9q9XFvo/jfwgTJWowosS/awGpQQv3bziDORITU9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzqFWStZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6010606E007
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 14:38:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6010606E007
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bzqFWStZ
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bfc32574e7so1525127e87.0
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 06:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793630312; cv=none;
        d=google.com; s=arc-20260327;
        b=VSAm8rKsmFmeIDGkKiE9Y+UY6Hn9U6aLiFa7WfVl15C11XVjHKzFTG3FMXPov8EVFk
         uqa3OTGBNkb0lBFFnXbvfFvaGC8rAzg+xdef/zmAoH/8ZDgaD58rI0fz7pZiYTxvd7IJ
         LaOj60ZETYLeNzRNOgxGFM1bcUwNOsH0RsZQiUX3Yff9TRT7g5a/Lc7rQFkY0sPRSA5J
         ntJcT6I6uicG7fj3FTrGdIGudQ3WWIjHBalWD97Eo3FLax4LoR8TTgB7a8E1LO8buj4M
         CcGFdt60cDRb9sqTqBS/GmxxYw1s0tSljyBKV4O923wWiNhtbv0KESGirLMbdoNXjI0O
         1ZuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdpMoDfxV/kxyd283/cgxJ9yYcL9JRHgCdJXPdOv5hk=;
        fh=ZGpt8L8Vi80w9B0XmqTOqqP9c48mfgtZcVd4lTscwZA=;
        b=lD8r5GYJGHlD81IPw18RI7bQsucEtmEZ+6MUgIFVWjiYsmLGRkWLCp0PDAmFyW/X1/
         rckrImAKsiDSizceGIqPgjDT9QBvSJTmB+PYzxK6I/aS6uxBQEr7xLOjtEgT42xKyhoD
         oX5BnyD9hqKroctKnFDAOHDAodPXcoBjr7UsGlIzdCr3XNX3hSWAAxZ3UWzg6/lA8013
         o1xNA+36rVQ0n46V7vVwZAGsZiuStYNmrKUsO8IIl0uSbo6du5HuiIQ0M1qoe/dX3SEv
         hZcC1PAzxwCMxEpg9T7bzhNTI9G1EdLArvM00LEeHUXxb3WeQSCiYbsD3ragAi+9J80J
         iK8A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793630312; x=1794235112; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdpMoDfxV/kxyd283/cgxJ9yYcL9JRHgCdJXPdOv5hk=;
        b=bzqFWStZlSeo6uMCrFePWnp49xkQBYilAyy9LG/r319JXqVCyWI5UM2KooV+Qkx68L
         GDF9MvxzYgoLTcs/3gL2ZUqls62clkJSA0tLMlWsbVjvJPIAb46PE28fcqgTdC8YATlI
         faIVsn+HOXE40PiVvTuXP99QSueInGhnte46U7HHioMk1yNvtvjtEavGj/p0Vgdx87Sd
         JzTvavWsUumMt7hlV806pAQNRCp/ZQFvljrHNBoG8N8/CwyLAOf6BuSgHuUgPTqCR080
         OwVhRaURsC1+QFeiYMjyFxmJuYIixGxBPYI8k0e3mPtsRN8EOjAuWANotfDSMOdTw3YO
         eUzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630312; x=1794235112;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdpMoDfxV/kxyd283/cgxJ9yYcL9JRHgCdJXPdOv5hk=;
        b=C8SXVAer4oGdAwgSr1EUPd8EwfB6uJY/1IfImMaci0Azz/B5ZvuA/D5JlNevnX8HlA
         rcHyMLTGA93zOjbwdW0W5wTn2o8j6V6WSxiB5hmA/cAWB6WxMBbs0EXOBU5/0urG0Im0
         3JLEhkC7MWWyfxx5oT+RjcTo2wpJWWDenF1Ohzhml5DXtZg0E+gfUDDDBu/R5D3PFLMk
         M9Y5kuzhRgOpxxt412LTI2qGvRBYWA8/MjJN32sFFREST0FBvCSZLzxZG/1X48xFv8mA
         oIvc0sDjoZaUtkEhcu6+OvZnF9dg1X8v+ENMczP8Zx4Mh91JOTaAz0DaZ6lTXVtVsNx7
         zTpQ==
X-Forwarded-Encrypted: i=1; AKwUvByI4n82ls4udUBSac6WPChQE/oNyRdL9BLX7TlrYqmtRIlT0S7m+V8HMXyRcis1YKH0wNIXJNacq52R8Zk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f/qotqeoNgeAEeQt2RPCB6dF/mKMxIFO8lxs0H204A40igcRU
	fweMxH2qJ+3GPqy9srk438ri5bnEL+Pru39hLwKh8JYdTHWRqCN8q+W/okiaqZ5OXDbxAV9ifhG
	VHMh3pvo8fW5LG7eTX9vkuD1FEoqu8m0=
X-Gm-Gg: AYBFou1sn03B3Ith/kHSSEK5I2YEwyLFmBRYSGro8DY/lVzGl+sD+k6Z6EdmUam5Yb9
	9B8V4Gu4+SlukT+abom2UkFzE4B93am+RB0emxiyJxD/0zKcQCNq16ra5uZW7Qk3H/02Yx8KJxY
	0A5V5jiZg8xA1aINC3YaNsSBYX6DNH1/cz07Bv0JG3CczcFV2OYI9LFEpEmUhQNUGbUcS1gDAlB
	hwQtVg0bIvdM47058FseDrA58uXUBVPE3/wdw8chEBXIZmo7R9xCyEF6DdDlyC4DtVeA1p7j2Z7
	mgt8l14/pjWdUVrfbR9grmY2ou6o6NLRHwQxahBMU7QVC9unu6Y8Z5U4eRCPG2/jqsVndutNAz2
	CR1ViA0RVWNOQFKWPMIn692gKl/ClNe9UfCrGCauhPbqxoTsgo83bvmg7gA==
X-Received: by 2002:a05:6512:2383:b0:5bf:d2ab:2db with SMTP id
 2adb3069b0e04-5bfd95885fbmr2739757e87.21.1793630311537; Mon, 02 Nov 2026
 06:38:31 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101101347.3910654-1-anilkaushikwireless@gmail.com> <20261101101347.3910654-3-anilkaushikwireless@gmail.com>
In-Reply-To: <20261101101347.3910654-3-anilkaushikwireless@gmail.com>
From: Anil Kaushik <anilkaushikwireless@gmail.com>
Date: Mon, 2 Nov 2026 20:08:19 +0530
X-Gm-Features: AclHuK8he1-L7JBcr8o_ziZkt640nJt1wti4Tfznt5AttnipuCK3bK_mDbQ9j3U
Message-ID: <CAG0Mgm8Of6wqcBjZbbZ4+moVbPYShBifLsMedC74q8b_j3Tehw@mail.gmail.com>
Subject: Re: [PATCH net v3 2/2] netlink: Check a group again if it was
 released while joining it
To: netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Ido Schimmel <idosch@nvidia.com>, Nicolas Dichtel <nicolas.dichtel@6wind.com>, 
	Jacob Keller <jacob.e.keller@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Florian Westphal <fw@strlen.de>, Mat Martineau <martineau@kernel.org>, 
	XingWang Xiang <v3rdant.xiang@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The Medium is identified correctly, v4 will fix it.

The deadlock already exists without this patch, I have sent a separate patc=
h.
https://lore.kernel.org/netdev/20261102120929.4077030-1-anilkaushikwireless=
@gmail.com/

On Sun, Nov 1, 2026 at 3:44=E2=80=AFPM Anil Kaushik
<anilkaushikwireless@gmail.com> wrote:
>
> genl_bind() checks a group under cb_lock, but netlink_setsockopt() and
> netlink_bind() set the membership bit only after it returns and the lock
> is dropped. If the family is unregistered in between, its members are
> cleared before this socket is one. The socket then becomes a member of a
> group ID that no family owns, or that a family registered in the
> meantime got, and the GENL_MCAST_CAP_* flags of that family are never
> checked for it.
>
> Count per group in the netlink table how many times its members were
> cleared, which genetlink does when it frees the group IDs of a family.
> Read the count before ->netlink_bind() and again once the table is
> grabbed. If it changed, the group was released, so check it again
> against its current owner. ->netlink_unbind() is not called for it: the
> family that ->netlink_bind() checked it against is gone.
>
> bind() can then fail after it gave the socket its port ID. This only
> happens when a family is unregistered meanwhile.
>
> genl_bind() was added, with its first capability check, in the commit
> in the Fixes tag.
>
> Link: https://lore.kernel.org/netdev/179340003139.3131.112747177689286427=
24@kernel.org/
> Fixes: 4d54cc32112d ("mptcp: avoid lock_fast usage in accept path")
> Signed-off-by: Anil Kaushik <anilkaushikwireless@gmail.com>
> ---
>  net/netlink/af_netlink.c | 61 +++++++++++++++++++++++++++++++++++++++-
>  net/netlink/af_netlink.h |  1 +
>  2 files changed, 61 insertions(+), 1 deletion(-)
>
> diff --git a/net/netlink/af_netlink.c b/net/netlink/af_netlink.c
> index fec2879c497d..e1af3ac4bf6d 100644
> --- a/net/netlink/af_netlink.c
> +++ b/net/netlink/af_netlink.c
> @@ -780,6 +780,8 @@ static int netlink_release(struct socket *sock)
>                         old =3D nl_deref_protected(nl_table[sk->sk_protoc=
ol].listeners);
>                         RCU_INIT_POINTER(nl_table[sk->sk_protocol].listen=
ers, NULL);
>                         kfree_rcu(old, rcu);
> +                       kfree(nl_table[sk->sk_protocol].mc_gen);
> +                       nl_table[sk->sk_protocol].mc_gen =3D NULL;
>                         nl_table[sk->sk_protocol].module =3D NULL;
>                         nl_table[sk->sk_protocol].bind =3D NULL;
>                         nl_table[sk->sk_protocol].unbind =3D NULL;
> @@ -990,6 +992,8 @@ static int netlink_bind(struct socket *sock, struct s=
ockaddr_unsized *addr,
>         struct net *net =3D sock_net(sk);
>         struct netlink_sock *nlk =3D nlk_sk(sk);
>         struct sockaddr_nl *nladdr =3D (struct sockaddr_nl *)addr;
> +       struct netlink_table *tbl =3D &nl_table[sk->sk_protocol];
> +       unsigned int gen[BITS_PER_TYPE(u32)];
>         int err =3D 0;
>         unsigned long groups;
>         bool bound;
> @@ -1023,9 +1027,14 @@ static int netlink_bind(struct socket *sock, struc=
t sockaddr_unsized *addr,
>                         return -EINVAL;
>         }
>
> +retry:
>         if (nlk->netlink_bind && groups) {
>                 int group;
>
> +               netlink_lock_table();
> +               memcpy(gen, tbl->mc_gen, sizeof(gen));
> +               netlink_unlock_table();
> +
>                 /* nl_groups is a u32, so cap the maximum groups we can b=
ind */
>                 for (group =3D 0; group < BITS_PER_TYPE(u32); group++) {
>                         if (!test_bit(group, &groups))
> @@ -1057,6 +1066,22 @@ static int netlink_bind(struct socket *sock, struc=
t sockaddr_unsized *addr,
>         netlink_unlock_table();
>
>         netlink_table_grab();
> +       if (nlk->netlink_bind && groups) {
> +               unsigned long released =3D 0;
> +               int group;
> +
> +               for_each_set_bit(group, &groups, BITS_PER_TYPE(u32))
> +                       if (gen[group] !=3D tbl->mc_gen[group])
> +                               __set_bit(group, &released);
> +               /* see netlink_setsockopt(), undo the others and retry al=
l */
> +               if (released) {
> +                       netlink_table_ungrab();
> +                       netlink_undo_bind(BITS_PER_TYPE(u32), groups & ~r=
eleased,
> +                                         sk);
> +                       bound =3D true;
> +                       goto retry;
> +               }
> +       }
>         netlink_update_subscriptions(sk, nlk->subscriptions +
>                                          hweight32(groups) -
>                                          hweight32(nlk->groups[0]));
> @@ -1686,6 +1711,8 @@ static int netlink_setsockopt(struct socket *sock, =
int level, int optname,
>                 break;
>         case NETLINK_ADD_MEMBERSHIP:
>         case NETLINK_DROP_MEMBERSHIP: {
> +               struct netlink_table *tbl =3D &nl_table[sk->sk_protocol];
> +               unsigned int gen =3D 0;
>                 int err;
>
>                 if (!netlink_allowed(sock, NL_CFG_F_NONROOT_RECV))
> @@ -1695,12 +1722,25 @@ static int netlink_setsockopt(struct socket *sock=
, int level, int optname,
>                         return err;
>                 if (!val || val - 1 >=3D nlk->ngroups)
>                         return -EINVAL;
> +retry:
>                 if (optname =3D=3D NETLINK_ADD_MEMBERSHIP && nlk->netlink=
_bind) {
> +                       netlink_lock_table();
> +                       gen =3D tbl->mc_gen[val - 1];
> +                       netlink_unlock_table();
>                         err =3D nlk->netlink_bind(sock_net(sk), val);
>                         if (err)
>                                 return err;
>                 }
>                 netlink_table_grab();
> +               /* The group was released after ->netlink_bind() checked =
it, and
> +                * may have a new owner now. The old one is gone, so chec=
k the
> +                * group again without ->netlink_unbind().
> +                */
> +               if (optname =3D=3D NETLINK_ADD_MEMBERSHIP && nlk->netlink=
_bind &&
> +                   gen !=3D tbl->mc_gen[val - 1]) {
> +                       netlink_table_ungrab();
> +                       goto retry;
> +               }
>                 netlink_update_socket_mc(nlk, val,
>                                          optname =3D=3D NETLINK_ADD_MEMBE=
RSHIP);
>                 netlink_table_ungrab();
> @@ -2031,6 +2071,7 @@ __netlink_kernel_create(struct net *net, int unit, =
struct module *module,
>         struct sock *sk;
>         struct netlink_sock *nlk;
>         struct listeners *listeners =3D NULL;
> +       unsigned int *mc_gen =3D NULL;
>         unsigned int groups;
>
>         BUG_ON(!nl_table);
> @@ -2052,7 +2093,8 @@ __netlink_kernel_create(struct net *net, int unit, =
struct module *module,
>                 groups =3D cfg->groups;
>
>         listeners =3D kzalloc(sizeof(*listeners) + NLGRPSZ(groups), GFP_K=
ERNEL);
> -       if (!listeners)
> +       mc_gen =3D kcalloc(groups, sizeof(*mc_gen), GFP_KERNEL);
> +       if (!listeners || !mc_gen)
>                 goto out_sock_release;
>
>         sk->sk_data_ready =3D netlink_data_ready;
> @@ -2069,6 +2111,7 @@ __netlink_kernel_create(struct net *net, int unit, =
struct module *module,
>         if (!nl_table[unit].registered) {
>                 nl_table[unit].groups =3D groups;
>                 rcu_assign_pointer(nl_table[unit].listeners, listeners);
> +               nl_table[unit].mc_gen =3D mc_gen;
>                 nl_table[unit].module =3D module;
>                 if (cfg) {
>                         nl_table[unit].bind =3D cfg->bind;
> @@ -2079,6 +2122,7 @@ __netlink_kernel_create(struct net *net, int unit, =
struct module *module,
>                 nl_table[unit].registered =3D 1;
>         } else {
>                 kfree(listeners);
> +               kfree(mc_gen);
>                 nl_table[unit].registered++;
>         }
>         netlink_table_ungrab();
> @@ -2086,6 +2130,7 @@ __netlink_kernel_create(struct net *net, int unit, =
struct module *module,
>
>  out_sock_release:
>         kfree(listeners);
> +       kfree(mc_gen);
>         netlink_kernel_release(sk);
>         return NULL;
>
> @@ -2113,6 +2158,17 @@ int __netlink_change_ngroups(struct sock *sk, unsi=
gned int groups)
>         if (groups < 32)
>                 groups =3D 32;
>
> +       if (tbl->groups < groups) {
> +               unsigned int *mc_gen;
> +
> +               mc_gen =3D kcalloc(groups, sizeof(*mc_gen), GFP_ATOMIC);
> +               if (!mc_gen)
> +                       return -ENOMEM;
> +               memcpy(mc_gen, tbl->mc_gen, tbl->groups * sizeof(*mc_gen)=
);
> +               kfree(tbl->mc_gen);
> +               tbl->mc_gen =3D mc_gen;
> +       }
> +
>         if (NLGRPSZ(tbl->groups) < NLGRPSZ(groups)) {
>                 new =3D kzalloc(sizeof(*new) + NLGRPSZ(groups), GFP_ATOMI=
C);
>                 if (!new)
> @@ -2157,6 +2213,9 @@ void __netlink_clear_multicast_users(struct sock *k=
sk, unsigned int group)
>         struct netlink_table *tbl =3D &nl_table[ksk->sk_protocol];
>         struct hlist_node *tmp;
>
> +       /* the group can be given to another user, see netlink_setsockopt=
() */
> +       tbl->mc_gen[group - 1]++;
> +
>         sk_for_each_bound_safe(sk, tmp, &tbl->mc_list) {
>                 /* bitmap predates the group, can't be a member */
>                 if (group - 1 >=3D nlk_sk(sk)->ngroups)
> diff --git a/net/netlink/af_netlink.h b/net/netlink/af_netlink.h
> index 778a3809361f..d5e2e404fd11 100644
> --- a/net/netlink/af_netlink.h
> +++ b/net/netlink/af_netlink.h
> @@ -64,6 +64,7 @@ struct netlink_table {
>         struct listeners __rcu  *listeners;
>         unsigned int            flags;
>         unsigned int            groups;
> +       unsigned int            *mc_gen;
>         struct mutex            *cb_mutex;
>         struct module           *module;
>         int                     (*bind)(struct net *net, int group);
> --
> 2.25.1
>

pw-bot: cr
