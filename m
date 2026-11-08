Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794108633;
	b=Zex+AvyP+yA0fX6POMeu9xoJdTvXe1QCPz0r2HHDYPelciaTaiObAqDkWwziNmrZBq6L
	 +hbdCFPg3SeapO/vj2EFadOW/G/mp7DKw9Gg+v3pK1SPAk9qZhLd2DJcJajqlF1yZFJZQ
	 zGuZheLzCHT7wJMiW1+pqXzBe1r57vCdosWvWQJeqqGNvgjn/OQllQb6LAmxVtajXAulH
	 OFy7+wFFlQ7YNXzthX6ZHBWz6h3NI3lTGejytRu3eE9g9pxi4yEk7yDgYhNpeuTY81/Ub
	 UJaxXDzD9sAlD2f+jngtablrRY4RZroez+rZsqurA4ISjkfhrGbaPXrpSLDXWELB9dg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794108633;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
	b=NvN8Mu79oYCMkSh3ryKM/qOgSS94hXp6vyoe1+aJIRgSFWVOczbGgeorcZVpg+xld9i6
	 HYLDcYwvkuRdAwh59j8y3FqcY0xbudK9Q8+Ig3HUSMaahGm9gtqikqmWxaObgyUdXJXF8
	 tZBG4HALHqh8Ox2yV3ZNBp35KLAMZuVldp4S2+k5Ok5eJWfWMsQg5K1i/BpSCAtwkQDPJ
	 CDy5NsHzTaj8ygM5irvsKiR72yTrhc3jHlUtZ2PKUcctOpObGH1JGu8xPEiv2vrWOweXJ
	 hTQtwmCYOzzwbLBPqM/oEcHWDtx61cELdoy1WrRRoRu6Fs9k0IKha/tBbC93lq3jwvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nAlL2bfY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CF0606A31D
	for <linux-kernel@vger.kernel.org>; Sun,  8 Nov 2026 03:30:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CF0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nAlL2bfY
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1b244fb7fffso69739c88.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Nov 2026 19:30:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794108632; cv=none;
        d=google.com; s=arc-20260327;
        b=jb0/CnAo/x65aXRhwuRfBa49PyEhIqQ2M0xqDvusDPrvstxqOctuhViHGin1Z9drZA
         jNxX8zf/fajya5wRHaS/R5hl9c3O5LJMZRwkoBz+4sKY4ufgiVFBeY3qqpwrlRm3yIuA
         vzNFbKgl4435WFcpXTn251JQeFGdcoaqPzZAS1CESQ0gJFYpCdN9Oz9ePRmwdsgglfaX
         M/nS6i/cnHFte8GIYEEL2nGetE1w9815KaRU8pgPlFRfdtcMDwFDBvynSMlzBDJ0qMhy
         2HKrfMA4iQ7wewtklQMzo5T3F+c9iBMOxFFKlotLsPt8YVXrM4URDFjORmKXKRVdA5kl
         25/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
        fh=fiCGEs6CPxFvALNe4cx2BTOehh2YuIMtU+Ad7IcXPZQ=;
        b=Gy2ZyYkbc/p+ADwurrzipfQFyMg6O/1eyjQgagD6zLORp5Z40ZeZN5TACBetBhw07v
         8PS7r3nhCsh7BTnpZdKAHtOGz/AfQ4PPcEDg/adSlCZFFyZezZXAynBMcY/p0L1ScLBl
         2LD4Ig4gBqzzCL+LTj8NPFyov6vdWyJfImJA1ivX41DZAZcAlpRUV1bGVvMIW+RQmn6R
         9q6xk7nk4c1JopD6zPSF7ixa+J/flaBiEyV5Fa1WqejYExR9hu+v4ebbgff3W+nVI1xb
         yePUfIKRlmrHYXaRx+E4yDHo9gsfcwW/2mkL5wB5Kl/Dh7/s+idaFkSJ9DIUj+WhI4Tr
         VbgQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794108632; x=1794713432; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
        b=nAlL2bfYDAEluRcAyIHtC6RZ3qcQD5QKgPxNdcXsO3nxsuhsf24HiDAPFHlxhv+Y4P
         nrgQe/7fYOx3Jk8iMljaI7k1Do4os+tx0bC3o7ZPgfZ77aUqb+jyu0KYWD9PdJVbiQCC
         uOqfGjjEok0nJBwZFEdJTKbUJBEuoLdcgNHtrOmmHLWkWUD7kLrYFKkNk3muwoMmdOnb
         V2q+MOk+rqNJc2fTSs84npH5TRyPjkv+zJcHFLuAfPkUsgSndENAuo/qOthOsgSo4NT0
         jivvapsNTX3d6k9nKrqzePqwcgIQlpq15i1UpoiNW60orBc468S/Wpi1V5AjSFoFqI/d
         Q5Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794108632; x=1794713432;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlXje22OfHacfmQaflQddk4r12F9jnNMFdlswxl/bjM=;
        b=aIaiCazR74YP1F86/bPcUOtx0Ju7nZMZ6jBq2ZK5jzDGsoXP6CM2u/84mOU+cpFPy1
         atKtVO6sTHkh4dnXnvovtAXzdPnTvlSoV8vlHWZLtJoUnUPClcSlLiUjA+mEeZBjsUhV
         GYJ04vIxiIJkIxVCB+8LylhPce0K1fY0ghuq5msy91BRJKaqm6U7sHo/CiOaSKSIoXY9
         OrIuDpoGH3BIb74U1J6/eG9S1Zi2Oz6vnJGfTobvuspCZCrcTjixtwV6W68dVnXVdGys
         Yxysz5rkmMvUSkavE5dU7RpRLB8OACBX0c1NvYda9Iq5uleXwUjK0NDEOxkq4Ch2sSni
         +x9w==
