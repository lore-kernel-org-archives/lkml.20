Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793327441;
	b=sHYi17XXfYfy6H4z3Pvv3jRE5BC5xtb4szywokG10WUA6F3iA5gOr0OpRb4hNb3EFMGb
	 TKvcULQRgSiV9TWZoLRGIHs33MUS0yc+D4XhQqSyUpPp5MVDzv5qER/HYNfb/gn/RPlYf
	 dzFiRpLpiYKz8HR0YSfOk6jqhABqxbIqCYt1oR+fqRL32/7P2y0iK0pRBNn0g3aZ6z4Yh
	 EKcQlqbVriJPsqJ1CauW6cMCEZIQtyjICCGnFjXWkiLIGD3/FYakuNdSqZ0vDZNBUhpnY
	 wnXi8NYjLlsTxideqDsxf0KXpxDmMpvLH9VJhUuHUTvum8vV6TgDofVM1eAcMmiFbMQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793327441;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=v5VYmc2HDzcSq4knARbKbUwFAzTpnHrwQ7qzGl0SDd8=;
	b=B70OyKB3e7yjjhl4B9iySg5qei+njsy48JkGGbVF2GGRDx+jJ06+qnKrQkr7HQpYqqdZ
	 6SUTS0XRDoMj8ZyrOL5mmmDWZUrQaztlxio2OQz0IqM1/jIKjROGoDcm/r/J0qkfzITSE
	 3LIzlPw9Dy/8h0DyCPo8KBaEX1dnAtJkG/hzJrUUV0VGC1s/mNESGGJvZQWspEsj5jvqm
	 LnvVbuhLfoMl8IgKnyFlxsUeXkEUJWkOqFH58VYGW9rFxK1AvCnajfENhJURPBBJoO3EY
	 yY48V2PcNw2XuMwU7dxLGb7qk5K3hy/vB2wxU4eZaR19d2rvtqH3kLGQ/nwt8evwi0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8gfzGoR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDDE1606A322
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 02:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDDE1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e8gfzGoR
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3a9787a156eso2205541fa.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 19:30:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793327439; cv=none;
        d=google.com; s=arc-20260327;
        b=RIwYOf138U9TvmJPR0U/loX5idkDbzJlobBRWEA15io52GdxcQkvb8/hqJ4YLNAso5
         6m9F5i31Gj0vOORH37NB8Fy9a+k4b9MDjU2g5yZ3mIeeQuNQ5ZOorx/rpX6mEXT7h5kW
         ygpz/OrLxzsr+J3AgMZ3uPSi98KO+UfKVYDObIkrKOCGLWbhqKPpDVb81HiGZFf0FYkT
         wEb6P7aX+h0v2u5IvJLKgr6OC9JmFVv6QBhUQVJtYWYQDj8XTLSR+2gdkL5JVAadf0tV
         oibQctbXCBlX7Pb8owzXhgZ1yG4svu23Y0E74txGBm1cL+vEQrhv1QMuySkIUjU5lNqD
         wFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v5VYmc2HDzcSq4knARbKbUwFAzTpnHrwQ7qzGl0SDd8=;
        fh=U5M0bR2DuOHMziPFQbA69d0HM6nzJqcfV4cOs5Um6IM=;
        b=i3L5L+DdBMDNrI4mEmHGpLk6wEazmXwo+D/ZM0y0hKTOxPhDaYFELRFTFG9OLAKfx2
         D9ufqhCTc6iyGb/3J0YRrLkfCEFfKuWshY+2AUEoKTbvkX0TZTK96DM0q1l04DshwZUM
         79SAhB3qQh0V3xvNa33rNTHuHPVh1wVZiLsBe5paX5YTSDhb3kinTWPMlEVNxMN26+LD
         T7SKj5okW641mSduISKwRJeLYZY7Q7aofo9iSVHSHHXYBItMDiaD47W08CQKG3uhbOBT
         PGy63eJ+Te2nHFenGiTrJGB2y380gxzuX/ge6s009z5kjEq6W+E0Xbi1y68+tpy6kbod
         Sk0g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793327439; x=1793932239; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v5VYmc2HDzcSq4knARbKbUwFAzTpnHrwQ7qzGl0SDd8=;
        b=e8gfzGoRM385FEsKyD02HVJxEcPcs7T3QOF/fJWMMm30PlbFERmKncV3Hstqsx2052
         lf0xfBvCVoO5IbSgaLtFUi3IOlIFZz1uzqLANxW84fUcWsKuv/UhGHOgEFLFNpxKSITg
         iZr0fs5CcKrN13lt42exXW7GYdCcJsaFZq1uGXQ+jrn6ASA4gprfcgsdP4KKcpG1aYfU
         C+NMi78+7JV7NTPtMAWIFI7q/n2x8uJES+rD5YbbVVnNBM1jrYwFbIqfjStrL9BYr9jO
         zsfza/TSP1s8HBRuKorim1idzGf7awlWuP58iN3WCOzZWQE5eRHJv9Wta5sLZjEEvL0F
         LSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793327439; x=1793932239;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v5VYmc2HDzcSq4knARbKbUwFAzTpnHrwQ7qzGl0SDd8=;
        b=Rs+qWEOxFpkH07rvaSK2BIIhkflUC/32L3HJyLJszo0Xj2pow87oQl4U72GmdNI8Eh
         SZtTyGaju2RovarVfnCaHqDSggBOvAse//tH+vAOuVgxqLLTo38bzigUPP2rQa6/vZb8
         N+Dy88h3CUW3V6/kgXdaDbQNlZLAwWB0xgtVfm+jYCkI1DSvBV9CGPoGtqDcTkV0Hrzy
         5mxqlcxvhzqAz5geLZG2pv/yUOpXblx4vjPm42mcos2EWffsJ5bq5g7BkTsVomVhsTWf
         3IwyP93Y+DSRGNyLi9G8la00xnWBbkHmq1XSPKFE8FTI1KzMChyZHdfa2GewJNUTzSbp
         CyuQ==
