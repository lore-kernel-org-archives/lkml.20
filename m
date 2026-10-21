Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792575001;
	b=e1iH8FdwWh/Me8FhlgL8c9eBAwlTTzUqrAvZ8NK1QmNq/CiW7+A5O/BhYQkHGLIt/eUA
	 /EG6JHzD8guzWRM9PlExhHWCwG5XRbEtxOqWsIr12qNdhmXdkfronGV6LL5aNzMG6VpTa
	 ws9SRZMtYbefodu4WGh+lbZt4LGGVufSVKNO6domevavwMY6OUq5PGnBiNGoMNnSzFsy5
	 7PqnBDqV8tRsSSegk+4TNiM/h6yq9eKlkKkt9WAfm48HZMim/OZmo/Vrcw0DM78YupwGi
	 lGoyl5Z7q9wld2HBFaOXS5pFXXEC8CnxVwKg7w/FxwSw9VE/1vnmdOD67AR+LDVhNNQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=talS54amiPg/yZGwEbzg0hMRny1RlU7saCiWAuyBxB4=;
	b=fZyxdDjMOdJz4Bjypm9fYJSoNPk+tyluEFBKIsG/J58MB7rJQIKGFy/4fW2+NRRwdGy4
	 PkKFvnEqFrzLU8VQ5XLini+a6U5t2FLVSgnJxWObKvIIbWGEsZHidCeM+2PMRNFTvp52F
	 mQpAs8BYN2fC5cPGGZMOrwHgvEK26gMKEa1uz/3u4wz4HXskcRUh6o960d21ZBKHSSuhg
	 tpfMRTIS4gnmHsdzI5zaBdbpRUI8YVOKZzBV6xxwMItmT8jKhBF9ErEtajiD+0Ka7V52Q
	 ZfjQFey1laZLTs6YrlHvFWXpLh0sKTcTqF/LlYmYP546Bq+jV3MFAkwXcAf/oLlBuAg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZY49XlYv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE96606A31A
	for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 09:30:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DE96606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZY49XlYv
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c2af2ae1258so3041266b.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 Oct 2026 02:30:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792575000; cv=none;
        d=google.com; s=arc-20260327;
        b=IU393hBXaCvAhrA0y2zCmFoDH03muG19Re8XY35sHrOFTHZ23UtCiyLFhzWsLMQX1m
         b/U7wwdI5ETAQqvrg767LvuHxuJexOCB/OWa6gXC48su8AC6toAYQE/+xsKW2AzvxfOY
         r2sY2mwnpTzuP0aoIEEXE5Fk9RDpY38z/nrV0RfK9TxVrqlhBLhTDnUHoey3JX1rKlTl
         BhXULiCSgktQmPUJPxiFJIZMpEoIQy1WPOqy4fY3X+DWiSn8M5DP+4U7cnjhyuY2v+06
         Z9JIZuioW2CJR69Eah6pxBHT2wdVmxbq4g569a6AzW2Pny6JUw1BQ0c8EkvTUXvExsL5
         iDfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=talS54amiPg/yZGwEbzg0hMRny1RlU7saCiWAuyBxB4=;
        fh=2q5Hy54w+EeekoiaGCCS4CpzWHgHBWLf4z68Q/bHm5w=;
        b=Xh5lIksXD7bO8tcKAnpkelmwPYUgr7QonaqJvZDu8BdQ/cmqRauDbtgjiNU4DnBPRS
         OGnl7fe7roe2ZIB8G8apMzJ73S4FrTVbiMjunbIRzchBpMKUOzoqZuavWZGzwnWrFxAw
         8JNttsjGmq83h8X9JifTwSmfXYy1cnvubkMIcGFx4gV4HgfxjQXelDylyImomsp32yMS
         Gp4fDPMW+SGubdBCg2ED6VZdahTYBGYiRxr9oiLN/wfHY2Qxn6LuFcf9/4Rn0OeJeEb8
         g5uexx+hX1oSXcB1bKjGDelkz5/O6FVJJFFririRFhBf1pSn8Ddg2T4aQ1GVuxi6fWX0
         6a4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792575000; x=1793179800; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=talS54amiPg/yZGwEbzg0hMRny1RlU7saCiWAuyBxB4=;
        b=ZY49XlYvkhICPRBe2JG4Q3PM7VqkH7EG6aWGw/ZuNk0oUOs8k3O7wWU8gJrbbBLO1W
         xIUqM8WwjtI6eXZv1Vz2y+zaIjU3c9IaYq5p+fTBB48GvldKdsG+JFqeUdASzQ9vTVgl
         vXAU04XQZcEZrylEHAqa17XOoHzJ9kiYCYcS6Wh4ygI53TrhyVSb1iXAtfAzq5UcPYks
         q5KSDXCbjHUpCLpYPUeaVPEnZf3JG7mQeQGd32h+JmesYw7eGG43aNflptWoZSFJZQD6
         W4HOelzmZUvi8wp7pOkKNa0hjH5cd9SOfqqu8bHMokG3mnui7hwuH6VE5aF7T/LUUfgE
         6G6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575000; x=1793179800;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=talS54amiPg/yZGwEbzg0hMRny1RlU7saCiWAuyBxB4=;
        b=fClZEB8TKnLqG11NlDQQV8lBFOLr6RomiRSdavZ0IbowDTyYZAf/SN1VclsmafOwNn
         YYLr2QYB3sCeoAC3TsRcz56v6gakVELTWOWBW7D27eR95yKCxEATG+ANvPcHrk/xv5Dn
         KZxeF4MUViCH0S4jTb+6WSDrT+BszgGJp8l0jpQdNx7Xkwm+0zGWc3tX7JZUrj8KadoE
         t2QvP/1hzZJvOHXgfol2cARcimXa31ovINsdjJliNC1M25YJikLS1WStGc0DY0q2UjFz
         B6oB7LKExOo5zSESggA4sqbglAM0koqHSekFFx47Kfwx/nbycdWcdxMrr2rt9h3VW8nO
         DKgg==