X-Forwarded-Encrypted: i=1; AKwUvBymQM/8U9r1vLwwDyvt91jCi4I56JiIgH3M7X67s1RREW7WKtrYncWILsWPki0H/zS65O1dhgNOGrZ/wsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ylVxf2IlGOsaJU0yRiCuHDS0CzGOc7bjl9sbnUyt+sq7a/Q/9
	9r8Lg9uw9T/W87ACqxT3GjlG1SL7LQ2ULqmMCwdpg3i7dd3NCSsButifGpu0aWOD3gnVSfYNu6u
	Cmi057ku6ZvyGz29v6X9DNwz/RO3vyr4nH4IuXA9o
X-Gm-Gg: AYBFou1Tl11oxXizXhz7MpDnHRsJkDeTxeKM7VvSYzeM2ukttx3E9cvHjYkr5yrtBBx
	2fqLkR36CTI9PyGECimodYuMrZoF0M21HKlYKHf7H3YWQBd79MB2610dFDeCckFl9TQaVefLIaT
	1XUilpWxqwJ03jlhBcvjVFcACD/Zwc74v1mIUrozcB0HKpsTA8jFzIhyCI0Iv/T2kbVjM2HuUlG
	c6Zgc6AFAjyCH/W/FVRArqwoEn3MnTab1TPrwHPgrOiKct30fIS0DdPw/fx7xc5kc3tbC5MRVm6
	RMb7oASBXRc9pxqgI6TpU8aElXSEry9GgpMxjHhtoiMllDbkBjPZjjPJttrVXy0NBE9KaTF23jw
	CouWd2bI84YPvQS69fgG6WJdAA05nS6/LDYOmAKMI1PRAiBtU/KhDz0YFz9kgqTJwm8ovHGs1mi
	bvFN4WWWEpTxF8K792F3fSMOtn99E//f/u2f/gtgGO+p1IPLyT
X-Received: by 2002:a05:701b:4656:b0:143:72b1:9004 with SMTP id
 a92af1059eb24-1b39fed7258mr555855c88.45.1794108631163; Sat, 07 Nov 2026
 19:30:31 -0800 (PST)
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
 <au9zxblIQx7OF_gx@google.com> <CADVnQy=6mDzR6XQxnasHECbq7=9f54AH8cjny+rAdR_yR_ZsTw@mail.gmail.com>
