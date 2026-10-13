Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F03349CFF
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 01:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791853655; cv=pass; b=K4pyzLubkyAF34tfn4eyHZaQT3KwoaWwb0aV1nQNXpDiOtPUVpSbWLFwM3/mZCDhvj93tG7r4t8BKAdiSIpObEfZ0qYJPHsPaIooB7XkTVt6dBAZlWFkvlg841FfMnkoeFIMA4fF74ZSg5HAy+zkl6dRMuvR5mJSxmF4icRqrco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791853655; c=relaxed/simple;
	bh=dmqo/rRKwcI4JGSucbf6w7qYELLj1zZNxK6pc8Chn7A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ErTB+n1fLOl7tqnJRuiLjPsjtiXkvkCwqfRgQZD1VxZRtEGtiqVVLuj/hIs7K6nkvGMtrH+mcC7UTAx7Jm6dCteHMfaQjAHQCFqlKon4fzhEQFTe1/nxRpl97S4WVoCKFB9042XvOrmykejh/7AFMRxEh8pwz2a9hjlVo2fj/no=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Vnv28ubx; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Vnv28ubx"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1433e7b057fso1701762c88.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 18:07:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791853651; cv=none;
        d=google.com; s=arc-20260327;
        b=TnIsh5nosUQSS88H/2SYpWR0P4uRvI03tmLuJcDdEF1te3xkm1dDiug72RrWBPJD5f
         r1x4NAHLE1S9ZRHPZjy0lwIXcvx8qRW16ym2RfmYWSiWWG+98eLSphNHMqSgweFxUOA4
         a/e1sUGyfjA/jSFGsPhJFUg+beI8s9W8ni5rSoS34daBesfGfiEJHUStTimcB26sQsNJ
         UKUKo7i7KQz77igB08wUjlHsDFy/N+a/q2wUpVKm2cMlppg85M8q4ZF2IQnl1If6Ffjf
         aYSwroJyTWe6mld3KMgAX5GkmdQdlmXyF4+aQmi27onykRMRNyRCP7q7IeZrpcg/1AhG
         iR6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=l/Dt1a3m1BsN0Ve4mSC4iIes1pIXA7Iv0yCJdw8/D+s=;
        fh=RoYEZS+PIYbDjwOqeRYrUZEJ1yzM7bIFkVsq5TxlWVU=;
        b=IVhfSHIikL7iKEum58MvvUoGMsZiCOmgPwXdXpGCwf2/9AVLITX5tmPzZsQ3uk0JOH
         dE4qOTOxAxDbZpkn859AkMaYHiBwHetd/qAu2/KPQzOK1lcQygURSV9Lu1IS4UiACRq1
         l6tUfgVnbiFSgcpIphzKAnfDAnBWZ+SeVuXh6/eLwH56nIbiPyWGFhAIMYBLo4co1V/W
         JD1ie0SKdjAYB6BoIzA4KxAZYo0m2i7FbcMt+7sRM3o21tNpbNSfr00KrN0zXghcpQ2/
         WJRe3PQWF2Z0/IiPsS6B1gms/r+sGHhyZ69xVxiEDK7Op8m/tUZAf/Lbxn2NcMx9ll3h
         q6Mg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791853651; x=1792458451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l/Dt1a3m1BsN0Ve4mSC4iIes1pIXA7Iv0yCJdw8/D+s=;
        b=Vnv28ubxKhCI9pXWQ7dFgM3tixJrB4nVKkEuNuF0dTcwEhXoc80CWzOj7VLzoPrvqi
         kEtbzIaB7tonswKC5mwhK4xK71ph/07Xjfas2pX8WG6Tmudvupr5J0GgTFOWXGi3HIuB
         fvuE1G++HJ5JW2XVPEmpXqcTkoFwXgleveuoRqI6xFNUVFRxT2eFcL3DT04wpMlc8UCC
         JGWu0Ziqt1VWCuane3ZWDHA6OS8IZvSvbXycCkDE6Cwf8Uf+Bfwub2KCLrFm3Hpkr+H7
         7ZiLWaSBx2DMY0lOPjEqeMOVULh6HVz4zFkVM5mafH7sZUaOzbADieeLo2QpK8RwesLD
         fdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791853651; x=1792458451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l/Dt1a3m1BsN0Ve4mSC4iIes1pIXA7Iv0yCJdw8/D+s=;
        b=dSUHCl7QiFWbRUwsdcT/vAmPH8mjSid6+FsTPdNFe1ts0jxUBuyxWHr0oUXNYm6Wbk
         8vG/NqzMD9J141X7WLkmR8HKZ8aQtoWtU3Ezd2l6OLirCVHgO6eGjOFwb8n7R4T5WmwQ
         ul7xOpCiqJvL8mvMHLpa4a6YXrP4oequi9S5CxiNAhf5zkNDtbD31ILixAPjhCqgVuCY
         Ebw8oY743J88JoD8ii1ZUCoWRkedXsacJhXoGWeFFOaHK3JdUs1J/6R6uCUrM5whfb5Q
         nKt9e+tsgfJgpro1uPV16ABBzo/sq7tuBBybI1kAz3DI9oeINFdBQiRpHG4SHiKufKxQ
         m9rg==