X-Forwarded-Encrypted: i=1; AKwUvByVGtM/BGEDUbDL85fnN7Duke1JRlazci9jqMSSNx4NyF5hsWDTsxALcbzv8V6j4E6C5RvXtfMdlnO7VCA=@vger.kernel.org
X-Gm-Message-State: AFq9FYKXJig72a0JVD7JNk4aEWt2rUyr8bQAB37XWj3S7mpxfH8IKL3d
	W6Rzwpg2geVafPfyFOR6fNaHSrCdt6lD1sQr4dXzIaYfFWgCHm10D5GQhtwiETmCfPr2TGnj7h/
	k0P19Qq6Th9slFI+kdwZ89dHHNUcLvkY=
X-Gm-Gg: AYBFou0H9wX4SZfygSgm0HyS3cGaMeeEb3N1/dbKGmJaACNsfI2lLqTa1toOx8y10U4
	j5L5ROAfFtHfiH92wgtijJsVAI8WkDQVZH4HsNzVBOsTP5LctW4WRIg/QIiz0vLLohK8FSIR1tG
	UeY/7fCv/YqcPBZ8gR5LxK0wRLuu7GAM3NkkEmODBZqwCfe0rMiCT28sb1xSbkej7b1NmPZYXpN
	3tT14XRstXP/H4eydBQZWQ56fbIUt1k3wqOQm5GuEF6ptBAiBdStnH7zZX09cN3mhgrJ2kdTKa5
	5Av9DwZlyzvGaS8YCPOCFsgfBFDbM+ZsYfiWoQHjYEapYa8u5LHBC4mYXR47RkgYToAGR4VYTjF
	/lbImKkcTzUFVuhIeNdIOwfMBDp3z0m1mbr9gYJQpzI3BuJYFaA1GV2QhQJNoUpuZmwlw0KvMyz
	6MwVwI+0BCAcM=
X-Received: by 2002:a17:907:3e19:b0:c25:3ec4:9e43 with SMTP id
 a640c23a62f3a-c4678f61921mr142113866b.0.1792574999375; Wed, 21 Oct 2026
 02:29:59 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261021065517.198322-1-theodorlarionov@gmail.com>
