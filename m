Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794107852;
	b=jS5Wed2e2ecCVCWSzUt80XRWVQw592Z1PFehbfqbaRShCNDzJCTuV3hPoeRhinAkD3Vo
	 7kxpvfnYAIDM6p7AfzWR/kF4MzpDXVapflooy4CAKIOzhMCn4PAPBo0LpdAfy+PhIu1tp
	 IgrauzFVVeJkww8c30acL4LnvNLxnCP0RsWAec97q+gDvoMD4SqF7Y0bZYMQsHhO/EYCK
	 AKofimeBwLVOmrpchFFuyf6T7qSr7qtqsUmRDovJJE7ZVo6Aw6cVB1MMYyCkCq0T+YdAk
	 LH9z8As86rHIg5nQcnbBTtDJLHtXBZcC3I7Hy4Xqf86WV20MhcLzulB+r4J/Zp/aNhQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794107852;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
	b=K6g6zZupCC4/UpsyjKmKFrgeqlBtrHhQ6Owq42/SBPMwniP2Rqt5qVxRdvWFPjls1jQA
	 VlAqNK4St5ryy6y1odB7O/EnM3ibZpHLdPUESzmAB+/9ZTOcF9sCBpJTAETcr2jmJT3hg
	 vUbxyt/fVOXpqVN6T76IAGTucV4wEHfrV0akzKlqmSM5mKzRBeqYhinsB6nCAZhNKECpW
	 BBxXZZBESGo+aTNFeNrVj+74KobleN7N+2ovrAqrxqg1oTB0z7SBo8axTEck+wjxcOv67
	 JdTgqG/Obbo7cl7MBJ8fs5AusJ4IGGjYewyNhBNblHJF27JbtJCw/7EMnZRslszjAPw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="IAvay/DA";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693CA606A31E
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 693CA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IAvay/DA
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-535f598d126so1431cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:17:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794107851; cv=none;
        d=google.com; s=arc-20260327;
        b=KTgDvpce7HzHTlxAPKOa7GSRralq6Xnztlluw8dLhlBQqy3W9XLOzhlXliuOT61uc1
         4hxsjEC5jUGAAc6mChPAz7VMJGQC2Wt69XgWVwNjHvHRSsQaqsHKz+CCj5tE2mS5yHey
         xgYYXABBgWXFUn1EuzczNXqsdMiD0CYni4K9ock5cVVAdjK94p4xVJRhZtfLnchF3EX5
         L9yMB1uDM7wLfybpNK5fXj4BUgWpRe/YkWsQ2t6VchfEUqhljgXAGt0pmdUN/2gIb2co
         2XfeHWH7p7CLaf/BbSJ1lUkFVKlVECO4ZPbj/WKIqRuIfo+D3X/g52vhpoOrBgKz/Diu
         JWVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
        fh=WIEW3WS3LwJ6corYuhb3cbo+KXxsATaw8dBFk7aEllk=;
        b=BEOlubRK5+Pwwa4sUGeW5+9i0EmFxRDx8s/SUVdBhqL5uH18n0SmOE5u7vRczUVUf0
         LUK9Iq8pn/JAyLQxEeVgmXwdG1oeGXvhL98RcVZKW7+0ZfmEHx7BUxhG6aTzBAETtEPZ
         nCQFhgX7UtbY8XVGEmulgKPZVKuO6vKf04AA+BKdDo+eYafEDT+UW4Z39X45jEDojf4Z
         uAX6GuH/PHIQnC5YlRYJuQdNoEjO1rHfR5mj+wSGdXBcfKwCKio2t/1uhf3KPte61dUF
         Hff1N2GzkTKzAe73812HGORlyr1/DB41kDjFV36ns9WMlvnGMCBtIZQRuwbuif2qmokX
         PY6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794107851; x=1794712651; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
        b=IAvay/DAoBXnCYRsuvPIfgM1EqwkTz4a4tmBKkexani6vdcOk6tvyJW1llJbr50Ant
         rtpnr3ZKB2H6NfViDuTZ9Kne5WzwAplnbA3ercPCvpo2hhET+pgv59Pp/1mYx7n20FCQ
         FZvGdx1l2QpDSu6koxOSTM4tXoVg75xD1Q1MEZCaIhirg1MvP2YrApQ8T/nQOlyLojrZ
         gQ3gAQK7OFQIVyCgdPW7XP2k898mmgu181MvyNqN4nWzyf6NYJpkK/9ghQ+t+ZpE9ysA
         1hTZPZmYjb0cD1vy5p6JUSoA9TrXJqZ89eWBXClmcJytcdrNv9PgJR6TpWDkB1VNmwZ0
         USrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794107851; x=1794712651;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2I+093n0UIY5U+GFcKHbH0n1dxSizOMfEkvs86TkO6k=;
        b=xOsRAK5ECgYk+YUUJyACEu7thrkZnE6H8ryFmscrhrEIp/siehsezpcZpNJS4kmP9c
         3rENSAfeFqLYYuHh1ydnieBnbcFTbTxW8/xdacjgAD361rr+jSbsILvoNnHmHh4JNaHx
         qHIydklmkGXdOE7CyonZNwG8TrgP5As1PMXF/kvR69V53QWJtfYelkJW920H/vKNwpbv
         5PZeL9rQmoBNW4jEKMoWI09I6GnG8I2dGf0cztPXe+v1bNtk+10OTrjgLQ1nQpNKJsJj
         wTnF06ICunELVh3syeXVzk8D/xg0Bor5RZq8W4+AfUL5bXuSO+jA5UeeOKOOSo2OIGDA
         ICNg==
