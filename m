Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8443369D45
	for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 07:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543986; cv=pass; b=KGrqBUEwbWqJw1Z23RBG0cWhjnK+bMUOVwb58DY6DIpM1oy3LTwWw9cmSyjoot/ndqpJ+3WrwnJxhYgQ74BuLI4cpXw7otEhYsdX1JmkhlYBE7NZF7M/Wx2WOUnhbOQO5DRJxnLWuDj7T/elE2Z5hBZVNqcP0UhVSVP2OldD9Kk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543986; c=relaxed/simple;
	bh=mjR04Bkrj9erkkufpQlRwq76e4C529B6SDKCewiFrYY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T9wqWbfdJGoNf13U/LZ4RZPjfHKgI1gd4kf/hvpbTsP7h9aLS3tydXWFakfy5uKUoDFwr8+ndwxpXejW77Bn1NOkm5JgA4bsjLm33EWUNVHwQeHfBbUh9v4oVC2Mdmk7pxsPi1uVibr9rhUkpvqe6/AiT9/76CM6iX+dOPICl+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu; spf=pass smtp.mailfrom=asu.edu; dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b=OJIYvXnP; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=asu.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=asu.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=asu.edu header.i=@asu.edu header.b="OJIYvXnP"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4c3304833so425834a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Sep 2026 00:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789543970; cv=none;
        d=google.com; s=arc-20260327;
        b=DocdRuEx3+Ou4gdhGi9uJ0ir66PUxjMgPTlaogCOVdgQIHMyB7K8oxpcUve6vNEYqD
         udoAtNaimMhzlNtKyKYwW72RSaoM3SLur1AQkvXQzXc4AAux6r4Q8DR8H6r9Ek65sAaW
         GPjvyu6Sg4rGoicMs0RVk7Q97+RDIo5cMYw05ux029iAtZeiggXd9iEQJfZaB2KxXvgT
         08HoWPPo2gUUJN4xUbbex/u7kx00OMqrQ1sW5dUd54+nxdunAdYgtQbpi6PxJPZ574tT
         nmyZbZ9aE+NmOuB01WAlFZJttXE1E9IbBq6JjG8yMQ9YtiNnUpkUBrMoOD5AQp2oD16C
         5nCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VZpiE0+zzAEvG+TqmxLhQovdw7arxClPfA9bmtpoXjE=;
        fh=q/3KYFVyZ+VrGTjPXf/BTWk2e5cmEcjDF7NCH+C0/M4=;
        b=cHMaQCnnfbUdySutzXhvWEqFEWeY44gHcmTFvRlLIpQ+n6UkN9O3bUq5+EpairYtEJ
         tXG/AF40Csfa+nJyniwoPPyIn5pffpbK1lpUY32pVCB1Y6wRQO5VeKQICNV26IauuVCB
         63B+llkvPv8h8rpalYsUl/xgf1cp2GfToNKdXaKyQPVVPxeZNvZswKKXuKliAn5sw2/z
         nOWlNADQg7tGKTNaH67bBQQOYhookWInxNJBF+2cc+LFkiJKamYM9zGQa3g1qBzaSvfS
         BrgShyWfprHV4z0N1r9+AP/Vywy17YNoIi84Qm0PelCRl/8d8iF4zJsiAZxpFalS290T
         4H2A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=asu.edu; s=google; t=1789543970; x=1790148770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VZpiE0+zzAEvG+TqmxLhQovdw7arxClPfA9bmtpoXjE=;
        b=OJIYvXnPpF9Lju1/Az7OlaneV7iSXbgSm69SplH0kBg8jdVCwjt9Vz8RRxe1U47DC7
         +wRTs5dhS46ut47RPGJs7xtA0yzzbb9pEIxWn/yqgyhu0L/Bz1I73RiPbe+GYD+F7T5Q
         wDxYxCfFZu5bsIL4Thd6eJSAlbydMPVcUsyLuQalJFDJRlddQmbHKf7UD/axONPtOe/w
         JRa+6v0F8kq5P4Ekx4JZmzYWB7xLD1moz161O0GW5F6PW+RW5UjMSJ5ufEYr/3Vj4m9G
         BhEPsCJxxCvZtiOUdAi+0N+u3EueqbUeDsq0n3bUKO20Ew/oZLyzfBO0lh2oRw3+NO3q
         i+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789543970; x=1790148770;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZpiE0+zzAEvG+TqmxLhQovdw7arxClPfA9bmtpoXjE=;
        b=J5OXeccFP053kiCYmEWx0/5mCIs5F5fEF7gLqrUBSY6wPJBZ2E41pAZyJyQ1wfCWHa
         pqMW3SGsqGgqZm8I/x91Onk2SPCU7ETgmWoB6grGRxpGAvo/p7AtMjr7f6znqF8j038u
         koaVqWCzj2STxIOP+cq0rq0otWpTqj3o0m53WtEXUT+3REkscR4nUuE8G5NA16PL4Ty5
         Gi5U2WQwVMX12fspYUOvaPDLM/gdvTWTa/1tRVW3sH+1l4SceWLPR8pQj5nxHtjm0l19
         9Y+1iKx12Brj+J3OOZ25/vKwwVbfMkQYg9qfKt8jPbTUZlKGfFaU5llxjfqObi2h55/1
         vwyA==
