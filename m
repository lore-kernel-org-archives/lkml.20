Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388450;
	b=IuGcoIEx+BstXmeOBwdbPg4SONf2MFezP2OKRoORk1kahp0HvZTzBTU1mlvcnwnZgql0
	 h1ZFsvweOh7VulfZrPkJHRaUB+GK5pEwHJHtN6P8dvsVCiWVj2Yt3djwjkqW2M/vtUadz
	 TSmchvWiTWojg5bGkML10d1a+dLhTPOec09GXp3ui2hpahNO0lVISL4KDsOCgYURFv3XW
	 zjuwoR5QgF0iFfJanzePUfUTVx/d+SnbzMlYnF4IVAKV82f7VdT3aq8Xz5hhrf1xECMlm
	 079b+vEukF8+DKPhJa9NRNGfhUuMvW/88efW3q1pfDFh1dRKtZIlTM8bgfylV2CWgmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388450;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=nI1Nu5oqP6mshXiPgsRA+948M1F3pxJdBRCWfI34fK4=;
	b=hb+U9RPXJLOsEHmvYjRdk9q4mvIfaCfY7UaqCu+s901mI3n/5dt+uEc/eKFDNgsIzOcG
	 CWS5ziz6nCVyqPGkTqCRAMNYLe5oGGA5hTmT4zA7Z4YFoKzpOrnN569P6VrlNQH7eGQev
	 HNMeP2M0gnH5DHFnzCAvEuizSfS11XrCx6lQGWwdAQHKysnbjPUCmVBIdUv6ISqZ0KB+6
	 bgOIhSKhbC14NFwhyLXCu+ZSzRVDjFCWAmGO4JJTqD3j87iEEDdiWxMPQGvAXZajB+7J1
	 oqN39TXLkwYCmCEiXZR0YhRlIDo3xV7vG0j1a3DJmLMe1G1AM185iLE0qqsQgKdnKKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G+N41VrB;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A8A606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 09:14:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A8A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=G+N41VrB
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so27026885e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Nov 2026 01:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794388448; x=1794993248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nI1Nu5oqP6mshXiPgsRA+948M1F3pxJdBRCWfI34fK4=;
        b=G+N41VrB+2Ol/bSZo0p92+O2AX4edb1mNNvuyJ5euImGw5JpBe67f/pg0zIhLfT7AL
         kzd0RBvDeaP3iswX35k6BDWcgDvwJkNjE7IiOl72fEOnUCZBIjYj5FKdMsRRSV4vtcau
         2J0hY+Ilp+k+y4W9YYH2JNesoNJ10kKahc8Pyi7ad7TIjVjXt0ec986UQHgyQrXnZjGp
         SNcXRFZQGmzSR6vQgq86GcKIvB/Zwun7HiXJ8sqVuvXpYCAGnZR9StraDzSCT5uaqsTP
         ShLvsdBfteentXgCkoP8xjWrMHaNEr9dcubCZdQVSeD8LOgAG4WVKxcxfptfVPqNoWCt
         6VYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794388448; x=1794993248;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nI1Nu5oqP6mshXiPgsRA+948M1F3pxJdBRCWfI34fK4=;
        b=UlWWCZJWCTc0Si77da0NbXB+PFM8HNb3HRi0OZBAH5HSJdVsYWKz1XpP1lh+nE3CHk
         WADwFWEKGrTIYSsTXrBJvScpzs0k4a3QJDa7TzYbw9+77jQvtZx5/R4IVr/wuy6CNMsb
         +j1n/Bf3rTCNVsSGjebApzkPd+5kPu23tsWXM+ROfGZ9LMJva1Nw8ZRWdUR+6jl6vBOp
         Z57Wfs4bgwHI+ExHJuLdXv6mJM5Bq1CkvECT5EUcge1bK9uZ5qNQjIdLNWC9Q6yDl+DV
         w99c8uhgKGSeiVBWeVQePfUL5OO8EsX/Qh/bSeBZ3ndRksKrknLASArv+RmUqk/u5526
         /utA==
X-Forwarded-Encrypted: i=1; AL+hErGYsIhoJzfpzjCehQ5tOU2HhL/32wQ4jtFaUuMR2qI90rDZpEliNy214+l1oVV9s6w/dNsFmvswSOpp9jM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/S/XvHnV6wzZhU9rjhaZiRkoE79lynZV/xAMpP6oN4fEFwvnwQ
	5tQTXdH9kTfLBuhVeXNVv/n7IbxdAes0e9Rt3SahfZaoRkBXqQQpNfZqCFpGQwHaFMw=