X-Forwarded-Encrypted: i=1; AKwUvBxNJHdgma5gpVS4dKguCIHbcqcPfjaVG2fmIdj1DZkCRvlymH26yINVRtzvJJ637hSvzLJVSd6H/b1r6Vg=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ro/M5Jb2RGIlOSzmNSudfKGcfUrNsAWhYTB4fYy9uZtXDECok
	0HI3bGX8WTaFPnZkAcAemqkdvGSZZQnacOjwT1bRND0Ta5DrsyDrDsZU1VedYJAEOi7SDOLNt3h
	k/kymtqd1gfz+d0Dc3bXb9VfRkc2obK6acEWeljbk
X-Gm-Gg: AYBFou2wnf4KSuymtOiLugMdPm7aynn6WNdNnW6BRDoKJoros/2hXHLZoa3oKTIno0v
	4pQWu+RY4YiYewalBcM1fRWqDTyRgjJr7+Pl5t7jQEyKhxvJ/hBjl1ISkWn944bwLZVGdTd3V5M
	tSXftPeF0Ks6k7u9inIUEO7d0PKjBMgyBV5Yq0bv/8xkyK71Gk9yv6aQ6E3A/DNH042C6E4XfJ+
	FzlsPw/CinfJFFDe9slxUyb7id/OitYbLdvA89IvfjQMum7oZgzjxPiYwaoiQvS/1YjT8ZHTByF
	hQRxOtYrb4+3A+Hif9Wv6OwD2eck0dHtl9wuXIlTimgsChPDZo4PfShaVtb99mIVQcNjmPasEoS
	VisNp3m2fesl3aY2l3WcpsxedVts5nbZraLU7pkBxHXrdJbwK4NxUMON6O19237/GJ/vMEyfaJM
	FP8j+BJcby9KpS1qLM1qYVRtDILvQ=
X-Received: by 2002:a05:622a:5985:b0:535:bb33:6351 with SMTP id
 d75a77b69052e-54f9f0c1cbcmr18824881cf.1.1794107850713; Sat, 07 Nov 2026
 19:17:30 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261103-mtu-probing-series-v1-0-a2809e725aaa@gmail.com>
 <20261103-mtu-probing-series-v1-1-a2809e725aaa@gmail.com> <CADVnQy=AHpy6UoiAFopRUmHLNv6Arw07PysXVijiR=qERuzeww@mail.gmail.com>
 <au9zxblIQx7OF_gx@google.com>
