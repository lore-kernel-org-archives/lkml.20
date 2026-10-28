Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793204291;
	b=KYQmbnyseG5leeCYtI3BLi/UXa6Xlfe6vEQd6P5eGumdHcxhT6gW/vBiFJx01Zp/XfAM
	 CKHZUOvZ8AAOvta1mg+ksdS/f+y9+lWrkTZ6ItxB7F106EPBqkVX/9dgJSNOWa0///QAK
	 05NfOumXQfEEJ3+X/oOT7mO80FlcfV6+Rnp1LFGqa2XWRJOQsKvPvh7nRPfOUdhaxm+7b
	 jU/zal9q/ZmCyzu+oJnu2BmdK729PDFT7Enx9ux1Z/ANFxunJySvsggg7n2P+dK5TJm8N
	 V+YdZ9XBOwPTVH2oJbiUpeaRagOwrfx+52Uhpc9NEjL0H/jh+3+dpYw+IZQSit1P7VQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793204291;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
	b=NknK2QwXxGObewd/o0YH8Ur0Dsblp7gvHKeD5DxS297B1zKZH8sdE0HI6JFZEFK+gAVc
	 eoI65a+Xti5Trs2GuERLZfUtdu0qimixNrMn9vEaHu0iNy9BmJeaRG8++s3JQWldpr10n
	 JAEQSzEHgaV3/3Ga4I+C8qArMEbaEfzfxd1juqgAf/RGAACptpfuN6ICZyb/Ddo4Bvuok
	 qGSloE/o9EpTOJz0F8Pzk4L8Pj6aodGYUrfctKIgLpNXjBH1N947v4SbeHb5AzAUhbCz6
	 j/EZxonAtcsIv33/Mek4r1bHKtoO54cLagSGbRMz7nqvMY0NlbG6KyMVubuEgqaJ9fQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nhcyRhRU;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC691606A320
	for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 16:18:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC691606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=nhcyRhRU
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6afac79b3a3so11922a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 Oct 2026 09:18:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793204289; cv=none;
        d=google.com; s=arc-20260327;
        b=luohfTlsQYJrhQEmOQs/fHYPN63cMZfCPVqvOCd3GFhVUoajfaqeb1iOoKyWZXa8bn
         qPX7oGzVnQh1gAYeI8VdrzvSVFTE09mHMHG6JY3vWeGx1IVQkzyBk/hLJY5w9FgTrgTY
         HasVipyj9KBH1hl87aDXg9JW0w+TPUcFcQt2ci3718jmsKficJhCpMmPYHs4nQsGNuMm
         x4nMGxbISTgxIAt5n2JWgV0+NTnJrOP2+ZnpfOBFCWAozygwP11NL8OAIOb89ml/AySo
         /q/JCyAOa1yGtU7n4+c/T8mxUXNl3O8Mnx0i5dSYutvRUnKgMXYp5VwBMC/k3YgvyyEd
         bRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
        fh=GFbJjqvRFPbiNtbtkBfjL62MEJ+1l9YEMl1cT05LVu0=;
        b=iEeyW8VOSShy2ymsUZGTs39FDf77+5cl7Y4DZS2whlx2vaUFsn6GhuxedUf7zA7es7
         5OClpI7q9Nn5UPZsjDeJp+KQiNWFm+NdUoggFHge3iEaARja9hG1QYSd8l5lNkmNtpuo
         LItIEduinYU7BuyVR925urC9MJMVc16BLC+yvxwnI0Fb1kv1+gZ8zpQP3vmUYhyJG3Yo
         et+OlGDSQ8bgKMNJNPRzwHEGc61+JOOiwuuPP0lmRCULvjbKGVxNomKoY/fDGAF8E98C
         vnkBZ5LqMpqPYIjWt6cE4KZAcDGPSr86eL32e/LoUW9vP+WIlkbl/n4+bjZ5J3wtBIpp
         REng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793204289; x=1793809089; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
        b=nhcyRhRU/4RNzSMLzZT8e3LWTesK3fZyuVFJL1mpIE6Nw3t+DdqE3iRINLZRiiRe17
         2Y87u3lO3aIl39AqO+3cbBfoYWF7xbM1p/9jrzEk1iFcDqZSjzCh6v4BtWI+MQpjt8/n
         a9N2CnZOXZMDYD6cCzKQBiK1LbdmvghCVwzWoRzbQqCrVFDQU8njfQ5WSoSKKPDnlcH+
         pAnE7Nb8qgHILbh74wXmrh4vXUn+V97thRbE3NV4OIzAWlf/QxUpl8W2CuYKwlBvhcVQ
         5hjiEXtyz7U/vn+m24FpYbQVKesS+Holi3yILWVMKD4ia2PpNuHSgq03eFGpRgsR0hGb
         EhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793204289; x=1793809089;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L5ogW7JhfAT5yK3R6hLg7JFkiEpuNvjKHA8xCwY8O74=;
        b=N1XXYNQ/iXJsoVWGyYxCQvR05Wvo9WZSuBQ9oEoj5rFwHHFA8o9yxXr8GV91BON1/t
         NjmIl37L77PZu0Hdm9PCReHg8LbbnvVy80CqPhOgoxXtPy6uw+r3zjbJg4tY6V8YeNpv
         4PRcsiqfNcs5188h1MTuBLKIWHtK5wlWaVY63oq2IoaZa5/64wSeHAHDYT6wAn3u+ynD
         t122mHlJHBR9O8c7e/LypQVBzfqLi6fYu7Z3bxdd7VOOaapijMwvYTtHEK9ixp74Cma3
         OfCvR3epXcJuKul0qC83Wkbd/ep6Qes8O1NB/WordpaL/RQKgkoq5b5wEHyayU+vfF7z
         Lfjw==
