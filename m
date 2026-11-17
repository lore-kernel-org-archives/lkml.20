Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907259;
	b=IJP9+jyf4dN5qrxZwUK8s04sznfykTHZE286dZoN0DVg5vcvyTdeIzTLcyZqxU9hUGuu
	 Bt+0OD7uHzpERnj/jDBWWUwkOtAN7ETFQPkDDUxjaYRqIqBr0o5/Rq3+gQsDSiy5Qy6wJ
	 zfEHu6SJwUJeXkSp4x72IQD/tB1wq/zfTdbZSPBbiRpd+pwjUM+PYxOC8cxy3s4vSMZi6
	 9KHCL6TCH3ehMdxqoRw2b/imRe6x1eiMEiXaddbwTCyz/hOQnQbNjNi4NLfk/guhsVezm
	 W/6KKd+XousTTQfHdgLqTCFTgUGX39llfGEWjGxwuT1zAjesgJnB1atsEGLJVGkACDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907259;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GHb3MG4ar21Ji9AsYm3wR9uXYPAPEdFfHbmibMl1wnw=;
	b=pkPLNnEuTdrXSdeJoe4xzpvDlQzO5qGXIXfGQidPxzrxO6Fh/w7zo7r/1+CobKLwNteA
	 wGfVg127PjWIR26V1SDYp19Mb9bQCnX0+JfxEmm5sfvPrYC8zGflrqRh4cA7FTsmA6Pju
	 FgGXRymanV0QAaeJrwNSJLk1APuVYLg9B1pcrLhKnNpZMnXEz5m7CY7mVOgLAnVOFgk4G
	 TRiv3iy/j89G/1/xF3Mt/Y43FgExkRzYlDVun/10WITIZFDdWzH2qmXYDX5cSvhOIZQg+
	 6NbnkB/kxNjCpb/xIa9KvW3nQYToUx+fc/U3yzZCE3ELCjw6JbBL9bujsfklWQvaP6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3+peLbh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E356606A31C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P3+peLbh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F5F21F000C8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 09:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794907259;
	bh=GHb3MG4ar21Ji9AsYm3wR9uXYPAPEdFfHbmibMl1wnw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P3+peLbhVPkT5lkGdgB7/HVy4oaUes6i9lRf2E1TJSPddf2QGN4en8JmxjB9t7LV8
	 xK3QnX4wjy245nh9wCkbThws3xgUe1dP5ZzhWkpK0SGfJRG1uQ0t2gatN5MiZxKrBg
	 7TSX6vN6xMF4rMpZgpbw5Gx2Pg1Zeoa5qC2A+5qnSb5zMBkRc4M767pPH6G8QZHK4l
	 4yrNBwE6RaKWkjxKOxEUqz2zjWkMWfveTgY8ahvUitkTZ7yF5QeSUVYvNbeJjlFllO
	 YpznL7Jm2bJSIKOYQ2RECfuKTbewytcUgDyke4rmO0OB+UkmJQMHeX1sNYcSijiu7m
	 v3JmTDZr0d7Yg==
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-6d290b10a35so1718176eaf.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 01:20:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGTv2hRsaI16Tc5XnIDzu4rJL8YVedplLHAjp/ZqADNs0xwfOmgLXTCcf9NxzzlYRsQ7LYmTb8JiK85G9c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ciQufFaDSdgi0tuPYjp7To2GyrAPa5q04mr2vGs2YgeOF1DVP
	9zGrn2ifxnCQtI0z4PvVo+T+Y3XDPourmsTCLpLS9COsO6F+4iAAdvfZ8Wy9v9hZL5s0DIADMKw
	DsgvsiCxTkyRufcSICeWgXRXw5yZBsHs=
X-Received: by 2002:a05:6820:168c:b0:6dd:bc51:888d with SMTP id
 006d021491bc7-71acc1970cemr6535008eaf.87.1794907258431; Tue, 17 Nov 2026
 01:20:58 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117041029.80543-1-juanagusnicco@gmail.com>
