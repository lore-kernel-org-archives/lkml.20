Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711647;
	b=aGc+IPUqIdT4lTTpmzOUIsVCjXDxG281svjqOiLLFoaCkeYNH0RyiEpN/PFytI/ED7pj
	 SpwrIlRbtCqUvQUM2ToVpy8d6ifM8oJrAupIdKLQk70uVx1n5Hae/DxYY1//81NjS4ALE
	 OubJiZn+l85cv5ltV3Ya+p3mrecN0DT9kNTfKRW+RBtjEDOWf3OM/eO5SZsLpwIBtBc9T
	 7u3Gf0EYdZPK9GIg2IPlVGPJRXH7UAnXF7x7EIcjozNxxaqT0Gln5wZf6mIGh8jrsPTp6
	 Up8WDA/xdEHZ01b8+ZqmlQS5AxJ5VmcfE17P3ebvTrzHLIECBZigF5aKI8eVPezMh/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711647;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BL9pF1t9cF+2q2RHW7o6tX7PCUVdJX0A44j6YGdXXNc=;
	b=3Vix4k/oIjNpiQzOJMFJkhEIXryjwjetbgxMAS+9n6bjdRoAErYT/UmEXnLwVhVpxe4D
	 w+MoQjaK/Pwp7vVfEftFVjxyFQxyqH+NYkqFWTmfPU05E1uEWfpFAB+wMwhCb8jX5tBmf
	 irREntN7AUfhiBncCW8l7xsW5KNvOF9iSDh+6MWXRcwo/YfUrOf7Wn7dLW56S5uoSwjcY
	 WXyoF8TZ3X08cHDXcwH3lqbuFOnA419X40HiClCyDwB2b8Uq7ovm8W2jwbkiLWsSGTK6M
	 UHAsHRB9cMp4kKXhDVmECPIifAKkk2wwL87tnKob1KY42/GfFTScpNiCqwcG5rMb7JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfTa27Y1;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCA8606A336
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:14:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UfTa27Y1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2CF21F000C1
	for <linux-kernel@vger.kernel.org>; Tue,  3 Nov 2026 13:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793711646;
	bh=BL9pF1t9cF+2q2RHW7o6tX7PCUVdJX0A44j6YGdXXNc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UfTa27Y1QXdLYSYqXim5q488ksFY5pq+EI0CN70Kt7hmQrheA2qc7D6KC1ZDdjQaA
	 xqqZctH/ZwfrsEaFCoI0YSvTH/toxfzzssaDXXPNVplo5vN12q0gNChBS64FZ1edWG
	 wI0twKtpfDZ79yugtyLp0F2E1AvuMp2bukVP1k842gns0ga9Wld1BSV9mabbvRLrxl
	 ClT3MiK3f4ddFgo91NdU8u7AoQ3ftDoyWnpsucjV+Gb7ENFMJXusHHyJKaICeMTBzE
	 qDJRbqpTFR8ZcOOiIehKRU+mzyESiZf0fVXVGVBzk45Hl7Nm/zqals6VGu5Mvn3w/m
	 kz5vDkUBz2K0g==
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-6ddef424972so2995199eaf.3
        for <linux-kernel@vger.kernel.org>; Tue, 03 Nov 2026 05:14:06 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwC48lnl0zF/dS9Hgc5+ODQrV3yasvv6QAgXMwUCW5eP4W9o5/TzQEMeo+acEtEi9LZSEv1OHfvgr9YXXU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vuw2qTfIpNKI6Q7AzavVq0HyelmqMweJlvMRMQ4y86kYtIHQ9
	lox3lbkceB760bA8hoisowQ8TJdg7VbZi70Hqe5SvZMws+z0xf1XF1ov1+Pe8WeX/guX9tn5TIW
	3tuAIETYzicw/lfBe4BdcrWNU0LGP5vk=
X-Received: by 2002:a05:6820:c3d6:b0:70a:2478:f62d with SMTP id
 006d021491bc7-714f2990e44mr4407416eaf.28.1793711645262; Tue, 03 Nov 2026
 05:14:05 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1792838740.git.julius@bairaktaris.de> <529dd7ba1395f17c0b328ab2a597769809cbe720.1792838740.git.julius@bairaktaris.de>
In-Reply-To: <529dd7ba1395f17c0b328ab2a597769809cbe720.1792838740.git.julius@bairaktaris.de>
From: Eric Dumazet <edumazet@kernel.org>
Date: Tue, 3 Nov 2026 14:13:53 +0100
X-Gmail-Original-Message-ID: <CAL4WiioQG1Gjdppcd7QoQfac3o+9_ZMwQ2Bw+ewKiopTM67pWQ@mail.gmail.com>
X-Gm-Features: AclHuK-RykBYwOeRIuscuzIKMzRYbfnyHmlTHikMKxTcxka3Cx9X_9Ye1qSPB4Q
Message-ID: <CAL4WiioQG1Gjdppcd7QoQfac3o+9_ZMwQ2Bw+ewKiopTM67pWQ@mail.gmail.com>
Subject: Re: [PATCH net v4 3/4] ipmr: set up GSO state for tunnel vifs
To: Julius Bairaktaris <julius@bairaktaris.de>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, idosch@nvidia.com, 
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, horms@kernel.org, 
	steffen.klassert@secunet.com, willemb@google.com, jiayuan.chen@linux.dev, 
	mfleming@cloudflare.com, almasrymina@google.com, bigeasy@linutronix.de, 
	richardbgobert@gmail.com, ecree.xilinx@gmail.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 1 nov. 2026 =C3=A0 17:42, Julius Bairaktaris