X-Forwarded-Encrypted: i=1; AKwUvBwIZ/Fzj+bp7QAV2il/YZ9f/4uUav7oaFYuEgHPQRLVYUTKM2mqnDaonnIILc17mZQCEtUJgv52Xy2svQA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKkaphIyVgWnae1SxUgX3s4pEdBl0tf5Cv/G108zTboGtIky1dL
	PEQm/o7YTX2D/sD/eAy68zBufJP8rZk5kreo7a4kJzI3nTUqgvn3WXjbg+1l5F6qHamfMWe4g7A
	+hHIUGQ/lWI+iSDwcjlCfZsT1UlIXkEux2uOk9gdE
X-Gm-Gg: AYBFou1qPgAEbCvS32kOhmp6sv4cE5zUPxeAiU3w51uQQg5Q7C3yn6Y5EP77EK5ex6a
	+3G3698KpEh/jy1p+2EttuKPk7byl+qA70MIDa5/DwjNmk0nFomvrzVDA6nKWSIklUOF+b56NlI
	o4aExQ5FwV/0SLIk8xW3f3f2T/2hR3c5bPChGkUotmpX+ugZt1OcH9MgD4TuiBBw68qHYPAPN2V
	9mjteG+3EPkOKrk/rYCP2P5lnIxjVQzqqHjNbJyL8ob0Y2IgXIh6zX8+5hekogeu7d28gd2p7gU
	N6OHNqx5bOeiAkQ5bUGWkIyXHaGNyOpemYRsSfLeHijDhfBTX0q0lMUyHhemJg42lR8+aqYlWrt
	3JdgmN7qYyop6hKUK72YHQzHfFrHmKYIDWynwNRwXzUKLTBSs6Tu5WikgfZs0Tqxq/vNLNgo=
X-Received: by 2002:aa7:d516:0:b0:6ae:1503:5a27 with SMTP id
 4fb4d7f45d1cf-6b49b872a5fmr89061a12.8.1793204288568; Wed, 28 Oct 2026
 09:18:08 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026032216.1145201-1-tavip@google.com> <20261026032216.1145201-2-tavip@google.com>
 <CAL4WiiqQ3cychvCccpNW+WOU2SYCfNt6L=wgPkNmfTLHLy605Q@mail.gmail.com>
 <auALgSUuoYmfKSz3@google.com> <CAL4Wiirpss0inrC7gKhsNfwUO-KGZ-nnF5h7N8jXS9qziiSW4A@mail.gmail.com>
In-Reply-To: <CAL4Wiirpss0inrC7gKhsNfwUO-KGZ-nnF5h7N8jXS9qziiSW4A@mail.gmail.com>
From: Octavian Purdila <tavip@google.com>
Date: Wed, 28 Oct 2026 09:17:55 -0700
X-Gm-Features: AclHuK8w5lO8If8x36ZOhT6j7gK1cagODxrbPfh_JsvNFfuijHGsG2Hl4-fDuR4
Message-ID: <CAGWr4cSmbe7nuobWAZ9A2yV3BT0OT3CKhaBS5o++b+10srvjHA@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] tcp: clamp return value of tcp_wmem_schedule()
 to non-negative