In-Reply-To: <20261117041029.80543-1-juanagusnicco@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 10:20:47 +0100
X-Gmail-Original-Message-ID: <CAL4WiiptsFQ6dinHeAGrpxeXxdn0meRSR9tkEQaTkopPJiub7A@mail.gmail.com>
X-Gm-Features: AclHuK_1jsrjd0rFQKTxUrwhKy8SYCc-iBIqOUG61SFod-auZpaFVEhEMskdUeE
Message-ID: <CAL4WiiptsFQ6dinHeAGrpxeXxdn0meRSR9tkEQaTkopPJiub7A@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp_metrics: hash the destination address with SipHash
To: Juan Agustin Niccolini <juanagusnicco@gmail.com>
Cc: Neal Cardwell <ncardwell@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 05:10, Juan Agustin Niccolini
<juanagusnicco@gmail.com> a =C3=A9crit :
>
> The tcp_metrics bucket is derived from a fold of the peer address.
> For IPv4 the fold is ipv4_addr_hash(), which returns the address
> unchanged. For IPv6 it is ipv6_addr_hash(), which XORs the four
> 32-bit words of the address. net_hash_mix() is only XORed in after
> that fold, so two addresses of either family with the same fold share
> a bucket in every netns.
>
> A remote attacker with an IPv6 /64 can thus compute, without knowing
> net_hash_mix(), addresses that collide with a chosen IPv4 or IPv6 address=
:
>
>   w3 =3D w2 ^ p0 ^ p1 ^ target    /* p0, p1: prefix, w2: free */
>
> A bucket holds six entries and the seventh insert replaces the oldest.
> tcp_init_metrics() seeds the initial RTO from the cached RTT, so the
> attacker can tell whether an entry it planted was evicted. Filling the
> bucket of a chosen address with such entries reveals whether that
> address, or another one in the same bucket, connected in the meantime.

Note that entries are created from tcp_update_metrics(), when the
flow is closed, not when the victim connects.

>
> The same test, with six entries of one fold and a seventh of another,
> shows whether two folds share a bucket. Each answer rules out values
> of net_hash_mix(), the only unknown, and since XOR and multiply is not
> a PRF a few hundred answers recover it. The attacker can then fill
> every bucket and see which one any client's connection evicts from.

How many connections does your reproducer need, for each phase ?

1) Recovering net_hash_mix().

2) Filling the table (16384 * 6 flows with the default size ?),
   then each sweep to find which bucket was hit.

Each probe also has to wait for an RTO, so wall time matters too.

Also, how does this behave on a server with real traffic ? Every
other client closing a flow evicts entries as well. You mention
a test against Ubuntu 24.04 over the internet, was this host
serving anything else ?

Please add these numbers to the changelog, they are needed
to evaluate how practical this is, and if this is net or net-next
material.

Note that many servers (including Google ones) have tcp_no_metrics_save=3D1

> The multiplication in hash_32() is invertible, so that bucket leaks
> about 14 bits of the client's address, depending on the number of
> buckets.
>
> Hash the address with SipHash and a random key instead, as commit
> 2ee66e948717 ("inetpeer: randomize RB-tree node comparison using SipHash"=
)
> did for inet_peer. net_hash_mix() and hash_32() are kept, to separate
> namespaces and to reduce the result to the table size.
>
> Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
> Cc: stable@vger.kernel.org
> Signed-off-by: Juan Agustin Niccolini <juanagusnicco@gmail.com>
> ---
> v2: - use siphash_1u32() for IPv4, a4.vif is always zero in tcp_metrics
>       (Kuniyuki)
>     - call tcpm_addr_hash() once after the address family branches
>     - changelog: explain more clearly why net_hash_mix() and addresses
>       are recoverable
> v1: https://lore.kernel.org/netdev/20261112064624.15245-1-juanagusnicco@g=
mail.com/
>
> Comments below are the same as on v1.
>
> This can be exploited remotely to recover a client's IPv4 address.
> A single host narrows the address to about 262 thousand candidates,
> and because each netns keys the hash differently, intersecting buckets
> extracted from multiple hosts converges quickly into one candidate;
> 3-5 are enough. The net_hash_mix() value only needs to be extracted
> once per boot per host.
>
> Many common cases facilitate this. For instance, a browser loading
> one page connects to several hosts within the same second. That
> supplies the buckets needed to converge, and the shared timing shows
> they belong to the same client.
>
> I reproduced the bug on a QEMU guest running mainline (2a500a04d6f9) and
> against Ubuntu 24.04 over the internet. With the patch applied, the
> reproducer no longer finds addresses that share a bucket. The
> reproducer is available on request.
>
> For stable: 5.10 and 5.15 lack siphash_aligned_key_t;
> "static siphash_key_t tcpm_hash_key __read_mostly __aligned(16);" can
> be used there.
>
> This bug was discovered during an LLM-based code review.
>
>  net/ipv4/tcp_metrics.c | 28 +++++++++++++++++++++-------
>  1 file changed, 21 insertions(+), 7 deletions(-)
>
> --- a/net/ipv4/tcp_metrics.c
> +++ b/net/ipv4/tcp_metrics.c

Your patch lacks the "diff --git" and "index" lines, and the hunk
headers have no function context. Please use plain git format-patch
for the next version.

The code itself looks good to me.

Thanks.