X-Gm-Gg: AYBFou37NUxB8ol+KxwrTeD9aPbYhnurHU7amfeRDFJdfXADdhR19C9EeLb4PrGwwUr
	1iLwdytr6KG/qjKSk9QREaRv0QjbBKy344Sm2Tt5XdT/NzJ5QgqR0HvTlOT+4HmxIQn2p43buEx
	jw35w7P9YPa/SvjCZt7c5uLeGoNKXf60lsgFIAuqCHZWQeTPulBJxaIR34P/Nps4ZhTt4PQJf1t
	37LwtNf9KuSeohaJ4Kn8gHolHZ3YWaWFer/T5ljdHvzqX9QVmcoVsPAvlkBOcllkgFMFNP15943
	nAJb18RzScP8ckeb8eYC+Zmbd3Vky8DszqD3yN6hw4dwSKwHFyYbG5Gzoy9WoE1q/jLHOGEO0tP
	ciOIUDNuPbsBZMxbKsbsTSiPWXtMRy4Hq9r2Yftwg87k6gvrg74ycjtuJgaeTWowihBdkrda/pX
	7JJOlmlikuVPnLrKloMWPh3f5PgGR7mcgNmEs9mZiA0lxjOOHhD0LWyUGGSeXXR+APp5MDQ+GQ1
	8PX8R/QE5RhiuoyalPNSNE1kFKJIR+Q0rK1zVxBZc+pWhR9iIZesomEcJgA5ckmpcYt7RWmvXQe
	DLb2Kjx+Rhy24Xg5kqFZqoh8ZrbhTXGY2PVdZXOWGT2oznh2Y9uN3N2HWBf+FeKgLl+bXASPwsR
	0doN2tkNNrXS8VpE=
X-Received: by 2002:a05:600c:46cd:b0:4a7:a5db:a93e with SMTP id 5b1f17b1804b1-4ba0931c26emr28211945e9.4.1794388447836;
        Wed, 11 Nov 2026 01:14:07 -0800 (PST)
Received: from localhost (p200300f65f19a90460510dd506fc51af.dip0.t-ipconnect.de. [2003:f6:5f19:a904:6051:dd5:6fc:51af])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4ba08ddbe68sm75389965e9.0.2026.11.11.01.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 01:14:07 -0800 (PST)
Date: Wed, 11 Nov 2026 10:14:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] virtio-pci: Drop inclusion of
 <linux/mod_devicetable.h>
Message-ID: <avQxWzMfc2LSe5tS@monoceros>
References: <fc69191474ffd49d50d7e39b13dfe6586f4d3f75.1783354857.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6yep7a5w7zky2a3b"
Content-Disposition: inline
In-Reply-To: <fc69191474ffd49d50d7e39b13dfe6586f4d3f75.1783354857.git.u.kleine-koenig@baylibre.com>


--6yep7a5w7zky2a3b
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1] virtio-pci: Drop inclusion of
 <linux/mod_devicetable.h>
MIME-Version: 1.0

Hello,

On Mon, Jul 06, 2026 at 06:22:08PM +0200, Uwe Kleine-K=F6nig (The Capable H=
ub) wrote:
> Among the different device id structures <linux/virtio_pci_legacy.h>
> only uses struct virtio_device_id. Include <linux/device-id/virtio.h>
> instead of <linux/mod_devicetable.h> to provide that which is more
> lightweight and doesn't introduce that many dependencies.
>=20
> The users of <linux/virtio_pci_legacy.h> also don't rely on this header
> to provide the full plethora of definitions. (There are only
> drivers/vdpa/alibaba/eni_vdpa.c and drivers/virtio/virtio_pci_common.c
> using pci_device_id and these include <linux/pci.h> which is enough to
> get it.)
>=20
> Signed-off-by: Uwe Kleine-K=F6nig (The Capable Hub) <u.kleine-koenig@bayl=
ibre.com>
> ---
> Hello,
>=20
> note that <linux/device-id/virtio.h> only exists since v7.2-rc2, so make
> sure your base is new enough when applying this patch.

In case you postponed applying this patch because of that, I think it's
safe to assume that <linux/device-id/virtio.h> now exists in the
relevant tree.

The patch still applies fine to next-20261110, can you please apply it?

Best regards
Uwe

>  include/linux/virtio_pci_legacy.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/include/linux/virtio_pci_legacy.h b/include/linux/virtio_pci=
_legacy.h
> index a8dc757d0367..96a9523e985d 100644
> --- a/include/linux/virtio_pci_legacy.h
> +++ b/include/linux/virtio_pci_legacy.h
> @@ -2,7 +2,7 @@
>  #ifndef _LINUX_VIRTIO_PCI_LEGACY_H
>  #define _LINUX_VIRTIO_PCI_LEGACY_H
> =20
> -#include "linux/mod_devicetable.h"
> +#include <linux/device-id/virtio.h>
>  #include <linux/pci.h>
>  #include <linux/virtio_pci.h>
> =20
>=20
> base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
> --=20
> 2.55.0.11.g153666a7d9bb
>=20

--6yep7a5w7zky2a3b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr0MdsACgkQj4D7WH0S
/k6+8Af/fMctPCPv7wvA1pqIlIT+UTjDxO/i06yrzmiAS8yPqOtDcZjGSLjj8yha
UFdXvQnef0+gVAoqnmN3RJxuFXNdA4l0imPwwk1NxGcBxIhTo6gu1NWzk7qOLE96
PjCAn+bjQ3gIOhANvNOhXk1h/320pDX6KVfzQIaS8s1mDlwKuoMvLcpDmwEWQRoV
7S04l8gIvHysN44Ls4DMrmpSz2vfso0mTlu60gWovRVZIgALmeQnWiwihKueRcF6
KiIvOQ7tMf3q4zcl2bnr0aegR62xB9YEAbjEepCPaAPu+ZFnV1z7xRLOpPzrbuXw
PtYe4FMTRYy6uifnqplP14kU2PDAQA==
=+7ve
-----END PGP SIGNATURE-----

--6yep7a5w7zky2a3b--
