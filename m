Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF3D2E2286
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791791059; cv=none; b=XSau61k0HF4PBK4NWW7GC9CiCaZCjz9a/oMzoxKb0gTt7JsfbZYJySn6IHmVd3W7wZQRh8zt8zYfhWpc/lvoEXcVoyMv2zq6icQlS1O3hg1Y4I6UwjpK/I+Ze/Ab/Ul3bNcYv2Z2x5vqUehjmm3k3/sQhxGD1vINN35LIkwA3/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791791059; c=relaxed/simple;
	bh=hXOd5jJMjMY5JG9E7N4kbUgk72ZJPPJJqbV/dLaXZqM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZNtLkaqq/xSGFbLDthIGUEV6h+5ucpRt8dFA079KaDXq3C2rdpON4SkpLn5kWDswwBAvA0RMfa41Gf6cic0zBZzoPpZgP/76ErazEfPBTwYr2NYDw8kx8DZ/oogYJOVT7mchsEAlqQ/vVfhISWH1zYqV4LFcxmaZStUBCmHz4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CRtCdLdC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CRtCdLdC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B4151F0089F
	for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 07:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791791058;
	bh=hMFFt2dTwEHeqUJZTjYFi74QBdP7J6nRtlnR74ipM+k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=CRtCdLdCSBXUqPpLTGYIZUBSdSl25RNMqX7xI8HNNmeckeIiCEU1r0yMk/Qh6QQbx
	 AZP4SdxxcOLWV6DjGYF5UUkkZ2azBlm4V8Qpn3RjnkXxfao6OzQ6h1sO1vk5rZ2vC2
	 oS7thB5QG7r/JmLBkNhh3K6nnNDRaYIlgo9y9nb/neKM7M4Eu2a6ejwc22yZjVhetX
	 L/lbQSLoNU+A/jKiS1r3WWkVcR6oUB9kk+dPBYEaejYN60M1v9BapENqUXWNOoeXkx
	 OnhuUqNRNaHIMOil6rsxBq0uF2QjC6uiSwGTZUOGgFaL3o3VRrXIoKbEPxAKGQ9Z6d
	 U3As4qJweWGEw==
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6dfc4510440so937371eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 Oct 2026 00:44:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfHkQml7otETfpNFMaGPtPDeYLpCJVezcY4fnENjr/KKID5UXJzn3a6JKoYJPEfFInL35FPUT3/5wMcys=@vger.kernel.org
X-Gm-Message-State: AFq9FYI90sIKoNFVBJZmfJXwn/lwScOYyeuCyETBDHAffKZ/4sAuEdEG
	cidZVTXm9ENsfnn+KeCmaXVncjj3gafPVeUBS6ku0bxfnC95ig3Azv5UP+ZjTL7VE84H43H1qVl
	+/rkGot4Osom6nJKEimUEOa69Skr9hNE=
X-Received: by 2002:a4a:ee87:0:b0:6df:ac2e:85ae with SMTP id
 006d021491bc7-6eee1a3c494mr5930049eaf.14.1791791057575; Mon, 12 Oct 2026
 00:44:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261008114942.1376889-1-theodorlarionov@gmail.com> <179175973842.434549.79608444362932465@kernel.org>
In-Reply-To: <179175973842.434549.79608444362932465@kernel.org>
From: Eric Dumazet <edumazet@kernel.org>
Date: Mon, 12 Oct 2026 09:44:06 +0200
X-Gmail-Original-Message-ID: <CAL4WiirGz1GVZg5Jc8NBQrzZuU093NM-EqOw9LDv_cq9vnYV9A@mail.gmail.com>
X-Gm-Features: AclHuK-W--cxzeyNc34DgFw861UXFHLiI2GSs2s5EZNY8wA3TC_HdlNwJM0158g
Message-ID: <CAL4WiirGz1GVZg5Jc8NBQrzZuU093NM-EqOw9LDv_cq9vnYV9A@mail.gmail.com>
Subject: Re: [PATCH net v2] tcp: do not send a SYNACK to a broadcast or
 multicast address
