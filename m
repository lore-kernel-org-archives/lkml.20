Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794356481;
	b=CU+U+ObXItqitqyY6n89qY2VNsrYIBf33uGwV7p6uxsBGZA2PgU9wGExKSY0pJ/zzivw
	 ujDXlQMAR89U63WcRyhSJk8rH+M+5bTCOu6swt7bt/l0MoXLWbhcxmnWfJi6Sm6L5iNjx
	 U+2xJ4AF7rbELr9GIC20eGQgidZv9+0bOcCAXDr6UHMjkU0zW5ZJeeVtpT4TLBHbLiZDl
	 /NN6HIrIGAtVOLTBSZVR1w4Q0oTXUTKsiRSODEpNiUf7m3lA3JoZi0jmMjlP2OEEwY3iW
	 ZOLWbguughC0mwrwrP8drSchZcXwoEkSEjtK9c9xIq4LQcHNgmv+M/GzouWYZfF13cQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794356481;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SysW/vQ+azlcGHbBaov0axn5KXBdAfDFDbIyK3iaAdo=;
	b=u2b0I/az0n9BcnVj3zNU6wcYZPNGSZdB1dUq7cS+qdMRkRTEHB+6A8m/RLY1922V2CDe
	 H2IXywx9H37X4NiVm1ig79CuLyZ/AYghB9vKziB966pGQAOq/v4nqziy2jE5tgcXEzP0T
	 QFUrtUl9lXSfWfrg9YPzuz4BdWPs8FgIRsbhm5c7bQbc2NVbbOVfWEHMbAKXIfQTaWil6
	 iv41NcpaKqA1ZRZd6aRkQp4Ol2e4sd1g1IWt2QYECr2Y74LB2tnCKE/md1DZPJy4SGW5k
	 41RHjpAsS13nK8RZEuOvb2w4KFa2nvn/Js02xCu+qisyyEF5jdQjwbzDMELpJs1u9OA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=everpuredata.com;
	spf=pass smtp.mailfrom=purestorage.com;
	dkim=pass header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=GJdzDBsE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.181
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD48B606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 00:21:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD48B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=everpuredata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=everpuredata.com header.i=@everpuredata.com header.a=rsa-sha256 header.s=google header.b=GJdzDBsE
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c9e7731b34so1907811e0c.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Nov 2026 16:21:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794356480; cv=none;
        d=google.com; s=arc-20260327;
        b=NI4Vgp/e88knao/ZCp/cvpIiW2K5IqJIXRyqPBxheO9wmJC59cg9JdrH+BIn2A73wW
         AZJugGiNwGyjWS+b6rYT9sbufTxre5P9dgJlbaAwiBaSflQkHJvhb4Qgcm4b7YtXNqXD
         1Ik8dJ3W/SOS9ZuQ7iq4XDZRI0cj/jw2uk/JtVAfV/YF79Wd9EHXy0e3dz00FjYvXKk+
         vrq0vmyi3pODf4jDmdP4dRdixvMB0qsqgZX4KozUSC0S8WnOF+30LHK28y0kwcFx0XUF
         wyu7VQwaR4qWwosesReWxpyHNtODCWwlXrRaydcaSYkjY1IJDcRpGMOT9yk8VvO9E1zX
         1hkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SysW/vQ+azlcGHbBaov0axn5KXBdAfDFDbIyK3iaAdo=;
        fh=QW9WHYsn31YOJ3JEUmr3W3Fcn4HIkNdO5uQY+2/TBIg=;
        b=Q8wr5Y7Pty7D0TMV/91N7YmMOa4mhJAGm/41lsN9cSBNPIiehG2dBs7M3rnDbDyy9/
         qqmHLNWpPMoD3b0uwXW0D5uGAYSZ0kkky/fFCpK1Mv/7njJO8i66vwM7GC/uarIv8u7N
         QBRcEF4uTbCkyLBNHBX3jEofmV1iDtX5MJ10HZ8c/scMPswjau1pqQrFQe+lwLDWYInb
         VlITcQw/D4KLXzqmOHtdK+t/JiiMVr2HM+Z/sbGSKcN+uCVzAlRXkvgF333ii89sGgWk
         rPHi2v0BZgI0eulElJwM25LcXlLrrlDnTzkpD/IEljbOlvBi3om5UsAu+XSRonrLpBb2
         ESUg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=everpuredata.com; s=google; t=1794356480; x=1794961280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SysW/vQ+azlcGHbBaov0axn5KXBdAfDFDbIyK3iaAdo=;
        b=GJdzDBsEM1lpGVcRdXSzDuWUl+s8lH9nvOzIYKP/EnoMQ3IMC4fYNgx8gbAF7cpcPw
         N4HfjnhAm+bJa9k6RrZx0H6Z8DrOwSY4TFM/k+qIIimk2tSStYvOru3ppa6pXmT9S675
         BWH/bhRZFj0IVGHzcLzwftqRPlt1D2t/3DE9DFy9HIUScUzpNLg+2OdJBQCQsyKhu+B6
         J0sBgZ19b70FnvUCPaRN/aM/hCLtlTV5WGt/Ppyx/L2vv8phnH9N1flb1cfbD7Qbrom8
         TioGs+9UFck27hoz1MbLLcP7v45WuuF7TDqvGoYLTEHTPf5PiiTjLpeGfNslpDF0qv7n
         08vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794356480; x=1794961280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SysW/vQ+azlcGHbBaov0axn5KXBdAfDFDbIyK3iaAdo=;
        b=X+drwPaIGPuDC8yVglBFRWejnEksSHnmXNsy4Flv38kCHSSEcPtAOVuO73GrNXGZ4J
         oaLs6rhs0sZ/BWD+xw+691mdLLiq5J44kZMEubeYLwt7aVvoVX+ASsyW7O1sCoNn9Ykc
         TLyuXnzhOcY/3s6SVFh0pTzziHAXhRUY/0Tgw+whoZxxkyJ9eMY6Mt/AHY4VikSILfZj
         RGZmf4uSFjOel0vmXUscxlDH/Upnzdzz+jvy33YUM31ks6Ee3BZViP7M1wHcTemDFEYb
         +BxDiaffuTMRs1b5FupCad2ik4NO1puflU0ZowUKHITUltki0RMHB+7pfon7sBwROk/B
         f0Xg==