> @@ -8,6 +8,7 @@
>  #include <linux/init.h>
>  #include <linux/tcp.h>
>  #include <linux/hash.h>
> +#include <linux/siphash.h>
>  #include <linux/tcp_metrics.h>
>  #include <linux/vmalloc.h>
>
> @@ -94,6 +95,22 @@
>
>  static DEFINE_SPINLOCK(tcp_metrics_lock);
>  static DEFINE_SEQLOCK(fastopen_seqlock);
> +
> +static siphash_aligned_key_t tcpm_hash_key __read_mostly;
> +
> +static u32 tcpm_addr_hash(const struct inetpeer_addr *a)
> +{
> +       net_get_random_once(&tcpm_hash_key, sizeof(tcpm_hash_key));
> +
> +       if (a->family =3D=3D AF_INET)
> +               return siphash_1u32((__force u32)a->a4.addr, &tcpm_hash_k=
ey);
> +
> +       return siphash_4u32((__force u32)a->a6.s6_addr32[0],
> +                           (__force u32)a->a6.s6_addr32[1],
> +                           (__force u32)a->a6.s6_addr32[2],
> +                           (__force u32)a->a6.s6_addr32[3],
> +                           &tcpm_hash_key);
> +}
>
>  static void tcpm_suck_dst(struct tcp_metrics_block *tm,
>                           const struct dst_entry *dst,
> @@ -270,13 +287,11 @@
>         case AF_INET:
>                 inetpeer_set_addr_v4(&saddr, inet_rsk(req)->ir_loc_addr);
>                 inetpeer_set_addr_v4(&daddr, inet_rsk(req)->ir_rmt_addr);
> -               hash =3D ipv4_addr_hash(inet_rsk(req)->ir_rmt_addr);
>                 break;
>  #if IS_ENABLED(CONFIG_IPV6)
>         case AF_INET6:
>                 inetpeer_set_addr_v6(&saddr, &inet_rsk(req)->ir_v6_loc_ad=
dr);
>                 inetpeer_set_addr_v6(&daddr, &inet_rsk(req)->ir_v6_rmt_ad=
dr);
> -               hash =3D ipv6_addr_hash(&inet_rsk(req)->ir_v6_rmt_addr);
>                 break;
>  #endif
>         default:
> @@ -284,6 +299,7 @@
>         }
>
>         net =3D sock_net(req_to_sk(req));
> +       hash =3D tcpm_addr_hash(&daddr);
>         hash ^=3D net_hash_mix(net);
>         hash =3D hash_32(hash, tcp_metrics_hash_log);
>
> @@ -310,18 +326,15 @@
>         if (sk->sk_family =3D=3D AF_INET) {
>                 inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_saddr);
>                 inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_daddr);
> -               hash =3D ipv4_addr_hash(inet_sk(sk)->inet_daddr);
>         }
>  #if IS_ENABLED(CONFIG_IPV6)
>         else if (sk->sk_family =3D=3D AF_INET6) {
>                 if (ipv6_addr_v4mapped(&sk->sk_v6_daddr)) {
>                         inetpeer_set_addr_v4(&saddr, inet_sk(sk)->inet_sa=
ddr);
>                         inetpeer_set_addr_v4(&daddr, inet_sk(sk)->inet_da=
ddr);
> -                       hash =3D ipv4_addr_hash(inet_sk(sk)->inet_daddr);
>                 } else {
>                         inetpeer_set_addr_v6(&saddr, &sk->sk_v6_rcv_saddr=
);
>                         inetpeer_set_addr_v6(&daddr, &sk->sk_v6_daddr);
> -                       hash =3D ipv6_addr_hash(&sk->sk_v6_daddr);
>                 }
>         }
>  #endif
> @@ -329,6 +342,7 @@
>                 return NULL;
>
>         net =3D sock_net(sk);
> +       hash =3D tcpm_addr_hash(&daddr);
>         hash ^=3D net_hash_mix(net);
>         hash =3D hash_32(hash, tcp_metrics_hash_log);
>
> @@ -819,7 +833,7 @@
>         if (a) {
>                 inetpeer_set_addr_v4(addr, nla_get_in_addr(a));
>                 if (hash)
> -                       *hash =3D ipv4_addr_hash(inetpeer_get_addr_v4(add=
r));
> +                       *hash =3D tcpm_addr_hash(addr);
>                 return 0;
>         }
>         a =3D info->attrs[v6];
> @@ -829,7 +843,7 @@
>                 in6 =3D nla_get_in6_addr(a);
>                 inetpeer_set_addr_v6(addr, &in6);
>                 if (hash)
> -                       *hash =3D ipv6_addr_hash(inetpeer_get_addr_v6(add=
r));
> +                       *hash =3D tcpm_addr_hash(addr);
>                 return 0;
>         }
>         return optional ? 1 : -EAFNOSUPPORT;
