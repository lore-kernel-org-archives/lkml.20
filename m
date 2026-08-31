Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8EF49DB8B
	for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 14:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186074; cv=pass; b=PZCWYMoPr8tVpnpJj3WHp9IROj/dZNXXQQFZ8Ru0vcLpviqlsaq/BvnYeV28AZDFeU1eeLX/uMU1ztSjtY7iWp/HV86kcZCaNoFTZ6ZTvFIx1f6ha/MdrioR1WIG3nZGQ10Uvf++K2W3cu3d7rGzOJV3urWgec4ZfT+cSn81wIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186074; c=relaxed/simple;
	bh=fXMTA8R6RxSqJZAmaKVosJePA814Gi0PiEsxt5rDwtA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EFYVuFAeUd1PKVjBR5+jxmg6bNz8li7WsVsWaVQqZDP+Q5WGVqubxDYv9ZKtyz8ACYyeT+pTXZoOZTS+6vRherL+yxMCOnwNeovvnjJQiTcEy8rv+Bz2JKmLSJOtW3AyPbtjD0ryS0m0LX09MS8spxHMNwb+qMlZA8S2k65yfMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hiRQNM9c; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hiRQNM9c"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-52fa6005224so26465981cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 31 Aug 2026 07:21:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788186072; cv=none;
        d=google.com; s=arc-20260327;
        b=F1li/KIjLpxs/eKzdClpIN80K1DNCUggx+/qXcdJa6RbdRMyYhaiUadvngIa0AJ63o
         Q1sGY9SInu7NHbiy0q1G91W+JOCm1E/iZ//6zf5tBEic2/RZ3WyckEfJoVXpmVhPmRDL
         kOm5SRQZqJIrK0Bg7EGDT7BYydmgHgau1GrRoCE1vBP7mh+E5ZxTzLCw6UAiEbbwozwA
         EtlTHdZ6oV6x7ob/aJQ89J8sPkzbxCLNta/lyaw058gExuA4s3umQjVeqhCHD0M8i9d5
         4k9A8KccBDk4GG44NrEIHcp7yvEKqS8VPP+AkwMpB9AA/3fD8gplE4GKMJj+j8wLQHgu
         gOSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7RL1vRxunTSJTFDJSeHeGcvXBm9gGOpDjpaN6wUzR4c=;
        fh=mTX5MehZOcN72MxQOxga2F88n2ED51y3cxoHzg6yOHk=;
        b=Sfye0+OBrPN8tvxLw+dl6Og9ceitrOrgtZegI3r/fRrIOV3hLOv81QH2eQ8Ee1hDlF
         Q1I/+PwSfKSkd4kUbUAYB9ArGH90vDWjAfINcxq1yuv3Lo+1lN6KVUKStKeI86hacVks
         Zzco6gxr5UGCkGvtoKEN2Cm/VL5OQZDWxKrD72xCuBM3HgFuQH6D4QIuYbfbG1j5VTE6
         45sh5l2cdE+by1yDVBjBTqSgHsPr/Rq8xgadGqEwgO7/M3ycz9phiW7df7qJVasHxVwS
         5ao3jjNGHoJOPpBTgLG8JSnQ4raEMKvkfPVMNFGtm47FXa+/oeSJwjv3M7o2kQzqO5zs
         R1fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788186072; x=1788790872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7RL1vRxunTSJTFDJSeHeGcvXBm9gGOpDjpaN6wUzR4c=;
        b=hiRQNM9ceQb6xqfsUahC3VaJLlsyN7JWcneIf51MA4JNf9KGhU/zAHrpVoIN6T845z
         9EC+lr1ZbIuLevg9cb3P0TS0PefXvVpMtl0qVdZLNDay9VqXHzJ5JyZJT9SQx9ihAs1t
         O2La45L7uHMTq6Jgrno0x1TwStxdUkDXPJ3ef1tPlIAaEl9tPXzyS1MOwJRDuv+mjrSE
         c7hRH/sZGgBmm/TasNXNBeKzZeBE/9fWPU5XVqB05hpwzqU0C1wUvRCiBm4f5XHmrGTA
         VTs4EwJrYB1dvJ5b5yZomAIwY94CX+/EXJjDMx2MFoTVdyM43ieMWIF2fNDuOR9JKB7z
         eerw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186072; x=1788790872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7RL1vRxunTSJTFDJSeHeGcvXBm9gGOpDjpaN6wUzR4c=;
        b=Aoanlt7FPVr8JcVfvrPt/XBjtTAmxJ3KyY+7HLomgsxtAo4rr9iNzHsAtL9CUELZKi
         aZUKoJVrMe9bzbA4XGnjT2b+WqwO/+zGBVbepsVQfvuNRPgRp+76xs1RwZ6dWWMT26wL
         U0sSQjyudMGddwW71Iow+Cu1o8XE+fuN3BRDD0sFRvyWuXFq4pGf54LLAkObL5VdohZf
         DKRoIGXDbgeH3SCndzYBKYtRzNN5yqC+r9SbRqF3n1aSKDTB7H4Q3KM6z91Yg0C83Yo4
         npSW996Zwy5ufZs7jvpPa8Gsd/UufZzZCk06eXXnXBdxeBTq0GD2VlTPI4RNXIMNFItJ
         r4NA==
