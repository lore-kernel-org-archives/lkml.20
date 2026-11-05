Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793886869;
	b=WDMK/mCSP1qe0wDyp+e+BNIUcoMC3NgRvdogSc28mTAy4UlgioQfQzt9+D6ykod5o+gk
	 XH+4xHbggIlFzYXJIuf0KnecyMbQJWG7QcRYG5I1cpJcSNMzRmrOuTnHAbdWwQFGyaPyG
	 NS2QUyYUTudU06yZUAxvRdYROvwkJA5qisr+flWle3K/J9Ftjm20Bc+mdATt3fa0kp32v
	 nsMI6gLyHngknvZImwSGfSuwOKtNNvDRDh3sSgDvoDx4Y4lut9MLAvdgDt4jE0s8MqcPg
	 Z80lhR/NByXuxkYGk1eFWo4iuWivmfFCQkPe5sjpJ7/BKPPzK4QiheLslbCFAnj+w1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793886869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Y8DD57fC2j6CrK2mpR2Wjue08rOsdhPmsgCv5F0bk5M=;
	b=ahPxhm4JZ3IbSPVQJe1MSvnvoxOiNJGodzRywn1EHpTAp/aOYNJsaHZYKAYUynI0cVe2
	 dTjykNi+DE+Ll/8zyngab0fHInC5kWWu5aUf4Jf5sJSGa64ZFHi60bFqVKXduKn6m9F5D
	 iHA2yHrj/iF0RI/Q5BtJ5SJ9NFsxFOwBkSy3ZwNUH6oQtOa/N5d+/YLblf8i0xuzTen0c
	 JbVNeRUPJLBvh3Oyxr0QKHxDRlWxusVH7ZgkDWQBw442azIM/JCfqv5IsoYxBazCaRBRk
	 1+4oQjjOsChAWVEDTS3HA31QIuBuhOexy9bylQQ0UEdZQJLmC/QIwl+yHnDnmU1ofaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KYGRv6ef;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8A3606A328
	for <linux-kernel@vger.kernel.org>; Thu,  5 Nov 2026 13:54:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C8A3606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=KYGRv6ef
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so15983515e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 05 Nov 2026 05:54:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793886866; x=1794491666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y8DD57fC2j6CrK2mpR2Wjue08rOsdhPmsgCv5F0bk5M=;
        b=KYGRv6efmo5SCAkP2Ws2kAUCj6ljMDSd6DrEYj21Q4na8uQbaaai6wLHApo0qEzEP+
         4HjDyzIjfIDuO6lXcDT5D6YYFa1rnsOwlO8cmH0ijbutCiHYqDNVPbU//9m15cwIuK+P
         l8qiEtKsKsfAAETztJ+AQovUklB9tmUzNzpX1vUu4wWwPjVq/x6skzJdC4N1aUV6enOW
         PsA0OOGJhqyjx9sl6TVcKLWMWsKTUzccaskDUqQ1t1LgdLZ18KvtBWgV1bkHxG3PUv2q
         Nbd0cFUg2MxhHIEZ/8C/9aXbJNrbunGz8dPlbeKcP4esVFMChp72s51XggfAbzOGeH2O
         /KOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793886866; x=1794491666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8DD57fC2j6CrK2mpR2Wjue08rOsdhPmsgCv5F0bk5M=;
        b=UyeCd5icIEjvzz7D0fmdXKV1O9tkWOsMYc9mQTODCpb6C1ARfElmornoXQckvuMF3/
         +oM6ic54lMP8STqA0gFROUqD1rrJTXE6LK6sP3epAUGpfHnO8Mcgvf7SslTd3MymMpTN
         XeAwFRGWMlMm/nzM4+CcisJg22H9D6R9IxGa664KNt6BHOV+upQ0Q6FETj6bvP2Qu9eK
         6AXMgoBLNYNDP35ZTQyQqh692kYwxID0wFdxM5n5rSHjcS295suMSp2NUMQ0XMlXZgT1
         8bTveqCMUJdJuCLHp1MrxJYF3Z8tQmzRS8OvemEmjy+FHXdj3Z/iX23i+atif2UlxTZW
         C1fw==
X-Forwarded-Encrypted: i=1; AKwUvBwweVTEKQTRavX9SPQ0BmcIDaiSnWduk1yBoSRUw8iNf33/jY62YAd/3qRLy/GwPzLjvmzgctT139C6Vl4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+rILA2w2nnFn+zRzFVRsnTjlFMDpKxjLGjEdl4O/qicz0lZXP/
	0+8FTL+6M1ZaFrEwNPaGjxk+lToUpuupy9NZS7EVTqO9+THd0pKn2UD0ubcMFscs35k=