X-Forwarded-Encrypted: i=1; AKwUvBycne9hug0nM5QJPBaffBh03OYLC7bqW0opJ2iNxkYWpOH7Jo7ttXPX27+xBG5G3mSjQSRz4GmG0F15vY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLTDX/xoH2Bb5lknuZAD5hECOXSmrJWtMFogYvC35K/wHfUmDx5
	YXsH9yBbau4VJMOqnrGj+ant/EyteReDEdcO8FkysRRaHR9jIDc4Wc0/RleW7Ju62I7ETbrjecU
	RNcaTS0AWt/uquAnbMlxXiK9MTY/JVqQ=
X-Gm-Gg: AYBFou2/gYxjMoe/MxHNG40vy1PHM/u3smmE2V7T0wVXpaWxKQOU+bichAAm436n6X1
	nluWZR6Ro824Dk4+8jsaGcH1hXLxYtNUjy2lJnYefKwxd/jNqsjf25sjXXB8ESdplUvjUWOz/Z4
	nlqdCn2cwjl3sHvGAWPryMr4BdoNo/6Ip8XTq47AXUdubi7pdkvqbx/KYCwIp2fJlwTRwkrYuBO
	fvK4Cp3reGGEjYqgdkgmhvypTBR53ANx0lvVfm5QxaIf5Je6nRMK6InZxOldAJOyPoUttfVCV9/
	a1XmQZ9kMkW0UYbcnWlQkBPaomE2KVFqEbbRB4RoGRVybxE+elF9YZgUchC7AbS3vlti2r6/wDM
	YHvqNPdg7aQX1nLdFxTIaInfwVgDxzAJMUfc3sbeY7EeOCmFY1fMQX9JYv0kywABhMjz4UFYLdP
	VOIF+dyxQBCBZAqB7imCDGIiZxzTnwy3UbCmeIV+kMxfASwGX0eYuMy9n0VGZC69VDafY6bW98z
	k8tJAIruxLs
X-Received: by 2002:a05:6512:2251:b0:5bf:cfc3:5954 with SMTP id
 2adb3069b0e04-5bfd954b9f2mr211780e87.1.1793327438692; Thu, 29 Oct 2026
 19:30:38 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028025026.11401-1-testwrzwrz@gmail.com> <20261028025026.11401-2-testwrzwrz@gmail.com>