<julius@bairaktaris.de> a =C3=A9crit :
>
> ip_encap() pushes the outer IPv4 header but does not set SKB_GSO_IPXIP4,
> skb->encapsulation or the inner headers. A GSO packet forwarded to a
> VIFF_TUNNEL vif is then rejected by ipip_gso_segment() and dropped in
> validate_xmit_skb(), after being counted as sent. A device with UDP
> segmentation offload is handed a GSO packet whose transport header
> points at the inner IP header.
>
> Call iptunnel_handle_offloads() and skb_set_inner_ipproto() as
> ipip_tunnel_xmit() does, reserve one outer IP ID per segment as
> iptunnel_xmit() does, and set the outer length with iph_set_totlen(),
> since a GSO packet plus the outer header can exceed 64 KB. A GSO packet
> that GRE or UDP tunnel GRO marked as encapsulated already uses the inner
> headers for its own tunnel; drop it, as segmentation did before.
>
> Fixes: 9fd1ff5d2ac7 ("udp: Support UDP fraglist GRO/GSO.")
> Signed-off-by: Julius Bairaktaris <julius@bairaktaris.de>
> ---
>  net/ipv4/ipmr.c | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/net/ipv4/ipmr.c b/net/ipv4/ipmr.c
> index acacaae05cc49..98e38839f8ccb 100644
> --- a/net/ipv4/ipmr.c
> +++ b/net/ipv4/ipmr.c
> @@ -1849,12 +1849,21 @@ static struct notifier_block ip_mr_notifier =3D {
>   * This avoids tunnel drivers and other mess and gives us the speed so
>   * important for multicast video.
>   */
> -static void ip_encap(struct net *net, struct sk_buff *skb,
> -                    __be32 saddr, __be32 daddr)
> +static int ip_encap(struct net *net, struct sk_buff *skb,
> +                   __be32 saddr, __be32 daddr)
>  {
> +       const struct iphdr *old_iph;
>         struct iphdr *iph;
> -       const struct iphdr *old_iph =3D ip_hdr(skb);
>
> +       /* The inner headers can describe one tunnel only */
> +       if (skb_is_gso(skb) && skb->encapsulation)
> +               return -1;
> +
> +       if (iptunnel_handle_offloads(skb, SKB_GSO_IPXIP4))
> +               return -1;

By the time ip_encap() runs, ipmr_prepare_xmit() has already bumped
vif->pkt_out/bytes_out and decreased the TTL, so these drops are still
counted as sent, which is what the changelog complains about.

Could you move the encapsulation check into ipmr_prepare_xmit(),
in the VIFF_TUNNEL branch before the route lookup ?

        if (vif->flags & VIFF_TUNNEL) {
                /* The inner headers can describe one tunnel only */
                if (skb_is_gso(skb) && skb->encapsulation)
                        return -1;
                rt =3D ip_route_output_ports(...);

Also note that iptunnel_handle_offloads() can not fail here:
skb_cow() was called before, so skb_header_unclone() has nothing to do.


> +       skb_set_inner_ipproto(skb, IPPROTO_IPIP);
> +
> +       old_iph =3D ip_hdr(skb);
>         skb_push(skb, sizeof(struct iphdr));
>         skb->transport_header =3D skb->network_header;
>         skb_reset_network_header(skb);
> @@ -1868,12 +1877,13 @@ static void ip_encap(struct net *net, struct sk_b=
uff *skb,
>         iph->saddr      =3D       saddr;
>         iph->protocol   =3D       IPPROTO_IPIP;
>         iph->ihl        =3D       5;
> -       iph->tot_len    =3D       htons(skb->len);
> -       ip_select_ident(net, skb, NULL);
> +       iph_set_totlen(iph, skb->len);


Minor: a fraglist aggregate can reach 65535 bytes, so with the outer
header tot_len can now be 0. The packet then goes through the
NF_INET_FORWARD hook, where iph_totlen() only handles TCP GSO packets,
so nft will consider it malformed. Still better than the silent
truncation we had, but maybe worth a mention in the changelog.

Thanks.

pw-bot: cr

> +       ip_select_ident_segs(net, skb, NULL, skb_shinfo(skb)->gso_segs ?:=
 1);
>         ip_send_check(iph);
>
>         memset(&(IPCB(skb)->opt), 0, sizeof(IPCB(skb)->opt));
>         nf_reset_ct(skb);
> +       return 0;
>  }
>
>  static inline int ipmr_forward_finish(struct net *net, struct sock *sk,
> @@ -1982,7 +1992,8 @@ static int ipmr_prepare_xmit(struct net *net, struc=
t mr_table *mrt,
>          * What do we do with netfilter? -- RR
>          */
>         if (vif->flags & VIFF_TUNNEL) {
> -               ip_encap(net, skb, vif->local, vif->remote);
> +               if (ip_encap(net, skb, vif->local, vif->remote))
> +                       return -1;
>                 /* FIXME: extra output firewall step used to be here. --R=
R */
>                 DEV_STATS_INC(vif_dev, tx_packets);
>                 DEV_STATS_ADD(vif_dev, tx_bytes, skb->len);
> --
> 2.53.0
>