In-Reply-To: <au9zxblIQx7OF_gx@google.com>
From: Neal Cardwell <ncardwell@google.com>
Date: Sat, 7 Nov 2026 22:17:11 -0500
X-Gm-Features: AclHuK_hiKxuy2XPBtNnUtx6z7qgzENFTmDz_HcsklNHSgevwIjrhp-FGceyzzc
Message-ID: <CADVnQy=6mDzR6XQxnasHECbq7=9f54AH8cjny+rAdR_yR_ZsTw@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: echoowall@gmail.com, horms@kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 2:15=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.com=
> wrote:
>
> On Sat, 07 Nov 2026 12:53:36 -0500, Neal Cardwell wrote:
> > On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
> > <devnull+echoowall.gmail.com@kernel.org> wrote:
> > >
> > > From: Yongjian Wang <echoowall@gmail.com>
> > >
> > > tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss()
> > > before MTU probing is enabled, and tcp_init_transfer() enables it lat=
er
> > > without syncing the MSS again.
> > >
> > > With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore sta=
rts
> > > at the full MSS instead of tcp_base_mss as documented, while an activ=
e
> > > connection starts at tcp_base_mss. This has two visible effects, show=
n
> > > here with tcp_base_mss=3D1024:
> > >
> > >  - The MSS drops when the first probe is acknowledged, from 1460 to 1=
242,
> > >    although that probe has just shown the path can carry more.
> > >
> > >  - On a black hole path the MSS never tries tcp_base_mss. It goes fro=
m
> > >    1460 straight to 512, since MTU probing is already enabled when bl=
ack
> > >    hole detection triggers.
> > >
> > > Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only applies
> > > search_low when MTU probing is enabled, so the other tcp_mtu_probing
> > > values keep their behaviour.
> > >
> > > The Fixes commit kept tcp_mtup_init() in a single place on purpose, s=
o
> > > sync the MSS next to it instead of moving it back into the
> > > syn_recv_sock() handlers.
> > >
> > > Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init()"=
)
> > > Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> > > ---
> > >  net/ipv4/tcp_input.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > index e1f2d9765..c13f005b2 100644
> > > --- a/net/ipv4/tcp_input.c
> > > +++ b/net/ipv4/tcp_input.c
> > > @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int bpf=
_op, struct sk_buff *skb)
> > >         struct tcp_sock *tp =3D tcp_sk(sk);
> > >
> > >         tcp_mtup_init(sk);
> > > +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
> > >         icsk->icsk_af_ops->rebuild_header(sk);
> > >         tcp_init_metrics(sk);
> > >
> > >
> > > --
> >
> > Functionally this seems correct. But I'm wondering about the
> > performance impact, and whether there is a way to achieve this without
> > adding this call to the code path for every connection establishment?
> >
> > Eric and Kuniyuki, WDYT?
>
> Looking at history, initially it seems we properly called
> tcp_mtup_init() right before tcp_sync_mss() in ->syn_recv_sock(),
> but 4d83e1773031 removed them.
>
> The dup tcp_mtup_init() mentioned in the commit is the one in
> tcp_init_transfer() today.
>
> Then, 27204aaa9dc6 moved only tcp_mtup_init() to tcp_init_transfer()
> without tcp_sync_mss().
>
> The dup exists in tcp_rcv_state_process() from day 0 (5d424d5a674f),
> and 168a8f58059a copy-and-pasted the unnecessary tcp_mtup_init().
>
> So, 4d83e1773031 removed the correct one.
>
> Instead of restoring the 2nd set of calls, I think we should
> revert 4d83e1773031 and remove tcp_mtup_init() in tcp_init_transfer().
>
> ---8<---
> diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> index e1f2d9765f81..8d009c0d9359 100644
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -6759,7 +6759,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_op,=
 struct sk_buff *skb)
>         struct inet_connection_sock *icsk =3D inet_csk(sk);
>         struct tcp_sock *tp =3D tcp_sk(sk);
>
> -       tcp_mtup_init(sk);
>         icsk->icsk_af_ops->rebuild_header(sk);
>         tcp_init_metrics(sk);
>
> diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> index a7f9242f1e42..579a88472abf 100644
> --- a/net/ipv4/tcp_ipv4.c
> +++ b/net/ipv4/tcp_ipv4.c
> @@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct sock=
 *sk, struct sk_buff *skb,
>
>         tcp_ca_openreq_child(newsk, dst);
>
> +       tcp_mtup_init(newsk);
>         tcp_sync_mss(newsk, dst4_mtu(dst));
>         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
>
> diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> index e006a30360ea..c465fd97baec 100644
> --- a/net/ipv6/tcp_ipv6.c
> +++ b/net/ipv6/tcp_ipv6.c
> @@ -1489,6 +1489,7 @@ static struct sock *tcp_v6_syn_recv_sock(const stru=
ct sock *sk, struct sk_buff *
>
>         tcp_ca_openreq_child(newsk, dst);
>
> +       tcp_mtup_init(newsk);
>         tcp_sync_mss(newsk, dst6_mtu(dst));
>         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst));
>
> ---8<---

Thanks, Kuniyuki. I agree that seems like a good approach. Though
since 27204aaa9dc6 also moved the tcp_mtup_init() out of
tcp_rcv_synsent_state_process(), I think with your nice approach we'd
also want to place a call to tcp_mtup_init(sk) right before the
tcp_sync_mss() call on the active connect code path as well, something
like:

--- a/net/ipv4/tcp_input.c
+++ b/net/ipv4/tcp_input.c
@@ -7015,6 +7015,7 @@ static int tcp_rcv_synsent_state_process(struct
sock *sk, struct sk_buff *skb,
                  tp->tcp_header_len =3D sizeof(struct tcphdr);
          }

+        tcp_mtup_init(sk);
          tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
          tcp_initialize_rcv_mss(sk);

WDYT?

neal