In-Reply-To: <20261028025026.11401-2-testwrzwrz@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 30 Oct 2026 10:30:00 +0800
X-Gm-Features: AclHuK9V4fvZWJ4AFY9w_N67m8fmBuNScc36Y8vzCOEgxwll8I8B9GuAiObXkno
Message-ID: <CAL+tcoA0jyxR875KocG6fwNSOPjfC-pdhJt0xCbsDQMtiNx8qQ@mail.gmail.com>
Subject: Re: [PATCH net v3 1/2] xsk: defer software checksum until the skb is complete
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: netdev@vger.kernel.org, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Stanislav Fomichev <sdf@google.com>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 10:50=E2=80=AFAM Rongzheng Wang <testwrzwrz@gmail.c=
om> wrote:
>
> When XDP_UMEM_TX_SW_CSUM is used with multi-buffer TX, xsk_skb_metadata()
> calls skb_checksum_help() while only the first descriptor has been added =
to
> the skb. The checksum therefore covers just the first fragment, and
> skb_checksum_help() sets ip_summed to CHECKSUM_NONE, so the remaining
> fragments are never included in the checksum.
>
> Move the software checksum calculation to the point where the last
> descriptor has been added to the skb.
>
> On a checksum failure the packet is now dropped instead of being returned
> to the application for a retry. This path is not reachable with the
> existing metadata validation, but the behavior change is intentional.
>
> Fixes: 11614723af26 ("xsk: Add option to calculate TX checksum in SW")
> Cc: stable@vger.kernel.org
> Signed-off-by: Rongzheng Wang <testwrzwrz@gmail.com>

Reviewed-by: Jason Xing <kerneljasonxing@gmail.com>

> ---
>  net/xdp/xsk.c | 23 +++++++++++++++--------
>  1 file changed, 15 insertions(+), 8 deletions(-)
>
> diff --git a/net/xdp/xsk.c b/net/xdp/xsk.c
> index 33475b180ea6..aa6b010192ad 100644
> --- a/net/xdp/xsk.c
> +++ b/net/xdp/xsk.c
> @@ -1011,14 +1011,6 @@ static int xsk_skb_metadata(struct sk_buff *skb, v=
oid *buffer,
>                 skb->csum_start =3D hr + csum_start;
>                 skb->csum_offset =3D csum_offset;
>                 skb->ip_summed =3D CHECKSUM_PARTIAL;
> -
> -               if (unlikely(pool->tx_sw_csum)) {
> -                       int err;
> -
> -                       err =3D skb_checksum_help(skb);
> -                       if (err)
> -                               return err;
> -               }
>         }
>
>         if (flags & XDP_TXMD_FLAGS_LAUNCH_TIME)
> @@ -1030,6 +1022,15 @@ static int xsk_skb_metadata(struct sk_buff *skb, v=
oid *buffer,
>         return 0;
>  }
>
> +static int xsk_skb_sw_csum(struct sk_buff *skb, struct xsk_buff_pool *po=
ol)
> +{
> +       if (unlikely(pool->tx_sw_csum &&
> +                    skb->ip_summed =3D=3D CHECKSUM_PARTIAL))
> +               return skb_checksum_help(skb);
> +
> +       return 0;
> +}
> +
>  static struct sk_buff *xsk_build_skb_zerocopy(struct xdp_sock *xs,
>                                               struct xdp_desc *desc)
>  {
> @@ -1275,6 +1276,12 @@ static int __xsk_generic_xmit(struct sock *sk)
>                 if (xp_mb_desc(&desc)) {
>                         xs->skb =3D skb;
>                         continue;

nit: since we have 'continue' here.

> +               } else {

How about removing the 'else' branch to avoid unnecessary indentation?

Thanks,
Jason

> +                       err =3D xsk_skb_sw_csum(skb, xs->pool);
> +                       if (unlikely(err)) {
> +                               xsk_drop_skb(skb);
> +                               goto out;
> +                       }
>                 }
>
>                 err =3D __dev_direct_xmit(skb, xs->queue_id);
> --
> 2.39.5 (Apple Git-154)
>