In-Reply-To: <CADVnQy=6mDzR6XQxnasHECbq7=9f54AH8cjny+rAdR_yR_ZsTw@mail.gmail.com>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Sat, 7 Nov 2026 19:30:18 -0800
X-Gm-Features: AclHuK97DApQUstQq_mpiJS3jdsjD0INaaKFdWOXySIkTv--_c4SWQEd8Tu2IKM
Message-ID: <CAAVpQUBc2=6SNDpjXuvR-FPiTWzTYMCZu65-6MXF-3pw60WEaA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/4] tcp: sync MSS after enabling MTU probing on
 passive connections
To: Neal Cardwell <ncardwell@google.com>
Cc: echoowall@gmail.com, horms@kernel.org, edumazet@kernel.org, 
	kuba@kernel.org, shuah@kernel.org, davem@davemloft.net, pabeni@redhat.com, 
	netdev@vger.kernel.org, panweiping3@gmail.com, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 7:17=E2=80=AFPM Neal Cardwell <ncardwell@google.com>=
 wrote:
>
> On Sat, Nov 7, 2026 at 2:15=E2=80=AFPM Kuniyuki Iwashima <kuniyu@google.c=
om> wrote:
> >
> > On Sat, 07 Nov 2026 12:53:36 -0500, Neal Cardwell wrote:
> > > On Tue, Nov 3, 2026 at 2:09=E2=80=AFAM Yongjian Wang via B4 Relay
> > > <devnull+echoowall.gmail.com@kernel.org> wrote:
> > > >
> > > > From: Yongjian Wang <echoowall@gmail.com>
> > > >
> > > > tcp_v4_syn_recv_sock() and tcp_v6_syn_recv_sock() call tcp_sync_mss=
()
> > > > before MTU probing is enabled, and tcp_init_transfer() enables it l=
ater
> > > > without syncing the MSS again.
> > > >
> > > > With net.ipv4.tcp_mtu_probing=3D2, a passive connection therefore s=
tarts
> > > > at the full MSS instead of tcp_base_mss as documented, while an act=
ive
> > > > connection starts at tcp_base_mss. This has two visible effects, sh=
own
> > > > here with tcp_base_mss=3D1024:
> > > >
> > > >  - The MSS drops when the first probe is acknowledged, from 1460 to=
 1242,
> > > >    although that probe has just shown the path can carry more.
> > > >
> > > >  - On a black hole path the MSS never tries tcp_base_mss. It goes f=
rom
> > > >    1460 straight to 512, since MTU probing is already enabled when =
black
> > > >    hole detection triggers.
> > > >
> > > > Sync the MSS right after tcp_mtup_init(). tcp_sync_mss() only appli=
es
> > > > search_low when MTU probing is enabled, so the other tcp_mtu_probin=
g
> > > > values keep their behaviour.
> > > >
> > > > The Fixes commit kept tcp_mtup_init() in a single place on purpose,=
 so
