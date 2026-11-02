Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607356;
	b=QqJwgotNH3kk1nYgDFKri7VmYyhnt9aGLdYfSaTA7iddJ9Q6pNcx8JLxVeHNiKGI8GzO
	 ajHISruuXvctfSp3K96NmbFkUeL+X8AotggVMfJLgzT8/mf0N1T/jWDk8zwzoFEzOOd40
	 MLIRtkZP/u/qOjBwtrQEucucvWL4I4Yy4HOxgdrlIQQ8nKFpgRPZktewf12rd9RyfHTsX
	 YyNji1gZomu9dx4yK0Z7qV1jl5z5ctEnP+8AZzW7vq7yUrdtj5a3QR7p4rUqqf2XcYItz
	 fdkhkLbS5yd+/5/+vH2T32ESEI8wFNJqp6+RxM+uMDvjrEYjHyhiFvLtrpnTpe6uhhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607356;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ggVpSG/Q2EbzVO8MsL3OxAqR882doyE1OLiyat9CU3Q=;
	b=4ocZ+4O0Z6o9fmfADoL0Hlpgx7UV991UM6kAG9U6N3WYOMcaZmMRUqB1bGE7RnIx6Ken
	 G4MHdKCjnxFH/JJviOIE5NSJw7yCTxrYN1bCGifqcYUprO4ZLC1sKpwKT9IUxj9hMD/EE
	 qcWPtDnvuv1uKIsJ/HBAFK12LcVs+xOoGrUYnb8nNdsvcFTIN00LtNnwapNAxs+XptJxd
	 acE2w53QWEY8mleajkFmUGayn/GKDzHU7mLIEB7mZrSXMacJHQyHFeWGhzDQb5vh11jrD
	 rfsczzWhMTj4ImEmMotX+EDY9fq5jyINtfZhtd4tqIN6h8p2sp4yD4t4oYoHkFojXzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dooHytXa;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70219606A330
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dooHytXa
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16A411F00A1E
	for <linux-kernel@vger.kernel.org>; Mon,  2 Nov 2026 08:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793607356;
	bh=ggVpSG/Q2EbzVO8MsL3OxAqR882doyE1OLiyat9CU3Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=dooHytXaEmX5IvBrV6UTjQdMy8W56tpSkMndQrRdEvjEH5heTpQih4Uo/9f4PXxAZ
	 mVIRZVdXV0I7idNNg3K/SRuYyrUu/Y0UW8GAi0jQQZZc3Cp+96/3lWSpWu125Lfv9v
	 J3nzq/NxtEAgt4nYml95Se2JHyrQm6Gu0021Z9hGUxURoiIbDTllDvROjgcWcpSsLQ
	 71XTl9lTp0TlgnHuiTEIjc/T55hPXYF/U42yWk8NaXEW/8xZaale1pn8Z2UpWjp1la
	 ALOUrZQPh8nuhq7zc6CIUxSyVoKs7gIhlR8eeTrLiNQyUAYiP2TJ6Uh8X02CeGa1nt
	 HO5sM4udYbhhg==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-6e560e00a86so1918568eaf.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Nov 2026 00:15:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxd4SsLlVJQnmhA839I3ACpXO9WFjQEc1q+R0Ovukt9SH6yCP23kvzqGaxFGzeY98ZoBnQ8xUE7KAF5cOU=@vger.kernel.org
X-Gm-Message-State: AFq9FYLSsu1OtrWsu7HBfrfDCd3YlFJSIQUJ/VdMPYrppA8OYc5AQqqI
	tIQ6Ere3e7OE0MyLrsK3s2Rq49OHkd5I7Jv+0Q9xq+gI6KFm/enuG17nIbGKNhEoIt6Y/wreM0E
	2NC+3Dk/ErcnjyKZTVK8x6V9TnJwyZ7E=
X-Received: by 2002:a05:6820:1504:b0:713:de09:427c with SMTP id
 006d021491bc7-714f254b5bbmr5208069eaf.60.1793607355409; Mon, 02 Nov 2026
 00:15:55 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101075145.698399-1-sgzhang@google.com> <audwphXNeZhVItS0@google.com>
 <CAPqVEODgo=mr+3viog+bY1XOKHLcrEVhs4CtZ-SiSYT4Hh+gjg@mail.gmail.com>
In-Reply-To: <CAPqVEODgo=mr+3viog+bY1XOKHLcrEVhs4CtZ-SiSYT4Hh+gjg@mail.gmail.com>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 2 Nov 2026 09:15:43 +0100
X-Gmail-Original-Message-ID: <CAL4WiioN5-eu3DExHHs75BaK77j+aR3CNr+9p11CRQDd4gpXhg@mail.gmail.com>
X-Gm-Features: AclHuK8YH8kivFCcxwhh3LmuTY3n9bSMVGRi64ndTBUddMQAOZY_6fQD74nptxU
Message-ID: <CAL4WiioN5-eu3DExHHs75BaK77j+aR3CNr+9p11CRQDd4gpXhg@mail.gmail.com>
Subject: Re: [PATCH net] net: count last skb of each sk_backlog pass in __release_sock()
To: Ray Zhang <sgzhang@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, netdev@vger.kernel.org, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	David Decotigny <decot@google.com>, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 2 nov. 2026 =C3=A0 06:35, Ray Zhang <sgzhang@google.com> a =C3=A9cr=
it :
>
> On Sun, Nov 1, 2026 at 9:15=E2=80=AFAM Kuniyuki Iwashima <kuniyu@google.c=
om> wrote:
> >
> > On Sun, 01 Nov 2026 00:51:45 -0700, Ray Zhang wrote:
> > > Running 500 concurrent TCPv6 streams (neper "tcp_stream -6 -T 1 -F 50=
0")
> > > on a 2-core Cortex-A53 (CONFIG_PREEMPT_NONE=3Dy, HZ=3D1000, LATENCY_W=
ARN)
> >
> > I guess you tested it on 6.18, but note that CONFIG_PREEMPT_NONE
> > is no longer selectable on arm64 since 7dadeaa6e851.
>
> Right, we hit and tested this on 6.18 -- thanks for pointing out
> 7dadeaa6e851 and for the review!
>
> On mainline, cond_resched() in __release_sock() still applies to
> !ARCH_HAS_PREEMPT_LAZY configs (e.g. CONFIG_PREEMPT_VOLUNTARY on
> 32-bit arm/mips/sparc, or CONFIG_PREEMPT_NONE with ARCH_NO_PREEMPT),
> and landing it in net lets 6.18.y stable backport it cleanly.

SGTM, thanks!

Reviewed-by: Eric Dumazet <edumazet@kernel.org>
