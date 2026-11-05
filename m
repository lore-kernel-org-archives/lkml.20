Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877488;
	b=UUvRBYF/WugxffRx8Z1dmqJHLzPNPIqIY+HF0AlNSkqx2jrm5cosqBoybgqNveyrDsxY
	 BdvqxzPNLdvP3z7GwCTI6SZdBB6u2D2C6wMlXSYRfcqK0x4+o/sgYq1UUvsYcK/k7EFpL
	 tI+DlzRBI7xZcJ05ijPNfAebJ2dFh+xSiJWCKxBEeDkkh/LRkSkJxDm/ENoA2apsyl0MH
	 EE/DRx3w2o+MwNVpb0SKheE2ljR+xTmX4rDh9pcp72/a193HFGQ16lmuHV62ldXnu1MHv
	 raASwn3cpBrDmRu9RHSNIl7VdnaVluor4c/wm2G73wuP2aXK6xv+SUh77sagHdwqDcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877488;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=wszJKqQ7vFshINTrVXEK5rc9+i0D30W3f9krG8OLLZ8=;
	b=RkMPhZM48AVQHp14BdKTXNKxc7fsf6aE1PU5zN+RCzrZPdQe6WmRL/FpFQSXl4Q9EibW
	 hmy/jvqbv19PiVcANQtIwIZQyC/OHMVAh+71zvsa1a5MoSLXLlhGFl7UVT/xXgdQqBbly
	 hXk0/hlkIy4i1DWfFOj+jQlkMRp+WwLkpilnNt2YYVxSX9pKyfqqYa0ZYPXnAAwAHUeMm
	 ZmMGYDLxeZQWVCD0WkhWUkEqcrtFL1Xx+KUmqyXm9TRpcBwiA5HDHKG7ulD4AgbxsEV8A
	 bqN5YSfnIOkQNmUNd94WEsh6QRtW+Pk/ALZekLJuzgVMO39R3A+d+Xy8cqfwu8GV5uQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e76xliUV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C34B606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=e76xliUV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9EB81F00A1D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 11:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793877488;
	bh=wszJKqQ7vFshINTrVXEK5rc9+i0D30W3f9krG8OLLZ8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=e76xliUVqSDS773EVIGtCtePStew6OrZPphgq8LHxXrk/JDgPNWmKpajYFDFKXGEm
	 zCpKRD0SOx02gK2TET1CzhP729lUv3XrwwBa5BY0cZD8X2IPrxS+7dPgbhfSOLxXwZ
	 mmzGuFDHVeJafZfX5W+tIrD/QOI3qxcn3t9IzYgp45Mqhde1BswUG56UoqrBcELyUb
	 JLtuDKWvif2pdkSsIhQvGohcLv4Lp+6zN78P2PsU4wcH+5y09mK+1ELqXXe8OgaTLG
	 G6W1XhA0f+BntZRPJn3b9UellvFfOI+/kx7VfWlELmtIaJYPhM8m7P2EZyMXPrvX7M
	 nxEw67LopTePQ==
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-4ad89c49e0dso34629fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 03:18:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBx1dPylMa8FM+GMpyAE+cnQcKk9GHDdkWIr/FdjWMvedlOtGRDpvD9+6BILMyeD1XehqalVCwGA2oxwYEU=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SbrwkoijuuZSlA9t48kRhN1NmO5j8wdckBPm7XvwZU+e1QVLw
	fZI1wfcd4fbbHYivy3ofEioqzSJ6KuNYg9GrNwvz8q/vyEtb2jBsQgeSM+h78lu+jvWay/mx0ez
	TvmTpJfarzoe2hezVrjMl3ZwSHNmFICw=
X-Received: by 2002:a05:6870:8092:b0:48f:e0e5:a1df with SMTP id
 586e51a60fabf-4a907749896mr12947836fac.52.1793877487117; Thu, 05 Nov 2026
 03:18:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <CADnh+D0zSzAyYCLo5cXU56o9X-P3RG3N2ix7ARPrP95d8sBXmg@mail.gmail.com>
 <CADnh+D3nz5aehxjvurK+Fv7gF6n4csMm-dFatvdMmg1fWdGSQg@mail.gmail.com>