> > > > sync the MSS next to it instead of moving it back into the
> > > > syn_recv_sock() handlers.
> > > >
> > > > Fixes: 4d83e1773031 ("tcp: delete redundant calls of tcp_mtup_init(=
)")
> > > > Signed-off-by: Yongjian Wang <echoowall@gmail.com>
> > > > ---
> > > >  net/ipv4/tcp_input.c | 1 +
> > > >  1 file changed, 1 insertion(+)
> > > >
> > > > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > > > index e1f2d9765..c13f005b2 100644
> > > > --- a/net/ipv4/tcp_input.c
> > > > +++ b/net/ipv4/tcp_input.c
> > > > @@ -6760,6 +6760,7 @@ void tcp_init_transfer(struct sock *sk, int b=
pf_op, struct sk_buff *skb)
> > > >         struct tcp_sock *tp =3D tcp_sk(sk);
> > > >
> > > >         tcp_mtup_init(sk);
> > > > +       tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
> > > >         icsk->icsk_af_ops->rebuild_header(sk);
> > > >         tcp_init_metrics(sk);
> > > >
> > > >
> > > > --
> > >
> > > Functionally this seems correct. But I'm wondering about the
> > > performance impact, and whether there is a way to achieve this withou=
t
> > > adding this call to the code path for every connection establishment?
> > >
> > > Eric and Kuniyuki, WDYT?
> >
> > Looking at history, initially it seems we properly called
> > tcp_mtup_init() right before tcp_sync_mss() in ->syn_recv_sock(),
> > but 4d83e1773031 removed them.
> >
> > The dup tcp_mtup_init() mentioned in the commit is the one in
> > tcp_init_transfer() today.
> >
> > Then, 27204aaa9dc6 moved only tcp_mtup_init() to tcp_init_transfer()
> > without tcp_sync_mss().
> >
> > The dup exists in tcp_rcv_state_process() from day 0 (5d424d5a674f),
> > and 168a8f58059a copy-and-pasted the unnecessary tcp_mtup_init().
> >
> > So, 4d83e1773031 removed the correct one.
> >
> > Instead of restoring the 2nd set of calls, I think we should
> > revert 4d83e1773031 and remove tcp_mtup_init() in tcp_init_transfer().
> >
> > ---8<---
> > diff --git a/net/ipv4/tcp_input.c b/net/ipv4/tcp_input.c
> > index e1f2d9765f81..8d009c0d9359 100644
> > --- a/net/ipv4/tcp_input.c
> > +++ b/net/ipv4/tcp_input.c
> > @@ -6759,7 +6759,6 @@ void tcp_init_transfer(struct sock *sk, int bpf_o=
p, struct sk_buff *skb)
> >         struct inet_connection_sock *icsk =3D inet_csk(sk);
> >         struct tcp_sock *tp =3D tcp_sk(sk);
> >
> > -       tcp_mtup_init(sk);
> >         icsk->icsk_af_ops->rebuild_header(sk);
> >         tcp_init_metrics(sk);
> >
> > diff --git a/net/ipv4/tcp_ipv4.c b/net/ipv4/tcp_ipv4.c
> > index a7f9242f1e42..579a88472abf 100644
> > --- a/net/ipv4/tcp_ipv4.c
> > +++ b/net/ipv4/tcp_ipv4.c
> > @@ -1740,6 +1740,7 @@ struct sock *tcp_v4_syn_recv_sock(const struct so=
ck *sk, struct sk_buff *skb,
> >
> >         tcp_ca_openreq_child(newsk, dst);
> >
> > +       tcp_mtup_init(newsk);
> >         tcp_sync_mss(newsk, dst4_mtu(dst));
> >         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst)=
);
> >
> > diff --git a/net/ipv6/tcp_ipv6.c b/net/ipv6/tcp_ipv6.c
> > index e006a30360ea..c465fd97baec 100644
> > --- a/net/ipv6/tcp_ipv6.c
> > +++ b/net/ipv6/tcp_ipv6.c
> > @@ -1489,6 +1489,7 @@ static struct sock *tcp_v6_syn_recv_sock(const st=
ruct sock *sk, struct sk_buff *
> >
> >         tcp_ca_openreq_child(newsk, dst);
> >
> > +       tcp_mtup_init(newsk);
> >         tcp_sync_mss(newsk, dst6_mtu(dst));
> >         newtp->advmss =3D tcp_mss_clamp(tcp_sk(sk), tcp_dst_advmss(dst)=
);
> >
> > ---8<---
>
> Thanks, Kuniyuki. I agree that seems like a good approach. Though
> since 27204aaa9dc6 also moved the tcp_mtup_init() out of
> tcp_rcv_synsent_state_process(), I think with your nice approach we'd
> also want to place a call to tcp_mtup_init(sk) right before the
> tcp_sync_mss() call on the active connect code path as well, something
> like:
>
> --- a/net/ipv4/tcp_input.c
> +++ b/net/ipv4/tcp_input.c
> @@ -7015,6 +7015,7 @@ static int tcp_rcv_synsent_state_process(struct
> sock *sk, struct sk_buff *skb,
>                   tp->tcp_header_len =3D sizeof(struct tcphdr);
>           }
>
> +        tcp_mtup_init(sk);
>           tcp_sync_mss(sk, icsk->icsk_pmtu_cookie);
>           tcp_initialize_rcv_mss(sk);
>
> WDYT?

Ah exactly, thanks for catching :)
