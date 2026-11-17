Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903488;
	b=2fH1Ybd99U7nuBlnqkl/XfiV6Xk74sQjKLlChnfHimtwiQ8WNKWMjIjOaPXg8AYdxLRD
	 aipaV6UbREzr5QuxQKDp8TMO2AVGBG1UDutcpKvoErDGqO2i5eYjtUq9L9lZxcE0xXZmd
	 fBoYiGxM3ra/ZLdcDRcz7uDjMSZ3sMJtvkYmTjuKRQxJkeVmPXdb6IO5xP+B2lS7UL3h7
	 ZuOJiRFRGtYO28E/H3H47iBW5Wo05T22zItvWwHZVKXxQVN4Ez4GAki+MLR17jJqMw4ZY
	 F+2XGRrxDeHTOdii4DybudVWJK0vlPRp3um52nPQe93L/5SUEP1wCna1DT/MLn5yytA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903488;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=jY+9TWBtAeF2CFQwS+xjxt4ZJ04a32EQCLLfMF6sC9o=;
	b=mof5opg4wpuqahgzrUSokG7g69pGQzzagyC8HXhKahym/Q6FBxGsfm8j+6ZZUsFutnBy
	 lbsD9YJyf71NltG1bEuTz84VdMbhWwZm6zTmqqQQ+vhCgFUM0hpCKx7fu2OL1RNU7DLwB
	 pLFHKd2FnoVkmmHDQFRWbvVUHOyDEBfDTiz1ar+36dM1keuae8g9tdWfLk3aXfSjdDfqV
	 p9/dbvt7d9bEzmnXBJaFogEF9RxvX3zCHA6JgsUL8oVgMif7EUlLLLJg3F4/lIUWKtJ2l
	 anGjuY5D8EI0G3bYb/AUaN5Dq6xautNCPWqMdNG6rQ1GxOm8PjpFXnf6NsgIvQY8bCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0F+SFTQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 728B7606A323
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0F+SFTQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E1AC1F000C5
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903488;
	bh=jY+9TWBtAeF2CFQwS+xjxt4ZJ04a32EQCLLfMF6sC9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F0F+SFTQzuYttdly0uM6MzzLasG95AmEGRDXvibMqR8tsUbmZ4DYCQxL2OQoq4PhC
	 OMMTv/DjuQGYu8ez39GaP74iMDBDbWoxVXt7CbHstA0dxW6wr5qOa0HHKEdE9lFydt
	 3l5Lpt2/Kq2OWgUE9HeiRupFevUZYS/AZo+ev4jexdL5m6SJtYdZz7UN4Z51pE67xt
	 2Q6n2+FwzHXM/AzQQqbTrZcjlupf1D7/10cXmxOP2IMdNBiKlX8N6BehBj7AotyR76
	 tF1w8qJqFi8KGVMr9ubHi8AG0qugG6vpLvdrJ9IzVLlbybNJfhvqq1ifeJZnK/oY06
	 pNikoNHVC/kxQ==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6de2f213b7aso1679669eaf.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 00:18:08 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEIjE499TzvaMyZzMUOiHd4viVsN5t72+7TmDNxn9VvaRoswwcwqUVBSlEijehdbih0ejBIYGbEKzPWZNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z85Lv/J4Oe/UlDWbYZ51nykhPMUIHNQDmCl09/kMrrjkVoylEra
	RJj+IVUyGvAXUyZIEdzgkt/9Wc1fACNLIWLO6aFBDligtMyjlRi/Co0ywe2IvP8S8pSGSU628SX
	9TNgf9J7Mn2Vpo9iXJGt3p7tw1Ex9dLw=
X-Received: by 2002:a05:6820:2219:b0:71a:dd74:1ee5 with SMTP id
 006d021491bc7-71add742771mr5182800eaf.43.1794903487596; Tue, 17 Nov 2026
 00:18:07 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com>
