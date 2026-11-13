Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794548669;
	b=uehBbWjWi+jJ6FBSSG/lhTgUtBqG7haRfM10VIfCWWtuBqJhWtIVDHgwXdemCOKBoJ8N
	 qqdaY0tQuD4/YcEFb2tuyewvLqhmafP45zYeuBR/EaoBcUoSPvgE1HY/G6CFi+CVVHwVn
	 +WF2wOqxPjyDvnhoJjh9qxJXcj9TrJamTCDmiaB3CQ5wwZIJk+mowsG2SLZ7F0yLyveG5
	 yKOcof2Bci3txIbHOl/7NP4BliL0qUWi/zfvsYKcxvcLGj1R6Y6s1XpgWhX4i6ytY062q
	 Ian0jKdUdPboJe/gk43+AlvMhyDTJpQKgHdjXzZFZkGDubYpZecEdMn5p4t3zcvy5kw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548669;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
	b=cv/9RL1pQFEx9ftkj+sPw44leFoj2Fj5b4wzoeXN9z+ZhTWTnDLd3BPlD/2dRE3Jxrl0
	 CyQqKyDSqh8hhDkchTC7bZ9lhpmMcL5XswIdUdDchb8tKKIHAlIOoru1Mi8L5yoppCG27
	 cAOWAp81ukukK5Of7oYafCgVGEaCDRDChD/HsojXaEUqKnV+9TaBOMH6yKISk5ALhdWv3
	 RBYoZLVrkbXSdpro5d7NVgQMHo6QHXPEOT9oj5N5ttZgSyIsK1n8eFE2j3jfUOiJjRgha
	 qVtXo/pp88GLejdMpQhbdqbU1ZKnXRCjjAEqcpz6A9Hp2QKcSuS7cVeG+37Zseun3yQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlwZfLjy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAC7606A31C
	for <linux-kernel@vger.kernel.org>; Fri, 13 Nov 2026 05:44:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AAC7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlwZfLjy
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b10ca4e3f9so252016a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Nov 2026 21:44:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794548668; cv=none;
        d=google.com; s=arc-20260327;
        b=VLe3qZnOxxSKL7375qhK3ghBpfgGGf5pCEW2KxZnbtCFsd//iIU2fAdRALdnffKagQ
         HWwqdSycIoPvbaR5agfJr2O+whFJ6B98qXYtAo7Lw72OTjTo74biktogRW1Ml2/ytjPv
         ZH6/sgcMkfiR7okcBjdAmKTknWeX3FIo4XPqQSl/t4EATVGWc6UPW1F0Q4s2tkXx/RRt
         R4Lll/U+L8rdO4JW1NcK44dtKzO4epSfYwa9SF8PkvT4MllIirmTYQTZguzm7Sbk/niZ
         QYTv5w01wR8hE3PVDL5qH3LDD7SYMU8HflSV8/4D1yskcz5a1idpSYfnmAEVKITPh9lo
         qGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
        fh=yjStbRuU507Dm8jfORq0ngP0jn7RX4rXryEFH55CQaU=;
        b=ZncwEJZe80+xXARaN/9xH7o9YbNCC9jA6EhGbm0B6jj7SUa9URkpJgfDF5jck/H1Su
         UfmsUyf66pgdB0jRV3wCg+6FKgmWzmEQK289UVsxul3vb4CjSQTlHq1FyOQjZSAoEPlv
         QklHCeZ991t7qeaeABcZJ7WgpHAtIB5i8w4qpV0Iiy9DCZCiwLAr1JMqJQqkpGYP8uy5
         mY5sVbS1Numtkt/sz+IlP9AoG8d8ZqPodAonb4XkhbA3TcR3C3vaQgrU0HaDAtZtUSyW
         SYW5nWPTNOtEgUPh3v9ykTVmirzKHul2gEC8mrkmw93f7+lG6xw1AsgrHEzJxlGnA914
         6SMg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794548668; x=1795153468; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
        b=YlwZfLjyBPstI07GiXcbgY1PgHaL+X5W1yWOy/eXHR65Fx/h/UCfPh0Yr1zgMQmRs1
         6nZ1jxA0xPOT+RzxfuvQB99/uzu3eIj6nWI1wr59N0wuB77ZtYWgvaa52BphV79zRU/j
         QfteFPa6jhw8RqeQu008yjqsZCt1PsR8lXYCiG0B1RkfoszrAuFbtM2poeYz128vYgMG
         0F5Gu6WwU/Zq0Y91DTakxZVD8AQFazyjvKgStdJwrcpEO5f84X7vog3Tww+C8afVkiIy
         dnqdzIlRv5GFAQz+hTgqvFJc6dRJUFgMtRItZwxxYtjd3c54F4UCBdH0pua4OUMgzeCL
         +35w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548668; x=1795153468;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UDUDmvLFrjDceUNHFFnKFwmFqi3Bs4rQ7NT0WKbQyu0=;
        b=vYKSC35+7NPT7leqKoDkWUGe+Qb1m7QMwwilJuLKx281vevAixtF5uIgpCexeP6UQ6
         Aj8qwwgFBcpIyBbWPDdk6AEc+AfyvDGBUHGIhx2kxPXGc0+er+2UH+e2kSKhyrJ5uJ+t
         fyuEnDfNjoPNsRd3omQ+wdwNLqlqiwpW3GieSPKCmoXEtff9w6qawkGXf/5KhReELKqx
         enx4MElexCUSoGZKYBuOqbCEfwVVTQfa3ReDUk4eOScf7Wfsht1ZFQ+lsEOhHOwvRQCJ
         g2VB4lneSBzmJ3FL96VVB5pssOdZgTrDjh4CeTXk5NG08QyrBnEogq9x3lvCgyuprxEr
         o46Q==