X-Forwarded-Encrypted: i=1; AL+hErG1356bgU/NRfAdAEaKKTZcATbA33CxEJW0m5OGxkyjgi6yeEvK6Xji8QjKs+8TZFngkyNYfN/ILY4Pshk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/fEpb93x9ADdzM8qfUnfbcLaj/IgUXg6Tz01U50VHaej5Ouirq
	aP8CDlG4RQvGDB8GYRK+ylGZ2Xm3hK1Nsh1Cqpji4/jMZbIbTklXNQ49Yp8IM0542zg1XaZTnAw
	BTTWSBbhaMZRuLlwF6bOa3k7TQbe4XBF+UCo4GCtj3A==
X-Gm-Gg: AYBFou2Z3G8PCyufqxV5vqOAW2Xk/S93k0Hrt/2XcXA2FoENlvTg8H9kTvo6XvnIEq8
	bo40829PiE69/uVQkkzUA8Oiod22CU6vtMqvgqK3PGoA8SgKR4xAWOpSC805MnFzRVZTFEcD2mf
	ugfzV3f6Xw3j1f9tr6BnEIN3iS3fsRvJG7GzSq+Xm/fTcKRsQAK/+91Iw703/gjpfx7Vwh63I5W
	BQyt46X1p3y8cXxCbDFnTtIFceZCopEATTszBZPMDjtRCmsZJ7+iHY+bfg2S7dDunJaCW9KR7OU
	yz48vZDEKp7J6zWSWMf6Ty8nkEizba7HS2DBg7+6qnPRn6CkkVu8LJc8J32OTc32eTs5Aq63V7N
	w+C5qxIPEuGZUczTIByXAcUFbT2uTFXRts1BldXWXA44L6a7Aliwf+avp+v4U49+TYNjcSsA9UN
	X1zrpqXsY/KsEicTlBYgKszs6DCNiOuHwjAMWiK+LP+/30l5ZcTifO95y3dj3aUcGZZAuUlhfTj
	kG4tfQrr4HVIWAIK8eeak7y
X-Received: by 2002:a05:6122:4683:b0:5ec:c186:d22b with SMTP id
 71dfb90a1353d-5ee1c49c9a5mr217481e0c.22.1794356479599; Tue, 10 Nov 2026
 16:21:19 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104214853.659378-1-rjethwani@purestorage.com> <20261110133425.3bdcd98f@kernel.org>
In-Reply-To: <20261110133425.3bdcd98f@kernel.org>
From: Rishikesh Jethwani <rjethwani@everpuredata.com>
Date: Tue, 10 Nov 2026 16:21:08 -0800
X-Gm-Features: AclHuK-eJY-u2FWayJXgV2uNv-HfKtmR1GiOphIErFu8GsOwnCWu3b2O19z2cSU
Message-ID: <CAKaoeS1xjZuY6Ep6PFsPtM7ZcXUNYHZu8gg-z2KonTrducnW6g@mail.gmail.com>
Subject: Re: [PATCH net v3] tls: restrict device-down TX fallback to hardware
 TX sockets
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, John Fastabend <john.fastabend@gmail.com>, 
	Sabrina Dubroca <sd@queasysnail.net>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Alice Mikityanska <alice.kernel@fastmail.im>, Tariq Toukan <tariqt@nvidia.com>, 
	Boris Pismenny <borisp@mellanox.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 1:34=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Wed,  4 Nov 2026 14:48:52 -0700 Rishikesh Jethwani wrote:
> > +             /* Stop offloaded TX and switch to the fallback.
> > +              * tls_is_skb_tx_device_offloaded will return false.
> > +              * Only HW TX sockets have the context it needs. Do it un=
der
> > +              * tls_device_lock: the reference pins ctx, not ctx->sk.
> > +              */
> > +             if (ctx->tx_conf =3D=3D TLS_HW)
> > +                     WRITE_ONCE(ctx->sk->sk_validate_xmit_skb,
> > +                                tls_validate_xmit_skb_sw);
>
> The locking in this patch looks way too coincidental.

Agreed. I'll split it in two.

Patch 1 drops tx_conf/rx_conf from tls_device_down(); they're set after
setup releases device_offload_lock. Setup instead publishes state before
up_read(): the HW validator for TX (device-down cmpxchg()es it and uses
the result for TX tls_dev_del()), and for RX it clears TLS_RX_DEV_CLOSED,
which starts set, after a successful add.

Patch 2 switches the validator under tls_device_lock. Since f08d8c1bb97c
("net/tls: Fix race in TLS device down flow") the destructor drops its
ctx reference under that lock, so a successful refcount_inc_not_zero()
there keeps ctx->sk allocated until unlock. We cannot unconditionally
use sock_hold(): sk_refcnt may already be zero while queued skbs keep
the socket allocated. TLS_TX_DEV_DOWN carries the result into cleanup
without touching ctx->sk again.

pw-bot: cr

> --
> pw-bot: cr