In-Reply-To: <20261021065517.198322-1-theodorlarionov@gmail.com>
From: Chengfeng Ye <nicoyip.dev@gmail.com>
Date: Wed, 21 Oct 2026 17:29:47 +0800
X-Gm-Features: AclHuK_hzep8ZH3TrnvsmRxGfKoygxUVcd_QNcavMfo3m4kxyL8buVoj_sOJOoc
Message-ID: <CAAo+4rURfY514Adv6Qg8SsoRofANzAeY2c-qUYOhmr_r4U_o2Q@mail.gmail.com>
Subject: Re: [PATCH net v2] fou: reserve headroom before pushing the encap header
To: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.com>
Cc: "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	stable@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 21, 2026 at 2:55=E2=80=AFPM Theodor Arsenij Larionov Trichkine
<theodorlarionov@gmail.com> wrote:
>
> ip_tunnel_xmit() and ip_md_tunnel_xmit() call ip_tunnel_encap() before
> reserving headroom. A packet redirected into the tunnel (tc mirred, nft
> fwd) has only the headroom of its original device, so fou_build_udp()
> hits skb_under_panic(); with a mirred mirror the push overwrites the
> Ethernet header of the original packet.
>
> Reserve the headroom in fou_build_header() and gue_build_header(). GUE
> sizes and builds the header from one copy of the encap config, which
> can change concurrently. As the skb head may move, ip_tunnel_xmit() and
> ip_md_tunnel_xmit() reload inner_iph after ip_tunnel_encap(), and
> ip_tunnel_xmit() reads tnl_params before it: for GRE with header_ops,
> tnl_params points into the head.
>
> Fixes: 56328486539d ("net: Changes to ip_tunnel to support foo-over-udp e=
ncapsulation")
> Fixes: ac931d4cdec3 ("ipip,ip_tunnel,sit: Add FOU support for externally =
controlled ipip devices")
> Cc: stable@vger.kernel.org
> Signed-off-by: Theodor Arsenij Larionov Trichkine <theodorlarionov@gmail.=
com>
> ---
> v2: move the headroom reservation into {fou,gue}_build_header(), reload
> inner_iph after ip_tunnel_encap() and read tnl_params before it, which
> the Sashiko review of v1 pointed out.
> v1: https://lore.kernel.org/netdev/20261010223601.1193655-1-theodorlarion=
ov@gmail.com/
>
> Chengfeng Ye posted an earlier series for this bug; this takes the
> builder approach Paolo suggested.
> Link: https://lore.kernel.org/netdev/20260904165544.1362052-1-nicoyip.dev=
@gmail.com/

My v1/v2 [1][2] reserved the headroom in gue_build_header(), close to
what this patch does. Ido objected to that [3]: the caller of
ip_tunnel_encap() is expected to reserve encap_hlen() bytes, and an
skb_cow_head() in build_header() forces every caller to refresh
pointers into skb->head. I moved the fix into ip_tunnel_xmit() for
v3/v4 as Ido suggested, and wait for the IPv6 part [4] to be accepted first=
.
That patch is changes-requested, and Paolo said the IPv6 side should become
an RCU conversion targeting net-next [5].

I'm fine with either approach, and will drop my v4 if this patch is taken.

If this version is applied, I'd appreciate a Reported-by, as I first
reported the bug in [1]:

Reported-by: Chengfeng Ye <nicoyip.dev@gmail.com>
Closes: https://lore.kernel.org/netdev/20260801060115.3538849-1-nicoyip.dev=
@gmail.com/

[1] https://lore.kernel.org/netdev/20260801060115.3538849-1-nicoyip.dev@gma=
il.com/
[2] https://lore.kernel.org/netdev/20260821145908.2829132-1-nicoyip.dev@gma=
il.com/
[3] https://lore.kernel.org/netdev/20260824075011.GA858321@shredder/
[4] https://lore.kernel.org/netdev/2ce8f3e4bbed6060afb0aee33dc4e1d9ae021280=
.1788262122.git.petalzu987@gmail.com/
[5] https://lore.kernel.org/netdev/e651fe9e-2d84-4320-99a1-6fddcfc00889@red=
hat.com/

>  net/ipv4/fou_core.c  | 15 +++++++++++----
>  net/ipv4/ip_tunnel.c |  6 ++++--
>  2 files changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/net/ipv4/fou_core.c b/net/ipv4/fou_core.c
> index 076fdca44f51..896e63adf698 100644
> --- a/net/ipv4/fou_core.c
> +++ b/net/ipv4/fou_core.c
> @@ -1059,6 +1059,9 @@ static int fou_build_header(struct sk_buff *skb, st=
ruct ip_tunnel_encap *e,
>         __be16 sport;
>         int err;
>
> +       if (skb_cow_head(skb, fou_encap_hlen(e)))
> +               return -ENOMEM;
> +
>         err =3D __fou_build_header(skb, e, protocol, &sport, type);
>         if (err)
>                 return err;
> @@ -1071,16 +1074,20 @@ static int fou_build_header(struct sk_buff *skb, =
struct ip_tunnel_encap *e,
>  static int gue_build_header(struct sk_buff *skb, struct ip_tunnel_encap =
*e,
>                             u8 *protocol, struct flowi4 *fl4)
>  {
> -       int type =3D e->flags & TUNNEL_ENCAP_FLAG_CSUM ? SKB_GSO_UDP_TUNN=
EL_CSUM :
> -                                                      SKB_GSO_UDP_TUNNEL=
;
> +       struct ip_tunnel_encap encap =3D READ_ONCE(*e);
> +       int type =3D encap.flags & TUNNEL_ENCAP_FLAG_CSUM ?
> +                  SKB_GSO_UDP_TUNNEL_CSUM : SKB_GSO_UDP_TUNNEL;
>         __be16 sport;
>         int err;
>
> -       err =3D __gue_build_header(skb, e, protocol, &sport, type);
> +       if (skb_cow_head(skb, gue_encap_hlen(&encap)))
> +               return -ENOMEM;
> +
> +       err =3D __gue_build_header(skb, &encap, protocol, &sport, type);
>         if (err)
>                 return err;
>
> -       fou_build_udp(skb, e, fl4, protocol, sport);
> +       fou_build_udp(skb, &encap, fl4, protocol, sport);
>
>         return 0;
>  }
> diff --git a/net/ipv4/ip_tunnel.c b/net/ipv4/ip_tunnel.c
> index e6bcf01411d0..742c2b309608 100644
> --- a/net/ipv4/ip_tunnel.c
> +++ b/net/ipv4/ip_tunnel.c
> @@ -606,6 +606,7 @@ void ip_md_tunnel_xmit(struct sk_buff *skb, struct ne=
t_device *dev,
>
>         if (ip_tunnel_encap(skb, &tun_info->encap, &proto, &fl4) < 0)
>                 goto tx_error;
> +       inner_iph =3D (const struct iphdr *)skb_inner_network_header(skb)=
;
>
>         use_cache =3D ip_tunnel_dst_cache_usable(skb, tun_info);
>         if (use_cache)
> @@ -749,6 +750,8 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_d=
evice *dev,
>         }
>
>         tos =3D tnl_params->tos;
> +       df =3D tnl_params->frag_off;
> +       ttl =3D tnl_params->ttl;
>         if (tos & 0x1) {
>                 tos &=3D ~0x1;
>                 if (payload_protocol =3D=3D htons(ETH_P_IP)) {
> @@ -767,6 +770,7 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_d=
evice *dev,
>
>         if (ip_tunnel_encap(skb, &tunnel->encap, &protocol, &fl4) < 0)
>                 goto tx_error;
> +       inner_iph =3D (const struct iphdr *)skb_inner_network_header(skb)=
;
>
>         if (connected && md) {
>                 use_cache =3D ip_tunnel_dst_cache_usable(skb, tun_info);
> @@ -799,7 +803,6 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_d=
evice *dev,
>                 goto tx_error;
>         }
>
> -       df =3D tnl_params->frag_off;
>         if (payload_protocol =3D=3D htons(ETH_P_IP) && !tunnel->ignore_df=
)
>                 df |=3D (inner_iph->frag_off & htons(IP_DF));
>
> @@ -821,7 +824,6 @@ void ip_tunnel_xmit(struct sk_buff *skb, struct net_d=
evice *dev,
>         }
>
>         tos =3D ip_tunnel_ecn_encap(tos, inner_iph, skb);
> -       ttl =3D tnl_params->ttl;
>         if (ttl =3D=3D 0) {
>                 if (payload_protocol =3D=3D htons(ETH_P_IP))
>                         ttl =3D inner_iph->ttl;
> --
> 2.34.1
>

Thanks,
Chengfeng