X-Forwarded-Encrypted: i=1; AL+hErG5+SSDCm8yh9yMwcGAmBaNk3oEI//ydt54pJepRj6nZSxfa1GzxCzMgi1RLFM/m0rQI0wp7TGJgwmNOBc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8/NOzZrur0pRiUENxrw0FNF8G1WEwslty8WPhVFcH06x2wrfft
	jN0tPEuDB+7tA8KxD/5mBNzBthOdmZRiK8z+b89f0/1nn5DzOgQFP5b2tEkNxDUedru8tzIluqi
	gpjwAB/v6CTnq2e9NWEXYOs/Z2GFscNI=
X-Gm-Gg: AYBFou1cidc6gVermVYlgd/XCrLake5JqlsdmS/mMdmDdqAUUMQQ9UOARjTputH+fkm
	ZtBvzvM8frku7WWjX99n8f/gtGKXpvKEZ/GBtvgq3TwEarscybiym4mBLEuXbeY9ccc1BYi53to
	FXO7zyaQwWDQTAKQwzLJIqzfvMKUzyIDW9oYBlMQVePFt70pHYOXlWzf+RWPAMcvHI+PWqqO2tk
	+n3TSynS9q6q1Br87SsfE9ADCGXqoHnMlej9/2IplLlrQC4eX49BnLOIgiYhQXkZrYm6UgYPYXv
	WL9JWfL5jxi9Z/R20CuEuqfhTd9nR58eO2PCDpJUV82ap6KVGyvY9Z61gN5RriNTS78Cqm3+SHc
	9EJXrw9KQ/aPE2h4yUEboDx8riUxtdB+/63Y=
X-Received: by 2002:a17:90a:ec05:b0:3b0:c11a:902d with SMTP id
 98e67ed59e1d1-3b1b09fac26mr938995a91.10.1794548668130; Thu, 12 Nov 2026
 21:44:28 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261109030042.2956-1-nashuiliang@gmail.com> <179443085204.2199510.12725312671048285646@kernel.org>
In-Reply-To: <179443085204.2199510.12725312671048285646@kernel.org>
From: chuang <nashuiliang@gmail.com>
Date: Fri, 13 Nov 2026 13:44:17 +0800
X-Gm-Features: AclHuK9F9oQ5Qrk0_Q8z0DxMdLD_AqhLC4iCmwIoVy-nc5xaLnUdD7relDJgbSU
Message-ID: <CACueBy6qrkoTqOi6b5FN7YEFLVzUve3+tbzS=f67ZJO1Px7xiQ@mail.gmail.com>
Subject: Re: [PATCH net-next v12] net: reduce ARFS flow updates by checking
 LLC affinity
To: netdev-bot+sashiko@kernel.org
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, 
	skhan@linuxfoundation.org, sdf.kernel@gmail.com, daniel@iogearbox.net, 
	bobbyeshleman@meta.com, kuniyu@google.com, willemb@google.com, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 12, 2026 at 5:00=E2=80=AFAM <netdev-bot+sashiko@kernel.org> wro=
te:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [Medium] set_rps_cpu() (net/core/dev.c:5281-5284) decides whether to
>   skip ARFS hardware steering by comparing next_cpu with old_cpu.
>
> --
>
> net: reduce ARFS flow updates by checking LLC affinity
>
> This patch makes set_rps_cpu() skip the ARFS ndo_rx_flow_steer() call
> when the CPU recorded for the flow and the new target CPU share an LLC.
> rflow->cpu is still updated. A new sysctl, net.core.arfs_llc_affinity,
> turns this on and off, and it is off by default.
>
> > diff --git a/net/core/dev.c b/net/core/dev.c
> > index 3b60b15e2175e..0011cec296402 100644
> > --- a/net/core/dev.c
> > +++ b/net/core/dev.c
>
> [ ... ]
>
> > @@ -5273,6 +5277,12 @@ set_rps_cpu(struct net_device *dev, struct sk_bu=
ff *skb,
> >               if (!skb_rx_queue_recorded(skb) || !dev->rx_cpu_rmap ||
> >                   !(dev->features & NETIF_F_NTUPLE))
> >                       goto out;
> > +
> > +             if (static_branch_unlikely(&arfs_llc_affinity) &&
> > +                 old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
> > +                 cpus_share_cache(old_cpu, next_cpu))
> > +                     goto out;
> > +
>
> [Severity: Medium]
> Does rflow->cpu reliably show which LLC services the hardware queue the
> flow is arriving on?
>
> get_rps_cpu() takes old_cpu from the hash slot in the arrival queue's
> table:
>
>         tcpu =3D rflow->cpu;
>         ...
>                 rflow =3D set_rps_cpu(dev, skb, rflow, tcpu, next_cpu, ha=
sh);
>
> That value is software bookkeeping, and other flows can share the slot.
> The new check runs before the cpu_rmap_lookup_index() /
> skb_get_rx_queue() comparison. So it can suppress ndo_rx_flow_steer()
> even when the arrival queue's IRQ/NAPI CPU is in a different LLC from
> next_cpu.
>
> The skip path still reaches:
>
>         WRITE_ONCE(rflow->cpu, next_cpu);
>
> sd_llc_id equality is transitive, so every later migration inside that
> LLC would skip again. Could the flow then stay on a far queue
> indefinitely?
>
> Here are some ways rflow->cpu can drift away from the real hardware
> queue:
>
> - After a successful steer from queue A to queue B, packets still in
>   flight on A go through set_rps_cpu() again and hit:
>
>                 if (hash !=3D READ_ONCE(tmp_rflow->hash) ||
>                     next_cpu =3D=3D tmp_cpu)
>                         goto out;
>
>   This records next_cpu (LLC X) in A's slot, but A's IRQ may be in LLC
>   Y. Two later cases then hit the new skip, with the application on
>   another CPU in LLC X. One is a flow whose hash collides with that slot
>   and which RSS delivers on A. The other is the original flow coming
>   back on A after rps_may_expire_flow() let the driver drop its rule.
>   No failure is needed for this to happen.
>
> - The existing goto out paths still record next_cpu without moving the
>   hardware queue. These are ndo_rx_flow_steer() returning rc < 0 (for
>   example -ENOMEM, -EPERM or -EPROTONOSUPPORT from
>   mlx5e_rx_flow_steer()), a target queue with no flow table, and an
>   active colliding filter. Before this patch the next migration retried
>   the steer. With the sysctl on, migrations within the same LLC never
>   retry.
>
> - irqbalance or an admin moves queue A's IRQ to another LLC. cpu_rmap
>   gets updated, but the skip happens before cpu_rmap is consulted.
>
> - A driver drops all of its hardware rules without touching
>   rps_dev_flow, for example mlx5e_arfs_disable()->arfs_del_rules().
>
> In each case NAPI would process the packets on a remote LLC, and they
> would then go through the RPS backlog to the application's CPU with an
> IPI.
>
> This also seems to conflict with the new text in
> Documentation/networking/scaling.rst, and with the similar wording in the
> commit message:
>
>   "since the application's cache locality is preserved either way"
>
> The reported ~99% drop in mlx5e_rx_flow_steer calls cannot tell avoided
> redundant updates apart from steering that is wrongly suppressed.
>
> Would it be more accurate to compare next_cpu with the CPU servicing the
> arrival queue instead of the previously recorded rflow->cpu? For example,
> that could be smp_processor_id() for non-threaded NAPI, or the CPU tied
> to the queue from skb_get_rx_queue(skb).
>
> >               rxq_index =3D cpu_rmap_lookup_index(dev->rx_cpu_rmap, nex=
t_cpu);
> >               if (rxq_index =3D=3D skb_get_rx_queue(skb))
> >                       goto out;

The scenario walkthrough was very helpful, and the issue is real.
I will add a READ_ONCE(rflow->filter) !=3D RPS_NO_FILTER check to
set_rps_cpu() in the next revision:

if (static_branch_unlikely(&arfs_llc_affinity) &&
   old_cpu < nr_cpu_ids && cpu_online(old_cpu) &&
   cpus_share_cache(old_cpu, next_cpu) &&
+   READ_ONCE(rflow->filter) !=3D RPS_NO_FILTER)
goto out;

> [ ... ]
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261109030042.2956-1-nashuiliang%40gmail.com

pw-bot: cr
