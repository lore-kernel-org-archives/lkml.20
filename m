Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.86.107.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792866105;
	b=emK59stai73z4Pf8rJycO/YuQtOH1oLM5qvsz3F09/3hL33Av35sIUukDNKX2KgDGpNz
	 FEaLWxkr3LOiGARtNJSAU5jw7jgT3b5ALOe2y3Gekpi3XcePOL0hPjgwjK0naZMuDX1Un
	 XDw1lkNPT+ac8zjqttFeZz3WlZfvgjzOIIjbHBK6gw6D/Ew6DOBoG9fApXgarfcClO4lA
	 3uTvUKGTWP2NSoBNeOGO6nEBHPH1f6vXNIMSDdJdGPJwkQbKW6/DMLto/QKuDsgZ7D/pg
	 BE3MYf1ubrTtpjvAxE+dSJq7PJRfggT32xZc/UZYd6V4Y+IGWgtTwbP0H3gEmxXeodA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792866105;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=oh6C1/O5rxMMHP4wiGW+MPKKTijulKksxlsF5+eFQm4=;
	b=0OAJGobvtKTbICwHXT4OWJ+MT3KHXfF+Ww98eAAHMtStp3f8CpUMqbAmpVAnamHqDa38
	 QTsLw4gCdxEIDoVOccyKGpJmQ8UxUFcMTkwHnDq9EUmFF7WYAVy6E0ciUqHgjJint4kgP
	 0ztjtjd43gzVGjTuA+UxXcI8ZSI1+waEIZu/+TVaMDa5jzyeXwcjT8+RjqVyD3mBGGLPI
	 LA4RFDRSgDAGkBPURdMPRSDWp5DGNF7Dzf7C8Z6Eu66ys2IKPJ25g1DM7/0y6sDFJr4UU
	 BFspnFIBKLhWiwcm+k0Fvaiqsfy5ebTIUlK9HFA51AT01BMrlQn1gqmHBOLLV31MhRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rendec.net;
	spf=pass smtp.mailfrom=rendec.net;
	dkim=pass header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=0XNQpWoH;
	arc=none smtp.remote-ip=80.86.107.70
Received: from mail.mindbit.ro (xs1.mindbit.ro [80.86.107.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 578F8606A31A
	for <linux-kernel@vger.kernel.org>; Sat, 24 Oct 2026 18:21:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 578F8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=rendec.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rendec.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rendec.net header.i=@rendec.net header.a=rsa-sha256 header.s=default header.b=0XNQpWoH
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 67538D312F;
	Sat, 24 Oct 2026 21:21:42 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 67538D312F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1792866103;
	bh=oh6C1/O5rxMMHP4wiGW+MPKKTijulKksxlsF5+eFQm4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=0XNQpWoH+Z1V7u3r5AmTmoW7IAQsVwScshRDYjQAb/vYovvkSQUcQBauCxyAodhTz
	 /Qg6U1W8kqG7iU5HPR+8xgo3My/7MttpJ6AK1U2M7F7cZSvpNKf4CMU4E1D2uLCksh
	 9LCd9yeNO7dcMLx8I/Nn1IVrJTFZSj3Ape/89S19+tXqgolCiuQ5dKIvqUdMIvaYsf
	 BWG+EE692W9stUxlzYT6hcOZTTI7IJDHtNoACxzw3jhLFYmgj3GlXeX5NvfhSui0Xu
	 2vb6T+cgoexsgzFYknBNZAugAAziIMH0xKbrmbQel2DB1TlhtOjVX3rRLGgirfbiPR
	 FUx/RMgGuN1Ig==
Message-ID: <58dc82246c85146bba0967df1177c87ede7eabb7.camel@rendec.net>
Subject: Re: [PATCH 3/4] irqchip/alpine-msi: Add missing space after comma
 in GENMASK_ULL
From: Radu Rendec <radu@rendec.net>
To: Eliav Farber <farbere@amazon.com>, Thomas Gleixner <tglx@kernel.org>, 
 Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Sat, 24 Oct 2026 14:21:41 -0400
In-Reply-To: <20260923083703.38974-4-farbere@amazon.com>
References: <20260923083703.38974-1-farbere@amazon.com>
	 <20260923083703.38974-4-farbere@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43) 
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Wed, 2026-09-23 at 08:37 +0000, Eliav Farber wrote:
> Fix the coding-style issue reported by checkpatch:
>=20
> =C2=A0 ERROR: space required after that ',' (ctx:VxV)
>=20
> No functional change.
>=20
> Signed-off-by: Eliav Farber <farbere@amazon.com>
> ---
> =C2=A0drivers/irqchip/irq-alpine-msi.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpin=
e-msi.c
> index 20f1f7f7612b..8155f63cfd29 100644
> --- a/drivers/irqchip/irq-alpine-msi.c
> +++ b/drivers/irqchip/irq-alpine-msi.c
> @@ -210,7 +210,7 @@ static int alpine_msix_init(struct device_node *node,=
 struct device_node *parent
> =C2=A0	 * To select the primary GIC as the target GIC, bits [18:17] must =
be set
> =C2=A0	 * to 0x0. In this case, bit 16 (SPI_TARGET_CLUSTER0) must be set.
> =C2=A0	 */
> -	priv->addr =3D res.start & GENMASK_ULL(63,20);
> +	priv->addr =3D res.start & GENMASK_ULL(63, 20);
> =C2=A0	priv->addr |=3D ALPINE_MSIX_SPI_TARGET_CLUSTER0;
> =C2=A0
> =C2=A0	if (of_property_read_u32(node, "al,msi-base-spi", &priv->spi_first=
)) {

Reviewed-by: Radu Rendec <radu@rendec.net>