X-Forwarded-Encrypted: i=1; AKwUvBzd/llhe85Zl3O6WbChZ/xkouzeMcfqAjashv3mHbUWN+9zVygJNWMdqieSLIaIQYprdx+CQrOd7/yxcbQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ4x5UctsreS0MK2P2o781hB5c6+ezkHzhlG7Hbg6xHYc22P2t7
	Tqkc4UHdKQ7B8hPl8KJZt7+snJtQuqi5v/2Ppf6xkbWGX16JSj7rxulADXWrqpeKQrkpT9a5pru
	mgtKDK3j/82SevuLC16VngxxEtrLTXSFp3gjracmg
X-Gm-Gg: AYBFou2VGkU8osLA4IKN9KWqDhfYtOCtPvvRU5oqQOIErzpvx5Xj/spJVLzdA5iJ/f8
	4qLnEZ3GdfTKSvzFJ7prLdqwg0lUdr24GOW7LVmKyrNpTBM5xBeBK40p6HTLLa4FkPwGNFpMayX
	ExRDEDwjUi50nkwgUllGelNQauNjUOG3lb3ChAjMe6qoaMav32eB6wPsns+t0lp2QKJOaqFH8W6
	yMVzkGYuxP0QLV8nlkXxpDt26uihfPfJxxv3HkJxntHgnDfuJ0f7WbZVhWJHRkWBmi+cV0VAf3h
	ZYV7iwV8R+z5KX7JZbvdLo//jn7ug3h07wZ1nsixH+t58tA6fj8WvImsVeJTxQqjzfDYnh/zADp
	IaH/uVx4Rnrw9tK3u/1B29TYvMCJbIPN9J0CLZ4vn4FdVl7qaSeVDO1aWC1OwW2peKtTW
X-Received: by 2002:a05:701a:c96f:b0:179:50d7:9ba4 with SMTP id
 a92af1059eb24-17950d79e34mr1584682c88.41.1791853649982; Mon, 12 Oct 2026
 18:07:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013010323.1058-1-kj2864@nyu.edu>
In-Reply-To: <20261013010323.1058-1-kj2864@nyu.edu>
From: Kuniyuki Iwashima <kuniyu@google.com>
Date: Mon, 12 Oct 2026 18:07:18 -0700
X-Gm-Features: AclHuK9fb-xIidc3O6m-1UunJL34PxLpQ58IP8Bcl0fSdhalNCCQj8xNELr3Jyw
Message-ID: <CAAVpQUC33fc7di-7a5tgTdsuD4_ADEM8ZAXn4BcfxNDi-1df1A@mail.gmail.com>
Subject: Re: [PATCH net] net: ipv4: add zero check for snd_cwnd_clamp
To: Kaho Jiang <kj2864@nyu.edu>
Cc: ncardwell@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, edumazet@google.com, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+71b6509cb791e531@bugs.sh, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 6:03=E2=80=AFPM Kaho Jiang <kj2864@nyu.edu> wrote:
>
> User can pass zero to snd_cwnd_clamp via RTAX_CWND type.

