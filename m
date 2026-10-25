Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792926409;
	b=YN3wyLp/7BinE+tPcpuIsYwLJ83No1lt4IIaaliORQcZbxrX0d1b2FT3qdxkru7Dasn+
	 RSUHMUiQ4OI7/LxDsPyAJ15OCR/vw2QqMFx7t7Pn7Bt3fWowjXBEexSEcfGgh9zJ3P9Du
	 0QT0S/n9uc+WUukb7fjgF5Bkr8iJeVrHynMtt8lekSlV5ViPcUcaFhmQLZSVw8NXgy7BP
	 3XgvJsYeo5ESAyipxzi1vhQIN6KJlpU/cODVVcVqO8R8U0eLz93BQqvHLPh9ZQn0f0qmq
	 3mJawe0Cf6G9CD82vIS8MFTKP3VVY0641d4Vds1VSdBZ20b/yvpgPHyWHq9mZaedqcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792926409;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=q8QFqFVU2TIq+fRj7XEFcJOFqOFfCbmK26EbqaytbZc=;
	b=kKoYq9BVvua+0Zo1EZSOsIKQJRNu2fer84G3Fj/JrdjiERmepjGyaeqJa7ZfZNioP3ud
	 0hLTNhsdds0kILhlvH++htJT/YKCYjqpAnNKp5qWb4uaf3vuW01DQxwaZw8WMCT/UGITk
	 iOG0JTMYqa8S5GiFCKL7R8yHw3FkXCJomi2kApUsfyxf+AViv632eS4Op0L6PQL4ge+Xs
	 JfB2LNoeT4j95hRTUdQUie8SkL5tk8e666ksQRgmX25Qr4+KJaRTcDuAPfPiFCO2KqJUc
	 PKjmpuvDbenjJRKi0bikQiTa1LbEz8HN8t08szNlCwyTCR2usSC+0h9SYYeKCES3eeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctFufPld;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA14606A31B
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctFufPld
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3861F031E1
	for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 11:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792926407;
	bh=q8QFqFVU2TIq+fRj7XEFcJOFqOFfCbmK26EbqaytbZc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ctFufPldIruaHYiWgdHTA5LmSb7iUT/0vfe8lVzHfGPl6G/rePby6RXhigTLFTamR
	 JxZGMwG8q9/qpn4uxYac4pKfNJqwWNW+W41C0vV+1JCcn7pdP7tBtGGk32TSo5kfV9
	 bN+ZGHsUQeF68nXx/flAFyVYhSJ2fpwt/zByNO28ekZyOkBakjU9S3SicdOoP1UjrU
	 ooFj8gIxyETO2jmRhdTEbLHEcdroXLN59nGfLqJqYSdgrfcOZNk3fec0YudCu7lbR9
	 GeC3OAPYVwte4xb/vMiGm8XAvAdOVsVY6h/Ex9KQvMxmO9TFSWU5JoJuOLFWeivs6W
	 WmozWGFoKeYmg==
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-49e1251674cso774239fac.2
        for <linux-kernel@vger.kernel.org>; Sun, 25 Oct 2026 04:06:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxtfO70yseTu53uDSxN+Ijx0nR0n2o72WQMBasbb+Pn9G6g3fbtuSYvjFroLpSu7SSD1E0c3+ixeQJGT1Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYKaHY3cobQHXhobo0a/syCs4j6KoK58t/ruZtWYJ5gwIc624gZs
	1pwx+swbmsUulCDZMNkk35PUp1UtUSUM9Igic8p3xzD71sHIYf38nkCXrtsttNl7YjmeQbAOT4j
	GS8hc3AyNDYkhQwK3LRyTVkV0HCJfDwg=
X-Received: by 2002:a05:6870:6711:b0:448:9d5b:6393 with SMTP id
 586e51a60fabf-4a83f4e6266mr2614503fac.14.1792926407085; Sun, 25 Oct 2026
 04:06:47 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261025090048.27870-1-yzwlhm@gmail.com> <20261025090048.27870-2-yzwlhm@gmail.com>
In-Reply-To: <20261025090048.27870-2-yzwlhm@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Sun, 25 Oct 2026 12:06:34 +0100
X-Gmail-Original-Message-ID: <CAL4WiiqZM-DJWva1+aKz04ie+XTF0eN0Bym=-HGnDeJEf2d90w@mail.gmail.com>
X-Gm-Features: AclHuK8MoOn_s4LcJ_Eje-MumSnu3vJ4q5oreeQo1DV6EIvk8EtAP0yZLxdlRnk
Message-ID: <CAL4WiiqZM-DJWva1+aKz04ie+XTF0eN0Bym=-HGnDeJEf2d90w@mail.gmail.com>
Subject: Re: [PATCH net 1/2] tcp: Fix fastreuse cache initialization on first bind
To: Zhewei Yuan <yzwlhm@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Neal Cardwell <ncardwell@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 25 oct. 2026 =C3=A0 10:01, Zhewei Yuan <yzwlhm@gmail.com> a =C3=A9c=
rit :
>
> inet_csk_update_fastreuse() initializes the reuse caches only when
> tb->bhash2 is empty. Both inet_csk_get_port() and __inet_inherit_port()
> link tb2 before calling it, so this condition is never met.
>
> Fresh buckets therefore miss fastreuse=3D1 for SO_REUSEADDR, forcing
> repeated binds to scan existing owners. SO_REUSEPORT starts in STRICT
> instead of ANY, causing repeated fast-path misses with alternating
> addresses.
>
> Initialize the caches when tb2 is the sole entry in tb->bhash2 and has
> no owners. Both checks prevent reinitializing an already-used bucket.
>
> On historical net f4377bf85887, 16000 SO_REUSEADDR binds to one IPv4
> address/port take 4256.956 ms before and 20.004 ms after the fix in a
> one-vCPU KVM guest (bind-only means of 3 boots x 3 rounds).
>
> Found by manual inspection and GDB tracing. Codex assisted with
> analysis, validation and wording; test/benchmark assistance is
> described in the cover letter.
>
> Fixes: 8002d44fe84d ("tcp: Check hlist_empty(&tb->bhash2) instead of hlis=
t_empty(&tb->owners).")
> Signed-off-by: Zhewei Yuan <yzwlhm@gmail.com>
>
> ---
>  net/ipv4/inet_connection_sock.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection_s=
ock.c
> index 8151c638a24..93b306d91b6 100644
> --- a/net/ipv4/inet_connection_sock.c
> +++ b/net/ipv4/inet_connection_sock.c
> @@ -446,7 +446,8 @@ void inet_csk_update_fastreuse(const struct sock *sk,
>  {
>         bool reuse =3D sk->sk_reuse && sk->sk_state !=3D TCP_LISTEN;
>
> -       if (hlist_empty(&tb->bhash2)) {
> +       if (hlist_is_singular_node(&tb2->bhash_node, &tb->bhash2) &&
> +           hlist_empty(&tb2->owners)) {
>                 tb->fastreuse =3D reuse;
>                 if (sk->sk_reuseport) {
>                         tb->fastreuseport =3D FASTREUSEPORT_ANY;
> --
> 2.52.0
>

Indeed, inet_bind2_bucket_init() adds tb2 to tb->bhash2, so the
first-bind branch has been dead since 8002d44fe84d.

Since timewait sockets are also linked on tb2->owners, this is
equivalent to the old hlist_empty(&tb->owners) test.

Reviewed-by: Eric Dumazet <edumazet@edumazet@kernel.org>

Please send this patch alone (no cover letter). Patch 2 is not net
material, I doubt we want it
(see my separate feedback on it)