X-Gm-Message-State: AFuF++mTBYTI5SnqAYlUgpGDM4SzcATALX2bM7Hoab7FCebJW7UaYleX
	5ZKJarro6sBYPUQsR4FTf2EvpIdqwQaqRuyWz7Ru9GM+ebwEQfrUMKwDdg1gAYlulOWiUGLDPuq
	JSy5+uNRYsmiPEZiIxCuxh80SJ9Dc4gVsN2wLwu9Q
X-Gm-Gg: AYBFou25RLPgx0Zkk5fpE+R1V68aWpacgGIPJ0PNn6dp8KG4Ya/LVdzXpe/9mdQGpEr
	f58qJ+6/r7A3I5Y+9qpfN0Vp2wpX22z4w06mFt+ehoSwY1vJ36siMEN2ZOqU5NLzIX+5l3+cKUE
	YVEdZ5uj3hFvUyo4ZqF1cyYWyfOrNkAg+rOlhx1hiTyPw7DfyI5ffO7cc03o0ZPFsUyrqFxTffT
	DdXtIzPUUe5Ph0oSbY9YMM1LEVezACjl5V8+sZnS1JY+pVgmURWgAgh4eXJWMffS69CiyGG0/2d
	MCV93wScDy8AdbT+OKuIdV4j8MmNSBaYKBw7NY6MQR0Tn9lJtqCg4EzFNEyjqY4bwNxVBKK3hUs
	XLU6TMa3IVOMvUDIItEBIOv5v3WFamxE7YRF6Y+tCCvOjKA==
X-Received: by 2002:a17:90b:524d:b0:39d:eca2:5c81 with SMTP id
 98e67ed59e1d1-39e1e2dea05mr3829092a91.8.1789543969709; Wed, 16 Sep 2026
 00:32:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916041102.1914333-1-xmei5@asu.edu>
In-Reply-To: <20260916041102.1914333-1-xmei5@asu.edu>
From: Xiang Mei <xmei5@asu.edu>
Date: Wed, 16 Sep 2026 00:32:38 -0700
X-Gm-Features: AcwNN1Xljv2HCFLUQMDufNtEairMBCo-H1BK8G1-p5r5dXNC6bE7Jd1RDn7HVDo
Message-ID: <CAPpSM+SpeOa5uo5rffXejDa4g9VGphp1GvirJgUWze-O+cQyzA@mail.gmail.com>
Subject: Re: [PATCH net] bpf: lwt: clear stale IP control block after pushing
 an encap header
To: davem@davemloft.net, edumazet@google.com, kuba@kernel.org, 
	pabeni@redhat.com, horms@kernel.org, netdev@vger.kernel.org, 
	bpf@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, co+ff13a35f73bb7891@bugs.sh, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 15, 2026 at 9:11=E2=80=AFPM Xiang Mei <xmei5@asu.edu> wrote:
>
> bpf_lwt_push_ip_encap() prepends an encapsulation header and calls
> skb_reset_network_header(), but leaves the IP control block describing th=
e
> inner header. Its offsets are relative to the network header, so they now
> point into the encapsulated packet.
>
> On an ingress lwt-bpf encap route a forwarded packet carrying a Record
> Route option then reaches __ip_options_echo() with a stale opt->rr. It
> takes the option length from the packet and copies up to 255 bytes into t=
he
> fixed-size option storage on the __icmp_send() stack. ip_forward_options(=
)
> writes at a packet-controlled offset for the same reason.
>
> Clear the stale state once the outer header is in place, as the tunnel
> encapsulators do and as seg6_local.c was taught to do in commit
> f967455fb2a5 ("seg6: reset IP6CB after IPv6 decapsulation") and commit
> 44930446dde4 ("ipv6: seg6: clear IPv4 control block on IPIP
> decapsulation").
>
>   BUG: KASAN: stack-out-of-bounds in __ip_options_echo (net/ipv4/ip_optio=
ns.c:96)
>   Write of size 255 at addr ffff8880bee08930 by task exploit/150
>
>   Call Trace:
>    <IRQ>
>    __asan_memcpy (mm/kasan/shadow.c:106)
>    __ip_options_echo (net/ipv4/ip_options.c:96)
>    __icmp_send (net/ipv4/icmp.c:949)
>    ip_forward (./include/net/icmp.h:43 net/ipv4/ip_forward.c:176)
>    lwtunnel_input (net/core/lwtunnel.c:465)
>    ip_rcv (net/ipv4/ip_input.c:612)
>    __netif_receive_skb_one_core (net/core/dev.c:6264)
>    process_backlog (net/core/dev.c:6728)
>    __napi_poll (net/core/dev.c:7787)
>    net_rx_action (net/core/dev.c:8007)
>    handle_softirqs (kernel/softirq.c:645)
>    do_softirq.part.0 (kernel/softirq.c:546)
>    </IRQ>
>    __local_bh_enable_ip (kernel/softirq.c:473)
>    __dev_queue_xmit (net/core/dev.c:4961)
>    packet_sendmsg (net/packet/af_packet.c:3143)
>    __sys_sendto (net/socket.c:2281)
>    __x64_sys_sendto (net/socket.c:2288)
>    do_syscall_64 (arch/x86/entry/syscall_64.c:84)
>    entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:121)
>
> Cc: stable@vger.kernel.org
> Fixes: 52f278774e79 ("bpf: implement BPF_LWT_ENCAP_IP mode in bpf_lwt_pus=
h_encap")
> Reported-by: <co+ff13a35f73bb7891@bugs.sh>
> Assisted-by: LLM
> Signed-off-by: Xiang Mei <xmei5@asu.edu>
> ---
>  net/core/lwt_bpf.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>
> diff --git a/net/core/lwt_bpf.c b/net/core/lwt_bpf.c
> index da49364ec63d..17be476b5717 100644
> --- a/net/core/lwt_bpf.c
> +++ b/net/core/lwt_bpf.c
> @@ -649,6 +649,18 @@ int bpf_lwt_push_ip_encap(struct sk_buff *skb, void =
*hdr, u32 len, bool ingress)
>         if (ingress)
>                 skb_postpush_rcsum(skb, iph, len);
>         skb_reset_network_header(skb);
> +       if (ipv4) {
> +               memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
> +       } else {
> +               bool l3slave =3D ipv6_l3mdev_skb(IP6CB(skb)->flags);
> +               int iif =3D IP6CB(skb)->iif;
> +
> +               memset(IP6CB(skb), 0, sizeof(*IP6CB(skb)));
> +               IP6CB(skb)->iif =3D iif;
> +               IP6CB(skb)->nhoff =3D offsetof(struct ipv6hdr, nexthdr);
> +               if (l3slave)
> +                       IP6CB(skb)->flags |=3D IP6SKB_L3SLAVE;
> +       }
>         if (is_udp_tunnel) {
>                 size_t iph_sz =3D ipv4 ? iph->ihl * 4 : sizeof(struct ipv=
6hdr);
>
> --
> 2.43.0
>

I just found Weiming post a patch solving same problem:

https://lore.kernel.org/bpf/20260915170147.3943392-2-bestswngs@gmail.com/

and that patch covers the cases I didn't consider so please ignore this pat=
ch.

Thanks,
Xiang