To: netdev-bot+sashiko@kernel.org
Cc: theodorlarionov@gmail.com, ncardwell@google.com, kuniyu@google.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lun. 12 oct. 2026 =C3=A0 01:02, <netdev-bot+sashiko@kernel.org> a =C3=A9=
crit :
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>
> Critical: 0 =C2=B7 High: 1 =C2=B7 Medium: 0 =C2=B7 Low: 0
>
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwor=
k
> know by including "pw-bot: cr" as a separate line at the end of your repl=
y
> (one such reply per series is enough).
>
> - [High] The fix is incomplete.
>
> --
>
> tcp: do not send a SYNACK to a broadcast or multicast address
>
> This patch makes inet_csk_route_req() reject SYNACK routes that have
> RTCF_BROADCAST or RTCF_MULTICAST set. A SYN with a multicast source that
> is looped back with its dst attached skips the martian source check. Its
> SYNACK then goes through ip_mc_output(), and sk_mc_loop() reads past the
> end of the request socket.
>
> > diff --git a/net/ipv4/inet_connection_sock.c b/net/ipv4/inet_connection=
_sock.c
> > index 6a30f11384547..aa928015cd143 100644
> > --- a/net/ipv4/inet_connection_sock.c
> > +++ b/net/ipv4/inet_connection_sock.c
> > @@ -779,6 +779,9 @@ struct dst_entry *inet_csk_route_req(const struct s=
ock *sk,
> >               goto no_route;
> >       if (opt && opt->opt.is_strictroute && rt->rt_uses_gateway)
> >               goto route_err;
> > +     /* Never send a SYNACK to a broadcast or multicast destination. *=
/
> > +     if (rt->rt_flags & (RTCF_BROADCAST | RTCF_MULTICAST))
> > +             goto route_err;
>
> [Severity: High]
> Does this cover the syncookie passive-open path? cookie_v4_check() in
> net/ipv4/syncookies.c does its own route lookup to ireq->ir_rmt_addr.
> The only check on the result is IS_ERR():
>
> net/ipv4/syncookies.c:cookie_v4_check() {
>     ...
>         rt =3D ip_route_output_key(net, &fl4);
>         if (IS_ERR(rt)) {
>                 SKB_DR_SET(reason, IP_OUTNOROUTES);
>                 goto out_free;
>         }
>     ...
>         ret =3D tcp_get_cookie_sock(sk, skb, req, &rt->dst);
>     ...
> }
>
> In the syncookie case, tcp_v4_syn_recv_sock() uses that dst as is.
> Neither inet_csk_route_req() nor inet_csk_route_child_sock() runs.
>
> So it looks like a full child socket can still be created with
> inet_daddr set to a multicast address such as 224.0.0.1. Active opens
> already refuse this in tcp_v4_connect():
>
>         if (rt->rt_flags & (RTCF_MULTICAST | RTCF_BROADCAST)) {
>                 ip_rt_put(rt);
>                 return -ENETUNREACH;
>
> The ACK that completes the handshake can come in the way the commit
> message describes for the SYN: raw IP_HDRINCL, nft dup or TEE, with
> saddr=3D224.0.0.1. tcp_v4_cookie_check() passes any non-SYN segment to
> cookie_v4_check().
>
> The cookie can pass in two ways:
>
> - cookie_tcp_check(), after a recent overflow. A netns owner can set
>   tcp_syncookies=3D2 and send one unicast SYN. After that, ack_seq/seq ca=
n
>   be brute forced at about 2^-29 per packet.
> - cookie_bpf_check(), when a BPF program is in use.
>
> Once that child is closed and in TIME_WAIT, a segment from the peer
> would go down this path:
>
> tcp_v4_rcv()
>   tcp_v4_timewait_ack()
>     tcp_v4_send_ack()
>       ip_send_unicast_reply(ctl_sk, tw, ...)
>         ip_route_output_flow()   /* daddr 224.0.0.1, no rt_flags check */
>         skb_set_owner_edemux(nskb, tw)
>         ip_push_pending_frames()
>           ip_send_skb()
>             ip_local_out(net, skb->sk, ...)
>               ip_mc_output()
>                 sk_mc_loop(tw)
>
> sk_mc_loop() does not check sk_fullsock():
>
>         case AF_INET:
>                 return inet_test_bit(MC_LOOP, sk);
>
> Wouldn't that read inet_flags past the end of the tcp_timewait_sock
> object? That is the same out-of-bounds read this patch fixes for request
> sockets. This path comes from reading the code at this commit; it has
> not been reproduced.
>
> Could the same rt_flags rejection (ip_rt_put() and drop) go after
> ip_route_output_key() in cookie_v4_check()? For symmetry it could also
> go in inet_csk_route_child_sock(). In practice that one only runs after
> inet_csk_route_req() has passed, so it is just an inconsistency.
>
> Another option would be to change sk_mc_loop() and
> ip_send_unicast_reply() so they do not treat non-full sockets as
> inet_sock.
>
> >       rcu_read_unlock();
> >       return &rt->dst;
> >
>
> --
> Sashiko AI review =C2=B7 https://netdev-ai.bots.linux.dev/sashiko/#/patch=
set/20261008114942.1376889-1-theodorlarionov%40gmail.com

OK, it turns out we have not one, but three different bugs.

I am working on a series of three patches. I am preparing for it.

1/3 tcp: do not send a SYNACK to a broadcast or multicast address
2/3 ipv4: do not send a TCP reply to a broadcast or multicast address
3/3 tcp: use the saved source route in cookie_v4_check()

pw-bot: cr