X-Gm-Gg: AYBFou3FDV6wwLYpfVZBs1xGsdT661xbxSNiBnBXCNbAET16PYcVaxpxnwokVexBwVU
	72Mp6QDOope5oJMmDuCPTw7/iC8h7/+G8bzeSFX/YmuMCBEFev7Y+DffLMTWxQ1ZzVpGJ96Z9Zk
	d+7IMffrRzR1y5AQ6AL9jPX0WYp5csNNcxaFpTW9ZQuklhxiwAvrSRoFF2rJXimifoClI4FTcnK
	05oYVWrL1S8LHoxsOQ8YVw1QxQvxSoBMFojQfBAmUI4XuBhd/d+0gemLthZhyZapL4NPxVVds2S
	seeA9deHqcTb/UMOVK5YSlULNyGzSjxfoV3o73adNm63sBIivQNcaZWNiFHeYecWp9KFE6jPjyo
	Uah8/H8K5uymqzJwF05EvvH+TQY1XHhWSYhre7kmHoU1JBmLyD5/mtJY6nY4BqS/h9sJfStwAyX
	7LPjsjDGzIEfkHJtXgSxzMC8GZBCFnzjdKnvsaPefJfX8qQGyl1t+ewGIA5rudD73Vie8V3nUE5
	rq4EZvcSrQ2P9Z2TOs1oBGFVqpcZN+uTWYZ8VY7OLi9FHxCcK8arCFd0lkyaOzPaNRw1FPHB0p5
	VOzKq4Pq33EAxbJfDtNkOamnxAw=
X-Received: by 2002:a05:600c:4f8b:b0:4a3:5d64:df91 with SMTP id 5b1f17b1804b1-4ac17ffaf95mr426570585e9.18.1793886866545;
        Thu, 05 Nov 2026 05:54:26 -0800 (PST)
Received: from localhost ([194.213.108.7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56f0237aesm70297105e9.9.2026.11.05.05.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 05:54:25 -0800 (PST)
Date: Thu, 5 Nov 2026 14:54:17 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Doug Ledford <doug.ledford@hpe.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Slingshot Open Source Team <slingshot-os-team@groups.ext.hpe.com>, linux-rdma@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Iraimani P <iraimani.pavadai@hpe.com>, Mamila Santosh <santosh-kumar.mamila@hpe.com>
Subject: Re: [PATCH 04/11] RDMA/cxi: add the native ABI and resource
 definitions
Message-ID: <auyIsEVLUBT4i12F@monoceros>
References: <20261030-cxi-for-next-v1-0-bc6e49e07037@hpe.com>
 <20261030-cxi-for-next-v1-4-bc6e49e07037@hpe.com>
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
	protocol="application/pgp-signature"; boundary="a4rnyelrw54cnpdq"
Content-Disposition: inline
In-Reply-To: <20261030-cxi-for-next-v1-4-bc6e49e07037@hpe.com>


--a4rnyelrw54cnpdq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/11] RDMA/cxi: add the native ABI and resource
 definitions
MIME-Version: 1.0

On Fri, Oct 30, 2026 at 09:35:32PM -0700, Doug Ledford wrote:
> +#include <linux/mod_devicetable.h>

Please drop this include. Even if there was a usage of a *_device_id
this would be wrong.

> [...]
> +struct cxiverbs_lni *cxiverbs_lni_get(struct cxiverbs_ucontext *ctx,
> +				    u32 handle);

unusual indention, please align the continuation line to the opening (.

I would expect that this declaration is added in the same commit as the
actual function.

> +void cxiverbs_lni_put(struct cxiverbs_lni *lni);
> +
> +/* ---------------------------------------------------------------------=
--
> + * Protection domain (ib_pd)  =E2=86=92  shared JobID-anchored LNI + RGI=
D (isolation)
> + *
> + * PD no longer owns its own LNI; instead it references the JobID-anchor=
ed LNI
> + * from the ucontext. The PD can optionally express a preferred_svc_id f=
or QPs;
> + * if not set, QPs can select any service at creation.
> + * ---------------------------------------------------------------------=
--
> + */
> +struct cxiverbs_pd {
> +	struct ib_pd    ibpd;
> +	struct cxiverbs_lni *lni_ref;
> +	struct xarray qpns;
> +
> +	u32             job_id;		/* cached from ucontext->job_id */
> +	u32             preferred_svc_id;	/* optional service preference (0 =3D=
 any) */
> +
> +	u32             rgid;			/* RGID for resource isolation */
> +	u32             pd_id;			/* RGID-based PD identifier */
> +	u32             default_pidonfep;
> +	u32             pidonfep;
> +	u32             qpn_addr_mode;
> +	bool            default_pidonfep_valid;
> +	bool            pidonfep_valid;
> +	struct mutex     resource_lock;
> +};

Please make the alignment here consistent. Either align all members or
none, but not this mixture. My preference would be a single space
because these alignments tend to get annoying when they are kept during
future changes or diverge even more. Same for a few further struct
definitions further down this file.

Best regards
Uwe

--a4rnyelrw54cnpdq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrsioYACgkQj4D7WH0S
/k4+FAf+PsChnDyjO+yWLbN1ez4nNv7S+z5I7eoSvvWJ+KNWzI6ASwfI9LEG9yvy
qlKZGTAjoCnr6Llb4wefzul8a/JXQ6LZeJbZIfpH96B7B5ftDTdLGJ56s0Cw2M9r
uilNr+VB1D31Wmn2uUisNu8qnpw/7IltLdwmisE93fgY0j9mJLA84nqdxV/empbo
VXgpEVUcpWqI8PGOmU+eTcygZW/iST4HJSmJNIPdalkw/iHmle15JPR0HFhV3nCU
1FVPDqn/mY5BdiUR00I5m8zzJ8GY02zkf0+J/Cf44KtAqPOp3TYMtM3cKMUmDVoM
Xfd9Nw78oH/4go0ZSoH554RsNB4fKQ==
=2n5D
-----END PGP SIGNATURE-----

--a4rnyelrw54cnpdq--