We should reject it then instead of ignoring it later.


> This could lead to division of zero error if not checked properly.
>
> Oops: divide error: 0000 [#1] SMP KASAN NOPTI
> Call Trace:
>  <IRQ>
>  tcp_reno_cong_avoid (net/ipv4/tcp_cong.c:510 (discriminator 1))
>  tcp_ack (net/ipv4/tcp_input.c:3517 net/ipv4/tcp_input.c:3873 net/ipv4/tc=
p_input.c:4440)
>  tcp_rcv_established (net/ipv4/tcp_input.c:6685)
>  tcp_v4_do_rcv (net/ipv4/tcp_ipv4.c:1854)
>  tcp_v4_rcv (net/ipv4/tcp_ipv4.c:2248)
>  ip_protocol_deliver_rcu (net/ipv4/ip_input.c:207 (discriminator 1))
>  ip_local_deliver_finish (net/ipv4/ip_input.c:241 (discriminator 1))
>  ip_local_deliver (./include/linux/netfilter.h:325 ./include/linux/netfil=
ter.h:319 net/ipv4/ip_input.c:262)
>  ip_rcv (./include/net/dst.h:481 (discriminator 6) net/ipv4/ip_input.c:49=
2 (discriminator 6) ./include/linux/netfilter.h:325 (discriminator 6) ./inc=
lude/li)
>  __netif_receive_skb_one_core (net/core/dev.c:6297 (discriminator 4))
>  __netif_receive_skb (net/core/dev.c:6410)
>  process_backlog (net/core/dev.c:6761)
>  __napi_poll.constprop.0 (net/core/dev.c:7830)
>  net_rx_action (net/core/dev.c:7893 net/core/dev.c:8050)
>  handle_softirqs (kernel/softirq.c:645)
>  __irq_exit_rcu (kernel/softirq.c:679 kernel/softirq.c:519 kernel/softirq=
.c:758)
>  irq_exit_rcu (kernel/softirq.c:775)
>  sysvec_apic_timer_interrupt (arch/x86/kernel/apic/apic.c:1062 (discrimin=
ator 35) arch/x86/kernel/apic/apic.c:1062 (discriminator 35))
> RIP: 0010:tcp_cong_avoid_ai (net/ipv4/tcp_cong.c:482)
>
> Fix by checking if user pass in zero as parameter,
> if so use the default value of snd_cwnd_clamp.
>
> Fixes: 51c5d0c4b169 ("tcp: Maintain dynamic metrics in local cache.")
> Cc: stable@vger.kernel.org
> Reported-by: co+71b6509cb791e531@bugs.sh
> Assisted-by: LLM
> Signed-off-by: Kaho Jiang <kj2864@nyu.edu>
> ---
>  net/ipv4/tcp_metrics.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/net/ipv4/tcp_metrics.c b/net/ipv4/tcp_metrics.c
> index dc0c081fc1f3..ff41804ad086 100644
> --- a/net/ipv4/tcp_metrics.c
> +++ b/net/ipv4/tcp_metrics.c
> @@ -484,8 +484,11 @@ void tcp_init_metrics(struct sock *sk)
>                 goto reset;
>         }
>
> -       if (tcp_metric_locked(tm, TCP_METRIC_CWND))
> -               tp->snd_cwnd_clamp =3D tcp_metric_get(tm, TCP_METRIC_CWND=
);
> +       if (tcp_metric_locked(tm, TCP_METRIC_CWND)) {
> +               val =3D tcp_metric_get(tm, TCP_METRIC_CWND);
> +               if (val)
> +                       tp->snd_cwnd_clamp =3D val;
> +       }
>
>         val =3D READ_ONCE(net->ipv4.sysctl_tcp_no_ssthresh_metrics_save) =
?
>               0 : tcp_metric_get(tm, TCP_METRIC_SSTHRESH);
> --
> 2.43.0
>
