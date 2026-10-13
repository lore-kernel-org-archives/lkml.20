Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8AB4FD786
	for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 15:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791903825; cv=pass; b=TY7vPo1FYYa+He2o2j+gILAwip6VXdMc4+InZVbP/W/ui9UENA9VTq3Sy6OFWHtMaY5BjgbteHc6IWGhkYeweuxShBeHoc+uzsZCsDHmBxWmoQdK97wYrwtEJ4IS7NfAJ7fiILlDOOVzGzNjIKvXXYguSdkf5Iwa8OYffT23jpI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791903825; c=relaxed/simple;
	bh=+eij/G2Lm+NMEdrFlAebvXiQrLdEbAv/JU7usPIRAvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KoCWueShKoH83hXDSVMYvWo9Rf+1gxvgy7jRlm8bJN3r0xwZCZAzc6KD8QaOO1wLa4mB3Mt+lCInLgTwpiVravhvGZq4MLfsflIPSXKbccYpGmFnbdTf2PslQG7AhM7gEtj2Shk4Q2Wv5WzeUhVVZMOLyRmQwsmHkbeF+2Zu5V8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T2QpifeF; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T2QpifeF"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-678febd9307so2808915d50.0
        for <linux-kernel@vger.kernel.org>; Tue, 13 Oct 2026 08:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791903822; cv=none;
        d=google.com; s=arc-20260327;
        b=LaqdJBKXGhpAX0Um/nqtODBFa3fvPJf0bmHvOy123yOlIxC5nJRFbhudiAEqQumi1m
         zQHOdxv0GgjTEa5KcuteAsuUrV97PfwwRmXeFVsSsPOZ+8AamdCg/QbIfXrDPKDtLBdz
         pocF6x/SknlsmGFQbZIyKOh9MZwmmM+YmCh1xEbToZYrPiCYA/aPQin86mIdlLF8ENey
         bUdyikXl+To05aL8tgS6fOBI0kP91JClbeNYY1xXMiWFlL3sozEdD/6/ZcT5j1ZAPH8B
         cSEdHPzE8C8d39OdOLiGb1QPwZjyKDyM1ZsXrmtO3ylRn+mez0D8rUPqQKm1oWn1SLqo
         A2FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8bVCWyXyAJ87Bpk+/KBAvFqd9dRCgnolvbDj0gw9Hsg=;
        fh=Tmd4c2j2aV2yi13pviQNFPXlmeOMP4hZPzhYGlBf6sM=;
        b=i7bqcnu8Oh82B/IYzvSWjBUcf9lcWeXKN8Cb3HhfuDqvmO16xaFPNHzRy8E99+U1WR
         QmdkuqyYqWFDR7wQ2snBGBaB5QaVu2QsFAfV+fGyO8/DOJtct46j2P43WopbLyjmsVvk
         LOYRt1b3D8a36hG2PaCSVbDf43vY5CjYkiXibhuThPk1wfNJmW7sv29Tn6/cZRGD9rC9
         dUCEtFLJYvdH3ZstdzBopbArPG5qy/uWZVcc4YMc2Q3+KvNnGPLLBQ9/D4CD66jkfXrn
         dzEZTO8+AogK0svCgHoE4rT4ghClzFjNSNbzEayhNq5IT4ZaEu4QQj2VcShn/6SQUowW
         gVyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791903822; x=1792508622; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8bVCWyXyAJ87Bpk+/KBAvFqd9dRCgnolvbDj0gw9Hsg=;
        b=T2QpifeFJUKksk+wRYEGKzCayH+c0icWhdZzYoyI5wc4iEQ8nKsOrHyooedI4rTq8J
         /zP1fv+zvTncpXHZzisAMvJn9nkrPoa5ZYgGxx0Tmnjz8kyTOSmhx/z63YTMH/CY+FF7
         jelmUaRsX13H5Blxy8hvA3tu+vzuvlZpMcEFQC27vdVrf8R6IwfzKaGgHF8nIJEYXBpC
         HDb9Z+5gvDdzARkkl+KMBuWcK/JcKOVYaBMgVFeBPo39AlhwU3e65SXKPF3EeRBAzwcM
         Bpn6eR2zhPkvGGY5JUqNWxrnsEYBNzecF9dooWFDyEzm0WHBeUr5O3lhpFTzgiPEAI+5
         WLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791903822; x=1792508622;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8bVCWyXyAJ87Bpk+/KBAvFqd9dRCgnolvbDj0gw9Hsg=;
        b=IAxrshIw9SX3vl2lJAZlg61G+uZymjrIDeB0TlRJF8dRfC8a8DkOm+B923Mc1T9xz5
         HDUoH6wzN80XHHI8r0CYXsIoPDreF2gqvdXuPRnjq2xt8I1mNkEa2Inp4QzftXCQfQ2u
         WLMHh0KZR4JUptkEEi27+NCtbITW0etP4F0rT4ItDVHuNLYwUWZcs2xQ1sSeX6Johyeo
         RUlWa551X6A5AFbS1sMWXOVEqgrhSPGiZUIf7ztI6cZDWYpITYhWJNbE8xxsc/TXoNRK
         st7yzPX8PjhEfzk2wWxJig+xCvKcQLpqYFwOvMMzN0onvjfC8q/DPciSG751TvqX54p6
         jmHw==