To: Eric Dumazet <edumazet@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S . Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	Willem de Bruijn <willemb@google.com>, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 8:20=E2=80=AFAM Eric Dumazet <edumazet@kernel.org> =
wrote:
>
> Le mar. 27 oct. 2026 =C3=A0 03:28, Kuniyuki Iwashima <kuniyu@google.com> =
a =C3=A9crit :
> >
> > On Mon, 26 Oct 2026 13:06:56 +0100, Eric Dumazet wrote:
> > > Le lun. 26 oct. 2026 =C3=A0 04:22, Octavian Purdila <tavip@google.com=
> a =C3=A9crit :
> > > >
> > > > When sk_wmem_schedule(sk, copy) fails under TCP memory pressure and
> > > > sk->sk_wmem_queued already reaches or exceeds sysctl_tcp_wmem[0],
> > > > tcp_wmem_schedule() returns min(copy, sk->sk_forward_alloc).
> > > >
> > > > However, sk->sk_forward_alloc is a signed int that can transiently
> > > > become negative when tcp_collapse() re-packs partially read or high
> > > > payload-to-truesize SKBs in the receive queue and charges newly
> > > > allocated SKBs via sk_mem_charge() before freeing the original SKB.
> > > >
> > > > If tcp_wmem_schedule() returns a negative value, tcp_sendmsg_locked=
()
> > > > passes that negative copy length to skb_copy_to_page_nocache() ->
> > > > copy_from_iter_full() -> check_copy_size(), where it is converted t=
o an
> > > > unsigned size_t > INT_MAX, triggering a WARN_ON_ONCE(bytes > INT_MA=
X)
> > > > in production and returning -EFAULT instead of waiting for memory o=
r
> > > > returning -EAGAIN:
> > > >
> > > >   WARNING: CPU: 1 PID: 939331 at include/linux/thread_info.h:249 tc=
p_sendmsg+0x10c1/0x1530
> > > >   Call Trace:
> > > >    <TASK>
> > > >    __sys_sendmsg+0x292/0x490
> > > >    do_syscall_64+0x88/0x340
> > > >    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > >
> > > > Clamp the return value of tcp_wmem_schedule() to [0, copy] so calle=
rs
> > > > treat negative sk_forward_alloc as 0 available bytes.
> > > >
> > > > Fixes: 849b425cd091 ("tcp: fix possible freeze in tx path under mem=
ory pressure")
> > > > Assisted-by: LLM
> > > > Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
> > > > Reviewed-by: Eric Dumazet <edumazet@kernel.org>
> > > > Signed-off-by: Octavian Purdila <tavip@google.com>
> > > > ---
> > > >  net/ipv4/tcp.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/net/ipv4/tcp.c b/net/ipv4/tcp.c
> > > > index 87ef6d5cbfeba..0e062fcd94a6c 100644
> > > > --- a/net/ipv4/tcp.c
> > > > +++ b/net/ipv4/tcp.c
> > > > @@ -1037,7 +1037,7 @@ int tcp_wmem_schedule(struct sock *sk, int co=
py)
> > > >         left =3D READ_ONCE(sock_net(sk)->ipv4.sysctl_tcp_wmem[0]) -=
 sk->sk_wmem_queued;
> > > >         if (left > 0)
> > > >                 sk_forced_mem_schedule(sk, min(left, copy));
> > > > -       return min(copy, sk->sk_forward_alloc);
> > > > +       return clamp(sk->sk_forward_alloc, 0, copy);
> > > >  }
> > > >
> > > >  void tcp_free_fastopen_req(struct tcp_sock *tp)
> > >
> > > I do wonder if the following fix could be better (no change in the fa=
st path)
> >
> > Exactly, this looks better too, we can avoid negative
> > sk_forward_alloc and clamp().
> >
> > The packetdrill will need to be adjusted as it triggers cgroup
> > OOM with this approach, or we could defer the test to net-next too.
> >
>
> Let's defer the test. We also have an upcoming fix for tcp_collapse() any=
way.
>
> Octavian, could you resend a v5 (sorry for that) ?
>

OK, no worries. I'll post your version as v5.