In-Reply-To: <CADnh+D3nz5aehxjvurK+Fv7gF6n4csMm-dFatvdMmg1fWdGSQg@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Thu, 5 Nov 2026 12:17:56 +0100
X-Gmail-Original-Message-ID: <CAL4WiirS2n23vb9qHUHX+xBWqjiiM2KzCoFR2dysEzdXrcFQpg@mail.gmail.com>
X-Gm-Features: AclHuK-pvn0m-9uS9aQ6FNIbKhQl35Phni9k8v6IFOqKapHq_20UkmcmQL-t-8A
Message-ID: <CAL4WiirS2n23vb9qHUHX+xBWqjiiM2KzCoFR2dysEzdXrcFQpg@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: avoid false bind exhaustion with odd-sized
 port ranges
To: Florin Badita-Nistor <baditaflorin@gmail.com>
Cc: netdev@vger.kernel.org, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	shuah@kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 nov. 2026 =C3=A0 12:04, Florin Badita-Nistor
<baditaflorin@gmail.com> a =C3=A9crit :
>
> inet_csk_find_open_port() rounds the range length down to an even
> number but keeps the original exclusive upper bound for wrapping.
> For an odd-sized range, the two scans can therefore miss a valid port
> and return EADDRINUSE while an eligible port remains free.
>
> For example, restrict a TCP socket to IP_LOCAL_PORT_RANGE [40000, 40002]
> and hold explicit binds on 40000 and 40001. bind(..., 0) always fails,
> although an explicit bind to 40002 succeeds. Both IPv4 and IPv6 TCP and
> MPTCP are affected. A namespace-wide odd-sized ip_local_port_range can
> also trigger the failure without a per-socket range setting.
>
> Keep the full length for the scan bound and wrapping. The two scans
> then cover every candidate in an odd-sized range, with at most one
> repeated candidate when exhausted. Even-sized candidate sequences
> remain unchanged.
>

Please mention the side effect: with an odd @remaining, the wrap
(port -=3D remaining) flips parity, so the first scan is no longer
restricted to odd offsets. For odd-sized ranges, bind() will now pick
ports of the parity __inet_hash_connect() prefers.

I think this is fine: same-parity netns ranges already trigger
"ip_local_port_range: prefer different parity for start/end values",
and __inet_hash_connect() ignores parity (step =3D=3D 1) for per-socket
IP_LOCAL_PORT_RANGE. But the changelog should say so.

Also note that __inet_hash_connect() has the same rounding for
netns-wide ranges, so connect() still misses a port there. This is
fine since the sysctl already warns about this setup, but the
changelog should not suggest netns-wide odd ranges are now fully
handled.


> The issue was triggered while developing port-range selftests with
> Codex assistance, then confirmed using userspace reproducers on
> unmodified kernels. No kernel instrumentation or fault injection was
> needed. Booted x86-64 KVM kernels were tested against the regression
> selftest, the full ip_local_port_range suite, and a Go net.Listen
> reproducer. The Go reproducer fails 100/100 times per IP version before
> the fix and 0/100 afterwards with a three-port namespace range and two
> listeners occupying its first two ports.
>
> Fixes: ea8add2b1903 ("tcp/dccp: better use of ephemeral ports in bind()")
> Cc: stable@vger.kernel.org

This has been there since 2016 and needs an odd-sized range, I would
target net-next and drop the stable Cc.

> Signed-off-by: Florin Badita-Nistor <baditaflorin@gmail.com>
> ---
>  net/ipv4/inet_connection_sock.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index e56beec43..755fcea35 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -343,8 +343,6 @@ inet_csk_find_open_port(const struct sock *sk,
> struct inet_bind_bucket **tb_ret,

Both patches are mangled by your mailer (wrapped hunk header here,
wrapped diff --git line in 2/2), they do not apply. Please use
git send-email for v2.

Also, please trim the cover letter to the problem and the test
results.

The code change itself looks good to me.

pw-bot:cr