In-Reply-To: <20261117-tcp-mtu-probing-doc-v1-v1-1-552ae04de4ef@gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 17 Nov 2026 09:17:56 +0100
X-Gmail-Original-Message-ID: <CAL4WiirGY0a-ybU9YQF=DUwvT=LwYQ3T-Xum69m1jvUJZgmAbw@mail.gmail.com>
X-Gm-Features: AclHuK8Gl49qsnZUNoWiS5IYuX-GT6usEXRrdpt-iZywYA4rtgmzbRoXuglD4fw
Message-ID: <CAL4WiirGY0a-ybU9YQF=DUwvT=LwYQ3T-Xum69m1jvUJZgmAbw@mail.gmail.com>
Subject: Re: [PATCH net-next] tcp: document black hole detection for tcp_mtu_probing
To: echoowall@gmail.com
Cc: corbet@lwn.net, pabeni@redhat.com, davem@davemloft.net, kuba@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuniyu@google.com, 
	rdunlap@infradead.org, horms@kernel.org, ncardwell@google.com, 
	linux-doc@vger.kernel.org, skhan@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mar. 17 nov. 2026 =C3=A0 09:09, Yongjian Wang via B4 Relay
<devnull+echoowall.gmail.com@kernel.org> a =C3=A9crit :
>
> From: Yongjian Wang <echoowall@gmail.com>
>
> ip-sysctl.rst says that tcp_mtu_probing=3D1 enables MTU probing once an
> ICMP black hole is detected, but not when that happens or what TCP
> does then.
>
> Describe both, as implemented in tcp_write_timeout() and
> tcp_mtu_probing(). Also add the missing defaults of tcp_mtu_probing
> and tcp_base_mss.
>
> Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> ---
> This describes the behavior checked by the black hole detection tests
> added in commit 8a83f21ad75d ("selftests/net: packetdrill: add TCP black
> hole detection tests").
> ---
>  Documentation/networking/ip-sysctl.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/Documentation/networking/ip-sysctl.rst b/Documentation/netwo=
rking/ip-sysctl.rst
> index 0b7bfbd98a92..a11baf04758c 100644
> --- a/Documentation/networking/ip-sysctl.rst
> +++ b/Documentation/networking/ip-sysctl.rst
> @@ -412,6 +412,8 @@ tcp_base_mss - INTEGER
>         Path MTU discovery (MTU probing).  If MTU probing is enabled,
>         this is the initial MSS used by the connection.
>
> +       Default: 1024
> +
>  tcp_mtu_probe_floor - INTEGER
>         If MTU probing is enabled this caps the minimum MSS used for sear=
ch_low
>         for the connection.
> @@ -711,6 +713,20 @@ tcp_mtu_probing - INTEGER
>         - 1 - Disabled by default, enabled when an ICMP black hole detect=
ed
>         - 2 - Always enabled, use initial MSS of tcp_base_mss.
>
> +       A black hole is detected when the retransmission timer fires afte=
r
> +       the handshake and retransmissions have stayed unacknowledged for =
as
> +       long as tcp_retries1 retransmissions would take with the minimum
> +       RTO, which is 3 seconds with the default tcp_retries1.

"minimum RTO" is ambiguous in this file: readers will think of
tcp_rto_min_us or the per-route rto_min. retransmits_timed_out() uses
the TCP_RTO_MIN constant here, so I would spell out 200 ms.

It might also be worth saying that this time is counted from the first
retransmission, and only checked when the timer fires. For a flow with
a 200 ms RTO, the detection happens at the fifth timeout, about
6 seconds after the original transmission.

(The 3 seconds also assume the default tcp_rto_max_ms, but I do not
think this needs to be documented.)

> +
> +       With value 1, the first detection enables MTU probing and the MSS
> +       falls back to tcp_base_mss. Each later detection, or any detectio=
n

The MSS is only lowered: tcp_sync_mss() uses
min(mss, search_low mss), so a connection already below tcp_base_mss
keeps its MSS.

"Each later detection" could be "Each further retransmission timeout",
since tcp_mtu_probing() is called on every RTO once the threshold has
been reached.

> +       with value 2, lowers search_low to half its MSS, keeping it at mo=
st
> +       tcp_base_mss and at least tcp_mtu_probe_floor and tcp_min_snd_mss=
.
> +       Once MTU probing is enabled, the connection also probes for a lar=
ger
> +       MSS, as with value 2.
> +
> +       Default: 0
> +
>  tcp_probe_interval - UNSIGNED INTEGER
>         Controls how often to start TCP Packetization-Layer Path MTU
>         Discovery reprobe. The default is reprobing every 10 minutes as
>
> ---
> base-commit: 6ff4c5942a301675eb12e5b49d53a81e604624a1
> change-id: 20261117-tcp-mtu-probing-doc-v1-351cb754fa7b
>
> Best regards,
> --
> Yongjian Wang <echoowall@gmail.com>
>

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
