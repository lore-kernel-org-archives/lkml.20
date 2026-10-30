Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1793341915;
	b=kHTu2P4b6bwVsV+xF2bH2PgQ9eqpDUDHuvN2PYL9t8RLApaGzn84uOTGXS80yJXTrxHu
	 tMmzf7zKEvnfate285HY7Y1B8Teob/Njh5uQm9tnLwRGkWgmADKtsFcTjZVHoO3DwQAmi
	 Sb97WbEobxEooHGbUvyAYvUzmPJivSveRalz377m6QxH/XDZS7ZmkgjyOV97SF+W7nvz7
	 qrSTKGxZc75TP0x/VOXxxuyy0ftkSrpArbF0qw6zyg8/3F6KwAtLvzTyqnHQ4bH0Mhov6
	 aRauw1L6gL6JKMelOxti0AWWmsjQ++K8LaePzO0xB7crKU8Iee3nfWzKtmN0EtoUOZA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793341915;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=po4/7/QhF/scBRTBfQcn8+7a7UueR9Kf354VoVoto3E=;
	b=kN08fTnctI1Vj7j53B/l2FeLqoje3kkctv3BhpCm6EErgxJUHdqHC7ytiCO/VIXGyVaF
	 RVBWVMOmO0yFrMGMABdbblFmDASn15Mh753ofTaZPDEDnu7+wDtsudgajuYtHVXrRWI6N
	 Zk1TAgXRCfVqNPcjJ99/OFFSZWxaFQKMdHA2ILRNQwBi1JtF39R2Ev3qtnHoEPRZvIGey
	 2ItWpe6uVGVaiwb2i5L1QJ68JLClBcPeXbLDUKJ214OiaBmwHl2l65JzLlRKzmHbrhWzj
	 DnjYSkauSo8d06lyWiDqf4PIyE2VV3Nr9Ca5UzLj8vwcXVvZ54dtRU8pTmyJkRmicFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cHhGZfld;
	arc=fail smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD54606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 30 Oct 2026 06:31:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD54606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cHhGZfld
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35b2c599f43so920966eec.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 Oct 2026 23:31:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793341915; cv=none;
        d=google.com; s=arc-20260327;
        b=lXmg8+OWf+9uYNKr1JUl0TohvMIKma1WUocD5Su+bE4J3d3cQUGI1Zo+zCc+6/kp0g
         V2UBe93JzjYPJ1ohFv7k3v2TggJMVCW/0GNVtF3D4jgW4ya3+nMrRR3MmQxlVjhiv3XC
         dPYpjc9myA/O5vVpAQbZ0ikv68mLYiZq98UWej81WPvqz31n9zxvrZ1r9UG0AUEPOKT9
         JLH2WjgbEwQ4xEjyTa9EFyBAzyiKNs4426aXHtmHWqEoftr53lTO/mGxOb/c9k9PHK+M
         Bn/3j4GsPDFHOYIpK5o2TnpvJ8vj6Re+dLqX4fYG0YSIAqQFaoHAylJb1xjnuDaJKff0
         lPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=po4/7/QhF/scBRTBfQcn8+7a7UueR9Kf354VoVoto3E=;
        fh=MHS4z2ncQ2AUjS7FqSf7S46LehslFNeF/+CvqumE3Zw=;
        b=sPjhwG3S9lfkfUHA6SFrCeFHHBnvFWh0TgT3x96AnfEhtb3aGkKmOuEHMTJXoLJgTU
         Vg+zLhBslO4pEp+2FMZl8lSvUMjSx7pAmsXCkCzj+0Ue/yoFyPuTriad7TC5RVO1aFH2
         Yfkq72HHNbQp7YllhqP1o7ErHl5gLvrNhKn2aXTBH2hAOnVh0a6D4c2VAA8xc8uJ3kg/
         1OZaV3Rdl2qrUirRI4jffDSe+zrMotL75T6MZaeh6l7IoRsf/oHvaltveuQupvYXCYXM
         2crERcdwlejWVOAWJQeSxtSMKVwjV++sUkyzmOW+YNFuINNC+2jO2GuVCBjPxrXcgPNZ
         Adbw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793341915; x=1793946715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=po4/7/QhF/scBRTBfQcn8+7a7UueR9Kf354VoVoto3E=;
        b=cHhGZfldf7rwLhH5KKbJjNDRKRapNAbZx8eScm4G6BCmNEX/trTh3APCkLfh7RB+2A
         cOLu7dpCFuIi/m+jx/yTUFUZMcJ/kJsLk0BeCCxGTjWwhL7Fcn2U+1mjgVSS+5x+MocD
         3qorXUcfIr3oq9+t+uVpP9+qFn8OYOWEu8f4WNt8FwjsiisYzVDtYEsHOQZK7cmuVU8s
         3WGPwDeL6kTP/eAYTW0bJDdrufMyckcJZzLXjlZWf5QW4juLEPZ3WWHwuz41GyBX9HjW
         PKxwgfe8XIQzCbxMVJIXkqmN2gVFfKVlfxMITH16qONvocH7wAlowIOwo20nkYQaUR7p
         pDAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793341915; x=1793946715;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=po4/7/QhF/scBRTBfQcn8+7a7UueR9Kf354VoVoto3E=;
        b=F+hy37ikLJYwR2J1eZY6xitciUPxk1UNzZYHBPOEipRDxpCJB2oac+uRD6B7uYPcZ0
         MzDX1GTCoWaCVBHqHYH/dCbVEb3VDjjvpq3d9VVtsrkYRvWOo+XiScS3iihaxh8R1N4y
         m+wOwwT1uqsghe6TBqmrW8iz0SM4Vx4UuKsCkltq9NJiidm1qaUmy/z5Wjn8kT0q+e9j
         1UpHs9167RBJoO3i2y/p+ehSVUoalS5R58N8BnoxXhcF/gpHs9vd0UN0Ine1ZRN89VYB
         VXMpel8LqXrqRPFv1FetUsxCVCpXDvwuQOaFBUZUGe0FkNjgeVeENmbb/+ETbE4d1fi/
         tT9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzYcUB4KNcDf5rNkiHdgiXJTLi/a0bykdZ6MgsZy1j1lEb0adjcR0qIHmh9prTrY+e8gacBOsIy7AvcUwM=@vger.kernel.org