X-Gm-Message-State: AFq9FYJ2WgezAllLwdOojEuh7BTdsUaJnyqxPhVyhat9uXTm+UKZc8lj
	UFOUEY1JW23d04lSoJI1F0fheHZBUHm4MM64PNsbr8q3BoXJxNOzkNwTxdxFuuAAl4jU/jZ8DMK
	U6Pq13Rj7ILFd9PfJTvsouH+Dj/jXNcDzRln0
X-Gm-Gg: AYBFou3K5N1dGzB9zuZhNxZdS8PaRs26dc47JAFLfP1+9Ls43t5jL35Qah8unraiJOT
	QjPDxo1e3OFVXe9Xyu/kDvSJjnLG7GMeEv7vjPdAgz1KmVVZ1Rao5CTP7iKi6FKTbBa8veLHrGY
	yYvZtnxDtE+Q00g+HHvqSikKMg0Tb9XJ0AkwlfFa85fmTuGnqKytaAjuUe1rh/BIxwIo82pqohW
	TpBa/8uA7hay28TjoUNcGiPPpHDku3NtSiLdgTQwJLy0kngrtJf9T1qOj3zpKU1ePAitC2+aOaI
	/P7lOga9VYWBLMhjUfDyct9dR+o8I4fOKpqaHhE6aPUSh5z9zwkwja0Oo4kdW4yblQxRE3BDpNt
	GjUPLMkg6OsB2Irw0VpoV32tghTxeYbJQSQ4br7Nvw1ljHeVSOJwhGFBpt/uw7her5vGIyr4Vbg
	==
X-Received: by 2002:a05:690e:4006:b0:676:a451:56c1 with SMTP id
 956f58d0204a3-679389761b3mr4524606d50.18.1791903821598; Tue, 13 Oct 2026
 08:03:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1791887415.git.mst@redhat.com> <e12c6a45aae251d1642af55d8d3121e554993a66.1791887415.git.mst@redhat.com>
 <20261013070549-mutt-send-email-mst@kernel.org>
In-Reply-To: <20261013070549-mutt-send-email-mst@kernel.org>
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Date: Tue, 13 Oct 2026 09:03:04 -0600
X-Gm-Features: AclHuK8snF8YE0eqA9W8zewtwfsVp9_Bp6rl047NuKz25jav8f4v7tPrgiX8INI
Message-ID: <CAF=yD-KdTn2rHyp_j8ORr9F5hpm=TzaPRan5+gvLiYBd9HP-sg@mail.gmail.com>
Subject: Re: [PATCH net-next 3/4] net: resolve uncommon partial checksums at ingress
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Jason Wang <jasowangio@gmail.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org, 
	virtualization@lists.linux.dev, Max Krasnyansky <maxk@qualcomm.com>, 
	Rusty Russell <rusty@rustcorp.com.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 5:06=E2=80=AFAM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Tue, Oct 13, 2026 at 06:58:41AM -0400, Michael S. Tsirkin wrote:
> > A virtio net header can place CHECKSUM_PARTIAL at any in-packet
> > offset.  If that state is retained, later checksum completion can
> > modify the packet after protocol processing has made decisions from it.
> >
> > Let's fix that: let's validate csum_start and csum_offset and only keep
> > CHECKSUM_PARTIAL when csum_start and csum_offset match a parsed TCP or
> > UDP header, while handling VLAN headers, IPv4 options and IPv6 extensio=
n
> > headers.  Complete other non-GSO checksums immediately, before any
> > protocol processing runs.
> >
> > We can't easily "complete the checksum" for GSO we don't recognize - GS=
O
> > assumes knowledge of the protocol. We could segment ignoring the
> > checksum then do whatever csum_start and csum_offset say, but that
> > seems like an overkill for something that should happen.
> >
> > UDP tunnel headers get the same handling on the inner header.
> >
> > Packets without VIRTIO_NET_HDR_F_NEEDS_CSUM are unaffected.
> >
> > Suggested-by: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
> > Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> > Assisted-by: LLM
>
>
> I forgot reported-by tags:
>
> Reported-by: Paulos Yibelo <habte.yibelo@gmail.com>
> Reported-by: Chris Arges <carges@cloudflare.com>
>
>
> > ---
> >  include/linux/virtio_net.h | 151 ++++++++++++++++++++++++++++++++-----
> >  1 file changed, 133 insertions(+), 18 deletions(-)
> >
> > diff --git a/include/linux/virtio_net.h b/include/linux/virtio_net.h
> > index d6466f96cdd00..b181183118b3a 100644
> > --- a/include/linux/virtio_net.h
> > +++ b/include/linux/virtio_net.h
> > @@ -5,7 +5,11 @@
> >  #include <linux/if_vlan.h>
> >  #include <linux/ip.h>
> >  #include <linux/ipv6.h>
> > +#include <linux/netdevice.h>
> >  #include <linux/udp.h>
> > +#include <net/gso.h>
> > +#include <net/ip.h>
> > +#include <net/ipv6.h>
> >  #include <net/tcp.h>
> >  #include <uapi/linux/tcp.h>
> >  #include <uapi/linux/virtio_net.h>
> > @@ -48,15 +52,111 @@ static inline int virtio_net_hdr_set_proto(struct =
sk_buff *skb,
> >       return 0;
> >  }
> >
> > +/* Does checksum metadata match a known TCP or UDP header? */
> > +static inline bool
> > +virtio_net_csum_partial_ok_at_offset(struct sk_buff *skb, u8 hdr_gso_t=
ype,
> > +                                  unsigned int nhoff, __be16 proto)
> > +{
> > +     unsigned int thoff;
> > +     int ip_proto;
> > +
> > +     if (proto =3D=3D htons(ETH_P_IP)) {
> > +             const struct iphdr *iph =3D ip4_parse(skb, nhoff, &thoff)=
;
> > +
> > +             if (!iph || ip_is_fragment(iph))
> > +                     return false;
> > +             ip_proto =3D iph->protocol;
> > +     } else if (proto =3D=3D htons(ETH_P_IPV6)) {
> > +             const struct ipv6hdr *iph;
> > +             int flags =3D 0;
> > +
> > +             if (!pskb_may_pull(skb, nhoff + sizeof(*iph)))
> > +                     return false;
> > +             iph =3D (const void *)(skb->data + nhoff);
> > +             if (iph->version !=3D 6)
> > +                     return false;
> > +             thoff =3D nhoff + sizeof(*iph);
> > +             ip_proto =3D iph->nexthdr;
> > +             if (ip_proto !=3D IPPROTO_TCP && ip_proto !=3D IPPROTO_UD=
P) {
> > +                     thoff =3D nhoff;
> > +                     ip_proto =3D ipv6_find_hdr(skb, &thoff, -1, NULL,
> > +                                              &flags);

Skip this rare case of extension headers?

> > +                     if (ip_proto < 0 || flags & IP6_FH_F_FRAG)
> > +                             return false;
> > +             }
> > +     } else {
> > +             return false;
> > +     }
> > +

> >  static inline int __virtio_net_hdr_to_skb(struct sk_buff *skb,
> >                                         const struct virtio_net_hdr *hd=
r,
> > -                                       bool little_endian, u8 hdr_gso_=
type)
> > +                                       bool little_endian, u8 hdr_gso_=
type,
> > +                                       bool need_csum_check)
> >  {
> > -     unsigned int nh_min_len =3D sizeof(struct iphdr);
> > +     typeof(skb->transport_header) old_transport =3D skb->transport_he=
ader;
> >       unsigned int gso_type =3D 0;
> >       unsigned int thlen =3D 0;
> >       unsigned int p_off =3D 0;
> >       unsigned int ip_proto;
> > +     bool csum_partial_ok =3D true;
> >
> >       if (hdr_gso_type !=3D VIRTIO_NET_HDR_GSO_NONE) {
> >               switch (hdr_gso_type & ~VIRTIO_NET_HDR_GSO_ECN) {
> > @@ -69,7 +169,6 @@ static inline int __virtio_net_hdr_to_skb(struct sk_=
buff *skb,
> >                       gso_type =3D SKB_GSO_TCPV6;
> >                       ip_proto =3D IPPROTO_TCP;
> >                       thlen =3D sizeof(struct tcphdr);
> > -                     nh_min_len =3D sizeof(struct ipv6hdr);
> >                       break;
> >               case VIRTIO_NET_HDR_GSO_UDP:
> >                       gso_type =3D SKB_GSO_UDP;
> > @@ -104,11 +203,11 @@ static inline int __virtio_net_hdr_to_skb(struct =
sk_buff *skb,
> >
> >               if (!skb_partial_csum_set(skb, start, off))
> >                       return -EINVAL;
> > -             if (skb_transport_offset(skb) < nh_min_len)
> > -                     return -EINVAL;
> > +             if (need_csum_check)
> > +                     csum_partial_ok =3D
> > +                             virtio_net_csum_partial_ok(skb, hdr_gso_t=
ype);
> >
> > -             nh_min_len =3D skb_transport_offset(skb);
> > -             p_off =3D nh_min_len + thlen;
> > +             p_off =3D skb_transport_offset(skb) + thlen;
> >               if (!pskb_may_pull(skb, p_off))
> >                       return -EINVAL;
> >       } else if (gso_type) {
> > @@ -158,8 +257,6 @@ static inline int __virtio_net_hdr_to_skb(struct sk=
_buff *skb,
> >               case SKB_GSO_UDP_L4:
> >                       if (!(hdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM))
> >                               return -EINVAL;
> > -                     if (skb->csum_offset !=3D offsetof(struct udphdr,=
 check))
> > -                             return -EINVAL;
> >                       if (skb->len - p_off > gso_size * UDP_MAX_SEGMENT=
S)
> >                               return -EINVAL;
> >                       if (gso_type !=3D SKB_GSO_UDP_L4)
> > @@ -167,10 +264,6 @@ static inline int __virtio_net_hdr_to_skb(struct s=
k_buff *skb,
> >                       break;
> >               case SKB_GSO_TCPV4:
> >               case SKB_GSO_TCPV6:
> > -                     if (skb->ip_summed =3D=3D CHECKSUM_PARTIAL &&
> > -                         skb->csum_offset !=3D offsetof(struct tcphdr,=
 check))
> > -                             return -EINVAL;
> > -
> >                       BUILD_BUG_ON(TCP_MIN_GSO_SIZE * GSO_MAX_SEGS < GS=
O_MAX_SIZE);
> >                       gso_size =3D max(gso_size, TCP_MIN_GSO_SIZE);
> >                       break;
> > @@ -191,6 +284,17 @@ static inline int __virtio_net_hdr_to_skb(struct s=
k_buff *skb,
> >               }
> >       }
> >
> > +     if ((hdr->flags & VIRTIO_NET_HDR_F_NEEDS_CSUM) && !csum_partial_o=
k) {
> > +             int err;
> > +
> > +             if (skb_is_gso(skb))
> > +                     return -EINVAL;
> > +
> > +             err =3D skb_checksum_help(skb);

Instead of this variable csum_partial_ok and this branch, could
virtio_net_csum_partial_ok just call skb_checksum_help directly and
drop VIRTIO_NET_HDR_F_NEEDS_CSUM?

> > +             skb->transport_header =3D old_transport;
> > +             return err;
> > +     }
> > +
> >       return 0;
> >  }
> >
> > @@ -198,7 +302,8 @@ static inline int virtio_net_hdr_to_skb(struct sk_b=
uff *skb,
> >                                       const struct virtio_net_hdr *hdr,
> >                                       bool little_endian)
> >  {
> > -     return __virtio_net_hdr_to_skb(skb, hdr, little_endian, hdr->gso_=
type);
> > +     return __virtio_net_hdr_to_skb(skb, hdr, little_endian,
> > +                                    hdr->gso_type, true);

Would be great if we can avoid the extra arg and having to update the calle=
rs.

> >  }
> >
> >  /* This function must be called after virtio_net_hdr_from_skb(). */
> > @@ -293,6 +398,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >       unsigned int inner_nh, outer_th, inner_th;
> >       unsigned int inner_l3min, outer_l3min;
> >       u8 gso_inner_type, gso_tunnel_type;
> > +     __be16 inner_proto;
> >       bool outer_isv6, inner_isv6;
> >       int ret;
> >
> > @@ -334,7 +440,7 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >
> >       /* Let the basic parsing deal with plain GSO features. */
> >       ret =3D __virtio_net_hdr_to_skb(skb, hdr, true,
> > -                                   hdr->gso_type & ~gso_tunnel_type);
> > +                                   hdr->gso_type & ~gso_tunnel_type, f=
alse);
> >       if (ret)
> >               return ret;
> >
> > @@ -352,8 +458,8 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >                       return -EINVAL;
> >       }
> >
> > -     skb_set_inner_protocol(skb, inner_isv6 ? htons(ETH_P_IPV6) :
> > -                                              htons(ETH_P_IP));
> > +     inner_proto =3D inner_isv6 ? htons(ETH_P_IPV6) : htons(ETH_P_IP);
> > +     skb_set_inner_protocol(skb, inner_proto);

Can drop

> >       if (hdr->flags & VIRTIO_NET_HDR_F_UDP_TUNNEL_CSUM) {
> >               if (!tnl_csum_negotiated)
> >                       return -EINVAL;
> > @@ -368,7 +474,16 @@ virtio_net_hdr_tnl_to_skb(struct sk_buff *skb,
> >       skb->inner_mac_header =3D inner_nh + skb_headroom(skb);
> >       skb->transport_header =3D outer_th + skb_headroom(skb);
> >       skb->encapsulation =3D 1;
> > -     return 0;
> > +
> > +     if (virtio_net_csum_partial_ok_at_offset(skb, gso_inner_type, inn=
er_nh,
> > +                                            inner_proto))
> > +             return 0;
> > +
> > +     if (skb_is_gso(skb))
> > +             return -EINVAL;

This is a risk the commit message will have to call out.

I don't see a simple way around it. We discussed segmenting here too,
but that requires intrusive changes to all callers too.

Alternatively,

1. call segmentation, but only to see it remove the SKB_GSO_DODGY and
thus verify that the TSO/USO packet is valid. Still drop otherwise.
This also does not add overhead, because it would be called later
anyway.

2. a failsafe off-by-default sysctl + static_branch that skips the
drop when set. Messy, but so is the situation we're dealing with.