X-Forwarded-Encrypted: i=1; AHgh+RoX8+TqUKjOrPyluG7dZ8ktmFjv+YpWC6sbycF1ryvJ0Ewl1AJgAM/uXsJ32BHsTmJtUngN+YhJBEvQETc=@vger.kernel.org
X-Gm-Message-State: AFuF++kxWOn4PBs52nQxIva575yRMrw7htRYUOHe9GvXFepOQC9YrV1D
	eHcT9bU6eidcFPoBMyyQ8XBWV5a2N4/PlQpXMoQ7yYjJk+znP01Xh26uBkbzPmqWWO8MkcoWAH1
	aZZ3ldWHQuuMp5JH2bJ4FiCRb6Yo+BbTGemDe/0by
X-Gm-Gg: AR+sD131YCiqOXSkeZFxB8XqKmtogBBlmjH4KZCs/gZxxBQXARS9lBMmfbFxKBlZdTP
	TotyPHkXXMHy2JEaeDTLAXTFr5Y39xPLwFJnOeRFqxlBMFvD16oRSlwhPGz8ufao+bJPIcjfp1g
	786UPpNzxcAwcPnfIGtqMkbMNuBhZIsBw4AJzHSPEWTGCGBkphcjx//12tsszmmCDD3W2d7zTPG
	SRGQmwfyUahnNDOZG+nXfsNIMAmML/ekXSRp5lkQB+WvuhZ5iPNK8HFFnvBvvd+2DXK87lgUMff
	3eh776ZiQ/TZL5z93BV7U6+gw1ble/tvNMgWIwPp8pUEHN0t1P8CBIGKXao5MJbOgtr3KxPFVSn
	F/j47spLUfKvlokfbFIXBqvOR8aEwk/ID0O/p0MFK3Ykk/8zA08YEAftbSQ==
X-Received: by 2002:a05:622a:551:b0:52f:b0f9:e4f2 with SMTP id
 d75a77b69052e-52fb93d5108mr311650161cf.1.1788186070817; Mon, 31 Aug 2026
 07:21:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831140710.469576-1-yaojiale02@163.com>
In-Reply-To: <20260831140710.469576-1-yaojiale02@163.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 31 Aug 2026 16:20:58 +0200
X-Gm-Features: AcwNN1UtMqrwfvDxQr8FPDhi66ZCqjZw9Lv5F-5kNAiQHG5_h_vuarhspOvFTKk
Message-ID: <CANn89iJthuCa-BZD9vik7LUw1to8aqTFKRgQfmOGozGvMeLanw@mail.gmail.com>
Subject: Re: [PATCH] bonding: reject IEEE 802.15.4 devices in bond_enslave
To: Jiale Yao <yaojiale02@163.com>
Cc: Jay Vosburgh <jv@jvosburgh.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Alexander Aring <alex.aring@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Oliver Hartkopp <socketcan@hartkopp.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 4:07=E2=80=AFPM Jiale Yao <yaojiale02@163.com> wrot=
e:
>
> Bonding already refuses CAN devices because their protocol-specific state
> is incompatible with the bonding model. IEEE 802.15.4 devices have the
> same constraint: they keep protocol-specific state in
> dev->ieee802154_ptr and do not use Ethernet link-layer semantics.
>
> Extend the existing check to reject ARPHRD_IEEE802154 and
> ARPHRD_IEEE802154_MONITOR devices before bonding changes their link-layer
> settings.
>
> Link: https://lore.kernel.org/netdev/aohMHTTH4VqqgZA7@fedora/
> Link: https://lore.kernel.org/netdev/6001bd73-ef68-4820-8371-a22775fb820a=
@hartkopp.net/
> Fixes: d5ae67bacd96 ("ieee802154: rework interface registration")
> Suggested-by: Oliver Hartkopp <socketcan@hartkopp.net>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/net/bonding/bond_main.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/bonding/bond_main.c b/drivers/net/bonding/bond_m=
ain.c
> index 522eab060f9e..c716336c5172 100644
> --- a/drivers/net/bonding/bond_main.c
> +++ b/drivers/net/bonding/bond_main.c
> @@ -1894,9 +1894,11 @@ int bond_enslave(struct net_device *bond_dev, stru=
ct net_device *slave_dev,
>         struct sockaddr_storage ss;
>         int res =3D 0, i;
>
> -       if (slave_dev->type =3D=3D ARPHRD_CAN) {
> +       if (slave_dev->type =3D=3D ARPHRD_CAN ||
> +           slave_dev->type =3D=3D ARPHRD_IEEE802154 ||
> +           slave_dev->type =3D=3D ARPHRD_IEEE802154_MONITOR) {
>                 BOND_NL_ERR(bond_dev, extack,
> -                           "CAN devices cannot be enslaved");
> +                           "CAN and IEEE 802.15.4 devices cannot be ensl=
aved");
>                 return -EPERM;
>         }

What about ARPHRD_6LOWPAN ?

I think it is due time to use an allowlist in bonding (and team) to
stop applying bandaids.

Plan of action:

1) Add:

static inline bool netdev_type_is_lag_compatible(unsigned short type)
{
      return type =3D=3D ARPHRD_ETHER || type =3D=3D ARPHRD_INFINIBAND;
}

2) And use it in bond_enslave() and team_port_add()

Thanks.

pw-bot: cr