X-Gm-Message-State: AFq9FYJllrmJBCOtAyFXHCtP0QiBLC8Mv/FhWc7AQFPgdYe1HCmPaQQ+
	YTNIRjWy1PPLNBEf0zoxUcdt76rNxqyYbMNxLCfKiZ9e1Olrt1ot2U1RP2Yqqekhnx8YI5zI5F4
	pvqmzEYjBwBQbwgA7oLxHMQ4zub8oBKo=
X-Gm-Gg: AYBFou0l2NGumRcKk2t1Abh1ZmDdSPW5H8wc+o9cqvWIdKFQIPlXQZ2bQpWQZkA89Sd
	ZgALpB/7yy1X236DQW93oS22zfB74w9oVLVdBX1XE+9MqJTBSmp6k9DlGno1fKCnee580zk7eVc
	lsdyJDiqz6FL2zqWyzfOdWjyQJXpYQ3JP4VQdLVJcObRkF92fLx8RyQvhkP3medWN8poBXaEhkP
	3UfkYoEmo+RIHRVvQA3IEA1FA5uvflTHzgOi7boj3DX5wahzub8aS73ue2Y1Z+VvmradSqtTE6w
	7Z88HOPz16jVEeoTmVLZVcsrP15AfeepnrIR08hnt0pvLgrHICPVgpatbYAQ2VnXMybKZddDAAa
	MZbk5S+TtfsbTzJKIkVl/AK/Nc9RaR4O5tEt7ckdGOjMWmvkUBktoAkloHwcytwaC1CAZ6mDRtC
	M3hEUQ4Wp/J021eT72o0YGAm6UnOfQDBAhvfsOhTtW6WXso+QHiFs=
X-Received: by 2002:a05:7301:618f:20b0:369:fa8b:d725 with SMTP id
 5a478bee46e88-36a42440a69mr2479370eec.35.1793341914428; Thu, 29 Oct 2026
 23:31:54 -0700 (PDT)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030023248.78802-1-testwrzwrz@gmail.com> <20261030023248.78802-2-testwrzwrz@gmail.com>
In-Reply-To: <20261030023248.78802-2-testwrzwrz@gmail.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Fri, 30 Oct 2026 14:31:14 +0800
X-Gm-Features: AclHuK-3MmLI6pDH5EvsdDyQjqZxLAj0eXtw9LqREvrfIl7g5xpi_yP0zHn6NUo
Message-ID: <CAL+tcoDUGqk-KfMBqdG4RBURHQc=9J+Ce7B7CZZWRN5yN7pRrw@mail.gmail.com>
Subject: Re: [PATCH net v4 1/2] xsk: defer software checksum until the skb is complete
To: Rongzheng Wang <testwrzwrz@gmail.com>
Cc: netdev@vger.kernel.org, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	Magnus Karlsson <magnus.karlsson@intel.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, stable@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 30, 2026 at 10:33=E2=80=AFAM Rongzheng Wang <testwrzwrz@gmail.c=
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
> +               } else {

Why are you still using this 'else' as you already posted a new one?
Please take a look at my previous feedback.

And please carry the reviewed-by tags through the version next time.

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
