Received: from mail-ed2-f6.google.com (mail-ed2-f6.google.com [74.125.228.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8B4A0C
	for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 11:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792323764; cv=pass; b=OxuHj3kYSXQjpg3xlswTMIc9n0Jfo4i9K6lkjbf4M1/yAkY8+i+DRYO7056NvKniB/cXXh9Bjea9jOCHpC4kAjJrvmYsn7rrkKuCRDdWrm7uy6Uh4Ruo90Sfx/m0QcvjkRBryFkMCb43ZeLde3y3Zbu52TrBPleSisPhr6R2c50=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792323764; c=relaxed/simple;
	bh=pdTjjuUEZr5/eCLLGOgRPlhMNoP9YTMXhfMuFbbNRq8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nAV6hCmlgp3IMBFzN/tWhEBtrITta7IWalg9EOZQpaVkURtyau38WvZBMFspy/X7ccdJmgKW26WooDGSODo3oboDGYCF40K6+vz2tTRF6zMCWB0Obl1EWp3/pHMwuG/2cXfg0jDWIA+ItAWbMFWi7VyBvT/xfNAEDKn+9igV2xw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VgssXaO9; arc=pass smtp.client-ip=74.125.228.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VgssXaO9"
Received: by mail-ed2-f6.google.com with SMTP id 4fb4d7f45d1cf-6b1bac8b872so900803a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 Oct 2026 04:42:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792323761; cv=none;
        d=google.com; s=arc-20260327;
        b=CgJvlzrb7x16KsF3qZOCMwLn8TUszBJv2sLjeEo3QmG3ud2TigOPQARtca0hXiBZKN
         0vwI2es1jwSRib6EFny24nN+RkebO/UcI7e2+oOmATweEDUc0iavYjapkmG3ycETAuwT
         aOYzRjP0omsaqvP/BwfzF914F+mKlrYTMybt7r/MGibHLSwFz1zKf5UIvNLvDJp14CG7
         9iIcAtYvzvfyTc4I7VsEAcJcRDNRHOaQU9Ygt4ZQc4w/fQebT9NLH4ebaCB0z51y3NbC
         CE+Bqg5lEKuDVLoKcw8K8Qm8Re2vyKmT0ZPumCxyHrT3tZj0DH0XhLApOqq0FWPe022T
         RbhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZLma18gptooWQFwxqC5664qisl8OyfBtIlcEuU76w1s=;
        fh=T+YTRwmW1IulENoDM2/uo3SJzVLk9MUtwJGH2xJJ8wM=;
        b=HBgOF3DiWgUIXsSFFwpbVJ3x2gTgCyCeRVEuHF+kLIz4BRdWVC8dD3DRgXiUZMcWV1
         bZLPXwiDRnuWHsjdNx6KrAGaL+u7TY3Z5Sav3tRDVRjUk+NfZnJbXMliNNdYcxV44lRu
         fDr3tH3SnDJpc/k6tq6eJo3XW+Q1cT7ebEddNU0I+BK+2v4IVlVGJSWfeNUiueaVxATb
         y11U+OXS36DJY8d/QN/8gORjk8qo34FdLXSHj5hME9ltLhq+D2I6n+3NwJCuQ66qn2Bp
         Ne98ZHdvn1eIWkxrXH/k/EYqqdQw9ii1hRScHC7RRWB8lB5knWQUVihQ4pEVJPbhF8+1
         hrcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792323761; x=1792928561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZLma18gptooWQFwxqC5664qisl8OyfBtIlcEuU76w1s=;
        b=VgssXaO9qp/vQllhL+eVY98U0X505B3wktYtOrRX3tqHgwenF34POmxSexqMlFr3Dd
         G79xOIaG9tVDbaFRYqTXYf4/KlyveLyKI/mLw0GbEo48ZOyt3zTfSPiWGbXFk81kpr7h
         AK7jYQrG9Dt8BEz7b5LNmcbYYTPjviMqovrV99jGP8VRlPqfdoieL+/xyVVcM2MCy1HG
         f48vXNDSM802tfpqX/JperJjJa1spb7qtZrQaLseLsi00x8cwoy0MYroOj236xsPhyrX
         GaH4R+YcBK6SYVAEUa8CmPIOWGUgEF5gxUWiUOlQoTv0/FUQryFmBfEYrJWoFEAoggdt
         EnHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792323761; x=1792928561;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZLma18gptooWQFwxqC5664qisl8OyfBtIlcEuU76w1s=;
        b=QAgPPA+TDr0GOFNciOCcW9F033+n9LUCGgAIdQj/MU96d+MJyZb90c/IoKsQAjNwUv
         S78ApAEEj2d0G6ozLbTExVbUpuwsGI9rGrGxgDtwnejPHEw+OpSPPs8FPbipeQR9gOim
         WMgX3tgb+BwD7iqJpyhW0XW2Khj9m8oNBdcDaWIeNMW9BVc44zU3D1hFF6ruuWX07dBF
         Lz0hxZ4hxFVndITLRwDUOYo5q+2naAJyS02WOPkhzkXy0h3e/cfSlrXCqtgZLkZ2fCSV
         vFmAR7SxeQOPux6jR9qUxd3oAyv6WJq+Ss6lSO5ArnuqDZP5RsfgKtM44CJOKuzvoTWy
         1FBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw6wg6AIwVv9cwn37okhOAqO2RvpcyrvxdxhaByHGhOaYbhHp8H5uMKSKU0lfjVEvjo/uAkUQau+kIUusg=@vger.kernel.org
X-Gm-Message-State: AFq9FYJMA5NwwOZuP3J5/LShAqSN9yUJOfkxstJDiN2uJlxIZwsnWIEk
	vzAjJrRY+4BBmIXryJetQPoUV1wOBr8BMb7dLc9so535dxyjv/c3LdWANsLRq0T7oEwQR5MDoaB
	A+q2pQxWpOnnRiD/PxSF677rR2eqqCXk=
X-Gm-Gg: AYBFou2tC8krR2bdiYWsiYKHtZsX6y0AmsF59hQAcnTg1CVjJrrxBr+4Z9lrCEc50y/
	QAs35eFy89LnQzbhSmy/OQ9hpDgkuBUyTBlklEi94qVqTJqHLjhndRAB+nPMAA4U3cOAaAGQzZW
	nOH/o8AyGSmtkuoGXVUppVV7hoDoi4+4jBNwngKmMMaN+30HusC8FZqvyLIG1ExPc9TlhvfGHPc
	ecMhbCqDun0TZMOBmLJYvAbPeGatP7QSPrmUiyxDAMQOdI7zD4tzmQCeTSDNduoEwiL0cDKJGns
	GVkVfd4jwcRkYRpF7N7v8I4qunmz7veN8vTPss8r08WP7DkK0R0CUBzQcorAx+OoW3AuhEig1j2
	VUHWyLjdwU+nXR04uk53Z
X-Received: by 2002:a05:6402:3204:b0:6b1:c299:b3f8 with SMTP id
 4fb4d7f45d1cf-6b3a8188f53mr2836096a12.33.1792323761136; Sun, 18 Oct 2026
 04:42:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261017120144.3059-1-yymhvert@gmail.com> <willemdebruijn.kernel.3068e5bf74671@gmail.com>
In-Reply-To: <willemdebruijn.kernel.3068e5bf74671@gmail.com>
From: yymh <yymhvert@gmail.com>
Date: Sun, 18 Oct 2026 19:42:28 +0800
X-Gm-Features: AclHuK-M4GinSmZs-Gs-t6lI0SGAvtU4utZxfv2F0Y2YNSSctof4zzQNs0f4jyU
Message-ID: <CADLWKdUB8M70VLgd+foRg5Usy8rUo-hXkPQ1nrkJHM9iHaa=cA@mail.gmail.com>
Subject: Re: [PATCH net v2] seg6: Fix unset mac header in SRv6 End.DT VRF decapsulation
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Andrea Mayer <andrea.mayer@uniroma2.it>, David Ahern <dsahern@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	co+98d7de09cd94fec5@bugs.sh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks, Willem.

Andrea, David Ahern, could you share your thoughts on the v2 approach?
In particular, does restoring the mac header after l3mdev_l3_rcv()
returns properly fix the issue without introducing any regressions,
especially in the VRF sniffer path?

Thanks,
Boyan


Willem de Bruijn <willemdebruijn.kernel@gmail.com> =E4=BA=8E2026=E5=B9=B410=
=E6=9C=8817=E6=97=A5=E5=91=A8=E5=85=AD 23:57=E5=86=99=E9=81=93=EF=BC=9A
>
> Boyan Liu wrote:
> > SRv6 End.DT4/End.DT6 VRF decapsulation unsets the mac header in
> > end_dt_vrf_rcv() so that the VRF device can rebuild it for packet
> > sniffers. The VRF rx handler only performs the rebuild when a
> > sniffer is actually attached to the VRF device (ptype_all
> > non-empty); otherwise the packet continues up the stack with
> > mac_header =3D=3D 0xffff.
> >
> > Every other receive path delivers packets with a valid mac header:
> > NIC drivers set it in eth_type_trans(), and tunnels without an L2
> > header (ipip, sit, gre, tun) reset it to the network header after
> > decapsulation. skb_mac_header() even warns on the unset state with
> > DEBUG_NET_WARN_ON_ONCE().
> >
> > If the decapsulated packet is an unexpected UDP GSO packet,
> > udp_queue_rcv_skb() re-segments it after restoring skb->data to the
> > mac header with __skb_push(skb, -skb_mac_offset(skb)). With the mac
> > header unset, skb_mac_offset() returns a large positive value,
> > which the unsigned __skb_push() argument turns into a huge length:
> > skb->data moves far outside the buffer and skb->len is corrupted,
> > so segmentation reads out of bounds:
> >
> >     BUG: KASAN: slab-out-of-bounds in inet_gso_segment (net/ipv4/af_ine=
t.c:1383)
> >     Read of size 1 at addr ffff88800da7ffff by task exploit/149
> >     Call Trace:
> >      inet_gso_segment (net/ipv4/af_inet.c:1383)
> >      skb_mac_gso_segment (net/core/gso.c:53)
> >      __skb_gso_segment (net/core/gso.c:124)
> >      udp_queue_rcv_skb (net/ipv4/udp.c:2476 net/ipv4/udp.c:2466)
> >      udp_unicast_rcv_skb (net/ipv4/udp.c:2620)
> >      ip_local_deliver (net/ipv4/ip_input.c:262)
> >      seg6_local_input_core (net/ipv6/seg6_local.c:1640)
> >      lwtunnel_input (net/core/lwtunnel.c:465)
> >      ipv6_rcv (net/ipv6/ip6_input.c:351)
> >
> > Restore a valid mac header, pointing at the network header, once
> > the VRF rx handler returns. The sniffer rebuild happens inside the
> > handler while the header is still unset, so tap behavior is
> > unchanged; when no rebuild happened, the packet now carries the
> > same mac header state as any packet received on an L3 device.
> >
> > Fixes: 664d6f86868b ("seg6: add support for the SRv6 End.DT4 behavior")
> > Cc: stable@vger.kernel.org
> > Reported-by: co+98d7de09cd94fec5@bugs.sh
> > Signed-off-by: Boyan Liu <yymhvert@gmail.com>
> > ---
> > v2:
> > - Move the fix from the UDP GSO path to seg6local.
> > - Restore the mac header after the VRF rx handler returns, preserving
> >   the VRF sniffer behavior.
> > - Verify the original reproducer, datagram delivery, and VRF sniffer
> >   output under QEMU.
> > v1: https://lore.kernel.org/netdev/20261010073015.7665-1-yymhvert@gmail=
.com/
>
> Thanks. As discussed in v1, this sounds the better approach to me too.
> But it would be better to get the opinion of experts on VRF and SRv6.
